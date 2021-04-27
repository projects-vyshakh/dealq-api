# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.7.26)
# Database: apidev
# Generation Time: 2021-04-22 02:38:01 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table attribute_sets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `attribute_sets`;

CREATE TABLE `attribute_sets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_sets_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `attribute_sets` WRITE;
/*!40000 ALTER TABLE `attribute_sets` DISABLE KEYS */;

INSERT INTO `attribute_sets` (`id`, `attribute_sets_name`, `created_at`, `updated_at`)
VALUES
	(1,'Default',NULL,NULL),
	(2,'Default',NULL,NULL);

/*!40000 ALTER TABLE `attribute_sets` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table attributes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `attributes`;

CREATE TABLE `attributes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_sets_id` int(11) NOT NULL,
  `attribute_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;

INSERT INTO `attributes` (`id`, `attribute_sets_id`, `attribute_name`, `created_at`, `updated_at`)
VALUES
	(1,1,'color',NULL,NULL),
	(2,1,'size',NULL,NULL);

/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `category_name`, `parent_id`, `created_at`, `updated_at`)
VALUES
	(1,'Clothings',0,'2021-03-06 10:44:47','2021-03-06 10:44:47'),
	(2,'Mens',1,'2021-03-06 10:44:59','2021-03-06 10:44:59'),
	(6,'Women',1,'2021-03-06 10:54:20','2021-03-06 10:54:20'),
	(7,'Tops',6,'2021-03-06 10:54:38','2021-03-06 10:54:38'),
	(8,'Bottoms',6,'2021-03-06 10:54:46','2021-03-06 10:54:46');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table customers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pincode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referral_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;

INSERT INTO `customers` (`id`, `user_id`, `address`, `pincode`, `referral_code`, `location`, `created_at`, `updated_at`)
VALUES
	(1,6,'vadakara','673104','ABC123','123.5,200.4','2021-04-07 02:16:41','2021-04-07 02:16:41'),
	(2,7,'vadakara','673104','ABC123','123.5,200.4','2021-04-07 02:21:41','2021-04-07 02:21:41'),
	(3,8,'vadakara','673104','ABC123','123.5,200.4','2021-04-07 02:22:51','2021-04-07 02:22:51'),
	(4,12,'vadakara','673104','ABC123','123.5,200.4','2021-04-07 02:27:00','2021-04-07 02:27:00');

/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table media_galleries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `media_galleries`;

CREATE TABLE `media_galleries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `media_galleries` WRITE;
/*!40000 ALTER TABLE `media_galleries` DISABLE KEYS */;

INSERT INTO `media_galleries` (`id`, `uuid`, `media_type`, `path`, `filename`, `created_at`, `updated_at`)
VALUES
	(1,'a269db40-9503-11eb-a6df-21f00ec70b13','images','assets/uploads/catalog/products/1/','16175128400.jpg','2021-04-04 05:07:20','2021-04-04 05:07:20'),
	(2,'a269db40-9503-11eb-a6df-21f00ec70b13','images','assets/uploads/catalog/products/1/','16175128401.png','2021-04-04 05:07:20','2021-04-04 05:07:20'),
	(3,'b1bc6330-9503-11eb-9864-69157c99c9cd','images','assets/uploads/catalog/products/2/','16175128660.jpg','2021-04-04 05:07:46','2021-04-04 05:07:46'),
	(4,'b1bc6330-9503-11eb-9864-69157c99c9cd','images','assets/uploads/catalog/products/2/','16175128661.png','2021-04-04 05:07:46','2021-04-04 05:07:46');

/*!40000 ALTER TABLE `media_galleries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table media_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `media_settings`;

