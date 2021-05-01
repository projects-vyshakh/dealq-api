-- MySQL dump 10.13  Distrib 5.7.26, for osx10.10 (x86_64)
--
-- Host: localhost    Database: apidev
-- ------------------------------------------------------
-- Server version	5.7.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attribute_sets`
--

DROP TABLE IF EXISTS `attribute_sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attribute_sets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_sets_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_sets`
--

LOCK TABLES `attribute_sets` WRITE;
/*!40000 ALTER TABLE `attribute_sets` DISABLE KEYS */;
INSERT INTO `attribute_sets` VALUES (1,'Default',NULL,NULL),(2,'Default',NULL,NULL);
/*!40000 ALTER TABLE `attribute_sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attributes`
--

DROP TABLE IF EXISTS `attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attributes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attribute_sets_id` int(11) NOT NULL,
  `attribute_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attributes`
--

LOCK TABLES `attributes` WRITE;
/*!40000 ALTER TABLE `attributes` DISABLE KEYS */;
INSERT INTO `attributes` VALUES (1,1,'color',NULL,NULL),(2,1,'size',NULL,NULL);
/*!40000 ALTER TABLE `attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Clothings',0,'2021-03-06 05:14:47','2021-03-06 05:14:47'),(2,'Mens',1,'2021-03-06 05:14:59','2021-03-06 05:14:59'),(6,'Women',1,'2021-03-06 05:24:20','2021-03-06 05:24:20'),(7,'Tops',6,'2021-03-06 05:24:38','2021-03-06 05:24:38'),(8,'Bottoms',6,'2021-03-06 05:24:46','2021-03-06 05:24:46'),(9,'Furnitures',0,'2021-04-27 01:07:11','2021-04-27 01:07:11');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,34,'vadakara','673104','ABC123','123.5,200.4','2021-04-30 22:12:48','2021-04-30 22:12:48');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_galleries`
--

