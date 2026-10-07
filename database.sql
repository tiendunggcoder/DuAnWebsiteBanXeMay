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
DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table honda_motorbike.cache: ~0 rows (approximately)

-- Dumping structure for table honda_motorbike.cache_locks
DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table honda_motorbike.cache_locks: ~0 rows (approximately)

-- Dumping structure for table honda_motorbike.chat_messages
DROP TABLE IF EXISTS `chat_messages`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table honda_motorbike.chat_messages: ~0 rows (approximately)

-- Dumping structure for table honda_motorbike.contacts
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table honda_motorbike.contacts: ~0 rows (approximately)

-- Dumping structure for table honda_motorbike.failed_jobs
DROP TABLE IF EXISTS `failed_jobs`;
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
DROP TABLE IF EXISTS `jobs`;
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
DROP TABLE IF EXISTS `job_batches`;
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
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table honda_motorbike.migrations: ~14 rows (approximately)
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
DROP TABLE IF EXISTS `motorcycles`;
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
DROP TABLE IF EXISTS `orders`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table honda_motorbike.orders: ~0 rows (approximately)

-- Dumping structure for table honda_motorbike.order_items
DROP TABLE IF EXISTS `order_items`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table honda_motorbike.order_items: ~0 rows (approximately)

-- Dumping structure for table honda_motorbike.password_reset_tokens
DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table honda_motorbike.password_reset_tokens: ~0 rows (approximately)

