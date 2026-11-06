@extends('layouts.app')

@section('content')
<div class="container py-5">
    <div class="text-center mb-5 mt-4">
        <h1 class="fw-bold display-4" style="color: #0B1629;">Liên Hệ Với Chúng Tôi</h1>
        <p class="text-secondary fs-5 mt-3">Kết nối với Honda Showroom Hà Nội. Chúng tôi luôn sẵn sàng hỗ trợ bạn!</p>
    </div>

    <div class="row g-5">
        <div class="col-lg-4">
            <a href="tel:1800123456" class="text-decoration-none text-dark">
                <div class="card border-0 shadow-sm p-4 rounded-4 mb-4 hover-shadow transition">
                    <div class="d-flex align-items-center">
                        <div class="honda-red text-white rounded-3 p-3 me-3 fs-4"><i class="fa-solid fa-phone"></i></div>
                        <div>
                            <h5 class="fw-bold mb-1">Điện thoại</h5>
                            <p class="text-secondary small mb-1">Gọi cho chúng tôi 24/7</p>
                            <h6 class="text-honda-red fw-bold mb-0">1800-123-456</h6>
                        </div>
                    </div>
                </div>
            </a>

            <a href="mailto:support.hanoi@honda.com.vn" class="text-decoration-none text-dark">
                <div class="card border-0 shadow-sm p-4 rounded-4 mb-4 hover-shadow transition">
                    <div class="d-flex align-items-center">
                        <div class="honda-red text-white rounded-3 p-3 me-3 fs-4"><i class="fa-solid fa-envelope"></i></div>
                        <div>
                            <h5 class="fw-bold mb-1">Email</h5>
                            <p class="text-secondary small mb-1">Gửi phản hồi bất cứ lúc nào</p>
                            <h6 class="text-honda-red fw-bold mb-0">support.hanoi@honda.com.vn</h6>
                        </div>
                    </div>
                </div>
            </a>

            <a href="https://maps.google.com/?q=198+Tran+Quang+Khai+Ha+Noi" target="_blank" class="text-decoration-none text-dark">
                <div class="card border-0 shadow-sm p-4 rounded-4 mb-4 hover-shadow transition">
                    <div class="d-flex align-items-center">
                        <div class="honda-red text-white rounded-3 p-3 me-3 fs-4"><i class="fa-solid fa-location-dot"></i></div>
                        <div>
                            <h5 class="fw-bold mb-1">Địa chỉ</h5>
                            <p class="text-secondary small mb-1">Ghé thăm Showroom của chúng tôi</p>
                            <h6 class="text-honda-red fw-bold mb-0" style="font-size: 14px;">198 Trần Quang Khải, Hoàn Kiếm, HN</h6>
                        </div>
                    </div>
                </div>
            </a>

            <div class="card border-0 shadow-sm p-4 rounded-4">
                <div class="d-flex align-items-center">
                    <div class="honda-red text-white rounded-3 p-3 me-3 fs-4"><i class="fa-regular fa-clock"></i></div>
                    <div>
                        <h5 class="fw-bold mb-1">Giờ làm việc</h5>
                        <p class="text-secondary small mb-1">Thứ Hai - Thứ Sáu: 8:00 - 18:00<br>Thứ Bảy: 8:00 - 17:00</p>
                        <h6 class="text-honda-red fw-bold mb-0" style="font-size: 14px;">Chủ Nhật: 9:00 - 16:00</h6>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-8">
            <div class="card border-0 shadow-sm p-5 rounded-4 h-100">
                <h3 class="fw-bold mb-4">Gửi Lời Nhắn Cho Chúng Tôi</h3>

                @if(session('success'))
                <div class="alert alert-success alert-dismissible fade show rounded-3" role="alert">
                    <i class="fa-solid fa-circle-check me-2"></i> {{ session('success') }}
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                @endif

                <form action="{{ route('contact.store') }}" method="POST">
                    @csrf
                    <div class="row g-4">
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Họ và tên *</label>
                            <input type="text" name="name" class="form-control form-control-lg rounded-3 bg-light border-0" placeholder="Nhập tên của bạn" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Địa chỉ Email *</label>
                            <input type="email" name="email" class="form-control form-control-lg rounded-3 bg-light border-0" placeholder="email_cua_ban@example.com" required>
                        </div>
                        <div class="col-12">
                            <label class="form-label fw-bold">Chủ đề cần tư vấn *</label>
                            <select name="subject" class="form-select form-control-lg rounded-3 bg-light border-0" required>
                                <option value="" disabled selected>Chọn chủ đề</option>
                                <option value="Chính sách bảo hành">Chính sách bảo hành</option>
                                <option value="Tư vấn mua trả góp">Tư vấn mua trả góp</option>
                                <option value="Đặt lịch lái thử">Đặt lịch lái thử</option>
                                <option value="Khác">Khác</option>
                            </select>
                        </div>
                        <div class="col-12">
                            <label class="form-label fw-bold">Nội dung tin nhắn *</label>
                            <textarea name="message" class="form-control rounded-3 bg-light border-0" rows="5" placeholder="Cho chúng tôi biết chúng tôi có thể giúp gì bạn..." required></textarea>
                        </div>
                        <div class="col-12 mt-4">
                            <button type="submit" class="btn honda-red text-white w-100 py-3 rounded-pill fw-bold fs-5 shadow-sm hover-red">
                                Gửi liên hệ
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="row mt-5 pt-5 justify-content-center">
        <div class="col-lg-8 text-center mb-4">
            <h2 class="fw-bold" style="color: #0B1629;">Câu Hỏi Thường Gặp (FAQ)</h2>
            <p class="text-secondary">Giải đáp nhanh các thắc mắc phổ biến của khách hàng.</p>
        </div>
        <div class="col-lg-10">
            <div class="accordion shadow-sm rounded-4 overflow-hidden" id="faqAccordion">
                <div class="accordion-item border-0 border-bottom">
                    <h2 class="accordion-header">
                        <button class="accordion-button fw-bold py-4" type="button" data-bs-toggle="collapse" data-bs-target="#faq1">
                            Chính sách bảo hành xe mới như thế nào?
                        </button>
                    </h2>
                    <div id="faq1" class="accordion-collapse collapse show" data-bs-parent="#faqAccordion">
                        <div class="accordion-body text-secondary pb-4">
                            Tất cả xe máy Honda mới đều được bảo hành chính hãng 3 năm hoặc 30.000km tùy điều kiện nào đến trước. Khách hàng có thể bảo hành tại mọi HEAD trên toàn quốc.
                        </div>
                    </div>
                </div>
                <div class="accordion-item border-0 border-bottom">
                    <h2 class="accordion-header">
                        <button class="accordion-button collapsed fw-bold py-4" type="button" data-bs-toggle="collapse" data-bs-target="#faq2">
                            Showroom có hỗ trợ mua xe trả góp không?
                        </button>
                    </h2>
                    <div id="faq2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                        <div class="accordion-body text-secondary pb-4">
                            Chúng tôi hỗ trợ trả góp qua thẻ tín dụng và các công ty tài chính với lãi suất cực kỳ hấp dẫn chỉ từ 0%. Thủ tục đơn giản, duyệt hồ sơ trong 15 phút.
                        </div>
                    </div>
                </div>
                <div class="accordion-item border-0">
                    <h2 class="accordion-header">
                        <button class="accordion-button collapsed fw-bold py-4" type="button" data-bs-toggle="collapse" data-bs-target="#faq3">
                            Tôi có thể đặt lịch lái thử xe ở đâu?
                        </button>
                    </h2>
                    <div id="faq3" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                        <div class="accordion-body text-secondary pb-4">
                            Bạn có thể gọi trực tiếp vào Hotline hoặc điền form liên hệ bên trên, chọn chủ đề 'Đặt lịch lái thử'. Nhân viên CSKH sẽ gọi lại để xác nhận lịch cho bạn.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row mt-5 pt-5 mb-5">
        <div class="col-12 text-center mb-4">
            <h2 class="fw-bold" style="color: #0B1629;">Bản Đồ Showroom Hà Nội</h2>
            <p class="text-secondary mb-1">198 Trần Quang Khải, Lý Thái Tổ, Hoàn Kiếm, Hà Nội</p>
        </div>
        <div class="col-12">
            <div class="rounded-4 overflow-hidden shadow-sm border" style="height: 450px;">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.0865882322363!2d105.85293427503144!3d21.029221980619896!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135abeb0415aef3%3A0x7d6a5e1823eb21c3!2zMTk4IFRyw6LgbiBRdWFuZyBLaOG6o2ksIEzDvSBUaMOhaSBU4buVLCBIb8OgbiBLaeG6v20sIEjDoCBO4buZaSwgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1700000000000!5m2!1svi!2s" width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
            <p class="text-center text-muted small mt-2 fst-italic">Nhấn vào bản đồ để nhận chỉ đường chi tiết trên Google Maps</p>
        </div>
    </div>

    <!-- ========================================================= -->
    <!-- HỆ THỐNG ĐỊNH VỊ ĐẠI LÝ HONDA & CHỈ ĐƯỜNG GOOGLE MAPS     -->
    <!-- ========================================================= -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>

    <div class="row mt-5 pt-4 mb-5">
        <div class="col-12 text-center mb-4">
            <h2 class="fw-bold" style="color: #0B1629;">Hệ Thống Đại Lý Honda & Chỉ Đường Google Maps</h2>
            <p class="text-secondary mb-1">Định vị GPS thời gian thực, tìm HEAD gần nhất và điều hướng trực tiếp trên Google Maps</p>
        </div>

        <div class="col-12">
            <div class="card border-0 shadow-lg rounded-4 overflow-hidden">
                <div class="card-header text-white p-3 d-flex justify-content-between align-items-center flex-wrap gap-2" style="background-color: #cc0000;">
                    <h5 class="mb-0 fw-bold">
                        <i class="fa-solid fa-map-location-dot me-2"></i>Bản Đồ Đại Lý Honda & Chỉ Đường Trực Tuyến (Web GIS & Google Maps)
                    </h5>
                    <button type="button" id="btn-locate-me" class="btn btn-light text-danger fw-bold rounded-pill px-3 shadow-sm">
                        <i class="fa-solid fa-location-crosshairs me-1"></i> Tìm chi nhánh gần tôi
                    </button>
                </div>

                <div class="card-body p-4">
                    <!-- Thanh nhập địa chỉ thủ công -->
                    <div class="row g-2 mb-3">
                        <div class="col-md-9">
                            <div class="input-group">
                                <span class="input-group-text bg-white"><i class="fa-solid fa-magnifying-glass-location text-danger"></i></span>
                                <input type="text" id="manual-address-input" class="form-control" placeholder="Hoặc nhập vị trí của bạn (VD: Đại học Công nghiệp Hà Nội, Cầu Giấy...)">
                            </div>
                        </div>
                        <div class="col-md-3 d-grid">
                            <button type="button" id="btn-search-address" class="btn btn-outline-danger fw-bold">
                                <i class="fa-solid fa-search me-1"></i> Tìm theo địa chỉ
                            </button>
                        </div>
                    </div>

                    <!-- Khung thông báo lộ trình & Nút mở nhanh Google Maps -->
                    <div id="route-info-banner" class="alert alert-primary d-none d-flex justify-content-between align-items-center flex-wrap gap-2 rounded-3 mb-3">
                        <div>
                            <i class="fa-solid fa-route me-2 fs-5"></i>
                            <strong id="route-dest-name">Đang dẫn đường tới:</strong>
                            <span id="route-summary-text" class="ms-2"></span>
                            <span class="badge bg-primary ms-2" id="route-eta-badge"></span>
                        </div>
                        <a id="btn-open-gmaps-banner" href="#" target="_blank" class="btn btn-sm btn-success fw-bold rounded-pill px-3 shadow-sm">
                            <i class="fa-solid fa-up-right-from-square me-1"></i> Mở điều hướng Google Maps
                        </a>
                    </div>

                    <div class="row g-3">
                        <!-- Cột trái: Danh sách chi nhánh -->
                        <div class="col-lg-4">
                            <h6 class="fw-bold text-secondary mb-2">
                                <i class="fa-solid fa-list-ol me-1"></i> Danh sách chi nhánh gần nhất:
                            </h6>
                            <div id="store-list-container" style="max-height: 480px; overflow-y: auto;" class="pe-1">
                                <div class="text-muted small py-3 text-center">
                                    Nhấn <b>"Tìm chi nhánh gần tôi"</b> để xác định vị trí và sắp xếp cửa hàng gần nhất.
                                </div>
                            </div>
                        </div>

                        <!-- Cột phải: Bản đồ sử dụng trực tiếp lớp nền Google Maps -->
                        <div class="col-lg-8">
                            <div id="honda-gis-map" style="height: 500px; width: 100%; border-radius: 12px; border: 2px solid #eee; z-index: 1;"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
    document.addEventListener("DOMContentLoaded", function () {
        let userLat = 21.0537;
        let userLng = 105.7351;
        const map = L.map('honda-gis-map').setView([userLat, userLng], 13);

        // Nạp trực tiếp lớp bản đồ Google Maps (Road Map & Hybrid Satellite)
        const googleStreets = L.tileLayer('https://mt1.google.com/vt/lyrs=m&hl=vi&x={x}&y={y}&z={z}', {
            maxZoom: 20,
            attribution: '© Google Maps'
        }).addTo(map);

        const googleHybrid = L.tileLayer('https://mt1.google.com/vt/lyrs=s,h&hl=vi&x={x}&y={y}&z={z}', {
            maxZoom: 20,
            attribution: '© Google Maps Satellite'
        });

        // Nút chuyển đổi giữa Bản đồ đường phố và Vệ tinh Google Maps ở góc phải
        L.control.layers({
            "Bản đồ Google Maps": googleStreets,
            "Vệ tinh Google Maps": googleHybrid
        }).addTo(map);

        let userMarker = null;
        let storeMarkers = [];
        let routePolyline = null;

        const userIcon = L.divIcon({
            html: '<div style="background:#0d6efd;width:18px;height:18px;border-radius:50%;border:3px solid #fff;box-shadow:0 0 8px rgba(0,0,0,0.5);"></div>',
            className: '',
            iconSize: [18, 18],
            iconAnchor: [9, 9]
        });

        const storeIcon = L.divIcon({
            html: '<div style="background:#cc0000;color:#fff;width:32px;height:32px;border-radius:50%;display:flex;align-items:center;justify-content:center;border:2px solid #fff;box-shadow:0 2px 6px rgba(0,0,0,0.4);"><i class="fa-solid fa-motorcycle" style="font-size:14px;"></i></div>',
            className: '',
            iconSize: [32, 32],
            iconAnchor: [16, 16]
        });

        // Tạo link kết nối thẳng sang Google Maps Chỉ đường (Directions)
        function getGoogleMapsDirUrl(originLat, originLng, destLat, destLng, destAddress) {
            const destinationQuery = encodeURIComponent(destAddress || `${destLat},${destLng}`);
            return `https://www.google.com/maps/dir/?api=1&origin=${originLat},${originLng}&destination=${destLat},${destLng}&travelmode=two-wheeler`;
        }

        async function loadNearestStores(lat, lng, labelText = "Vị trí hiện tại của bạn") {
            userLat = lat;
            userLng = lng;

            if (userMarker) map.removeLayer(userMarker);
            userMarker = L.marker([userLat, userLng], { icon: userIcon })
                .addTo(map)
                .bindPopup(`<b>${labelText}</b><br>Vĩ độ: ${userLat.toFixed(4)}, Kinh độ: ${userLng.toFixed(4)}`)
                .openPopup();

            try {
                const response = await fetch("{{ route('stores.nearest') }}", {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
                    },
                    body: JSON.stringify({ lat: userLat, lng: userLng })
                });

                const data = await response.json();
                if (!data.success) return;

                renderStores(data.stores);
            } catch (err) {
                console.error("Lỗi tải danh sách cửa hàng:", err);
            }
        }

        function renderStores(stores) {
            storeMarkers.forEach(m => map.removeLayer(m));
            storeMarkers = [];

            const listBox = document.getElementById('store-list-container');
            let html = '';

            stores.forEach((store, index) => {
                const isNearest = index === 0;
                const badgeHtml = isNearest
                    ? `<span class="badge bg-danger">Gần nhất (${store.distance_km} km)</span>`
                    : `<span class="badge bg-secondary">Cách ${store.distance_km} km</span>`;

                html += `
                    <div class="card mb-2 border ${isNearest ? 'border-danger' : 'border-light'} shadow-sm">
                        <div class="card-body p-3">
                            <div class="d-flex justify-content-between align-items-start mb-1">
                                <h6 class="fw-bold text-dark mb-0" style="font-size: 0.95rem;">${store.name}</h6>
                                ${badgeHtml}
                            </div>
                            <p class="text-muted small mb-1"><i class="fa-solid fa-location-dot text-danger me-1"></i>${store.address}</p>
                            <p class="text-muted small mb-2"><i class="fa-solid fa-phone text-success me-1"></i>${store.phone} | <i class="fa-regular fa-clock me-1"></i>${store.hours}</p>
                            <button type="button" class="btn btn-sm btn-danger w-100 rounded-pill fw-bold btn-draw-route"
        style="background-color: #cc0000;"
        data-lat="${store.lat}" data-lng="${store.lng}" 
        data-name="${store.name}">
    <i class="fa-solid fa-diamond-turn-right me-1"></i> Chỉ đường tới đại lý này (Google Maps)
</button>
                        </div>
                    </div>
                `;

                const marker = L.marker([store.lat, store.lng], { icon: storeIcon })
                    .addTo(map)
                    .bindPopup(`
                        <div style="min-width: 220px;">
                            <h6 class="fw-bold text-danger mb-1">${store.name}</h6>
                            <div class="small text-muted mb-1"><b>Địa chỉ:</b> ${store.address}</div>
                            <div class="small text-muted mb-1"><b>SĐT:</b> ${store.phone}</div>
                            <div class="small fw-bold text-primary mb-2">Khoảng cách Haversine: ${store.distance_km} km</div>
                            <button type="button" class="btn btn-sm btn-danger w-100 rounded-pill"
                                    onclick="window.drawOSRMRoute(${store.lat}, ${store.lng}, '${store.name}', '${store.address}', true)">
                                <i class="fa-solid fa-diamond-turn-right"></i> Chỉ đường trên Google Maps
                            </button>
                        </div>
                    `);

                storeMarkers.push(marker);
            });

            listBox.innerHTML = html;

            // Khi người dùng nhấn nút "Chỉ đường tới đại lý này":
            // Vừa vẽ đường trên bản đồ web, vừa mở thẳng Google Maps Chỉ đường
            document.querySelectorAll('.btn-draw-route').forEach(btn => {
                btn.addEventListener('click', function () {
                    const sLat = parseFloat(this.getAttribute('data-lat'));
                    const sLng = parseFloat(this.getAttribute('data-lng'));
                    const sName = this.getAttribute('data-name');
                    const sAddress = this.getAttribute('data-address');
                    window.drawOSRMRoute(sLat, sLng, sName, sAddress, true);
                });
            });

            // Lần đầu mở trang: tự động vẽ đường tới cửa hàng gần nhất trên web (chưa bật tab mới)
            if (stores.length > 0) {
                window.drawOSRMRoute(stores[0].lat, stores[0].lng, stores[0].name, stores[0].address, false);
            }
        }

        // Hàm vẽ đường đi trên bản đồ Web và kết nối sang Google Maps
        window.drawOSRMRoute = async function (destLat, destLng, destName, destAddress = '', openGoogleMaps = false) {
            const gmapsUrl = getGoogleMapsDirUrl(userLat, userLng, destLat, destLng, `${destName}, ${destAddress}`);
            document.getElementById('btn-open-gmaps-banner').href = gmapsUrl;

            // Nếu người dùng bấm nút "Chỉ đường tới đại lý này", mở ngay Google Maps Directions
            if (openGoogleMaps) {
                window.open(gmapsUrl, '_blank');
            }

            const osrmUrl = `https://router.project-osrm.org/route/v1/driving/${userLng},${userLat};${destLng},${destLat}?overview=full&geometries=geojson`;

            try {
                const res = await fetch(osrmUrl);
                const data = await res.json();

                if (data.code !== 'Ok' || !data.routes || data.routes.length === 0) return;

                const route = data.routes[0];
                const distanceKm = (route.distance / 1000).toFixed(2);
                const durationMin = Math.ceil(route.duration / 60);

                if (routePolyline) map.removeLayer(routePolyline);

                routePolyline = L.geoJSON(route.geometry, {
                    style: {
                        color: '#0d6efd',
                        weight: 6,
                        opacity: 0.9
                    }
                }).addTo(map);

                map.fitBounds(routePolyline.getBounds(), { padding: [40, 40] });

                const banner = document.getElementById('route-info-banner');
                document.getElementById('route-dest-name').textContent = `Lộ trình tới ${destName}:`;
                document.getElementById('route-summary-text').innerHTML = `Quãng đường thực tế: <b>${distanceKm} km</b>`;
                document.getElementById('route-eta-badge').innerHTML = `<i class="fa-solid fa-motorcycle me-1"></i> ~${durationMin} phút`;
                banner.classList.remove('d-none');
            } catch (err) {
                console.error("Lỗi gọi Routing API:", err);
            }
        };

        document.getElementById('btn-locate-me').addEventListener('click', function () {
            const btn = this;
            btn.innerHTML = '<i class="fa-solid fa-spinner fa-spin me-1"></i> Đang lấy tọa độ GPS...';

            if (!navigator.geolocation) {
                alert("Trình duyệt không hỗ trợ Geolocation.");
                btn.innerHTML = '<i class="fa-solid fa-location-crosshairs me-1"></i> Tìm chi nhánh gần tôi';
                return;
            }

            navigator.geolocation.getCurrentPosition(
                function (position) {
                    btn.innerHTML = '<i class="fa-solid fa-location-crosshairs me-1"></i> Tìm chi nhánh gần tôi';
                    loadNearestStores(position.coords.latitude, position.coords.longitude, "Vị trí GPS của bạn");
                },
                function () {
                    btn.innerHTML = '<i class="fa-solid fa-location-crosshairs me-1"></i> Tìm chi nhánh gần tôi';
                    loadNearestStores(userLat, userLng, "Vị trí mặc định (Hà Nội)");
                },
                { enableHighAccuracy: true, timeout: 8000 }
            );
        });

        document.getElementById('btn-search-address').addEventListener('click', async function () {
            const address = document.getElementById('manual-address-input').value.trim();
            if (!address) {
                alert("Vui lòng nhập địa chỉ của bạn để tìm kiếm!");
                return;
            }

            const geocodingUrl = `https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(address + ', Việt Nam')}&limit=1`;
            try {
                const res = await fetch(geocodingUrl);
                const results = await res.json();
                if (results && results.length > 0) {
                    loadNearestStores(parseFloat(results[0].lat), parseFloat(results[0].lon), `Vị trí: ${address}`);
                } else {
                    alert("Không tìm thấy tọa độ cho địa chỉ này!");
                }
            } catch (e) {
                alert("Lỗi kết nối dịch vụ Geocoding API.");
            }
        });

        loadNearestStores(userLat, userLng, "Vị trí trung tâm");
    });
    </script>
</div>


<style>
    .transition {
        transition: all 0.3s ease;
    }

    .hover-shadow:hover {
        transform: translateY(-5px);
        box-shadow: 0 1rem 3rem rgba(0, 0, 0, .175) !important;
    }

    .hover-red:hover {
        background-color: #a00000 !important;
    }

    .accordion-button:not(.collapsed) {
        background-color: #fff5f5;
        color: #cc0000;
    }
</style>
@endsection