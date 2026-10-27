-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.4.3 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for honda_motorbike
CREATE DATABASE IF NOT EXISTS `honda_motorbike` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `honda_motorbike`;

-- Dumping structure for table honda_motorbike.cache
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table honda_motorbike.cache: ~0 rows (approximately)

-- Dumping structure for table honda_motorbike.cache_locks
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table honda_motorbike.cache_locks: ~0 rows (approximately)

-- Dumping structure for table honda_motorbike.chat_messages
CREATE TABLE IF NOT EXISTS `chat_messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `is_admin_reply` tinyint(1) NOT NULL DEFAULT '0',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chat_messages_user_id_foreign` (`user_id`),
  CONSTRAINT `chat_messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table honda_motorbike.chat_messages: ~5 rows (approximately)
INSERT INTO `chat_messages` (`id`, `session_id`, `user_id`, `is_admin_reply`, `message`, `created_at`, `updated_at`) VALUES
	(1, 'aOfcLty1xAlIQfPvyrRzablE3qfS831mpEd4Wxxj', NULL, 0, 'trong cua hang minh co ban xe wave khong', '2026-10-10 09:13:18', '2026-10-10 09:13:18'),
	(2, NULL, 3, 0, 'wave giá bao nhiêu', '2026-10-13 09:07:21', '2026-10-13 09:07:21'),
	(3, NULL, 3, 0, 'Giá xe Wave', '2026-10-13 09:08:14', '2026-10-13 09:08:14'),
	(4, NULL, 3, 0, 'giá xe wave', '2026-10-13 09:10:07', '2026-10-13 09:10:07'),
	(5, NULL, 3, 0, 'vision', '2026-10-13 09:13:36', '2026-10-13 09:13:36'),
	(6, NULL, 3, 0, 'Giá xe Vision?', '2026-10-13 09:14:01', '2026-10-13 09:14:01');

-- Dumping structure for table honda_motorbike.contacts
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table honda_motorbike.contacts: ~0 rows (approximately)
INSERT INTO `contacts` (`id`, `created_at`, `updated_at`, `name`, `email`, `subject`, `message`) VALUES
	(1, '2026-10-07 07:53:35', '2026-10-07 07:53:35', 'Đinh Tiến Dũng', 'dunggcoii02022006@gmail.com', 'Tư vấn mua trả góp', 'test'),
	(2, '2026-10-13 09:09:16', '2026-10-13 09:09:16', 'Phạm Văn Đạt', 'dunggliww@gmail.com', 'Tư vấn mua trả góp', 'tôi có thể mua xe trả góp bên bạn với giá như cụ thể như thế nào'),
	(3, '2026-10-24 11:29:35', '2026-10-24 11:29:35', 'Đinh Tiến Dũng', 'dinhdung02022006@gmail.com', 'Tư vấn mua trả góp', 'ytrytrytrytrytr'),
	(4, '2026-10-24 11:32:12', '2026-10-24 11:32:12', 'hà quang minnh', 'hihi@gmail.com', 'Chính sách bảo hành', 'toi muon biet chinh sach bao hanh cua ben ban la gi');

-- Dumping structure for table honda_motorbike.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table honda_motorbike.failed_jobs: ~0 rows (approximately)

-- Dumping structure for table honda_motorbike.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table honda_motorbike.jobs: ~0 rows (approximately)

-- Dumping structure for table honda_motorbike.job_batches
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table honda_motorbike.job_batches: ~0 rows (approximately)

-- Dumping structure for table honda_motorbike.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table honda_motorbike.migrations: ~0 rows (approximately)
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '0001_01_01_000000_create_users_table', 1),
	(2, '0001_01_01_000001_create_cache_table', 1),
	(3, '0001_01_01_000002_create_jobs_table', 1),
	(4, '2026_04_09_101447_create_motorcycles_table', 1),
	(5, '2026_04_14_094759_create_products_table', 1),
	(6, '2026_04_14_095316_create_contacts_table', 1),
	(7, '2026_04_18_100000_add_images_to_products_table', 1),
	(8, '2026_04_21_000001_add_profile_fields_to_users_table', 1),
	(9, '2026_04_21_125244_create_chat_messages_table', 1),
	(10, '2026_04_28_061140_create_orders_table', 1),
	(11, '2026_04_28_061151_create_order_items_table', 1),
	(12, '2026_05_14_085238_create_posts_table', 1),
	(13, '2026_05_14_105945_add_stock_to_products_table', 1),
	(14, '2026_05_14_111044_add_sold_to_products_table', 1);

-- Dumping structure for table honda_motorbike.motorcycles
CREATE TABLE IF NOT EXISTS `motorcycles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(15,2) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table honda_motorbike.motorcycles: ~0 rows (approximately)