DROP TABLE IF EXISTS `media_galleries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_galleries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bucket` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_galleries`
--

LOCK TABLES `media_galleries` WRITE;
/*!40000 ALTER TABLE `media_galleries` DISABLE KEYS */;
INSERT INTO `media_galleries` VALUES (1,'23d027b0-aa46-11eb-bfd5-bd551403c0b3','images','assets/uploads/shop/23d027b0-aa46-11eb-bfd5-bd551403c0b3/','16198503790.jpeg','2021-05-01 00:56:19','2021-05-01 00:56:19',NULL),(2,'23d027b0-aa46-11eb-bfd5-bd551403c0b3','images','assets/uploads/shop/23d027b0-aa46-11eb-bfd5-bd551403c0b3/','16198503791.jpeg','2021-05-01 00:56:19','2021-05-01 00:56:19',NULL),(3,'23d027b0-aa46-11eb-bfd5-bd551403c0b3','images','assets/uploads/shop/23d027b0-aa46-11eb-bfd5-bd551403c0b3/','1619850379.jpeg','2021-05-01 00:56:19','2021-05-01 00:56:19',NULL);
/*!40000 ALTER TABLE `media_galleries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `settings_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allowed_extensions` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'public/assets/uploads/',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_settings`
--

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;
INSERT INTO `media_settings` VALUES (1,'Images','images','[\"jpg\",\"png\",\"jpeg\",\"gif\"]','assets/uploads/','2021-03-21 14:32:38','2021-03-21 14:32:38'),(2,'Documents','documents','[\"pdf\",\"doc\",\"docx\",\"txt\"]','assets/uploads/','2021-03-21 14:32:38','2021-03-21 14:32:38'),(3,'QR Codes','qr_images','[\"jpg\",\"png\",\"jpeg\",\"gif\"]','assets/uploads/','2021-03-21 14:32:38','2021-03-21 14:32:38');
/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2016_06_01_000001_create_oauth_auth_codes_table',1),(3,'2016_06_01_000002_create_oauth_access_tokens_table',1),(4,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(5,'2016_06_01_000004_create_oauth_clients_table',1),(6,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(7,'2019_08_19_000000_create_failed_jobs_table',1),(9,'2020_08_21_023213_create_roles_table',1),(13,'2020_09_08_080000_add_uuid_to_users_table',1),(16,'2020_09_15_014829_create_media_galleries_table',1),(18,'2021_03_06_093812_create_categories_table',2),(19,'2021_03_06_110204_create_attributes_table',3),(20,'2021_03_06_110218_create_attribute_sets_table',3),(28,'2021_03_06_214820_create_media_galleries_table',6),(29,'2021_03_06_215127_add_uuid_to_products_table',6),(33,'2021_03_20_191110_create_seller_categories_table',7),(43,'2021_03_21_084233_create_sellers_table',8),(44,'2021_03_21_195307_create_media_settings_table',9),(47,'2021_03_21_214126_create_subscription_plans_table',10),(48,'2021_03_21_214148_create_subscriptions_table',10),(51,'2021_03_06_110237_create_products_table',11),(55,'2021_03_26_001741_add_publish_status_to_products_table',12),(56,'2021_03_26_001640_add_sort_order_to_products_table',13),(57,'2014_10_12_100000_create_password_resets_table',14),(58,'2020_08_21_022927_add_roles_to_users_table',15),(59,'2020_09_08_000923_add_phone_to_users_table',15),(60,'2021_04_03_022245_create_customers_table',16),(63,'2021_04_03_111717_add_reference_code_to_sellers_table',18),(65,'2021_04_04_054821_create_qr_generated_table',19),(66,'2021_04_07_020827_create_notifications_table',20),(68,'2021_04_03_040913_add_status_to_users_table',21),(69,'2021_04_16_041751_create_student_table',22),(70,'2021_04_16_043023_create_students_table',23),(71,'2021_04_16_045608_create_students_table',24),(73,'2021_04_20_092553_add_otp_to_users_table',25),(74,'2021_04_29_213642_add_real_validity_to_subscription_plans',26),(75,'2021_04_29_213704_add_extra_validity_to_subscription_plans',26),(76,'2021_04_29_213724_add_validity_to_subscription_plans',26),(77,'2021_04_29_213737_add_slots_to_subscription_plans',26),(80,'2021_04_29_220617_add_plan_code_to_subscriptions_table',27),(81,'2021_04_29_220636_add_seller_id_to_subscriptions_table',27),(82,'2021_04_30_192312_add_is_registration_completed_to_users_table',28),(83,'2021_05_01_053128_add_bucket_to_media_galleries_table',29),(84,'2021_05_01_065533_add_quantity_to_qr_generated_table',30),(85,'2021_05_01_075546_add_qr_path_to_qr_generated_table',31);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('019134bc89841f019fb62b4e9197e12e82ab30746f08344b42207e9002c65f876fe9a479db2df7d8',34,1,'DealQ','[]',0,'2021-04-30 23:48:00','2021-04-30 23:48:00','2022-05-01 05:18:00'),('060aa34793c0d973fb8de4f8c4034bdee6297e16934e8851778be429c24a02b22f5e5d0d152ad1ca',4,1,'DealQ','[]',0,'2021-04-03 22:58:27','2021-04-03 22:58:27','2022-04-04 04:28:27'),('0637f0d82e6ac35371bca3aad998c703be5ba5b44f9d45d886671d4469941f2497bbcf898d930559',17,1,'DealQ','[]',0,'2021-04-29 18:31:20','2021-04-29 18:31:20','2022-04-30 00:01:20'),('0acc3a8c5a57863a90be6b21ce799285d43c91429148b040629736c736dcab4126b12b19230fcbe7',25,1,'DealQ','[]',0,'2021-04-30 14:44:16','2021-04-30 14:44:16','2022-04-30 20:14:16'),('120dfc50e521a6a0bf7d37299335ddccdbe0996e955cface0aae72ea6802a0b39018ba22323f95f6',35,1,'DealQ','[]',0,'2021-05-01 00:56:44','2021-05-01 00:56:44','2022-05-01 06:26:44'),('12b1a257aae68b454cbdf75b81583c7406ab4fcf54690a931ce3da2a94204f85cf41da046cc63cfb',34,1,'DealQ','[]',0,'2021-04-30 23:48:33','2021-04-30 23:48:33','2022-05-01 05:18:33'),('19892dcffd0d14e20438b5dccf30486ba507a5786591dbd335864447c06f7ef4e37257d24555feff',35,1,'DealQ','[]',0,'2021-04-30 22:29:41','2021-04-30 22:29:41','2022-05-01 03:59:41'),('1f7813ff82bef772e1e01da4a232416bdb31c62cf6344aff0cd6a992a7e0f6bf04e1ebe747bac977',17,1,'DealQ','[]',0,'2021-04-29 18:33:34','2021-04-29 18:33:34','2022-04-30 00:03:34'),('27d007519319f4c487d9ad135d3600a2ba49d24e544b07d8d46826e9abca2c6f57b1f2e0842055ec',35,1,'DealQ','[]',0,'2021-04-30 23:53:14','2021-04-30 23:53:14','2022-05-01 05:23:14'),('29d31f98365d0cbfb5d74632ced26e7f07d465d421b1a525ea72e109762f295ed13b0975e6ae213a',4,1,'DealQ','[]',0,'2021-04-09 02:12:03','2021-04-09 02:12:03','2022-04-09 07:42:03'),('2a4440dfc7755a097a1a655d1bc5e1d0ef1cb1625f36e302530491911b7438e2fa3599c12d1e50ee',35,1,'DealQ','[]',0,'2021-04-30 23:59:34','2021-04-30 23:59:34','2022-05-01 05:29:34'),('30790f854fbafcfaffb899c7ffe4435d3644399fd7553265943c0aabe7c22677fdff844f6ff5c62e',4,1,'DealQ','[]',0,'2021-04-03 23:00:48','2021-04-03 23:00:48','2022-04-04 04:30:48'),('34d095375f9fc2731d51ee2f487d9969f75f35d21098eeaa2efe11b8fae38bb901e5d1fd6a7eba56',4,1,'DealQ','[]',0,'2021-04-20 03:45:27','2021-04-20 03:45:27','2022-04-20 09:15:27'),('3e1ba67962897eaa9ab4d2b5cd11bcc3c14399bb8bd0f4acfd05153e224779b0bc95f9802a4678d0',35,1,'DealQ','[]',0,'2021-04-30 23:57:52','2021-04-30 23:57:52','2022-05-01 05:27:52'),('408523a181fc328b498ddf9157acd4d9f95361e0868595fa37e8d0baf9e03f9506ba7c53d436be39',35,1,'DealQ','[]',0,'2021-04-30 23:59:54','2021-04-30 23:59:54','2022-05-01 05:29:54'),('47c9315270901952d0f4007ae56c8931a9772843adbd4aa5a9ae882faf5e1f6a12783565d1a80786',17,1,'DealQ','[]',0,'2021-04-29 18:18:56','2021-04-29 18:18:56','2022-04-29 23:48:56'),('495d1a8b5396684933f094219a3fbf393e5e492e514bedcd3aa0e50665c6d0cd1998cbb3bccb09c3',35,1,'DealQ','[]',0,'2021-04-30 22:19:08','2021-04-30 22:19:08','2022-05-01 03:49:08'),('4f78048704961d006f3df13dd1da17afa7d6fb1823c484570ceef17419e5ca6bfa633360dbd1f29e',34,1,'DealQ','[]',0,'2021-04-30 22:17:41','2021-04-30 22:17:41','2022-05-01 03:47:41'),('529889f3a5e2d2126fca487be350c2a1416302bacae09cf405cf28fe085f01c088377d2865dddde2',35,1,'DealQ','[]',0,'2021-05-01 00:10:57','2021-05-01 00:10:57','2022-05-01 05:40:57'),('54f16563e1f8d7ed26b5e2894b4f58672343daf13b3704fbcc0b03475f47a0e9fc50c1fa13da53b8',25,1,'DealQ','[]',0,'2021-04-30 14:39:36','2021-04-30 14:39:36','2022-04-30 20:09:36'),('54fd83691c50a087be82f131e08f58c58d83217631dc8fbbbe658b7798de0d0544b74b8756b97221',35,1,'DealQ','[]',0,'2021-05-01 00:04:44','2021-05-01 00:04:44','2022-05-01 05:34:44'),('5a6c9037160120405455b5eb693d03b2227716a5c2ded82a5a4e63182114db2daacc3d491f355091',35,1,'DealQ','[]',0,'2021-05-01 00:12:12','2021-05-01 00:12:12','2022-05-01 05:42:12'),('5e6d632a4db793496d334f5872d8791d54303a95b3ac3da3c091629fa62a23804e2bc8cde8296ec9',25,1,'DealQ','[]',0,'2021-04-30 14:40:11','2021-04-30 14:40:11','2022-04-30 20:10:11'),('5e7074f7a37c5bc02d225884d90309559cbef37b9d86ddbfbfb89c13b7fb94444717d9832726811d',24,1,'DealQ','[]',0,'2021-04-29 07:41:43','2021-04-29 07:41:43','2022-04-29 13:11:43'),('6574825fb172643d42eb9e28a6ef213c0631b35b1228f53d27903a42dcd86ffc5bce35e07867e1d0',4,1,'DealQ','[]',0,'2021-04-03 22:59:46','2021-04-03 22:59:46','2022-04-04 04:29:46'),('666f5681ee6155532f0cbba56b03ea9e7639aec3b0c8176401b6c88975f7c7ff6f5ba8ad0e1caec5',35,1,'DealQ','[]',0,'2021-04-30 22:31:36','2021-04-30 22:31:36','2022-05-01 04:01:36'),('720f2d50675128dd2b73fc793ea04d0c2f5af9ad51b4237bfd665ed907500e7d7f28f8a7709ed0a8',17,1,'DealQ','[]',0,'2021-04-25 17:24:54','2021-04-25 17:24:54','2022-04-25 22:54:54'),('748ea1a9248398412d6c0b57a344d5aa067e3b974ba9d4ffa21d62efbfb1aff5beb55d53c97805f7',24,1,'DealQ','[]',0,'2021-04-28 19:41:46','2021-04-28 19:41:46','2022-04-29 01:11:46'),('8a476360fd0b6d6abeab6cf9ee4d67ce00cc650f3ad464cc40bd65f1864ac3290675e2ae47c886e7',4,1,'DealQ','[]',0,'2021-04-03 22:59:20','2021-04-03 22:59:20','2022-04-04 04:29:20'),('8a768782a1c8a634d95f173697e7c74c097e03ccaf81cf647633a2e8058037b1622047449f2f6f66',25,1,'DealQ','[]',0,'2021-04-30 14:46:02','2021-04-30 14:46:02','2022-04-30 20:16:02'),('9105683bf3da2a1c0b152f0acf682d51c9d60504a22cd49c2f296e43a6c36ea13649296a8067250e',4,1,'DealQ','[]',0,'2021-04-03 22:46:16','2021-04-03 22:46:16','2022-04-04 04:16:16'),('9529bf576afc5232ed0e385638d442f786e19e2e994e3801b4308aee0df1197c5fa25e00c6711c0d',17,1,'DealQ','[]',0,'2021-04-29 18:25:13','2021-04-29 18:25:13','2022-04-29 23:55:13'),('953d062bf36598060dd6e9b67fe936cfe944b164557f9872ae04b502522e66d777f593aa7da344b2',25,1,'DealQ','[]',0,'2021-04-30 14:43:45','2021-04-30 14:43:45','2022-04-30 20:13:45'),('9b456036b97393d61321452db96aa1e3623cd1fa70ca4e1eafb72df464e9b9e2b149454a0b2d6ed6',35,1,'DealQ','[]',0,'2021-05-01 00:11:23','2021-05-01 00:11:23','2022-05-01 05:41:23'),('9e7e1e9b0494059f468beaa2c4cb9d7092a3dddcddcbde825a553a08b457cbe517d1c1f2ee8fd414',25,1,'DealQ','[]',0,'2021-04-30 14:42:42','2021-04-30 14:42:42','2022-04-30 20:12:42'),('a44f48e1899cbb9cc7abd8f2eba50ab90ba19317b6dd278c590734b07351cc61be59a8f92d6d36a2',17,1,'DealQ','[]',0,'2021-04-30 14:35:15','2021-04-30 14:35:15','2022-04-30 20:05:15'),('a5999192a07bd0d8e954a936cb85e4cc83b9091fbedc15fea40f55095e93a788e88bb8252737a9d4',17,1,'DealQ','[]',0,'2021-04-29 18:33:11','2021-04-29 18:33:11','2022-04-30 00:03:11'),('a83f937964f84883c3b743f88fa96313f923d61214984021314e3404439ea31a338b9d16623cf887',17,1,'DealQ','[]',0,'2021-04-29 18:20:29','2021-04-29 18:20:29','2022-04-29 23:50:29'),('a99e238d47106d00e347c3210cda8269e5e9c15bef0d0cc134765ea8c10607c7634e206b02ff598a',35,1,'DealQ','[]',0,'2021-04-30 23:56:02','2021-04-30 23:56:02','2022-05-01 05:26:02'),('aaaee9df20f916d58c57b3e8b533550ffa80249b0ff39c6468ba9225ff3e19ff8ca2eb02e0e41ce1',17,1,'DealQ','[]',0,'2021-04-29 18:19:23','2021-04-29 18:19:23','2022-04-29 23:49:23'),('ad6244992b3eabdf056c7d644b9cc88e0ff1166ba6bce30435fca06f01a2eb1f800472a49c18feeb',4,1,'DealQ','[]',0,'2021-04-03 22:59:52','2021-04-03 22:59:52','2022-04-04 04:29:52'),('b10d47ee35ac440d6cef7997c05eb61cf8ff6cb91b92bee259da2638ed6b286fc541b16230e04f16',35,1,'DealQ','[]',0,'2021-05-01 00:07:43','2021-05-01 00:07:43','2022-05-01 05:37:43'),('b7880999fd7e3fdad6b1f9ffae70e0b1924aec368ac8feba251e2fb130271f0cdccc9c8e6b93e0e2',25,1,'DealQ','[]',0,'2021-04-30 14:38:46','2021-04-30 14:38:46','2022-04-30 20:08:46'),('c5d06113ede735c70b4d373837fce3d1b8032b168c5bdf4dd9eba906e94b556c5baf5e2609c5f26a',35,1,'DealQ','[]',0,'2021-04-30 23:56:43','2021-04-30 23:56:43','2022-05-01 05:26:43'),('cd5c054703ad206467d8a8aa202c986ff576a88a1d5f2e6c6068b3fc5de8050836c260bf11e78c6d',34,1,'DealQ','[]',0,'2021-04-30 22:10:01','2021-04-30 22:10:01','2022-05-01 03:40:01'),('d16059e017835bc652f2ca3514f9d07d3e0d3f092214972ae7fc1f26318d0631734ae89dbf3fdfd4',32,1,'DealQ','[]',0,'2021-04-30 15:29:01','2021-04-30 15:29:01','2022-04-30 20:59:01'),('d4c5c785df5fb45721a55776370ab607fa5ae5abb735bd327264efe44902e514ad5800d964ad4fea',17,1,'DealQ','[]',0,'2021-04-30 14:35:46','2021-04-30 14:35:46','2022-04-30 20:05:46'),('ed717901d272d000b6207c19ff8b24d37d9f200a7b6df59e7ba0a94d4dc82501fcd9a52da5128b16',17,1,'DealQ','[]',0,'2021-04-29 18:32:51','2021-04-29 18:32:51','2022-04-30 00:02:51'),('ee668758a7161428f2ee800314d4252bf472317adf77e544089fb1986016b328a6117c4fd3023e28',17,1,'DealQ','[]',0,'2021-04-29 18:35:35','2021-04-29 18:35:35','2022-04-30 00:05:35'),('ee7cfffc349c37e0d5e84cbafd3187f8a4d347f7ae5408189a9a2f8600844f7da688f4e6755aa12e',35,1,'DealQ','[]',0,'2021-04-30 23:45:51','2021-04-30 23:45:51','2022-05-01 05:15:51'),('f08eac175c601699f40bc8dd9336212c04a7c3876d9ef3d1d9592305a5be96a4ddd636f8798ff56a',35,1,'DealQ','[]',0,'2021-04-30 23:55:01','2021-04-30 23:55:01','2022-05-01 05:25:01'),('f50281eb9d90535c0dba3bbe10423c98d5679adf0022078da23e2d6bb1a0f372ad6314b9bb30b6de',4,1,'DealQ','[]',0,'2021-04-03 22:32:46','2021-04-03 22:32:46','2022-04-04 04:02:46'),('f6e24d0a3b60ff91c999ab2a4d4dcaf447d20df3cac92920ff0bc20fa3fce9a392e4f32d1f2bc711',35,1,'DealQ','[]',0,'2021-05-01 00:11:37','2021-05-01 00:11:37','2022-05-01 05:41:37'),('ff704e471f11046ed7c0bcec0c77ef1aad506bf55df7b2cc59a55983784e37e3a475e55e068a4e90',35,1,'DealQ','[]',0,'2021-04-30 23:58:22','2021-04-30 23:58:22','2022-05-01 05:28:22');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','1gVhxP0JAlCHLWNvqHS3p2T7fg6UBCJmK2iHIIMd',NULL,'http://localhost',1,0,0,'2021-02-12 18:49:33','2021-02-12 18:49:33'),(2,NULL,'Laravel Password Grant Client','0kT7hC0npEBG9eEYKNnzYvk6wSxQS4ZcR9CTHbVi','users','http://localhost',0,1,0,'2021-02-12 18:49:33','2021-02-12 18:49:33');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2021-02-12 18:49:33','2021-02-12 18:49:33');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Shirts','SHIRT502','Combo offer',0,300.00,280.00,1,'a269db40-9503-11eb-a6df-21f00ec70b13',1,'2021-04-03 23:37:20','2021-05-01 03:05:44','1',1),(2,'Shirts','SHIRT501','Combo offer',20,300.00,280.00,1,'b1bc6330-9503-11eb-9864-69157c99c9cd',1,'2021-04-03 23:37:46','2021-04-04 00:12:57','0',2);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qr_generated`
--

