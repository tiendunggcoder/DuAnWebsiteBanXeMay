@extends('layouts.app')

@section('content')
<div class="container py-5">
    <nav aria-label="breadcrumb" class="mb-4">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="/" class="text-decoration-none text-dark">Trang chủ</a></li>
            <li class="breadcrumb-item"><a href="/products" class="text-decoration-none text-dark">Sản phẩm</a></li>
            <li class="breadcrumb-item active text-honda-red fw-bold" aria-current="page">{{ $product->name }}</li>
        </ol>
    </nav>

    <div class="row g-5">
        <div class="col-md-6">
            @php
                $colorsData = is_string($product->colors) ? json_decode($product->colors, true) : $product->colors;
                $colorSlides = [];
                if (is_array($colorsData) && count($colorsData) > 0) {
                    foreach ($colorsData as $idx => $cItem) {
                        $colorSlides[] = [
                            'image' => is_array($cItem) && !empty($cItem['image']) ? $cItem['image'] : $product->image,
                            'hex'   => is_array($cItem) ? ($cItem['hex'] ?? '#000') : $cItem,
                            'name'  => is_array($cItem) ? ($cItem['name'] ?? '') : '',
                            'index' => $idx
                        ];
                    }
                } else {
                    $colorSlides[] = ['image' => $product->image, 'hex' => '#000', 'name' => 'Tiêu chuẩn', 'index' => 0];
                }
            @endphp

            <div id="productCarousel" class="carousel slide card border-0 shadow-sm rounded-4 overflow-hidden" data-bs-ride="false">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img id="mainProductImage" src="{{ $colorSlides[0]['image'] }}" class="d-block w-100 object-fit-cover" style="height: 450px; background-color: #f8f9fa; transition: filter 0.3s ease;" alt="{{ $product->name }}">
                    </div>
                </div>
            </div>

            <!-- Danh sách ảnh thu nhỏ (Thumbnails) tương ứng với từng màu của xe -->
            <div class="d-flex gap-2 mt-3 overflow-auto" style="white-space: nowrap; padding-bottom: 5px;">
                @foreach($colorSlides as $slide)
                    @php
                        // Tạo bộ lọc màu tương ứng cho từng ảnh thumbnail
                        $thumbFilter = 'none';
                        if ($slide['index'] > 0 && str_contains($slide['image'], '?color=')) {
                            $h = $slide['hex'];
                            if (in_array($h, ['#000000', '#212529', '#343a40'])) $thumbFilter = 'grayscale(100%) brightness(75%) contrast(120%)';
                            elseif (in_array($h, ['#ffffff', '#f8f9fa', '#e9ecef'])) $thumbFilter = 'grayscale(100%) brightness(115%) contrast(95%)';
                            elseif (in_array($h, ['#6c757d', '#adb5bd', '#495057', '#ced4da'])) $thumbFilter = 'grayscale(90%) contrast(105%)';
                            elseif (in_array($h, ['#0d6efd', '#0056b3', '#0dcaf0'])) $thumbFilter = 'hue-rotate(210deg) saturate(120%)';
                            elseif (in_array($h, ['#556b2f', '#20c997'])) $thumbFilter = 'hue-rotate(110deg) saturate(90%)';
                            elseif (in_array($h, ['#5c4033', '#ffc107'])) $thumbFilter = 'hue-rotate(35deg) saturate(110%)';
                        }
                    @endphp
                    <div class="text-center" style="cursor: pointer;" onclick="selectColorByIndex({{ $slide['index'] }})">
                        <img src="{{ $slide['image'] }}"
                             id="thumb-{{ $slide['index'] }}"
                             class="img-thumbnail rounded-3 {{ $slide['index'] == 0 ? 'border-danger border-2' : '' }} thumbnail-nav"
                             style="width: 85px; height: 65px; object-fit: cover; filter: {{ $thumbFilter }};"
                             title="{{ $slide['name'] }}">
                        <div class="small text-secondary mt-1" style="font-size: 11px;">{{ $slide['name'] }}</div>
                    </div>
                @endforeach
            </div>
        </div>

        <div class="col-md-6">
            <span class="badge honda-red text-white px-3 py-2 rounded-pill mb-2">{{ $product->category }}</span>
            <h1 class="display-5 fw-bold mb-3">{{ $product->name }}</h1>
            
            <div class="d-flex align-items-center mb-4">
                <h2 class="text-honda-red fw-bold mb-0">{{ number_format($product->price, 0, ',', '.') }} VNĐ</h2>
                <span class="ms-3 text-secondary text-decoration-line-through">Giá đề xuất</span>
            </div>

            <div class="mb-3">
                <p class="mb-0 fs-5">
                    <span class="fw-bold me-2">Tình trạng:</span> 
                    @if($product->stock > 0)
                        <span class="text-success fw-bold"><i class="fa-solid fa-circle-check"></i> Còn hàng ({{ $product->stock }} chiếc)</span>
                    @else
                        <span class="text-danger fw-bold"><i class="fa-solid fa-circle-xmark"></i> Hết hàng</span>
                    @endif
                </p>
            </div>

            <div class="mb-4">
                <h5 class="fw-bold">Mô tả sản phẩm:</h5>
                <p class="text-secondary leading-relaxed">
                    {{ $product->description }}
                </p>
            </div>

            <div class="mb-4">
    <h5 class="fw-bold">Màu sắc sẵn có: <span id="selectedColorName" class="text-danger fw-normal fs-6 ms-1"></span></h5>
    <div class="d-flex gap-2 mt-2">
        @php
            $colorsList = is_string($product->colors) ? json_decode($product->colors, true) : $product->colors;
        @endphp

        @if(is_array($colorsList))
            @foreach($colorsList as $index => $colorItem)
                @php
                    $hexValue = is_array($colorItem) ? ($colorItem['hex'] ?? '#000') : $colorItem;
                    $colorName = is_array($colorItem) ? ($colorItem['name'] ?? '') : '';
                    $colorImage = is_array($colorItem) && !empty($colorItem['image']) ? $colorItem['image'] : $product->image;
                @endphp
                <div class="rounded-circle border color-option {{ $index === 0 ? 'border-danger border-3' : '' }}" 
                     title="{{ $colorName }}"
                     data-name="{{ $colorName }}"
                     data-hex="{{ $hexValue }}"
                     data-image="{{ $colorImage }}"
                     data-index="{{ $index }}"
                     onclick="changeVehicleColor(this)"
                     style="width: 32px; height: 32px; background-color: {{ $hexValue }}; cursor: pointer; transition: transform 0.2s;">
                </div>
            @endforeach
        @endif
    </div>