CREATE TABLE `media_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `settings_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allowed_extensions` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'public/assets/uploads/',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;

INSERT INTO `media_settings` (`id`, `settings_name`, `media_type`, `allowed_extensions`, `base_path`, `created_at`, `updated_at`)
VALUES
	(1,'Images','images','[\"jpg\",\"png\",\"jpeg\",\"gif\"]','assets/uploads/','2021-03-21 20:02:38','2021-03-21 20:02:38'),
	(2,'Documents','documents','[\"pdf\",\"doc\",\"docx\",\"txt\"]','assets/uploads/','2021-03-21 20:02:38','2021-03-21 20:02:38');

/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2016_06_01_000001_create_oauth_auth_codes_table',1),
	(3,'2016_06_01_000002_create_oauth_access_tokens_table',1),
	(4,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),
	(5,'2016_06_01_000004_create_oauth_clients_table',1),
	(6,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),
	(7,'2019_08_19_000000_create_failed_jobs_table',1),
	(9,'2020_08_21_023213_create_roles_table',1),
	(13,'2020_09_08_080000_add_uuid_to_users_table',1),
	(16,'2020_09_15_014829_create_media_galleries_table',1),
	(18,'2021_03_06_093812_create_categories_table',2),
	(19,'2021_03_06_110204_create_attributes_table',3),
	(20,'2021_03_06_110218_create_attribute_sets_table',3),
	(28,'2021_03_06_214820_create_media_galleries_table',6),
	(29,'2021_03_06_215127_add_uuid_to_products_table',6),
	(33,'2021_03_20_191110_create_seller_categories_table',7),
	(43,'2021_03_21_084233_create_sellers_table',8),
	(44,'2021_03_21_195307_create_media_settings_table',9),
	(47,'2021_03_21_214126_create_subscription_plans_table',10),
	(48,'2021_03_21_214148_create_subscriptions_table',10),
	(51,'2021_03_06_110237_create_products_table',11),
	(55,'2021_03_26_001741_add_publish_status_to_products_table',12),
	(56,'2021_03_26_001640_add_sort_order_to_products_table',13),
	(57,'2014_10_12_100000_create_password_resets_table',14),
	(58,'2020_08_21_022927_add_roles_to_users_table',15),
	(59,'2020_09_08_000923_add_phone_to_users_table',15),
	(60,'2021_04_03_022245_create_customers_table',16),
	(63,'2021_04_03_111717_add_reference_code_to_sellers_table',18),
	(65,'2021_04_04_054821_create_qr_generated_table',19),
	(66,'2021_04_07_020827_create_notifications_table',20),
	(68,'2021_04_03_040913_add_status_to_users_table',21),
	(69,'2021_04_16_041751_create_student_table',22),
	(70,'2021_04_16_043023_create_students_table',23),
	(71,'2021_04_16_045608_create_students_table',24),
	(73,'2021_04_20_092553_add_otp_to_users_table',25);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table notifications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_email_sent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_status` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table oauth_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_access_tokens`;

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`)
VALUES
	('060aa34793c0d973fb8de4f8c4034bdee6297e16934e8851778be429c24a02b22f5e5d0d152ad1ca',4,1,'DealQ','[]',0,'2021-04-04 04:28:27','2021-04-04 04:28:27','2022-04-04 04:28:27'),
	('29d31f98365d0cbfb5d74632ced26e7f07d465d421b1a525ea72e109762f295ed13b0975e6ae213a',4,1,'DealQ','[]',0,'2021-04-09 07:42:03','2021-04-09 07:42:03','2022-04-09 07:42:03'),
	('30790f854fbafcfaffb899c7ffe4435d3644399fd7553265943c0aabe7c22677fdff844f6ff5c62e',4,1,'DealQ','[]',0,'2021-04-04 04:30:48','2021-04-04 04:30:48','2022-04-04 04:30:48'),
	('34d095375f9fc2731d51ee2f487d9969f75f35d21098eeaa2efe11b8fae38bb901e5d1fd6a7eba56',4,1,'DealQ','[]',0,'2021-04-20 09:15:27','2021-04-20 09:15:27','2022-04-20 09:15:27'),
	('6574825fb172643d42eb9e28a6ef213c0631b35b1228f53d27903a42dcd86ffc5bce35e07867e1d0',4,1,'DealQ','[]',0,'2021-04-04 04:29:46','2021-04-04 04:29:46','2022-04-04 04:29:46'),
	('8a476360fd0b6d6abeab6cf9ee4d67ce00cc650f3ad464cc40bd65f1864ac3290675e2ae47c886e7',4,1,'DealQ','[]',0,'2021-04-04 04:29:20','2021-04-04 04:29:20','2022-04-04 04:29:20'),
	('9105683bf3da2a1c0b152f0acf682d51c9d60504a22cd49c2f296e43a6c36ea13649296a8067250e',4,1,'DealQ','[]',0,'2021-04-04 04:16:16','2021-04-04 04:16:16','2022-04-04 04:16:16'),
	('ad6244992b3eabdf056c7d644b9cc88e0ff1166ba6bce30435fca06f01a2eb1f800472a49c18feeb',4,1,'DealQ','[]',0,'2021-04-04 04:29:52','2021-04-04 04:29:52','2022-04-04 04:29:52'),
	('f50281eb9d90535c0dba3bbe10423c98d5679adf0022078da23e2d6bb1a0f372ad6314b9bb30b6de',4,1,'DealQ','[]',0,'2021-04-04 04:02:46','2021-04-04 04:02:46','2022-04-04 04:02:46');