-- Dumping structure for table honda_motorbike.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `total_amount` decimal(15,2) NOT NULL,
  `payment_method` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'momo',
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `momo_order_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `momo_trans_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table honda_motorbike.orders: ~11 rows (approximately)
INSERT INTO `orders` (`id`, `user_id`, `total_amount`, `payment_method`, `payment_status`, `momo_order_id`, `momo_trans_id`, `created_at`, `updated_at`) VALUES
	(1, 3, 151390000.00, 'momo', 'pending', '1791385230', NULL, '2026-10-07 08:00:30', '2026-10-07 08:00:30'),
	(2, 3, 151390000.00, 'momo', 'pending', '1791385263', NULL, '2026-10-07 08:01:03', '2026-10-07 08:01:03'),
	(3, 3, 180990000.00, 'momo', 'pending', '1791385515', NULL, '2026-10-07 08:05:15', '2026-10-07 08:05:15'),
	(4, 3, 17957455.00, 'momo', 'pending', '1791386889', NULL, '2026-10-07 08:28:09', '2026-10-07 08:28:09'),
	(5, 3, 35914910.00, 'momo', 'pending', '1791387532', NULL, '2026-10-07 08:38:52', '2026-10-07 08:38:52'),
	(6, 3, 72290000.00, 'momo', 'pending', '1791648837', NULL, '2026-10-10 09:13:58', '2026-10-10 09:13:58'),
	(7, 3, 17957455.00, 'momo', 'pending', '1791648874', NULL, '2026-10-10 09:14:34', '2026-10-10 09:14:34'),
	(8, 3, 17957455.00, 'momo', 'failed', '1792334485', NULL, '2026-10-18 07:41:25', '2026-10-18 07:42:03'),
	(9, 3, 184990000.00, 'momo', 'pending', '1792866645', NULL, '2026-10-24 11:30:45', '2026-10-24 11:30:45'),
	(10, 3, 184990000.00, 'momo', 'pending', '1792866651', NULL, '2026-10-24 11:30:51', '2026-10-24 11:30:51'),
	(11, 3, 17957455.00, 'momo', 'pending', '1792866676', NULL, '2026-10-24 11:31:16', '2026-10-24 11:31:16');

-- Dumping structure for table honda_motorbike.order_items
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `order_id` bigint unsigned NOT NULL,
  `product_id` bigint unsigned DEFAULT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table honda_motorbike.order_items: ~10 rows (approximately)
INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `product_name`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
	(1, 1, 2, 'SH350i', 1, 151390000.00, '2026-10-07 08:00:30', '2026-10-07 08:00:30'),
	(2, 2, 2, 'SH350i', 1, 151390000.00, '2026-10-07 08:01:03', '2026-10-07 08:01:03'),
	(3, 3, 33, 'CL500', 1, 180990000.00, '2026-10-07 08:05:15', '2026-10-07 08:05:15'),
	(4, 4, 15, 'Wave Alpha 110', 1, 17957455.00, '2026-10-07 08:28:09', '2026-10-07 08:28:09'),
	(5, 5, 15, 'Wave Alpha 110', 2, 17957455.00, '2026-10-07 08:38:52', '2026-10-07 08:38:52'),
	(6, 6, 17, 'CBR150R', 1, 72290000.00, '2026-10-10 09:13:58', '2026-10-10 09:13:58'),
	(7, 7, 15, 'Wave Alpha 110', 1, 17957455.00, '2026-10-10 09:14:34', '2026-10-10 09:14:34'),
	(8, 8, 15, 'Wave Alpha 110', 1, 17957455.00, '2026-10-18 07:41:25', '2026-10-18 07:41:25'),
	(9, 9, 31, 'CB500 Hornet', 1, 184990000.00, '2026-10-24 11:30:45', '2026-10-24 11:30:45'),
	(10, 10, 31, 'CB500 Hornet', 1, 184990000.00, '2026-10-24 11:30:51', '2026-10-24 11:30:51'),
	(11, 11, 15, 'Wave Alpha 110', 1, 17957455.00, '2026-10-24 11:31:16', '2026-10-24 11:31:16');

-- Dumping structure for table honda_motorbike.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table honda_motorbike.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table honda_motorbike.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table honda_motorbike.posts: ~0 rows (approximately)

-- Dumping structure for table honda_motorbike.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` json DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(15,2) NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `sold` int NOT NULL DEFAULT '0',
  `year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2024',
  `colors` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table honda_motorbike.products: ~37 rows (approximately)
