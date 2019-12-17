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
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `rfc` varchar(13) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
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
  CONSTRAINT `company_users_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
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
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
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
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
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
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
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
INSERT INTO `departments` VALUES (1,'DIRECCION',1,'2019-10-07 23:11:43','2019-10-07 23:14:39',NULL),(2,'VENTAS',1,'2019-10-07 23:12:04','2019-10-07 23:12:04',NULL),(3,'CONTABILIDAD',1,NULL,NULL,NULL),(4,'VENTAS',2,NULL,'2019-10-19 23:02:27',NULL),(5,'CONTABILIDAD',2,NULL,NULL,NULL),(6,'DIRECCION',2,'2019-10-07 23:11:43','2019-10-07 23:14:39',NULL),(7,'VENTAS',2,'2019-10-07 23:12:04','2019-10-07 23:12:04',NULL),(8,'CONTABILIDAD',2,NULL,NULL,NULL);
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
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
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
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
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
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `employee_types_company_id_idx` (`company_id`),
  CONSTRAINT `employee_types_company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_types`
--

LOCK TABLES `employee_types` WRITE;
/*!40000 ALTER TABLE `employee_types` DISABLE KEYS */;
INSERT INTO `employee_types` VALUES (4,'Tipo de empleado Badak',2,NULL,NULL,NULL),(5,'Sindicalizado',1,NULL,NULL,NULL),(6,'S',2,NULL,NULL,NULL);
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
-- Table structure for table `imss`
--

DROP TABLE IF EXISTS `imss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imss` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `period` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imss`
--