DROP TABLE IF EXISTS `qr_generated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qr_generated` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `qr_path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qr_generated`
--

LOCK TABLES `qr_generated` WRITE;
/*!40000 ALTER TABLE `qr_generated` DISABLE KEYS */;
INSERT INTO `qr_generated` VALUES (1,1,34,'IVOQNK','2021-05-01 02:42:53','2021-05-01 02:42:53',1,'http://localhost/dealq-api/public/assets/uploads/qr/4c879060-aa2f-11eb-92f3-23691a9cb47f/16198567731.png'),(2,1,34,'QGHSQA','2021-05-01 02:43:29','2021-05-01 02:43:29',1,'http://localhost/dealq-api/public/assets/uploads/qr/4c879060-aa2f-11eb-92f3-23691a9cb47f/16198568091.png'),(3,1,34,'NFLXVP','2021-05-01 02:43:32','2021-05-01 02:43:32',1,'http://localhost/dealq-api/public/assets/uploads/qr/4c879060-aa2f-11eb-92f3-23691a9cb47f/16198568121.png');
/*!40000 ALTER TABLE `qr_generated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller_categories`
--

DROP TABLE IF EXISTS `seller_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seller_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller_categories`
--

LOCK TABLES `seller_categories` WRITE;
/*!40000 ALTER TABLE `seller_categories` DISABLE KEYS */;
INSERT INTO `seller_categories` VALUES (1,'Clothing',1,NULL,NULL),(2,'Grocerry',1,NULL,NULL);
/*!40000 ALTER TABLE `seller_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellers`
--

LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
INSERT INTO `sellers` VALUES (1,35,1,'Test Brand','vadakara',673104,'340.4,300.6','TESTLICENCE100','GSTIN3049000','13YC2R','2021-05-01 00:56:19','2021-05-01 00:56:19','TESTCODE');
/*!40000 ALTER TABLE `sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription_plans`
--

DROP TABLE IF EXISTS `subscription_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription_plans` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `plan_price` decimal(8,2) NOT NULL DEFAULT '0.00',
  `plan_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `real_validity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_validity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slots` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription_plans`
--

LOCK TABLES `subscription_plans` WRITE;
/*!40000 ALTER TABLE `subscription_plans` DISABLE KEYS */;
INSERT INTO `subscription_plans` VALUES (1,'Basic Plan',1500.00,'basic1500','1 month free+ 3 months+ 5 adv slot',1,'3 month','1 month free','4 months',5,NULL,NULL),(2,'Basic Plan',2000.00,'basic2000','1 month free+ 3 months+ 10 adv slot',1,'3 months','1 month free','4 months',10,NULL,NULL),(3,'Advanced Plan',2500.00,'advance2500','1 month free+ 6 months+ 5 adv slot',1,'6 months','1 month free','7 months',5,NULL,NULL),(4,'Super Plan',3000.00,'super3000','1 month free+ 6 months+ 10 adv slot',1,'6 months','1 month free','7 months',10,NULL,NULL);
/*!40000 ALTER TABLE `subscription_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `seller_id` int(11) NOT NULL DEFAULT '0',
  `plan_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'paid,pending,failed',
  `subscription_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'active,inactive,cancelled,pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
INSERT INTO `subscriptions` VALUES (1,35,'super3000','2021-05-01 05:05:37','2021-12-01 05:05:37','paid','active','2021-04-30 23:35:37','2021-04-30 23:35:37');
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Dealq Admin','admin@dealq.com',NULL,'$2y$10$pcQm9Nqd3hmlG/lBzlWaZ.h6umk/afbsiZAwMnhNtcMZttNYLlwrS',NULL,'2021-04-03 21:50:34','2021-04-03 21:50:34','b808ec70-94f4-11eb-9a4c-3dbe154ee375','admin',NULL,0,NULL),(34,'Vys Ps','customer1@dealq.com',NULL,'$2y$10$ZDs0Sjs9.E8jrJkQ5zWm8eXGdegE3IoYxASJ494i6CHFGqPOJWn4C',NULL,'2021-04-30 22:08:55','2021-04-30 23:48:33','4c879060-aa2f-11eb-92f3-23691a9cb47f','customer','7907487010',1,''),(35,'Test Seller','seller@dealq.com',NULL,'$2y$10$op3ebUfW2gPNal1VJWK37eM.P1xnReROIYJEeA/EkB/g2vXv36blm',NULL,'2021-04-30 22:18:26','2021-05-01 01:00:07','ac05bd00-aa46-11eb-8554-adcc0e3a2a29','seller','7907487010',1,'1234');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-01 14:10:18
