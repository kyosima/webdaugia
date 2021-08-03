-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 24, 2021 lúc 06:43 AM
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
(2, 0, 2, 'Admin', 'fa-tasks', '', NULL, NULL, '2021-06-08 21:38:53'),
(3, 2, 3, 'Users', 'fa-users', 'auth/users', NULL, NULL, '2021-06-08 21:38:53'),
(4, 2, 4, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, '2021-06-08 21:38:53'),
(5, 2, 5, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, '2021-06-08 21:38:53'),
(6, 2, 6, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, '2021-06-08 21:38:53'),
(7, 2, 7, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, '2021-06-08 21:38:53'),
(8, 0, 8, 'Quản lý đại lý', 'fa-users', 'users', NULL, '2021-06-03 03:27:58', '2021-06-22 07:27:45'),
(9, 0, 12, 'Helpers', 'fa-gears', '', NULL, '2021-06-03 21:01:31', '2021-06-10 06:21:52'),
(10, 9, 13, 'Scaffold', 'fa-keyboard-o', 'helpers/scaffold', NULL, '2021-06-03 21:01:31', '2021-06-10 06:21:52'),
(11, 9, 14, 'Database terminal', 'fa-database', 'helpers/terminal/database', NULL, '2021-06-03 21:01:31', '2021-06-10 06:21:52'),
(12, 9, 15, 'Laravel artisan', 'fa-terminal', 'helpers/terminal/artisan', NULL, '2021-06-03 21:01:31', '2021-06-10 06:21:52'),
(13, 9, 16, 'Routes', 'fa-list-alt', 'helpers/routes', NULL, '2021-06-03 21:01:31', '2021-06-10 06:21:52'),
(14, 15, 10, 'Bài viết', 'fa-thumb-tack', '/posts', NULL, '2021-06-03 21:39:16', '2021-06-21 03:29:20'),
(15, 0, 9, 'Blog', 'fa-leanpub', '#', NULL, '2021-06-06 20:59:25', '2021-06-10 06:21:52'),
(16, 15, 11, 'Danh mục', 'fa-bars', '/category', NULL, '2021-06-06 21:05:50', '2021-06-20 05:58:27');

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
(432, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-06 23:15:28', '2021-06-06 23:15:28'),
(433, 1, 'admin', 'GET', '::1', '[]', '2021-06-07 23:35:01', '2021-06-07 23:35:01'),
(434, 1, 'admin', 'GET', '::1', '[]', '2021-06-07 23:35:09', '2021-06-07 23:35:09'),
(435, 1, 'admin/category', 'GET', '::1', '[]', '2021-06-07 23:35:17', '2021-06-07 23:35:17'),
(436, 1, 'admin', 'GET', '::1', '[]', '2021-06-08 21:03:53', '2021-06-08 21:03:53'),
(437, 1, 'admin', 'GET', '::1', '[]', '2021-06-08 21:04:11', '2021-06-08 21:04:11'),
(438, 1, 'admin', 'GET', '::1', '[]', '2021-06-08 21:08:08', '2021-06-08 21:08:08'),
(439, 1, 'admin', 'GET', '::1', '[]', '2021-06-08 21:08:53', '2021-06-08 21:08:53'),
(440, 1, 'admin', 'GET', '::1', '[]', '2021-06-08 21:21:06', '2021-06-08 21:21:06'),
(441, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-08 21:21:10', '2021-06-08 21:21:10'),
(442, 1, 'admin/category', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-08 21:21:17', '2021-06-08 21:21:17'),
(443, 1, 'admin/category', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-08 21:21:20', '2021-06-08 21:21:20'),
(444, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-08 21:21:22', '2021-06-08 21:21:22'),
(445, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-08 21:24:33', '2021-06-08 21:24:33'),
(446, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-08 21:28:22', '2021-06-08 21:28:22'),
(447, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-08 21:28:23', '2021-06-08 21:28:23'),
(448, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-08 21:28:25', '2021-06-08 21:28:25'),
(449, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-08 21:29:22', '2021-06-08 21:29:22'),
(450, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"S\\u1ea3n ph\\u1ea9m\",\"icon\":\"fa-dropbox\",\"uri\":null,\"roles\":[null],\"permission\":\"*\",\"_token\":\"DQFMq9xsFBJXjVS53iBIRwwLore2dbpeChfq2iYY\"}', '2021-06-08 21:30:33', '2021-06-08 21:30:33'),
(451, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-08 21:30:33', '2021-06-08 21:30:33'),
(452, 1, 'admin/auth/menu/17/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-08 21:30:42', '2021-06-08 21:30:42'),
(453, 1, 'admin/auth/menu/17', 'PUT', '::1', '{\"parent_id\":\"0\",\"title\":\"S\\u1ea3n ph\\u1ea9m\",\"icon\":\"fa-dropbox\",\"uri\":null,\"roles\":[null],\"permission\":\"*\",\"_token\":\"DQFMq9xsFBJXjVS53iBIRwwLore2dbpeChfq2iYY\",\"after-save\":\"2\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8080\\/webdaugia\\/admin\\/auth\\/menu\"}', '2021-06-08 21:30:56', '2021-06-08 21:30:56'),
(454, 1, 'admin/auth/menu/create', 'GET', '::1', '[]', '2021-06-08 21:30:56', '2021-06-08 21:30:56'),
(455, 1, 'admin/auth/menu/create/edit', 'GET', '::1', '[]', '2021-06-08 21:30:57', '2021-06-08 21:30:57'),
(456, 1, 'admin/auth/menu/17/edit', 'GET', '::1', '[]', '2021-06-08 21:30:57', '2021-06-08 21:30:57'),
(457, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-08 21:31:00', '2021-06-08 21:31:00'),
(458, 1, 'admin/auth/menu/17', 'DELETE', '::1', '{\"_method\":\"delete\",\"_token\":\"DQFMq9xsFBJXjVS53iBIRwwLore2dbpeChfq2iYY\"}', '2021-06-08 21:31:06', '2021-06-08 21:31:06'),
(459, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-08 21:31:07', '2021-06-08 21:31:07'),
(460, 1, 'admin/auth/menu/15/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-08 21:31:37', '2021-06-08 21:31:37'),
(461, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-08 21:31:45', '2021-06-08 21:31:45'),
(462, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"S\\u1ea3n ph\\u1ea9m\",\"icon\":\"fa-dropbox\",\"uri\":\"#\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"DQFMq9xsFBJXjVS53iBIRwwLore2dbpeChfq2iYY\"}', '2021-06-08 21:32:14', '2021-06-08 21:32:14'),
(463, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-08 21:32:14', '2021-06-08 21:32:14'),
(464, 1, 'admin/auth/menu/15/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-08 21:32:21', '2021-06-08 21:32:21'),
(465, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-08 21:32:32', '2021-06-08 21:32:32'),
(466, 1, 'admin/auth/menu/18/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-08 21:32:35', '2021-06-08 21:32:35'),
(467, 1, 'admin/auth/menu/18', 'PUT', '::1', '{\"parent_id\":\"0\",\"title\":\"S\\u1ea3n ph\\u1ea9m\",\"icon\":\"fa-dropbox\",\"uri\":\"#\",\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"DQFMq9xsFBJXjVS53iBIRwwLore2dbpeChfq2iYY\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8080\\/webdaugia\\/admin\\/auth\\/menu\"}', '2021-06-08 21:32:49', '2021-06-08 21:32:49'),
(468, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-08 21:32:50', '2021-06-08 21:32:50'),
(469, 1, 'admin/auth/menu/18', 'DELETE', '::1', '{\"_method\":\"delete\",\"_token\":\"DQFMq9xsFBJXjVS53iBIRwwLore2dbpeChfq2iYY\"}', '2021-06-08 21:33:38', '2021-06-08 21:33:38'),
(470, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-08 21:33:38', '2021-06-08 21:33:38'),
(471, 1, 'admin/auth/menu/15/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-08 21:33:42', '2021-06-08 21:33:42'),
(472, 1, 'admin/auth/menu/15', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-08 21:34:00', '2021-06-08 21:34:00'),
(473, 1, 'admin/auth/menu/15/edit', 'GET', '::1', '[]', '2021-06-08 21:34:00', '2021-06-08 21:34:00'),
(474, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-08 21:34:02', '2021-06-08 21:34:02'),
(475, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"S\\u1ea3n ph\\u1ea9m\",\"icon\":\"fa-dropbox\",\"uri\":\"#\",\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"DQFMq9xsFBJXjVS53iBIRwwLore2dbpeChfq2iYY\"}', '2021-06-08 21:34:28', '2021-06-08 21:34:28'),
(476, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-08 21:34:28', '2021-06-08 21:34:28'),
(477, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"19\",\"title\":\"T\\u1ea5t c\\u1ea3 s\\u1ea3n ph\\u1ea9m\",\"icon\":\"fa-bars\",\"uri\":\"products\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"DQFMq9xsFBJXjVS53iBIRwwLore2dbpeChfq2iYY\"}', '2021-06-08 21:37:55', '2021-06-08 21:37:55'),
(478, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-08 21:37:55', '2021-06-08 21:37:55'),
(479, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"19\",\"title\":\"Th\\u00eam s\\u1ea3n ph\\u1ea9m m\\u1edbi\",\"icon\":\"fa-plus\",\"uri\":\"products\\/create\",\"roles\":[\"1\",null],\"permission\":\"*\",\"_token\":\"DQFMq9xsFBJXjVS53iBIRwwLore2dbpeChfq2iYY\"}', '2021-06-08 21:38:28', '2021-06-08 21:38:28'),
(480, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-08 21:38:28', '2021-06-08 21:38:28'),
(481, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-08 21:38:39', '2021-06-08 21:38:39'),
(482, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"DQFMq9xsFBJXjVS53iBIRwwLore2dbpeChfq2iYY\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":19,\\\"children\\\":[{\\\"id\\\":20},{\\\"id\\\":21}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":8},{\\\"id\\\":15,\\\"children\\\":[{\\\"id\\\":14},{\\\"id\\\":16}]},{\\\"id\\\":9,\\\"children\\\":[{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":12},{\\\"id\\\":13}]}]\"}', '2021-06-08 21:38:46', '2021-06-08 21:38:46'),
(483, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-08 21:38:46', '2021-06-08 21:38:46'),
(484, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"DQFMq9xsFBJXjVS53iBIRwwLore2dbpeChfq2iYY\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":8},{\\\"id\\\":19,\\\"children\\\":[{\\\"id\\\":20},{\\\"id\\\":21}]},{\\\"id\\\":15,\\\"children\\\":[{\\\"id\\\":14},{\\\"id\\\":16}]},{\\\"id\\\":9,\\\"children\\\":[{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":12},{\\\"id\\\":13}]}]\"}', '2021-06-08 21:38:52', '2021-06-08 21:38:52'),
(485, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-08 21:38:53', '2021-06-08 21:38:53'),
(486, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-08 21:38:54', '2021-06-08 21:38:54'),
(487, 1, 'admin/products', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-08 21:38:57', '2021-06-08 21:38:57'),
(488, 1, 'admin/products/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-08 21:39:15', '2021-06-08 21:39:15'),
(489, 1, 'admin/products/create', 'GET', '::1', '[]', '2021-06-08 21:56:29', '2021-06-08 21:56:29'),
(490, 1, 'admin/products/create', 'GET', '::1', '[]', '2021-06-08 21:56:41', '2021-06-08 21:56:41'),
(491, 1, 'admin/products/create', 'GET', '::1', '[]', '2021-06-08 22:05:59', '2021-06-08 22:05:59'),
(492, 1, 'admin/products/create', 'GET', '::1', '[]', '2021-06-08 22:07:41', '2021-06-08 22:07:41'),
(493, 1, 'admin/products/create', 'GET', '::1', '[]', '2021-06-08 22:09:19', '2021-06-08 22:09:19'),
(494, 1, 'admin/products/create', 'GET', '::1', '[]', '2021-06-08 22:09:21', '2021-06-08 22:09:21'),
(495, 1, 'admin/products/create', 'GET', '::1', '[]', '2021-06-08 22:09:22', '2021-06-08 22:09:22'),
(496, 1, 'admin/products/create', 'GET', '::1', '[]', '2021-06-08 22:13:25', '2021-06-08 22:13:25'),
(497, 1, 'admin/products/create', 'GET', '::1', '[]', '2021-06-08 22:13:35', '2021-06-08 22:13:35'),
(498, 1, 'admin/products/create', 'GET', '::1', '[]', '2021-06-08 22:15:41', '2021-06-08 22:15:41'),
(499, 1, 'admin/auth/login', 'POST', '::1', '{\"username\":\"admin\",\"password\":\"admun\",\"remember\":\"1\",\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\"}', '2021-06-10 06:21:04', '2021-06-10 06:21:04'),
(500, 1, 'admin/auth/login', 'GET', '::1', '[]', '2021-06-10 06:21:04', '2021-06-10 06:21:04'),
(501, 1, 'admin', 'GET', '::1', '[]', '2021-06-10 06:21:05', '2021-06-10 06:21:05'),
(502, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 06:21:10', '2021-06-10 06:21:10'),
(503, 1, 'admin/users', 'GET', '::1', '[]', '2021-06-10 06:21:19', '2021-06-10 06:21:19'),
(504, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 06:21:30', '2021-06-10 06:21:30'),
(505, 1, 'admin/auth/menu/21', 'DELETE', '::1', '{\"_method\":\"delete\",\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\"}', '2021-06-10 06:21:38', '2021-06-10 06:21:38'),
(506, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 06:21:38', '2021-06-10 06:21:38'),
(507, 1, 'admin/auth/menu/20', 'DELETE', '::1', '{\"_method\":\"delete\",\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\"}', '2021-06-10 06:21:42', '2021-06-10 06:21:42'),
(508, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 06:21:43', '2021-06-10 06:21:43'),
(509, 1, 'admin/auth/menu/19', 'DELETE', '::1', '{\"_method\":\"delete\",\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\"}', '2021-06-10 06:21:47', '2021-06-10 06:21:47'),
(510, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 06:21:48', '2021-06-10 06:21:48'),
(511, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":8},{\\\"id\\\":15,\\\"children\\\":[{\\\"id\\\":14},{\\\"id\\\":16}]},{\\\"id\\\":9,\\\"children\\\":[{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":12},{\\\"id\\\":13}]}]\"}', '2021-06-10 06:21:52', '2021-06-10 06:21:52'),
(512, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 06:21:53', '2021-06-10 06:21:53'),
(513, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 06:21:53', '2021-06-10 06:21:53'),
(514, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-10 06:21:55', '2021-06-10 06:21:55'),
(515, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 06:37:20', '2021-06-10 06:37:20'),
(516, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-10 06:37:59', '2021-06-10 06:37:59'),
(517, 1, 'admin/posts/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 06:38:07', '2021-06-10 06:38:07'),
(518, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-10 06:39:03', '2021-06-10 06:39:03'),
(519, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"slug\":\"Home Page\",\"type\":\"post\"}', '2021-06-10 06:39:06', '2021-06-10 06:39:06'),
(520, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"slug\":\"tr\\u01b0\\u01a1ng\",\"type\":\"post\"}', '2021-06-10 06:39:48', '2021-06-10 06:39:48'),
(521, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"slug\":\"H\\u00f4m n\\u00e0y tr\\u1eddi \\u0111\\u1eb9p\",\"type\":\"post\"}', '2021-06-10 06:41:21', '2021-06-10 06:41:21'),
(522, 1, 'admin/posts', 'POST', '::1', '{\"title\":\"H\\u00f4m n\\u00e0y tr\\u1eddi \\u0111\\u1eb9p\",\"slug\":\"truong\",\"desc_short\":null,\"body\":null,\"category\":[null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/public\\/upload\\/product_default.png\",\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"after-save\":\"2\"}', '2021-06-10 06:41:21', '2021-06-10 06:41:21'),
(523, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-10 06:41:22', '2021-06-10 06:41:22'),
(524, 1, 'admin/posts', 'POST', '::1', '{\"title\":\"H\\u00f4m n\\u00e0y tr\\u1eddi \\u0111\\u1eb9p\",\"slug\":\"truong\",\"desc_short\":null,\"body\":null,\"category\":[null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/public\\/upload\\/product_default.png\",\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"after-save\":\"2\"}', '2021-06-10 06:44:10', '2021-06-10 06:44:10'),
(525, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-10 06:44:15', '2021-06-10 06:44:15'),
(526, 1, 'admin/posts', 'POST', '::1', '{\"title\":\"H\\u00f4m n\\u00e0y tr\\u1eddi \\u0111\\u1eb9p\",\"slug\":\"truong\",\"desc_short\":null,\"body\":null,\"category\":[null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/public\\/upload\\/product_default.png\",\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"after-save\":\"2\"}', '2021-06-10 06:49:16', '2021-06-10 06:49:16'),
(527, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-10 06:49:20', '2021-06-10 06:49:20'),
(528, 1, 'admin/posts', 'POST', '::1', '{\"title\":\"H\\u00f4m n\\u00e0y tr\\u1eddi \\u0111\\u1eb9p\",\"slug\":\"truong\",\"desc_short\":null,\"body\":null,\"category\":[null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/public\\/upload\\/product_default.png\",\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"after-save\":\"2\"}', '2021-06-10 06:50:36', '2021-06-10 06:50:36'),
(529, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-10 06:50:36', '2021-06-10 06:50:36'),
(530, 1, 'admin/posts', 'POST', '::1', '{\"title\":\"H\\u00f4m n\\u00e0y tr\\u1eddi \\u0111\\u1eb9p\",\"slug\":\"truong\",\"desc_short\":null,\"body\":null,\"category\":[null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/public\\/upload\\/product_default.png\",\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"after-save\":\"2\"}', '2021-06-10 06:51:20', '2021-06-10 06:51:20'),
(531, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-10 06:51:20', '2021-06-10 06:51:20'),
(532, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-10 06:53:58', '2021-06-10 06:53:58'),
(533, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"slug\":\"H\\u00f4m nay tr\\u1eddi r\\u1ea5t \\u0111\\u1eb9p\",\"type\":\"post\"}', '2021-06-10 06:54:10', '2021-06-10 06:54:10'),
(534, 1, 'admin/posts', 'POST', '::1', '{\"title\":\"H\\u00f4m nay tr\\u1eddi r\\u1ea5t \\u0111\\u1eb9p\",\"slug\":\"hom-nay-troi-rat-dep\",\"desc_short\":null,\"body\":null,\"category\":[null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/public\\/upload\\/product_default.png\",\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"after-save\":\"2\"}', '2021-06-10 06:54:14', '2021-06-10 06:54:14'),
(535, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-10 06:54:15', '2021-06-10 06:54:15'),
(536, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-10 06:59:24', '2021-06-10 06:59:24'),
(537, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"slug\":\"H\\u00f4m nay tr\\u1eddi r\\u1ea5t \\u0111\\u1eb9p\",\"type\":\"post\"}', '2021-06-10 07:01:02', '2021-06-10 07:01:02'),
(538, 1, 'admin/posts', 'POST', '::1', '{\"title\":\"H\\u00f4m nay tr\\u1eddi r\\u1ea5t \\u0111\\u1eb9p\",\"slug\":\"hom-nay-troi-rat-dep\",\"desc_short\":null,\"body\":null,\"category\":[null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/public\\/upload\\/product_default.png\",\"admin\":{\"id_ofauthor\":\"1\"},\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"after-save\":\"2\"}', '2021-06-10 07:01:07', '2021-06-10 07:01:07'),
(539, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-10 07:01:07', '2021-06-10 07:01:07'),
(540, 1, 'admin/posts', 'POST', '::1', '{\"title\":\"H\\u00f4m nay tr\\u1eddi r\\u1ea5t \\u0111\\u1eb9p\",\"slug\":\"hom-nay-troi-rat-dep\",\"desc_short\":null,\"body\":null,\"category\":[null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/public\\/upload\\/product_default.png\",\"admin\":{\"id_ofauthor\":\"1\"},\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"after-save\":\"2\"}', '2021-06-10 07:03:12', '2021-06-10 07:03:12'),
(541, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-10 07:03:13', '2021-06-10 07:03:13'),
(542, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-10 07:03:16', '2021-06-10 07:03:16'),
(543, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"slug\":\"H\\u00f4m nay tr\\u1eddi r\\u1ea5t \\u0111\\u1eb9p\",\"type\":\"post\"}', '2021-06-10 07:03:23', '2021-06-10 07:03:23'),
(544, 1, 'admin/posts', 'POST', '::1', '{\"title\":\"H\\u00f4m nay tr\\u1eddi r\\u1ea5t \\u0111\\u1eb9p\",\"slug\":\"hom-nay-troi-rat-dep\",\"desc_short\":null,\"body\":null,\"category\":[null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/public\\/upload\\/product_default.png\",\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"after-save\":\"2\"}', '2021-06-10 07:03:28', '2021-06-10 07:03:28'),
(545, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-10 07:03:28', '2021-06-10 07:03:28'),
(546, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-10 07:03:44', '2021-06-10 07:03:44'),
(547, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"slug\":\"H\\u00f4m nay tr\\u1eddi r\\u1ea5t \\u0111\\u1eb9p\",\"type\":\"post\"}', '2021-06-10 07:03:49', '2021-06-10 07:03:49'),
(548, 1, 'admin/posts', 'POST', '::1', '{\"title\":\"H\\u00f4m nay tr\\u1eddi r\\u1ea5t \\u0111\\u1eb9p\",\"slug\":\"hom-nay-troi-rat-dep-2\",\"desc_short\":null,\"body\":null,\"category\":[null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/public\\/upload\\/product_default.png\",\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"after-save\":\"2\"}', '2021-06-10 07:05:13', '2021-06-10 07:05:13'),
(549, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-10 07:05:13', '2021-06-10 07:05:13'),
(550, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-10 07:05:28', '2021-06-10 07:05:28'),
(551, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-10 07:06:34', '2021-06-10 07:06:34'),
(552, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"slug\":null,\"type\":\"post\"}', '2021-06-10 07:06:39', '2021-06-10 07:06:39'),
(553, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-10 07:07:37', '2021-06-10 07:07:37'),
(554, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"slug\":null,\"type\":\"post\"}', '2021-06-10 07:07:45', '2021-06-10 07:07:45'),
(555, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"slug\":null,\"type\":\"post\"}', '2021-06-10 07:09:32', '2021-06-10 07:09:32'),
(556, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-10 07:09:58', '2021-06-10 07:09:58'),
(557, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"slug\":null,\"type\":\"post\"}', '2021-06-10 07:10:11', '2021-06-10 07:10:11'),
(558, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-10 07:11:33', '2021-06-10 07:11:33'),
(559, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"slug\":\"H\\u00f4m nay tr\\u1eddi r\\u1ea5t \\u0111\\u1eb9p\",\"type\":\"post\"}', '2021-06-10 07:11:36', '2021-06-10 07:11:36'),
(560, 1, 'admin/posts', 'POST', '::1', '{\"title\":\"H\\u00f4m nay tr\\u1eddi r\\u1ea5t \\u0111\\u1eb9p\",\"slug\":\"hom-nay-troi-rat-dep-3\",\"desc_short\":null,\"body\":null,\"category\":[null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/public\\/upload\\/product_default.png\",\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"after-save\":\"2\"}', '2021-06-10 07:11:48', '2021-06-10 07:11:48'),
(561, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-10 07:11:48', '2021-06-10 07:11:48'),
(562, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 07:12:54', '2021-06-10 07:12:54'),
(563, 1, 'admin/users/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 07:13:05', '2021-06-10 07:13:05'),
(564, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-10 07:24:38', '2021-06-10 07:24:38'),
(565, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-10 07:25:08', '2021-06-10 07:25:08'),
(566, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-10 07:25:52', '2021-06-10 07:25:52'),
(567, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-10 07:28:05', '2021-06-10 07:28:05'),
(568, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-10 07:28:19', '2021-06-10 07:28:19'),
(569, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-10 07:31:35', '2021-06-10 07:31:35'),
(570, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-10 07:32:11', '2021-06-10 07:32:11'),
(571, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-10 07:32:41', '2021-06-10 07:32:41'),
(572, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"slug\":null}', '2021-06-10 07:32:53', '2021-06-10 07:32:53'),
(573, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"slug\":null}', '2021-06-10 07:32:53', '2021-06-10 07:32:53'),
(574, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-10 07:33:00', '2021-06-10 07:33:00'),
(575, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"slug\":null}', '2021-06-10 07:33:45', '2021-06-10 07:33:45'),
(576, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"slug\":null}', '2021-06-10 07:33:46', '2021-06-10 07:33:46'),
(577, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-10 07:33:59', '2021-06-10 07:33:59'),
(578, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-10 07:36:05', '2021-06-10 07:36:05'),
(579, 1, 'admin/users', 'POST', '::1', '{\"name\":\"mevivu\",\"email\":\"trantruong1797@gmail.com\",\"password\":\"@mevivucom@123\",\"user_info\":{\"fullname\":\"Mevivu\",\"phone\":\"0342909557\",\"birthday\":\"2021-06-01\",\"gender\":\"1\"},\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"after-save\":\"1\"}', '2021-06-10 07:36:42', '2021-06-10 07:36:42'),
(580, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-10 07:36:42', '2021-06-10 07:36:42'),
(581, 1, 'admin/users', 'POST', '::1', '{\"name\":\"mevivu\",\"email\":\"trantruong1797@gmail.com\",\"password\":\"@mevivucom@123\",\"user_info\":{\"fullname\":\"Mevivu\",\"phone\":\"0342909557\",\"birthday\":\"2021-06-01\",\"gender\":\"1\"},\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"after-save\":\"1\"}', '2021-06-10 07:38:22', '2021-06-10 07:38:22'),
(582, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-10 07:38:23', '2021-06-10 07:38:23'),
(583, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-10 07:38:25', '2021-06-10 07:38:25'),
(584, 1, 'admin/users', 'POST', '::1', '{\"name\":\"mevivu\",\"email\":\"trantruong1797@gmail.com\",\"password\":\"@mevivucom@123\",\"user_info\":{\"fullname\":\"mevivu\",\"phone\":\"0342909557\",\"birthday\":\"2021-06-01\",\"gender\":\"1\"},\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"after-save\":\"1\"}', '2021-06-10 07:38:49', '2021-06-10 07:38:49'),
(585, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-10 07:38:50', '2021-06-10 07:38:50'),
(586, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-10 07:40:50', '2021-06-10 07:40:50'),
(587, 1, 'admin/users', 'POST', '::1', '{\"name\":\"mevivu\",\"email\":\"trantruong1797@gmail.com\",\"password\":\"@mevivucom@123\",\"user_info\":{\"fullname\":\"Mevivu\",\"phone\":\"0342909557\",\"birthday\":\"2021-06-01\",\"gender\":\"1\"},\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"after-save\":\"1\"}', '2021-06-10 07:41:20', '2021-06-10 07:41:20'),
(588, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-10 07:41:20', '2021-06-10 07:41:20'),
(589, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-10 07:42:55', '2021-06-10 07:42:55'),
(590, 1, 'admin/users', 'POST', '::1', '{\"name\":\"mevivu\",\"email\":\"trantruong1797@gmail.com\",\"password\":\"@mevivucom@123\",\"user_info\":{\"fullname\":\"Mevivu\",\"phone\":\"0342909557\",\"birthday\":\"2021-06-01\",\"gender\":\"1\"},\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"after-save\":\"1\"}', '2021-06-10 07:43:22', '2021-06-10 07:43:22'),
(591, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-10 07:43:23', '2021-06-10 07:43:23'),
(592, 1, 'admin/users/2', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 07:43:35', '2021-06-10 07:43:35'),
(593, 1, 'admin/users/2', 'GET', '::1', '[]', '2021-06-10 07:45:07', '2021-06-10 07:45:07'),
(594, 1, 'admin/users/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 07:45:15', '2021-06-10 07:45:15'),
(595, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 07:45:23', '2021-06-10 07:45:23'),
(596, 1, 'admin/users/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 07:45:34', '2021-06-10 07:45:34'),
(597, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 07:46:08', '2021-06-10 07:46:08'),
(598, 1, 'admin/posts/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 07:46:11', '2021-06-10 07:46:11'),
(599, 1, 'admin/category', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 07:46:15', '2021-06-10 07:46:15'),
(600, 1, 'admin/category/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 07:46:20', '2021-06-10 07:46:20'),
(601, 1, 'admin/category', 'GET', '::1', '[]', '2021-06-10 07:46:24', '2021-06-10 07:46:24'),
(602, 1, 'admin/category', 'GET', '::1', '[]', '2021-06-10 07:47:56', '2021-06-10 07:47:56'),
(603, 1, 'admin/category/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 07:47:58', '2021-06-10 07:47:58'),
(604, 1, 'admin/category/create', 'GET', '::1', '[]', '2021-06-10 07:48:13', '2021-06-10 07:48:13'),
(605, 1, 'admin/category/create', 'GET', '::1', '[]', '2021-06-10 07:49:10', '2021-06-10 07:49:10'),
(606, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"slug\":\"tr\\u01b0\\u01a1ng\"}', '2021-06-10 07:49:14', '2021-06-10 07:49:14'),
(607, 1, 'admin/category/create', 'GET', '::1', '[]', '2021-06-10 07:50:02', '2021-06-10 07:50:02'),
(608, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"slug\":\"tr\\u01b0\\u1eddng\"}', '2021-06-10 07:50:06', '2021-06-10 07:50:06'),
(609, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"slug\":\"\\u0110\\u1eddi s\\u1ed1ng\"}', '2021-06-10 07:50:14', '2021-06-10 07:50:14'),
(610, 1, 'admin/category', 'POST', '::1', '{\"title\":\"\\u0110\\u1eddi s\\u1ed1ng\",\"slug\":\"doi-song\",\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"after-save\":\"2\"}', '2021-06-10 07:50:16', '2021-06-10 07:50:16'),
(611, 1, 'admin/category/create', 'GET', '::1', '[]', '2021-06-10 07:50:16', '2021-06-10 07:50:16'),
(612, 1, 'admin/category', 'POST', '::1', '{\"title\":\"\\u0110\\u1eddi s\\u1ed1ng\",\"slug\":\"doi-song\",\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"after-save\":\"2\"}', '2021-06-10 07:50:41', '2021-06-10 07:50:41'),
(613, 1, 'admin/category/create', 'GET', '::1', '[]', '2021-06-10 07:50:42', '2021-06-10 07:50:42'),
(614, 1, 'admin/category', 'POST', '::1', '{\"title\":\"\\u0110\\u1eddi s\\u1ed1ng\",\"slug\":\"doi-song\",\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"after-save\":\"2\"}', '2021-06-10 07:53:29', '2021-06-10 07:53:29'),
(615, 1, 'admin/category/create', 'GET', '::1', '[]', '2021-06-10 07:53:30', '2021-06-10 07:53:30'),
(616, 1, 'admin/category', 'POST', '::1', '{\"title\":\"\\u0110\\u1eddi s\\u1ed1ng\",\"slug\":\"doi-song\",\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"after-save\":\"2\"}', '2021-06-10 07:53:57', '2021-06-10 07:53:57'),
(617, 1, 'admin/category/create', 'GET', '::1', '[]', '2021-06-10 07:53:58', '2021-06-10 07:53:58'),
(618, 1, 'admin/category', 'POST', '::1', '{\"title\":\"\\u0110\\u1eddi s\\u1ed1ng\",\"slug\":\"doi-song\",\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"after-save\":\"1\"}', '2021-06-10 08:08:21', '2021-06-10 08:08:21'),
(619, 1, 'admin/category/1/edit', 'GET', '::1', '[]', '2021-06-10 08:08:22', '2021-06-10 08:08:22'),
(620, 1, 'admin/category', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 08:08:30', '2021-06-10 08:08:30'),
(621, 1, 'admin/category/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 08:08:31', '2021-06-10 08:08:31'),
(622, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"slug\":\"\\u0110\\u1eddi s\\u1ed1ng\"}', '2021-06-10 08:08:37', '2021-06-10 08:08:37'),
(623, 1, 'admin/category', 'POST', '::1', '{\"title\":\"\\u0110\\u1eddi s\\u1ed1ng\",\"slug\":\"doi-song-2\",\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/category\"}', '2021-06-10 08:08:39', '2021-06-10 08:08:39'),
(624, 1, 'admin/category', 'GET', '::1', '[]', '2021-06-10 08:08:40', '2021-06-10 08:08:40'),
(625, 1, 'admin/category/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 08:08:44', '2021-06-10 08:08:44'),
(626, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"slug\":\"Tin t\\u1ee9c\"}', '2021-06-10 08:08:50', '2021-06-10 08:08:50'),
(627, 1, 'admin/category/2', 'PUT', '::1', '{\"title\":\"Tin t\\u1ee9c\",\"slug\":\"tin-tuc\",\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/category\"}', '2021-06-10 08:08:51', '2021-06-10 08:08:51'),
(628, 1, 'admin/category', 'GET', '::1', '[]', '2021-06-10 08:08:51', '2021-06-10 08:08:51'),
(629, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 08:08:55', '2021-06-10 08:08:55'),
(630, 1, 'admin/posts/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 08:08:58', '2021-06-10 08:08:58'),
(631, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 08:10:53', '2021-06-10 08:10:53'),
(632, 1, 'admin/posts/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 08:10:55', '2021-06-10 08:10:55'),
(633, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-10 08:11:08', '2021-06-10 08:11:08'),
(634, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 08:11:12', '2021-06-10 08:11:12'),
(635, 1, 'admin/posts/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 08:11:15', '2021-06-10 08:11:15'),
(636, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 08:11:17', '2021-06-10 08:11:17'),
(637, 1, 'admin/posts/5/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 08:11:21', '2021-06-10 08:11:21'),
(638, 1, 'admin/posts/5', 'PUT', '::1', '{\"title\":\"H\\u00f4m nay tr\\u1eddi r\\u1ea5t \\u0111\\u1eb9p\",\"slug\":\"hom-nay-troi-rat-dep-3\",\"desc_short\":null,\"body\":null,\"category\":[\"1\",\"2\",null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/public\\/upload\\/product_default.png\",\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/posts\"}', '2021-06-10 08:11:27', '2021-06-10 08:11:27'),
(639, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-10 08:11:28', '2021-06-10 08:11:28'),
(640, 1, 'admin/posts/5', 'DELETE', '::1', '{\"_method\":\"delete\",\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\"}', '2021-06-10 08:11:47', '2021-06-10 08:11:47'),
(641, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 08:11:48', '2021-06-10 08:11:48'),
(642, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-10 08:13:44', '2021-06-10 08:13:44'),
(643, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-10 08:15:47', '2021-06-10 08:15:47'),
(644, 1, 'admin/posts', 'GET', '::1', '{\"_scope_\":\"trashed\",\"_pjax\":\"#pjax-container\"}', '2021-06-10 08:15:50', '2021-06-10 08:15:50'),
(645, 1, 'admin/posts/5', 'DELETE', '::1', '{\"_method\":\"delete\",\"_token\":\"Bm1xTgfImFUlgeBGHJHAlaVoFlSkJPO8xGdsP2NY\"}', '2021-06-10 08:18:06', '2021-06-10 08:18:06'),
(646, 1, 'admin/posts', 'GET', '::1', '{\"_scope_\":\"trashed\",\"_pjax\":\"#pjax-container\"}', '2021-06-10 08:18:06', '2021-06-10 08:18:06'),
(647, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-10 08:18:11', '2021-06-10 08:18:11'),
(648, 1, 'admin', 'GET', '::1', '[]', '2021-06-11 04:12:15', '2021-06-11 04:12:15'),
(649, 1, 'admin', 'GET', '::1', '[]', '2021-06-11 04:12:15', '2021-06-11 04:12:15'),
(650, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 04:12:38', '2021-06-11 04:12:38'),
(651, 1, 'admin/category', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 04:12:51', '2021-06-11 04:12:51'),
(652, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 04:13:22', '2021-06-11 04:13:22'),
(653, 1, 'admin/users/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 04:13:26', '2021-06-11 04:13:26'),
(654, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 04:13:45', '2021-06-11 04:13:45'),
(655, 1, 'admin/users/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 04:13:48', '2021-06-11 04:13:48'),
(656, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\",\"slug\":null}', '2021-06-11 04:13:51', '2021-06-11 04:13:51'),
(657, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\",\"slug\":null}', '2021-06-11 04:14:03', '2021-06-11 04:14:03'),
(658, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-11 04:14:07', '2021-06-11 04:14:07'),
(659, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\",\"slug\":null}', '2021-06-11 04:14:13', '2021-06-11 04:14:13'),
(660, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-11 04:15:23', '2021-06-11 04:15:23'),
(661, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-11 04:15:41', '2021-06-11 04:15:41'),
(662, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\",\"slug\":null}', '2021-06-11 04:15:48', '2021-06-11 04:15:48'),
(663, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-11 04:16:13', '2021-06-11 04:16:13'),
(664, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\",\"slug\":null}', '2021-06-11 04:16:18', '2021-06-11 04:16:18'),
(665, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-11 04:18:27', '2021-06-11 04:18:27'),
(666, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\",\"slug\":null}', '2021-06-11 04:18:33', '2021-06-11 04:18:33'),
(667, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\",\"slug\":null}', '2021-06-11 04:19:26', '2021-06-11 04:19:26'),
(668, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-11 04:19:55', '2021-06-11 04:19:55'),
(669, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\",\"slug\":null}', '2021-06-11 04:20:03', '2021-06-11 04:20:03'),
(670, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-11 04:20:11', '2021-06-11 04:20:11'),
(671, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-11 04:20:26', '2021-06-11 04:20:26'),
(672, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 04:20:37', '2021-06-11 04:20:37'),
(673, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 04:20:43', '2021-06-11 04:20:43'),
(674, 1, 'admin/users/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 04:20:45', '2021-06-11 04:20:45'),
(675, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-11 04:20:49', '2021-06-11 04:20:49'),
(676, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\",\"slug\":null}', '2021-06-11 04:20:56', '2021-06-11 04:20:56'),
(677, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-11 04:22:51', '2021-06-11 04:22:51'),
(678, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\",\"slug\":null}', '2021-06-11 04:22:55', '2021-06-11 04:22:55'),
(679, 1, 'admin/kiem-tra-duong-dan', 'PUT', '::1', '{\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\",\"slug\":null}', '2021-06-11 04:22:55', '2021-06-11 04:22:55'),
(680, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-11 04:23:35', '2021-06-11 04:23:35'),
(681, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 04:24:09', '2021-06-11 04:24:09'),
(682, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 04:24:10', '2021-06-11 04:24:10'),
(683, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 04:24:13', '2021-06-11 04:24:13'),
(684, 1, 'admin/posts/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 04:24:28', '2021-06-11 04:24:28'),
(685, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-11 04:24:41', '2021-06-11 04:24:41');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(686, 1, 'admin/posts', 'POST', '::1', '{\"title\":\"H\\u00f4m nay tr\\u1eddi r\\u1ea5t \\u0111\\u1eb9p\",\"slug\":null,\"desc_short\":null,\"body\":null,\"category\":[\"1\",null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/public\\/upload\\/product_default.png\",\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\",\"after-save\":\"1\"}', '2021-06-11 04:24:55', '2021-06-11 04:24:55'),
(687, 1, 'admin/posts/6/edit', 'GET', '::1', '[]', '2021-06-11 04:24:56', '2021-06-11 04:24:56'),
(688, 1, 'admin/posts/6/edit', 'GET', '::1', '[]', '2021-06-11 04:25:19', '2021-06-11 04:25:19'),
(689, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 04:25:48', '2021-06-11 04:25:48'),
(690, 1, 'admin/posts/6', 'DELETE', '::1', '{\"_method\":\"delete\",\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\"}', '2021-06-11 04:26:00', '2021-06-11 04:26:00'),
(691, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 04:26:00', '2021-06-11 04:26:00'),
(692, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"_scope_\":\"trashed\"}', '2021-06-11 04:26:03', '2021-06-11 04:26:03'),
(693, 1, 'admin/posts/6/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 04:26:13', '2021-06-11 04:26:13'),
(694, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 04:26:19', '2021-06-11 04:26:19'),
(695, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"_scope_\":\"trashed\"}', '2021-06-11 04:26:22', '2021-06-11 04:26:22'),
(696, 1, 'admin/posts', 'GET', '::1', '{\"_scope_\":\"trashed\"}', '2021-06-11 04:32:22', '2021-06-11 04:32:22'),
(697, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 04:32:32', '2021-06-11 04:32:32'),
(698, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"_scope_\":\"trashed\"}', '2021-06-11 04:32:35', '2021-06-11 04:32:35'),
(699, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"_scope_\":\"trashed\"}', '2021-06-11 04:32:39', '2021-06-11 04:32:39'),
(700, 1, 'admin/posts', 'GET', '::1', '{\"_scope_\":\"trashed\"}', '2021-06-11 04:34:22', '2021-06-11 04:34:22'),
(701, 1, 'admin/posts', 'GET', '::1', '{\"_scope_\":\"trashed\",\"_pjax\":\"#pjax-container\"}', '2021-06-11 04:34:31', '2021-06-11 04:34:31'),
(702, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 04:34:32', '2021-06-11 04:34:32'),
(703, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-11 04:34:56', '2021-06-11 04:34:56'),
(704, 1, 'admin/posts', 'GET', '::1', '{\"_scope_\":\"trashed\",\"_pjax\":\"#pjax-container\"}', '2021-06-11 04:35:00', '2021-06-11 04:35:00'),
(705, 1, 'admin/posts', 'GET', '::1', '{\"_scope_\":\"trashed\"}', '2021-06-11 04:37:36', '2021-06-11 04:37:36'),
(706, 1, 'admin/posts', 'GET', '::1', '{\"_scope_\":\"trashed\"}', '2021-06-11 04:42:05', '2021-06-11 04:42:05'),
(707, 1, 'admin/_handle_action_', 'POST', '::1', '{\"_model\":\"App_Models_Posts\",\"_key\":[\"6\"],\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\",\"_action\":\"App_Admin_Actions_Post_BatchRestore\",\"_input\":\"true\"}', '2021-06-11 04:42:19', '2021-06-11 04:42:19'),
(708, 1, 'admin/posts', 'GET', '::1', '{\"_scope_\":\"trashed\",\"_pjax\":\"#pjax-container\"}', '2021-06-11 04:42:20', '2021-06-11 04:42:20'),
(709, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 04:42:23', '2021-06-11 04:42:23'),
(710, 1, 'admin/posts/6', 'DELETE', '::1', '{\"_method\":\"delete\",\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\"}', '2021-06-11 04:42:30', '2021-06-11 04:42:30'),
(711, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 04:42:31', '2021-06-11 04:42:31'),
(712, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"_scope_\":\"trashed\"}', '2021-06-11 04:42:33', '2021-06-11 04:42:33'),
(713, 1, 'admin/posts/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 05:51:36', '2021-06-11 05:51:36'),
(714, 1, 'admin', 'GET', '::1', '[]', '2021-06-11 07:27:48', '2021-06-11 07:27:48'),
(715, 1, 'admin', 'GET', '::1', '[]', '2021-06-11 07:27:51', '2021-06-11 07:27:51'),
(716, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 07:27:55', '2021-06-11 07:27:55'),
(717, 1, 'admin/users/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 07:28:01', '2021-06-11 07:28:01'),
(718, 1, 'admin', 'GET', '::1', '[]', '2021-06-11 07:34:27', '2021-06-11 07:34:27'),
(719, 1, 'admin/category', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 07:36:00', '2021-06-11 07:36:00'),
(720, 1, 'admin/category/1,2', 'DELETE', '::1', '{\"_method\":\"delete\",\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\"}', '2021-06-11 07:36:06', '2021-06-11 07:36:06'),
(721, 1, 'admin/category', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 07:36:06', '2021-06-11 07:36:06'),
(722, 1, 'admin/category/1,2', 'DELETE', '::1', '{\"_method\":\"delete\",\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\"}', '2021-06-11 08:20:42', '2021-06-11 08:20:42'),
(723, 1, 'admin/category', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 08:20:43', '2021-06-11 08:20:43'),
(724, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 08:20:47', '2021-06-11 08:20:47'),
(725, 1, 'admin/posts/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 08:20:49', '2021-06-11 08:20:49'),
(726, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 09:18:41', '2021-06-11 09:18:41'),
(727, 1, 'admin/users/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 09:18:57', '2021-06-11 09:18:57'),
(728, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-11 09:30:52', '2021-06-11 09:30:52'),
(729, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-11 09:30:52', '2021-06-11 09:30:52'),
(730, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-11 09:31:17', '2021-06-11 09:31:17'),
(731, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-11 09:31:46', '2021-06-11 09:31:46'),
(732, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-11 09:32:22', '2021-06-11 09:32:22'),
(733, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 09:32:53', '2021-06-11 09:32:53'),
(734, 1, 'admin/users/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 09:32:58', '2021-06-11 09:32:58'),
(735, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-11 09:42:29', '2021-06-11 09:42:29'),
(736, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-11 09:57:37', '2021-06-11 09:57:37'),
(737, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-11 09:58:07', '2021-06-11 09:58:07'),
(738, 1, 'admin/users/2', 'PUT', '::1', '{\"name\":\"mevivu\",\"email\":\"trantruong1797@gmail.com\",\"password\":null,\"user_info\":{\"fullname\":\"Mevivu\",\"phone\":\"0342909557\",\"address\":\"998\\/42\\/15\",\"birthday\":\"2021-06-01\",\"gender\":\"1\"},\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\",\"_method\":\"PUT\"}', '2021-06-11 09:58:10', '2021-06-11 09:58:10'),
(739, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-11 09:58:11', '2021-06-11 09:58:11'),
(740, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-11 10:02:26', '2021-06-11 10:02:26'),
(741, 1, 'admin/users/2', 'PUT', '::1', '{\"name\":\"mevivu\",\"email\":\"trantruong1797@gmail.com\",\"password\":null,\"user_info\":{\"fullname\":\"Mevivu\",\"phone\":\"0342909557\",\"address\":\"998\\/42\\/15\",\"birthday\":\"2021-06-01\",\"gender\":\"1\"},\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\",\"_method\":\"PUT\"}', '2021-06-11 10:02:50', '2021-06-11 10:02:50'),
(742, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-11 10:02:51', '2021-06-11 10:02:51'),
(743, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 10:06:33', '2021-06-11 10:06:33'),
(744, 1, 'admin/users/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 10:06:34', '2021-06-11 10:06:34'),
(745, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 10:06:37', '2021-06-11 10:06:37'),
(746, 1, 'admin/users/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 10:06:40', '2021-06-11 10:06:40'),
(747, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 10:06:43', '2021-06-11 10:06:43'),
(748, 1, 'admin/users/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 10:06:45', '2021-06-11 10:06:45'),
(749, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-11 10:07:53', '2021-06-11 10:07:53'),
(750, 1, 'admin/users/2', 'PUT', '::1', '{\"name\":\"mevivu\",\"email\":\"trantruong1797@gmail.com\",\"password\":null,\"user_info\":{\"fullname\":\"Mevivu\",\"phone\":\"0342909557\",\"address\":\"998\\/42\\/15\",\"birthday\":\"2021-06-01\",\"gender\":\"1\"},\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\",\"_method\":\"PUT\"}', '2021-06-11 10:08:00', '2021-06-11 10:08:00'),
(751, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-11 10:08:00', '2021-06-11 10:08:00'),
(752, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-11 10:09:18', '2021-06-11 10:09:18'),
(753, 1, 'admin/users/2', 'PUT', '::1', '{\"name\":\"mevivu\",\"email\":\"trantruong1797@gmail.com\",\"password\":null,\"user_info\":{\"fullname\":\"Mevivu\",\"phone\":\"0342909557\",\"address\":\"998\\/42\\/15\",\"birthday\":\"2021-06-01\",\"gender\":\"1\"},\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\",\"_method\":\"PUT\"}', '2021-06-11 10:09:24', '2021-06-11 10:09:24'),
(754, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-11 10:09:25', '2021-06-11 10:09:25'),
(755, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-11 10:10:18', '2021-06-11 10:10:18'),
(756, 1, 'admin/users/2', 'PUT', '::1', '{\"name\":\"mevivu\",\"email\":\"trantruong1797@gmail.com\",\"password\":null,\"user_info\":{\"fullname\":\"Mevivu\",\"phone\":\"0342909557\",\"address\":\"998\\/42\\/15\",\"birthday\":\"2021-06-01\",\"gender\":\"1\"},\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\",\"_method\":\"PUT\"}', '2021-06-11 10:10:37', '2021-06-11 10:10:37'),
(757, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-11 10:10:38', '2021-06-11 10:10:38'),
(758, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-11 10:16:34', '2021-06-11 10:16:34'),
(759, 1, 'admin/users/2', 'PUT', '::1', '{\"name\":\"mevivu\",\"email\":\"trantruong1797@gmail.com\",\"password\":null,\"user_info\":{\"fullname\":\"Mevivu\",\"phone\":\"0342909557\",\"address\":\"998\\/42\\/15\",\"birthday\":\"2021-06-01\",\"gender\":\"1\"},\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\",\"_method\":\"PUT\"}', '2021-06-11 10:16:38', '2021-06-11 10:16:38'),
(760, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-11 10:16:39', '2021-06-11 10:16:39'),
(761, 1, 'admin/users/2', 'PUT', '::1', '{\"name\":\"mevivu\",\"email\":\"trantruong1797@gmail.com\",\"password\":null,\"user_info\":{\"fullname\":\"Mevivu\",\"phone\":\"0342909557\",\"address\":\"998\\/42\\/15\",\"birthday\":\"2021-06-01\",\"gender\":\"1\"},\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\",\"_method\":\"PUT\"}', '2021-06-11 10:17:28', '2021-06-11 10:17:28'),
(762, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 10:17:51', '2021-06-11 10:17:51'),
(763, 1, 'admin/users/2', 'GET', '::1', '[]', '2021-06-11 10:17:52', '2021-06-11 10:17:52'),
(764, 1, 'admin/users/2', 'GET', '::1', '[]', '2021-06-11 10:17:52', '2021-06-11 10:17:52'),
(765, 1, 'admin/users/2', 'GET', '::1', '[]', '2021-06-11 10:17:53', '2021-06-11 10:17:53'),
(766, 1, 'admin/users/2', 'GET', '::1', '[]', '2021-06-11 10:17:53', '2021-06-11 10:17:53'),
(767, 1, 'admin/users/2', 'GET', '::1', '[]', '2021-06-11 10:17:54', '2021-06-11 10:17:54'),
(768, 1, 'admin/users/2', 'GET', '::1', '[]', '2021-06-11 10:17:54', '2021-06-11 10:17:54'),
(769, 1, 'admin/users/2', 'GET', '::1', '[]', '2021-06-11 10:17:54', '2021-06-11 10:17:54'),
(770, 1, 'admin/users/2', 'GET', '::1', '[]', '2021-06-11 10:17:55', '2021-06-11 10:17:55'),
(771, 1, 'admin/users/2', 'GET', '::1', '[]', '2021-06-11 10:17:55', '2021-06-11 10:17:55'),
(772, 1, 'admin/users/2', 'GET', '::1', '[]', '2021-06-11 10:17:56', '2021-06-11 10:17:56'),
(773, 1, 'admin/users/2', 'GET', '::1', '[]', '2021-06-11 10:17:56', '2021-06-11 10:17:56'),
(774, 1, 'admin/users/2', 'GET', '::1', '[]', '2021-06-11 10:17:57', '2021-06-11 10:17:57'),
(775, 1, 'admin/users/2', 'GET', '::1', '[]', '2021-06-11 10:17:57', '2021-06-11 10:17:57'),
(776, 1, 'admin/users/2', 'GET', '::1', '[]', '2021-06-11 10:17:58', '2021-06-11 10:17:58'),
(777, 1, 'admin/users/2', 'GET', '::1', '[]', '2021-06-11 10:17:58', '2021-06-11 10:17:58'),
(778, 1, 'admin/users/2', 'GET', '::1', '[]', '2021-06-11 10:17:59', '2021-06-11 10:17:59'),
(779, 1, 'admin/users/2', 'GET', '::1', '[]', '2021-06-11 10:17:59', '2021-06-11 10:17:59'),
(780, 1, 'admin/users/2', 'GET', '::1', '[]', '2021-06-11 10:17:59', '2021-06-11 10:17:59'),
(781, 1, 'admin/users/2', 'GET', '::1', '[]', '2021-06-11 10:18:00', '2021-06-11 10:18:00'),
(782, 1, 'admin/users/2', 'GET', '::1', '[]', '2021-06-11 10:18:00', '2021-06-11 10:18:00'),
(783, 1, 'admin/users', 'GET', '::1', '[]', '2021-06-11 10:18:01', '2021-06-11 10:18:01'),
(784, 1, 'admin/users', 'GET', '::1', '[]', '2021-06-11 10:21:00', '2021-06-11 10:21:00'),
(785, 1, 'admin/users/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 10:21:17', '2021-06-11 10:21:17'),
(786, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 10:21:52', '2021-06-11 10:21:52'),
(787, 1, 'admin/users/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 10:21:53', '2021-06-11 10:21:53'),
(788, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 10:21:57', '2021-06-11 10:21:57'),
(789, 1, 'admin/users/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 10:21:59', '2021-06-11 10:21:59'),
(790, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 10:22:09', '2021-06-11 10:22:09'),
(791, 1, 'admin/users/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 10:22:12', '2021-06-11 10:22:12'),
(792, 1, 'admin/users/2', 'PUT', '::1', '{\"name\":\"mevivu\",\"email\":\"trantruong1797@gmail.com\",\"password\":null,\"user_info\":{\"fullname\":\"Mevivu\",\"phone\":\"0342909557\",\"address\":\"998\\/42\\/15\",\"birthday\":\"2021-06-01\",\"gender\":\"1\"},\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/users\"}', '2021-06-11 10:22:58', '2021-06-11 10:22:58'),
(793, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-11 10:22:58', '2021-06-11 10:22:58'),
(794, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 10:24:50', '2021-06-11 10:24:50'),
(795, 1, 'admin/posts/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 10:24:53', '2021-06-11 10:24:53'),
(796, 1, 'admin/posts/3', 'PUT', '::1', '{\"title\":\"H\\u00f4m nay tr\\u1eddi r\\u1ea5t \\u0111\\u1eb9p\",\"slug\":\"hom-nay-troi-rat-dep\",\"desc_short\":\"\\u00e1dsa\",\"body\":\"<p>d\\u1ea5dsaa<\\/p>\",\"category\":[null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/public\\/upload\\/product_default.png\",\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/posts\"}', '2021-06-11 10:25:01', '2021-06-11 10:25:01'),
(797, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-11 10:25:01', '2021-06-11 10:25:01'),
(798, 1, 'admin/posts/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 10:25:11', '2021-06-11 10:25:11'),
(799, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 10:25:55', '2021-06-11 10:25:55'),
(800, 1, 'admin/users/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 10:25:57', '2021-06-11 10:25:57'),
(801, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 10:29:59', '2021-06-11 10:29:59'),
(802, 1, 'admin/users/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 10:30:00', '2021-06-11 10:30:00'),
(803, 1, 'admin/users', 'POST', '::1', '{\"name\":\"truong\",\"email\":\"truong@gmail.com\",\"password\":\"12345\",\"user_info\":{\"fullname\":\"tran truong\",\"phone\":\"0342909557\",\"address\":\"998\\/42\\/15\",\"birthday\":\"2021-06-17\",\"gender\":\"1\"},\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/users\"}', '2021-06-11 10:30:33', '2021-06-11 10:30:33'),
(804, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-11 10:30:33', '2021-06-11 10:30:33'),
(805, 1, 'admin/users', 'POST', '::1', '{\"name\":\"truong\",\"email\":\"truong@gmail.com\",\"password\":\"12345\",\"user_info\":{\"fullname\":\"tran truong\",\"phone\":\"0342909557\",\"address\":\"998\\/42\\/15\",\"birthday\":\"2021-06-17\",\"gender\":\"1\"},\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\"}', '2021-06-11 10:30:54', '2021-06-11 10:30:54'),
(806, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-11 10:30:54', '2021-06-11 10:30:54'),
(807, 1, 'admin/users', 'POST', '::1', '{\"name\":\"truong\",\"email\":\"truong@gmail.com\",\"password\":\"12345\",\"user_info\":{\"fullname\":\"tran truong\",\"phone\":\"0342909557\",\"address\":\"998\\/42\\/15\",\"birthday\":\"2021-06-17\",\"gender\":\"1\"},\"password_show\":null,\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\"}', '2021-06-11 10:31:29', '2021-06-11 10:31:29'),
(808, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-11 10:31:30', '2021-06-11 10:31:30'),
(809, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-11 10:31:42', '2021-06-11 10:31:42'),
(810, 1, 'admin/users', 'POST', '::1', '{\"name\":\"Duong tesst Thuy test\",\"email\":\"trantruog1797@gmail.com\",\"password\":\"12345\",\"user_info\":{\"fullname\":\"Duong tesst Thuy test\",\"phone\":\"0342909557\",\"address\":\"998\\/42\\/15\",\"birthday\":\"2021-06-23\",\"gender\":\"1\"},\"password_show\":\"12345\",\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/users\\/2\"}', '2021-06-11 10:32:05', '2021-06-11 10:32:05'),
(811, 1, 'admin/users/2', 'GET', '::1', '[]', '2021-06-11 10:32:05', '2021-06-11 10:32:05'),
(812, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 10:32:09', '2021-06-11 10:32:09'),
(813, 1, 'admin/users/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 10:32:13', '2021-06-11 10:32:13'),
(814, 1, 'admin/users/3/edit', 'GET', '::1', '[]', '2021-06-11 10:33:19', '2021-06-11 10:33:19'),
(815, 1, 'admin/users/3', 'PUT', '::1', '{\"name\":\"Duong tesst Thuy test\",\"email\":\"trantruog1797@gmail.com\",\"password\":null,\"user_info\":{\"fullname\":\"Duong tesst Thuy test\",\"phone\":\"0342909557\",\"address\":\"998\\/42\\/15 quang trung\",\"birthday\":\"2021-06-23\",\"gender\":\"1\"},\"password_show\":\"12345\",\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/users\\/2\"}', '2021-06-11 10:33:31', '2021-06-11 10:33:31'),
(816, 1, 'admin/users/3/edit', 'GET', '::1', '[]', '2021-06-11 10:33:32', '2021-06-11 10:33:32'),
(817, 1, 'admin/auth/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 10:40:35', '2021-06-11 10:40:35'),
(818, 1, 'admin/auth/users/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 10:40:39', '2021-06-11 10:40:39'),
(819, 1, 'admin/auth/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 10:40:50', '2021-06-11 10:40:50'),
(820, 1, 'admin/auth/users/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 10:40:52', '2021-06-11 10:40:52'),
(821, 1, 'admin/auth/users', 'POST', '::1', '{\"username\":\"admin\",\"name\":\"mevivu\",\"password\":\"12345\",\"password_confirmation\":\"12345\",\"roles\":[\"1\",null],\"permissions\":[null],\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/auth\\/users\"}', '2021-06-11 10:41:07', '2021-06-11 10:41:07'),
(822, 1, 'admin/auth/users/create', 'GET', '::1', '[]', '2021-06-11 10:41:07', '2021-06-11 10:41:07'),
(823, 1, 'admin/auth/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 10:41:12', '2021-06-11 10:41:12'),
(824, 1, 'admin/auth/users/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 10:41:14', '2021-06-11 10:41:14'),
(825, 1, 'admin/auth/users/1', 'PUT', '::1', '{\"username\":\"admin\",\"name\":\"Administrator\",\"password\":\"$2y$10$drtc8\\/RCNronPROYztCFJOkt\\/A0cDqYrMs0LV.ImX3GlfqoKK\\/FEq\",\"password_confirmation\":\"$2y$10$drtc8\\/RCNronPROYztCFJOkt\\/A0cDqYrMs0LV.ImX3GlfqoKK\\/FEq\",\"roles\":[\"1\",null],\"permissions\":[null],\"_token\":\"NBOmKfcAPSKaZCRdkfkS2b3eQfucAxTEPS70u44u\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/auth\\/users\"}', '2021-06-11 10:41:21', '2021-06-11 10:41:21'),
(826, 1, 'admin/auth/users', 'GET', '::1', '[]', '2021-06-11 10:41:21', '2021-06-11 10:41:21'),
(827, 1, 'admin/auth/users/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-11 10:41:26', '2021-06-11 10:41:26'),
(828, 1, 'admin', 'GET', '::1', '[]', '2021-06-12 03:30:03', '2021-06-12 03:30:03'),
(829, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 03:30:34', '2021-06-12 03:30:34'),
(830, 1, 'admin/users/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 03:30:43', '2021-06-12 03:30:43'),
(831, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 03:30:52', '2021-06-12 03:30:52'),
(832, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 03:30:52', '2021-06-12 03:30:52'),
(833, 1, 'admin/users/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 03:30:54', '2021-06-12 03:30:54'),
(834, 1, 'admin/auth/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 03:33:28', '2021-06-12 03:33:28'),
(835, 1, 'admin/auth/users/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 03:33:31', '2021-06-12 03:33:31'),
(836, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 03:43:53', '2021-06-12 03:43:53'),
(837, 1, 'admin/users/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 03:43:57', '2021-06-12 03:43:57'),
(838, 1, 'admin/users/3', 'PUT', '::1', '{\"name\":\"Duong tesst Thuy test\",\"email\":\"trantruog1797@gmail.com\",\"password\":\"$2y$10$9uP815SjgVMGpEe.888Cxuf9l4XiLOGVukfcPIoedRvdOm\\/BSKxjG\",\"user_info\":{\"fullname\":\"Duong tesst Thuy test\",\"phone\":\"0342909557\",\"address\":\"998\\/42\\/15\",\"birthday\":\"2021-06-23\",\"gender\":\"0\"},\"password_show\":\"12345\",\"_token\":\"BCmPGaanfrBOlBiqzioSlBbD3BsdHHoB4DZiWARg\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/users\"}', '2021-06-12 03:46:08', '2021-06-12 03:46:08'),
(839, 1, 'admin/users/3/edit', 'GET', '::1', '[]', '2021-06-12 03:46:08', '2021-06-12 03:46:08'),
(840, 1, 'admin/users/3', 'PUT', '::1', '{\"name\":\"Duong tesst Thuy test\",\"email\":\"trantruog1797@gmail.com\",\"password\":\"$2y$10$9uP815SjgVMGpEe.888Cxuf9l4XiLOGVukfcPIoedRvdOm\\/BSKxjG\",\"user_info\":{\"fullname\":\"Duong tesst Thuy test\",\"phone\":\"0342909557\",\"address\":\"998\\/42\\/15\",\"birthday\":\"2021-06-23\",\"gender\":\"0\"},\"_token\":\"BCmPGaanfrBOlBiqzioSlBbD3BsdHHoB4DZiWARg\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-06-12 03:47:09', '2021-06-12 03:47:09'),
(841, 1, 'admin/users/3/edit', 'GET', '::1', '[]', '2021-06-12 03:47:09', '2021-06-12 03:47:09'),
(842, 1, 'admin/users/3/edit', 'GET', '::1', '[]', '2021-06-12 03:47:12', '2021-06-12 03:47:12'),
(843, 1, 'admin/users/3', 'PUT', '::1', '{\"name\":\"Duong tesst Thuy test\",\"email\":\"trantruog1797@gmail.com\",\"password\":\"$2y$10$9uP815SjgVMGpEe.888Cxuf9l4XiLOGVukfcPIoedRvdOm\\/BSKxjG\",\"user_info\":{\"fullname\":\"Duong tesst Thuy test\",\"phone\":\"0342909557\",\"address\":\"998\\/42\\/15\",\"birthday\":\"2021-06-23\",\"gender\":\"1\"},\"_token\":\"BCmPGaanfrBOlBiqzioSlBbD3BsdHHoB4DZiWARg\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-06-12 03:47:22', '2021-06-12 03:47:22'),
(844, 1, 'admin/users/3/edit', 'GET', '::1', '[]', '2021-06-12 03:47:22', '2021-06-12 03:47:22'),
(845, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 03:52:46', '2021-06-12 03:52:46'),
(846, 1, 'admin/users/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 03:52:49', '2021-06-12 03:52:49'),
(847, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 03:52:53', '2021-06-12 03:52:53'),
(848, 1, 'admin/users/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 03:52:55', '2021-06-12 03:52:55'),
(849, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 03:53:10', '2021-06-12 03:53:10'),
(850, 1, 'admin/users/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 03:53:12', '2021-06-12 03:53:12'),
(851, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 03:53:15', '2021-06-12 03:53:15'),
(852, 1, 'admin/users/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 03:53:18', '2021-06-12 03:53:18'),
(853, 1, 'admin/users/3', 'PUT', '::1', '{\"name\":\"Duong tesst Thuy test\",\"email\":\"truong@gmail.com\",\"password\":\"$2y$10$9uP815SjgVMGpEe.888Cxuf9l4XiLOGVukfcPIoedRvdOm\\/BSKxjG\",\"user_info\":{\"fullname\":\"Duong tesst Thuy test\",\"phone\":\"0342909557\",\"address\":\"998\\/42\\/15\",\"birthday\":\"2021-06-23\",\"gender\":\"1\"},\"_token\":\"BCmPGaanfrBOlBiqzioSlBbD3BsdHHoB4DZiWARg\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/users\"}', '2021-06-12 03:53:29', '2021-06-12 03:53:29'),
(854, 1, 'admin/users', 'GET', '::1', '[]', '2021-06-12 03:53:30', '2021-06-12 03:53:30'),
(855, 1, 'admin/users/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 03:53:34', '2021-06-12 03:53:34'),
(856, 1, 'admin/users/3', 'PUT', '::1', '{\"name\":\"Duong tesst Thuy test\",\"email\":\"truong@gmail.com\",\"password\":\"$2y$10$9uP815SjgVMGpEe.888Cxuf9l4XiLOGVukfcPIoedRvdOm\\/BSKxjG\",\"user_info\":{\"fullname\":\"Duong tesst Thuy test\",\"phone\":\"0342909557\",\"address\":\"998\\/42\\/15 quang trung\",\"birthday\":\"2021-06-23\",\"gender\":\"1\"},\"_token\":\"BCmPGaanfrBOlBiqzioSlBbD3BsdHHoB4DZiWARg\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/users\"}', '2021-06-12 03:53:42', '2021-06-12 03:53:42'),
(857, 1, 'admin/users/3/edit', 'GET', '::1', '[]', '2021-06-12 03:53:43', '2021-06-12 03:53:43'),
(858, 1, 'admin/users/3', 'PUT', '::1', '{\"name\":\"Duong tesst Thuy test\",\"email\":\"truong@gmail.com\",\"password\":\"$2y$10$9uP815SjgVMGpEe.888Cxuf9l4XiLOGVukfcPIoedRvdOm\\/BSKxjG\",\"user_info\":{\"fullname\":\"Duong tesst Thuy test\",\"phone\":\"0342909557\",\"address\":\"998\\/42\\/15 quang trung\",\"birthday\":\"2021-06-23\",\"gender\":\"1\"},\"_token\":\"BCmPGaanfrBOlBiqzioSlBbD3BsdHHoB4DZiWARg\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-06-12 03:54:10', '2021-06-12 03:54:10'),
(859, 1, 'admin/users/3/edit', 'GET', '::1', '[]', '2021-06-12 03:54:10', '2021-06-12 03:54:10'),
(860, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 03:54:13', '2021-06-12 03:54:13'),
(861, 1, 'admin/users/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 03:54:16', '2021-06-12 03:54:16'),
(862, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 03:54:21', '2021-06-12 03:54:21'),
(863, 1, 'admin/users/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 03:54:24', '2021-06-12 03:54:24'),
(864, 1, 'admin/users/2', 'PUT', '::1', '{\"name\":\"mevivu\",\"email\":\"trantruong1797@gmail.com\",\"password\":\"$2y$10$V32RL3R\\/VwDPgnsEvrEfTOcL\\/HL.tZJoXBn\\/AhHUXZvrq8nVxIvAq\",\"user_info\":{\"fullname\":\"Mevivu\",\"phone\":\"0342909557\",\"address\":\"998\\/42\\/15 quang trung\",\"birthday\":\"2021-06-01\",\"gender\":\"1\"},\"_token\":\"BCmPGaanfrBOlBiqzioSlBbD3BsdHHoB4DZiWARg\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/users\"}', '2021-06-12 03:54:29', '2021-06-12 03:54:29'),
(865, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 03:54:30', '2021-06-12 03:54:30'),
(866, 1, 'admin/users/2', 'PUT', '::1', '{\"name\":\"mevivu\",\"email\":\"1trantruong1797@gmail.com\",\"password\":\"$2y$10$V32RL3R\\/VwDPgnsEvrEfTOcL\\/HL.tZJoXBn\\/AhHUXZvrq8nVxIvAq\",\"user_info\":{\"fullname\":\"Mevivu\",\"phone\":\"0342909557\",\"address\":\"998\\/42\\/15 quang trung\",\"birthday\":\"2021-06-01\",\"gender\":\"1\"},\"_token\":\"BCmPGaanfrBOlBiqzioSlBbD3BsdHHoB4DZiWARg\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-06-12 04:05:15', '2021-06-12 04:05:15'),
(867, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:05:19', '2021-06-12 04:05:19'),
(868, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:05:22', '2021-06-12 04:05:22'),
(869, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:05:24', '2021-06-12 04:05:24'),
(870, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:05:27', '2021-06-12 04:05:27'),
(871, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:05:29', '2021-06-12 04:05:29'),
(872, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:05:32', '2021-06-12 04:05:32'),
(873, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:05:35', '2021-06-12 04:05:35'),
(874, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:05:37', '2021-06-12 04:05:37'),
(875, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:05:40', '2021-06-12 04:05:40'),
(876, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:05:42', '2021-06-12 04:05:42'),
(877, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:05:44', '2021-06-12 04:05:44'),
(878, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:05:47', '2021-06-12 04:05:47'),
(879, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:05:49', '2021-06-12 04:05:49'),
(880, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:05:51', '2021-06-12 04:05:51'),
(881, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:05:53', '2021-06-12 04:05:53'),
(882, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:05:55', '2021-06-12 04:05:55'),
(883, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:05:57', '2021-06-12 04:05:57'),
(884, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:05:59', '2021-06-12 04:05:59'),
(885, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:06:01', '2021-06-12 04:06:01'),
(886, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:06:03', '2021-06-12 04:06:03'),
(887, 1, 'admin/users/2', 'GET', '::1', '[]', '2021-06-12 04:06:35', '2021-06-12 04:06:35'),
(888, 1, 'admin/users/2', 'GET', '::1', '[]', '2021-06-12 04:06:45', '2021-06-12 04:06:45'),
(889, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 04:06:49', '2021-06-12 04:06:49'),
(890, 1, 'admin/users/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 04:06:53', '2021-06-12 04:06:53'),
(891, 1, 'admin/users/2', 'PUT', '::1', '{\"name\":\"mevivu\",\"email\":\"trantruong1797@gmail.com\",\"password\":\"$2y$10$V32RL3R\\/VwDPgnsEvrEfTOcL\\/HL.tZJoXBn\\/AhHUXZvrq8nVxIvAq\",\"user_info\":{\"fullname\":\"Mevivu\",\"phone\":\"0342909557\",\"address\":\"998\\/42\\/15\",\"birthday\":\"2021-06-01\",\"gender\":\"1\"},\"_token\":\"BCmPGaanfrBOlBiqzioSlBbD3BsdHHoB4DZiWARg\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/users\"}', '2021-06-12 04:07:07', '2021-06-12 04:07:07'),
(892, 1, 'admin/users', 'GET', '::1', '[]', '2021-06-12 04:07:08', '2021-06-12 04:07:08'),
(893, 1, 'admin/users/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 04:07:11', '2021-06-12 04:07:11'),
(894, 1, 'admin/users/2', 'PUT', '::1', '{\"name\":\"mevivu\",\"email\":\"trantruong1797@gmail.com\",\"password\":\"$2y$10$V32RL3R\\/VwDPgnsEvrEfTOcL\\/HL.tZJoXBn\\/AhHUXZvrq8nVxIvAq\",\"user_info\":{\"fullname\":\"Mevivu\",\"phone\":\"0342909557\",\"address\":\"998\\/42\\/15\",\"birthday\":\"2021-06-01\",\"gender\":\"1\"},\"_token\":\"BCmPGaanfrBOlBiqzioSlBbD3BsdHHoB4DZiWARg\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/users\"}', '2021-06-12 04:13:37', '2021-06-12 04:13:37'),
(895, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:13:40', '2021-06-12 04:13:40'),
(896, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:13:40', '2021-06-12 04:13:40'),
(897, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:13:41', '2021-06-12 04:13:41'),
(898, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:13:41', '2021-06-12 04:13:41'),
(899, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:13:41', '2021-06-12 04:13:41'),
(900, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:13:42', '2021-06-12 04:13:42'),
(901, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:13:42', '2021-06-12 04:13:42'),
(902, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:13:42', '2021-06-12 04:13:42'),
(903, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:13:43', '2021-06-12 04:13:43'),
(904, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:13:43', '2021-06-12 04:13:43'),
(905, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:13:43', '2021-06-12 04:13:43'),
(906, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:13:44', '2021-06-12 04:13:44'),
(907, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:13:44', '2021-06-12 04:13:44'),
(908, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:13:44', '2021-06-12 04:13:44'),
(909, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:13:44', '2021-06-12 04:13:44'),
(910, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:13:45', '2021-06-12 04:13:45'),
(911, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:13:45', '2021-06-12 04:13:45'),
(912, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:13:45', '2021-06-12 04:13:45'),
(913, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:13:46', '2021-06-12 04:13:46'),
(914, 1, 'admin/users/2/edit', 'GET', '::1', '[]', '2021-06-12 04:13:46', '2021-06-12 04:13:46'),
(915, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 04:14:24', '2021-06-12 04:14:24'),
(916, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-12 04:15:32', '2021-06-12 04:15:32'),
(917, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-12 04:15:36', '2021-06-12 04:15:36'),
(918, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 04:16:39', '2021-06-12 04:16:39'),
(919, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 04:16:41', '2021-06-12 04:16:41'),
(920, 1, 'admin/category', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 04:16:43', '2021-06-12 04:16:43'),
(921, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 04:16:45', '2021-06-12 04:16:45'),
(922, 1, 'admin/posts/3,4', 'DELETE', '::1', '{\"_method\":\"delete\",\"_token\":\"BCmPGaanfrBOlBiqzioSlBbD3BsdHHoB4DZiWARg\"}', '2021-06-12 04:16:52', '2021-06-12 04:16:52'),
(923, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 04:16:53', '2021-06-12 04:16:53'),
(924, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"_scope_\":\"trashed\"}', '2021-06-12 04:16:56', '2021-06-12 04:16:56'),
(925, 1, 'admin/posts/3,4,6', 'DELETE', '::1', '{\"_method\":\"delete\",\"_token\":\"BCmPGaanfrBOlBiqzioSlBbD3BsdHHoB4DZiWARg\"}', '2021-06-12 04:17:01', '2021-06-12 04:17:01'),
(926, 1, 'admin/posts', 'GET', '::1', '{\"_scope_\":\"trashed\",\"_pjax\":\"#pjax-container\"}', '2021-06-12 04:17:01', '2021-06-12 04:17:01'),
(927, 1, 'admin/category', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 04:17:05', '2021-06-12 04:17:05'),
(928, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 04:17:19', '2021-06-12 04:17:19'),
(929, 1, 'admin/posts/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 04:17:25', '2021-06-12 04:17:25'),
(930, 1, 'admin/posts', 'POST', '::1', '{\"title\":\"B\\u1ea3ng x\\u1ebfp h\\u1ea1ng v\\u00f2ng lo\\u1ea1i World Cup: Vi\\u1ec7t Nam th\\u1eafng li\\u1ec1n hai tr\\u1eadn \\u0111\\u00e3 gi\\u00e0nh v\\u00e9 hay ch\\u01b0a?\",\"slug\":null,\"desc_short\":\"\\u0110T Vi\\u1ec7t Nam \\u0111\\u00e3 gi\\u00e0nh quy\\u1ec1n \\u0111i ti\\u1ebfp hay ch\\u01b0a sau chi\\u1ebfn th\\u1eafng k\\u1ecbch t\\u00ednh tr\\u01b0\\u1edbc \\u0110T Malaysia \\u1edf v\\u00f2ng lo\\u1ea1i World Cup 2022.\",\"body\":\"<p>L\\u01b0\\u1ee3t \\u0111\\u1ea5u &aacute;p ch&oacute;t b\\u1ea3ng G v&ograve;ng lo\\u1ea1i th\\u1ee9 hai&nbsp;<a href=\\\"https:\\/\\/www.24h.com.vn\\/world-cup-2022-c48e2601.html\\\" title=\\\"World Cup 2022\\\">World Cup 2022<\\/a>&nbsp;khu v\\u1ef1c ch&acirc;u &Aacute;, hai c\\u1eb7p \\u0111\\u1ea5u l&agrave;&nbsp;<a href=\\\"https:\\/\\/www.24h.com.vn\\/doi-tuyen-viet-nam-c48e3410.html\\\" title=\\\"\\u0110T Vi\\u1ec7t Nam\\\">\\u0110T Vi\\u1ec7t Nam<\\/a>&nbsp;&ndash; \\u0110T Malaysia v&agrave; \\u0110T UAE &ndash; \\u0110T Indonesia trong khi \\u0110T Th&aacute;i Lan \\u0111\\u01b0\\u1ee3c ngh\\u1ec9. K\\u1ebft qu\\u1ea3 c\\u1ee7a hai tr\\u1eadn \\u0111\\u1ea5u n&agrave;y s\\u1ebd \\u1ea3nh h\\u01b0\\u1edfng tr\\u1ef1c ti\\u1ebfp t\\u1edbi v\\u1ecb tr&iacute; tr&ecirc;n b\\u1ea3ng x\\u1ebfp h\\u1ea1ng.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p><img alt=\\\"B\\u1ea3ng x\\u1ebfp h\\u1ea1ng v\\u00f2ng lo\\u1ea1i World Cup: Vi\\u1ec7t Nam th\\u1eafng li\\u1ec1n hai tr\\u1eadn \\u0111\\u00e3 gi\\u00e0nh v\\u00e9 hay ch\\u01b0a? - 1\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-06-12\\/Cuc-nong-BXH-vong-loai-World-Cup-Viet-Nam-da-gianh-quyen-di-tiep-hay-chua-5-660-1623438234-593-width660height439.jpg\\\" \\/><\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>\\u0110T Vi\\u1ec7t Nam gi&agrave;nh tr\\u1ecdn 3 \\u0111i\\u1ec3m tr\\u01b0\\u1edbc \\u0110T Malaysia<\\/p>\\r\\n\\r\\n<p>Th\\u1ea7y tr&ograve; HLV Park Hang Seo c\\u1ea7n 3 \\u0111i\\u1ec3m \\u0111\\u1ec3 n\\u1eafm ch\\u1eafc ng&ocirc;i \\u0111\\u1ea7u v&agrave; &ldquo;\\u0110o&agrave;n qu&acirc;n sao v&agrave;ng&rdquo; \\u0111&atilde; \\u0111\\u1ea1t \\u0111\\u01b0\\u1ee3c m\\u1ee5c ti&ecirc;u. \\u0110T Vi\\u1ec7t Nam nh\\u1eadp cu\\u1ed9c t\\u1ed1t h\\u01a1n Malaysia v&agrave; s\\u1edbm t\\u1ea1o \\u0111\\u01b0\\u1ee3c nh\\u1eefng c\\u01a1 h\\u1ed9i. Tuy nhi&ecirc;n, \\u0111\\u1ed9i b&oacute;ng m\\u1eb7c &aacute;o \\u0111\\u1ecf c\\u0169ng ph\\u1ea3i t\\u1edbi ph&uacute;t 27 m\\u1edbi c&oacute; b&agrave;n m\\u1edf t\\u1ec9 s\\u1ed1.<\\/p>\\r\\n\\r\\n<p>Ng\\u01b0\\u1eddi l\\u1eadp c&ocirc;ng l&agrave; ti\\u1ec1n \\u0111\\u1ea1o Ti\\u1ebfn Linh v\\u1edbi c&uacute; \\u0111&aacute;nh \\u0111\\u1ea7u c\\u1ef1c m\\u1ea1nh \\u1edf c\\u1ef1 ly g\\u1ea7n. Tr\\u01b0\\u1edbc \\u0111&oacute;, s\\u1ed1 22 c\\u1ee7a \\u0110T Vi\\u1ec7t Nam b\\u1ecf l\\u1ee1 m\\u1ed9t c\\u01a1 h\\u1ed9i c\\u1ef1c k\\u1ef3 ngon \\u0103n. N\\u1eeda cu\\u1ed1i hi\\u1ec7p m\\u1ed9t, Malaysia \\u0111&atilde; d\\u1ed3n l&ecirc;n t\\u1ea5n c&ocirc;ng nh\\u01b0ng th\\u1ee7 th&agrave;nh T\\u1ea5n Tr\\u01b0\\u1eddng thi \\u0111\\u1ea5u c\\u1ef1c k\\u1ef3 xu\\u1ea5t s\\u1eafc.<\\/p>\\r\\n\\r\\n<p>Sang hi\\u1ec7p hai, \\u0110T Vi\\u1ec7t Nam ti\\u1ebfp t\\u1ee5c l&agrave; \\u0111\\u1ed9i t\\u1ea1o \\u0111\\u01b0\\u1ee3c nhi\\u1ec1u c\\u01a1 h\\u1ed9i h\\u01a1n nh\\u01b0ng c&aacute;c ch&acirc;n s&uacute;t &aacute;o \\u0111\\u1ecf l\\u1ea1i phung ph&iacute; c\\u01a1 h\\u1ed9i. Malaysia b\\u1ea5t ng\\u1edd c&oacute; b&agrave;n g\\u1ee1 \\u1edf ph&uacute;t 73 tr&ecirc;n ch\\u1ea5m ph\\u1ea1t \\u0111\\u1ec1n sau khi V\\u0103n H\\u1eadu \\u0111\\u1ec3 b&oacute;ng ch\\u1ea1m tay trong v&ograve;ng c\\u1ea5m.<\\/p>\\r\\n\\r\\n<p>Tuy nhi&ecirc;n, HLV Park Hang Seo l\\u1ea1i cho th\\u1ea5y kh\\u1ea3 n\\u0103ng thay ng\\u01b0\\u1eddi tuy\\u1ec7t h\\u1ea3o. Ti\\u1ec1n \\u0111\\u1ea1o v&agrave;o s&acirc;n thay ng\\u01b0\\u1eddi V\\u0103n To&agrave;n b\\u1ecb ph\\u1ea1m l\\u1ed7i trong v&ograve;ng c\\u1ea5m v&agrave; \\u0111\\u1ed9i tr\\u01b0\\u1edfng Qu\\u1ebf Ng\\u1ecdc H\\u1ea3i kh&ocirc;ng b\\u1ecf l\\u1ee1 c\\u01a1 h\\u1ed9i tr&ecirc;m ch\\u1ea5m 11m \\u0111\\u1ec3 \\u1ea5n \\u0111\\u1ecbnh t\\u1ec9 s\\u1ed1 2-1.<\\/p>\\r\\n\\r\\n<p>Ba \\u0111i\\u1ec3m qu&yacute; gi&aacute; n&agrave;y gi&uacute;p \\u0110T Vi\\u1ec7t Nam c&oacute; \\u0111\\u01b0\\u1ee3c 17 \\u0111i\\u1ec3m sau 7 tr\\u1eadn \\u0111\\u1ea5u v&agrave; n\\u1eafm gi\\u1eef l\\u1ee3i th\\u1ebf l\\u1edbn tr\\u01b0\\u1edbc khi ti\\u1ebfn v&agrave;o tr\\u1eadn \\u0111\\u1ea5u cu\\u1ed1i v\\u1edbi UAE. \\u0110\\u1ed9i b&oacute;ng v&ugrave;ng T&acirc;y &Aacute; c\\u0169ng \\u0111&atilde; c&oacute; chi\\u1ebfn th\\u1eafng \\u0111\\u1eadm \\u0111&agrave; tr\\u01b0\\u1edbc \\u0110T Indonesia \\u0111\\u1ec3 ti\\u1ebfp t\\u1ee5c n\\u1eafm gi\\u1eef v\\u1ecb tr&iacute; th\\u1ee9 hai.<\\/p>\\r\\n\\r\\n<p><img alt=\\\"B\\u1ea3ng x\\u1ebfp h\\u1ea1ng v\\u00f2ng lo\\u1ea1i World Cup: Vi\\u1ec7t Nam th\\u1eafng li\\u1ec1n hai tr\\u1eadn \\u0111\\u00e3 gi\\u00e0nh v\\u00e9 hay ch\\u01b0a? - 3\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-06-12\\/Cuc-nong-BXH-vong-loai-World-Cup-Viet-Nam-da-gianh-quyen-di-tiep-hay-chua-11-660-1623438389-185-width660height330.jpg\\\" \\/><\\/p>\\r\\n\\r\\n<p>\\u0110T UAE th\\u1eafng \\u0111\\u1eadm \\u0110T Indonesia<\\/p>\\r\\n\\r\\n<p>UAE &aacute;p \\u0111\\u1ea3o ho&agrave;n to&agrave;n tr\\u01b0\\u1edbc Indonesia v&agrave; v\\u01b0\\u1ee3t l&ecirc;n d\\u1eabn tr\\u01b0\\u1edbc 3-0 ch\\u1ec9 sau 45 ph&uacute;t \\u0111\\u1ea7u ti&ecirc;n. \\u0110\\u1ea1i di\\u1ec7n c\\u1ee7a \\u0110&ocirc;ng Nam &Aacute; c&oacute; c\\u01a1 h\\u1ed9i tr&ecirc;n ch\\u1ea5m 11m nh\\u01b0ng Evan Dimas l\\u1ea1i kh&ocirc;ng th\\u1eafng \\u0111\\u01b0\\u1ee3c th\\u1ee7 m&ocirc;n c\\u1ee7a UAE. Sang \\u0111\\u1ebfn hi\\u1ec7p hai, \\u0110T UAE c&oacute; th&ecirc;m 2 b&agrave;n th\\u1eafng \\u0111\\u1ec3 \\u1ea5n \\u0111\\u1ecbnh t\\u1ec9 s\\u1ed1 5-0.<\\/p>\\r\\n\\r\\n<p>Chi\\u1ebfn th\\u1eafng n&agrave;y gi&uacute;p \\u0110T UAE ti\\u1ebfp t\\u1ee5c gi\\u1eef v\\u1ecb tr&iacute; th\\u1ee9 hai tr&ecirc;n b\\u1ea3ng x\\u1ebfp h\\u1ea1ng v\\u1edbi 15 \\u0111i\\u1ec3m. Ba \\u0111i\\u1ec3m qu&yacute; gi&aacute; n&agrave;y c\\u0169ng gi&uacute;p \\u0111\\u1ea1i di\\u1ec7n t\\u1edbi t\\u1eeb T&acirc;y &Aacute; nu&ocirc;i hy v\\u1ecdng gi&agrave;nh v&eacute; tr\\u1ef1c ti\\u1ebfp ti\\u1ebfn v&agrave;o v&ograve;ng trong. \\u1ede tr\\u1eadn \\u0111\\u1ea5u cu\\u1ed1i, h\\u1ecd ch\\u1ec9 c\\u1ea7n th\\u1eafng \\u0110T Vi\\u1ec7t Nam l&agrave; gi&agrave;nh ng&ocirc;i \\u0111\\u1ea7u b\\u1ea3ng.<\\/p>\\r\\n\\r\\n<p>Trong khi \\u0111&oacute;, \\u0111o&agrave;n qu&acirc;n c\\u1ee7a HLV Park Hang Seo ch\\u1ec9 c\\u1ea7n 1 tr\\u1eadn h&ograve;a \\u0111\\u1ec3 gi&agrave;nh quy\\u1ec1n \\u0111i ti\\u1ebfp. Tuy nhi&ecirc;n, \\u0111&acirc;y l&agrave; nhi\\u1ec7m v\\u1ee5 kh&ocirc;ng d\\u1ec5 d&agrave;ng nh\\u1ea5t l&agrave; khi UAE c&oacute; l\\u1ee3i th\\u1ebf \\u0111\\u01b0\\u1ee3c thi \\u0111\\u1ea5u tr&ecirc;n s&acirc;n nh&agrave;. Trong tr\\u01b0\\u1eddng h\\u1ee3p \\u0111\\u1ec3 thua \\u0110T UAE, \\u0110T Vi\\u1ec7t Nam c\\u1ea7n ch\\u1edd k\\u1ebft qu\\u1ea3 c\\u1ee7a nh\\u1eefng b\\u1ea3ng \\u0111\\u1ea5u kh&aacute;c \\u0111\\u1ec3 bi\\u1ebft m&igrave;nh c&oacute; gi&agrave;nh v&eacute; v\\u1edbt \\u1edf b\\u1ea3ng 8 \\u0111\\u1ed9i nh&igrave; b\\u1ea3ng hay kh&ocirc;ng.<\\/p>\\r\\n\\r\\n<p>Hi\\u1ec7n t\\u1ea1i \\u1edf BXH d&agrave;nh cho c&aacute;c \\u0111\\u1ed9i x\\u1ebfp th\\u1ee9 2, \\u0111\\u1ed9i tuy\\u1ec3n Oman \\u0111ang t\\u1ea1m d\\u1eabn \\u0111\\u1ea7u v\\u1edbi 12 \\u0111i\\u1ec3m. \\u0110\\u1ed9i \\u0111\\u1ee9ng th\\u1ee9 2 l&agrave; Trung Qu\\u1ed1c \\u0111ang c&oacute; 10 \\u0111i\\u1ec3m. \\u0110&acirc;y l&agrave; s\\u1ed1 \\u0111i\\u1ec3m c&aacute;c \\u0111\\u1ed9i \\u0111&atilde; b\\u1ecb tr\\u1eeb \\u0111i sau khi kh&ocirc;ng t&iacute;nh k\\u1ebft qu\\u1ea3 v\\u1edbi \\u0111\\u1ed9i x\\u1ebfp cu\\u1ed1i&nbsp;b\\u1ea3ng \\u0111\\u1ea5u do \\u0111\\u1ed9i Tri\\u1ec1u Ti&ecirc;n r&uacute;t lui. Nh\\u01b0 v\\u1eady, n\\u1ebfu nh\\u01b0 \\u0110T Vi\\u1ec7t Nam tr\\u1eeb \\u0111i 6 \\u0111i\\u1ec3m (th\\u1eafng 2 tr\\u1eadn v\\u1edbi \\u0111\\u1ed9i cu\\u1ed1i b\\u1ea3ng l&agrave; Indonesia), ch&uacute;ng ta v\\u1eabn c&oacute; 11 \\u0111i\\u1ec3m v&agrave; \\u0111\\u1ee7 s\\u1ee9c chen ch&acirc;n v&agrave;o top 4 \\u0111\\u1ed9i nh&igrave; b\\u1ea3ng c&oacute; s\\u1ed1 \\u0111i\\u1ec3m cao nh\\u1ea5t \\u0111\\u1ec3 gi&agrave;nh v&eacute; \\u0111i ti\\u1ebfp.<\\/p>\\r\\n\\r\\n<p>\\u0110\\u1ed1i v\\u1edbi ba \\u0111\\u1ed9i tuy\\u1ec3n Th&aacute;i Lan, Malaysia v&agrave; Indonesia, ba \\u0111\\u1ea1i di\\u1ec7n c&ograve;n l\\u1ea1i c\\u1ee7a \\u0110&ocirc;ng Nam &Aacute; \\u0111\\u1ec1u kh&ocirc;ng c&ograve;n c\\u01a1 h\\u1ed9i \\u0111i ti\\u1ebfp v&agrave; l\\u01b0\\u1ee3t \\u0111\\u1ea5u cu\\u1ed1i, tr\\u1eadn \\u0111\\u1ea5u gi\\u1eefa Th&aacute;i Lan v&agrave; Malaysia ch\\u1ec9 c&ograve;n mang &yacute; ngh\\u0129a th\\u1ee7 t\\u1ee5c.<\\/p>\\r\\n\\r\\n<p><strong><em>B\\u1ea3ng x\\u1ebfp h\\u1ea1ng b\\u1ea3ng G sau lo\\u1ea1t \\u0111\\u1ea5u di\\u1ec5n ra ng&agrave;y 12\\/6<\\/em><\\/strong><\\/p>\\r\\n\\r\\n<p><img alt=\\\"B\\u1ea3ng x\\u1ebfp h\\u1ea1ng v\\u00f2ng lo\\u1ea1i World Cup: Vi\\u1ec7t Nam th\\u1eafng li\\u1ec1n hai tr\\u1eadn \\u0111\\u00e3 gi\\u00e0nh v\\u00e9 hay ch\\u01b0a? - 4\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-06-12\\/Cuc-nong-BXH-vong-loai-World-Cup-Viet-Nam-da-gianh-quyen-di-tiep-hay-chua-12-660-1623438566-405-width660height279.jpg\\\" \\/><\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p><em><strong>B\\u1ea3ng x\\u1ebfp h\\u1ea1ng c&aacute;c \\u0111\\u1ed9i x\\u1ebfp th\\u1ee9 2 hi\\u1ec7n t\\u1ea1i<\\/strong><\\/em><\\/p>\\r\\n\\r\\n<p><img alt=\\\"B\\u1ea3ng x\\u1ebfp h\\u1ea1ng v\\u00f2ng lo\\u1ea1i World Cup: Vi\\u1ec7t Nam th\\u1eafng li\\u1ec1n hai tr\\u1eadn \\u0111\\u00e3 gi\\u00e0nh v\\u00e9 hay ch\\u01b0a? - 5\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-06-12\\/Bang-xep-hang-vong-loai-World-Cup-Viet-Nam-thang-lien-hai-tran-da-gianh-ve-hay-chua-bxh-1623459736-665-width604height256.jpg\\\" \\/><\\/p>\",\"category\":[null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/storage\\/app\\/public\\/images\\/blog\\/5-640-1623438675-229-width640height480.jpg\",\"_token\":\"BCmPGaanfrBOlBiqzioSlBbD3BsdHHoB4DZiWARg\",\"after-save\":\"1\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/posts\"}', '2021-06-12 04:20:23', '2021-06-12 04:20:23'),
(931, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-12 04:20:23', '2021-06-12 04:20:23'),
(932, 1, 'admin/category', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 04:20:56', '2021-06-12 04:20:56'),
(933, 1, 'admin/category/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 04:21:20', '2021-06-12 04:21:20'),
(934, 1, 'admin/category', 'POST', '::1', '{\"title\":\"Ki\\u1ebfn th\\u1ee9c\",\"slug\":null,\"_token\":\"BCmPGaanfrBOlBiqzioSlBbD3BsdHHoB4DZiWARg\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/category\"}', '2021-06-12 04:21:30', '2021-06-12 04:21:30'),
(935, 1, 'admin/category/create', 'GET', '::1', '[]', '2021-06-12 04:21:30', '2021-06-12 04:21:30'),
(936, 1, 'admin/category', 'POST', '::1', '{\"title\":\"Tin t\\u1ee9c \\u0111\\u1ea5u gi\\u00e1\",\"slug\":null,\"_token\":\"BCmPGaanfrBOlBiqzioSlBbD3BsdHHoB4DZiWARg\",\"after-save\":\"3\"}', '2021-06-12 04:21:37', '2021-06-12 04:21:37'),
(937, 1, 'admin/category/4', 'GET', '::1', '[]', '2021-06-12 04:21:38', '2021-06-12 04:21:38'),
(938, 1, 'admin/category', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 04:21:40', '2021-06-12 04:21:40'),
(939, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 04:21:43', '2021-06-12 04:21:43'),
(940, 1, 'admin/posts/7/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 04:21:46', '2021-06-12 04:21:46');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(941, 1, 'admin/posts/7', 'PUT', '::1', '{\"title\":\"B\\u1ea3ng x\\u1ebfp h\\u1ea1ng v\\u00f2ng lo\\u1ea1i World Cup: Vi\\u1ec7t Nam th\\u1eafng li\\u1ec1n hai tr\\u1eadn \\u0111\\u00e3 gi\\u00e0nh v\\u00e9 hay ch\\u01b0a?\",\"slug\":\"bang-xep-hang-vong-loai-world-cup-viet-nam-thang-lien-hai-tran-da-gianh-ve-hay-chua\",\"desc_short\":\"\\u0110T Vi\\u1ec7t Nam \\u0111\\u00e3 gi\\u00e0nh quy\\u1ec1n \\u0111i ti\\u1ebfp hay ch\\u01b0a sau chi\\u1ebfn th\\u1eafng k\\u1ecbch t\\u00ednh tr\\u01b0\\u1edbc \\u0110T Malaysia \\u1edf v\\u00f2ng lo\\u1ea1i World Cup 2022.\",\"body\":\"<p>L\\u01b0\\u1ee3t \\u0111\\u1ea5u &aacute;p ch&oacute;t b\\u1ea3ng G v&ograve;ng lo\\u1ea1i th\\u1ee9 hai&nbsp;<a href=\\\"https:\\/\\/www.24h.com.vn\\/world-cup-2022-c48e2601.html\\\" title=\\\"World Cup 2022\\\">World Cup 2022<\\/a>&nbsp;khu v\\u1ef1c ch&acirc;u &Aacute;, hai c\\u1eb7p \\u0111\\u1ea5u l&agrave;&nbsp;<a href=\\\"https:\\/\\/www.24h.com.vn\\/doi-tuyen-viet-nam-c48e3410.html\\\" title=\\\"\\u0110T Vi\\u1ec7t Nam\\\">\\u0110T Vi\\u1ec7t Nam<\\/a>&nbsp;&ndash; \\u0110T Malaysia v&agrave; \\u0110T UAE &ndash; \\u0110T Indonesia trong khi \\u0110T Th&aacute;i Lan \\u0111\\u01b0\\u1ee3c ngh\\u1ec9. K\\u1ebft qu\\u1ea3 c\\u1ee7a hai tr\\u1eadn \\u0111\\u1ea5u n&agrave;y s\\u1ebd \\u1ea3nh h\\u01b0\\u1edfng tr\\u1ef1c ti\\u1ebfp t\\u1edbi v\\u1ecb tr&iacute; tr&ecirc;n b\\u1ea3ng x\\u1ebfp h\\u1ea1ng.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p><img alt=\\\"B\\u1ea3ng x\\u1ebfp h\\u1ea1ng v\\u00f2ng lo\\u1ea1i World Cup: Vi\\u1ec7t Nam th\\u1eafng li\\u1ec1n hai tr\\u1eadn \\u0111\\u00e3 gi\\u00e0nh v\\u00e9 hay ch\\u01b0a? - 1\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-06-12\\/Cuc-nong-BXH-vong-loai-World-Cup-Viet-Nam-da-gianh-quyen-di-tiep-hay-chua-5-660-1623438234-593-width660height439.jpg\\\" \\/><\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>\\u0110T Vi\\u1ec7t Nam gi&agrave;nh tr\\u1ecdn 3 \\u0111i\\u1ec3m tr\\u01b0\\u1edbc \\u0110T Malaysia<\\/p>\\r\\n\\r\\n<p>Th\\u1ea7y tr&ograve; HLV Park Hang Seo c\\u1ea7n 3 \\u0111i\\u1ec3m \\u0111\\u1ec3 n\\u1eafm ch\\u1eafc ng&ocirc;i \\u0111\\u1ea7u v&agrave; &ldquo;\\u0110o&agrave;n qu&acirc;n sao v&agrave;ng&rdquo; \\u0111&atilde; \\u0111\\u1ea1t \\u0111\\u01b0\\u1ee3c m\\u1ee5c ti&ecirc;u. \\u0110T Vi\\u1ec7t Nam nh\\u1eadp cu\\u1ed9c t\\u1ed1t h\\u01a1n Malaysia v&agrave; s\\u1edbm t\\u1ea1o \\u0111\\u01b0\\u1ee3c nh\\u1eefng c\\u01a1 h\\u1ed9i. Tuy nhi&ecirc;n, \\u0111\\u1ed9i b&oacute;ng m\\u1eb7c &aacute;o \\u0111\\u1ecf c\\u0169ng ph\\u1ea3i t\\u1edbi ph&uacute;t 27 m\\u1edbi c&oacute; b&agrave;n m\\u1edf t\\u1ec9 s\\u1ed1.<\\/p>\\r\\n\\r\\n<p>Ng\\u01b0\\u1eddi l\\u1eadp c&ocirc;ng l&agrave; ti\\u1ec1n \\u0111\\u1ea1o Ti\\u1ebfn Linh v\\u1edbi c&uacute; \\u0111&aacute;nh \\u0111\\u1ea7u c\\u1ef1c m\\u1ea1nh \\u1edf c\\u1ef1 ly g\\u1ea7n. Tr\\u01b0\\u1edbc \\u0111&oacute;, s\\u1ed1 22 c\\u1ee7a \\u0110T Vi\\u1ec7t Nam b\\u1ecf l\\u1ee1 m\\u1ed9t c\\u01a1 h\\u1ed9i c\\u1ef1c k\\u1ef3 ngon \\u0103n. N\\u1eeda cu\\u1ed1i hi\\u1ec7p m\\u1ed9t, Malaysia \\u0111&atilde; d\\u1ed3n l&ecirc;n t\\u1ea5n c&ocirc;ng nh\\u01b0ng th\\u1ee7 th&agrave;nh T\\u1ea5n Tr\\u01b0\\u1eddng thi \\u0111\\u1ea5u c\\u1ef1c k\\u1ef3 xu\\u1ea5t s\\u1eafc.<\\/p>\\r\\n\\r\\n<p>Sang hi\\u1ec7p hai, \\u0110T Vi\\u1ec7t Nam ti\\u1ebfp t\\u1ee5c l&agrave; \\u0111\\u1ed9i t\\u1ea1o \\u0111\\u01b0\\u1ee3c nhi\\u1ec1u c\\u01a1 h\\u1ed9i h\\u01a1n nh\\u01b0ng c&aacute;c ch&acirc;n s&uacute;t &aacute;o \\u0111\\u1ecf l\\u1ea1i phung ph&iacute; c\\u01a1 h\\u1ed9i. Malaysia b\\u1ea5t ng\\u1edd c&oacute; b&agrave;n g\\u1ee1 \\u1edf ph&uacute;t 73 tr&ecirc;n ch\\u1ea5m ph\\u1ea1t \\u0111\\u1ec1n sau khi V\\u0103n H\\u1eadu \\u0111\\u1ec3 b&oacute;ng ch\\u1ea1m tay trong v&ograve;ng c\\u1ea5m.<\\/p>\\r\\n\\r\\n<p>Tuy nhi&ecirc;n, HLV Park Hang Seo l\\u1ea1i cho th\\u1ea5y kh\\u1ea3 n\\u0103ng thay ng\\u01b0\\u1eddi tuy\\u1ec7t h\\u1ea3o. Ti\\u1ec1n \\u0111\\u1ea1o v&agrave;o s&acirc;n thay ng\\u01b0\\u1eddi V\\u0103n To&agrave;n b\\u1ecb ph\\u1ea1m l\\u1ed7i trong v&ograve;ng c\\u1ea5m v&agrave; \\u0111\\u1ed9i tr\\u01b0\\u1edfng Qu\\u1ebf Ng\\u1ecdc H\\u1ea3i kh&ocirc;ng b\\u1ecf l\\u1ee1 c\\u01a1 h\\u1ed9i tr&ecirc;m ch\\u1ea5m 11m \\u0111\\u1ec3 \\u1ea5n \\u0111\\u1ecbnh t\\u1ec9 s\\u1ed1 2-1.<\\/p>\\r\\n\\r\\n<p>Ba \\u0111i\\u1ec3m qu&yacute; gi&aacute; n&agrave;y gi&uacute;p \\u0110T Vi\\u1ec7t Nam c&oacute; \\u0111\\u01b0\\u1ee3c 17 \\u0111i\\u1ec3m sau 7 tr\\u1eadn \\u0111\\u1ea5u v&agrave; n\\u1eafm gi\\u1eef l\\u1ee3i th\\u1ebf l\\u1edbn tr\\u01b0\\u1edbc khi ti\\u1ebfn v&agrave;o tr\\u1eadn \\u0111\\u1ea5u cu\\u1ed1i v\\u1edbi UAE. \\u0110\\u1ed9i b&oacute;ng v&ugrave;ng T&acirc;y &Aacute; c\\u0169ng \\u0111&atilde; c&oacute; chi\\u1ebfn th\\u1eafng \\u0111\\u1eadm \\u0111&agrave; tr\\u01b0\\u1edbc \\u0110T Indonesia \\u0111\\u1ec3 ti\\u1ebfp t\\u1ee5c n\\u1eafm gi\\u1eef v\\u1ecb tr&iacute; th\\u1ee9 hai.<\\/p>\\r\\n\\r\\n<p><img alt=\\\"B\\u1ea3ng x\\u1ebfp h\\u1ea1ng v\\u00f2ng lo\\u1ea1i World Cup: Vi\\u1ec7t Nam th\\u1eafng li\\u1ec1n hai tr\\u1eadn \\u0111\\u00e3 gi\\u00e0nh v\\u00e9 hay ch\\u01b0a? - 3\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-06-12\\/Cuc-nong-BXH-vong-loai-World-Cup-Viet-Nam-da-gianh-quyen-di-tiep-hay-chua-11-660-1623438389-185-width660height330.jpg\\\" \\/><\\/p>\\r\\n\\r\\n<p>\\u0110T UAE th\\u1eafng \\u0111\\u1eadm \\u0110T Indonesia<\\/p>\\r\\n\\r\\n<p>UAE &aacute;p \\u0111\\u1ea3o ho&agrave;n to&agrave;n tr\\u01b0\\u1edbc Indonesia v&agrave; v\\u01b0\\u1ee3t l&ecirc;n d\\u1eabn tr\\u01b0\\u1edbc 3-0 ch\\u1ec9 sau 45 ph&uacute;t \\u0111\\u1ea7u ti&ecirc;n. \\u0110\\u1ea1i di\\u1ec7n c\\u1ee7a \\u0110&ocirc;ng Nam &Aacute; c&oacute; c\\u01a1 h\\u1ed9i tr&ecirc;n ch\\u1ea5m 11m nh\\u01b0ng Evan Dimas l\\u1ea1i kh&ocirc;ng th\\u1eafng \\u0111\\u01b0\\u1ee3c th\\u1ee7 m&ocirc;n c\\u1ee7a UAE. Sang \\u0111\\u1ebfn hi\\u1ec7p hai, \\u0110T UAE c&oacute; th&ecirc;m 2 b&agrave;n th\\u1eafng \\u0111\\u1ec3 \\u1ea5n \\u0111\\u1ecbnh t\\u1ec9 s\\u1ed1 5-0.<\\/p>\\r\\n\\r\\n<p>Chi\\u1ebfn th\\u1eafng n&agrave;y gi&uacute;p \\u0110T UAE ti\\u1ebfp t\\u1ee5c gi\\u1eef v\\u1ecb tr&iacute; th\\u1ee9 hai tr&ecirc;n b\\u1ea3ng x\\u1ebfp h\\u1ea1ng v\\u1edbi 15 \\u0111i\\u1ec3m. Ba \\u0111i\\u1ec3m qu&yacute; gi&aacute; n&agrave;y c\\u0169ng gi&uacute;p \\u0111\\u1ea1i di\\u1ec7n t\\u1edbi t\\u1eeb T&acirc;y &Aacute; nu&ocirc;i hy v\\u1ecdng gi&agrave;nh v&eacute; tr\\u1ef1c ti\\u1ebfp ti\\u1ebfn v&agrave;o v&ograve;ng trong. \\u1ede tr\\u1eadn \\u0111\\u1ea5u cu\\u1ed1i, h\\u1ecd ch\\u1ec9 c\\u1ea7n th\\u1eafng \\u0110T Vi\\u1ec7t Nam l&agrave; gi&agrave;nh ng&ocirc;i \\u0111\\u1ea7u b\\u1ea3ng.<\\/p>\\r\\n\\r\\n<p>Trong khi \\u0111&oacute;, \\u0111o&agrave;n qu&acirc;n c\\u1ee7a HLV Park Hang Seo ch\\u1ec9 c\\u1ea7n 1 tr\\u1eadn h&ograve;a \\u0111\\u1ec3 gi&agrave;nh quy\\u1ec1n \\u0111i ti\\u1ebfp. Tuy nhi&ecirc;n, \\u0111&acirc;y l&agrave; nhi\\u1ec7m v\\u1ee5 kh&ocirc;ng d\\u1ec5 d&agrave;ng nh\\u1ea5t l&agrave; khi UAE c&oacute; l\\u1ee3i th\\u1ebf \\u0111\\u01b0\\u1ee3c thi \\u0111\\u1ea5u tr&ecirc;n s&acirc;n nh&agrave;. Trong tr\\u01b0\\u1eddng h\\u1ee3p \\u0111\\u1ec3 thua \\u0110T UAE, \\u0110T Vi\\u1ec7t Nam c\\u1ea7n ch\\u1edd k\\u1ebft qu\\u1ea3 c\\u1ee7a nh\\u1eefng b\\u1ea3ng \\u0111\\u1ea5u kh&aacute;c \\u0111\\u1ec3 bi\\u1ebft m&igrave;nh c&oacute; gi&agrave;nh v&eacute; v\\u1edbt \\u1edf b\\u1ea3ng 8 \\u0111\\u1ed9i nh&igrave; b\\u1ea3ng hay kh&ocirc;ng.<\\/p>\\r\\n\\r\\n<p>Hi\\u1ec7n t\\u1ea1i \\u1edf BXH d&agrave;nh cho c&aacute;c \\u0111\\u1ed9i x\\u1ebfp th\\u1ee9 2, \\u0111\\u1ed9i tuy\\u1ec3n Oman \\u0111ang t\\u1ea1m d\\u1eabn \\u0111\\u1ea7u v\\u1edbi 12 \\u0111i\\u1ec3m. \\u0110\\u1ed9i \\u0111\\u1ee9ng th\\u1ee9 2 l&agrave; Trung Qu\\u1ed1c \\u0111ang c&oacute; 10 \\u0111i\\u1ec3m. \\u0110&acirc;y l&agrave; s\\u1ed1 \\u0111i\\u1ec3m c&aacute;c \\u0111\\u1ed9i \\u0111&atilde; b\\u1ecb tr\\u1eeb \\u0111i sau khi kh&ocirc;ng t&iacute;nh k\\u1ebft qu\\u1ea3 v\\u1edbi \\u0111\\u1ed9i x\\u1ebfp cu\\u1ed1i&nbsp;b\\u1ea3ng \\u0111\\u1ea5u do \\u0111\\u1ed9i Tri\\u1ec1u Ti&ecirc;n r&uacute;t lui. Nh\\u01b0 v\\u1eady, n\\u1ebfu nh\\u01b0 \\u0110T Vi\\u1ec7t Nam tr\\u1eeb \\u0111i 6 \\u0111i\\u1ec3m (th\\u1eafng 2 tr\\u1eadn v\\u1edbi \\u0111\\u1ed9i cu\\u1ed1i b\\u1ea3ng l&agrave; Indonesia), ch&uacute;ng ta v\\u1eabn c&oacute; 11 \\u0111i\\u1ec3m v&agrave; \\u0111\\u1ee7 s\\u1ee9c chen ch&acirc;n v&agrave;o top 4 \\u0111\\u1ed9i nh&igrave; b\\u1ea3ng c&oacute; s\\u1ed1 \\u0111i\\u1ec3m cao nh\\u1ea5t \\u0111\\u1ec3 gi&agrave;nh v&eacute; \\u0111i ti\\u1ebfp.<\\/p>\\r\\n\\r\\n<p>\\u0110\\u1ed1i v\\u1edbi ba \\u0111\\u1ed9i tuy\\u1ec3n Th&aacute;i Lan, Malaysia v&agrave; Indonesia, ba \\u0111\\u1ea1i di\\u1ec7n c&ograve;n l\\u1ea1i c\\u1ee7a \\u0110&ocirc;ng Nam &Aacute; \\u0111\\u1ec1u kh&ocirc;ng c&ograve;n c\\u01a1 h\\u1ed9i \\u0111i ti\\u1ebfp v&agrave; l\\u01b0\\u1ee3t \\u0111\\u1ea5u cu\\u1ed1i, tr\\u1eadn \\u0111\\u1ea5u gi\\u1eefa Th&aacute;i Lan v&agrave; Malaysia ch\\u1ec9 c&ograve;n mang &yacute; ngh\\u0129a th\\u1ee7 t\\u1ee5c.<\\/p>\\r\\n\\r\\n<p><strong><em>B\\u1ea3ng x\\u1ebfp h\\u1ea1ng b\\u1ea3ng G sau lo\\u1ea1t \\u0111\\u1ea5u di\\u1ec5n ra ng&agrave;y 12\\/6<\\/em><\\/strong><\\/p>\\r\\n\\r\\n<p><img alt=\\\"B\\u1ea3ng x\\u1ebfp h\\u1ea1ng v\\u00f2ng lo\\u1ea1i World Cup: Vi\\u1ec7t Nam th\\u1eafng li\\u1ec1n hai tr\\u1eadn \\u0111\\u00e3 gi\\u00e0nh v\\u00e9 hay ch\\u01b0a? - 4\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-06-12\\/Cuc-nong-BXH-vong-loai-World-Cup-Viet-Nam-da-gianh-quyen-di-tiep-hay-chua-12-660-1623438566-405-width660height279.jpg\\\" \\/><\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p><em><strong>B\\u1ea3ng x\\u1ebfp h\\u1ea1ng c&aacute;c \\u0111\\u1ed9i x\\u1ebfp th\\u1ee9 2 hi\\u1ec7n t\\u1ea1i<\\/strong><\\/em><\\/p>\\r\\n\\r\\n<p><img alt=\\\"B\\u1ea3ng x\\u1ebfp h\\u1ea1ng v\\u00f2ng lo\\u1ea1i World Cup: Vi\\u1ec7t Nam th\\u1eafng li\\u1ec1n hai tr\\u1eadn \\u0111\\u00e3 gi\\u00e0nh v\\u00e9 hay ch\\u01b0a? - 5\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-06-12\\/Bang-xep-hang-vong-loai-World-Cup-Viet-Nam-thang-lien-hai-tran-da-gianh-ve-hay-chua-bxh-1623459736-665-width604height256.jpg\\\" \\/><\\/p>\",\"category\":[\"3\",null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/storage\\/app\\/public\\/images\\/blog\\/5-640-1623438675-229-width640height480.jpg\",\"_token\":\"BCmPGaanfrBOlBiqzioSlBbD3BsdHHoB4DZiWARg\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/posts\"}', '2021-06-12 04:21:52', '2021-06-12 04:21:52'),
(942, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-12 04:21:52', '2021-06-12 04:21:52'),
(943, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 04:24:01', '2021-06-12 04:24:01'),
(944, 1, 'admin/posts/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 04:24:03', '2021-06-12 04:24:03'),
(945, 1, 'admin/posts', 'POST', '::1', '{\"title\":\"V\\u1ebd ch\\u00e2n dung kh\\u00e1ch h\\u00e0ng s\\u0103n si\\u00eau ph\\u1ea9m Sun Marina Town\",\"slug\":null,\"desc_short\":\"Kh\\u00f4ng ch\\u1ec9 g\\u00e2y \\u1ea5n t\\u01b0\\u1ee3ng b\\u1edfi con s\\u1ed1 1.000 c\\u0103n h\\u1ed9 Sun Marina Town t\\u00ecm \\u0111\\u01b0\\u1ee3c ch\\u1ee7 nh\\u00e2n trong v\\u1ecfn v\\u1eb9n 1 tu\\u1ea7n m\\u00e0 th\\u1eddi gian \\u201cch\\u1ed1t c\\u0103n\\u201d c\\u1ee7a c\\u00e1c ch\\u1ee7 nh\\u00e2n t\\u01b0\\u01a1ng lai c\\u0169ng ch\\u1ec9 trong v\\u00e0i ph\\u00fat t\\u1edbi 1 ng\\u00e0y, th\\u1eadm ch\\u00ed ngay trong \\u0111\\u00eam gi\\u1ecf h\\u00e0ng \\u0111\\u01b0\\u1ee3c m\\u1edf. Ch\\u00e2n dung nh\\u1eefng ch\\u1ee7 nh\\u00e2n tinh hoa c\\u1ee7a Sun Marina Town nh\\u01b0 th\\u1ebf n\\u00e0o v\\u00e0 \\u0111\\u00e2u l\\u00e0 \\u201cs\\u1ee9 m\\u1ec7nh\\u201d quy\\u1ebft \\u0111\\u1ecbnh c\\u1ee7a si\\u00eau ph\\u1ea9m n\\u00e0y?\",\"body\":\"<p><strong>Second-home x\\u1ee9ng t\\u1ea7m th\\u01b0\\u1ee3ng l\\u01b0u<\\/strong><\\/p>\\r\\n\\r\\n<p>37 tu\\u1ed5i, \\u0111i\\u1ec1u h&agrave;nh m\\u1ed9t c&ocirc;ng ty chuy&ecirc;n v\\u1ec1 logistic c\\u1ee7a gia \\u0111&igrave;nh t\\u1ea1i H\\u1ea3i Ph&ograve;ng, anh Ho&agrave;ng Nam cho bi\\u1ebft do t&iacute;nh ch\\u1ea5t c&ocirc;ng vi\\u1ec7c n&ecirc;n anh th\\u01b0\\u1eddng xuy&ecirc;n \\u0111i c&ocirc;ng t&aacute;c t\\u1ea1i Qu\\u1ea3ng Ninh 1 th&aacute;ng v&agrave;i l\\u1ea7n. V\\u1edbi kho\\u1ea3n ti\\u1ec1n nh&agrave;n r\\u1ed7i kho\\u1ea3ng 5-6 t\\u1ef7, anh d\\u1ef1 t&iacute;nh s\\u1ebd mua m\\u1ed9t c\\u0103n h\\u1ed9 t\\u1ea1i B&atilde;i Ch&aacute;y l&agrave;m second-home, v\\u1eeba \\u0111\\u1ec3 thu\\u1eadn ti\\u1ec7n ngh\\u1ec9 ng\\u01a1i l&uacute;c l&agrave;m vi\\u1ec7c c\\u0169ng nh\\u01b0 \\u0111\\u1ec3 gia \\u0111&igrave;nh tho\\u1ea3i m&aacute;i ngh\\u1ec9 d\\u01b0\\u1ee1ng d\\u1ecbp l\\u1ec5 t\\u1ebft hay cu\\u1ed1i tu\\u1ea7n. &nbsp;&nbsp;&nbsp;<\\/p>\\r\\n\\r\\n<p>&ldquo;C\\u0103n h\\u1ed9 m&agrave; t&ocirc;i mua ph\\u1ea3i n\\u1eb1m \\u1edf trung t&acirc;m B&atilde;i Ch&aacute;y \\u0111\\u1ec3 gia \\u0111&igrave;nh ch\\u1ec9 m\\u1ed9t b\\u01b0\\u1edbc ch&acirc;n t\\u1edbi bi\\u1ec3n. V&igrave; c&oacute; \\u0111\\u1ee7 c&aacute;c th\\u1ebf h\\u1ec7 n&ecirc;n t&ocirc;i mu\\u1ed1n m\\u1ed9t n\\u01a1i \\u0111&aacute;p \\u1ee9ng \\u0111\\u1ee7 nhu c\\u1ea7u mua s\\u1eafm, gi\\u1ea3i tr&iacute;, tham quan, ngh\\u1ec9 d\\u01b0\\u1ee1ng c\\u1ee7a c\\u1ea3 nh&agrave;. \\u0110\\u1eb7c bi\\u1ec7t t&ocirc;i th&iacute;ch \\u1edf c\\u0103n h\\u1ed9 cao t\\u1ea7ng v&igrave; c&oacute; view th\\u1eb3ng ra V\\u1ecbnh H\\u1ea1 Long. T&ocirc;i \\u0111&atilde; t&igrave;m hi\\u1ec3u r\\u1ea5t nhi\\u1ec1u d\\u1ef1 &aacute;n quanh b&atilde;i bi\\u1ec3n, song ngay khi \\u0111\\u01b0\\u1ee3c t\\u01b0 v\\u1ea5n v\\u1ec1 t\\u1ed5 h\\u1ee3p Sun Marina c\\u1ea1nh C\\u1ea3ng t&agrave;u qu\\u1ed1c t\\u1ebf H\\u1ea1 Long, v\\u1eeba c&oacute; cao t\\u1ea7ng, shophouse, trung t&acirc;m th\\u01b0\\u01a1ng m\\u1ea1i, d\\u1ecbch v\\u1ee5 c&ugrave;ng m\\u1ed9t b\\u1ebfn du thuy\\u1ec1n sang tr\\u1ecdng, t&ocirc;i \\u0111&atilde; \\u0111\\u0103ng k&yacute; ngay m\\u1ed9t c\\u0103n 55m2 c&oacute; 1 ph&ograve;ng ng\\u1ee7 +1 thu\\u1ed9c to&agrave; th&aacute;p Sun Marina Town ch\\u1ec9 trong v&agrave;i ph&uacute;t. Ch\\u1ee7 \\u0111\\u1ea7u t\\u01b0 d\\u1ef1 &aacute;n l&agrave; T\\u1eadp \\u0111o&agrave;n Sun Group c&oacute; uy t&iacute;n tr&ecirc;n th\\u1ecb tr\\u01b0\\u1eddng B\\u0110S cao c\\u1ea5p c\\u0169ng l&agrave; m\\u1ed9t y\\u1ebfu t\\u1ed1 quan tr\\u1ecdng th&uacute;c \\u0111\\u1ea9y t&ocirc;i \\u0111\\u01b0a ra quy\\u1ebft \\u0111\\u1ecbnh nhanh ch&oacute;ng&rdquo;, anh Ho&agrave;ng Nam chia s\\u1ebb.<\\/p>\\r\\n\\r\\n<p><img alt=\\\"V\\u1ebd ch\\u00e2n dung kh\\u00e1ch h\\u00e0ng s\\u0103n si\\u00eau ph\\u1ea9m Sun Marina Town - 1\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-06-11\\/Ve-chan-dung-khach-hang-san-sieu-pham-Sun-Marina-Town----nh-1_t--a-th--p-----i-sun-marina-town-t---a-nh--1623406912-530-width660height371.jpg\\\" \\/><\\/p>\\r\\n\\r\\n<p>T&ograve;a th&aacute;p \\u0111&ocirc;i Sun Marina Town t\\u1ef1a nh\\u01b0 bi\\u1ec3u t\\u01b0\\u1ee3ng du l\\u1ecbch m\\u1edbi c\\u1ee7a H\\u1ea1 Long<\\/p>\\r\\n\\r\\n<p>Theo th\\u1ed1ng k&ecirc; c\\u1ee7a ch\\u1ee7 \\u0111\\u1ea7u t\\u01b0, nh\\u1eefng c\\u0103n h\\u1ed9 n\\u1eb1m g\\u1ea7n c&aacute;c t\\u1ea7ng c&oacute; h\\u1ec7 th\\u1ed1ng ti\\u1ec7n &iacute;ch nh\\u01b0 b\\u1ec3 b\\u01a1i, kh\\u1ed1i nh&agrave; n\\u1ed1i gi\\u1eefa 2 t&ograve;a th&aacute;p&hellip; \\u0111\\u01b0\\u1ee3c kh&aacute;ch h&agrave;ng l&agrave; gia \\u0111&igrave;nh nh\\u1ecf, mua Sun Marina Town l&agrave;m ng&ocirc;i nh&agrave; th\\u1ee9 hai ngh\\u1ec9 d\\u01b0\\u1ee1ng cu\\u1ed1i tu\\u1ea7n \\u0111&oacute;n nh\\u1eadn m\\u1ea1nh m\\u1ebd. B\\u1edfi ch\\u1ee7 \\u0111\\u1ea7u t\\u01b0 d\\u1ef1 ki\\u1ebfn s\\u1ebd thi\\u1ebft k\\u1ebf nh\\u1eefng kh&ocirc;ng gian th\\u01b0 gi&atilde;n \\u0111an xen trong t&ograve;a nh&agrave;. C&aacute;c ki\\u1ebfn tr&uacute;c s\\u01b0 k\\u1ef3 v\\u1ecdng khi\\u1ebfn kh&aacute;ch h&agrave;ng ngay khi b\\u01b0\\u1edbc ch&acirc;n v&agrave;o Sun Marina Town s\\u1ebd c\\u1ea3m th\\u1ea5y nh\\u01b0 \\u0111ang \\u0111\\u1ee9ng tr&ecirc;n \\u0111\\u1ec9nh m\\u1ed9t h&ograve;n \\u0111\\u1ea3o nh\\u1ecf n\\u1eb1m tr&ecirc;n v\\u1ecbnh di s\\u1ea3n H\\u1ea1 Long.<\\/p>\\r\\n\\r\\n<p>Thay v&igrave; l\\u1ef1a ch\\u1ecdn nh\\u1eefng t\\u1ea7ng cao t\\u1ea1i Sun Marina Town, ch\\u1ecb H\\u1ed3ng Anh (40 tu\\u1ed5i) \\u0111\\u1ebfn t\\u1eeb H&agrave; N\\u1ed9i l\\u1ea1i ch\\u1ecdn c\\u0103n h\\u1ed9 studio ngay t\\u1ea7ng th\\u1ea5p. &ldquo;L&agrave;m trong l\\u0129nh v\\u1ef1c kinh doanh du thuy\\u1ec1n n&ecirc;n t&ocirc;i c&oacute; d\\u1ecbp \\u0111i r\\u1ea5t nhi\\u1ec1u qu\\u1ed1c gia tr&ecirc;n th\\u1ebf gi\\u1edbi. T&ocirc;i lu&ocirc;n mong mu\\u1ed1n h&igrave;nh \\u1ea3nh nh\\u1eefng c\\u0103n h\\u1ed9 c&oacute; view tr\\u1ef1c di\\u1ec7n ra nh\\u1eefng b\\u1ebfn du thuy\\u1ec1n, ng\\u1eafm c\\u1ea3nh du thuy\\u1ec1n tr\\u1eafng mu\\u1ed1t ng\\u01b0\\u1ee3c xu&ocirc;i r\\u1ebd s&oacute;ng d\\u01b0\\u1edbi &aacute;nh m\\u1eb7t tr\\u1eddi s\\u1ebd s\\u1edbm xu\\u1ea5t hi\\u1ec7n \\u1edf Vi\\u1ec7t Nam. Sun Marina Town \\u0111&atilde; hi\\u1ec7n th\\u1ef1c h&oacute;a mong \\u01b0\\u1edbc \\u0111&oacute; c\\u1ee7a t&ocirc;i&rdquo;, ch\\u1ecb H\\u1ed3ng Anh chia s\\u1ebb.<\\/p>\\r\\n\\r\\n<p>N\\u1ebfu nh\\u1eefng c\\u0103n h\\u1ed9 t\\u1ea7ng cao c&oacute; view bao qu&aacute;t th&igrave; t\\u1ea7ng th\\u1ea5p c&oacute; t\\u1ea7m nh&igrave;n g\\u1ea7n nh\\u1ea5t, r&otilde; nh\\u1ea5t t\\u1edbi nh\\u1eefng chi\\u1ebfc du thuy\\u1ec1n quanh b\\u1ebfn c\\u1ea3ng s\\u1ea7m u\\u1ea5t. V\\u1eeba \\u0111\\u1ee7 g\\u1ea7n \\u0111\\u1ec3 c\\u1ea3m nh\\u1eadn kh&ocirc;ng kh&iacute; nh\\u1ed9n nh\\u1ecbp xa x\\u1ec9, nh\\u01b0ng c\\u0169ng v\\u1eeba \\u0111\\u1ee7 xa \\u0111\\u1ec3 c&oacute; kh&ocirc;ng gian ri&ecirc;ng t\\u01b0 cho ri&ecirc;ng m&igrave;nh. 1 c\\u0103n h\\u1ed9 second-home cho nh\\u1eefng ng&agrave;y ngh\\u1ec9 cu\\u1ed1i tu\\u1ea7n kh&ocirc;ng kh&aacute;c g&igrave; \\u0111ang ngh\\u1ec9 d\\u01b0\\u1ee1ng \\u1edf Monaco, Singapore hay London, ch\\u1ecb H\\u1ed3ng Anh cho bi\\u1ebft th&ecirc;m.<\\/p>\\r\\n\\r\\n<p>S\\u1edf h\\u1eefu v\\u1ecb tr&iacute; trung t&acirc;m B&atilde;i Ch&aacute;y, li\\u1ec1n k\\u1ec1 V\\u1ecbnh Du thuy\\u1ec1n, \\u0111\\u1ed3ng th\\u1eddi \\u0111\\u01b0\\u1ee3c th\\u1ee5 h\\u01b0\\u1edfng m\\u1ecdi ti\\u1ec7n &iacute;ch c\\u1ee7a h\\u1ec7 sinh th&aacute;i Sun Group t\\u1ea1i \\u0111&acirc;y, th&aacute;p \\u0111&ocirc;i bi\\u1ec3u t\\u01b0\\u1ee3ng 50 t\\u1ea7ng Sun Marina Town tr\\u1edf th&agrave;nh l\\u1ef1a ch\\u1ecdn second-home ngh\\u1ec9 d\\u01b0\\u1ee1ng l&yacute; t\\u01b0\\u1edfng c\\u1ee7a nh\\u1eefng kh&aacute;ch h&agrave;ng t\\u1edbi t\\u1eeb c&aacute;c \\u0111\\u1ecba ph\\u01b0\\u01a1ng quanh Qu\\u1ea3ng Ninh nh\\u01b0 H&agrave; N\\u1ed9i, H\\u1ea3i Ph&ograve;ng, H\\u1ea3i D\\u01b0\\u01a1ng&hellip;<\\/p>\\r\\n\\r\\n<p><strong>Nh&agrave; \\u0111\\u1ea7u t\\u01b0 \\u0111i tr\\u01b0\\u1edbc \\u0111&oacute;n \\u0111\\u1ea7u<\\/strong><\\/p>\\r\\n\\r\\n<p>&ldquo;X&eacute;t v\\u1ec1 t\\u1ef7 l\\u1ec7 th&igrave; kh&aacute;ch h&agrave;ng mua c\\u0103n h\\u1ed9 k\\u1ec1 b&ecirc;n V\\u1ecbnh Du thuy\\u1ec1n Sun Marina Town \\u0111\\u1ec3 \\u1edf, l&agrave;m second-home chi\\u1ebfm kho\\u1ea3ng 60%. \\u0110&acirc;y l&agrave; t\\u1ec7p kh&aacute;ch h&agrave;ng c&oacute; \\u0111i\\u1ec1u ki\\u1ec7n kinh t\\u1ebf, nhu c\\u1ea7u tr\\u1ea3i nghi\\u1ec7m cao m&agrave; nh\\u1eefng d\\u1ef1 &aacute;n th&ocirc;ng th\\u01b0\\u1eddng ch\\u01b0a \\u0111\\u1ee7 \\u0111\\u1ec3 th\\u1ecfa m&atilde;n h\\u1ecd. Tuy nhi&ecirc;n, b&ecirc;n c\\u1ea1nh \\u0111&oacute;, l\\u01b0\\u1ee3ng kh&aacute;ch h&agrave;ng t&igrave;m \\u0111\\u1ebfn Sun Marina Town \\u0111\\u1ec3 \\u0111\\u1ea7u t\\u01b0 c\\u0169ng kh&ocirc;ng ph\\u1ea3i &iacute;t, chi\\u1ebfm 40% c&ograve;n l\\u1ea1i. H\\u1ecd th\\u01b0\\u1eddng l&agrave; nh\\u1eefng nh&agrave; \\u0111\\u1ea7u t\\u01b0 d&agrave;i h\\u1ea1n, \\u0111&atilde; c&oacute; nhi\\u1ec1u kinh nghi\\u1ec7m chinh chi\\u1ebfn tr&ecirc;n th\\u1ecb tr\\u01b0\\u1eddng b\\u1ea5t \\u0111\\u1ed9ng s\\u1ea3n, t\\u1eebng s\\u1edf h\\u1eefu m\\u1ed9t s\\u1ed1 si&ecirc;u ph\\u1ea9m ngh\\u1ec9 d\\u01b0\\u1ee1ng c\\u1ee7a T\\u1eadp \\u0111o&agrave;n Sun Group&rdquo;, m\\u1ed9t \\u0111\\u1ea1i di\\u1ec7n \\u0111\\u1ea1i l&yacute; ph&acirc;n ph\\u1ed1i d\\u1ef1 &aacute;n cho bi\\u1ebft.<\\/p>\\r\\n\\r\\n<p><img alt=\\\"V\\u1ebd ch\\u00e2n dung kh\\u00e1ch h\\u00e0ng s\\u0103n si\\u00eau ph\\u1ea9m Sun Marina Town - 2\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-06-11\\/Ve-chan-dung-khach-hang-san-sieu-pham-Sun-Marina-Town----nh-2_view-tr--c-tuy---t-chinh-ph---c-nh---------1623406912-786-width660height330.jpg\\\" \\/><\\/p>\\r\\n\\r\\n<p>View tr&aacute;c tuy\\u1ec7t chinh ph\\u1ee5c nh&agrave; \\u0111\\u1ea7u t\\u01b0 c\\u1ee7a Sun Marina Town<\\/p>\\r\\n\\r\\n<p>Nh\\u1eefng nh&agrave; \\u0111\\u1ea7u t\\u01b0 l&acirc;u n\\u0103m tr&ecirc;n th\\u1ecb tr\\u01b0\\u1eddng b\\u1ea5t \\u0111\\u1ed9ng s\\u1ea3n \\u0111&atilde; tr\\u1ea3i qua m\\u1ecdi chu k\\u1ef3 n&oacute;ng s\\u1ed1t c\\u1ee7a th\\u1ecb tr\\u01b0\\u1eddng \\u0111\\u1ecba \\u1ed1c v&agrave; th\\u01b0\\u1eddng l\\u1ef1a ch\\u1ecdn \\u0111&uacute;ng ph&acirc;n kh&uacute;c ph&ugrave; h\\u1ee3p v\\u1edbi kh\\u1ea3 n\\u0103ng t&agrave;i ch&iacute;nh c\\u0169ng nh\\u01b0 c&oacute; ti\\u1ec1m n\\u0103ng sinh l\\u1eddi cao.<\\/p>\\r\\n\\r\\n<p>Nh\\u01b0 anh Ng\\u1ecdc Ph\\u01b0\\u01a1ng, nh&agrave; \\u0111\\u1ea7u t\\u01b0 t\\u1eeb H\\u1ea3i D\\u01b0\\u01a1ng, hi\\u1ec7n \\u0111ang l&agrave; ch\\u1ee7 nh&acirc;n c\\u1ee7a 3 c\\u0103n studio Sun Marina Town ph&acirc;n t&iacute;ch: &ldquo;T&ocirc;i \\u0111&atilde; th\\u1ee9c xuy&ecirc;n \\u0111&ecirc;m \\u0111\\u1ec3 \\u0111\\u0103ng k&yacute; \\u0111\\u1eb7t ch\\u1ed7 3 c\\u0103n studio c&oacute; v\\u1ecb tr&iacute; \\u0111\\u1eb9p nh\\u1ea5t d\\u1ef1 &aacute;n. X&eacute;t v\\u1ec1 ti\\u1ec1m n\\u0103ng du l\\u1ecbch \\u1edf mi\\u1ec1n B\\u1eafc c&oacute; l\\u1ebd B&atilde;i Ch&aacute;y x\\u1ee9ng \\u0111&aacute;ng l&agrave; t&acirc;m \\u0111i\\u1ec3m. Hi\\u1ebfm n\\u01a1i n&agrave;o v\\u1eeba l&agrave; di s\\u1ea3n thi&ecirc;n nhi&ecirc;n th\\u1ebf gi\\u1edbi, v\\u1eeba h\\u1ed9i t\\u1ee5 \\u0111\\u1ee7 h\\u1ea1 t\\u1ea7ng giao th&ocirc;ng thu\\u1eadn ti\\u1ec7n l\\u1eabn nhi\\u1ec1u nh&agrave; \\u0111\\u1ea7u t\\u01b0 l\\u1edbn c&ugrave;ng ph&aacute;t tri\\u1ec3n nh\\u01b0 \\u1edf \\u0111&acirc;y. Kh&aacute;ch du l\\u1ecbch c&oacute; xu h\\u01b0\\u1edbng ngh\\u1ec9 t\\u1ea1i ph&ograve;ng view bi\\u1ec3n, thu\\u1eadn ti\\u1ec7n \\u0103n u\\u1ed1ng, mua s\\u1eafm, gi\\u1ea3i tr&iacute;. Sun Marina Town c&ograve;n s\\u1edf h\\u1eefu b\\u1ebfn du thuy\\u1ec1n ri&ecirc;ng v\\u1edbi nhi\\u1ec1u ti\\u1ec7n &iacute;ch h\\u1ea1ng sang nh\\u01b0 4 b\\u1ec3 b\\u01a1i qu\\u1ed1c t\\u1ebf, c&ocirc;ng vi&ecirc;n c\\u1ea3nh quan, qu\\u1ea3ng tr\\u01b0\\u1eddng n\\u1ed9i khu, ng\\u1ecdn H\\u1ea3i \\u0110\\u0103ng bi\\u1ec3u t\\u01b0\\u1ee3ng... So s&aacute;nh v\\u1edbi nh\\u1eefng h\\u1ec7 sinh th&aacute;i m&agrave; Sun Group \\u0111ang x&acirc;y d\\u1ef1ng \\u1edf Ph&uacute; Qu\\u1ed1c hay t\\u1ed5 h\\u1ee3p gi\\u1ea3i tr&iacute; \\u1edf \\u0110&agrave; N\\u1eb5ng th&igrave; nh\\u1eefng nh&agrave; \\u0111\\u1ea7u t\\u01b0 nh\\u01b0 t&ocirc;i ho&agrave;n to&agrave;n tin t\\u01b0\\u1edfng v&agrave;o t\\u1ef7 su\\u1ea5t ph&ograve;ng c\\u1ee7a 3 c\\u0103n Sun Marina Town n&agrave;y&rdquo;.<\\/p>\\r\\n\\r\\n<p>Song song v\\u1edbi ti\\u1ec1m n\\u0103ng sinh l\\u1eddi t\\u1eeb khai th&aacute;c kinh doanh d\\u1ecbch v\\u1ee5 airbnb, homestay, c\\u0103n h\\u1ed9 Sun Marina Town c\\u0169ng \\u0111\\u01b0\\u1ee3c xem nh\\u01b0 m\\u1ed9t m&oacute;n \\u0111\\u1ea7u t\\u01b0 d&agrave;i h\\u1ea1n, gia t\\u0103ng gi&aacute; tr\\u1ecb trong t\\u01b0\\u01a1ng lai khi to&agrave;n b\\u1ed9 t\\u1ed5 h\\u1ee3p b\\u1ea5t \\u0111\\u1ed9ng s\\u1ea3n, gi\\u1ea3i tr&iacute; Sun Marina k\\u1ec1 b&ecirc;n V\\u1ecbnh Du thuy\\u1ec1n ch&iacute;nh th\\u1ee9c ho\\u1ea1t \\u0111\\u1ed9ng.<\\/p>\\r\\n\\r\\n<p><img alt=\\\"V\\u1ebd ch\\u00e2n dung kh\\u00e1ch h\\u00e0ng s\\u0103n si\\u00eau ph\\u1ea9m Sun Marina Town - 3\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-06-11\\/Ve-chan-dung-khach-hang-san-sieu-pham-Sun-Marina-Town----nh-3_nh---ng-con-ph----s---m-u---t-b--n-v---nh--1623406912-852-width660height368.jpg\\\" \\/><\\/p>\\r\\n\\r\\n<p>Nh\\u1eefng con ph\\u1ed1 s\\u1ea7m u\\u1ea5t b&ecirc;n V\\u1ecbnh Du thuy\\u1ec1n<\\/p>\\r\\n\\r\\n<p>TS. Nguy\\u1ec5n V\\u0103n \\u0110&iacute;nh, Ph&oacute; Ch\\u1ee7 t\\u1ecbch ki&ecirc;m T\\u1ed5ng Th\\u01b0 k&yacute; H\\u1ed9i M&ocirc;i gi\\u1edbi B\\u1ea5t \\u0111\\u1ed9ng s\\u1ea3n Vi\\u1ec7t Nam \\u0111&aacute;nh gi&aacute; cao v\\u1ec1 ti\\u1ec1m n\\u0103ng t\\u0103ng gi&aacute; v&agrave; kh\\u1ea3 n\\u0103ng sinh l\\u1eddi c\\u1ee7a c&aacute;c d\\u1ef1 &aacute;n li\\u1ec1n k\\u1ec1 V\\u1ecbnh Du thuy\\u1ec1n nh\\u01b0 Sun Marina: &ldquo;Ti\\u1ebfp c\\u1eadn tr\\u1ef1c ti\\u1ebfp v\\u1edbi k\\u1ef3 quan th\\u1ebf gi\\u1edbi l&agrave; \\u01b0u th\\u1ebf c&oacute; m\\u1ed9t kh&ocirc;ng hai m&agrave; kh&ocirc;ng ph\\u1ea3i ch\\u1ee7 \\u0111\\u1ea7u t\\u01b0 n&agrave;o c\\u0169ng l&agrave;m \\u0111\\u01b0\\u1ee3c. Khu v\\u1ef1c \\u0111\\u1ea7u t\\u01b0 d\\u1ef1 &aacute;n b\\u1ea5t \\u0111\\u1ed9ng s\\u1ea3n si&ecirc;u sang g\\u1eafn v\\u1edbi b\\u1ebfn du thuy\\u1ec1n \\u1edf H\\u1ea1 Long \\u0111&aacute;p \\u1ee9ng \\u0111\\u1ea7y \\u0111\\u1ee7 y&ecirc;u c\\u1ea7u c\\u1ee7a gi\\u1edbi nh&agrave; gi&agrave;u, \\u0111\\u1eb7c bi\\u1ec7t l&agrave; nhu c\\u1ea7u v\\u1ec1 v\\u1ecb tr&iacute; v&agrave; t\\u1ea7m nh&igrave;n tr\\u1ea3i nghi\\u1ec7m&rdquo;.<\\/p>\\r\\n\\r\\n<p>\\u0110&acirc;y l&agrave; \\u0111i\\u1ec1u \\u0111&atilde; ph&aacute;t tri\\u1ec3n t\\u1eeb l&acirc;u t\\u1ea1i nhi\\u1ec1u th\\u1ecb tr\\u01b0\\u1eddng \\u0111\\u1ecba \\u1ed1c n\\u1ed5i danh tr&ecirc;n th\\u1ebf gi\\u1edbi nh\\u01b0 b\\u1ebfn c\\u1ea3ng Victoria \\u1edf Hong Kong (Trung Qu\\u1ed1c) hay Darling Harbour c\\u1ee7a Sydney (Australia), b\\u1ebfn du thuy\\u1ec1n Miami (Florida) - n\\u01a1i h\\u1ed9i t\\u1ee5 nh\\u1eefng d\\u1ecbch v\\u1ee5 gi\\u1ea3i tr&iacute; \\u0111\\u1eb3ng c\\u1ea5p, \\u0111i\\u1ec3m \\u0111\\u1ebfn c\\u1ee7a gi\\u1edbi th\\u01b0\\u1ee3ng l\\u01b0u. T&ocirc;i cho r\\u1eb1ng, b\\u1ea5t \\u0111\\u1ed9ng s\\u1ea3n b\\u1ebfn du thuy\\u1ec1n g\\u1eafn v\\u1edbi th\\u01b0\\u1edfng th\\u1ee9c di s\\u1ea3n l&agrave; y\\u1ebfu t\\u1ed1 l\\u1ee3i th\\u1ebf quan tr\\u1ecdng \\u0111\\u1ec3 t\\u0103ng l&ecirc;n gi&aacute; tr\\u1ecb cho d\\u1ef1 &aacute;n v&agrave; \\u0111\\u1ea3m b\\u1ea3o \\u0111\\u01b0\\u1ee3c kh\\u1ea3 n\\u0103ng sinh l\\u1eddi b\\u1ec1n v\\u1eefng v\\u01b0\\u1ee3t tr\\u1ed9i cho c&aacute;c nh&agrave; \\u0111\\u1ea7u t\\u01b0, TS Nguy\\u1ec5n V\\u0103n \\u0110&iacute;nh nh\\u1ea5n m\\u1ea1nh.<\\/p>\\r\\n\\r\\n<p>Ngu\\u1ed3n: http:\\/\\/danviet.vn\\/ve-chan-dung-khach-hang-san-sieu-pham-sun-marina-town-50202111617565588.htm<\\/p>\",\"category\":[\"3\",null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/storage\\/app\\/public\\/images\\/blog\\/Ve-chan-dung-khach-hang-san-sieu-pham-Sun-Marina-Town----nh-1_t--a-th--p-----i-sun-marina-town-t---a-nh--1623406912-530-width660height371.jpg\",\"_token\":\"BCmPGaanfrBOlBiqzioSlBbD3BsdHHoB4DZiWARg\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/posts\"}', '2021-06-12 04:25:21', '2021-06-12 04:25:21'),
(946, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-12 04:25:21', '2021-06-12 04:25:21'),
(947, 1, 'admin/posts', 'POST', '::1', '{\"title\":\"C\\u00f4ng an TPHCM n\\u00f3i v\\u1ec1 nh\\u1eefng tin \\u0111\\u1ed3n li\\u00ean quan \\u0111\\u1ebfn v\\u1ee5 b\\u1eaft gi\\u1eef Youtuber L\\u00ea Ch\\u00ed Th\\u00e0nh\",\"slug\":null,\"desc_short\":\"Theo \\u0111\\u1ea1i di\\u1ec7n C\\u00f4ng an TPHCM, nh\\u1eefng tin \\u0111\\u1ed3n c\\u1ee7a m\\u1ed9t s\\u1ed1 \\u0111\\u1ed1i t\\u01b0\\u1ee3ng nh\\u1eafm v\\u00e0o C\\u00f4ng an TPHCM li\\u00ean quan \\u0111\\u1ebfn vi\\u1ec7c b\\u1eaft gi\\u1eef Youtuber L\\u00ea Ch\\u00ed Th\\u00e0nh nh\\u01b0 c\\u00f4ng an l\\u1eafp b\\u1ed5 sung bi\\u1ec3n b\\u00e1o giao th\\u00f4ng, c\\u00f4ng an nh\\u00e9o tai b\\u1ecb can\\u2026 lan truy\\u1ec1n tr\\u00ean m\\u1ea1ng x\\u00e3 h\\u1ed9i, \\u0111\\u1ec1u c\\u00f3 n\\u1ed9i dung xuy\\u00ean t\\u1ea1c, sai s\\u1ef1 th\\u1eadt.\",\"body\":\"<p>T\\u1ed1i 11\\/6, V\\u0103n ph&ograve;ng UBND TPHCM \\u0111&atilde; t\\u1ed5 ch\\u1ee9c h\\u1ecdp b&aacute;o th&ocirc;ng tin v\\u1ec1 t&igrave;nh h&igrave;nh kinh t\\u1ebf x&atilde; h\\u1ed9i 5 th&aacute;ng \\u0111\\u1ea7u n\\u0103m 2021.<\\/p>\\r\\n\\r\\n<p><img alt=\\\"C\\u00f4ng an TPHCM n\\u00f3i v\\u1ec1 nh\\u1eefng tin \\u0111\\u1ed3n li\\u00ean quan \\u0111\\u1ebfn v\\u1ee5 b\\u1eaft gi\\u1eef Youtuber L\\u00ea Ch\\u00ed Th\\u00e0nh - 1\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-06-12\\/1623460140-46662fe90a95c654c5bd638a8b6ae501-width645height432.jpg\\\" style=\\\"width:660px\\\" \\/><\\/p>\\r\\n\\r\\n<p>V\\u0103n ph&ograve;ng UBND TPHCM t\\u1ed5 ch\\u1ee9c h\\u1ecdp b&aacute;o t\\u1ed1i 11\\/6<\\/p>\\r\\n\\r\\n<p>Tr\\u1ea3 l\\u1eddi c&acirc;u h\\u1ecfi c\\u1ee7a Ti\\u1ec1n Phong v\\u1ec1 m\\u1ed9t s\\u1ed1 c&aacute;o bu\\u1ed9c lan truy\\u1ec1n tr&ecirc;n m\\u1ea1ng x&atilde; h\\u1ed9i li&ecirc;n quan \\u0111\\u1ebfn b\\u1ecb can L&ecirc; Ch&iacute; Th&agrave;nh, Ph&oacute; Tr\\u01b0\\u1edfng ph&ograve;ng C\\u1ea3nh s&aacute;t \\u0111i\\u1ec1u tra (PC01) C&ocirc;ng an TPHCM Tr\\u1ea7n Thanh Giang kh\\u1eb3ng \\u0111\\u1ecbnh: C&aacute;c c&aacute;o bu\\u1ed9c v\\u1ec1 vi\\u1ec7c C&ocirc;ng an l\\u1eafp bi\\u1ec3n b&aacute;o giao th&ocirc;ng b\\u1ed5 sung nh\\u1eb1m h\\u1ee3p th\\u1ee9c h&oacute;a vi\\u1ec7c th\\u1ed5i ph\\u1ea1t; ti\\u1ebfng ch\\u1eedi th\\u1ec1, t\\u1ea5m \\u1ea3nh nh&eacute;o l\\u1ed7 tai L&ecirc; Ch&iacute; Th&agrave;nh khi \\u0111\\u01b0a b\\u1ecb can n&agrave;y v\\u1ec1 c\\u01a1 quan c&ocirc;ng an&hellip;l&agrave; ho&agrave;n to&agrave;n sai s\\u1ef1 th\\u1eadt, l&agrave; s\\u1ea3n ph\\u1ea9m c\\u1eaft gh&eacute;p.<\\/p>\\r\\n\\r\\n<p>&ldquo;\\u0110\\u1ed1i t\\u01b0\\u1ee3ng L&ecirc; Ch&iacute; Th&agrave;nh th\\u01b0\\u1eddng \\u0111i theo nh&oacute;m. Nh&oacute;m \\u0111\\u1ed1i t\\u01b0\\u1ee3ng tr&agrave; tr\\u1ed9n \\u0111\\u1ec3 g&acirc;y r\\u1ed1i, c\\u1ea3n tr\\u1edf c\\u01a1 quan ch\\u1ee9c n\\u0103ng th\\u1ef1c thi c&ocirc;ng v\\u1ee5 nh\\u1eb1m m\\u1ee5c \\u0111&iacute;ch xuy&ecirc;n t\\u1ea1c&rdquo;, l&atilde;nh \\u0111\\u1ea1o PC01 C&ocirc;ng an TPHCM nh\\u1ea5n m\\u1ea1nh v&agrave; cho bi\\u1ebft, C&ocirc;ng an \\u0111&atilde; kh\\u1edfi t\\u1ed1 v\\u1ee5 &aacute;n, kh\\u1edfi t\\u1ed1 b\\u1ecb can, b\\u1eaft L&ecirc; Ch&iacute; Th&agrave;nh \\u0111\\u1ec3 \\u0111i\\u1ec1u tra l&agrave;m r&otilde; h&agrave;nh vi ph\\u1ea1m t\\u1ed9i v&agrave; s\\u1eafp t\\u1edbi s\\u1ebd c&oacute; th&ocirc;ng tin c\\u1ee5 th\\u1ec3 cho b&aacute;o ch&iacute;.<\\/p>\\r\\n\\r\\n<p><img alt=\\\"C\\u00f4ng an TPHCM n\\u00f3i v\\u1ec1 nh\\u1eefng tin \\u0111\\u1ed3n li\\u00ean quan \\u0111\\u1ebfn v\\u1ee5 b\\u1eaft gi\\u1eef Youtuber L\\u00ea Ch\\u00ed Th\\u00e0nh - 2\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-06-12\\/1623460140-ad3ece104d1c069e5ad51b353b902df4-width645height484.jpg\\\" style=\\\"width:660px\\\" \\/><\\/p>\\r\\n\\r\\n<p>Youtuber L&ecirc; Ch&iacute; Th&agrave;nh c&oacute; h&agrave;nh vi ch\\u1ed1ng \\u0111\\u1ed1i l\\u1ef1c l\\u01b0\\u1ee3ng CSGT l&agrave;m nhi\\u1ec7m v\\u1ee5 tr\\u01b0\\u1edbc khi b\\u1ecb kh\\u1edfi t\\u1ed1, b\\u1eaft t\\u1ea1m giam<\\/p>\\r\\n\\r\\n<p>Ng&agrave;y 14\\/4 v\\u1eeba qua, \\u0111\\u1ed1i t\\u01b0\\u1ee3ng L&ecirc; Ch&iacute; Th&agrave;nh (38 tu\\u1ed5i, th\\u01b0\\u1eddng tr&uacute; t\\u1ea1i huy\\u1ec7n H&agrave;m T&acirc;n &ndash; B&igrave;nh Thu\\u1eadn; t\\u1ea1m tr&uacute; t\\u1ea1i qu\\u1eadn 12) \\u0111&atilde; b\\u1ecb C&ocirc;ng an TP.Th\\u1ee7 \\u0110\\u1ee9c (TPHCM) b\\u1eaft t\\u1ea1m giam v\\u1ec1 h&agrave;nh vi &ldquo;Ch\\u1ed1ng ng\\u01b0\\u1eddi thi h&agrave;nh c&ocirc;ng v\\u1ee5&rdquo; theo \\u0110i\\u1ec1u 330 B\\u1ed9 Lu\\u1eadt h&igrave;nh s\\u1ef1. Quy\\u1ebft \\u0111\\u1ecbnh kh\\u1edfi t\\u1ed1 v\\u1ee5 &aacute;n, kh\\u1edfi t\\u1ed1 b\\u1ecb can, l\\u1ec7nh b\\u1eaft t\\u1ea1m giam \\u0111\\u1ed1i v\\u1edbi L&ecirc; Ch&iacute; Th&agrave;nh \\u0111&atilde; \\u0111\\u01b0\\u1ee3c Vi\\u1ec7n KSND TP.Th\\u1ee7 \\u0110\\u1ee9c ph&ecirc; chu\\u1ea9n.<\\/p>\\r\\n\\r\\n<p>Theo th&ocirc;ng tin t\\u1eeb c&ocirc;ng an TP Th\\u1ee7 \\u0110\\u1ee9c, s&aacute;ng 20\\/3, t\\u1ed5 CSGT thu\\u1ed9c \\u0110\\u1ed9i R\\u1ea1ch Chi\\u1ebfc (Ph&ograve;ng CSGT \\u0111\\u01b0\\u1eddng b\\u1ed9 - \\u0111\\u01b0\\u1eddng s\\u1eaft (PC08) C&ocirc;ng an TPHCM) l&agrave;m nhi\\u1ec7m v\\u1ee5 tr&ecirc;n xa l\\u1ed9 H&agrave; N\\u1ed9i (\\u0111o\\u1ea1n qua ph\\u01b0\\u1eddng Hi\\u1ec7p Ph&uacute;, TP.Th\\u1ee7 \\u0110\\u1ee9c). L\\u1ef1c l\\u01b0\\u1ee3ng c&ocirc;ng an ph&aacute;t hi\\u1ec7n &ocirc; t&ocirc; BS 51H - 108.21 l\\u01b0u th&ocirc;ng trong l&agrave;n \\u0111\\u01b0\\u1eddng d&agrave;nh cho xe hai b&aacute;nh n&ecirc;n ra hi\\u1ec7u d\\u1eebng xe \\u0111\\u1ec3 ki\\u1ec3m tra, x\\u1eed l&yacute;.<\\/p>\\r\\n\\r\\n<p>Ng\\u01b0\\u1eddi \\u0111i\\u1ec1u khi\\u1ec3n &ocirc; t&ocirc; l&agrave; L&ecirc; Ch&iacute; Th&agrave;nh ch\\u1ec9 xu\\u1ea5t tr&igrave;nh \\u0111\\u01b0\\u1ee3c gi\\u1ea5y ph&eacute;p l&aacute;i xe mang t&ecirc;n L&ecirc; Ch&iacute; Th&agrave;nh, gi\\u1ea5y \\u0111\\u0103ng ki\\u1ec3m, gi\\u1ea5y \\u0111\\u0103ng k&yacute; xe kh&ocirc;ng h\\u1ee3p l\\u1ec7. T\\u1eeb nh\\u1eefng vi ph\\u1ea1m n&agrave;y, t\\u1ed5 CSGT l\\u1eadp bi&ecirc;n b\\u1ea3n t\\u1ea1m gi\\u1eef ph\\u01b0\\u01a1ng ti\\u1ec7n \\u0111\\u1ec3 x\\u1eed l&yacute;.<\\/p>\\r\\n\\r\\n<p>Khi CSGT \\u0111i\\u1ec1u xe c\\u1ea9u \\u0111\\u1ebfn \\u0111\\u01b0a &ocirc; t&ocirc; vi ph\\u1ea1m v\\u1ec1 tr\\u1ee5 s\\u1edf th&igrave; L&ecirc; Ch&iacute; Th&agrave;nh c&oacute; h&agrave;nh vi c\\u1ea3n tr\\u1edf l\\u1ef1c l\\u01b0\\u1ee3ng ch\\u1ee9c n\\u0103ng l&agrave;m nhi\\u1ec7m v\\u1ee5.<\\/p>\\r\\n\\r\\n<p>T\\u1ed5 CSGT \\u0111&atilde; \\u0111\\u1ec1 ngh\\u1ecb C&ocirc;ng an P.Hi\\u1ec7p Ph&uacute; c&oacute; m\\u1eb7t ph\\u1ed1i h\\u1ee3p x\\u1eed l&yacute;, m\\u1eddi Th&agrave;nh v\\u1ec1 l&agrave;m vi\\u1ec7c, \\u0111\\u1ed1i t\\u01b0\\u1ee3ng ti\\u1ebfp t\\u1ee5c c&oacute; nh\\u1eefng h&agrave;nh vi, l\\u1eddi l\\u1ebd c\\u1ea3n tr\\u1edf l\\u1ef1c l\\u01b0\\u1ee3ng thi h&agrave;nh c&ocirc;ng v\\u1ee5. Ph\\u1ea3i nhi\\u1ec1u gi\\u1edd sau C&ocirc;ng an m\\u1edbi \\u0111\\u01b0a \\u0111\\u01b0\\u1ee3c &ocirc; t&ocirc; vi ph\\u1ea1m \\u0111i kh\\u1ecfi hi\\u1ec7n tr\\u01b0\\u1eddng.<\\/p>\\r\\n\\r\\n<p>M\\u1edbi \\u0111&acirc;y, C&ocirc;ng an TPHCM \\u0111&atilde; t\\u1ed5 ch\\u1ee9c bu\\u1ed5i h\\u1ecdp b&aacute;o cung c\\u1ea5p th&ocirc;ng tin v\\u1ec1 vi\\u1ec7c b\\u1eaft gi\\u1eef L&ecirc; Ch&iacute; Th&agrave;nh. Theo Thi\\u1ebfu t\\u01b0\\u1edbng \\u0110inh Thanh Nh&agrave;n, Ph&oacute; Gi&aacute;m \\u0111\\u1ed1c C&ocirc;ng an TPHCM, Youtuber L&ecirc; Ch&iacute; Th&agrave;nh \\u0111ang b\\u1ecb xem x&eacute;t x\\u1eed l&yacute; v\\u1ec1 h&agrave;nh vi l\\u1ee3i d\\u1ee5ng c&aacute;c quy\\u1ec1n t\\u1ef1 do d&acirc;n ch\\u1ee7, ngo&agrave;i t\\u1ed9i danh v\\u1eeba b\\u1ecb kh\\u1edfi t\\u1ed1.<\\/p>\\r\\n\\r\\n<p><img alt=\\\"C\\u00f4ng an TPHCM n\\u00f3i v\\u1ec1 nh\\u1eefng tin \\u0111\\u1ed3n li\\u00ean quan \\u0111\\u1ebfn v\\u1ee5 b\\u1eaft gi\\u1eef Youtuber L\\u00ea Ch\\u00ed Th\\u00e0nh - 3\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-06-12\\/1623460140-5a54aa35f1c8adce933a860d96f84c85-width645height363.jpeg\\\" style=\\\"width:660px\\\" \\/><\\/p>\\r\\n\\r\\n<p>Thi\\u1ebfu t\\u01b0\\u1edbng \\u0110inh Thanh Nh&agrave;n, Ph&oacute; gi&aacute;m \\u0111\\u1ed1c C&ocirc;ng an TPHCM<\\/p>\\r\\n\\r\\n<p>Ng\\u01b0\\u1eddi n&agrave;y t\\u1eebng nhi\\u1ec1u l\\u1ea7n th\\u1ef1c hi\\u1ec7n h&agrave;nh vi c\\u1ea3n tr\\u1edf l\\u1ef1c l\\u01b0\\u1ee3ng ch\\u1ee9c n\\u0103ng \\u0111ang th\\u1ef1c hi\\u1ec7n nhi\\u1ec7m v\\u1ee5, &quot;t\\u1ea1o c\\u1edb khi&ecirc;u kh&iacute;ch, xuy&ecirc;n t\\u1ea1c \\u0111\\u01b0a th&ocirc;ng tin sai s\\u1ef1 th\\u1eadt v\\u1ec1 ho\\u1ea1t \\u0111\\u1ed9ng c&ocirc;ng v\\u1ee5&quot; sau \\u0111&oacute; ph&aacute;t t&aacute;n l&ecirc;n m\\u1ea1ng x&atilde; h\\u1ed9i g&acirc;y t&aacute;c \\u0111\\u1ed9ng x\\u1ea5u \\u0111\\u1ebfn an ninh tr\\u1eadt t\\u1ef1.<\\/p>\\r\\n\\r\\n<p>&quot;L&ecirc; Ch&iacute; Th&agrave;nh l\\u1eadp k&ecirc;nh Youtube \\u0111\\u0103ng t\\u1ea3i c&aacute;c video l&agrave; nh\\u1eb1m tr\\u1ee5c l\\u1ee3i. C&ocirc;ng an TP Th\\u1ee7 \\u0110\\u1ee9c \\u0111ang m\\u1eddi nh\\u1eefng c&aacute; nh&acirc;n li&ecirc;n quan \\u0111\\u1ebfn ng\\u01b0\\u1eddi n&agrave;y \\u0111\\u1ec3 c\\u1ee7ng c\\u1ed1 h\\u1ed3 s\\u01a1&quot;, thi\\u1ebfu t\\u01b0\\u1edbng \\u0110inh Thanh Nh&agrave;n cho hay.<\\/p>\\r\\n\\r\\n<p>\\u0110\\u01b0\\u1ee3c bi\\u1ebft, &ocirc;ng L&ecirc; Ch&iacute; Th&agrave;nh l&agrave; c\\u1ef1u \\u0111\\u1ea1i &uacute;y, c&oacute; g\\u1ea7n 20 n\\u0103m trong ng&agrave;nh c&ocirc;ng an, c&ocirc;ng t&aacute;c t\\u1ea1i m\\u1ed9t s\\u1ed1 tr\\u1ea1i giam thu\\u1ed9c B\\u1ed9 C&ocirc;ng an. B\\u1ecb can n&agrave;y \\u0111&atilde; c&oacute; nh\\u1eefng t\\u1ed1 c&aacute;o v&agrave; cho r\\u1eb1ng l&atilde;nh \\u0111\\u1ea1o tr\\u1ea1i giam n\\u01a1i c&ocirc;ng t&aacute;c c&oacute; nhi\\u1ec1u sai ph\\u1ea1m.<\\/p>\\r\\n\\r\\n<p>Tuy nhi&ecirc;n, C\\u1ee5c Qu\\u1ea3n l&yacute; tr\\u1ea1i giam B\\u1ed9 C&ocirc;ng an x&aacute;c \\u0111\\u1ecbnh, L&ecirc; Ch&iacute; Th&agrave;nh \\u0111&atilde; nhi\\u1ec1u l\\u1ea7n vi ph\\u1ea1m nghi&ecirc;m tr\\u1ecdng trong th\\u1eddi gian c&ocirc;ng t&aacute;c.<\\/p>\\r\\n\\r\\n<p>Ng&agrave;y 31\\/7\\/2020, C\\u1ee5c Qu\\u1ea3n l&yacute; tr\\u1ea1i giam c&oacute; quy\\u1ebft \\u0111\\u1ecbnh k\\u1ef7 lu\\u1eadt L&ecirc; Ch&iacute; Th&agrave;nh b\\u1eb1ng h&igrave;nh th\\u1ee9c t\\u01b0\\u1edbc danh hi\\u1ec7u CAND.<\\/p>\\r\\n\\r\\n<p>B\\u1ecb can L&ecirc; Ch&iacute; Th&agrave;nh l\\u1eadp ra nhi\\u1ec1u trang m\\u1ea1ng x&atilde; h\\u1ed9i v&agrave; t\\u1ef1 cho m&igrave;nh th\\u1ef1c hi\\u1ec7n quy\\u1ec1n &quot;gi&aacute;m s&aacute;t&quot; l\\u1ef1c l\\u01b0\\u1ee3ng c&ocirc;ng an. B\\u1ecb can L&ecirc; Ch&iacute; Th&agrave;nh c&oacute; m\\u1eb7t \\u1edf nhi\\u1ec1u \\u0111\\u1ecba \\u0111i\\u1ec3m, c&oacute; nh\\u1eefng h&agrave;nh vi khi&ecirc;u kh&iacute;ch l\\u1ef1c l\\u01b0\\u1ee3ng ch\\u1ee9c n\\u0103ng, ch\\u1ee7 y\\u1ebfu l&agrave; CSGT r\\u1ed3i \\u0111\\u0103ng tr&ecirc;n c&aacute;c trang m\\u1ea1ng.<\\/p>\\r\\n\\r\\n<p>Ngu\\u1ed3n: https:\\/\\/tienphong.vn\\/cong-an-tphcm-noi-ve-nhung-tin-don-lien-quan-den-vu-bat-giu-youtuber-le-chi-thanh-post1345263.tpo<\\/p>\",\"category\":[\"3\",null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/storage\\/app\\/public\\/images\\/blog\\/1623460140-46662fe90a95c654c5bd638a8b6ae501-width645height432.jpg\",\"_token\":\"BCmPGaanfrBOlBiqzioSlBbD3BsdHHoB4DZiWARg\",\"after-save\":\"2\"}', '2021-06-12 04:26:49', '2021-06-12 04:26:49'),
(948, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-12 04:26:50', '2021-06-12 04:26:50');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(949, 1, 'admin/posts', 'POST', '::1', '{\"title\":\"Th\\u1eddi trang \\u1edf nh\\u00e0 m\\u00f9a Covid19: Ti\\u1ec3u Th\\u01b0 RMIT di\\u1ec7n \\u0111\\u1ed3 ng\\u1ee7 quy\\u1ebfn r\\u0169 ch\\u1ec9 \\u0111\\u1ec3... ch\\u1edd shipper\",\"slug\":null,\"desc_short\":\"D\\u00f9 \\u1edf nh\\u00e0 ch\\u1ed1ng d\\u1ecbch nh\\u01b0ng c\\u00e1c m\\u1ef9 nh\\u00e2n showbiz kh\\u00f4ng ng\\u1ea1i l\\u00ean \\u0111\\u1ed3, ch\\u1ee5p h\\u00ecnh \\u0111\\u0103ng m\\u1ea1ng x\\u00e3 h\\u1ed9i, t\\u01b0\\u01a1ng t\\u00e1c v\\u1edbi ng\\u01b0\\u1eddi h\\u00e2m m\\u1ed9.\",\"body\":\"<p>Th\\u1ef1c hi\\u1ec7n gi&atilde;n c&aacute;ch t\\u1ea1i nh&agrave; \\u0111\\u1ec3 ch\\u1ed1ng d\\u1ecbch, nhi\\u1ec1u ngh\\u1ec7 s\\u0129 c&oacute; th\\u1eddi gian chia s\\u1ebb v\\u1ec1 cu\\u1ed9c s\\u1ed1ng \\u0111\\u1eddi th\\u01b0\\u1eddng v\\u1edbi ng\\u01b0\\u1eddi h&acirc;m m\\u1ed9. C&oacute; ng\\u01b0\\u1eddi khoe th&agrave;nh t&iacute;ch n\\u1ea5u \\u0103n, d\\u1ecdn d\\u1eb9p t\\u1ed5 \\u1ea5m.&nbsp;C&oacute; ng\\u01b0\\u1eddi l&ecirc;n \\u0111\\u1ed3 th\\u1eddi th\\u01b0\\u1ee3ng, trang \\u0111i\\u1ec3m xinh \\u0111\\u1eb9p \\u0111\\u1ec3 ch\\u1ee5p h&igrave;nh, l\\u1ea5p \\u0111\\u1ea7y th\\u1eddi gian r\\u1ea3nh r\\u1ed7i. Trong \\u0111&oacute;, th\\u1eddi trang m&ugrave;a d\\u1ecbch c\\u1ee7a sao nh\\u1eadn \\u0111\\u01b0\\u1ee3c s\\u1ef1 quan t&acirc;m l\\u1edbn t\\u1eeb ng\\u01b0\\u1eddi h&acirc;m m\\u1ed9<\\/p>\\r\\n\\r\\n<p>\\u0110i\\u1ec3m qua nh\\u1eefng outfit c\\u1ee7a lo\\u1ea1t m\\u1ef9 nh&acirc;n Vi\\u1ec7t khi \\u1edf nh&agrave;, b\\u1ea1n s\\u1ebd th\\u1ea5y h\\u1ecd \\u0111\\u1ea7u t\\u01b0 th\\u1ebf n&agrave;o \\u0111\\u1ec3 lu&ocirc;n \\u0111\\u1eb9p trong m\\u1eaft c&ocirc;ng ch&uacute;ng.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p><img alt=\\\"Th\\u1eddi trang \\u1edf nh\\u00e0 m\\u00f9a Covid19: Ti\\u1ec3u Th\\u01b0 RMIT di\\u1ec7n \\u0111\\u1ed3 ng\\u1ee7 quy\\u1ebfn r\\u0169 ch\\u1ec9 \\u0111\\u1ec3... ch\\u1edd shipper - 1\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-06-10\\/Thoi-trang-o-nha-chong-dich-Tieu-Thu-RMIT-e-ap-voi-noi-y-Hien-Ho-hoa-nang-tho-voi-bodysuit-batch_192965634_2252622524868792_24358680887199272-1623308317-47-width800height995.jpg\\\" style=\\\"width:660px\\\" \\/><\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>N&agrave;ng ti\\u1ec3u th\\u01b0 RMIT l&agrave; hoa h\\u1eadu Hu\\u1ef3nh Ti&ecirc;n khoe v&oacute;c d&aacute;ng g\\u1ee3i c\\u1ea3m v\\u1edbi \\u0111\\u1ea7m ng\\u1ee7 mong manh t\\u1ea1i nh&agrave;. Nh\\u1eefng b\\u1ed9 \\u0111\\u1ed3 ng\\u1ee7 ch\\u1ea5t li\\u1ec7u m\\u1ec1m m\\u1ecfng, nh\\u1eb9 nh&agrave;ng gi&uacute;p b\\u1ea1n c&oacute; \\u0111\\u01b0\\u1ee3c c\\u1ea3m gi&aacute;c tho\\u1ea3i m&aacute;i nh\\u1ea5t khi \\u1edf nh&agrave;. B&ecirc;n c\\u1ea1nh \\u0111&oacute;, ki\\u1ec3u d&aacute;ng thanh l\\u1ecbch l\\u1ea1i mang t\\u1edbi v\\u1ebb \\u0111\\u1eb9p r\\u1ea5t th\\u1eddi trang, kh&ocirc;ng ph&ocirc; cho ng\\u01b0\\u1eddi \\u0111\\u1eb9p.<\\/p>\\r\\n\\r\\n<p><img alt=\\\"Th\\u1eddi trang \\u1edf nh\\u00e0 m\\u00f9a Covid19: Ti\\u1ec3u Th\\u01b0 RMIT di\\u1ec7n \\u0111\\u1ed3 ng\\u1ee7 quy\\u1ebfn r\\u0169 ch\\u1ec9 \\u0111\\u1ec3... ch\\u1edd shipper - 3\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-06-10\\/Thoi-trang-o-nha-chong-dich-Tieu-Thu-RMIT-e-ap-voi-noi-y-Hien-Ho-hoa-nang-tho-voi-bodysuit-batch_198196570_2251919304939114_50704325364047854-1623308318-598-width800height1061.jpg\\\" style=\\\"width:660px\\\" \\/><\\/p>\\r\\n\\r\\n<p>Nh\\u1eefng outfit m\\u1eb7c \\u1edf nh&agrave; \\u0111\\u01b0\\u1ee3c Hu\\u1ef3nh Ti&ecirc;n \\u0111\\u0103ng t\\u1ea3i li&ecirc;n t\\u1ee5c v\\u1edbi ng\\u01b0\\u1eddi h&acirc;m m\\u1ed9. C&ocirc; chia s\\u1ebb ng\\u1eafn tr&ecirc;n trang c&aacute; nh&acirc;n set \\u0111\\u1ed3 ng\\u1ee7 in ho\\u1ea1 ti\\u1ebft \\u1ea5n t\\u01b0\\u1ee3ng. C&ocirc; k\\u1ebft h\\u1ee3p v\\u1edbi &aacute;o n\\u1ed9i y t&ocirc;n v&ograve;ng 1, \\u1ea9n hi\\u1ec7n t\\u0103ng th&ecirc;m s\\u1ee9c quy\\u1ebfn r\\u0169. Theo ti\\u1ec3u th\\u01b0 RMIT, trang ph\\u1ee5c n&agrave;y \\u0111\\u01b0\\u1ee3c c&ocirc; ch\\u0103m ch&uacute;t c\\u1ea9n th\\u1eadn ch\\u1ec9 \\u0111\\u1ec3 nh\\u1eadn h&agrave;ng t\\u1eeb shipper.<\\/p>\\r\\n\\r\\n<p><img alt=\\\"Th\\u1eddi trang \\u1edf nh\\u00e0 m\\u00f9a Covid19: Ti\\u1ec3u Th\\u01b0 RMIT di\\u1ec7n \\u0111\\u1ed3 ng\\u1ee7 quy\\u1ebfn r\\u0169 ch\\u1ec9 \\u0111\\u1ec3... ch\\u1edd shipper - 4\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-06-10\\/Thoi-trang-o-nha-chong-dich-Tieu-Thu-RMIT-e-ap-voi-noi-y-Hien-Ho-hoa-nang-tho-voi-bodysuit-batch_196971491_848195799455766_529137405764813109-1623308318-344-width800height1066.jpg\\\" style=\\\"width:660px\\\" \\/><\\/p>\\r\\n\\r\\n<p>Thu&yacute; An m\\u1eebng tu\\u1ed5i m\\u1edbi theo c&aacute;ch ch\\u1ed1ng d\\u1ecbch r\\u1ea5t \\u1ea5n t\\u01b0\\u1ee3ng. C&ocirc; di\\u1ec7n l&ecirc;n m&igrave;nh set \\u0111\\u1ed3 m&agrave;u h\\u1ed3ng n\\u1eef t&iacute;nh, chi ti\\u1ebft &aacute;o bu&ocirc;ng c&uacute;c t\\u0103ng th&ecirc;m \\u0111\\u1ed9 g\\u1ee3i c\\u1ea3m cho ng\\u01b0\\u1eddi \\u0111\\u1eb9p. Set \\u0111\\u1ed3 t\\u1eebng \\u0111\\u01b0\\u1ee3c r\\u1ea5t nhi\\u1ec1u hoa, &aacute; h\\u1eadu m\\u1eb7c th\\u1eddi gian qua, h\\u1ee9a h\\u1eb9n t\\u1ea1o n&ecirc;n xu h\\u01b0\\u1edbng trong t\\u01b0\\u01a1ng lai.<\\/p>\\r\\n\\r\\n<p><img alt=\\\"Th\\u1eddi trang \\u1edf nh\\u00e0 m\\u00f9a Covid19: Ti\\u1ec3u Th\\u01b0 RMIT di\\u1ec7n \\u0111\\u1ed3 ng\\u1ee7 quy\\u1ebfn r\\u0169 ch\\u1ec9 \\u0111\\u1ec3... ch\\u1edd shipper - 5\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-06-10\\/Thoi-trang-o-nha-chong-dich-Tieu-Thu-RMIT-e-ap-voi-noi-y-Hien-Ho-hoa-nang-tho-voi-bodysuit-batch_194982303_350038706480105_536150951938828727-1623308318-809-width800height1199.jpg\\\" style=\\\"width:660px\\\" \\/><\\/p>\\r\\n\\r\\n<p>Hi\\u1ec1n H\\u1ed3 lu&ocirc;n duy tr&igrave; phong \\u0111\\u1ed9 th\\u1eddi trang \\u1ed5n \\u0111\\u1ecbnh. Nh\\u1eefng th\\u01b0\\u1edbc h&igrave;nh c&ocirc; \\u0111\\u0103ng t\\u1ea3i tr&ecirc;n trang c&aacute; nh&acirc;n \\u0111\\u01b0\\u1ee3c ch\\u0103m ch&uacute;t kh&aacute; k\\u1ef9 c&agrave;ng. H&igrave;nh \\u1ea3nh m\\u1edbi \\u0111&acirc;y, n\\u1eef ca s\\u0129 m\\u1eb7c bodysuit m&agrave;u tr\\u1eafng k\\u1ebft h\\u1ee3p c&ugrave;ng ph\\u1ee5 ki\\u1ec7n t\\u1ea5t t&ocirc;ng xuy\\u1ec7t t&ocirc;ng, t&ocirc;n l&ecirc;n n&eacute;t \\u0111\\u1eb9p m\\u01a1 m&agrave;ng nh\\u01b0 n&agrave;ng th\\u01a1.<\\/p>\\r\\n\\r\\n<p><img alt=\\\"Th\\u1eddi trang \\u1edf nh\\u00e0 m\\u00f9a Covid19: Ti\\u1ec3u Th\\u01b0 RMIT di\\u1ec7n \\u0111\\u1ed3 ng\\u1ee7 quy\\u1ebfn r\\u0169 ch\\u1ec9 \\u0111\\u1ec3... ch\\u1edd shipper - 6\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-06-10\\/Thoi-trang-o-nha-chong-dich-Tieu-Thu-RMIT-e-ap-voi-noi-y-Hien-Ho-hoa-nang-tho-voi-bodysuit-batch_196668472_350047086479267_784572306696545955-1623308318-778-width800height1199.jpg\\\" style=\\\"width:660px\\\" \\/><\\/p>\\r\\n\\r\\n<p>L\\u1ee3i th\\u1ebf v\\u1ec1 h&igrave;nh th\\u1ec3 gi&uacute;p c&ocirc; ghi \\u0111i\\u1ec3m trong m\\u1ecdi phong c&aacute;ch th\\u1eddi trang. Hi\\u1ec1n H\\u1ed3 \\u0111\\u01b0\\u1ee3c nh\\u1eadn x&eacute;t ng&agrave;y c&agrave;ng quy\\u1ebfn r\\u0169 v&agrave; tr\\u01b0\\u1edfng th&agrave;nh h\\u01a1n trong vi\\u1ec7c x&acirc;y d\\u1ef1ng h&igrave;nh \\u1ea3nh. S\\u1ef1 g\\u1ee3i c\\u1ea3m c\\u1ee7a c&ocirc; c&oacute; ch\\u1ecdn l\\u1ecdc v&agrave; ch\\u1eebng m\\u1ef1c, l&agrave; y\\u1ebfu t\\u1ed1 gi&uacute;p n\\u1eef ca s\\u0129 chi\\u1ebfm \\u0111\\u01b0\\u1ee3c t&igrave;nh c\\u1ea3m t\\u1eeb ng\\u01b0\\u1eddi h&acirc;m m\\u1ed9.<\\/p>\\r\\n\\r\\n<p><img alt=\\\"Th\\u1eddi trang \\u1edf nh\\u00e0 m\\u00f9a Covid19: Ti\\u1ec3u Th\\u01b0 RMIT di\\u1ec7n \\u0111\\u1ed3 ng\\u1ee7 quy\\u1ebfn r\\u0169 ch\\u1ec9 \\u0111\\u1ec3... ch\\u1edd shipper - 7\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-06-10\\/Thoi-trang-o-nha-chong-dich-Tieu-Thu-RMIT-e-ap-voi-noi-y-Hien-Ho-hoa-nang-tho-voi-bodysuit-batch_187557270_3943551525713064_31703251698492583-1623309464-451-width800height1066.jpg\\\" style=\\\"width:660px\\\" \\/><\\/p>\\r\\n\\r\\n<p>D&ugrave; \\u1edf nh&agrave; nh\\u01b0ng Kh&aacute;nh Linh v\\u1eabn c&oacute; &ecirc; k&iacute;p h\\u1ed7 tr\\u1ee3 ch\\u1ee5p h&igrave;nh \\u0111\\u1eb9p nh\\u01b0 studio. C&ocirc; t\\u1eebng chia s\\u1ebb vi\\u1ec7c t\\u1eadn d\\u1ee5ng n\\u1eafng chi\\u1ec1u t\\u1ea1i nh&agrave; \\u0111\\u1ec3 c&oacute; &aacute;nh s&aacute;ng \\u0111\\u1eb9p lung linh cho m\\u1ed7i kho\\u1ea3nh kh\\u1eafc. Kh&aacute;nh Linh ch\\u1ecdn set \\u0111\\u1ed3 n\\u1ed9i y m&agrave;u cam b\\u1eaft m\\u1eaft k\\u1ebft h\\u1ee3p v\\u1edbi qu\\u1ea7n jean t\\u0103ng \\u0111\\u1ed9 c&aacute; t&iacute;nh. Th&acirc;n h&igrave;nh s\\u0103n ch\\u1eafc v\\u1edbi c\\u01a1 b\\u1ee5ng g\\u1ed3 gh\\u1ec1 c\\u1ee7a ch&acirc;n d&agrave;i thu h&uacute;t m\\u1ecdi &aacute;nh nh&igrave;n.<\\/p>\\r\\n\\r\\n<p><img alt=\\\"Th\\u1eddi trang \\u1edf nh\\u00e0 m\\u00f9a Covid19: Ti\\u1ec3u Th\\u01b0 RMIT di\\u1ec7n \\u0111\\u1ed3 ng\\u1ee7 quy\\u1ebfn r\\u0169 ch\\u1ec9 \\u0111\\u1ec3... ch\\u1edd shipper - 8\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-06-10\\/Thoi-trang-o-nha-chong-dich-Tieu-Thu-RMIT-e-ap-voi-noi-y-Hien-Ho-hoa-nang-tho-voi-bodysuit-batch_189718642_10226240471899277_7227154389020940-1623309464-463-width800height1116.jpg\\\" style=\\\"width:660px\\\" \\/><\\/p>\\r\\n\\r\\n<p>Thi&ecirc;n Nga l&agrave; m\\u1ed9t trong nh\\u1eefng ch&acirc;n d&agrave;i ch\\u0103m ch\\u1ec9 l&ecirc;n \\u0111\\u1ed3 ch\\u1ee5p h&igrave;nh nh\\u1ea5t trong th\\u1eddi \\u0111i\\u1ec3m gi&atilde;n c&aacute;ch x&atilde; h\\u1ed9i. C&ocirc; l\\u0103ng x&ecirc; nhi\\u1ec1u m\\u1ed1t m\\u1edbi l\\u1ea1, t\\u1eeb c&aacute; t&iacute;nh t\\u1edbi n\\u1eef t&iacute;nh. C&ocirc; \\u0111\\u1ea7u t\\u01b0 &aacute;o qu\\u1ea7n, ph\\u1ee5 ki\\u1ec7n t\\u1edbi layout trang \\u0111i\\u1ec3m ph&ugrave; h\\u1ee3p. \\u0110\\u01b0\\u1ee3c bi\\u1ebft, m\\u1eb9 c&ocirc; l&agrave; ng\\u01b0\\u1eddi ghi l\\u1ea1i nh\\u1eefng shoot h&igrave;nh n&agrave;y.<\\/p>\\r\\n\\r\\n<p><img alt=\\\"Th\\u1eddi trang \\u1edf nh\\u00e0 m\\u00f9a Covid19: Ti\\u1ec3u Th\\u01b0 RMIT di\\u1ec7n \\u0111\\u1ed3 ng\\u1ee7 quy\\u1ebfn r\\u0169 ch\\u1ec9 \\u0111\\u1ec3... ch\\u1edd shipper - 9\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-06-10\\/Thoi-trang-o-nha-chong-dich-Tieu-Thu-RMIT-e-ap-voi-noi-y-Hien-Ho-hoa-nang-tho-voi-bodysuit-batch_195472788_1429412804083463_67770524275480022-1623309464-159-width800height1000.jpg\\\" style=\\\"width:660px\\\" \\/><\\/p>\\r\\n\\r\\n<p>M&acirc;u Thu\\u1ef7 c&oacute; l\\u1ef1a ch\\u1ecdn kh&aacute;c bi\\u1ec7t v\\u1ec1 phong c&aacute;ch th\\u1eddi trang. C&ocirc; l&ecirc;n \\u0111\\u1ed3 k&iacute;n \\u0111&aacute;o nh\\u01b0ng s\\u1eafc m&agrave;u, mang l\\u1ea1i n\\u0103ng l\\u01b0\\u1ee3ng t&iacute;ch c\\u1ef1c cho ng\\u01b0\\u1eddi nh&igrave;n.<\\/p>\\r\\n\\r\\n<p>Ngu\\u1ed3n: http:\\/\\/danviet.vn\\/thoi-trang-o-nha-mua-covid19-tieu-thu-rmit-dien-do-ngu-quyen-ru-chi-de-cho-shipper-5020211261126181.htm<\\/p>\",\"category\":[\"3\",null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/storage\\/app\\/public\\/images\\/blog\\/Thoi-trang-o-nha-chong-dich-Tieu-Thu-RMIT-e-ap-voi-noi-y-Hien-Ho-hoa-nang-tho-voi-bodysuit-batch_192965634_2252622524868792_24358680887199272-1623308317-47-width800height995.jpg\",\"_token\":\"BCmPGaanfrBOlBiqzioSlBbD3BsdHHoB4DZiWARg\",\"after-save\":\"2\"}', '2021-06-12 04:28:31', '2021-06-12 04:28:31'),
(950, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-12 04:28:31', '2021-06-12 04:28:31'),
(951, 1, 'admin/posts', 'POST', '::1', '{\"title\":\"T\\u1ea1i sao m\\u1ed9t s\\u1ed1 ng\\u01b0\\u1eddi g\\u1eb7p ph\\u1ea3n \\u1ee9ng ph\\u1ee5 khi ti\\u00eam v\\u1eafc xin COVID-19?\",\"slug\":null,\"desc_short\":\"C\\u00e1c t\\u00e1c d\\u1ee5ng ph\\u1ee5 t\\u1ea1m th\\u1eddi bao g\\u1ed3m nh\\u1ee9c \\u0111\\u1ea7u, m\\u1ec7t m\\u1ecfi v\\u00e0 s\\u1ed1t l\\u00e0 nh\\u1eefng d\\u1ea5u hi\\u1ec7u h\\u1ec7 th\\u1ed1ng mi\\u1ec5n d\\u1ecbch \\u0111ang ph\\u1ee5c h\\u1ed3i - m\\u1ed9t ph\\u1ea3n \\u1ee9ng b\\u00ecnh th\\u01b0\\u1eddng v\\u1edbi v\\u1eafc xin. C\\u00e1c ph\\u1ea3n \\u1ee9ng n\\u00e0y x\\u1ea3y ra kh\\u00e1 th\\u00f4ng d\\u1ee5ng.\",\"body\":\"<p><img alt=\\\"T\\u1ea1i sao m\\u1ed9t s\\u1ed1 ng\\u01b0\\u1eddi g\\u1eb7p ph\\u1ea3n \\u1ee9ng ph\\u1ee5 khi ti\\u00eam v\\u1eafc xin COVID-19? - 1\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-06-12\\/\\/1623465863-639562bc82784ebb9dc43ab6c9bcbbed-width1200height675.jpg\\\" style=\\\"width:660px\\\" \\/><\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>Ti\\u1ebfn s\\u0129 Peter Marks, gi&aacute;m \\u0111\\u1ed1c&nbsp;<a href=\\\"https:\\/\\/www.24h.com.vn\\/vac-xin-covid-19-c46e6432.html\\\" title=\\\"v\\u1eafc xin\\\">v\\u1eafc xin<\\/a>&nbsp;c\\u1ee7a C\\u1ee5c Qu\\u1ea3n l&yacute; Th\\u1ef1c ph\\u1ea9m v&agrave; D\\u01b0\\u1ee3c ph\\u1ea9m M\\u1ef9, ng\\u01b0\\u1eddi \\u0111&atilde; c\\u1ea3m th\\u1ea5y m\\u1ec7t m\\u1ecfi sau li\\u1ec1u ti&ecirc;m&nbsp;<a href=\\\"https:\\/\\/www.24h.com.vn\\/vac-xin-covid-19-c46e6432.html\\\" title=\\\"v\\u1eafc xin COVID-19\\\">v\\u1eafc xin COVID-19<\\/a>&nbsp;\\u0111\\u1ea7u ti&ecirc;n cho bi\\u1ebft: &ldquo;M\\u1ed9t ng&agrave;y sau khi ti&ecirc;m nh\\u1eefng lo\\u1ea1i v\\u1eafc xin n&agrave;y, t&ocirc;i s\\u1ebd kh&ocirc;ng l&ecirc;n k\\u1ebf ho\\u1ea1ch cho b\\u1ea5t k\\u1ef3 ho\\u1ea1t \\u0111\\u1ed9ng th\\u1ec3 ch\\u1ea5t v\\u1ea5t v\\u1ea3 n&agrave;o&rdquo;.&nbsp;<\\/p>\\r\\n\\r\\n<p>\\u0110&acirc;y l&agrave; nh\\u1eefng g&igrave; x\\u1ea3y ra trong c\\u01a1 th\\u1ec3 sau khi ti&ecirc;m v\\u1eafc xin: H\\u1ec7 th\\u1ed1ng mi\\u1ec5n d\\u1ecbch c&oacute; hai nh&aacute;nh ch&iacute;nh v&agrave; ho\\u1ea1t \\u0111\\u1ed9ng \\u0111\\u1ea7u ti&ecirc;n ngay khi c\\u01a1 th\\u1ec3 ph&aacute;t hi\\u1ec7n ra k\\u1ebb x&acirc;m nh\\u1eadp t\\u1eeb b&ecirc;n ngo&agrave;i. C&aacute;c t\\u1ebf b&agrave;o b\\u1ea1ch c\\u1ea7u tr&agrave;n \\u0111\\u1ebfn v\\u1ecb tr&iacute; ti&ecirc;m, g&acirc;y ra tri\\u1ec7u ch\\u1ee9ng ph\\u1ea3n \\u1ee9ng nh\\u01b0 \\u1edbn l\\u1ea1nh, \\u0111au nh\\u1ee9c, m\\u1ec7t m\\u1ecfi v&agrave; c&aacute;c t&aacute;c d\\u1ee5ng ph\\u1ee5 kh&aacute;c.<\\/p>\\r\\n\\r\\n<p>B\\u01b0\\u1edbc ph\\u1ea3n \\u1ee9ng nhanh n&agrave;y c\\u1ee7a h\\u1ec7 th\\u1ed1ng mi\\u1ec5n d\\u1ecbch c&oacute; xu h\\u01b0\\u1edbng suy y\\u1ebfu theo tu\\u1ed5i t&aacute;c. \\u0110&oacute; l&agrave; l&yacute; do m&agrave; nh\\u1eefng ng\\u01b0\\u1eddi tr\\u1ebb tu\\u1ed5i th\\u01b0\\u1eddng g\\u1eb7p t&aacute;c d\\u1ee5ng ph\\u1ee5 th\\u01b0\\u1eddng xuy&ecirc;n h\\u01a1n ng\\u01b0\\u1eddi l\\u1edbn tu\\u1ed5i. Ngo&agrave;i ra, m\\u1ed9t s\\u1ed1 lo\\u1ea1i v\\u1eafc xin ch\\u1ec9 \\u0111\\u01a1n gi\\u1ea3n l&agrave; g&acirc;y ra nhi\\u1ec1u ph\\u1ea3n \\u1ee9ng h\\u01a1n nh\\u1eefng lo\\u1ea1i kh&aacute;c.<\\/p>\\r\\n\\r\\n<p>Tr&ecirc;n th\\u1ef1c t\\u1ebf, c\\u01a1 th\\u1ec3 c\\u1ee7a m\\u1ed7i ng\\u01b0\\u1eddi c&oacute; ph\\u1ea3n \\u1ee9ng kh&aacute;c nhau v\\u1edbi vi\\u1ec7c ti&ecirc;m v\\u1eafc xin. N\\u1ebfu b\\u1ea1n kh&ocirc;ng c\\u1ea3m th\\u1ea5y g&igrave; m\\u1ed9t ho\\u1eb7c hai ng&agrave;y sau ti&ecirc;m m\\u1ed9t ho\\u1eb7c hai li\\u1ec1u, \\u0111i\\u1ec1u \\u0111&oacute; kh&ocirc;ng c&oacute; ngh\\u0129a l&agrave; v\\u1eafc xin kh&ocirc;ng ho\\u1ea1t \\u0111\\u1ed9ng.<\\/p>\\r\\n\\r\\n<p>B&ecirc;n trong c\\u01a1 th\\u1ec3, c&aacute;c m\\u0169i ti&ecirc;m s\\u1ebd th&uacute;c \\u0111\\u1ea9y chuy\\u1ec3n \\u0111\\u1ed9ng ph\\u1ea7n th\\u1ee9 hai c\\u1ee7a h\\u1ec7 th\\u1ed1ng mi\\u1ec5n d\\u1ecbch c\\u1ee7a b\\u1ea1n, khi\\u1ebfn h\\u1ec7 th\\u1ed1ng cung c\\u1ea5p s\\u1ef1 b\\u1ea3o v\\u1ec7 th\\u1ef1c s\\u1ef1 kh\\u1ecfi virus b\\u1eb1ng c&aacute;ch s\\u1ea3n xu\\u1ea5t kh&aacute;ng th\\u1ec3.<\\/p>\\r\\n\\r\\n<p><img alt=\\\"T\\u1ea1i sao m\\u1ed9t s\\u1ed1 ng\\u01b0\\u1eddi g\\u1eb7p ph\\u1ea3n \\u1ee9ng ph\\u1ee5 khi ti\\u00eam v\\u1eafc xin COVID-19? - 3\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-06-12\\/\\/1623465863-e3f8cbd7bd5b05d2aa2edebc80130ba5-width693height389.jpg\\\" style=\\\"width:660px\\\" \\/><\\/p>\\r\\n\\r\\n<p>M\\u1ed9t t&aacute;c d\\u1ee5ng ph\\u1ee5 phi\\u1ec1n to&aacute;i kh&aacute;c: Khi h\\u1ec7 th\\u1ed1ng mi\\u1ec5n d\\u1ecbch k&iacute;ch ho\\u1ea1t, n&oacute; c\\u0111&ocirc;i khi g&acirc;y s\\u01b0ng t\\u1ea1m th\\u1eddi \\u1edf c&aacute;c h\\u1ea1ch b\\u1ea1ch huy\\u1ebft, ch\\u1eb3ng h\\u1ea1n nh\\u01b0 h\\u1ea1ch d\\u01b0\\u1edbi c&aacute;nh tay. Ph\\u1ee5 n\\u1eef \\u0111\\u01b0\\u1ee3c khuy\\u1ebfn kh&iacute;ch l&ecirc;n l\\u1ecbch ch\\u1ee5p X-quang tuy\\u1ebfn v&uacute; \\u0111\\u1ecbnh k\\u1ef3 tr\\u01b0\\u1edbc khi ch\\u1ee7ng ng\\u1eeba COVID-19 \\u0111\\u1ec3 tr&aacute;nh nh\\u1ea7m l\\u1eabn m\\u1ed9t n\\u1ed1t s\\u01b0ng v\\u1edbi ung th\\u01b0.<\\/p>\\r\\n\\r\\n<p>Tuy nhi&ecirc;n, kh&ocirc;ng ph\\u1ea3i t\\u1ea5t c\\u1ea3 c&aacute;c t&aacute;c d\\u1ee5ng ph\\u1ee5 \\u0111\\u1ec1u l&agrave; b&igrave;nh th\\u01b0\\u1eddng. Sau h&agrave;ng tr\\u0103m tri\\u1ec7u li\\u1ec1u v\\u1eafc xin \\u0111\\u01b0\\u1ee3c s\\u1eed d\\u1ee5ng tr&ecirc;n kh\\u1eafp th\\u1ebf gi\\u1edbi - v&agrave; gi&aacute;m s&aacute;t an to&agrave;n nghi&ecirc;m ng\\u1eb7t - m\\u1ed9t s\\u1ed1 r\\u1ee7i ro nghi&ecirc;m tr\\u1ecdng \\u0111&atilde; \\u0111\\u01b0\\u1ee3c x&aacute;c \\u0111\\u1ecbnh. M\\u1ed9t t\\u1ef7 l\\u1ec7 r\\u1ea5t nh\\u1ecf nh\\u1eefng ng\\u01b0\\u1eddi ti&ecirc;m v\\u1eafc xin do AstraZeneca v&agrave; Johnson &amp; Johnson s\\u1ea3n xu\\u1ea5t \\u0111&atilde; b&aacute;o c&aacute;o b\\u1ecb g\\u1eb7p t&igrave;nh tr\\u1ea1ng m&aacute;u \\u0111&ocirc;ng b\\u1ea5t th\\u01b0\\u1eddng. M\\u1ed9t s\\u1ed1 qu\\u1ed1c gia \\u0111&atilde; kh&ocirc;ng ti&ecirc;m v\\u1eafc xin COVID-19 cho ng\\u01b0\\u1eddi l\\u1edbn tu\\u1ed5i song c&aacute;c c\\u01a1 quan qu\\u1ea3n l&yacute; cho bi\\u1ebft l\\u1ee3i &iacute;ch c\\u1ee7a vi\\u1ec7c ch\\u1ee7ng ng\\u1eeba v\\u1eabn l\\u1edbn h\\u01a1n r\\u1ee7i ro.<\\/p>\\r\\n\\r\\n<p>M\\u1ed9t s\\u1ed1 ng\\u01b0\\u1eddi th\\u1ec9nh tho\\u1ea3ng c&oacute; c&aacute;c ph\\u1ea3n \\u1ee9ng d\\u1ecb \\u1ee9ng nghi&ecirc;m tr\\u1ecdng sau khi ti&ecirc;m v\\u1eafc xin. \\u0110&oacute; l&agrave; l&yacute; do t\\u1ea1i sao b\\u1ea1n \\u0111\\u01b0\\u1ee3c y&ecirc;u c\\u1ea7u \\u1edf l\\u1ea1i kho\\u1ea3ng 15 ph&uacute;t sau khi ti&ecirc;m b\\u1ea5t k\\u1ef3 lo\\u1ea1i v\\u1eafc xin COVID-19 n&agrave;o - \\u0111\\u1ec3 \\u0111\\u1ea3m b\\u1ea3o m\\u1ecdi ph\\u1ea3n \\u1ee9ng c&oacute; th\\u1ec3 \\u0111\\u01b0\\u1ee3c \\u0111i\\u1ec1u tr\\u1ecb k\\u1ecbp th\\u1eddi.<\\/p>\\r\\n\\r\\n<p>Cu\\u1ed1i c&ugrave;ng, c&aacute;c nh&agrave; ch\\u1ee9c tr&aacute;ch \\u0111ang c\\u1ed1 g\\u1eafng x&aacute;c \\u0111\\u1ecbnh xem li\\u1ec7u t&igrave;nh tr\\u1ea1ng vi&ecirc;m tim t\\u1ea1m th\\u1eddi c&oacute; th\\u1ec3 x\\u1ea3y ra v\\u1edbi nhi\\u1ec1u lo\\u1ea1i b\\u1ec7nh nhi\\u1ec5m tr&ugrave;ng c\\u0169ng c&oacute; th\\u1ec3 l&agrave; m\\u1ed9t t&aacute;c d\\u1ee5ng ph\\u1ee5 hi\\u1ebfm g\\u1eb7p sau v\\u1eafc xin mRNA, lo\\u1ea1i do Pfizer v&agrave; Moderna s\\u1ea3n xu\\u1ea5t hay kh&ocirc;ng. C&aacute;c quan ch\\u1ee9c y t\\u1ebf M\\u1ef9 cho bi\\u1ebft h\\u1ecd ch\\u01b0a th\\u1ec3 bi\\u1ebft li\\u1ec7u c&oacute; m\\u1ed1i li&ecirc;n h\\u1ec7 n&agrave;o hay kh&ocirc;ng nh\\u01b0ng n&oacute;i r\\u1eb1ng h\\u1ecd \\u0111ang theo d&otilde;i m\\u1ed9t s\\u1ed1 l\\u01b0\\u1ee3ng nh\\u1ecf c&aacute;c b&aacute;o c&aacute;o, ch\\u1ee7 y\\u1ebfu l&agrave; nam thanh ni&ecirc;n ho\\u1eb7c thanh ni&ecirc;n, v\\u1ec1 t&igrave;nh tr\\u1ea1ng n&agrave;y.<\\/p>\\r\\n\\r\\n<p>Ngu\\u1ed3n: https:\\/\\/suckhoedoisong.vn\\/tai-sao-mot-so-nguoi-gap-phan-ung-phu-khi-tiem-vac-xin-covid-19-n194825.html<\\/p>\",\"category\":[\"3\",null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/storage\\/app\\/public\\/images\\/blog\\/1623465863-639562bc82784ebb9dc43ab6c9bcbbed-width1200height675.jpg\",\"_token\":\"BCmPGaanfrBOlBiqzioSlBbD3BsdHHoB4DZiWARg\",\"after-save\":\"2\"}', '2021-06-12 04:29:51', '2021-06-12 04:29:51'),
(952, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-12 04:29:52', '2021-06-12 04:29:52'),
(953, 1, 'admin/posts', 'POST', '::1', '{\"title\":\"Ng\\u1ee1 ng\\u00e0ng nh\\u00e0 ti\\u00ean tri EURO: \\u0110o\\u00e1n t\\u1ec9 s\\u1ed1 tr\\u00fang 100%, \\u0111\\u00fang c\\u1ea3 ng\\u01b0\\u1eddi ph\\u1ea3n l\\u01b0\\u1edbi\",\"slug\":null,\"desc_short\":\"M\\u1ed9t C\\u0110V Italia g\\u00e2y ng\\u1ee1 ng\\u00e0ng khi d\\u1ef1 \\u0111o\\u00e1n \\u0111\\u00fang t\\u1ec9 s\\u1ed1 100% \\u1edf tr\\u1eadn khai m\\u1ea1c EURO.\",\"body\":\"<p>\\u0110T Italia v\\u1eeba c&oacute; m&agrave;n ra qu&acirc;n m&atilde;n nh&atilde;n t\\u1ea1i&nbsp;<a href=\\\"https:\\/\\/www.24h.com.vn\\/euro-2021-c955.html\\\" title=\\\"VCK EURO 2021\\\">VCK EURO 2021<\\/a>&nbsp;v\\u1edbi chi\\u1ebfn th\\u1eafng 3-0 tr\\u01b0\\u1edbc \\u0110T Th\\u1ed5 Nh\\u0129 K\\u1ef3. B&agrave;n th\\u1eafng m\\u1edf m&agrave;n cho gi\\u1ea3i \\u0111\\u1ea5u l\\u1ea7n n&agrave;y l\\u1ea1i l&agrave; m\\u1ed9t pha ph\\u1ea3n l\\u01b0\\u1edbi nh&agrave; v&agrave; Merih Demiral c\\u1ee7a Th\\u1ed5 Nh\\u0129 K\\u1ef3 l&agrave; t&aacute;c gi\\u1ea3 b\\u1ea5t \\u0111\\u1eafc d\\u0129. Hai b&agrave;n c&ograve;n l\\u1ea1i c\\u1ee7a \\u0110T &Yacute; do c&ocirc;ng c\\u1ee7a Ciro Immobile v&agrave; Lorenzo Insigne.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p><img alt=\\\"Ng\\u1ee1 ng\\u00e0ng nh\\u00e0 ti\\u00ean tri EURO: \\u0110o\\u00e1n t\\u1ec9 s\\u1ed1 tr\\u00fang 100%, \\u0111\\u00fang c\\u1ea3 ng\\u01b0\\u1eddi ph\\u1ea3n l\\u01b0\\u1edbi - 1\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-06-12\\/CdV-Italia-22-660-1623452509-555-width660height449.jpg\\\" \\/><\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>\\u0110T Italia th\\u1eafng \\u0110T Th\\u1ed5 Nh\\u0129 K\\u1ef3 trong ng&agrave;y ra qu&acirc;n<\\/p>\\r\\n\\r\\n<p>Chi\\u1ebfn th\\u1eafng n&agrave;y gi&uacute;p \\u0110T &Yacute; c&oacute; c\\u01a1 h\\u1ed9i l\\u1edbn \\u0111i ti\\u1ebfp d&ugrave; m\\u1edbi ch\\u1ec9 thi \\u0111\\u1ea5u m\\u1ed9t tr\\u1eadn. B\\u1edfi v\\u1eady, c&aacute;c kh&aacute;n gi\\u1ea3 c\\u1ee7a \\u0111\\u1ed9i b&oacute;ng n&agrave;y c\\u1ef1c vui v&agrave; h\\u1ecd c&ograve;n ph\\u1ea5n kh&iacute;ch khi m\\u1ed9t c\\u1ed5 \\u0111\\u1ed9ng vi&ecirc;n ng\\u01b0\\u1eddi &Yacute; t\\u1ea1o ra m\\u1ed9t \\u0111i\\u1ec1u &ldquo;kh&ocirc;ng t\\u01b0\\u1edfng&rdquo;.<\\/p>\\r\\n\\r\\n<p>Tr\\u01b0\\u1edbc khi tr\\u1eadn \\u0111\\u1ea5u b\\u1eaft \\u0111\\u1ea7u nhi\\u1ec1u gi\\u1edd \\u0111\\u1ed3ng h\\u1ed3, t&agrave;i kho\\u1ea3n ch&iacute;nh th\\u1ee9c tr&ecirc;n m\\u1ea1ng x&atilde; h\\u1ed9i c\\u1ee7a VCK&nbsp;<a href=\\\"https:\\/\\/www.24h.com.vn\\/euro-2021-c955.html\\\" title=\\\"EURO 2021\\\">EURO 2021<\\/a>&nbsp;c&oacute; \\u0111\\u1eb7t c&acirc;u h\\u1ecfi d\\u1ef1 \\u0111o&aacute;n t\\u1ec9 s\\u1ed1 tr\\u1eadn \\u0111\\u1ea5u v&agrave; c\\u1ea7u th\\u1ee7 ghi b&agrave;n. M\\u1ed9t c\\u1ed5 \\u0111\\u1ed9ng vi&ecirc;n c\\u1ee7a &Yacute; c&oacute; t&ecirc;n t&agrave;i kho\\u1ea3n l&agrave; @VanJuice \\u0111&atilde; d\\u1ef1 \\u0111o&aacute;n \\u0111&uacute;ng \\u0111\\u01b0\\u1ee3c t\\u1ea5t c\\u1ea3 \\u0111i\\u1ec1u ki\\u1ec7n tr&ecirc;n.<\\/p>\\r\\n\\r\\n<p>Ngay c\\u1ea3 vi\\u1ec7c Demiral c\\u1ee7a Th\\u1ed5 Nh\\u0129 K\\u1ef3 ph\\u1ea3n l\\u01b0\\u1edbi nh&agrave; c\\u0169ng \\u0111\\u01b0\\u1ee3c t&agrave;i kho\\u1ea3n n&agrave;y d\\u1ef1 \\u0111o&aacute;n ch&iacute;nh x&aacute;c. T&agrave;i kho\\u1ea3n n&agrave;y ch\\u1ec9 d\\u1ef1 \\u0111o&aacute;n sai th\\u1ee9 t\\u1ef1 c\\u1ee7a nh\\u1eefng ng\\u01b0\\u1eddi ghi b&agrave;n, (Immobile, Insigne, Demiral ph\\u1ea3n l\\u01b0\\u1edbi) thay v&igrave; (Demiral ph\\u1ea3n l\\u01b0\\u1edbi, Immobile, Insigne).<\\/p>\\r\\n\\r\\n<p><img alt=\\\"Ng\\u1ee1 ng\\u00e0ng nh\\u00e0 ti\\u00ean tri EURO: \\u0110o\\u00e1n t\\u1ec9 s\\u1ed1 tr\\u00fang 100%, \\u0111\\u00fang c\\u1ea3 ng\\u01b0\\u1eddi ph\\u1ea3n l\\u01b0\\u1edbi - 3\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-06-12\\/CdV-Italia-23-660-1623452647-339-width660height714.jpg\\\" \\/><\\/p>\\r\\n\\r\\n<p>Ban t\\u1ed5 ch\\u1ee9c t\\u1ed5 ch\\u1ee9c tr&ograve; ch\\u01a1i d\\u1ef1 \\u0111o&aacute;n t\\u1ec9 s\\u1ed1 v&agrave;....<\\/p>\\r\\n\\r\\n<p><img alt=\\\"Ng\\u1ee1 ng\\u00e0ng nh\\u00e0 ti\\u00ean tri EURO: \\u0110o\\u00e1n t\\u1ec9 s\\u1ed1 tr\\u00fang 100%, \\u0111\\u00fang c\\u1ea3 ng\\u01b0\\u1eddi ph\\u1ea3n l\\u01b0\\u1edbi - 4\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-06-12\\/CdV-Italia-24-660-1623452647-601-width660height384.jpg\\\" \\/><\\/p>\\r\\n\\r\\n<p>k\\u1ebft qu\\u1ea3 d\\u1ef1 \\u0111o&aacute;n th\\u1ef1c s\\u1ef1 kh&oacute; tin...<\\/p>\\r\\n\\r\\n<p>\\u0110i\\u1ec1u n&agrave;y th\\u1ef1c s\\u1ef1 r\\u1ea5t kh&oacute; tin b\\u1edfi x&aacute;c su\\u1ea5t x\\u1ea3y ra \\u0111i\\u1ec1u n&agrave;y l&agrave; qu&aacute; nh\\u1ecf. &nbsp;Ngay c\\u1ea3 c&aacute;c &nbsp;nh&agrave; c&aacute;i c\\u0169ng ch\\u1eb3ng \\u0111\\u01b0a ra t\\u1ec9 l\\u1ec7 cho ph\\u01b0\\u01a1ng &aacute;n n&agrave;y b\\u1edfi x&aacute;c su\\u1ea5t&nbsp;x\\u1ea3y ra l&agrave; c\\u1ef1c k\\u1ef3 th\\u1ea5p. N&ecirc;n nh\\u1edb r\\u1eb1ng, d\\u1ef1 \\u0111o&aacute;n t\\u1ec9 s\\u1ed1 tr\\u1eadn \\u0111\\u1ea5u \\u0111&atilde; r\\u1ea5t kh&oacute;, d\\u1ef1 \\u0111o&aacute;n c\\u1ea7u th\\u1ee7 ghi b&agrave;n c&ograve;n kh&oacute; h\\u01a1n v&agrave; d\\u1ef1 \\u0111o&aacute;n \\u0111\\u01b0\\u1ee3c c\\u1ea3 c\\u1ea7u th\\u1ee7 \\u0111&aacute; ph\\u1ea3n l\\u01b0\\u1edbi l&agrave; \\u0111i\\u1ec1u g\\u1ea7n nh\\u01b0 kh&ocirc;ng t\\u01b0\\u1edfng.<\\/p>\\r\\n\\r\\n<p>Ch&iacute;nh b\\u1edfi v\\u1eady, t&agrave;i kho\\u1ea3n ch&iacute;nh th\\u1ee9c c\\u1ee7a EURO 2021 c\\u0169ng ph\\u1ea3i s\\u1eed d\\u1ee5ng bi\\u1ec3u c\\u1ea3m &ldquo;b\\u1ea5t ng\\u1edd&rdquo; v&agrave; &ldquo;ng\\u1ea1c nhi&ecirc;n&rdquo; khi c&ocirc;ng b\\u1ed1 k\\u1ebft qu\\u1ea3. Trong khi \\u0111&oacute;, c\\u1ed9ng \\u0111\\u1ed3ng m\\u1ea1ng ph\\u1ea3n \\u1ee9ng r\\u1ea5t tr&aacute;i chi\\u1ec1u. &ldquo;Ph&ugrave; th\\u1ee7y&rdquo;, &ldquo;Ng\\u01b0\\u1eddi t\\u1edbi t\\u1eeb t\\u01b0\\u01a1ng lai&rdquo;, &ldquo;K\\u1ebb may m\\u1eafn v\\u0129 \\u0111\\u1ea1i&rdquo;&hellip; l&agrave; nh\\u1eefng bi\\u1ec7t danh t&iacute;ch c\\u1ef1c m&agrave; ng\\u01b0\\u1eddi d\\u1ef1 \\u0111o&aacute;n \\u0111&uacute;ng nh\\u1eadn \\u0111\\u01b0\\u1ee3c.<\\/p>\\r\\n\\r\\n<p>Trong khi \\u0111&oacute;, m\\u1ed9t s\\u1ed1 b&igrave;nh lu\\u1eadn ti&ecirc;u c\\u1ef1c \\u0111\\u1eb7t gi\\u1ea3 thi\\u1ebft li\\u1ec7u t&agrave;i kho\\u1ea3n n&agrave;y c&oacute; gian l\\u1eadn g&igrave; hay kh&ocirc;ng? C&oacute; s\\u1ef1 &ldquo;ch\\u1ec9nh s\\u1eeda&rdquo; b&agrave;i vi\\u1ebft hay tr\\u1eadn \\u0111\\u1ea5u \\u0111&atilde; b\\u1ecb d&agrave;n x\\u1ebfp t\\u1ec9 s\\u1ed1 t\\u1eeb tr\\u01b0\\u1edbc? Tuy nhi&ecirc;n, &iacute;t ng\\u01b0\\u1eddi \\u0111\\u1ed3ng t&igrave;nh v\\u1edbi nh\\u1eefng &yacute; ki\\u1ebfn ti&ecirc;u c\\u1ef1c n&agrave;y. \\u0110a ph\\u1ea7n s\\u1ed1 \\u0111&ocirc;ng \\u0111\\u1ec1u cho r\\u1eb1ng t&agrave;i kho\\u1ea3n n&agrave;y &ldquo;\\u0103n may&rdquo; \\u0111\\u01b0\\u1ee3c kho\\u1ea3ng kh\\u1eafc kh&ocirc;ng t\\u01b0\\u1edfng.<\\/p>\\r\\n\\r\\n<p>Ngu\\u1ed3n: https:\\/\\/tcdulichtphcm.vn\\/the-thao\\/ngo-ngang-nha-tien-tri-euro-doan-ti-so-trung-100-dung-ca-nguoi-phan-luoi-c28a8659.html<\\/p>\",\"category\":[\"3\",null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/storage\\/app\\/public\\/images\\/blog\\/CdV-Italia-22-660-1623452509-555-width660height449.jpg\",\"_token\":\"BCmPGaanfrBOlBiqzioSlBbD3BsdHHoB4DZiWARg\"}', '2021-06-12 04:31:10', '2021-06-12 04:31:10'),
(954, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-12 04:31:10', '2021-06-12 04:31:10'),
(955, 1, 'admin/posts', 'GET', '::1', '{\"per_page\":\"10\",\"_pjax\":\"#pjax-container\"}', '2021-06-12 04:31:19', '2021-06-12 04:31:19'),
(956, 1, 'admin/posts/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 04:31:22', '2021-06-12 04:31:22'),
(957, 1, 'admin/posts', 'POST', '::1', '{\"title\":\"\\u0110\\u1ea1i gia H\\u00e0 th\\u00e0nh chi 10 t\\u1ec9 s\\u1edf h\\u1eefu \\u0111\\u00e0n c\\u00e1 Koi quy t\\u1ee5 to\\u00e0n \\u201csi\\u00eau ph\\u1ea9m\\u201d, c\\u00f3 con l\\u00ean t\\u1edbi 120 tri\\u1ec7u\",\"slug\":null,\"desc_short\":\"85 con c\\u00e1 Koi \\u0111\\u01b0\\u1ee3c chia th\\u00e0nh 3 b\\u1ec3 c\\u00e1, \\u0111\\u1eb7t \\u1edf 3 \\u0111\\u1ecba \\u0111i\\u1ec3m kh\\u00e1c nhau, anh Ch\\u01b0\\u01a1ng Tailor (50 tu\\u1ed5i, H\\u00e0 N\\u1ed9i) ch\\u1ee7 s\\u1edf h\\u1eefu c\\u1ee7a \\u0111\\u00e0n c\\u00e1 n\\u00e0y \\u0111\\u00e3 t\\u1ed1n nhi\\u1ec1u c\\u00f4ng s\\u1ee9c v\\u00e0 ti\\u1ec1n c\\u1ee7a \\u0111\\u1ec3 t\\u00ecm ki\\u1ebfm v\\u00e0 \\u0111\\u1eb7t mua ch\\u00fang t\\u1eeb nh\\u1eefng tr\\u1ea1i danh ti\\u1ebfng b\\u1eadc nh\\u1ea5t Nh\\u1eadt B\\u1ea3n. Nh\\u1eefng con c\\u00e1 Koi n\\u00e0y c\\u00f3 gi\\u00e1 dao \\u0111\\u1ed9ng t\\u1eeb 1000$ - 5000$ (kho\\u1ea3ng 23 \\u2013 115 tri\\u1ec7u \\u0111\\u1ed3ng)\\/con.\",\"body\":\"<p>Anh D\\u01b0\\u01a1ng V\\u0103n Ch\\u01b0\\u01a1ng (50 tu\\u1ed5i, t&ecirc;n th\\u01b0\\u1eddng g\\u1ecdi l&agrave; Ch\\u01b0\\u01a1ng Tailor) n\\u1ed5i ti\\u1ebfng trong gi\\u1edbi sinh v\\u1eadt c\\u1ea3nh l&agrave; m\\u1ed9t \\u0111\\u1ea1i gia &ldquo;ch\\u1ecbu ch\\u01a1i&rdquo;. Anh kh&ocirc;ng ng\\u1ea1i chi h&agrave;ng ch\\u1ee5c t\\u1ec9 \\u0111\\u1ed3ng cho th&uacute; vui th\\u01b0\\u1ee3ng l\\u01b0u c\\u1ee7a m&igrave;nh d&agrave;nh cho c&aacute;c lo&agrave;i chim, c&aacute; c\\u1ea3nh. Ngo&agrave;i s\\u1edf h\\u1eefu \\u0111&agrave;n chim m&agrave;u \\u0111\\u1ed9c nh\\u1ea5t Vi\\u1ec7t Nam, anh c&ograve;n l&agrave; ch\\u1ee7 nh&acirc;n c\\u1ee7a 85 ch&uacute; c&aacute; Koi thu\\u1ed9c h&agrave;ng si&ecirc;u ph\\u1ea9m.<\\/p>\\r\\n\\r\\n<p>Ni\\u1ec1m \\u0111am m&ecirc; v\\u1edbi c&aacute; b\\u1eaft \\u0111\\u1ea7u khi anh t&igrave;m th\\u1ea5y ngu\\u1ed3n c\\u1ea3m h\\u1ee9ng \\u0111\\u1eb7c bi\\u1ec7t v\\u1edbi c&aacute;c lo\\u1ea1i sinh v\\u1eadt c\\u1ea3nh nhi\\u1ec1u m&agrave;u s\\u1eafc. B&ecirc;n c\\u1ea1nh nh\\u1eefng ch&uacute; chim m&agrave;u \\u0111\\u1eaft \\u0111\\u1ecf, anh Ch\\u01b0\\u01a1ng nh\\u1edd b\\u1ea1n b&egrave; l&acirc;u n\\u0103m trong gi\\u1edbi ch\\u01a1i c&aacute; Koi chuy&ecirc;n nghi\\u1ec7p gi\\u1edbi thi\\u1ec7u v&agrave; t&igrave;m mua nh\\u1eefng ch&uacute; c&aacute; Koi \\u0111\\u1ea7u ti&ecirc;n \\u0111\\u1ec3 b\\u1ed5 sung v&agrave;o b\\u1ec3 c&aacute;.<\\/p>\\r\\n\\r\\n<p><img alt=\\\"\\u0110\\u1ea1i gia H\\u00e0 th\\u00e0nh chi 10 t\\u1ec9 s\\u1edf h\\u1eefu \\u0111\\u00e0n c\\u00e1 Koi quy t\\u1ee5 to\\u00e0n \\u201csi\\u00eau ph\\u1ea9m\\u201d, c\\u00f3 con l\\u00ean t\\u1edbi 120 tri\\u1ec7u - 1\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/3-2020\\/images\\/2020-07-24\\/dai-gia-Ha-thanh-chi-10-ti-so-huu-dan-ca-Koi-quy-tu-toan-sieu-pham-co-con-len-toi-120-trieu-co-1-1595591282-230-width750height500.jpg\\\" style=\\\"width:660px\\\" \\/><\\/p>\\r\\n\\r\\n<p>\\u0110\\u1ea1i gia Ch\\u01b0\\u01a1ng Tailor hi\\u1ec7n \\u0111ang s\\u1edf h\\u1eefu kho\\u1ea3ng 85 ch&uacute; c&aacute; Koi c&aacute;c lo\\u1ea1i \\u1edf 3 b\\u1ec3&nbsp; \\u0111\\u1eb7t t\\u1ea1i H&agrave; N\\u1ed9i v&agrave; S&agrave;i G&ograve;n.<\\/p>\\r\\n\\r\\n<p>\\u01afu ti&ecirc;n ch\\u1ea5t l\\u01b0\\u1ee3ng v\\u1ec1 v\\u1ebb \\u0111\\u1eb9p ngo&agrave;i h&igrave;nh l&ecirc;n h&agrave;ng \\u0111\\u1ea7u, nh\\u1eefng ch&uacute; c&aacute; Koi l\\u1ecdt v&agrave;o &ldquo;m\\u1eaft xanh&rdquo; c\\u1ee7a \\u0111\\u1ea1i gia H&agrave; th&agrave;nh ph\\u1ea3i l&agrave; nh\\u1eefng ch&uacute; c&aacute; m&agrave;u s\\u1eafc t\\u1ed1t, m\\u1ea3ng m&agrave;u tr&ecirc;n da c&oacute; \\u0111\\u1ed9 d&agrave;y, s\\u1eafc n&eacute;t. Tu\\u1ed5i th\\u1ecd c&aacute; c&ograve;n nh\\u1ecf nh\\u01b0ng c\\u1ea5u tr&uacute;c h&igrave;nh th\\u1ec3 ph\\u1ea3i to l\\u1edbn, c&acirc;n \\u0111\\u1ed1i, ph&aacute;t tri\\u1ec3n chi\\u1ec1u d&agrave;i v\\u01b0\\u1ee3t b\\u1eadc so v\\u1edbi nh\\u1eefng con c&aacute; c&ugrave;ng l\\u1ee9a. Nh\\u1eefng con c&aacute; Koi khi \\u0111\\u1ea1t \\u0111\\u01b0\\u1ee3c ti&ecirc;u chu\\u1ea9n kh\\u1eafc khe n&agrave;y c\\u0169ng ph\\u1ea3i qua nhi\\u1ec1u v&ograve;ng tuy\\u1ec3n ch\\u1ecdn v&agrave; c&oacute; gi&aacute; kh&ocirc;ng h\\u1ec1 r\\u1ebb.<\\/p>\\r\\n\\r\\n<p>&ldquo;T&ocirc;i kh&ocirc;ng ng\\u1ea1i chuy\\u1ec7n \\u0111\\u1eaft r\\u1ebb, ch\\u1ec9 c\\u1ea7n t&igrave;m \\u0111\\u01b0\\u1ee3c con c&aacute; \\u0111\\u1ea1t chu\\u1ea9n, \\u0111&uacute;ng nh\\u01b0 mong mu\\u1ed1n t\\u1eeb m\\u1ed9t trang tr\\u1ea1i uy t&iacute;n th&igrave; t&ocirc;i lu&ocirc;n s\\u0103n s&agrave;ng chi ti\\u1ec1n.&rdquo; &ndash; Anh Ch\\u01b0\\u01a1ng h&agrave;o h\\u1ee9ng chia s\\u1ebb.<\\/p>\\r\\n\\r\\n<p>Hi\\u1ec7n, t\\u1ed5ng \\u0111&agrave;n c&aacute; Koi \\u0111\\u1ea1i gia H&agrave; th&agrave;nh s\\u1edf h\\u1eefu kho\\u1ea3ng 85 con, \\u0111\\u01b0\\u1ee3c chia th&agrave;nh 3 b\\u1ec3 nh\\u1ecf \\u1edf H&agrave; N\\u1ed9i v&agrave; S&agrave;i G&ograve;n. Trong \\u0111&oacute;, \\u0111&agrave;n c&aacute; 25 con t\\u1ea1i nh&agrave; ri&ecirc;ng \\u1edf C\\u1eeda B\\u1eafc - H&agrave; N\\u1ed9i c&oacute; k&iacute;ch th\\u01b0\\u1edbc trung b&igrave;nh kho\\u1ea3ng 50 cm v\\u1edbi nhi\\u1ec1u d&ograve;ng c&aacute; Koi kh&aacute;c nhau quy t\\u1ee5 trong c&ugrave;ng 1 b\\u1ec3 c&aacute; nh\\u01b0: Kohaku c&oacute; 2 m&agrave;u \\u0111\\u1eb7c tr\\u01b0ng tr\\u1eafng \\u0111\\u1ecf; Hi Utsuri (\\u0111\\u1ecf - \\u0111en); Hariwake (tr\\u1eafng &ndash; v&agrave;ng, c&oacute; v&acirc;y kim lo\\u1ea1i s&aacute;ng b&oacute;ng); Ginshiro (d&ograve;ng kim lo\\u1ea1i tr\\u1eafng &ndash; \\u0111en)&hellip;<\\/p>\\r\\n\\r\\n<p><img alt=\\\"\\u0110\\u1ea1i gia H\\u00e0 th\\u00e0nh chi 10 t\\u1ec9 s\\u1edf h\\u1eefu \\u0111\\u00e0n c\\u00e1 Koi quy t\\u1ee5 to\\u00e0n \\u201csi\\u00eau ph\\u1ea9m\\u201d, c\\u00f3 con l\\u00ean t\\u1edbi 120 tri\\u1ec7u - 2\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/3-2020\\/images\\/2020-07-24\\/dai-gia-Ha-thanh-chi-10-ti-so-huu-dan-ca-Koi-quy-tu-toan-sieu-pham-co-con-len-toi-120-trieu-co-2-1595591282-968-width750height500.jpg\\\" style=\\\"width:660px\\\" \\/><\\/p>\\r\\n\\r\\n<p>\\u0110&agrave;n c&aacute; Koi c\\u1ee7a anh Ch\\u01b0\\u01a1ng c&oacute; gi&aacute; dao \\u0111\\u1ed9ng t\\u1eeb 1000$ - 5000$ (t\\u1eeb 23 tri\\u1ec7u &ndash; kho\\u1ea3ng 120 tri\\u1ec7u)\\/con.<\\/p>\\r\\n\\r\\n<p>Nh\\u1eefng con c&aacute; Koi n&agrave;y c&oacute; gi&aacute; dao \\u0111\\u1ed9ng t\\u1eeb 1000$ - 5000$ (t\\u1eeb 23 tri\\u1ec7u &ndash; kho\\u1ea3ng 120 tri\\u1ec7u)\\/con. \\u0110\\u1eb7c bi\\u1ec7t, anh Ch\\u01b0\\u01a1ng \\u0111&atilde; t\\u1ed1n nhi\\u1ec1u th\\u1eddi gian t&igrave;m ki\\u1ebfm v&agrave; \\u0111\\u1eb7t mua t\\u1eeb nh\\u1eefng h\\u1ed3 c&aacute; Koi uy t&iacute;n nh\\u1ea5t nh&igrave; Nh\\u1eadt B\\u1ea3n. Theo \\u0111\\u1ea1i gia H&agrave; th&agrave;nh chia s\\u1ebb, hi\\u1ec7n nay t\\u1ea1i Nh\\u1eadt B\\u1ea3n c&oacute; kho\\u1ea3ng 200 tr\\u1ea1i c&aacute; Koi nh\\u01b0ng trong s\\u1ed1 \\u0111&oacute; ch\\u1ec9 c&oacute; kho\\u1ea3ng 30 tr\\u1ea1i t&ecirc;n tu\\u1ed5i v&agrave; 10 trang tr\\u1ea1i c&oacute; danh ti\\u1ebfng th\\u1ef1c s\\u1ef1.<\\/p>\\r\\n\\r\\n<p>\\u0110\\u1ec3 ch\\u1ecdn \\u0111\\u01b0\\u1ee3c s\\u1ed1 &iacute;t nh\\u1eefng con ch\\u1ea5t l\\u01b0\\u1ee3ng v&agrave; c&oacute; k&iacute;ch th\\u01b0\\u1edbc tr&ecirc;n kh&ocirc;ng ph\\u1ea3i trang tr\\u1ea1i n&agrave;o c\\u0169ng nu&ocirc;i gi\\u1eef. Ch&iacute;nh v&igrave; th\\u1ebf, vi\\u1ec7c s\\u0103n l&ugrave;ng, th\\u1eadm ch&iacute; ph\\u1ea3i \\u0111\\u1ea5u gi&aacute; \\u0111\\u1ec3 s\\u1edf h\\u1eefu nh\\u1eefng ch&uacute; c&aacute; Koi n&agrave;y ph\\u1ea3i m\\u1ea5t r\\u1ea5t nhi\\u1ec1u th\\u1eddi gian, c&ocirc;ng s\\u1ee9c v&agrave; \\u0111&ocirc;i khi l&agrave; ph\\u1ea3i c&oacute; &ldquo;duy&ecirc;n&rdquo; m\\u1edbi c&oacute; \\u0111\\u01b0\\u1ee3c.<\\/p>\\r\\n\\r\\n<p>T\\u1ed5ng s\\u1ed1 ti\\u1ec1n \\u0111\\u1ea1i gia H&agrave; th&agrave;nh \\u0111&atilde; chi tr\\u1ea3 cho \\u0111&agrave;n c&aacute; Koi l&ecirc;n t\\u1edbi 10 t\\u1ef7 \\u0111\\u1ed3ng ch\\u1ec9 ri&ecirc;ng ti\\u1ec1n c&aacute;. Trong \\u0111&oacute; \\u0111\\u1eb7c bi\\u1ec7t c&oacute; m\\u1ed9t s\\u1ed1 con s\\u1edf h\\u1eefu ngo\\u1ea1i h&igrave;nh \\u0111\\u1eb9p, hi\\u1ebfm g\\u1eb7p, k&iacute;ch th\\u01b0\\u1edbc l\\u1edbn k\\u1ebft h\\u1ee3p v\\u1edbi d&ograve;ng gene di truy\\u1ec1n t\\u1ed1t&hellip; t\\u1eebng \\u0111\\u01b0\\u1ee3c nhi\\u1ec1u d&acirc;n ch\\u01a1i c&aacute; c\\u1ea3nh h\\u1ecfi mua v\\u1edbi gi&aacute; cao nh\\u01b0ng anh Ch\\u01b0\\u01a1ng nh\\u1ea5t quy\\u1ebft kh&ocirc;ng b&aacute;n.<\\/p>\\r\\n\\r\\n<p><img alt=\\\"\\u0110\\u1ea1i gia H\\u00e0 th\\u00e0nh chi 10 t\\u1ec9 s\\u1edf h\\u1eefu \\u0111\\u00e0n c\\u00e1 Koi quy t\\u1ee5 to\\u00e0n \\u201csi\\u00eau ph\\u1ea9m\\u201d, c\\u00f3 con l\\u00ean t\\u1edbi 120 tri\\u1ec7u - 3\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/3-2020\\/images\\/2020-07-24\\/dai-gia-Ha-thanh-chi-10-ti-so-huu-dan-ca-Koi-quy-tu-toan-sieu-pham-co-con-len-toi-120-trieu-co-3-1595591282-427-width1536height2048.jpg\\\" style=\\\"width:660px\\\" \\/><\\/p>\\r\\n\\r\\n<p>B\\u1ec3 c&aacute; thi\\u1ebft k\\u1ebf \\u0111\\u01a1n gi\\u1ea3n, t\\u1eadn d\\u1ee5ng kh&ocirc;ng gian nh\\u1ecf \\u1edf ban c&ocirc;ng l&agrave;m th&agrave;nh n\\u01a1i \\u1edf c\\u1ee7a kho\\u1ea3ng 25 ch&uacute; c&aacute; Koi.<\\/p>\\r\\n\\r\\n<p>Kh&aacute;c v\\u1edbi ki\\u1ec3u ch\\u01a1i c&aacute; Koi th\\u01b0\\u1eddng g\\u1eb7p, anh Ch\\u01b0\\u01a1ng kh&ocirc;ng \\u0111\\u1ea7u t\\u01b0 thi\\u1ebft k\\u1ebf nhi\\u1ec1u chi ti\\u1ebft xung quanh b\\u1ec3. T\\u1ea1i b\\u1ec3 c&aacute; \\u1edf C\\u1eeda B\\u1eafc - H&agrave; N\\u1ed9i, t\\u1eadn d\\u1ee5ng kho\\u1ea3ng ban c&ocirc;ng nh\\u1ecf (kho\\u1ea3ng 6 m2) \\u1edf t\\u1ea7ng 6 c\\u1ee7a c\\u0103n nh&agrave;, anh thu&ecirc; \\u0111\\u01a1n v\\u1ecb thi c&ocirc;ng m\\u1ed9t h\\u1ed3 c&aacute; \\u0111\\u01a1n gi\\u1ea3n, xung quanh kh&ocirc;ng c&oacute; nhi\\u1ec1u ti\\u1ec3u c\\u1ea3nh, h&ograve;n non b\\u1ed9 nh\\u01b0 c&aacute;c h\\u1ed3 th\\u01b0\\u1eddng g\\u1eb7p m&agrave; ch\\u1ec9 c&oacute; m\\u1eb7t k&iacute;nh b&ecirc;n tr&ecirc;n h\\u1ed3 t\\u1ea1o c\\u1ea3m gi&aacute;c nh\\u01b0 c&aacute; \\u0111ang b\\u01a1i ngay d\\u01b0\\u1edbi ch&acirc;n m&igrave;nh.<\\/p>\\r\\n\\r\\n<p>&ldquo;B\\u1ea3n th&acirc;n con c&aacute; Koi \\u0111&atilde; nhi\\u1ec1u m&agrave;u s\\u1eafc v&agrave; v&ocirc; c&ugrave;ng thu h&uacute;t, t&ocirc;i mu\\u1ed1n xung quanh ph\\u1ea3i l&agrave; nh\\u1eefng th\\u1ee9 \\u0111\\u01a1n gi\\u1ea3n nh\\u1ea5t \\u0111\\u1ec3 t&ocirc;n l&ecirc;n v\\u1ebb \\u0111\\u1eb9p c\\u1ee7a c&aacute;. H\\u01a1n n\\u1eefa, do nh&agrave; cao t\\u1ea7ng m\\u1eb7t ph\\u1ed1 n&ecirc;n di\\u1ec7n t&iacute;ch kh&ocirc;ng gian tr\\u1ed1ng kh&ocirc;ng nhi\\u1ec1u, ch\\u1ec9 v&igrave; qu&aacute; \\u0111am m&ecirc; n&ecirc;n t&ocirc;i quy\\u1ebft \\u0111\\u1ecbnh t\\u1eadn d\\u1ee5ng m\\u1ed9t ph\\u1ea7n ban c&ocirc;ng nh\\u1ecf th&agrave;nh h\\u1ed3 c&aacute; Koi \\u0111\\u1eb7c bi\\u1ec7t c\\u1ee7a ri&ecirc;ng m&igrave;nh&rdquo; &ndash; Anh Ch\\u01b0\\u01a1ng chia s\\u1ebb.<\\/p>\\r\\n\\r\\n<p><img alt=\\\"\\u0110\\u1ea1i gia H\\u00e0 th\\u00e0nh chi 10 t\\u1ec9 s\\u1edf h\\u1eefu \\u0111\\u00e0n c\\u00e1 Koi quy t\\u1ee5 to\\u00e0n \\u201csi\\u00eau ph\\u1ea9m\\u201d, c\\u00f3 con l\\u00ean t\\u1edbi 120 tri\\u1ec7u - 4\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/3-2020\\/images\\/2020-07-24\\/dai-gia-Ha-thanh-chi-10-ti-so-huu-dan-ca-Koi-quy-tu-toan-sieu-pham-co-con-len-toi-120-trieu-co-4-1595591282-269-width750height499.jpg\\\" style=\\\"width:660px\\\" \\/><\\/p>\\r\\n\\r\\n<p>\\u1ede Nh\\u1eadt B\\u1ea3n, c&aacute; Koi \\u0111\\u01b0\\u1ee3c xem nh\\u01b0 qu\\u1ed1c ng\\u01b0, t\\u01b0\\u1ee3ng tr\\u01b0ng cho s\\u1ef1 th&acirc;n thi\\u1ec7n, may m\\u1eafn, t&agrave;i l\\u1ed9c v&agrave; tr\\u01b0\\u1eddng th\\u1ecd c\\u1ee7a gia \\u0111&igrave;nh. Ng\\u01b0\\u1eddi ch\\u01a1i c&aacute; Koi chuy&ecirc;n nghi\\u1ec7p ch&uacute; tr\\u1ecdng v&agrave; c\\u1ea5u tr&uacute;c h&igrave;nh th\\u1ec3, m&agrave;u s\\u1eafc c&agrave;ng \\u0111\\u1ed9c gi&aacute;, gi&aacute; tr\\u1ecb c&agrave;ng cao.<\\/p>\\r\\n\\r\\n<p><img alt=\\\"\\u0110\\u1ea1i gia H\\u00e0 th\\u00e0nh chi 10 t\\u1ec9 s\\u1edf h\\u1eefu \\u0111\\u00e0n c\\u00e1 Koi quy t\\u1ee5 to\\u00e0n \\u201csi\\u00eau ph\\u1ea9m\\u201d, c\\u00f3 con l\\u00ean t\\u1edbi 120 tri\\u1ec7u - 5\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/3-2020\\/images\\/2020-07-24\\/dai-gia-Ha-thanh-chi-10-ti-so-huu-dan-ca-Koi-quy-tu-toan-sieu-pham-co-con-len-toi-120-trieu-co-5-1595591282-42-width1536height2048.jpg\\\" style=\\\"width:660px\\\" \\/><\\/p>\\r\\n\\r\\n<p>B\\u1ec3 c&aacute; Koi tuy nh\\u1ecf nh\\u01b0ng gi&aacute; tr\\u1ecb l&ecirc;n t\\u1edbi h&agrave;ng t\\u1ef7 \\u0111\\u1ed3ng. Anh Ch\\u01b0\\u01a1ng coi \\u0111&acirc;y l&agrave; kh&ocirc;ng gian th\\u01b0 gi&atilde;n l&yacute; t\\u01b0\\u1edfng sau gi\\u1edd l&agrave;m vi\\u1ec7c c\\u0103ng th\\u1eb3ng.<\\/p>\\r\\n\\r\\n<p>C&aacute; Koi kh&ocirc;ng ch\\u1ec9 \\u0111\\u1eb9p m&agrave; c&ograve;n r\\u1ea5t th&ocirc;ng minh khi nh\\u1eadn bi\\u1ebft v&agrave; hi\\u1ec3u &yacute; ch\\u1ee7 nh&acirc;n. B&ecirc;n c\\u1ea1nh vi\\u1ec7c l&agrave; m\\u1ed9t th&uacute; vui &ldquo;cao c\\u1ea5p&rdquo; c\\u1ee7a gi\\u1edbi th\\u01b0\\u1ee3ng l\\u01b0u, anh Ch\\u01b0\\u01a1ng Tailor c\\u0169ng coi nh\\u1eefng ch&uacute; c&aacute; n&agrave;y nh\\u1eefng nh\\u1eefng ng\\u01b0\\u1eddi b\\u1ea1n c\\u1ee7a m&igrave;nh. M\\u1ed7i khi c&oacute; th\\u1eddi gian r\\u1ea3nh d\\u1ed7i, anh th\\u01b0\\u1eddng ra ban c&ocirc;ng ng\\u1ed3i u\\u1ed1ng tr&agrave;, cho c&aacute; \\u0103n v&agrave; ng\\u1eafm nh&igrave;n \\u0111&agrave;n c&aacute; b\\u01a1i l\\u01b0\\u1ee3n ngay d\\u01b0\\u1edbi ch&acirc;n m&igrave;nh.<\\/p>\\r\\n\\r\\n<p>Hi\\u1ec7n anh Ch\\u01b0\\u01a1ng v\\u1eabn \\u0111ang ti\\u1ebfp t\\u1ee5c t&igrave;m hi\\u1ec3u v&agrave; s\\u0103n l&ugrave;ng m\\u1ed9t s\\u1ed1 con c&aacute; Koi c&oacute; k&iacute;ch th\\u01b0\\u1edbc kh\\u1ee7ng h\\u01a1n thu\\u1ed9c h&agrave;ng hi\\u1ebfm tr&ecirc;n th\\u1ebf gi\\u1edbi \\u0111\\u1ec3 b\\u1ed5 sung v&agrave;o b\\u1ed9 s\\u01b0u t\\u1eadp c\\u1ee7a m&igrave;nh. N&oacute;i v\\u1ec1 vi\\u1ec7c m\\u1ea1nh tay chi ti\\u1ec1n cho nh\\u1eefng th&uacute; vui \\u0111\\u1eaft \\u0111\\u1ecf n&agrave;y, \\u0111\\u1ea1i gia H&agrave; th&agrave;nh cho bi\\u1ebft, anh kh&ocirc;ng c&oacute; gi\\u1edbi h\\u1ea1n c\\u1ed1 \\u0111\\u1ecbnh n&agrave;o cho nh\\u1eefng ni\\u1ec1m vui c\\u1ee7a m&igrave;nh. Anh s\\u1ebd mua v&agrave; ti\\u1ebfp t\\u1ee5c s\\u0103n l&ugrave;ng t\\u1edbi khi n&agrave;o anh kh&ocirc;ng th&iacute;ch n\\u1eefa.<\\/p>\\r\\n\\r\\n<p>Ngu\\u1ed3n: http:\\/\\/danviet.vn\\/dai-gia-ha-thanh-chi-10-ti-so-huu-dan-ca-koi-quy-tu-toan-sieu-pham-co-con-len-toi-120-trieu-5020202574593645.htm<\\/p>\",\"category\":[\"3\",null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/storage\\/app\\/public\\/images\\/blog\\/dai-gia-Ha-thanh-chi-10-ti-so-huu-dan-ca-Koi-quy-tu-toan-sieu-pham-co-con-len-toi-120-trieu-co-1-1595591282-230-width750height500.jpg\",\"_token\":\"BCmPGaanfrBOlBiqzioSlBbD3BsdHHoB4DZiWARg\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/posts?per_page=10\"}', '2021-06-12 04:32:48', '2021-06-12 04:32:48'),
(958, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-12 04:32:48', '2021-06-12 04:32:48');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(959, 1, 'admin/posts', 'POST', '::1', '{\"title\":\"M\\u1eb7c d\\u00f9 r\\u1ea5t t\\u1ed1t, nh\\u01b0ng nh\\u1eefng \\u201csi\\u00eau th\\u1ef1c ph\\u1ea9m\\u201d n\\u00e0y kh\\u00f4ng n\\u00ean \\u0103n qu\\u00e1 nhi\\u1ec1u trong m\\u00f9a d\\u1ecbch\",\"slug\":null,\"desc_short\":\"M\\u1eb7c d\\u00f9 t\\u1ed1t cho s\\u1ee9c kh\\u1ecfe nh\\u01b0ng nh\\u1eefng lo\\u1ea1i th\\u1ef1c ph\\u1ea9m kh\\u00f4ng \\u0111\\u01b0\\u1ee3c l\\u1ea1m d\\u1ee5ng trong m\\u00f9a d\\u1ecbch n\\u00e0y.\",\"body\":\"<p>Nh\\u1eefng lo\\u1ea1i th\\u1ef1c ph\\u1ea9m n&agrave;y \\u0111\\u1ec1u c\\u1ef1c k\\u1ef3 t\\u1ed1t cho s\\u1ee9c kh\\u1ecfe, ch\\u1ee9a nhi\\u1ec1u ch\\u1ea5t dinh d\\u01b0\\u1ee1ng nh\\u01b0ng &iacute;t calo. Tuy nhi&ecirc;n, \\u0111\\u1ed1i v\\u1edbi b\\u1ea5t k\\u1ef3 lo\\u1ea1i th\\u1ef1c ph\\u1ea9m n&agrave;o \\u0111i ch\\u0103ng n\\u1eefa, m\\u1ecdi th\\u1ee9 v\\u1eabn n&ecirc;n \\u0111\\u01b0\\u1ee3c ti&ecirc;u th\\u1ee5 m\\u1ed9t c&aacute;ch ch\\u1eebng m\\u1ef1c, n\\u1ebfu kh&ocirc;ng n&oacute; c\\u0169ng c&oacute; th\\u1ec3 g&acirc;y nguy hi\\u1ec3m nh\\u01b0 \\u0111\\u1ed3 \\u0103n v\\u1eb7t kh&ocirc;ng l&agrave;nh m\\u1ea1nh.<\\/p>\\r\\n\\r\\n<p><strong>1. B&ocirc;ng c\\u1ea3i xanh c&oacute; th\\u1ec3 g&acirc;y k&iacute;ch \\u1ee9ng ru\\u1ed9t<\\/strong><\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p><img alt=\\\"M\\u1eb7c d\\u00f9 r\\u1ea5t t\\u1ed1t, nh\\u01b0ng nh\\u1eefng \\u201csi\\u00eau th\\u1ef1c ph\\u1ea9m\\u201d n\\u00e0y kh\\u00f4ng n\\u00ean \\u0103n qu\\u00e1 nhi\\u1ec1u trong m\\u00f9a d\\u1ecbch - 1\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-05-25\\/Mac-du-rat-tot-nhung-nhung-sieu-thuc-pham-nay-khong-nen-an-qua-nhieu-trong-mua-dich-1-1621908015-160-width728height563.jpg\\\" style=\\\"width:660px\\\" \\/><\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>B&ocirc;ng c\\u1ea3i xanh r\\u1ea5t gi&agrave;u ch\\u1ea5t x\\u01a1, protein, vitamin C, kali v&agrave; c&aacute;c vitamin v&agrave; kho&aacute;ng ch\\u1ea5t kh&aacute;c.&nbsp;Tuy nhi&ecirc;n, c&aacute;c nghi&ecirc;n c\\u1ee9u \\u0111&atilde; ph&aacute;t hi\\u1ec7n ra r\\u1eb1ng, ti&ecirc;u th\\u1ee5 qu&aacute; nhi\\u1ec1u b&ocirc;ng c\\u1ea3i xanh v&agrave; c&aacute;c lo\\u1ea1i rau h\\u1ecd c\\u1ea3i kh&aacute;c c&oacute; th\\u1ec3 g&acirc;y k&iacute;ch \\u1ee9ng ru\\u1ed9t ho\\u1eb7c khi\\u1ebfn b\\u1ea1n \\u0111\\u1ea7y h\\u01a1i. \\u0110\\u1eb7c bi\\u1ec7t, n&oacute; s\\u1ebd g&acirc;y nguy hi\\u1ec3m cho nh\\u1eefng ng\\u01b0\\u1eddi \\u0111ang d&ugrave;ng thu\\u1ed1c tr\\u1ee3 tim, l&agrave;m lo&atilde;ng m&aacute;u do h&agrave;m l\\u01b0\\u1ee3ng vitamin K cao.<\\/p>\\r\\n\\r\\n<p><strong>2. C&aacute; h\\u1ed3i c&oacute; th\\u1ec3 l&agrave;m lo&atilde;ng m&aacute;u<\\/strong><\\/p>\\r\\n\\r\\n<p>C&aacute; h\\u1ed3i l&agrave; m\\u1ed9t ngu\\u1ed3n cung c\\u1ea5p protein v&agrave; axit b&eacute;o omega-3 r\\u1ea5t t\\u1ed1t \\u0111\\u1ec3 gi\\u1ea3m vi&ecirc;m. M\\u1eb7c d&ugrave; c&aacute; h\\u1ed3i l&agrave; l\\u1ef1a ch\\u1ecdn h&agrave;ng \\u0111\\u1ea7u c\\u1ee7a nhi\\u1ec1u ng\\u01b0\\u1eddi quan t&acirc;m \\u0111\\u1ebfn s\\u1ee9c kh\\u1ecfe, nh\\u01b0ng vi\\u1ec7c ti&ecirc;u th\\u1ee5 qu&aacute; nhi\\u1ec1u omega-3 c&oacute; th\\u1ec3 g&acirc;y t&aacute;c \\u0111\\u1ed9ng&nbsp;ti&ecirc;u c\\u1ef1c \\u0111\\u1ebfn s\\u1ed1 l\\u01b0\\u1ee3ng ti\\u1ec3u c\\u1ea7u, th\\u1eadm ch&iacute; l&agrave;m lo&atilde;ng m&aacute;u. Ngo&agrave;i ra, c&aacute;c nghi&ecirc;n c\\u1ee9u c\\u0169ng \\u0111&atilde; ph&aacute;t hi\\u1ec7n ra r\\u1eb1ng, \\u0103n qu&aacute; nhi\\u1ec1u c&aacute;, bao g\\u1ed3m c\\u1ea3 c&aacute; h\\u1ed3i, c&oacute; th\\u1ec3 l&agrave;m t\\u0103ng n\\u1ed3ng \\u0111\\u1ed9 th\\u1ee7y ng&acirc;n trong m&aacute;u.<\\/p>\\r\\n\\r\\n<p><img alt=\\\"M\\u1eb7c d\\u00f9 r\\u1ea5t t\\u1ed1t, nh\\u01b0ng nh\\u1eefng \\u201csi\\u00eau th\\u1ef1c ph\\u1ea9m\\u201d n\\u00e0y kh\\u00f4ng n\\u00ean \\u0103n qu\\u00e1 nhi\\u1ec1u trong m\\u00f9a d\\u1ecbch - 3\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-05-25\\/Mac-du-rat-tot-nhung-nhung-sieu-thuc-pham-nay-khong-nen-an-qua-nhieu-trong-mua-dich-2-1621908026-239-width728height545.jpg\\\" style=\\\"width:660px\\\" \\/><\\/p>\\r\\n\\r\\n<p>Tr&aacute;i ng\\u01b0\\u1ee3c v\\u1edbi c&aacute; h\\u1ed3i hoang d&atilde;, c&aacute; h\\u1ed3i nu&ocirc;i \\u0111\\u01b0\\u1ee3c ph&aacute;t hi\\u1ec7n c&oacute;&nbsp;l\\u01b0\\u1ee3ng ch\\u1ea5t b&eacute;o v&agrave; calo cao&nbsp;g\\u1ea5p \\u0111&ocirc;i. Nghi&ecirc;n c\\u1ee9u g\\u1ea7n \\u0111&acirc;y c\\u0169ng ph&aacute;t hi\\u1ec7n ra r\\u1eb1ng, c&aacute; h\\u1ed3i nu&ocirc;i c&oacute; th\\u1ec3 c&oacute; m\\u1ed1i li&ecirc;n h\\u1ec7 v\\u1edbi b\\u1ec7nh b&eacute;o ph&igrave; v&agrave; ch\\u1ea5t &ocirc; nhi\\u1ec5m \\u0111\\u01b0\\u1ee3c t&igrave;m th\\u1ea5y trong n\\u01b0\\u1edbc nu&ocirc;i c&aacute; h\\u1ed3i.<\\/p>\\r\\n\\r\\n<p><strong>3. Qu\\u1ebf c&oacute; th\\u1ec3 g&acirc;y nhi\\u1ec5m \\u0111\\u1ed9c cho c\\u01a1 th\\u1ec3<\\/strong><\\/p>\\r\\n\\r\\n<p>Qu\\u1ebf \\u0111\\u01b0\\u1ee3c coi l&agrave;&nbsp;m\\u1ed9t si&ecirc;u th\\u1ef1c ph\\u1ea9m do h&agrave;m l\\u01b0\\u1ee3ng ch\\u1ea5t ch\\u1ed1ng oxy h&oacute;a cao v&agrave; nhi\\u1ec1u d\\u01b0\\u1ee3c t&iacute;nh.&nbsp;N&oacute; c&oacute; kh\\u1ea3 n\\u0103ng&nbsp;l&agrave;m gi\\u1ea3m&nbsp;l\\u01b0\\u1ee3ng \\u0111\\u01b0\\u1eddng trong m&aacute;u, gi\\u1ea3m vi&ecirc;m v&agrave; ng\\u0103n ng\\u1eeba b\\u1ec7nh tim.<\\/p>\\r\\n\\r\\n<p><img alt=\\\"M\\u1eb7c d\\u00f9 r\\u1ea5t t\\u1ed1t, nh\\u01b0ng nh\\u1eefng \\u201csi\\u00eau th\\u1ef1c ph\\u1ea9m\\u201d n\\u00e0y kh\\u00f4ng n\\u00ean \\u0103n qu\\u00e1 nhi\\u1ec1u trong m\\u00f9a d\\u1ecbch - 4\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-05-25\\/Mac-du-rat-tot-nhung-nhung-sieu-thuc-pham-nay-khong-nen-an-qua-nhieu-trong-mua-dich-3-1621908041-479-width728height536.jpg\\\" style=\\\"width:660px\\\" \\/><\\/p>\\r\\n\\r\\n<p>M\\u1eb7c d&ugrave; qu\\u1ebf c&oacute; nhi\\u1ec1u l\\u1ee3i &iacute;ch, nh\\u01b0ng h&agrave;m l\\u01b0\\u1ee3ng ch\\u1ec9 n&ecirc;n gi\\u1edbi h\\u1ea1n 1 th&igrave;a c&agrave; ph&ecirc; m\\u1ed7i ng&agrave;y \\u0111\\u1ed1i v\\u1edbi ng\\u01b0\\u1eddi l\\u1edbn. M\\u1ed9t s\\u1ed1 nghi&ecirc;n c\\u1ee9u cho th\\u1ea5y, ti&ecirc;u th\\u1ee5 qu&aacute; nhi\\u1ec1u qu\\u1ebf c&oacute; th\\u1ec3 g&acirc;y \\u0111\\u1ed9c do ch\\u1ee9a coumarin.&nbsp;Coumarin \\u0111\\u1eb7c bi\\u1ec7t nguy hi\\u1ec3m \\u0111\\u1ed1i v\\u1edbi nh\\u1eefng ng\\u01b0\\u1eddi c&oacute; v\\u1ea5n d\\u1ec1 v\\u1ec1 gan, c&oacute; th\\u1ec3 g&acirc;y t\\u1ed5n th\\u01b0\\u01a1ng gan. T&ugrave;y theo t\\u1eebng lo\\u1ea1i qu\\u1ebf s\\u1ebd c&oacute; m\\u1ee9c coumarin kh&aacute;c nhau.<\\/p>\\r\\n\\r\\n<p><strong>4. Qu\\u1ea3 b\\u01a1 c&oacute; th\\u1ec3 g&acirc;y t&iacute;ch t\\u1ee5 ch\\u1ea5t b&eacute;o<\\/strong><\\/p>\\r\\n\\r\\n<p>B\\u01a1 l&agrave; m\\u1ed9t si&ecirc;u th\\u1ef1c ph\\u1ea9m trong nh\\u1eefng n\\u0103m g\\u1ea7n \\u0111&acirc;y, \\u0111\\u01b0\\u1ee3c r\\u1ea5t nhi\\u1ec1u ng\\u01b0\\u1eddi y&ecirc;u th&iacute;ch. M\\u1ed9t kh\\u1ea9u ph\\u1ea7n b\\u01a1 chi\\u1ebfm 1\\/4 nhu c\\u1ea7u vitamin K c\\u1ee7a ng\\u01b0\\u1eddi tr\\u01b0\\u1edfng th&agrave;nh, 1\\/5 nhu c\\u1ea7u folate v&agrave; 1\\/10 nhu c\\u1ea7u vitamin E h\\u1eb1ng ng&agrave;y.&nbsp;B\\u01a1 c\\u0169ng r\\u1ea5t gi&agrave;u omega-3 v&agrave; ch\\u1ea5t x\\u01a1, nh\\u01b0ng \\u0103n qu&aacute; nhi\\u1ec1u b\\u01a1 c\\u0169ng c&oacute; th\\u1ec3 d\\u1eabn&nbsp;\\u0111\\u1ebfn vi&ecirc;m, \\u0111\\u1ea7y h\\u01a1i v&agrave; kh&oacute; ch\\u1ecbu \\u1edf d\\u1ea1 d&agrave;y.<\\/p>\\r\\n\\r\\n<p><img alt=\\\"M\\u1eb7c d\\u00f9 r\\u1ea5t t\\u1ed1t, nh\\u01b0ng nh\\u1eefng \\u201csi\\u00eau th\\u1ef1c ph\\u1ea9m\\u201d n\\u00e0y kh\\u00f4ng n\\u00ean \\u0103n qu\\u00e1 nhi\\u1ec1u trong m\\u00f9a d\\u1ecbch - 5\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-05-25\\/Mac-du-rat-tot-nhung-nhung-sieu-thuc-pham-nay-khong-nen-an-qua-nhieu-trong-mua-dich-4-1621908056-363-width728height545.jpg\\\" style=\\\"width:660px\\\" \\/><\\/p>\\r\\n\\r\\n<p>B\\u01a1 c&oacute; h&agrave;m l\\u01b0\\u1ee3ng calo cao, \\u0103n qu&aacute; nhi\\u1ec1u c&oacute; th\\u1ec3 g&acirc;y t&iacute;ch t\\u1ee5 ch\\u1ea5t b&eacute;o trong c\\u01a1 th\\u1ec3. C&aacute;c chuy&ecirc;n gia khuy&ecirc;n ch\\u1ec9 n&ecirc;n \\u0103n 50g, ho\\u1eb7c 1\\/3 qu\\u1ea3 b\\u01a1 m\\u1ed7i ng&agrave;y.<\\/p>\\r\\n\\r\\n<p><strong>5. Hummus c&oacute; th\\u1ec3 d\\u1eabn \\u0111\\u1ebfn b&eacute;o ph&igrave;<\\/strong><\\/p>\\r\\n\\r\\n<p>Hummus l&agrave; m&oacute;n \\u0103n c&oacute; ngu\\u1ed3n g\\u1ed1c t\\u1eeb Trung \\u0110&ocirc;ng, \\u0111\\u01b0\\u1ee3c l&agrave;m t\\u1eeb \\u0111\\u1eadu g&agrave;, b\\u1ed9t v\\u1eebng, chanh, t\\u1ecfi v&agrave; d\\u1ea7u &ocirc; liu.&nbsp;T\\u1ea5t c\\u1ea3 c&aacute;c th&agrave;nh ph\\u1ea7n ch\\u1ee9a nhi\\u1ec1u l\\u1ee3i &iacute;ch s\\u1ee9c kh\\u1ecfe,&nbsp;nh\\u01b0ng khi k\\u1ebft h\\u1ee3p v\\u1edbi nhau, ch&uacute;ng t\\u1ea1o ra&nbsp;m\\u1ed9t si&ecirc;u th\\u1ef1c ph\\u1ea9m gi&agrave;u dinh d\\u01b0\\u1ee1ng v&agrave; ch\\u1ee9a nhi\\u1ec1u protein. Hummus m&oacute;n khai v\\u1ecb ph&ugrave; h\\u1ee3p cho ng\\u01b0\\u1eddi \\u0103n chay v&agrave; nh\\u1eefng ng\\u01b0\\u1eddi b\\u1ecb d\\u1ecb \\u1ee9ng v\\u1edbi c&aacute;c lo\\u1ea1i h\\u1ea1t, gluten v&agrave; s\\u1eefa.<\\/p>\\r\\n\\r\\n<p><img alt=\\\"M\\u1eb7c d\\u00f9 r\\u1ea5t t\\u1ed1t, nh\\u01b0ng nh\\u1eefng \\u201csi\\u00eau th\\u1ef1c ph\\u1ea9m\\u201d n\\u00e0y kh\\u00f4ng n\\u00ean \\u0103n qu\\u00e1 nhi\\u1ec1u trong m\\u00f9a d\\u1ecbch - 6\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-05-25\\/Mac-du-rat-tot-nhung-nhung-sieu-thuc-pham-nay-khong-nen-an-qua-nhieu-trong-mua-dich-5-1621908072-24-width728height561.jpg\\\" style=\\\"width:660px\\\" \\/><\\/p>\\r\\n\\r\\n<p>\\u0110i\\u1ec1u quan tr\\u1ecdng c\\u1ea7n l\\u01b0u &yacute; l&agrave; nh\\u1eefng l\\u1ee3i &iacute;ch c\\u1ee7a hummus \\u0111\\u01b0\\u1ee3c t&igrave;m th\\u1ea5y \\u0111\\u1eb7c bi\\u1ec7t trong phi&ecirc;n b\\u1ea3n t\\u1ef1 l&agrave;m.&nbsp;H\\u1ea7u h\\u1ebft hummus mua \\u1edf c\\u1eeda h&agrave;ng kh&ocirc;ng t\\u1ed1t cho s\\u1ee9c kh\\u1ecfe v&agrave; th\\u1eadm ch&iacute; c&oacute; th\\u1ec3&nbsp;ch\\u1ee9a c&aacute;c th&agrave;nh ph\\u1ea7n \\u0111\\u1ed9c h\\u1ea1i, ch\\u1eb3ng h\\u1ea1n nh\\u01b0 l\\u01b0\\u1ee3ng natri cao v&agrave; ch\\u1ea5t b\\u1ea3o qu\\u1ea3n.&nbsp;Hummus \\u0111\\u01b0\\u1ee3c b&agrave;y b&aacute;n tr&ecirc;n k\\u1ec7, gi\\u1ed1ng nh\\u01b0 c&aacute;c lo\\u1ea1i th\\u1ef1c ph\\u1ea9m ch\\u1ebf bi\\u1ebfn s\\u1eb5n kh&aacute;c, c&oacute; th\\u1ec3 g&acirc;y&nbsp;b&eacute;o ph&igrave; v&agrave; nhi\\u1ec1u b\\u1ec7nh kh&aacute;c nhau.<\\/p>\\r\\n\\r\\n<p><strong>6. Kombucha c&oacute; th\\u1ec3 l&agrave;m t\\u0103ng n\\u1ed3ng \\u0111\\u1ed9 axit<\\/strong><\\/p>\\r\\n\\r\\n<p>Kombucha l&agrave; m\\u1ed9t lo\\u1ea1i tr&agrave; ng\\u1ecdt l&ecirc;n men ch\\u1ee9a nhi\\u1ec1u&nbsp;ch\\u1ea5t ch\\u1ed1ng oxy h&oacute;a v&agrave; men vi sinh.&nbsp;Th\\u1ee9c u\\u1ed1ng n&agrave;y \\u0111&atilde; tr\\u1edf&nbsp;n&ecirc;n ph\\u1ed5 bi\\u1ebfn trong&nbsp;gia \\u0111&igrave;nh&nbsp;v&agrave;o nh\\u1eefng n\\u0103m 90 nh\\u01b0ng c&oacute; th\\u1ec3 b\\u1eaft ngu\\u1ed3n t\\u1eeb n\\u0103m 220 tr\\u01b0\\u1edbc C&ocirc;ng nguy&ecirc;n \\u1edf Trung Qu\\u1ed1c. Kombucha \\u0111\\u01b0\\u1ee3c coi l&agrave; m\\u1ed9t &ldquo;superfood&rdquo; v&agrave; l&agrave; th\\u1ee9c u\\u1ed1ng detox \\u0111\\u01b0\\u1ee3c nhi\\u1ec1u ng\\u01b0\\u1eddi y&ecirc;u th&iacute;ch.<\\/p>\\r\\n\\r\\n<p><img alt=\\\"M\\u1eb7c d\\u00f9 r\\u1ea5t t\\u1ed1t, nh\\u01b0ng nh\\u1eefng \\u201csi\\u00eau th\\u1ef1c ph\\u1ea9m\\u201d n\\u00e0y kh\\u00f4ng n\\u00ean \\u0103n qu\\u00e1 nhi\\u1ec1u trong m\\u00f9a d\\u1ecbch - 7\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-05-25\\/Mac-du-rat-tot-nhung-nhung-sieu-thuc-pham-nay-khong-nen-an-qua-nhieu-trong-mua-dich-6-1621908088-539-width728height540.jpg\\\" style=\\\"width:660px\\\" \\/><\\/p>\\r\\n\\r\\n<p>Tuy nhi&ecirc;n, Kombucha kh&ocirc;ng c&oacute; l\\u1ee3i cho nh\\u1eefng ng\\u01b0\\u1eddi c&oacute; h\\u1ec7 mi\\u1ec5n d\\u1ecbch k&eacute;m do th\\u1ef1c t\\u1ebf n&oacute; ch\\u1ee9a c&aacute;c lo\\u1ea1i vi khu\\u1ea9n v&agrave; n\\u1ea5m men kh&aacute;c nhau trong tr\\u1ea1ng th&aacute;i s\\u1ed1ng v&agrave; ch\\u01b0a \\u0111\\u01b0\\u1ee3c kh\\u1eed tr&ugrave;ng.<\\/p>\\r\\n\\r\\n<p>Ngo&agrave;i ra, qu&aacute; nhi\\u1ec1u kombucha c&oacute; th\\u1ec3 g&acirc;y kh&oacute; ch\\u1ecbu&nbsp;d\\u1ea1 d&agrave;y ho\\u1eb7c \\u1ee3 chua.&nbsp;N&oacute; c\\u0169ng c&oacute; h&agrave;m l\\u01b0\\u1ee3ng \\u0111\\u01b0\\u1eddng cao, n&ecirc;n h\\u1ea1n ch\\u1ebf \\u0111\\u1ec3 ph&ograve;ng tr&aacute;nh \\u0111\\u01b0\\u1eddng huy\\u1ebft t\\u0103ng.<\\/p>\\r\\n\\r\\n<p><strong>7. C&aacute; ng\\u1eeb c&oacute; th\\u1ec3 \\u1ea3nh h\\u01b0\\u1edfng \\u0111\\u1ebfn k\\u1ef9 n\\u0103ng v\\u1eadn \\u0111\\u1ed9ng<\\/strong><\\/p>\\r\\n\\r\\n<p>C&aacute; ng\\u1eeb l&agrave; m\\u1ed9t lo\\u1ea1i protein r\\u1ea5t&nbsp;gi&agrave;u&nbsp;omega 3 v&agrave; vitamin B12.&nbsp;C&aacute;c nghi&ecirc;n c\\u1ee9u \\u0111&atilde; ch\\u1ec9 ra r\\u1eb1ng, \\u0103n c&aacute; ng\\u1eeb r\\u1ea5t t\\u1ed1t cho tim m\\u1ea1ch, t\\u0103ng c\\u01b0\\u1eddng s\\u1ee9c kh\\u1ecfe c\\u1ee7a m\\u1eaft, h\\u1ec7 th\\u1ed1ng mi\\u1ec5n d\\u1ecbch v&agrave; gi\\u1ea3m huy\\u1ebft &aacute;p.&nbsp;<\\/p>\\r\\n\\r\\n<p><img alt=\\\"M\\u1eb7c d\\u00f9 r\\u1ea5t t\\u1ed1t, nh\\u01b0ng nh\\u1eefng \\u201csi\\u00eau th\\u1ef1c ph\\u1ea9m\\u201d n\\u00e0y kh\\u00f4ng n\\u00ean \\u0103n qu\\u00e1 nhi\\u1ec1u trong m\\u00f9a d\\u1ecbch - 8\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-05-25\\/Mac-du-rat-tot-nhung-nhung-sieu-thuc-pham-nay-khong-nen-an-qua-nhieu-trong-mua-dich-7-1621908098-53-width728height576.jpg\\\" style=\\\"width:660px\\\" \\/><\\/p>\\r\\n\\r\\n<p>T\\u01b0\\u01a1ng t\\u1ef1 nh\\u01b0 c&aacute; h\\u1ed3i v&agrave; c&aacute;c lo\\u1ea1i c&aacute; kh&aacute;c, c&aacute; ng\\u1eeb c&oacute; ch\\u1ee9a th\\u1ee7y ng&acirc;n, khi\\u1ebfn n&oacute; tr\\u1edf th&agrave;nh m\\u1ed9t&nbsp;&nbsp;lo\\u1ea1i th\\u1ef1c ph\\u1ea9m nguy hi\\u1ec3m&nbsp;khi ti&ecirc;u th\\u1ee5 v\\u1edbi s\\u1ed1 l\\u01b0\\u1ee3ng l\\u1edbn v&agrave; th\\u01b0\\u1eddng xuy&ecirc;n.&nbsp;Ng\\u1ed9 \\u0111\\u1ed9c t\\u1eeb th\\u1ee7y ng&acirc;n&nbsp;bi\\u1ec3u hi\\u1ec7n gi\\u1ea3m tr&iacute; nh\\u1edb ho\\u1eb7c th\\u1ecb l\\u1ef1c, c\\u01a1 th\\u1ec3 hay b\\u1ecb run v&agrave; t&ecirc;.<\\/p>\\r\\n\\r\\n<p><strong>8. Tr&agrave; xanh c&oacute; th\\u1ec3 g&acirc;y \\u0111au nh\\u1ee9c<\\/strong><\\/p>\\r\\n\\r\\n<p>Tr&agrave; xanh \\u0111&atilde; \\u0111\\u01b0\\u1ee3c coi&nbsp;l&agrave; m\\u1ed9t trong nh\\u1eefng \\u0111\\u1ed3 u\\u1ed1ng l&agrave;nh m\\u1ea1nh nh\\u1ea5t tr&ecirc;n th\\u1ebf gi\\u1edbi do h&agrave;m l\\u01b0\\u1ee3ng ch\\u1ea5t ch\\u1ed1ng oxy h&oacute;a cao.&nbsp;C&aacute;c ch\\u1ea5t ch\\u1ed1ng oxy h&oacute;a trong tr&agrave; xanh \\u0111&atilde; \\u0111\\u01b0\\u1ee3c&nbsp;t&igrave;m th\\u1ea5y gi&uacute;p gi\\u1ea3m nguy c\\u01a1 ung th\\u01b0 v&agrave; b\\u1ec7nh tim, \\u0111\\u1ed1t ch&aacute;y ch\\u1ea5t b&eacute;o, c\\u1ea3i thi\\u1ec7n ch\\u1ee9c n\\u0103ng n&atilde;o.&nbsp;M\\u1eb7c d&ugrave; tr&agrave; xanh c&oacute; v&ocirc; s\\u1ed1 l\\u1ee3i &iacute;ch, nh\\u01b0ng n\\u1ebfu u\\u1ed1ng qu&aacute; nhi\\u1ec1u tr&agrave; xanh c&oacute; th\\u1ec3&nbsp;g&acirc;y ra c&aacute;c t&aacute;c d\\u1ee5ng ph\\u1ee5 ti&ecirc;u c\\u1ef1c, \\u0111\\u1eb7c bi\\u1ec7t l&agrave; do h&agrave;m l\\u01b0\\u1ee3ng caffeine cao.<\\/p>\\r\\n\\r\\n<p><img alt=\\\"M\\u1eb7c d\\u00f9 r\\u1ea5t t\\u1ed1t, nh\\u01b0ng nh\\u1eefng \\u201csi\\u00eau th\\u1ef1c ph\\u1ea9m\\u201d n\\u00e0y kh\\u00f4ng n\\u00ean \\u0103n qu\\u00e1 nhi\\u1ec1u trong m\\u00f9a d\\u1ecbch - 9\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-05-25\\/Mac-du-rat-tot-nhung-nhung-sieu-thuc-pham-nay-khong-nen-an-qua-nhieu-trong-mua-dich-8-1621908131-378-width728height534.jpg\\\" style=\\\"width:660px\\\" \\/><\\/p>\\r\\n\\r\\n<p>\\u1ea2nh h\\u01b0\\u1edfng c\\u1ee7a vi\\u1ec7c ti&ecirc;u th\\u1ee5 qu&aacute; nhi\\u1ec1u caffeine bao g\\u1ed3m&nbsp;m\\u1ea5t ng\\u1ee7, \\u0111au \\u0111\\u1ea7u, \\u0111&aacute;nh tr\\u1ed1ng ng\\u1ef1c v&agrave; \\u1ee3 chua.&nbsp;\\u0110\\u1ed1i v\\u1edbi nh\\u1eefng ng\\u01b0\\u1eddi c&oacute; kh\\u1ea3 n\\u0103ng dung n\\u1ea1p th\\u1ea5p v\\u1edbi c&aacute;c s\\u1ea3n ph\\u1ea9m c&oacute; ch\\u1ee9a caffein, tr&agrave; xanh c\\u0169ng c&oacute; th\\u1ec3 g&acirc;y ra t&igrave;nh tr\\u1ea1ng \\u1ee3&nbsp;chua v&agrave; kh&oacute; ti&ecirc;u.&nbsp;Theo c&aacute;c chuy&ecirc;n gia, 3 \\u0111\\u1ebfn 5 t&aacute;ch tr&agrave; xanh m\\u1ed7i ng&agrave;y l&agrave; th&iacute;ch h\\u1ee3p \\u0111\\u1ed1i v\\u1edbi ng\\u01b0\\u1eddi l\\u1edbn b&igrave;nh th\\u01b0\\u1eddng.<\\/p>\\r\\n\\r\\n<p>Ngu\\u1ed3n: http:\\/\\/danviet.vn\\/mac-du-rat-tot-nhung-nhung-sieu-thuc-pham-nay-khong-nen-an-qua-nhieu-trong-mua-dich-50202111610255810.htm<\\/p>\",\"category\":[\"3\",null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/storage\\/app\\/public\\/images\\/blog\\/Mac-du-rat-tot-nhung-nhung-sieu-thuc-pham-nay-khong-nen-an-qua-nhieu-trong-mua-dich-1-1621908015-160-width728height563.jpg\",\"_token\":\"BCmPGaanfrBOlBiqzioSlBbD3BsdHHoB4DZiWARg\",\"after-save\":\"2\"}', '2021-06-12 04:34:27', '2021-06-12 04:34:27'),
(960, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-12 04:34:27', '2021-06-12 04:34:27'),
(961, 1, 'admin/posts', 'POST', '::1', '{\"title\":\"Thi v\\u00e0o l\\u1edbp 10: H\\u00e0 N\\u1ed9i huy \\u0111\\u1ed9ng h\\u01a1n 500 thanh tra, ng\\u00e0y 11\\/6, th\\u00ed sinh l\\u00e0m th\\u1ee7 t\\u1ee5c d\\u1ef1 thi tr\\u1ef1c tuy\\u1ebfn\",\"slug\":null,\"desc_short\":\"L\\u1ef1c l\\u01b0\\u1ee3ng thanh tra l\\u00e0m nhi\\u1ec7m v\\u1ee5 c\\u1eafm ch\\u1ed1t t\\u1ea1i 184 \\u0111i\\u1ec3m thi v\\u00e0o l\\u1edbp 10 trung h\\u1ecdc ph\\u1ed5 th\\u00f4ng c\\u00f4ng l\\u1eadp n\\u0103m h\\u1ecdc 2021-2022 tr\\u00ean \\u0111\\u1ecba b\\u00e0n th\\u00e0nh ph\\u1ed1 H\\u00e0 N\\u1ed9i.\",\"body\":\"<p>\\u0110\\u1ec3 chu\\u1ea9n b\\u1ecb t\\u1ed5 ch\\u1ee9c k\\u1ef3 thi&nbsp;<a href=\\\"https:\\/\\/www.24h.com.vn\\/tuyen-sinh-dh-cd-c365.html\\\" title=\\\"tuy\\u1ec3n sinh\\\">tuy\\u1ec3n sinh<\\/a>&nbsp;v&agrave;o l\\u1edbp 10 trung h\\u1ecdc ph\\u1ed5 th&ocirc;ng c&ocirc;ng l\\u1eadp n\\u0103m h\\u1ecdc 2021-2022, S\\u1edf&nbsp;<a href=\\\"https:\\/\\/www.24h.com.vn\\/giao-duc-du-hoc-c216.html\\\" title=\\\"Gi\\u00e1o d\\u1ee5c\\\">Gi&aacute;o d\\u1ee5c<\\/a>&nbsp;v&agrave; \\u0110&agrave;o t\\u1ea1o H&agrave; N\\u1ed9i \\u0111&atilde; huy \\u0111\\u1ed9ng h\\u01a1n 500 thanh tra. L\\u1ef1c l\\u01b0\\u1ee3ng thanh tra l&agrave;m nhi\\u1ec7m v\\u1ee5 c\\u1eafm ch\\u1ed1t t\\u1ea1i 184 \\u0111i\\u1ec3m thi v&agrave;o l\\u1edbp 10 trung h\\u1ecdc ph\\u1ed5 th&ocirc;ng c&ocirc;ng l\\u1eadp n\\u0103m h\\u1ecdc 2021-2022 tr&ecirc;n \\u0111\\u1ecba b&agrave;n th&agrave;nh ph\\u1ed1 H&agrave; N\\u1ed9i.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p><img alt=\\\"Thi v\\u00e0o l\\u1edbp 10: H\\u00e0 N\\u1ed9i huy \\u0111\\u1ed9ng h\\u01a1n 500 thanh tra, ng\\u00e0y 11\\/6, th\\u00ed sinh l\\u00e0m th\\u1ee7 t\\u1ee5c d\\u1ef1 thi tr\\u1ef1c tuy\\u1ebfn - 1\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-06-08\\/Thi-vao-lop-10-Ha-Noi-huy-dong-hon-500-thanh-tra-ngay-11-6-thi-sinh-lam-thu-tuc-du-thi-truc-tuyen-thi-lop-10-hnm-1623109294-35-width1200height768.jpg\\\" style=\\\"width:660px\\\" \\/><\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>\\u1ea2nh: TTX.<\\/p>\\r\\n\\r\\n<p>Ngo&agrave;i ra, S\\u1edf Gi&aacute;o d\\u1ee5c v&agrave; \\u0110&agrave;o t\\u1ea1o H&agrave; N\\u1ed9i c&ograve;n th&agrave;nh l\\u1eadp 16 t\\u1ed5 gi&aacute;m s&aacute;t (m\\u1ed7i t\\u1ed5 c&oacute; 3 th&agrave;nh vi&ecirc;n), c&oacute; nhi\\u1ec7m v\\u1ee5 gi&aacute;m s&aacute;t ho\\u1ea1t \\u0111\\u1ed9ng c\\u1ee7a \\u0111o&agrave;n thanh tra t\\u1ea1i c&aacute;c \\u0111i\\u1ec3m thi.<\\/p>\\r\\n\\r\\n<p>Ngo&agrave;i c&aacute;c n\\u1ed9i dung v\\u1ec1 chuy&ecirc;n m&ocirc;n, c&ocirc;ng t&aacute;c thanh tra k\\u1ef3 thi n\\u0103m nay c&oacute; th&ecirc;m n\\u1ed9i dung v\\u1ec1 vi\\u1ec7c chu\\u1ea9n b\\u1ecb, th\\u1ef1c hi\\u1ec7n c&aacute;c quy \\u0111\\u1ecbnh ph&ograve;ng, ch\\u1ed1ng d\\u1ecbch COVID-19 c\\u1ee7a c&aacute;c th&agrave;nh vi&ecirc;n t\\u1ea1i c&aacute;c \\u0111i\\u1ec3m thi.<\\/p>\\r\\n\\r\\n<p>\\u0110\\u1ec3 b\\u1ea3o \\u0111\\u1ea3m an to&agrave;n cho th&iacute; sinh d\\u1ef1 thi, l\\u1ef1c l\\u01b0\\u1ee3ng thanh tra s\\u1ebd thanh tra vi\\u1ec7c b\\u1ed1 tr&iacute; khu v\\u1ef1c thi, ph&ograve;ng thi, ch\\u1ed7 ng\\u1ed3i c\\u1ee7a th&iacute; sinh nh\\u1eb1m b\\u1ea3o \\u0111\\u1ea3m an to&agrave;n ph&ograve;ng, ch\\u1ed1ng d\\u1ecbch COVID-19; c&ocirc;ng t&aacute;c v\\u1ec7 sinh an to&agrave;n th\\u1ef1c ph\\u1ea9m, y t\\u1ebf, \\u0111i\\u1ec7n, n\\u01b0\\u1edbc v&agrave; c&aacute;c ph\\u01b0\\u01a1ng &aacute;n x\\u1eed l&yacute; c&aacute;c t&igrave;nh hu\\u1ed1ng b\\u1ea5t th\\u01b0\\u1eddng t\\u1ea1i \\u0111i\\u1ec3m thi.<\\/p>\\r\\n\\r\\n<p>Vi\\u1ec7c th&agrave;nh l\\u1eadp l\\u1ef1c l\\u01b0\\u1ee3ng thanh tra k\\u1ef3 thi nh\\u1eb1m gi&uacute;p c\\u01a1 quan, t\\u1ed5 ch\\u1ee9c, c&aacute; nh&acirc;n tham gia k\\u1ef3 thi th\\u1ef1c hi\\u1ec7n \\u0111&uacute;ng quy ch\\u1ebf thi, c&aacute;c quy \\u0111\\u1ecbnh li&ecirc;n quan \\u0111\\u1ebfn vi\\u1ec7c t\\u1ed5 ch\\u1ee9c k\\u1ef3 thi v&agrave; c&aacute;c n\\u1ed9i dung ch\\u1ec9 \\u0111\\u1ea1o c\\u1ee7a B\\u1ed9 Gi&aacute;o d\\u1ee5c v&agrave; \\u0110&agrave;o t\\u1ea1o, UBND th&agrave;nh ph\\u1ed1 H&agrave; N\\u1ed9i, S\\u1edf Gi&aacute;o d\\u1ee5c v&agrave; \\u0110&agrave;o t\\u1ea1o H&agrave; N\\u1ed9i, g&oacute;p ph\\u1ea7n b\\u1ea3o \\u0111\\u1ea3m cho k\\u1ef3 thi di\\u1ec5n ra an to&agrave;n, nghi&ecirc;m t&uacute;c, \\u0111&uacute;ng quy \\u0111\\u1ecbnh.<\\/p>\\r\\n\\r\\n<p><strong>Th&iacute; sinh l&agrave;m th\\u1ee7 t\\u1ee5c d\\u1ef1 thi theo h&igrave;nh th\\u1ee9c tr\\u1ef1c tuy\\u1ebfn<\\/strong><\\/p>\\r\\n\\r\\n<p>M\\u1ed9t trong nh\\u1eefng n\\u1ed9i dung quan tr\\u1ecdng kh&aacute;c c\\u0169ng \\u0111\\u01b0\\u1ee3c UBND th&agrave;nh ph\\u1ed1 H&agrave; N\\u1ed9i quy\\u1ebft \\u0111\\u1ecbnh \\u0111i\\u1ec1u ch\\u1ec9nh l&agrave; t\\u1ed5 ch\\u1ee9c cho th&iacute; sinh l&agrave;m th\\u1ee7 t\\u1ee5c d\\u1ef1 thi theo h&igrave;nh th\\u1ee9c tr\\u1ef1c tuy\\u1ebfn.<\\/p>\\r\\n\\r\\n<p>C\\u1ee5 th\\u1ec3, theo th&ocirc;ng b&aacute;o c\\u1ee7a S\\u1edf Gi&aacute;o d\\u1ee5c v&agrave; \\u0110&agrave;o t\\u1ea1o H&agrave; N\\u1ed9i, ng&agrave;y 11\\/6\\/2021, th&iacute; sinh s\\u1ebd l&agrave;m th\\u1ee7 t\\u1ee5c d\\u1ef1 thi v&agrave;o l\\u1edbp 10 theo h&igrave;nh th\\u1ee9c tr\\u1ef1c tuy\\u1ebfn t\\u1ea1i c&aacute;c tr\\u01b0\\u1eddng trung h\\u1ecdc c\\u01a1 s\\u1edf, thay cho h&igrave;nh th\\u1ee9c tr\\u1ef1c ti\\u1ebfp nh\\u01b0 k\\u1ebf ho\\u1ea1ch \\u0111&atilde; c&ocirc;ng b\\u1ed1.<\\/p>\\r\\n\\r\\n<p>\\u0110\\u1ec3 b\\u1ea3o \\u0111\\u1ea3m an to&agrave;n ph&ograve;ng, ch\\u1ed1ng d\\u1ecbch, c&aacute;c ph&ograve;ng gi&aacute;o d\\u1ee5c v&agrave; \\u0111&agrave;o t\\u1ea1o qu\\u1eadn, huy\\u1ec7n, th\\u1ecb x&atilde; c&oacute; tr&aacute;ch nhi\\u1ec7m ch\\u1ec9 \\u0111\\u1ea1o c&aacute;c tr\\u01b0\\u1eddng trung h\\u1ecdc c\\u01a1 s\\u1edf thu\\u1ed9c ph\\u1ea1m vi qu\\u1ea3n l&yacute; l\\u1ef1a ch\\u1ecdn th\\u1eddi gian h\\u1ee3p l&yacute; trong ng&agrave;y \\u0111\\u1ec3 t\\u1ed5 ch\\u1ee9c cho h\\u1ecdc sinh l&agrave;m th\\u1ee7 t\\u1ee5c d\\u1ef1 thi theo h&igrave;nh th\\u1ee9c tr\\u1ef1c tuy\\u1ebfn.<\\/p>\\r\\n\\r\\n<p>S\\u1edf c\\u0169ng khuy\\u1ebfn kh&iacute;ch c&aacute;c nh&agrave; tr\\u01b0\\u1eddng t\\u1ea1o \\u0111i\\u1ec1u ki\\u1ec7n \\u0111\\u1ec3 ph\\u1ee5 huynh c&ugrave;ng tham gia \\u0111\\u1ec3 n\\u1eafm ch\\u1eafc c&aacute;c quy \\u0111\\u1ecbnh li&ecirc;n quan \\u0111\\u1ebfn k\\u1ef3 thi v&agrave; c&ugrave;ng th\\u1ef1c hi\\u1ec7n t\\u1ed1t, v\\u1edbi m\\u1ee5c ti&ecirc;u b\\u1ea3o \\u0111\\u1ea3m an to&agrave;n cao nh\\u1ea5t cho th&iacute; sinh tham d\\u1ef1 k\\u1ef3 thi.<\\/p>\\r\\n\\r\\n<p>\\u0110\\u1ec3 tr&aacute;nh x\\u1ea3y ra nh\\u1ea7m l\\u1eabn, S\\u1edf Gi&aacute;o d\\u1ee5c v&agrave; \\u0110&agrave;o t\\u1ea1o H&agrave; N\\u1ed9i y&ecirc;u c\\u1ea7u c&aacute;c ph&ograve;ng gi&aacute;o d\\u1ee5c v&agrave; \\u0111&agrave;o t\\u1ea1o qu\\u1eadn, huy\\u1ec7n, th\\u1ecb x&atilde; nh\\u1eafc nh\\u1edf c&aacute;c nh&agrave; tr\\u01b0\\u1eddng th&ocirc;ng tin c\\u1ee5 th\\u1ec3 cho t\\u1ea5t c\\u1ea3 th&iacute; sinh tham d\\u1ef1 k\\u1ef3 thi v\\u1ec1 quy \\u0111\\u1ecbnh m\\u1edbi n&agrave;y.<\\/p>\\r\\n\\r\\n<p>T\\u1ea1i bu\\u1ed5i l&agrave;m th\\u1ee7 t\\u1ee5c d\\u1ef1 thi, c&aacute;c th&iacute; sinh c\\u1ea7n nh\\u1edb r&agrave; so&aacute;t l\\u1ea1i m\\u1ed9t l\\u1ea7n n\\u1eefa c&aacute;c th&ocirc;ng tin trong phi\\u1ebfu \\u0111\\u0103ng k&yacute; d\\u1ef1 thi; nghe ph\\u1ed5 bi\\u1ebfn quy ch\\u1ebf thi, l\\u1ecbch thi \\u0111\\u1ec3 th\\u1ef1c hi\\u1ec7n nghi&ecirc;m t&uacute;c.<\\/p>\\r\\n\\r\\n<p>K\\u1ef3 thi tuy\\u1ec3n sinh v&agrave;o l\\u1edbp 10 t\\u1ea1i H&agrave; N\\u1ed9i di\\u1ec5n ra v&agrave;o ng&agrave;y 12 v&agrave; 13\\/6\\/2021, v\\u1edbi s\\u1ef1 tham gia c\\u1ee7a h\\u01a1n 93.000 th&iacute; sinh.<\\/p>\\r\\n\\r\\n<p>Ngu\\u1ed3n: http:\\/\\/danviet.vn\\/thi-vao-lop-10-ha-noi-huy-dong-hon-500-thanh-tra-ngay-11-6-thi-sinh-lam-thu-tuc-du-thi-truc-tuyen-50202186722952.htm<\\/p>\",\"category\":[\"3\",null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/storage\\/app\\/public\\/images\\/blog\\/Thi-vao-lop-10-Ha-Noi-huy-dong-hon-500-thanh-tra-ngay-11-6-thi-sinh-lam-thu-tuc-du-thi-truc-tuyen-thi-lop-10-hnm-1623109294-35-width1200height768.jpg\",\"_token\":\"BCmPGaanfrBOlBiqzioSlBbD3BsdHHoB4DZiWARg\",\"after-save\":\"2\"}', '2021-06-12 04:35:22', '2021-06-12 04:35:22'),
(962, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-12 04:35:23', '2021-06-12 04:35:23'),
(963, 1, 'admin/posts', 'POST', '::1', '{\"title\":\"Lo\\u00e0i c\\u00e1 Nh\\u1eadt B\\u1ea3n n\\u00e0y c\\u00f3 g\\u00ec \\u0111\\u1eb7c bi\\u1ec7t m\\u00e0 t\\u1eebng \\u0111\\u01b0\\u1ee3c \\u0111\\u1ea5u gi\\u00e1 t\\u1edbi 47 t\\u1ef7?\",\"slug\":null,\"desc_short\":\"Lo\\u00e0i c\\u00e1 n\\u00e0y c\\u00f2n \\u0111\\u01b0\\u1ee3c g\\u1ecdi l\\u00e0 m\\u1ed9t \\u201cT\\u00e1c ph\\u1ea9m ngh\\u1ec7 thu\\u1eadt trong gi\\u1edbi b\\u01a1i l\\u1ed9i\\u201d, n\\u00f3 \\u0111\\u01b0\\u1ee3c sinh ra t\\u1ea1i Nh\\u1eadt B\\u1ea3n v\\u00e0o kho\\u1ea3ng 200 n\\u0103m tr\\u01b0\\u1edbc v\\u00e0 \\u0111ang thu h\\u00fat kh\\u00f4ng ch\\u1ec9 ng\\u01b0\\u1eddi d\\u00e2n Nh\\u1eadt B\\u1ea3n m\\u00e0 c\\u00f2n tr\\u00ean kh\\u1eafp th\\u1ebf gi\\u1edbi.\",\"body\":\"<p><img alt=\\\"V\\u00ec sao c\\u00e1 Koi &amp;#34;Huy\\u1ec1n tho\\u1ea1i&amp;#34; gi\\u00e1 t\\u1edbi 42 t\\u1ef7 \\u0111\\u1ed3ng, \\u0111\\u1eaft nh\\u1ea5t l\\u1ecbch s\\u1eed? - 1\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/4-2018\\/images\\/2018-12-20\\/Vi-sao-ca-Koi-koi-1545299474-605-width480height721.jpg\\\" \\/><\\/p>\\r\\n\\r\\n<p>Con c&aacute; Koi 9 tu\\u1ed5i gi&aacute; 41,5 t\\u1ef7 \\u0111\\u1ed3ng<\\/p>\\r\\n\\r\\n<p>K\\u1ebft qu\\u1ea3 cu\\u1ed1i c&ugrave;ng, nh&agrave; s\\u01b0u t\\u1eadp Yingying \\u0111\\u1ebfn t\\u1eeb \\u0110&agrave;i Loan \\u0111&atilde; \\u0111\\u1ea5u gi&aacute; th&agrave;nh c&ocirc;ng v&agrave; mua \\u0111\\u01b0\\u1ee3c con c&aacute; hi\\u1ebfm t\\u1eeb nh&agrave; Kentaro Sakai v\\u1edbi gi&aacute; 203 tri\\u1ec7u Y&ecirc;n (t\\u01b0\\u01a1ng \\u0111\\u01b0\\u01a1ng kho\\u1ea3ng 42 t\\u1ef7 \\u0111\\u1ed3ng). \\u0110&acirc;y l&agrave; con c&aacute; Koi \\u0111\\u01b0\\u1ee3c b&aacute;n v\\u1edbi gi&aacute; cao nh\\u1ea5t trong l\\u1ecbch s\\u1eed.<\\/p>\\r\\n\\r\\n<p>Theo t\\u1edd Business insider, con c&aacute; Koi 9 tu\\u1ed5i c&oacute; t&ecirc;n S Legend, thu\\u1ed9c gi\\u1ed1ng Kohaku, chi\\u1ec1u d&agrave;i kho\\u1ea3ng 101 cm. S Legend ch&iacute;nh l&agrave; ch&uacute; c&aacute; gi&agrave;nh chi\\u1ebfn th\\u1eafng t\\u1ea1i gi\\u1ea3i \\u0111\\u1ea5u All Japan Koi Show 2017 v&agrave; \\u0111\\u01b0\\u1ee3c k\\u1ef3 v\\u1ecdng ti\\u1ebfp t\\u1ee5c gi\\u1eef v\\u1eefng v\\u1ecb tr&iacute; trong k\\u1ef3 thi ti\\u1ebfp theo.<\\/p>\\r\\n\\r\\n<p>Theo \\u0111&oacute;, gi\\u1ed1ng Kohaku l&agrave; m\\u1ed9t gi\\u1ed1ng c&aacute; Koi c&oacute; m&agrave;u tr\\u1eafng v\\u1edbi nh\\u1eefng m\\u1ea3ng m&agrave;u \\u0111\\u1ecf tr&ecirc;n th&acirc;n. \\u0110\\u1ec3 tr\\u1edf th&agrave;nh m\\u1ed9t con c&aacute; Koi gi\\u1ed1ng Kohaku ho&agrave;n h\\u1ea3o, m&agrave;u tr\\u1eafng ph\\u1ea3i nguy&ecirc;n s\\u01a1 m&agrave; kh&ocirc;ng c&oacute; b\\u1ea5t k\\u1ef3 s\\u1ef1 l\\u1ec7ch chuy\\u1ec3n sang m&agrave;u v&agrave;ng n&agrave;o.<\\/p>\\r\\n\\r\\n<p>C&aacute; ch&eacute;p Koi, b\\u1eaft \\u0111\\u1ea7u \\u0111\\u01b0\\u1ee3c nu&ocirc;i \\u1edf Nh\\u1eadt B\\u1ea3n v&agrave;o nh\\u1eefng n\\u0103m 1700 khi nh\\u1eefng ng\\u01b0\\u1eddi n&ocirc;ng d&acirc;n b\\u1eaft \\u0111\\u1ea7u nh&acirc;n gi\\u1ed1ng ch&uacute;ng v&igrave; m&agrave;u s\\u1eafc v&agrave; ki\\u1ec3u d&aacute;ng kh&aacute;c bi\\u1ec7t. C&aacute; Koi th\\u1ef1c s\\u1ef1 l&agrave; m\\u1ed9t lo\\u1ea1i c&aacute; ch&eacute;p v&agrave; ng&agrave;y nay ch&uacute;ng tr\\u1edf th&agrave;nh lo&agrave;i c&aacute; c\\u1ea3nh \\u0111\\u1eaft nh\\u1ea5t th\\u1ebf gi\\u1edbi.<\\/p>\\r\\n\\r\\n<p>Tr&ecirc;n th\\u1ebf gi\\u1edbi c&oacute; nhi\\u1ec1u cu\\u1ed9c thi th\\u01b0\\u1eddng xuy&ecirc;n di\\u1ec5n ra \\u0111\\u1ec3 \\u0111\\u1eb7t t&ecirc;n cho nh\\u1eefng con c&aacute; Koi h&agrave;ng \\u0111\\u1ea7u.<\\/p>\\r\\n\\r\\n<p>Th&ocirc;ng th\\u01b0\\u1eddng nh\\u1eefng ng\\u01b0\\u1eddi ki\\u1ec3m ch\\u1ee9ng v&agrave; c\\u1ea3 ng\\u01b0\\u1eddi mua c&aacute; Koi s\\u1ebd ch&uacute; &yacute; \\u0111\\u1ebfn nh\\u1eefng \\u0111\\u1eb7c \\u0111i\\u1ec3m c\\u1ee7a n&oacute; nh\\u01b0 l&agrave;n da kh\\u1ecfe m\\u1ea1nh nh\\u01b0 th\\u1ebf n&agrave;o, k&iacute;ch th\\u01b0\\u1edbc v&agrave; h&igrave;nh d&aacute;ng c\\u01a1 th\\u1ec3, c&aacute;ch di chuy\\u1ec3n trong n\\u01b0\\u1edbc duy&ecirc;n d&aacute;ng ra sao v&agrave; quan tr\\u1ecdng nh\\u1ea5t l&agrave; m&agrave;u s\\u1eafc. V&iacute; d\\u1ee5 nh\\u01b0 c&oacute; nh\\u1eefng con c&aacute; Koi c&oacute; \\u0111\\u1ed1m xanh nh\\u1ea1t kh&aacute;c l\\u1ea1, ho\\u1eb7c nh\\u1eefng con c&oacute; m\\u1ea3ng l\\u1edbn m&agrave;u \\u0111\\u1ecf tr&ecirc;n l\\u01b0ng ho\\u1eb7c to&agrave;n th&acirc;n v&agrave;ng kim.<\\/p>\\r\\n\\r\\n<p>Nh\\u1eefng con c&aacute; \\u0111\\u01b0\\u1ee3c \\u0111&aacute;nh gi&aacute; cao th\\u01b0\\u1eddng thu\\u1ed9c ba lo\\u1ea1i tr&ecirc;n. C&aacute; Koi c&oacute; s\\u1ef1 c&acirc;n b\\u1eb1ng t\\u1ed1t v\\u1ec1 m&agrave;u s\\u1eafc, hoa v\\u0103n th&igrave; gi&aacute; c&agrave;ng cao.<\\/p>\\r\\n\\r\\n<p>Yvo de Wal, ng\\u01b0\\u1eddi b&aacute;n c&aacute; Koi \\u1edf H&agrave; Lan v&agrave; s\\u1edf h\\u1eefu k&ecirc;nh Youtube n\\u1ed5i ti\\u1ebfng v\\u1ec1 c&aacute; Koi. M\\u1ed7i n\\u0103m anh \\u0111\\u1ebfn Nh\\u1eadt B\\u1ea3n \\u0111\\u1ec3 t\\u1eadn tay l\\u1ef1a ch\\u1ecdn nh\\u1eefng con c&aacute; \\u0111\\u1eb9p nh\\u1ea5t.<\\/p>\\r\\n\\r\\n<p>C&aacute; Koi c&oacute; 6 lo\\u1ea1i t\\u1ebf b&agrave;o s\\u1eafc t\\u1ed1 m&agrave;u tr&ecirc;n da. \\u0110&oacute; l&agrave; t\\u1ebf b&agrave;o quy \\u0111\\u1ecbnh m&agrave;u \\u0111\\u1ecf, tr\\u1eafng, \\u0111en, v&agrave;ng, xanh da tr\\u1eddi v&agrave; &aacute;nh kim. \\u0110\\u1ec3 tr\\u1edf th&agrave;nh con c&aacute; Koi \\u0111\\u1eb9p, m&agrave;u s\\u1eafc pha tr\\u1ed9n l&agrave;m sao \\u0111\\u1ee7 \\u0111\\u1ec3 tr\\u1edf th&agrave;nh m&agrave;u cam \\u0111\\u1ecf, ph\\u1ea7n th&acirc;n tr\\u1eafng v&agrave; nhi\\u1ec1u m\\u1ea3ng \\u0111\\u1ecf l\\u1edbn tr&ecirc;n th&acirc;n.<\\/p>\\r\\n\\r\\n<p>Trong v\\u0103n h&oacute;a truy\\u1ec1n th\\u1ed1ng Nh\\u1eadt B\\u1ea3n, m&agrave;u \\u0111\\u1ecf v&agrave; tr\\u1eafng l&agrave; hai m&agrave;u ch\\u1ee7 \\u0111\\u1ea1o, t\\u01b0\\u1ee3ng tr\\u01b0ng cho ni\\u1ec1m vui v&agrave; s\\u1ef1 tinh khi\\u1ebft.<\\/p>\\r\\n\\r\\n<p><a href=\\\"https:\\/\\/img.infonet.vn\\/w800\\/Uploaded\\/2018\\/rydrkxrxqk\\/2018_12_20\\/newworldrecord203millionyen101cmsakaikohakuslegend1e1538754988622.jpg\\\" rel=\\\"nofollow\\\"><img alt=\\\"V\\u00ec sao c\\u00e1 Koi &amp;#34;Huy\\u1ec1n tho\\u1ea1i&amp;#34; gi\\u00e1 t\\u1edbi 42 t\\u1ef7 \\u0111\\u1ed3ng, \\u0111\\u1eaft nh\\u1ea5t l\\u1ecbch s\\u1eed? - 2\\\" src=\\\"https:\\/\\/img.infonet.vn\\/w480\\/Uploaded\\/2018\\/rydrkxrxqk\\/2018_12_20\\/newworldrecord203millionyen101cmsakaikohakuslegend1e1538754988622.jpg\\\" style=\\\"height:448px; width:640px\\\" \\/><\\/a><\\/p>\\r\\n\\r\\n<p>T\\u1ebf b&agrave;o m&agrave;u s\\u1eafc n\\u1eb1m \\u1edf v\\u1ecb tr&iacute; kh&aacute;c nhau tr&ecirc;n da c\\u1ee7a c&aacute; Koi. M\\u1ed9t s\\u1ed1 m&agrave;u n\\u1eb1m \\u1edf g\\u1ea7n b\\u1ec1 m\\u1eb7t, m\\u1ed9t v&agrave;i n\\u1eb1m \\u1edf v\\u1ecb tr&iacute; s&acirc;u h\\u01a1n. Con c&aacute; c&oacute; m&agrave;u c&agrave;ng \\u0111\\u1eb9p, c&agrave;ng s&aacute;ng th&igrave; gi&aacute; c&agrave;ng cao.<\\/p>\\r\\n\\r\\n<p>M\\u1eb7c d&ugrave; c&aacute; Koi l&agrave; lo&agrave;i c&oacute; kh\\u1ea3 n\\u0103ng mang thai c&ugrave;ng l&uacute;c h&agrave;ng tri\\u1ec7u con nh\\u01b0ng vi\\u1ec7c nu&ocirc;i d\\u01b0\\u1ee1ng v&ocirc; c&ugrave;ng kh&oacute; kh\\u0103n. Ng\\u01b0\\u1eddi nu&ocirc;i c&aacute; Koi ph\\u1ea3i c&oacute; s\\u1ef1 l\\u1ef1a ch\\u1ecdn th&ocirc;ng minh s&aacute;ng su\\u1ed1t. B&aacute;o c&aacute;o cho th\\u1ea5y m\\u1ed9t ng\\u01b0\\u1eddi nu&ocirc;i c&oacute; th\\u1ec3 b\\u1eaft \\u0111\\u1ea7u t\\u1eeb 3 tri\\u1ec7u con m\\u1edbi \\u0111\\u1ebb nh\\u01b0ng&nbsp; ch\\u1ec9 ch\\u1ecdn \\u0111\\u01b0\\u1ee3c kho\\u1ea3ng 15.000 con nu&ocirc;i trong n\\u0103m \\u0111\\u1ea7u ti&ecirc;n v&agrave; kho\\u1ea3ng 1.000 con \\u0111\\u1ec3 nu&ocirc;i trong n\\u0103m ti\\u1ebfp theo.<\\/p>\\r\\n\\r\\n<p>Tuy nhi&ecirc;n, c&ocirc;ng vi\\u1ec7c kh&oacute; kh\\u0103n s\\u1ebd mang l\\u1ea1i kh&ocirc;ng ch\\u1ec9 l&agrave; l\\u1ee3i nhu\\u1eadn l\\u1edbn m&agrave; c&ograve;n mang l\\u1ea1i danh ti\\u1ebfng cho ng\\u01b0\\u1eddi nu&ocirc;i c&aacute; Koi.<\\/p>\",\"category\":[\"4\",null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/storage\\/app\\/public\\/images\\/blog\\/Vi-sao-ca-Koi-koi-1545299474-605-width480height721.jpg\",\"_token\":\"BCmPGaanfrBOlBiqzioSlBbD3BsdHHoB4DZiWARg\",\"after-save\":\"2\"}', '2021-06-12 04:37:02', '2021-06-12 04:37:02'),
(964, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-12 04:37:02', '2021-06-12 04:37:02'),
(965, 1, 'admin/posts', 'POST', '::1', '{\"title\":\"Lo\\u00e0i c\\u00e1 Nh\\u1eadt B\\u1ea3n n\\u00e0y c\\u00f3 g\\u00ec \\u0111\\u1eb7c bi\\u1ec7t m\\u00e0 t\\u1eebng \\u0111\\u01b0\\u1ee3c \\u0111\\u1ea5u gi\\u00e1 t\\u1edbi 47 t\\u1ef7?\",\"slug\":null,\"desc_short\":\"Lo\\u00e0i c\\u00e1 n\\u00e0y c\\u00f2n \\u0111\\u01b0\\u1ee3c g\\u1ecdi l\\u00e0 m\\u1ed9t \\u201cT\\u00e1c ph\\u1ea9m ngh\\u1ec7 thu\\u1eadt trong gi\\u1edbi b\\u01a1i l\\u1ed9i\\u201d, n\\u00f3 \\u0111\\u01b0\\u1ee3c sinh ra t\\u1ea1i Nh\\u1eadt B\\u1ea3n v\\u00e0o kho\\u1ea3ng 200 n\\u0103m tr\\u01b0\\u1edbc v\\u00e0 \\u0111ang thu h\\u00fat kh\\u00f4ng ch\\u1ec9 ng\\u01b0\\u1eddi d\\u00e2n Nh\\u1eadt B\\u1ea3n m\\u00e0 c\\u00f2n tr\\u00ean kh\\u1eafp th\\u1ebf gi\\u1edbi.\",\"body\":\"<p>Theo trang tin t\\u1ee9c kinh t\\u1ebf Nh\\u1eadt B\\u1ea3n ng&agrave;y 1\\/3, kh\\u1ed1i l\\u01b0\\u1ee3ng xu\\u1ea5t kh\\u1ea9u c&aacute; Koi Nh\\u1eadt B\\u1ea3n \\u0111&atilde; t\\u0103ng 35% trong 5 n\\u0103m. T\\u1ea1i bu\\u1ed5i \\u0111\\u1ea5u gi&aacute; \\u0111\\u01b0\\u1ee3c t\\u1ed5 ch\\u1ee9c t\\u1ea1i Nh\\u1eadt B\\u1ea3n, nh\\u1eefng ng\\u01b0\\u1eddi gi&agrave;u \\u1edf n\\u01b0\\u1edbc ngo&agrave;i th\\u1eadm ch&iacute; c&ograve;n tr\\u1ea3 h\\u01a1n 200 tri\\u1ec7u y&ecirc;n Nh\\u1eadt (kho\\u1ea3ng h\\u01a1n 42 t\\u1ef7 \\u0111\\u1ed3ng)&nbsp;cho m\\u1ed9t con c&aacute; Koi. Gi&aacute; tr\\u1ecb c\\u1ee7a m\\u1ed7i kg c&aacute; Koi th\\u1eadm ch&iacute; c&ograve;n v\\u01b0\\u1ee3t qua c&aacute; ng\\u1eeb \\u0111en v&agrave; tr\\u1edf th&agrave;nh &quot;lo&agrave;i c&aacute; \\u0111\\u1ea7u ti&ecirc;n c&oacute; l\\u1ee3i th\\u1ebf tuy\\u1ec7t \\u0111\\u1ed1i&quot; (theo c\\u01a1 quan Th\\u1ee7y s\\u1ea3n Nh\\u1eadt B\\u1ea3n).<\\/p>\\r\\n\\r\\n<p>V&agrave;o \\u0111\\u1ea7u th&aacute;ng 2\\/2019, nh\\u1eefng ng\\u01b0\\u1eddi h&acirc;m m\\u1ed9 c&aacute; Koi tr&ecirc;n kh\\u1eafp th\\u1ebf gi\\u1edbi \\u0111&atilde; \\u0111\\u01b0a nh\\u1eefng ch&uacute; c&aacute; c\\u1ee7a m&igrave;nh tham gia h\\u1ed9i thi &ldquo;\\u0110&aacute;nh gi&aacute; s\\u1ea3n ph\\u1ea9m Koi to&agrave;n di\\u1ec7n Nh\\u1eadt B\\u1ea3n&quot; \\u0111\\u01b0\\u1ee3c t\\u1ed5 ch\\u1ee9c t\\u1ea1i Trung t&acirc;m ph&acirc;n ph\\u1ed1i Tokyo. T\\u1ea1i \\u0111&acirc;y, qu&aacute;n qu&acirc;n l&agrave; m\\u1ed9t ch&uacute; c&aacute; Koi tr\\u1eafng \\u0111\\u1ed1m hoa v\\u0103n \\u0111\\u1ecf. Ch&uacute; c&aacute; Koi n&agrave;y \\u0111\\u01b0\\u1ee3c nu&ocirc;i trong trang tr\\u1ea1i c&aacute; c\\u1ee7a t\\u1ec9nh Hiroshima, \\u0111\\u01b0\\u1ee3c m\\u1ed9t ng\\u01b0\\u1eddi Trung Qu\\u1ed1c \\u0111\\u1ea5u gi&aacute; th&agrave;nh c&ocirc;ng v&agrave;o m&ugrave;a thu n\\u0103m 2018 v\\u1edbi m\\u1ee9c gi&aacute; cao nh\\u1ea5t trong l\\u1ecbch s\\u1eed, 230 tri\\u1ec7u y&ecirc;n (kho\\u1ea3ng 47 t\\u1ef7 VN\\u0110).<\\/p>\\r\\n\\r\\n<p><img alt=\\\"Lo\\u00e0i c\\u00e1 Nh\\u1eadt B\\u1ea3n n\\u00e0y c\\u00f3 g\\u00ec \\u0111\\u1eb7c bi\\u1ec7t m\\u00e0 t\\u1eebng \\u0111\\u01b0\\u1ee3c \\u0111\\u1ea5u gi\\u00e1 t\\u1edbi 47 t\\u1ef7? - 1\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/1-2019\\/images\\/2019-03-11\\/1552278583-814-loai-ca-nhat-ban-nay-co-gi-dac-biet-ma-tung-duoc-dau-gia-toi-47-ty----nh-1-1551926824-width393height424.jpeg\\\" \\/><\\/p>\\r\\n\\r\\n<p>M\\u1ed9t ch&uacute; c&aacute; coi t\\u1eebng \\u0111\\u01b0\\u1ee3c \\u0111\\u1ea5u gi&aacute; 47 t\\u1ef7 VN\\u0110<\\/p>\\r\\n\\r\\n<p>N\\u0103m 2018, kh\\u1ed1i l\\u01b0\\u1ee3ng xu\\u1ea5t kh\\u1ea9u c\\u1ee7a c&aacute; Koi Nh\\u1eadt B\\u1ea3n l&agrave; 3.633 t\\u1ef7 y&ecirc;n, t\\u0103ng g\\u1ea5p \\u0111&ocirc;i trong th\\u1eadp k\\u1ef7 qua. C&aacute;c n\\u01a1i xu\\u1ea5t kh\\u1ea9u c&aacute; ch&iacute;nh l&agrave; H\\u1ed3ng K&ocirc;ng, H&agrave; Lan v&agrave; \\u0110\\u1ee9c. Trong nh\\u1eefng n\\u0103m g\\u1ea7n \\u0111&acirc;y, giao d\\u1ecbch v\\u1edbi ng\\u01b0\\u1eddi mua t\\u1eeb Brazil v&agrave; C&aacute;c Ti\\u1ec3u v\\u01b0\\u01a1ng qu\\u1ed1c \\u1ea2 R\\u1eadp Th\\u1ed1ng nh\\u1ea5t c\\u0169ng t\\u0103ng l&ecirc;n. V\\u1ec1 v\\u1ea5n \\u0111\\u1ec1 n&agrave;y, Nakajima Masato, ch\\u1ee7 t\\u1ecbch C&acirc;u l\\u1ea1c b\\u1ed9 Aibo Nh\\u1eadt B\\u1ea3n, gi\\u1ea3i th&iacute;ch: &quot;\\u0110i\\u1ec3m gi&uacute;p c&aacute; Koi thu h&uacute;t m\\u1ecdi ng\\u01b0\\u1eddi l&agrave; nh\\u1eefng \\u0111\\u1ed1m hoa v\\u0103n \\u0111\\u1ed9c nh\\u1ea5t v&ocirc; nh\\u1ecb c\\u1ee7a ch&uacute;ng.&quot;<\\/p>\\r\\n\\r\\n<p>C&aacute; Koi c&oacute; ngu\\u1ed3n g\\u1ed1c \\u1edf l&agrave; t\\u1ec9nh Niigata, Nh\\u1eadt B\\u1ea3n. V&agrave;o th\\u1eddi Edo, trong ao nu&ocirc;i c&aacute; ch&eacute;p v\\u1edbi m\\u1ee5c \\u0111&iacute;ch \\u0111\\u1ec3 ch\\u1ebf bi\\u1ebfn m&oacute;n \\u0103n b\\u1ed7ng d\\u01b0ng xu\\u1ea5t hi\\u1ec7n nh\\u1eefng con c&aacute; c&oacute; \\u0111\\u1ed1m hoa v\\u0103n k&igrave; l\\u1ea1 tr&ecirc;n m&igrave;nh, th\\u1ea5y v\\u1eady m\\u1ecdi ng\\u01b0\\u1eddi nu&ocirc;i ch&uacute;ng l&agrave;m c&aacute; c\\u1ea3nh. Sau nhi\\u1ec1u th\\u1ebf h\\u1ec7 giao ph\\u1ed1i nh&acirc;n t\\u1ea1o, c&aacute; Koi \\u0111&atilde; \\u0111\\u01b0\\u1ee3c c\\u1ea3i ti\\u1ebfn th&agrave;nh m\\u1ed9t lo&agrave;i c&aacute; c\\u1ea3nh \\u0111\\u1eb9p v&agrave; l\\u1ed9ng l\\u1eaby h\\u01a1n.<\\/p>\\r\\n\\r\\n<p><img alt=\\\"Lo\\u00e0i c\\u00e1 Nh\\u1eadt B\\u1ea3n n\\u00e0y c\\u00f3 g\\u00ec \\u0111\\u1eb7c bi\\u1ec7t m\\u00e0 t\\u1eebng \\u0111\\u01b0\\u1ee3c \\u0111\\u1ea5u gi\\u00e1 t\\u1edbi 47 t\\u1ef7? - 2\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/1-2019\\/images\\/2019-03-11\\/1552278583-790-loai-ca-nhat-ban-nay-co-gi-dac-biet-ma-tung-duoc-dau-gia-toi-47-ty----nh-2-1551926802-width592height342.jpeg\\\" \\/><\\/p>\\r\\n\\r\\n<p>\\u0110i\\u1ec3m thu h&uacute;t c\\u1ee7a c&aacute; koi l&agrave; nh\\u1eefng \\u0111\\u1ed1m hoa v\\u0103n \\u0111\\u1ed9c nh\\u1ea5t v&ocirc; nh\\u1ecb c\\u1ee7a ch&uacute;ng<\\/p>\\r\\n\\r\\n<p>V&agrave;o th&aacute;ng 11\\/2018, m\\u1ed9t h\\u1ed9i ngh\\u1ecb chuy&ecirc;n \\u0111\\u1ec1 v\\u1ec1 c&aacute; Koi \\u0111&atilde; \\u0111\\u01b0\\u1ee3c t\\u1ed5 ch\\u1ee9c t\\u1ea1i Komaki, t\\u1ec9nh Niigata v&agrave; g\\u1ea7n m\\u1ed9t n\\u1eeda s\\u1ed1 ng\\u01b0\\u1eddi tham gia l&agrave; ng\\u01b0\\u1eddi n\\u01b0\\u1edbc ngo&agrave;i. Gi&aacute;m \\u0111\\u1ed1c \\u0111i\\u1ec1u h&agrave;nh c\\u1ee7a m\\u1ed9t c&ocirc;ng ty b\\u1ea5t \\u0111\\u1ed9ng s\\u1ea3n \\u0111\\u1ebfn t\\u1eeb Trung Qu\\u1ed1c chia s\\u1ebb: &quot;C&aacute; Koi khi\\u1ebfn t&ocirc;i qu&ecirc;n \\u0111i &aacute;p l\\u1ef1c h&agrave;ng ng&agrave;y. D&ugrave; c&oacute; xem ch&uacute;ng bao l&acirc;u, t&ocirc;i c\\u0169ng kh&ocirc;ng th\\u1ea5y m\\u1ec7t m\\u1ecfi.&quot;<\\/p>\",\"category\":[\"4\",null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/public\\/upload\\/product_default.png\",\"_token\":\"BCmPGaanfrBOlBiqzioSlBbD3BsdHHoB4DZiWARg\",\"after-save\":\"1\"}', '2021-06-12 04:49:04', '2021-06-12 04:49:04'),
(966, 1, 'admin/posts/17/edit', 'GET', '::1', '[]', '2021-06-12 04:49:05', '2021-06-12 04:49:05'),
(967, 1, 'admin/posts/17', 'PUT', '::1', '{\"title\":\"Lo\\u00e0i c\\u00e1 Nh\\u1eadt B\\u1ea3n n\\u00e0y c\\u00f3 g\\u00ec \\u0111\\u1eb7c bi\\u1ec7t m\\u00e0 t\\u1eebng \\u0111\\u01b0\\u1ee3c \\u0111\\u1ea5u gi\\u00e1 t\\u1edbi 47 t\\u1ef7?\",\"slug\":\"loai-ca-nhat-ban-nay-co-gi-dac-biet-ma-tung-duoc-dau-gia-toi-47-ty-2\",\"desc_short\":\"Lo\\u00e0i c\\u00e1 n\\u00e0y c\\u00f2n \\u0111\\u01b0\\u1ee3c g\\u1ecdi l\\u00e0 m\\u1ed9t \\u201cT\\u00e1c ph\\u1ea9m ngh\\u1ec7 thu\\u1eadt trong gi\\u1edbi b\\u01a1i l\\u1ed9i\\u201d, n\\u00f3 \\u0111\\u01b0\\u1ee3c sinh ra t\\u1ea1i Nh\\u1eadt B\\u1ea3n v\\u00e0o kho\\u1ea3ng 200 n\\u0103m tr\\u01b0\\u1edbc v\\u00e0 \\u0111ang thu h\\u00fat kh\\u00f4ng ch\\u1ec9 ng\\u01b0\\u1eddi d\\u00e2n Nh\\u1eadt B\\u1ea3n m\\u00e0 c\\u00f2n tr\\u00ean kh\\u1eafp th\\u1ebf gi\\u1edbi.\",\"body\":\"<p>Theo trang tin t\\u1ee9c kinh t\\u1ebf Nh\\u1eadt B\\u1ea3n ng&agrave;y 1\\/3, kh\\u1ed1i l\\u01b0\\u1ee3ng xu\\u1ea5t kh\\u1ea9u c&aacute; Koi Nh\\u1eadt B\\u1ea3n \\u0111&atilde; t\\u0103ng 35% trong 5 n\\u0103m. T\\u1ea1i bu\\u1ed5i \\u0111\\u1ea5u gi&aacute; \\u0111\\u01b0\\u1ee3c t\\u1ed5 ch\\u1ee9c t\\u1ea1i Nh\\u1eadt B\\u1ea3n, nh\\u1eefng ng\\u01b0\\u1eddi gi&agrave;u \\u1edf n\\u01b0\\u1edbc ngo&agrave;i th\\u1eadm ch&iacute; c&ograve;n tr\\u1ea3 h\\u01a1n 200 tri\\u1ec7u y&ecirc;n Nh\\u1eadt (kho\\u1ea3ng h\\u01a1n 42 t\\u1ef7 \\u0111\\u1ed3ng)&nbsp;cho m\\u1ed9t con c&aacute; Koi. Gi&aacute; tr\\u1ecb c\\u1ee7a m\\u1ed7i kg c&aacute; Koi th\\u1eadm ch&iacute; c&ograve;n v\\u01b0\\u1ee3t qua c&aacute; ng\\u1eeb \\u0111en v&agrave; tr\\u1edf th&agrave;nh &quot;lo&agrave;i c&aacute; \\u0111\\u1ea7u ti&ecirc;n c&oacute; l\\u1ee3i th\\u1ebf tuy\\u1ec7t \\u0111\\u1ed1i&quot; (theo c\\u01a1 quan Th\\u1ee7y s\\u1ea3n Nh\\u1eadt B\\u1ea3n).<\\/p>\\r\\n\\r\\n<p>V&agrave;o \\u0111\\u1ea7u th&aacute;ng 2\\/2019, nh\\u1eefng ng\\u01b0\\u1eddi h&acirc;m m\\u1ed9 c&aacute; Koi tr&ecirc;n kh\\u1eafp th\\u1ebf gi\\u1edbi \\u0111&atilde; \\u0111\\u01b0a nh\\u1eefng ch&uacute; c&aacute; c\\u1ee7a m&igrave;nh tham gia h\\u1ed9i thi &ldquo;\\u0110&aacute;nh gi&aacute; s\\u1ea3n ph\\u1ea9m Koi to&agrave;n di\\u1ec7n Nh\\u1eadt B\\u1ea3n&quot; \\u0111\\u01b0\\u1ee3c t\\u1ed5 ch\\u1ee9c t\\u1ea1i Trung t&acirc;m ph&acirc;n ph\\u1ed1i Tokyo. T\\u1ea1i \\u0111&acirc;y, qu&aacute;n qu&acirc;n l&agrave; m\\u1ed9t ch&uacute; c&aacute; Koi tr\\u1eafng \\u0111\\u1ed1m hoa v\\u0103n \\u0111\\u1ecf. Ch&uacute; c&aacute; Koi n&agrave;y \\u0111\\u01b0\\u1ee3c nu&ocirc;i trong trang tr\\u1ea1i c&aacute; c\\u1ee7a t\\u1ec9nh Hiroshima, \\u0111\\u01b0\\u1ee3c m\\u1ed9t ng\\u01b0\\u1eddi Trung Qu\\u1ed1c \\u0111\\u1ea5u gi&aacute; th&agrave;nh c&ocirc;ng v&agrave;o m&ugrave;a thu n\\u0103m 2018 v\\u1edbi m\\u1ee9c gi&aacute; cao nh\\u1ea5t trong l\\u1ecbch s\\u1eed, 230 tri\\u1ec7u y&ecirc;n (kho\\u1ea3ng 47 t\\u1ef7 VN\\u0110).<\\/p>\\r\\n\\r\\n<p><img alt=\\\"Lo\\u00e0i c\\u00e1 Nh\\u1eadt B\\u1ea3n n\\u00e0y c\\u00f3 g\\u00ec \\u0111\\u1eb7c bi\\u1ec7t m\\u00e0 t\\u1eebng \\u0111\\u01b0\\u1ee3c \\u0111\\u1ea5u gi\\u00e1 t\\u1edbi 47 t\\u1ef7? - 1\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/1-2019\\/images\\/2019-03-11\\/1552278583-814-loai-ca-nhat-ban-nay-co-gi-dac-biet-ma-tung-duoc-dau-gia-toi-47-ty----nh-1-1551926824-width393height424.jpeg\\\" \\/><\\/p>\\r\\n\\r\\n<p>M\\u1ed9t ch&uacute; c&aacute; coi t\\u1eebng \\u0111\\u01b0\\u1ee3c \\u0111\\u1ea5u gi&aacute; 47 t\\u1ef7 VN\\u0110<\\/p>\\r\\n\\r\\n<p>N\\u0103m 2018, kh\\u1ed1i l\\u01b0\\u1ee3ng xu\\u1ea5t kh\\u1ea9u c\\u1ee7a c&aacute; Koi Nh\\u1eadt B\\u1ea3n l&agrave; 3.633 t\\u1ef7 y&ecirc;n, t\\u0103ng g\\u1ea5p \\u0111&ocirc;i trong th\\u1eadp k\\u1ef7 qua. C&aacute;c n\\u01a1i xu\\u1ea5t kh\\u1ea9u c&aacute; ch&iacute;nh l&agrave; H\\u1ed3ng K&ocirc;ng, H&agrave; Lan v&agrave; \\u0110\\u1ee9c. Trong nh\\u1eefng n\\u0103m g\\u1ea7n \\u0111&acirc;y, giao d\\u1ecbch v\\u1edbi ng\\u01b0\\u1eddi mua t\\u1eeb Brazil v&agrave; C&aacute;c Ti\\u1ec3u v\\u01b0\\u01a1ng qu\\u1ed1c \\u1ea2 R\\u1eadp Th\\u1ed1ng nh\\u1ea5t c\\u0169ng t\\u0103ng l&ecirc;n. V\\u1ec1 v\\u1ea5n \\u0111\\u1ec1 n&agrave;y, Nakajima Masato, ch\\u1ee7 t\\u1ecbch C&acirc;u l\\u1ea1c b\\u1ed9 Aibo Nh\\u1eadt B\\u1ea3n, gi\\u1ea3i th&iacute;ch: &quot;\\u0110i\\u1ec3m gi&uacute;p c&aacute; Koi thu h&uacute;t m\\u1ecdi ng\\u01b0\\u1eddi l&agrave; nh\\u1eefng \\u0111\\u1ed1m hoa v\\u0103n \\u0111\\u1ed9c nh\\u1ea5t v&ocirc; nh\\u1ecb c\\u1ee7a ch&uacute;ng.&quot;<\\/p>\\r\\n\\r\\n<p>C&aacute; Koi c&oacute; ngu\\u1ed3n g\\u1ed1c \\u1edf l&agrave; t\\u1ec9nh Niigata, Nh\\u1eadt B\\u1ea3n. V&agrave;o th\\u1eddi Edo, trong ao nu&ocirc;i c&aacute; ch&eacute;p v\\u1edbi m\\u1ee5c \\u0111&iacute;ch \\u0111\\u1ec3 ch\\u1ebf bi\\u1ebfn m&oacute;n \\u0103n b\\u1ed7ng d\\u01b0ng xu\\u1ea5t hi\\u1ec7n nh\\u1eefng con c&aacute; c&oacute; \\u0111\\u1ed1m hoa v\\u0103n k&igrave; l\\u1ea1 tr&ecirc;n m&igrave;nh, th\\u1ea5y v\\u1eady m\\u1ecdi ng\\u01b0\\u1eddi nu&ocirc;i ch&uacute;ng l&agrave;m c&aacute; c\\u1ea3nh. Sau nhi\\u1ec1u th\\u1ebf h\\u1ec7 giao ph\\u1ed1i nh&acirc;n t\\u1ea1o, c&aacute; Koi \\u0111&atilde; \\u0111\\u01b0\\u1ee3c c\\u1ea3i ti\\u1ebfn th&agrave;nh m\\u1ed9t lo&agrave;i c&aacute; c\\u1ea3nh \\u0111\\u1eb9p v&agrave; l\\u1ed9ng l\\u1eaby h\\u01a1n.<\\/p>\\r\\n\\r\\n<p><img alt=\\\"Lo\\u00e0i c\\u00e1 Nh\\u1eadt B\\u1ea3n n\\u00e0y c\\u00f3 g\\u00ec \\u0111\\u1eb7c bi\\u1ec7t m\\u00e0 t\\u1eebng \\u0111\\u01b0\\u1ee3c \\u0111\\u1ea5u gi\\u00e1 t\\u1edbi 47 t\\u1ef7? - 2\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/1-2019\\/images\\/2019-03-11\\/1552278583-790-loai-ca-nhat-ban-nay-co-gi-dac-biet-ma-tung-duoc-dau-gia-toi-47-ty----nh-2-1551926802-width592height342.jpeg\\\" \\/><\\/p>\\r\\n\\r\\n<p>\\u0110i\\u1ec3m thu h&uacute;t c\\u1ee7a c&aacute; koi l&agrave; nh\\u1eefng \\u0111\\u1ed1m hoa v\\u0103n \\u0111\\u1ed9c nh\\u1ea5t v&ocirc; nh\\u1ecb c\\u1ee7a ch&uacute;ng<\\/p>\\r\\n\\r\\n<p>V&agrave;o th&aacute;ng 11\\/2018, m\\u1ed9t h\\u1ed9i ngh\\u1ecb chuy&ecirc;n \\u0111\\u1ec1 v\\u1ec1 c&aacute; Koi \\u0111&atilde; \\u0111\\u01b0\\u1ee3c t\\u1ed5 ch\\u1ee9c t\\u1ea1i Komaki, t\\u1ec9nh Niigata v&agrave; g\\u1ea7n m\\u1ed9t n\\u1eeda s\\u1ed1 ng\\u01b0\\u1eddi tham gia l&agrave; ng\\u01b0\\u1eddi n\\u01b0\\u1edbc ngo&agrave;i. Gi&aacute;m \\u0111\\u1ed1c \\u0111i\\u1ec1u h&agrave;nh c\\u1ee7a m\\u1ed9t c&ocirc;ng ty b\\u1ea5t \\u0111\\u1ed9ng s\\u1ea3n \\u0111\\u1ebfn t\\u1eeb Trung Qu\\u1ed1c chia s\\u1ebb: &quot;C&aacute; Koi khi\\u1ebfn t&ocirc;i qu&ecirc;n \\u0111i &aacute;p l\\u1ef1c h&agrave;ng ng&agrave;y. D&ugrave; c&oacute; xem ch&uacute;ng bao l&acirc;u, t&ocirc;i c\\u0169ng kh&ocirc;ng th\\u1ea5y m\\u1ec7t m\\u1ecfi.&quot;<\\/p>\",\"category\":[\"4\",null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/storage\\/app\\/public\\/images\\/blog1\\/1552278583-814-loai-ca-nhat-ban-nay-co-gi-dac-biet-ma-tung-duoc-dau-gia-toi-47-ty----nh-1-1551926824-width393height424.jpeg\",\"_token\":\"BCmPGaanfrBOlBiqzioSlBbD3BsdHHoB4DZiWARg\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/posts\\/create\"}', '2021-06-12 04:53:07', '2021-06-12 04:53:07'),
(968, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-12 04:53:08', '2021-06-12 04:53:08'),
(969, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 04:53:13', '2021-06-12 04:53:13'),
(970, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"per_page\":\"10\"}', '2021-06-12 04:53:45', '2021-06-12 04:53:45'),
(971, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"per_page\":\"10\",\"page\":\"2\"}', '2021-06-12 04:53:47', '2021-06-12 04:53:47'),
(972, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"per_page\":\"10\",\"page\":\"1\"}', '2021-06-12 04:53:49', '2021-06-12 04:53:49'),
(973, 1, 'admin/posts/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-12 04:55:05', '2021-06-12 04:55:05'),
(974, 1, 'admin', 'GET', '::1', '[]', '2021-06-14 05:22:19', '2021-06-14 05:22:19'),
(975, 1, 'admin', 'GET', '::1', '[]', '2021-06-14 05:22:23', '2021-06-14 05:22:23'),
(976, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-14 05:22:28', '2021-06-14 05:22:28');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(977, 1, 'admin/posts/7/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-14 05:22:37', '2021-06-14 05:22:37'),
(978, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-14 05:27:25', '2021-06-14 05:27:25'),
(979, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-14 05:36:47', '2021-06-14 05:36:47'),
(980, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-14 05:37:18', '2021-06-14 05:37:18'),
(981, 1, 'admin/posts/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-14 05:37:20', '2021-06-14 05:37:20'),
(982, 1, 'admin/posts', 'POST', '::1', '{\"title\":\"hehe\",\"slug\":null,\"desc_short\":null,\"body\":null,\"category\":[null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/public\\/upload\\/product_default.png\",\"_token\":\"WcF2ijnjBvXmRTAnp9aiP0rZ7lu7oUjbTj6rSUSk\",\"after-save\":\"1\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/posts\"}', '2021-06-14 05:37:28', '2021-06-14 05:37:28'),
(983, 1, 'admin/posts/18/edit', 'GET', '::1', '[]', '2021-06-14 05:37:29', '2021-06-14 05:37:29'),
(984, 1, 'admin/posts/18', 'DELETE', '::1', '{\"_method\":\"delete\",\"_token\":\"WcF2ijnjBvXmRTAnp9aiP0rZ7lu7oUjbTj6rSUSk\"}', '2021-06-14 05:37:52', '2021-06-14 05:37:52'),
(985, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-14 05:37:52', '2021-06-14 05:37:52'),
(986, 1, 'admin/posts/15/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-14 06:05:20', '2021-06-14 06:05:20'),
(987, 1, 'admin/posts/15', 'PUT', '::1', '{\"title\":\"Thi v\\u00e0o l\\u1edbp 10: H\\u00e0 N\\u1ed9i huy \\u0111\\u1ed9ng h\\u01a1n 500 thanh tra, ng\\u00e0y 11\\/6, th\\u00ed sinh l\\u00e0m th\\u1ee7 t\\u1ee5c d\\u1ef1 thi tr\\u1ef1c tuy\\u1ebfn\",\"slug\":\"thi-vao-lop-10-ha-noi-huy-dong-hon-500-thanh-tra-ngay-11-6-thi-sinh-lam-thu-tuc-du-thi-truc-tuyen\",\"desc_short\":\"L\\u1ef1c l\\u01b0\\u1ee3ng thanh tra l\\u00e0m nhi\\u1ec7m v\\u1ee5 c\\u1eafm ch\\u1ed1t t\\u1ea1i 184 \\u0111i\\u1ec3m thi v\\u00e0o l\\u1edbp 10 trung h\\u1ecdc ph\\u1ed5 th\\u00f4ng c\\u00f4ng l\\u1eadp n\\u0103m h\\u1ecdc 2021-2022 tr\\u00ean \\u0111\\u1ecba b\\u00e0n th\\u00e0nh ph\\u1ed1 H\\u00e0 N\\u1ed9i.L\\u1ef1c l\\u01b0\\u1ee3ng thanh tra l\\u00e0m nhi\\u1ec7m v\\u1ee5 c\\u1eafm ch\\u1ed1t t\\u1ea1i 184 \\u0111i\\u1ec3m thi v\\u00e0o l\\u1edbp 10 trung h\\u1ecdc ph\\u1ed5 th\\u00f4ng c\\u00f4ng l\\u1eadp n\\u0103m h\\u1ecdc 2021-2022 tr\\u00ean \\u0111\\u1ecba b\\u00e0n th\\u00e0nh ph\\u1ed1 H\\u00e0 N\\u1ed9i.\",\"body\":\"<p>\\u0110\\u1ec3 chu\\u1ea9n b\\u1ecb t\\u1ed5 ch\\u1ee9c k\\u1ef3 thi&nbsp;<a href=\\\"https:\\/\\/www.24h.com.vn\\/tuyen-sinh-dh-cd-c365.html\\\" title=\\\"tuy\\u1ec3n sinh\\\">tuy\\u1ec3n sinh<\\/a>&nbsp;v&agrave;o l\\u1edbp 10 trung h\\u1ecdc ph\\u1ed5 th&ocirc;ng c&ocirc;ng l\\u1eadp n\\u0103m h\\u1ecdc 2021-2022, S\\u1edf&nbsp;<a href=\\\"https:\\/\\/www.24h.com.vn\\/giao-duc-du-hoc-c216.html\\\" title=\\\"Gi\\u00e1o d\\u1ee5c\\\">Gi&aacute;o d\\u1ee5c<\\/a>&nbsp;v&agrave; \\u0110&agrave;o t\\u1ea1o H&agrave; N\\u1ed9i \\u0111&atilde; huy \\u0111\\u1ed9ng h\\u01a1n 500 thanh tra. L\\u1ef1c l\\u01b0\\u1ee3ng thanh tra l&agrave;m nhi\\u1ec7m v\\u1ee5 c\\u1eafm ch\\u1ed1t t\\u1ea1i 184 \\u0111i\\u1ec3m thi v&agrave;o l\\u1edbp 10 trung h\\u1ecdc ph\\u1ed5 th&ocirc;ng c&ocirc;ng l\\u1eadp n\\u0103m h\\u1ecdc 2021-2022 tr&ecirc;n \\u0111\\u1ecba b&agrave;n th&agrave;nh ph\\u1ed1 H&agrave; N\\u1ed9i.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p><img alt=\\\"Thi v\\u00e0o l\\u1edbp 10: H\\u00e0 N\\u1ed9i huy \\u0111\\u1ed9ng h\\u01a1n 500 thanh tra, ng\\u00e0y 11\\/6, th\\u00ed sinh l\\u00e0m th\\u1ee7 t\\u1ee5c d\\u1ef1 thi tr\\u1ef1c tuy\\u1ebfn - 1\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-06-08\\/Thi-vao-lop-10-Ha-Noi-huy-dong-hon-500-thanh-tra-ngay-11-6-thi-sinh-lam-thu-tuc-du-thi-truc-tuyen-thi-lop-10-hnm-1623109294-35-width1200height768.jpg\\\" style=\\\"width:660px\\\" \\/><\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>\\u1ea2nh: TTX.<\\/p>\\r\\n\\r\\n<p>Ngo&agrave;i ra, S\\u1edf Gi&aacute;o d\\u1ee5c v&agrave; \\u0110&agrave;o t\\u1ea1o H&agrave; N\\u1ed9i c&ograve;n th&agrave;nh l\\u1eadp 16 t\\u1ed5 gi&aacute;m s&aacute;t (m\\u1ed7i t\\u1ed5 c&oacute; 3 th&agrave;nh vi&ecirc;n), c&oacute; nhi\\u1ec7m v\\u1ee5 gi&aacute;m s&aacute;t ho\\u1ea1t \\u0111\\u1ed9ng c\\u1ee7a \\u0111o&agrave;n thanh tra t\\u1ea1i c&aacute;c \\u0111i\\u1ec3m thi.<\\/p>\\r\\n\\r\\n<p>Ngo&agrave;i c&aacute;c n\\u1ed9i dung v\\u1ec1 chuy&ecirc;n m&ocirc;n, c&ocirc;ng t&aacute;c thanh tra k\\u1ef3 thi n\\u0103m nay c&oacute; th&ecirc;m n\\u1ed9i dung v\\u1ec1 vi\\u1ec7c chu\\u1ea9n b\\u1ecb, th\\u1ef1c hi\\u1ec7n c&aacute;c quy \\u0111\\u1ecbnh ph&ograve;ng, ch\\u1ed1ng d\\u1ecbch COVID-19 c\\u1ee7a c&aacute;c th&agrave;nh vi&ecirc;n t\\u1ea1i c&aacute;c \\u0111i\\u1ec3m thi.<\\/p>\\r\\n\\r\\n<p>\\u0110\\u1ec3 b\\u1ea3o \\u0111\\u1ea3m an to&agrave;n cho th&iacute; sinh d\\u1ef1 thi, l\\u1ef1c l\\u01b0\\u1ee3ng thanh tra s\\u1ebd thanh tra vi\\u1ec7c b\\u1ed1 tr&iacute; khu v\\u1ef1c thi, ph&ograve;ng thi, ch\\u1ed7 ng\\u1ed3i c\\u1ee7a th&iacute; sinh nh\\u1eb1m b\\u1ea3o \\u0111\\u1ea3m an to&agrave;n ph&ograve;ng, ch\\u1ed1ng d\\u1ecbch COVID-19; c&ocirc;ng t&aacute;c v\\u1ec7 sinh an to&agrave;n th\\u1ef1c ph\\u1ea9m, y t\\u1ebf, \\u0111i\\u1ec7n, n\\u01b0\\u1edbc v&agrave; c&aacute;c ph\\u01b0\\u01a1ng &aacute;n x\\u1eed l&yacute; c&aacute;c t&igrave;nh hu\\u1ed1ng b\\u1ea5t th\\u01b0\\u1eddng t\\u1ea1i \\u0111i\\u1ec3m thi.<\\/p>\\r\\n\\r\\n<p>Vi\\u1ec7c th&agrave;nh l\\u1eadp l\\u1ef1c l\\u01b0\\u1ee3ng thanh tra k\\u1ef3 thi nh\\u1eb1m gi&uacute;p c\\u01a1 quan, t\\u1ed5 ch\\u1ee9c, c&aacute; nh&acirc;n tham gia k\\u1ef3 thi th\\u1ef1c hi\\u1ec7n \\u0111&uacute;ng quy ch\\u1ebf thi, c&aacute;c quy \\u0111\\u1ecbnh li&ecirc;n quan \\u0111\\u1ebfn vi\\u1ec7c t\\u1ed5 ch\\u1ee9c k\\u1ef3 thi v&agrave; c&aacute;c n\\u1ed9i dung ch\\u1ec9 \\u0111\\u1ea1o c\\u1ee7a B\\u1ed9 Gi&aacute;o d\\u1ee5c v&agrave; \\u0110&agrave;o t\\u1ea1o, UBND th&agrave;nh ph\\u1ed1 H&agrave; N\\u1ed9i, S\\u1edf Gi&aacute;o d\\u1ee5c v&agrave; \\u0110&agrave;o t\\u1ea1o H&agrave; N\\u1ed9i, g&oacute;p ph\\u1ea7n b\\u1ea3o \\u0111\\u1ea3m cho k\\u1ef3 thi di\\u1ec5n ra an to&agrave;n, nghi&ecirc;m t&uacute;c, \\u0111&uacute;ng quy \\u0111\\u1ecbnh.<\\/p>\\r\\n\\r\\n<p><strong>Th&iacute; sinh l&agrave;m th\\u1ee7 t\\u1ee5c d\\u1ef1 thi theo h&igrave;nh th\\u1ee9c tr\\u1ef1c tuy\\u1ebfn<\\/strong><\\/p>\\r\\n\\r\\n<p>M\\u1ed9t trong nh\\u1eefng n\\u1ed9i dung quan tr\\u1ecdng kh&aacute;c c\\u0169ng \\u0111\\u01b0\\u1ee3c UBND th&agrave;nh ph\\u1ed1 H&agrave; N\\u1ed9i quy\\u1ebft \\u0111\\u1ecbnh \\u0111i\\u1ec1u ch\\u1ec9nh l&agrave; t\\u1ed5 ch\\u1ee9c cho th&iacute; sinh l&agrave;m th\\u1ee7 t\\u1ee5c d\\u1ef1 thi theo h&igrave;nh th\\u1ee9c tr\\u1ef1c tuy\\u1ebfn.<\\/p>\\r\\n\\r\\n<p>C\\u1ee5 th\\u1ec3, theo th&ocirc;ng b&aacute;o c\\u1ee7a S\\u1edf Gi&aacute;o d\\u1ee5c v&agrave; \\u0110&agrave;o t\\u1ea1o H&agrave; N\\u1ed9i, ng&agrave;y 11\\/6\\/2021, th&iacute; sinh s\\u1ebd l&agrave;m th\\u1ee7 t\\u1ee5c d\\u1ef1 thi v&agrave;o l\\u1edbp 10 theo h&igrave;nh th\\u1ee9c tr\\u1ef1c tuy\\u1ebfn t\\u1ea1i c&aacute;c tr\\u01b0\\u1eddng trung h\\u1ecdc c\\u01a1 s\\u1edf, thay cho h&igrave;nh th\\u1ee9c tr\\u1ef1c ti\\u1ebfp nh\\u01b0 k\\u1ebf ho\\u1ea1ch \\u0111&atilde; c&ocirc;ng b\\u1ed1.<\\/p>\\r\\n\\r\\n<p>\\u0110\\u1ec3 b\\u1ea3o \\u0111\\u1ea3m an to&agrave;n ph&ograve;ng, ch\\u1ed1ng d\\u1ecbch, c&aacute;c ph&ograve;ng gi&aacute;o d\\u1ee5c v&agrave; \\u0111&agrave;o t\\u1ea1o qu\\u1eadn, huy\\u1ec7n, th\\u1ecb x&atilde; c&oacute; tr&aacute;ch nhi\\u1ec7m ch\\u1ec9 \\u0111\\u1ea1o c&aacute;c tr\\u01b0\\u1eddng trung h\\u1ecdc c\\u01a1 s\\u1edf thu\\u1ed9c ph\\u1ea1m vi qu\\u1ea3n l&yacute; l\\u1ef1a ch\\u1ecdn th\\u1eddi gian h\\u1ee3p l&yacute; trong ng&agrave;y \\u0111\\u1ec3 t\\u1ed5 ch\\u1ee9c cho h\\u1ecdc sinh l&agrave;m th\\u1ee7 t\\u1ee5c d\\u1ef1 thi theo h&igrave;nh th\\u1ee9c tr\\u1ef1c tuy\\u1ebfn.<\\/p>\\r\\n\\r\\n<p>S\\u1edf c\\u0169ng khuy\\u1ebfn kh&iacute;ch c&aacute;c nh&agrave; tr\\u01b0\\u1eddng t\\u1ea1o \\u0111i\\u1ec1u ki\\u1ec7n \\u0111\\u1ec3 ph\\u1ee5 huynh c&ugrave;ng tham gia \\u0111\\u1ec3 n\\u1eafm ch\\u1eafc c&aacute;c quy \\u0111\\u1ecbnh li&ecirc;n quan \\u0111\\u1ebfn k\\u1ef3 thi v&agrave; c&ugrave;ng th\\u1ef1c hi\\u1ec7n t\\u1ed1t, v\\u1edbi m\\u1ee5c ti&ecirc;u b\\u1ea3o \\u0111\\u1ea3m an to&agrave;n cao nh\\u1ea5t cho th&iacute; sinh tham d\\u1ef1 k\\u1ef3 thi.<\\/p>\\r\\n\\r\\n<p>\\u0110\\u1ec3 tr&aacute;nh x\\u1ea3y ra nh\\u1ea7m l\\u1eabn, S\\u1edf Gi&aacute;o d\\u1ee5c v&agrave; \\u0110&agrave;o t\\u1ea1o H&agrave; N\\u1ed9i y&ecirc;u c\\u1ea7u c&aacute;c ph&ograve;ng gi&aacute;o d\\u1ee5c v&agrave; \\u0111&agrave;o t\\u1ea1o qu\\u1eadn, huy\\u1ec7n, th\\u1ecb x&atilde; nh\\u1eafc nh\\u1edf c&aacute;c nh&agrave; tr\\u01b0\\u1eddng th&ocirc;ng tin c\\u1ee5 th\\u1ec3 cho t\\u1ea5t c\\u1ea3 th&iacute; sinh tham d\\u1ef1 k\\u1ef3 thi v\\u1ec1 quy \\u0111\\u1ecbnh m\\u1edbi n&agrave;y.<\\/p>\\r\\n\\r\\n<p>T\\u1ea1i bu\\u1ed5i l&agrave;m th\\u1ee7 t\\u1ee5c d\\u1ef1 thi, c&aacute;c th&iacute; sinh c\\u1ea7n nh\\u1edb r&agrave; so&aacute;t l\\u1ea1i m\\u1ed9t l\\u1ea7n n\\u1eefa c&aacute;c th&ocirc;ng tin trong phi\\u1ebfu \\u0111\\u0103ng k&yacute; d\\u1ef1 thi; nghe ph\\u1ed5 bi\\u1ebfn quy ch\\u1ebf thi, l\\u1ecbch thi \\u0111\\u1ec3 th\\u1ef1c hi\\u1ec7n nghi&ecirc;m t&uacute;c.<\\/p>\\r\\n\\r\\n<p>K\\u1ef3 thi tuy\\u1ec3n sinh v&agrave;o l\\u1edbp 10 t\\u1ea1i H&agrave; N\\u1ed9i di\\u1ec5n ra v&agrave;o ng&agrave;y 12 v&agrave; 13\\/6\\/2021, v\\u1edbi s\\u1ef1 tham gia c\\u1ee7a h\\u01a1n 93.000 th&iacute; sinh.<\\/p>\\r\\n\\r\\n<p>Ngu\\u1ed3n: http:\\/\\/danviet.vn\\/thi-vao-lop-10-ha-noi-huy-dong-hon-500-thanh-tra-ngay-11-6-thi-sinh-lam-thu-tuc-du-thi-truc-tuyen-50202186722952.htm<\\/p>\",\"category\":[\"3\",null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/storage\\/app\\/public\\/images\\/blog\\/Thi-vao-lop-10-Ha-Noi-huy-dong-hon-500-thanh-tra-ngay-11-6-thi-sinh-lam-thu-tuc-du-thi-truc-tuyen-thi-lop-10-hnm-1623109294-35-width1200height768.jpg\",\"_token\":\"WcF2ijnjBvXmRTAnp9aiP0rZ7lu7oUjbTj6rSUSk\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/posts\"}', '2021-06-14 06:05:29', '2021-06-14 06:05:29'),
(988, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-14 06:05:29', '2021-06-14 06:05:29'),
(989, 1, 'admin/posts/15/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-14 06:05:51', '2021-06-14 06:05:51'),
(990, 1, 'admin/posts/15', 'PUT', '::1', '{\"title\":\"Thi v\\u00e0o l\\u1edbp 10: H\\u00e0 N\\u1ed9i huy \\u0111\\u1ed9ng h\\u01a1n 500 thanh tra, ng\\u00e0y 11\\/6, th\\u00ed sinh l\\u00e0m th\\u1ee7 t\\u1ee5c d\\u1ef1 thi tr\\u1ef1c tuy\\u1ebfn\",\"slug\":\"thi-vao-lop-10-ha-noi-huy-dong-hon-500-thanh-tra-ngay-11-6-thi-sinh-lam-thu-tuc-du-thi-truc-tuyen-2\",\"desc_short\":\"L\\u1ef1c l\\u01b0\\u1ee3ng thanh tra l\\u00e0m nhi\\u1ec7m v\\u1ee5 c\\u1eafm ch\\u1ed1t t\\u1ea1i 184 \\u0111i\\u1ec3m thi v\\u00e0o l\\u1edbp 10 trung h\\u1ecdc ph\\u1ed5 th\\u00f4ng c\\u00f4ng l\\u1eadp n\\u0103m h\\u1ecdc 2021-2022 tr\\u00ean \\u0111\\u1ecba b\\u00e0n th\\u00e0nh ph\\u1ed1 H\\u00e0 N\\u1ed9i.\",\"body\":\"<p>\\u0110\\u1ec3 chu\\u1ea9n b\\u1ecb t\\u1ed5 ch\\u1ee9c k\\u1ef3 thi&nbsp;<a href=\\\"https:\\/\\/www.24h.com.vn\\/tuyen-sinh-dh-cd-c365.html\\\" title=\\\"tuy\\u1ec3n sinh\\\">tuy\\u1ec3n sinh<\\/a>&nbsp;v&agrave;o l\\u1edbp 10 trung h\\u1ecdc ph\\u1ed5 th&ocirc;ng c&ocirc;ng l\\u1eadp n\\u0103m h\\u1ecdc 2021-2022, S\\u1edf&nbsp;<a href=\\\"https:\\/\\/www.24h.com.vn\\/giao-duc-du-hoc-c216.html\\\" title=\\\"Gi\\u00e1o d\\u1ee5c\\\">Gi&aacute;o d\\u1ee5c<\\/a>&nbsp;v&agrave; \\u0110&agrave;o t\\u1ea1o H&agrave; N\\u1ed9i \\u0111&atilde; huy \\u0111\\u1ed9ng h\\u01a1n 500 thanh tra. L\\u1ef1c l\\u01b0\\u1ee3ng thanh tra l&agrave;m nhi\\u1ec7m v\\u1ee5 c\\u1eafm ch\\u1ed1t t\\u1ea1i 184 \\u0111i\\u1ec3m thi v&agrave;o l\\u1edbp 10 trung h\\u1ecdc ph\\u1ed5 th&ocirc;ng c&ocirc;ng l\\u1eadp n\\u0103m h\\u1ecdc 2021-2022 tr&ecirc;n \\u0111\\u1ecba b&agrave;n th&agrave;nh ph\\u1ed1 H&agrave; N\\u1ed9i.<\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p><img alt=\\\"Thi v\\u00e0o l\\u1edbp 10: H\\u00e0 N\\u1ed9i huy \\u0111\\u1ed9ng h\\u01a1n 500 thanh tra, ng\\u00e0y 11\\/6, th\\u00ed sinh l\\u00e0m th\\u1ee7 t\\u1ee5c d\\u1ef1 thi tr\\u1ef1c tuy\\u1ebfn - 1\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/2-2021\\/images\\/2021-06-08\\/Thi-vao-lop-10-Ha-Noi-huy-dong-hon-500-thanh-tra-ngay-11-6-thi-sinh-lam-thu-tuc-du-thi-truc-tuyen-thi-lop-10-hnm-1623109294-35-width1200height768.jpg\\\" style=\\\"width:660px\\\" \\/><\\/p>\\r\\n\\r\\n<p>&nbsp;<\\/p>\\r\\n\\r\\n<p>\\u1ea2nh: TTX.<\\/p>\\r\\n\\r\\n<p>Ngo&agrave;i ra, S\\u1edf Gi&aacute;o d\\u1ee5c v&agrave; \\u0110&agrave;o t\\u1ea1o H&agrave; N\\u1ed9i c&ograve;n th&agrave;nh l\\u1eadp 16 t\\u1ed5 gi&aacute;m s&aacute;t (m\\u1ed7i t\\u1ed5 c&oacute; 3 th&agrave;nh vi&ecirc;n), c&oacute; nhi\\u1ec7m v\\u1ee5 gi&aacute;m s&aacute;t ho\\u1ea1t \\u0111\\u1ed9ng c\\u1ee7a \\u0111o&agrave;n thanh tra t\\u1ea1i c&aacute;c \\u0111i\\u1ec3m thi.<\\/p>\\r\\n\\r\\n<p>Ngo&agrave;i c&aacute;c n\\u1ed9i dung v\\u1ec1 chuy&ecirc;n m&ocirc;n, c&ocirc;ng t&aacute;c thanh tra k\\u1ef3 thi n\\u0103m nay c&oacute; th&ecirc;m n\\u1ed9i dung v\\u1ec1 vi\\u1ec7c chu\\u1ea9n b\\u1ecb, th\\u1ef1c hi\\u1ec7n c&aacute;c quy \\u0111\\u1ecbnh ph&ograve;ng, ch\\u1ed1ng d\\u1ecbch COVID-19 c\\u1ee7a c&aacute;c th&agrave;nh vi&ecirc;n t\\u1ea1i c&aacute;c \\u0111i\\u1ec3m thi.<\\/p>\\r\\n\\r\\n<p>\\u0110\\u1ec3 b\\u1ea3o \\u0111\\u1ea3m an to&agrave;n cho th&iacute; sinh d\\u1ef1 thi, l\\u1ef1c l\\u01b0\\u1ee3ng thanh tra s\\u1ebd thanh tra vi\\u1ec7c b\\u1ed1 tr&iacute; khu v\\u1ef1c thi, ph&ograve;ng thi, ch\\u1ed7 ng\\u1ed3i c\\u1ee7a th&iacute; sinh nh\\u1eb1m b\\u1ea3o \\u0111\\u1ea3m an to&agrave;n ph&ograve;ng, ch\\u1ed1ng d\\u1ecbch COVID-19; c&ocirc;ng t&aacute;c v\\u1ec7 sinh an to&agrave;n th\\u1ef1c ph\\u1ea9m, y t\\u1ebf, \\u0111i\\u1ec7n, n\\u01b0\\u1edbc v&agrave; c&aacute;c ph\\u01b0\\u01a1ng &aacute;n x\\u1eed l&yacute; c&aacute;c t&igrave;nh hu\\u1ed1ng b\\u1ea5t th\\u01b0\\u1eddng t\\u1ea1i \\u0111i\\u1ec3m thi.<\\/p>\\r\\n\\r\\n<p>Vi\\u1ec7c th&agrave;nh l\\u1eadp l\\u1ef1c l\\u01b0\\u1ee3ng thanh tra k\\u1ef3 thi nh\\u1eb1m gi&uacute;p c\\u01a1 quan, t\\u1ed5 ch\\u1ee9c, c&aacute; nh&acirc;n tham gia k\\u1ef3 thi th\\u1ef1c hi\\u1ec7n \\u0111&uacute;ng quy ch\\u1ebf thi, c&aacute;c quy \\u0111\\u1ecbnh li&ecirc;n quan \\u0111\\u1ebfn vi\\u1ec7c t\\u1ed5 ch\\u1ee9c k\\u1ef3 thi v&agrave; c&aacute;c n\\u1ed9i dung ch\\u1ec9 \\u0111\\u1ea1o c\\u1ee7a B\\u1ed9 Gi&aacute;o d\\u1ee5c v&agrave; \\u0110&agrave;o t\\u1ea1o, UBND th&agrave;nh ph\\u1ed1 H&agrave; N\\u1ed9i, S\\u1edf Gi&aacute;o d\\u1ee5c v&agrave; \\u0110&agrave;o t\\u1ea1o H&agrave; N\\u1ed9i, g&oacute;p ph\\u1ea7n b\\u1ea3o \\u0111\\u1ea3m cho k\\u1ef3 thi di\\u1ec5n ra an to&agrave;n, nghi&ecirc;m t&uacute;c, \\u0111&uacute;ng quy \\u0111\\u1ecbnh.<\\/p>\\r\\n\\r\\n<p><strong>Th&iacute; sinh l&agrave;m th\\u1ee7 t\\u1ee5c d\\u1ef1 thi theo h&igrave;nh th\\u1ee9c tr\\u1ef1c tuy\\u1ebfn<\\/strong><\\/p>\\r\\n\\r\\n<p>M\\u1ed9t trong nh\\u1eefng n\\u1ed9i dung quan tr\\u1ecdng kh&aacute;c c\\u0169ng \\u0111\\u01b0\\u1ee3c UBND th&agrave;nh ph\\u1ed1 H&agrave; N\\u1ed9i quy\\u1ebft \\u0111\\u1ecbnh \\u0111i\\u1ec1u ch\\u1ec9nh l&agrave; t\\u1ed5 ch\\u1ee9c cho th&iacute; sinh l&agrave;m th\\u1ee7 t\\u1ee5c d\\u1ef1 thi theo h&igrave;nh th\\u1ee9c tr\\u1ef1c tuy\\u1ebfn.<\\/p>\\r\\n\\r\\n<p>C\\u1ee5 th\\u1ec3, theo th&ocirc;ng b&aacute;o c\\u1ee7a S\\u1edf Gi&aacute;o d\\u1ee5c v&agrave; \\u0110&agrave;o t\\u1ea1o H&agrave; N\\u1ed9i, ng&agrave;y 11\\/6\\/2021, th&iacute; sinh s\\u1ebd l&agrave;m th\\u1ee7 t\\u1ee5c d\\u1ef1 thi v&agrave;o l\\u1edbp 10 theo h&igrave;nh th\\u1ee9c tr\\u1ef1c tuy\\u1ebfn t\\u1ea1i c&aacute;c tr\\u01b0\\u1eddng trung h\\u1ecdc c\\u01a1 s\\u1edf, thay cho h&igrave;nh th\\u1ee9c tr\\u1ef1c ti\\u1ebfp nh\\u01b0 k\\u1ebf ho\\u1ea1ch \\u0111&atilde; c&ocirc;ng b\\u1ed1.<\\/p>\\r\\n\\r\\n<p>\\u0110\\u1ec3 b\\u1ea3o \\u0111\\u1ea3m an to&agrave;n ph&ograve;ng, ch\\u1ed1ng d\\u1ecbch, c&aacute;c ph&ograve;ng gi&aacute;o d\\u1ee5c v&agrave; \\u0111&agrave;o t\\u1ea1o qu\\u1eadn, huy\\u1ec7n, th\\u1ecb x&atilde; c&oacute; tr&aacute;ch nhi\\u1ec7m ch\\u1ec9 \\u0111\\u1ea1o c&aacute;c tr\\u01b0\\u1eddng trung h\\u1ecdc c\\u01a1 s\\u1edf thu\\u1ed9c ph\\u1ea1m vi qu\\u1ea3n l&yacute; l\\u1ef1a ch\\u1ecdn th\\u1eddi gian h\\u1ee3p l&yacute; trong ng&agrave;y \\u0111\\u1ec3 t\\u1ed5 ch\\u1ee9c cho h\\u1ecdc sinh l&agrave;m th\\u1ee7 t\\u1ee5c d\\u1ef1 thi theo h&igrave;nh th\\u1ee9c tr\\u1ef1c tuy\\u1ebfn.<\\/p>\\r\\n\\r\\n<p>S\\u1edf c\\u0169ng khuy\\u1ebfn kh&iacute;ch c&aacute;c nh&agrave; tr\\u01b0\\u1eddng t\\u1ea1o \\u0111i\\u1ec1u ki\\u1ec7n \\u0111\\u1ec3 ph\\u1ee5 huynh c&ugrave;ng tham gia \\u0111\\u1ec3 n\\u1eafm ch\\u1eafc c&aacute;c quy \\u0111\\u1ecbnh li&ecirc;n quan \\u0111\\u1ebfn k\\u1ef3 thi v&agrave; c&ugrave;ng th\\u1ef1c hi\\u1ec7n t\\u1ed1t, v\\u1edbi m\\u1ee5c ti&ecirc;u b\\u1ea3o \\u0111\\u1ea3m an to&agrave;n cao nh\\u1ea5t cho th&iacute; sinh tham d\\u1ef1 k\\u1ef3 thi.<\\/p>\\r\\n\\r\\n<p>\\u0110\\u1ec3 tr&aacute;nh x\\u1ea3y ra nh\\u1ea7m l\\u1eabn, S\\u1edf Gi&aacute;o d\\u1ee5c v&agrave; \\u0110&agrave;o t\\u1ea1o H&agrave; N\\u1ed9i y&ecirc;u c\\u1ea7u c&aacute;c ph&ograve;ng gi&aacute;o d\\u1ee5c v&agrave; \\u0111&agrave;o t\\u1ea1o qu\\u1eadn, huy\\u1ec7n, th\\u1ecb x&atilde; nh\\u1eafc nh\\u1edf c&aacute;c nh&agrave; tr\\u01b0\\u1eddng th&ocirc;ng tin c\\u1ee5 th\\u1ec3 cho t\\u1ea5t c\\u1ea3 th&iacute; sinh tham d\\u1ef1 k\\u1ef3 thi v\\u1ec1 quy \\u0111\\u1ecbnh m\\u1edbi n&agrave;y.<\\/p>\\r\\n\\r\\n<p>T\\u1ea1i bu\\u1ed5i l&agrave;m th\\u1ee7 t\\u1ee5c d\\u1ef1 thi, c&aacute;c th&iacute; sinh c\\u1ea7n nh\\u1edb r&agrave; so&aacute;t l\\u1ea1i m\\u1ed9t l\\u1ea7n n\\u1eefa c&aacute;c th&ocirc;ng tin trong phi\\u1ebfu \\u0111\\u0103ng k&yacute; d\\u1ef1 thi; nghe ph\\u1ed5 bi\\u1ebfn quy ch\\u1ebf thi, l\\u1ecbch thi \\u0111\\u1ec3 th\\u1ef1c hi\\u1ec7n nghi&ecirc;m t&uacute;c.<\\/p>\\r\\n\\r\\n<p>K\\u1ef3 thi tuy\\u1ec3n sinh v&agrave;o l\\u1edbp 10 t\\u1ea1i H&agrave; N\\u1ed9i di\\u1ec5n ra v&agrave;o ng&agrave;y 12 v&agrave; 13\\/6\\/2021, v\\u1edbi s\\u1ef1 tham gia c\\u1ee7a h\\u01a1n 93.000 th&iacute; sinh.<\\/p>\\r\\n\\r\\n<p>Ngu\\u1ed3n: http:\\/\\/danviet.vn\\/thi-vao-lop-10-ha-noi-huy-dong-hon-500-thanh-tra-ngay-11-6-thi-sinh-lam-thu-tuc-du-thi-truc-tuyen-50202186722952.htm<\\/p>\",\"category\":[\"3\",null],\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/storage\\/app\\/public\\/images\\/blog\\/Thi-vao-lop-10-Ha-Noi-huy-dong-hon-500-thanh-tra-ngay-11-6-thi-sinh-lam-thu-tuc-du-thi-truc-tuyen-thi-lop-10-hnm-1623109294-35-width1200height768.jpg\",\"_token\":\"WcF2ijnjBvXmRTAnp9aiP0rZ7lu7oUjbTj6rSUSk\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/posts\"}', '2021-06-14 06:05:59', '2021-06-14 06:05:59'),
(991, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-14 06:05:59', '2021-06-14 06:05:59'),
(992, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-14 08:18:01', '2021-06-14 08:18:01'),
(993, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-14 08:59:32', '2021-06-14 08:59:32'),
(994, 1, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"3\",\"_model\":\"App_Models_User\",\"_token\":\"WcF2ijnjBvXmRTAnp9aiP0rZ7lu7oUjbTj6rSUSk\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-06-14 08:59:36', '2021-06-14 08:59:36'),
(995, 1, 'admin/users/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-14 09:00:02', '2021-06-14 09:00:02'),
(996, 1, 'admin/users/3', 'DELETE', '::1', '{\"_method\":\"delete\",\"_token\":\"WcF2ijnjBvXmRTAnp9aiP0rZ7lu7oUjbTj6rSUSk\"}', '2021-06-14 09:00:05', '2021-06-14 09:00:05'),
(997, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-14 09:00:05', '2021-06-14 09:00:05'),
(998, 1, 'admin', 'GET', '::1', '[]', '2021-06-16 03:20:31', '2021-06-16 03:20:31'),
(999, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-16 03:20:46', '2021-06-16 03:20:46'),
(1000, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 03:28:50', '2021-06-16 03:28:50'),
(1001, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 03:29:01', '2021-06-16 03:29:01'),
(1002, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 03:29:09', '2021-06-16 03:29:09'),
(1003, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 03:30:07', '2021-06-16 03:30:07'),
(1004, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 03:30:10', '2021-06-16 03:30:10'),
(1005, 1, 'admin/auth/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-16 03:31:51', '2021-06-16 03:31:51'),
(1006, 1, 'admin/auth/roles', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-16 03:32:05', '2021-06-16 03:32:05'),
(1007, 1, 'admin/auth/permissions', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-16 03:32:13', '2021-06-16 03:32:13'),
(1008, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-16 03:32:20', '2021-06-16 03:32:20'),
(1009, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-16 03:32:26', '2021-06-16 03:32:26'),
(1010, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-16 03:32:30', '2021-06-16 03:32:30'),
(1011, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 03:33:07', '2021-06-16 03:33:07'),
(1012, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 03:34:24', '2021-06-16 03:34:24'),
(1013, 1, 'admin/posts', 'GET', '::1', '{\"_sort\":{\"column\":\"category\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-06-16 03:34:27', '2021-06-16 03:34:27'),
(1014, 1, 'admin/posts', 'GET', '::1', '{\"_sort\":{\"column\":\"category\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-06-16 03:34:27', '2021-06-16 03:34:27'),
(1015, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-16 03:34:52', '2021-06-16 03:34:52'),
(1016, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 03:36:14', '2021-06-16 03:36:14'),
(1017, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 03:36:28', '2021-06-16 03:36:28'),
(1018, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 03:52:51', '2021-06-16 03:52:51'),
(1019, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 03:53:23', '2021-06-16 03:53:23'),
(1020, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 03:53:38', '2021-06-16 03:53:38'),
(1021, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 03:53:43', '2021-06-16 03:53:43'),
(1022, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 03:54:00', '2021-06-16 03:54:00'),
(1023, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 03:54:12', '2021-06-16 03:54:12'),
(1024, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 03:55:38', '2021-06-16 03:55:38'),
(1025, 1, 'admin/posts', 'GET', '::1', '{\"category\":\"tin t\\u1ee9c\",\"_pjax\":\"#pjax-container\"}', '2021-06-16 03:55:48', '2021-06-16 03:55:48'),
(1026, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-16 03:55:59', '2021-06-16 03:55:59'),
(1027, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 03:56:20', '2021-06-16 03:56:20'),
(1028, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 04:01:22', '2021-06-16 04:01:22'),
(1029, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 04:01:50', '2021-06-16 04:01:50'),
(1030, 1, 'admin/posts', 'GET', '::1', '{\"category\":[\"0\"],\"_pjax\":\"#pjax-container\"}', '2021-06-16 04:01:57', '2021-06-16 04:01:57'),
(1031, 1, 'admin/posts', 'GET', '::1', '{\"category\":[\"0\"]}', '2021-06-16 04:04:23', '2021-06-16 04:04:23'),
(1032, 1, 'admin/posts', 'GET', '::1', '{\"category\":[\"0\"]}', '2021-06-16 04:04:36', '2021-06-16 04:04:36'),
(1033, 1, 'admin/posts', 'GET', '::1', '{\"category\":[\"0\"]}', '2021-06-16 04:04:42', '2021-06-16 04:04:42'),
(1034, 1, 'admin/posts', 'GET', '::1', '{\"category\":[\"0\"]}', '2021-06-16 04:52:51', '2021-06-16 04:52:51'),
(1035, 1, 'admin/posts', 'GET', '::1', '{\"category\":[\"0\"]}', '2021-06-16 04:52:57', '2021-06-16 04:52:57'),
(1036, 1, 'admin/posts', 'GET', '::1', '{\"category\":[\"0\"],\"_scope_\":\"trashed\",\"_pjax\":\"#pjax-container\"}', '2021-06-16 04:53:07', '2021-06-16 04:53:07'),
(1037, 1, 'admin/posts/18', 'DELETE', '::1', '{\"_method\":\"delete\",\"_token\":\"9ujPi4ghIUKBKgGzUhwgJWWZAlZPH6eol12HyBXQ\"}', '2021-06-16 04:53:17', '2021-06-16 04:53:17'),
(1038, 1, 'admin/posts', 'GET', '::1', '{\"category\":[\"0\"],\"_scope_\":\"trashed\",\"_pjax\":\"#pjax-container\"}', '2021-06-16 04:53:18', '2021-06-16 04:53:18'),
(1039, 1, 'admin/posts', 'GET', '::1', '{\"category\":[\"0\"],\"_scope_\":\"trashed\",\"_pjax\":\"#pjax-container\"}', '2021-06-16 04:53:23', '2021-06-16 04:53:23'),
(1040, 1, 'admin/posts', 'GET', '::1', '{\"category\":[\"0\"],\"_pjax\":\"#pjax-container\"}', '2021-06-16 04:53:24', '2021-06-16 04:53:24'),
(1041, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-16 04:53:31', '2021-06-16 04:53:31'),
(1042, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-16 04:53:31', '2021-06-16 04:53:31'),
(1043, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-16 04:53:36', '2021-06-16 04:53:36'),
(1044, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 05:00:26', '2021-06-16 05:00:26'),
(1045, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 06:46:54', '2021-06-16 06:46:54'),
(1046, 1, 'admin/posts', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-06-16 06:46:57', '2021-06-16 06:46:57'),
(1047, 1, 'admin/posts', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-06-16 06:46:59', '2021-06-16 06:46:59'),
(1048, 1, 'admin/posts', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-06-16 06:47:02', '2021-06-16 06:47:02'),
(1049, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-16 06:47:05', '2021-06-16 06:47:05'),
(1050, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 06:50:12', '2021-06-16 06:50:12'),
(1051, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 06:51:08', '2021-06-16 06:51:08'),
(1052, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 06:51:15', '2021-06-16 06:51:15'),
(1053, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 06:51:32', '2021-06-16 06:51:32'),
(1054, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 06:53:38', '2021-06-16 06:53:38'),
(1055, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 06:54:14', '2021-06-16 06:54:14'),
(1056, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 06:54:17', '2021-06-16 06:54:17'),
(1057, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 06:54:31', '2021-06-16 06:54:31'),
(1058, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 06:54:44', '2021-06-16 06:54:44'),
(1059, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 06:55:02', '2021-06-16 06:55:02'),
(1060, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 06:55:24', '2021-06-16 06:55:24'),
(1061, 1, 'admin/category', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-16 06:58:48', '2021-06-16 06:58:48'),
(1062, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-16 06:59:43', '2021-06-16 06:59:43'),
(1063, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 06:59:52', '2021-06-16 06:59:52'),
(1064, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 06:59:54', '2021-06-16 06:59:54'),
(1065, 1, 'admin/category', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-16 06:59:56', '2021-06-16 06:59:56'),
(1066, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-16 06:59:58', '2021-06-16 06:59:58'),
(1067, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 07:00:29', '2021-06-16 07:00:29'),
(1068, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 07:01:03', '2021-06-16 07:01:03'),
(1069, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 07:01:45', '2021-06-16 07:01:45'),
(1070, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 07:01:56', '2021-06-16 07:01:56'),
(1071, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 07:02:15', '2021-06-16 07:02:15'),
(1072, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 07:06:24', '2021-06-16 07:06:24'),
(1073, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 07:06:41', '2021-06-16 07:06:41'),
(1074, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 07:07:09', '2021-06-16 07:07:09'),
(1075, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 07:07:29', '2021-06-16 07:07:29'),
(1076, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 07:08:26', '2021-06-16 07:08:26'),
(1077, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 07:08:35', '2021-06-16 07:08:35'),
(1078, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 07:08:50', '2021-06-16 07:08:50'),
(1079, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 07:09:01', '2021-06-16 07:09:01'),
(1080, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-16 07:09:09', '2021-06-16 07:09:09'),
(1081, 1, 'admin/category', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-16 07:09:36', '2021-06-16 07:09:36'),
(1082, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-16 07:10:01', '2021-06-16 07:10:01'),
(1083, 1, 'admin/users', 'GET', '::1', '[]', '2021-06-16 07:18:55', '2021-06-16 07:18:55'),
(1084, 1, 'admin/users', 'GET', '::1', '[]', '2021-06-16 07:19:13', '2021-06-16 07:19:13'),
(1085, 1, 'admin/users', 'GET', '::1', '[]', '2021-06-16 07:19:45', '2021-06-16 07:19:45'),
(1086, 1, 'admin/users', 'GET', '::1', '[]', '2021-06-16 07:20:08', '2021-06-16 07:20:08'),
(1087, 1, 'admin/users', 'GET', '::1', '[]', '2021-06-16 07:24:23', '2021-06-16 07:24:23'),
(1088, 1, 'admin/users', 'GET', '::1', '{\"ID\":null,\"name\":null,\"email\":null,\"97c1c60f34e8532d56c498ffb8d5dd9b\":\"034\",\"_pjax\":\"#pjax-container\"}', '2021-06-16 07:24:30', '2021-06-16 07:24:30'),
(1089, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"ID\":null,\"name\":null,\"email\":null,\"97c1c60f34e8532d56c498ffb8d5dd9b\":\"10123\"}', '2021-06-16 07:24:39', '2021-06-16 07:24:39'),
(1090, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"ID\":null,\"name\":null,\"email\":null,\"97c1c60f34e8532d56c498ffb8d5dd9b\":null}', '2021-06-16 07:24:43', '2021-06-16 07:24:43'),
(1091, 1, 'admin/users/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-16 07:24:50', '2021-06-16 07:24:50'),
(1092, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-16 07:25:06', '2021-06-16 07:25:06'),
(1093, 1, 'admin/users', 'GET', '::1', '[]', '2021-06-16 07:26:18', '2021-06-16 07:26:18'),
(1094, 1, 'admin/users', 'GET', '::1', '[]', '2021-06-16 07:26:29', '2021-06-16 07:26:29'),
(1095, 1, 'admin/users', 'GET', '::1', '[]', '2021-06-16 07:27:49', '2021-06-16 07:27:49'),
(1096, 1, 'admin/users', 'GET', '::1', '[]', '2021-06-16 07:29:00', '2021-06-16 07:29:00'),
(1097, 1, 'admin/users', 'GET', '::1', '[]', '2021-06-16 07:29:15', '2021-06-16 07:29:15'),
(1098, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-16 09:47:30', '2021-06-16 09:47:30'),
(1099, 1, 'admin/helpers/scaffold', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-16 09:49:31', '2021-06-16 09:49:31'),
(1100, 1, 'admin/helpers/terminal/database', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-16 10:18:13', '2021-06-16 10:18:13'),
(1101, 1, 'admin/helpers/terminal/database', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-16 10:18:13', '2021-06-16 10:18:13'),
(1102, 1, 'admin/helpers/terminal/artisan', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-16 10:18:19', '2021-06-16 10:18:19'),
(1103, 1, 'admin/helpers/routes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-16 10:18:28', '2021-06-16 10:18:28'),
(1104, 1, 'admin/auth/setting', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-16 10:19:29', '2021-06-16 10:19:29'),
(1105, 1, 'admin/auth/setting', 'GET', '::1', '[]', '2021-06-16 10:21:04', '2021-06-16 10:21:04'),
(1106, 1, 'admin/auth/setting', 'GET', '::1', '[]', '2021-06-16 10:21:39', '2021-06-16 10:21:39'),
(1107, 1, 'admin/auth/setting', 'GET', '::1', '[]', '2021-06-16 10:21:45', '2021-06-16 10:21:45'),
(1108, 1, 'admin/auth/setting', 'GET', '::1', '[]', '2021-06-16 10:21:53', '2021-06-16 10:21:53'),
(1109, 1, 'admin', 'GET', '::1', '[]', '2021-06-17 04:45:49', '2021-06-17 04:45:49'),
(1110, 1, 'admin', 'GET', '::1', '[]', '2021-06-17 04:45:49', '2021-06-17 04:45:49'),
(1111, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-17 05:26:18', '2021-06-17 05:26:18'),
(1112, 1, 'admin/posts/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-17 05:26:25', '2021-06-17 05:26:25'),
(1113, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-17 05:32:32', '2021-06-17 05:32:32'),
(1114, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-17 06:02:43', '2021-06-17 06:02:43'),
(1115, 1, 'admin', 'GET', '::1', '[]', '2021-06-20 05:57:10', '2021-06-20 05:57:10'),
(1116, 1, 'admin', 'GET', '::1', '[]', '2021-06-20 05:57:10', '2021-06-20 05:57:10'),
(1117, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 05:57:48', '2021-06-20 05:57:48'),
(1118, 1, 'admin/auth/menu/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 05:57:56', '2021-06-20 05:57:56'),
(1119, 1, 'admin/auth/menu/14', 'PUT', '::1', '{\"parent_id\":\"15\",\"title\":\"B\\u00e0i vi\\u1ebft\",\"icon\":\"fa-thumb-tack\",\"uri\":\"\\/posts\",\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"SavSXbpUpPjjpt9UT9fKy71otdAR0U6Tf6lWPf2k\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/auth\\/menu\"}', '2021-06-20 05:58:14', '2021-06-20 05:58:14'),
(1120, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-20 05:58:15', '2021-06-20 05:58:15'),
(1121, 1, 'admin/auth/menu/16/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 05:58:19', '2021-06-20 05:58:19'),
(1122, 1, 'admin/auth/menu/16', 'PUT', '::1', '{\"parent_id\":\"15\",\"title\":\"Danh m\\u1ee5c\",\"icon\":\"fa-bars\",\"uri\":\"\\/category\",\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"SavSXbpUpPjjpt9UT9fKy71otdAR0U6Tf6lWPf2k\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/auth\\/menu\"}', '2021-06-20 05:58:27', '2021-06-20 05:58:27'),
(1123, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-20 05:58:27', '2021-06-20 05:58:27'),
(1124, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-20 05:58:33', '2021-06-20 05:58:33'),
(1125, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 05:58:39', '2021-06-20 05:58:39'),
(1126, 1, 'admin/posts/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 06:00:53', '2021-06-20 06:00:53'),
(1127, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-20 06:04:13', '2021-06-20 06:04:13'),
(1128, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-20 06:05:54', '2021-06-20 06:05:54'),
(1129, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 06:08:07', '2021-06-20 06:08:07'),
(1130, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-20 06:08:34', '2021-06-20 06:08:34'),
(1131, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-20 06:13:30', '2021-06-20 06:13:30'),
(1132, 1, 'admin/posts/7', 'PUT', '::1', '{\"hot\":\"1\",\"_token\":\"SavSXbpUpPjjpt9UT9fKy71otdAR0U6Tf6lWPf2k\",\"_method\":\"PUT\"}', '2021-06-20 06:13:36', '2021-06-20 06:13:36'),
(1133, 1, 'admin/posts/7', 'PUT', '::1', '{\"hot\":\"0\",\"_token\":\"SavSXbpUpPjjpt9UT9fKy71otdAR0U6Tf6lWPf2k\",\"_method\":\"PUT\"}', '2021-06-20 06:13:37', '2021-06-20 06:13:37'),
(1134, 1, 'admin/posts/7', 'PUT', '::1', '{\"new\":\"1\",\"_token\":\"SavSXbpUpPjjpt9UT9fKy71otdAR0U6Tf6lWPf2k\",\"_method\":\"PUT\"}', '2021-06-20 06:13:52', '2021-06-20 06:13:52'),
(1135, 1, 'admin/posts/7', 'PUT', '::1', '{\"hot\":\"1\",\"_token\":\"SavSXbpUpPjjpt9UT9fKy71otdAR0U6Tf6lWPf2k\",\"_method\":\"PUT\"}', '2021-06-20 06:13:54', '2021-06-20 06:13:54'),
(1136, 1, 'admin/posts/7', 'PUT', '::1', '{\"recommend\":\"1\",\"_token\":\"SavSXbpUpPjjpt9UT9fKy71otdAR0U6Tf6lWPf2k\",\"_method\":\"PUT\"}', '2021-06-20 06:13:55', '2021-06-20 06:13:55'),
(1137, 1, 'admin/posts/7', 'PUT', '::1', '{\"recommend\":\"0\",\"_token\":\"SavSXbpUpPjjpt9UT9fKy71otdAR0U6Tf6lWPf2k\",\"_method\":\"PUT\"}', '2021-06-20 06:13:56', '2021-06-20 06:13:56'),
(1138, 1, 'admin/posts/7', 'PUT', '::1', '{\"new\":\"0\",\"_token\":\"SavSXbpUpPjjpt9UT9fKy71otdAR0U6Tf6lWPf2k\",\"_method\":\"PUT\"}', '2021-06-20 06:13:57', '2021-06-20 06:13:57'),
(1139, 1, 'admin/posts/7', 'PUT', '::1', '{\"hot\":\"0\",\"_token\":\"SavSXbpUpPjjpt9UT9fKy71otdAR0U6Tf6lWPf2k\",\"_method\":\"PUT\"}', '2021-06-20 06:13:57', '2021-06-20 06:13:57'),
(1140, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-20 06:14:15', '2021-06-20 06:14:15'),
(1141, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-20 06:15:41', '2021-06-20 06:15:41'),
(1142, 1, 'admin/posts/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 06:15:58', '2021-06-20 06:15:58'),
(1143, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 06:16:01', '2021-06-20 06:16:01'),
(1144, 1, 'admin/posts', 'GET', '::1', '{\"_columns_\":\"category,desc_short,id,title\",\"_pjax\":\"#pjax-container\"}', '2021-06-20 06:16:14', '2021-06-20 06:16:14'),
(1145, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 06:16:18', '2021-06-20 06:16:18'),
(1146, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-20 06:17:19', '2021-06-20 06:17:19'),
(1147, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-20 06:17:50', '2021-06-20 06:17:50'),
(1148, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-20 06:18:29', '2021-06-20 06:18:29'),
(1149, 1, 'admin/posts/7/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 06:24:40', '2021-06-20 06:24:40'),
(1150, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-20 06:24:48', '2021-06-20 06:24:48'),
(1151, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-20 06:24:56', '2021-06-20 06:24:56'),
(1152, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 06:25:11', '2021-06-20 06:25:11'),
(1153, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-20 06:27:18', '2021-06-20 06:27:18'),
(1154, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-20 06:27:23', '2021-06-20 06:27:23'),
(1155, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-20 06:28:15', '2021-06-20 06:28:15'),
(1156, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-20 06:28:39', '2021-06-20 06:28:39'),
(1157, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-20 06:28:51', '2021-06-20 06:28:51'),
(1158, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-20 06:29:00', '2021-06-20 06:29:00'),
(1159, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-20 06:29:31', '2021-06-20 06:29:31'),
(1160, 1, 'admin/posts', 'GET', '::1', '{\"created_at\":{\"start\":null,\"end\":null},\"_pjax\":\"#pjax-container\"}', '2021-06-20 06:29:36', '2021-06-20 06:29:36'),
(1161, 1, 'admin/posts/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 06:31:50', '2021-06-20 06:31:50'),
(1162, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 06:33:06', '2021-06-20 06:33:06'),
(1163, 1, 'admin/posts/7/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 06:33:11', '2021-06-20 06:33:11'),
(1164, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-20 06:39:05', '2021-06-20 06:39:05'),
(1165, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-20 06:40:47', '2021-06-20 06:40:47'),
(1166, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-20 06:41:11', '2021-06-20 06:41:11'),
(1167, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 06:41:21', '2021-06-20 06:41:21'),
(1168, 1, 'admin/posts/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 06:41:23', '2021-06-20 06:41:23'),
(1169, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-20 06:51:18', '2021-06-20 06:51:18'),
(1170, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-20 06:52:03', '2021-06-20 06:52:03'),
(1171, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-20 06:52:24', '2021-06-20 06:52:24'),
(1172, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-20 06:53:11', '2021-06-20 06:53:11'),
(1173, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-20 07:00:00', '2021-06-20 07:00:00'),
(1174, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 07:00:04', '2021-06-20 07:00:04'),
(1175, 1, 'admin/posts/7/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 07:00:22', '2021-06-20 07:00:22'),
(1176, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-20 07:03:44', '2021-06-20 07:03:44'),
(1177, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-20 07:04:03', '2021-06-20 07:04:03'),
(1178, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-20 07:13:56', '2021-06-20 07:13:56'),
(1179, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-20 07:15:35', '2021-06-20 07:15:35'),
(1180, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-20 07:17:07', '2021-06-20 07:17:07'),
(1181, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-20 07:17:08', '2021-06-20 07:17:08'),
(1182, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-20 07:17:31', '2021-06-20 07:17:31'),
(1183, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-20 07:17:41', '2021-06-20 07:17:41'),
(1184, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-20 07:17:57', '2021-06-20 07:17:57'),
(1185, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-20 07:19:45', '2021-06-20 07:19:45'),
(1186, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-20 07:20:35', '2021-06-20 07:20:35'),
(1187, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-20 07:29:33', '2021-06-20 07:29:33'),
(1188, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 07:29:38', '2021-06-20 07:29:38'),
(1189, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-20 07:44:35', '2021-06-20 07:44:35'),
(1190, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-20 07:44:56', '2021-06-20 07:44:56'),
(1191, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-20 07:45:23', '2021-06-20 07:45:23'),
(1192, 1, 'admin/posts/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 07:45:25', '2021-06-20 07:45:25'),
(1193, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 07:45:29', '2021-06-20 07:45:29'),
(1194, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"ID\":\"7\",\"title\":null}', '2021-06-20 07:55:27', '2021-06-20 07:55:27'),
(1195, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 07:55:36', '2021-06-20 07:55:36'),
(1196, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"ID\":\"7\",\"title\":null}', '2021-06-20 07:55:41', '2021-06-20 07:55:41'),
(1197, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 07:55:47', '2021-06-20 07:55:47'),
(1198, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-20 07:56:01', '2021-06-20 07:56:01'),
(1199, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 07:56:15', '2021-06-20 07:56:15'),
(1200, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"ID\":\"7\",\"title\":null}', '2021-06-20 07:56:18', '2021-06-20 07:56:18'),
(1201, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"ID\":\"7\"}', '2021-06-20 07:56:19', '2021-06-20 07:56:19'),
(1202, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"ID\":\"7\",\"_scope_\":\"trashed\"}', '2021-06-20 07:56:35', '2021-06-20 07:56:35'),
(1203, 1, 'admin/posts', 'GET', '::1', '{\"ID\":\"7\",\"_scope_\":\"trashed\"}', '2021-06-20 07:57:18', '2021-06-20 07:57:18'),
(1204, 1, 'admin/posts', 'GET', '::1', '{\"ID\":\"7\",\"_scope_\":\"trashed\"}', '2021-06-20 08:18:28', '2021-06-20 08:18:28'),
(1205, 1, 'admin/posts', 'GET', '::1', '{\"ID\":\"7\",\"_scope_\":\"trashed\"}', '2021-06-20 08:18:58', '2021-06-20 08:18:58'),
(1206, 1, 'admin/posts', 'GET', '::1', '{\"ID\":\"7\",\"_scope_\":\"trashed\"}', '2021-06-20 08:19:14', '2021-06-20 08:19:14'),
(1207, 1, 'admin/posts', 'GET', '::1', '{\"ID\":\"7\",\"_scope_\":\"trashed\"}', '2021-06-20 08:20:35', '2021-06-20 08:20:35'),
(1208, 1, 'admin/posts', 'GET', '::1', '{\"ID\":\"7\",\"_scope_\":\"trashed\",\"_pjax\":\"#pjax-container\"}', '2021-06-20 08:28:43', '2021-06-20 08:28:43'),
(1209, 1, 'admin/posts', 'GET', '::1', '{\"ID\":\"7\",\"_pjax\":\"#pjax-container\"}', '2021-06-20 08:28:49', '2021-06-20 08:28:49'),
(1210, 1, 'admin/posts/7', 'DELETE', '::1', '{\"_method\":\"delete\",\"_token\":\"SavSXbpUpPjjpt9UT9fKy71otdAR0U6Tf6lWPf2k\"}', '2021-06-20 08:29:05', '2021-06-20 08:29:05'),
(1211, 1, 'admin/posts', 'GET', '::1', '{\"ID\":\"7\",\"_pjax\":\"#pjax-container\"}', '2021-06-20 08:29:05', '2021-06-20 08:29:05'),
(1212, 1, 'admin/posts', 'GET', '::1', '{\"ID\":\"7\",\"_pjax\":\"#pjax-container\",\"_scope_\":\"trashed\"}', '2021-06-20 08:29:08', '2021-06-20 08:29:08'),
(1213, 1, 'admin/posts', 'GET', '::1', '{\"ID\":\"7\",\"_scope_\":\"trashed\"}', '2021-06-20 08:29:36', '2021-06-20 08:29:36'),
(1214, 1, 'admin/posts', 'GET', '::1', '{\"ID\":\"7\",\"_scope_\":\"trashed\"}', '2021-06-20 08:30:08', '2021-06-20 08:30:08'),
(1215, 1, 'admin/posts', 'GET', '::1', '{\"ID\":\"7\",\"_scope_\":\"trashed\"}', '2021-06-20 08:31:22', '2021-06-20 08:31:22'),
(1216, 1, 'admin/_handle_action_', 'POST', '::1', '{\"_model\":\"App_Models_Posts\",\"_key\":[\"7\"],\"_token\":\"SavSXbpUpPjjpt9UT9fKy71otdAR0U6Tf6lWPf2k\",\"_action\":\"App_Admin_Actions_Post_BatchRestore\",\"_input\":\"true\"}', '2021-06-20 08:31:44', '2021-06-20 08:31:44'),
(1217, 1, 'admin/posts', 'GET', '::1', '{\"ID\":\"7\",\"_scope_\":\"trashed\",\"_pjax\":\"#pjax-container\"}', '2021-06-20 08:31:45', '2021-06-20 08:31:45'),
(1218, 1, 'admin/posts', 'GET', '::1', '{\"ID\":\"7\",\"_pjax\":\"#pjax-container\"}', '2021-06-20 08:31:49', '2021-06-20 08:31:49'),
(1219, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 08:31:57', '2021-06-20 08:31:57'),
(1220, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-20 08:38:06', '2021-06-20 08:38:06'),
(1221, 1, 'admin/posts/7', 'DELETE', '::1', '{\"_method\":\"delete\",\"_token\":\"SavSXbpUpPjjpt9UT9fKy71otdAR0U6Tf6lWPf2k\"}', '2021-06-20 08:38:58', '2021-06-20 08:38:58'),
(1222, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 08:38:58', '2021-06-20 08:38:58'),
(1223, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"_scope_\":\"trashed\"}', '2021-06-20 08:39:01', '2021-06-20 08:39:01'),
(1224, 1, 'admin/_handle_action_', 'POST', '::1', '{\"_model\":\"App_Models_Posts\",\"_key\":[\"7\"],\"_token\":\"SavSXbpUpPjjpt9UT9fKy71otdAR0U6Tf6lWPf2k\",\"_action\":\"App_Admin_Actions_Post_BatchRestore\",\"_input\":\"true\"}', '2021-06-20 08:39:26', '2021-06-20 08:39:26'),
(1225, 1, 'admin/posts', 'GET', '::1', '{\"_scope_\":\"trashed\",\"_pjax\":\"#pjax-container\"}', '2021-06-20 08:39:26', '2021-06-20 08:39:26'),
(1226, 1, 'admin/posts', 'GET', '::1', '{\"_scope_\":\"trashed\"}', '2021-06-20 08:39:58', '2021-06-20 08:39:58'),
(1227, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 08:40:02', '2021-06-20 08:40:02'),
(1228, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-20 08:40:42', '2021-06-20 08:40:42'),
(1229, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 08:40:50', '2021-06-20 08:40:50'),
(1230, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"_scope_\":\"trashed\"}', '2021-06-20 08:40:53', '2021-06-20 08:40:53'),
(1231, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 08:40:55', '2021-06-20 08:40:55'),
(1232, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-20 08:46:09', '2021-06-20 08:46:09'),
(1233, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-20 08:51:07', '2021-06-20 08:51:07'),
(1234, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 08:54:01', '2021-06-20 08:54:01'),
(1235, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"ID\":\"7\",\"title\":null}', '2021-06-20 08:54:04', '2021-06-20 08:54:04'),
(1236, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"ID\":\"7\"}', '2021-06-20 08:54:06', '2021-06-20 08:54:06'),
(1237, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"ID\":\"7\"}', '2021-06-20 08:54:09', '2021-06-20 08:54:09'),
(1238, 1, 'admin/posts', 'GET', '::1', '{\"ID\":\"7\"}', '2021-06-20 09:10:11', '2021-06-20 09:10:11'),
(1239, 1, 'admin/posts/7/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 09:10:16', '2021-06-20 09:10:16'),
(1240, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-20 09:10:28', '2021-06-20 09:10:28'),
(1241, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 09:11:22', '2021-06-20 09:11:22'),
(1242, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 09:11:41', '2021-06-20 09:11:41'),
(1243, 1, 'admin/users', 'GET', '::1', '[]', '2021-06-20 09:12:03', '2021-06-20 09:12:03'),
(1244, 1, 'admin/users', 'GET', '::1', '[]', '2021-06-20 09:12:59', '2021-06-20 09:12:59'),
(1245, 1, 'admin/users', 'GET', '::1', '[]', '2021-06-20 09:14:03', '2021-06-20 09:14:03'),
(1246, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-20 09:14:08', '2021-06-20 09:14:08'),
(1247, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-20 09:14:21', '2021-06-20 09:14:21'),
(1248, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-20 09:14:40', '2021-06-20 09:14:40'),
(1249, 1, 'admin', 'GET', '::1', '[]', '2021-06-21 03:09:50', '2021-06-21 03:09:50'),
(1250, 1, 'admin/category', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-21 03:12:32', '2021-06-21 03:12:32'),
(1251, 1, 'admin/category/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-21 03:12:36', '2021-06-21 03:12:36');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1252, 1, 'admin/category', 'POST', '::1', '{\"title\":\"test\",\"slug\":null,\"_token\":\"yYCTcVpKUOJq6pVZgvdRfYaND7ghPYBl0kpsRUdS\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/category\"}', '2021-06-21 03:12:43', '2021-06-21 03:12:43'),
(1253, 1, 'admin/category', 'GET', '::1', '[]', '2021-06-21 03:12:43', '2021-06-21 03:12:43'),
(1254, 1, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"5\",\"_model\":\"App_Models_CategoryPost\",\"_token\":\"yYCTcVpKUOJq6pVZgvdRfYaND7ghPYBl0kpsRUdS\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-06-21 03:12:53', '2021-06-21 03:12:53'),
(1255, 1, 'admin/category', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-21 03:12:53', '2021-06-21 03:12:53'),
(1256, 1, 'admin/category', 'GET', '::1', '[]', '2021-06-21 03:21:25', '2021-06-21 03:21:25'),
(1257, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-21 03:21:30', '2021-06-21 03:21:30'),
(1258, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-21 03:23:18', '2021-06-21 03:23:18'),
(1259, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-21 03:23:28', '2021-06-21 03:23:28'),
(1260, 1, 'admin/auth/menu/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-21 03:23:34', '2021-06-21 03:23:34'),
(1261, 1, 'admin/auth/menu/14', 'PUT', '::1', '{\"parent_id\":\"15\",\"title\":\"B\\u00e0i vi\\u1ebft\",\"icon\":\"fa-thumb-tack\",\"uri\":\"\\/bai-viet\",\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"yYCTcVpKUOJq6pVZgvdRfYaND7ghPYBl0kpsRUdS\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/auth\\/menu\"}', '2021-06-21 03:23:47', '2021-06-21 03:23:47'),
(1262, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-21 03:23:47', '2021-06-21 03:23:47'),
(1263, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-21 03:24:04', '2021-06-21 03:24:04'),
(1264, 1, 'admin/bai-viet', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-21 03:24:08', '2021-06-21 03:24:08'),
(1265, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-21 03:29:04', '2021-06-21 03:29:04'),
(1266, 1, 'admin/auth/menu/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-21 03:29:07', '2021-06-21 03:29:07'),
(1267, 1, 'admin/auth/menu/14', 'PUT', '::1', '{\"parent_id\":\"15\",\"title\":\"B\\u00e0i vi\\u1ebft\",\"icon\":\"fa-thumb-tack\",\"uri\":\"\\/posts\",\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"yYCTcVpKUOJq6pVZgvdRfYaND7ghPYBl0kpsRUdS\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/auth\\/menu\"}', '2021-06-21 03:29:20', '2021-06-21 03:29:20'),
(1268, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-21 03:29:21', '2021-06-21 03:29:21'),
(1269, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-21 03:31:58', '2021-06-21 03:31:58'),
(1270, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-21 03:32:01', '2021-06-21 03:32:01'),
(1271, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-21 03:32:24', '2021-06-21 03:32:24'),
(1272, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-21 03:32:52', '2021-06-21 03:32:52'),
(1273, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-21 03:33:25', '2021-06-21 03:33:25'),
(1274, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-21 03:33:37', '2021-06-21 03:33:37'),
(1275, 1, 'admin/posts', 'GET', '::1', '{\"_scope_\":\"trashed\",\"_pjax\":\"#pjax-container\"}', '2021-06-21 03:33:40', '2021-06-21 03:33:40'),
(1276, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-21 03:33:48', '2021-06-21 03:33:48'),
(1277, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"per_page\":\"10\"}', '2021-06-21 03:34:20', '2021-06-21 03:34:20'),
(1278, 1, 'admin/posts', 'GET', '::1', '{\"per_page\":\"10\"}', '2021-06-21 03:45:40', '2021-06-21 03:45:40'),
(1279, 1, 'admin/posts', 'GET', '::1', '{\"per_page\":\"10\"}', '2021-06-21 03:47:02', '2021-06-21 03:47:02'),
(1280, 1, 'admin', 'GET', '::1', '[]', '2021-06-22 04:18:48', '2021-06-22 04:18:48'),
(1281, 1, 'admin', 'GET', '::1', '[]', '2021-06-22 04:18:48', '2021-06-22 04:18:48'),
(1282, 1, 'admin', 'GET', '::1', '[]', '2021-06-22 04:26:15', '2021-06-22 04:26:15'),
(1283, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 04:26:29', '2021-06-22 04:26:29'),
(1284, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 04:26:35', '2021-06-22 04:26:35'),
(1285, 1, 'admin/auth/menu/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 04:26:40', '2021-06-22 04:26:40'),
(1286, 1, 'admin/auth/menu/8', 'PUT', '::1', '{\"parent_id\":\"0\",\"title\":\"\\u0110\\u1ea1i l\\u00fd\",\"icon\":\"fa-users\",\"uri\":\"users\",\"roles\":[null],\"permission\":null,\"_token\":\"qQXL26AiPAhqkzUOTYMB6oHWy1FUdTJWhvw4k92P\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/auth\\/menu\"}', '2021-06-22 04:26:55', '2021-06-22 04:26:55'),
(1287, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-22 04:26:56', '2021-06-22 04:26:56'),
(1288, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-22 04:27:04', '2021-06-22 04:27:04'),
(1289, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 04:27:30', '2021-06-22 04:27:30'),
(1290, 1, 'admin/users/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 04:27:34', '2021-06-22 04:27:34'),
(1291, 1, 'admin/auth/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 04:29:08', '2021-06-22 04:29:08'),
(1292, 1, 'admin/auth/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 04:29:08', '2021-06-22 04:29:08'),
(1293, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 04:29:59', '2021-06-22 04:29:59'),
(1294, 1, 'admin/posts/7/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 04:30:40', '2021-06-22 04:30:40'),
(1295, 1, 'admin/helpers/terminal/artisan', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 04:41:09', '2021-06-22 04:41:09'),
(1296, 1, 'admin/helpers/routes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 04:48:27', '2021-06-22 04:48:27'),
(1297, 1, 'admin/helpers/terminal/database', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 04:48:55', '2021-06-22 04:48:55'),
(1298, 1, 'admin/helpers/terminal/artisan', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 04:48:58', '2021-06-22 04:48:58'),
(1299, 1, 'admin/helpers/terminal/database', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 04:49:00', '2021-06-22 04:49:00'),
(1300, 1, 'admin/helpers/terminal/artisan', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 04:49:10', '2021-06-22 04:49:10'),
(1301, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-22 04:52:06', '2021-06-22 04:52:06'),
(1302, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-22 04:52:32', '2021-06-22 04:52:32'),
(1303, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-22 05:10:42', '2021-06-22 05:10:42'),
(1304, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-22 05:11:23', '2021-06-22 05:11:23'),
(1305, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-22 05:11:32', '2021-06-22 05:11:32'),
(1306, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-22 05:14:58', '2021-06-22 05:14:58'),
(1307, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-22 05:15:33', '2021-06-22 05:15:33'),
(1308, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-22 05:15:40', '2021-06-22 05:15:40'),
(1309, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-22 05:20:51', '2021-06-22 05:20:51'),
(1310, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 05:21:06', '2021-06-22 05:21:06'),
(1311, 1, 'admin/posts/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 05:21:10', '2021-06-22 05:21:10'),
(1312, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 05:21:22', '2021-06-22 05:21:22'),
(1313, 1, 'admin/posts/7/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 05:21:25', '2021-06-22 05:21:25'),
(1314, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 05:21:31', '2021-06-22 05:21:31'),
(1315, 1, 'admin/posts/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 05:21:33', '2021-06-22 05:21:33'),
(1316, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-22 05:24:08', '2021-06-22 05:24:08'),
(1317, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-22 05:28:05', '2021-06-22 05:28:05'),
(1318, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 05:29:09', '2021-06-22 05:29:09'),
(1319, 1, 'admin/users', 'GET', '::1', '[]', '2021-06-22 05:29:11', '2021-06-22 05:29:11'),
(1320, 1, 'admin/users/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 05:29:14', '2021-06-22 05:29:14'),
(1321, 1, 'admin/users/create', 'GET', '::1', '[]', '2021-06-22 05:29:31', '2021-06-22 05:29:31'),
(1322, 1, 'admin/auth/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 05:29:39', '2021-06-22 05:29:39'),
(1323, 1, 'admin/auth/users/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 05:29:41', '2021-06-22 05:29:41'),
(1324, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 05:29:54', '2021-06-22 05:29:54'),
(1325, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-22 05:31:55', '2021-06-22 05:31:55'),
(1326, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-22 05:33:51', '2021-06-22 05:33:51'),
(1327, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 05:33:53', '2021-06-22 05:33:53'),
(1328, 1, 'admin/posts/7/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 05:33:56', '2021-06-22 05:33:56'),
(1329, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-22 05:34:14', '2021-06-22 05:34:14'),
(1330, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-22 05:34:40', '2021-06-22 05:34:40'),
(1331, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-22 05:34:47', '2021-06-22 05:34:47'),
(1332, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-22 05:36:36', '2021-06-22 05:36:36'),
(1333, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 05:54:32', '2021-06-22 05:54:32'),
(1334, 1, 'admin/posts/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 05:54:33', '2021-06-22 05:54:33'),
(1335, 1, 'admin/posts', 'POST', '::1', '{\"title\":\"Home Page\",\"slug\":null,\"desc_short\":null,\"body\":null,\"category\":[\"3\",null],\"status\":\"1\",\"time_post\":\"2021-06-22 00:00:00\",\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/public\\/upload\\/product_default.png\",\"_token\":\"qQXL26AiPAhqkzUOTYMB6oHWy1FUdTJWhvw4k92P\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/posts\"}', '2021-06-22 05:54:52', '2021-06-22 05:54:52'),
(1336, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-22 05:54:54', '2021-06-22 05:54:54'),
(1337, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-22 05:55:42', '2021-06-22 05:55:42'),
(1338, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-22 05:56:40', '2021-06-22 05:56:40'),
(1339, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-22 06:00:51', '2021-06-22 06:00:51'),
(1340, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-22 06:03:52', '2021-06-22 06:03:52'),
(1341, 1, 'admin/posts/create', 'GET', '::1', '[]', '2021-06-22 06:03:56', '2021-06-22 06:03:56'),
(1342, 1, 'admin/posts', 'POST', '::1', '{\"title\":\"Home Page\",\"slug\":null,\"desc_short\":null,\"body\":null,\"category\":[null],\"status\":\"1\",\"timer_at\":\"2021-06-22 00:00:00\",\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/public\\/upload\\/product_default.png\",\"_token\":\"qQXL26AiPAhqkzUOTYMB6oHWy1FUdTJWhvw4k92P\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/posts\\/7\\/edit\"}', '2021-06-22 06:04:05', '2021-06-22 06:04:05'),
(1343, 1, 'admin/posts/7/edit', 'GET', '::1', '[]', '2021-06-22 06:04:05', '2021-06-22 06:04:05'),
(1344, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 06:04:22', '2021-06-22 06:04:22'),
(1345, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2021-06-22 06:04:25', '2021-06-22 06:04:25'),
(1346, 1, 'admin/posts/19/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 06:04:28', '2021-06-22 06:04:28'),
(1347, 1, 'admin/posts/19', 'PUT', '::1', '{\"title\":\"Home Page\",\"slug\":\"home-page\",\"desc_short\":null,\"body\":null,\"category\":[\"3\",null],\"status\":\"1\",\"timer_at\":\"2021-06-22 00:00:00\",\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/public\\/upload\\/product_default.png\",\"_token\":\"qQXL26AiPAhqkzUOTYMB6oHWy1FUdTJWhvw4k92P\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/posts?&_sort%5Bcolumn%5D=id&_sort%5Btype%5D=desc\"}', '2021-06-22 06:05:59', '2021-06-22 06:05:59'),
(1348, 1, 'admin/posts/19/edit', 'GET', '::1', '[]', '2021-06-22 06:05:59', '2021-06-22 06:05:59'),
(1349, 1, 'admin/posts/19/edit', 'GET', '::1', '[]', '2021-06-22 06:06:00', '2021-06-22 06:06:00'),
(1350, 1, 'admin/posts/19/edit', 'GET', '::1', '[]', '2021-06-22 06:06:00', '2021-06-22 06:06:00'),
(1351, 1, 'admin/posts/19/edit', 'GET', '::1', '[]', '2021-06-22 06:06:00', '2021-06-22 06:06:00'),
(1352, 1, 'admin/posts/19/edit', 'GET', '::1', '[]', '2021-06-22 06:06:01', '2021-06-22 06:06:01'),
(1353, 1, 'admin/posts/19/edit', 'GET', '::1', '[]', '2021-06-22 06:06:01', '2021-06-22 06:06:01'),
(1354, 1, 'admin/posts/19/edit', 'GET', '::1', '[]', '2021-06-22 06:06:01', '2021-06-22 06:06:01'),
(1355, 1, 'admin/posts/19/edit', 'GET', '::1', '[]', '2021-06-22 06:06:01', '2021-06-22 06:06:01'),
(1356, 1, 'admin/posts/19/edit', 'GET', '::1', '[]', '2021-06-22 06:06:02', '2021-06-22 06:06:02'),
(1357, 1, 'admin/posts/19/edit', 'GET', '::1', '[]', '2021-06-22 06:06:02', '2021-06-22 06:06:02'),
(1358, 1, 'admin/posts/19/edit', 'GET', '::1', '[]', '2021-06-22 06:06:02', '2021-06-22 06:06:02'),
(1359, 1, 'admin/posts/19/edit', 'GET', '::1', '[]', '2021-06-22 06:06:03', '2021-06-22 06:06:03'),
(1360, 1, 'admin/posts/19/edit', 'GET', '::1', '[]', '2021-06-22 06:06:03', '2021-06-22 06:06:03'),
(1361, 1, 'admin/posts/19/edit', 'GET', '::1', '[]', '2021-06-22 06:06:03', '2021-06-22 06:06:03'),
(1362, 1, 'admin/posts/19/edit', 'GET', '::1', '[]', '2021-06-22 06:06:04', '2021-06-22 06:06:04'),
(1363, 1, 'admin/posts/19/edit', 'GET', '::1', '[]', '2021-06-22 06:06:04', '2021-06-22 06:06:04'),
(1364, 1, 'admin/posts/19/edit', 'GET', '::1', '[]', '2021-06-22 06:06:04', '2021-06-22 06:06:04'),
(1365, 1, 'admin/posts/19/edit', 'GET', '::1', '[]', '2021-06-22 06:06:05', '2021-06-22 06:06:05'),
(1366, 1, 'admin/posts/19/edit', 'GET', '::1', '[]', '2021-06-22 06:06:05', '2021-06-22 06:06:05'),
(1367, 1, 'admin/posts/19/edit', 'GET', '::1', '[]', '2021-06-22 06:06:05', '2021-06-22 06:06:05'),
(1368, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 06:12:13', '2021-06-22 06:12:13'),
(1369, 1, 'admin/posts/7/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 06:12:15', '2021-06-22 06:12:15'),
(1370, 1, 'admin', 'GET', '::1', '[]', '2021-06-22 06:42:24', '2021-06-22 06:42:24'),
(1371, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 06:42:27', '2021-06-22 06:42:27'),
(1372, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"ID\":null,\"title\":\"Lo\\u00e0i c\\u00e1 Nh\\u1eadt B\\u1ea3n n\\u00e0y c\\u00f3 g\\u00ec \\u0111\\u1eb7c bi\\u1ec7t m\\u00e0 t\\u1eebng \\u0111\\u01b0\\u1ee3c \\u0111\\u1ea5u gi\\u00e1 t\\u1edbi 47 t\\u1ef7?\"}', '2021-06-22 06:42:48', '2021-06-22 06:42:48'),
(1373, 1, 'admin/posts/17/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 06:43:04', '2021-06-22 06:43:04'),
(1374, 1, 'admin/posts/17', 'PUT', '::1', '{\"title\":\"Lo\\u00e0i c\\u00e1 Nh\\u1eadt B\\u1ea3n n\\u00e0y c\\u00f3 g\\u00ec \\u0111\\u1eb7c bi\\u1ec7t m\\u00e0 t\\u1eebng \\u0111\\u01b0\\u1ee3c \\u0111\\u1ea5u gi\\u00e1 t\\u1edbi 47 t\\u1ef7?\",\"slug\":\"loai-ca-nhat-ban-nay-co-gi-dac-biet-ma-tung-duoc-dau-gia-toi-47-ty-3\",\"desc_short\":\"Lo\\u00e0i c\\u00e1 n\\u00e0y c\\u00f2n \\u0111\\u01b0\\u1ee3c g\\u1ecdi l\\u00e0 m\\u1ed9t \\u201cT\\u00e1c ph\\u1ea9m ngh\\u1ec7 thu\\u1eadt trong gi\\u1edbi b\\u01a1i l\\u1ed9i\\u201d, n\\u00f3 \\u0111\\u01b0\\u1ee3c sinh ra t\\u1ea1i Nh\\u1eadt B\\u1ea3n v\\u00e0o kho\\u1ea3ng 200 n\\u0103m tr\\u01b0\\u1edbc v\\u00e0 \\u0111ang thu h\\u00fat kh\\u00f4ng ch\\u1ec9 ng\\u01b0\\u1eddi d\\u00e2n Nh\\u1eadt B\\u1ea3n m\\u00e0 c\\u00f2n tr\\u00ean kh\\u1eafp th\\u1ebf gi\\u1edbi.\",\"body\":\"<p>Theo trang tin t\\u1ee9c kinh t\\u1ebf Nh\\u1eadt B\\u1ea3n ng&agrave;y 1\\/3, kh\\u1ed1i l\\u01b0\\u1ee3ng xu\\u1ea5t kh\\u1ea9u c&aacute; Koi Nh\\u1eadt B\\u1ea3n \\u0111&atilde; t\\u0103ng 35% trong 5 n\\u0103m. T\\u1ea1i bu\\u1ed5i \\u0111\\u1ea5u gi&aacute; \\u0111\\u01b0\\u1ee3c t\\u1ed5 ch\\u1ee9c t\\u1ea1i Nh\\u1eadt B\\u1ea3n, nh\\u1eefng ng\\u01b0\\u1eddi gi&agrave;u \\u1edf n\\u01b0\\u1edbc ngo&agrave;i th\\u1eadm ch&iacute; c&ograve;n tr\\u1ea3 h\\u01a1n 200 tri\\u1ec7u y&ecirc;n Nh\\u1eadt (kho\\u1ea3ng h\\u01a1n 42 t\\u1ef7 \\u0111\\u1ed3ng)&nbsp;cho m\\u1ed9t con c&aacute; Koi. Gi&aacute; tr\\u1ecb c\\u1ee7a m\\u1ed7i kg c&aacute; Koi th\\u1eadm ch&iacute; c&ograve;n v\\u01b0\\u1ee3t qua c&aacute; ng\\u1eeb \\u0111en v&agrave; tr\\u1edf th&agrave;nh &quot;lo&agrave;i c&aacute; \\u0111\\u1ea7u ti&ecirc;n c&oacute; l\\u1ee3i th\\u1ebf tuy\\u1ec7t \\u0111\\u1ed1i&quot; (theo c\\u01a1 quan Th\\u1ee7y s\\u1ea3n Nh\\u1eadt B\\u1ea3n).<\\/p>\\r\\n\\r\\n<p>V&agrave;o \\u0111\\u1ea7u th&aacute;ng 2\\/2019, nh\\u1eefng ng\\u01b0\\u1eddi h&acirc;m m\\u1ed9 c&aacute; Koi tr&ecirc;n kh\\u1eafp th\\u1ebf gi\\u1edbi \\u0111&atilde; \\u0111\\u01b0a nh\\u1eefng ch&uacute; c&aacute; c\\u1ee7a m&igrave;nh tham gia h\\u1ed9i thi &ldquo;\\u0110&aacute;nh gi&aacute; s\\u1ea3n ph\\u1ea9m Koi to&agrave;n di\\u1ec7n Nh\\u1eadt B\\u1ea3n&quot; \\u0111\\u01b0\\u1ee3c t\\u1ed5 ch\\u1ee9c t\\u1ea1i Trung t&acirc;m ph&acirc;n ph\\u1ed1i Tokyo. T\\u1ea1i \\u0111&acirc;y, qu&aacute;n qu&acirc;n l&agrave; m\\u1ed9t ch&uacute; c&aacute; Koi tr\\u1eafng \\u0111\\u1ed1m hoa v\\u0103n \\u0111\\u1ecf. Ch&uacute; c&aacute; Koi n&agrave;y \\u0111\\u01b0\\u1ee3c nu&ocirc;i trong trang tr\\u1ea1i c&aacute; c\\u1ee7a t\\u1ec9nh Hiroshima, \\u0111\\u01b0\\u1ee3c m\\u1ed9t ng\\u01b0\\u1eddi Trung Qu\\u1ed1c \\u0111\\u1ea5u gi&aacute; th&agrave;nh c&ocirc;ng v&agrave;o m&ugrave;a thu n\\u0103m 2018 v\\u1edbi m\\u1ee9c gi&aacute; cao nh\\u1ea5t trong l\\u1ecbch s\\u1eed, 230 tri\\u1ec7u y&ecirc;n (kho\\u1ea3ng 47 t\\u1ef7 VN\\u0110).<\\/p>\\r\\n\\r\\n<p><img alt=\\\"Lo\\u00e0i c\\u00e1 Nh\\u1eadt B\\u1ea3n n\\u00e0y c\\u00f3 g\\u00ec \\u0111\\u1eb7c bi\\u1ec7t m\\u00e0 t\\u1eebng \\u0111\\u01b0\\u1ee3c \\u0111\\u1ea5u gi\\u00e1 t\\u1edbi 47 t\\u1ef7? - 1\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/1-2019\\/images\\/2019-03-11\\/1552278583-814-loai-ca-nhat-ban-nay-co-gi-dac-biet-ma-tung-duoc-dau-gia-toi-47-ty----nh-1-1551926824-width393height424.jpeg\\\" \\/><\\/p>\\r\\n\\r\\n<p>M\\u1ed9t ch&uacute; c&aacute; coi t\\u1eebng \\u0111\\u01b0\\u1ee3c \\u0111\\u1ea5u gi&aacute; 47 t\\u1ef7 VN\\u0110<\\/p>\\r\\n\\r\\n<p>N\\u0103m 2018, kh\\u1ed1i l\\u01b0\\u1ee3ng xu\\u1ea5t kh\\u1ea9u c\\u1ee7a c&aacute; Koi Nh\\u1eadt B\\u1ea3n l&agrave; 3.633 t\\u1ef7 y&ecirc;n, t\\u0103ng g\\u1ea5p \\u0111&ocirc;i trong th\\u1eadp k\\u1ef7 qua. C&aacute;c n\\u01a1i xu\\u1ea5t kh\\u1ea9u c&aacute; ch&iacute;nh l&agrave; H\\u1ed3ng K&ocirc;ng, H&agrave; Lan v&agrave; \\u0110\\u1ee9c. Trong nh\\u1eefng n\\u0103m g\\u1ea7n \\u0111&acirc;y, giao d\\u1ecbch v\\u1edbi ng\\u01b0\\u1eddi mua t\\u1eeb Brazil v&agrave; C&aacute;c Ti\\u1ec3u v\\u01b0\\u01a1ng qu\\u1ed1c \\u1ea2 R\\u1eadp Th\\u1ed1ng nh\\u1ea5t c\\u0169ng t\\u0103ng l&ecirc;n. V\\u1ec1 v\\u1ea5n \\u0111\\u1ec1 n&agrave;y, Nakajima Masato, ch\\u1ee7 t\\u1ecbch C&acirc;u l\\u1ea1c b\\u1ed9 Aibo Nh\\u1eadt B\\u1ea3n, gi\\u1ea3i th&iacute;ch: &quot;\\u0110i\\u1ec3m gi&uacute;p c&aacute; Koi thu h&uacute;t m\\u1ecdi ng\\u01b0\\u1eddi l&agrave; nh\\u1eefng \\u0111\\u1ed1m hoa v\\u0103n \\u0111\\u1ed9c nh\\u1ea5t v&ocirc; nh\\u1ecb c\\u1ee7a ch&uacute;ng.&quot;<\\/p>\\r\\n\\r\\n<p>C&aacute; Koi c&oacute; ngu\\u1ed3n g\\u1ed1c \\u1edf l&agrave; t\\u1ec9nh Niigata, Nh\\u1eadt B\\u1ea3n. V&agrave;o th\\u1eddi Edo, trong ao nu&ocirc;i c&aacute; ch&eacute;p v\\u1edbi m\\u1ee5c \\u0111&iacute;ch \\u0111\\u1ec3 ch\\u1ebf bi\\u1ebfn m&oacute;n \\u0103n b\\u1ed7ng d\\u01b0ng xu\\u1ea5t hi\\u1ec7n nh\\u1eefng con c&aacute; c&oacute; \\u0111\\u1ed1m hoa v\\u0103n k&igrave; l\\u1ea1 tr&ecirc;n m&igrave;nh, th\\u1ea5y v\\u1eady m\\u1ecdi ng\\u01b0\\u1eddi nu&ocirc;i ch&uacute;ng l&agrave;m c&aacute; c\\u1ea3nh. Sau nhi\\u1ec1u th\\u1ebf h\\u1ec7 giao ph\\u1ed1i nh&acirc;n t\\u1ea1o, c&aacute; Koi \\u0111&atilde; \\u0111\\u01b0\\u1ee3c c\\u1ea3i ti\\u1ebfn th&agrave;nh m\\u1ed9t lo&agrave;i c&aacute; c\\u1ea3nh \\u0111\\u1eb9p v&agrave; l\\u1ed9ng l\\u1eaby h\\u01a1n.<\\/p>\\r\\n\\r\\n<p><img alt=\\\"Lo\\u00e0i c\\u00e1 Nh\\u1eadt B\\u1ea3n n\\u00e0y c\\u00f3 g\\u00ec \\u0111\\u1eb7c bi\\u1ec7t m\\u00e0 t\\u1eebng \\u0111\\u01b0\\u1ee3c \\u0111\\u1ea5u gi\\u00e1 t\\u1edbi 47 t\\u1ef7? - 2\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/1-2019\\/images\\/2019-03-11\\/1552278583-790-loai-ca-nhat-ban-nay-co-gi-dac-biet-ma-tung-duoc-dau-gia-toi-47-ty----nh-2-1551926802-width592height342.jpeg\\\" \\/><\\/p>\\r\\n\\r\\n<p>\\u0110i\\u1ec3m thu h&uacute;t c\\u1ee7a c&aacute; koi l&agrave; nh\\u1eefng \\u0111\\u1ed1m hoa v\\u0103n \\u0111\\u1ed9c nh\\u1ea5t v&ocirc; nh\\u1ecb c\\u1ee7a ch&uacute;ng<\\/p>\\r\\n\\r\\n<p>V&agrave;o th&aacute;ng 11\\/2018, m\\u1ed9t h\\u1ed9i ngh\\u1ecb chuy&ecirc;n \\u0111\\u1ec1 v\\u1ec1 c&aacute; Koi \\u0111&atilde; \\u0111\\u01b0\\u1ee3c t\\u1ed5 ch\\u1ee9c t\\u1ea1i Komaki, t\\u1ec9nh Niigata v&agrave; g\\u1ea7n m\\u1ed9t n\\u1eeda s\\u1ed1 ng\\u01b0\\u1eddi tham gia l&agrave; ng\\u01b0\\u1eddi n\\u01b0\\u1edbc ngo&agrave;i. Gi&aacute;m \\u0111\\u1ed1c \\u0111i\\u1ec1u h&agrave;nh c\\u1ee7a m\\u1ed9t c&ocirc;ng ty b\\u1ea5t \\u0111\\u1ed9ng s\\u1ea3n \\u0111\\u1ebfn t\\u1eeb Trung Qu\\u1ed1c chia s\\u1ebb: &quot;C&aacute; Koi khi\\u1ebfn t&ocirc;i qu&ecirc;n \\u0111i &aacute;p l\\u1ef1c h&agrave;ng ng&agrave;y. D&ugrave; c&oacute; xem ch&uacute;ng bao l&acirc;u, t&ocirc;i c\\u0169ng kh&ocirc;ng th\\u1ea5y m\\u1ec7t m\\u1ecfi.&quot;<\\/p>\",\"category\":[\"4\",null],\"status\":\"1\",\"timer_at\":\"2021-06-27 13:09:22\",\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/storage\\/app\\/public\\/images\\/blog1\\/1552278583-814-loai-ca-nhat-ban-nay-co-gi-dac-biet-ma-tung-duoc-dau-gia-toi-47-ty----nh-1-1551926824-width393height424.jpeg\",\"_token\":\"qQXL26AiPAhqkzUOTYMB6oHWy1FUdTJWhvw4k92P\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/posts?&ID=&title=Lo%C3%A0i+c%C3%A1+Nh%E1%BA%ADt+B%E1%BA%A3n+n%C3%A0y+c%C3%B3+g%C3%AC+%C4%91%E1%BA%B7c+bi%E1%BB%87t+m%C3%A0+t%E1%BB%ABng+%C4%91%C6%B0%E1%BB%A3c+%C4%91%E1%BA%A5u+gi%C3%A1+t%E1%BB%9Bi+47+t%E1%BB%B7%3F\"}', '2021-06-22 06:43:16', '2021-06-22 06:43:16'),
(1375, 1, 'admin/posts', 'GET', '::1', '{\"ID\":null,\"title\":\"Lo\\u00e0i c\\u00e1 Nh\\u1eadt B\\u1ea3n n\\u00e0y c\\u00f3 g\\u00ec \\u0111\\u1eb7c bi\\u1ec7t m\\u00e0 t\\u1eebng \\u0111\\u01b0\\u1ee3c \\u0111\\u1ea5u gi\\u00e1 t\\u1edbi 47 t\\u1ef7?\"}', '2021-06-22 06:43:17', '2021-06-22 06:43:17'),
(1376, 1, 'admin/posts/16/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 06:43:30', '2021-06-22 06:43:30'),
(1377, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 06:43:40', '2021-06-22 06:43:40'),
(1378, 1, 'admin/posts/17/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 06:43:44', '2021-06-22 06:43:44'),
(1379, 1, 'admin/posts/17', 'PUT', '::1', '{\"title\":\"Lo\\u00e0i c\\u00e1 Nh\\u1eadt B\\u1ea3n n\\u00e0y c\\u00f3 g\\u00ec \\u0111\\u1eb7c bi\\u1ec7t m\\u00e0 t\\u1eebng \\u0111\\u01b0\\u1ee3c \\u0111\\u1ea5u gi\\u00e1 t\\u1edbi 47 t\\u1ef7?\",\"slug\":\"loai-ca-nhat-ban-nay-co-gi-dac-biet-ma-tung-duoc-dau-gia-toi-47-ty-4\",\"desc_short\":\"Lo\\u00e0i c\\u00e1 n\\u00e0y c\\u00f2n \\u0111\\u01b0\\u1ee3c g\\u1ecdi l\\u00e0 m\\u1ed9t \\u201cT\\u00e1c ph\\u1ea9m ngh\\u1ec7 thu\\u1eadt trong gi\\u1edbi b\\u01a1i l\\u1ed9i\\u201d, n\\u00f3 \\u0111\\u01b0\\u1ee3c sinh ra t\\u1ea1i Nh\\u1eadt B\\u1ea3n v\\u00e0o kho\\u1ea3ng 200 n\\u0103m tr\\u01b0\\u1edbc v\\u00e0 \\u0111ang thu h\\u00fat kh\\u00f4ng ch\\u1ec9 ng\\u01b0\\u1eddi d\\u00e2n Nh\\u1eadt B\\u1ea3n m\\u00e0 c\\u00f2n tr\\u00ean kh\\u1eafp th\\u1ebf gi\\u1edbi.\",\"body\":\"<p>Theo trang tin t\\u1ee9c kinh t\\u1ebf Nh\\u1eadt B\\u1ea3n ng&agrave;y 1\\/3, kh\\u1ed1i l\\u01b0\\u1ee3ng xu\\u1ea5t kh\\u1ea9u c&aacute; Koi Nh\\u1eadt B\\u1ea3n \\u0111&atilde; t\\u0103ng 35% trong 5 n\\u0103m. T\\u1ea1i bu\\u1ed5i \\u0111\\u1ea5u gi&aacute; \\u0111\\u01b0\\u1ee3c t\\u1ed5 ch\\u1ee9c t\\u1ea1i Nh\\u1eadt B\\u1ea3n, nh\\u1eefng ng\\u01b0\\u1eddi gi&agrave;u \\u1edf n\\u01b0\\u1edbc ngo&agrave;i th\\u1eadm ch&iacute; c&ograve;n tr\\u1ea3 h\\u01a1n 200 tri\\u1ec7u y&ecirc;n Nh\\u1eadt (kho\\u1ea3ng h\\u01a1n 42 t\\u1ef7 \\u0111\\u1ed3ng)&nbsp;cho m\\u1ed9t con c&aacute; Koi. Gi&aacute; tr\\u1ecb c\\u1ee7a m\\u1ed7i kg c&aacute; Koi th\\u1eadm ch&iacute; c&ograve;n v\\u01b0\\u1ee3t qua c&aacute; ng\\u1eeb \\u0111en v&agrave; tr\\u1edf th&agrave;nh &quot;lo&agrave;i c&aacute; \\u0111\\u1ea7u ti&ecirc;n c&oacute; l\\u1ee3i th\\u1ebf tuy\\u1ec7t \\u0111\\u1ed1i&quot; (theo c\\u01a1 quan Th\\u1ee7y s\\u1ea3n Nh\\u1eadt B\\u1ea3n).<\\/p>\\r\\n\\r\\n<p>V&agrave;o \\u0111\\u1ea7u th&aacute;ng 2\\/2019, nh\\u1eefng ng\\u01b0\\u1eddi h&acirc;m m\\u1ed9 c&aacute; Koi tr&ecirc;n kh\\u1eafp th\\u1ebf gi\\u1edbi \\u0111&atilde; \\u0111\\u01b0a nh\\u1eefng ch&uacute; c&aacute; c\\u1ee7a m&igrave;nh tham gia h\\u1ed9i thi &ldquo;\\u0110&aacute;nh gi&aacute; s\\u1ea3n ph\\u1ea9m Koi to&agrave;n di\\u1ec7n Nh\\u1eadt B\\u1ea3n&quot; \\u0111\\u01b0\\u1ee3c t\\u1ed5 ch\\u1ee9c t\\u1ea1i Trung t&acirc;m ph&acirc;n ph\\u1ed1i Tokyo. T\\u1ea1i \\u0111&acirc;y, qu&aacute;n qu&acirc;n l&agrave; m\\u1ed9t ch&uacute; c&aacute; Koi tr\\u1eafng \\u0111\\u1ed1m hoa v\\u0103n \\u0111\\u1ecf. Ch&uacute; c&aacute; Koi n&agrave;y \\u0111\\u01b0\\u1ee3c nu&ocirc;i trong trang tr\\u1ea1i c&aacute; c\\u1ee7a t\\u1ec9nh Hiroshima, \\u0111\\u01b0\\u1ee3c m\\u1ed9t ng\\u01b0\\u1eddi Trung Qu\\u1ed1c \\u0111\\u1ea5u gi&aacute; th&agrave;nh c&ocirc;ng v&agrave;o m&ugrave;a thu n\\u0103m 2018 v\\u1edbi m\\u1ee9c gi&aacute; cao nh\\u1ea5t trong l\\u1ecbch s\\u1eed, 230 tri\\u1ec7u y&ecirc;n (kho\\u1ea3ng 47 t\\u1ef7 VN\\u0110).<\\/p>\\r\\n\\r\\n<p><img alt=\\\"Lo\\u00e0i c\\u00e1 Nh\\u1eadt B\\u1ea3n n\\u00e0y c\\u00f3 g\\u00ec \\u0111\\u1eb7c bi\\u1ec7t m\\u00e0 t\\u1eebng \\u0111\\u01b0\\u1ee3c \\u0111\\u1ea5u gi\\u00e1 t\\u1edbi 47 t\\u1ef7? - 1\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/1-2019\\/images\\/2019-03-11\\/1552278583-814-loai-ca-nhat-ban-nay-co-gi-dac-biet-ma-tung-duoc-dau-gia-toi-47-ty----nh-1-1551926824-width393height424.jpeg\\\" \\/><\\/p>\\r\\n\\r\\n<p>M\\u1ed9t ch&uacute; c&aacute; coi t\\u1eebng \\u0111\\u01b0\\u1ee3c \\u0111\\u1ea5u gi&aacute; 47 t\\u1ef7 VN\\u0110<\\/p>\\r\\n\\r\\n<p>N\\u0103m 2018, kh\\u1ed1i l\\u01b0\\u1ee3ng xu\\u1ea5t kh\\u1ea9u c\\u1ee7a c&aacute; Koi Nh\\u1eadt B\\u1ea3n l&agrave; 3.633 t\\u1ef7 y&ecirc;n, t\\u0103ng g\\u1ea5p \\u0111&ocirc;i trong th\\u1eadp k\\u1ef7 qua. C&aacute;c n\\u01a1i xu\\u1ea5t kh\\u1ea9u c&aacute; ch&iacute;nh l&agrave; H\\u1ed3ng K&ocirc;ng, H&agrave; Lan v&agrave; \\u0110\\u1ee9c. Trong nh\\u1eefng n\\u0103m g\\u1ea7n \\u0111&acirc;y, giao d\\u1ecbch v\\u1edbi ng\\u01b0\\u1eddi mua t\\u1eeb Brazil v&agrave; C&aacute;c Ti\\u1ec3u v\\u01b0\\u01a1ng qu\\u1ed1c \\u1ea2 R\\u1eadp Th\\u1ed1ng nh\\u1ea5t c\\u0169ng t\\u0103ng l&ecirc;n. V\\u1ec1 v\\u1ea5n \\u0111\\u1ec1 n&agrave;y, Nakajima Masato, ch\\u1ee7 t\\u1ecbch C&acirc;u l\\u1ea1c b\\u1ed9 Aibo Nh\\u1eadt B\\u1ea3n, gi\\u1ea3i th&iacute;ch: &quot;\\u0110i\\u1ec3m gi&uacute;p c&aacute; Koi thu h&uacute;t m\\u1ecdi ng\\u01b0\\u1eddi l&agrave; nh\\u1eefng \\u0111\\u1ed1m hoa v\\u0103n \\u0111\\u1ed9c nh\\u1ea5t v&ocirc; nh\\u1ecb c\\u1ee7a ch&uacute;ng.&quot;<\\/p>\\r\\n\\r\\n<p>C&aacute; Koi c&oacute; ngu\\u1ed3n g\\u1ed1c \\u1edf l&agrave; t\\u1ec9nh Niigata, Nh\\u1eadt B\\u1ea3n. V&agrave;o th\\u1eddi Edo, trong ao nu&ocirc;i c&aacute; ch&eacute;p v\\u1edbi m\\u1ee5c \\u0111&iacute;ch \\u0111\\u1ec3 ch\\u1ebf bi\\u1ebfn m&oacute;n \\u0103n b\\u1ed7ng d\\u01b0ng xu\\u1ea5t hi\\u1ec7n nh\\u1eefng con c&aacute; c&oacute; \\u0111\\u1ed1m hoa v\\u0103n k&igrave; l\\u1ea1 tr&ecirc;n m&igrave;nh, th\\u1ea5y v\\u1eady m\\u1ecdi ng\\u01b0\\u1eddi nu&ocirc;i ch&uacute;ng l&agrave;m c&aacute; c\\u1ea3nh. Sau nhi\\u1ec1u th\\u1ebf h\\u1ec7 giao ph\\u1ed1i nh&acirc;n t\\u1ea1o, c&aacute; Koi \\u0111&atilde; \\u0111\\u01b0\\u1ee3c c\\u1ea3i ti\\u1ebfn th&agrave;nh m\\u1ed9t lo&agrave;i c&aacute; c\\u1ea3nh \\u0111\\u1eb9p v&agrave; l\\u1ed9ng l\\u1eaby h\\u01a1n.<\\/p>\\r\\n\\r\\n<p><img alt=\\\"Lo\\u00e0i c\\u00e1 Nh\\u1eadt B\\u1ea3n n\\u00e0y c\\u00f3 g\\u00ec \\u0111\\u1eb7c bi\\u1ec7t m\\u00e0 t\\u1eebng \\u0111\\u01b0\\u1ee3c \\u0111\\u1ea5u gi\\u00e1 t\\u1edbi 47 t\\u1ef7? - 2\\\" src=\\\"https:\\/\\/cdn.24h.com.vn\\/upload\\/1-2019\\/images\\/2019-03-11\\/1552278583-790-loai-ca-nhat-ban-nay-co-gi-dac-biet-ma-tung-duoc-dau-gia-toi-47-ty----nh-2-1551926802-width592height342.jpeg\\\" \\/><\\/p>\\r\\n\\r\\n<p>\\u0110i\\u1ec3m thu h&uacute;t c\\u1ee7a c&aacute; koi l&agrave; nh\\u1eefng \\u0111\\u1ed1m hoa v\\u0103n \\u0111\\u1ed9c nh\\u1ea5t v&ocirc; nh\\u1ecb c\\u1ee7a ch&uacute;ng<\\/p>\\r\\n\\r\\n<p>V&agrave;o th&aacute;ng 11\\/2018, m\\u1ed9t h\\u1ed9i ngh\\u1ecb chuy&ecirc;n \\u0111\\u1ec1 v\\u1ec1 c&aacute; Koi \\u0111&atilde; \\u0111\\u01b0\\u1ee3c t\\u1ed5 ch\\u1ee9c t\\u1ea1i Komaki, t\\u1ec9nh Niigata v&agrave; g\\u1ea7n m\\u1ed9t n\\u1eeda s\\u1ed1 ng\\u01b0\\u1eddi tham gia l&agrave; ng\\u01b0\\u1eddi n\\u01b0\\u1edbc ngo&agrave;i. Gi&aacute;m \\u0111\\u1ed1c \\u0111i\\u1ec1u h&agrave;nh c\\u1ee7a m\\u1ed9t c&ocirc;ng ty b\\u1ea5t \\u0111\\u1ed9ng s\\u1ea3n \\u0111\\u1ebfn t\\u1eeb Trung Qu\\u1ed1c chia s\\u1ebb: &quot;C&aacute; Koi khi\\u1ebfn t&ocirc;i qu&ecirc;n \\u0111i &aacute;p l\\u1ef1c h&agrave;ng ng&agrave;y. D&ugrave; c&oacute; xem ch&uacute;ng bao l&acirc;u, t&ocirc;i c\\u0169ng kh&ocirc;ng th\\u1ea5y m\\u1ec7t m\\u1ecfi.&quot;<\\/p>\",\"category\":[\"4\",null],\"status\":\"1\",\"timer_at\":\"2021-06-22 13:09:22\",\"avatar\":\"http:\\/\\/localhost\\/webdaugia\\/storage\\/app\\/public\\/images\\/blog1\\/1552278583-814-loai-ca-nhat-ban-nay-co-gi-dac-biet-ma-tung-duoc-dau-gia-toi-47-ty----nh-1-1551926824-width393height424.jpeg\",\"_token\":\"qQXL26AiPAhqkzUOTYMB6oHWy1FUdTJWhvw4k92P\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/posts\"}', '2021-06-22 06:43:52', '2021-06-22 06:43:52'),
(1380, 1, 'admin/posts', 'GET', '::1', '[]', '2021-06-22 06:43:53', '2021-06-22 06:43:53'),
(1381, 1, 'admin/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 07:27:24', '2021-06-22 07:27:24'),
(1382, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 07:27:32', '2021-06-22 07:27:32'),
(1383, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 07:27:32', '2021-06-22 07:27:32'),
(1384, 1, 'admin/auth/menu/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 07:27:37', '2021-06-22 07:27:37'),
(1385, 1, 'admin/auth/menu/8', 'PUT', '::1', '{\"parent_id\":\"0\",\"title\":\"Qu\\u1ea3n l\\u00fd \\u0111\\u1ea1i l\\u00fd\",\"icon\":\"fa-users\",\"uri\":\"users\",\"roles\":[null],\"permission\":null,\"_token\":\"qQXL26AiPAhqkzUOTYMB6oHWy1FUdTJWhvw4k92P\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost\\/webdaugia\\/admin\\/auth\\/menu\"}', '2021-06-22 07:27:45', '2021-06-22 07:27:45'),
(1386, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-22 07:27:45', '2021-06-22 07:27:45'),
(1387, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-06-22 07:27:52', '2021-06-22 07:27:52'),
(1388, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-06-22 07:33:21', '2021-06-22 07:33:21'),
(1389, 1, 'admin/posts', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2021-06-22 07:33:24', '2021-06-22 07:33:24'),
(1390, 1, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"19\",\"_model\":\"App_Models_Posts\",\"_token\":\"qQXL26AiPAhqkzUOTYMB6oHWy1FUdTJWhvw4k92P\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-06-22 07:33:36', '2021-06-22 07:33:36'),
(1391, 1, 'admin/posts', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-06-22 07:33:37', '2021-06-22 07:33:37'),
(1392, 1, 'admin/posts', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\",\"_scope_\":\"trashed\"}', '2021-06-22 07:33:40', '2021-06-22 07:33:40'),
(1393, 1, 'admin/posts', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_scope_\":\"trashed\"}', '2021-06-22 07:41:50', '2021-06-22 07:41:50'),
(1394, 1, 'admin/posts', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_scope_\":\"trashed\"}', '2021-06-22 07:42:24', '2021-06-22 07:42:24'),
(1395, 1, 'admin/posts', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_scope_\":\"trashed\"}', '2021-06-22 07:43:41', '2021-06-22 07:43:41'),
(1396, 1, 'admin/posts', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-06-22 07:56:33', '2021-06-22 07:56:33');

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
(1, 16, NULL, NULL),
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
(1, 1, NULL, NULL),
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
(1, 1, NULL, NULL),
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
-- Cấu trúc bảng cho bảng `bills`
--

CREATE TABLE `bills` (
  `id` bigint(255) UNSIGNED NOT NULL,
  `id_ofuser` int(10) UNSIGNED NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `bill_total` int(255) NOT NULL,
  `bill_status` tinyint(4) NOT NULL DEFAULT 0,
  `bill_soluong` int(11) NOT NULL,
  `bill_promo` int(255) DEFAULT NULL,
  `bill_coupon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_details`
--

CREATE TABLE `bill_details` (
  `id_ofbill` bigint(255) UNSIGNED NOT NULL,
  `id_ofproduct` int(255) UNSIGNED NOT NULL,
  `end_price` double NOT NULL,
  `SL` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `campaign`
--

CREATE TABLE `campaign` (
  `id` int(11) UNSIGNED NOT NULL,
  `campaign_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `campaign_desc` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `campaign_feture_img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `time_start` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `time_end` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `campaign_status` int(11) NOT NULL DEFAULT 0,
  `notify_time` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `campaign_details`
--

CREATE TABLE `campaign_details` (
  `id` int(255) UNSIGNED NOT NULL,
  `id_ofcampaign` int(11) UNSIGNED NOT NULL,
  `id_ofproduct` int(255) UNSIGNED NOT NULL,
  `price_start` double NOT NULL,
  `price_step` double NOT NULL,
  `price_end` double NOT NULL,
  `id_userwin` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_post`
--

CREATE TABLE `category_post` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `desc` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category_post`
--

INSERT INTO `category_post` (`id`, `slug`, `order`, `title`, `desc`, `logo`, `created_at`, `updated_at`) VALUES
(3, 'kien-thuc', '1', 'Kiến thức', NULL, NULL, '2021-06-12 04:21:30', '2021-06-12 04:21:30'),
(4, 'tin-tuc-dau-gia', '1', 'Tin tức đấu giá', NULL, NULL, '2021-06-12 04:21:37', '2021-06-12 04:21:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_to_post`
--

CREATE TABLE `category_to_post` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category_to_post`
--

INSERT INTO `category_to_post` (`post_id`, `category_id`) VALUES
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 3),
(14, 3),
(15, 3),
(16, 4),
(17, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_to_product`
--

CREATE TABLE `category_to_product` (
  `id_ofproduct` int(255) UNSIGNED NOT NULL,
  `id_ofcategory` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `coupon_type` int(1) NOT NULL,
  `coupon_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `coupon_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coupon_value` int(11) NOT NULL,
  `coupon_product` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coupon_category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coupon_exp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
  `status` int(11) NOT NULL DEFAULT 1,
  `timer_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `title`, `desc_short`, `slug`, `body`, `avatar`, `status`, `timer_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(7, 'Bảng xếp hạng vòng loại World Cup: Việt Nam thắng liền hai trận đã giành vé hay chưa?', 'ĐT Việt Nam đã giành quyền đi tiếp hay chưa sau chiến thắng kịch tính trước ĐT Malaysia ở vòng loại World Cup 2022.', 'bang-xep-hang-vong-loai-world-cup-viet-nam-thang-lien-hai-tran-da-gianh-ve-hay-chua-2', '<p>Lượt đấu &aacute;p ch&oacute;t bảng G v&ograve;ng loại thứ hai&nbsp;<a href=\"https://www.24h.com.vn/world-cup-2022-c48e2601.html\" title=\"World Cup 2022\">World Cup 2022</a>&nbsp;khu vực ch&acirc;u &Aacute;, hai cặp đấu l&agrave;&nbsp;<a href=\"https://www.24h.com.vn/doi-tuyen-viet-nam-c48e3410.html\" title=\"ĐT Việt Nam\">ĐT Việt Nam</a>&nbsp;&ndash; ĐT Malaysia v&agrave; ĐT UAE &ndash; ĐT Indonesia trong khi ĐT Th&aacute;i Lan được nghỉ. Kết quả của hai trận đấu n&agrave;y sẽ ảnh hưởng trực tiếp tới vị tr&iacute; tr&ecirc;n bảng xếp hạng.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Bảng xếp hạng vòng loại World Cup: Việt Nam thắng liền hai trận đã giành vé hay chưa? - 1\" src=\"https://cdn.24h.com.vn/upload/2-2021/images/2021-06-12/Cuc-nong-BXH-vong-loai-World-Cup-Viet-Nam-da-gianh-quyen-di-tiep-hay-chua-5-660-1623438234-593-width660height439.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>ĐT Việt Nam gi&agrave;nh trọn 3 điểm trước ĐT Malaysia</p>\r\n\r\n<p>Thầy tr&ograve; HLV Park Hang Seo cần 3 điểm để nắm chắc ng&ocirc;i đầu v&agrave; &ldquo;Đo&agrave;n qu&acirc;n sao v&agrave;ng&rdquo; đ&atilde; đạt được mục ti&ecirc;u. ĐT Việt Nam nhập cuộc tốt hơn Malaysia v&agrave; sớm tạo được những cơ hội. Tuy nhi&ecirc;n, đội b&oacute;ng mặc &aacute;o đỏ cũng phải tới ph&uacute;t 27 mới c&oacute; b&agrave;n mở tỉ số.</p>\r\n\r\n<p>Người lập c&ocirc;ng l&agrave; tiền đạo Tiến Linh với c&uacute; đ&aacute;nh đầu cực mạnh ở cự ly gần. Trước đ&oacute;, số 22 của ĐT Việt Nam bỏ lỡ một cơ hội cực kỳ ngon ăn. Nửa cuối hiệp một, Malaysia đ&atilde; dồn l&ecirc;n tấn c&ocirc;ng nhưng thủ th&agrave;nh Tấn Trường thi đấu cực kỳ xuất sắc.</p>\r\n\r\n<p>Sang hiệp hai, ĐT Việt Nam tiếp tục l&agrave; đội tạo được nhiều cơ hội hơn nhưng c&aacute;c ch&acirc;n s&uacute;t &aacute;o đỏ lại phung ph&iacute; cơ hội. Malaysia bất ngờ c&oacute; b&agrave;n gỡ ở ph&uacute;t 73 tr&ecirc;n chấm phạt đền sau khi Văn Hậu để b&oacute;ng chạm tay trong v&ograve;ng cấm.</p>\r\n\r\n<p>Tuy nhi&ecirc;n, HLV Park Hang Seo lại cho thấy khả năng thay người tuyệt hảo. Tiền đạo v&agrave;o s&acirc;n thay người Văn To&agrave;n bị phạm lỗi trong v&ograve;ng cấm v&agrave; đội trưởng Quế Ngọc Hải kh&ocirc;ng bỏ lỡ cơ hội tr&ecirc;m chấm 11m để ấn định tỉ số 2-1.</p>\r\n\r\n<p>Ba điểm qu&yacute; gi&aacute; n&agrave;y gi&uacute;p ĐT Việt Nam c&oacute; được 17 điểm sau 7 trận đấu v&agrave; nắm giữ lợi thế lớn trước khi tiến v&agrave;o trận đấu cuối với UAE. Đội b&oacute;ng v&ugrave;ng T&acirc;y &Aacute; cũng đ&atilde; c&oacute; chiến thắng đậm đ&agrave; trước ĐT Indonesia để tiếp tục nắm giữ vị tr&iacute; thứ hai.</p>\r\n\r\n<p><img alt=\"Bảng xếp hạng vòng loại World Cup: Việt Nam thắng liền hai trận đã giành vé hay chưa? - 3\" src=\"https://cdn.24h.com.vn/upload/2-2021/images/2021-06-12/Cuc-nong-BXH-vong-loai-World-Cup-Viet-Nam-da-gianh-quyen-di-tiep-hay-chua-11-660-1623438389-185-width660height330.jpg\" /></p>\r\n\r\n<p>ĐT UAE thắng đậm ĐT Indonesia</p>\r\n\r\n<p>UAE &aacute;p đảo ho&agrave;n to&agrave;n trước Indonesia v&agrave; vượt l&ecirc;n dẫn trước 3-0 chỉ sau 45 ph&uacute;t đầu ti&ecirc;n. Đại diện của Đ&ocirc;ng Nam &Aacute; c&oacute; cơ hội tr&ecirc;n chấm 11m nhưng Evan Dimas lại kh&ocirc;ng thắng được thủ m&ocirc;n của UAE. Sang đến hiệp hai, ĐT UAE c&oacute; th&ecirc;m 2 b&agrave;n thắng để ấn định tỉ số 5-0.</p>\r\n\r\n<p>Chiến thắng n&agrave;y gi&uacute;p ĐT UAE tiếp tục giữ vị tr&iacute; thứ hai tr&ecirc;n bảng xếp hạng với 15 điểm. Ba điểm qu&yacute; gi&aacute; n&agrave;y cũng gi&uacute;p đại diện tới từ T&acirc;y &Aacute; nu&ocirc;i hy vọng gi&agrave;nh v&eacute; trực tiếp tiến v&agrave;o v&ograve;ng trong. Ở trận đấu cuối, họ chỉ cần thắng ĐT Việt Nam l&agrave; gi&agrave;nh ng&ocirc;i đầu bảng.</p>\r\n\r\n<p>Trong khi đ&oacute;, đo&agrave;n qu&acirc;n của HLV Park Hang Seo chỉ cần 1 trận h&ograve;a để gi&agrave;nh quyền đi tiếp. Tuy nhi&ecirc;n, đ&acirc;y l&agrave; nhiệm vụ kh&ocirc;ng dễ d&agrave;ng nhất l&agrave; khi UAE c&oacute; lợi thế được thi đấu tr&ecirc;n s&acirc;n nh&agrave;. Trong trường hợp để thua ĐT UAE, ĐT Việt Nam cần chờ kết quả của những bảng đấu kh&aacute;c để biết m&igrave;nh c&oacute; gi&agrave;nh v&eacute; vớt ở bảng 8 đội nh&igrave; bảng hay kh&ocirc;ng.</p>\r\n\r\n<p>Hiện tại ở BXH d&agrave;nh cho c&aacute;c đội xếp thứ 2, đội tuyển Oman đang tạm dẫn đầu với 12 điểm. Đội đứng thứ 2 l&agrave; Trung Quốc đang c&oacute; 10 điểm. Đ&acirc;y l&agrave; số điểm c&aacute;c đội đ&atilde; bị trừ đi sau khi kh&ocirc;ng t&iacute;nh kết quả với đội xếp cuối&nbsp;bảng đấu do đội Triều Ti&ecirc;n r&uacute;t lui. Như vậy, nếu như ĐT Việt Nam trừ đi 6 điểm (thắng 2 trận với đội cuối bảng l&agrave; Indonesia), ch&uacute;ng ta vẫn c&oacute; 11 điểm v&agrave; đủ sức chen ch&acirc;n v&agrave;o top 4 đội nh&igrave; bảng c&oacute; số điểm cao nhất để gi&agrave;nh v&eacute; đi tiếp.</p>\r\n\r\n<p>Đối với ba đội tuyển Th&aacute;i Lan, Malaysia v&agrave; Indonesia, ba đại diện c&ograve;n lại của Đ&ocirc;ng Nam &Aacute; đều kh&ocirc;ng c&ograve;n cơ hội đi tiếp v&agrave; lượt đấu cuối, trận đấu giữa Th&aacute;i Lan v&agrave; Malaysia chỉ c&ograve;n mang &yacute; nghĩa thủ tục.</p>\r\n\r\n<p><strong><em>Bảng xếp hạng bảng G sau loạt đấu diễn ra ng&agrave;y 12/6</em></strong></p>\r\n\r\n<p><img alt=\"Bảng xếp hạng vòng loại World Cup: Việt Nam thắng liền hai trận đã giành vé hay chưa? - 4\" src=\"https://cdn.24h.com.vn/upload/2-2021/images/2021-06-12/Cuc-nong-BXH-vong-loai-World-Cup-Viet-Nam-da-gianh-quyen-di-tiep-hay-chua-12-660-1623438566-405-width660height279.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><em><strong>Bảng xếp hạng c&aacute;c đội xếp thứ 2 hiện tại</strong></em></p>\r\n\r\n<p><img alt=\"Bảng xếp hạng vòng loại World Cup: Việt Nam thắng liền hai trận đã giành vé hay chưa? - 5\" src=\"https://cdn.24h.com.vn/upload/2-2021/images/2021-06-12/Bang-xep-hang-vong-loai-World-Cup-Viet-Nam-thang-lien-hai-tran-da-gianh-ve-hay-chua-bxh-1623459736-665-width604height256.jpg\" /></p>', '/storage/app/public/images/blog/5-640-1623438675-229-width640height480.jpg', 1, '2021-06-22 06:09:22', '2021-06-12 04:20:23', '2021-06-20 08:39:26', NULL),
(8, 'Vẽ chân dung khách hàng săn siêu phẩm Sun Marina Town', 'Không chỉ gây ấn tượng bởi con số 1.000 căn hộ Sun Marina Town tìm được chủ nhân trong vỏn vẹn 1 tuần mà thời gian “chốt căn” của các chủ nhân tương lai cũng chỉ trong vài phút tới 1 ngày, thậm chí ngay trong đêm giỏ hàng được mở. Chân dung những chủ nhân tinh hoa của Sun Marina Town như thế nào và đâu là “sứ mệnh” quyết định của siêu phẩm này?', 've-chan-dung-khach-hang-san-sieu-pham-sun-marina-town', '<p><strong>Second-home xứng tầm thượng lưu</strong></p>\r\n\r\n<p>37 tuổi, điều h&agrave;nh một c&ocirc;ng ty chuy&ecirc;n về logistic của gia đ&igrave;nh tại Hải Ph&ograve;ng, anh Ho&agrave;ng Nam cho biết do t&iacute;nh chất c&ocirc;ng việc n&ecirc;n anh thường xuy&ecirc;n đi c&ocirc;ng t&aacute;c tại Quảng Ninh 1 th&aacute;ng v&agrave;i lần. Với khoản tiền nh&agrave;n rỗi khoảng 5-6 tỷ, anh dự t&iacute;nh sẽ mua một căn hộ tại B&atilde;i Ch&aacute;y l&agrave;m second-home, vừa để thuận tiện nghỉ ngơi l&uacute;c l&agrave;m việc cũng như để gia đ&igrave;nh thoải m&aacute;i nghỉ dưỡng dịp lễ tết hay cuối tuần. &nbsp;&nbsp;&nbsp;</p>\r\n\r\n<p>&ldquo;Căn hộ m&agrave; t&ocirc;i mua phải nằm ở trung t&acirc;m B&atilde;i Ch&aacute;y để gia đ&igrave;nh chỉ một bước ch&acirc;n tới biển. V&igrave; c&oacute; đủ c&aacute;c thế hệ n&ecirc;n t&ocirc;i muốn một nơi đ&aacute;p ứng đủ nhu cầu mua sắm, giải tr&iacute;, tham quan, nghỉ dưỡng của cả nh&agrave;. Đặc biệt t&ocirc;i th&iacute;ch ở căn hộ cao tầng v&igrave; c&oacute; view thẳng ra Vịnh Hạ Long. T&ocirc;i đ&atilde; t&igrave;m hiểu rất nhiều dự &aacute;n quanh b&atilde;i biển, song ngay khi được tư vấn về tổ hợp Sun Marina cạnh Cảng t&agrave;u quốc tế Hạ Long, vừa c&oacute; cao tầng, shophouse, trung t&acirc;m thương mại, dịch vụ c&ugrave;ng một bến du thuyền sang trọng, t&ocirc;i đ&atilde; đăng k&yacute; ngay một căn 55m2 c&oacute; 1 ph&ograve;ng ngủ +1 thuộc to&agrave; th&aacute;p Sun Marina Town chỉ trong v&agrave;i ph&uacute;t. Chủ đầu tư dự &aacute;n l&agrave; Tập đo&agrave;n Sun Group c&oacute; uy t&iacute;n tr&ecirc;n thị trường BĐS cao cấp cũng l&agrave; một yếu tố quan trọng th&uacute;c đẩy t&ocirc;i đưa ra quyết định nhanh ch&oacute;ng&rdquo;, anh Ho&agrave;ng Nam chia sẻ.</p>\r\n\r\n<p><img alt=\"Vẽ chân dung khách hàng săn siêu phẩm Sun Marina Town - 1\" src=\"https://cdn.24h.com.vn/upload/2-2021/images/2021-06-11/Ve-chan-dung-khach-hang-san-sieu-pham-Sun-Marina-Town----nh-1_t--a-th--p-----i-sun-marina-town-t---a-nh--1623406912-530-width660height371.jpg\" /></p>\r\n\r\n<p>T&ograve;a th&aacute;p đ&ocirc;i Sun Marina Town tựa như biểu tượng du lịch mới của Hạ Long</p>\r\n\r\n<p>Theo thống k&ecirc; của chủ đầu tư, những căn hộ nằm gần c&aacute;c tầng c&oacute; hệ thống tiện &iacute;ch như bể bơi, khối nh&agrave; nối giữa 2 t&ograve;a th&aacute;p&hellip; được kh&aacute;ch h&agrave;ng l&agrave; gia đ&igrave;nh nhỏ, mua Sun Marina Town l&agrave;m ng&ocirc;i nh&agrave; thứ hai nghỉ dưỡng cuối tuần đ&oacute;n nhận mạnh mẽ. Bởi chủ đầu tư dự kiến sẽ thiết kế những kh&ocirc;ng gian thư gi&atilde;n đan xen trong t&ograve;a nh&agrave;. C&aacute;c kiến tr&uacute;c sư kỳ vọng khiến kh&aacute;ch h&agrave;ng ngay khi bước ch&acirc;n v&agrave;o Sun Marina Town sẽ cảm thấy như đang đứng tr&ecirc;n đỉnh một h&ograve;n đảo nhỏ nằm tr&ecirc;n vịnh di sản Hạ Long.</p>\r\n\r\n<p>Thay v&igrave; lựa chọn những tầng cao tại Sun Marina Town, chị Hồng Anh (40 tuổi) đến từ H&agrave; Nội lại chọn căn hộ studio ngay tầng thấp. &ldquo;L&agrave;m trong lĩnh vực kinh doanh du thuyền n&ecirc;n t&ocirc;i c&oacute; dịp đi rất nhiều quốc gia tr&ecirc;n thế giới. T&ocirc;i lu&ocirc;n mong muốn h&igrave;nh ảnh những căn hộ c&oacute; view trực diện ra những bến du thuyền, ngắm cảnh du thuyền trắng muốt ngược xu&ocirc;i rẽ s&oacute;ng dưới &aacute;nh mặt trời sẽ sớm xuất hiện ở Việt Nam. Sun Marina Town đ&atilde; hiện thực h&oacute;a mong ước đ&oacute; của t&ocirc;i&rdquo;, chị Hồng Anh chia sẻ.</p>\r\n\r\n<p>Nếu những căn hộ tầng cao c&oacute; view bao qu&aacute;t th&igrave; tầng thấp c&oacute; tầm nh&igrave;n gần nhất, r&otilde; nhất tới những chiếc du thuyền quanh bến cảng sầm uất. Vừa đủ gần để cảm nhận kh&ocirc;ng kh&iacute; nhộn nhịp xa xỉ, nhưng cũng vừa đủ xa để c&oacute; kh&ocirc;ng gian ri&ecirc;ng tư cho ri&ecirc;ng m&igrave;nh. 1 căn hộ second-home cho những ng&agrave;y nghỉ cuối tuần kh&ocirc;ng kh&aacute;c g&igrave; đang nghỉ dưỡng ở Monaco, Singapore hay London, chị Hồng Anh cho biết th&ecirc;m.</p>\r\n\r\n<p>Sở hữu vị tr&iacute; trung t&acirc;m B&atilde;i Ch&aacute;y, liền kề Vịnh Du thuyền, đồng thời được thụ hưởng mọi tiện &iacute;ch của hệ sinh th&aacute;i Sun Group tại đ&acirc;y, th&aacute;p đ&ocirc;i biểu tượng 50 tầng Sun Marina Town trở th&agrave;nh lựa chọn second-home nghỉ dưỡng l&yacute; tưởng của những kh&aacute;ch h&agrave;ng tới từ c&aacute;c địa phương quanh Quảng Ninh như H&agrave; Nội, Hải Ph&ograve;ng, Hải Dương&hellip;</p>\r\n\r\n<p><strong>Nh&agrave; đầu tư đi trước đ&oacute;n đầu</strong></p>\r\n\r\n<p>&ldquo;X&eacute;t về tỷ lệ th&igrave; kh&aacute;ch h&agrave;ng mua căn hộ kề b&ecirc;n Vịnh Du thuyền Sun Marina Town để ở, l&agrave;m second-home chiếm khoảng 60%. Đ&acirc;y l&agrave; tệp kh&aacute;ch h&agrave;ng c&oacute; điều kiện kinh tế, nhu cầu trải nghiệm cao m&agrave; những dự &aacute;n th&ocirc;ng thường chưa đủ để thỏa m&atilde;n họ. Tuy nhi&ecirc;n, b&ecirc;n cạnh đ&oacute;, lượng kh&aacute;ch h&agrave;ng t&igrave;m đến Sun Marina Town để đầu tư cũng kh&ocirc;ng phải &iacute;t, chiếm 40% c&ograve;n lại. Họ thường l&agrave; những nh&agrave; đầu tư d&agrave;i hạn, đ&atilde; c&oacute; nhiều kinh nghiệm chinh chiến tr&ecirc;n thị trường bất động sản, từng sở hữu một số si&ecirc;u phẩm nghỉ dưỡng của Tập đo&agrave;n Sun Group&rdquo;, một đại diện đại l&yacute; ph&acirc;n phối dự &aacute;n cho biết.</p>\r\n\r\n<p><img alt=\"Vẽ chân dung khách hàng săn siêu phẩm Sun Marina Town - 2\" src=\"https://cdn.24h.com.vn/upload/2-2021/images/2021-06-11/Ve-chan-dung-khach-hang-san-sieu-pham-Sun-Marina-Town----nh-2_view-tr--c-tuy---t-chinh-ph---c-nh---------1623406912-786-width660height330.jpg\" /></p>\r\n\r\n<p>View tr&aacute;c tuyệt chinh phục nh&agrave; đầu tư của Sun Marina Town</p>\r\n\r\n<p>Những nh&agrave; đầu tư l&acirc;u năm tr&ecirc;n thị trường bất động sản đ&atilde; trải qua mọi chu kỳ n&oacute;ng sốt của thị trường địa ốc v&agrave; thường lựa chọn đ&uacute;ng ph&acirc;n kh&uacute;c ph&ugrave; hợp với khả năng t&agrave;i ch&iacute;nh cũng như c&oacute; tiềm năng sinh lời cao.</p>\r\n\r\n<p>Như anh Ngọc Phương, nh&agrave; đầu tư từ Hải Dương, hiện đang l&agrave; chủ nh&acirc;n của 3 căn studio Sun Marina Town ph&acirc;n t&iacute;ch: &ldquo;T&ocirc;i đ&atilde; thức xuy&ecirc;n đ&ecirc;m để đăng k&yacute; đặt chỗ 3 căn studio c&oacute; vị tr&iacute; đẹp nhất dự &aacute;n. X&eacute;t về tiềm năng du lịch ở miền Bắc c&oacute; lẽ B&atilde;i Ch&aacute;y xứng đ&aacute;ng l&agrave; t&acirc;m điểm. Hiếm nơi n&agrave;o vừa l&agrave; di sản thi&ecirc;n nhi&ecirc;n thế giới, vừa hội tụ đủ hạ tầng giao th&ocirc;ng thuận tiện lẫn nhiều nh&agrave; đầu tư lớn c&ugrave;ng ph&aacute;t triển như ở đ&acirc;y. Kh&aacute;ch du lịch c&oacute; xu hướng nghỉ tại ph&ograve;ng view biển, thuận tiện ăn uống, mua sắm, giải tr&iacute;. Sun Marina Town c&ograve;n sở hữu bến du thuyền ri&ecirc;ng với nhiều tiện &iacute;ch hạng sang như 4 bể bơi quốc tế, c&ocirc;ng vi&ecirc;n cảnh quan, quảng trường nội khu, ngọn Hải Đăng biểu tượng... So s&aacute;nh với những hệ sinh th&aacute;i m&agrave; Sun Group đang x&acirc;y dựng ở Ph&uacute; Quốc hay tổ hợp giải tr&iacute; ở Đ&agrave; Nẵng th&igrave; những nh&agrave; đầu tư như t&ocirc;i ho&agrave;n to&agrave;n tin tưởng v&agrave;o tỷ suất ph&ograve;ng của 3 căn Sun Marina Town n&agrave;y&rdquo;.</p>\r\n\r\n<p>Song song với tiềm năng sinh lời từ khai th&aacute;c kinh doanh dịch vụ airbnb, homestay, căn hộ Sun Marina Town cũng được xem như một m&oacute;n đầu tư d&agrave;i hạn, gia tăng gi&aacute; trị trong tương lai khi to&agrave;n bộ tổ hợp bất động sản, giải tr&iacute; Sun Marina kề b&ecirc;n Vịnh Du thuyền ch&iacute;nh thức hoạt động.</p>\r\n\r\n<p><img alt=\"Vẽ chân dung khách hàng săn siêu phẩm Sun Marina Town - 3\" src=\"https://cdn.24h.com.vn/upload/2-2021/images/2021-06-11/Ve-chan-dung-khach-hang-san-sieu-pham-Sun-Marina-Town----nh-3_nh---ng-con-ph----s---m-u---t-b--n-v---nh--1623406912-852-width660height368.jpg\" /></p>\r\n\r\n<p>Những con phố sầm uất b&ecirc;n Vịnh Du thuyền</p>\r\n\r\n<p>TS. Nguyễn Văn Đ&iacute;nh, Ph&oacute; Chủ tịch ki&ecirc;m Tổng Thư k&yacute; Hội M&ocirc;i giới Bất động sản Việt Nam đ&aacute;nh gi&aacute; cao về tiềm năng tăng gi&aacute; v&agrave; khả năng sinh lời của c&aacute;c dự &aacute;n liền kề Vịnh Du thuyền như Sun Marina: &ldquo;Tiếp cận trực tiếp với kỳ quan thế giới l&agrave; ưu thế c&oacute; một kh&ocirc;ng hai m&agrave; kh&ocirc;ng phải chủ đầu tư n&agrave;o cũng l&agrave;m được. Khu vực đầu tư dự &aacute;n bất động sản si&ecirc;u sang gắn với bến du thuyền ở Hạ Long đ&aacute;p ứng đầy đủ y&ecirc;u cầu của giới nh&agrave; gi&agrave;u, đặc biệt l&agrave; nhu cầu về vị tr&iacute; v&agrave; tầm nh&igrave;n trải nghiệm&rdquo;.</p>\r\n\r\n<p>Đ&acirc;y l&agrave; điều đ&atilde; ph&aacute;t triển từ l&acirc;u tại nhiều thị trường địa ốc nổi danh tr&ecirc;n thế giới như bến cảng Victoria ở Hong Kong (Trung Quốc) hay Darling Harbour của Sydney (Australia), bến du thuyền Miami (Florida) - nơi hội tụ những dịch vụ giải tr&iacute; đẳng cấp, điểm đến của giới thượng lưu. T&ocirc;i cho rằng, bất động sản bến du thuyền gắn với thưởng thức di sản l&agrave; yếu tố lợi thế quan trọng để tăng l&ecirc;n gi&aacute; trị cho dự &aacute;n v&agrave; đảm bảo được khả năng sinh lời bền vững vượt trội cho c&aacute;c nh&agrave; đầu tư, TS Nguyễn Văn Đ&iacute;nh nhấn mạnh.</p>\r\n\r\n<p>Nguồn: http://danviet.vn/ve-chan-dung-khach-hang-san-sieu-pham-sun-marina-town-50202111617565588.htm</p>', '/storage/app/public/images/blog/Ve-chan-dung-khach-hang-san-sieu-pham-Sun-Marina-Town----nh-1_t--a-th--p-----i-sun-marina-town-t---a-nh--1623406912-530-width660height371.jpg', 1, '2021-06-22 06:09:22', '2021-06-12 04:25:21', '2021-06-14 05:34:42', NULL),
(9, 'Công an TPHCM nói về những tin đồn liên quan đến vụ bắt giữ Youtuber Lê Chí Thành', 'Theo đại diện Công an TPHCM, những tin đồn của một số đối tượng nhắm vào Công an TPHCM liên quan đến việc bắt giữ Youtuber Lê Chí Thành như công an lắp bổ sung biển báo giao thông, công an nhéo tai bị can… lan truyền trên mạng xã hội, đều có nội dung xuyên tạc, sai sự thật.', 'cong-an-tphcm-noi-ve-nhung-tin-don-lien-quan-den-vu-bat-giu-youtuber-le-chi-thanh', '<p>Tối 11/6, Văn ph&ograve;ng UBND TPHCM đ&atilde; tổ chức họp b&aacute;o th&ocirc;ng tin về t&igrave;nh h&igrave;nh kinh tế x&atilde; hội 5 th&aacute;ng đầu năm 2021.</p>\r\n\r\n<p><img alt=\"Công an TPHCM nói về những tin đồn liên quan đến vụ bắt giữ Youtuber Lê Chí Thành - 1\" src=\"https://cdn.24h.com.vn/upload/2-2021/images/2021-06-12/1623460140-46662fe90a95c654c5bd638a8b6ae501-width645height432.jpg\" style=\"width:660px\" /></p>\r\n\r\n<p>Văn ph&ograve;ng UBND TPHCM tổ chức họp b&aacute;o tối 11/6</p>\r\n\r\n<p>Trả lời c&acirc;u hỏi của Tiền Phong về một số c&aacute;o buộc lan truyền tr&ecirc;n mạng x&atilde; hội li&ecirc;n quan đến bị can L&ecirc; Ch&iacute; Th&agrave;nh, Ph&oacute; Trưởng ph&ograve;ng Cảnh s&aacute;t điều tra (PC01) C&ocirc;ng an TPHCM Trần Thanh Giang khẳng định: C&aacute;c c&aacute;o buộc về việc C&ocirc;ng an lắp biển b&aacute;o giao th&ocirc;ng bổ sung nhằm hợp thức h&oacute;a việc thổi phạt; tiếng chửi thề, tấm ảnh nh&eacute;o lỗ tai L&ecirc; Ch&iacute; Th&agrave;nh khi đưa bị can n&agrave;y về cơ quan c&ocirc;ng an&hellip;l&agrave; ho&agrave;n to&agrave;n sai sự thật, l&agrave; sản phẩm cắt gh&eacute;p.</p>\r\n\r\n<p>&ldquo;Đối tượng L&ecirc; Ch&iacute; Th&agrave;nh thường đi theo nh&oacute;m. Nh&oacute;m đối tượng tr&agrave; trộn để g&acirc;y rối, cản trở cơ quan chức năng thực thi c&ocirc;ng vụ nhằm mục đ&iacute;ch xuy&ecirc;n tạc&rdquo;, l&atilde;nh đạo PC01 C&ocirc;ng an TPHCM nhấn mạnh v&agrave; cho biết, C&ocirc;ng an đ&atilde; khởi tố vụ &aacute;n, khởi tố bị can, bắt L&ecirc; Ch&iacute; Th&agrave;nh để điều tra l&agrave;m r&otilde; h&agrave;nh vi phạm tội v&agrave; sắp tới sẽ c&oacute; th&ocirc;ng tin cụ thể cho b&aacute;o ch&iacute;.</p>\r\n\r\n<p><img alt=\"Công an TPHCM nói về những tin đồn liên quan đến vụ bắt giữ Youtuber Lê Chí Thành - 2\" src=\"https://cdn.24h.com.vn/upload/2-2021/images/2021-06-12/1623460140-ad3ece104d1c069e5ad51b353b902df4-width645height484.jpg\" style=\"width:660px\" /></p>\r\n\r\n<p>Youtuber L&ecirc; Ch&iacute; Th&agrave;nh c&oacute; h&agrave;nh vi chống đối lực lượng CSGT l&agrave;m nhiệm vụ trước khi bị khởi tố, bắt tạm giam</p>\r\n\r\n<p>Ng&agrave;y 14/4 vừa qua, đối tượng L&ecirc; Ch&iacute; Th&agrave;nh (38 tuổi, thường tr&uacute; tại huyện H&agrave;m T&acirc;n &ndash; B&igrave;nh Thuận; tạm tr&uacute; tại quận 12) đ&atilde; bị C&ocirc;ng an TP.Thủ Đức (TPHCM) bắt tạm giam về h&agrave;nh vi &ldquo;Chống người thi h&agrave;nh c&ocirc;ng vụ&rdquo; theo Điều 330 Bộ Luật h&igrave;nh sự. Quyết định khởi tố vụ &aacute;n, khởi tố bị can, lệnh bắt tạm giam đối với L&ecirc; Ch&iacute; Th&agrave;nh đ&atilde; được Viện KSND TP.Thủ Đức ph&ecirc; chuẩn.</p>\r\n\r\n<p>Theo th&ocirc;ng tin từ c&ocirc;ng an TP Thủ Đức, s&aacute;ng 20/3, tổ CSGT thuộc Đội Rạch Chiếc (Ph&ograve;ng CSGT đường bộ - đường sắt (PC08) C&ocirc;ng an TPHCM) l&agrave;m nhiệm vụ tr&ecirc;n xa lộ H&agrave; Nội (đoạn qua phường Hiệp Ph&uacute;, TP.Thủ Đức). Lực lượng c&ocirc;ng an ph&aacute;t hiện &ocirc; t&ocirc; BS 51H - 108.21 lưu th&ocirc;ng trong l&agrave;n đường d&agrave;nh cho xe hai b&aacute;nh n&ecirc;n ra hiệu dừng xe để kiểm tra, xử l&yacute;.</p>\r\n\r\n<p>Người điều khiển &ocirc; t&ocirc; l&agrave; L&ecirc; Ch&iacute; Th&agrave;nh chỉ xuất tr&igrave;nh được giấy ph&eacute;p l&aacute;i xe mang t&ecirc;n L&ecirc; Ch&iacute; Th&agrave;nh, giấy đăng kiểm, giấy đăng k&yacute; xe kh&ocirc;ng hợp lệ. Từ những vi phạm n&agrave;y, tổ CSGT lập bi&ecirc;n bản tạm giữ phương tiện để xử l&yacute;.</p>\r\n\r\n<p>Khi CSGT điều xe cẩu đến đưa &ocirc; t&ocirc; vi phạm về trụ sở th&igrave; L&ecirc; Ch&iacute; Th&agrave;nh c&oacute; h&agrave;nh vi cản trở lực lượng chức năng l&agrave;m nhiệm vụ.</p>\r\n\r\n<p>Tổ CSGT đ&atilde; đề nghị C&ocirc;ng an P.Hiệp Ph&uacute; c&oacute; mặt phối hợp xử l&yacute;, mời Th&agrave;nh về l&agrave;m việc, đối tượng tiếp tục c&oacute; những h&agrave;nh vi, lời lẽ cản trở lực lượng thi h&agrave;nh c&ocirc;ng vụ. Phải nhiều giờ sau C&ocirc;ng an mới đưa được &ocirc; t&ocirc; vi phạm đi khỏi hiện trường.</p>\r\n\r\n<p>Mới đ&acirc;y, C&ocirc;ng an TPHCM đ&atilde; tổ chức buổi họp b&aacute;o cung cấp th&ocirc;ng tin về việc bắt giữ L&ecirc; Ch&iacute; Th&agrave;nh. Theo Thiếu tướng Đinh Thanh Nh&agrave;n, Ph&oacute; Gi&aacute;m đốc C&ocirc;ng an TPHCM, Youtuber L&ecirc; Ch&iacute; Th&agrave;nh đang bị xem x&eacute;t xử l&yacute; về h&agrave;nh vi lợi dụng c&aacute;c quyền tự do d&acirc;n chủ, ngo&agrave;i tội danh vừa bị khởi tố.</p>\r\n\r\n<p><img alt=\"Công an TPHCM nói về những tin đồn liên quan đến vụ bắt giữ Youtuber Lê Chí Thành - 3\" src=\"https://cdn.24h.com.vn/upload/2-2021/images/2021-06-12/1623460140-5a54aa35f1c8adce933a860d96f84c85-width645height363.jpeg\" style=\"width:660px\" /></p>\r\n\r\n<p>Thiếu tướng Đinh Thanh Nh&agrave;n, Ph&oacute; gi&aacute;m đốc C&ocirc;ng an TPHCM</p>\r\n\r\n<p>Người n&agrave;y từng nhiều lần thực hiện h&agrave;nh vi cản trở lực lượng chức năng đang thực hiện nhiệm vụ, &quot;tạo cớ khi&ecirc;u kh&iacute;ch, xuy&ecirc;n tạc đưa th&ocirc;ng tin sai sự thật về hoạt động c&ocirc;ng vụ&quot; sau đ&oacute; ph&aacute;t t&aacute;n l&ecirc;n mạng x&atilde; hội g&acirc;y t&aacute;c động xấu đến an ninh trật tự.</p>\r\n\r\n<p>&quot;L&ecirc; Ch&iacute; Th&agrave;nh lập k&ecirc;nh Youtube đăng tải c&aacute;c video l&agrave; nhằm trục lợi. C&ocirc;ng an TP Thủ Đức đang mời những c&aacute; nh&acirc;n li&ecirc;n quan đến người n&agrave;y để củng cố hồ sơ&quot;, thiếu tướng Đinh Thanh Nh&agrave;n cho hay.</p>\r\n\r\n<p>Được biết, &ocirc;ng L&ecirc; Ch&iacute; Th&agrave;nh l&agrave; cựu đại &uacute;y, c&oacute; gần 20 năm trong ng&agrave;nh c&ocirc;ng an, c&ocirc;ng t&aacute;c tại một số trại giam thuộc Bộ C&ocirc;ng an. Bị can n&agrave;y đ&atilde; c&oacute; những tố c&aacute;o v&agrave; cho rằng l&atilde;nh đạo trại giam nơi c&ocirc;ng t&aacute;c c&oacute; nhiều sai phạm.</p>\r\n\r\n<p>Tuy nhi&ecirc;n, Cục Quản l&yacute; trại giam Bộ C&ocirc;ng an x&aacute;c định, L&ecirc; Ch&iacute; Th&agrave;nh đ&atilde; nhiều lần vi phạm nghi&ecirc;m trọng trong thời gian c&ocirc;ng t&aacute;c.</p>\r\n\r\n<p>Ng&agrave;y 31/7/2020, Cục Quản l&yacute; trại giam c&oacute; quyết định kỷ luật L&ecirc; Ch&iacute; Th&agrave;nh bằng h&igrave;nh thức tước danh hiệu CAND.</p>\r\n\r\n<p>Bị can L&ecirc; Ch&iacute; Th&agrave;nh lập ra nhiều trang mạng x&atilde; hội v&agrave; tự cho m&igrave;nh thực hiện quyền &quot;gi&aacute;m s&aacute;t&quot; lực lượng c&ocirc;ng an. Bị can L&ecirc; Ch&iacute; Th&agrave;nh c&oacute; mặt ở nhiều địa điểm, c&oacute; những h&agrave;nh vi khi&ecirc;u kh&iacute;ch lực lượng chức năng, chủ yếu l&agrave; CSGT rồi đăng tr&ecirc;n c&aacute;c trang mạng.</p>\r\n\r\n<p>Nguồn: https://tienphong.vn/cong-an-tphcm-noi-ve-nhung-tin-don-lien-quan-den-vu-bat-giu-youtuber-le-chi-thanh-post1345263.tpo</p>', '/storage/app/public/images/blog/1623460140-46662fe90a95c654c5bd638a8b6ae501-width645height432.jpg', 1, '2021-06-22 06:09:22', '2021-06-12 04:26:49', '2021-06-14 05:34:42', NULL),
(10, 'Thời trang ở nhà mùa Covid19: Tiểu Thư RMIT diện đồ ngủ quyến rũ chỉ để... chờ shipper', 'Dù ở nhà chống dịch nhưng các mỹ nhân showbiz không ngại lên đồ, chụp hình đăng mạng xã hội, tương tác với người hâm mộ.', 'thoi-trang-o-nha-mua-covid19-tieu-thu-rmit-dien-do-ngu-quyen-ru-chi-de-cho-shipper', '<p>Thực hiện gi&atilde;n c&aacute;ch tại nh&agrave; để chống dịch, nhiều nghệ sĩ c&oacute; thời gian chia sẻ về cuộc sống đời thường với người h&acirc;m mộ. C&oacute; người khoe th&agrave;nh t&iacute;ch nấu ăn, dọn dẹp tổ ấm.&nbsp;C&oacute; người l&ecirc;n đồ thời thượng, trang điểm xinh đẹp để chụp h&igrave;nh, lấp đầy thời gian rảnh rỗi. Trong đ&oacute;, thời trang m&ugrave;a dịch của sao nhận được sự quan t&acirc;m lớn từ người h&acirc;m mộ</p>\r\n\r\n<p>Điểm qua những outfit của loạt mỹ nh&acirc;n Việt khi ở nh&agrave;, bạn sẽ thấy họ đầu tư thế n&agrave;o để lu&ocirc;n đẹp trong mắt c&ocirc;ng ch&uacute;ng.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Thời trang ở nhà mùa Covid19: Tiểu Thư RMIT diện đồ ngủ quyến rũ chỉ để... chờ shipper - 1\" src=\"https://cdn.24h.com.vn/upload/2-2021/images/2021-06-10/Thoi-trang-o-nha-chong-dich-Tieu-Thu-RMIT-e-ap-voi-noi-y-Hien-Ho-hoa-nang-tho-voi-bodysuit-batch_192965634_2252622524868792_24358680887199272-1623308317-47-width800height995.jpg\" style=\"width:660px\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>N&agrave;ng tiểu thư RMIT l&agrave; hoa hậu Huỳnh Ti&ecirc;n khoe v&oacute;c d&aacute;ng gợi cảm với đầm ngủ mong manh tại nh&agrave;. Những bộ đồ ngủ chất liệu mềm mỏng, nhẹ nh&agrave;ng gi&uacute;p bạn c&oacute; được cảm gi&aacute;c thoải m&aacute;i nhất khi ở nh&agrave;. B&ecirc;n cạnh đ&oacute;, kiểu d&aacute;ng thanh lịch lại mang tới vẻ đẹp rất thời trang, kh&ocirc;ng ph&ocirc; cho người đẹp.</p>\r\n\r\n<p><img alt=\"Thời trang ở nhà mùa Covid19: Tiểu Thư RMIT diện đồ ngủ quyến rũ chỉ để... chờ shipper - 3\" src=\"https://cdn.24h.com.vn/upload/2-2021/images/2021-06-10/Thoi-trang-o-nha-chong-dich-Tieu-Thu-RMIT-e-ap-voi-noi-y-Hien-Ho-hoa-nang-tho-voi-bodysuit-batch_198196570_2251919304939114_50704325364047854-1623308318-598-width800height1061.jpg\" style=\"width:660px\" /></p>\r\n\r\n<p>Những outfit mặc ở nh&agrave; được Huỳnh Ti&ecirc;n đăng tải li&ecirc;n tục với người h&acirc;m mộ. C&ocirc; chia sẻ ngắn tr&ecirc;n trang c&aacute; nh&acirc;n set đồ ngủ in hoạ tiết ấn tượng. C&ocirc; kết hợp với &aacute;o nội y t&ocirc;n v&ograve;ng 1, ẩn hiện tăng th&ecirc;m sức quyến rũ. Theo tiểu thư RMIT, trang phục n&agrave;y được c&ocirc; chăm ch&uacute;t cẩn thận chỉ để nhận h&agrave;ng từ shipper.</p>\r\n\r\n<p><img alt=\"Thời trang ở nhà mùa Covid19: Tiểu Thư RMIT diện đồ ngủ quyến rũ chỉ để... chờ shipper - 4\" src=\"https://cdn.24h.com.vn/upload/2-2021/images/2021-06-10/Thoi-trang-o-nha-chong-dich-Tieu-Thu-RMIT-e-ap-voi-noi-y-Hien-Ho-hoa-nang-tho-voi-bodysuit-batch_196971491_848195799455766_529137405764813109-1623308318-344-width800height1066.jpg\" style=\"width:660px\" /></p>\r\n\r\n<p>Thu&yacute; An mừng tuổi mới theo c&aacute;ch chống dịch rất ấn tượng. C&ocirc; diện l&ecirc;n m&igrave;nh set đồ m&agrave;u hồng nữ t&iacute;nh, chi tiết &aacute;o bu&ocirc;ng c&uacute;c tăng th&ecirc;m độ gợi cảm cho người đẹp. Set đồ từng được rất nhiều hoa, &aacute; hậu mặc thời gian qua, hứa hẹn tạo n&ecirc;n xu hướng trong tương lai.</p>\r\n\r\n<p><img alt=\"Thời trang ở nhà mùa Covid19: Tiểu Thư RMIT diện đồ ngủ quyến rũ chỉ để... chờ shipper - 5\" src=\"https://cdn.24h.com.vn/upload/2-2021/images/2021-06-10/Thoi-trang-o-nha-chong-dich-Tieu-Thu-RMIT-e-ap-voi-noi-y-Hien-Ho-hoa-nang-tho-voi-bodysuit-batch_194982303_350038706480105_536150951938828727-1623308318-809-width800height1199.jpg\" style=\"width:660px\" /></p>\r\n\r\n<p>Hiền Hồ lu&ocirc;n duy tr&igrave; phong độ thời trang ổn định. Những thước h&igrave;nh c&ocirc; đăng tải tr&ecirc;n trang c&aacute; nh&acirc;n được chăm ch&uacute;t kh&aacute; kỹ c&agrave;ng. H&igrave;nh ảnh mới đ&acirc;y, nữ ca sĩ mặc bodysuit m&agrave;u trắng kết hợp c&ugrave;ng phụ kiện tất t&ocirc;ng xuyệt t&ocirc;ng, t&ocirc;n l&ecirc;n n&eacute;t đẹp mơ m&agrave;ng như n&agrave;ng thơ.</p>\r\n\r\n<p><img alt=\"Thời trang ở nhà mùa Covid19: Tiểu Thư RMIT diện đồ ngủ quyến rũ chỉ để... chờ shipper - 6\" src=\"https://cdn.24h.com.vn/upload/2-2021/images/2021-06-10/Thoi-trang-o-nha-chong-dich-Tieu-Thu-RMIT-e-ap-voi-noi-y-Hien-Ho-hoa-nang-tho-voi-bodysuit-batch_196668472_350047086479267_784572306696545955-1623308318-778-width800height1199.jpg\" style=\"width:660px\" /></p>\r\n\r\n<p>Lợi thế về h&igrave;nh thể gi&uacute;p c&ocirc; ghi điểm trong mọi phong c&aacute;ch thời trang. Hiền Hồ được nhận x&eacute;t ng&agrave;y c&agrave;ng quyến rũ v&agrave; trưởng th&agrave;nh hơn trong việc x&acirc;y dựng h&igrave;nh ảnh. Sự gợi cảm của c&ocirc; c&oacute; chọn lọc v&agrave; chừng mực, l&agrave; yếu tố gi&uacute;p nữ ca sĩ chiếm được t&igrave;nh cảm từ người h&acirc;m mộ.</p>\r\n\r\n<p><img alt=\"Thời trang ở nhà mùa Covid19: Tiểu Thư RMIT diện đồ ngủ quyến rũ chỉ để... chờ shipper - 7\" src=\"https://cdn.24h.com.vn/upload/2-2021/images/2021-06-10/Thoi-trang-o-nha-chong-dich-Tieu-Thu-RMIT-e-ap-voi-noi-y-Hien-Ho-hoa-nang-tho-voi-bodysuit-batch_187557270_3943551525713064_31703251698492583-1623309464-451-width800height1066.jpg\" style=\"width:660px\" /></p>\r\n\r\n<p>D&ugrave; ở nh&agrave; nhưng Kh&aacute;nh Linh vẫn c&oacute; &ecirc; k&iacute;p hỗ trợ chụp h&igrave;nh đẹp như studio. C&ocirc; từng chia sẻ việc tận dụng nắng chiều tại nh&agrave; để c&oacute; &aacute;nh s&aacute;ng đẹp lung linh cho mỗi khoảnh khắc. Kh&aacute;nh Linh chọn set đồ nội y m&agrave;u cam bắt mắt kết hợp với quần jean tăng độ c&aacute; t&iacute;nh. Th&acirc;n h&igrave;nh săn chắc với cơ bụng gồ ghề của ch&acirc;n d&agrave;i thu h&uacute;t mọi &aacute;nh nh&igrave;n.</p>\r\n\r\n<p><img alt=\"Thời trang ở nhà mùa Covid19: Tiểu Thư RMIT diện đồ ngủ quyến rũ chỉ để... chờ shipper - 8\" src=\"https://cdn.24h.com.vn/upload/2-2021/images/2021-06-10/Thoi-trang-o-nha-chong-dich-Tieu-Thu-RMIT-e-ap-voi-noi-y-Hien-Ho-hoa-nang-tho-voi-bodysuit-batch_189718642_10226240471899277_7227154389020940-1623309464-463-width800height1116.jpg\" style=\"width:660px\" /></p>\r\n\r\n<p>Thi&ecirc;n Nga l&agrave; một trong những ch&acirc;n d&agrave;i chăm chỉ l&ecirc;n đồ chụp h&igrave;nh nhất trong thời điểm gi&atilde;n c&aacute;ch x&atilde; hội. C&ocirc; lăng x&ecirc; nhiều mốt mới lạ, từ c&aacute; t&iacute;nh tới nữ t&iacute;nh. C&ocirc; đầu tư &aacute;o quần, phụ kiện tới layout trang điểm ph&ugrave; hợp. Được biết, mẹ c&ocirc; l&agrave; người ghi lại những shoot h&igrave;nh n&agrave;y.</p>\r\n\r\n<p><img alt=\"Thời trang ở nhà mùa Covid19: Tiểu Thư RMIT diện đồ ngủ quyến rũ chỉ để... chờ shipper - 9\" src=\"https://cdn.24h.com.vn/upload/2-2021/images/2021-06-10/Thoi-trang-o-nha-chong-dich-Tieu-Thu-RMIT-e-ap-voi-noi-y-Hien-Ho-hoa-nang-tho-voi-bodysuit-batch_195472788_1429412804083463_67770524275480022-1623309464-159-width800height1000.jpg\" style=\"width:660px\" /></p>\r\n\r\n<p>M&acirc;u Thuỷ c&oacute; lựa chọn kh&aacute;c biệt về phong c&aacute;ch thời trang. C&ocirc; l&ecirc;n đồ k&iacute;n đ&aacute;o nhưng sắc m&agrave;u, mang lại năng lượng t&iacute;ch cực cho người nh&igrave;n.</p>\r\n\r\n<p>Nguồn: http://danviet.vn/thoi-trang-o-nha-mua-covid19-tieu-thu-rmit-dien-do-ngu-quyen-ru-chi-de-cho-shipper-5020211261126181.htm</p>', '/storage/app/public/images/blog/Thoi-trang-o-nha-chong-dich-Tieu-Thu-RMIT-e-ap-voi-noi-y-Hien-Ho-hoa-nang-tho-voi-bodysuit-batch_192965634_2252622524868792_24358680887199272-1623308317-47-width800height995.jpg', 1, '2021-06-22 06:09:22', '2021-06-12 04:28:31', '2021-06-14 05:34:42', NULL),
(11, 'Tại sao một số người gặp phản ứng phụ khi tiêm vắc xin COVID-19?', 'Các tác dụng phụ tạm thời bao gồm nhức đầu, mệt mỏi và sốt là những dấu hiệu hệ thống miễn dịch đang phục hồi - một phản ứng bình thường với vắc xin. Các phản ứng này xảy ra khá thông dụng.', 'tai-sao-mot-so-nguoi-gap-phan-ung-phu-khi-tiem-vac-xin-covid-19', '<p><img alt=\"Tại sao một số người gặp phản ứng phụ khi tiêm vắc xin COVID-19? - 1\" src=\"https://cdn.24h.com.vn/upload/2-2021/images/2021-06-12//1623465863-639562bc82784ebb9dc43ab6c9bcbbed-width1200height675.jpg\" style=\"width:660px\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Tiến sĩ Peter Marks, gi&aacute;m đốc&nbsp;<a href=\"https://www.24h.com.vn/vac-xin-covid-19-c46e6432.html\" title=\"vắc xin\">vắc xin</a>&nbsp;của Cục Quản l&yacute; Thực phẩm v&agrave; Dược phẩm Mỹ, người đ&atilde; cảm thấy mệt mỏi sau liều ti&ecirc;m&nbsp;<a href=\"https://www.24h.com.vn/vac-xin-covid-19-c46e6432.html\" title=\"vắc xin COVID-19\">vắc xin COVID-19</a>&nbsp;đầu ti&ecirc;n cho biết: &ldquo;Một ng&agrave;y sau khi ti&ecirc;m những loại vắc xin n&agrave;y, t&ocirc;i sẽ kh&ocirc;ng l&ecirc;n kế hoạch cho bất kỳ hoạt động thể chất vất vả n&agrave;o&rdquo;.&nbsp;</p>\r\n\r\n<p>Đ&acirc;y l&agrave; những g&igrave; xảy ra trong cơ thể sau khi ti&ecirc;m vắc xin: Hệ thống miễn dịch c&oacute; hai nh&aacute;nh ch&iacute;nh v&agrave; hoạt động đầu ti&ecirc;n ngay khi cơ thể ph&aacute;t hiện ra kẻ x&acirc;m nhập từ b&ecirc;n ngo&agrave;i. C&aacute;c tế b&agrave;o bạch cầu tr&agrave;n đến vị tr&iacute; ti&ecirc;m, g&acirc;y ra triệu chứng phản ứng như ớn lạnh, đau nhức, mệt mỏi v&agrave; c&aacute;c t&aacute;c dụng phụ kh&aacute;c.</p>\r\n\r\n<p>Bước phản ứng nhanh n&agrave;y của hệ thống miễn dịch c&oacute; xu hướng suy yếu theo tuổi t&aacute;c. Đ&oacute; l&agrave; l&yacute; do m&agrave; những người trẻ tuổi thường gặp t&aacute;c dụng phụ thường xuy&ecirc;n hơn người lớn tuổi. Ngo&agrave;i ra, một số loại vắc xin chỉ đơn giản l&agrave; g&acirc;y ra nhiều phản ứng hơn những loại kh&aacute;c.</p>\r\n\r\n<p>Tr&ecirc;n thực tế, cơ thể của mỗi người c&oacute; phản ứng kh&aacute;c nhau với việc ti&ecirc;m vắc xin. Nếu bạn kh&ocirc;ng cảm thấy g&igrave; một hoặc hai ng&agrave;y sau ti&ecirc;m một hoặc hai liều, điều đ&oacute; kh&ocirc;ng c&oacute; nghĩa l&agrave; vắc xin kh&ocirc;ng hoạt động.</p>\r\n\r\n<p>B&ecirc;n trong cơ thể, c&aacute;c mũi ti&ecirc;m sẽ th&uacute;c đẩy chuyển động phần thứ hai của hệ thống miễn dịch của bạn, khiến hệ thống cung cấp sự bảo vệ thực sự khỏi virus bằng c&aacute;ch sản xuất kh&aacute;ng thể.</p>\r\n\r\n<p><img alt=\"Tại sao một số người gặp phản ứng phụ khi tiêm vắc xin COVID-19? - 3\" src=\"https://cdn.24h.com.vn/upload/2-2021/images/2021-06-12//1623465863-e3f8cbd7bd5b05d2aa2edebc80130ba5-width693height389.jpg\" style=\"width:660px\" /></p>\r\n\r\n<p>Một t&aacute;c dụng phụ phiền to&aacute;i kh&aacute;c: Khi hệ thống miễn dịch k&iacute;ch hoạt, n&oacute; cđ&ocirc;i khi g&acirc;y sưng tạm thời ở c&aacute;c hạch bạch huyết, chẳng hạn như hạch dưới c&aacute;nh tay. Phụ nữ được khuyến kh&iacute;ch l&ecirc;n lịch chụp X-quang tuyến v&uacute; định kỳ trước khi chủng ngừa COVID-19 để tr&aacute;nh nhầm lẫn một nốt sưng với ung thư.</p>\r\n\r\n<p>Tuy nhi&ecirc;n, kh&ocirc;ng phải tất cả c&aacute;c t&aacute;c dụng phụ đều l&agrave; b&igrave;nh thường. Sau h&agrave;ng trăm triệu liều vắc xin được sử dụng tr&ecirc;n khắp thế giới - v&agrave; gi&aacute;m s&aacute;t an to&agrave;n nghi&ecirc;m ngặt - một số rủi ro nghi&ecirc;m trọng đ&atilde; được x&aacute;c định. Một tỷ lệ rất nhỏ những người ti&ecirc;m vắc xin do AstraZeneca v&agrave; Johnson &amp; Johnson sản xuất đ&atilde; b&aacute;o c&aacute;o bị gặp t&igrave;nh trạng m&aacute;u đ&ocirc;ng bất thường. Một số quốc gia đ&atilde; kh&ocirc;ng ti&ecirc;m vắc xin COVID-19 cho người lớn tuổi song c&aacute;c cơ quan quản l&yacute; cho biết lợi &iacute;ch của việc chủng ngừa vẫn lớn hơn rủi ro.</p>\r\n\r\n<p>Một số người thỉnh thoảng c&oacute; c&aacute;c phản ứng dị ứng nghi&ecirc;m trọng sau khi ti&ecirc;m vắc xin. Đ&oacute; l&agrave; l&yacute; do tại sao bạn được y&ecirc;u cầu ở lại khoảng 15 ph&uacute;t sau khi ti&ecirc;m bất kỳ loại vắc xin COVID-19 n&agrave;o - để đảm bảo mọi phản ứng c&oacute; thể được điều trị kịp thời.</p>\r\n\r\n<p>Cuối c&ugrave;ng, c&aacute;c nh&agrave; chức tr&aacute;ch đang cố gắng x&aacute;c định xem liệu t&igrave;nh trạng vi&ecirc;m tim tạm thời c&oacute; thể xảy ra với nhiều loại bệnh nhiễm tr&ugrave;ng cũng c&oacute; thể l&agrave; một t&aacute;c dụng phụ hiếm gặp sau vắc xin mRNA, loại do Pfizer v&agrave; Moderna sản xuất hay kh&ocirc;ng. C&aacute;c quan chức y tế Mỹ cho biết họ chưa thể biết liệu c&oacute; mối li&ecirc;n hệ n&agrave;o hay kh&ocirc;ng nhưng n&oacute;i rằng họ đang theo d&otilde;i một số lượng nhỏ c&aacute;c b&aacute;o c&aacute;o, chủ yếu l&agrave; nam thanh ni&ecirc;n hoặc thanh ni&ecirc;n, về t&igrave;nh trạng n&agrave;y.</p>\r\n\r\n<p>Nguồn: https://suckhoedoisong.vn/tai-sao-mot-so-nguoi-gap-phan-ung-phu-khi-tiem-vac-xin-covid-19-n194825.html</p>', '/storage/app/public/images/blog/1623465863-639562bc82784ebb9dc43ab6c9bcbbed-width1200height675.jpg', 1, '2021-06-22 06:09:22', '2021-06-12 04:29:51', '2021-06-14 05:34:42', NULL),
(12, 'Ngỡ ngàng nhà tiên tri EURO: Đoán tỉ số trúng 100%, đúng cả người phản lưới', 'Một CĐV Italia gây ngỡ ngàng khi dự đoán đúng tỉ số 100% ở trận khai mạc EURO.', 'ngo-ngang-nha-tien-tri-euro-doan-ti-so-trung-100-dung-ca-nguoi-phan-luoi', '<p>ĐT Italia vừa c&oacute; m&agrave;n ra qu&acirc;n m&atilde;n nh&atilde;n tại&nbsp;<a href=\"https://www.24h.com.vn/euro-2021-c955.html\" title=\"VCK EURO 2021\">VCK EURO 2021</a>&nbsp;với chiến thắng 3-0 trước ĐT Thổ Nhĩ Kỳ. B&agrave;n thắng mở m&agrave;n cho giải đấu lần n&agrave;y lại l&agrave; một pha phản lưới nh&agrave; v&agrave; Merih Demiral của Thổ Nhĩ Kỳ l&agrave; t&aacute;c giả bất đắc dĩ. Hai b&agrave;n c&ograve;n lại của ĐT &Yacute; do c&ocirc;ng của Ciro Immobile v&agrave; Lorenzo Insigne.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Ngỡ ngàng nhà tiên tri EURO: Đoán tỉ số trúng 100%, đúng cả người phản lưới - 1\" src=\"https://cdn.24h.com.vn/upload/2-2021/images/2021-06-12/CdV-Italia-22-660-1623452509-555-width660height449.jpg\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>ĐT Italia thắng ĐT Thổ Nhĩ Kỳ trong ng&agrave;y ra qu&acirc;n</p>\r\n\r\n<p>Chiến thắng n&agrave;y gi&uacute;p ĐT &Yacute; c&oacute; cơ hội lớn đi tiếp d&ugrave; mới chỉ thi đấu một trận. Bởi vậy, c&aacute;c kh&aacute;n giả của đội b&oacute;ng n&agrave;y cực vui v&agrave; họ c&ograve;n phấn kh&iacute;ch khi một cổ động vi&ecirc;n người &Yacute; tạo ra một điều &ldquo;kh&ocirc;ng tưởng&rdquo;.</p>\r\n\r\n<p>Trước khi trận đấu bắt đầu nhiều giờ đồng hồ, t&agrave;i khoản ch&iacute;nh thức tr&ecirc;n mạng x&atilde; hội của VCK&nbsp;<a href=\"https://www.24h.com.vn/euro-2021-c955.html\" title=\"EURO 2021\">EURO 2021</a>&nbsp;c&oacute; đặt c&acirc;u hỏi dự đo&aacute;n tỉ số trận đấu v&agrave; cầu thủ ghi b&agrave;n. Một cổ động vi&ecirc;n của &Yacute; c&oacute; t&ecirc;n t&agrave;i khoản l&agrave; @VanJuice đ&atilde; dự đo&aacute;n đ&uacute;ng được tất cả điều kiện tr&ecirc;n.</p>\r\n\r\n<p>Ngay cả việc Demiral của Thổ Nhĩ Kỳ phản lưới nh&agrave; cũng được t&agrave;i khoản n&agrave;y dự đo&aacute;n ch&iacute;nh x&aacute;c. T&agrave;i khoản n&agrave;y chỉ dự đo&aacute;n sai thứ tự của những người ghi b&agrave;n, (Immobile, Insigne, Demiral phản lưới) thay v&igrave; (Demiral phản lưới, Immobile, Insigne).</p>\r\n\r\n<p><img alt=\"Ngỡ ngàng nhà tiên tri EURO: Đoán tỉ số trúng 100%, đúng cả người phản lưới - 3\" src=\"https://cdn.24h.com.vn/upload/2-2021/images/2021-06-12/CdV-Italia-23-660-1623452647-339-width660height714.jpg\" /></p>\r\n\r\n<p>Ban tổ chức tổ chức tr&ograve; chơi dự đo&aacute;n tỉ số v&agrave;....</p>\r\n\r\n<p><img alt=\"Ngỡ ngàng nhà tiên tri EURO: Đoán tỉ số trúng 100%, đúng cả người phản lưới - 4\" src=\"https://cdn.24h.com.vn/upload/2-2021/images/2021-06-12/CdV-Italia-24-660-1623452647-601-width660height384.jpg\" /></p>\r\n\r\n<p>kết quả dự đo&aacute;n thực sự kh&oacute; tin...</p>\r\n\r\n<p>Điều n&agrave;y thực sự rất kh&oacute; tin bởi x&aacute;c suất xảy ra điều n&agrave;y l&agrave; qu&aacute; nhỏ. &nbsp;Ngay cả c&aacute;c &nbsp;nh&agrave; c&aacute;i cũng chẳng đưa ra tỉ lệ cho phương &aacute;n n&agrave;y bởi x&aacute;c suất&nbsp;xảy ra l&agrave; cực kỳ thấp. N&ecirc;n nhớ rằng, dự đo&aacute;n tỉ số trận đấu đ&atilde; rất kh&oacute;, dự đo&aacute;n cầu thủ ghi b&agrave;n c&ograve;n kh&oacute; hơn v&agrave; dự đo&aacute;n được cả cầu thủ đ&aacute; phản lưới l&agrave; điều gần như kh&ocirc;ng tưởng.</p>\r\n\r\n<p>Ch&iacute;nh bởi vậy, t&agrave;i khoản ch&iacute;nh thức của EURO 2021 cũng phải sử dụng biểu cảm &ldquo;bất ngờ&rdquo; v&agrave; &ldquo;ngạc nhi&ecirc;n&rdquo; khi c&ocirc;ng bố kết quả. Trong khi đ&oacute;, cộng đồng mạng phản ứng rất tr&aacute;i chiều. &ldquo;Ph&ugrave; thủy&rdquo;, &ldquo;Người tới từ tương lai&rdquo;, &ldquo;Kẻ may mắn vĩ đại&rdquo;&hellip; l&agrave; những biệt danh t&iacute;ch cực m&agrave; người dự đo&aacute;n đ&uacute;ng nhận được.</p>\r\n\r\n<p>Trong khi đ&oacute;, một số b&igrave;nh luận ti&ecirc;u cực đặt giả thiết liệu t&agrave;i khoản n&agrave;y c&oacute; gian lận g&igrave; hay kh&ocirc;ng? C&oacute; sự &ldquo;chỉnh sửa&rdquo; b&agrave;i viết hay trận đấu đ&atilde; bị d&agrave;n xếp tỉ số từ trước? Tuy nhi&ecirc;n, &iacute;t người đồng t&igrave;nh với những &yacute; kiến ti&ecirc;u cực n&agrave;y. Đa phần số đ&ocirc;ng đều cho rằng t&agrave;i khoản n&agrave;y &ldquo;ăn may&rdquo; được khoảng khắc kh&ocirc;ng tưởng.</p>\r\n\r\n<p>Nguồn: https://tcdulichtphcm.vn/the-thao/ngo-ngang-nha-tien-tri-euro-doan-ti-so-trung-100-dung-ca-nguoi-phan-luoi-c28a8659.html</p>', '/storage/app/public/images/blog/CdV-Italia-22-660-1623452509-555-width660height449.jpg', 1, '2021-06-22 06:09:22', '2021-06-12 04:31:10', '2021-06-14 05:34:42', NULL);
INSERT INTO `posts` (`id`, `title`, `desc_short`, `slug`, `body`, `avatar`, `status`, `timer_at`, `created_at`, `updated_at`, `deleted_at`) VALUES
(13, 'Đại gia Hà thành chi 10 tỉ sở hữu đàn cá Koi quy tụ toàn “siêu phẩm”, có con lên tới 120 triệu', '85 con cá Koi được chia thành 3 bể cá, đặt ở 3 địa điểm khác nhau, anh Chương Tailor (50 tuổi, Hà Nội) chủ sở hữu của đàn cá này đã tốn nhiều công sức và tiền của để tìm kiếm và đặt mua chúng từ những trại danh tiếng bậc nhất Nhật Bản. Những con cá Koi này có giá dao động từ 1000$ - 5000$ (khoảng 23 – 115 triệu đồng)/con.', 'dai-gia-ha-thanh-chi-10-ti-so-huu-dan-ca-koi-quy-tu-toan-sieu-pham-co-con-len-toi-120-trieu', '<p>Anh Dương Văn Chương (50 tuổi, t&ecirc;n thường gọi l&agrave; Chương Tailor) nổi tiếng trong giới sinh vật cảnh l&agrave; một đại gia &ldquo;chịu chơi&rdquo;. Anh kh&ocirc;ng ngại chi h&agrave;ng chục tỉ đồng cho th&uacute; vui thượng lưu của m&igrave;nh d&agrave;nh cho c&aacute;c lo&agrave;i chim, c&aacute; cảnh. Ngo&agrave;i sở hữu đ&agrave;n chim m&agrave;u độc nhất Việt Nam, anh c&ograve;n l&agrave; chủ nh&acirc;n của 85 ch&uacute; c&aacute; Koi thuộc h&agrave;ng si&ecirc;u phẩm.</p>\r\n\r\n<p>Niềm đam m&ecirc; với c&aacute; bắt đầu khi anh t&igrave;m thấy nguồn cảm hứng đặc biệt với c&aacute;c loại sinh vật cảnh nhiều m&agrave;u sắc. B&ecirc;n cạnh những ch&uacute; chim m&agrave;u đắt đỏ, anh Chương nhờ bạn b&egrave; l&acirc;u năm trong giới chơi c&aacute; Koi chuy&ecirc;n nghiệp giới thiệu v&agrave; t&igrave;m mua những ch&uacute; c&aacute; Koi đầu ti&ecirc;n để bổ sung v&agrave;o bể c&aacute;.</p>\r\n\r\n<p><img alt=\"Đại gia Hà thành chi 10 tỉ sở hữu đàn cá Koi quy tụ toàn “siêu phẩm”, có con lên tới 120 triệu - 1\" src=\"https://cdn.24h.com.vn/upload/3-2020/images/2020-07-24/dai-gia-Ha-thanh-chi-10-ti-so-huu-dan-ca-Koi-quy-tu-toan-sieu-pham-co-con-len-toi-120-trieu-co-1-1595591282-230-width750height500.jpg\" style=\"width:660px\" /></p>\r\n\r\n<p>Đại gia Chương Tailor hiện đang sở hữu khoảng 85 ch&uacute; c&aacute; Koi c&aacute;c loại ở 3 bể&nbsp; đặt tại H&agrave; Nội v&agrave; S&agrave;i G&ograve;n.</p>\r\n\r\n<p>Ưu ti&ecirc;n chất lượng về vẻ đẹp ngo&agrave;i h&igrave;nh l&ecirc;n h&agrave;ng đầu, những ch&uacute; c&aacute; Koi lọt v&agrave;o &ldquo;mắt xanh&rdquo; của đại gia H&agrave; th&agrave;nh phải l&agrave; những ch&uacute; c&aacute; m&agrave;u sắc tốt, mảng m&agrave;u tr&ecirc;n da c&oacute; độ d&agrave;y, sắc n&eacute;t. Tuổi thọ c&aacute; c&ograve;n nhỏ nhưng cấu tr&uacute;c h&igrave;nh thể phải to lớn, c&acirc;n đối, ph&aacute;t triển chiều d&agrave;i vượt bậc so với những con c&aacute; c&ugrave;ng lứa. Những con c&aacute; Koi khi đạt được ti&ecirc;u chuẩn khắc khe n&agrave;y cũng phải qua nhiều v&ograve;ng tuyển chọn v&agrave; c&oacute; gi&aacute; kh&ocirc;ng hề rẻ.</p>\r\n\r\n<p>&ldquo;T&ocirc;i kh&ocirc;ng ngại chuyện đắt rẻ, chỉ cần t&igrave;m được con c&aacute; đạt chuẩn, đ&uacute;ng như mong muốn từ một trang trại uy t&iacute;n th&igrave; t&ocirc;i lu&ocirc;n săn s&agrave;ng chi tiền.&rdquo; &ndash; Anh Chương h&agrave;o hứng chia sẻ.</p>\r\n\r\n<p>Hiện, tổng đ&agrave;n c&aacute; Koi đại gia H&agrave; th&agrave;nh sở hữu khoảng 85 con, được chia th&agrave;nh 3 bể nhỏ ở H&agrave; Nội v&agrave; S&agrave;i G&ograve;n. Trong đ&oacute;, đ&agrave;n c&aacute; 25 con tại nh&agrave; ri&ecirc;ng ở Cửa Bắc - H&agrave; Nội c&oacute; k&iacute;ch thước trung b&igrave;nh khoảng 50 cm với nhiều d&ograve;ng c&aacute; Koi kh&aacute;c nhau quy tụ trong c&ugrave;ng 1 bể c&aacute; như: Kohaku c&oacute; 2 m&agrave;u đặc trưng trắng đỏ; Hi Utsuri (đỏ - đen); Hariwake (trắng &ndash; v&agrave;ng, c&oacute; v&acirc;y kim loại s&aacute;ng b&oacute;ng); Ginshiro (d&ograve;ng kim loại trắng &ndash; đen)&hellip;</p>\r\n\r\n<p><img alt=\"Đại gia Hà thành chi 10 tỉ sở hữu đàn cá Koi quy tụ toàn “siêu phẩm”, có con lên tới 120 triệu - 2\" src=\"https://cdn.24h.com.vn/upload/3-2020/images/2020-07-24/dai-gia-Ha-thanh-chi-10-ti-so-huu-dan-ca-Koi-quy-tu-toan-sieu-pham-co-con-len-toi-120-trieu-co-2-1595591282-968-width750height500.jpg\" style=\"width:660px\" /></p>\r\n\r\n<p>Đ&agrave;n c&aacute; Koi của anh Chương c&oacute; gi&aacute; dao động từ 1000$ - 5000$ (từ 23 triệu &ndash; khoảng 120 triệu)/con.</p>\r\n\r\n<p>Những con c&aacute; Koi n&agrave;y c&oacute; gi&aacute; dao động từ 1000$ - 5000$ (từ 23 triệu &ndash; khoảng 120 triệu)/con. Đặc biệt, anh Chương đ&atilde; tốn nhiều thời gian t&igrave;m kiếm v&agrave; đặt mua từ những hồ c&aacute; Koi uy t&iacute;n nhất nh&igrave; Nhật Bản. Theo đại gia H&agrave; th&agrave;nh chia sẻ, hiện nay tại Nhật Bản c&oacute; khoảng 200 trại c&aacute; Koi nhưng trong số đ&oacute; chỉ c&oacute; khoảng 30 trại t&ecirc;n tuổi v&agrave; 10 trang trại c&oacute; danh tiếng thực sự.</p>\r\n\r\n<p>Để chọn được số &iacute;t những con chất lượng v&agrave; c&oacute; k&iacute;ch thước tr&ecirc;n kh&ocirc;ng phải trang trại n&agrave;o cũng nu&ocirc;i giữ. Ch&iacute;nh v&igrave; thế, việc săn l&ugrave;ng, thậm ch&iacute; phải đấu gi&aacute; để sở hữu những ch&uacute; c&aacute; Koi n&agrave;y phải mất rất nhiều thời gian, c&ocirc;ng sức v&agrave; đ&ocirc;i khi l&agrave; phải c&oacute; &ldquo;duy&ecirc;n&rdquo; mới c&oacute; được.</p>\r\n\r\n<p>Tổng số tiền đại gia H&agrave; th&agrave;nh đ&atilde; chi trả cho đ&agrave;n c&aacute; Koi l&ecirc;n tới 10 tỷ đồng chỉ ri&ecirc;ng tiền c&aacute;. Trong đ&oacute; đặc biệt c&oacute; một số con sở hữu ngoại h&igrave;nh đẹp, hiếm gặp, k&iacute;ch thước lớn kết hợp với d&ograve;ng gene di truyền tốt&hellip; từng được nhiều d&acirc;n chơi c&aacute; cảnh hỏi mua với gi&aacute; cao nhưng anh Chương nhất quyết kh&ocirc;ng b&aacute;n.</p>\r\n\r\n<p><img alt=\"Đại gia Hà thành chi 10 tỉ sở hữu đàn cá Koi quy tụ toàn “siêu phẩm”, có con lên tới 120 triệu - 3\" src=\"https://cdn.24h.com.vn/upload/3-2020/images/2020-07-24/dai-gia-Ha-thanh-chi-10-ti-so-huu-dan-ca-Koi-quy-tu-toan-sieu-pham-co-con-len-toi-120-trieu-co-3-1595591282-427-width1536height2048.jpg\" style=\"width:660px\" /></p>\r\n\r\n<p>Bể c&aacute; thiết kế đơn giản, tận dụng kh&ocirc;ng gian nhỏ ở ban c&ocirc;ng l&agrave;m th&agrave;nh nơi ở của khoảng 25 ch&uacute; c&aacute; Koi.</p>\r\n\r\n<p>Kh&aacute;c với kiểu chơi c&aacute; Koi thường gặp, anh Chương kh&ocirc;ng đầu tư thiết kế nhiều chi tiết xung quanh bể. Tại bể c&aacute; ở Cửa Bắc - H&agrave; Nội, tận dụng khoảng ban c&ocirc;ng nhỏ (khoảng 6 m2) ở tầng 6 của căn nh&agrave;, anh thu&ecirc; đơn vị thi c&ocirc;ng một hồ c&aacute; đơn giản, xung quanh kh&ocirc;ng c&oacute; nhiều tiểu cảnh, h&ograve;n non bộ như c&aacute;c hồ thường gặp m&agrave; chỉ c&oacute; mặt k&iacute;nh b&ecirc;n tr&ecirc;n hồ tạo cảm gi&aacute;c như c&aacute; đang bơi ngay dưới ch&acirc;n m&igrave;nh.</p>\r\n\r\n<p>&ldquo;Bản th&acirc;n con c&aacute; Koi đ&atilde; nhiều m&agrave;u sắc v&agrave; v&ocirc; c&ugrave;ng thu h&uacute;t, t&ocirc;i muốn xung quanh phải l&agrave; những thứ đơn giản nhất để t&ocirc;n l&ecirc;n vẻ đẹp của c&aacute;. Hơn nữa, do nh&agrave; cao tầng mặt phố n&ecirc;n diện t&iacute;ch kh&ocirc;ng gian trống kh&ocirc;ng nhiều, chỉ v&igrave; qu&aacute; đam m&ecirc; n&ecirc;n t&ocirc;i quyết định tận dụng một phần ban c&ocirc;ng nhỏ th&agrave;nh hồ c&aacute; Koi đặc biệt của ri&ecirc;ng m&igrave;nh&rdquo; &ndash; Anh Chương chia sẻ.</p>\r\n\r\n<p><img alt=\"Đại gia Hà thành chi 10 tỉ sở hữu đàn cá Koi quy tụ toàn “siêu phẩm”, có con lên tới 120 triệu - 4\" src=\"https://cdn.24h.com.vn/upload/3-2020/images/2020-07-24/dai-gia-Ha-thanh-chi-10-ti-so-huu-dan-ca-Koi-quy-tu-toan-sieu-pham-co-con-len-toi-120-trieu-co-4-1595591282-269-width750height499.jpg\" style=\"width:660px\" /></p>\r\n\r\n<p>Ở Nhật Bản, c&aacute; Koi được xem như quốc ngư, tượng trưng cho sự th&acirc;n thiện, may mắn, t&agrave;i lộc v&agrave; trường thọ của gia đ&igrave;nh. Người chơi c&aacute; Koi chuy&ecirc;n nghiệp ch&uacute; trọng v&agrave; cấu tr&uacute;c h&igrave;nh thể, m&agrave;u sắc c&agrave;ng độc gi&aacute;, gi&aacute; trị c&agrave;ng cao.</p>\r\n\r\n<p><img alt=\"Đại gia Hà thành chi 10 tỉ sở hữu đàn cá Koi quy tụ toàn “siêu phẩm”, có con lên tới 120 triệu - 5\" src=\"https://cdn.24h.com.vn/upload/3-2020/images/2020-07-24/dai-gia-Ha-thanh-chi-10-ti-so-huu-dan-ca-Koi-quy-tu-toan-sieu-pham-co-con-len-toi-120-trieu-co-5-1595591282-42-width1536height2048.jpg\" style=\"width:660px\" /></p>\r\n\r\n<p>Bể c&aacute; Koi tuy nhỏ nhưng gi&aacute; trị l&ecirc;n tới h&agrave;ng tỷ đồng. Anh Chương coi đ&acirc;y l&agrave; kh&ocirc;ng gian thư gi&atilde;n l&yacute; tưởng sau giờ l&agrave;m việc căng thẳng.</p>\r\n\r\n<p>C&aacute; Koi kh&ocirc;ng chỉ đẹp m&agrave; c&ograve;n rất th&ocirc;ng minh khi nhận biết v&agrave; hiểu &yacute; chủ nh&acirc;n. B&ecirc;n cạnh việc l&agrave; một th&uacute; vui &ldquo;cao cấp&rdquo; của giới thượng lưu, anh Chương Tailor cũng coi những ch&uacute; c&aacute; n&agrave;y những những người bạn của m&igrave;nh. Mỗi khi c&oacute; thời gian rảnh dỗi, anh thường ra ban c&ocirc;ng ngồi uống tr&agrave;, cho c&aacute; ăn v&agrave; ngắm nh&igrave;n đ&agrave;n c&aacute; bơi lượn ngay dưới ch&acirc;n m&igrave;nh.</p>\r\n\r\n<p>Hiện anh Chương vẫn đang tiếp tục t&igrave;m hiểu v&agrave; săn l&ugrave;ng một số con c&aacute; Koi c&oacute; k&iacute;ch thước khủng hơn thuộc h&agrave;ng hiếm tr&ecirc;n thế giới để bổ sung v&agrave;o bộ sưu tập của m&igrave;nh. N&oacute;i về việc mạnh tay chi tiền cho những th&uacute; vui đắt đỏ n&agrave;y, đại gia H&agrave; th&agrave;nh cho biết, anh kh&ocirc;ng c&oacute; giới hạn cố định n&agrave;o cho những niềm vui của m&igrave;nh. Anh sẽ mua v&agrave; tiếp tục săn l&ugrave;ng tới khi n&agrave;o anh kh&ocirc;ng th&iacute;ch nữa.</p>\r\n\r\n<p>Nguồn: http://danviet.vn/dai-gia-ha-thanh-chi-10-ti-so-huu-dan-ca-koi-quy-tu-toan-sieu-pham-co-con-len-toi-120-trieu-5020202574593645.htm</p>', '/storage/app/public/images/blog/dai-gia-Ha-thanh-chi-10-ti-so-huu-dan-ca-Koi-quy-tu-toan-sieu-pham-co-con-len-toi-120-trieu-co-1-1595591282-230-width750height500.jpg', 1, '2021-06-22 06:09:22', '2021-06-12 04:32:48', '2021-06-14 05:34:42', NULL),
(14, 'Mặc dù rất tốt, nhưng những “siêu thực phẩm” này không nên ăn quá nhiều trong mùa dịch', 'Mặc dù tốt cho sức khỏe nhưng những loại thực phẩm không được lạm dụng trong mùa dịch này.', 'mac-du-rat-tot-nhung-nhung-sieu-thuc-pham-nay-khong-nen-an-qua-nhieu-trong-mua-dich', '<p>Những loại thực phẩm n&agrave;y đều cực kỳ tốt cho sức khỏe, chứa nhiều chất dinh dưỡng nhưng &iacute;t calo. Tuy nhi&ecirc;n, đối với bất kỳ loại thực phẩm n&agrave;o đi chăng nữa, mọi thứ vẫn n&ecirc;n được ti&ecirc;u thụ một c&aacute;ch chừng mực, nếu kh&ocirc;ng n&oacute; cũng c&oacute; thể g&acirc;y nguy hiểm như đồ ăn vặt kh&ocirc;ng l&agrave;nh mạnh.</p>\r\n\r\n<p><strong>1. B&ocirc;ng cải xanh c&oacute; thể g&acirc;y k&iacute;ch ứng ruột</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Mặc dù rất tốt, nhưng những “siêu thực phẩm” này không nên ăn quá nhiều trong mùa dịch - 1\" src=\"https://cdn.24h.com.vn/upload/2-2021/images/2021-05-25/Mac-du-rat-tot-nhung-nhung-sieu-thuc-pham-nay-khong-nen-an-qua-nhieu-trong-mua-dich-1-1621908015-160-width728height563.jpg\" style=\"width:660px\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>B&ocirc;ng cải xanh rất gi&agrave;u chất xơ, protein, vitamin C, kali v&agrave; c&aacute;c vitamin v&agrave; kho&aacute;ng chất kh&aacute;c.&nbsp;Tuy nhi&ecirc;n, c&aacute;c nghi&ecirc;n cứu đ&atilde; ph&aacute;t hiện ra rằng, ti&ecirc;u thụ qu&aacute; nhiều b&ocirc;ng cải xanh v&agrave; c&aacute;c loại rau họ cải kh&aacute;c c&oacute; thể g&acirc;y k&iacute;ch ứng ruột hoặc khiến bạn đầy hơi. Đặc biệt, n&oacute; sẽ g&acirc;y nguy hiểm cho những người đang d&ugrave;ng thuốc trợ tim, l&agrave;m lo&atilde;ng m&aacute;u do h&agrave;m lượng vitamin K cao.</p>\r\n\r\n<p><strong>2. C&aacute; hồi c&oacute; thể l&agrave;m lo&atilde;ng m&aacute;u</strong></p>\r\n\r\n<p>C&aacute; hồi l&agrave; một nguồn cung cấp protein v&agrave; axit b&eacute;o omega-3 rất tốt để giảm vi&ecirc;m. Mặc d&ugrave; c&aacute; hồi l&agrave; lựa chọn h&agrave;ng đầu của nhiều người quan t&acirc;m đến sức khỏe, nhưng việc ti&ecirc;u thụ qu&aacute; nhiều omega-3 c&oacute; thể g&acirc;y t&aacute;c động&nbsp;ti&ecirc;u cực đến số lượng tiểu cầu, thậm ch&iacute; l&agrave;m lo&atilde;ng m&aacute;u. Ngo&agrave;i ra, c&aacute;c nghi&ecirc;n cứu cũng đ&atilde; ph&aacute;t hiện ra rằng, ăn qu&aacute; nhiều c&aacute;, bao gồm cả c&aacute; hồi, c&oacute; thể l&agrave;m tăng nồng độ thủy ng&acirc;n trong m&aacute;u.</p>\r\n\r\n<p><img alt=\"Mặc dù rất tốt, nhưng những “siêu thực phẩm” này không nên ăn quá nhiều trong mùa dịch - 3\" src=\"https://cdn.24h.com.vn/upload/2-2021/images/2021-05-25/Mac-du-rat-tot-nhung-nhung-sieu-thuc-pham-nay-khong-nen-an-qua-nhieu-trong-mua-dich-2-1621908026-239-width728height545.jpg\" style=\"width:660px\" /></p>\r\n\r\n<p>Tr&aacute;i ngược với c&aacute; hồi hoang d&atilde;, c&aacute; hồi nu&ocirc;i được ph&aacute;t hiện c&oacute;&nbsp;lượng chất b&eacute;o v&agrave; calo cao&nbsp;gấp đ&ocirc;i. Nghi&ecirc;n cứu gần đ&acirc;y cũng ph&aacute;t hiện ra rằng, c&aacute; hồi nu&ocirc;i c&oacute; thể c&oacute; mối li&ecirc;n hệ với bệnh b&eacute;o ph&igrave; v&agrave; chất &ocirc; nhiễm được t&igrave;m thấy trong nước nu&ocirc;i c&aacute; hồi.</p>\r\n\r\n<p><strong>3. Quế c&oacute; thể g&acirc;y nhiễm độc cho cơ thể</strong></p>\r\n\r\n<p>Quế được coi l&agrave;&nbsp;một si&ecirc;u thực phẩm do h&agrave;m lượng chất chống oxy h&oacute;a cao v&agrave; nhiều dược t&iacute;nh.&nbsp;N&oacute; c&oacute; khả năng&nbsp;l&agrave;m giảm&nbsp;lượng đường trong m&aacute;u, giảm vi&ecirc;m v&agrave; ngăn ngừa bệnh tim.</p>\r\n\r\n<p><img alt=\"Mặc dù rất tốt, nhưng những “siêu thực phẩm” này không nên ăn quá nhiều trong mùa dịch - 4\" src=\"https://cdn.24h.com.vn/upload/2-2021/images/2021-05-25/Mac-du-rat-tot-nhung-nhung-sieu-thuc-pham-nay-khong-nen-an-qua-nhieu-trong-mua-dich-3-1621908041-479-width728height536.jpg\" style=\"width:660px\" /></p>\r\n\r\n<p>Mặc d&ugrave; quế c&oacute; nhiều lợi &iacute;ch, nhưng h&agrave;m lượng chỉ n&ecirc;n giới hạn 1 th&igrave;a c&agrave; ph&ecirc; mỗi ng&agrave;y đối với người lớn. Một số nghi&ecirc;n cứu cho thấy, ti&ecirc;u thụ qu&aacute; nhiều quế c&oacute; thể g&acirc;y độc do chứa coumarin.&nbsp;Coumarin đặc biệt nguy hiểm đối với những người c&oacute; vấn dề về gan, c&oacute; thể g&acirc;y tổn thương gan. T&ugrave;y theo từng loại quế sẽ c&oacute; mức coumarin kh&aacute;c nhau.</p>\r\n\r\n<p><strong>4. Quả bơ c&oacute; thể g&acirc;y t&iacute;ch tụ chất b&eacute;o</strong></p>\r\n\r\n<p>Bơ l&agrave; một si&ecirc;u thực phẩm trong những năm gần đ&acirc;y, được rất nhiều người y&ecirc;u th&iacute;ch. Một khẩu phần bơ chiếm 1/4 nhu cầu vitamin K của người trưởng th&agrave;nh, 1/5 nhu cầu folate v&agrave; 1/10 nhu cầu vitamin E hằng ng&agrave;y.&nbsp;Bơ cũng rất gi&agrave;u omega-3 v&agrave; chất xơ, nhưng ăn qu&aacute; nhiều bơ cũng c&oacute; thể dẫn&nbsp;đến vi&ecirc;m, đầy hơi v&agrave; kh&oacute; chịu ở dạ d&agrave;y.</p>\r\n\r\n<p><img alt=\"Mặc dù rất tốt, nhưng những “siêu thực phẩm” này không nên ăn quá nhiều trong mùa dịch - 5\" src=\"https://cdn.24h.com.vn/upload/2-2021/images/2021-05-25/Mac-du-rat-tot-nhung-nhung-sieu-thuc-pham-nay-khong-nen-an-qua-nhieu-trong-mua-dich-4-1621908056-363-width728height545.jpg\" style=\"width:660px\" /></p>\r\n\r\n<p>Bơ c&oacute; h&agrave;m lượng calo cao, ăn qu&aacute; nhiều c&oacute; thể g&acirc;y t&iacute;ch tụ chất b&eacute;o trong cơ thể. C&aacute;c chuy&ecirc;n gia khuy&ecirc;n chỉ n&ecirc;n ăn 50g, hoặc 1/3 quả bơ mỗi ng&agrave;y.</p>\r\n\r\n<p><strong>5. Hummus c&oacute; thể dẫn đến b&eacute;o ph&igrave;</strong></p>\r\n\r\n<p>Hummus l&agrave; m&oacute;n ăn c&oacute; nguồn gốc từ Trung Đ&ocirc;ng, được l&agrave;m từ đậu g&agrave;, bột vừng, chanh, tỏi v&agrave; dầu &ocirc; liu.&nbsp;Tất cả c&aacute;c th&agrave;nh phần chứa nhiều lợi &iacute;ch sức khỏe,&nbsp;nhưng khi kết hợp với nhau, ch&uacute;ng tạo ra&nbsp;một si&ecirc;u thực phẩm gi&agrave;u dinh dưỡng v&agrave; chứa nhiều protein. Hummus m&oacute;n khai vị ph&ugrave; hợp cho người ăn chay v&agrave; những người bị dị ứng với c&aacute;c loại hạt, gluten v&agrave; sữa.</p>\r\n\r\n<p><img alt=\"Mặc dù rất tốt, nhưng những “siêu thực phẩm” này không nên ăn quá nhiều trong mùa dịch - 6\" src=\"https://cdn.24h.com.vn/upload/2-2021/images/2021-05-25/Mac-du-rat-tot-nhung-nhung-sieu-thuc-pham-nay-khong-nen-an-qua-nhieu-trong-mua-dich-5-1621908072-24-width728height561.jpg\" style=\"width:660px\" /></p>\r\n\r\n<p>Điều quan trọng cần lưu &yacute; l&agrave; những lợi &iacute;ch của hummus được t&igrave;m thấy đặc biệt trong phi&ecirc;n bản tự l&agrave;m.&nbsp;Hầu hết hummus mua ở cửa h&agrave;ng kh&ocirc;ng tốt cho sức khỏe v&agrave; thậm ch&iacute; c&oacute; thể&nbsp;chứa c&aacute;c th&agrave;nh phần độc hại, chẳng hạn như lượng natri cao v&agrave; chất bảo quản.&nbsp;Hummus được b&agrave;y b&aacute;n tr&ecirc;n kệ, giống như c&aacute;c loại thực phẩm chế biến sẵn kh&aacute;c, c&oacute; thể g&acirc;y&nbsp;b&eacute;o ph&igrave; v&agrave; nhiều bệnh kh&aacute;c nhau.</p>\r\n\r\n<p><strong>6. Kombucha c&oacute; thể l&agrave;m tăng nồng độ axit</strong></p>\r\n\r\n<p>Kombucha l&agrave; một loại tr&agrave; ngọt l&ecirc;n men chứa nhiều&nbsp;chất chống oxy h&oacute;a v&agrave; men vi sinh.&nbsp;Thức uống n&agrave;y đ&atilde; trở&nbsp;n&ecirc;n phổ biến trong&nbsp;gia đ&igrave;nh&nbsp;v&agrave;o những năm 90 nhưng c&oacute; thể bắt nguồn từ năm 220 trước C&ocirc;ng nguy&ecirc;n ở Trung Quốc. Kombucha được coi l&agrave; một &ldquo;superfood&rdquo; v&agrave; l&agrave; thức uống detox được nhiều người y&ecirc;u th&iacute;ch.</p>\r\n\r\n<p><img alt=\"Mặc dù rất tốt, nhưng những “siêu thực phẩm” này không nên ăn quá nhiều trong mùa dịch - 7\" src=\"https://cdn.24h.com.vn/upload/2-2021/images/2021-05-25/Mac-du-rat-tot-nhung-nhung-sieu-thuc-pham-nay-khong-nen-an-qua-nhieu-trong-mua-dich-6-1621908088-539-width728height540.jpg\" style=\"width:660px\" /></p>\r\n\r\n<p>Tuy nhi&ecirc;n, Kombucha kh&ocirc;ng c&oacute; lợi cho những người c&oacute; hệ miễn dịch k&eacute;m do thực tế n&oacute; chứa c&aacute;c loại vi khuẩn v&agrave; nấm men kh&aacute;c nhau trong trạng th&aacute;i sống v&agrave; chưa được khử tr&ugrave;ng.</p>\r\n\r\n<p>Ngo&agrave;i ra, qu&aacute; nhiều kombucha c&oacute; thể g&acirc;y kh&oacute; chịu&nbsp;dạ d&agrave;y hoặc ợ chua.&nbsp;N&oacute; cũng c&oacute; h&agrave;m lượng đường cao, n&ecirc;n hạn chế để ph&ograve;ng tr&aacute;nh đường huyết tăng.</p>\r\n\r\n<p><strong>7. C&aacute; ngừ c&oacute; thể ảnh hưởng đến kỹ năng vận động</strong></p>\r\n\r\n<p>C&aacute; ngừ l&agrave; một loại protein rất&nbsp;gi&agrave;u&nbsp;omega 3 v&agrave; vitamin B12.&nbsp;C&aacute;c nghi&ecirc;n cứu đ&atilde; chỉ ra rằng, ăn c&aacute; ngừ rất tốt cho tim mạch, tăng cường sức khỏe của mắt, hệ thống miễn dịch v&agrave; giảm huyết &aacute;p.&nbsp;</p>\r\n\r\n<p><img alt=\"Mặc dù rất tốt, nhưng những “siêu thực phẩm” này không nên ăn quá nhiều trong mùa dịch - 8\" src=\"https://cdn.24h.com.vn/upload/2-2021/images/2021-05-25/Mac-du-rat-tot-nhung-nhung-sieu-thuc-pham-nay-khong-nen-an-qua-nhieu-trong-mua-dich-7-1621908098-53-width728height576.jpg\" style=\"width:660px\" /></p>\r\n\r\n<p>Tương tự như c&aacute; hồi v&agrave; c&aacute;c loại c&aacute; kh&aacute;c, c&aacute; ngừ c&oacute; chứa thủy ng&acirc;n, khiến n&oacute; trở th&agrave;nh một&nbsp;&nbsp;loại thực phẩm nguy hiểm&nbsp;khi ti&ecirc;u thụ với số lượng lớn v&agrave; thường xuy&ecirc;n.&nbsp;Ngộ độc từ thủy ng&acirc;n&nbsp;biểu hiện giảm tr&iacute; nhớ hoặc thị lực, cơ thể hay bị run v&agrave; t&ecirc;.</p>\r\n\r\n<p><strong>8. Tr&agrave; xanh c&oacute; thể g&acirc;y đau nhức</strong></p>\r\n\r\n<p>Tr&agrave; xanh đ&atilde; được coi&nbsp;l&agrave; một trong những đồ uống l&agrave;nh mạnh nhất tr&ecirc;n thế giới do h&agrave;m lượng chất chống oxy h&oacute;a cao.&nbsp;C&aacute;c chất chống oxy h&oacute;a trong tr&agrave; xanh đ&atilde; được&nbsp;t&igrave;m thấy gi&uacute;p giảm nguy cơ ung thư v&agrave; bệnh tim, đốt ch&aacute;y chất b&eacute;o, cải thiện chức năng n&atilde;o.&nbsp;Mặc d&ugrave; tr&agrave; xanh c&oacute; v&ocirc; số lợi &iacute;ch, nhưng nếu uống qu&aacute; nhiều tr&agrave; xanh c&oacute; thể&nbsp;g&acirc;y ra c&aacute;c t&aacute;c dụng phụ ti&ecirc;u cực, đặc biệt l&agrave; do h&agrave;m lượng caffeine cao.</p>\r\n\r\n<p><img alt=\"Mặc dù rất tốt, nhưng những “siêu thực phẩm” này không nên ăn quá nhiều trong mùa dịch - 9\" src=\"https://cdn.24h.com.vn/upload/2-2021/images/2021-05-25/Mac-du-rat-tot-nhung-nhung-sieu-thuc-pham-nay-khong-nen-an-qua-nhieu-trong-mua-dich-8-1621908131-378-width728height534.jpg\" style=\"width:660px\" /></p>\r\n\r\n<p>Ảnh hưởng của việc ti&ecirc;u thụ qu&aacute; nhiều caffeine bao gồm&nbsp;mất ngủ, đau đầu, đ&aacute;nh trống ngực v&agrave; ợ chua.&nbsp;Đối với những người c&oacute; khả năng dung nạp thấp với c&aacute;c sản phẩm c&oacute; chứa caffein, tr&agrave; xanh cũng c&oacute; thể g&acirc;y ra t&igrave;nh trạng ợ&nbsp;chua v&agrave; kh&oacute; ti&ecirc;u.&nbsp;Theo c&aacute;c chuy&ecirc;n gia, 3 đến 5 t&aacute;ch tr&agrave; xanh mỗi ng&agrave;y l&agrave; th&iacute;ch hợp đối với người lớn b&igrave;nh thường.</p>\r\n\r\n<p>Nguồn: http://danviet.vn/mac-du-rat-tot-nhung-nhung-sieu-thuc-pham-nay-khong-nen-an-qua-nhieu-trong-mua-dich-50202111610255810.htm</p>', '/storage/app/public/images/blog/Mac-du-rat-tot-nhung-nhung-sieu-thuc-pham-nay-khong-nen-an-qua-nhieu-trong-mua-dich-1-1621908015-160-width728height563.jpg', 1, '2021-06-22 06:09:22', '2021-06-12 04:34:27', '2021-06-14 05:34:42', NULL),
(15, 'Thi vào lớp 10: Hà Nội huy động hơn 500 thanh tra, ngày 11/6, thí sinh làm thủ tục dự thi trực tuyến', 'Lực lượng thanh tra làm nhiệm vụ cắm chốt tại 184 điểm thi vào lớp 10 trung học phổ thông công lập năm học 2021-2022 trên địa bàn thành phố Hà Nội.', 'thi-vao-lop-10-ha-noi-huy-dong-hon-500-thanh-tra-ngay-11-6-thi-sinh-lam-thu-tuc-du-thi-truc-tuyen', '<p>Để chuẩn bị tổ chức kỳ thi&nbsp;<a href=\"https://www.24h.com.vn/tuyen-sinh-dh-cd-c365.html\" title=\"tuyển sinh\">tuyển sinh</a>&nbsp;v&agrave;o lớp 10 trung học phổ th&ocirc;ng c&ocirc;ng lập năm học 2021-2022, Sở&nbsp;<a href=\"https://www.24h.com.vn/giao-duc-du-hoc-c216.html\" title=\"Giáo dục\">Gi&aacute;o dục</a>&nbsp;v&agrave; Đ&agrave;o tạo H&agrave; Nội đ&atilde; huy động hơn 500 thanh tra. Lực lượng thanh tra l&agrave;m nhiệm vụ cắm chốt tại 184 điểm thi v&agrave;o lớp 10 trung học phổ th&ocirc;ng c&ocirc;ng lập năm học 2021-2022 tr&ecirc;n địa b&agrave;n th&agrave;nh phố H&agrave; Nội.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Thi vào lớp 10: Hà Nội huy động hơn 500 thanh tra, ngày 11/6, thí sinh làm thủ tục dự thi trực tuyến - 1\" src=\"https://cdn.24h.com.vn/upload/2-2021/images/2021-06-08/Thi-vao-lop-10-Ha-Noi-huy-dong-hon-500-thanh-tra-ngay-11-6-thi-sinh-lam-thu-tuc-du-thi-truc-tuyen-thi-lop-10-hnm-1623109294-35-width1200height768.jpg\" style=\"width:660px\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ảnh: TTX.</p>\r\n\r\n<p>Ngo&agrave;i ra, Sở Gi&aacute;o dục v&agrave; Đ&agrave;o tạo H&agrave; Nội c&ograve;n th&agrave;nh lập 16 tổ gi&aacute;m s&aacute;t (mỗi tổ c&oacute; 3 th&agrave;nh vi&ecirc;n), c&oacute; nhiệm vụ gi&aacute;m s&aacute;t hoạt động của đo&agrave;n thanh tra tại c&aacute;c điểm thi.</p>\r\n\r\n<p>Ngo&agrave;i c&aacute;c nội dung về chuy&ecirc;n m&ocirc;n, c&ocirc;ng t&aacute;c thanh tra kỳ thi năm nay c&oacute; th&ecirc;m nội dung về việc chuẩn bị, thực hiện c&aacute;c quy định ph&ograve;ng, chống dịch COVID-19 của c&aacute;c th&agrave;nh vi&ecirc;n tại c&aacute;c điểm thi.</p>\r\n\r\n<p>Để bảo đảm an to&agrave;n cho th&iacute; sinh dự thi, lực lượng thanh tra sẽ thanh tra việc bố tr&iacute; khu vực thi, ph&ograve;ng thi, chỗ ngồi của th&iacute; sinh nhằm bảo đảm an to&agrave;n ph&ograve;ng, chống dịch COVID-19; c&ocirc;ng t&aacute;c vệ sinh an to&agrave;n thực phẩm, y tế, điện, nước v&agrave; c&aacute;c phương &aacute;n xử l&yacute; c&aacute;c t&igrave;nh huống bất thường tại điểm thi.</p>\r\n\r\n<p>Việc th&agrave;nh lập lực lượng thanh tra kỳ thi nhằm gi&uacute;p cơ quan, tổ chức, c&aacute; nh&acirc;n tham gia kỳ thi thực hiện đ&uacute;ng quy chế thi, c&aacute;c quy định li&ecirc;n quan đến việc tổ chức kỳ thi v&agrave; c&aacute;c nội dung chỉ đạo của Bộ Gi&aacute;o dục v&agrave; Đ&agrave;o tạo, UBND th&agrave;nh phố H&agrave; Nội, Sở Gi&aacute;o dục v&agrave; Đ&agrave;o tạo H&agrave; Nội, g&oacute;p phần bảo đảm cho kỳ thi diễn ra an to&agrave;n, nghi&ecirc;m t&uacute;c, đ&uacute;ng quy định.</p>\r\n\r\n<p><strong>Th&iacute; sinh l&agrave;m thủ tục dự thi theo h&igrave;nh thức trực tuyến</strong></p>\r\n\r\n<p>Một trong những nội dung quan trọng kh&aacute;c cũng được UBND th&agrave;nh phố H&agrave; Nội quyết định điều chỉnh l&agrave; tổ chức cho th&iacute; sinh l&agrave;m thủ tục dự thi theo h&igrave;nh thức trực tuyến.</p>\r\n\r\n<p>Cụ thể, theo th&ocirc;ng b&aacute;o của Sở Gi&aacute;o dục v&agrave; Đ&agrave;o tạo H&agrave; Nội, ng&agrave;y 11/6/2021, th&iacute; sinh sẽ l&agrave;m thủ tục dự thi v&agrave;o lớp 10 theo h&igrave;nh thức trực tuyến tại c&aacute;c trường trung học cơ sở, thay cho h&igrave;nh thức trực tiếp như kế hoạch đ&atilde; c&ocirc;ng bố.</p>\r\n\r\n<p>Để bảo đảm an to&agrave;n ph&ograve;ng, chống dịch, c&aacute;c ph&ograve;ng gi&aacute;o dục v&agrave; đ&agrave;o tạo quận, huyện, thị x&atilde; c&oacute; tr&aacute;ch nhiệm chỉ đạo c&aacute;c trường trung học cơ sở thuộc phạm vi quản l&yacute; lựa chọn thời gian hợp l&yacute; trong ng&agrave;y để tổ chức cho học sinh l&agrave;m thủ tục dự thi theo h&igrave;nh thức trực tuyến.</p>\r\n\r\n<p>Sở cũng khuyến kh&iacute;ch c&aacute;c nh&agrave; trường tạo điều kiện để phụ huynh c&ugrave;ng tham gia để nắm chắc c&aacute;c quy định li&ecirc;n quan đến kỳ thi v&agrave; c&ugrave;ng thực hiện tốt, với mục ti&ecirc;u bảo đảm an to&agrave;n cao nhất cho th&iacute; sinh tham dự kỳ thi.</p>\r\n\r\n<p>Để tr&aacute;nh xảy ra nhầm lẫn, Sở Gi&aacute;o dục v&agrave; Đ&agrave;o tạo H&agrave; Nội y&ecirc;u cầu c&aacute;c ph&ograve;ng gi&aacute;o dục v&agrave; đ&agrave;o tạo quận, huyện, thị x&atilde; nhắc nhở c&aacute;c nh&agrave; trường th&ocirc;ng tin cụ thể cho tất cả th&iacute; sinh tham dự kỳ thi về quy định mới n&agrave;y.</p>\r\n\r\n<p>Tại buổi l&agrave;m thủ tục dự thi, c&aacute;c th&iacute; sinh cần nhớ r&agrave; so&aacute;t lại một lần nữa c&aacute;c th&ocirc;ng tin trong phiếu đăng k&yacute; dự thi; nghe phổ biến quy chế thi, lịch thi để thực hiện nghi&ecirc;m t&uacute;c.</p>\r\n\r\n<p>Kỳ thi tuyển sinh v&agrave;o lớp 10 tại H&agrave; Nội diễn ra v&agrave;o ng&agrave;y 12 v&agrave; 13/6/2021, với sự tham gia của hơn 93.000 th&iacute; sinh.</p>\r\n\r\n<p>Nguồn: http://danviet.vn/thi-vao-lop-10-ha-noi-huy-dong-hon-500-thanh-tra-ngay-11-6-thi-sinh-lam-thu-tuc-du-thi-truc-tuyen-50202186722952.htm</p>', '/storage/app/public/images/blog/Thi-vao-lop-10-Ha-Noi-huy-dong-hon-500-thanh-tra-ngay-11-6-thi-sinh-lam-thu-tuc-du-thi-truc-tuyen-thi-lop-10-hnm-1623109294-35-width1200height768.jpg', 1, '2021-06-22 06:09:22', '2021-06-12 04:35:22', '2021-06-14 06:05:59', NULL),
(16, 'Loài cá Nhật Bản này có gì đặc biệt mà từng được đấu giá tới 47 tỷ?', 'Loài cá này còn được gọi là một “Tác phẩm nghệ thuật trong giới bơi lội”, nó được sinh ra tại Nhật Bản vào khoảng 200 năm trước và đang thu hút không chỉ người dân Nhật Bản mà còn trên khắp thế giới.', 'loai-ca-nhat-ban-nay-co-gi-dac-biet-ma-tung-duoc-dau-gia-toi-47-ty', '<p><img alt=\"Vì sao cá Koi &amp;#34;Huyền thoại&amp;#34; giá tới 42 tỷ đồng, đắt nhất lịch sử? - 1\" src=\"https://cdn.24h.com.vn/upload/4-2018/images/2018-12-20/Vi-sao-ca-Koi-koi-1545299474-605-width480height721.jpg\" /></p>\r\n\r\n<p>Con c&aacute; Koi 9 tuổi gi&aacute; 41,5 tỷ đồng</p>\r\n\r\n<p>Kết quả cuối c&ugrave;ng, nh&agrave; sưu tập Yingying đến từ Đ&agrave;i Loan đ&atilde; đấu gi&aacute; th&agrave;nh c&ocirc;ng v&agrave; mua được con c&aacute; hiếm từ nh&agrave; Kentaro Sakai với gi&aacute; 203 triệu Y&ecirc;n (tương đương khoảng 42 tỷ đồng). Đ&acirc;y l&agrave; con c&aacute; Koi được b&aacute;n với gi&aacute; cao nhất trong lịch sử.</p>\r\n\r\n<p>Theo tờ Business insider, con c&aacute; Koi 9 tuổi c&oacute; t&ecirc;n S Legend, thuộc giống Kohaku, chiều d&agrave;i khoảng 101 cm. S Legend ch&iacute;nh l&agrave; ch&uacute; c&aacute; gi&agrave;nh chiến thắng tại giải đấu All Japan Koi Show 2017 v&agrave; được kỳ vọng tiếp tục giữ vững vị tr&iacute; trong kỳ thi tiếp theo.</p>\r\n\r\n<p>Theo đ&oacute;, giống Kohaku l&agrave; một giống c&aacute; Koi c&oacute; m&agrave;u trắng với những mảng m&agrave;u đỏ tr&ecirc;n th&acirc;n. Để trở th&agrave;nh một con c&aacute; Koi giống Kohaku ho&agrave;n hảo, m&agrave;u trắng phải nguy&ecirc;n sơ m&agrave; kh&ocirc;ng c&oacute; bất kỳ sự lệch chuyển sang m&agrave;u v&agrave;ng n&agrave;o.</p>\r\n\r\n<p>C&aacute; ch&eacute;p Koi, bắt đầu được nu&ocirc;i ở Nhật Bản v&agrave;o những năm 1700 khi những người n&ocirc;ng d&acirc;n bắt đầu nh&acirc;n giống ch&uacute;ng v&igrave; m&agrave;u sắc v&agrave; kiểu d&aacute;ng kh&aacute;c biệt. C&aacute; Koi thực sự l&agrave; một loại c&aacute; ch&eacute;p v&agrave; ng&agrave;y nay ch&uacute;ng trở th&agrave;nh lo&agrave;i c&aacute; cảnh đắt nhất thế giới.</p>\r\n\r\n<p>Tr&ecirc;n thế giới c&oacute; nhiều cuộc thi thường xuy&ecirc;n diễn ra để đặt t&ecirc;n cho những con c&aacute; Koi h&agrave;ng đầu.</p>\r\n\r\n<p>Th&ocirc;ng thường những người kiểm chứng v&agrave; cả người mua c&aacute; Koi sẽ ch&uacute; &yacute; đến những đặc điểm của n&oacute; như l&agrave;n da khỏe mạnh như thế n&agrave;o, k&iacute;ch thước v&agrave; h&igrave;nh d&aacute;ng cơ thể, c&aacute;ch di chuyển trong nước duy&ecirc;n d&aacute;ng ra sao v&agrave; quan trọng nhất l&agrave; m&agrave;u sắc. V&iacute; dụ như c&oacute; những con c&aacute; Koi c&oacute; đốm xanh nhạt kh&aacute;c lạ, hoặc những con c&oacute; mảng lớn m&agrave;u đỏ tr&ecirc;n lưng hoặc to&agrave;n th&acirc;n v&agrave;ng kim.</p>\r\n\r\n<p>Những con c&aacute; được đ&aacute;nh gi&aacute; cao thường thuộc ba loại tr&ecirc;n. C&aacute; Koi c&oacute; sự c&acirc;n bằng tốt về m&agrave;u sắc, hoa văn th&igrave; gi&aacute; c&agrave;ng cao.</p>\r\n\r\n<p>Yvo de Wal, người b&aacute;n c&aacute; Koi ở H&agrave; Lan v&agrave; sở hữu k&ecirc;nh Youtube nổi tiếng về c&aacute; Koi. Mỗi năm anh đến Nhật Bản để tận tay lựa chọn những con c&aacute; đẹp nhất.</p>\r\n\r\n<p>C&aacute; Koi c&oacute; 6 loại tế b&agrave;o sắc tố m&agrave;u tr&ecirc;n da. Đ&oacute; l&agrave; tế b&agrave;o quy định m&agrave;u đỏ, trắng, đen, v&agrave;ng, xanh da trời v&agrave; &aacute;nh kim. Để trở th&agrave;nh con c&aacute; Koi đẹp, m&agrave;u sắc pha trộn l&agrave;m sao đủ để trở th&agrave;nh m&agrave;u cam đỏ, phần th&acirc;n trắng v&agrave; nhiều mảng đỏ lớn tr&ecirc;n th&acirc;n.</p>\r\n\r\n<p>Trong văn h&oacute;a truyền thống Nhật Bản, m&agrave;u đỏ v&agrave; trắng l&agrave; hai m&agrave;u chủ đạo, tượng trưng cho niềm vui v&agrave; sự tinh khiết.</p>\r\n\r\n<p><a href=\"https://img.infonet.vn/w800/Uploaded/2018/rydrkxrxqk/2018_12_20/newworldrecord203millionyen101cmsakaikohakuslegend1e1538754988622.jpg\" rel=\"nofollow\"><img alt=\"Vì sao cá Koi &amp;#34;Huyền thoại&amp;#34; giá tới 42 tỷ đồng, đắt nhất lịch sử? - 2\" src=\"https://img.infonet.vn/w480/Uploaded/2018/rydrkxrxqk/2018_12_20/newworldrecord203millionyen101cmsakaikohakuslegend1e1538754988622.jpg\" style=\"height:448px; width:640px\" /></a></p>\r\n\r\n<p>Tế b&agrave;o m&agrave;u sắc nằm ở vị tr&iacute; kh&aacute;c nhau tr&ecirc;n da của c&aacute; Koi. Một số m&agrave;u nằm ở gần bề mặt, một v&agrave;i nằm ở vị tr&iacute; s&acirc;u hơn. Con c&aacute; c&oacute; m&agrave;u c&agrave;ng đẹp, c&agrave;ng s&aacute;ng th&igrave; gi&aacute; c&agrave;ng cao.</p>\r\n\r\n<p>Mặc d&ugrave; c&aacute; Koi l&agrave; lo&agrave;i c&oacute; khả năng mang thai c&ugrave;ng l&uacute;c h&agrave;ng triệu con nhưng việc nu&ocirc;i dưỡng v&ocirc; c&ugrave;ng kh&oacute; khăn. Người nu&ocirc;i c&aacute; Koi phải c&oacute; sự lựa chọn th&ocirc;ng minh s&aacute;ng suốt. B&aacute;o c&aacute;o cho thấy một người nu&ocirc;i c&oacute; thể bắt đầu từ 3 triệu con mới đẻ nhưng&nbsp; chỉ chọn được khoảng 15.000 con nu&ocirc;i trong năm đầu ti&ecirc;n v&agrave; khoảng 1.000 con để nu&ocirc;i trong năm tiếp theo.</p>\r\n\r\n<p>Tuy nhi&ecirc;n, c&ocirc;ng việc kh&oacute; khăn sẽ mang lại kh&ocirc;ng chỉ l&agrave; lợi nhuận lớn m&agrave; c&ograve;n mang lại danh tiếng cho người nu&ocirc;i c&aacute; Koi.</p>', '/storage/app/public/images/blog/Vi-sao-ca-Koi-koi-1545299474-605-width480height721.jpg', 1, '2021-06-22 06:09:22', '2021-06-12 04:37:02', '2021-06-14 05:34:42', NULL),
(17, 'Loài cá Nhật Bản này có gì đặc biệt mà từng được đấu giá tới 47 tỷ?', 'Loài cá này còn được gọi là một “Tác phẩm nghệ thuật trong giới bơi lội”, nó được sinh ra tại Nhật Bản vào khoảng 200 năm trước và đang thu hút không chỉ người dân Nhật Bản mà còn trên khắp thế giới.', 'loai-ca-nhat-ban-nay-co-gi-dac-biet-ma-tung-duoc-dau-gia-toi-47-ty-5', '<p>Theo trang tin tức kinh tế Nhật Bản ng&agrave;y 1/3, khối lượng xuất khẩu c&aacute; Koi Nhật Bản đ&atilde; tăng 35% trong 5 năm. Tại buổi đấu gi&aacute; được tổ chức tại Nhật Bản, những người gi&agrave;u ở nước ngo&agrave;i thậm ch&iacute; c&ograve;n trả hơn 200 triệu y&ecirc;n Nhật (khoảng hơn 42 tỷ đồng)&nbsp;cho một con c&aacute; Koi. Gi&aacute; trị của mỗi kg c&aacute; Koi thậm ch&iacute; c&ograve;n vượt qua c&aacute; ngừ đen v&agrave; trở th&agrave;nh &quot;lo&agrave;i c&aacute; đầu ti&ecirc;n c&oacute; lợi thế tuyệt đối&quot; (theo cơ quan Thủy sản Nhật Bản).</p>\r\n\r\n<p>V&agrave;o đầu th&aacute;ng 2/2019, những người h&acirc;m mộ c&aacute; Koi tr&ecirc;n khắp thế giới đ&atilde; đưa những ch&uacute; c&aacute; của m&igrave;nh tham gia hội thi &ldquo;Đ&aacute;nh gi&aacute; sản phẩm Koi to&agrave;n diện Nhật Bản&quot; được tổ chức tại Trung t&acirc;m ph&acirc;n phối Tokyo. Tại đ&acirc;y, qu&aacute;n qu&acirc;n l&agrave; một ch&uacute; c&aacute; Koi trắng đốm hoa văn đỏ. Ch&uacute; c&aacute; Koi n&agrave;y được nu&ocirc;i trong trang trại c&aacute; của tỉnh Hiroshima, được một người Trung Quốc đấu gi&aacute; th&agrave;nh c&ocirc;ng v&agrave;o m&ugrave;a thu năm 2018 với mức gi&aacute; cao nhất trong lịch sử, 230 triệu y&ecirc;n (khoảng 47 tỷ VNĐ).</p>\r\n\r\n<p><img alt=\"Loài cá Nhật Bản này có gì đặc biệt mà từng được đấu giá tới 47 tỷ? - 1\" src=\"https://cdn.24h.com.vn/upload/1-2019/images/2019-03-11/1552278583-814-loai-ca-nhat-ban-nay-co-gi-dac-biet-ma-tung-duoc-dau-gia-toi-47-ty----nh-1-1551926824-width393height424.jpeg\" /></p>\r\n\r\n<p>Một ch&uacute; c&aacute; coi từng được đấu gi&aacute; 47 tỷ VNĐ</p>\r\n\r\n<p>Năm 2018, khối lượng xuất khẩu của c&aacute; Koi Nhật Bản l&agrave; 3.633 tỷ y&ecirc;n, tăng gấp đ&ocirc;i trong thập kỷ qua. C&aacute;c nơi xuất khẩu c&aacute; ch&iacute;nh l&agrave; Hồng K&ocirc;ng, H&agrave; Lan v&agrave; Đức. Trong những năm gần đ&acirc;y, giao dịch với người mua từ Brazil v&agrave; C&aacute;c Tiểu vương quốc Ả Rập Thống nhất cũng tăng l&ecirc;n. Về vấn đề n&agrave;y, Nakajima Masato, chủ tịch C&acirc;u lạc bộ Aibo Nhật Bản, giải th&iacute;ch: &quot;Điểm gi&uacute;p c&aacute; Koi thu h&uacute;t mọi người l&agrave; những đốm hoa văn độc nhất v&ocirc; nhị của ch&uacute;ng.&quot;</p>\r\n\r\n<p>C&aacute; Koi c&oacute; nguồn gốc ở l&agrave; tỉnh Niigata, Nhật Bản. V&agrave;o thời Edo, trong ao nu&ocirc;i c&aacute; ch&eacute;p với mục đ&iacute;ch để chế biến m&oacute;n ăn bỗng dưng xuất hiện những con c&aacute; c&oacute; đốm hoa văn k&igrave; lạ tr&ecirc;n m&igrave;nh, thấy vậy mọi người nu&ocirc;i ch&uacute;ng l&agrave;m c&aacute; cảnh. Sau nhiều thế hệ giao phối nh&acirc;n tạo, c&aacute; Koi đ&atilde; được cải tiến th&agrave;nh một lo&agrave;i c&aacute; cảnh đẹp v&agrave; lộng lẫy hơn.</p>\r\n\r\n<p><img alt=\"Loài cá Nhật Bản này có gì đặc biệt mà từng được đấu giá tới 47 tỷ? - 2\" src=\"https://cdn.24h.com.vn/upload/1-2019/images/2019-03-11/1552278583-790-loai-ca-nhat-ban-nay-co-gi-dac-biet-ma-tung-duoc-dau-gia-toi-47-ty----nh-2-1551926802-width592height342.jpeg\" /></p>\r\n\r\n<p>Điểm thu h&uacute;t của c&aacute; koi l&agrave; những đốm hoa văn độc nhất v&ocirc; nhị của ch&uacute;ng</p>\r\n\r\n<p>V&agrave;o th&aacute;ng 11/2018, một hội nghị chuy&ecirc;n đề về c&aacute; Koi đ&atilde; được tổ chức tại Komaki, tỉnh Niigata v&agrave; gần một nửa số người tham gia l&agrave; người nước ngo&agrave;i. Gi&aacute;m đốc điều h&agrave;nh của một c&ocirc;ng ty bất động sản đến từ Trung Quốc chia sẻ: &quot;C&aacute; Koi khiến t&ocirc;i qu&ecirc;n đi &aacute;p lực h&agrave;ng ng&agrave;y. D&ugrave; c&oacute; xem ch&uacute;ng bao l&acirc;u, t&ocirc;i cũng kh&ocirc;ng thấy mệt mỏi.&quot;</p>', '/storage/app/public/images/blog1/1552278583-814-loai-ca-nhat-ban-nay-co-gi-dac-biet-ma-tung-duoc-dau-gia-toi-47-ty----nh-1-1551926824-width393height424.jpeg', 1, '2021-06-22 06:09:22', '2021-06-12 04:49:05', '2021-06-22 06:43:52', NULL),
(19, 'Home Page', NULL, 'home-page', NULL, '/public/upload/product_default.png', 1, '2021-06-22 06:09:22', '2021-06-22 06:04:05', '2021-06-22 07:33:36', '2021-06-22 07:33:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `id` int(255) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` double UNSIGNED DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` int(255) DEFAULT 1,
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gallery` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `brand_id` int(10) UNSIGNED DEFAULT NULL,
  `status` int(1) NOT NULL DEFAULT 1,
  `desc_short` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc_long` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `info` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `offer` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_highlight` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_brand`
--

CREATE TABLE `product_brand` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` tinyint(4) DEFAULT 1,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_category`
--

CREATE TABLE `product_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sku` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_category`
--

INSERT INTO `product_category` (`id`, `parent_id`, `slug`, `sku`, `title`, `order`, `status`, `created_at`, `updated_at`) VALUES
(1, '0', 'ca-koi-canh', 'ca-koi-10000', 'Cá Koi', 0, 1, '2021-06-08 07:56:59', '2021-06-08 07:56:59');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_image`
--

CREATE TABLE `product_image` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_review`
--

CREATE TABLE `product_review` (
  `id` int(11) UNSIGNED NOT NULL,
  `id_ofproduct` int(255) UNSIGNED NOT NULL,
  `id_ofuser` int(10) UNSIGNED NOT NULL,
  `rating` double NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
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
(2, 'mevivu', 'trantruong1797@gmail.com', NULL, '$2y$10$Cf2ts4svFmTVs7wfqNvkxeY2UeymZP/JJ2AzC6ha1T9C2Izjd7D7K', NULL, '2021-06-10 07:43:22', '2021-06-15 10:06:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users_info`
--

CREATE TABLE `users_info` (
  `id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `gender` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users_info`
--

INSERT INTO `users_info` (`id`, `user_id`, `fullname`, `phone`, `address`, `birthday`, `gender`, `created_at`, `updated_at`) VALUES
(2, 2, 'Trần Văn Trường', '0342909557', '998/42/15 Quang trung', '1997-07-01', 1, '2021-06-10 07:43:22', '2021-06-18 03:58:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_campaign`
--

CREATE TABLE `user_campaign` (
  `id` int(255) UNSIGNED NOT NULL,
  `id_ofuser` int(255) NOT NULL,
  `id_ofproduct` int(255) NOT NULL,
  `id_ofcampaign` int(255) NOT NULL,
  `bid_price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Chỉ mục cho bảng `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_user_fk` (`id_ofuser`);

--
-- Chỉ mục cho bảng `bill_details`
--
ALTER TABLE `bill_details`
  ADD KEY `bill_id_fk` (`id_ofbill`),
  ADD KEY `product_bill_id_fk` (`id_ofproduct`);

--
-- Chỉ mục cho bảng `campaign`
--
ALTER TABLE `campaign`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `campaign_details`
--
ALTER TABLE `campaign_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaign_id_fk` (`id_ofcampaign`),
  ADD KEY `campaign_product_fk` (`id_ofproduct`),
  ADD KEY `campaign_userwin_fk` (`id_userwin`);

--
-- Chỉ mục cho bảng `category_post`
--
ALTER TABLE `category_post`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category_to_post`
--
ALTER TABLE `category_to_post`
  ADD KEY `category_to_post_ibfk_1` (`category_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Chỉ mục cho bảng `category_to_product`
--
ALTER TABLE `category_to_product`
  ADD KEY `product_id_fk` (`id_ofproduct`),
  ADD KEY `category_id_fk` (`id_ofcategory`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
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
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_brand_fk` (`brand_id`);

--
-- Chỉ mục cho bảng `product_brand`
--
ALTER TABLE `product_brand`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_review`
--
ALTER TABLE `product_review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_review_user_fk` (`id_ofuser`),
  ADD KEY `review_product_fk` (`id_ofproduct`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `users_info`
--
ALTER TABLE `users_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `user_campaign`
--
ALTER TABLE `user_campaign`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1397;

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
-- AUTO_INCREMENT cho bảng `campaign`
--
ALTER TABLE `campaign`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `campaign_details`
--
ALTER TABLE `campaign_details`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `category_post`
--
ALTER TABLE `category_post`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `users_info`
--
ALTER TABLE `users_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `user_campaign`
--
ALTER TABLE `user_campaign`
  MODIFY `id` int(255) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bill_user_fk` FOREIGN KEY (`id_ofuser`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `bill_details`
--
ALTER TABLE `bill_details`
  ADD CONSTRAINT `bill_id_fk` FOREIGN KEY (`id_ofbill`) REFERENCES `bills` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_bill_id_fk` FOREIGN KEY (`id_ofproduct`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `campaign_details`
--
ALTER TABLE `campaign_details`
  ADD CONSTRAINT `campaign_id_fk` FOREIGN KEY (`id_ofcampaign`) REFERENCES `campaign` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `campaign_product_fk` FOREIGN KEY (`id_ofproduct`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `campaign_userwin_fk` FOREIGN KEY (`id_userwin`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `category_to_post`
--
ALTER TABLE `category_to_post`
  ADD CONSTRAINT `category_to_post_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `category_to_post_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `category_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `category_to_product`
--
ALTER TABLE `category_to_product`
  ADD CONSTRAINT `category_id_fk` FOREIGN KEY (`id_ofcategory`) REFERENCES `product_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id_fk` FOREIGN KEY (`id_ofproduct`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_brand_fk` FOREIGN KEY (`brand_id`) REFERENCES `product_brand` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `product_review`
--
ALTER TABLE `product_review`
  ADD CONSTRAINT `product_review_user_fk` FOREIGN KEY (`id_ofuser`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `review_product_fk` FOREIGN KEY (`id_ofproduct`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `users_info`
--
ALTER TABLE `users_info`
  ADD CONSTRAINT `users_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