LOCK TABLES `imss` WRITE;
/*!40000 ALTER TABLE `imss` DISABLE KEYS */;
INSERT INTO `imss` VALUES (12,'10-12-2019','NOVIEMBRE','2019-12-11 05:17:04','2019-12-11 05:17:04',NULL);
/*!40000 ALTER TABLE `imss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imss_file`
--

DROP TABLE IF EXISTS `imss_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imss_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `imss_id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `file_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imss_file`
--

LOCK TABLES `imss_file` WRITE;
/*!40000 ALTER TABLE `imss_file` DISABLE KEYS */;
INSERT INTO `imss_file` VALUES (11,12,'Aeroméxico.pdf','186_1576041424.pdf','2019-12-11 05:17:04','2019-12-11 05:17:04',NULL);
/*!40000 ALTER TABLE `imss_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imss_impuesto`
--

DROP TABLE IF EXISTS `imss_impuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imss_impuesto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `imss_id` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `file_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imss_impuesto`
--

LOCK TABLES `imss_impuesto` WRITE;
/*!40000 ALTER TABLE `imss_impuesto` DISABLE KEYS */;
INSERT INTO `imss_impuesto` VALUES (8,'12','Aeroméxico.pdf','119_1576041424.pdf','2019-12-11 05:17:04','2019-12-11 05:17:04',NULL);
/*!40000 ALTER TABLE `imss_impuesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imss_infonavit`
--

DROP TABLE IF EXISTS `imss_infonavit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imss_infonavit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `imss_id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `file_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imss_infonavit`
--

LOCK TABLES `imss_infonavit` WRITE;
/*!40000 ALTER TABLE `imss_infonavit` DISABLE KEYS */;
INSERT INTO `imss_infonavit` VALUES (9,12,'Aeroméxico.pdf','23_1576041424.pdf','2019-12-11 05:17:04','2019-12-11 05:17:04',NULL);
/*!40000 ALTER TABLE `imss_infonavit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imss_pago_impuesto`
--

DROP TABLE IF EXISTS `imss_pago_impuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imss_pago_impuesto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `imss_id` int(11) DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `file_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imss_pago_impuesto`
--

LOCK TABLES `imss_pago_impuesto` WRITE;
/*!40000 ALTER TABLE `imss_pago_impuesto` DISABLE KEYS */;
INSERT INTO `imss_pago_impuesto` VALUES (2,12,'Aeroméxico.pdf','249_1576041424.pdf','2019-12-11 05:17:04','2019-12-11 05:17:04',NULL);
/*!40000 ALTER TABLE `imss_pago_impuesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imss_pago_imss`
--

DROP TABLE IF EXISTS `imss_pago_imss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imss_pago_imss` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `imss_id` int(11) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `file_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imss_pago_imss`
--

LOCK TABLES `imss_pago_imss` WRITE;
/*!40000 ALTER TABLE `imss_pago_imss` DISABLE KEYS */;
INSERT INTO `imss_pago_imss` VALUES (11,12,'Aeroméxico.pdf','188_1576041424.pdf','2019-12-11 05:17:04','2019-12-11 05:17:04',NULL);
/*!40000 ALTER TABLE `imss_pago_imss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
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
INSERT INTO `jobs` VALUES (5,'DIRECTOR GENERAL',6,2,NULL,NULL,NULL),(6,'GERENTE DE VENTAS',7,2,NULL,NULL,NULL),(7,'CONTADOR GENERAL',8,2,NULL,NULL,NULL),(8,'DIRECTOR COMERCIAL',6,2,NULL,NULL,NULL),(9,'DIRECTOR DE FINANZAS',6,2,NULL,NULL,NULL);
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
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `nomina`
--

DROP TABLE IF EXISTS `nomina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nomina` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `period` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `obra` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomina`
--

LOCK TABLES `nomina` WRITE;
/*!40000 ALTER TABLE `nomina` DISABLE KEYS */;
INSERT INTO `nomina` VALUES (21,'2019-12-6','1RA SEMANA DE DICIEMBRE','Desconocida','2019-12-06 18:03:40','2019-12-06 18:03:40',NULL);
/*!40000 ALTER TABLE `nomina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nomina_dispersion`
--

DROP TABLE IF EXISTS `nomina_dispersion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nomina_dispersion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nomina_id` int(10) unsigned NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `file_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `nomina_dispersion_idx` (`nomina_id`),
  CONSTRAINT `nomina_dispersion` FOREIGN KEY (`nomina_id`) REFERENCES `nomina` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomina_dispersion`
--

LOCK TABLES `nomina_dispersion` WRITE;
/*!40000 ALTER TABLE `nomina_dispersion` DISABLE KEYS */;
INSERT INTO `nomina_dispersion` VALUES (21,21,'DISPERSION SEM 49 ATIX.rar','240_1575655420.rar','2019-12-06 18:03:40','2019-12-06 18:03:40',NULL);
/*!40000 ALTER TABLE `nomina_dispersion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
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
INSERT INTO `oauth_access_tokens` VALUES ('0210c0a25c0859d7c648ede6b28e5ec61614f9e0dcbd348146415c16685070edf112b3508bf0af4c',1,1,'Personal Access Token','[]',0,'2019-10-17 02:27:47','2019-10-17 02:27:47','2020-10-16 21:27:47'),('042d5b0027378061f5f654f70805888542005937e8ca0a6ea8c86aa4400dcf81edd2dd472a100b05',1,1,'Personal Access Token','[]',0,'2019-11-19 15:04:26','2019-11-19 15:04:26','2020-11-19 09:04:26'),('04c0cc8ebcf90403db3c698c1553b003c359bb7b50538a7c0d257d047dac92ba67ffb06c49acd188',1,1,'Personal Access Token','[]',0,'2019-10-19 22:10:58','2019-10-19 22:10:58','2020-10-19 17:10:58'),('04fc201d08a0be21e6e1386a2fd6a79011e4b4845cc7510b8bdf8ef5fa6764ce1a1c70507d2c5ebd',1,1,'Personal Access Token','[]',0,'2019-11-05 17:48:35','2019-11-05 17:48:35','2020-11-05 11:48:35'),('084bf432c0c4c7562ecb006e44a316d0f47de10f007c192f9c449277a2fac63c075e1ebcd5ba678f',1,1,'Personal Access Token','[]',0,'2019-10-01 04:15:33','2019-10-01 04:15:33','2020-09-30 23:15:33'),('092346046f299046c392ca50749c5dd8fd8c76143c0af50c81a8c55c75fc74f224b322bbf993cdcc',1,1,'Personal Access Token','[]',0,'2019-10-19 22:09:28','2019-10-19 22:09:28','2020-10-19 17:09:28'),('18d0a186f30aac118e3575217fcacb63427c3f5520dd2abb3e1726297fd3f3d517f89a6dfee708a0',1,1,'Personal Access Token','[]',0,'2019-10-19 21:58:03','2019-10-19 21:58:03','2020-10-19 16:58:03'),('1afa52043eff60e8ebe1dc25e66d9f5e374998204668356d5b39374105896935edd6477209e02220',1,1,'Personal Access Token','[]',0,'2019-12-09 22:09:32','2019-12-09 22:09:32','2020-12-09 15:09:32'),('28b94ab9f782c5530945b4ef2e96488c6dca8af987f5a5db07ffd5d4c79c3994059fd96a876688a7',1,1,'Personal Access Token','[]',0,'2019-11-27 15:03:01','2019-11-27 15:03:01','2020-11-27 09:03:01'),('2c52340407246d6b4d383e91907d91e00a07252a8b79215d6b1ab8ff19534b4c7f62a71382181f9e',1,1,'Personal Access Token','[]',0,'2019-10-19 22:05:39','2019-10-19 22:05:39','2020-10-19 17:05:39'),('34618b611059e08e00931daa0d85c64b8b8549e059fcbf9e375b5d90fa6985f8a6a56a44a81c0b8d',1,1,'Personal Access Token','[]',0,'2019-12-04 15:50:32','2019-12-04 15:50:32','2020-12-04 09:50:32'),('363e84527072ca6351d0755fdf64bfcb483bf68666b174ac2f3ca3c3b61fa53012415721b286a6cc',1,1,'Personal Access Token','[]',0,'2019-10-12 21:33:14','2019-10-12 21:33:14','2020-10-12 16:33:14'),('3762f226e6642e4ba80b199bd212d6e0f2d8c94fc5927f11902112c681650e5c4f72a26b27f7b6c9',1,1,'Personal Access Token','[]',0,'2019-11-26 16:44:04','2019-11-26 16:44:04','2020-11-26 10:44:04'),('38621b84643eaf739b46857f579dc8d82958ef392b5c69b6224ef1dbe819e9cc010d381b093f531a',1,1,'Personal Access Token','[]',0,'2019-12-06 19:02:39','2019-12-06 19:02:39','2020-12-06 12:02:39'),('444541f2c2dd5e4d83ad248780ecdbf0679743117d76e607551968b85126ca164c85b48794297286',1,1,'Personal Access Token','[]',0,'2019-10-19 21:58:29','2019-10-19 21:58:29','2020-10-19 16:58:29'),('4448fd631e8bc280c6b1666aa5fb5fbba45babe16fcd4362b72eba1c6a1c8228a3139d97cba1121e',10,1,'Personal Access Token','[]',0,'2019-11-05 22:51:08','2019-11-05 22:51:08','2020-11-05 16:51:08'),('488f7ced464001cc51538456af877531a2678c20f540ffd565ce6c00c165d78af36e6b7a7772f9ec',1,1,'Personal Access Token','[]',0,'2019-11-28 18:36:30','2019-11-28 18:36:30','2020-11-28 12:36:30'),('4b48290b1ba4fe14a91b3c79244ee55df679b422c702d223dd628e012973bed2d712f0e340cfa6ba',1,1,'Personal Access Token','[]',0,'2019-10-19 22:09:04','2019-10-19 22:09:04','2020-10-19 17:09:04'),('50c24c2748c51f5c4cb0d69df7b9bad939b4ca4145020b4bdd9b2bda5e5ebf68dd3568b1ae6a5586',1,1,'Personal Access Token','[]',0,'2019-10-16 04:23:11','2019-10-16 04:23:11','2020-10-15 23:23:11'),('545092440429b682cc5875eff548a85b6e4a081f29fca9009c6bfc0f084e30f4f1a75b9111a8d60c',1,1,'Personal Access Token','[]',0,'2019-10-19 22:10:14','2019-10-19 22:10:14','2020-10-19 17:10:14'),('556d93ca1935186ba3cbfb3ad53654dbf75da33ed7b6d7a1db1d52280a8b5bba92171ffcfc122fa4',1,1,'Personal Access Token','[]',0,'2019-10-19 23:25:51','2019-10-19 23:25:51','2020-10-19 18:25:51'),('558921367866f8c64ae7d0a5e28cbba8f38d9ce90bb816c8eb6940eb4efa5b1e6578f614fd5c587e',1,1,'Personal Access Token','[]',0,'2019-12-14 20:12:11','2019-12-14 20:12:11','2020-12-14 13:12:11'),('587a7021f4a1799080be1afd7a2d350d60ef8c0231a6c6c455f0a04760a363e346500a6bd1eb1984',1,1,'Personal Access Token','[]',0,'2019-10-19 22:06:13','2019-10-19 22:06:13','2020-10-19 17:06:13'),('5cad29189559635f140dcddedf64fdb42b3f075bfc62fde4c7a8abc5346d42f596f3a68536f32de5',1,1,'Personal Access Token','[]',0,'2019-10-19 20:25:45','2019-10-19 20:25:45','2020-10-19 15:25:45'),('6b541840866dd1b32b5e3d8b07d193fda3d50462e7911a4b9109077ceb26d6d01a16ba9401336f1a',1,1,'Personal Access Token','[]',0,'2019-11-19 16:22:51','2019-11-19 16:22:51','2020-11-19 10:22:51'),('750047fceb50ad1b4ef6179d3636739e953be07ad69ceaca23ff7016a9721fe00de57f6ff98a5a67',1,1,'Personal Access Token','[]',0,'2019-11-26 02:21:16','2019-11-26 02:21:16','2020-11-25 20:21:16'),('827645ea983e903585984358999cf28460f8a6334bb153fdc2279fcd64a85eebfba0ca7dce5c6290',1,1,'Personal Access Token','[]',0,'2019-12-14 19:21:53','2019-12-14 19:21:53','2020-12-14 12:21:53'),('866af9b515f3fce3c373b4b14f47feff59c74b9afd6c600a004c7ec2b47b8bf3c5dad56196ec6011',1,1,'Personal Access Token','[]',0,'2019-10-20 15:28:10','2019-10-20 15:28:10','2020-10-20 10:28:10'),('8e736948ffe348235190d605221d38d0266a2ab5bb0ed78b44a4d2da028e976278ba98e607771b4a',1,1,'Personal Access Token','[]',0,'2019-10-19 22:10:26','2019-10-19 22:10:26','2020-10-19 17:10:26'),('9094b5dcbedaeb6a9d9ffdfe8aa57d2671d69b3041403ba1bdee28dbdfe7ada3fd5ace2a9dc228f9',1,1,'Personal Access Token','[]',0,'2019-10-19 21:53:42','2019-10-19 21:53:42','2020-10-19 16:53:42'),('9329ea21d34e37377e3c63914b32d5f5dae8a4f6d38739e3855b22a58250167fe1d709d3939494d2',1,1,'Personal Access Token','[]',0,'2019-11-21 01:53:41','2019-11-21 01:53:41','2020-11-20 19:53:41'),('966a28159485b8e11672e19ab45e201cb58974f66ccaa4c1f303f2d2c190452dbfd80e9e9bc806ed',1,1,'Personal Access Token','[]',0,'2019-10-19 21:53:14','2019-10-19 21:53:14','2020-10-19 16:53:14'),('990b1e901660e77d972a1c00b05bb7fd4ace86cc0e76ffa68e2d1cc0a913b28de14a06bcab2f5911',1,1,'Personal Access Token','[]',0,'2019-10-03 02:24:03','2019-10-03 02:24:03','2020-10-02 21:24:03'),('9be0058a0c2b368d8d59bd1eeae138708b8c528be3e6ab323685c964f1fda41bec0dbc2b77a2a029',1,1,'Personal Access Token','[]',0,'2019-10-19 21:52:29','2019-10-19 21:52:29','2020-10-19 16:52:29'),('9cd724f606a64b2414dd4cfe9c71804f829518d804da1f8baf203a95ce030f9d5a2d0ed607cb8ea5',1,1,'Personal Access Token','[]',0,'2019-11-11 15:30:29','2019-11-11 15:30:29','2020-11-11 09:30:29'),('a4dfb0e12b156fa92a7be7becbdf9fbd4349c031cbe57835ecea2c065e3195c35ad08eb87f57fe3f',1,1,'Personal Access Token','[]',0,'2019-10-20 18:58:05','2019-10-20 18:58:05','2020-10-20 13:58:05'),('a8454c104eecc203e00b47aaa24f60432ae5785e950b07b1b3f76f055ee65994f478ee1c763fd884',1,1,'Personal Access Token','[]',0,'2019-10-20 04:19:21','2019-10-20 04:19:21','2020-10-19 23:19:21'),('af307c8fe7230a9b004273a8f3358c2a84d320fefca752a9d8ee2ce0df942fd78287f567676b5400',1,1,'Personal Access Token','[]',0,'2019-11-26 15:10:06','2019-11-26 15:10:06','2020-11-26 09:10:06'),('af984ca55c5bf5cbcd2a2f2006dfe57cb8e637c5a48dd022c7959c664d314ba20bfb63f64696edaf',1,1,'Personal Access Token','[]',0,'2019-12-03 15:53:38','2019-12-03 15:53:38','2020-12-03 09:53:38'),('b0b44fad3087ee6fd47c56de68681f732e81423174f279dda0d5a0aaea8b509f3ad773cb6b7efee4',1,1,'Personal Access Token','[]',0,'2019-12-11 06:31:16','2019-12-11 06:31:16','2020-12-10 23:31:16'),('b0ba372056e71bffe9a4648386c5fa00e1a22c6b9cdff38eff0a3286d9339cb0e0e53aad2cd3e2bd',1,1,'Personal Access Token','[]',0,'2019-10-19 23:23:41','2019-10-19 23:23:41','2020-10-19 18:23:41'),('b461298a9e072d38387d643b1c3ccaea07935f66da193bdcec40ed84e4bd82a5dcf564ef0e599d8c',1,1,'Personal Access Token','[]',0,'2019-12-11 05:51:38','2019-12-11 05:51:38','2020-12-10 22:51:38'),('bb99e4a54209cb3a26952af43a9bdebb1d7c90efc560959dd78170f40c735752a64affb5818ca1a8',1,1,'Personal Access Token','[]',0,'2019-11-23 15:03:29','2019-11-23 15:03:29','2020-11-23 09:03:29'),('c272d91b9821635826c85da13206b0235ea7c2f734360e233a65d3574631e203edfc403cef9551c1',1,1,'Personal Access Token','[]',0,'2019-10-19 21:56:41','2019-10-19 21:56:41','2020-10-19 16:56:41'),('cc6446354d8297f432e7be45645c418e278b84f5bf79eac9822831d3d39a6fcb6932fd04d7801a63',1,1,'Personal Access Token','[]',0,'2019-12-15 06:10:08','2019-12-15 06:10:08','2020-12-14 23:10:08'),('ce7b79990ced2ea13f976b816b3ca8cacc9d36f3c4173d167c58dad93bdcbad1d2f5fad46b8c0f96',1,1,'Personal Access Token','[]',0,'2019-10-19 22:08:29','2019-10-19 22:08:29','2020-10-19 17:08:29'),('d3a1f723259bb66c80fc463318416c1855278d6ed4f4a543db2a7ee1653931a6973d3206dbc163c4',1,1,'Personal Access Token','[]',0,'2019-12-06 00:28:08','2019-12-06 00:28:08','2020-12-05 17:28:08'),('d66a014942f9d947013f3048b30844c7859b709f237fbd41fa4b2e0fbc04ec0ee5a561e77f3b26b4',1,1,'Personal Access Token','[]',0,'2019-12-17 03:33:56','2019-12-17 03:33:56','2020-12-16 21:33:56'),('d941c0f2f70ab44e3ecd8f1c6ee4cf4706f0e8d8812f4c7170201ac874f4507c1db2f466ecdf1acb',1,1,'Personal Access Token','[]',0,'2019-11-28 21:52:25','2019-11-28 21:52:25','2020-11-28 15:52:25'),('da69280385bc0feae1b8629cf098b83a7f30d400360db93368b2084dbb36f5a712091ac240b4b312',1,1,'Personal Access Token','[]',0,'2019-12-07 19:45:23','2019-12-07 19:45:23','2020-12-07 12:45:23'),('ddc0d3b7fcd63140d6e24b63c87cd5ab0cb5818e7f2426c0dde8e56540858f3a68e5998773c314c9',1,1,'Personal Access Token','[]',0,'2019-11-20 02:56:29','2019-11-20 02:56:29','2020-11-19 20:56:29'),('dea4841e34b24ad6156b616ef838c9b91ea55afda7193b9b5463390369c15d2945e76e7952863b93',1,1,'Personal Access Token','[]',0,'2019-10-16 02:32:07','2019-10-16 02:32:07','2020-10-15 21:32:07'),('e14311cd446d10653a0a4318a32af7ced7812a0ad8dcfac645f480e56be520070eab1d63c3ce27fe',1,1,'Personal Access Token','[]',0,'2019-12-16 15:50:51','2019-12-16 15:50:51','2020-12-16 08:50:51'),('e8ada755b859e66ef3f917acd3fc357d09c447363b48b5159d70132862e0461e82ead8005fb03776',1,1,'Personal Access Token','[]',0,'2019-11-22 14:08:26','2019-11-22 14:08:26','2020-11-22 08:08:26'),('ec5179ede1c7de0759321dda2de5557639446b410c7141f2756f84e7b517fabdc5260585bc4aa936',1,1,'Personal Access Token','[]',0,'2019-10-19 01:17:59','2019-10-19 01:17:59','2020-10-18 20:17:59'),('f171111cef7a24f5ad3a5f00ca6edb39709b2978042574075749cea6c0463c14bbe0a1b5d1e43efc',1,1,'Personal Access Token','[]',0,'2019-12-11 06:18:23','2019-12-11 06:18:23','2020-12-10 23:18:23'),('f219631518e88aab1c44e49e3566ab24b66aee23a59b158d95df22ee3842f70cdc6028388dfac5a8',1,1,'Personal Access Token','[]',0,'2019-10-19 21:58:49','2019-10-19 21:58:49','2020-10-19 16:58:49'),('fc2591d52f52f5f0fc5cef62ec4303863cdac34eac699148b1ae68307e4d3c29a819b06b355c05ab',1,1,'Personal Access Token','[]',0,'2019-11-20 02:55:22','2019-11-20 02:55:22','2020-11-19 20:55:22'),('ffafdc7f8bfb9bb901064d6277a8eb3ade91be68fce70a89d3f517684aec90e74d510d3ed8326c7b',1,1,'Personal Access Token','[]',0,'2019-12-05 14:22:22','2019-12-05 14:22:22','2020-12-05 08:22:22');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`(191))
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
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
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
-- Table structure for table `payment_receipts`
--

DROP TABLE IF EXISTS `payment_receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_receipts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `period` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_receipts`
--

LOCK TABLES `payment_receipts` WRITE;
/*!40000 ALTER TABLE `payment_receipts` DISABLE KEYS */;
INSERT INTO `payment_receipts` VALUES (5,'10-12-19','SEMANA 49','2019-12-11 05:13:35','2019-12-11 05:19:33',NULL);
/*!40000 ALTER TABLE `payment_receipts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_receipts_transference1`
--

DROP TABLE IF EXISTS `payment_receipts_transference1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_receipts_transference1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_receipt_id` int(10) unsigned NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `file_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_receipts_transference1`
--

LOCK TABLES `payment_receipts_transference1` WRITE;
/*!40000 ALTER TABLE `payment_receipts_transference1` DISABLE KEYS */;
INSERT INTO `payment_receipts_transference1` VALUES (5,5,'Aeroméxico.pdf','6_1576041215.pdf','2019-12-11 05:13:35','2019-12-11 05:13:35',NULL);
/*!40000 ALTER TABLE `payment_receipts_transference1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_receipts_transference2`
--

DROP TABLE IF EXISTS `payment_receipts_transference2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_receipts_transference2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_receipt_id` int(10) unsigned NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `file_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_receipts_transference2`
--

LOCK TABLES `payment_receipts_transference2` WRITE;
/*!40000 ALTER TABLE `payment_receipts_transference2` DISABLE KEYS */;
INSERT INTO `payment_receipts_transference2` VALUES (5,5,'Aeroméxico.pdf','368_1576041573.pdf','2019-12-11 05:19:33','2019-12-11 05:19:33',NULL);
/*!40000 ALTER TABLE `payment_receipts_transference2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_receipts_xml`
--

DROP TABLE IF EXISTS `payment_receipts_xml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_receipts_xml` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_receipt_id` int(11) DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `file_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_receipts_xml`
--

LOCK TABLES `payment_receipts_xml` WRITE;
/*!40000 ALTER TABLE `payment_receipts_xml` DISABLE KEYS */;
INSERT INTO `payment_receipts_xml` VALUES (6,5,'carta propuesta Hector Partida.pdf','191_1576041215.pdf','2019-12-11 05:13:35','2019-12-11 05:13:35',NULL);
/*!40000 ALTER TABLE `payment_receipts_xml` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `period_types`
--

DROP TABLE IF EXISTS `period_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `period_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `company_id` int(10) unsigned NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `period_types_company_id_fk_idx` (`company_id`),
  CONSTRAINT `period_types_company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `period_types`
--

LOCK TABLES `period_types` WRITE;
/*!40000 ALTER TABLE `period_types` DISABLE KEYS */;
INSERT INTO `period_types` VALUES (2,'Quincenal',2,NULL,NULL,NULL),(3,'Semanal',1,NULL,NULL,NULL);
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
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
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
-- Table structure for table `unionizeds`
--