</div>
                </div>
            </div>

            <div class="d-grid gap-2 d-md-flex mt-5">
                <a href="{{ route('contact.index') }}" class="btn btn-dark btn-lg px-5 py-3 rounded-pill fw-bold shadow-sm">
                    <i class="fa-solid fa-calendar-check me-2"></i> ĐĂNG KÝ LÁI THỬ
                </a>
                @if($product->stock > 0)
                <form action="{{ route('cart.add', $product->id) }}" method="POST" class="m-0">
                    @csrf
                    <button type="submit" class="btn btn-outline-danger btn-lg px-4 py-3 rounded-pill fw-bold border-2 w-100">
                        <i class="fa-solid fa-cart-plus me-2"></i> MUA HÀNG
                    </button>
                </form>
                @else
                <button type="button" class="btn btn-secondary btn-lg px-4 py-3 rounded-pill fw-bold border-2 m-0" disabled>
                    <i class="fa-solid fa-ban me-2"></i> TẠM HẾT HÀNG
                </button>
                @endif
            </div>

            <div class="mt-4 p-3 bg-white border rounded-3 d-flex align-items-center">
                <i class="fa-solid fa-shield-halved text-success fs-3 me-3"></i>
                <div>
                    <span class="d-block fw-bold">Bảo hành chính hãng</span>
                    <small class="text-secondary">3 năm hoặc 30.000km tùy điều kiện nào đến trước</small>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
