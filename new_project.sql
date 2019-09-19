-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 19, 2019 at 02:46 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `new_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Super Admin',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `phone_number`, `password`, `image`, `type`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Saiful Islam', 'saifulislampyada@gmail.com', '01700899084', '$2y$10$Ra6zLtJ7x8CWMGZ.Qg3m9OeTxO5ZUrW8RakJIlakiYB2PBeirMbkm', '166572fc606a2ce393642c3536330d68.jpg', 'Super Admin', NULL, '2019-09-13 09:49:48', '2019-09-13 10:16:52');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(2, 'Logo', NULL, '1568563949.jpg', '2019-09-15 10:12:29', '2019-09-15 10:12:29');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_quantity` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `user_id`, `order_id`, `ip_address`, `product_quantity`, `created_at`, `updated_at`) VALUES
(9, 5, NULL, 3, '127.0.0.1', 1, '2019-09-18 10:18:21', '2019-09-18 10:18:49'),
(10, 5, NULL, 4, '127.0.0.1', 2, '2019-09-18 10:22:09', '2019-09-18 12:07:16'),
(11, 4, NULL, 4, '127.0.0.1', 1, '2019-09-18 12:06:23', '2019-09-18 12:07:16'),
(12, 4, 2, NULL, '127.0.0.1', 1, '2019-09-19 02:06:45', '2019-09-19 02:06:45');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `image`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Bike', 'Bajaj Motor Bike', '1568478600.jpg', NULL, '2019-09-14 10:30:00', '2019-09-14 10:30:00'),
(6, 'Electric Bike', NULL, '1568565269.jpg', 1, '2019-09-15 10:34:29', '2019-09-15 10:34:29'),
(8, 'Car', NULL, NULL, NULL, '2019-09-16 04:43:55', '2019-09-16 04:43:55'),
(9, 'Red Car', 'Red Car Red Car Red Car', '1568630690.jpg', 8, '2019-09-16 04:44:51', '2019-09-16 04:44:51'),
(10, 'Road Master', NULL, '1568885576.jpg', 1, '2019-09-19 03:32:57', '2019-09-19 03:32:57'),
(11, 'Bicyle', NULL, '1568885703.jpg', NULL, '2019-09-19 03:35:03', '2019-09-19 03:35:03'),
(12, 'Phonix', NULL, '1568885733.jpg', 11, '2019-09-19 03:35:33', '2019-09-19 03:35:33'),
(13, 'Safari', NULL, '1568885754.jpg', 11, '2019-09-19 03:35:54', '2019-09-19 03:35:54'),
(14, 'SK Force', NULL, '1568885783.jpg', 11, '2019-09-19 03:36:23', '2019-09-19 03:36:23'),
(15, 'kawasaki', NULL, '1568888729.jpg', 1, '2019-09-19 04:25:30', '2019-09-19 04:25:30'),
(16, 'electric', NULL, '1568888753.jpg', 8, '2019-09-19 04:25:53', '2019-09-19 04:25:53'),
(17, 'Aprilia', NULL, '1568888778.jpg', 1, '2019-09-19 04:26:18', '2019-09-19 04:26:18'),
(18, 'Aprilia v-2', NULL, '1568888803.jpg', 1, '2019-09-19 04:26:43', '2019-09-19 04:26:43'),
(19, 'Hybrid', NULL, '1568888826.jpg', 8, '2019-09-19 04:27:06', '2019-09-19 04:27:06'),
(20, 'Wagon', NULL, '1568888845.jpg', 8, '2019-09-19 04:27:25', '2019-09-19 04:27:25');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(4, '2014_10_12_000000_create_users_table', 1),
(5, '2014_10_12_100000_create_password_resets_table', 1),
(8, '2019_09_13_144826_create_admins_table', 2),
(9, '2019_09_14_133730_create_categories_table', 3),
(10, '2019_09_14_134219_create_brands_table', 3),
(11, '2019_09_14_134442_create_settings_table', 3),
(12, '2019_09_14_134557_create_payments_table', 3),
(13, '2019_09_15_170709_create_product_image_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `payment_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_charge` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '60',
  `custom_discount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `is_paid` tinyint(1) NOT NULL DEFAULT '0',
  `is_completed` tinyint(1) NOT NULL DEFAULT '0',
  `is_seen_by_admin` tinyint(1) NOT NULL DEFAULT '0',
  `transaction_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `payment_id`, `ip_address`, `name`, `phone_no`, `shipping_address`, `shipping_charge`, `custom_discount`, `email`, `message`, `is_paid`, `is_completed`, `is_seen_by_admin`, `transaction_id`, `created_at`, `updated_at`) VALUES