DROP TABLE IF EXISTS `unionizeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unionizeds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unionizeds`
--

LOCK TABLES `unionizeds` WRITE;
/*!40000 ALTER TABLE `unionizeds` DISABLE KEYS */;
INSERT INTO `unionizeds` VALUES (1,'S','Sindicalizado',NULL,NULL,NULL),(2,'C','Confianza',NULL,NULL,NULL);
/*!40000 ALTER TABLE `unionizeds` ENABLE KEYS */;
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
  `other_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
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
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
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
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `description` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
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
  `code` varchar(45) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `discharge_date` date DEFAULT NULL,
  `termination_date` date DEFAULT NULL,
  `reentry_date` date DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `first_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `last_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `contract_type_id` int(10) unsigned DEFAULT NULL,
  `period_type_id` int(10) unsigned DEFAULT NULL,
  `real_daily_salary` decimal(20,2) DEFAULT NULL,
  `imss_daily_salary` decimal(20,2) DEFAULT NULL,
  `contribution_base_salary` decimal(20,2) DEFAULT NULL,
  `contribution_base_id` int(11) unsigned DEFAULT NULL,
  `department_id` int(10) unsigned DEFAULT NULL,
  `job_id` int(10) unsigned DEFAULT NULL,
  `employee_type_id` int(10) unsigned DEFAULT NULL,
  `unionized_id` int(11) unsigned DEFAULT NULL,
  `payment_method_id` int(10) unsigned DEFAULT NULL,
  `work_shift_id` int(10) unsigned DEFAULT NULL,
  `number_afore` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `social_security_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `rfc` varchar(13) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `curp` varchar(22) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `sex_id` int(11) unsigned DEFAULT NULL,
  `birth_city` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `umf` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `fathers_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `mothers_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `current_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `current_population` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `current_state` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `cp` varchar(10) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `back_electronic_payment` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `acount_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `branch_office` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `fonacot_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `key_account` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `state` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `infonavit_credit_number` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `discount_type_id` int(10) unsigned DEFAULT NULL,
  `monthly_factor` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `ine_file_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `address_file_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `curp_file_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `contract_file_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `imss_file_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `baja_imss_file_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `finiquito_file_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `baja_imss_date` date DEFAULT NULL,
  `causa_baja` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
  `observations_baja` varchar(200) CHARACTER SET utf8 COLLATE utf8_spanish2_ci DEFAULT NULL,
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
  KEY `unionized_id` (`unionized_id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works`
--

LOCK TABLES `works` WRITE;
/*!40000 ALTER TABLE `works` DISABLE KEYS */;
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

-- Dump completed on 2019-12-16 23:17:31
