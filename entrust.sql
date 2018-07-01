-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.31-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for entrust
DROP DATABASE IF EXISTS `entrust`;
CREATE DATABASE IF NOT EXISTS `entrust` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `entrust`;

-- Dumping structure for table entrust.items
DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table entrust.items: ~3 rows (approximately)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` (`id`, `title`, `description`, `user_id`, `created_at`, `updated_at`) VALUES
	(4, 'Chào buổi sáng', 'hihi', 2, '2018-06-08 03:26:14', '2018-06-08 03:26:14'),
	(6, 'vi du2', 'sấ', 2, '2018-06-08 06:54:25', '2018-06-08 06:54:25');
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Dumping structure for table entrust.migrations
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table entrust.migrations: ~2 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2018_06_06_065836_entrust_setup_tables', 1),
	(2, '2018_06_06_065936_create_items_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table entrust.password_resets
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table entrust.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table entrust.permissions
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table entrust.permissions: ~12 rows (approximately)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'role-list', 'Display Role Listing', 'See only Listing Of Role', '2018-06-06 07:15:28', '2018-06-06 07:15:28'),
	(2, 'role-create', 'Create Role', 'Create New Role', '2018-06-06 07:15:28', '2018-06-06 07:15:28'),
	(3, 'role-edit', 'Edit Role', 'Edit Role', '2018-06-06 07:15:29', '2018-06-06 07:15:29'),
	(4, 'role-delete', 'Delete Role', 'Delete Role', '2018-06-06 07:15:29', '2018-06-06 07:15:29'),
	(5, 'item-list', 'Display Item Listing', 'See only Listing Of Item', '2018-06-06 07:15:29', '2018-06-06 07:15:29'),
	(6, 'item-create', 'Create Item', 'Create New Item', '2018-06-06 07:15:29', '2018-06-06 07:15:29'),
	(7, 'item-edit', 'Edit Item', 'Edit Item', '2018-06-06 07:15:29', '2018-06-06 07:15:29'),
	(8, 'item-delete', 'Delete Item', 'Delete Item', '2018-06-06 07:15:29', '2018-06-06 07:15:29'),
	(9, 'user-list', 'Display User Listing', 'See only Listing Of User', NULL, NULL),
	(10, 'user-create', 'Create User', 'Create New User', NULL, NULL),
	(11, 'user-edit', 'Edit Item', 'Edit Item', NULL, NULL),
	(12, 'user-delete', 'Delete Item', 'Delete Item', NULL, NULL),
	(13, 'kinhdoanh', 'kinhdoanh', 'kinhdoanh', NULL, NULL),
	(14, 'kithuat', 'kithuat', 'kithuat', NULL, NULL);
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for table entrust.permission_role
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table entrust.permission_role: ~18 rows (approximately)
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
	(1, 1),
	(2, 1),
	(3, 1),
	(4, 1),
	(5, 1),
	(5, 2),
	(6, 1),
	(6, 2),
	(7, 1),
	(8, 1),
	(9, 1),
	(9, 3),
	(10, 1),
	(11, 1),
	(11, 3),
	(12, 1),
	(13, 3),
	(14, 4);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;

-- Dumping structure for table entrust.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table entrust.roles: ~4 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'admin', 'admin', 'admin', NULL, NULL),
	(2, 'user', 'user', 'user', NULL, NULL),
	(3, 'kinhdoanh', 'kinhdoanh', 'kinhdoanh', NULL, NULL),
	(4, 'kithuat', 'kithuat', 'kithuat', NULL, '2018-06-08 04:33:46');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table entrust.role_user
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE IF NOT EXISTS `role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table entrust.role_user: ~6 rows (approximately)
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
	(1, 2),
	(2, 1),
	(4, 2),
	(12, 2),
	(13, 3),
	(14, 4);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;

-- Dumping structure for table entrust.users
DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table entrust.users: ~5 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'huy1', 'huy1@gmail.com', '$2y$10$Lcwzhcw9.e0jPqVQqbrvZOP9YYRDu/ygJhPkDZpdPXy.ZaSDd.9P.', 'Db9urE739oT0kU8QkTh751RiSl9cYHbbnlNCvsVI18iICzblspPvLzD2vi7V', '2018-06-06 07:40:18', '2018-06-06 15:48:54'),
	(2, 'admin', 'admin@gmail.com', '$2y$10$wOWm4lD.yUa6T4Vu/qORpO.vsohAXJ6uNUyseQJ6b4uTyr1N6bH2y', 'YY4KM2o6v3OWCe7vkXGbm5YdqzjAJGtbEuCUJGzwJFfivNyav1OvqsYVVIfb', NULL, NULL),
	(4, 'huy', 'huy2@gmail.com', '$2y$10$SFsQzxtcy71YLF5B/KTJUeeANu5n8B8e/70k/YyQs/iwEP5rYJsUO', NULL, '2018-06-06 16:08:33', '2018-06-06 16:08:42'),
	(12, 'huy312', 'huy3@gmail.com', '$2y$10$E8PJ9kkGx14L5teSGSjKMuUrxcAHu/oAYeTqVL4g8cUwGPPc.tQ76', 't1enDFVcfS6Gs4O8se995YfVPsIn5rqMsi0X5v3CvPddC38ct7p02dSPGJhT', '2018-06-08 03:30:01', '2018-06-13 14:12:12'),
	(13, 'kinhdoanh', 'kinhdoanh@gmail.com', '$2y$10$Z3sgklc.zIlP1eDBql71S.Mo0SILkcnJ94O8YAjeidIOViHJdJ7pm', '0jHSj554ekULQClcukI7kg0fr3Sf21MCqz79SaslBggQuPoEbb2UVUeTAkjG', '2018-06-08 04:01:39', '2018-06-08 04:01:39'),
	(14, 'kithuat', 'kithuat@gmail.com', '$2y$10$qPuSrVjUGb.tweQb/qYxbObN/WmDWEfoykAdWmw7ehtfEVJ3YXD1K', '3wKY25LTZ9zFbuN3DNx3Hn4pkrX3yfa9f0dC9PbHlYswBVmFxU14BpVD5Iig', '2018-06-08 04:02:03', '2018-06-08 04:02:03');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