function changeVehicleColor(element) {
    const index = parseInt(element.getAttribute('data-index'));

    // 1. Cập nhật viền nổi bật cho nút tròn màu sắc đang chọn
    document.querySelectorAll('.color-option').forEach(el => {
        el.classList.remove('border-danger', 'border-3');
    });
    element.classList.add('border-danger', 'border-3');

    // 2. Cập nhật tên màu bên cạnh tiêu đề "Màu sắc sẵn có:"
    const colorName = element.getAttribute('data-name');
    const nameDisplay = document.getElementById('selectedColorName');
    if (nameDisplay && colorName) {
        nameDisplay.textContent = '(' + colorName + ')';
    }

    // 3. Đồng bộ viền đỏ cho ô ảnh nhỏ (Thumbnail) tương ứng ở bên dưới
    document.querySelectorAll('.thumbnail-nav').forEach((thumb, idx) => {
        if (idx === index) {
            thumb.classList.add('border-danger', 'border-2');
        } else {
            thumb.classList.remove('border-danger', 'border-2');
        }
    });

    // 4. Đổi hình ảnh và bộ lọc màu của ảnh lớn giống hệt với ảnh nhỏ bên dưới
    const mainImg = document.getElementById('mainProductImage') || document.querySelector('#productCarousel .carousel-item.active img');
    const targetThumb = document.getElementById('thumb-' + index);

    if (mainImg) {
        if (targetThumb) {
            // Lấy trực tiếp ảnh và hiệu ứng màu từ thumbnail bên dưới truyền lên ảnh lớn
            mainImg.src = targetThumb.src;
            mainImg.style.filter = targetThumb.style.filter;
        } else {
            // Dự phòng nếu không tìm thấy thumbnail
            const newImage = element.getAttribute('data-image');
            const hexColor = element.getAttribute('data-hex');
            mainImg.src = newImage;

            if (index > 0 && newImage.includes('?color=')) {
                if (['#000000', '#212529', '#343a40'].includes(hexColor)) {
                    mainImg.style.filter = 'grayscale(100%) brightness(75%) contrast(120%)';
                } else if (['#ffffff', '#f8f9fa', '#e9ecef'].includes(hexColor)) {
                    mainImg.style.filter = 'grayscale(100%) brightness(115%) contrast(95%)';
                } else if (['#6c757d', '#adb5bd', '#495057', '#ced4da'].includes(hexColor)) {
                    mainImg.style.filter = 'grayscale(90%) contrast(105%)';
                } else if (['#0d6efd', '#0056b3', '#0dcaf0'].includes(hexColor)) {
                    mainImg.style.filter = 'hue-rotate(210deg) saturate(120%)';
                } else if (['#556b2f', '#20c997'].includes(hexColor)) {
                    mainImg.style.filter = 'hue-rotate(110deg) saturate(90%)';
                } else if (['#5c4033', '#ffc107'].includes(hexColor)) {
                    mainImg.style.filter = 'hue-rotate(35deg) saturate(110%)';
                } else {
                    mainImg.style.filter = 'none';
                }
            } else {
                mainImg.style.filter = 'none';
            }
        }
    }
}

function selectColorByIndex(index) {
    const colorBtns = document.querySelectorAll('.color-option');
    if (colorBtns[index]) {
        changeVehicleColor(colorBtns[index]);
    }
}

document.addEventListener('DOMContentLoaded', function () {
    // Tự động kích hoạt màu đầu tiên khi vừa tải trang
    const firstColor = document.querySelector('.color-option');
    if (firstColor) {
        changeVehicleColor(firstColor);
    }
});
</script>
@endsection