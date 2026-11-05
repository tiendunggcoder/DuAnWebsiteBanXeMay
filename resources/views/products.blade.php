@extends('layouts.app')

@section('content')

<style>
/* Custom CSS for Products Page */
.page-header h1 {
    font-weight: 700;
    margin-bottom: 0.5rem;
}
.page-header p {
    color: #6c757d;
}
.filter-container {
    margin: 2rem 0;
    display: flex;
    flex-wrap: wrap;
    gap: 1rem;
    align-items: center;
}
.filter-header {
    font-weight: bold;
    margin-right: 1rem;
}
.filter-buttons {
    display: flex;
    gap: 0.5rem;
    flex-wrap: wrap;
}
.filter-btn {
    border: 1px solid #ddd;
    background: transparent;
    padding: 0.5rem 1.5rem;
    border-radius: 50px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
}
.filter-btn.active, .filter-btn:hover {
    background: #cc0000;
    color: white;
    border-color: #cc0000;
}
.product-grid-v2 {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
    gap: 2rem;
    margin-bottom: 3rem;
}
.product-item-card {
    background: white;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 4px 15px rgba(0,0,0,0.05);
    transition: transform 0.3s ease;
}
.product-item-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 25px rgba(0,0,0,0.1);
}
.card-img-wrapper {
    position: relative;
    height: 220px;
    overflow: hidden;
    background: #f8f9fa;
}
.card-img-wrapper img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
.card-img-wrapper .badge {
    position: absolute;
    top: 10px;
    padding: 6px 12px;
    border-radius: 50px;
    font-size: 0.8rem;
    font-weight: bold;
}
.badge-left {
    left: 10px;
    background: #cc0000;
    color: white;
}
.badge-right {
    right: 10px;
    background: white;
    color: #333;
    border: 1px solid #ddd;
}
.card-info {
    padding: 1.5rem;
}
.card-info h3 {
    font-size: 1.25rem;
    font-weight: bold;
    margin-bottom: 0.5rem;
}
.card-info .desc {
    color: #6c757d;
    font-size: 0.9rem;
    margin-bottom: 1rem;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
}
.colors {
    display: flex;
    align-items: center;
    gap: 0.5rem;
    margin-bottom: 1.5rem;
}
.color-circle {
    width: 20px;
    height: 20px;
    border-radius: 50%;
}
.price-action {
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-top: 1px solid #eee;
    padding-top: 1rem;
}
.price-label {
    display: block;
    font-size: 0.8rem;
    color: #6c757d;
}
.price-value {
    font-weight: bold;
    color: #cc0000;
    font-size: 1.1rem;
}
.btn-arrow-red {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 40px;
    height: 40px;
    background: #fff;
    color: #cc0000;
    border: 2px solid #cc0000;
    border-radius: 50%;
    transition: all 0.3s;
}
.btn-arrow-red:hover {
    background: #cc0000;
    color: white;
}
.search-container {
    margin: 1rem 0 2rem;
    position: relative;
    max-width: 400px;
}
.search-input {
    width: 100%;
    padding: 0.75rem 1.5rem 0.75rem 3rem;
    border-radius: 50px;
    border: 1px solid #ddd;
    outline: none;
    font-size: 1rem;
    transition: all 0.3s ease;
}
.search-input:focus {
    border-color: #cc0000;
    box-shadow: 0 0 8px rgba(204, 0, 0, 0.2);
}
.search-icon {
    position: absolute;
    left: 1.2rem;
    top: 50%;
    transform: translateY(-50%);
    color: #888;
}
</style>

