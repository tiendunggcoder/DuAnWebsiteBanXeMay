<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    use WithoutModelEvents;

    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Tạo hoặc cập nhật tài khoản Admin
        User::updateOrCreate(
            ['email' => 'admin@honda.com'],
            [
                'name' => 'Quản trị viên Honda',
                'password' => bcrypt('12345678'),
                'role' => 'admin',
            ]
        );

        // Tạo hoặc cập nhật tài khoản Khách hàng để test
        User::updateOrCreate(
            ['email' => 'user@honda.com'],
            [
                'name' => 'User',
                'password' => bcrypt('12345678'),
                'role' => 'user',
            ]
        );

        // Tạo dữ liệu xe máy mẫu
        $this->call([
            ProductSeeder::class,
        ]);
    }
}