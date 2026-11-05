<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;

class ImageSearchController extends Controller
{
    public function searchByImage(Request $request)
    {
        if (!$request->hasFile('image')) {
            return response()->json([
                'success' => false,
                'message' => 'Vui lòng chọn một hình ảnh xe máy để tải lên.'
            ], 200);
        }

        $file = $request->file('image');

        try {
            // Gửi ảnh qua HTTP POST tới dịch vụ Python FastAPI (cổng 8001)
            $response = Http::timeout(20)->attach(
                'file',
                file_get_contents($file->getRealPath()),
                $file->getClientOriginalName()
            )->post('http://127.0.0.1:8001/predict');

            if (!$response->successful()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Dịch vụ AI phản hồi lỗi từ cổng 8001.'
                ], 200);
            }

            $aiResult = $response->json();
            $detectedClass = $aiResult['detected_class'] ?? '';
            $confidence = $aiResult['confidence'] ?? 0;

            if ($confidence < 0.65 || empty($detectedClass)) {
                return response()->json([
                    'success' => false,
                    'message' => 'Độ tin cậy nhận diện thấp hơn ngưỡng 65%, vui lòng thử ảnh rõ nét hơn.'
                ], 200);
            }

            // Truy vấn đối chiếu trong bảng products của CSDL MySQL
            $products = DB::table('products')
                ->where('name', 'LIKE', '%' . $detectedClass . '%')
                ->get();

            if ($products->isEmpty()) {
                $firstWord = explode(' ', $detectedClass)[0];
                $products = DB::table('products')
                    ->where('name', 'LIKE', '%' . $firstWord . '%')
                    ->get();
            }

            return response()->json([
                'success' => true,
                'detected_class' => $detectedClass,
                'confidence' => round($confidence * 100, 1),
                'products' => $products
            ], 200);

        } catch (\Exception $e) {
            // Trả về JSON lỗi nhẹ nhàng, không làm sập trang web thành màn hình đỏ 500
            return response()->json([
                'success' => false,
                'message' => 'Không thể kết nối tới dịch vụ Python FastAPI ở cổng 8001. Chi tiết: ' . $e->getMessage()
            ], 200);
        }
    }
}