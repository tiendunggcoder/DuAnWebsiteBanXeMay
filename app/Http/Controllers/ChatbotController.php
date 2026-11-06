<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class ChatbotController extends Controller
{
    public function chat(Request $request)
    {
        $rawMessage = trim($request->input('message', ''));
        $userMessage = strtolower($rawMessage);

        if (!$rawMessage) {
            return response()->json(['reply' => 'Dạ, em có thể giúp gì cho quý khách về các dòng xe Honda hôm nay ạ?']);
        }

        // 1. Lấy dữ liệu sản phẩm mới nhất từ CSDL để làm bối cảnh (RAG Context)
        $products = DB::table('products')
            ->select('id', 'name', 'category', 'price', 'stock', 'year')
            ->get();

        // 2. Thử tạo câu trả lời thông minh qua Gemini AI
        $apiKey = env('GEMINI_API_KEY');
        if (!empty($apiKey)) {
            $aiReply = $this->askGemini($rawMessage, $products, $apiKey);
            if (!empty($aiReply)) {
                return response()->json(['reply' => $aiReply]);
            }
        }

        // 3. Fallback theo luật thông minh nếu không có kết nối internet hoặc API lỗi
        return response()->json(['reply' => $this->fallbackRules($userMessage, $products)]);
    }

    /**
     * Gọi Gemini API với kỹ thuật RAG dựa trên dữ liệu sản phẩm trong CSDL
     */
    private function askGemini(string $userQuestion, $products, string $apiKey): ?string
    {
        try {
            // Chuẩn bị danh mục xe tóm tắt từ CSDL thực
            $catalogText = "";
            foreach ($products as $p) {
                $priceVND = number_format($p->price, 0, ',', '.') . ' VNĐ';
                $stockStatus = $p->stock > 0 ? "Còn {$p->stock} xe" : "Tạm hết hàng";
                $catalogText .= "- {$p->name} ({$p->category}, đời {$p->year}): Giá {$priceVND} [{$stockStatus}]\n";
            }

            $systemInstruction = "Bạn là Trợ lý Ảo Honda AI Assistant - Chuyên viên tư vấn bán hàng chuyên nghiệp, tận tâm và lễ phép tại đại lý HEAD Honda Việt Nam.\n"
                . "DƯỚI ĐÂY LÀ DANH SÁCH XE VÀ GIÁ BÁN THỰC TẾ TRONG KHO CỬA HÀNG:\n"
                . $catalogText . "\n"
                . "HƯỚNG DẪN TRẢ LỜI:\n"
                . "1. Trả lời bằng tiếng Việt lịch sự, thân thiện (xưng 'em' hoặc 'Honda Assistant', gọi khách là 'quý khách' hoặc 'anh/chị').\n"
                . "2. Ưu tiên tư vấn dựa trên danh sách xe thực tế ở trên. Nếu khách hỏi về giá hoặc tình trạng, trích dẫn chính xác con số.\n"
                . "3. Nếu khách hỏi mua xe theo ngân sách (vd: 30-40 triệu), hãy gợi ý các mẫu xe phù hợp trong danh mục trên.\n"
                . "4. Nếu khách hỏi về thủ tục: Trả góp chỉ cần CCCD gắn chip (trả trước từ 20-30%, lãi suất ưu đãi); Lái thử xe hoàn toàn miễn phí tại showroom (cần mang bằng lái).\n"
                . "5. Câu trả lời súc tích, ngắt đoạn rõ ràng, dùng định dạng Markdown in đậm các tên xe và giá tiền.";

            $models = ["gemini-3.8-flash", "gemini-2.5-flash", "gemini-1.5-flash"];

            foreach ($models as $model) {
                $endpoint = "https://generativelanguage.googleapis.com/v1beta/models/{$model}:generateContent?key={$apiKey}";

                $response = Http::timeout(8)->post($endpoint, [
                    'contents' => [
                        [
                            'parts' => [
                                ['text' => $systemInstruction . "\n\nCÂU HỎI CỦA KHÁCH HÀNG: " . $userQuestion]
                            ]
                        ]
                    ],
                    'generationConfig' => [
                        'temperature' => 0.4,
                        'maxOutputTokens' => 600
                    ]
                ]);

                if ($response->successful()) {
                    $data = $response->json();
                    $text = $data['candidates'][0]['content']['parts'][0]['text'] ?? null;
                    if (!empty($text)) {
                        return trim($text);
                    }
                }
            }
        } catch (\Exception $e) {
            Log::warning("Gemini Chatbot Error: " . $e->getMessage());
        }

        return null;
    }

    /**
     * Bộ quy tắc dự phòng khi mất kết nối mạng hoặc không có API Key
     */
    private function fallbackRules(string $userMessage, $products): string
    {
        // Kiểm tra hỏi giá hoặc tình trạng xe
        if (str_contains($userMessage, 'giá') || str_contains($userMessage, 'còn') || str_contains($userMessage, 'bao nhiêu')) {
            foreach ($products as $p) {
                if (str_contains($userMessage, strtolower($p->name))) {
                    $priceFormatted = number_format($p->price, 0, ',', '.') . ' VNĐ';
                    $status = $p->stock > 0 ? "còn lại {$p->stock} xe trong kho" : "tạm thời đã hết hàng";
                    return "Dạ mẫu xe **{$p->name}** hiện có giá niêm yết là **{$priceFormatted}** và showroom đang **{$status}** ạ. Quý khách có muốn đăng ký lái thử không ạ?";
                }
            }

            $sampleBikes = $products->take(5)->pluck('name')->implode(', ');
            return "Showroom hiện đang phân phối các dòng xe Honda nổi bật như: **{$sampleBikes}**... Quý khách đang quan tâm mẫu xe nào cụ thể để em báo giá chi tiết ạ?";
        }

        if (str_contains($userMessage, 'trả góp')) {
            return "Dạ thủ tục trả góp tại đại lý rất nhanh gọn chỉ cần **CCCD gắn chip**, hỗ trợ duyệt hồ sơ trong 15 phút, trả trước từ 20-30% giá trị xe với lãi suất ưu đãi. Quý khách vui lòng để lại số điện thoại hoặc ghé trực tiếp showroom để được chuyên viên tài chính hỗ trợ nhé!";
        }

        if (str_contains($userMessage, 'lái thử')) {
            return "Dạ chương trình trải nghiệm lái thử xe Honda hoàn toàn **miễn phí** ạ! Quý khách chỉ cần mang theo **Giấy phép lái xe (A1/A2)** đến trực tiếp đại lý hoặc đặt lịch trước trên website để bên em chuẩn bị xe sẵn sàng đón tiếp ạ.";
        }

        return "Dạ em là trợ lý ảo Honda. Quý khách có thể hỏi em về **giá xe**, **kiểm tra tồn kho**, **thủ tục mua xe trả góp** hoặc **đăng ký lái thử xe** bất kỳ lúc nào ạ!";
    }
}