INSERT INTO `products` (`id`, `name`, `category`, `image`, `images`, `description`, `price`, `stock`, `sold`, `year`, `colors`, `created_at`, `updated_at`) VALUES
	(1, 'ADV350', 'Xe tay ga', 'https://tse1.mm.bing.net/th/id/OIP.L37fs5S0m6vJRLDci64WSAHaFP?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', NULL, 'Xe tay ga phong cách phiêu lưu địa hình Adventure, động cơ eSP+ 330cc mạnh mẽ và phuộc Showa cao cấp.', 166190000.00, 10, 0, '2026', '[{"hex": "#212529", "name": "Đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/September2025/1757923937/1.png"}, {"hex": "#cc0000", "name": "Đỏ đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/September2025/1757924033/1.png"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(2, 'SH350i', 'Xe tay ga', 'https://product.hstatic.net/200000560101/product/6__1__ebde9c7b0b81458a82afcb41e14d6eae.png', NULL, 'Dẫn đầu phân khúc xe tay ga cao cấp dung tích lớn, công nghệ kiểm soát lực kéo HSTC và kết nối điện thoại thông minh.', 151390000.00, 12, 0, '2026', '[{"hex": "#ffffff", "name": "Trắng đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/November2024/1730800088/0.png"}, {"hex": "#212529", "name": "Đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/November2024/1730798593/0.png"}, {"hex": "#6c757d", "name": "Xám đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/November2024/1730800509/0.png"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(3, 'Vario 160', 'Xe tay ga', 'https://tse1.mm.bing.net/th/id/OIP.jud5QCOV2TnfzhGytIMEKAHaE8?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', NULL, 'Thiết kế thể thao hầm hố góc cạnh, khung dập hàn laser eSAF thế hệ mới cùng hệ thống phanh đĩa ABS an toàn.', 56690000.00, 20, 0, '2026', '[{"hex": "#cc0000", "name": "Đỏ đen bạc", "image": "https://cdn.honda.com.vn/motorbikes/December2022/3Kgu7JzU6OTbah8iDETH.png"}, {"hex": "#0056b3", "name": "Xanh đen bạc", "image": "https://cdn.honda.com.vn/motorbikes/December2022/8j7kguR1q6QlfSCjK5G3.png"}, {"hex": "#6c757d", "name": "Xám đen bạc", "image": "https://cdn.honda.com.vn/motorbikes/December2022/TuV3XqY9euaoDoibgI29.png"}, {"hex": "#212529", "name": "Đen bạc", "image": "https://cdn.honda.com.vn/motorbikes/December2022/AfaZN2Ybtn9hUpyxAz5J.png"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(4, 'Vario 125', 'Xe tay ga', 'https://tse1.mm.bing.net/th/id/OIP.4CbT4xfxRBWVnZl9osxHXAHaE8?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', NULL, 'Phong cách thể thao trẻ trung linh hoạt trên phố, sàn để chân phẳng rộng rãi và cổng sạc USB tiện ích.', 41913818.00, 25, 0, '2026', '[{"hex": "#212529", "name": "Đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/August2026/1785643652/0.png"}, {"hex": "#0056b3", "name": "Xanh đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/August2026/1785643437/0.png"}, {"hex": "#cc0000", "name": "Đỏ đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/August2026/1785643681/0.png"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(5, 'Air Blade 160/125', 'Xe tay ga', 'https://th.bing.com/th/id/OIP.OhQY2YDWyAzU9WKe9T9VEQHaE8?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', NULL, 'Diện mạo thể thao cuốn hút, trang bị động cơ eSP+ 4 van êm ái bốc khỏe, đồng hồ LCD sắc nét.', 42404727.00, 30, 0, '2026', '[{"hex": "#6c757d", "name": "Xám đỏ đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/November2025/1762153195/0.png"}, {"hex": "#212529", "name": "Đen bạc", "image": "https://muaxemay.vn/wp-content/uploads/2016/12/Den.png"}, {"hex": "#0056b3", "name": "Xanh đen vàng", "image": "https://headhongdac.com/upload/sanpham/large/air-blade-125--160-1719888092-acf124.jpg"}, {"hex": "#cc0000", "name": "Đỏ đen bạc", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/November2025/1762149202/0.png"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(6, 'Vision', 'Xe tay ga', 'https://tse1.mm.bing.net/th/id/OIP.PsEveLdjnRQj6lVIhii3igHaE8?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', NULL, 'Mẫu xe tay ga quốc dân với thiết kế thời trang, nhẹ nhàng, động cơ eSP thông minh và khóa SMART Key tiện lợi.', 31506545.00, 40, 0, '2026', '[{"hex": "#6c757d", "name": "Xám đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/December2025/1765586419/0.png"}, {"hex": "#000000", "name": "Đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/December2025/1765586281/6.png"}, {"hex": "#ffffff", "name": "Trắng đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/December2025/1765587460/0.png"}, {"hex": "#cc0000", "name": "Đỏ đen", "image": "https://hondath.vn/wp-content/uploads/2026/05/vision-cao-cap-mau-do-xam.png"}, {"hex": "#0056b3", "name": "Xanh đen", "image": "https://photo-baomoi.bmcdn.me/w500_r1/2025_02_10_304_51434925/6b6166025d4cb412ed5d.jpg"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(7, 'LEAD ABS', 'Xe tay ga', 'https://tse2.mm.bing.net/th/id/OIP.9HisL6qEkGICW-eVfKpZdAHaFj?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', NULL, 'Cốp chứa đồ U-box cực đại 37 lít, trang bị hệ thống phanh chống bó cứng ABS hiện đại và nắp bình xăng trước tiện lợi.', 39753818.00, 25, 0, '2026', '[{"hex": "#6c757d", "name": "Xanh xám", "image": "https://hondadoanhthu.com.vn/wp-content/uploads/2024/07/leadbxanhden-scaled.png"}, {"hex": "#212529", "name": "Đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/November2025/1762148744/6.png"}, {"hex": "#cc0000", "name": "Đỏ", "image": "https://hongphat.org/wp-content/uploads/2016/12/caocap-do.png"}, {"hex": "#0056b3", "name": "Xanh", "image": "https://hondathanhbinhan.com/wp-content/uploads/2024/12/lead-2025-cao-cap-xanh.png"}, {"hex": "#ffffff", "name": "Trắng", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/November2025/1762148633/2.png"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(8, 'Sh mode 125', 'Xe tay ga', 'https://tse4.mm.bing.net/th/id/OIP.36DkK6jXKYPOpUhSs4vtJgHaFj?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', NULL, 'Chuẩn mực phong cách châu Âu thanh lịch, đường nét mềm mại sang trọng và phanh ABS bánh trước an toàn.', 59684727.00, 18, 0, '2026', '[{"hex": "#6c757d", "name": "Xám đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/September2026/1789954329/0.png"}, {"hex": "#212529", "name": "Đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/September2026/1789954221/0.png"}, {"hex": "#cc0000", "name": "Đỏ đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/September2026/1789954114/0.png"}, {"hex": "#0056b3", "name": "Xanh đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/September2026/1789954243/0.png"}, {"hex": "#ffffff", "name": "Trắng", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/September2026/1789954022/0.png"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(9, 'SH160i/125i', 'Xe tay ga', 'https://cdn.hstatic.net/products/200000712539/honda_sh160i_phien_ban_the_thao_xanh_den_do_61204c0c61e74bc183e6432aa8152da9_master.png', NULL, 'Đỉnh cao phong cách sang trọng và đẳng cấp, trang bị đèn LED nổi bật và phanh ABS 2 kênh kết nối Bluetooth My Honda+.', 76670182.00, 20, 0, '2026', '[{"hex": "#6c757d", "name": "Xám đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/November2025/1762225652/0.png"}, {"hex": "#212529", "name": "Đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/November2025/1762226244/0.png"}, {"hex": "#cc0000", "name": "Đỏ đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/November2025/1762226142/0.png"}, {"hex": "#ffffff", "name": "Trắng đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/November2025/1762226002/0.png"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(10, 'Super Cub C125', 'Xe số', 'https://tse2.mm.bing.net/th/id/OIP.fZYd8SNQDaIFd3PV6_GeQQHaEv?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', NULL, 'Huyền thoại phong cách Retro hoài niệm, chi tiết mạ chrome tinh xảo và khóa SMART Key thời thượng.', 87372000.00, 8, 0, '2026', '[{"hex": "#212529", "name": "Đen", "image": "https://cdn.honda.com.vn/motorbike-versions/July2024/4mvfY4O7TXBSDullbfAZ.png"}, {"hex": "#6c757d", "name": "Xanh xám trắng", "image": "https://cdn.honda.com.vn/motorbike-strong-points/October2021/WwL6LIRJq466Z2Z5irlr.png"}, {"hex": "#0056b3", "name": "Xanh dương trắng", "image": "https://hondadoanhthu.com.vn/wp-content/uploads/2022/01/Blue-trang-tieu-chuan.png"}, {"hex": "#cc0000", "name": "Đỏ trắng", "image": "https://hoabinhminhxemay.com/wp-content/uploads/2022/05/Super-Cub-C125-tieu-chuan-do-trang.png"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(11, 'CT125', 'Xe số', 'https://global.honda/content/dam/site/global-jp/news-new/cq_img/2024/10/2241010-ct125/2241010-ct125_og.jpg', NULL, 'Mẫu xe dã ngoại địa hình cá tính, ống xả vắt cao độc đáo, giá chở đồ rộng lớn sẵn sàng cho mọi chuyến cắm trại.', 85997455.00, 10, 0, '2026', '[{"hex": "#6c757d", "name": "Xám đen", "image": "https://minhlongmoto.com/wp-content/uploads/2025/10/ct125-mau-xam-1024x683.jpg"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(12, 'Future 125 FI', 'Xe số', 'https://tse3.mm.bing.net/th/id/OIP.OVuGEr0TBxbecL5UrJ8NLAHaEo?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', NULL, 'Thiết kế cao cấp lịch lãm, đèn pha LED hiện đại, động cơ 125cc phun xăng điện tử PGM-FI siêu tiết kiệm nhiên liệu.', 30622909.00, 35, 0, '2026', '[{"hex": "#0056b3", "name": "Xanh đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/October2025/1761615338/0.png"}, {"hex": "#212529", "name": "Đen vàng", "image": "https://hondathanhbinhan.com/wp-content/uploads/2021/08/future-2024-dac-biet-den-vang.jpg"}, {"hex": "#ffffff", "name": "Trắng đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/October2025/1761615557/0.png"}, {"hex": "#cc0000", "name": "Đỏ đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/October2025/1761615474/6.png"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(13, 'Wave Alpha phiên bản cổ điển', 'Xe số', 'https://tse2.mm.bing.net/th/id/OIP.YLXOUj2EtKp3aODRPLD-QwHaE8?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', NULL, 'Màu sắc retro hoài niệm bắt mắt, vận hành bền bỉ tiết kiệm xăng, người bạn đồng hành tin cậy trên mọi nẻo đường.', 19037455.00, 40, 0, '2026', '[{"hex": "#6c757d", "name": "Xám trắng", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/August2024/1725012695/6.png"}, {"hex": "#495057", "name": "Xanh trắng", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/October2024/1729593508/6.png"}, {"hex": "#e9ecef", "name": "Vàng trắng", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/October2024/1729593444/6.png"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(14, 'Blade', 'Xe số', 'https://tse1.mm.bing.net/th/id/OIP.tzTNn5bfqUXQXx8TPO4DRwHaE8?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', NULL, 'Kiểu dáng thon gọn sắc sảo, cảm giác lái chắc chắn, linh hoạt luồn lách trên các cung đường đô thị đông đúc.', 18900000.00, 30, 0, '2026', '[{"hex": "#212529", "name": "Đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/October2024/1729582594/2.png"}, {"hex": "#cc0000", "name": "Đỏ đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/October2024/1729582707/6.png"}, {"hex": "#0056b3", "name": "Xanh đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/October2024/1729582788/6.png"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(15, 'Wave Alpha 110', 'Xe số', 'https://mitexco.com.vn/vnt_upload/product/12_2022/EYpeXY7cdjjbQl2BZPed_1.png', NULL, 'Mẫu xe số quốc dân phổ thông, động cơ 110cc mạnh mẽ bền bỉ, chi phí sử dụng và bảo dưỡng tiết kiệm tối đa.', 17957455.00, 50, 0, '2026', '[{"hex": "#212529", "name": "Đen nhám", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/August2024/1725011319/6.png"}, {"hex": "#ffffff", "name": "Trắng", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/August2024/1725011403/6.png"}, {"hex": "#0056b3", "name": "Xanh", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/August2024/1725011522/6.png"}, {"hex": "#cc0000", "name": "Đỏ", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/August2024/1725011482/6.png"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(16, 'Wave RSX', 'Xe số', 'https://tse4.mm.bing.net/th/id/OIP.4PIq_cDvvrxUx-VTHkrrQgHaFY?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', NULL, 'Phong cách thể thao góc cạnh, mặt nạ trước hình chữ V sắc sảo, hệ thống phun xăng điện tử PGM-FI bền bỉ.', 22130182.00, 35, 0, '2026', '[{"hex": "#cc0000", "name": "Đỏ đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/August2025/1754545221/4.png"}, {"hex": "#0056b3", "name": "Xanh đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/August2025/1754545246/0.png"}, {"hex": "#343a40", "name": "Xám đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/August2025/1754547368/0.png"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(17, 'CBR150R', 'Xe côn tay', 'https://tse2.mm.bing.net/th/id/OIP.ha9FhNATOZ2umD-6CIefpAHaE8?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', NULL, 'Sportbike thuần chất trường đua, phuộc Upside Down Showa thể thao, bộ ly hợp hỗ trợ chống trượt Slipper Clutch.', 72290000.00, 15, 0, '2026', '[{"hex": "#cc0000", "name": "Đỏ (Bản Đặc Biệt)", "image": "https://cdn.honda.com.vn/motorbike-versions/October2024/WvoUdFXIBpKfCwuMDjmX.png"}, {"hex": "#212529", "name": "Đen đỏ", "image": "https://cdn.honda.com.vn/motorbike-versions/October2024/k9cu81F878Z9MsxMzgH8.png"}, {"hex": "#495057", "name": "Đen xám", "image": "https://cdn.honda.com.vn/motorbike-versions/October2024/a48eB0cJf3CJHMKSNFwi.png"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(18, 'WINNER R', 'Xe côn tay', 'https://tse1.mm.bing.net/th/id/OIP.ru2svUK1f4fq2V4Y9kRuTAHaD6?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', NULL, 'Thủ lĩnh xe côn tay 150cc DOHC 6 cấp số, phanh đĩa ABS trước chống trượt cùng thiết kế khí động học sắc sảo.', 46360000.00, 35, 0, '2026', '[{"hex": "#cc0000", "name": "Đỏ đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/September2025/1757787378/6.png"}, {"hex": "#212529", "name": "Đen bạc", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/September2025/1757761884/6.png"}, {"hex": "#7e878b", "name": "Trắng đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/September2025/1757761376/6.png"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(19, 'Gold Wing 2025', 'Xe phân khối lớn', 'https://tse4.mm.bing.net/th/id/OIP.vRR2QDqzNAzx49niZZsONQHaFj?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', NULL, 'Chuyên cơ mặt đất hạng sang, động cơ 6 xi-lanh đối đỉnh 1833cc, hộp số DCT 7 cấp và túi khí bảo vệ độc quyền.', 1231500000.00, 3, 0, '2026', '[{"hex": "#cc0000", "name": "Đỏ đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/June2025/1749021611/0.png"}, {"hex": "#adb5bd", "name": "Bạc đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/June2025/1749021902/0.png"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(20, 'CBR1000RR-R Fireblade SP 2024', 'Xe phân khối lớn', 'https://tse3.mm.bing.net/th/id/OIP.pqtoI_q2glVEVwLg49ExngHaEL?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', NULL, 'Siêu mô tô giải đua MotoGP thương mại, cánh gió khí động học, phuộc điện tử Ohlins Smart EC và phanh Brembo Stylema.', 1051000000.00, 2, 0, '2026', '[{"hex": "#cc0000", "name": "Đỏ xanh trắng (HRC)", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/October2024/1729823404/5.png"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(21, 'Africa Twin 2026 - Bản Adventure Sports', 'Xe phân khối lớn', 'https://tse2.mm.bing.net/th/id/OIP.0alk_6xObNZtwg9qa57YxgHaEZ?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', NULL, 'Chiến binh việt dã đỉnh cao bình xăng lớn 24.8L, phuộc điện tử Showa EERA, màn hình TFT cảm ứng 6.5 inch hỗ trợ Apple CarPlay.', 620990000.00, 4, 0, '2026', '[{"hex": "#ffffff", "name": "Trắng xanh đỏ", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/June2026/1780486883/1.png"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(22, 'Africa Twin 2026 - Bản Tiêu chuẩn', 'Xe phân khối lớn', 'https://tse3.mm.bing.net/th/id/OIP.da4JYugiZIAdtAlbZUIg8wHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', NULL, 'Dòng Adventure đa địa hình cỗ máy 1.084cc xi-lanh đôi mạnh mẽ, hệ thống đo lường quán tính IMU 6 trục kiểm soát an toàn tối đa.', 540990000.00, 5, 0, '2026', '[{"hex": "#cc0000", "name": "Đỏ đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/June2026/1780482943/1.png"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(23, 'Rebel 1100 2025', 'Xe phân khối lớn', 'https://tse2.mm.bing.net/th/id/OIP.RQteOY8NY6UyriMCkRlC2QHaE8?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', NULL, 'Cruiser phong trần lịch lãm khối động cơ 1.100cc uy lực, trang bị tùy chọn hộp số ly hợp kép DCT và ga tự động Cruise Control.', 399990000.00, 5, 0, '2026', '[{"hex": "#000000", "name": "Đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/September2025/1757727453/34.png"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(24, 'CB1000 Hornet', 'Xe phân khối lớn', 'https://tse3.mm.bing.net/th/id/OIP.znw5F6l31JsElk6-D7UKaAHaFj?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', NULL, 'Naked-bike đường phố thế hệ mới, động cơ 4 xi-lanh thẳng hàng từ Fireblade, khung thép đôi đầm chắc và cụm đèn đôi LED sắc nhọn.', 339900000.00, 6, 0, '2026', '[{"hex": "#212529", "name": "Đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/February2025/1740110485/35.jpg"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(25, 'Transalp 2025', 'Xe phân khối lớn', 'https://tse1.mm.bing.net/th/id/OIP.BzeasSgTHtCl5i-wte3a-wHaFP?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', NULL, 'Mẫu xe Adventure tầm trung 750cc linh hoạt bứt phá mọi hành trình từ nội đô đến những cung đường đèo núi hiểm trở.', 299990000.00, 8, 0, '2026', '[{"hex": "#ffffff", "name": "Trắng đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/October2024/1729591808/0.png"}, {"hex": "#212529", "name": "Đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/October2024/1729591926/0.png"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(26, 'CBR650R 2024', 'Xe phân khối lớn', 'https://www.motorrad-bilder.at/slideshows/291/022670/458065_24YMHONDACBR650R.jpg', NULL, 'Sportbike 4 xi-lanh gầm vang quyến rũ, thiết kế đầu đèn vuốt ngược thể thao, màn hình màu TFT kết nối thông minh RoadSync.', 264990000.00, 10, 0, '2026', '[{"hex": "#cc0000", "name": "Đỏ", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/October2026/1791287572/0.png"}, {"hex": "#212529", "name": "Đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/October2026/1791287523/0.png"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(27, 'CB650R 2024', 'Xe phân khối lớn', 'https://tse2.mm.bing.net/th/id/OIP.mbWchICyDM6VVcmi3WwBRwHaFP?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', NULL, 'Phong cách Neo Sports Café lôi cuốn, cỗ máy 4 xi-lanh uy lực mượt mà, kiểm soát lực kéo HSTC an toàn khi tăng tốc.', 256990000.00, 10, 0, '2026', '[{"hex": "#212529", "name": "Đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/October2026/1791287038/0.png"}, {"hex": "#0B132B", "name": "Xanh đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/October2026/1791287098/0.png"}, {"hex": "#cc0000", "name": "Đen đỏ", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/October2026/1791286975/0.png"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(28, 'GB350S', 'Xe phân khối lớn', 'https://th.bing.com/th/id/OIP.gWiK9MGTeI5xSwFQDMMJLwHaE8?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', NULL, 'Thiết kế Roadster cổ điển mộc mạc, động cơ xy-lanh đơn 348cc tiếng nổ trầm ấm đầy cảm xúc, tư thế ngồi thoải mái.', 134990000.00, 12, 0, '2026', '[{"hex": "#999a9a", "name": "Bạc đen", "image": "https://cdn.honda.com.vn/motorbike-versions/September2026/7jMBY1RSpFnKDhkhES6k.png"}, {"hex": "#6c757d", "name": "Xám bạc", "image": "https://cdn.honda.com.vn/motorbike-versions/September2026/f3K9o1opzQqDczjJOzEl.png"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(29, 'NX500', 'Xe phân khối lớn', 'https://cdn.honda.com.vn/motorbikes/September2024/sb2vhMUmU7NIcVCJ06gX.jpg', NULL, 'Chiến binh Crossover Adventure tầm trung thay thế dòng CB500X huyền thoại, vành bánh nhẹ hơn và màn hình TFT hiển thị mới.', 194290000.00, 10, 0, '2026', '[{"hex": "#4e6c79", "name": "Đen xanh", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/October2026/1791282248/0.jpg"}, {"hex": "#212529", "name": "Đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/October2026/1791282172/0.jpg"}, {"hex": "#ffffff", "name": "Trắng bạc đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/October2026/1791282017/0.jpg"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(30, 'CBR500R 2024', 'Xe phân khối lớn', 'https://www.motorrad-bilder.at/slideshows/291/022670/458065_24YMHONDACBR650R.jpg', NULL, 'Sportbike cỡ trung đậm chất khí động học thừa hưởng từ đàn anh Fireblade, phuộc hành trình ngược Upside Down Showa SFF-BP.', 192990000.00, 8, 0, '2026', '[{"hex": "#c53e3f", "name": "Đỏ", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/October2026/1791286158/0.png"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(31, 'CB500 Hornet', 'Xe phân khối lớn', 'https://tse4.mm.bing.net/th/id/OIP.8ub3yYiAPgrqAdf8WACYMwHaE8?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', NULL, 'Naked-bike dũng mãnh, động cơ 2 xi-lanh song song 471cc bốc khỏe, hệ thống kiểm soát lực kéo HSTC tối tân.', 184990000.00, 8, 0, '2026', '[{"hex": "#cc0000", "name": "Đỏ đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/October2026/1791284572/0.png"}, {"hex": "#212529", "name": "Đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/October2026/1791284416/0.png"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(32, 'REBEL 500 2025', 'Xe phân khối lớn', 'https://th.bing.com/th/id/OIP.705HWpzBgPo2BnE5nmzYVgHaEl?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', NULL, 'Phong cách Bobber cơ bắp phong trần, chiều cao yên thấp 690mm dễ điều khiển, tiếng pô uy lực trầm ấm.', 181300000.00, 7, 0, '2026', '[{"hex": "#212529", "name": "Đen", "image": "https://cdn.honda.com.vn/motorbike-versions/February2025/J6MDkSx6THeUz9kWpuCp.png"}, {"hex": "#7d7e7b", "name": "Xám", "image": "https://cdn.honda.com.vn/motorbike-versions/January2024/23FUpezU3AbDiPOKpLDl.jpg"}, {"hex": "#e7e7e3", "name": "Trắng", "image": "https://cdn.honda.com.vn/motorbike-versions/February2025/q0gQVlmIcoQMAwXp94R0.png"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(33, 'CL500', 'Xe phân khối lớn', 'https://tse2.mm.bing.net/th/id/OIP.5JPgl6fO-SakE6rIxkFp9wHaFP?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', NULL, 'Phong cách Scrambler đường phố cá tính, ống xả đôi vắt cao cổ điển, lốp gai đa dụng tự tin chinh phục địa hình gồ ghề.', 180990000.00, 8, 0, '2026', '[{"hex": "#212529", "name": "Đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/February2025/1740110282/0.jpg"}, {"hex": "#5c4033", "name": "Nâu đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/February2025/1740110212/15.jpg"}]', '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(34, 'Honda Vision', 'Xe Tay Ga', 'https://xemaynamtien.net/wp-content/uploads/2025/03/honda-vision-2022.jpg', '[]', 'Honda Vision mang đến phong cách trẻ trung, thanh lịch, là mẫu xe tay ga hoàn hảo cho việc di chuyển linh hoạt trong đô thị...', 29900000.00, 30, 0, '2026', '["Bạc đen", "Đen", "Xám đen", "Đỏ xám", "Nâu xám"]', '2026-10-09 05:31:55', '2026-10-24 11:39:35'),
	(35, 'Honda Air Blade', 'Xe Tay Ga', 'https://th.bing.com/th/id/OIP.SyKmx2E-qUAvxRY63d51jQHaE8?r=0&o=7rm=3&rs=1&pid=ImgDetMain&o=7&rm=3', NULL, 'Honda Air Blade sở hữu các tính năng cao cấp cùng kiểu dáng thể thao. Khối động cơ 125cc mạnh mẽ...', 43900000.00, 0, 0, '2026', '[{"hex": "#000000", "name": "Đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/November2025/1762153694/0.png"}, {"hex": "#c8cbc8", "name": "Trắng đỏ đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/November2025/1762148885/0.png"}, {"hex": "#4b6883", "name": "Xanh đen xám", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/November2025/1762153595/0.png"}, {"hex": "#6f0006", "name": "Đỏ đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/November2025/1762153746/0.png"}]', '2026-10-09 05:31:55', '2026-10-09 05:31:55'),
	(36, 'Honda SH', 'Tay Ga Cao Cấp', 'https://kimdiep.com.vn/upload/file_bai_viet/images/oUYyIJUp0rrPobcw7WNc.png', NULL, 'Honda SH đại diện cho đỉnh cao của thiết kế xe tay ga cao cấp. Lấy cảm hứng từ phong cách Ý sang trọng...', 95900000.00, 0, 0, '2026', '[{"hex": "#486642", "name": "Xanh đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/September2026/1789954243/6.png"}, {"hex": "#cdcdcd", "name": "Trắng đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/September2026/1789954291/6.png"}, {"hex": "#cc0000", "name": "Đỏ đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/September2026/1789953797/6.png"}, {"hex": "#69706f", "name": "Xám đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/September2026/1789954329/6.png"}]', '2026-10-09 05:31:55', '2026-10-09 05:31:55'),
	(37, 'Honda Winner X', 'Xe Thể Thao', 'https://tse3.mm.bing.net/th/id/OIP.o60GiWJz6Wytry2hXQXoDAHaFy?r=0&rs=1&pid=ImgDetMain&o=7&rm=3', NULL, 'Honda Winner X được thiết kế dành cho những ai khao khát hiệu suất thể thao và kiểu dáng mạnh mẽ...', 46900000.00, 0, 0, '2026', '[{"hex": "#2f4144", "name": "Xanh đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/November2025/1762148830/6.png"}, {"hex": "#8f908d", "name": "Đen bạc", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/November2025/1762149017/6.png"}, {"hex": "#a71d2a", "name": "Đỏ đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/November2025/1762158020/6.png"}, {"hex": "#ffffff", "name": "Trắng đen", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/November2025/1762148633/6.png"}, {"hex": "#3f342c", "name": "Đen nâu", "image": "https://cdn.honda.com.vn/motorbike-versions/Image360/November2025/1762148744/6.png"}]', '2026-10-09 05:31:55', '2026-10-09 05:31:55');

-- Dumping structure for table honda_motorbike.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table honda_motorbike.sessions: ~2 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('0qd2Leoe3yrJmy2LNcKVHdiomFhcKAN1EUEDcB6u', 3, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/156.0.0.0 Safari/537.36 Edg/156.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiS2NnTVNDY3F1ZlVFODN1VkV4ZUlDeGt0cWF4OWlyYldpeHVEdkw1OSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cy8zNyI7czo1OiJyb3V0ZSI7czoxMzoicHJvZHVjdHMuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjM7fQ==', 1792889134),
	('ljywRLRoIFML4XkyIiGFlOQDNqcDcCiMTszOiZGS', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/155.0.0.0 Safari/537.36 Edg/155.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRW5HREVaU090WXZ4OGppMWtaODdxV0NYNkxsaUV2WnpVOEpZcWxpdiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9vcmRlcnMiO3M6NToicm91dGUiO3M6MTI6Im9yZGVycy5pbmRleCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1792867332);

-- Dumping structure for table honda_motorbike.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `membership` enum('none','silver','gold','diamond') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'none',
  `membership_points` int NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table honda_motorbike.users: ~3 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `phone`, `address`, `avatar`, `membership`, `membership_points`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Quản trị viên Honda', 'admin@honda.com', NULL, NULL, NULL, 'none', 0, NULL, '$2y$12$TVzgPy7MY6BR6mwF.RQhfOGo/hDss48IhZnxmFoKZcSTV3A.KNtZ.', 'admin', NULL, '2026-10-05 07:36:24', '2026-10-09 05:31:55'),
	(2, 'User', 'user@honda.com', NULL, NULL, NULL, 'none', 0, NULL, '$2y$12$IqOX3tMY3MpMeTpUBuXPS.MWB.NQSSouLwu5.w0kFEGy77OyVSp26', 'user', NULL, '2026-10-05 07:36:24', '2026-10-09 05:31:55'),
	(3, 'Đinh Tiến Dũng', 'dunggcoii02022006@gmail.com', NULL, NULL, NULL, 'none', 100, NULL, '$2y$12$TamoTZtDCKWdGfxKAz.pde7AEy1J9zOGb/z2mHeZZKKqRlqZtBuEC', 'user', NULL, '2026-10-07 07:59:10', '2026-10-24 11:42:00');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
