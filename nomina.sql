-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: nomina
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `rfc` varchar(13) COLLATE utf8_spanish2_ci NOT NULL,
  `telephone` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Badak_2','Nacho Badak_6000','REPS890903975','921 304 36 70','2019-09-26 12:00:00','2019-10-16 22:47:14',NULL),(2,'Badak','Nacho Badak','REPS890903975','921 304 36 70','2019-10-01 22:51:59','2019-10-01 22:51:59',NULL),(3,'Empresa 3','-','-','-',NULL,NULL,NULL),(4,'Empresa 4','-','-','-',NULL,NULL,NULL),(5,'Empresa 5','-','-','-',NULL,NULL,NULL),(6,'Empresa X','Xx','X','x',NULL,NULL,NULL);
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company_users`
--

DROP TABLE IF EXISTS `company_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `company_user_user_id_fk_idx` (`user_id`),
  KEY `company_user_company_id_idx` (`company_id`),
  CONSTRAINT `company_user_company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `company_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_users`
--

LOCK TABLES `company_users` WRITE;
/*!40000 ALTER TABLE `company_users` DISABLE KEYS */;
INSERT INTO `company_users` VALUES (2,4,2,'2019-10-01 23:34:42','2019-10-01 23:56:52',NULL),(5,7,2,'2019-10-26 13:25:42','2019-10-26 13:25:42',NULL);
/*!40000 ALTER TABLE `company_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract_types`
--

DROP TABLE IF EXISTS `contract_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `contract_types_company_id_fk_idx` (`company_id`),
  CONSTRAINT `contract_types_company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_types`
--

