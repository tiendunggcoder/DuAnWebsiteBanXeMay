<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class StoreLocatorController extends Controller
{
    // Danh sách tọa độ các chi nhánh Honda HEAD thực tế
    private function getStores()
    {
        return [
            [
                'id' => 1,
                'name' => 'Honda HEAD Doanh Thu 1 (Cầu Giấy)',
                'address' => '136 Phạm Văn Đồng, Mai Dịch, Cầu Giấy, Hà Nội',
                'phone' => '024 3792 0959',
                'hours' => '07:30 - 18:00 (Thứ 2 - Chủ Nhật)',
                'lat' => 21.0461,
                'lng' => 105.7801
            ],
            [
                'id' => 2,
                'name' => 'Honda HEAD Phương Hà (Bắc Từ Liêm)',
                'address' => 'Km12 Quốc lộ 32, Phúc Diễn, Bắc Từ Liêm, Hà Nội',
                'phone' => '024 3763 6363',
                'hours' => '07:30 - 18:00 (Thứ 2 - Chủ Nhật)',
                'lat' => 21.0453,
                'lng' => 105.7445
            ],
            [
                'id' => 3,
                'name' => 'Honda HEAD Kường Ngân (Đống Đa)',
                'address' => '115 Nguyễn Lương Bằng, Quang Trung, Đống Đa, Hà Nội',
                'phone' => '1800 556886',
                'hours' => '08:00 - 18:30 (Thứ 2 - Chủ Nhật)',
                'lat' => 21.0156,
                'lng' => 105.8267
            ],
            [
                'id' => 4,
                'name' => 'Honda HEAD Hồng Hạnh (Hoàn Kiếm)',
                'address' => '252 Phố Huế, Hai Bà Trưng, Hà Nội',
                'phone' => '024 3974 9346',
                'hours' => '08:00 - 18:30 (Thứ 2 - Chủ Nhật)',
                'lat' => 21.0125,
                'lng' => 105.8515
            ],
            [
                'id' => 5,
                'name' => 'Honda HEAD Thắng Lợi (Hà Đông)',
                'address' => '545 Nguyễn Trãi, Thanh Xuân Nam, Thanh Xuân, Hà Nội',
                'phone' => '024 3854 3712',
                'hours' => '07:30 - 18:00 (Thứ 2 - Chủ Nhật)',
                'lat' => 20.9881,
                'lng' => 105.7958
            ],
            [
                'id' => 6,
                'name' => 'Honda HEAD Vũ Hoàng Lê (Hoàng Mai)',
                'address' => 'Số 1 Trần Thủ Độ, Hoàng Liệt, Hoàng Mai, Hà Nội',
                'phone' => '024 3681 1785',
                'hours' => '07:30 - 18:00 (Thứ 2 - Chủ Nhật)',
                'lat' => 20.9634,
                'lng' => 105.8421
            ]
        ];
    }

    // Công thức lượng giác cầu Haversine tính khoảng cách (km) giữa 2 tọa độ
    private function calculateHaversine($lat1, $lon1, $lat2, $lon2)
    {
        $earthRadius = 6371; // Bán kính trung bình của Trái Đất (km)
        $dLat = deg2rad($lat2 - $lat1);
        $dLon = deg2rad($lon2 - $lon1);

        $a = sin($dLat / 2) * sin($dLat / 2) +
             cos(deg2rad($lat1)) * cos(deg2rad($lat2)) *
             sin($dLon / 2) * sin($dLon / 2);

        $c = 2 * asin(sqrt($a));
        return round($earthRadius * $c, 2);
    }

    public function findNearestStores(Request $request)
    {
        $userLat = floatval($request->input('lat', 21.0537));
        $userLng = floatval($request->input('lng', 105.7351));

        $stores = $this->getStores();

        // Tính khoảng cách Haversine từ vị trí khách hàng đến từng chi nhánh
        foreach ($stores as &$store) {
            $store['distance_km'] = $this->calculateHaversine(
                $userLat,
                $userLng,
                $store['lat'],
                $store['lng']
            );
        }

        // Sắp xếp danh sách chi nhánh từ gần nhất đến xa nhất
        usort($stores, function ($a, $b) {
            return $a['distance_km'] <=> $b['distance_km'];
        });

        return response()->json([
            'success' => true,
            'user_location' => ['lat' => $userLat, 'lng' => $userLng],
            'stores' => $stores
        ], 200);
    }
}