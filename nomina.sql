-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: nomina
-- ------------------------------------------------------
-- Server version	5.7.26

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Badak_2','Nacho Badak_6000','REPS890903975','921 304 36 70','2019-09-26 12:00:00','2019-10-16 22:47:14',NULL),(2,'Badak','Nacho Badak','REPS890903975','921 304 36 70','2019-10-01 22:51:59','2019-10-01 22:51:59',NULL);
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
  `user_id` int(10) unsigned NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `company_user_company_id_idx` (`company_id`),
  KEY `company_users_user_id_fk_idx` (`user_id`),
  CONSTRAINT `company_user_company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `company_users_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company_users`
--

LOCK TABLES `company_users` WRITE;
/*!40000 ALTER TABLE `company_users` DISABLE KEYS */;
INSERT INTO `company_users` VALUES (6,10,1,'2019-11-05 15:08:49','2019-11-05 15:08:49',NULL),(7,11,2,'2019-11-05 16:39:07','2019-11-05 16:39:07',NULL),(8,12,1,'2019-11-05 16:39:46','2019-11-05 16:39:46',NULL);
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
INSERT INTO `contract_types` VALUES (11,'Tipo de Contrato Badak',2,NULL,'2019-11-11 09:32:07',NULL),(12,'01',2,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contribution_bases`
--