/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_auth_codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_auth_codes`;

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table oauth_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_clients`;

CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`)
VALUES
	(1,NULL,'Laravel Personal Access Client','1gVhxP0JAlCHLWNvqHS3p2T7fg6UBCJmK2iHIIMd',NULL,'http://localhost',1,0,0,'2021-02-13 00:19:33','2021-02-13 00:19:33'),
	(2,NULL,'Laravel Password Grant Client','0kT7hC0npEBG9eEYKNnzYvk6wSxQS4ZcR9CTHbVi','users','http://localhost',0,1,0,'2021-02-13 00:19:33','2021-02-13 00:19:33');

/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_personal_access_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_personal_access_clients`;

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`)
VALUES
	(1,1,'2021-02-13 00:19:33','2021-02-13 00:19:33');

/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_refresh_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_refresh_tokens`;

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table products
# ------------------------------------------------------------

DROP TABLE IF EXISTS `products`;

CREATE TABLE `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `offer_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `category` int(11) NOT NULL DEFAULT '0',
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `publish_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_sku_unique` (`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;

INSERT INTO `products` (`id`, `name`, `sku`, `description`, `quantity`, `price`, `offer_price`, `category`, `uuid`, `is_active`, `created_at`, `updated_at`, `publish_status`, `sort_order`)
VALUES
	(1,'Shirts','SHIRT502','Combo offer',0,300.00,280.00,1,'a269db40-9503-11eb-a6df-21f00ec70b13',1,'2021-04-04 05:07:20','2021-04-04 06:53:14','1',1),
	(2,'Shirts','SHIRT501','Combo offer',20,300.00,280.00,1,'b1bc6330-9503-11eb-9864-69157c99c9cd',1,'2021-04-04 05:07:46','2021-04-04 05:42:57','0',2);

/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table qr_generated
# ------------------------------------------------------------

DROP TABLE IF EXISTS `qr_generated`;

CREATE TABLE `qr_generated` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `qr_generated` WRITE;
/*!40000 ALTER TABLE `qr_generated` DISABLE KEYS */;

INSERT INTO `qr_generated` (`id`, `product_id`, `user_id`, `code`, `created_at`, `updated_at`)
VALUES
	(1,1,1,'IJ4Y9X','2021-04-04 06:52:01','2021-04-04 06:52:01'),
	(2,1,1,'KLYHHY','2021-04-04 06:52:18','2021-04-04 06:52:18'),
	(3,1,1,'LJE0FR','2021-04-04 06:52:40','2021-04-04 06:52:40'),
	(4,1,1,'HGJL4L','2021-04-04 06:52:51','2021-04-04 06:52:51'),
	(5,1,1,'S89FGW','2021-04-04 06:53:14','2021-04-04 06:53:14'),
	(6,1,1,'KHIIXR','2021-04-04 06:53:27','2021-04-04 06:53:27'),
	(7,1,1,'VOXASG','2021-04-09 07:21:18','2021-04-09 07:21:18');

/*!40000 ALTER TABLE `qr_generated` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table seller_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `seller_categories`;

CREATE TABLE `seller_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `seller_categories` WRITE;
/*!40000 ALTER TABLE `seller_categories` DISABLE KEYS */;

INSERT INTO `seller_categories` (`id`, `name`, `is_active`, `created_at`, `updated_at`)
VALUES
	(1,'Clothing',1,NULL,NULL),
	(2,'Grocerry',1,NULL,NULL);

/*!40000 ALTER TABLE `seller_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sellers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sellers`;

CREATE TABLE `sellers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `seller_categories` int(11) NOT NULL DEFAULT '0',
  `brand_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fssai_license` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gst` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `promocode` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `reference_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;

INSERT INTO `sellers` (`id`, `user_id`, `seller_categories`, `brand_name`, `address`, `pincode`, `location`, `fssai_license`, `gst`, `promocode`, `created_at`, `updated_at`, `reference_code`)
VALUES
	(1,2,1,'Test Brand','vadakara',673104,'340.4,300.6','TESTLICENCE100',NULL,'HR8LYE','2021-04-04 03:21:05','2021-04-04 03:21:05','TESTCODE'),
	(2,3,1,'Test Brand','vadakara',673104,'340.4,300.6','TESTLICENCE100',NULL,'DOFSRU','2021-04-04 04:00:26','2021-04-04 04:00:26','TESTCODE'),
	(3,4,1,'Test Brand','vadakara',673104,'340.4,300.6','TESTLICENCE100',NULL,'EDNVIO','2021-04-04 04:01:53','2021-04-04 04:01:53','TESTCODE'),
	(4,5,1,'Test Brand','vadakara',673104,'340.4,300.6','TESTLICENCE100',NULL,'P0JWKX','2021-04-07 02:15:00','2021-04-07 02:15:00','TESTCODE'),
	(5,9,1,'Test Brand','vadakara',673104,'340.4,300.6','TESTLICENCE100',NULL,'6NH2T6','2021-04-07 02:23:15','2021-04-07 02:23:15','TESTCODE'),
	(6,10,1,'Test Brand','vadakara',673104,'340.4,300.6','TESTLICENCE100',NULL,'UABIP9','2021-04-07 02:24:22','2021-04-07 02:24:22','TESTCODE'),
	(7,11,1,'Test Brand','vadakara',673104,'340.4,300.6','TESTLICENCE100',NULL,'EN4ACB','2021-04-07 02:26:39','2021-04-07 02:26:39','TESTCODE'),
	(8,13,1,'Test Brand','vadakara',673104,'340.4,300.6','TESTLICENCE100',NULL,'GLQOZY','2021-04-20 09:15:09','2021-04-20 09:15:09','TESTCODE'),
	(9,14,1,'Test Brand','vadakara',673104,'340.4,300.6','TESTLICENCE100',NULL,'OOFUKV','2021-04-20 09:16:43','2021-04-20 09:16:43','TESTCODE');

/*!40000 ALTER TABLE `sellers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table subscription_plans
# ------------------------------------------------------------

DROP TABLE IF EXISTS `subscription_plans`;

CREATE TABLE `subscription_plans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `plan_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `subscription_plans` WRITE;
/*!40000 ALTER TABLE `subscription_plans` DISABLE KEYS */;

INSERT INTO `subscription_plans` (`id`, `plan_name`, `plan_price`, `plan_code`, `description`, `is_active`, `created_at`, `updated_at`)
VALUES
	(1,'Basic Plan',1500.00,'basic1500','1 month free+ 3 months+ 5 adv slot',1,NULL,NULL),
	(2,'Basic Plan',2000.00,'basic2000','1 month free+ 3 months+ 10 adv slot',1,NULL,NULL),
	(3,'Advanced Plan',2500.00,'basic2500','1 month free+ 6 months+ 5 adv slot',1,NULL,NULL),
	(4,'Super Plan',3000.00,'basic3000','1 month free+ 6 months+ 10 adv slot',1,NULL,NULL);

/*!40000 ALTER TABLE `subscription_plans` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table subscriptions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `subscriptions`;

CREATE TABLE `subscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `plan_id` int(11) NOT NULL DEFAULT '0',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subscription_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `otp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `uuid`, `role`, `phone`, `status`, `otp`)
VALUES
	(1,'Dealq Admin','admin@dealq.com',NULL,'$2y$10$pcQm9Nqd3hmlG/lBzlWaZ.h6umk/afbsiZAwMnhNtcMZttNYLlwrS',NULL,'2021-04-04 03:20:34','2021-04-04 03:20:34','b808ec70-94f4-11eb-9a4c-3dbe154ee375','admin',NULL,0,NULL),
	(2,'Test Seller','seller@dealq.com',NULL,'$2y$10$Vv759IzA63NHcESZmwefE.EEv4WzSLDXulRU7patTakoMO2rAGaD6',NULL,'2021-04-04 03:21:05','2021-04-20 08:58:05','ca34ff00-94f4-11eb-930f-d983d6be007a','seller','7907487010',1,NULL),
	(3,'Test Seller2','seller@dealq.com2',NULL,'$2y$10$UnEEO/5yuy8w/GOADQB21O0YYkQAGW.y8GMSEa.Akrowemrs3Rl8e',NULL,'2021-04-04 04:00:26','2021-04-20 08:58:02','49819470-94fa-11eb-96fb-256987734b48','seller','7907487010',1,NULL),
	(4,'Test Seller2','seller2@dealq.com',NULL,'$2y$10$YfHGsUfOa8OynIGPnv1CR.xQtcxsxlyN5EOr5cjjPx2qoh/rWYqLq',NULL,'2021-04-04 04:01:53','2021-04-20 08:57:59','7d6e1590-94fa-11eb-8aff-8f896e119a8c','seller','7907487010',1,NULL),
	(5,'Test Seller','seller1@dealq.com',NULL,'$2y$10$3n9rGcR/fBIMrOjrLx82W.6erfcZAKVRXbPbeFTIyLjSrYVOckMHK',NULL,'2021-04-07 02:15:00','2021-04-20 08:49:37','0e928e00-9747-11eb-bcc7-17b4818f0f0e','seller','7907487010',1,NULL),
	(6,'vyshakh ps','user3@dealq.com',NULL,'$2y$10$6aJnMtk87W1P8dxJtpV/Nu/gM3FQAim2kYsLXylEhYs.5kEKDNbEW',NULL,'2021-04-07 02:16:41','2021-04-07 02:16:41','4abfb370-9747-11eb-a2bc-cf9aed41a8ec','customer','7907487010',0,NULL),
	(7,'vyshakh ps','user5@dealq.com',NULL,'$2y$10$1aOcS4xo7nrLA8BL71vxxeCnL7nSVy9CiQRsocDYAZoplq4hzOC3S',NULL,'2021-04-07 02:21:41','2021-04-07 02:21:41','fd90c260-9747-11eb-9d70-255739a97cb3','customer','7907487010',0,NULL),
	(8,'vyshakh ps','user6@dealq.com',NULL,'$2y$10$xZ6Upms/zEqJbqCztoFTQu7KTekYD83hg2USQWI7cLT.Y5B9TP5/O',NULL,'2021-04-07 02:22:51','2021-04-07 02:22:51','27200c90-9748-11eb-b79b-637841b5d875','customer','7907487010',0,NULL),
	(9,'Test Seller','seller3@dealq.com',NULL,'$2y$10$NW8NOe6MyUl28MXdxOUb9O21dKw3Pii372wa2sAZ5EVAr06CyWtXC',NULL,'2021-04-07 02:23:15','2021-04-20 08:58:07','357a9610-9748-11eb-8589-b3cc77029687','seller','7907487010',1,NULL),
	(10,'Test Seller','seller4@dealq.com',NULL,'$2y$10$UyBUmY8EOtzyi5jSxhng/uDI5nRn/Hlgjt/SfkcoCS2jtuLmDACby',NULL,'2021-04-07 02:24:22','2021-04-20 08:58:09','5d572ca0-9748-11eb-9ac1-2383e2677689','seller','7907487010',1,NULL),
	(11,'Test Seller','seller5@dealq.com',NULL,'$2y$10$Wx1USBmaPRcxV2eMjCTLP.FHBICUrL.Dma0IDF311pBcjFDFGaAsW',NULL,'2021-04-07 02:26:39','2021-04-20 08:58:12','af0085e0-9748-11eb-b35d-794e70a26e62','seller','7907487010',1,NULL),
	(12,'vyshakh ps','user7@dealq.com',NULL,'$2y$10$xiUHOFOAOYqih6pJNhYv6.7ap3JLFLTF23qwRt72JXSCBFskHKqXu',NULL,'2021-04-07 02:27:00','2021-04-07 02:27:00','bbbe72a0-9748-11eb-afdf-5bbf19148e6c','customer','7907487010',1,NULL),
	(13,'Test Seller','seller100@dealq.com',NULL,'$2y$10$uL7i6giPoyYa1yohYTh1vecNhRUdH9g63rMPF3/CaZKBRRoSIq1Ny',NULL,'2021-04-20 09:15:09','2021-04-20 09:15:09','e7c9ff10-a1b8-11eb-b86a-85f3b7b94ba0','seller','7907487010',0,NULL),
	(14,'Test Seller','seller101@dealq.com',NULL,'$2y$10$RCms3Ia6BJWykzkCfmW9jud0t4FW237IHd9TtPOj1yA0xNhpJ1lb6',NULL,'2021-04-20 09:16:43','2021-04-20 09:16:43','1f9c8d60-a1b9-11eb-9621-2159eb1fc97c','seller','7907487010',0,NULL),
	(15,'7907487011','7907487011@demo.com',NULL,'$2y$10$c1S0viy9a5FIVeRvXIIBQOugDP6SDhyrCJnZdXPOzwWoA6n9Erbwe',NULL,'2021-04-20 09:43:11','2021-04-20 09:58:02','d1f478b0-a1bc-11eb-be6a-c197ea6fd183','customer','7907487011',1,'');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
