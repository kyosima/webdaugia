-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 07, 2021 lúc 08:17 AM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `webdaugia`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, NULL),
(2, 0, 2, 'Admin', 'fa-tasks', '', NULL, NULL, NULL),
(3, 2, 3, 'Users', 'fa-users', 'auth/users', NULL, NULL, NULL),
(4, 2, 4, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, NULL),
(5, 2, 5, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, NULL),
(6, 2, 6, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, NULL),
(7, 2, 7, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, NULL),
(8, 0, 8, 'Users', 'fa-users', 'users', NULL, '2021-06-03 03:27:58', '2021-06-03 03:28:11'),
(9, 0, 12, 'Helpers', 'fa-gears', '', NULL, '2021-06-03 21:01:31', '2021-06-06 21:06:02'),
(10, 9, 13, 'Scaffold', 'fa-keyboard-o', 'helpers/scaffold', NULL, '2021-06-03 21:01:31', '2021-06-06 21:06:02'),
(11, 9, 14, 'Database terminal', 'fa-database', 'helpers/terminal/database', NULL, '2021-06-03 21:01:31', '2021-06-06 21:06:02'),
(12, 9, 15, 'Laravel artisan', 'fa-terminal', 'helpers/terminal/artisan', NULL, '2021-06-03 21:01:31', '2021-06-06 21:06:02'),
(13, 9, 16, 'Routes', 'fa-list-alt', 'helpers/routes', NULL, '2021-06-03 21:01:31', '2021-06-06 21:06:02'),
(14, 15, 10, 'Posts', 'fa-thumb-tack', '/posts', NULL, '2021-06-03 21:39:16', '2021-06-06 21:06:16'),
(15, 0, 9, 'Blog', 'fa-leanpub', '#', NULL, '2021-06-06 20:59:25', '2021-06-06 21:00:35'),
(16, 15, 11, 'Category', 'fa-bars', '/category', NULL, '2021-06-06 21:05:50', '2021-06-06 21:06:16');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_operation_log`
--

CREATE TABLE `admin_operation_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_operation_log`
--

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'GET', '::1', '[]', '2021-06-02 02:59:22', '2021-06-02 02:59:22'),
(2, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-02 02:59:42', '2021-06-02 02:59:42'),
(3, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-02 02:59:42', '2021-06-02 02:59:42'),
(4, 1, 'admin', 'GET', '::1', '[]', '2021-06-03 02:44:44', '2021-06-03 02:44:44'),
(5, 1, 'admin/auth/setting', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 02:44:59', '2021-06-03 02:44:59'),
(6, 1, 'admin/auth/setting', 'GET', '::1', '[]', '2021-06-03 02:47:55', '2021-06-03 02:47:55'),
(7, 1, 'admin/auth/setting', 'GET', '::1', '[]', '2021-06-03 02:50:58', '2021-06-03 02:50:58'),
(8, 1, 'admin/auth/setting', 'PUT', '::1', '{\"name\":\"Administrator\",\"password\":\"$2y$10$drtc8\\/RCNronPROYztCFJOkt\\/A0cDqYrMs0LV.ImX3GlfqoKK\\/FEq\",\"password_confirmation\":\"$2y$10$drtc8\\/RCNronPROYztCFJOkt\\/A0cDqYrMs0LV.ImX3GlfqoKK\\/FEq\",\"_token\":\"tc61xAmy92jkS32WeA466hwgUeRPsp8Kg3CJ1eud\",\"_method\":\"PUT\"}', '2021-06-03 02:51:21', '2021-06-03 02:51:21'),
(9, 1, 'admin/auth/setting', 'GET', '::1', '[]', '2021-06-03 02:51:22', '2021-06-03 02:51:22'),
(10, 1, 'admin/auth/setting', 'GET', '::1', '[]', '2021-06-03 02:51:41', '2021-06-03 02:51:41'),
(11, 1, 'admin/auth/setting', 'GET', '::1', '[]', '2021-06-03 02:52:33', '2021-06-03 02:52:33'),
(12, 1, 'admin/auth/setting', 'PUT', '::1', '{\"name\":\"Administrator\",\"password\":\"$2y$10$drtc8\\/RCNronPROYztCFJOkt\\/A0cDqYrMs0LV.ImX3GlfqoKK\\/FEq\",\"password_confirmation\":\"$2y$10$drtc8\\/RCNronPROYztCFJOkt\\/A0cDqYrMs0LV.ImX3GlfqoKK\\/FEq\",\"_token\":\"tc61xAmy92jkS32WeA466hwgUeRPsp8Kg3CJ1eud\",\"_method\":\"PUT\"}', '2021-06-03 02:53:05', '2021-06-03 02:53:05'),
(13, 1, 'admin/auth/setting', 'GET', '::1', '[]', '2021-06-03 02:53:06', '2021-06-03 02:53:06'),
(14, 1, 'admin/auth/setting', 'GET', '::1', '[]', '2021-06-03 02:53:34', '2021-06-03 02:53:34'),
(15, 1, 'admin/auth/setting', 'GET', '::1', '[]', '2021-06-03 02:53:43', '2021-06-03 02:53:43'),
(16, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 03:25:21', '2021-06-03 03:25:21'),
(17, 1, 'admin/auth/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 03:26:11', '2021-06-03 03:26:11'),
(18, 1, 'admin/auth/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 03:26:17', '2021-06-03 03:26:17'),
(19, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 03:26:20', '2021-06-03 03:26:20'),
(20, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"Users\",\"icon\":\"fa-users\",\"uri\":\"users\",\"roles\":[null],\"permission\":null,\"_token\":\"tc61xAmy92jkS32WeA466hwgUeRPsp8Kg3CJ1eud\"}', '2021-06-03 03:27:58', '2021-06-03 03:27:58'),
(21, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-03 03:27:58', '2021-06-03 03:27:58'),
(22, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-03 03:28:02', '2021-06-03 03:28:02'),
(23, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"tc61xAmy92jkS32WeA466hwgUeRPsp8Kg3CJ1eud\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":8}]\"}', '2021-06-03 03:28:11', '2021-06-03 03:28:11'),
(24, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 03:28:11', '2021-06-03 03:28:11'),
(25, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 03:28:13', '2021-06-03 03:28:13'),
(26, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-03 03:28:15', '2021-06-03 03:28:15'),
(27, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 03:28:18', '2021-06-03 03:28:18'),
(28, 1, 'admin/users', 'GET', '::1', '{\"_columns_\":\"created_at,email,id,name,password,updated_at\",\"_pjax\":\"#pjax-container\"}', '2021-06-03 03:29:33', '2021-06-03 03:29:33'),
(29, 1, 'admin/users/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 03:29:35', '2021-06-03 03:29:35'),
(30, 1, 'admin/users', 'POST', '::1', '{\"name\":\"meivvu\",\"email\":\"trantruong1797@gmail.com\",\"email_verified_at\":\"1797-01-01 00:00:00\",\"password\":\"@mevivucom@123\",\"remember_token\":null,\"_token\":\"tc61xAmy92jkS32WeA466hwgUeRPsp8Kg3CJ1eud\",\"after-save\":\"3\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/users?_columns_=created_at%2Cemail%2Cid%2Cname%2Cpassword%2Cupdated_at\"}', '2021-06-03 03:30:38', '2021-06-03 03:30:38'),
(31, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-03 03:30:40', '2021-06-03 03:30:40'),
(32, 1, 'admin/users', 'POST', '::1', '{\"name\":\"meivvu\",\"email\":\"trantruong1797@gmail.com\",\"email_verified_at\":\"1797-01-01 00:00:00\",\"password\":\"@mevivucom@123\",\"remember_token\":\"12345\",\"_token\":\"tc61xAmy92jkS32WeA466hwgUeRPsp8Kg3CJ1eud\"}', '2021-06-03 03:31:54', '2021-06-03 03:31:54'),
(33, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-03 03:31:54', '2021-06-03 03:31:54'),
(34, 1, 'admin/users', 'POST', '::1', '{\"name\":\"meivvu\",\"email\":\"trantruong1797@gmail.com\",\"email_verified_at\":\"2021-02-10 00:00:00\",\"password\":\"@mevivucom@123\",\"remember_token\":\"12345\",\"_token\":\"tc61xAmy92jkS32WeA466hwgUeRPsp8Kg3CJ1eud\"}', '2021-06-03 03:32:31', '2021-06-03 03:32:31'),
(35, 1, 'admin/users', 'GET', '::1', '[]', '2021-06-03 03:32:31', '2021-06-03 03:32:31'),
(36, 1, 'admin/users', 'GET', '::1', '{\"_columns_\":\"created_at,email,id,name,updated_at\",\"_pjax\":\"#pjax-container\"}', '2021-06-03 03:32:45', '2021-06-03 03:32:45'),
(37, 1, 'admin/users', 'GET', '::1', '{\"_columns_\":\"created_at,email,id,name,updated_at\"}', '2021-06-03 03:32:47', '2021-06-03 03:32:47'),
(38, 1, 'admin/users', 'GET', '::1', '{\"_columns_\":\"created_at,email,id,name,updated_at\"}', '2021-06-03 03:32:51', '2021-06-03 03:32:51'),
(39, 1, 'admin/users', 'GET', '::1', '{\"_columns_\":\"created_at,email,id,name,updated_at\",\"_pjax\":\"#pjax-container\"}', '2021-06-03 03:32:55', '2021-06-03 03:32:55'),
(40, 1, 'admin/users/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 03:33:32', '2021-06-03 03:33:32'),
(41, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 03:33:38', '2021-06-03 03:33:38'),
(42, 1, 'admin/users/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 03:33:41', '2021-06-03 03:33:41'),
(43, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 03:33:47', '2021-06-03 03:33:47'),
(44, 1, 'admin/users/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 03:33:50', '2021-06-03 03:33:50'),
(45, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 03:35:10', '2021-06-03 03:35:10'),
(46, 1, 'admin/users', 'GET', '::1', '[]', '2021-06-03 03:35:24', '2021-06-03 03:35:24'),
(47, 1, 'admin/users', 'GET', '::1', '[]', '2021-06-03 03:35:46', '2021-06-03 03:35:46'),
(48, 1, 'admin', 'GET', '::1', '[]', '2021-06-03 20:03:54', '2021-06-03 20:03:54'),
(49, 1, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 20:04:00', '2021-06-03 20:04:00'),
(50, 1, 'admin', 'GET', '::1', '[]', '2021-06-03 20:04:11', '2021-06-03 20:04:11'),
(51, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 20:04:23', '2021-06-03 20:04:23'),
(52, 1, 'admin/users', 'GET', '::1', '[]', '2021-06-03 20:35:10', '2021-06-03 20:35:10'),
(53, 1, 'admin/auth/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 20:37:31', '2021-06-03 20:37:31'),
(54, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 20:42:11', '2021-06-03 20:42:11'),
(55, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 20:45:46', '2021-06-03 20:45:46'),
(56, 1, 'admin/users/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 20:45:56', '2021-06-03 20:45:56'),
(57, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 20:50:25', '2021-06-03 20:50:25'),
(58, 1, 'admin', 'GET', '::1', '[]', '2021-06-03 21:01:36', '2021-06-03 21:01:36'),
(59, 1, 'admin/helpers/scaffold', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 21:01:40', '2021-06-03 21:01:40'),
(60, 1, 'admin/helpers/scaffold', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 21:01:40', '2021-06-03 21:01:40'),
(61, 1, 'admin/helpers/terminal/database', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 21:01:44', '2021-06-03 21:01:44'),
(62, 1, 'admin/helpers/scaffold', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 21:01:54', '2021-06-03 21:01:54'),
(63, 1, 'admin/helpers/scaffold', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 21:01:54', '2021-06-03 21:01:54'),
(64, 1, 'admin/helpers/routes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 21:02:02', '2021-06-03 21:02:02'),
(65, 1, 'admin/helpers/routes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 21:02:02', '2021-06-03 21:02:02'),
(66, 1, 'admin/helpers/scaffold', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 21:02:20', '2021-06-03 21:02:20'),
(67, 1, 'admin/helpers/terminal/database', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 21:02:26', '2021-06-03 21:02:26'),
(68, 1, 'admin/helpers/scaffold', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 21:05:08', '2021-06-03 21:05:08'),
(69, 1, 'admin/helpers/scaffold', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 21:05:08', '2021-06-03 21:05:08'),
(70, 1, 'admin/helpers/scaffold', 'POST', '::1', '{\"table_name\":\"posts\",\"model_name\":\"App\\\\Models\\\\Posts\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\PostsController\",\"create\":[\"migration\",\"model\",\"controller\",\"migrate\"],\"fields\":[{\"name\":\"title\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"desc_short\",\"type\":\"text\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"slug\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"body\",\"type\":\"text\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"avatar\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"soft_deletes\":\"on\",\"primary_key\":\"id\",\"_token\":\"JMOGFhh7Q9epAQICMZiacQaN6ObpR3E0ZXQKpnrd\"}', '2021-06-03 21:10:01', '2021-06-03 21:10:01'),
(71, 1, 'admin/helpers/scaffold', 'GET', '::1', '[]', '2021-06-03 21:10:02', '2021-06-03 21:10:02'),
(72, 1, 'admin/helpers/scaffold', 'POST', '::1', '{\"table_name\":\"posts\",\"model_name\":\"App\\\\Models\\\\Posts\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\PostsController\",\"create\":[\"migration\",\"model\",\"controller\",\"migrate\"],\"fields\":[{\"name\":\"title\",\"type\":\"string\",\"key\":null,\"default\":\"255\",\"comment\":null},{\"name\":\"desc_short\",\"type\":\"text\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"slug\",\"type\":\"string\",\"key\":null,\"default\":\"255\",\"comment\":null},{\"name\":\"body\",\"type\":\"text\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"avatar\",\"type\":\"string\",\"key\":null,\"default\":\"255\",\"comment\":null}],\"timestamps\":\"on\",\"soft_deletes\":\"on\",\"primary_key\":\"id\",\"_token\":\"JMOGFhh7Q9epAQICMZiacQaN6ObpR3E0ZXQKpnrd\"}', '2021-06-03 21:11:19', '2021-06-03 21:11:19'),
(73, 1, 'admin/helpers/scaffold', 'GET', '::1', '[]', '2021-06-03 21:11:19', '2021-06-03 21:11:19'),
(74, 1, 'admin/helpers/scaffold', 'POST', '::1', '{\"table_name\":\"posts\",\"model_name\":\"App\\\\Models\\\\Posts\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\PostsController\",\"create\":[\"migration\",\"model\",\"controller\",\"migrate\"],\"fields\":[{\"name\":\"title\",\"type\":\"string\",\"key\":null,\"default\":\"255\",\"comment\":null},{\"name\":\"desc_short\",\"type\":\"text\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"slug\",\"type\":\"string\",\"key\":null,\"default\":\"255\",\"comment\":null},{\"name\":\"body\",\"type\":\"text\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"avatar\",\"type\":\"string\",\"key\":null,\"default\":\"255\",\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"JMOGFhh7Q9epAQICMZiacQaN6ObpR3E0ZXQKpnrd\"}', '2021-06-03 21:12:21', '2021-06-03 21:12:21'),
(75, 1, 'admin/helpers/scaffold', 'GET', '::1', '[]', '2021-06-03 21:12:21', '2021-06-03 21:12:21'),
(76, 1, 'admin/helpers/scaffold', 'POST', '::1', '{\"table_name\":\"posts\",\"model_name\":\"App\\\\Models\\\\Posts\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\PostsController\",\"create\":[\"migration\",\"model\",\"controller\",\"migrate\"],\"fields\":[{\"name\":\"title\",\"type\":\"string\",\"key\":null,\"default\":\"255\",\"comment\":null},{\"name\":\"desc_short\",\"type\":\"text\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"slug\",\"type\":\"string\",\"key\":null,\"default\":\"255\",\"comment\":null},{\"name\":\"body\",\"type\":\"text\",\"nullable\":\"on\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"avatar\",\"type\":\"string\",\"key\":null,\"default\":\"255\",\"comment\":null}],\"timestamps\":\"on\",\"soft_deletes\":\"on\",\"primary_key\":\"id\",\"_token\":\"JMOGFhh7Q9epAQICMZiacQaN6ObpR3E0ZXQKpnrd\"}', '2021-06-03 21:20:27', '2021-06-03 21:20:27'),
(77, 1, 'admin/helpers/scaffold', 'GET', '::1', '[]', '2021-06-03 21:20:28', '2021-06-03 21:20:28'),
(78, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 21:32:20', '2021-06-03 21:32:20'),
(79, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 21:34:23', '2021-06-03 21:34:23'),
(80, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"Posts\",\"icon\":\"fa-thumb-tack\",\"uri\":\"\\/posts\",\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"JMOGFhh7Q9epAQICMZiacQaN6ObpR3E0ZXQKpnrd\"}', '2021-06-03 21:39:16', '2021-06-03 21:39:16'),
(81, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-03 21:39:16', '2021-06-03 21:39:16'),
(82, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"JMOGFhh7Q9epAQICMZiacQaN6ObpR3E0ZXQKpnrd\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":8},{\\\"id\\\":9,\\\"children\\\":[{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":12},{\\\"id\\\":13}]},{\\\"id\\\":14}]\"}', '2021-06-03 21:39:35', '2021-06-03 21:39:35'),
(83, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 21:39:36', '2021-06-03 21:39:36'),
(84, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 21:39:38', '2021-06-03 21:39:38'),
(85, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-03 21:39:40', '2021-06-03 21:39:40'),
(86, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 21:39:43', '2021-06-03 21:39:43'),
(87, 1, 'admin/posts/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 21:39:53', '2021-06-03 21:39:53'),
(88, 1, 'admin/auth/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 21:40:00', '2021-06-03 21:40:00'),
(89, 1, 'admin/auth/users/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 21:40:03', '2021-06-03 21:40:03'),
(90, 1, 'admin/auth/users/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 21:40:03', '2021-06-03 21:40:03'),
(91, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 21:44:26', '2021-06-03 21:44:26'),
(92, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 21:44:26', '2021-06-03 21:44:26'),
(93, 1, 'admin/posts/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 21:44:28', '2021-06-03 21:44:28'),
(94, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 21:44:39', '2021-06-03 21:44:39'),
(95, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-03 21:48:47', '2021-06-03 21:48:47'),
(96, 1, 'admin/posts/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 21:48:50', '2021-06-03 21:48:50'),
(97, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 21:51:29', '2021-06-03 21:51:29'),
(98, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 21:58:26', '2021-06-03 21:58:26'),
(99, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 21:58:55', '2021-06-03 21:58:55'),
(100, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 22:00:48', '2021-06-03 22:00:48'),
(101, 1, 'admin/auth/users', 'GET', '::1', '[]', '2021-06-03 22:01:09', '2021-06-03 22:01:09'),
(102, 1, 'admin/auth/users/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 22:01:12', '2021-06-03 22:01:12'),
(103, 1, 'admin/auth/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 22:01:19', '2021-06-03 22:01:19'),
(104, 1, 'admin/auth/users/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 22:01:22', '2021-06-03 22:01:22'),
(105, 1, 'admin/auth/users/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 22:01:31', '2021-06-03 22:01:31'),
(106, 1, 'admin/auth/roles', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 22:01:55', '2021-06-03 22:01:55'),
(107, 1, 'admin/auth/roles/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 22:01:57', '2021-06-03 22:01:57'),
(108, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 22:02:34', '2021-06-03 22:02:34'),
(109, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 22:03:15', '2021-06-03 22:03:15'),
(110, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 22:39:34', '2021-06-03 22:39:34'),
(111, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 23:00:16', '2021-06-03 23:00:16'),
(112, 1, 'admin/posts/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-03 23:00:18', '2021-06-03 23:00:18'),
(113, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 23:01:06', '2021-06-03 23:01:06'),
(114, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 23:01:18', '2021-06-03 23:01:18'),
(115, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 23:01:33', '2021-06-03 23:01:33'),
(116, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 23:01:37', '2021-06-03 23:01:37'),
(117, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 23:01:49', '2021-06-03 23:01:49'),
(118, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 23:01:56', '2021-06-03 23:01:56'),
(119, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 23:02:13', '2021-06-03 23:02:13'),
(120, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 23:02:17', '2021-06-03 23:02:17'),
(121, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 23:12:53', '2021-06-03 23:12:53'),
(122, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 23:13:07', '2021-06-03 23:13:07'),
(123, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 23:13:25', '2021-06-03 23:13:25'),
(124, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 23:13:36', '2021-06-03 23:13:36'),
(125, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 23:16:27', '2021-06-03 23:16:27'),
(126, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 23:17:03', '2021-06-03 23:17:03'),
(127, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 23:17:25', '2021-06-03 23:17:25'),
(128, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 23:18:49', '2021-06-03 23:18:49'),
(129, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 23:32:41', '2021-06-03 23:32:41'),
(130, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 23:43:35', '2021-06-03 23:43:35'),
(131, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 23:44:05', '2021-06-03 23:44:05'),
(132, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 23:44:56', '2021-06-03 23:44:56'),
(133, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 23:45:22', '2021-06-03 23:45:22'),
(134, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 23:45:41', '2021-06-03 23:45:41'),
(135, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 23:45:59', '2021-06-03 23:45:59'),
(136, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 23:46:26', '2021-06-03 23:46:26'),
(137, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 23:46:55', '2021-06-03 23:46:55'),
(138, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 23:48:33', '2021-06-03 23:48:33'),
(139, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-03 23:51:34', '2021-06-03 23:51:34'),
(140, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-04 01:35:33', '2021-06-04 01:35:33'),
(141, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-04 01:36:15', '2021-06-04 01:36:15'),
(142, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-04 01:36:28', '2021-06-04 01:36:28'),
(143, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-04 01:37:02', '2021-06-04 01:37:02'),
(144, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-04 01:39:57', '2021-06-04 01:39:57'),
(145, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-04 01:42:24', '2021-06-04 01:42:24'),
(146, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-04 01:43:44', '2021-06-04 01:43:44'),
(147, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-04 01:46:06', '2021-06-04 01:46:06'),
(148, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-04 01:46:14', '2021-06-04 01:46:14'),
(149, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-04 01:46:48', '2021-06-04 01:46:48'),
(150, 1, 'admin/posts', 'POST', '::1', '{\"title\":\"Home Page\",\"desc_short\":\"hello m\\u1ecdi ng\\u01b0\\u1eddi\",\"slug\":\"Home\",\"body\":\"<p>sfdsfds<\\/p>\",\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/storage\\/app\\/public\\/images\\/girl-2.jpg\",\"_token\":\"JMOGFhh7Q9epAQICMZiacQaN6ObpR3E0ZXQKpnrd\"}', '2021-06-04 01:50:39', '2021-06-04 01:50:39'),
(151, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-04 01:50:40', '2021-06-04 01:50:40'),
(152, 1, 'admin/posts/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-04 01:50:48', '2021-06-04 01:50:48'),
(153, 1, 'admin/posts/1', 'PUT', '::1', '{\"title\":\"Home Page\",\"desc_short\":\"hello m\\u1ecdi ng\\u01b0\\u1eddi\",\"slug\":\"Home\",\"body\":\"<p><img alt=\\\"\\\" src=\\\"http:\\/\\/localhost\\/webdaugia\\/storage\\/app\\/public\\/images\\/g1478__10__209cab3832334a3a83c861fb95e26db1_master.jpg\\\" style=\\\"height:1280px; width:1920px\\\" \\/>sfdsfds<\\/p>\",\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/storage\\/app\\/public\\/images\\/girl-2.jpg\",\"_token\":\"JMOGFhh7Q9epAQICMZiacQaN6ObpR3E0ZXQKpnrd\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/posts\"}', '2021-06-04 01:51:06', '2021-06-04 01:51:06'),
(154, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-04 01:51:07', '2021-06-04 01:51:07'),
(155, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-04 01:52:01', '2021-06-04 01:52:01'),
(156, 1, 'admin/posts/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-04 01:52:17', '2021-06-04 01:52:17'),
(157, 1, 'admin/posts/1/edit', 'GET', '::1', '[]', '2021-06-04 02:04:07', '2021-06-04 02:04:07'),
(158, 1, 'admin/posts/1/edit', 'GET', '::1', '[]', '2021-06-04 02:10:27', '2021-06-04 02:10:27'),
(159, 1, 'admin/posts/1/edit', 'GET', '::1', '[]', '2021-06-04 02:11:19', '2021-06-04 02:11:19'),
(160, 1, 'admin/posts/1/edit', 'GET', '::1', '[]', '2021-06-04 02:12:51', '2021-06-04 02:12:51'),
(161, 1, 'admin/posts/1/edit', 'GET', '::1', '[]', '2021-06-04 02:13:03', '2021-06-04 02:13:03'),
(162, 1, 'admin/posts/1/edit', 'GET', '::1', '[]', '2021-06-04 02:13:29', '2021-06-04 02:13:29'),
(163, 1, 'admin/posts/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-04 02:13:34', '2021-06-04 02:13:34'),
(164, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-04 02:14:09', '2021-06-04 02:14:09'),
(165, 1, 'admin/posts/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-04 02:14:14', '2021-06-04 02:14:14'),
(166, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-04 02:25:47', '2021-06-04 02:25:47'),
(167, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-04 02:26:09', '2021-06-04 02:26:09'),
(168, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-04 02:27:26', '2021-06-04 02:27:26'),
(169, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-04 02:37:24', '2021-06-04 02:37:24'),
(170, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-04 02:40:25', '2021-06-04 02:40:25'),
(171, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-04 02:47:38', '2021-06-04 02:47:38'),
(172, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"JMOGFhh7Q9epAQICMZiacQaN6ObpR3E0ZXQKpnrd\",\"slug\":\"Home Page\"}', '2021-06-04 02:47:50', '2021-06-04 02:47:50'),
(173, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"JMOGFhh7Q9epAQICMZiacQaN6ObpR3E0ZXQKpnrd\",\"slug\":\"Home P\"}', '2021-06-04 02:48:34', '2021-06-04 02:48:34'),
(174, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-04 03:00:37', '2021-06-04 03:00:37'),
(175, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"JMOGFhh7Q9epAQICMZiacQaN6ObpR3E0ZXQKpnrd\",\"slug\":\"Home\"}', '2021-06-04 03:00:45', '2021-06-04 03:00:45'),
(176, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"JMOGFhh7Q9epAQICMZiacQaN6ObpR3E0ZXQKpnrd\",\"slug\":\"Homes\"}', '2021-06-04 03:01:33', '2021-06-04 03:01:33'),
(177, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"JMOGFhh7Q9epAQICMZiacQaN6ObpR3E0ZXQKpnrd\",\"slug\":\"Home\"}', '2021-06-04 03:01:38', '2021-06-04 03:01:38'),
(178, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-04 03:01:40', '2021-06-04 03:01:40'),
(179, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"JMOGFhh7Q9epAQICMZiacQaN6ObpR3E0ZXQKpnrd\",\"slug\":\"Home\"}', '2021-06-04 03:01:47', '2021-06-04 03:01:47'),
(180, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"JMOGFhh7Q9epAQICMZiacQaN6ObpR3E0ZXQKpnrd\",\"slug\":\"Home d\"}', '2021-06-04 03:02:05', '2021-06-04 03:02:05'),
(181, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"JMOGFhh7Q9epAQICMZiacQaN6ObpR3E0ZXQKpnrd\",\"slug\":\"Home\"}', '2021-06-04 03:02:44', '2021-06-04 03:02:44'),
(182, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-04 03:03:15', '2021-06-04 03:03:15'),
(183, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"JMOGFhh7Q9epAQICMZiacQaN6ObpR3E0ZXQKpnrd\",\"slug\":\"Home\"}', '2021-06-04 03:03:27', '2021-06-04 03:03:27'),
(184, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"JMOGFhh7Q9epAQICMZiacQaN6ObpR3E0ZXQKpnrd\",\"slug\":\"s\"}', '2021-06-04 03:04:07', '2021-06-04 03:04:07'),
(185, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"JMOGFhh7Q9epAQICMZiacQaN6ObpR3E0ZXQKpnrd\",\"slug\":\"Home\"}', '2021-06-04 03:04:12', '2021-06-04 03:04:12'),
(186, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-04 03:05:21', '2021-06-04 03:05:21'),
(187, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"JMOGFhh7Q9epAQICMZiacQaN6ObpR3E0ZXQKpnrd\",\"slug\":\"Home\"}', '2021-06-04 03:05:29', '2021-06-04 03:05:29'),
(188, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-04 03:11:16', '2021-06-04 03:11:16'),
(189, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"JMOGFhh7Q9epAQICMZiacQaN6ObpR3E0ZXQKpnrd\",\"slug\":\"tr\\u01b0\\u1eddng em \\u0111\\u1eb9p l\\u1eafm\"}', '2021-06-04 03:11:26', '2021-06-04 03:11:26'),
(190, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"JMOGFhh7Q9epAQICMZiacQaN6ObpR3E0ZXQKpnrd\",\"slug\":\"Home\"}', '2021-06-04 03:11:32', '2021-06-04 03:11:32'),
(191, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-04 03:12:00', '2021-06-04 03:12:00'),
(192, 1, 'admin/posts/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-04 03:12:05', '2021-06-04 03:12:05'),
(193, 1, 'admin/posts/1/edit', 'GET', '::1', '[]', '2021-06-04 03:13:48', '2021-06-04 03:13:48'),
(194, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"JMOGFhh7Q9epAQICMZiacQaN6ObpR3E0ZXQKpnrd\",\"slug\":\"Home P\"}', '2021-06-04 03:13:55', '2021-06-04 03:13:55'),
(195, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"JMOGFhh7Q9epAQICMZiacQaN6ObpR3E0ZXQKpnrd\",\"slug\":\"Ch\\u00e0o t\\u1ea5t c\\u1ea3 m\\u1ecdi ng\\u01b0\\u1eddi\"}', '2021-06-04 03:14:14', '2021-06-04 03:14:14'),
(196, 1, 'admin/posts/1', 'PUT', '::1', '{\"title\":\"Ch\\u00e0o t\\u1ea5t c\\u1ea3 m\\u1ecdi ng\\u01b0\\u1eddi\",\"slug\":\"chao-tat-ca-moi-nguoi\",\"desc_short\":\"hello m\\u1ecdi ng\\u01b0\\u1eddi\",\"body\":\"<p><img alt=\\\"\\\" src=\\\"http:\\/\\/localhost\\/webdaugia\\/storage\\/app\\/public\\/images\\/g1478__10__209cab3832334a3a83c861fb95e26db1_master.jpg\\\" style=\\\"height:1280px; width:1920px\\\" \\/>sfdsfds<\\/p>\",\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/storage\\/app\\/public\\/images\\/girl-2.jpg\",\"_token\":\"JMOGFhh7Q9epAQICMZiacQaN6ObpR3E0ZXQKpnrd\",\"_method\":\"PUT\"}', '2021-06-04 03:14:23', '2021-06-04 03:14:23'),
(197, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-04 03:14:23', '2021-06-04 03:14:23'),
(198, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-04 03:15:10', '2021-06-04 03:15:10'),
(199, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-04 03:15:59', '2021-06-04 03:15:59'),
(200, 1, 'admin/posts/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-04 03:16:08', '2021-06-04 03:16:08'),
(201, 1, 'admin/posts/1/edit', 'GET', '::1', '[]', '2021-06-04 03:16:49', '2021-06-04 03:16:49'),
(202, 1, 'admin/posts/1/edit', 'GET', '::1', '[]', '2021-06-04 03:18:55', '2021-06-04 03:18:55'),
(203, 1, 'admin/posts/1/edit', 'GET', '::1', '[]', '2021-06-04 03:19:02', '2021-06-04 03:19:02'),
(204, 1, 'admin/posts/1/edit', 'GET', '::1', '[]', '2021-06-04 03:19:02', '2021-06-04 03:19:02'),
(205, 1, 'admin/posts/1/edit', 'GET', '::1', '[]', '2021-06-04 03:19:29', '2021-06-04 03:19:29'),
(206, 1, 'admin/posts/1/edit', 'GET', '::1', '[]', '2021-06-04 03:19:47', '2021-06-04 03:19:47'),
(207, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-04 03:20:48', '2021-06-04 03:20:48'),
(208, 1, 'admin', 'GET', '::1', '[]', '2021-06-06 19:07:10', '2021-06-06 19:07:10'),
(209, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 19:07:42', '2021-06-06 19:07:42'),
(210, 1, 'admin/posts/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 19:08:04', '2021-06-06 19:08:04'),
(211, 1, 'admin/posts/1/edit', 'GET', '::1', '[]', '2021-06-06 19:09:01', '2021-06-06 19:09:01'),
(212, 1, 'admin/posts/1/edit', 'GET', '::1', '[]', '2021-06-06 19:09:42', '2021-06-06 19:09:42'),
(213, 1, 'admin/posts/1/edit', 'GET', '::1', '[]', '2021-06-06 19:09:51', '2021-06-06 19:09:51'),
(214, 1, 'admin/posts/1/edit', 'GET', '::1', '[]', '2021-06-06 19:10:05', '2021-06-06 19:10:05'),
(215, 1, 'admin/posts/1/edit', 'GET', '::1', '[]', '2021-06-06 19:10:30', '2021-06-06 19:10:30'),
(216, 1, 'admin/posts/1/edit', 'GET', '::1', '[]', '2021-06-06 19:12:45', '2021-06-06 19:12:45'),
(217, 1, 'admin/posts/1/edit', 'GET', '::1', '[]', '2021-06-06 19:12:58', '2021-06-06 19:12:58'),
(218, 1, 'admin/posts/1/edit', 'GET', '::1', '[]', '2021-06-06 19:13:48', '2021-06-06 19:13:48'),
(219, 1, 'admin/posts/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 19:13:57', '2021-06-06 19:13:57'),
(220, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 19:13:59', '2021-06-06 19:13:59'),
(221, 1, 'admin/posts/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 19:14:01', '2021-06-06 19:14:01'),
(222, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 19:16:29', '2021-06-06 19:16:29'),
(223, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 19:17:49', '2021-06-06 19:17:49'),
(224, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 19:20:42', '2021-06-06 19:20:42'),
(225, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 19:20:53', '2021-06-06 19:20:53'),
(226, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 19:21:01', '2021-06-06 19:21:01'),
(227, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 19:21:39', '2021-06-06 19:21:39'),
(228, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 19:36:09', '2021-06-06 19:36:09'),
(229, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 19:36:25', '2021-06-06 19:36:25'),
(230, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 19:46:10', '2021-06-06 19:46:10'),
(231, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 19:46:32', '2021-06-06 19:46:32'),
(232, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 19:46:42', '2021-06-06 19:46:42'),
(233, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 19:46:53', '2021-06-06 19:46:53'),
(234, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 20:10:43', '2021-06-06 20:10:43'),
(235, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 20:11:47', '2021-06-06 20:11:47'),
(236, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 20:20:57', '2021-06-06 20:20:57'),
(237, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 20:23:57', '2021-06-06 20:23:57'),
(238, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 20:24:01', '2021-06-06 20:24:01'),
(239, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 20:24:21', '2021-06-06 20:24:21'),
(240, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 20:24:24', '2021-06-06 20:24:24'),
(241, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 20:26:20', '2021-06-06 20:26:20'),
(242, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 20:27:08', '2021-06-06 20:27:08'),
(243, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 20:27:41', '2021-06-06 20:27:41'),
(244, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 20:28:15', '2021-06-06 20:28:15'),
(245, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 20:28:25', '2021-06-06 20:28:25'),
(246, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 20:28:54', '2021-06-06 20:28:54'),
(247, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-06 20:37:59', '2021-06-06 20:37:59'),
(248, 1, 'admin/posts', 'GET', '::1', '{\"id\":\"0\",\"_pjax\":\"#pjax-container\"}', '2021-06-06 20:38:08', '2021-06-06 20:38:08'),
(249, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 20:38:18', '2021-06-06 20:38:18'),
(250, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-06 20:38:32', '2021-06-06 20:38:32'),
(251, 1, 'admin/posts', 'GET', '::1', '{\"title\":\"ch\\u00e0o\",\"_pjax\":\"#pjax-container\"}', '2021-06-06 20:38:40', '2021-06-06 20:38:40'),
(252, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 20:38:51', '2021-06-06 20:38:51'),
(253, 1, 'admin/posts', 'GET', '::1', '{\"title\":\"h\",\"_pjax\":\"#pjax-container\"}', '2021-06-06 20:38:57', '2021-06-06 20:38:57'),
(254, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 20:39:00', '2021-06-06 20:39:00'),
(255, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-06 20:39:50', '2021-06-06 20:39:50'),
(256, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-06 20:40:01', '2021-06-06 20:40:01'),
(257, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-06 20:41:17', '2021-06-06 20:41:17'),
(258, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-06 20:42:39', '2021-06-06 20:42:39'),
(259, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-06 20:44:19', '2021-06-06 20:44:19'),
(260, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 20:44:24', '2021-06-06 20:44:24'),
(261, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-06 20:44:44', '2021-06-06 20:44:44'),
(262, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-06 20:45:34', '2021-06-06 20:45:34'),
(263, 1, 'admin/posts', 'GET', '::1', '{\"ID\":null,\"title\":\"ch\\u00e0o\",\"_pjax\":\"#pjax-container\"}', '2021-06-06 20:46:19', '2021-06-06 20:46:19'),
(264, 1, 'admin/posts', 'GET', '::1', '{\"ID\":null,\"title\":\"ch\\u00e0o\"}', '2021-06-06 20:47:04', '2021-06-06 20:47:04'),
(265, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 20:47:11', '2021-06-06 20:47:11'),
(266, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"ID\":null,\"title\":\"ch\\u00e0o\"}', '2021-06-06 20:47:23', '2021-06-06 20:47:23'),
(267, 1, 'admin/posts/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 20:48:40', '2021-06-06 20:48:40'),
(268, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 20:48:54', '2021-06-06 20:48:54'),
(269, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 20:49:35', '2021-06-06 20:49:35'),
(270, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 20:49:51', '2021-06-06 20:49:51'),
(271, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 20:50:38', '2021-06-06 20:50:38'),
(272, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 20:51:03', '2021-06-06 20:51:03'),
(273, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 20:52:10', '2021-06-06 20:52:10'),
(274, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 20:53:15', '2021-06-06 20:53:15'),
(275, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-06 20:54:12', '2021-06-06 20:54:12'),
(276, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-06 20:56:04', '2021-06-06 20:56:04'),
(277, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 20:58:13', '2021-06-06 20:58:13'),
(278, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"Blog\",\"icon\":\"fa-leanpub\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"t6g31zRmljIsbbM3QnwrL2M04lcrx5TbtIJF35kj\"}', '2021-06-06 20:59:25', '2021-06-06 20:59:25'),
(279, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-06 20:59:26', '2021-06-06 20:59:26'),
(280, 1, 'admin/auth/menu/15/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 20:59:41', '2021-06-06 20:59:41'),
(281, 1, 'admin/auth/menu/15', 'PUT', '::1', '{\"parent_id\":\"0\",\"title\":\"Blog\",\"icon\":\"fa-leanpub\",\"uri\":\"#\",\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"t6g31zRmljIsbbM3QnwrL2M04lcrx5TbtIJF35kj\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/auth\\/menu\"}', '2021-06-06 20:59:50', '2021-06-06 20:59:50'),
(282, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-06 20:59:50', '2021-06-06 20:59:50'),
(283, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"t6g31zRmljIsbbM3QnwrL2M04lcrx5TbtIJF35kj\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":8},{\\\"id\\\":9,\\\"children\\\":[{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":12},{\\\"id\\\":13}]},{\\\"id\\\":15,\\\"children\\\":[{\\\"id\\\":14}]}]\"}', '2021-06-06 21:00:08', '2021-06-06 21:00:08'),
(284, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 21:00:08', '2021-06-06 21:00:08'),
(285, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 21:00:09', '2021-06-06 21:00:09'),
(286, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-06 21:00:14', '2021-06-06 21:00:14'),
(287, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"t6g31zRmljIsbbM3QnwrL2M04lcrx5TbtIJF35kj\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":8},{\\\"id\\\":15,\\\"children\\\":[{\\\"id\\\":14}]},{\\\"id\\\":9,\\\"children\\\":[{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":12},{\\\"id\\\":13}]}]\"}', '2021-06-06 21:00:35', '2021-06-06 21:00:35'),
(288, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"t6g31zRmljIsbbM3QnwrL2M04lcrx5TbtIJF35kj\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":8},{\\\"id\\\":15,\\\"children\\\":[{\\\"id\\\":14}]},{\\\"id\\\":9,\\\"children\\\":[{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":12},{\\\"id\\\":13}]}]\"}', '2021-06-06 21:00:35', '2021-06-06 21:00:35'),
(289, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 21:00:35', '2021-06-06 21:00:35'),
(290, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 21:00:35', '2021-06-06 21:00:35'),
(291, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-06 21:00:37', '2021-06-06 21:00:37'),
(292, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 21:00:45', '2021-06-06 21:00:45'),
(293, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 21:00:59', '2021-06-06 21:00:59'),
(294, 1, 'admin/auth/menu/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 21:02:37', '2021-06-06 21:02:37'),
(295, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 21:02:52', '2021-06-06 21:02:52'),
(296, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"15\",\"title\":\"Category\",\"icon\":\"fa-bars\",\"uri\":\"\\/category\",\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"t6g31zRmljIsbbM3QnwrL2M04lcrx5TbtIJF35kj\"}', '2021-06-06 21:05:50', '2021-06-06 21:05:50'),
(297, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-06 21:05:51', '2021-06-06 21:05:51'),
(298, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"t6g31zRmljIsbbM3QnwrL2M04lcrx5TbtIJF35kj\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":8},{\\\"id\\\":15,\\\"children\\\":[{\\\"id\\\":16},{\\\"id\\\":14}]},{\\\"id\\\":9,\\\"children\\\":[{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":12},{\\\"id\\\":13}]}]\"}', '2021-06-06 21:06:02', '2021-06-06 21:06:02'),
(299, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 21:06:02', '2021-06-06 21:06:02'),
(300, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 21:06:04', '2021-06-06 21:06:04'),
(301, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-06 21:06:06', '2021-06-06 21:06:06'),
(302, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"t6g31zRmljIsbbM3QnwrL2M04lcrx5TbtIJF35kj\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":8},{\\\"id\\\":15,\\\"children\\\":[{\\\"id\\\":14},{\\\"id\\\":16}]},{\\\"id\\\":9,\\\"children\\\":[{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":12},{\\\"id\\\":13}]}]\"}', '2021-06-06 21:06:15', '2021-06-06 21:06:15'),
(303, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 21:06:16', '2021-06-06 21:06:16'),
(304, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 21:06:17', '2021-06-06 21:06:17'),
(305, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-06 21:06:21', '2021-06-06 21:06:21'),
(306, 1, 'admin/helpers/scaffold', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 21:10:37', '2021-06-06 21:10:37'),
(307, 1, 'admin/helpers/scaffold', 'POST', '::1', '{\"table_name\":\"category_post\",\"model_name\":\"App\\\\Models\\\\Category_post\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\CategoryPostController\",\"create\":[\"migration\",\"model\",\"controller\",\"migrate\"],\"fields\":[{\"name\":\"name\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"slug\",\"type\":\"string\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"t6g31zRmljIsbbM3QnwrL2M04lcrx5TbtIJF35kj\"}', '2021-06-06 21:18:28', '2021-06-06 21:18:28'),
(308, 1, 'admin/helpers/scaffold', 'GET', '::1', '[]', '2021-06-06 21:18:33', '2021-06-06 21:18:33'),
(309, 1, 'admin/category', 'GET', '::1', '[]', '2021-06-06 21:20:06', '2021-06-06 21:20:06'),
(310, 1, 'admin/category', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 21:20:12', '2021-06-06 21:20:12'),
(311, 1, 'admin/category', 'GET', '::1', '[]', '2021-06-06 21:20:32', '2021-06-06 21:20:32'),
(312, 1, 'admin/category/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 21:20:35', '2021-06-06 21:20:35'),
(313, 1, 'admin/category', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 21:20:53', '2021-06-06 21:20:53'),
(314, 1, 'admin/category', 'GET', '::1', '[]', '2021-06-06 21:23:04', '2021-06-06 21:23:04'),
(315, 1, 'admin/category', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 21:23:34', '2021-06-06 21:23:34'),
(316, 1, 'admin/category', 'GET', '::1', '[]', '2021-06-06 21:23:36', '2021-06-06 21:23:36'),
(317, 1, 'admin/category', 'GET', '::1', '[]', '2021-06-06 21:23:36', '2021-06-06 21:23:36'),
(318, 1, 'admin/category', 'GET', '::1', '[]', '2021-06-06 21:24:03', '2021-06-06 21:24:03'),
(319, 1, 'admin/category', 'GET', '::1', '[]', '2021-06-06 21:24:54', '2021-06-06 21:24:54'),
(320, 1, 'admin/category', 'GET', '::1', '[]', '2021-06-06 21:26:25', '2021-06-06 21:26:25'),
(321, 1, 'admin/category/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 21:26:27', '2021-06-06 21:26:27'),
(322, 1, 'admin/category', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 21:26:33', '2021-06-06 21:26:33'),
(323, 1, 'admin/category/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 21:26:39', '2021-06-06 21:26:39'),
(324, 1, 'admin/category/create', 'GET', '::1', '[]', '2021-06-06 21:26:53', '2021-06-06 21:26:53'),
(325, 1, 'admin/category/create', 'GET', '::1', '[]', '2021-06-06 21:27:23', '2021-06-06 21:27:23'),
(326, 1, 'admin/category/create', 'GET', '::1', '[]', '2021-06-06 21:27:57', '2021-06-06 21:27:57'),
(327, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"t6g31zRmljIsbbM3QnwrL2M04lcrx5TbtIJF35kj\",\"slug\":\"truong\"}', '2021-06-06 21:28:04', '2021-06-06 21:28:04'),
(328, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"t6g31zRmljIsbbM3QnwrL2M04lcrx5TbtIJF35kj\",\"slug\":null}', '2021-06-06 21:28:24', '2021-06-06 21:28:24'),
(329, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"t6g31zRmljIsbbM3QnwrL2M04lcrx5TbtIJF35kj\",\"slug\":\"\\u0110\\u1eddi s\\u1ed1ng\"}', '2021-06-06 21:28:43', '2021-06-06 21:28:43'),
(330, 1, 'admin/category', 'POST', '::1', '{\"name\":\"\\u0110\\u1eddi s\\u1ed1ng\",\"slug\":\"doi-song\",\"_token\":\"t6g31zRmljIsbbM3QnwrL2M04lcrx5TbtIJF35kj\",\"after-save\":\"3\"}', '2021-06-06 21:28:49', '2021-06-06 21:28:49'),
(331, 1, 'admin/category/1', 'GET', '::1', '[]', '2021-06-06 21:28:49', '2021-06-06 21:28:49'),
(332, 1, 'admin/category', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 21:28:58', '2021-06-06 21:28:58'),
(333, 1, 'admin/category/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 21:30:37', '2021-06-06 21:30:37'),
(334, 1, 'admin/category', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 21:32:15', '2021-06-06 21:32:15'),
(335, 1, 'admin/category', 'GET', '::1', '[]', '2021-06-06 21:33:26', '2021-06-06 21:33:26'),
(336, 1, 'admin/category', 'GET', '::1', '[]', '2021-06-06 21:33:36', '2021-06-06 21:33:36'),
(337, 1, 'admin/category', 'GET', '::1', '[]', '2021-06-06 21:33:48', '2021-06-06 21:33:48'),
(338, 1, 'admin/helpers/scaffold', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 21:34:55', '2021-06-06 21:34:55'),
(339, 1, 'admin/helpers/scaffold', 'POST', '::1', '{\"table_name\":\"category_to_post\",\"model_name\":\"App\\\\Models\\\\\",\"controller_name\":\"App\\\\Admin\\\\Controllers\\\\\",\"create\":[\"migration\",\"migrate\"],\"fields\":[{\"name\":\"category_id\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":null},{\"name\":\"post_id\",\"type\":\"integer\",\"key\":null,\"default\":null,\"comment\":null}],\"timestamps\":\"on\",\"primary_key\":\"id\",\"_token\":\"t6g31zRmljIsbbM3QnwrL2M04lcrx5TbtIJF35kj\"}', '2021-06-06 21:36:14', '2021-06-06 21:36:14'),
(340, 1, 'admin/helpers/scaffold', 'GET', '::1', '[]', '2021-06-06 21:36:15', '2021-06-06 21:36:15'),
(341, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 21:51:00', '2021-06-06 21:51:00'),
(342, 1, 'admin/posts/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 21:51:02', '2021-06-06 21:51:02'),
(343, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-06 21:51:07', '2021-06-06 21:51:07'),
(344, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-06 21:54:13', '2021-06-06 21:54:13'),
(345, 1, 'admin/posts/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 21:54:15', '2021-06-06 21:54:15'),
(346, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 21:57:01', '2021-06-06 21:57:01'),
(347, 1, 'admin/posts/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 21:57:06', '2021-06-06 21:57:06'),
(348, 1, 'admin/posts/1', 'PUT', '::1', '{\"title\":\"Ch\\u00e0o t\\u1ea5t c\\u1ea3 m\\u1ecdi ng\\u01b0\\u1eddi\",\"slug\":\"chao-tat-ca-moi-nguoi\",\"desc_short\":\"hello m\\u1ecdi ng\\u01b0\\u1eddi\",\"body\":\"<p><img alt=\\\"\\\" src=\\\"http:\\/\\/localhost\\/webdaugia\\/storage\\/app\\/public\\/images\\/g1478__10__209cab3832334a3a83c861fb95e26db1_master.jpg\\\" style=\\\"height:1280px; width:1920px\\\" \\/>sfdsfds<\\/p>\",\"category\":[\"1\",null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/storage\\/app\\/public\\/images\\/girl-2.jpg\",\"_token\":\"t6g31zRmljIsbbM3QnwrL2M04lcrx5TbtIJF35kj\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/posts\"}', '2021-06-06 21:57:11', '2021-06-06 21:57:11'),
(349, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-06 21:57:11', '2021-06-06 21:57:11'),
(350, 1, 'admin/posts/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 21:57:15', '2021-06-06 21:57:15'),
(351, 1, 'admin/posts/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 21:57:39', '2021-06-06 21:57:39'),
(352, 1, 'admin/posts/1', 'GET', '::1', '[]', '2021-06-06 21:57:48', '2021-06-06 21:57:48'),
(353, 1, 'admin/posts/1', 'GET', '::1', '[]', '2021-06-06 21:59:37', '2021-06-06 21:59:37');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(354, 1, 'admin/posts/1', 'GET', '::1', '[]', '2021-06-06 22:00:21', '2021-06-06 22:00:21'),
(355, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 22:03:13', '2021-06-06 22:03:13'),
(356, 1, 'admin/posts/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 22:03:18', '2021-06-06 22:03:18'),
(357, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 22:03:21', '2021-06-06 22:03:21'),
(358, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-06 22:03:25', '2021-06-06 22:03:25'),
(359, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-06 22:03:25', '2021-06-06 22:03:25'),
(360, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-06 22:03:50', '2021-06-06 22:03:50'),
(361, 1, 'admin/posts/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 22:03:57', '2021-06-06 22:03:57'),
(362, 1, 'admin/category', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 22:04:00', '2021-06-06 22:04:00'),
(363, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 22:04:05', '2021-06-06 22:04:05'),
(364, 1, 'admin/posts/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 22:07:23', '2021-06-06 22:07:23'),
(365, 1, 'admin/posts/1', 'GET', '::1', '[]', '2021-06-06 22:07:30', '2021-06-06 22:07:30'),
(366, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 22:13:56', '2021-06-06 22:13:56'),
(367, 1, 'admin/posts/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 22:14:01', '2021-06-06 22:14:01'),
(368, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 22:16:15', '2021-06-06 22:16:15'),
(369, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 22:16:16', '2021-06-06 22:16:16'),
(370, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 22:16:17', '2021-06-06 22:16:17'),
(371, 1, 'admin/users/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 22:16:21', '2021-06-06 22:16:21'),
(372, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 22:16:26', '2021-06-06 22:16:26'),
(373, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"_export_\":\"page:1\"}', '2021-06-06 22:16:50', '2021-06-06 22:16:50'),
(374, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 22:17:14', '2021-06-06 22:17:14'),
(375, 1, 'admin/users/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 22:18:32', '2021-06-06 22:18:32'),
(376, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 22:18:57', '2021-06-06 22:18:57'),
(377, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 22:18:57', '2021-06-06 22:18:57'),
(378, 1, 'admin/category', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 22:47:18', '2021-06-06 22:47:18'),
(379, 1, 'admin/category', 'GET', '::1', '[]', '2021-06-06 22:47:58', '2021-06-06 22:47:58'),
(380, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 22:48:34', '2021-06-06 22:48:34'),
(381, 1, 'admin/users', 'GET', '::1', '[]', '2021-06-06 22:50:09', '2021-06-06 22:50:09'),
(382, 1, 'admin/users', 'GET', '::1', '[]', '2021-06-06 22:51:02', '2021-06-06 22:51:02'),
(383, 1, 'admin/users', 'GET', '::1', '[]', '2021-06-06 22:52:13', '2021-06-06 22:52:13'),
(384, 1, 'admin/users', 'GET', '::1', '[]', '2021-06-06 22:53:47', '2021-06-06 22:53:47'),
(385, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 22:54:05', '2021-06-06 22:54:05'),
(386, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 22:54:20', '2021-06-06 22:54:20'),
(387, 1, 'admin/posts/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 22:54:24', '2021-06-06 22:54:24'),
(388, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 22:54:32', '2021-06-06 22:54:32'),
(389, 1, 'admin/posts/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 22:54:33', '2021-06-06 22:54:33'),
(390, 1, 'admin/posts/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 22:54:33', '2021-06-06 22:54:33'),
(391, 1, 'admin/category', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 22:54:38', '2021-06-06 22:54:38'),
(392, 1, 'admin/category/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 22:54:40', '2021-06-06 22:54:40'),
(393, 1, 'admin/category', 'POST', '::1', '{\"name\":null,\"slug\":null,\"_token\":\"t6g31zRmljIsbbM3QnwrL2M04lcrx5TbtIJF35kj\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/category\"}', '2021-06-06 22:54:44', '2021-06-06 22:54:44'),
(394, 1, 'admin/category/create', 'GET', '::1', '[]', '2021-06-06 22:54:45', '2021-06-06 22:54:45'),
(395, 1, 'admin/category/create', 'GET', '::1', '[]', '2021-06-06 22:55:30', '2021-06-06 22:55:30'),
(396, 1, 'admin/category/create', 'GET', '::1', '[]', '2021-06-06 23:05:16', '2021-06-06 23:05:16'),
(397, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"t6g31zRmljIsbbM3QnwrL2M04lcrx5TbtIJF35kj\",\"slug\":\"\\u0110\\u1eddi s\\u1ed1ng\",\"type\":\"category_post\"}', '2021-06-06 23:05:23', '2021-06-06 23:05:23'),
(398, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"t6g31zRmljIsbbM3QnwrL2M04lcrx5TbtIJF35kj\",\"slug\":\"C\\u00e1 c\\u1ea3nh\",\"type\":\"category_post\"}', '2021-06-06 23:05:41', '2021-06-06 23:05:41'),
(399, 1, 'admin/category', 'POST', '::1', '{\"name\":\"C\\u00e1 c\\u1ea3nh\",\"slug\":\"ca-canh\",\"_token\":\"t6g31zRmljIsbbM3QnwrL2M04lcrx5TbtIJF35kj\"}', '2021-06-06 23:05:45', '2021-06-06 23:05:45'),
(400, 1, 'admin/category', 'GET', '::1', '[]', '2021-06-06 23:05:46', '2021-06-06 23:05:46'),
(401, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 23:05:50', '2021-06-06 23:05:50'),
(402, 1, 'admin/posts/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 23:05:55', '2021-06-06 23:05:55'),
(403, 1, 'admin/posts/1', 'PUT', '::1', '{\"title\":\"Ch\\u00e0o t\\u1ea5t c\\u1ea3 m\\u1ecdi ng\\u01b0\\u1eddi\",\"slug\":\"chao-tat-ca-moi-nguoi\",\"desc_short\":\"hello m\\u1ecdi ng\\u01b0\\u1eddi\",\"body\":\"<p><img alt=\\\"\\\" src=\\\"http:\\/\\/localhost\\/webdaugia\\/storage\\/app\\/public\\/images\\/g1478__10__209cab3832334a3a83c861fb95e26db1_master.jpg\\\" style=\\\"height:1280px; width:1920px\\\" \\/>sfdsfds<\\/p>\",\"category\":[\"1\",\"2\",null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/storage\\/app\\/public\\/images\\/girl-2.jpg\",\"_token\":\"t6g31zRmljIsbbM3QnwrL2M04lcrx5TbtIJF35kj\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/posts\"}', '2021-06-06 23:06:46', '2021-06-06 23:06:46'),
(404, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-06 23:06:46', '2021-06-06 23:06:46'),
(405, 1, 'admin/posts/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 23:06:51', '2021-06-06 23:06:51'),
(406, 1, 'admin/posts/1', 'PUT', '::1', '{\"title\":\"Ch\\u00e0o t\\u1ea5t c\\u1ea3 m\\u1ecdi ng\\u01b0\\u1eddi\",\"slug\":\"chao-tat-ca-moi-nguoi\",\"desc_short\":\"hello m\\u1ecdi ng\\u01b0\\u1eddi\",\"body\":\"<p><img alt=\\\"\\\" src=\\\"http:\\/\\/localhost\\/webdaugia\\/storage\\/app\\/public\\/images\\/g1478__10__209cab3832334a3a83c861fb95e26db1_master.jpg\\\" style=\\\"height:1280px; width:1920px\\\" \\/>sfdsfds<\\/p>\",\"category\":[\"1\",null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/storage\\/app\\/public\\/images\\/girl-2.jpg\",\"_token\":\"t6g31zRmljIsbbM3QnwrL2M04lcrx5TbtIJF35kj\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/posts\"}', '2021-06-06 23:07:03', '2021-06-06 23:07:03'),
(407, 1, 'admin/posts/1/edit', 'GET', '::1', '[]', '2021-06-06 23:07:04', '2021-06-06 23:07:04'),
(408, 1, 'admin/posts/1/edit', 'GET', '::1', '[]', '2021-06-06 23:07:31', '2021-06-06 23:07:31'),
(409, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 23:07:36', '2021-06-06 23:07:36'),
(410, 1, 'admin/posts/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 23:07:37', '2021-06-06 23:07:37'),
(411, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 23:10:47', '2021-06-06 23:10:47'),
(412, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 23:11:02', '2021-06-06 23:11:02'),
(413, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-06 23:11:03', '2021-06-06 23:11:03'),
(414, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"t6g31zRmljIsbbM3QnwrL2M04lcrx5TbtIJF35kj\",\"slug\":\"Cu\\u1ed9c s\\u1ed1ng m\\u00e0u h\\u1ed3ng\",\"type\":\"post\"}', '2021-06-06 23:12:03', '2021-06-06 23:12:03'),
(415, 1, 'admin/posts', 'POST', '::1', '{\"title\":\"Cu\\u1ed9c s\\u1ed1ng m\\u00e0u h\\u1ed3ng\",\"slug\":\"cuoc-song-mau-hong\",\"desc_short\":\"S\\u1ed1ng t\\u1ed1t m\\u1ed7i ng\\u00e0y\",\"body\":null,\"category\":[\"1\",null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/storage\\/app\\/public\\/images\\/d25288e8b14644181d57.jpg\",\"_token\":\"t6g31zRmljIsbbM3QnwrL2M04lcrx5TbtIJF35kj\"}', '2021-06-06 23:12:22', '2021-06-06 23:12:22'),
(416, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-06 23:12:22', '2021-06-06 23:12:22'),
(417, 1, 'admin/posts/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 23:12:28', '2021-06-06 23:12:28'),
(418, 1, 'admin/posts/2/edit', 'GET', '::1', '[]', '2021-06-06 23:12:32', '2021-06-06 23:12:32'),
(419, 1, 'admin/posts/2/edit', 'GET', '::1', '[]', '2021-06-06 23:12:33', '2021-06-06 23:12:33'),
(420, 1, 'admin/posts/2/edit', 'GET', '::1', '[]', '2021-06-06 23:12:37', '2021-06-06 23:12:37'),
(421, 1, 'admin/posts/2/edit', 'GET', '::1', '[]', '2021-06-06 23:12:45', '2021-06-06 23:12:45'),
(422, 1, 'admin/posts/2/edit', 'GET', '::1', '[]', '2021-06-06 23:12:45', '2021-06-06 23:12:45'),
(423, 1, 'admin/posts/2/edit', 'GET', '::1', '[]', '2021-06-06 23:12:45', '2021-06-06 23:12:45'),
(424, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 23:13:39', '2021-06-06 23:13:39'),
(425, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 23:13:45', '2021-06-06 23:13:45'),
(426, 1, 'admin/category', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 23:13:53', '2021-06-06 23:13:53'),
(427, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 23:13:57', '2021-06-06 23:13:57'),
(428, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 23:13:57', '2021-06-06 23:13:57'),
(429, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 23:14:01', '2021-06-06 23:14:01'),
(430, 1, 'admin/users', 'GET', '::1', '[]', '2021-06-06 23:14:43', '2021-06-06 23:14:43'),
(431, 1, 'admin/category', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 23:14:48', '2021-06-06 23:14:48'),
(432, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 23:15:28', '2021-06-06 23:15:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1, 'All permission', '*', '', '*', NULL, NULL),
(2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
(3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
(4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL),
(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL),
(6, 'Admin helpers', 'ext.helpers', '', '/helpers/*', '2021-06-03 21:01:31', '2021-06-03 21:01:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', '2021-06-02 02:45:28', '2021-06-02 02:45:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_role_menu`
--

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_role_menu`
--

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL),
(1, 14, NULL, NULL),
(1, 15, NULL, NULL),
(1, 16, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_role_permissions`
--

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_role_permissions`
--

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_role_users`
--

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_role_users`
--

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$drtc8/RCNronPROYztCFJOkt/A0cDqYrMs0LV.ImX3GlfqoKK/FEq', 'Administrator', 'images/g1478__10__209cab3832334a3a83c861fb95e26db1_master.jpg', '35NYS32JayIofjVmyFkMAh2tUyaOj3uo3eZEBCC7Xwyoahdg52wt1274jHC9', '2021-06-02 02:45:28', '2021-06-03 02:53:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_user_permissions`
--

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_post`
--

CREATE TABLE `category_post` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category_post`
--