-- Dumping structure for table honda_motorbike.posts
DROP TABLE IF EXISTS `posts`;
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
DROP TABLE IF EXISTS `products`;
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table honda_motorbike.products: ~33 rows (approximately)
INSERT INTO `products` (`id`, `name`, `category`, `image`, `images`, `description`, `price`, `stock`, `sold`, `year`, `colors`, `created_at`, `updated_at`) VALUES
	(1, 'ADV350', 'Xe tay ga', 'https://images.unsplash.com/photo-1558981403-c5f9899a28bc?auto=format&fit=crop&w=800&q=80', NULL, 'Xe tay ga phong cách phiêu lưu địa hình Adventure, động cơ eSP+ 330cc mạnh mẽ và phuộc Showa cao cấp.', 166190000.00, 10, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(2, 'SH350i', 'Xe tay ga', 'https://images.unsplash.com/photo-1558980664-769d59546b3d?auto=format&fit=crop&w=800&q=80', NULL, 'Dẫn đầu phân khúc xe tay ga cao cấp dung tích lớn, công nghệ kiểm soát lực kéo HSTC và kết nối điện thoại thông minh.', 151390000.00, 12, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(3, 'Vario 160', 'Xe tay ga', 'https://images.unsplash.com/photo-1558980664-2506fca6bfc2?auto=format&fit=crop&w=800&q=80', NULL, 'Thiết kế thể thao hầm hố góc cạnh, khung dập hàn laser eSAF thế hệ mới cùng hệ thống phanh đĩa ABS an toàn.', 56690000.00, 20, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(4, 'Vario 125', 'Xe tay ga', 'https://images.unsplash.com/photo-1558981420-87aa92d0c641?auto=format&fit=crop&w=800&q=80', NULL, 'Phong cách thể thao trẻ trung linh hoạt trên phố, sàn để chân phẳng rộng rãi và cổng sạc USB tiện ích.', 41913818.00, 25, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(5, 'Air Blade 160/125', 'Xe tay ga', 'https://images.unsplash.com/photo-1558981806-ec527fa84c39?auto=format&fit=crop&w=800&q=80', NULL, 'Diện mạo thể thao cuốn hút, trang bị động cơ eSP+ 4 van êm ái bốc khỏe, đồng hồ LCD sắc nét.', 42404727.00, 30, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(6, 'Vision', 'Xe tay ga', 'https://images.unsplash.com/photo-1558981403-c5f9899a28bc?auto=format&fit=crop&w=800&q=80', NULL, 'Mẫu xe tay ga quốc dân với thiết kế thời trang, nhẹ nhàng, động cơ eSP thông minh và khóa SMART Key tiện lợi.', 31506545.00, 40, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(7, 'LEAD ABS', 'Xe tay ga', 'https://images.unsplash.com/photo-1568772585407-9361f9bf3a87?auto=format&fit=crop&w=800&q=80', NULL, 'Cốp chứa đồ U-box cực đại 37 lít, trang bị hệ thống phanh chống bó cứng ABS hiện đại và nắp bình xăng trước tiện lợi.', 39753818.00, 25, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(8, 'Sh mode 125', 'Xe tay ga', 'https://images.unsplash.com/photo-1558981408-db0ecd8a1ee4?auto=format&fit=crop&w=800&q=80', NULL, 'Chuẩn mực phong cách châu Âu thanh lịch, đường nét mềm mại sang trọng và phanh ABS bánh trước an toàn.', 59684727.00, 18, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(9, 'SH160i/125i', 'Xe tay ga', 'https://images.unsplash.com/photo-1449426468159-d96dbf08f19f?auto=format&fit=crop&w=800&q=80', NULL, 'Đỉnh cao phong cách sang trọng và đẳng cấp, trang bị đèn LED nổi bật và phanh ABS 2 kênh kết nối Bluetooth My Honda+.', 76670182.00, 20, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(10, 'Super Cub C125', 'Xe số', 'https://images.unsplash.com/photo-1558981854-3e9106c61216?auto=format&fit=crop&w=800&q=80', NULL, 'Huyền thoại phong cách Retro hoài niệm, chi tiết mạ chrome tinh xảo và khóa SMART Key thời thượng.', 87372000.00, 8, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(11, 'CT125', 'Xe số', 'https://images.unsplash.com/photo-1558981408-db0ecd8a1ee4?auto=format&fit=crop&w=800&q=80', NULL, 'Mẫu xe dã ngoại địa hình cá tính, ống xả vắt cao độc đáo, giá chở đồ rộng lớn sẵn sàng cho mọi chuyến cắm trại.', 85997455.00, 10, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(12, 'Future 125 FI', 'Xe số', 'https://images.unsplash.com/photo-1558980335-8e0c25f7f673?auto=format&fit=crop&w=800&q=80', NULL, 'Thiết kế cao cấp lịch lãm, đèn pha LED hiện đại, động cơ 125cc phun xăng điện tử PGM-FI siêu tiết kiệm nhiên liệu.', 30622909.00, 35, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(13, 'Wave Alpha phiên bản cổ điển', 'Xe số', 'https://images.unsplash.com/photo-1558981285-6f0c94958bb6?auto=format&fit=crop&w=800&q=80', NULL, 'Màu sắc retro hoài niệm bắt mắt, vận hành bền bỉ tiết kiệm xăng, người bạn đồng hành tin cậy trên mọi nẻo đường.', 19037455.00, 40, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(14, 'Blade', 'Xe số', 'https://images.unsplash.com/photo-1558981403-c5f9899a28bc?auto=format&fit=crop&w=800&q=80', NULL, 'Kiểu dáng thon gọn sắc sảo, cảm giác lái chắc chắn, linh hoạt luồn lách trên các cung đường đô thị đông đúc.', 18900000.00, 30, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(15, 'Wave Alpha 110', 'Xe số', 'https://images.unsplash.com/photo-1558981285-6f0c94958bb6?auto=format&fit=crop&w=800&q=80', NULL, 'Mẫu xe số quốc dân phổ thông, động cơ 110cc mạnh mẽ bền bỉ, chi phí sử dụng và bảo dưỡng tiết kiệm tối đa.', 17957455.00, 50, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(16, 'Wave RSX', 'Xe số', 'https://images.unsplash.com/photo-1558981359-219d6364c9c8?auto=format&fit=crop&w=800&q=80', NULL, 'Phong cách thể thao góc cạnh, mặt nạ trước hình chữ V sắc sảo, hệ thống phun xăng điện tử PGM-FI bền bỉ.', 22130182.00, 35, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(17, 'CBR150R', 'Xe côn tay', 'https://images.unsplash.com/photo-1558981420-87aa92d0c641?auto=format&fit=crop&w=800&q=80', NULL, 'Sportbike thuần chất trường đua, phuộc Upside Down Showa thể thao, bộ ly hợp hỗ trợ chống trượt Slipper Clutch.', 72290000.00, 15, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(18, 'WINNER R', 'Xe côn tay', 'https://images.unsplash.com/photo-1568772585407-9361f9bf3a87?auto=format&fit=crop&w=800&q=80', NULL, 'Thủ lĩnh xe côn tay 150cc DOHC 6 cấp số, phanh đĩa ABS trước chống trượt cùng thiết kế khí động học sắc sảo.', 46360000.00, 35, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(19, 'Gold Wing 2025', 'Xe phân khối lớn', 'https://images.unsplash.com/photo-1449426468159-d96dbf08f19f?auto=format&fit=crop&w=800&q=80', NULL, 'Chuyên cơ mặt đất hạng sang, động cơ 6 xi-lanh đối đỉnh 1833cc, hộp số DCT 7 cấp và túi khí bảo vệ độc quyền.', 1231500000.00, 3, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(20, 'CBR1000RR-R Fireblade SP 2024', 'Xe phân khối lớn', 'https://images.unsplash.com/photo-1558981403-c5f9899a28bc?auto=format&fit=crop&w=800&q=80', NULL, 'Siêu mô tô giải đua MotoGP thương mại, cánh gió khí động học, phuộc điện tử Ohlins Smart EC và phanh Brembo Stylema.', 1051000000.00, 2, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(21, 'Africa Twin 2026 - Bản Adventure Sports', 'Xe phân khối lớn', 'https://images.unsplash.com/photo-1558981408-db0ecd8a1ee4?auto=format&fit=crop&w=800&q=80', NULL, 'Chiến binh việt dã đỉnh cao bình xăng lớn 24.8L, phuộc điện tử Showa EERA, màn hình TFT cảm ứng 6.5 inch hỗ trợ Apple CarPlay.', 620990000.00, 4, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(22, 'Africa Twin 2026 - Bản Tiêu chuẩn', 'Xe phân khối lớn', 'https://images.unsplash.com/photo-1558981408-db0ecd8a1ee4?auto=format&fit=crop&w=800&q=80', NULL, 'Dòng Adventure đa địa hình cỗ máy 1.084cc xi-lanh đôi mạnh mẽ, hệ thống đo lường quán tính IMU 6 trục kiểm soát an toàn tối đa.', 540990000.00, 5, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(23, 'Rebel 1100 2025', 'Xe phân khối lớn', 'https://images.unsplash.com/photo-1558980664-769d59546b3d?auto=format&fit=crop&w=800&q=80', NULL, 'Cruiser phong trần lịch lãm khối động cơ 1.100cc uy lực, trang bị tùy chọn hộp số ly hợp kép DCT và ga tự động Cruise Control.', 399990000.00, 5, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(24, 'CB1000 Hornet', 'Xe phân khối lớn', 'https://images.unsplash.com/photo-1558981806-ec527fa84c39?auto=format&fit=crop&w=800&q=80', NULL, 'Naked-bike đường phố thế hệ mới, động cơ 4 xi-lanh thẳng hàng từ Fireblade, khung thép đôi đầm chắc và cụm đèn đôi LED sắc nhọn.', 339900000.00, 6, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(25, 'Transalp 2025', 'Xe phân khối lớn', 'https://images.unsplash.com/photo-1558981408-db0ecd8a1ee4?auto=format&fit=crop&w=800&q=80', NULL, 'Mẫu xe Adventure tầm trung 750cc linh hoạt bứt phá mọi hành trình từ nội đô đến những cung đường đèo núi hiểm trở.', 299990000.00, 8, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(26, 'CBR650R 2024', 'Xe phân khối lớn', 'https://images.unsplash.com/photo-1558981403-c5f9899a28bc?auto=format&fit=crop&w=800&q=80', NULL, 'Sportbike 4 xi-lanh gầm vang quyến rũ, thiết kế đầu đèn vuốt ngược thể thao, màn hình màu TFT kết nối thông minh RoadSync.', 264990000.00, 10, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(27, 'CB650R 2024', 'Xe phân khối lớn', 'https://images.unsplash.com/photo-1558981806-ec527fa84c39?auto=format&fit=crop&w=800&q=80', NULL, 'Phong cách Neo Sports Café lôi cuốn, cỗ máy 4 xi-lanh uy lực mượt mà, kiểm soát lực kéo HSTC an toàn khi tăng tốc.', 256990000.00, 10, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(28, 'GB350S', 'Xe phân khối lớn', 'https://images.unsplash.com/photo-1558981854-3e9106c61216?auto=format&fit=crop&w=800&q=80', NULL, 'Thiết kế Roadster cổ điển mộc mạc, động cơ xy-lanh đơn 348cc tiếng nổ trầm ấm đầy cảm xúc, tư thế ngồi thoải mái.', 134990000.00, 12, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(29, 'NX500', 'Xe phân khối lớn', 'https://images.unsplash.com/photo-1558981408-db0ecd8a1ee4?auto=format&fit=crop&w=800&q=80', NULL, 'Chiến binh Crossover Adventure tầm trung thay thế dòng CB500X huyền thoại, vành bánh nhẹ hơn và màn hình TFT hiển thị mới.', 194290000.00, 10, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(30, 'CBR500R 2024', 'Xe phân khối lớn', 'https://images.unsplash.com/photo-1558981420-87aa92d0c641?auto=format&fit=crop&w=800&q=80', NULL, 'Sportbike cỡ trung đậm chất khí động học thừa hưởng từ đàn anh Fireblade, phuộc hành trình ngược Upside Down Showa SFF-BP.', 192990000.00, 8, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(31, 'CB500 Hornet', 'Xe phân khối lớn', 'https://images.unsplash.com/photo-1558981806-ec527fa84c39?auto=format&fit=crop&w=800&q=80', NULL, 'Naked-bike dũng mãnh, động cơ 2 xi-lanh song song 471cc bốc khỏe, hệ thống kiểm soát lực kéo HSTC tối tân.', 184990000.00, 8, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(32, 'REBEL 500 2025', 'Xe phân khối lớn', 'https://images.unsplash.com/photo-1558980664-769d59546b3d?auto=format&fit=crop&w=800&q=80', NULL, 'Phong cách Bobber cơ bắp phong trần, chiều cao yên thấp 690mm dễ điều khiển, tiếng pô uy lực trầm ấm.', 181300000.00, 7, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56'),
	(33, 'CL500', 'Xe phân khối lớn', 'https://images.unsplash.com/photo-1558981408-db0ecd8a1ee4?auto=format&fit=crop&w=800&q=80', NULL, 'Phong cách Scrambler đường phố cá tính, ống xả đôi vắt cao cổ điển, lốp gai đa dụng tự tin chinh phục địa hình gồ ghề.', 180990000.00, 8, 0, '2024', NULL, '2026-10-06 02:21:56', '2026-10-06 02:21:56');

-- Dumping structure for table honda_motorbike.sessions
DROP TABLE IF EXISTS `sessions`;
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

-- Dumping data for table honda_motorbike.sessions: ~3 rows (approximately)
INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
	('OJ35fhcxRZ02rqlyqh8I5rphDDGJtx0TpA93R2zO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMkhGNUtFQkM5aDRMZjBjc01TTmdiV0pZNGJyamhNRDM5Ykc0WHQ0ZyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cy8xNiI7czo1OiJyb3V0ZSI7czoxMzoicHJvZHVjdHMuc2hvdyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1791379083),
	('UV6MRXMOC60y2StoFwg7AhHrN1p4rAQqoL3aQxmw', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Code/1.140.0 Chrome/150.0.7871.250 Electron/43.7.3 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTzI4ZWVXSjVweTdPTmVkRlVGYVZ1dHd1dmV6NGt6N29OSFZqUFRsQiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7czo1OiJyb3V0ZSI7czo0OiJob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1791378889),
	('VcFcNihT8KPnrRXhAEkivRnCHlP6KaoTHB03JzI8', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMEt4YTh3RURBUkU5MFA0d0hZZldqcVZEak8wMkRJSXQ5VGxMbHV1OCI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jYXJ0IjtzOjU6InJvdXRlIjtzOjEwOiJjYXJ0LmluZGV4Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo0OiJjYXJ0IjthOjE6e2k6MzI7YTo0OntzOjQ6Im5hbWUiO3M6MTQ6IlJFQkVMIDUwMCAyMDI1IjtzOjg6InF1YW50aXR5IjtpOjE7czo1OiJwcmljZSI7czoxMjoiMTgxMzAwMDAwLjAwIjtzOjU6ImltYWdlIjtzOjg5OiJodHRwczovL2ltYWdlcy51bnNwbGFzaC5jb20vcGhvdG8tMTU1ODk4MDY2NC03NjlkNTk1NDZiM2Q/YXV0bz1mb3JtYXQmZml0PWNyb3Amdz04MDAmcT04MCI7fX19', 1791255959);

-- Dumping structure for table honda_motorbike.users
DROP TABLE IF EXISTS `users`;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table honda_motorbike.users: ~2 rows (approximately)
INSERT INTO `users` (`id`, `name`, `email`, `phone`, `address`, `avatar`, `membership`, `membership_points`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Quản trị viên Honda', 'admin@honda.com', NULL, NULL, NULL, 'none', 0, NULL, '$2y$12$j9aZLTITWHgE/iOYjpkhq..i9vxTAsusrsfa8g8Vkhv6BjeZIWGae', 'admin', NULL, '2026-10-05 07:36:24', '2026-10-05 07:36:24'),
	(2, 'User', 'user@honda.com', NULL, NULL, NULL, 'none', 0, NULL, '$2y$12$Y5c0cT2uCDmQ5fSWsJCP2Ob04IVamaoHG5DO7OUbBU4guYS6FajkW', 'user', NULL, '2026-10-05 07:36:24', '2026-10-05 07:36:24');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
