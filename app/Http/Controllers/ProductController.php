<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product; // Import model Product để tương tác với cơ sở dữ liệu

class ProductController extends Controller
{
    /**
     * Hiển thị giao diện danh sách toàn bộ sản phẩm
     */
public function index(Request $request)
    {
        // Khởi tạo truy vấn từ Model Product
        $query = Product::query();

        // 1. Xử lý lọc theo danh mục nếu có chọn trên giao diện
        if ($request->has('category') && $request->category != 'all') {
            $query->where('category', $request->category);
        }

        // 2. Xử lý sắp xếp theo giá tiền
        if ($request->has('sort')) {
            if ($request->sort == 'price_asc') {
                $query->orderBy('price', 'asc'); // Giá từ thấp đến cao
            } elseif ($request->sort == 'price_desc') {
                $query->orderBy('price', 'desc'); // Giá từ cao xuống thấp
            }
        } else {
            $query->orderBy('id', 'desc'); // Mặc định sản phẩm mới lên đầu
        }

        // Lấy danh sách sản phẩm sau khi đã lọc và sắp xếp
        $products = $query->get();

        // Truyền dữ liệu sang giao diện view products
        return view('products', compact('products'));
    }

    /**
     * Hiển thị giao diện chi tiết của một sản phẩm
     */
    public function show($id)
    {
        // Tìm kiếm sản phẩm theo ID
        // Hàm findOrFail sẽ trả về lỗi 404 nếu không tìm thấy ID sản phẩm, ngăn chặn lỗi hệ thống
        $product = Product::findOrFail($id);

        // Chuyển dữ liệu sản phẩm đã tìm thấy sang giao diện view chi tiết
        return view('detail', compact('product'));
    }
}