INSERT INTO `category_post` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Đời sống', 'doi-song', '2021-06-06 21:28:49', '2021-06-06 21:28:49'),
(2, 'Cá cảnh', 'ca-canh', '2021-06-06 23:05:45', '2021-06-06 23:05:45');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_to_post`
--

CREATE TABLE `category_to_post` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category_to_post`
--

INSERT INTO `category_to_post` (`id`, `category_id`, `post_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(3, 1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_04_173148_create_admin_tables', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2021_06_04_042027_create_posts_table', 2),
(6, '2021_06_07_041828_create_category_post_table', 3),
(7, '2021_06_07_043614_create_category_to_post_table', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc_short` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `title`, `desc_short`, `slug`, `body`, `avatar`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Chào tất cả mọi người', 'hello mọi người', 'chao-tat-ca-moi-nguoi', '<p><img alt=\"\" src=\"http://localhost/webdaugia/storage/app/public/images/g1478__10__209cab3832334a3a83c861fb95e26db1_master.jpg\" style=\"height:1280px; width:1920px\" />sfdsfds</p>', 'http://localhost/webdaugia/storage/app/public/images/girl-2.jpg', '2021-06-04 01:50:40', '2021-06-04 03:14:23', NULL),
(2, 'Cuộc sống màu hồng', 'Sống tốt mỗi ngày', 'cuoc-song-mau-hong', NULL, 'http://localhost/webdaugia/storage/app/public/images/d25288e8b14644181d57.jpg', '2021-06-06 23:12:22', '2021-06-06 23:12:22', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'meivvu', 'trantruong1797@gmail.com', '2021-02-09 17:00:00', '@mevivucom@123', '12345', '2021-06-03 03:32:31', '2021-06-03 03:32:31');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_operation_log_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_name_unique` (`name`),
  ADD UNIQUE KEY `admin_permissions_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_roles_name_unique` (`name`),
  ADD UNIQUE KEY `admin_roles_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `admin_role_menu`
--
ALTER TABLE `admin_role_menu`
  ADD KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- Chỉ mục cho bảng `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  ADD KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- Chỉ mục cho bảng `admin_role_users`
--
ALTER TABLE `admin_role_users`
  ADD KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`);

--
-- Chỉ mục cho bảng `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_username_unique` (`username`);

--
-- Chỉ mục cho bảng `admin_user_permissions`
--
ALTER TABLE `admin_user_permissions`
  ADD KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- Chỉ mục cho bảng `category_post`
--
ALTER TABLE `category_post`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category_to_post`
--
ALTER TABLE `category_to_post`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=433;

--
-- AUTO_INCREMENT cho bảng `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `category_post`
--
ALTER TABLE `category_post`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `category_to_post`
--
ALTER TABLE `category_to_post`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
