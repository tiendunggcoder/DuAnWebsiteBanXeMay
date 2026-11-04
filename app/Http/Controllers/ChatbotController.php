<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ChatbotController extends Controller
{
    public function chat(Request $request)
    {
        $userMessage = strtolower(trim($request->input('message')));

        if (!$userMessage) {
            return response()->json(['reply' => 'Vui lòng nhập câu hỏi của bạn.']);
        }

        // 1. Lấy toàn bộ sản phẩm từ bảng products trong CSDL
        $products = DB::table('products')->select('name', 'price', 'stock')->get();

        // 2. Kiểm tra nếu khách hỏi về giá hoặc tình trạng xe
        if (str_contains($userMessage, 'giá') || str_contains($userMessage, 'còn') || str_contains($userMessage, 'hàng') || str_contains($userMessage, 'thế nào')) {
            
            // Tìm xem tên xe nào khách đang nhắc tới trong câu hỏi
            $matchedProduct = null;
            foreach ($products as $p) {
                // Nếu tên xe xuất hiện trong câu hỏi của khách (ví dụ: "vision", "wave")
                if (str_contains($userMessage, strtolower($p->name))) {
                    $matchedProduct = $p;
                    break;
                }
            }

            // Nếu tìm thấy xe khớp với câu hỏi
            if ($matchedProduct) {
                $priceFormatted = number_format($matchedProduct->price, 0, ',', '.') . ' VNĐ';
                $status = $matchedProduct->stock > 0 
                    ? "còn lại {$matchedProduct->stock} chiếc trong kho" 
                    : "tạm thời đã hết hàng";
                
                return response()->json([
                    'reply' => "Dạ, mẫu xe **{$matchedProduct->name}** có giá bán là **{$priceFormatted}** và hiện tại cửa hàng **{$status}** ạ. Bạn có muốn đặt lịch xem xe hoặc lái thử không?"
                ]);
            } else {
                // Nếu khách hỏi chung chung hoặc không tìm thấy tên xe cụ thể
                $listNames = $products->take(5)->pluck('name')->implode(', ');
                return response()->json([
                    'reply' => "Cửa hàng hiện đang có rất nhiều dòng xe như: {$listNames}... Bạn muốn tìm hiểu giá hoặc thông tin chi tiết của mẫu xe cụ thể nào ạ?"
                ]);
            }
        }

        // 3. Xử lý các câu hỏi thường gặp khác
        if (str_contains($userMessage, 'trả góp')) {
            return response()->json([
                'reply' => "Thủ tục trả góp rất đơn giản chỉ cần CCCD gắn chip, trả trước từ 20-30% giá trị xe, lãi suất ưu đãi. Bạn vui lòng để lại số điện thoại để nhân viên gọi tư vấn chi tiết nhé!"
            ]);
        }

        if (str_contains($userMessage, 'lái thử')) {
            return response()->json([
                'reply' => "Tuyệt vời! Bạn có thể mang theo Giấy phép lái xe đến trực tiếp cửa hàng để đăng ký trải nghiệm thực tế các dòng xe nhé."
            ]);
        }

        // Mặc định nếu không khớp từ khóa
        return response()->json([
            'reply' => "Cảm ơn bạn đã quan tâm! Tin nhắn của bạn đã được gửi đến bộ phận chăm sóc khách hàng, chúng tôi sẽ phản hồi sớm nhất."
        ]);
    }
}