(4, 2, 2, '127.0.0.1', 'Saiful', '01700899084', 'Mirpur,Dhaka', '80', '0', 'mdsaifulislampyada@gmail.com', 'Nothing', 1, 1, 1, '123', '2019-09-18 12:07:16', '2019-09-18 12:34:11');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` tinyint(4) NOT NULL DEFAULT '1',
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Payment No',
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Agent|Personal',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `name`, `image`, `priority`, `short_name`, `no`, `type`, `created_at`, `updated_at`) VALUES
(1, 'cash_in', 'image.jpg', 1, 'cash_in', NULL, NULL, '2019-09-18 14:34:00', '2019-09-18 14:34:00'),
(2, 'bkash', 'bkash.jpg', 2, 'bkash', '01700899084', 'Agent', '2019-09-18 14:35:04', '2019-09-18 14:35:04'),
(3, 'rocket', 'rocket.jpg', 3, 'rocket', '017008990840', 'Personal', '2019-09-18 14:36:11', '2019-09-18 14:36:11');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `brand_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `brand_id`, `title`, `description`, `slug`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(4, 1, 2, 'Electric Bike', 'Electric Bike Electric Bike Electric Bike Electric Bike', 'electric-bike', 2, 156000, '2019-09-15 12:00:19', '2019-09-16 04:18:10'),
(5, 8, 2, 'Red Car', 'Red Car Red Car Red Car Red Car', 'red-car', 1, 1470000, '2019-09-16 04:50:35', '2019-09-16 04:50:35'),
(6, 11, 2, 'Bicyle', 'BicyleBicyleBicyleBicyleBicyleBicyleBicyleBicyleBicyleBicyle', 'bicyle', 3, 34500, '2019-09-19 03:37:29', '2019-09-19 03:37:29'),
(7, 11, 2, 'Phonix', 'PhonixPhonixPhonixPhonixPhonixPhonixPhonixPhonix', 'phonix', 1, 34500, '2019-09-19 03:38:10', '2019-09-19 03:38:10'),
(8, 11, 2, 'Safari', 'Safari Safari Safari Safari Safari Safari  Safari', 'safari', 1, 34500, '2019-09-19 03:39:04', '2019-09-19 03:39:04'),
(9, 11, 2, 'Sk Force', 'Sk Force Sk Force Sk Force Sk ForceSk ForceSk ForceSk Force Sk Force', 'sk-force', 1, 34500, '2019-09-19 03:39:53', '2019-09-19 03:39:53'),
(10, 1, 2, 'Road Master', 'Road Master Road Master Road Master Road Master Road Master', 'road-master', 1, 340000, '2019-09-19 03:41:15', '2019-09-19 03:41:15'),
(11, 1, 2, 'Kawasaki', 'Kawasaki Kawasaki Kawasaki KawasakiKawasaki', 'kawasaki', 1, 450000, '2019-09-19 04:24:36', '2019-09-19 04:24:36'),
(12, 1, 2, 'Aprilia', 'Aprilia Aprilia Aprilia Aprilia  ApriliaAprilia Aprilia Aprilia', 'aprilia', 2, 450000, '2019-09-19 04:28:30', '2019-09-19 04:28:30'),
(13, 1, 2, 'Aprilia v-2', 'Aprilia v-2 Aprilia v-2 Aprilia v-2 Aprilia v-2 Aprilia v-2 Aprilia v-2', 'aprilia-v-2', 1, 380000, '2019-09-19 04:29:16', '2019-09-19 04:29:16'),
(14, 8, 2, 'Hybrid', 'Hybrid  Hybrid Hybrid Hybrid Hybrid Hybrid Hybrid Hybrid', 'hybrid', 1, 1890000, '2019-09-19 04:30:00', '2019-09-19 04:30:00'),
(15, 8, 2, 'Wagon', 'Wagon Wagon Wagon Wagon Wagon Wagon  Wagon', 'wagon', 1, 2140000, '2019-09-19 04:30:47', '2019-09-19 04:30:47'),
(16, 8, 2, 'Electric', 'Electric Car Electric Car Electric Car Electric Car Electric Car Electric Car', 'electric', 1, 3450000, '2019-09-19 04:31:46', '2019-09-19 04:31:46');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `image`, `created_at`, `updated_at`) VALUES
(3, 4, '1568570419.jpg', '2019-09-15 12:00:19', '2019-09-15 12:00:19'),
(4, 5, '1568631035.jpg', '2019-09-16 04:50:35', '2019-09-16 04:50:35'),
(5, 6, '1568885849.jpg', '2019-09-19 03:37:30', '2019-09-19 03:37:30'),
(6, 7, '1568885890.jpg', '2019-09-19 03:38:10', '2019-09-19 03:38:10'),
(7, 8, '1568885944.jpg', '2019-09-19 03:39:04', '2019-09-19 03:39:04'),
(8, 9, '1568885993.jpg', '2019-09-19 03:39:53', '2019-09-19 03:39:53'),
(9, 10, '1568886075.jpg', '2019-09-19 03:41:15', '2019-09-19 03:41:15'),
(10, 11, '1568888676.jpg', '2019-09-19 04:24:37', '2019-09-19 04:24:37'),
(11, 12, '1568888910.jpg', '2019-09-19 04:28:30', '2019-09-19 04:28:30'),
(12, 13, '1568888956.jpg', '2019-09-19 04:29:16', '2019-09-19 04:29:16'),
(13, 14, '1568889000.jpg', '2019-09-19 04:30:00', '2019-09-19 04:30:00'),
(14, 15, '1568889047.jpg', '2019-09-19 04:30:47', '2019-09-19 04:30:47'),
(15, 16, '1568889107.jpg', '2019-09-19 04:31:47', '2019-09-19 04:31:47');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_no` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shipping_cost` int(10) UNSIGNED NOT NULL DEFAULT '100',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `phone_no`, `address`, `shipping_cost`, `created_at`, `updated_at`) VALUES
(1, 'saiful', '01700899084', 'mirpur', 100, '2019-09-18 15:21:37', '2019-09-18 15:21:37');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '0=Inactive|1=active|2=Ban',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone_no`, `email`, `password`, `address`, `image`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Saiful', '01700899084', 'mdsaifulislampyada@gmail.com', '$2y$10$ck7vibnfniSNxZ8eRl6cp.tBJIMj7o/k/vI6CdcORORFhEkWfHeKK', 'Mirpur,section-2,Dhaka', '4c9d5ff88e3c4d2bb05cb4bece4a2406.jpg', 1, 'OqpQh6Kq5ygUMJ5zgf0XGlvt7tcPTOOwKUuaYO124XHwbR27Rm9jvDq696ZQ', '2019-09-12 01:59:17', '2019-09-12 12:41:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD UNIQUE KEY `admins_phone_number_unique` (`phone_number`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payments_short_name_unique` (`short_name`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_name_unique` (`name`),
  ADD UNIQUE KEY `users_phone_no_unique` (`phone_no`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