LOCK TABLES `contribution_bases` WRITE;
/*!40000 ALTER TABLE `contribution_bases` DISABLE KEYS */;
INSERT INTO `contribution_bases` VALUES (5,'F',2,NULL,NULL,NULL),(6,'M',2,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Departamento 1 old',1,'2019-10-07 23:11:43','2019-10-07 23:14:39',NULL),(2,'Departamento 2',1,'2019-10-07 23:12:04','2019-10-07 23:12:04',NULL),(3,'departamento',1,'2019-10-07 23:12:04',NULL,NULL),(4,'DIRECCION',2,'2019-10-07 23:12:04','2019-10-19 23:02:27',NULL),(5,'VENTAS',2,'2019-10-07 23:12:04',NULL,NULL),(6,'CONTABILIDAD',2,'2019-10-07 23:12:04',NULL,NULL);
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
INSERT INTO `discount_types` VALUES (6,'Tipos de descuento Badak',2,NULL,NULL,NULL);
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
INSERT INTO `employee_types` VALUES (4,'Tipo de empleado Badak',2,NULL,NULL,NULL);
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
  `name` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Administrador','administration','2019-09-26 12:00:00','2019-09-26 12:00:00',NULL),(2,'Patrón','patron','2019-09-26 12:00:00','2019-09-26 12:00:00',NULL),(3,'Ejecutivo','executive','2019-09-26 12:00:00','2019-09-26 12:00:00',NULL),(4,'root','root','2019-09-26 12:00:00','2019-09-26 12:00:00',NULL),(5,'Empleado','employee','2019-09-26 12:00:00','2019-09-26 12:00:00',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (5,'DIRECTOR GENERAL',4,2,NULL,NULL,NULL),(6,'GERENTE DE VENTAS',5,2,NULL,NULL,NULL),(7,'CONTADOR GENERAL',6,2,NULL,NULL,NULL),(8,'DIRECTOR COMERCIAL',5,2,NULL,NULL,NULL),(9,'DIRECTOR DE FINANZAS',6,2,NULL,NULL,NULL);
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
INSERT INTO `oauth_access_tokens` VALUES ('0210c0a25c0859d7c648ede6b28e5ec61614f9e0dcbd348146415c16685070edf112b3508bf0af4c',1,1,'Personal Access Token','[]',0,'2019-10-17 02:27:47','2019-10-17 02:27:47','2020-10-16 21:27:47'),('042d5b0027378061f5f654f70805888542005937e8ca0a6ea8c86aa4400dcf81edd2dd472a100b05',1,1,'Personal Access Token','[]',0,'2019-11-19 15:04:26','2019-11-19 15:04:26','2020-11-19 09:04:26'),('04c0cc8ebcf90403db3c698c1553b003c359bb7b50538a7c0d257d047dac92ba67ffb06c49acd188',1,1,'Personal Access Token','[]',0,'2019-10-19 22:10:58','2019-10-19 22:10:58','2020-10-19 17:10:58'),('04fc201d08a0be21e6e1386a2fd6a79011e4b4845cc7510b8bdf8ef5fa6764ce1a1c70507d2c5ebd',1,1,'Personal Access Token','[]',0,'2019-11-05 17:48:35','2019-11-05 17:48:35','2020-11-05 11:48:35'),('084bf432c0c4c7562ecb006e44a316d0f47de10f007c192f9c449277a2fac63c075e1ebcd5ba678f',1,1,'Personal Access Token','[]',0,'2019-10-01 04:15:33','2019-10-01 04:15:33','2020-09-30 23:15:33'),('092346046f299046c392ca50749c5dd8fd8c76143c0af50c81a8c55c75fc74f224b322bbf993cdcc',1,1,'Personal Access Token','[]',0,'2019-10-19 22:09:28','2019-10-19 22:09:28','2020-10-19 17:09:28'),('1397eac3bf874b89a56d917ad93e465186d9b3638fbe590c9d13e6e8e4622f5f8cb4dc5b301e68b7',1,1,'Personal Access Token','[]',0,'2019-11-20 20:46:52','2019-11-20 20:46:52','2020-11-20 14:46:52'),('18d0a186f30aac118e3575217fcacb63427c3f5520dd2abb3e1726297fd3f3d517f89a6dfee708a0',1,1,'Personal Access Token','[]',0,'2019-10-19 21:58:03','2019-10-19 21:58:03','2020-10-19 16:58:03'),('2c52340407246d6b4d383e91907d91e00a07252a8b79215d6b1ab8ff19534b4c7f62a71382181f9e',1,1,'Personal Access Token','[]',0,'2019-10-19 22:05:39','2019-10-19 22:05:39','2020-10-19 17:05:39'),('363e84527072ca6351d0755fdf64bfcb483bf68666b174ac2f3ca3c3b61fa53012415721b286a6cc',1,1,'Personal Access Token','[]',0,'2019-10-12 21:33:14','2019-10-12 21:33:14','2020-10-12 16:33:14'),('444541f2c2dd5e4d83ad248780ecdbf0679743117d76e607551968b85126ca164c85b48794297286',1,1,'Personal Access Token','[]',0,'2019-10-19 21:58:29','2019-10-19 21:58:29','2020-10-19 16:58:29'),('4448fd631e8bc280c6b1666aa5fb5fbba45babe16fcd4362b72eba1c6a1c8228a3139d97cba1121e',10,1,'Personal Access Token','[]',0,'2019-11-05 22:51:08','2019-11-05 22:51:08','2020-11-05 16:51:08'),('4b48290b1ba4fe14a91b3c79244ee55df679b422c702d223dd628e012973bed2d712f0e340cfa6ba',1,1,'Personal Access Token','[]',0,'2019-10-19 22:09:04','2019-10-19 22:09:04','2020-10-19 17:09:04'),('50c24c2748c51f5c4cb0d69df7b9bad939b4ca4145020b4bdd9b2bda5e5ebf68dd3568b1ae6a5586',1,1,'Personal Access Token','[]',0,'2019-10-16 04:23:11','2019-10-16 04:23:11','2020-10-15 23:23:11'),('545092440429b682cc5875eff548a85b6e4a081f29fca9009c6bfc0f084e30f4f1a75b9111a8d60c',1,1,'Personal Access Token','[]',0,'2019-10-19 22:10:14','2019-10-19 22:10:14','2020-10-19 17:10:14'),('556d93ca1935186ba3cbfb3ad53654dbf75da33ed7b6d7a1db1d52280a8b5bba92171ffcfc122fa4',1,1,'Personal Access Token','[]',0,'2019-10-19 23:25:51','2019-10-19 23:25:51','2020-10-19 18:25:51'),('587a7021f4a1799080be1afd7a2d350d60ef8c0231a6c6c455f0a04760a363e346500a6bd1eb1984',1,1,'Personal Access Token','[]',0,'2019-10-19 22:06:13','2019-10-19 22:06:13','2020-10-19 17:06:13'),('5cad29189559635f140dcddedf64fdb42b3f075bfc62fde4c7a8abc5346d42f596f3a68536f32de5',1,1,'Personal Access Token','[]',0,'2019-10-19 20:25:45','2019-10-19 20:25:45','2020-10-19 15:25:45'),('6b541840866dd1b32b5e3d8b07d193fda3d50462e7911a4b9109077ceb26d6d01a16ba9401336f1a',1,1,'Personal Access Token','[]',0,'2019-11-19 16:22:51','2019-11-19 16:22:51','2020-11-19 10:22:51'),('866af9b515f3fce3c373b4b14f47feff59c74b9afd6c600a004c7ec2b47b8bf3c5dad56196ec6011',1,1,'Personal Access Token','[]',0,'2019-10-20 15:28:10','2019-10-20 15:28:10','2020-10-20 10:28:10'),('8c577b3b3006b91b27e410881bdd9b4ada9f434edef45fc3676acc87f411d5e6029d084e4534a875',1,1,'Personal Access Token','[]',0,'2019-11-21 15:00:53','2019-11-21 15:00:53','2020-11-21 09:00:53'),('8e736948ffe348235190d605221d38d0266a2ab5bb0ed78b44a4d2da028e976278ba98e607771b4a',1,1,'Personal Access Token','[]',0,'2019-10-19 22:10:26','2019-10-19 22:10:26','2020-10-19 17:10:26'),('9094b5dcbedaeb6a9d9ffdfe8aa57d2671d69b3041403ba1bdee28dbdfe7ada3fd5ace2a9dc228f9',1,1,'Personal Access Token','[]',0,'2019-10-19 21:53:42','2019-10-19 21:53:42','2020-10-19 16:53:42'),('966a28159485b8e11672e19ab45e201cb58974f66ccaa4c1f303f2d2c190452dbfd80e9e9bc806ed',1,1,'Personal Access Token','[]',0,'2019-10-19 21:53:14','2019-10-19 21:53:14','2020-10-19 16:53:14'),('990b1e901660e77d972a1c00b05bb7fd4ace86cc0e76ffa68e2d1cc0a913b28de14a06bcab2f5911',1,1,'Personal Access Token','[]',0,'2019-10-03 02:24:03','2019-10-03 02:24:03','2020-10-02 21:24:03'),('9be0058a0c2b368d8d59bd1eeae138708b8c528be3e6ab323685c964f1fda41bec0dbc2b77a2a029',1,1,'Personal Access Token','[]',0,'2019-10-19 21:52:29','2019-10-19 21:52:29','2020-10-19 16:52:29'),('9cd724f606a64b2414dd4cfe9c71804f829518d804da1f8baf203a95ce030f9d5a2d0ed607cb8ea5',1,1,'Personal Access Token','[]',0,'2019-11-11 15:30:29','2019-11-11 15:30:29','2020-11-11 09:30:29'),('a4dfb0e12b156fa92a7be7becbdf9fbd4349c031cbe57835ecea2c065e3195c35ad08eb87f57fe3f',1,1,'Personal Access Token','[]',0,'2019-10-20 18:58:05','2019-10-20 18:58:05','2020-10-20 13:58:05'),('a8454c104eecc203e00b47aaa24f60432ae5785e950b07b1b3f76f055ee65994f478ee1c763fd884',1,1,'Personal Access Token','[]',0,'2019-10-20 04:19:21','2019-10-20 04:19:21','2020-10-19 23:19:21'),('aaf587cba603894c4908cea9643a9f83dc33c89591d9e1627c169baa9d19f2a0dc14ab2291867eb5',1,1,'Personal Access Token','[]',0,'2019-11-20 20:01:43','2019-11-20 20:01:43','2020-11-20 14:01:43'),('b0ba372056e71bffe9a4648386c5fa00e1a22c6b9cdff38eff0a3286d9339cb0e0e53aad2cd3e2bd',1,1,'Personal Access Token','[]',0,'2019-10-19 23:23:41','2019-10-19 23:23:41','2020-10-19 18:23:41'),('c272d91b9821635826c85da13206b0235ea7c2f734360e233a65d3574631e203edfc403cef9551c1',1,1,'Personal Access Token','[]',0,'2019-10-19 21:56:41','2019-10-19 21:56:41','2020-10-19 16:56:41'),('cda5b2edba7a2f5ee0213fdec566b40c897f68f1414da7cc399a8e6e25954d25fcebb996b23ec78e',1,1,'Personal Access Token','[]',0,'2019-11-20 23:22:03','2019-11-20 23:22:03','2020-11-20 17:22:03'),('ce7b79990ced2ea13f976b816b3ca8cacc9d36f3c4173d167c58dad93bdcbad1d2f5fad46b8c0f96',1,1,'Personal Access Token','[]',0,'2019-10-19 22:08:29','2019-10-19 22:08:29','2020-10-19 17:08:29'),('dea4841e34b24ad6156b616ef838c9b91ea55afda7193b9b5463390369c15d2945e76e7952863b93',1,1,'Personal Access Token','[]',0,'2019-10-16 02:32:07','2019-10-16 02:32:07','2020-10-15 21:32:07'),('ec5179ede1c7de0759321dda2de5557639446b410c7141f2756f84e7b517fabdc5260585bc4aa936',1,1,'Personal Access Token','[]',0,'2019-10-19 01:17:59','2019-10-19 01:17:59','2020-10-18 20:17:59'),('f219631518e88aab1c44e49e3566ab24b66aee23a59b158d95df22ee3842f70cdc6028388dfac5a8',1,1,'Personal Access Token','[]',0,'2019-10-19 21:58:49','2019-10-19 21:58:49','2020-10-19 16:58:49');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES (1,NULL,'Laravel Personal Access Client','2ekSXJVoXhyjROl4auzQAXjXn9u21q2UJZzMx7HR','http://localhost',1,0,0,'2019-09-29 08:24:19','2019-09-29 08:24:19'),(2,NULL,'Laravel Password Grant Client','RslPYXiBvZFosvxJY8Zs7oSQp3Bd73B0aKe6rOrb','http://localhost',0,1,0,'2019-09-29 08:24:19','2019-09-29 08:24:19');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,1,'2019-09-29 08:24:19','2019-09-29 08:24:19');
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
INSERT INTO `payment_methods` VALUES (18,'03',2,NULL,NULL,NULL);
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
INSERT INTO `period_types` VALUES (2,'Quincenal',2,NULL,NULL,NULL);
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
INSERT INTO `sexs` VALUES (1,'H',NULL,NULL,NULL),(2,'M',NULL,NULL,NULL);
/*!40000 ALTER TABLE `sexs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Samuel Regino Placido','samuel.regino@next-io.com',NULL,'$2y$10$lhfiQ4PxkL50BCPU4eYSS.JjkDom9MyeDDJcx1OtkZwnZFPzuc5aO',NULL,4,'avatar.png',1,1,'2019-10-01 03:22:22','2019-10-20 05:15:35',NULL),(9,'Enrique Lopez','enrique.lopez@gmail.com',NULL,'$2y$10$/AFqRUTGCdBiYntHtluIneVNR4f4Ktqxt8b38wt/n4A7Hl68sOsOa',NULL,4,'avatar.png',1,1,'2019-11-05 21:08:06','2019-11-05 21:08:06',NULL),(10,'Roberto Hernandez','roberto.hernandez@gmail.com',NULL,'$2y$10$g4O8tJyl4qKfJSk6IAskDuKt4uovNy2eF/csAvaKDLU6hffz1R/0W',NULL,1,'avatar.png',1,1,'2019-11-05 21:08:49','2019-11-05 21:08:49',NULL),(11,'Esau Munive','esau.munive@gmail.com',NULL,'$2y$10$uMLfdIsfeXQbcV1eennY.u7ILU3YKC7hM2T40AyvbA5lKXEY.VAiy',NULL,2,'avatar.png',2,1,'2019-11-05 22:39:07','2019-11-05 22:39:07',NULL),(12,'Josefa Ortiz','josefa.ortiz@gmail.com.mx',NULL,'$2y$10$amtLSazc3gIjKncgH8guaOPlWKlsAqk3tHPARTddTiw37FB4.z0kG',NULL,3,'avatar.png',1,1,'2019-11-05 22:39:46','2019-11-05 22:39:46',NULL);
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
INSERT INTO `work_shifts` VALUES (5,'Matutino',2,NULL,NULL,NULL);
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
  `description` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
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
INSERT INTO `work_states` VALUES (1,'PA','En proceso de alta','2019-09-27 12:00:00',NULL,NULL),(2,'R','Proceso de reingreso','2019-09-27 12:00:00',NULL,NULL),(3,'A','Activo','2019-09-27 12:00:00',NULL,NULL),(4,'PB','Proceso de baja','2019-09-27 12:00:00',NULL,NULL),(5,'B','Dado de baja','2019-09-27 12:00:00',NULL,NULL);
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
  `work_status_id` int(11) unsigned DEFAULT NULL,
  `company_id` int(10) unsigned DEFAULT NULL,
  `code` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `discharge_date` date DEFAULT NULL,
  `termination_date` date DEFAULT NULL,
  `reentry_date` date DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `first_name` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `contract_type_id` int(10) unsigned DEFAULT NULL,
  `period_type_id` int(10) unsigned DEFAULT NULL,
  `real_daily_salary` decimal(20,2) DEFAULT NULL,
  `imss_daily_salary` decimal(20,2) DEFAULT NULL,
  `contribution_base_salary` decimal(20,2) DEFAULT NULL,
  `contribution_base_id` int(11) unsigned DEFAULT NULL,
  `department_id` int(10) unsigned DEFAULT NULL,
  `job_id` int(10) unsigned DEFAULT NULL,
  `employee_type_id` int(10) unsigned DEFAULT NULL,
  `payment_method_id` int(10) unsigned DEFAULT NULL,
  `work_shift_id` int(10) unsigned DEFAULT NULL,
  `number_afore` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `social_security_number` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `rfc` varchar(13) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `curp` varchar(22) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `sex_id` int(11) unsigned DEFAULT NULL,
  `birth_city` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
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
  CONSTRAINT `works_work_status_id_fk` FOREIGN KEY (`work_status_id`) REFERENCES `work_states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works`
--

LOCK TABLES `works` WRITE;
/*!40000 ALTER TABLE `works` DISABLE KEYS */;
INSERT INTO `works` VALUES (6,1,2,'807579','2019-11-13',NULL,NULL,'SAMUEL','SAMUEL','PLACIDO',11,2,23.42,122.23,121.22,5,5,8,4,18,5,'32234234','32123423423','SCC3WCE4WEC34','REPS890903HVZGLM06',1,'COATZACOALCOS','2019-11-21','2323r23','ascacs','ascacs','REPUBLICA DEL SALVADOR, TIERRA Y LIBERTAD',NULL,'VERACRUZ','96580','232323','we232323','232323','232323','232323','samuel43_7@hotmail.com','2323','2323','2323',6,'23232323','2019-11-11 11:55:09','2019-11-11 11:55:09',NULL),(87,3,2,'11','2011-01-03','1969-12-31','1969-12-31','Rodolfo Guzman','Hernandez','Lucas',12,2,NULL,NULL,630.75,5,4,5,NULL,18,5,NULL,'00000000001','GXXX5712289X7','GXXX571228HDFMND09',2,'MERIDA','1969-12-31','0',NULL,NULL,'DOMICILIO No. 001','LA HUERTA','JAL','40001',NULL,NULL,NULL,NULL,NULL,'correox@email.com.mx','012345678910111213',NULL,NULL,NULL,NULL,'2019-11-21 11:28:52','2019-11-21 11:28:52',NULL),(88,3,2,'12','1969-12-31','1969-12-31','1969-12-31','Hector','Arredondo','Toro',12,2,NULL,NULL,333.00,6,5,6,NULL,18,5,NULL,'00000000002','AXXX652309TQ1','AXXX650309HJCSPR08',2,'MERIDA','1965-09-03','0','JUAN M','MARTHA N','DOMICILIO No. 002','TONALA','JAL','40002','3#########',NULL,NULL,NULL,NULL,'correox@email.com.mx','012345678910111213',NULL,NULL,NULL,NULL,'2019-11-21 11:28:52','2019-11-21 11:28:52',NULL),(89,5,2,'13','2013-01-03','1969-12-31','1969-12-31','Jose Luis','Farias','Mezcua',12,2,NULL,NULL,203.51,5,6,7,NULL,18,5,NULL,'00000000003','JXXX8009307H0','JXXX650330HJCMNS01',2,'MONTERREY','1969-12-31','0','RAUL M','LUISA N','DOMICILIO No. 003','LA HUERTA','JAL','40003','3#########',NULL,NULL,NULL,NULL,'correox@email.com.mx','012345678910111213',NULL,NULL,NULL,NULL,'2019-11-21 11:28:52','2019-11-21 11:28:52',NULL),(90,5,2,'14','2013-01-01','1969-12-31','1969-12-31','Juan Alberto','Lumbreras','Lorenzo',12,2,NULL,NULL,2522.16,5,5,8,NULL,18,5,NULL,'00000000004','LXXX5810024U1','LXXX581002HGTZZN07',2,'LEON','1958-02-10','0','PEDRO M','KAREN M','DOMICILIO No. 004','LA HUERTA','JAL','40004',NULL,NULL,NULL,NULL,NULL,'correox@email.com.mx','012345678910111213',NULL,NULL,NULL,NULL,'2019-11-21 11:28:52','2019-11-21 11:28:52',NULL),(91,3,2,'15','2011-01-02','1969-12-31','1969-12-31','Jose Luis','Lizarraga','Malandez',12,2,NULL,NULL,2103.13,5,6,9,NULL,18,5,NULL,'00000000005','MXXX600629QS4','MXXX600629HJCXRN09',2,'VERACRUZ','1969-12-31','0','JOAQUIN N','VICTORIA M','DOMICILIO No. 005','LA HUERTA','JAL','40005',NULL,NULL,NULL,NULL,NULL,'correox@email.com.mx','012345678910111213',NULL,NULL,NULL,NULL,'2019-11-21 11:28:52','2019-11-21 11:28:52',NULL);
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

-- Dump completed on 2019-11-21 11:41:39