LOCK TABLES `contract_types` WRITE;
/*!40000 ALTER TABLE `contract_types` DISABLE KEYS */;
INSERT INTO `contract_types` VALUES (11,'dsfvsvd',2,NULL,NULL,NULL),(12,'zscascasc',4,NULL,NULL,NULL);
/*!40000 ALTER TABLE `contract_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contribution_bases`
--

DROP TABLE IF EXISTS `contribution_bases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contribution_bases` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `contribution_bases_company_id_fk_idx` (`company_id`),
  CONSTRAINT `contribution_bases_company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contribution_bases`
--

LOCK TABLES `contribution_bases` WRITE;
/*!40000 ALTER TABLE `contribution_bases` DISABLE KEYS */;
INSERT INTO `contribution_bases` VALUES (5,'Base Badak',2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `contribution_bases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `departments_company_id_fk_idx` (`company_id`),
  CONSTRAINT `departments_company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Departamento 1 old',1,'2019-10-07 23:11:43','2019-10-07 23:14:39',NULL),(2,'Departamento 2',1,'2019-10-07 23:12:04','2019-10-07 23:12:04',NULL),(3,'departamento',1,NULL,NULL,NULL),(4,'departamento nueevo',2,NULL,'2019-10-19 23:02:27','2019-10-19 23:02:27'),(5,'Departamento 1000',1,NULL,'2019-11-09 13:07:34',NULL),(6,'Departamento Badak',2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discount_types`
--

DROP TABLE IF EXISTS `discount_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discount_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `discount_types_company_id_fk_idx` (`company_id`),
  CONSTRAINT `discount_types_company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discount_types`
--

LOCK TABLES `discount_types` WRITE;
/*!40000 ALTER TABLE `discount_types` DISABLE KEYS */;
INSERT INTO `discount_types` VALUES (6,'Tipo de Decuento Badak',2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `discount_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documentations`
--

DROP TABLE IF EXISTS `documentations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `documentations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documentations`
--

LOCK TABLES `documentations` WRITE;
/*!40000 ALTER TABLE `documentations` DISABLE KEYS */;
INSERT INTO `documentations` VALUES (1,'Acta de nacimiento\n','2019-09-27 12:00:00',NULL,NULL),(2,'Comprobante de domicilio\n','2019-09-27 12:00:00',NULL,NULL),(3,'INE','2019-09-27 12:00:00',NULL,NULL),(4,'CURP','2019-09-27 12:00:00',NULL,NULL),(5,'RFC','2019-09-27 12:00:00',NULL,NULL);
/*!40000 ALTER TABLE `documentations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_types`
--

DROP TABLE IF EXISTS `employee_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `employee_types_company_id_idx` (`company_id`),
  CONSTRAINT `employee_types_company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_types`
--

LOCK TABLES `employee_types` WRITE;
/*!40000 ALTER TABLE `employee_types` DISABLE KEYS */;
INSERT INTO `employee_types` VALUES (4,'Tipo de Empleado',2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `employee_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Administrador','administration','2019-09-26 12:00:00','2019-09-26 12:00:00',NULL),(2,'Patrón','patron','2019-09-26 12:00:00','2019-09-26 12:00:00',NULL),(3,'Ejecutivo','executive','2019-09-26 12:00:00','2019-09-26 12:00:00',NULL),(4,'root','root','2019-09-26 12:00:00','2019-09-26 12:00:00',NULL);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `department_id` int(10) unsigned NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `jobs_department_id_fk_idx` (`department_id`),
  KEY `jobs_company_id_fk_idx` (`company_id`),
  CONSTRAINT `jobs_company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `jobs_department_id_fk` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (9,'sdcsdcvscsdc',5,2,NULL,'2019-11-09 13:18:39','2019-11-09 13:18:39'),(10,'sdc svs vsv',5,2,NULL,'2019-11-09 13:18:42','2019-11-09 13:18:42'),(11,'Puesto Badak 1',6,2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(6,'2016_06_01_000004_create_oauth_clients_table',1),(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
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
INSERT INTO `oauth_access_tokens` VALUES ('0210c0a25c0859d7c648ede6b28e5ec61614f9e0dcbd348146415c16685070edf112b3508bf0af4c',1,1,'Personal Access Token','[]',0,'2019-10-17 02:27:47','2019-10-17 02:27:47','2020-10-16 21:27:47'),('04c0cc8ebcf90403db3c698c1553b003c359bb7b50538a7c0d257d047dac92ba67ffb06c49acd188',1,1,'Personal Access Token','[]',0,'2019-10-19 22:10:58','2019-10-19 22:10:58','2020-10-19 17:10:58'),('080969b742937e4480c9eaf9bc12e0aefd0c899f73764987cb6fa76d91ece50e7ec65768c4c9693a',1,3,'Personal Access Token','[]',0,'2019-11-06 04:21:47','2019-11-06 04:21:47','2020-11-05 22:21:47'),('08359bc0ef49f718689775b068a258a6ed979321abf0f4bb27f8dc7564d5e7d414e412fd72203e42',1,3,'Personal Access Token','[]',0,'2019-11-09 19:59:18','2019-11-09 19:59:18','2020-11-09 13:59:18'),('084bf432c0c4c7562ecb006e44a316d0f47de10f007c192f9c449277a2fac63c075e1ebcd5ba678f',1,1,'Personal Access Token','[]',0,'2019-10-01 04:15:33','2019-10-01 04:15:33','2020-09-30 23:15:33'),('092346046f299046c392ca50749c5dd8fd8c76143c0af50c81a8c55c75fc74f224b322bbf993cdcc',1,1,'Personal Access Token','[]',0,'2019-10-19 22:09:28','2019-10-19 22:09:28','2020-10-19 17:09:28'),('094aa1a3fe52ae1cdd1bd610d6ceaeb2351aeea810ebe6b15120d8100167b495268f33ed45c6f106',4,3,'Personal Access Token','[]',0,'2019-11-03 13:19:59','2019-11-03 13:19:59','2020-11-03 07:19:59'),('124cb3abf3295d360393101758fbacf8fe084de91e1744e459e54669e2c481ab380fda08d6ac6c49',1,3,'Personal Access Token','[]',0,'2019-11-09 20:02:10','2019-11-09 20:02:10','2020-11-09 14:02:10'),('18d0a186f30aac118e3575217fcacb63427c3f5520dd2abb3e1726297fd3f3d517f89a6dfee708a0',1,1,'Personal Access Token','[]',0,'2019-10-19 21:58:03','2019-10-19 21:58:03','2020-10-19 16:58:03'),('1fd92924e1fe26865be2024f9fba4fd84445f6ebede1ade8171317edcde59542506b0dc31f27c634',4,1,'Personal Access Token','[]',0,'2019-10-26 04:45:22','2019-10-26 04:45:22','2020-10-25 23:45:22'),('25aa1542d88972a20dd9fe57c71c7dccf613e2e740625dad857b73367e72071fdccb94d2cae74ebb',1,3,'Personal Access Token','[]',0,'2019-11-09 18:27:54','2019-11-09 18:27:54','2020-11-09 12:27:54'),('27f5565769aef705ba747d12c152de0173fd57d68524fa9f058c1fd6585c52e3c87b10707a8b94c7',1,3,'Personal Access Token','[]',0,'2019-11-07 05:13:21','2019-11-07 05:13:21','2020-11-06 23:13:21'),('2aba76c66ea711a99e2eeaa2f80fd3cab3e9750aaa50926d618a592bf196802338511533e886d6c8',1,3,'Personal Access Token','[]',0,'2019-11-07 04:43:38','2019-11-07 04:43:38','2020-11-06 22:43:38'),('2c52340407246d6b4d383e91907d91e00a07252a8b79215d6b1ab8ff19534b4c7f62a71382181f9e',1,1,'Personal Access Token','[]',0,'2019-10-19 22:05:39','2019-10-19 22:05:39','2020-10-19 17:05:39'),('363e84527072ca6351d0755fdf64bfcb483bf68666b174ac2f3ca3c3b61fa53012415721b286a6cc',1,1,'Personal Access Token','[]',0,'2019-10-12 21:33:14','2019-10-12 21:33:14','2020-10-12 16:33:14'),('3afda28fced121feaae846405fd79d9984f59734394d77cdd1c2267288fedf7ca37fc8d26c7b665e',4,1,'Personal Access Token','[]',0,'2019-10-26 04:38:15','2019-10-26 04:38:15','2020-10-25 23:38:15'),('41246afbde43a715a57d958ab3fa584dca325ff26c52584ef71650abc937ca81714712bd18c5bc20',1,1,'Personal Access Token','[]',0,'2019-10-26 19:11:02','2019-10-26 19:11:02','2020-10-26 14:11:02'),('444541f2c2dd5e4d83ad248780ecdbf0679743117d76e607551968b85126ca164c85b48794297286',1,1,'Personal Access Token','[]',0,'2019-10-19 21:58:29','2019-10-19 21:58:29','2020-10-19 16:58:29'),('4b48290b1ba4fe14a91b3c79244ee55df679b422c702d223dd628e012973bed2d712f0e340cfa6ba',1,1,'Personal Access Token','[]',0,'2019-10-19 22:09:04','2019-10-19 22:09:04','2020-10-19 17:09:04'),('4db550af50df6237a354952467a861501af05f746e7613b38f78ca6e69f5bafd7ef1ee00c8afff33',1,1,'Personal Access Token','[]',0,'2019-10-31 05:04:46','2019-10-31 05:04:46','2020-10-30 23:04:46'),('4e2d1ecbcc3c0a2d1c126645352927a4627a834dbeb5f87783fb489ee2d6d02bd900175af39b41c1',1,1,'Personal Access Token','[]',0,'2019-10-29 21:02:12','2019-10-29 21:02:12','2020-10-29 15:02:12'),('4e83ac074aefbd88a527238448f56ab5d742424a0ce13cb39c1348b45cb3d239190c11feb7a15815',1,1,'Personal Access Token','[]',0,'2019-10-31 03:37:49','2019-10-31 03:37:49','2020-10-30 21:37:49'),('4f4c06ded6db69af33ae1132961534ac4ce27f8b37db7f7e7c2515e9274c32719c0e8a752fe7259b',1,3,'Personal Access Token','[]',0,'2019-11-09 16:06:22','2019-11-09 16:06:22','2020-11-09 10:06:22'),('50c24c2748c51f5c4cb0d69df7b9bad939b4ca4145020b4bdd9b2bda5e5ebf68dd3568b1ae6a5586',1,1,'Personal Access Token','[]',0,'2019-10-16 04:23:11','2019-10-16 04:23:11','2020-10-15 23:23:11'),('545092440429b682cc5875eff548a85b6e4a081f29fca9009c6bfc0f084e30f4f1a75b9111a8d60c',1,1,'Personal Access Token','[]',0,'2019-10-19 22:10:14','2019-10-19 22:10:14','2020-10-19 17:10:14'),('548c0d024e75eb8991fb5419a35bca6e3833ce9d52030198ac2eff75620fb600feb28cfac249fc7d',1,1,'Personal Access Token','[]',0,'2019-11-01 05:24:58','2019-11-01 05:24:58','2020-10-31 23:24:58'),('556d93ca1935186ba3cbfb3ad53654dbf75da33ed7b6d7a1db1d52280a8b5bba92171ffcfc122fa4',1,1,'Personal Access Token','[]',0,'2019-10-19 23:25:51','2019-10-19 23:25:51','2020-10-19 18:25:51'),('587a7021f4a1799080be1afd7a2d350d60ef8c0231a6c6c455f0a04760a363e346500a6bd1eb1984',1,1,'Personal Access Token','[]',0,'2019-10-19 22:06:13','2019-10-19 22:06:13','2020-10-19 17:06:13'),('5cad29189559635f140dcddedf64fdb42b3f075bfc62fde4c7a8abc5346d42f596f3a68536f32de5',1,1,'Personal Access Token','[]',0,'2019-10-19 20:25:45','2019-10-19 20:25:45','2020-10-19 15:25:45'),('601ed4befeb359d462bd4c75b3f2efcb17d3e8affb1c9cee0e5c0a062b8fda118a679402d2c316c5',1,3,'Personal Access Token','[]',0,'2019-11-06 05:00:09','2019-11-06 05:00:09','2020-11-05 23:00:09'),('63a673489c0d98bf698469914be262cc76ef2b860ed73ef9f86a62b98a02d45db6fda2a47a5ed99b',4,1,'Personal Access Token','[]',0,'2019-10-26 13:05:10','2019-10-26 13:05:10','2020-10-26 08:05:10'),('645f88d19f7b75a64daf7843729e3dcb05110e4a8fb0a04a098b63798d8b6be2fe7c8540e3c1435d',4,3,'Personal Access Token','[]',0,'2019-11-06 04:21:32','2019-11-06 04:21:32','2020-11-05 22:21:32'),('66f2adb48e0b8a4fba23b852da70f6483aed96698fd278b4f27095a6e1722beb6790bc054ad9a6fc',1,3,'Personal Access Token','[]',0,'2019-11-06 04:46:28','2019-11-06 04:46:28','2020-11-05 22:46:28'),('679859e4d8dd0efc115bab3916d416947beda1586321d4266e46826de0ea8229b8e51528a376bb6d',1,1,'Personal Access Token','[]',0,'2019-10-29 20:37:52','2019-10-29 20:37:52','2020-10-29 14:37:52'),('763fc3c9b8233fce36c69443029ebadc977f51fc26133f4df34d52a00e2ff68f2fa0ac3a86533573',1,3,'Personal Access Token','[]',0,'2019-11-18 14:24:58','2019-11-18 14:24:58','2020-11-18 08:24:58'),('866af9b515f3fce3c373b4b14f47feff59c74b9afd6c600a004c7ec2b47b8bf3c5dad56196ec6011',1,1,'Personal Access Token','[]',0,'2019-10-20 15:28:10','2019-10-20 15:28:10','2020-10-20 10:28:10'),('8e736948ffe348235190d605221d38d0266a2ab5bb0ed78b44a4d2da028e976278ba98e607771b4a',1,1,'Personal Access Token','[]',0,'2019-10-19 22:10:26','2019-10-19 22:10:26','2020-10-19 17:10:26'),('9094b5dcbedaeb6a9d9ffdfe8aa57d2671d69b3041403ba1bdee28dbdfe7ada3fd5ace2a9dc228f9',1,1,'Personal Access Token','[]',0,'2019-10-19 21:53:42','2019-10-19 21:53:42','2020-10-19 16:53:42'),('966a28159485b8e11672e19ab45e201cb58974f66ccaa4c1f303f2d2c190452dbfd80e9e9bc806ed',1,1,'Personal Access Token','[]',0,'2019-10-19 21:53:14','2019-10-19 21:53:14','2020-10-19 16:53:14'),('990b1e901660e77d972a1c00b05bb7fd4ace86cc0e76ffa68e2d1cc0a913b28de14a06bcab2f5911',1,1,'Personal Access Token','[]',0,'2019-10-03 02:24:03','2019-10-03 02:24:03','2020-10-02 21:24:03'),('9be0058a0c2b368d8d59bd1eeae138708b8c528be3e6ab323685c964f1fda41bec0dbc2b77a2a029',1,1,'Personal Access Token','[]',0,'2019-10-19 21:52:29','2019-10-19 21:52:29','2020-10-19 16:52:29'),('9edcfd300c2d959efce978531768cbaef546218972b9ace6a2f1135c70129c99d92abb2b334fe95c',4,3,'Personal Access Token','[]',0,'2019-11-06 05:02:31','2019-11-06 05:02:31','2020-11-05 23:02:31'),('a35968ff0043a9682fccd8f1a5321ea36a73622187d1a70d54e9b0e57748523c1c50a27cd36e595e',1,1,'Personal Access Token','[]',0,'2019-10-26 18:26:16','2019-10-26 18:26:16','2020-10-26 13:26:16'),('a4dfb0e12b156fa92a7be7becbdf9fbd4349c031cbe57835ecea2c065e3195c35ad08eb87f57fe3f',1,1,'Personal Access Token','[]',0,'2019-10-20 18:58:05','2019-10-20 18:58:05','2020-10-20 13:58:05'),('a8454c104eecc203e00b47aaa24f60432ae5785e950b07b1b3f76f055ee65994f478ee1c763fd884',1,1,'Personal Access Token','[]',0,'2019-10-20 04:19:21','2019-10-20 04:19:21','2020-10-19 23:19:21'),('b0ba372056e71bffe9a4648386c5fa00e1a22c6b9cdff38eff0a3286d9339cb0e0e53aad2cd3e2bd',1,1,'Personal Access Token','[]',0,'2019-10-19 23:23:41','2019-10-19 23:23:41','2020-10-19 18:23:41'),('b3e6fe5764723a0808f63f636f31d90763bfcc33f954c40dfd8100a1afc8ad78d1f645e07e85f1fe',4,3,'Personal Access Token','[]',0,'2019-11-06 04:23:56','2019-11-06 04:23:56','2020-11-05 22:23:56'),('b4c2042d046776a2413023db8de70090c8c33b5b27687132d6dd90eeae747f04d38c4643b77c1596',1,3,'Personal Access Token','[]',0,'2019-11-06 04:19:20','2019-11-06 04:19:20','2020-11-05 22:19:20'),('c272d91b9821635826c85da13206b0235ea7c2f734360e233a65d3574631e203edfc403cef9551c1',1,1,'Personal Access Token','[]',0,'2019-10-19 21:56:41','2019-10-19 21:56:41','2020-10-19 16:56:41'),('c6d559b48eacc24d7b2c08a5f2785fd0eec7e1c08f22e821480c9815ccb9aa09d65dd275e1567516',4,1,'Personal Access Token','[]',0,'2019-10-25 05:23:23','2019-10-25 05:23:23','2020-10-25 00:23:23'),('c867b4b6d0a74b36706bdf8760782c6b1814a1503dd2198d9b9460c6eea79750d5d09b4a43b08f6b',1,3,'Personal Access Token','[]',0,'2019-11-02 17:40:30','2019-11-02 17:40:30','2020-11-02 11:40:30'),('c8d4745d89b1d9d21c9b7d0f69ffb87e02359deb7d6898384f51e2665407497c780d17c3209bc3cb',1,3,'Personal Access Token','[]',0,'2019-11-12 02:23:03','2019-11-12 02:23:03','2020-11-11 20:23:03'),('ce7b79990ced2ea13f976b816b3ca8cacc9d36f3c4173d167c58dad93bdcbad1d2f5fad46b8c0f96',1,1,'Personal Access Token','[]',0,'2019-10-19 22:08:29','2019-10-19 22:08:29','2020-10-19 17:08:29'),('ce832d7abeb5128a68f86ad581af1a30ec02d6e6d4c3b71feaa27d6612805c94470c8ccac2f97849',1,3,'Personal Access Token','[]',0,'2019-11-03 13:06:31','2019-11-03 13:06:31','2020-11-03 07:06:31'),('d870ee0e8b3a7827d291ed876f74d6fdf6a92120aecb02497c1e2a0d21fe601190261fec8bee6533',1,3,'Personal Access Token','[]',0,'2019-11-06 04:59:33','2019-11-06 04:59:33','2020-11-05 22:59:33'),('dea4841e34b24ad6156b616ef838c9b91ea55afda7193b9b5463390369c15d2945e76e7952863b93',1,1,'Personal Access Token','[]',0,'2019-10-16 02:32:07','2019-10-16 02:32:07','2020-10-15 21:32:07'),('e62fc9287cf8719684e5b2a24ad6f9cbf83c29ef1d2229605c7cbd88bce739bec2cac6371d388d15',1,1,'Personal Access Token','[]',0,'2019-10-26 04:26:42','2019-10-26 04:26:42','2020-10-25 23:26:42'),('e68d0d317086d8216a60afb130a8cd862d60ac767a949e7a88acacbde4fa5e8c0e4896ca519b442f',1,1,'Personal Access Token','[]',0,'2019-10-25 04:26:27','2019-10-25 04:26:27','2020-10-24 23:26:27'),('e770560aefdd3055818fd41ba2e255f7faded8c69ede88f4a450553ece237ed60faaa84fa7220817',1,1,'Personal Access Token','[]',0,'2019-10-26 17:31:36','2019-10-26 17:31:36','2020-10-26 12:31:36'),('ec5179ede1c7de0759321dda2de5557639446b410c7141f2756f84e7b517fabdc5260585bc4aa936',1,1,'Personal Access Token','[]',0,'2019-10-19 01:17:59','2019-10-19 01:17:59','2020-10-18 20:17:59'),('f219631518e88aab1c44e49e3566ab24b66aee23a59b158d95df22ee3842f70cdc6028388dfac5a8',1,1,'Personal Access Token','[]',0,'2019-10-19 21:58:49','2019-10-19 21:58:49','2020-10-19 16:58:49'),('f33743d7526a27c786fee41512be5738191f8375fd0169f0729cbb1e3f4d8b5cc3dcba97008de26d',1,3,'Personal Access Token','[]',0,'2019-11-06 04:14:06','2019-11-06 04:14:06','2020-11-05 22:14:06'),('f448e723a9ef68ea78a1f1f80da440ac26abb661ae987e1545ee4018f8ec8c6f13490edd0bbb1bb6',4,3,'Personal Access Token','[]',0,'2019-11-09 16:17:52','2019-11-09 16:17:52','2020-11-09 10:17:52'),('f6ac3d2f7caaece8f219916fb6b97d6b846730ecf2ae0866f3817b0243f339fc718e9a52c52c4edf',1,3,'Personal Access Token','[]',0,'2019-11-09 01:06:05','2019-11-09 01:06:05','2020-11-08 19:06:05'),('fbcc74168c9050207694f4e244613afad92b01914cde0f2250fa26f7752f314ba635e1b79c58ad1f',1,3,'Personal Access Token','[]',0,'2019-11-06 04:28:07','2019-11-06 04:28:07','2020-11-05 22:28:07');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','2ekSXJVoXhyjROl4auzQAXjXn9u21q2UJZzMx7HR','http://localhost',1,0,0,'2019-09-29 08:24:19','2019-09-29 08:24:19'),(2,NULL,'Laravel Password Grant Client','RslPYXiBvZFosvxJY8Zs7oSQp3Bd73B0aKe6rOrb','http://localhost',0,1,0,'2019-09-29 08:24:19','2019-09-29 08:24:19'),(3,NULL,'Laravel Personal Access Client','RAPfMdEiuhQ95ELsYuae7Pbaj72EVZV3f535A6Kd','http://localhost',1,0,0,'2019-11-02 23:38:30','2019-11-02 23:38:30'),(4,NULL,'Laravel Password Grant Client','2uA4yV67KpE2fLCcfCa9xgW5h64fYKHjbRp8ksIi','http://localhost',0,1,0,'2019-11-02 23:38:30','2019-11-02 23:38:30');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2019-09-29 08:24:19','2019-09-29 08:24:19'),(2,3,'2019-11-02 23:38:30','2019-11-02 23:38:30');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_methods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `payment_methods_company_id_fk_idx` (`company_id`),
  CONSTRAINT `payment_methods_company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
INSERT INTO `payment_methods` VALUES (18,'Metod de Pago Badak',2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `period_types`
--

DROP TABLE IF EXISTS `period_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `period_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `period_types_company_id_fk_idx` (`company_id`),
  CONSTRAINT `period_types_company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `period_types`
--

LOCK TABLES `period_types` WRITE;
/*!40000 ALTER TABLE `period_types` DISABLE KEYS */;
INSERT INTO `period_types` VALUES (2,'Badak Periodo',2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `period_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sexs`
--

DROP TABLE IF EXISTS `sexs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sexs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sexs`
--

LOCK TABLES `sexs` WRITE;
/*!40000 ALTER TABLE `sexs` DISABLE KEYS */;
INSERT INTO `sexs` VALUES (1,'Hombre','2019-11-09 12:00:00','2019-11-09 12:00:00',NULL),(2,'Mujer','2019-11-09 12:00:00','2019-11-09 12:00:00',NULL);
/*!40000 ALTER TABLE `sexs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_company_id` int(10) unsigned DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_group_id_fk_idx` (`group_id`),
  KEY `uers_company_id_fk_idx` (`default_company_id`),
  CONSTRAINT `uers_company_id_fk` FOREIGN KEY (`default_company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `users_group_id_fk` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Samuel Regino Placido','samuel.regino@next-io.com',NULL,'$2y$10$lhfiQ4PxkL50BCPU4eYSS.JjkDom9MyeDDJcx1OtkZwnZFPzuc5aO',NULL,4,'avatar.png',1,1,'2019-10-01 03:22:22','2019-11-06 04:59:55',NULL),(4,'Esau Munive','esau.munive@next-io.com',NULL,'$2y$10$utodZo6VSY3VPpGyCQ7tcOIworcs/IHm9vPeWMOmORPNygciUnMX.',NULL,1,'avatar.png',2,1,'2019-10-02 04:34:42','2019-10-02 04:56:52',NULL),(7,'SAMUEL PLACIDO','samuel43_7@hotmail.com',NULL,'$2y$10$ErpgmYLCqVC6.Ei0mkg5zub21KFdtNKVU6826qWH..4SPlGgaUYHW',NULL,1,'avatar.png',NULL,1,'2019-10-26 18:25:42','2019-10-26 18:25:42',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_documentations`
--

DROP TABLE IF EXISTS `work_documentations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_documentations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `work_id` int(11) unsigned NOT NULL,
  `document_id` int(11) unsigned NOT NULL,
  `other_name` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `worker_documentarion_worker_id_fk_idx` (`work_id`),
  KEY `worker_documentation_documentation_id_fk_idx` (`document_id`),
  CONSTRAINT `worker_documentarion_worker_id_fk` FOREIGN KEY (`work_id`) REFERENCES `works` (`id`),
  CONSTRAINT `worker_documentation_documentation_id_fk` FOREIGN KEY (`document_id`) REFERENCES `documentations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_documentations`
--

LOCK TABLES `work_documentations` WRITE;
/*!40000 ALTER TABLE `work_documentations` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_documentations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_shifts`
--

DROP TABLE IF EXISTS `work_shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_shifts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `work_shifts_company_id_fk_idx` (`company_id`),
  CONSTRAINT `work_shifts_company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_shifts`
--

LOCK TABLES `work_shifts` WRITE;
/*!40000 ALTER TABLE `work_shifts` DISABLE KEYS */;
INSERT INTO `work_shifts` VALUES (5,'Turno Trabajo Badak',2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `work_shifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_states`
--

DROP TABLE IF EXISTS `work_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_states` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_states`
--

LOCK TABLES `work_states` WRITE;
/*!40000 ALTER TABLE `work_states` DISABLE KEYS */;
INSERT INTO `work_states` VALUES (1,'En proceso de alta','2019-09-27 12:00:00',NULL,NULL),(2,'Proceso de reingreso','2019-09-27 12:00:00',NULL,NULL),(3,'Activo','2019-09-27 12:00:00',NULL,NULL),(4,'Proceso de baja','2019-09-27 12:00:00',NULL,NULL),(5,'Dado de baja','2019-09-27 12:00:00',NULL,NULL);
/*!40000 ALTER TABLE `work_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works`
--

DROP TABLE IF EXISTS `works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `works` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `work_status_id` int(11) unsigned NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `code` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `discharge_date` date NOT NULL,
  `name` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `first_name` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `contract_type_id` int(10) unsigned NOT NULL,
  `period_type_id` int(10) unsigned NOT NULL,
  `real_daily_salary` decimal(20,2) NOT NULL,
  `imss_daily_salary` decimal(20,2) NOT NULL,
  `contribution_base_salary` decimal(20,2) NOT NULL,
  `contribution_base_id` int(11) unsigned NOT NULL,
  `department_id` int(10) unsigned DEFAULT NULL,
  `job_id` int(10) unsigned DEFAULT NULL,
  `employee_type_id` int(10) unsigned NOT NULL,
  `payment_method_id` int(10) unsigned NOT NULL,
  `work_shift_id` int(10) unsigned NOT NULL,
  `number_afore` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `social_security_number` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `rfc` varchar(13) COLLATE utf8_spanish2_ci NOT NULL,
  `curp` varchar(22) COLLATE utf8_spanish2_ci NOT NULL,
  `sex_id` int(11) unsigned NOT NULL,
  `birth_city` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `birth_date` date NOT NULL,
  `umf` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `fathers_name` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `mothers_name` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `current_address` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `current_population` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `current_state` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `cp` varchar(10) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `telephone` varchar(20) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `back_electronic_payment` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `acount_number` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `branch_office` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `fonacot_number` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `key_account` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `infonavit_credit_number` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `discount_type_id` int(10) unsigned DEFAULT NULL,
  `monthly_factor` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `workers_contact_type_id_fk_idx` (`contract_type_id`),
  KEY `workers_period_type_id_fk_idx` (`period_type_id`),
  KEY `workers_contribution_base_id_fk_idx` (`contribution_base_id`),
  KEY `workers_department_id_fk_idx` (`department_id`),
  KEY `workers_job_id_fk_idx` (`job_id`),
  KEY `workers_employee_type_id_fk_idx` (`employee_type_id`),
  KEY `workers_payment_id_fk_idx` (`payment_method_id`),
  KEY `workers_work_shift_id_fk_idx` (`work_shift_id`),
  KEY `workers_sex_id_fk_idx` (`sex_id`),
  KEY `workers_discount_type_id_fk_idx` (`discount_type_id`),
  KEY `works_company_id_fk_idx` (`company_id`),
  KEY `works_work_status_id_fk_idx` (`work_status_id`),
  CONSTRAINT `workers_contact_type_id_fk` FOREIGN KEY (`contract_type_id`) REFERENCES `contract_types` (`id`),
  CONSTRAINT `workers_contribution_base_id_fk` FOREIGN KEY (`contribution_base_id`) REFERENCES `contribution_bases` (`id`),
  CONSTRAINT `workers_department_id_fk` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  CONSTRAINT `workers_discount_type_id_fk` FOREIGN KEY (`discount_type_id`) REFERENCES `discount_types` (`id`),
  CONSTRAINT `workers_employee_type_id_fk` FOREIGN KEY (`employee_type_id`) REFERENCES `employee_types` (`id`),
  CONSTRAINT `workers_job_id_fk` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`),
  CONSTRAINT `workers_payment_id_fk` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`),
  CONSTRAINT `workers_period_type_id_fk` FOREIGN KEY (`period_type_id`) REFERENCES `period_types` (`id`),
  CONSTRAINT `workers_sex_id_fk` FOREIGN KEY (`sex_id`) REFERENCES `sexs` (`id`),
  CONSTRAINT `workers_work_shift_id_fk` FOREIGN KEY (`work_shift_id`) REFERENCES `work_shifts` (`id`),
  CONSTRAINT `works_company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `works_work_status_id_fk` FOREIGN KEY (`work_status_id`) REFERENCES `work_states` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works`
--

LOCK TABLES `works` WRITE;
/*!40000 ALTER TABLE `works` DISABLE KEYS */;
INSERT INTO `works` VALUES (7,3,2,'460338','2019-11-14','SAMUEL','SAMUEL','PLACIDO',11,2,34.34,123.44,654.33,5,6,11,4,18,5,'1234654325','09876543','REPS890903MVX','REPS890903HVZGLM06',1,'COATZACOALCOS','2019-10-29',NULL,NULL,NULL,'REPUBLICA DEL SALVADOR, TIERRA Y LIBERTAD',NULL,'VERACRUZ','96580',NULL,NULL,NULL,NULL,NULL,'samuel43_7@hotmail.com',NULL,NULL,NULL,6,'745676543','2019-11-11 21:29:09','2019-11-12 22:51:38',NULL);
/*!40000 ALTER TABLE `works` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-19  7:10:18