<div class="products-page container my-4">
    <div class="page-header">
        <h1>Danh Mục Xe Máy</h1>
        <p>Tìm kiếm mẫu xe ưng ý nhất từ bộ sưu tập của chúng tôi</p>
    </div>

    <div class="filter-container">
        <div class="filter-header">
            <i class="fa-solid fa-filter"></i> Lọc theo danh mục
        </div>
        <div class="filter-buttons" id="filter-buttons">
            <button class="filter-btn active" data-filter="all">Tất cả</button>
            <button class="filter-btn" data-filter="Xe tay ga">Xe tay ga</button>
            <button class="filter-btn" data-filter="Xe số">Xe số</button>
            <button class="filter-btn" data-filter="Xe côn tay">Xe côn tay</button>
            <button class="filter-btn" data-filter="Xe phân khối lớn">Xe phân khối lớn</button>
        </div>
    </div>

    <div class="search-container" style="position: relative;">
        <i class="fa-solid fa-magnifying-glass search-icon"></i>
        <input type="text" id="searchInput" class="search-input" style="padding-right: 210px;" placeholder="Nhập tên xe để tìm kiếm tức thì..." autocomplete="off">
        
        <!-- Nút Tìm kiếm bằng hình ảnh nằm ngay bên phải ô tìm kiếm -->
        <button type="button" class="btn btn-danger rounded-pill px-3 py-1 shadow-sm d-inline-flex align-items-center gap-2" 
                style="position: absolute; right: 8px; top: 50%; transform: translateY(-50%); background-color: #cc0000; font-size: 0.9rem; z-index: 5;" 
                data-bs-toggle="modal" data-bs-target="#imageSearchModal">
            <i class="fa-solid fa-camera"></i> Tìm bằng hình ảnh
        </button>
    </div>

    <!-- Modal Tìm kiếm bằng hình ảnh AI -->
    <div class="modal fade" id="imageSearchModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content border-0 shadow-lg rounded-4">
                <div class="modal-header text-white" style="background-color: #cc0000;">
                    <h5 class="modal-title fw-bold">
                        <i class="fa-solid fa-camera-retro me-2"></i>Tìm kiếm xe máy bằng hình ảnh (YOLOv26)
                    </h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body p-4">
                    <div class="text-center mb-3">
                        <label class="form-label fw-bold text-secondary">Tải lên hình ảnh mẫu xe bạn muốn tìm:</label>
                        <input type="file" id="ai-image-input" accept="image/*" class="form-control mb-3">
                        <img id="ai-image-preview" src="" class="img-fluid rounded-3 shadow-sm d-none mx-auto" style="max-height: 220px;">
                    </div>
                    <div class="d-grid">
                        <button type="button" id="ai-search-btn" class="btn text-white fw-bold py-2 rounded-pill" style="background-color: #cc0000;">
                            <i class="fa-solid fa-magnifying-glass me-1"></i> Phân tích hình ảnh & Tra cứu xe
                        </button>
                    </div>
                    <!-- Khu vực hiển thị kết quả -->
                    <div id="ai-search-result" class="mt-4"></div>
                </div>
            </div>
        </div>
    </div>

    <script>
    document.addEventListener("DOMContentLoaded", function() {
        const imgInput = document.getElementById('ai-image-input');
        const imgPreview = document.getElementById('ai-image-preview');
        const searchBtn = document.getElementById('ai-search-btn');
        const resultBox = document.getElementById('ai-search-result');

        // Hiển thị ảnh xem trước khi chọn file
        imgInput.addEventListener('change', function() {
            const file = this.files[0];
            if (file) {
                imgPreview.src = URL.createObjectURL(file);
                imgPreview.classList.remove('d-none');
                resultBox.innerHTML = '';
            }
        });

        // Gửi ảnh lên Backend Laravel -> gọi sang FastAPI cổng 8001
        searchBtn.addEventListener('click', async function() {
            const file = imgInput.files[0];
            if (!file) {
                alert("Vui lòng chọn một bức ảnh xe máy trước khi tìm kiếm!");
                return;
            }

            let formData = new FormData();
            formData.append('image', file);

            resultBox.innerHTML = `<div class="text-center text-muted py-3"><i class="fa-solid fa-spinner fa-spin me-2"></i>Hệ thống AI đang nhận diện mẫu xe và đối chiếu CSDL...</div>`;

            try {
                const response = await fetch("{{ route('products.searchByImage') }}", {
                    method: 'POST',
                    headers: {
                        'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
                    },
                    body: formData
                });

                const data = await response.json();

                if (!data.success) {
                    resultBox.innerHTML = `<div class="alert alert-warning mb-0">${data.message}</div>`;
                    return;
                }

                let html = `
                    <div class="alert alert-success d-flex justify-content-between align-items-center">
                        <span><strong>Mẫu xe nhận diện:</strong> Honda ${data.detected_class}</span>
                        <span class="badge bg-success">Độ tin cậy: ${data.confidence}%</span>
                    </div>
                `;

                if (data.products && data.products.length > 0) {
                    html += `<div class="row g-3">`;
                    data.products.forEach(p => {
                        let price = new Intl.NumberFormat('vi-VN').format(p.price) + ' VNĐ';
                        let stockBadge = p.stock > 0 
                            ? `<span class="badge bg-primary">Còn ${p.stock} chiếc</span>` 
                            : `<span class="badge bg-secondary">Tạm hết hàng</span>`;
                        
                        html += `
                            <div class="col-md-6">
                                <div class="card h-100 shadow-sm border-0 bg-light">
                                    <div class="card-body">
                                        <h6 class="fw-bold text-dark mb-1">${p.name}</h6>
                                        <p class="text-danger fw-bold mb-2">${price}</p>
                                        <div class="d-flex justify-content-between align-items-center">
                                            ${stockBadge}
                                            <a href="/products/${p.id}" class="btn btn-sm btn-danger rounded-pill px-3" style="background-color: #cc0000;">Xem chi tiết</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        `;
                    });
                    html += `</div>`;
                } else {
                    html += `<div class="alert alert-info mb-0">Đã nhận diện dòng xe <b>${data.detected_class}</b> nhưng hiện chưa có sản phẩm khớp trong CSDL.</div>`;
                }

                resultBox.innerHTML = html;
            } catch (err) {
                resultBox.innerHTML = `<div class="alert alert-danger mb-0">Lỗi kết nối tới máy chủ xử lý ảnh.</div>`;
            }
        });
    });
    </script>
    <!-- Khung chọn sắp xếp giá bằng JS -->
    <div class="sort-container my-3" style="margin: 15px 0; display: flex; align-items: center; gap: 8px;"> 
        <label for="sortPriceSelect" style="font-weight: 600;">Sắp xếp theo giá:</label>
        <select id="sortPriceSelect" style="padding: 6px 12px; border: 1px solid #ccc; border-radius: 6px; background-color: #fff;">
          <option value="default">Mặc định</option>
          <option value="asc">Giá: Thấp đến Cao</option>
          <option value="desc">Giá: Cao xuống Thấp</option>
        </select>
    </div>

    <div class="product-grid-v2" id="product-list">

        @foreach($products as $product)
        <div class="product-item-card product-item" data-category="{{ $product->category }}">
            <div class="card-img-wrapper">
                <span class="badge badge-left">{{ $product->category }}</span>
                <span class="badge badge-right">{{ $product->year }}</span>
                <img src="{{ $product->image }}" alt="{{ $product->name }}">
            </div>
            <div class="card-info">
                <h3>{{ $product->name }}</h3>
                <p class="desc">{{ $product->description }}</p>
                <div class="colors">
                <span>Màu sắc:</span>
                @php
                    $colorsList = is_string($product->colors) ? json_decode($product->colors, true) : $product->colors;
                @endphp

                @if(is_array($colorsList))
                    @foreach($colorsList as $colorItem)
                        @php
                            $hexValue = is_array($colorItem) ? ($colorItem['hex'] ?? '#000') : $colorItem;
                        @endphp
                        <div class="color-circle" @style(['background-color: ' . $hexValue, 'border: 1px solid #ddd' => $hexValue == '#ffffff'])></div>
                    @endforeach
                @endif
            </div>
                <div class="price-action">
                    <div class="price-details">
                        <span class="price-label">Giá từ</span>
                        <span class="price-value">{{ number_format($product->price, 0, ',', '.') }} VNĐ</span>
                    </div>
                    <a href="{{ route('products.show', $product->id) }}" class="btn-arrow-red">
                        <i class="fa-solid fa-arrow-right"></i>
                    </a>
                </div>
            </div>
        </div>
        @endforeach

    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const filterBtns = document.querySelectorAll('.filter-btn');
        const productItems = document.querySelectorAll('.product-item');
        const searchInput = document.getElementById('searchInput');
        let currentFilter = 'all';

        function filterProducts() {
            const searchTerm = searchInput.value.toLowerCase().trim();

            productItems.forEach(item => {
                const itemCategory = item.getAttribute('data-category');
                const itemName = item.querySelector('.card-info h3').textContent.toLowerCase();

                const matchesCategory = (currentFilter === 'all' || currentFilter === itemCategory);
                const matchesSearch = itemName.includes(searchTerm);

                if (matchesCategory && matchesSearch) {
                    item.style.display = 'block';
                } else {
                    item.style.display = 'none';
                }
            });
        }

        filterBtns.forEach(btn => {
            btn.addEventListener('click', function() {
                // Xóa class active của tất cả nút và thêm vào nút đang bấm
                document.querySelector('.filter-btn.active').classList.remove('active');
                this.classList.add('active');

                // Lấy giá trị data-filter của nút
                currentFilter = this.getAttribute('data-filter');
                filterProducts();
            });
        });

        // Lắng nghe sự kiện gõ phím vào ô tìm kiếm
        searchInput.addEventListener('input', filterProducts);
    // Xử lý sắp xếp theo giá tiền không reload trang
        const sortSelect = document.getElementById('sortPriceSelect');
        const productList = document.getElementById('product-list');

        if (sortSelect && productList) {
            const originalCards = Array.from(productList.children);

            sortSelect.addEventListener('change', function () {
                const order = this.value;

                if (order === 'default') {
                    originalCards.forEach(card => productList.appendChild(card));
                    filterProducts();
                    return;
                }

                const cards = Array.from(productList.children);

                cards.sort((a, b) => {
                    const priceElA = a.querySelector('.price-value');
                    const priceElB = b.querySelector('.price-value');

                    const priceA = priceElA ? parseFloat(priceElA.innerText.replace(/[^0-9]/g, '')) || 0 : 0;
                    const priceB = priceElB ? parseFloat(priceElB.innerText.replace(/[^0-9]/g, '')) || 0 : 0;

                    return order === 'asc' ? priceA - priceB : priceB - priceA;
                });

                cards.forEach(card => productList.appendChild(card));
                filterProducts();
            });
        }
    });
</script>
@endsection