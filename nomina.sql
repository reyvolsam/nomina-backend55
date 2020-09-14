-- phpMyAdmin SQL Dump
-- version 4.9.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 14, 2020 at 03:10 PM
-- Server version: 5.7.23-23
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `esifisca_nomina`
--

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `contact` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `rfc` varchar(13) COLLATE utf8_spanish2_ci NOT NULL,
  `telephone` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `contact`, `rfc`, `telephone`, `created_at`, `updated_at`, `deleted_at`) VALUES
(3, 'Empresa 1', '-', '-', '-', NULL, NULL, NULL),
(4, 'Attix Soluciones Integrales SA de CV', 'Rodiver Robles Ramirez', 'ASI080902U28', '2130744', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `company_users`
--

CREATE TABLE `company_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `company_users`
--

INSERT INTO `company_users` (`id`, `user_id`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(9, 13, 4, '2019-12-23 00:33:57', '2019-12-23 00:33:57', NULL),
(10, 14, 4, '2020-02-06 13:30:15', '2020-02-06 13:31:00', '2020-02-06 13:31:00'),
(12, 15, 4, '2020-02-06 22:54:12', '2020-02-06 22:54:24', '2020-02-06 22:54:24'),
(13, 16, 4, '2020-02-08 11:47:49', '2020-02-08 11:47:49', NULL),
(14, 17, 4, '2020-09-12 13:44:16', '2020-09-12 13:44:16', NULL),
(16, 18, 4, '2020-09-12 13:48:05', '2020-09-12 13:48:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contract_types`
--

CREATE TABLE `contract_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `contract_types`
--

INSERT INTO `contract_types` (`id`, `name`, `description`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(14, '01', 'Contrato por tiempo indeterminado', 4, NULL, '2019-12-27 01:18:39', NULL),
(15, '02', 'Contrato por obra determinada', 4, NULL, '2019-12-27 01:19:00', NULL),
(16, '03', 'Contrato por tiempo determinado', 4, NULL, '2019-12-27 01:19:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contribution_bases`
--

CREATE TABLE `contribution_bases` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `contribution_bases`
--

INSERT INTO `contribution_bases` (`id`, `name`, `description`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(8, 'F', 'Fijo', 4, NULL, '2019-12-27 01:43:38', NULL),
(9, 'V', 'Variable', 4, NULL, '2019-12-27 01:43:49', NULL),
(10, 'M', 'Mixto', 4, NULL, '2019-12-27 01:44:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount_types`
--

CREATE TABLE `discount_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `discount_types`
--

INSERT INTO `discount_types` (`id`, `name`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(7, '01 Cuota Fija', 4, NULL, NULL, NULL),
(8, '02 Porcentaje', 4, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `documentations`
--

CREATE TABLE `documentations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `documentations`
--

INSERT INTO `documentations` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Acta de nacimiento\n', '2019-09-27 12:00:00', NULL, NULL),
(2, 'Comprobante de domicilio\n', '2019-09-27 12:00:00', NULL, NULL),
(3, 'INE', '2019-09-27 12:00:00', NULL, NULL),
(4, 'CURP', '2019-09-27 12:00:00', NULL, NULL),
(5, 'RFC', '2019-09-27 12:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_types`
--

CREATE TABLE `employee_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `employee_types`
--

INSERT INTO `employee_types` (`id`, `name`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(8, 'Sindicalizado', 4, NULL, NULL, NULL),
(9, 'Confianza', 4, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `alias`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Administrador', 'administration', '2019-09-26 12:00:00', '2019-09-26 12:00:00', NULL),
(2, 'Patrón', 'patron', '2019-09-26 12:00:00', '2019-09-26 12:00:00', NULL),
(3, 'Ejecutivo', 'executive', '2019-09-26 12:00:00', '2019-09-26 12:00:00', NULL),
(4, 'root', 'root', '2019-09-26 12:00:00', '2019-09-26 12:00:00', NULL),
(5, 'Empleado', 'employee', '2019-09-26 12:00:00', '2019-09-26 12:00:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `imss`
--

CREATE TABLE `imss` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `period` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `imss_file`
--

CREATE TABLE `imss_file` (
  `id` int(10) UNSIGNED NOT NULL,
  `imss_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `file_url` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `imss_impuesto`
--

CREATE TABLE `imss_impuesto` (
  `id` int(10) UNSIGNED NOT NULL,
  `imss_id` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `file_url` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `imss_infonavit`
--

CREATE TABLE `imss_infonavit` (
  `id` int(10) UNSIGNED NOT NULL,
  `imss_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `file_url` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `imss_pago_impuesto`
--

CREATE TABLE `imss_pago_impuesto` (
  `id` int(10) UNSIGNED NOT NULL,
  `imss_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `file_url` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `imss_pago_imss`
--

CREATE TABLE `imss_pago_imss` (
  `id` int(10) UNSIGNED NOT NULL,
  `imss_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `file_url` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `department_id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `nomina`
--

CREATE TABLE `nomina` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `period` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `obra` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `nomina`
--

INSERT INTO `nomina` (`id`, `date`, `period`, `obra`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '08-02-2020', 'Semana 06 (1)', 'Indheca', '2020-02-08 19:34:37', '2020-02-10 17:17:15', NULL),
(2, '08-02-2020', 'Semana 06 (2)', 'Indheca', '2020-02-10 17:36:14', '2020-02-10 17:36:14', NULL),
(3, '31-01-2020', 'Semana 05 (1)', 'Indheca', '2020-02-10 21:31:17', '2020-02-10 21:31:17', NULL),
(4, '31-01-2020', 'Semana 05 (2)', 'Indheca', '2020-02-10 21:53:39', '2020-02-10 21:53:39', NULL),
(5, '24-01-2020', 'Semana 04 (1)', 'Indheca', '2020-02-10 22:09:58', '2020-02-10 22:09:58', NULL),
(6, '24-01-2020', 'Semana 04 (2)', 'Indheca', '2020-02-10 22:30:57', '2020-02-10 22:30:57', NULL),
(7, '17-01-2020', 'Semana 03', 'Indheca', '2020-02-10 22:47:51', '2020-02-10 22:47:51', NULL),
(8, '10-01-2020', 'Semana 02', 'Indheca', '2020-02-12 17:24:08', '2020-02-12 17:24:08', NULL),
(9, '03-01-2020', 'Semana 01', 'Indheca', '2020-02-12 19:32:22', '2020-02-12 19:32:22', NULL),
(10, '15-02-2020', 'Semana 07', 'Indheca', '2020-02-17 23:22:44', '2020-02-17 23:22:44', NULL),
(11, '22-02-2020', 'Semana 08 (1)', 'Indheca', '2020-02-24 19:28:09', '2020-02-24 19:28:09', NULL),
(12, '22-02--2020', 'Semana 08 (2)', 'Indheca', '2020-02-24 19:43:17', '2020-02-24 19:43:17', NULL),
(13, '29-02-2020', 'Semana 09 (1)', 'Indheca', '2020-03-02 18:15:08', '2020-03-02 18:15:08', NULL),
(14, '29-02-2020', 'Semana 09 (2)', 'Indheca', '2020-03-02 19:38:08', '2020-03-02 19:38:08', NULL),
(15, '07-03-2020', 'Semana 10 (1)', 'Indheca', '2020-03-09 23:12:15', '2020-03-09 23:12:15', NULL),
(16, '07-03-2020', 'Semana 10 (2)', 'Indheca', '2020-03-09 23:30:49', '2020-03-09 23:30:49', NULL),
(17, '14-03-2020', 'Semana 11 (1)', 'Indheca', '2020-03-16 21:34:40', '2020-03-16 21:34:40', NULL),
(18, '14-03-2020', 'Semana 11 (2)', 'Indheca', '2020-03-16 21:52:41', '2020-03-16 21:52:41', NULL),
(19, '21-03-2020', 'Semana 12 (1)', 'Indheca', '2020-03-28 18:36:43', '2020-03-28 18:38:11', NULL),
(20, '21-03-2020', 'Semana 12 (2)', 'Indheca', '2020-03-28 18:37:37', '2020-03-28 18:38:00', NULL),
(21, '28-03-2020', 'Semana 13 (1)', 'Indheca', '2020-03-28 18:39:00', '2020-03-28 18:39:00', NULL),
(22, '28-03-2020', 'Semana 13 (2)', 'Indheca', '2020-03-28 18:50:45', '2020-03-28 18:50:45', NULL),
(23, '04-04-2020', 'Semana 14 (1)', 'Indheca', '2020-04-06 22:06:47', '2020-04-06 22:06:47', NULL),
(24, '04-04-2020', 'Semana 14 (2)', 'Indheca', '2020-04-06 22:25:35', '2020-04-06 22:25:35', NULL),
(25, '14-04-2020', 'Semana 15', 'Indheca', '2020-04-14 21:50:22', '2020-04-14 21:50:22', NULL),
(26, '18-04-2020', 'Semana 16 (1)', 'Indheca', '2020-04-21 15:59:48', '2020-04-21 15:59:48', NULL),
(27, '18-04-2020', 'Semana 16 (2)', 'Indheca', '2020-04-21 16:10:56', '2020-04-21 16:10:56', NULL),
(28, '30-04-2020', 'Semana 18(1)', 'Indheca', '2020-05-06 20:57:12', '2020-05-06 20:57:12', NULL),
(29, '30-04-2020', 'Semana 18(2)', 'Indheca', '2020-05-06 21:12:50', '2020-05-06 21:12:50', NULL),
(30, '25-04-2020', 'Semana 17 (1)', 'Indheca', '2020-05-06 21:18:25', '2020-05-06 21:18:25', NULL),
(31, '25-04-2020', 'Semana 17(2)', 'Indheca', '2020-05-06 21:37:20', '2020-05-06 21:37:20', NULL),
(32, '09-05-2020', 'Semana 19 (1)', 'Indheca', '2020-05-12 15:42:08', '2020-05-12 15:42:08', NULL),
(33, '09-05-2020', 'Semana 19 (2)', 'Indheca', '2020-05-12 15:54:04', '2020-05-12 15:54:04', NULL),
(34, '16-05-2020', 'Semana 20 (1)', 'Indheca', '2020-05-19 21:50:44', '2020-05-19 21:50:44', NULL),
(35, '16-05-2020', 'Semana 20 (2)', 'Indheca', '2020-05-19 22:03:24', '2020-05-19 22:03:24', NULL),
(36, '23-05-2020', 'Semana 21 (1)', 'Indheca', '2020-05-26 22:08:03', '2020-05-26 22:08:03', NULL),
(37, '23-05-2020', 'Semana 21 (2)', 'Indheca', '2020-05-26 22:19:53', '2020-05-26 22:19:53', NULL),
(38, '30-05-2020', 'Semana 22 (1)', 'Indheca', '2020-06-10 17:49:22', '2020-06-10 17:49:22', NULL),
(39, '30-05-2020', 'Semana 22 (2)', 'Indheca', '2020-06-10 17:59:00', '2020-06-10 17:59:00', NULL),
(40, '06-06-2020', 'Semana 23 (1)', 'Indheca', '2020-06-10 18:00:19', '2020-06-10 18:00:19', NULL),
(41, '06-06-2020', 'Semana 23(2)', 'Indheca', '2020-06-10 18:10:34', '2020-06-20 16:35:29', NULL),
(42, '13-06-2020', 'Semana 24(1)', 'Indheca', '2020-06-20 16:37:07', '2020-06-20 16:37:07', NULL),
(43, '13-06-2020', 'Semana 24(2)', 'Indheca', '2020-06-20 16:46:35', '2020-06-20 16:46:35', NULL),
(44, '20-06-2020', 'Semana 25(1)', 'Indheca', '2020-06-20 18:24:13', '2020-06-20 18:24:13', NULL),
(45, '20-06-2020', 'Semana 25(2)', 'Indheca', '2020-06-22 22:43:57', '2020-06-22 22:43:57', NULL),
(46, '27/06/2020', 'Semana 26 (1) ', 'Indheca', '2020-07-06 15:31:35', '2020-07-06 15:31:35', NULL),
(47, '27-06-2020', 'Semana 26(2)', 'Indheca', '2020-07-06 15:56:07', '2020-07-06 15:56:07', NULL),
(48, '04-07-2020', 'Semana 27 (1)', 'Indheca', '2020-07-13 15:20:38', '2020-07-13 15:20:38', NULL),
(49, '04-07-2020', 'Semana 27 (2)', 'Indheca', '2020-07-13 15:29:12', '2020-07-13 15:29:12', NULL),
(50, '14-07-2020', 'Semana 27 complemento', 'Indheca', '2020-07-20 15:46:36', '2020-07-20 15:46:36', NULL),
(51, '11-07-2020', 'Semana 28 (1)', 'Indheca', '2020-07-20 15:50:54', '2020-07-20 15:50:54', NULL),
(52, '11-07-2020', 'Semana 28 (2)', 'Indheca', '2020-07-20 15:55:12', '2020-07-20 15:55:12', NULL),
(53, '16-07-2020', 'Semana 28 complemento (1)', 'Indheca', '2020-07-20 15:56:17', '2020-07-20 15:59:54', NULL),
(54, '16-07-2020', 'Semana 28 complemento (2)', 'Indheca', '2020-07-20 15:59:23', '2020-07-20 16:00:08', NULL),
(55, '18-07-2020', 'Semana 29 (1)', 'Indheca', '2020-07-27 16:59:47', '2020-07-27 16:59:47', NULL),
(56, '18-07-2020', 'Semana 29 (2)', 'Indheca', '2020-07-27 17:04:46', '2020-07-27 17:04:46', NULL),
(57, '25-07-2020', 'Semana 30 (1)', 'Indheca', '2020-08-10 15:41:06', '2020-08-10 15:41:06', NULL),
(58, '25-07-2020', 'Semana 30 (2)', 'Indheca', '2020-08-10 15:49:43', '2020-08-10 15:58:39', NULL),
(59, '01-08-2020', 'Semana 31 (1)', 'Indheca', '2020-08-10 15:52:31', '2020-08-10 15:52:31', NULL),
(60, '01-08-2020', 'Semana 31 (2)', 'Indheca', '2020-08-10 15:58:17', '2020-08-10 15:58:17', NULL),
(61, '08-08-2020', 'Semana 32 (1)', 'Indheca', '2020-08-10 16:00:39', '2020-08-10 16:00:39', NULL),
(62, '08-08-2020', 'Semana 32 (2)', 'Indheca', '2020-08-10 16:05:59', '2020-08-10 16:05:59', NULL),
(63, '15-08-2020', 'Semana 33(1)', 'Indheca', '2020-09-03 17:31:44', '2020-09-03 17:31:44', NULL),
(64, '15-08-2020', 'Semana 33(2)', 'Indheca', '2020-09-03 17:37:30', '2020-09-03 17:37:30', NULL),
(65, '22-08-2020', 'Semana 34(1)', 'Indheca', '2020-09-03 17:39:09', '2020-09-03 17:39:09', NULL),
(66, '22-08-2020', 'Semana 34(2)', 'Indheca', '2020-09-03 17:44:04', '2020-09-03 17:44:04', NULL),
(67, '29-08-2020', 'Semana 35(1)', 'Indheca', '2020-09-03 17:45:52', '2020-09-03 17:45:52', NULL),
(68, '29-08-2020', 'Semana 35(2)', 'Indheca', '2020-09-03 17:49:24', '2020-09-03 17:49:24', NULL),
(69, '05-09-2020', 'Semana 36(1)', 'Indheca', '2020-09-10 22:52:16', '2020-09-10 22:52:16', NULL),
(70, '05-09-2020', 'Semana 36(2)', 'Indheca', '2020-09-10 22:53:55', '2020-09-10 22:53:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nomina_dispersion`
--

CREATE TABLE `nomina_dispersion` (
  `id` int(10) UNSIGNED NOT NULL,
  `nomina_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `file_url` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `nomina_dispersion`
--

INSERT INTO `nomina_dispersion` (`id`, `nomina_id`, `name`, `file_url`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 'Acuse_Certificado_Digital.pdf', '462_1581190477.pdf', '2020-02-08 19:34:37', '2020-02-08 19:34:37', NULL),
(2, 1, 'ABERLAY LEON 070220.pdf', '110_1581355035.pdf', '2020-02-10 17:17:15', '2020-02-10 17:17:15', NULL),
(3, 1, 'ALEJANDRO RETAMA 070220.pdf', '106_1581355035.pdf', '2020-02-10 17:17:15', '2020-02-10 17:17:15', NULL),
(4, 1, 'AURELIO ZAPO 070220.pdf', '478_1581355035.pdf', '2020-02-10 17:17:15', '2020-02-10 17:17:15', NULL),
(5, 1, 'CONCEPCION JIMENEZ 070220.pdf', '121_1581355035.pdf', '2020-02-10 17:17:15', '2020-02-10 17:17:15', NULL),
(6, 1, 'DANIEL C HDEZ 070220.pdf', '335_1581355035.pdf', '2020-02-10 17:17:15', '2020-02-10 17:17:15', NULL),
(7, 1, 'DANIEL I FERNANDEZ 070220.pdf', '301_1581355035.pdf', '2020-02-10 17:17:15', '2020-02-10 17:17:15', NULL),
(8, 1, 'EVARISTO MENDOZA 070220.pdf', '214_1581355035.pdf', '2020-02-10 17:17:15', '2020-02-10 17:17:15', NULL),
(9, 1, 'FERNANDO ANTONIO 070220.pdf', '426_1581355035.pdf', '2020-02-10 17:17:15', '2020-02-10 17:17:15', NULL),
(10, 1, 'HUGO A BOLAÑOS 070220.pdf', '437_1581355035.pdf', '2020-02-10 17:17:15', '2020-02-10 17:17:15', NULL),
(11, 1, 'IGNACIO MURILLO 070220.pdf', '36_1581355035.pdf', '2020-02-10 17:17:15', '2020-02-10 17:17:15', NULL),
(12, 1, 'ISMAEL RENERO 070220.pdf', '490_1581355035.pdf', '2020-02-10 17:17:15', '2020-02-10 17:17:15', NULL),
(13, 1, 'JAIME R NOLASCO 070220.pdf', '292_1581355035.pdf', '2020-02-10 17:17:15', '2020-02-10 17:17:15', NULL),
(14, 1, 'JESUS A GUILLEN 070220.pdf', '165_1581355035.pdf', '2020-02-10 17:17:15', '2020-02-10 17:17:15', NULL),
(15, 1, 'JOSE DE LOS SANTOS 070220.pdf', '368_1581355035.pdf', '2020-02-10 17:17:15', '2020-02-10 17:17:15', NULL),
(16, 1, 'JOSE L VERGARA 070220.pdf', '6_1581355035.pdf', '2020-02-10 17:17:15', '2020-02-10 17:17:15', NULL),
(17, 1, 'LAYOUT SEM06 070220.pdf', '23_1581355035.pdf', '2020-02-10 17:17:15', '2020-02-10 17:17:15', NULL),
(18, 1, 'MARCO A PAEZ 070220.pdf', '126_1581355035.pdf', '2020-02-10 17:17:15', '2020-02-10 17:17:15', NULL),
(19, 1, 'MARCOS LOPEZ 070220.pdf', '216_1581355035.pdf', '2020-02-10 17:17:15', '2020-02-10 17:17:15', NULL),
(20, 1, 'MARTIN ANOTA 070220.pdf', '173_1581355035.pdf', '2020-02-10 17:17:15', '2020-02-10 17:17:15', NULL),
(21, 1, 'ROBERTO FLORES 070220.pdf', '293_1581355035.pdf', '2020-02-10 17:17:15', '2020-02-10 17:17:15', NULL),
(22, 2, 'ABERLAY LEON 070220.pdf', '243_1581356174.pdf', '2020-02-10 17:36:14', '2020-02-10 17:36:14', NULL),
(23, 2, 'ALBERTO OBIL 070220.pdf', '56_1581356174.pdf', '2020-02-10 17:36:14', '2020-02-10 17:36:14', NULL),
(24, 2, 'ALEJANDRO RETAMA 070220.pdf', '392_1581356174.pdf', '2020-02-10 17:36:14', '2020-02-10 17:36:14', NULL),
(25, 2, 'ALEJANDRO RIOS 070220.pdf', '250_1581356174.pdf', '2020-02-10 17:36:14', '2020-02-10 17:36:14', NULL),
(26, 2, 'ALFREDO XOLO 070220.pdf', '141_1581356174.pdf', '2020-02-10 17:36:14', '2020-02-10 17:36:14', NULL),
(27, 2, 'ALONSO LOPEZ 070220.pdf', '431_1581356174.pdf', '2020-02-10 17:36:14', '2020-02-10 17:36:14', NULL),
(28, 2, 'ANTONIO ESCRIBANO 070220.pdf', '493_1581356174.pdf', '2020-02-10 17:36:14', '2020-02-10 17:36:14', NULL),
(29, 2, 'AUGUSTO HERNANDEZ 07020.pdf', '330_1581356174.pdf', '2020-02-10 17:36:14', '2020-02-10 17:36:14', NULL),
(30, 2, 'AURELIO ZAPO 070220.pdf', '115_1581356174.pdf', '2020-02-10 17:36:14', '2020-02-10 17:36:14', NULL),
(31, 2, 'BENITO HUESCA 070220.pdf', '224_1581356174.pdf', '2020-02-10 17:36:14', '2020-02-10 17:36:14', NULL),
(32, 2, 'CELESTINO VILLANUEVA 070220.pdf', '409_1581356174.pdf', '2020-02-10 17:36:14', '2020-02-10 17:36:14', NULL),
(33, 2, 'CONCEPCION JIMENEZ 07020 SEM04.pdf', '272_1581356174.pdf', '2020-02-10 17:36:14', '2020-02-10 17:36:14', NULL),
(34, 2, 'DANIEL C HDEZ 070220.pdf', '454_1581356174.pdf', '2020-02-10 17:36:14', '2020-02-10 17:36:14', NULL),
(35, 2, 'DANIEL I FERNANDEZ 070220.pdf', '146_1581356174.pdf', '2020-02-10 17:36:14', '2020-02-10 17:36:14', NULL),
(36, 2, 'DENI JIMENEZ 070220.pdf', '283_1581356174.pdf', '2020-02-10 17:36:14', '2020-02-10 17:36:14', NULL),
(37, 2, 'ERICK G TORNADO 070220.pdf', '316_1581356174.pdf', '2020-02-10 17:36:14', '2020-02-10 17:36:14', NULL),
(38, 2, 'EVARISTO MENDOZA 070220.pdf', '466_1581356174.pdf', '2020-02-10 17:36:14', '2020-02-10 17:36:14', NULL),
(39, 2, 'FERNANDO ANTONIO 07020.pdf', '342_1581356174.pdf', '2020-02-10 17:36:14', '2020-02-10 17:36:14', NULL),
(40, 2, 'FRANCISCO DOLORES 070220.pdf', '194_1581356174.pdf', '2020-02-10 17:36:14', '2020-02-10 17:36:14', NULL),
(41, 2, 'FRNACISCO J RUIZ 070220.pdf', '282_1581356175.pdf', '2020-02-10 17:36:15', '2020-02-10 17:36:15', NULL),
(42, 3, 'ABERLAY LEON 310120.pdf', '278_1581370277.pdf', '2020-02-10 21:31:17', '2020-02-10 21:31:17', NULL),
(43, 3, 'ALEJANDRO RETAMA 310120.pdf', '197_1581370277.pdf', '2020-02-10 21:31:17', '2020-02-10 21:31:17', NULL),
(44, 3, 'AURELIO ZAPO 310120.pdf', '250_1581370277.pdf', '2020-02-10 21:31:17', '2020-02-10 21:31:17', NULL),
(45, 3, 'BBVA SEM 05.pdf', '415_1581370277.pdf', '2020-02-10 21:31:17', '2020-02-10 21:31:17', NULL),
(46, 3, 'CONCEPCION JIMENEZ 310120.pdf', '355_1581370277.pdf', '2020-02-10 21:31:17', '2020-02-10 21:31:17', NULL),
(47, 3, 'DANIEL C HERNANDEZ 310120.pdf', '459_1581370277.pdf', '2020-02-10 21:31:17', '2020-02-10 21:31:17', NULL),
(48, 3, 'DANIEL I FERNANDEZ 310120.pdf', '378_1581370277.pdf', '2020-02-10 21:31:17', '2020-02-10 21:31:17', NULL),
(49, 3, 'DAVID PENA 310120.pdf', '405_1581370277.pdf', '2020-02-10 21:31:17', '2020-02-10 21:31:17', NULL),
(50, 3, 'FERNANDO ANTONIO 310120.pdf', '139_1581370277.pdf', '2020-02-10 21:31:17', '2020-02-10 21:31:17', NULL),
(51, 3, 'HUGO A BOLAÑOS 310120.pdf', '447_1581370277.pdf', '2020-02-10 21:31:17', '2020-02-10 21:31:17', NULL),
(52, 3, 'ISMAEL RENERO 310120.pdf', '300_1581370277.pdf', '2020-02-10 21:31:17', '2020-02-10 21:31:17', NULL),
(53, 3, 'JAIME R NOLASCO 310120.pdf', '457_1581370277.pdf', '2020-02-10 21:31:17', '2020-02-10 21:31:17', NULL),
(54, 3, 'JESUS A GUILLEN 310120.pdf', '434_1581370277.pdf', '2020-02-10 21:31:17', '2020-02-10 21:31:17', NULL),
(55, 3, 'JOSE L VERGARA 310120.pdf', '486_1581370277.pdf', '2020-02-10 21:31:17', '2020-02-10 21:31:17', NULL),
(56, 3, 'JUAN C GARCIA 310120.pdf', '53_1581370277.pdf', '2020-02-10 21:31:17', '2020-02-10 21:31:17', NULL),
(57, 3, 'MARCOS LOPEZ 310120.pdf', '341_1581370277.pdf', '2020-02-10 21:31:17', '2020-02-10 21:31:17', NULL),
(58, 3, 'MARTIN ANOTA 310120.pdf', '117_1581370277.pdf', '2020-02-10 21:31:17', '2020-02-10 21:31:17', NULL),
(59, 3, 'RAYMUNDO LOPEZ 310120.pdf', '168_1581370277.pdf', '2020-02-10 21:31:17', '2020-02-10 21:31:17', NULL),
(60, 3, 'ROBERTO FLORES 310120.pdf', '268_1581370277.pdf', '2020-02-10 21:31:17', '2020-02-10 21:31:17', NULL),
(61, 4, 'ABERLAY LEON 310120.pdf', '55_1581371619.pdf', '2020-02-10 21:53:39', '2020-02-10 21:53:39', NULL),
(62, 4, 'ALBERTO OBIL 310120.pdf', '90_1581371619.pdf', '2020-02-10 21:53:39', '2020-02-10 21:53:39', NULL),
(63, 4, 'ALEJANDRO RETAMA 310120.pdf', '426_1581371619.pdf', '2020-02-10 21:53:39', '2020-02-10 21:53:39', NULL),
(64, 4, 'ALEJANDRO RIOS 310120.pdf', '425_1581371619.pdf', '2020-02-10 21:53:39', '2020-02-10 21:53:39', NULL),
(65, 4, 'ALFREDO XOLO 310120.pdf', '184_1581371619.pdf', '2020-02-10 21:53:39', '2020-02-10 21:53:39', NULL),
(66, 4, 'ALONSO LOPEZ 310120.pdf', '286_1581371619.pdf', '2020-02-10 21:53:39', '2020-02-10 21:53:39', NULL),
(67, 4, 'ANTONIO ESCRIBANO 310120.pdf', '265_1581371619.pdf', '2020-02-10 21:53:39', '2020-02-10 21:53:39', NULL),
(68, 4, 'AURELIO ZAPO 310120.pdf', '448_1581371619.pdf', '2020-02-10 21:53:39', '2020-02-10 21:53:39', NULL),
(69, 4, 'BENITO HUESCA 310120.pdf', '116_1581371619.pdf', '2020-02-10 21:53:39', '2020-02-10 21:53:39', NULL),
(70, 4, 'CELESTINO VILLANUEVA 310120.pdf', '265_1581371619.pdf', '2020-02-10 21:53:39', '2020-02-10 21:53:39', NULL),
(71, 4, 'CONCEPCION JIMENEZ 310120.pdf', '33_1581371619.pdf', '2020-02-10 21:53:39', '2020-02-10 21:53:39', NULL),
(72, 4, 'DANIEL C HERNANDEZ 310120.pdf', '218_1581371619.pdf', '2020-02-10 21:53:39', '2020-02-10 21:53:39', NULL),
(73, 4, 'DANIEL I FERNANDEZ 310120.pdf', '259_1581371619.pdf', '2020-02-10 21:53:39', '2020-02-10 21:53:39', NULL),
(74, 4, 'DAVID PENA 310120.pdf', '61_1581371619.pdf', '2020-02-10 21:53:39', '2020-02-10 21:53:39', NULL),
(75, 4, 'DENI JIMENEZ 310120.pdf', '391_1581371619.pdf', '2020-02-10 21:53:39', '2020-02-10 21:53:39', NULL),
(76, 4, 'ERICK TORNADO 310120.pdf', '219_1581371619.pdf', '2020-02-10 21:53:39', '2020-02-10 21:53:39', NULL),
(77, 4, 'FERNANDO ANTONIO 310120.pdf', '125_1581371619.pdf', '2020-02-10 21:53:39', '2020-02-10 21:53:39', NULL),
(78, 4, 'FRANCISCO DOLORES 310120.pdf', '390_1581371619.pdf', '2020-02-10 21:53:39', '2020-02-10 21:53:39', NULL),
(79, 4, 'FRANCISCO RUIZ 310120.pdf', '110_1581371619.pdf', '2020-02-10 21:53:39', '2020-02-10 21:53:39', NULL),
(80, 4, 'HECTOR MOLINA 310120.pdf', '491_1581371619.pdf', '2020-02-10 21:53:39', '2020-02-10 21:53:39', NULL),
(81, 5, 'ABERLAY LEON 240120.pdf', '372_1581372598.pdf', '2020-02-10 22:09:58', '2020-02-10 22:09:58', NULL),
(82, 5, 'ALEJANDRO RETAMA 240120.pdf', '225_1581372598.pdf', '2020-02-10 22:09:58', '2020-02-10 22:09:58', NULL),
(83, 5, 'AURELIO ZAPO 240120.pdf', '144_1581372598.pdf', '2020-02-10 22:09:58', '2020-02-10 22:09:58', NULL),
(84, 5, 'BBVA SEM04.pdf', '385_1581372598.pdf', '2020-02-10 22:09:58', '2020-02-10 22:09:58', NULL),
(85, 5, 'DANIEL C HERNANDEZ 240120.pdf', '137_1581372598.pdf', '2020-02-10 22:09:58', '2020-02-10 22:09:58', NULL),
(86, 5, 'DANIEL I FERNANDEZ 240120.pdf', '480_1581372598.pdf', '2020-02-10 22:09:58', '2020-02-10 22:09:58', NULL),
(87, 5, 'DAVID PENA 240120.pdf', '1_1581372598.pdf', '2020-02-10 22:09:58', '2020-02-10 22:09:58', NULL),
(88, 5, 'DENI JIMENEZ 240120.pdf', '312_1581372598.pdf', '2020-02-10 22:09:58', '2020-02-10 22:09:58', NULL),
(89, 5, 'FERNANDO ANTONIO 240120.pdf', '351_1581372598.pdf', '2020-02-10 22:09:58', '2020-02-10 22:09:58', NULL),
(90, 5, 'FRANCISCO J RUIZ 250120.pdf', '175_1581372598.pdf', '2020-02-10 22:09:58', '2020-02-10 22:09:58', NULL),
(91, 5, 'HUGO A BOLAÑOS 240120.pdf', '329_1581372598.pdf', '2020-02-10 22:09:58', '2020-02-10 22:09:58', NULL),
(92, 5, 'ISAAC CRISOSTOMO 240120.pdf', '437_1581372598.pdf', '2020-02-10 22:09:58', '2020-02-10 22:09:58', NULL),
(93, 5, 'ISMAEL RENERO 240120.pdf', '264_1581372598.pdf', '2020-02-10 22:09:58', '2020-02-10 22:09:58', NULL),
(94, 5, 'JAIME R NOLASCO 240120.pdf', '56_1581372598.pdf', '2020-02-10 22:09:58', '2020-02-10 22:09:58', NULL),
(95, 5, 'JESUS A GUILLEN 240120.pdf', '229_1581372598.pdf', '2020-02-10 22:09:58', '2020-02-10 22:09:58', NULL),
(96, 5, 'JIMMY HUMBERTO 270120.pdf', '447_1581372598.pdf', '2020-02-10 22:09:58', '2020-02-10 22:09:58', NULL),
(97, 5, 'JOSE L VERGARA 240120.pdf', '62_1581372598.pdf', '2020-02-10 22:09:58', '2020-02-10 22:09:58', NULL),
(98, 5, 'MARTIN ANOTA 240120.pdf', '341_1581372598.pdf', '2020-02-10 22:09:58', '2020-02-10 22:09:58', NULL),
(99, 5, 'RAYMUNDO LOPEZ 240120.pdf', '135_1581372598.pdf', '2020-02-10 22:09:58', '2020-02-10 22:09:58', NULL),
(100, 5, 'ROBERTO FLORES 240120.pdf', '119_1581372598.pdf', '2020-02-10 22:09:58', '2020-02-10 22:09:58', NULL),
(101, 6, 'ABERLAY LEON 240120.pdf', '450_1581373857.pdf', '2020-02-10 22:30:57', '2020-02-10 22:30:57', NULL),
(102, 6, 'ALBERTO OBIL 240120.pdf', '133_1581373857.pdf', '2020-02-10 22:30:57', '2020-02-10 22:30:57', NULL),
(103, 6, 'ALEJANDRO RETAMA 240120.pdf', '199_1581373857.pdf', '2020-02-10 22:30:57', '2020-02-10 22:30:57', NULL),
(104, 6, 'ALFREDO XOLO 240120.pdf', '421_1581373857.pdf', '2020-02-10 22:30:57', '2020-02-10 22:30:57', NULL),
(105, 6, 'ALEJANDRO RIOS 240120.pdf', '165_1581373857.pdf', '2020-02-10 22:30:57', '2020-02-10 22:30:57', NULL),
(106, 6, 'ALONSO LOPEZ 240120.pdf', '219_1581373857.pdf', '2020-02-10 22:30:57', '2020-02-10 22:30:57', NULL),
(107, 6, 'AURELIO ZAPO 240120.pdf', '460_1581373857.pdf', '2020-02-10 22:30:57', '2020-02-10 22:30:57', NULL),
(108, 6, 'BENITO HUESCA 240120.pdf', '93_1581373857.pdf', '2020-02-10 22:30:57', '2020-02-10 22:30:57', NULL),
(109, 6, 'CELESTINO VILLANUEVA 240120.pdf', '239_1581373857.pdf', '2020-02-10 22:30:57', '2020-02-10 22:30:57', NULL),
(110, 6, 'DANIEL C HERNANDEZ 240120.pdf', '324_1581373857.pdf', '2020-02-10 22:30:57', '2020-02-10 22:30:57', NULL),
(111, 6, 'DAVID PENA 240120.pdf', '483_1581373857.pdf', '2020-02-10 22:30:57', '2020-02-10 22:30:57', NULL),
(112, 6, 'DENI JIMENEZ 240120.pdf', '66_1581373857.pdf', '2020-02-10 22:30:57', '2020-02-10 22:30:57', NULL),
(113, 6, 'ERICK G TORNADO 240120.pdf', '428_1581373857.pdf', '2020-02-10 22:30:57', '2020-02-10 22:30:57', NULL),
(114, 6, 'FERNANDO ANTONIO 240120.pdf', '186_1581373857.pdf', '2020-02-10 22:30:57', '2020-02-10 22:30:57', NULL),
(115, 6, 'FERNANDO MAYO 240120.pdf', '125_1581373857.pdf', '2020-02-10 22:30:57', '2020-02-10 22:30:57', NULL),
(116, 6, 'FRANCISCO DOLORES 240120.pdf', '75_1581373857.pdf', '2020-02-10 22:30:57', '2020-02-10 22:30:57', NULL),
(117, 6, 'FRANCISCO J RUIZ 240120.pdf', '412_1581373857.pdf', '2020-02-10 22:30:57', '2020-02-10 22:30:57', NULL),
(118, 6, 'HECTOR MOLINA 240120.pdf', '83_1581373857.pdf', '2020-02-10 22:30:57', '2020-02-10 22:30:57', NULL),
(119, 6, 'HILARIO MOZO 240120.pdf', '334_1581373857.pdf', '2020-02-10 22:30:57', '2020-02-10 22:30:57', NULL),
(120, 6, 'HUGO A BOLAÑOS 240120.pdf', '431_1581373857.pdf', '2020-02-10 22:30:57', '2020-02-10 22:30:57', NULL),
(121, 7, 'ABERLAY LEON 170120.pdf', '399_1581374871.pdf', '2020-02-10 22:47:51', '2020-02-10 22:47:51', NULL),
(122, 7, 'ALBERTO OBIL 170120.pdf', '372_1581374871.pdf', '2020-02-10 22:47:51', '2020-02-10 22:47:51', NULL),
(123, 7, 'ALEJANDRO RETAMA 170120.pdf', '378_1581374871.pdf', '2020-02-10 22:47:51', '2020-02-10 22:47:51', NULL),
(124, 7, 'ALEJANDRO RIOS 170120.pdf', '182_1581374871.pdf', '2020-02-10 22:47:51', '2020-02-10 22:47:51', NULL),
(125, 7, 'ALFREDO XOLO 170120.pdf', '151_1581374871.pdf', '2020-02-10 22:47:51', '2020-02-10 22:47:51', NULL),
(126, 7, 'ALONSO LOPEZ 170120.pdf', '379_1581374871.pdf', '2020-02-10 22:47:51', '2020-02-10 22:47:51', NULL),
(127, 7, 'AURELIO ZAPO 170120.pdf', '175_1581374871.pdf', '2020-02-10 22:47:51', '2020-02-10 22:47:51', NULL),
(128, 7, 'BENITO HUESCA 170120.pdf', '376_1581374871.pdf', '2020-02-10 22:47:51', '2020-02-10 22:47:51', NULL),
(129, 7, 'CELESTINO VILLANUEVA 170120.pdf', '481_1581374871.pdf', '2020-02-10 22:47:51', '2020-02-10 22:47:51', NULL),
(130, 7, 'DANIEL C HERNANDEZ 170120.pdf', '217_1581374871.pdf', '2020-02-10 22:47:51', '2020-02-10 22:47:51', NULL),
(131, 7, 'DANIEL I FERNANDEZ 170120.pdf', '399_1581374871.pdf', '2020-02-10 22:47:51', '2020-02-10 22:47:51', NULL),
(132, 7, 'ERICK G TORNADO 170120.pdf', '500_1581374871.pdf', '2020-02-10 22:47:51', '2020-02-10 22:47:51', NULL),
(133, 7, 'FERNANDO ANTONIO 170120.pdf', '140_1581374871.pdf', '2020-02-10 22:47:51', '2020-02-10 22:47:51', NULL),
(134, 7, 'FERNANDO MAYO 170120.pdf', '429_1581374871.pdf', '2020-02-10 22:47:51', '2020-02-10 22:47:51', NULL),
(135, 7, 'FRANCISCO DOLORES 170120.pdf', '9_1581374871.pdf', '2020-02-10 22:47:51', '2020-02-10 22:47:51', NULL),
(136, 7, 'FRANCISCO J RUIZ 170120.pdf', '209_1581374871.pdf', '2020-02-10 22:47:51', '2020-02-10 22:47:51', NULL),
(137, 7, 'GUILLERMO S CELAYA 170120.pdf', '418_1581374871.pdf', '2020-02-10 22:47:51', '2020-02-10 22:47:51', NULL),
(138, 7, 'HECTOR M GUZMAN 170120.pdf', '208_1581374871.pdf', '2020-02-10 22:47:51', '2020-02-10 22:47:51', NULL),
(139, 7, 'HECTOR MOLINA 170120.pdf', '393_1581374871.pdf', '2020-02-10 22:47:51', '2020-02-10 22:47:51', NULL),
(140, 7, 'HILARIO MOZO 170120.pdf', '387_1581374871.pdf', '2020-02-10 22:47:51', '2020-02-10 22:47:51', NULL),
(141, 8, 'ALBERTO OBIL 100120.pdf', '206_1581528248.pdf', '2020-02-12 17:24:08', '2020-02-12 17:24:08', NULL),
(142, 8, 'ALEJANDRO RETAMA 100120.pdf', '265_1581528248.pdf', '2020-02-12 17:24:08', '2020-02-12 17:24:08', NULL),
(143, 8, 'ALEJANDRO RIOS 100120.pdf', '432_1581528248.pdf', '2020-02-12 17:24:08', '2020-02-12 17:24:08', NULL),
(144, 8, 'ALFREDO XOLO 100120.pdf', '136_1581528248.pdf', '2020-02-12 17:24:08', '2020-02-12 17:24:08', NULL),
(145, 8, 'ALONSO LOPEZ 100120.pdf', '235_1581528248.pdf', '2020-02-12 17:24:08', '2020-02-12 17:24:08', NULL),
(146, 8, 'AURELIO ZAPO 100120.pdf', '44_1581528248.pdf', '2020-02-12 17:24:08', '2020-02-12 17:24:08', NULL),
(147, 8, 'BENITO HUESCA 100120.pdf', '436_1581528248.pdf', '2020-02-12 17:24:08', '2020-02-12 17:24:08', NULL),
(148, 8, 'CELESTINO VILLANUEVA 100120.pdf', '447_1581528248.pdf', '2020-02-12 17:24:08', '2020-02-12 17:24:08', NULL),
(149, 8, 'DANIEL C HDEZ 100120.pdf', '155_1581528248.pdf', '2020-02-12 17:24:08', '2020-02-12 17:24:08', NULL),
(150, 8, 'DANIEL I FERNANDEZ 100120.pdf', '275_1581528248.pdf', '2020-02-12 17:24:08', '2020-02-12 17:24:08', NULL),
(151, 8, 'ERICK G TORNADO 100120.pdf', '359_1581528248.pdf', '2020-02-12 17:24:08', '2020-02-12 17:24:08', NULL),
(152, 8, 'FERNANDO ANTONIO100120.pdf', '381_1581528248.pdf', '2020-02-12 17:24:08', '2020-02-12 17:24:08', NULL),
(153, 8, 'FERNANDO MAYO 100120.pdf', '22_1581528248.pdf', '2020-02-12 17:24:08', '2020-02-12 17:24:08', NULL),
(154, 8, 'FRANCISCO DOLORES 100120.pdf', '158_1581528248.pdf', '2020-02-12 17:24:08', '2020-02-12 17:24:08', NULL),
(155, 8, 'FRANCISCO J RUIZ 100120.pdf', '248_1581528248.pdf', '2020-02-12 17:24:08', '2020-02-12 17:24:08', NULL),
(156, 8, 'HECTOR M GUZMAN 100120.pdf', '348_1581528248.pdf', '2020-02-12 17:24:08', '2020-02-12 17:24:08', NULL),
(157, 8, 'HECTOR MOLINA 100120.pdf', '65_1581528248.pdf', '2020-02-12 17:24:08', '2020-02-12 17:24:08', NULL),
(158, 8, 'HILARIO MOZO 100120.pdf', '472_1581528248.pdf', '2020-02-12 17:24:08', '2020-02-12 17:24:08', NULL),
(159, 8, 'HUGO A BOLAÑOS 100120 (2).pdf', '271_1581528248.pdf', '2020-02-12 17:24:08', '2020-02-12 17:24:08', NULL),
(160, 8, 'IGNACIO M TENORIO 100120.pdf', '176_1581528248.pdf', '2020-02-12 17:24:08', '2020-02-12 17:24:08', NULL),
(161, 9, 'ALBERTO OBIL 030120.pdf', '261_1581535942.pdf', '2020-02-12 19:32:22', '2020-02-12 19:32:22', NULL),
(162, 9, 'ALEJANDRO RETAMA 030120.pdf', '224_1581535942.pdf', '2020-02-12 19:32:22', '2020-02-12 19:32:22', NULL),
(163, 9, 'ALEJANDRO RIOS 030120.pdf', '362_1581535942.pdf', '2020-02-12 19:32:22', '2020-02-12 19:32:22', NULL),
(164, 9, 'ALFREDO XOLO 030120.pdf', '366_1581535942.pdf', '2020-02-12 19:32:22', '2020-02-12 19:32:22', NULL),
(165, 9, 'ALONSO LOPEZ 030120.pdf', '284_1581535942.pdf', '2020-02-12 19:32:22', '2020-02-12 19:32:22', NULL),
(166, 9, 'AURELIO ZAPO 030120.pdf', '290_1581535942.pdf', '2020-02-12 19:32:22', '2020-02-12 19:32:22', NULL),
(167, 9, 'BENITO HUESCA 030120.pdf', '34_1581535942.pdf', '2020-02-12 19:32:22', '2020-02-12 19:32:22', NULL),
(168, 9, 'CARLOS A MAYO 030120.pdf', '147_1581535942.pdf', '2020-02-12 19:32:22', '2020-02-12 19:32:22', NULL),
(169, 9, 'CELESTINO VILLANUEVA 030120.pdf', '36_1581535942.pdf', '2020-02-12 19:32:22', '2020-02-12 19:32:22', NULL),
(170, 9, 'DANIEL C HDEZ 030120.pdf', '265_1581535942.pdf', '2020-02-12 19:32:22', '2020-02-12 19:32:22', NULL),
(171, 9, 'DANIEL I FERNANDEZ 030120.pdf', '253_1581535942.pdf', '2020-02-12 19:32:22', '2020-02-12 19:32:22', NULL),
(172, 9, 'ERICK G TORNADO 030120.pdf', '323_1581535942.pdf', '2020-02-12 19:32:22', '2020-02-12 19:32:22', NULL),
(173, 9, 'FERNANDO ANTONIO 030120.pdf', '377_1581535942.pdf', '2020-02-12 19:32:22', '2020-02-12 19:32:22', NULL),
(174, 9, 'FERNANDO MAYO 030120.pdf', '454_1581535942.pdf', '2020-02-12 19:32:22', '2020-02-12 19:32:22', NULL),
(175, 9, 'FRANCISCO DOLORES 030120.pdf', '288_1581535942.pdf', '2020-02-12 19:32:22', '2020-02-12 19:32:22', NULL),
(176, 9, 'FRANCISCO J RUIZ 030120.pdf', '310_1581535942.pdf', '2020-02-12 19:32:22', '2020-02-12 19:32:22', NULL),
(177, 9, 'GUILLERMO S CELAYA 030120.pdf', '492_1581535942.pdf', '2020-02-12 19:32:22', '2020-02-12 19:32:22', NULL),
(178, 9, 'HECTOR  M GUZMAN 030120.pdf', '142_1581535942.pdf', '2020-02-12 19:32:22', '2020-02-12 19:32:22', NULL),
(179, 9, 'HECTOR MOLINA 030120.pdf', '486_1581535942.pdf', '2020-02-12 19:32:22', '2020-02-12 19:32:22', NULL),
(180, 9, 'HILARIO MOZO 030120.pdf', '226_1581535942.pdf', '2020-02-12 19:32:22', '2020-02-12 19:32:22', NULL),
(181, 10, 'ABERLAY LEON 170220.pdf', '338_1581981764.pdf', '2020-02-17 23:22:44', '2020-02-17 23:22:44', NULL),
(182, 10, 'ALBERTO OBIL 170220.pdf', '119_1581981764.pdf', '2020-02-17 23:22:44', '2020-02-17 23:22:44', NULL),
(183, 10, 'ALEJANDRO RETAMA 170220.pdf', '470_1581981764.pdf', '2020-02-17 23:22:44', '2020-02-17 23:22:44', NULL),
(184, 10, 'ALEJANDRO RIOS 170220.pdf', '38_1581981764.pdf', '2020-02-17 23:22:44', '2020-02-17 23:22:44', NULL),
(185, 10, 'ALFREDO XOLO 170220.pdf', '126_1581981764.pdf', '2020-02-17 23:22:44', '2020-02-17 23:22:44', NULL),
(186, 10, 'ALONSO LOPEZ 170220.pdf', '428_1581981764.pdf', '2020-02-17 23:22:44', '2020-02-17 23:22:44', NULL),
(187, 10, 'ANTONIO ESCRIBANO 170220.pdf', '203_1581981764.pdf', '2020-02-17 23:22:44', '2020-02-17 23:22:44', NULL),
(188, 10, 'AUGUSTO HDEZ 170220.pdf', '335_1581981764.pdf', '2020-02-17 23:22:44', '2020-02-17 23:22:44', NULL),
(189, 10, 'AURELIO ZAPO 170220.pdf', '481_1581981764.pdf', '2020-02-17 23:22:44', '2020-02-17 23:22:44', NULL),
(190, 10, 'BENITO HUESCA 170220.pdf', '456_1581981764.pdf', '2020-02-17 23:22:44', '2020-02-17 23:22:44', NULL),
(191, 10, 'CELESTINO VILLANUEVA 170220.pdf', '405_1581981764.pdf', '2020-02-17 23:22:44', '2020-02-17 23:22:44', NULL),
(192, 10, 'CONCEPCION JIMENEZ 170220.pdf', '463_1581981764.pdf', '2020-02-17 23:22:44', '2020-02-17 23:22:44', NULL),
(193, 10, 'DANIEL C HDEZ 170220.pdf', '20_1581981764.pdf', '2020-02-17 23:22:45', '2020-02-17 23:22:45', NULL),
(194, 10, 'DANIEL I FDEZ 170220.pdf', '71_1581981765.pdf', '2020-02-17 23:22:45', '2020-02-17 23:22:45', NULL),
(195, 10, 'DENI JIMENEZ 170220.pdf', '460_1581981765.pdf', '2020-02-17 23:22:45', '2020-02-17 23:22:45', NULL),
(196, 10, 'ERICK G TORNADO 170220.pdf', '108_1581981765.pdf', '2020-02-17 23:22:45', '2020-02-17 23:22:45', NULL),
(197, 10, 'FERNANDO ANTONIO 170220.pdf', '156_1581981765.pdf', '2020-02-17 23:22:45', '2020-02-17 23:22:45', NULL),
(198, 10, 'FERNANDO MAYO 170220.pdf', '169_1581981765.pdf', '2020-02-17 23:22:45', '2020-02-17 23:22:45', NULL),
(199, 10, 'FRANCISCO DOLORES 170220.pdf', '216_1581981765.pdf', '2020-02-17 23:22:45', '2020-02-17 23:22:45', NULL),
(200, 10, 'FRANCISCO J RUIZ 170220.pdf', '465_1581981765.pdf', '2020-02-17 23:22:45', '2020-02-17 23:22:45', NULL),
(201, 11, 'ABERLAY LEON 210220.pdf', '199_1582572489.pdf', '2020-02-24 19:28:09', '2020-02-24 19:28:09', NULL),
(202, 11, 'ALEJANDRO RETAMA 210220.pdf', '360_1582572489.pdf', '2020-02-24 19:28:09', '2020-02-24 19:28:09', NULL),
(203, 11, 'AURELIO ZAPO 210220.pdf', '243_1582572489.pdf', '2020-02-24 19:28:09', '2020-02-24 19:28:09', NULL),
(204, 11, 'CONCEPCION JIMENEZ 210220.pdf', '382_1582572489.pdf', '2020-02-24 19:28:09', '2020-02-24 19:28:09', NULL),
(205, 11, 'DANIEL C HDEZ 210220.pdf', '182_1582572489.pdf', '2020-02-24 19:28:09', '2020-02-24 19:28:09', NULL),
(206, 11, 'DANIEL I FDEZ 210220.pdf', '35_1582572489.pdf', '2020-02-24 19:28:09', '2020-02-24 19:28:09', NULL),
(207, 11, 'EZEQUIAS ANTELE 210220.pdf', '471_1582572489.pdf', '2020-02-24 19:28:09', '2020-02-24 19:28:09', NULL),
(208, 11, 'FERNANDO ANTONIO 210220.pdf', '350_1582572489.pdf', '2020-02-24 19:28:09', '2020-02-24 19:28:09', NULL),
(209, 11, 'HUGO A BOLAÑOS 210220.pdf', '222_1582572489.pdf', '2020-02-24 19:28:09', '2020-02-24 19:28:09', NULL),
(210, 11, 'IGNACIO MURILLO 210220.pdf', '344_1582572489.pdf', '2020-02-24 19:28:09', '2020-02-24 19:28:09', NULL),
(211, 11, 'IRAM G HUESCA 210220.pdf', '61_1582572489.pdf', '2020-02-24 19:28:09', '2020-02-24 19:28:09', NULL),
(212, 11, 'ISMAEL RENERO 210220.pdf', '392_1582572489.pdf', '2020-02-24 19:28:09', '2020-02-24 19:28:09', NULL),
(213, 11, 'JAIME R NOLASCO 210220.pdf', '189_1582572489.pdf', '2020-02-24 19:28:09', '2020-02-24 19:28:09', NULL),
(214, 11, 'JORGE A ESCRIBANO 210220.pdf', '172_1582572489.pdf', '2020-02-24 19:28:09', '2020-02-24 19:28:09', NULL),
(215, 11, 'JORGE ALVAREZ 210220.pdf', '287_1582572489.pdf', '2020-02-24 19:28:09', '2020-02-24 19:28:09', NULL),
(216, 11, 'JOSE DE LOS SANTOS 210220.pdf', '231_1582572489.pdf', '2020-02-24 19:28:09', '2020-02-24 19:28:09', NULL),
(217, 11, 'JOSE L VERGARA 210220.pdf', '202_1582572489.pdf', '2020-02-24 19:28:09', '2020-02-24 19:28:09', NULL),
(218, 11, 'LAYOUT 210220.pdf', '129_1582572489.pdf', '2020-02-24 19:28:09', '2020-02-24 19:28:09', NULL),
(219, 11, 'LEONARDO GLEZ 210220.pdf', '128_1582572489.pdf', '2020-02-24 19:28:09', '2020-02-24 19:28:09', NULL),
(220, 11, 'LORENZO JUAREZ 210220.pdf', '304_1582572489.pdf', '2020-02-24 19:28:09', '2020-02-24 19:28:09', NULL),
(221, 12, 'ABERLAY LEON 210220.pdf', '424_1582573397.pdf', '2020-02-24 19:43:17', '2020-02-24 19:43:17', NULL),
(222, 12, 'ALBERTO OBIL 210220.pdf', '204_1582573397.pdf', '2020-02-24 19:43:17', '2020-02-24 19:43:17', NULL),
(223, 12, 'ALEJANDRO RETAMA 210220.pdf', '199_1582573397.pdf', '2020-02-24 19:43:17', '2020-02-24 19:43:17', NULL),
(224, 12, 'ALFREDO XOLO 210220.pdf', '466_1582573397.pdf', '2020-02-24 19:43:17', '2020-02-24 19:43:17', NULL),
(225, 12, 'ALONSO LOPEZ 210220.pdf', '474_1582573397.pdf', '2020-02-24 19:43:17', '2020-02-24 19:43:17', NULL),
(226, 12, 'ALWJANDRO RIOS 210220.pdf', '481_1582573397.pdf', '2020-02-24 19:43:17', '2020-02-24 19:43:17', NULL),
(227, 12, 'ANTONIO ESCRIBANO 210220.pdf', '131_1582573397.pdf', '2020-02-24 19:43:17', '2020-02-24 19:43:17', NULL),
(228, 12, 'AUGUSTO HDEZ 210220.pdf', '235_1582573397.pdf', '2020-02-24 19:43:17', '2020-02-24 19:43:17', NULL),
(229, 12, 'AURELIO ZAPO 210220.pdf', '204_1582573397.pdf', '2020-02-24 19:43:17', '2020-02-24 19:43:17', NULL),
(230, 12, 'BENITO HUESCA 210220.pdf', '494_1582573397.pdf', '2020-02-24 19:43:17', '2020-02-24 19:43:17', NULL),
(231, 12, 'CELESTINO VILLANUEVA 210220.pdf', '213_1582573397.pdf', '2020-02-24 19:43:17', '2020-02-24 19:43:17', NULL),
(232, 12, 'CONCEPCION JIMENEZ 210220.pdf', '386_1582573397.pdf', '2020-02-24 19:43:17', '2020-02-24 19:43:17', NULL),
(233, 12, 'DANIEL C HDEZ 210220.pdf', '29_1582573397.pdf', '2020-02-24 19:43:17', '2020-02-24 19:43:17', NULL),
(234, 12, 'DANIEL I FDEZ 210220.pdf', '248_1582573397.pdf', '2020-02-24 19:43:17', '2020-02-24 19:43:17', NULL),
(235, 12, 'DENI JIMENEZ 210220.pdf', '20_1582573397.pdf', '2020-02-24 19:43:17', '2020-02-24 19:43:17', NULL),
(236, 12, 'ERICK G TORNADO 210220.pdf', '375_1582573397.pdf', '2020-02-24 19:43:17', '2020-02-24 19:43:17', NULL),
(237, 12, 'EZEQUIAS ANTELE 210220.pdf', '301_1582573397.pdf', '2020-02-24 19:43:17', '2020-02-24 19:43:17', NULL),
(238, 12, 'FERNANDO ANTONIO 210220.pdf', '162_1582573397.pdf', '2020-02-24 19:43:17', '2020-02-24 19:43:17', NULL),
(239, 12, 'FERNANDO MAYO 210220.pdf', '33_1582573397.pdf', '2020-02-24 19:43:17', '2020-02-24 19:43:17', NULL),
(240, 12, 'FRANCISCO DOLORES 210220.pdf', '270_1582573397.pdf', '2020-02-24 19:43:17', '2020-02-24 19:43:17', NULL),
(241, 13, 'ABERLAY LEON 280220.pdf', '495_1583172908.pdf', '2020-03-02 18:15:08', '2020-03-02 18:15:08', NULL),
(242, 13, 'ALEJANDRO RETAMA 280220.pdf', '212_1583172908.pdf', '2020-03-02 18:15:08', '2020-03-02 18:15:08', NULL),
(243, 13, 'AURELIO ZAPO 280220.pdf', '130_1583172908.pdf', '2020-03-02 18:15:08', '2020-03-02 18:15:08', NULL),
(244, 13, 'CONCEPCION JIMENEZ 280220.pdf', '34_1583172908.pdf', '2020-03-02 18:15:08', '2020-03-02 18:15:08', NULL),
(245, 13, 'DANIEL C HDEZ 280220.pdf', '420_1583172908.pdf', '2020-03-02 18:15:08', '2020-03-02 18:15:08', NULL),
(246, 13, 'DANIEL I FDEZ 280220.pdf', '421_1583172908.pdf', '2020-03-02 18:15:08', '2020-03-02 18:15:08', NULL),
(247, 13, 'EZEQUIAS ANTELE 280220.pdf', '478_1583172908.pdf', '2020-03-02 18:15:08', '2020-03-02 18:15:08', NULL),
(248, 13, 'FERNANDO ANTONIO 280220.pdf', '372_1583172908.pdf', '2020-03-02 18:15:08', '2020-03-02 18:15:08', NULL),
(249, 13, 'HUGO A BOLAÑOS 280220.pdf', '141_1583172908.pdf', '2020-03-02 18:15:08', '2020-03-02 18:15:08', NULL),
(250, 13, 'IGNACIO MURILLO 280220.pdf', '206_1583172908.pdf', '2020-03-02 18:15:08', '2020-03-02 18:15:08', NULL),
(251, 13, 'IRAM G HUESCA 280220.pdf', '309_1583172908.pdf', '2020-03-02 18:15:08', '2020-03-02 18:15:08', NULL),
(252, 13, 'ISMAEL RENERO 280220.pdf', '263_1583172908.pdf', '2020-03-02 18:15:08', '2020-03-02 18:15:08', NULL),
(253, 13, 'JAIME R NOLASCO 280220.pdf', '358_1583172908.pdf', '2020-03-02 18:15:08', '2020-03-02 18:15:08', NULL),
(254, 13, 'JORGE A ESCRIBANO 280220.pdf', '109_1583172908.pdf', '2020-03-02 18:15:08', '2020-03-02 18:15:08', NULL),
(255, 13, 'JORGE ALVAREZ 280220.pdf', '3_1583172908.pdf', '2020-03-02 18:15:08', '2020-03-02 18:15:08', NULL),
(256, 13, 'JOSE DE LOS SANTOS 280220.pdf', '171_1583172908.pdf', '2020-03-02 18:15:08', '2020-03-02 18:15:08', NULL),
(257, 13, 'JOSE F ALTUNAR 280220.pdf', '280_1583172908.pdf', '2020-03-02 18:15:08', '2020-03-02 18:15:08', NULL),
(258, 13, 'JOSE L VERGARA 280220.pdf', '454_1583172908.pdf', '2020-03-02 18:15:08', '2020-03-02 18:15:08', NULL),
(259, 13, 'LAYOUT SEM09.pdf', '392_1583172908.pdf', '2020-03-02 18:15:08', '2020-03-02 18:15:08', NULL),
(260, 13, 'LEONARDO GONZALEZ 280220.pdf', '410_1583172908.pdf', '2020-03-02 18:15:08', '2020-03-02 18:15:08', NULL),
(261, 14, 'ABERLAY LEON 280220.pdf', '331_1583177888.pdf', '2020-03-02 19:38:08', '2020-03-02 19:38:08', NULL),
(262, 14, 'ALBERTO OBIL 280220.pdf', '177_1583177888.pdf', '2020-03-02 19:38:08', '2020-03-02 19:38:08', NULL),
(263, 14, 'ALEJANDRO RETAMA 280220.pdf', '358_1583177888.pdf', '2020-03-02 19:38:08', '2020-03-02 19:38:08', NULL),
(264, 14, 'ALEJANDRO RIOS 280220.pdf', '199_1583177888.pdf', '2020-03-02 19:38:08', '2020-03-02 19:38:08', NULL),
(265, 14, 'ALFREDO XOLO 280220.pdf', '38_1583177888.pdf', '2020-03-02 19:38:08', '2020-03-02 19:38:08', NULL),
(266, 14, 'ALONSO LOPEZ 280220.pdf', '402_1583177888.pdf', '2020-03-02 19:38:08', '2020-03-02 19:38:08', NULL),
(267, 14, 'AUGUSTO HERNANDEZ 280220.pdf', '260_1583177888.pdf', '2020-03-02 19:38:08', '2020-03-02 19:38:08', NULL),
(268, 14, 'AURELIO ZAPO 280220.pdf', '177_1583177888.pdf', '2020-03-02 19:38:08', '2020-03-02 19:38:08', NULL),
(269, 14, 'BENITO HUESCA 280220.pdf', '201_1583177888.pdf', '2020-03-02 19:38:08', '2020-03-02 19:38:08', NULL),
(270, 14, 'CELESTINO VILLANUEVA 280220.pdf', '448_1583177888.pdf', '2020-03-02 19:38:08', '2020-03-02 19:38:08', NULL),
(271, 14, 'CONCEPCION JIMENEZ 280220.pdf', '441_1583177888.pdf', '2020-03-02 19:38:08', '2020-03-02 19:38:08', NULL),
(272, 14, 'DANIEL C HDEZ 280220.pdf', '168_1583177888.pdf', '2020-03-02 19:38:08', '2020-03-02 19:38:08', NULL),
(273, 14, 'DANIEL I FDEZ 280220.pdf', '172_1583177888.pdf', '2020-03-02 19:38:08', '2020-03-02 19:38:08', NULL),
(274, 14, 'DENI JIMENEZ 280220.pdf', '318_1583177888.pdf', '2020-03-02 19:38:08', '2020-03-02 19:38:08', NULL),
(275, 14, 'ERICK G TORNADO 280220.pdf', '442_1583177888.pdf', '2020-03-02 19:38:08', '2020-03-02 19:38:08', NULL),
(276, 14, 'EZEQUIAS ANTELE 280220.pdf', '168_1583177888.pdf', '2020-03-02 19:38:08', '2020-03-02 19:38:08', NULL),
(277, 14, 'FERNANDO ANTONIO 280220.pdf', '472_1583177888.pdf', '2020-03-02 19:38:08', '2020-03-02 19:38:08', NULL),
(278, 14, 'FERNANDO MAYO 280220.pdf', '361_1583177888.pdf', '2020-03-02 19:38:08', '2020-03-02 19:38:08', NULL),
(279, 14, 'FRANCISCO DOLORES 280220.pdf', '58_1583177888.pdf', '2020-03-02 19:38:08', '2020-03-02 19:38:08', NULL),
(280, 14, 'FRANCISCO J RUIZ 280220.pdf', '132_1583177888.pdf', '2020-03-02 19:38:08', '2020-03-02 19:38:08', NULL),
(281, 15, 'ABERLAY LEON 070320.pdf', '91_1583795535.pdf', '2020-03-09 23:12:15', '2020-03-09 23:12:15', NULL),
(282, 15, 'ALEJANDRO RETAMA 060320.pdf', '276_1583795535.pdf', '2020-03-09 23:12:15', '2020-03-09 23:12:15', NULL),
(283, 15, 'AURELIO ZAPO 060320.pdf', '12_1583795535.pdf', '2020-03-09 23:12:15', '2020-03-09 23:12:15', NULL),
(284, 15, 'CONCCEPCION JIMENEZ 060320.pdf', '182_1583795535.pdf', '2020-03-09 23:12:15', '2020-03-09 23:12:15', NULL),
(285, 15, 'DANIEL C HDEZ 060320.pdf', '439_1583795535.pdf', '2020-03-09 23:12:15', '2020-03-09 23:12:15', NULL),
(286, 15, 'DANIEL I FDEZ 060320.pdf', '190_1583795535.pdf', '2020-03-09 23:12:15', '2020-03-09 23:12:15', NULL),
(287, 15, 'FERNANDO ANTONIO 060320.pdf', '297_1583795535.pdf', '2020-03-09 23:12:15', '2020-03-09 23:12:15', NULL),
(288, 15, 'HUGO A BOLAÑOS 060320.pdf', '147_1583795535.pdf', '2020-03-09 23:12:15', '2020-03-09 23:12:15', NULL),
(289, 15, 'IGNACIO MURILLO 060320.pdf', '137_1583795535.pdf', '2020-03-09 23:12:15', '2020-03-09 23:12:15', NULL),
(290, 15, 'IRAM G HUESCA 060320.pdf', '321_1583795535.pdf', '2020-03-09 23:12:15', '2020-03-09 23:12:15', NULL),
(291, 15, 'ISMAEL RENERO 060320.pdf', '244_1583795535.pdf', '2020-03-09 23:12:15', '2020-03-09 23:12:15', NULL),
(292, 15, 'JAIME R NOLASCO 060320.pdf', '463_1583795535.pdf', '2020-03-09 23:12:15', '2020-03-09 23:12:15', NULL),
(293, 15, 'JAIME SOTO 070320.pdf', '296_1583795535.pdf', '2020-03-09 23:12:15', '2020-03-09 23:12:15', NULL),
(294, 15, 'JORGE A ESCRIBANO 070320.pdf', '294_1583795535.pdf', '2020-03-09 23:12:15', '2020-03-09 23:12:15', NULL),
(295, 15, 'JORGE ALVAREZ 060320.pdf', '210_1583795535.pdf', '2020-03-09 23:12:15', '2020-03-09 23:12:15', NULL),
(296, 15, 'JOSE DE LOS SANTOS 060320.pdf', '493_1583795535.pdf', '2020-03-09 23:12:15', '2020-03-09 23:12:15', NULL),
(297, 15, 'JOSE F ALTUNAR 060320.pdf', '251_1583795535.pdf', '2020-03-09 23:12:15', '2020-03-09 23:12:15', NULL),
(298, 15, 'JOSE L VERGARA 060320.pdf', '1_1583795535.pdf', '2020-03-09 23:12:15', '2020-03-09 23:12:15', NULL),
(299, 15, 'LAYOUT SEM10.pdf', '125_1583795535.pdf', '2020-03-09 23:12:15', '2020-03-09 23:12:15', NULL),
(300, 15, 'LEONARDO GLEZ 060320.pdf', '195_1583795535.pdf', '2020-03-09 23:12:15', '2020-03-09 23:12:15', NULL),
(301, 16, 'ABERLAY LEON 070320.pdf', '140_1583796649.pdf', '2020-03-09 23:30:49', '2020-03-09 23:30:49', NULL),
(302, 16, 'ALBERTO OBIL 060320.pdf', '222_1583796649.pdf', '2020-03-09 23:30:49', '2020-03-09 23:30:49', NULL),
(303, 16, 'ALEJANDRO RETAMA 060320.pdf', '8_1583796649.pdf', '2020-03-09 23:30:49', '2020-03-09 23:30:49', NULL),
(304, 16, 'ALEJANDRO RIOS 060320.pdf', '382_1583796649.pdf', '2020-03-09 23:30:49', '2020-03-09 23:30:49', NULL),
(305, 16, 'ALFREDO XOLO 060320.pdf', '350_1583796649.pdf', '2020-03-09 23:30:49', '2020-03-09 23:30:49', NULL),
(306, 16, 'ALONSO LOPEZ 060320.pdf', '308_1583796649.pdf', '2020-03-09 23:30:49', '2020-03-09 23:30:49', NULL),
(307, 16, 'AUGUSTO HDEZ 060320.pdf', '453_1583796649.pdf', '2020-03-09 23:30:49', '2020-03-09 23:30:49', NULL),
(308, 16, 'AURELIO ZAPO 060320.pdf', '100_1583796649.pdf', '2020-03-09 23:30:49', '2020-03-09 23:30:49', NULL),
(309, 16, 'BENITO HUESCA 060320.pdf', '85_1583796649.pdf', '2020-03-09 23:30:49', '2020-03-09 23:30:49', NULL),
(310, 16, 'CELESTINO VILLANUEVA 060320.pdf', '17_1583796649.pdf', '2020-03-09 23:30:49', '2020-03-09 23:30:49', NULL),
(311, 16, 'CONCEPCION JIMENEZ 060320.pdf', '407_1583796649.pdf', '2020-03-09 23:30:49', '2020-03-09 23:30:49', NULL),
(312, 16, 'DANIEL C HDEZ 060320.pdf', '161_1583796649.pdf', '2020-03-09 23:30:49', '2020-03-09 23:30:49', NULL),
(313, 16, 'DANIEL I FDEZ 060320.pdf', '42_1583796649.pdf', '2020-03-09 23:30:49', '2020-03-09 23:30:49', NULL),
(314, 16, 'DENI JIMNEZ 060320.pdf', '275_1583796649.pdf', '2020-03-09 23:30:49', '2020-03-09 23:30:49', NULL),
(315, 16, 'ERICK G TORNADO 060320.pdf', '247_1583796649.pdf', '2020-03-09 23:30:49', '2020-03-09 23:30:49', NULL),
(316, 16, 'EZEQUIAS ANTELE 060320.pdf', '73_1583796649.pdf', '2020-03-09 23:30:49', '2020-03-09 23:30:49', NULL),
(317, 16, 'FERNANDO ANTONIO 060320.pdf', '102_1583796649.pdf', '2020-03-09 23:30:49', '2020-03-09 23:30:49', NULL),
(318, 16, 'FERNANDO MAYO 060320.pdf', '218_1583796649.pdf', '2020-03-09 23:30:49', '2020-03-09 23:30:49', NULL),
(319, 16, 'FRANCISCO DOLORES 060320.pdf', '81_1583796649.pdf', '2020-03-09 23:30:49', '2020-03-09 23:30:49', NULL),
(320, 16, 'FRANCISCO J RUIZ 060320.pdf', '488_1583796649.pdf', '2020-03-09 23:30:49', '2020-03-09 23:30:49', NULL),
(321, 17, 'ABERLAY LEON 130320.pdf', '293_1584394480.pdf', '2020-03-16 21:34:40', '2020-03-16 21:34:40', NULL),
(322, 17, 'INTERBANCARIO 130320.pdf', '5_1584394480.pdf', '2020-03-16 21:34:40', '2020-03-16 21:34:40', NULL),
(323, 17, 'JOSE F ALTUNAR 130320.pdf', '65_1584394480.pdf', '2020-03-16 21:34:40', '2020-03-16 21:34:40', NULL),
(324, 17, 'LAYOUT 130320.pdf', '38_1584394480.pdf', '2020-03-16 21:34:40', '2020-03-16 21:34:40', NULL),
(325, 17, 'MARCOS LOPEZ 130320.pdf', '3_1584394480.pdf', '2020-03-16 21:34:40', '2020-03-16 21:34:40', NULL),
(326, 18, 'ABERLAY LEON 130320.pdf', '259_1584395561.pdf', '2020-03-16 21:52:41', '2020-03-16 21:52:41', NULL),
(327, 18, 'ALBERTO OBIL 130320.pdf', '474_1584395561.pdf', '2020-03-16 21:52:41', '2020-03-16 21:52:41', NULL),
(328, 18, 'ALEJANDRO RETAMA 130320.pdf', '455_1584395561.pdf', '2020-03-16 21:52:41', '2020-03-16 21:52:41', NULL),
(329, 18, 'ALEJANDRO RIOS 130320.pdf', '174_1584395561.pdf', '2020-03-16 21:52:41', '2020-03-16 21:52:41', NULL),
(330, 18, 'ALFREDO XOLO 130320.pdf', '263_1584395561.pdf', '2020-03-16 21:52:41', '2020-03-16 21:52:41', NULL),
(331, 18, 'ALONSO LOPEZ 130320.pdf', '35_1584395561.pdf', '2020-03-16 21:52:41', '2020-03-16 21:52:41', NULL),
(332, 18, 'AUGUSTO HDEZ 130320.pdf', '495_1584395561.pdf', '2020-03-16 21:52:41', '2020-03-16 21:52:41', NULL),
(333, 18, 'AURELIO ZAPO 130320.pdf', '413_1584395561.pdf', '2020-03-16 21:52:41', '2020-03-16 21:52:41', NULL),
(334, 18, 'BENITO HUESCA 130320.pdf', '429_1584395561.pdf', '2020-03-16 21:52:41', '2020-03-16 21:52:41', NULL),
(335, 18, 'CELESTINO VILLANUEVA 130320.pdf', '205_1584395561.pdf', '2020-03-16 21:52:41', '2020-03-16 21:52:41', NULL),
(336, 18, 'CONCEPCION JIMENEZ 130320.pdf', '383_1584395561.pdf', '2020-03-16 21:52:41', '2020-03-16 21:52:41', NULL),
(337, 18, 'DANIEL C HDEZ 130320.pdf', '90_1584395561.pdf', '2020-03-16 21:52:41', '2020-03-16 21:52:41', NULL),
(338, 18, 'DANIEL I FDEZ 130320.pdf', '138_1584395561.pdf', '2020-03-16 21:52:41', '2020-03-16 21:52:41', NULL),
(339, 18, 'DENI JIMENEZ 130320.pdf', '441_1584395561.pdf', '2020-03-16 21:52:41', '2020-03-16 21:52:41', NULL),
(340, 18, 'ERICK G TORNADO 130320.pdf', '309_1584395561.pdf', '2020-03-16 21:52:41', '2020-03-16 21:52:41', NULL),
(341, 18, 'EZEQUIAS ANTELE 130320.pdf', '443_1584395561.pdf', '2020-03-16 21:52:41', '2020-03-16 21:52:41', NULL),
(342, 18, 'FELIPE CARRASCO 130320.pdf', '208_1584395561.pdf', '2020-03-16 21:52:41', '2020-03-16 21:52:41', NULL),
(343, 18, 'FERNANDO ANTONIO 130320.pdf', '89_1584395561.pdf', '2020-03-16 21:52:41', '2020-03-16 21:52:41', NULL),
(344, 18, 'FERNANDO MAYO 130320.pdf', '241_1584395561.pdf', '2020-03-16 21:52:41', '2020-03-16 21:52:41', NULL),
(345, 18, 'FRANCISCO DOLORES 130320.pdf', '137_1584395561.pdf', '2020-03-16 21:52:41', '2020-03-16 21:52:41', NULL),
(346, 19, 'BBVA 210320.pdf', '302_1585420603.pdf', '2020-03-28 18:36:43', '2020-03-28 18:36:43', NULL),
(347, 19, 'FELIPE CARRASCO 210320.pdf', '99_1585420603.pdf', '2020-03-28 18:36:43', '2020-03-28 18:36:43', NULL),
(348, 19, 'INTERBANCARIOS 210320.pdf', '329_1585420603.pdf', '2020-03-28 18:36:43', '2020-03-28 18:36:43', NULL),
(349, 20, 'BBVA 210320.pdf', '367_1585420657.pdf', '2020-03-28 18:37:37', '2020-03-28 18:37:37', NULL),
(350, 20, 'INTERBANCARIOS 210320.pdf', '321_1585420657.pdf', '2020-03-28 18:37:37', '2020-03-28 18:37:37', NULL),
(351, 21, 'BBVA 270320.pdf', '157_1585420740.pdf', '2020-03-28 18:39:00', '2020-03-28 18:39:00', NULL),
(352, 21, 'INTERBANCARIOS 270320.pdf', '329_1585420740.pdf', '2020-03-28 18:39:00', '2020-03-28 18:39:00', NULL),
(353, 22, 'ABERLAY LEON 270320.pdf', '366_1585421445.pdf', '2020-03-28 18:50:45', '2020-03-28 18:50:45', NULL),
(354, 22, 'ALBERTO OBIL 270320.pdf', '21_1585421445.pdf', '2020-03-28 18:50:45', '2020-03-28 18:50:45', NULL),
(355, 22, 'ALEJANDRO RETAMA 270320.pdf', '453_1585421445.pdf', '2020-03-28 18:50:45', '2020-03-28 18:50:45', NULL),
(356, 22, 'ALEJANDRO RIOS 270320.pdf', '339_1585421445.pdf', '2020-03-28 18:50:45', '2020-03-28 18:50:45', NULL),
(357, 22, 'ALFREDO XOLO 270320.pdf', '208_1585421445.pdf', '2020-03-28 18:50:45', '2020-03-28 18:50:45', NULL),
(358, 22, 'ALONSO LOPEZ 270320.pdf', '81_1585421445.pdf', '2020-03-28 18:50:45', '2020-03-28 18:50:45', NULL),
(359, 22, 'AUGUSTO HDEZ 270320.pdf', '387_1585421445.pdf', '2020-03-28 18:50:45', '2020-03-28 18:50:45', NULL),
(360, 22, 'AURELIO ZAPO 270320.pdf', '78_1585421445.pdf', '2020-03-28 18:50:45', '2020-03-28 18:50:45', NULL),
(361, 22, 'BENITO HUESCA 270320.pdf', '344_1585421445.pdf', '2020-03-28 18:50:45', '2020-03-28 18:50:45', NULL),
(362, 22, 'CELESTINO VILLANUEVA 270320.pdf', '236_1585421445.pdf', '2020-03-28 18:50:45', '2020-03-28 18:50:45', NULL),
(363, 22, 'CONCEPCION JIMENEZ 270320.pdf', '343_1585421445.pdf', '2020-03-28 18:50:45', '2020-03-28 18:50:45', NULL),
(364, 22, 'DANIEL C HDEZ 270320.pdf', '403_1585421445.pdf', '2020-03-28 18:50:45', '2020-03-28 18:50:45', NULL),
(365, 22, 'DANIEL I FDEZ 270320.pdf', '200_1585421445.pdf', '2020-03-28 18:50:45', '2020-03-28 18:50:45', NULL),
(366, 22, 'DENI JIMENEZ 270320.pdf', '66_1585421445.pdf', '2020-03-28 18:50:45', '2020-03-28 18:50:45', NULL),
(367, 22, 'ERICK G TORNADO 270320.pdf', '133_1585421446.pdf', '2020-03-28 18:50:46', '2020-03-28 18:50:46', NULL),
(368, 22, 'EZEQUIAS ANTELE 270320.pdf', '346_1585421446.pdf', '2020-03-28 18:50:46', '2020-03-28 18:50:46', NULL),
(369, 22, 'FELIPE CARRASCO 270320.pdf', '302_1585421446.pdf', '2020-03-28 18:50:46', '2020-03-28 18:50:46', NULL),
(370, 22, 'FERNANDO ANTONIO 270320.pdf', '437_1585421446.pdf', '2020-03-28 18:50:46', '2020-03-28 18:50:46', NULL),
(371, 22, 'FERNANDO MAYO 270320.pdf', '410_1585421446.pdf', '2020-03-28 18:50:46', '2020-03-28 18:50:46', NULL),
(372, 22, 'FRANCISCO BEJARANO 270320.pdf', '305_1585421446.pdf', '2020-03-28 18:50:46', '2020-03-28 18:50:46', NULL),
(373, 23, 'BBVA 030420.pdf', '350_1586210807.pdf', '2020-04-06 22:06:47', '2020-04-06 22:06:47', NULL),
(374, 23, 'INTERBANCARIOS 030420.pdf', '80_1586210832.pdf', '2020-04-06 22:07:12', '2020-04-06 22:07:12', NULL),
(375, 23, 'ROGELIO HERRERA 040420.pdf', '260_1586210832.pdf', '2020-04-06 22:07:12', '2020-04-06 22:07:12', NULL),
(376, 24, 'ABERLAY LEON 030420.pdf', '27_1586211935.pdf', '2020-04-06 22:25:35', '2020-04-06 22:25:35', NULL),
(377, 24, 'ALBERTO OBIL 030420.pdf', '314_1586211935.pdf', '2020-04-06 22:25:35', '2020-04-06 22:25:35', NULL),
(378, 24, 'ALEJANDRO RETAMA 030420.pdf', '114_1586211935.pdf', '2020-04-06 22:25:35', '2020-04-06 22:25:35', NULL),
(379, 24, 'ALEJANDRO RIOS 030420.pdf', '220_1586211935.pdf', '2020-04-06 22:25:35', '2020-04-06 22:25:35', NULL),
(380, 24, 'ALFREDO XOLO 030420.pdf', '453_1586211935.pdf', '2020-04-06 22:25:35', '2020-04-06 22:25:35', NULL),
(381, 24, 'ALONSO LOPEZ 030420.pdf', '277_1586211935.pdf', '2020-04-06 22:25:35', '2020-04-06 22:25:35', NULL),
(382, 24, 'AUGUSTO HERNANDEZ 030420.pdf', '454_1586211935.pdf', '2020-04-06 22:25:35', '2020-04-06 22:25:35', NULL),
(383, 24, 'AURELIO ZAPO 030420.pdf', '403_1586211935.pdf', '2020-04-06 22:25:35', '2020-04-06 22:25:35', NULL),
(384, 24, 'BENITO HUESCA 030420.pdf', '33_1586211935.pdf', '2020-04-06 22:25:35', '2020-04-06 22:25:35', NULL),
(385, 24, 'CELESTINO VILLANUEVA 030420.pdf', '69_1586211935.pdf', '2020-04-06 22:25:35', '2020-04-06 22:25:35', NULL),
(386, 24, 'CONCEPCION JIMENEZ 030420.pdf', '274_1586211935.pdf', '2020-04-06 22:25:35', '2020-04-06 22:25:35', NULL),
(387, 24, 'DANIEL C HDEZ 030420.pdf', '481_1586211935.pdf', '2020-04-06 22:25:35', '2020-04-06 22:25:35', NULL),
(388, 24, 'DANIEL I FDEZ 030420.pdf', '342_1586211935.pdf', '2020-04-06 22:25:35', '2020-04-06 22:25:35', NULL),
(389, 24, 'DENI JIMENEZ 030420.pdf', '258_1586211935.pdf', '2020-04-06 22:25:35', '2020-04-06 22:25:35', NULL),
(390, 24, 'ERICK G TORNADO 030420.pdf', '217_1586211935.pdf', '2020-04-06 22:25:35', '2020-04-06 22:25:35', NULL),
(391, 24, 'EZEQUIAS ANTELE 030420.pdf', '291_1586211935.pdf', '2020-04-06 22:25:35', '2020-04-06 22:25:35', NULL),
(392, 24, 'FELIPE CARRASCO 030420.pdf', '413_1586211935.pdf', '2020-04-06 22:25:35', '2020-04-06 22:25:35', NULL),
(393, 24, 'FERNANDO ANTONIO 030420.pdf', '462_1586211935.pdf', '2020-04-06 22:25:35', '2020-04-06 22:25:35', NULL),
(394, 24, 'FERNANDO MAYO 030420.pdf', '94_1586211935.pdf', '2020-04-06 22:25:35', '2020-04-06 22:25:35', NULL),
(395, 24, 'FRANCISCO BEJARANO 030420.pdf', '312_1586211935.pdf', '2020-04-06 22:25:35', '2020-04-06 22:25:35', NULL),
(396, 25, 'BBVA 090420 (1).pdf', '170_1586901022.pdf', '2020-04-14 21:50:22', '2020-04-14 21:50:22', NULL),
(397, 25, 'BBVA 090420 (2).pdf', '238_1586901022.pdf', '2020-04-14 21:50:22', '2020-04-14 21:50:22', NULL),
(398, 25, 'BBVA 090420 (3).pdf', '287_1586901022.pdf', '2020-04-14 21:50:22', '2020-04-14 21:50:22', NULL),
(399, 25, 'BBVA 090420 (4).pdf', '411_1586901022.pdf', '2020-04-14 21:50:22', '2020-04-14 21:50:22', NULL),
(400, 25, 'INTERBANCARIO 090420 (1).pdf', '492_1586901022.pdf', '2020-04-14 21:50:22', '2020-04-14 21:50:22', NULL),
(401, 25, 'INTERBANCARIO 090420 (2).pdf', '188_1586901022.pdf', '2020-04-14 21:50:22', '2020-04-14 21:50:22', NULL),
(402, 25, 'RIGOBERTO CHACHA 130420.pdf', '38_1586901022.pdf', '2020-04-14 21:50:22', '2020-04-14 21:50:22', NULL),
(403, 25, 'JORGE ALVAREZ 140420.pdf', '281_1586901022.pdf', '2020-04-14 21:50:22', '2020-04-14 21:50:22', NULL),
(404, 26, 'BBVA 170420.pdf', '450_1587484788.pdf', '2020-04-21 15:59:48', '2020-04-21 15:59:48', NULL),
(405, 26, 'INTERBANCARIOS 170420.pdf', '275_1587484788.pdf', '2020-04-21 15:59:48', '2020-04-21 15:59:48', NULL),
(406, 27, 'ABERLAY LEON 170420.pdf', '133_1587485456.pdf', '2020-04-21 16:10:56', '2020-04-21 16:10:56', NULL),
(407, 27, 'ALBERTO OBIL 170420.pdf', '429_1587485456.pdf', '2020-04-21 16:10:56', '2020-04-21 16:10:56', NULL),
(408, 27, 'ALEJANDRO RETAMA 170420.pdf', '40_1587485456.pdf', '2020-04-21 16:10:56', '2020-04-21 16:10:56', NULL),
(409, 27, 'ALEJANDRO RIOS 170420.pdf', '213_1587485456.pdf', '2020-04-21 16:10:56', '2020-04-21 16:10:56', NULL),
(410, 27, 'ALFREDO XOLO 170420.pdf', '303_1587485456.pdf', '2020-04-21 16:10:56', '2020-04-21 16:10:56', NULL),
(411, 27, 'ALONSO LOPEZ 170420.pdf', '458_1587485456.pdf', '2020-04-21 16:10:56', '2020-04-21 16:10:56', NULL),
(412, 27, 'AUGUSTO HERNANDEZ 170420.pdf', '112_1587485456.pdf', '2020-04-21 16:10:56', '2020-04-21 16:10:56', NULL),
(413, 27, 'AURELIO ZAPO 170420.pdf', '458_1587485456.pdf', '2020-04-21 16:10:56', '2020-04-21 16:10:56', NULL),
(414, 27, 'BENITO HUESCA 170420.pdf', '493_1587485456.pdf', '2020-04-21 16:10:57', '2020-04-21 16:10:57', NULL),
(415, 27, 'CELESTINO VILLANUEVA 170420.pdf', '443_1587485457.pdf', '2020-04-21 16:10:57', '2020-04-21 16:10:57', NULL),
(416, 27, 'CONCEPCION JIMENEZ 170420.pdf', '491_1587485457.pdf', '2020-04-21 16:10:57', '2020-04-21 16:10:57', NULL),
(417, 27, 'DANIEL C HDEZ 170420.pdf', '304_1587485457.pdf', '2020-04-21 16:10:57', '2020-04-21 16:10:57', NULL),
(418, 27, 'DANIEL I FDEZ 170420.pdf', '31_1587485457.pdf', '2020-04-21 16:10:57', '2020-04-21 16:10:57', NULL),
(419, 27, 'DANIEL MONTIEL 170420.pdf', '256_1587485457.pdf', '2020-04-21 16:10:57', '2020-04-21 16:10:57', NULL),
(420, 27, 'DENI JIMENEZ 170420.pdf', '41_1587485457.pdf', '2020-04-21 16:10:57', '2020-04-21 16:10:57', NULL),
(421, 27, 'ERICK G TORNADO 170420.pdf', '186_1587485457.pdf', '2020-04-21 16:10:57', '2020-04-21 16:10:57', NULL),
(422, 27, 'EZEQUIAS ANTELE 170420.pdf', '261_1587485457.pdf', '2020-04-21 16:10:57', '2020-04-21 16:10:57', NULL),
(423, 27, 'EZEQUIEL ENRIQUE 170420.pdf', '91_1587485457.pdf', '2020-04-21 16:10:57', '2020-04-21 16:10:57', NULL),
(424, 27, 'FELIPE CARRASCO 170420.pdf', '144_1587485457.pdf', '2020-04-21 16:10:57', '2020-04-21 16:10:57', NULL),
(425, 27, 'FERNANDO ANTONIO 170420.pdf', '296_1587485457.pdf', '2020-04-21 16:10:57', '2020-04-21 16:10:57', NULL),
(426, 28, 'BBVA 300420.pdf', '269_1588798632.pdf', '2020-05-06 20:57:12', '2020-05-06 20:57:12', NULL),
(427, 28, 'INTERBANCARIOS 300420.pdf', '413_1588798632.pdf', '2020-05-06 20:57:12', '2020-05-06 20:57:12', NULL),
(428, 29, 'ABERLAY LEON 300420.pdf', '52_1588799570.pdf', '2020-05-06 21:12:50', '2020-05-06 21:12:50', NULL),
(429, 29, 'ALBERTO OBIL 300420.pdf', '453_1588799570.pdf', '2020-05-06 21:12:50', '2020-05-06 21:12:50', NULL),
(430, 29, 'ALEJANDRO RETAMA 300420 (2).pdf', '158_1588799570.pdf', '2020-05-06 21:12:50', '2020-05-06 21:12:50', NULL),
(431, 29, 'ALEJANDRO RETAMA 300420.pdf', '350_1588799570.pdf', '2020-05-06 21:12:50', '2020-05-06 21:12:50', NULL),
(432, 29, 'ALFREDO XOLO 300420.pdf', '214_1588799570.pdf', '2020-05-06 21:12:50', '2020-05-06 21:12:50', NULL),
(433, 29, 'ALONSO LOPEZ 300420.pdf', '50_1588799570.pdf', '2020-05-06 21:12:50', '2020-05-06 21:12:50', NULL),
(434, 29, 'AUGUSTO HDEZ 300420.pdf', '410_1588799570.pdf', '2020-05-06 21:12:50', '2020-05-06 21:12:50', NULL),
(435, 29, 'AURELIO ZAPO 300420.pdf', '352_1588799570.pdf', '2020-05-06 21:12:50', '2020-05-06 21:12:50', NULL),
(436, 29, 'BENITO HUESCA 300420.pdf', '61_1588799570.pdf', '2020-05-06 21:12:50', '2020-05-06 21:12:50', NULL),
(437, 29, 'CONCEPCION JIMENEZ 300420.pdf', '197_1588799570.pdf', '2020-05-06 21:12:50', '2020-05-06 21:12:50', NULL),
(438, 29, 'DANIEL C HDEZ 300420.pdf', '179_1588799570.pdf', '2020-05-06 21:12:50', '2020-05-06 21:12:50', NULL),
(439, 29, 'EZEQUIAS ANTELE 300420.pdf', '85_1588799570.pdf', '2020-05-06 21:12:50', '2020-05-06 21:12:50', NULL),
(440, 29, 'FELIPE CARRASCO 300420.pdf', '474_1588799570.pdf', '2020-05-06 21:12:50', '2020-05-06 21:12:50', NULL),
(441, 29, 'FERNANDO ANTONIO 300420.pdf', '12_1588799570.pdf', '2020-05-06 21:12:50', '2020-05-06 21:12:50', NULL),
(442, 29, 'FERNANDO MAYO 300420.pdf', '444_1588799570.pdf', '2020-05-06 21:12:50', '2020-05-06 21:12:50', NULL),
(443, 29, 'FRANCISCO DOLORES 300420.pdf', '431_1588799570.pdf', '2020-05-06 21:12:50', '2020-05-06 21:12:50', NULL),
(444, 29, 'FRANCISCO J RUIZ 300420.pdf', '67_1588799570.pdf', '2020-05-06 21:12:50', '2020-05-06 21:12:50', NULL),
(445, 29, 'GUILLERMO S CELAYA 300420.pdf', '477_1588799570.pdf', '2020-05-06 21:12:50', '2020-05-06 21:12:50', NULL),
(446, 29, 'HECTOR MOLINA 300420.pdf', '39_1588799570.pdf', '2020-05-06 21:12:50', '2020-05-06 21:12:50', NULL),
(447, 29, 'HILARIO MOZO 300420.pdf', '370_1588799570.pdf', '2020-05-06 21:12:50', '2020-05-06 21:12:50', NULL),
(448, 30, 'BBVA 240420.pdf', '311_1588799905.pdf', '2020-05-06 21:18:25', '2020-05-06 21:18:25', NULL);
INSERT INTO `nomina_dispersion` (`id`, `nomina_id`, `name`, `file_url`, `created_at`, `updated_at`, `deleted_at`) VALUES
(449, 30, 'INTERBANCARIOS 240420.pdf', '69_1588799905.pdf', '2020-05-06 21:18:25', '2020-05-06 21:18:25', NULL),
(450, 31, 'ABERLAY LEON 240420.pdf', '348_1588801040.pdf', '2020-05-06 21:37:20', '2020-05-06 21:37:20', NULL),
(451, 31, 'ALBERTO OBIL 240420.pdf', '345_1588801040.pdf', '2020-05-06 21:37:20', '2020-05-06 21:37:20', NULL),
(452, 31, 'ALEJANDRO RETAMA 240420.pdf', '406_1588801040.pdf', '2020-05-06 21:37:20', '2020-05-06 21:37:20', NULL),
(453, 31, 'ALFREDO XOLO 240420.pdf', '396_1588801040.pdf', '2020-05-06 21:37:20', '2020-05-06 21:37:20', NULL),
(454, 31, 'ALONSO LOPEZ 240420.pdf', '24_1588801040.pdf', '2020-05-06 21:37:20', '2020-05-06 21:37:20', NULL),
(455, 31, 'AUGUSTO HDEZ 240420.pdf', '449_1588801040.pdf', '2020-05-06 21:37:20', '2020-05-06 21:37:20', NULL),
(456, 31, 'AURELIO ZAPO 240420.pdf', '94_1588801040.pdf', '2020-05-06 21:37:20', '2020-05-06 21:37:20', NULL),
(457, 31, 'BENITO HUESCA 240420.pdf', '475_1588801040.pdf', '2020-05-06 21:37:20', '2020-05-06 21:37:20', NULL),
(458, 31, 'CONCEPCION JIMENEZ 240420.pdf', '174_1588801040.pdf', '2020-05-06 21:37:20', '2020-05-06 21:37:20', NULL),
(459, 31, 'DANIEL C HDEZ 240420.pdf', '469_1588801040.pdf', '2020-05-06 21:37:20', '2020-05-06 21:37:20', NULL),
(460, 31, 'DANIEL MONTIEL 240420.pdf', '306_1588801040.pdf', '2020-05-06 21:37:20', '2020-05-06 21:37:20', NULL),
(461, 31, 'DELFINO SANCHEZ 240420.pdf', '340_1588801040.pdf', '2020-05-06 21:37:20', '2020-05-06 21:37:20', NULL),
(462, 31, 'ENRIQUE PRIETO 240420.pdf', '500_1588801040.pdf', '2020-05-06 21:37:20', '2020-05-06 21:37:20', NULL),
(463, 31, 'EZEQUIAS ANTELE 240420.pdf', '328_1588801040.pdf', '2020-05-06 21:37:20', '2020-05-06 21:37:20', NULL),
(464, 31, 'EZEQUIEL ENRIQUE 240420.pdf', '213_1588801040.pdf', '2020-05-06 21:37:20', '2020-05-06 21:37:20', NULL),
(465, 31, 'FELIPE CARRASCO 240420.pdf', '453_1588801040.pdf', '2020-05-06 21:37:20', '2020-05-06 21:37:20', NULL),
(466, 31, 'FERNANDO ANTONIO 240420.pdf', '417_1588801040.pdf', '2020-05-06 21:37:20', '2020-05-06 21:37:20', NULL),
(467, 31, 'FERNANDO MAYO 240420.pdf', '164_1588801040.pdf', '2020-05-06 21:37:20', '2020-05-06 21:37:20', NULL),
(468, 31, 'FRANCISCO BEJARANO 240420.pdf', '86_1588801040.pdf', '2020-05-06 21:37:20', '2020-05-06 21:37:20', NULL),
(469, 31, 'FRANCISCO DOLORES 240420.pdf', '446_1588801040.pdf', '2020-05-06 21:37:20', '2020-05-06 21:37:20', NULL),
(470, 32, 'BBVA 080520.pdf', '176_1589298128.pdf', '2020-05-12 15:42:08', '2020-05-12 15:42:08', NULL),
(471, 32, 'INTERBANCARIOS 080520.pdf', '104_1589298128.pdf', '2020-05-12 15:42:08', '2020-05-12 15:42:08', NULL),
(472, 32, 'MARTIN ANOTA 110520.pdf', '314_1589298128.pdf', '2020-05-12 15:42:08', '2020-05-12 15:42:08', NULL),
(473, 33, 'ABERLAY LEON 080520.pdf', '272_1589298844.pdf', '2020-05-12 15:54:04', '2020-05-12 15:54:04', NULL),
(474, 33, 'ALBERTO OBIL 080520.pdf', '73_1589298844.pdf', '2020-05-12 15:54:04', '2020-05-12 15:54:04', NULL),
(475, 33, 'ALEJANDRO RETAMA 080520.pdf', '303_1589298844.pdf', '2020-05-12 15:54:04', '2020-05-12 15:54:04', NULL),
(476, 33, 'ALEJANDRO RIOS 080520.pdf', '180_1589298844.pdf', '2020-05-12 15:54:04', '2020-05-12 15:54:04', NULL),
(477, 33, 'ALFREDO XOLO 080520.pdf', '284_1589298844.pdf', '2020-05-12 15:54:04', '2020-05-12 15:54:04', NULL),
(478, 33, 'ALONSO LOPEZ 080520 (2).pdf', '374_1589298844.pdf', '2020-05-12 15:54:04', '2020-05-12 15:54:04', NULL),
(479, 33, 'ALONSO LOPEZ 080520.pdf', '300_1589298844.pdf', '2020-05-12 15:54:04', '2020-05-12 15:54:04', NULL),
(480, 33, 'AUGUSTO HDEZ 080520.pdf', '363_1589298844.pdf', '2020-05-12 15:54:04', '2020-05-12 15:54:04', NULL),
(481, 33, 'AURELIO ZAPO 080520.pdf', '456_1589298844.pdf', '2020-05-12 15:54:04', '2020-05-12 15:54:04', NULL),
(482, 33, 'BENITO HUESCA 080520 (2).pdf', '442_1589298844.pdf', '2020-05-12 15:54:04', '2020-05-12 15:54:04', NULL),
(483, 33, 'BENITO HUESCA 080520.pdf', '489_1589298844.pdf', '2020-05-12 15:54:04', '2020-05-12 15:54:04', NULL),
(484, 33, 'CELESTINO VILLANUEVA 080520.pdf', '232_1589298844.pdf', '2020-05-12 15:54:04', '2020-05-12 15:54:04', NULL),
(485, 33, 'CONCEPCION JIMENEZ 080520.pdf', '218_1589298844.pdf', '2020-05-12 15:54:04', '2020-05-12 15:54:04', NULL),
(486, 33, 'DANIEL C HDEZ 080520.pdf', '61_1589298844.pdf', '2020-05-12 15:54:04', '2020-05-12 15:54:04', NULL),
(487, 33, 'DANIEL I FDEZ 080520.pdf', '432_1589298844.pdf', '2020-05-12 15:54:04', '2020-05-12 15:54:04', NULL),
(488, 33, 'DANIEL MONTIEL 080520.pdf', '4_1589298844.pdf', '2020-05-12 15:54:04', '2020-05-12 15:54:04', NULL),
(489, 33, 'EZEQUIAS ANTELE 080520.pdf', '181_1589298844.pdf', '2020-05-12 15:54:04', '2020-05-12 15:54:04', NULL),
(490, 33, 'FELIPE CARRASCO 080520.pdf', '153_1589298844.pdf', '2020-05-12 15:54:04', '2020-05-12 15:54:04', NULL),
(491, 33, 'FERNANDO ANTONIO 080520.pdf', '66_1589298844.pdf', '2020-05-12 15:54:04', '2020-05-12 15:54:04', NULL),
(492, 33, 'FERNANDO MAYO 080520.pdf', '186_1589298844.pdf', '2020-05-12 15:54:04', '2020-05-12 15:54:04', NULL),
(493, 34, 'BBVA 150520.pdf', '419_1589925044.pdf', '2020-05-19 21:50:44', '2020-05-19 21:50:44', NULL),
(494, 34, 'INTERBANCARIOS 150520.pdf', '317_1589925044.pdf', '2020-05-19 21:50:44', '2020-05-19 21:50:44', NULL),
(495, 35, 'ABERLAY LEON 150520.pdf', '265_1589925804.pdf', '2020-05-19 22:03:24', '2020-05-19 22:03:24', NULL),
(496, 35, 'ALBERTO OBIL 150520.pdf', '460_1589925804.pdf', '2020-05-19 22:03:24', '2020-05-19 22:03:24', NULL),
(497, 35, 'ALEJANDRO RETAMA 150520.pdf', '180_1589925804.pdf', '2020-05-19 22:03:24', '2020-05-19 22:03:24', NULL),
(498, 35, 'ALEJANDRO RIOS 150520.pdf', '468_1589925804.pdf', '2020-05-19 22:03:24', '2020-05-19 22:03:24', NULL),
(499, 35, 'ALONSO LOPEZ 150520.pdf', '284_1589925804.pdf', '2020-05-19 22:03:24', '2020-05-19 22:03:24', NULL),
(500, 35, 'AUGUSTO HDEZ 150520.pdf', '1_1589925804.pdf', '2020-05-19 22:03:24', '2020-05-19 22:03:24', NULL),
(501, 35, 'AURELIO ZAPO 150520.pdf', '404_1589925804.pdf', '2020-05-19 22:03:24', '2020-05-19 22:03:24', NULL),
(502, 35, 'BENITO HUESCA 150520.pdf', '6_1589925804.pdf', '2020-05-19 22:03:24', '2020-05-19 22:03:24', NULL),
(503, 35, 'CELESTINO VILLANUEVA 150520.pdf', '260_1589925804.pdf', '2020-05-19 22:03:24', '2020-05-19 22:03:24', NULL),
(504, 35, 'CONCEPCION JIMENEZ 150520.pdf', '406_1589925804.pdf', '2020-05-19 22:03:24', '2020-05-19 22:03:24', NULL),
(505, 35, 'DANIEL C HDEZ 150520.pdf', '154_1589925804.pdf', '2020-05-19 22:03:24', '2020-05-19 22:03:24', NULL),
(506, 35, 'DANIEL I FDEZ 150520.pdf', '447_1589925804.pdf', '2020-05-19 22:03:24', '2020-05-19 22:03:24', NULL),
(507, 35, 'DANIEL MONTIEL 150520.pdf', '473_1589925804.pdf', '2020-05-19 22:03:24', '2020-05-19 22:03:24', NULL),
(508, 35, 'ERICK G TORNADO 150520.pdf', '386_1589925804.pdf', '2020-05-19 22:03:24', '2020-05-19 22:03:24', NULL),
(509, 35, 'EZEQUIAS ANTELE 150520.pdf', '146_1589925804.pdf', '2020-05-19 22:03:24', '2020-05-19 22:03:24', NULL),
(510, 35, 'FELIPE CARRASCO 150520.pdf', '269_1589925804.pdf', '2020-05-19 22:03:24', '2020-05-19 22:03:24', NULL),
(511, 35, 'FERNANDO ANTONIO 150520.pdf', '314_1589925804.pdf', '2020-05-19 22:03:24', '2020-05-19 22:03:24', NULL),
(512, 35, 'FERNANDO MAYO 150520.pdf', '475_1589925804.pdf', '2020-05-19 22:03:24', '2020-05-19 22:03:24', NULL),
(513, 35, 'FRANCISCO BEJARANO 150520.pdf', '384_1589925804.pdf', '2020-05-19 22:03:24', '2020-05-19 22:03:24', NULL),
(514, 35, 'FRANCISCO DOLORES 150520.pdf', '22_1589925804.pdf', '2020-05-19 22:03:24', '2020-05-19 22:03:24', NULL),
(515, 36, 'BBVA 220520.pdf', '324_1590530883.pdf', '2020-05-26 22:08:03', '2020-05-26 22:08:03', NULL),
(516, 36, 'INTERBANCARIOS 220520.pdf', '309_1590530883.pdf', '2020-05-26 22:08:03', '2020-05-26 22:08:03', NULL),
(517, 37, 'ABERLAY LEON 220520.pdf', '103_1590531593.pdf', '2020-05-26 22:19:53', '2020-05-26 22:19:53', NULL),
(518, 37, 'ALBERTO OBIL 220520.pdf', '359_1590531593.pdf', '2020-05-26 22:19:53', '2020-05-26 22:19:53', NULL),
(519, 37, 'ALEJANDRO RETAMA 220520.pdf', '130_1590531593.pdf', '2020-05-26 22:19:53', '2020-05-26 22:19:53', NULL),
(520, 37, 'ALEJANDRO RIOS 220520.pdf', '47_1590531593.pdf', '2020-05-26 22:19:53', '2020-05-26 22:19:53', NULL),
(521, 37, 'ALFREDO XOLO 220520.pdf', '196_1590531593.pdf', '2020-05-26 22:19:53', '2020-05-26 22:19:53', NULL),
(522, 37, 'ALONSO LOPEZ 220520.pdf', '5_1590531593.pdf', '2020-05-26 22:19:53', '2020-05-26 22:19:53', NULL),
(523, 37, 'AUGUSTO HDEZ 220520.pdf', '21_1590531593.pdf', '2020-05-26 22:19:53', '2020-05-26 22:19:53', NULL),
(524, 37, 'AURELIO ZAPO 220520.pdf', '253_1590531593.pdf', '2020-05-26 22:19:53', '2020-05-26 22:19:53', NULL),
(525, 37, 'BENITO HUESCA 220520.pdf', '172_1590531593.pdf', '2020-05-26 22:19:53', '2020-05-26 22:19:53', NULL),
(526, 37, 'CELESTINO VILLANUEVA 220520.pdf', '107_1590531593.pdf', '2020-05-26 22:19:53', '2020-05-26 22:19:53', NULL),
(527, 37, 'CONCEPCION JIMENEZ 220520.pdf', '249_1590531593.pdf', '2020-05-26 22:19:53', '2020-05-26 22:19:53', NULL),
(528, 37, 'DANIEL C HDEZ 220520.pdf', '19_1590531593.pdf', '2020-05-26 22:19:53', '2020-05-26 22:19:53', NULL),
(529, 37, 'DANIEL I FDEZ 220520.pdf', '131_1590531593.pdf', '2020-05-26 22:19:53', '2020-05-26 22:19:53', NULL),
(530, 37, 'DANIEL MONTIEL 220520.pdf', '422_1590531593.pdf', '2020-05-26 22:19:53', '2020-05-26 22:19:53', NULL),
(531, 37, 'ERICK G TORNADO 220520.pdf', '255_1590531593.pdf', '2020-05-26 22:19:53', '2020-05-26 22:19:53', NULL),
(532, 37, 'EZEQUIAS ANTELE 220520.pdf', '296_1590531593.pdf', '2020-05-26 22:19:53', '2020-05-26 22:19:53', NULL),
(533, 37, 'FELIPE CARRASCO 220520.pdf', '61_1590531593.pdf', '2020-05-26 22:19:53', '2020-05-26 22:19:53', NULL),
(534, 37, 'FERNANDO ANTONIO 220520.pdf', '453_1590531593.pdf', '2020-05-26 22:19:53', '2020-05-26 22:19:53', NULL),
(535, 37, 'FERNANDO MAYO 220520.pdf', '347_1590531593.pdf', '2020-05-26 22:19:53', '2020-05-26 22:19:53', NULL),
(536, 37, 'FRANCISCO DOLORES 220520.pdf', '263_1590531593.pdf', '2020-05-26 22:19:53', '2020-05-26 22:19:53', NULL),
(537, 38, 'BBVA 290520.pdf', '375_1591811362.pdf', '2020-06-10 17:49:22', '2020-06-10 17:49:22', NULL),
(538, 38, 'INTERBANCARIOS 290520.pdf', '498_1591811362.pdf', '2020-06-10 17:49:22', '2020-06-10 17:49:22', NULL),
(539, 39, 'ABERLAY LEON 290520.pdf', '325_1591811940.pdf', '2020-06-10 17:59:00', '2020-06-10 17:59:00', NULL),
(540, 39, 'ALBERTO OBIL 290520.pdf', '52_1591811940.pdf', '2020-06-10 17:59:00', '2020-06-10 17:59:00', NULL),
(541, 39, 'ALEJANDRO RETAMA 290520.pdf', '130_1591811940.pdf', '2020-06-10 17:59:00', '2020-06-10 17:59:00', NULL),
(542, 39, 'ALEJANDRO RIOS 290520.pdf', '21_1591811940.pdf', '2020-06-10 17:59:00', '2020-06-10 17:59:00', NULL),
(543, 39, 'ALFREDO XOLO 290520.pdf', '198_1591811940.pdf', '2020-06-10 17:59:00', '2020-06-10 17:59:00', NULL),
(544, 39, 'ALONSO LOPEZ 290520.pdf', '369_1591811940.pdf', '2020-06-10 17:59:00', '2020-06-10 17:59:00', NULL),
(545, 39, 'AUGUSTO HDEZ 290520.pdf', '236_1591811940.pdf', '2020-06-10 17:59:00', '2020-06-10 17:59:00', NULL),
(546, 39, 'AURELIO ZAPO 290520.pdf', '248_1591811940.pdf', '2020-06-10 17:59:00', '2020-06-10 17:59:00', NULL),
(547, 39, 'BENITO HUESCA 290520.pdf', '245_1591811940.pdf', '2020-06-10 17:59:00', '2020-06-10 17:59:00', NULL),
(548, 39, 'CELESTINO VILLANUEVA 290520.pdf', '382_1591811940.pdf', '2020-06-10 17:59:00', '2020-06-10 17:59:00', NULL),
(549, 39, 'CONCEPCION JIMENEZ 290520.pdf', '476_1591811940.pdf', '2020-06-10 17:59:00', '2020-06-10 17:59:00', NULL),
(550, 39, 'DANIEL C HDEZ 290520.pdf', '253_1591811940.pdf', '2020-06-10 17:59:00', '2020-06-10 17:59:00', NULL),
(551, 39, 'DANIEL I FDEZ 290520.pdf', '208_1591811940.pdf', '2020-06-10 17:59:00', '2020-06-10 17:59:00', NULL),
(552, 39, 'DANIEL MONTIEL 290520.pdf', '59_1591811940.pdf', '2020-06-10 17:59:00', '2020-06-10 17:59:00', NULL),
(553, 39, 'ERICK G TORNADO 290520.pdf', '31_1591811940.pdf', '2020-06-10 17:59:00', '2020-06-10 17:59:00', NULL),
(554, 39, 'EZEQUIAS ANTELE 290520.pdf', '94_1591811940.pdf', '2020-06-10 17:59:00', '2020-06-10 17:59:00', NULL),
(555, 39, 'FELIPE CARRASCO 290520.pdf', '439_1591811940.pdf', '2020-06-10 17:59:00', '2020-06-10 17:59:00', NULL),
(556, 39, 'FERNANDO ANTONIO 290520.pdf', '86_1591811940.pdf', '2020-06-10 17:59:00', '2020-06-10 17:59:00', NULL),
(557, 39, 'FERNANDO MAYO 290520.pdf', '43_1591811940.pdf', '2020-06-10 17:59:00', '2020-06-10 17:59:00', NULL),
(558, 39, 'FRANCISCO BEJARANO 290520.pdf', '350_1591811940.pdf', '2020-06-10 17:59:00', '2020-06-10 17:59:00', NULL),
(559, 40, 'BBVA 050620.pdf', '407_1591812019.pdf', '2020-06-10 18:00:19', '2020-06-10 18:00:19', NULL),
(560, 40, 'INTERBANCARIOS 050620.pdf', '236_1591812019.pdf', '2020-06-10 18:00:19', '2020-06-10 18:00:19', NULL),
(561, 41, 'ABERLAY LEON 050620.pdf', '251_1591812634.pdf', '2020-06-10 18:10:34', '2020-06-10 18:10:34', NULL),
(562, 41, 'ALBERTO OBIL 050620.pdf', '259_1591812634.pdf', '2020-06-10 18:10:34', '2020-06-10 18:10:34', NULL),
(563, 41, 'ALEJANDRO RETAMA 050620.pdf', '116_1591812634.pdf', '2020-06-10 18:10:34', '2020-06-10 18:10:34', NULL),
(564, 41, 'ALEJANDRO RIOS 050620.pdf', '104_1591812634.pdf', '2020-06-10 18:10:34', '2020-06-10 18:10:34', NULL),
(565, 41, 'ALFREDO XOLO 050620.pdf', '314_1591812634.pdf', '2020-06-10 18:10:34', '2020-06-10 18:10:34', NULL),
(566, 41, 'ALONSO LOPEZ 050620.pdf', '451_1591812634.pdf', '2020-06-10 18:10:34', '2020-06-10 18:10:34', NULL),
(567, 41, 'AUGUSTO HDEZ 050620.pdf', '216_1591812634.pdf', '2020-06-10 18:10:34', '2020-06-10 18:10:34', NULL),
(568, 41, 'AURELIO ZAPO 050620.pdf', '200_1591812634.pdf', '2020-06-10 18:10:34', '2020-06-10 18:10:34', NULL),
(569, 41, 'BENITO HUESCA 050620.pdf', '450_1591812634.pdf', '2020-06-10 18:10:34', '2020-06-10 18:10:34', NULL),
(570, 41, 'CELESTINO VILLANUEVA 050620.pdf', '494_1591812634.pdf', '2020-06-10 18:10:34', '2020-06-10 18:10:34', NULL),
(571, 41, 'CONCEPCION JIMENEZ 050620.pdf', '472_1591812634.pdf', '2020-06-10 18:10:34', '2020-06-10 18:10:34', NULL),
(572, 41, 'DANIEL C HDEZ 050620.pdf', '111_1591812634.pdf', '2020-06-10 18:10:34', '2020-06-10 18:10:34', NULL),
(573, 41, 'DANIEL I FDEZ 050620.pdf', '161_1591812634.pdf', '2020-06-10 18:10:34', '2020-06-10 18:10:34', NULL),
(574, 41, 'DANIEL MONTIEL 050620.pdf', '362_1591812634.pdf', '2020-06-10 18:10:34', '2020-06-10 18:10:34', NULL),
(575, 41, 'ERICK G TORNADO 050620.pdf', '332_1591812634.pdf', '2020-06-10 18:10:34', '2020-06-10 18:10:34', NULL),
(576, 41, 'EZEQUIAS ANTELE 050620.pdf', '123_1591812634.pdf', '2020-06-10 18:10:34', '2020-06-10 18:10:34', NULL),
(577, 41, 'FELIPE CARRASCO 050620.pdf', '305_1591812634.pdf', '2020-06-10 18:10:34', '2020-06-10 18:10:34', NULL),
(578, 41, 'FERNANDO ANTONIO 050620.pdf', '211_1591812634.pdf', '2020-06-10 18:10:34', '2020-06-10 18:10:34', NULL),
(579, 41, 'FERNANDO MAYO 050620.pdf', '341_1591812634.pdf', '2020-06-10 18:10:34', '2020-06-10 18:10:34', NULL),
(580, 41, 'FRANCISCO BEJARANO 050620.pdf', '346_1591812635.pdf', '2020-06-10 18:10:35', '2020-06-10 18:10:35', NULL),
(581, 42, 'BBVA 120620.pdf', '219_1592671027.pdf', '2020-06-20 16:37:07', '2020-06-20 16:37:07', NULL),
(582, 42, 'INTERBANCARIOS 120620.pdf', '295_1592671027.pdf', '2020-06-20 16:37:07', '2020-06-20 16:37:07', NULL),
(583, 43, 'ABERLAY LEON 120620.pdf', '475_1592671595.pdf', '2020-06-20 16:46:35', '2020-06-20 16:46:35', NULL),
(584, 43, 'ADRIAN VERTIZ 120620.pdf', '103_1592671596.pdf', '2020-06-20 16:46:36', '2020-06-20 16:46:36', NULL),
(585, 43, 'ALBERTO OBIL 120620.pdf', '359_1592671596.pdf', '2020-06-20 16:46:36', '2020-06-20 16:46:36', NULL),
(586, 43, 'ALEJANDRO RETAMA 120620.pdf', '460_1592671596.pdf', '2020-06-20 16:46:36', '2020-06-20 16:46:36', NULL),
(587, 43, 'ALEJANDRO RIOS 120620 (2).pdf', '112_1592671596.pdf', '2020-06-20 16:46:36', '2020-06-20 16:46:36', NULL),
(588, 43, 'ALEJANDRO RIOS 120620.pdf', '366_1592671596.pdf', '2020-06-20 16:46:36', '2020-06-20 16:46:36', NULL),
(589, 43, 'ALFREDO XOLO 120620.pdf', '305_1592671596.pdf', '2020-06-20 16:46:36', '2020-06-20 16:46:36', NULL),
(590, 43, 'ALONSO LOPEZ 120620.pdf', '402_1592671596.pdf', '2020-06-20 16:46:36', '2020-06-20 16:46:36', NULL),
(591, 43, 'AUGUSTO HDEZ 120620.pdf', '205_1592671596.pdf', '2020-06-20 16:46:36', '2020-06-20 16:46:36', NULL),
(592, 43, 'AURELIO ZAPO 120620.pdf', '462_1592671596.pdf', '2020-06-20 16:46:36', '2020-06-20 16:46:36', NULL),
(593, 43, 'BENITO HUESCA 120620.pdf', '248_1592671596.pdf', '2020-06-20 16:46:36', '2020-06-20 16:46:36', NULL),
(594, 43, 'CELESTINO VILLANUEVA 120620.pdf', '468_1592671596.pdf', '2020-06-20 16:46:36', '2020-06-20 16:46:36', NULL),
(595, 43, 'CONCEPCION JIMENEZ 120620.pdf', '220_1592671596.pdf', '2020-06-20 16:46:36', '2020-06-20 16:46:36', NULL),
(596, 43, 'DANIEL C HDEZ 120620.pdf', '16_1592671596.pdf', '2020-06-20 16:46:36', '2020-06-20 16:46:36', NULL),
(597, 43, 'DANIEL I FDEZ 120620.pdf', '444_1592671596.pdf', '2020-06-20 16:46:36', '2020-06-20 16:46:36', NULL),
(598, 43, 'DANIEL MONTIEL 120620 (2).pdf', '66_1592671596.pdf', '2020-06-20 16:46:36', '2020-06-20 16:46:36', NULL),
(599, 43, 'DANIEL MONTIEL 120620.pdf', '331_1592671596.pdf', '2020-06-20 16:46:36', '2020-06-20 16:46:36', NULL),
(600, 43, 'ERICK G TORNADO 120620.pdf', '371_1592671596.pdf', '2020-06-20 16:46:36', '2020-06-20 16:46:36', NULL),
(601, 43, 'EZEQUIAS ANTELE 120620.pdf', '482_1592671596.pdf', '2020-06-20 16:46:36', '2020-06-20 16:46:36', NULL),
(602, 43, 'FEDERICO HUESCA 120620.pdf', '378_1592671596.pdf', '2020-06-20 16:46:36', '2020-06-20 16:46:36', NULL),
(603, 44, 'INTERBANCARIOS 190620.pdf', '429_1592677453.pdf', '2020-06-20 18:24:13', '2020-06-20 18:24:13', NULL),
(604, 44, 'BBVA 190620.pdf', '486_1592677453.pdf', '2020-06-20 18:24:13', '2020-06-20 18:24:13', NULL),
(605, 45, 'ABERLAY LEON 190620.pdf', '136_1592865837.pdf', '2020-06-22 22:43:57', '2020-06-22 22:43:57', NULL),
(606, 45, 'ADRIAN VERTIZ 190620.pdf', '276_1592865837.pdf', '2020-06-22 22:43:57', '2020-06-22 22:43:57', NULL),
(607, 45, 'ALBERTO OBIL 190620.pdf', '59_1592865837.pdf', '2020-06-22 22:43:57', '2020-06-22 22:43:57', NULL),
(608, 45, 'ALEJANDRO RETAMA 190620.pdf', '274_1592865837.pdf', '2020-06-22 22:43:57', '2020-06-22 22:43:57', NULL),
(609, 45, 'ALEJANDRO RIOS 190620.pdf', '336_1592865837.pdf', '2020-06-22 22:43:57', '2020-06-22 22:43:57', NULL),
(610, 45, 'ALFREDO XOLO 190620.pdf', '18_1592865837.pdf', '2020-06-22 22:43:57', '2020-06-22 22:43:57', NULL),
(611, 45, 'ALONSO LOPEZ 190620.pdf', '110_1592865837.pdf', '2020-06-22 22:43:57', '2020-06-22 22:43:57', NULL),
(612, 45, 'AUGUSTO HDEZ 190620.pdf', '217_1592865837.pdf', '2020-06-22 22:43:57', '2020-06-22 22:43:57', NULL),
(613, 45, 'AURELIO ZAPO 190620.pdf', '12_1592865837.pdf', '2020-06-22 22:43:57', '2020-06-22 22:43:57', NULL),
(614, 45, 'BENITO HUESCA 190620.pdf', '228_1592865837.pdf', '2020-06-22 22:43:57', '2020-06-22 22:43:57', NULL),
(615, 45, 'CELESTINO VILLANUEVA 190620.pdf', '111_1592865837.pdf', '2020-06-22 22:43:57', '2020-06-22 22:43:57', NULL),
(616, 45, 'CONCEPCION JIMENEZ 190620.pdf', '76_1592865837.pdf', '2020-06-22 22:43:57', '2020-06-22 22:43:57', NULL),
(617, 45, 'DANIEL C HDEZ 190620.pdf', '303_1592865837.pdf', '2020-06-22 22:43:57', '2020-06-22 22:43:57', NULL),
(618, 45, 'DANIEL MONTIEL 190620.pdf', '117_1592865837.pdf', '2020-06-22 22:43:57', '2020-06-22 22:43:57', NULL),
(619, 45, 'ERICK G TORNADO 190620.pdf', '228_1592865837.pdf', '2020-06-22 22:43:57', '2020-06-22 22:43:57', NULL),
(620, 45, 'EZEQUIAS ANTELE 190620.pdf', '238_1592865837.pdf', '2020-06-22 22:43:57', '2020-06-22 22:43:57', NULL),
(621, 45, 'FEDERICO HUESCA 190620.pdf', '491_1592865837.pdf', '2020-06-22 22:43:57', '2020-06-22 22:43:57', NULL),
(622, 45, 'FELIPE CARRASCO 190620.pdf', '452_1592865837.pdf', '2020-06-22 22:43:57', '2020-06-22 22:43:57', NULL),
(623, 45, 'FERNANDO ANTONIO 190620.pdf', '310_1592865837.pdf', '2020-06-22 22:43:57', '2020-06-22 22:43:57', NULL),
(624, 45, 'FERNANDO MAYO 190620.pdf', '119_1592865837.pdf', '2020-06-22 22:43:57', '2020-06-22 22:43:57', NULL),
(625, 46, 'BBVA 260620.pdf', '40_1594049495.pdf', '2020-07-06 15:31:35', '2020-07-06 15:31:35', NULL),
(626, 46, 'INTERBANCARIOS 260620.pdf', '390_1594049495.pdf', '2020-07-06 15:31:35', '2020-07-06 15:31:35', NULL),
(627, 46, 'BBVA 300620.pdf', '123_1594049495.pdf', '2020-07-06 15:31:35', '2020-07-06 15:31:35', NULL),
(628, 46, 'INTERBANCARIOS 300620.pdf', '5_1594049495.pdf', '2020-07-06 15:31:35', '2020-07-06 15:31:35', NULL),
(629, 46, 'MARCOS LOPEZ 300620.pdf', '19_1594049495.pdf', '2020-07-06 15:31:35', '2020-07-06 15:31:35', NULL),
(630, 47, 'ALEJANDRO RETAMA 260620.pdf', '254_1594050967.pdf', '2020-07-06 15:56:07', '2020-07-06 15:56:07', NULL),
(631, 47, 'ALEJANDRO RIOS 260620.pdf', '174_1594050967.pdf', '2020-07-06 15:56:07', '2020-07-06 15:56:07', NULL),
(632, 47, 'BENITO HUESCA 260620.pdf', '243_1594050967.pdf', '2020-07-06 15:56:07', '2020-07-06 15:56:07', NULL),
(633, 47, 'CELESTINO VILLANUEVA 260620.pdf', '343_1594050967.pdf', '2020-07-06 15:56:07', '2020-07-06 15:56:07', NULL),
(634, 47, 'CONCEPCION JIMENEZ 260620.pdf', '448_1594050967.pdf', '2020-07-06 15:56:07', '2020-07-06 15:56:07', NULL),
(635, 47, 'DANIEL I FDEZ 260620.pdf', '130_1594050967.pdf', '2020-07-06 15:56:07', '2020-07-06 15:56:07', NULL),
(636, 47, 'ERICK G TORNADO 260620.pdf', '325_1594050967.pdf', '2020-07-06 15:56:07', '2020-07-06 15:56:07', NULL),
(637, 47, 'FEDERICO HUESCA 260620.pdf', '382_1594050967.pdf', '2020-07-06 15:56:07', '2020-07-06 15:56:07', NULL),
(638, 47, 'FELIPE CARRASCO 260620.pdf', '394_1594050967.pdf', '2020-07-06 15:56:07', '2020-07-06 15:56:07', NULL),
(639, 47, 'FERNANDO MAYO 260620.pdf', '427_1594050967.pdf', '2020-07-06 15:56:07', '2020-07-06 15:56:07', NULL),
(640, 47, 'FRANCISCO BEJARANO 260620.pdf', '427_1594050967.pdf', '2020-07-06 15:56:07', '2020-07-06 15:56:07', NULL),
(641, 47, 'FRANCISCO J RUIZ 260620.pdf', '394_1594050967.pdf', '2020-07-06 15:56:07', '2020-07-06 15:56:07', NULL),
(642, 47, 'HECTOR M GUZMAN 260620.pdf', '209_1594050967.pdf', '2020-07-06 15:56:07', '2020-07-06 15:56:07', NULL),
(643, 47, 'HIPOLITO A PULIDO 260620.pdf', '20_1594050967.pdf', '2020-07-06 15:56:07', '2020-07-06 15:56:07', NULL),
(644, 47, 'HUGO A BOLAÑOS 260620.pdf', '403_1594050967.pdf', '2020-07-06 15:56:07', '2020-07-06 15:56:07', NULL),
(645, 47, 'IGNACIO MURILLO 260620.pdf', '115_1594050967.pdf', '2020-07-06 15:56:07', '2020-07-06 15:56:07', NULL),
(646, 47, 'IRAM G HUESCA 260620.pdf', '262_1594050967.pdf', '2020-07-06 15:56:07', '2020-07-06 15:56:07', NULL),
(647, 47, 'ISMAEL RENERO 260620.pdf', '332_1594050967.pdf', '2020-07-06 15:56:07', '2020-07-06 15:56:07', NULL),
(648, 47, 'JAIME R NOLASCO 260620.pdf', '250_1594050967.pdf', '2020-07-06 15:56:07', '2020-07-06 15:56:07', NULL),
(649, 47, 'JAIME SOTO 260620.pdf', '120_1594050967.pdf', '2020-07-06 15:56:07', '2020-07-06 15:56:07', NULL),
(650, 48, 'BBVA 030720.pdf', '312_1594653638.pdf', '2020-07-13 15:20:38', '2020-07-13 15:20:38', NULL),
(651, 48, 'INTERBANCARIOS 030720.pdf', '201_1594653638.pdf', '2020-07-13 15:20:38', '2020-07-13 15:20:38', NULL),
(652, 48, 'JAIRO IVAN 040720.pdf', '154_1594653638.pdf', '2020-07-13 15:20:38', '2020-07-13 15:20:38', NULL),
(653, 48, 'MARCOS LOPEZ 030720.pdf', '379_1594653638.pdf', '2020-07-13 15:20:38', '2020-07-13 15:20:38', NULL),
(654, 49, 'ABERLAY LEON 030720.pdf', '424_1594654152.pdf', '2020-07-13 15:29:12', '2020-07-13 15:29:12', NULL),
(655, 49, 'ALBERTO OBIL 030720.pdf', '157_1594654152.pdf', '2020-07-13 15:29:12', '2020-07-13 15:29:12', NULL),
(656, 49, 'ALEJANDRO RETAMA 030720.pdf', '490_1594654152.pdf', '2020-07-13 15:29:12', '2020-07-13 15:29:12', NULL),
(657, 49, 'ALFREDO XOLO 030720.pdf', '382_1594654152.pdf', '2020-07-13 15:29:12', '2020-07-13 15:29:12', NULL),
(658, 49, 'AUGUSTO HDEZ 030720.pdf', '294_1594654152.pdf', '2020-07-13 15:29:12', '2020-07-13 15:29:12', NULL),
(659, 49, 'AURELIO ZAPO 030720.pdf', '415_1594654152.pdf', '2020-07-13 15:29:12', '2020-07-13 15:29:12', NULL),
(660, 49, 'BENITO HUESCA 030720.pdf', '455_1594654152.pdf', '2020-07-13 15:29:12', '2020-07-13 15:29:12', NULL),
(661, 49, 'CELESTINO VILLANUEVA 030720.pdf', '357_1594654152.pdf', '2020-07-13 15:29:12', '2020-07-13 15:29:12', NULL),
(662, 49, 'CONCEPCION JIMENEZ 030720.pdf', '352_1594654152.pdf', '2020-07-13 15:29:12', '2020-07-13 15:29:12', NULL),
(663, 49, 'DANIEL C HDEZ 030720.pdf', '23_1594654152.pdf', '2020-07-13 15:29:12', '2020-07-13 15:29:12', NULL),
(664, 49, 'DANIEL I FDEZ 030720.pdf', '110_1594654152.pdf', '2020-07-13 15:29:12', '2020-07-13 15:29:12', NULL),
(665, 49, 'DANIEL MONTIEL 030720.pdf', '224_1594654152.pdf', '2020-07-13 15:29:12', '2020-07-13 15:29:12', NULL),
(666, 49, 'ERICK G TORNADO 030720.pdf', '301_1594654152.pdf', '2020-07-13 15:29:12', '2020-07-13 15:29:12', NULL),
(667, 49, 'EZEQUIAS ANTELE 030720.pdf', '269_1594654152.pdf', '2020-07-13 15:29:12', '2020-07-13 15:29:12', NULL),
(668, 49, 'FEDERICO HUESCA 030720.pdf', '205_1594654152.pdf', '2020-07-13 15:29:12', '2020-07-13 15:29:12', NULL),
(669, 49, 'FELIPE CARRASCO 030720.pdf', '84_1594654152.pdf', '2020-07-13 15:29:12', '2020-07-13 15:29:12', NULL),
(670, 49, 'FERNANDO ANTONIO 030720.pdf', '386_1594654152.pdf', '2020-07-13 15:29:12', '2020-07-13 15:29:12', NULL),
(671, 49, 'FERNANDO MAYO 030720.pdf', '39_1594654152.pdf', '2020-07-13 15:29:12', '2020-07-13 15:29:12', NULL),
(672, 49, 'FRANCISCO BEJARANO 030720.pdf', '438_1594654152.pdf', '2020-07-13 15:29:12', '2020-07-13 15:29:12', NULL),
(673, 49, 'FRANCISCO DOLORES 030720.pdf', '61_1594654152.pdf', '2020-07-13 15:29:12', '2020-07-13 15:29:12', NULL),
(674, 50, 'ABERLAY LEON 140720.pdf', '238_1595259996.pdf', '2020-07-20 15:46:36', '2020-07-20 15:46:36', NULL),
(675, 50, 'ALBERTO OBIL 140720.pdf', '406_1595259996.pdf', '2020-07-20 15:46:36', '2020-07-20 15:46:36', NULL),
(676, 50, 'ALEJANDRO RETAMA 140720.pdf', '130_1595259996.pdf', '2020-07-20 15:46:36', '2020-07-20 15:46:36', NULL),
(677, 50, 'ALEJANDRO RIOS 140720.pdf', '414_1595259996.pdf', '2020-07-20 15:46:36', '2020-07-20 15:46:36', NULL),
(678, 50, 'AURELIO ZAPO 140720.pdf', '422_1595259996.pdf', '2020-07-20 15:46:36', '2020-07-20 15:46:36', NULL),
(679, 50, 'BENITO HUESCA 140720.pdf', '198_1595259996.pdf', '2020-07-20 15:46:36', '2020-07-20 15:46:36', NULL),
(680, 50, 'CELESTINO VILLANUEVA 140720.pdf', '295_1595259996.pdf', '2020-07-20 15:46:36', '2020-07-20 15:46:36', NULL),
(681, 50, 'CONCEPCION JIMENEZ 140720.pdf', '71_1595259996.pdf', '2020-07-20 15:46:36', '2020-07-20 15:46:36', NULL),
(682, 50, 'DANIEL C HDEZ 140720.pdf', '133_1595259996.pdf', '2020-07-20 15:46:36', '2020-07-20 15:46:36', NULL),
(683, 50, 'DANIEL I FDEZ 140720.pdf', '93_1595259996.pdf', '2020-07-20 15:46:36', '2020-07-20 15:46:36', NULL),
(684, 50, 'DANIEL MONTIEL 140720.pdf', '300_1595259996.pdf', '2020-07-20 15:46:36', '2020-07-20 15:46:36', NULL),
(685, 50, 'ERICK G TORNADO 140720.pdf', '384_1595259996.pdf', '2020-07-20 15:46:36', '2020-07-20 15:46:36', NULL),
(686, 50, 'EZEQUIAS ANTELE 140720.pdf', '430_1595259996.pdf', '2020-07-20 15:46:36', '2020-07-20 15:46:36', NULL),
(687, 50, 'FEDERICO HUESCA 140720.pdf', '467_1595259996.pdf', '2020-07-20 15:46:36', '2020-07-20 15:46:36', NULL),
(688, 50, 'FELIPE CARRASCO 140720.pdf', '293_1595259996.pdf', '2020-07-20 15:46:36', '2020-07-20 15:46:36', NULL),
(689, 50, 'FERNANDO ANTONIO 140720.pdf', '417_1595259996.pdf', '2020-07-20 15:46:36', '2020-07-20 15:46:36', NULL),
(690, 50, 'FERNANDO MAYO 140720.pdf', '373_1595259996.pdf', '2020-07-20 15:46:36', '2020-07-20 15:46:36', NULL),
(691, 50, 'FRANCISCO BEJARANO 140720.pdf', '380_1595259996.pdf', '2020-07-20 15:46:36', '2020-07-20 15:46:36', NULL),
(692, 50, 'FRANCISCO DOLORES 140720.pdf', '385_1595259996.pdf', '2020-07-20 15:46:36', '2020-07-20 15:46:36', NULL),
(693, 50, 'FRANCISCO J RUIZ 140720.pdf', '212_1595259996.pdf', '2020-07-20 15:46:36', '2020-07-20 15:46:36', NULL),
(694, 51, 'BBVA 100720.pdf', '173_1595260254.pdf', '2020-07-20 15:50:54', '2020-07-20 15:50:54', NULL),
(695, 51, 'INTERBANCARIOS 100720.pdf', '220_1595260254.pdf', '2020-07-20 15:50:54', '2020-07-20 15:50:54', NULL),
(696, 51, 'BBVA 110720.pdf', '297_1595260254.pdf', '2020-07-20 15:50:54', '2020-07-20 15:50:54', NULL),
(697, 51, 'INTERBANCARIOS 110720.pdf', '20_1595260254.pdf', '2020-07-20 15:50:54', '2020-07-20 15:50:54', NULL),
(698, 52, 'ALEJANDRO RETAMA 100720.pdf', '334_1595260512.pdf', '2020-07-20 15:55:12', '2020-07-20 15:55:12', NULL),
(699, 52, 'ALEJANDRO RIOS 100720.pdf', '123_1595260512.pdf', '2020-07-20 15:55:12', '2020-07-20 15:55:12', NULL),
(700, 52, 'BENITO HUESCA 100720.pdf', '185_1595260512.pdf', '2020-07-20 15:55:12', '2020-07-20 15:55:12', NULL),
(701, 52, 'CELESTINO VILLANUEVA 100720.pdf', '499_1595260512.pdf', '2020-07-20 15:55:12', '2020-07-20 15:55:12', NULL),
(702, 52, 'CONCEPCION JIMENEZ 100720.pdf', '70_1595260512.pdf', '2020-07-20 15:55:12', '2020-07-20 15:55:12', NULL),
(703, 52, 'DANIEL I FDEZ 100720.pdf', '148_1595260512.pdf', '2020-07-20 15:55:12', '2020-07-20 15:55:12', NULL),
(704, 52, 'ERICK G TORNADO 100720.pdf', '352_1595260512.pdf', '2020-07-20 15:55:12', '2020-07-20 15:55:12', NULL),
(705, 52, 'FEDERICO HUESCA 100720.pdf', '472_1595260512.pdf', '2020-07-20 15:55:12', '2020-07-20 15:55:12', NULL),
(706, 52, 'FELIPE CARRASCO 100720.pdf', '33_1595260512.pdf', '2020-07-20 15:55:12', '2020-07-20 15:55:12', NULL),
(707, 52, 'FERNANDO MAYO 100720.pdf', '384_1595260512.pdf', '2020-07-20 15:55:12', '2020-07-20 15:55:12', NULL),
(708, 52, 'FRANCISCO BEJARANO 100720.pdf', '319_1595260512.pdf', '2020-07-20 15:55:12', '2020-07-20 15:55:12', NULL),
(709, 52, 'FRANCISCO J RUIZ 100720.pdf', '4_1595260512.pdf', '2020-07-20 15:55:12', '2020-07-20 15:55:12', NULL),
(710, 52, 'HIPOLITO A PULIDO 100720.pdf', '394_1595260512.pdf', '2020-07-20 15:55:12', '2020-07-20 15:55:12', NULL),
(711, 52, 'HUGO A BOLAÑOS 100720.pdf', '382_1595260512.pdf', '2020-07-20 15:55:12', '2020-07-20 15:55:12', NULL),
(712, 52, 'IGNACIO MURILLO 100720(2).pdf', '497_1595260512.pdf', '2020-07-20 15:55:12', '2020-07-20 15:55:12', NULL),
(713, 52, 'IGNACIO MURILLO 100720.pdf', '382_1595260512.pdf', '2020-07-20 15:55:12', '2020-07-20 15:55:12', NULL),
(714, 52, 'IRAM G HUESCA 100720.pdf', '123_1595260512.pdf', '2020-07-20 15:55:12', '2020-07-20 15:55:12', NULL),
(715, 52, 'ISMAEL RENERO 100720.pdf', '362_1595260512.pdf', '2020-07-20 15:55:12', '2020-07-20 15:55:12', NULL),
(716, 52, 'JAIME R NOLASCO 100720.pdf', '227_1595260512.pdf', '2020-07-20 15:55:12', '2020-07-20 15:55:12', NULL),
(717, 52, 'JAIME SOTO 100720.pdf', '72_1595260512.pdf', '2020-07-20 15:55:12', '2020-07-20 15:55:12', NULL),
(718, 53, 'BBVA 160720.pdf', '393_1595260577.pdf', '2020-07-20 15:56:17', '2020-07-20 15:56:17', NULL),
(719, 53, 'INTERBANCARIOS 160720.pdf', '151_1595260577.pdf', '2020-07-20 15:56:17', '2020-07-20 15:56:17', NULL),
(720, 54, 'ABERLAY LEON 160720.pdf', '10_1595260763.pdf', '2020-07-20 15:59:23', '2020-07-20 15:59:23', NULL),
(721, 54, 'ALBERTO OBIL 160720.pdf', '441_1595260763.pdf', '2020-07-20 15:59:23', '2020-07-20 15:59:23', NULL),
(722, 54, 'ALFREDO XOLO 160720.pdf', '251_1595260763.pdf', '2020-07-20 15:59:23', '2020-07-20 15:59:23', NULL),
(723, 54, 'AUGUSTO HDEZ 160720.pdf', '149_1595260763.pdf', '2020-07-20 15:59:23', '2020-07-20 15:59:23', NULL),
(724, 54, 'AURELIO ZAPO 160720.pdf', '472_1595260763.pdf', '2020-07-20 15:59:23', '2020-07-20 15:59:23', NULL),
(725, 54, 'DANIEL C HDEZ 160720.pdf', '231_1595260763.pdf', '2020-07-20 15:59:23', '2020-07-20 15:59:23', NULL),
(726, 54, 'DANIEL MONTIEL 160720.pdf', '224_1595260763.pdf', '2020-07-20 15:59:23', '2020-07-20 15:59:23', NULL),
(727, 54, 'EZEQUIAS ANTELE 160720.pdf', '457_1595260763.pdf', '2020-07-20 15:59:23', '2020-07-20 15:59:23', NULL),
(728, 54, 'FERNANDO ANTONIO 160720.pdf', '237_1595260763.pdf', '2020-07-20 15:59:23', '2020-07-20 15:59:23', NULL),
(729, 54, 'FRANCISCO DOLORES 160720.pdf', '414_1595260763.pdf', '2020-07-20 15:59:23', '2020-07-20 15:59:23', NULL),
(730, 54, 'GUILLERMO S CELAYA 160720.pdf', '270_1595260763.pdf', '2020-07-20 15:59:23', '2020-07-20 15:59:23', NULL),
(731, 54, 'HECTOR MOLINA 160720.pdf', '193_1595260763.pdf', '2020-07-20 15:59:23', '2020-07-20 15:59:23', NULL),
(732, 54, 'HILARIO MOZO 160720.pdf', '98_1595260763.pdf', '2020-07-20 15:59:23', '2020-07-20 15:59:23', NULL),
(733, 54, 'IGNACIO M TENORIO 160720.pdf', '148_1595260763.pdf', '2020-07-20 15:59:23', '2020-07-20 15:59:23', NULL),
(734, 54, 'IRVING MENDEZ 160720.pdf', '244_1595260763.pdf', '2020-07-20 15:59:23', '2020-07-20 15:59:23', NULL),
(735, 54, 'JIMMY H MENDEZ 160720.pdf', '9_1595260763.pdf', '2020-07-20 15:59:23', '2020-07-20 15:59:23', NULL),
(736, 54, 'JORGE A ESCRIBANO 160720.pdf', '493_1595260763.pdf', '2020-07-20 15:59:23', '2020-07-20 15:59:23', NULL),
(737, 54, 'JORGE L DGUEZ 160720.pdf', '8_1595260763.pdf', '2020-07-20 15:59:23', '2020-07-20 15:59:23', NULL),
(738, 54, 'JOSE L VERGARA 160720.pdf', '409_1595260764.pdf', '2020-07-20 15:59:24', '2020-07-20 15:59:24', NULL),
(739, 54, 'JUAN C VERGARA 160720.pdf', '42_1595260764.pdf', '2020-07-20 15:59:24', '2020-07-20 15:59:24', NULL),
(740, 55, 'BBVA 170720.pdf', '200_1595869187.pdf', '2020-07-27 16:59:47', '2020-07-27 16:59:47', NULL),
(741, 55, 'INTERBANCARIOS 170720.pdf', '81_1595869187.pdf', '2020-07-27 16:59:47', '2020-07-27 16:59:47', NULL),
(742, 55, 'RAYMUNDO LOPEZ 170720.pdf', '274_1595869187.pdf', '2020-07-27 16:59:47', '2020-07-27 16:59:47', NULL),
(743, 55, 'BBVA 170720.pdf', '270_1595869187.pdf', '2020-07-27 16:59:47', '2020-07-27 16:59:47', NULL),
(744, 55, 'INTERBANCARIOS 170720.pdf', '177_1595869187.pdf', '2020-07-27 16:59:47', '2020-07-27 16:59:47', NULL),
(745, 56, 'ALEJANDRO RETAMA 170720.pdf', '226_1595869486.pdf', '2020-07-27 17:04:46', '2020-07-27 17:04:46', NULL),
(746, 56, 'ALEJANDRO RIOS 170720.pdf', '282_1595869486.pdf', '2020-07-27 17:04:46', '2020-07-27 17:04:46', NULL),
(747, 56, 'BENITO HUESCA 170720.pdf', '435_1595869486.pdf', '2020-07-27 17:04:46', '2020-07-27 17:04:46', NULL),
(748, 56, 'CELESTINO VILLANUEVA 170720.pdf', '179_1595869486.pdf', '2020-07-27 17:04:46', '2020-07-27 17:04:46', NULL),
(749, 56, 'CONCEPCION JIMENEZ 170720.pdf', '122_1595869486.pdf', '2020-07-27 17:04:46', '2020-07-27 17:04:46', NULL),
(750, 56, 'DANIEL I FDEZ 170720.pdf', '322_1595869486.pdf', '2020-07-27 17:04:46', '2020-07-27 17:04:46', NULL),
(751, 56, 'ERICK G TORNADO 170720.pdf', '353_1595869486.pdf', '2020-07-27 17:04:46', '2020-07-27 17:04:46', NULL),
(752, 56, 'FEDERICO HUESCA 170720.pdf', '344_1595869486.pdf', '2020-07-27 17:04:46', '2020-07-27 17:04:46', NULL),
(753, 56, 'FELIPE CARRASCO 170720.pdf', '125_1595869486.pdf', '2020-07-27 17:04:46', '2020-07-27 17:04:46', NULL),
(754, 56, 'FERNANDO MAYO 170720.pdf', '252_1595869486.pdf', '2020-07-27 17:04:46', '2020-07-27 17:04:46', NULL),
(755, 56, 'FRANCISCO BEJARANO 170720.pdf', '435_1595869486.pdf', '2020-07-27 17:04:46', '2020-07-27 17:04:46', NULL),
(756, 56, 'FRANCISCO J RUIZ 170720.pdf', '218_1595869486.pdf', '2020-07-27 17:04:46', '2020-07-27 17:04:46', NULL),
(757, 56, 'HIPOLITO ALBERTO 170720.pdf', '63_1595869486.pdf', '2020-07-27 17:04:46', '2020-07-27 17:04:46', NULL),
(758, 56, 'HUGO A BOLAÑOS 170720.pdf', '187_1595869486.pdf', '2020-07-27 17:04:46', '2020-07-27 17:04:46', NULL),
(759, 56, 'IGNACIO MURILLO 170720.pdf', '493_1595869486.pdf', '2020-07-27 17:04:46', '2020-07-27 17:04:46', NULL),
(760, 56, 'IRAM G HUESCA 170720.pdf', '60_1595869486.pdf', '2020-07-27 17:04:46', '2020-07-27 17:04:46', NULL),
(761, 56, 'ISMAEL RENERO 170720.pdf', '342_1595869486.pdf', '2020-07-27 17:04:46', '2020-07-27 17:04:46', NULL),
(762, 56, 'JAIME R NOLASCO 170720.pdf', '167_1595869486.pdf', '2020-07-27 17:04:46', '2020-07-27 17:04:46', NULL),
(763, 56, 'JAIRO I CRUZ 170720.pdf', '34_1595869486.pdf', '2020-07-27 17:04:46', '2020-07-27 17:04:46', NULL),
(764, 56, 'JAVIER DEGOLLADO 170720.pdf', '433_1595869486.pdf', '2020-07-27 17:04:46', '2020-07-27 17:04:46', NULL),
(765, 55, 'BBVA 310720.pdf', '398_1597073320.pdf', '2020-08-10 15:28:40', '2020-08-10 15:28:40', NULL),
(766, 55, 'INTERBANCARIOS 310720.pdf', '425_1597073320.pdf', '2020-08-10 15:28:40', '2020-08-10 15:28:40', NULL),
(767, 56, 'JESUS HUESCA 170720.pdf', '29_1597073833.pdf', '2020-08-10 15:37:13', '2020-08-10 15:37:13', NULL),
(768, 56, 'JOAQUIN AQUINO 170720.pdf', '447_1597073833.pdf', '2020-08-10 15:37:13', '2020-08-10 15:37:13', NULL),
(769, 56, 'JOEL EVIA 170720.pdf', '73_1597073833.pdf', '2020-08-10 15:37:13', '2020-08-10 15:37:13', NULL),
(770, 56, 'JORGE L CARMONA 170720.pdf', '445_1597073833.pdf', '2020-08-10 15:37:13', '2020-08-10 15:37:13', NULL),
(771, 56, 'JOSE M DIONICIO 170720.pdf', '2_1597073833.pdf', '2020-08-10 15:37:13', '2020-08-10 15:37:13', NULL),
(772, 56, 'JULIO C CHACON 170720.pdf', '19_1597073833.pdf', '2020-08-10 15:37:13', '2020-08-10 15:37:13', NULL),
(773, 56, 'JULIO C GUZMAN 170720.pdf', '206_1597073833.pdf', '2020-08-10 15:37:13', '2020-08-10 15:37:13', NULL),
(774, 56, 'LAURO SALOMON 170720.pdf', '292_1597073833.pdf', '2020-08-10 15:37:13', '2020-08-10 15:37:13', NULL),
(775, 56, 'LEONARDO GLEZ 170720.pdf', '500_1597073833.pdf', '2020-08-10 15:37:13', '2020-08-10 15:37:13', NULL),
(776, 56, 'LEONEL LOPEZ 170720.pdf', '413_1597073834.pdf', '2020-08-10 15:37:14', '2020-08-10 15:37:14', NULL),
(777, 56, 'LILIA I DIAZ 170720.pdf', '297_1597073834.pdf', '2020-08-10 15:37:14', '2020-08-10 15:37:14', NULL),
(778, 56, 'MARCO A PAEZ 170720.pdf', '15_1597073834.pdf', '2020-08-10 15:37:14', '2020-08-10 15:37:14', NULL),
(779, 56, 'MARTIN ANOTA 170720.pdf', '87_1597073834.pdf', '2020-08-10 15:37:14', '2020-08-10 15:37:14', NULL),
(780, 56, 'MARTIN G CONTRERAS 170720.pdf', '258_1597073834.pdf', '2020-08-10 15:37:14', '2020-08-10 15:37:14', NULL),
(781, 56, 'OBDULIA AVELINO 170720.pdf', '26_1597073834.pdf', '2020-08-10 15:37:14', '2020-08-10 15:37:14', NULL),
(782, 56, 'RAFAEL RAMON 170720.pdf', '101_1597073834.pdf', '2020-08-10 15:37:14', '2020-08-10 15:37:14', NULL),
(783, 56, 'RAYMUNDO LOPEZ 170720.pdf', '480_1597073834.pdf', '2020-08-10 15:37:14', '2020-08-10 15:37:14', NULL),
(784, 56, 'ROBERTO FLORES 170720.pdf', '264_1597073834.pdf', '2020-08-10 15:37:14', '2020-08-10 15:37:14', NULL),
(785, 56, 'ROCIO NAZARO 170720.pdf', '114_1597073834.pdf', '2020-08-10 15:37:14', '2020-08-10 15:37:14', NULL),
(786, 56, 'SANTIAGO GLEZ 170720.pdf', '238_1597073834.pdf', '2020-08-10 15:37:14', '2020-08-10 15:37:14', NULL),
(787, 57, 'BBVA 240720.pdf', '406_1597074066.pdf', '2020-08-10 15:41:06', '2020-08-10 15:41:06', NULL),
(788, 57, 'INTERBANCARIOS 240720.pdf', '81_1597074066.pdf', '2020-08-10 15:41:06', '2020-08-10 15:41:06', NULL),
(789, 57, 'BBVA 310720.pdf', '412_1597074122.pdf', '2020-08-10 15:42:02', '2020-08-10 15:42:02', NULL),
(790, 57, 'INTERBANCARIO 310720.pdf', '264_1597074122.pdf', '2020-08-10 15:42:02', '2020-08-10 15:42:02', NULL),
(791, 58, 'ALEJANDRO RETAMA 240720.pdf', '224_1597074583.pdf', '2020-08-10 15:49:43', '2020-08-10 15:49:43', NULL),
(792, 58, 'BENITO HUESCA 240720.pdf', '23_1597074583.pdf', '2020-08-10 15:49:43', '2020-08-10 15:49:43', NULL),
(793, 58, 'CELESTINO VILLANUEVA 240720.pdf', '127_1597074583.pdf', '2020-08-10 15:49:43', '2020-08-10 15:49:43', NULL),
(794, 58, 'CONCEPCION JIMENEZ 240720.pdf', '108_1597074583.pdf', '2020-08-10 15:49:43', '2020-08-10 15:49:43', NULL),
(795, 58, 'FEDERICO HUESCA 240720.pdf', '198_1597074583.pdf', '2020-08-10 15:49:43', '2020-08-10 15:49:43', NULL),
(796, 58, 'FELIPE CARRASCO 240720.pdf', '93_1597074583.pdf', '2020-08-10 15:49:43', '2020-08-10 15:49:43', NULL),
(797, 58, 'FERNANDO MAYO 240720.pdf', '354_1597074583.pdf', '2020-08-10 15:49:43', '2020-08-10 15:49:43', NULL),
(798, 58, 'FRANCISCO BEJARANO 240720.pdf', '429_1597074583.pdf', '2020-08-10 15:49:43', '2020-08-10 15:49:43', NULL),
(799, 58, 'FRANCISCO J RUIZ 240720.pdf', '440_1597074583.pdf', '2020-08-10 15:49:43', '2020-08-10 15:49:43', NULL),
(800, 58, 'HUGO A BOLAÑOS 240720.pdf', '6_1597074583.pdf', '2020-08-10 15:49:43', '2020-08-10 15:49:43', NULL),
(801, 58, 'IGNACIO MURILLO 240720.pdf', '330_1597074583.pdf', '2020-08-10 15:49:43', '2020-08-10 15:49:43', NULL),
(802, 58, 'JAVIER DEGOLLADO 240720.pdf', '2_1597074583.pdf', '2020-08-10 15:49:43', '2020-08-10 15:49:43', NULL),
(803, 58, 'JESUS HUESCA 240720.pdf', '34_1597074583.pdf', '2020-08-10 15:49:43', '2020-08-10 15:49:43', NULL),
(804, 58, 'JOAQUIN AQUINO 240720.pdf', '185_1597074583.pdf', '2020-08-10 15:49:43', '2020-08-10 15:49:43', NULL),
(805, 58, 'JOEL EVIA 240720.pdf', '147_1597074583.pdf', '2020-08-10 15:49:43', '2020-08-10 15:49:43', NULL),
(806, 58, 'JOSE M DIONICIO 240720.pdf', '29_1597074583.pdf', '2020-08-10 15:49:43', '2020-08-10 15:49:43', NULL),
(807, 58, 'JULIO C CHACON 240720.pdf', '83_1597074583.pdf', '2020-08-10 15:49:43', '2020-08-10 15:49:43', NULL),
(808, 58, 'JULIO C GUZMAN 240720.pdf', '342_1597074583.pdf', '2020-08-10 15:49:43', '2020-08-10 15:49:43', NULL),
(809, 58, 'LAURO SALOMON 240720.pdf', '219_1597074583.pdf', '2020-08-10 15:49:43', '2020-08-10 15:49:43', NULL),
(810, 58, 'LEONARDO GLEZ 240720.pdf', '384_1597074583.pdf', '2020-08-10 15:49:43', '2020-08-10 15:49:43', NULL),
(811, 59, 'BBVA 030820.pdf', '165_1597074751.pdf', '2020-08-10 15:52:32', '2020-08-10 15:52:32', NULL),
(812, 59, 'INTERBANCARIO 030820.pdf', '119_1597074752.pdf', '2020-08-10 15:52:32', '2020-08-10 15:52:32', NULL),
(813, 60, 'ABERLAY LEON 030820.pdf', '134_1597075097.pdf', '2020-08-10 15:58:17', '2020-08-10 15:58:17', NULL),
(814, 60, 'ALBETO OBIL 030820.pdf', '338_1597075097.pdf', '2020-08-10 15:58:17', '2020-08-10 15:58:17', NULL),
(815, 60, 'ALFREDO XOLO 030820.pdf', '385_1597075097.pdf', '2020-08-10 15:58:17', '2020-08-10 15:58:17', NULL),
(816, 60, 'AUGUSTO HDEZ 030820.pdf', '143_1597075097.pdf', '2020-08-10 15:58:17', '2020-08-10 15:58:17', NULL),
(817, 60, 'AURELIO ZAPO 030820.pdf', '475_1597075097.pdf', '2020-08-10 15:58:17', '2020-08-10 15:58:17', NULL),
(818, 60, 'DANIEL C HDEZ 030820.pdf', '451_1597075097.pdf', '2020-08-10 15:58:17', '2020-08-10 15:58:17', NULL),
(819, 60, 'DANIEL MONTIEL 030820.pdf', '467_1597075097.pdf', '2020-08-10 15:58:17', '2020-08-10 15:58:17', NULL),
(820, 60, 'ERICK O SANCHEZ 030820.pdf', '169_1597075097.pdf', '2020-08-10 15:58:17', '2020-08-10 15:58:17', NULL),
(821, 60, 'FERNANDO ANTONIO 030820.pdf', '307_1597075097.pdf', '2020-08-10 15:58:17', '2020-08-10 15:58:17', NULL),
(822, 60, 'FRANCISCO DOLORES 030820.pdf', '334_1597075097.pdf', '2020-08-10 15:58:17', '2020-08-10 15:58:17', NULL),
(823, 60, 'HECTOR MOLINA 030820.pdf', '485_1597075097.pdf', '2020-08-10 15:58:17', '2020-08-10 15:58:17', NULL),
(824, 60, 'HILARIO MOZO 030820.pdf', '409_1597075097.pdf', '2020-08-10 15:58:17', '2020-08-10 15:58:17', NULL),
(825, 60, 'IGNACIO M TENORIO 030820.pdf', '455_1597075097.pdf', '2020-08-10 15:58:17', '2020-08-10 15:58:17', NULL),
(826, 60, 'IRVING MENDEZ 030820.pdf', '225_1597075097.pdf', '2020-08-10 15:58:17', '2020-08-10 15:58:17', NULL),
(827, 60, 'JIMMY H MENDEZ 030820.pdf', '312_1597075097.pdf', '2020-08-10 15:58:17', '2020-08-10 15:58:17', NULL),
(828, 60, 'JORGE A ESCRIBANO 030820.pdf', '372_1597075097.pdf', '2020-08-10 15:58:17', '2020-08-10 15:58:17', NULL),
(829, 60, 'JORGE L DGUEZ 030820.pdf', '383_1597075097.pdf', '2020-08-10 15:58:17', '2020-08-10 15:58:17', NULL),
(830, 60, 'JOSE L VERGARA 030820.pdf', '279_1597075097.pdf', '2020-08-10 15:58:17', '2020-08-10 15:58:17', NULL),
(831, 60, 'JUAN C VERGARA 030820.pdf', '375_1597075097.pdf', '2020-08-10 15:58:17', '2020-08-10 15:58:17', NULL),
(832, 60, 'JUAN M DIAZ 030820.pdf', '78_1597075097.pdf', '2020-08-10 15:58:17', '2020-08-10 15:58:17', NULL),
(833, 61, 'BBVA 080820.pdf', '149_1597075239.pdf', '2020-08-10 16:00:39', '2020-08-10 16:00:39', NULL),
(834, 61, 'INTERBANCARIOS 080820.pdf', '314_1597075239.pdf', '2020-08-10 16:00:39', '2020-08-10 16:00:39', NULL),
(835, 61, 'RAYMUNDO LOPEZ 080820.pdf', '96_1597075239.pdf', '2020-08-10 16:00:39', '2020-08-10 16:00:39', NULL),
(836, 61, 'BBVA 070820.pdf', '129_1597075239.pdf', '2020-08-10 16:00:39', '2020-08-10 16:00:39', NULL),
(837, 61, 'INTERBANCARIOS 070820.pdf', '243_1597075239.pdf', '2020-08-10 16:00:39', '2020-08-10 16:00:39', NULL),
(838, 62, 'ABERLAY LEON 070820.pdf', '408_1597075559.pdf', '2020-08-10 16:05:59', '2020-08-10 16:05:59', NULL),
(839, 62, 'ALBERTO OBIL 070820.pdf', '111_1597075559.pdf', '2020-08-10 16:05:59', '2020-08-10 16:05:59', NULL),
(840, 62, 'ALFREDO XOLO 070820.pdf', '94_1597075559.pdf', '2020-08-10 16:05:59', '2020-08-10 16:05:59', NULL),
(841, 62, 'AUGUSTO HDEZ 070820.pdf', '397_1597075559.pdf', '2020-08-10 16:05:59', '2020-08-10 16:05:59', NULL),
(842, 62, 'AURELIO ZAPO 070820.pdf', '260_1597075559.pdf', '2020-08-10 16:05:59', '2020-08-10 16:05:59', NULL),
(843, 62, 'DANIEL C HDEZ 070820.pdf', '349_1597075559.pdf', '2020-08-10 16:05:59', '2020-08-10 16:05:59', NULL),
(844, 62, 'DANIEL MONTIEL 070820.pdf', '13_1597075559.pdf', '2020-08-10 16:05:59', '2020-08-10 16:05:59', NULL),
(845, 62, 'ERICK O SANCHEZ 070820.pdf', '435_1597075559.pdf', '2020-08-10 16:05:59', '2020-08-10 16:05:59', NULL),
(846, 62, 'FERNANDO ANTONIO 070820.pdf', '66_1597075559.pdf', '2020-08-10 16:05:59', '2020-08-10 16:05:59', NULL),
(847, 62, 'HECTOR MOLINA 070820.pdf', '191_1597075559.pdf', '2020-08-10 16:05:59', '2020-08-10 16:05:59', NULL),
(848, 62, 'HILARIO MOZO 070820.pdf', '266_1597075559.pdf', '2020-08-10 16:05:59', '2020-08-10 16:05:59', NULL),
(849, 62, 'IGNACIO M TENORIO 070820.pdf', '314_1597075559.pdf', '2020-08-10 16:05:59', '2020-08-10 16:05:59', NULL),
(850, 62, 'IRVING MENDEZ 070820.pdf', '275_1597075559.pdf', '2020-08-10 16:05:59', '2020-08-10 16:05:59', NULL),
(851, 62, 'JIMMY H MENDEZ 070820.pdf', '13_1597075559.pdf', '2020-08-10 16:05:59', '2020-08-10 16:05:59', NULL),
(852, 62, 'JORGE A ESCRIBANO 070820.pdf', '338_1597075559.pdf', '2020-08-10 16:05:59', '2020-08-10 16:05:59', NULL),
(853, 62, 'JOSE L VERGARA 070820.pdf', '313_1597075559.pdf', '2020-08-10 16:05:59', '2020-08-10 16:05:59', NULL),
(854, 62, 'JUAN C VERGARA 070820.pdf', '314_1597075559.pdf', '2020-08-10 16:05:59', '2020-08-10 16:05:59', NULL),
(855, 62, 'JUAN M DIAZ 070820.pdf', '304_1597075559.pdf', '2020-08-10 16:05:59', '2020-08-10 16:05:59', NULL),
(856, 62, 'JULIO C SERDAN 070820.pdf', '388_1597075559.pdf', '2020-08-10 16:05:59', '2020-08-10 16:05:59', NULL),
(857, 62, 'LEONARDO LOPEZ 070820 RICARDO.pdf', '488_1597075559.pdf', '2020-08-10 16:05:59', '2020-08-10 16:05:59', NULL),
(858, 63, 'BBVA 140820.pdf', '496_1599154304.pdf', '2020-09-03 17:31:44', '2020-09-03 17:31:44', NULL),
(859, 63, 'INTERBANCARIOS 140820.pdf', '87_1599154304.pdf', '2020-09-03 17:31:44', '2020-09-03 17:31:44', NULL),
(860, 63, 'BBVA 140820.pdf', '275_1599154304.pdf', '2020-09-03 17:31:44', '2020-09-03 17:31:44', NULL),
(861, 63, 'INTERBANCARIOS 140820.pdf', '126_1599154304.pdf', '2020-09-03 17:31:44', '2020-09-03 17:31:44', NULL),
(862, 64, 'ABERLAY LEON 140820.pdf', '30_1599154650.pdf', '2020-09-03 17:37:30', '2020-09-03 17:37:30', NULL),
(863, 64, 'ALBERTO OBIL 140820.pdf', '407_1599154650.pdf', '2020-09-03 17:37:30', '2020-09-03 17:37:30', NULL),
(864, 64, 'ALFREDO XOLO 140820.pdf', '62_1599154650.pdf', '2020-09-03 17:37:30', '2020-09-03 17:37:30', NULL),
(865, 64, 'AUGUSTO HDEZ 140820.pdf', '303_1599154650.pdf', '2020-09-03 17:37:30', '2020-09-03 17:37:30', NULL),
(866, 64, 'AURELIO ZAPO 140820.pdf', '106_1599154650.pdf', '2020-09-03 17:37:30', '2020-09-03 17:37:30', NULL),
(867, 64, 'DANIEL C HDEZ 140820.pdf', '337_1599154650.pdf', '2020-09-03 17:37:30', '2020-09-03 17:37:30', NULL),
(868, 64, 'DANIEL MONTIEL 140820.pdf', '72_1599154650.pdf', '2020-09-03 17:37:30', '2020-09-03 17:37:30', NULL),
(869, 64, 'FERNANDO ANTONIO 140820.pdf', '378_1599154650.pdf', '2020-09-03 17:37:30', '2020-09-03 17:37:30', NULL),
(870, 64, 'HECTOR MOLINA 140820.pdf', '325_1599154650.pdf', '2020-09-03 17:37:30', '2020-09-03 17:37:30', NULL),
(871, 64, 'HILARIO MOZO 140820.pdf', '278_1599154650.pdf', '2020-09-03 17:37:30', '2020-09-03 17:37:30', NULL),
(872, 64, 'IGNACIO M TENORIO 140820.pdf', '435_1599154650.pdf', '2020-09-03 17:37:30', '2020-09-03 17:37:30', NULL),
(873, 64, 'IRVING MENDEZ 140820.pdf', '108_1599154650.pdf', '2020-09-03 17:37:30', '2020-09-03 17:37:30', NULL),
(874, 64, 'JIMMY H MENDEZ 140820.pdf', '438_1599154650.pdf', '2020-09-03 17:37:30', '2020-09-03 17:37:30', NULL),
(875, 64, 'JORGEA ESCRIBANO 140820.pdf', '189_1599154650.pdf', '2020-09-03 17:37:30', '2020-09-03 17:37:30', NULL),
(876, 64, 'JOSE L VERGARA 140820.pdf', '55_1599154650.pdf', '2020-09-03 17:37:30', '2020-09-03 17:37:30', NULL),
(877, 64, 'JUAN C VERGARA 140820.pdf', '83_1599154650.pdf', '2020-09-03 17:37:30', '2020-09-03 17:37:30', NULL),
(878, 64, 'JUAN M DIAZ 140820 (1).pdf', '46_1599154650.pdf', '2020-09-03 17:37:30', '2020-09-03 17:37:30', NULL),
(879, 64, 'JUAN M DIAZ 140820 (2).pdf', '157_1599154650.pdf', '2020-09-03 17:37:30', '2020-09-03 17:37:30', NULL),
(880, 64, 'JUAN M DIAZ 140820 (3).pdf', '272_1599154650.pdf', '2020-09-03 17:37:30', '2020-09-03 17:37:30', NULL),
(881, 64, 'JULIO C SERDAN 140820.pdf', '307_1599154650.pdf', '2020-09-03 17:37:30', '2020-09-03 17:37:30', NULL),
(882, 65, 'BBVA 210820.pdf', '411_1599154749.pdf', '2020-09-03 17:39:09', '2020-09-03 17:39:09', NULL),
(883, 65, 'INTERBANCARIOS 210820.pdf', '254_1599154749.pdf', '2020-09-03 17:39:09', '2020-09-03 17:39:09', NULL),
(884, 65, 'BBVA 210820.pdf', '266_1599154749.pdf', '2020-09-03 17:39:09', '2020-09-03 17:39:09', NULL),
(885, 65, 'INTERBANCARIOS 210820.pdf', '189_1599154749.pdf', '2020-09-03 17:39:09', '2020-09-03 17:39:09', NULL),
(886, 66, 'ABERLAY LEON 240820.pdf', '18_1599155044.pdf', '2020-09-03 17:44:04', '2020-09-03 17:44:04', NULL),
(887, 66, 'ALBERTO OBIL 240820.pdf', '214_1599155044.pdf', '2020-09-03 17:44:04', '2020-09-03 17:44:04', NULL),
(888, 66, 'ALFREDO XOLO 240820.pdf', '262_1599155044.pdf', '2020-09-03 17:44:04', '2020-09-03 17:44:04', NULL),
(889, 66, 'AUGUSTO HDEZ 240820.pdf', '82_1599155044.pdf', '2020-09-03 17:44:04', '2020-09-03 17:44:04', NULL),
(890, 66, 'AURELIO ZAPO 240820.pdf', '419_1599155044.pdf', '2020-09-03 17:44:04', '2020-09-03 17:44:04', NULL),
(891, 66, 'DANIEL C HDEZ 240820.pdf', '148_1599155044.pdf', '2020-09-03 17:44:04', '2020-09-03 17:44:04', NULL),
(892, 66, 'DANIEL MONTIEL 240820.pdf', '314_1599155044.pdf', '2020-09-03 17:44:04', '2020-09-03 17:44:04', NULL),
(893, 66, 'FERNANDO ANTONIO 240820.pdf', '500_1599155044.pdf', '2020-09-03 17:44:04', '2020-09-03 17:44:04', NULL),
(894, 66, 'HECTOR MOLINA 240820.pdf', '58_1599155044.pdf', '2020-09-03 17:44:04', '2020-09-03 17:44:04', NULL),
(895, 66, 'HILARIO MOZO 240820.pdf', '61_1599155044.pdf', '2020-09-03 17:44:04', '2020-09-03 17:44:04', NULL);
INSERT INTO `nomina_dispersion` (`id`, `nomina_id`, `name`, `file_url`, `created_at`, `updated_at`, `deleted_at`) VALUES
(896, 66, 'IGNACIO M TENORIO 240820.pdf', '43_1599155044.pdf', '2020-09-03 17:44:04', '2020-09-03 17:44:04', NULL),
(897, 66, 'IRVING MENDEZ 240820.pdf', '335_1599155044.pdf', '2020-09-03 17:44:04', '2020-09-03 17:44:04', NULL),
(898, 66, 'JIMMY H MENDEZ 240820.pdf', '371_1599155044.pdf', '2020-09-03 17:44:04', '2020-09-03 17:44:04', NULL),
(899, 66, 'JORGE A ESCRIBANO 240820.pdf', '209_1599155044.pdf', '2020-09-03 17:44:04', '2020-09-03 17:44:04', NULL),
(900, 66, 'JOSE L VERGARA 240820.pdf', '313_1599155044.pdf', '2020-09-03 17:44:04', '2020-09-03 17:44:04', NULL),
(901, 66, 'JUAN C VERGARA 240820.pdf', '64_1599155044.pdf', '2020-09-03 17:44:04', '2020-09-03 17:44:04', NULL),
(902, 66, 'JUAN M DIAZ 240820.pdf', '196_1599155044.pdf', '2020-09-03 17:44:04', '2020-09-03 17:44:04', NULL),
(903, 66, 'JULIO C SERDAN 240820.pdf', '37_1599155044.pdf', '2020-09-03 17:44:04', '2020-09-03 17:44:04', NULL),
(904, 66, 'LEONARDO LOPEZ 240820.pdf', '336_1599155044.pdf', '2020-09-03 17:44:04', '2020-09-03 17:44:04', NULL),
(905, 66, 'LILIANA LURIA 240820.pdf', '364_1599155044.pdf', '2020-09-03 17:44:04', '2020-09-03 17:44:04', NULL),
(906, 67, 'BBVA 280820.pdf', '453_1599155152.pdf', '2020-09-03 17:45:52', '2020-09-03 17:45:52', NULL),
(907, 67, 'INTERBANCARIOS 280820.pdf', '475_1599155152.pdf', '2020-09-03 17:45:52', '2020-09-03 17:45:52', NULL),
(908, 67, 'BBVA 280820.pdf', '237_1599155169.pdf', '2020-09-03 17:46:09', '2020-09-03 17:46:09', NULL),
(909, 67, 'INTERBANCARIO 280820.pdf', '57_1599155169.pdf', '2020-09-03 17:46:09', '2020-09-03 17:46:09', NULL),
(910, 68, 'ABERLAY LEON 280820.pdf', '176_1599155364.pdf', '2020-09-03 17:49:24', '2020-09-03 17:49:24', NULL),
(911, 68, 'ALBERTO OBIL 280820.pdf', '96_1599155364.pdf', '2020-09-03 17:49:24', '2020-09-03 17:49:24', NULL),
(912, 68, 'ALFREDO XOLO 280820.pdf', '18_1599155364.pdf', '2020-09-03 17:49:24', '2020-09-03 17:49:24', NULL),
(913, 68, 'AUGUSTO HDEZ 280820.pdf', '68_1599155364.pdf', '2020-09-03 17:49:24', '2020-09-03 17:49:24', NULL),
(914, 68, 'AURELIO ZAPO 280820.pdf', '266_1599155364.pdf', '2020-09-03 17:49:24', '2020-09-03 17:49:24', NULL),
(915, 68, 'DANIEL C HDEZ 280820.pdf', '57_1599155364.pdf', '2020-09-03 17:49:24', '2020-09-03 17:49:24', NULL),
(916, 68, 'DANIEL MONTIEL 280820.pdf', '41_1599155364.pdf', '2020-09-03 17:49:24', '2020-09-03 17:49:24', NULL),
(917, 68, 'ERICK O SANCHEZ 280820.pdf', '292_1599155364.pdf', '2020-09-03 17:49:24', '2020-09-03 17:49:24', NULL),
(918, 68, 'FERNANDO ANTONIO 280820.pdf', '7_1599155364.pdf', '2020-09-03 17:49:24', '2020-09-03 17:49:24', NULL),
(919, 68, 'HECTOR MOLINA 280820.pdf', '212_1599155364.pdf', '2020-09-03 17:49:24', '2020-09-03 17:49:24', NULL),
(920, 68, 'HILARIO MOZO 280820.pdf', '422_1599155364.pdf', '2020-09-03 17:49:24', '2020-09-03 17:49:24', NULL),
(921, 68, 'IGNACIO M TENORIO 280820.pdf', '327_1599155364.pdf', '2020-09-03 17:49:24', '2020-09-03 17:49:24', NULL),
(922, 68, 'IRVING MENDEZ 280820.pdf', '217_1599155364.pdf', '2020-09-03 17:49:24', '2020-09-03 17:49:24', NULL),
(923, 68, 'JAUN M DIAZ 280820.pdf', '37_1599155364.pdf', '2020-09-03 17:49:24', '2020-09-03 17:49:24', NULL),
(924, 68, 'JIMMY H MENDEZ 280820.pdf', '196_1599155364.pdf', '2020-09-03 17:49:24', '2020-09-03 17:49:24', NULL),
(925, 68, 'JORGE A ESCRIBANO 280820.pdf', '450_1599155364.pdf', '2020-09-03 17:49:24', '2020-09-03 17:49:24', NULL),
(926, 68, 'JOSE L VERGARA 280820.pdf', '191_1599155364.pdf', '2020-09-03 17:49:24', '2020-09-03 17:49:24', NULL),
(927, 68, 'JUAN C VERGARA 280820.pdf', '327_1599155364.pdf', '2020-09-03 17:49:24', '2020-09-03 17:49:24', NULL),
(928, 68, 'JULIO C SERDAN 280820.pdf', '371_1599155364.pdf', '2020-09-03 17:49:24', '2020-09-03 17:49:24', NULL),
(929, 68, 'LEONARDO LOPEZ 280820.pdf', '395_1599155364.pdf', '2020-09-03 17:49:24', '2020-09-03 17:49:24', NULL),
(930, 68, 'LILIANA LURIA 280820.pdf', '281_1599155459.pdf', '2020-09-03 17:50:59', '2020-09-03 17:50:59', NULL),
(931, 68, 'MARCELINO ZAPO 280820.pdf', '328_1599155459.pdf', '2020-09-03 17:50:59', '2020-09-03 17:50:59', NULL),
(932, 68, 'MARCOS LOPEZ 280820.pdf', '321_1599155459.pdf', '2020-09-03 17:50:59', '2020-09-03 17:50:59', NULL),
(933, 68, 'MAURICIO GOXCON 280820.pdf', '481_1599155459.pdf', '2020-09-03 17:50:59', '2020-09-03 17:50:59', NULL),
(934, 68, 'MAXIMINO GLEZ 280820.pdf', '272_1599155459.pdf', '2020-09-03 17:50:59', '2020-09-03 17:50:59', NULL),
(935, 68, 'RAUL PEREZ 280820.pdf', '294_1599155459.pdf', '2020-09-03 17:50:59', '2020-09-03 17:50:59', NULL),
(936, 68, 'RIGOBERTO CHACHA 280820.pdf', '19_1599155459.pdf', '2020-09-03 17:50:59', '2020-09-03 17:50:59', NULL),
(937, 68, 'RUSBEL CABRERA 280820.pdf', '464_1599155459.pdf', '2020-09-03 17:50:59', '2020-09-03 17:50:59', NULL),
(938, 68, 'ALEJANDRO RETAMA 280820.pdf', '179_1599155660.pdf', '2020-09-03 17:54:20', '2020-09-03 17:54:20', NULL),
(939, 68, 'ALEJANDRO RIOS 280820.pdf', '423_1599155660.pdf', '2020-09-03 17:54:20', '2020-09-03 17:54:20', NULL),
(940, 68, 'BENITO HUESCA 280820.pdf', '130_1599155660.pdf', '2020-09-03 17:54:20', '2020-09-03 17:54:20', NULL),
(941, 68, 'CELESTINO VILLANUEVA 280820.pdf', '245_1599155660.pdf', '2020-09-03 17:54:20', '2020-09-03 17:54:20', NULL),
(942, 68, 'CONCEPCION JIMENEZ 280820.pdf', '82_1599155660.pdf', '2020-09-03 17:54:20', '2020-09-03 17:54:20', NULL),
(943, 68, 'DANIEL I FDEZ 280820.pdf', '23_1599155660.pdf', '2020-09-03 17:54:20', '2020-09-03 17:54:20', NULL),
(944, 68, 'DIANA L CEBALLOS 280820.pdf', '488_1599155660.pdf', '2020-09-03 17:54:20', '2020-09-03 17:54:20', NULL),
(945, 68, 'ERICK G TORNADO 280820.pdf', '116_1599155660.pdf', '2020-09-03 17:54:20', '2020-09-03 17:54:20', NULL),
(946, 68, 'FEDERICO HUESCA 280820.pdf', '251_1599155660.pdf', '2020-09-03 17:54:20', '2020-09-03 17:54:20', NULL),
(947, 68, 'FERNANDO MAYO 280820.pdf', '405_1599155660.pdf', '2020-09-03 17:54:20', '2020-09-03 17:54:20', NULL),
(948, 68, 'FRANCISCO J RUIZ 280820.pdf', '436_1599155660.pdf', '2020-09-03 17:54:20', '2020-09-03 17:54:20', NULL),
(949, 68, 'FRNACISCO BEJARANO 280820.pdf', '306_1599155660.pdf', '2020-09-03 17:54:20', '2020-09-03 17:54:20', NULL),
(950, 68, 'HIPOLITO A PULIDO 280820.pdf', '279_1599155660.pdf', '2020-09-03 17:54:20', '2020-09-03 17:54:20', NULL),
(951, 68, 'HUGO A BOLAÑOS 280820.pdf', '348_1599155660.pdf', '2020-09-03 17:54:20', '2020-09-03 17:54:20', NULL),
(952, 68, 'IGNACIO MURILLO 280820.pdf', '426_1599155660.pdf', '2020-09-03 17:54:20', '2020-09-03 17:54:20', NULL),
(953, 68, 'IRAM G HUESCA 280820.pdf', '476_1599155660.pdf', '2020-09-03 17:54:20', '2020-09-03 17:54:20', NULL),
(954, 68, 'ISMAEL RENERO 280820.pdf', '388_1599155660.pdf', '2020-09-03 17:54:20', '2020-09-03 17:54:20', NULL),
(955, 68, 'IVAN D NOLASCO 280820.pdf', '71_1599155660.pdf', '2020-09-03 17:54:20', '2020-09-03 17:54:20', NULL),
(956, 68, 'JAIME R NOLASCO 280820.pdf', '142_1599155660.pdf', '2020-09-03 17:54:20', '2020-09-03 17:54:20', NULL),
(957, 68, 'JAIME SOTO 280820.pdf', '70_1599155660.pdf', '2020-09-03 17:54:20', '2020-09-03 17:54:20', NULL),
(958, 68, 'JAIRO I CRUZ 280820.pdf', '67_1599155784.pdf', '2020-09-03 17:56:24', '2020-09-03 17:56:24', NULL),
(959, 68, 'JAVIER DEGOLLADO 280820.pdf', '367_1599155784.pdf', '2020-09-03 17:56:24', '2020-09-03 17:56:24', NULL),
(960, 68, 'JESUS HUESCA 280820.pdf', '321_1599155784.pdf', '2020-09-03 17:56:24', '2020-09-03 17:56:24', NULL),
(961, 68, 'JOAQUIN AQUINO 280820.pdf', '438_1599155784.pdf', '2020-09-03 17:56:24', '2020-09-03 17:56:24', NULL),
(962, 68, 'JOEL EVIA 280820.pdf', '262_1599155784.pdf', '2020-09-03 17:56:24', '2020-09-03 17:56:24', NULL),
(963, 68, 'JORGE L CARMONA 280820.pdf', '320_1599155784.pdf', '2020-09-03 17:56:24', '2020-09-03 17:56:24', NULL),
(964, 68, 'JOSEM DIONICIO 280820.pdf', '174_1599155784.pdf', '2020-09-03 17:56:24', '2020-09-03 17:56:24', NULL),
(965, 68, 'JULIO C CHACON 280820.pdf', '58_1599155784.pdf', '2020-09-03 17:56:24', '2020-09-03 17:56:24', NULL),
(966, 68, 'JULIO C GUZMAN 280820.pdf', '143_1599155784.pdf', '2020-09-03 17:56:24', '2020-09-03 17:56:24', NULL),
(967, 68, 'LAURO SALOMON 280820.pdf', '276_1599155784.pdf', '2020-09-03 17:56:24', '2020-09-03 17:56:24', NULL),
(968, 68, 'LEONARDO GLEZ 280820.pdf', '200_1599155784.pdf', '2020-09-03 17:56:24', '2020-09-03 17:56:24', NULL),
(969, 68, 'LEONEL LOPEZ 280820.pdf', '160_1599155784.pdf', '2020-09-03 17:56:24', '2020-09-03 17:56:24', NULL),
(970, 68, 'LILIA I DIAZ 280820.pdf', '255_1599155784.pdf', '2020-09-03 17:56:24', '2020-09-03 17:56:24', NULL),
(971, 68, 'LUIS GUZMAN 280820.pdf', '261_1599155784.pdf', '2020-09-03 17:56:24', '2020-09-03 17:56:24', NULL),
(972, 68, 'MARCO A PAEZ 280820.pdf', '150_1599155784.pdf', '2020-09-03 17:56:24', '2020-09-03 17:56:24', NULL),
(973, 68, 'MARTIN ANOTA 280820.pdf', '453_1599155784.pdf', '2020-09-03 17:56:24', '2020-09-03 17:56:24', NULL),
(974, 68, 'MARTIN G CONTRERAS 280820.pdf', '16_1599155784.pdf', '2020-09-03 17:56:24', '2020-09-03 17:56:24', NULL),
(975, 68, 'OBDULIA AVELINO 280820.pdf', '413_1599155784.pdf', '2020-09-03 17:56:24', '2020-09-03 17:56:24', NULL),
(976, 68, 'RAFAEL RAMON 280820.pdf', '74_1599155784.pdf', '2020-09-03 17:56:24', '2020-09-03 17:56:24', NULL),
(977, 68, 'RAYMUNDO LOPEZ 280820.pdf', '444_1599155784.pdf', '2020-09-03 17:56:24', '2020-09-03 17:56:24', NULL),
(978, 68, 'RICARDO A SERENA 280820.pdf', '321_1599155825.pdf', '2020-09-03 17:57:05', '2020-09-03 17:57:05', NULL),
(979, 68, 'ROBERTO FLORES 280820.pdf', '134_1599155825.pdf', '2020-09-03 17:57:05', '2020-09-03 17:57:05', NULL),
(980, 68, 'ROCIO NAZARO 280820.pdf', '110_1599155825.pdf', '2020-09-03 17:57:05', '2020-09-03 17:57:05', NULL),
(981, 68, 'SANTIAGO GLEZ 280820.pdf', '16_1599155825.pdf', '2020-09-03 17:57:05', '2020-09-03 17:57:05', NULL),
(982, 68, 'SERGIO TORRES 280820.pdf', '207_1599155825.pdf', '2020-09-03 17:57:05', '2020-09-03 17:57:05', NULL),
(983, 68, 'SILVANO BARBA 280820.pdf', '74_1599155825.pdf', '2020-09-03 17:57:05', '2020-09-03 17:57:05', NULL),
(984, 68, 'VICTOR A AVELINO 280820.pdf', '106_1599155825.pdf', '2020-09-03 17:57:05', '2020-09-03 17:57:05', NULL),
(985, 64, 'LEONARDO LOPEZ 140820.pdf', '14_1599172709.pdf', '2020-09-03 22:38:29', '2020-09-03 22:38:29', NULL),
(986, 64, 'LILIANA LURIA 140820.pdf', '131_1599172709.pdf', '2020-09-03 22:38:29', '2020-09-03 22:38:29', NULL),
(987, 64, 'MARCELINO ZAPO 140820.pdf', '267_1599172709.pdf', '2020-09-03 22:38:29', '2020-09-03 22:38:29', NULL),
(988, 64, 'MARCOS LOPEZ 140820.pdf', '19_1599172709.pdf', '2020-09-03 22:38:29', '2020-09-03 22:38:29', NULL),
(989, 64, 'MAURICIO GOXCON 140820.pdf', '400_1599172709.pdf', '2020-09-03 22:38:29', '2020-09-03 22:38:29', NULL),
(990, 64, 'MAXIMINO GLEZ 140820.pdf', '464_1599172709.pdf', '2020-09-03 22:38:29', '2020-09-03 22:38:29', NULL),
(991, 64, 'RAUL PEREZ 140820.pdf', '225_1599172709.pdf', '2020-09-03 22:38:29', '2020-09-03 22:38:29', NULL),
(992, 64, 'RIGOBERTO CHACHA 140820.pdf', '113_1599172709.pdf', '2020-09-03 22:38:29', '2020-09-03 22:38:29', NULL),
(993, 64, 'RUSBEL CABRERA 140820.pdf', '475_1599172709.pdf', '2020-09-03 22:38:29', '2020-09-03 22:38:29', NULL),
(994, 64, 'URIEL SEBA 140820.pdf', '42_1599172709.pdf', '2020-09-03 22:38:29', '2020-09-03 22:38:29', NULL),
(995, 64, 'ALEJANDRO RETAMA 140820.pdf', '50_1599172938.pdf', '2020-09-03 22:42:18', '2020-09-03 22:42:18', NULL),
(996, 64, 'ALEJANDRO RIOS 140820.pdf', '215_1599172938.pdf', '2020-09-03 22:42:18', '2020-09-03 22:42:18', NULL),
(997, 64, 'BENITO HUESCA 140820.pdf', '197_1599172938.pdf', '2020-09-03 22:42:18', '2020-09-03 22:42:18', NULL),
(998, 64, 'CELESTINO VILLANUEVA 140820.pdf', '105_1599172938.pdf', '2020-09-03 22:42:18', '2020-09-03 22:42:18', NULL),
(999, 64, 'CONCEPCION JIMENEZ 140820.pdf', '5_1599172938.pdf', '2020-09-03 22:42:18', '2020-09-03 22:42:18', NULL),
(1000, 64, 'DANIEL I FERNANDEZ 140820.pdf', '397_1599172938.pdf', '2020-09-03 22:42:18', '2020-09-03 22:42:18', NULL),
(1001, 64, 'DIANA L CEBALLOS 140820.pdf', '279_1599172938.pdf', '2020-09-03 22:42:18', '2020-09-03 22:42:18', NULL),
(1002, 64, 'ERICK G TORNADO 140820.pdf', '199_1599172938.pdf', '2020-09-03 22:42:18', '2020-09-03 22:42:18', NULL),
(1003, 64, 'FEDERICO HUESCA 140820.pdf', '29_1599172938.pdf', '2020-09-03 22:42:18', '2020-09-03 22:42:18', NULL),
(1004, 64, 'FERNANDO MAYO 140820.pdf', '258_1599172938.pdf', '2020-09-03 22:42:18', '2020-09-03 22:42:18', NULL),
(1005, 64, 'FRANCISCO BEJARANO 140820.pdf', '74_1599172938.pdf', '2020-09-03 22:42:18', '2020-09-03 22:42:18', NULL),
(1006, 64, 'FRANCISCO J RUIZ 140820.pdf', '413_1599172938.pdf', '2020-09-03 22:42:18', '2020-09-03 22:42:18', NULL),
(1007, 64, 'HIPOLITO A PULIDO 140820.pdf', '48_1599172938.pdf', '2020-09-03 22:42:18', '2020-09-03 22:42:18', NULL),
(1008, 64, 'HUGO A BOLAÑOS 140820.pdf', '26_1599172938.pdf', '2020-09-03 22:42:18', '2020-09-03 22:42:18', NULL),
(1009, 64, 'IGNACIO MURILLO 140820.pdf', '323_1599172938.pdf', '2020-09-03 22:42:18', '2020-09-03 22:42:18', NULL),
(1010, 64, 'IRAM G HUESCA.pdf', '343_1599172938.pdf', '2020-09-03 22:42:18', '2020-09-03 22:42:18', NULL),
(1011, 64, 'ISMAEL RENERO 140820.pdf', '336_1599172938.pdf', '2020-09-03 22:42:18', '2020-09-03 22:42:18', NULL),
(1012, 64, 'IVAN D NOLASCO 140820.pdf', '159_1599172938.pdf', '2020-09-03 22:42:18', '2020-09-03 22:42:18', NULL),
(1013, 64, 'JAIME R NOLASCO 140820.pdf', '242_1599172938.pdf', '2020-09-03 22:42:18', '2020-09-03 22:42:18', NULL),
(1014, 64, 'JAIME SOTO 140820.pdf', '276_1599172938.pdf', '2020-09-03 22:42:18', '2020-09-03 22:42:18', NULL),
(1015, 64, 'JAIRO I CRUZ 140820.pdf', '83_1599173063.pdf', '2020-09-03 22:44:23', '2020-09-03 22:44:23', NULL),
(1016, 64, 'JAVIER DEGOLLADO 140820.pdf', '490_1599173063.pdf', '2020-09-03 22:44:23', '2020-09-03 22:44:23', NULL),
(1017, 64, 'JESUS HUESCA 140820.pdf', '266_1599173063.pdf', '2020-09-03 22:44:23', '2020-09-03 22:44:23', NULL),
(1018, 64, 'JOAQUIN AQUINO 140820.pdf', '394_1599173063.pdf', '2020-09-03 22:44:23', '2020-09-03 22:44:23', NULL),
(1019, 64, 'JOEL EVIA 140820.pdf', '98_1599173063.pdf', '2020-09-03 22:44:23', '2020-09-03 22:44:23', NULL),
(1020, 64, 'JORGE L CARMONA.pdf', '337_1599173063.pdf', '2020-09-03 22:44:23', '2020-09-03 22:44:23', NULL),
(1021, 64, 'JOSE M DIONICIO 140820.pdf', '281_1599173063.pdf', '2020-09-03 22:44:23', '2020-09-03 22:44:23', NULL),
(1022, 64, 'JULIO C CHACON 140820.pdf', '121_1599173063.pdf', '2020-09-03 22:44:23', '2020-09-03 22:44:23', NULL),
(1023, 64, 'JULIO C GUZMAN 140820.pdf', '387_1599173063.pdf', '2020-09-03 22:44:23', '2020-09-03 22:44:23', NULL),
(1024, 64, 'LAURO SALOMON 140820.pdf', '130_1599173063.pdf', '2020-09-03 22:44:23', '2020-09-03 22:44:23', NULL),
(1025, 64, 'LEONARDO GONZALEZ 140820.pdf', '480_1599173063.pdf', '2020-09-03 22:44:23', '2020-09-03 22:44:23', NULL),
(1026, 64, 'LEONEL LOPEZ 140820.pdf', '45_1599173063.pdf', '2020-09-03 22:44:23', '2020-09-03 22:44:23', NULL),
(1027, 64, 'LILIA I DIAZ 140820.pdf', '54_1599173063.pdf', '2020-09-03 22:44:23', '2020-09-03 22:44:23', NULL),
(1028, 64, 'LUIS GUZMAN 140820.pdf', '12_1599173063.pdf', '2020-09-03 22:44:23', '2020-09-03 22:44:23', NULL),
(1029, 64, 'MARCO A PAEZ 140820.pdf', '16_1599173063.pdf', '2020-09-03 22:44:23', '2020-09-03 22:44:23', NULL),
(1030, 64, 'MARTIN ANOTA 140820.pdf', '58_1599173063.pdf', '2020-09-03 22:44:23', '2020-09-03 22:44:23', NULL),
(1031, 64, 'MARTIN G CONTRERAS 140820.pdf', '481_1599173063.pdf', '2020-09-03 22:44:23', '2020-09-03 22:44:23', NULL),
(1032, 64, 'OBDULIA AVELINO 140820.pdf', '37_1599173063.pdf', '2020-09-03 22:44:23', '2020-09-03 22:44:23', NULL),
(1033, 64, 'RAFAEL RAMON 140820.pdf', '368_1599173063.pdf', '2020-09-03 22:44:23', '2020-09-03 22:44:23', NULL),
(1034, 64, 'RAYMUNDO LOPEZ 140820.pdf', '35_1599173120.pdf', '2020-09-03 22:45:20', '2020-09-03 22:45:20', NULL),
(1035, 64, 'RICARDO A SERENA 140820.pdf', '103_1599173120.pdf', '2020-09-03 22:45:20', '2020-09-03 22:45:20', NULL),
(1036, 64, 'ROBERTO FLORES 140820.pdf', '462_1599173120.pdf', '2020-09-03 22:45:20', '2020-09-03 22:45:20', NULL),
(1037, 64, 'ROCIO NAZARO 140820.pdf', '497_1599173120.pdf', '2020-09-03 22:45:20', '2020-09-03 22:45:20', NULL),
(1038, 64, 'SANTIAGO GONZALEZ 140820.pdf', '67_1599173120.pdf', '2020-09-03 22:45:20', '2020-09-03 22:45:20', NULL),
(1039, 64, 'SERGIO TORRES 140820.pdf', '441_1599173120.pdf', '2020-09-03 22:45:20', '2020-09-03 22:45:20', NULL),
(1040, 64, 'SILVANO BARBA 140820.pdf', '218_1599173120.pdf', '2020-09-03 22:45:20', '2020-09-03 22:45:20', NULL),
(1041, 64, 'VICTOR A AVELINO 140820.pdf', '169_1599173120.pdf', '2020-09-03 22:45:20', '2020-09-03 22:45:20', NULL),
(1042, 66, 'MARCELINO ZAPO 240820.pdf', '64_1599173242.pdf', '2020-09-03 22:47:22', '2020-09-03 22:47:22', NULL),
(1043, 66, 'MARCOS LOPEZ 240820.pdf', '77_1599173242.pdf', '2020-09-03 22:47:22', '2020-09-03 22:47:22', NULL),
(1044, 66, 'MAURICIO GOXCON 240820.pdf', '142_1599173242.pdf', '2020-09-03 22:47:22', '2020-09-03 22:47:22', NULL),
(1045, 66, 'MAXIMINO GLEZ 240820.pdf', '32_1599173242.pdf', '2020-09-03 22:47:22', '2020-09-03 22:47:22', NULL),
(1046, 66, 'RAUL PEREZ 240820.pdf', '107_1599173242.pdf', '2020-09-03 22:47:22', '2020-09-03 22:47:22', NULL),
(1047, 66, 'RIGOBERTO CHACHA 240820.pdf', '316_1599173242.pdf', '2020-09-03 22:47:22', '2020-09-03 22:47:22', NULL),
(1048, 66, 'RUSBEL CABRERA 240820.pdf', '206_1599173242.pdf', '2020-09-03 22:47:22', '2020-09-03 22:47:22', NULL),
(1049, 66, 'URIEL SEBA 240820.pdf', '31_1599173242.pdf', '2020-09-03 22:47:22', '2020-09-03 22:47:22', NULL),
(1050, 66, 'ALEJANDRO RETAMA 210820.pdf', '376_1599173242.pdf', '2020-09-03 22:47:22', '2020-09-03 22:47:22', NULL),
(1051, 66, 'ALEJANDRO RIOS 210820.pdf', '343_1599173242.pdf', '2020-09-03 22:47:22', '2020-09-03 22:47:22', NULL),
(1052, 66, 'BENITO HUESCA 210820.pdf', '490_1599173242.pdf', '2020-09-03 22:47:22', '2020-09-03 22:47:22', NULL),
(1053, 66, 'CELESTINO VILLANUEVA 210820.pdf', '281_1599173242.pdf', '2020-09-03 22:47:22', '2020-09-03 22:47:22', NULL),
(1054, 66, 'CONCEPCION JIMENEZ 210820.pdf', '397_1599173242.pdf', '2020-09-03 22:47:22', '2020-09-03 22:47:22', NULL),
(1055, 66, 'DANIEL I FDEZ 210820.pdf', '250_1599173242.pdf', '2020-09-03 22:47:22', '2020-09-03 22:47:22', NULL),
(1056, 66, 'DIANA L CEBALLOS 210820.pdf', '344_1599173242.pdf', '2020-09-03 22:47:22', '2020-09-03 22:47:22', NULL),
(1057, 66, 'ERICK G TORNADO 210820.pdf', '445_1599173242.pdf', '2020-09-03 22:47:22', '2020-09-03 22:47:22', NULL),
(1058, 66, 'FEDERICO HUESCA 210820.pdf', '229_1599173242.pdf', '2020-09-03 22:47:22', '2020-09-03 22:47:22', NULL),
(1059, 66, 'FERNANDO MAYO 210820.pdf', '275_1599173242.pdf', '2020-09-03 22:47:22', '2020-09-03 22:47:22', NULL),
(1060, 66, 'FRANCISCO BEJARANO 210820.pdf', '245_1599173331.pdf', '2020-09-03 22:48:51', '2020-09-03 22:48:51', NULL),
(1061, 66, 'FRANCISCO J RUIZ 210820.pdf', '181_1599173331.pdf', '2020-09-03 22:48:51', '2020-09-03 22:48:51', NULL),
(1062, 66, 'HIPOLITO A PULIDO 210820.pdf', '226_1599173331.pdf', '2020-09-03 22:48:51', '2020-09-03 22:48:51', NULL),
(1063, 66, 'HUGO A BOLAÑOS 210820.pdf', '7_1599173331.pdf', '2020-09-03 22:48:51', '2020-09-03 22:48:51', NULL),
(1064, 66, 'IGNACIO MURILLO 210820.pdf', '184_1599173331.pdf', '2020-09-03 22:48:51', '2020-09-03 22:48:51', NULL),
(1065, 66, 'IRAM G HUESCA 210820.pdf', '445_1599173331.pdf', '2020-09-03 22:48:51', '2020-09-03 22:48:51', NULL),
(1066, 66, 'ISMAEL RENERO 210820.pdf', '345_1599173331.pdf', '2020-09-03 22:48:51', '2020-09-03 22:48:51', NULL),
(1067, 66, 'IVAN D NOLASCO 210820.pdf', '94_1599173331.pdf', '2020-09-03 22:48:51', '2020-09-03 22:48:51', NULL),
(1068, 66, 'JAIME R NOLASCO 210820.pdf', '116_1599173331.pdf', '2020-09-03 22:48:51', '2020-09-03 22:48:51', NULL),
(1069, 66, 'JAIME SOTO 210820.pdf', '335_1599173331.pdf', '2020-09-03 22:48:51', '2020-09-03 22:48:51', NULL),
(1070, 66, 'JAIRO I CRUZ 210820.pdf', '31_1599173331.pdf', '2020-09-03 22:48:51', '2020-09-03 22:48:51', NULL),
(1071, 66, 'JAVIER DEGOLLADO 210820.pdf', '156_1599173331.pdf', '2020-09-03 22:48:51', '2020-09-03 22:48:51', NULL),
(1072, 66, 'JESUS HUESCA 210820.pdf', '69_1599173331.pdf', '2020-09-03 22:48:51', '2020-09-03 22:48:51', NULL),
(1073, 66, 'JOAQUIN AQUINO 210820.pdf', '346_1599173331.pdf', '2020-09-03 22:48:51', '2020-09-03 22:48:51', NULL),
(1074, 66, 'JOEL EVIA 210820.pdf', '479_1599173331.pdf', '2020-09-03 22:48:51', '2020-09-03 22:48:51', NULL),
(1075, 66, 'JORGE L CARMONA 210820.pdf', '320_1599173331.pdf', '2020-09-03 22:48:51', '2020-09-03 22:48:51', NULL),
(1076, 66, 'JOSE M DIONICIO 210820.pdf', '432_1599173331.pdf', '2020-09-03 22:48:51', '2020-09-03 22:48:51', NULL),
(1077, 66, 'JULIO C CHACON 210820.pdf', '297_1599173331.pdf', '2020-09-03 22:48:51', '2020-09-03 22:48:51', NULL),
(1078, 66, 'JULIO C GUZMAN 210820.pdf', '290_1599173331.pdf', '2020-09-03 22:48:51', '2020-09-03 22:48:51', NULL),
(1079, 66, 'LAURO SALOMON 210820.pdf', '126_1599173421.pdf', '2020-09-03 22:50:21', '2020-09-03 22:50:21', NULL),
(1080, 66, 'LEONARDO GLEZ 210820.pdf', '38_1599173421.pdf', '2020-09-03 22:50:21', '2020-09-03 22:50:21', NULL),
(1081, 66, 'LEONEL LOPEZ 210820.pdf', '144_1599173421.pdf', '2020-09-03 22:50:21', '2020-09-03 22:50:21', NULL),
(1082, 66, 'LILIA I DIAZ 210820.pdf', '317_1599173421.pdf', '2020-09-03 22:50:21', '2020-09-03 22:50:21', NULL),
(1083, 66, 'LUIS GUZMAN 210820.pdf', '130_1599173421.pdf', '2020-09-03 22:50:21', '2020-09-03 22:50:21', NULL),
(1084, 66, 'MARCO A PAEZ 210820.pdf', '460_1599173421.pdf', '2020-09-03 22:50:21', '2020-09-03 22:50:21', NULL),
(1085, 66, 'MARTIN ANOTA 210820.pdf', '424_1599173421.pdf', '2020-09-03 22:50:21', '2020-09-03 22:50:21', NULL),
(1086, 66, 'MARTIN G CONTRERAS 210820.pdf', '59_1599173421.pdf', '2020-09-03 22:50:21', '2020-09-03 22:50:21', NULL),
(1087, 66, 'OBDULIA AVELINO 210820.pdf', '475_1599173421.pdf', '2020-09-03 22:50:21', '2020-09-03 22:50:21', NULL),
(1088, 66, 'RAFAEL RAMON 210820.pdf', '188_1599173421.pdf', '2020-09-03 22:50:21', '2020-09-03 22:50:21', NULL),
(1089, 66, 'RAYMUNDO LOPEZ 210820.pdf', '360_1599173421.pdf', '2020-09-03 22:50:21', '2020-09-03 22:50:21', NULL),
(1090, 66, 'RICARDO A SERENA 210820.pdf', '19_1599173421.pdf', '2020-09-03 22:50:21', '2020-09-03 22:50:21', NULL),
(1091, 66, 'ROBERTO FLORES 210820.pdf', '161_1599173421.pdf', '2020-09-03 22:50:21', '2020-09-03 22:50:21', NULL),
(1092, 66, 'ROCIO NAZARO 210820.pdf', '495_1599173421.pdf', '2020-09-03 22:50:21', '2020-09-03 22:50:21', NULL),
(1093, 66, 'SANTIAGO GLEZ 210820.pdf', '15_1599173421.pdf', '2020-09-03 22:50:21', '2020-09-03 22:50:21', NULL),
(1094, 66, 'SERGIO TORRES 210820.pdf', '228_1599173421.pdf', '2020-09-03 22:50:21', '2020-09-03 22:50:21', NULL),
(1095, 66, 'SILVANO BARBA 210820 (2).pdf', '449_1599173421.pdf', '2020-09-03 22:50:21', '2020-09-03 22:50:21', NULL),
(1096, 66, 'SILVANO BARBA 210820.pdf', '279_1599173421.pdf', '2020-09-03 22:50:21', '2020-09-03 22:50:21', NULL),
(1097, 66, 'VICTOR A AVELINO 210820.pdf', '409_1599173421.pdf', '2020-09-03 22:50:21', '2020-09-03 22:50:21', NULL),
(1098, 62, 'LILIANA LURIA 070820.pdf', '345_1599173555.pdf', '2020-09-03 22:52:35', '2020-09-03 22:52:35', NULL),
(1099, 62, 'MARCELINO ZAPO 070820.pdf', '484_1599173555.pdf', '2020-09-03 22:52:35', '2020-09-03 22:52:35', NULL),
(1100, 62, 'MARCOS LOPEZ 070820.pdf', '45_1599173555.pdf', '2020-09-03 22:52:35', '2020-09-03 22:52:35', NULL),
(1101, 62, 'MAURICIO GOXCON 070820.pdf', '372_1599173555.pdf', '2020-09-03 22:52:35', '2020-09-03 22:52:35', NULL),
(1102, 62, 'MAXIMINO GLEZ 070820.pdf', '218_1599173555.pdf', '2020-09-03 22:52:35', '2020-09-03 22:52:35', NULL),
(1103, 62, 'RAUL PEREZ 070820.pdf', '205_1599173555.pdf', '2020-09-03 22:52:35', '2020-09-03 22:52:35', NULL),
(1104, 62, 'RIGOBERTO CHACHA 070820.pdf', '443_1599173555.pdf', '2020-09-03 22:52:35', '2020-09-03 22:52:35', NULL),
(1105, 62, 'RUSBEL CABRERA 070820.pdf', '157_1599173555.pdf', '2020-09-03 22:52:35', '2020-09-03 22:52:35', NULL),
(1106, 62, 'URIEL SEBA 070820.pdf', '485_1599173555.pdf', '2020-09-03 22:52:35', '2020-09-03 22:52:35', NULL),
(1107, 62, 'ALEJANDRO RETAMA 100820.pdf', '464_1599173555.pdf', '2020-09-03 22:52:35', '2020-09-03 22:52:35', NULL),
(1108, 62, 'ALEJANDRO RIOS 100820.pdf', '265_1599173555.pdf', '2020-09-03 22:52:35', '2020-09-03 22:52:35', NULL),
(1109, 62, 'BENITO HUESCA 100820.pdf', '319_1599173555.pdf', '2020-09-03 22:52:35', '2020-09-03 22:52:35', NULL),
(1110, 62, 'CELESTINO VILLANUEVA 100820.pdf', '394_1599173555.pdf', '2020-09-03 22:52:35', '2020-09-03 22:52:35', NULL),
(1111, 62, 'CONCEPCION JIMENEZ 100820.pdf', '251_1599173555.pdf', '2020-09-03 22:52:35', '2020-09-03 22:52:35', NULL),
(1112, 62, 'DANIEL I FDEZ 100820.pdf', '251_1599173555.pdf', '2020-09-03 22:52:35', '2020-09-03 22:52:35', NULL),
(1113, 62, 'DIANA L CEBALLOS 100820.pdf', '49_1599173555.pdf', '2020-09-03 22:52:35', '2020-09-03 22:52:35', NULL),
(1114, 62, 'ERICK G TORNADO 100820.pdf', '7_1599173555.pdf', '2020-09-03 22:52:35', '2020-09-03 22:52:35', NULL),
(1115, 62, 'FEDERICO HUESCA 100820.pdf', '325_1599173555.pdf', '2020-09-03 22:52:35', '2020-09-03 22:52:35', NULL),
(1116, 62, 'FERNANDO MAYO 100820.pdf', '16_1599173555.pdf', '2020-09-03 22:52:35', '2020-09-03 22:52:35', NULL),
(1117, 62, 'FRANCISCO J RUIZ 100820.pdf', '494_1599173650.pdf', '2020-09-03 22:54:10', '2020-09-03 22:54:10', NULL),
(1118, 62, 'HIPOLITO A PULIDO 100820.pdf', '77_1599173650.pdf', '2020-09-03 22:54:10', '2020-09-03 22:54:10', NULL),
(1119, 62, 'HUGO A BOLAÑOS 100820.pdf', '247_1599173650.pdf', '2020-09-03 22:54:10', '2020-09-03 22:54:10', NULL),
(1120, 62, 'IGNACIO MURILLO 100820.pdf', '144_1599173650.pdf', '2020-09-03 22:54:10', '2020-09-03 22:54:10', NULL),
(1121, 62, 'IRAM G HUESCA 100820.pdf', '28_1599173650.pdf', '2020-09-03 22:54:10', '2020-09-03 22:54:10', NULL),
(1122, 62, 'ISMAEL RENERO 100820.pdf', '281_1599173650.pdf', '2020-09-03 22:54:10', '2020-09-03 22:54:10', NULL),
(1123, 62, 'IVAN D NOLASCO 100820.pdf', '316_1599173650.pdf', '2020-09-03 22:54:10', '2020-09-03 22:54:10', NULL),
(1124, 62, 'JAIME R NOLASCO 100820.pdf', '37_1599173650.pdf', '2020-09-03 22:54:10', '2020-09-03 22:54:10', NULL),
(1125, 62, 'JAIME SOTO 100820.pdf', '402_1599173650.pdf', '2020-09-03 22:54:10', '2020-09-03 22:54:10', NULL),
(1126, 62, 'JAIRO I CRUZ 100820.pdf', '62_1599173650.pdf', '2020-09-03 22:54:10', '2020-09-03 22:54:10', NULL),
(1127, 62, 'JAVIER DEGOLLADO 100820.pdf', '496_1599173650.pdf', '2020-09-03 22:54:10', '2020-09-03 22:54:10', NULL),
(1128, 62, 'JESUS HUESCA 100820.pdf', '18_1599173650.pdf', '2020-09-03 22:54:10', '2020-09-03 22:54:10', NULL),
(1129, 62, 'JOAQUIN AQUINO 100820.pdf', '37_1599173650.pdf', '2020-09-03 22:54:10', '2020-09-03 22:54:10', NULL),
(1130, 62, 'JOEL EVIA 100820.pdf', '270_1599173650.pdf', '2020-09-03 22:54:10', '2020-09-03 22:54:10', NULL),
(1131, 62, 'JORGE L CARMONA 100820.pdf', '391_1599173650.pdf', '2020-09-03 22:54:10', '2020-09-03 22:54:10', NULL),
(1132, 62, 'JOSE N DIONICIO 100820.pdf', '200_1599173650.pdf', '2020-09-03 22:54:10', '2020-09-03 22:54:10', NULL),
(1133, 62, 'JULIO C CHACON 100820.pdf', '320_1599173650.pdf', '2020-09-03 22:54:10', '2020-09-03 22:54:10', NULL),
(1134, 62, 'JULIO C GUZMAN 100820.pdf', '368_1599173650.pdf', '2020-09-03 22:54:10', '2020-09-03 22:54:10', NULL),
(1135, 62, 'LAURO SALOMON 100820.pdf', '408_1599173650.pdf', '2020-09-03 22:54:10', '2020-09-03 22:54:10', NULL),
(1136, 62, 'LEONARDO GLEZ 100820.pdf', '422_1599173737.pdf', '2020-09-03 22:55:37', '2020-09-03 22:55:37', NULL),
(1137, 62, 'LEONEL LOPEZ 100820.pdf', '358_1599173737.pdf', '2020-09-03 22:55:37', '2020-09-03 22:55:37', NULL),
(1138, 62, 'LILIA I DIAZ 100820.pdf', '96_1599173737.pdf', '2020-09-03 22:55:37', '2020-09-03 22:55:37', NULL),
(1139, 62, 'LUIS GUZMAN 100820.pdf', '158_1599173737.pdf', '2020-09-03 22:55:37', '2020-09-03 22:55:37', NULL),
(1140, 62, 'MARCO A PAEZ 100820.pdf', '44_1599173737.pdf', '2020-09-03 22:55:37', '2020-09-03 22:55:37', NULL),
(1141, 62, 'MARTIN G CONTRERAS 100820.pdf', '414_1599173737.pdf', '2020-09-03 22:55:37', '2020-09-03 22:55:37', NULL),
(1142, 62, 'OBDULIA AVELINO 100820.pdf', '36_1599173737.pdf', '2020-09-03 22:55:37', '2020-09-03 22:55:37', NULL),
(1143, 62, 'RAFAEL RAMON 100820.pdf', '267_1599173737.pdf', '2020-09-03 22:55:37', '2020-09-03 22:55:37', NULL),
(1144, 62, 'RAYMUNDO LOPEZ 100820.pdf', '133_1599173737.pdf', '2020-09-03 22:55:37', '2020-09-03 22:55:37', NULL),
(1145, 62, 'RICARDO A SERENA 100820.pdf', '1_1599173737.pdf', '2020-09-03 22:55:37', '2020-09-03 22:55:37', NULL),
(1146, 62, 'ROBERTO FLORES 100820.pdf', '236_1599173737.pdf', '2020-09-03 22:55:37', '2020-09-03 22:55:37', NULL),
(1147, 62, 'ROCIO NAZARO 100820.pdf', '174_1599173737.pdf', '2020-09-03 22:55:37', '2020-09-03 22:55:37', NULL),
(1148, 62, 'SANTIAGO GLEZ 100820.pdf', '349_1599173737.pdf', '2020-09-03 22:55:37', '2020-09-03 22:55:37', NULL),
(1149, 62, 'SERGIO TORRES 100820.pdf', '482_1599173737.pdf', '2020-09-03 22:55:37', '2020-09-03 22:55:37', NULL),
(1150, 62, 'SILVANO BARBA 100820.pdf', '482_1599173737.pdf', '2020-09-03 22:55:37', '2020-09-03 22:55:37', NULL),
(1151, 62, 'VICTOR A AVELINO 100820.pdf', '77_1599173737.pdf', '2020-09-03 22:55:37', '2020-09-03 22:55:37', NULL),
(1152, 58, 'LEONEL LOPEZ 240720.pdf', '439_1599173892.pdf', '2020-09-03 22:58:12', '2020-09-03 22:58:12', NULL),
(1153, 58, 'LILIA I DIAZ 240720.pdf', '235_1599173892.pdf', '2020-09-03 22:58:12', '2020-09-03 22:58:12', NULL),
(1154, 58, 'LUIS GUZMAN 240720.pdf', '104_1599173892.pdf', '2020-09-03 22:58:12', '2020-09-03 22:58:12', NULL),
(1155, 58, 'MARCO A PAEZ 240720.pdf', '452_1599173892.pdf', '2020-09-03 22:58:12', '2020-09-03 22:58:12', NULL),
(1156, 58, 'MARTIN ANOTA 240720.pdf', '338_1599173892.pdf', '2020-09-03 22:58:12', '2020-09-03 22:58:12', NULL),
(1157, 58, 'MARTIN G CONTRERAS 240720.pdf', '319_1599173892.pdf', '2020-09-03 22:58:12', '2020-09-03 22:58:12', NULL),
(1158, 58, 'OBDULIA AVELINO 240720.pdf', '373_1599173892.pdf', '2020-09-03 22:58:12', '2020-09-03 22:58:12', NULL),
(1159, 58, 'RAYMUNDO LOPEZ 240720.pdf', '208_1599173892.pdf', '2020-09-03 22:58:12', '2020-09-03 22:58:12', NULL),
(1160, 58, 'ROBERTO FLORES 240720.pdf', '202_1599173892.pdf', '2020-09-03 22:58:12', '2020-09-03 22:58:12', NULL),
(1161, 58, 'ROCIO NAZARO 240720.pdf', '168_1599173892.pdf', '2020-09-03 22:58:12', '2020-09-03 22:58:12', NULL),
(1162, 58, 'SANTIAGO GLEZ 240720.pdf', '269_1599173892.pdf', '2020-09-03 22:58:12', '2020-09-03 22:58:12', NULL),
(1163, 58, 'SERGIO TORRES 240720.pdf', '101_1599173892.pdf', '2020-09-03 22:58:12', '2020-09-03 22:58:12', NULL),
(1164, 58, 'SILVANO BARBA 240720.pdf', '70_1599173892.pdf', '2020-09-03 22:58:12', '2020-09-03 22:58:12', NULL),
(1165, 58, 'ALEJANDRO RETAMA 310720.pdf', '84_1599173983.pdf', '2020-09-03 22:59:43', '2020-09-03 22:59:43', NULL),
(1166, 58, 'ALEJANDRO RIOS 310720.pdf', '78_1599173983.pdf', '2020-09-03 22:59:43', '2020-09-03 22:59:43', NULL),
(1167, 58, 'BENITO HUESCA 310720.pdf', '323_1599173983.pdf', '2020-09-03 22:59:43', '2020-09-03 22:59:43', NULL),
(1168, 58, 'CELESTINO VILLANUEVA 310720.pdf', '106_1599173983.pdf', '2020-09-03 22:59:43', '2020-09-03 22:59:43', NULL),
(1169, 58, 'CONCEPCION JIMENEZ 310720.pdf', '48_1599173983.pdf', '2020-09-03 22:59:43', '2020-09-03 22:59:43', NULL),
(1170, 58, 'DANIEL I FDEZ 310720.pdf', '140_1599173983.pdf', '2020-09-03 22:59:43', '2020-09-03 22:59:43', NULL),
(1171, 58, 'ERICK G TORNADO 310720.pdf', '242_1599173983.pdf', '2020-09-03 22:59:43', '2020-09-03 22:59:43', NULL),
(1172, 58, 'FEDERICO HUESCA 310720.pdf', '345_1599173983.pdf', '2020-09-03 22:59:43', '2020-09-03 22:59:43', NULL),
(1173, 58, 'FELIPE CARRASCO 310720.pdf', '220_1599173983.pdf', '2020-09-03 22:59:43', '2020-09-03 22:59:43', NULL),
(1174, 58, 'FERNANDO MAYO 310720.pdf', '386_1599173983.pdf', '2020-09-03 22:59:43', '2020-09-03 22:59:43', NULL),
(1175, 58, 'FRANCISCO BEJARANO 310720.pdf', '53_1599173983.pdf', '2020-09-03 22:59:43', '2020-09-03 22:59:43', NULL),
(1176, 58, 'FRANCISCO J RUIZ 310720.pdf', '258_1599173983.pdf', '2020-09-03 22:59:43', '2020-09-03 22:59:43', NULL),
(1177, 58, 'HUGO A BOLAÑOS 310720.pdf', '451_1599173983.pdf', '2020-09-03 22:59:43', '2020-09-03 22:59:43', NULL),
(1178, 58, 'IGNACIO MURILLO 310720.pdf', '142_1599173983.pdf', '2020-09-03 22:59:43', '2020-09-03 22:59:43', NULL),
(1179, 58, 'IRAM G HUESCA 310720.pdf', '207_1599173983.pdf', '2020-09-03 22:59:43', '2020-09-03 22:59:43', NULL),
(1180, 58, 'ISMAEL RENERO 310720.pdf', '177_1599173983.pdf', '2020-09-03 22:59:43', '2020-09-03 22:59:43', NULL),
(1181, 58, 'JAIME R NOLASCO 310720.pdf', '255_1599173983.pdf', '2020-09-03 22:59:43', '2020-09-03 22:59:43', NULL),
(1182, 58, 'JAIME SOTO 310720.pdf', '269_1599173983.pdf', '2020-09-03 22:59:43', '2020-09-03 22:59:43', NULL),
(1183, 58, 'JAIRO I CRUZ 310720.pdf', '497_1599173983.pdf', '2020-09-03 22:59:43', '2020-09-03 22:59:43', NULL),
(1184, 58, 'JAVIER DEGOLLADO 310720.pdf', '337_1599173983.pdf', '2020-09-03 22:59:43', '2020-09-03 22:59:43', NULL),
(1185, 58, 'JESUS HUESCA 310720.pdf', '278_1599174079.pdf', '2020-09-03 23:01:19', '2020-09-03 23:01:19', NULL),
(1186, 58, 'JOAQUIN AQUINO 310720.pdf', '438_1599174079.pdf', '2020-09-03 23:01:19', '2020-09-03 23:01:19', NULL),
(1187, 58, 'JOEL EVIA 310720.pdf', '102_1599174079.pdf', '2020-09-03 23:01:19', '2020-09-03 23:01:19', NULL),
(1188, 58, 'JORGE L CARMONA 310720.pdf', '21_1599174079.pdf', '2020-09-03 23:01:19', '2020-09-03 23:01:19', NULL),
(1189, 58, 'JOSE M DIONICIO 310720.pdf', '159_1599174079.pdf', '2020-09-03 23:01:19', '2020-09-03 23:01:19', NULL),
(1190, 58, 'JULIO C CHACON 310720.pdf', '178_1599174079.pdf', '2020-09-03 23:01:19', '2020-09-03 23:01:19', NULL),
(1191, 58, 'JULIO C GUZMAN 310720.pdf', '446_1599174079.pdf', '2020-09-03 23:01:19', '2020-09-03 23:01:19', NULL),
(1192, 58, 'LAURO SALOMON 310720.pdf', '99_1599174079.pdf', '2020-09-03 23:01:19', '2020-09-03 23:01:19', NULL),
(1193, 58, 'LEONARDO GLEZ 310720.pdf', '186_1599174079.pdf', '2020-09-03 23:01:19', '2020-09-03 23:01:19', NULL),
(1194, 58, 'LEONEL LOPEZ 310720.pdf', '338_1599174079.pdf', '2020-09-03 23:01:19', '2020-09-03 23:01:19', NULL),
(1195, 58, 'LILIA I DIAZ 310720.pdf', '359_1599174079.pdf', '2020-09-03 23:01:19', '2020-09-03 23:01:19', NULL),
(1196, 58, 'LUIS GUZMAN 310720.pdf', '97_1599174079.pdf', '2020-09-03 23:01:19', '2020-09-03 23:01:19', NULL),
(1197, 58, 'MARCO A PAEZ 310720.pdf', '258_1599174079.pdf', '2020-09-03 23:01:19', '2020-09-03 23:01:19', NULL),
(1198, 58, 'MARTIN ANOTA 310720.pdf', '345_1599174079.pdf', '2020-09-03 23:01:19', '2020-09-03 23:01:19', NULL),
(1199, 58, 'OBDULIA AVELINO 310720.pdf', '337_1599174079.pdf', '2020-09-03 23:01:19', '2020-09-03 23:01:19', NULL),
(1200, 58, 'RAFAEL RAMON 310720.pdf', '422_1599174079.pdf', '2020-09-03 23:01:19', '2020-09-03 23:01:19', NULL),
(1201, 58, 'RAYMUNDO LOPEZ 310720.pdf', '237_1599174079.pdf', '2020-09-03 23:01:19', '2020-09-03 23:01:19', NULL),
(1202, 58, 'ROBERTO FLORES 310720.pdf', '484_1599174079.pdf', '2020-09-03 23:01:19', '2020-09-03 23:01:19', NULL),
(1203, 58, 'ROCIO NAZARO 310720.pdf', '156_1599174079.pdf', '2020-09-03 23:01:19', '2020-09-03 23:01:19', NULL),
(1204, 58, 'SANTIAGO GLEZ 310720.pdf', '397_1599174079.pdf', '2020-09-03 23:01:19', '2020-09-03 23:01:19', NULL),
(1205, 62, 'ABERLAY LEON 310720.pdf', '183_1599174180.pdf', '2020-09-03 23:03:00', '2020-09-03 23:03:00', NULL),
(1206, 62, 'ALBERTO OBIL 310720 RICARDO.pdf', '470_1599174180.pdf', '2020-09-03 23:03:00', '2020-09-03 23:03:00', NULL),
(1207, 62, 'ALFREDO XOLO 310720.pdf', '5_1599174180.pdf', '2020-09-03 23:03:00', '2020-09-03 23:03:00', NULL),
(1208, 62, 'AUGUSTO HDEZ 310720.pdf', '402_1599174180.pdf', '2020-09-03 23:03:00', '2020-09-03 23:03:00', NULL),
(1209, 62, 'AURELIO ZAPO 310720.pdf', '434_1599174180.pdf', '2020-09-03 23:03:00', '2020-09-03 23:03:00', NULL),
(1210, 62, 'DANIEL C HDEZ 310720.pdf', '449_1599174180.pdf', '2020-09-03 23:03:00', '2020-09-03 23:03:00', NULL),
(1211, 62, 'DANIEL MONTIEL 310720.pdf', '260_1599174180.pdf', '2020-09-03 23:03:00', '2020-09-03 23:03:00', NULL),
(1212, 62, 'EZEQUIAS ANTELE 310720.pdf', '28_1599174180.pdf', '2020-09-03 23:03:00', '2020-09-03 23:03:00', NULL),
(1213, 62, 'FERNANDO ANTONIO 310720.pdf', '195_1599174180.pdf', '2020-09-03 23:03:00', '2020-09-03 23:03:00', NULL),
(1214, 62, 'HECTOR MOLINA 310720.pdf', '428_1599174180.pdf', '2020-09-03 23:03:00', '2020-09-03 23:03:00', NULL),
(1215, 62, 'HILARIO MOZO 310720 RICARDO.pdf', '171_1599174180.pdf', '2020-09-03 23:03:00', '2020-09-03 23:03:00', NULL),
(1216, 62, 'IGNACIO M TENORIO 310720.pdf', '121_1599174180.pdf', '2020-09-03 23:03:00', '2020-09-03 23:03:00', NULL),
(1217, 62, 'IRVING MENDEZ 310720.pdf', '194_1599174180.pdf', '2020-09-03 23:03:00', '2020-09-03 23:03:00', NULL),
(1218, 62, 'JORGE A ESCRIBANO 310720 RICARDO.pdf', '127_1599174180.pdf', '2020-09-03 23:03:00', '2020-09-03 23:03:00', NULL),
(1219, 62, 'JORGE L DGUEZ 310720.pdf', '127_1599174180.pdf', '2020-09-03 23:03:00', '2020-09-03 23:03:00', NULL),
(1220, 62, 'JOSE L VERGARA 310720.pdf', '351_1599174180.pdf', '2020-09-03 23:03:00', '2020-09-03 23:03:00', NULL),
(1221, 62, 'JUAN C VERGARA 310720.pdf', '389_1599174180.pdf', '2020-09-03 23:03:00', '2020-09-03 23:03:00', NULL),
(1222, 62, 'JULIO C SERDAN 310720.pdf', '260_1599174180.pdf', '2020-09-03 23:03:00', '2020-09-03 23:03:00', NULL),
(1223, 62, 'LEONARDO LOPEZ 310720.pdf', '16_1599174180.pdf', '2020-09-03 23:03:00', '2020-09-03 23:03:00', NULL),
(1224, 62, 'MARCELINO ZAPO 310720.pdf', '315_1599174180.pdf', '2020-09-03 23:03:00', '2020-09-03 23:03:00', NULL),
(1225, 58, 'SERGIO TORRES 310720.pdf', '388_1599174244.pdf', '2020-09-03 23:04:04', '2020-09-03 23:04:04', NULL),
(1226, 58, 'SILVANO BARBA 310720.pdf', '276_1599174244.pdf', '2020-09-03 23:04:04', '2020-09-03 23:04:04', NULL),
(1227, 58, 'VICTOR A AVELINO 310720.pdf', '130_1599174244.pdf', '2020-09-03 23:04:04', '2020-09-03 23:04:04', NULL),
(1228, 58, 'ABERLAY LEON 310720.pdf', '138_1599174300.pdf', '2020-09-03 23:05:00', '2020-09-03 23:05:00', NULL),
(1229, 58, 'ALBERTO OBIL 310720 RICARDO.pdf', '19_1599174300.pdf', '2020-09-03 23:05:00', '2020-09-03 23:05:00', NULL),
(1230, 58, 'ALFREDO XOLO 310720.pdf', '231_1599174300.pdf', '2020-09-03 23:05:00', '2020-09-03 23:05:00', NULL),
(1231, 58, 'AUGUSTO HDEZ 310720.pdf', '124_1599174300.pdf', '2020-09-03 23:05:00', '2020-09-03 23:05:00', NULL),
(1232, 58, 'AURELIO ZAPO 310720.pdf', '228_1599174300.pdf', '2020-09-03 23:05:00', '2020-09-03 23:05:00', NULL),
(1233, 58, 'DANIEL C HDEZ 310720.pdf', '440_1599174300.pdf', '2020-09-03 23:05:00', '2020-09-03 23:05:00', NULL),
(1234, 58, 'DANIEL MONTIEL 310720.pdf', '347_1599174300.pdf', '2020-09-03 23:05:00', '2020-09-03 23:05:00', NULL),
(1235, 58, 'EZEQUIAS ANTELE 310720.pdf', '203_1599174300.pdf', '2020-09-03 23:05:00', '2020-09-03 23:05:00', NULL),
(1236, 58, 'FERNANDO ANTONIO 310720.pdf', '105_1599174300.pdf', '2020-09-03 23:05:00', '2020-09-03 23:05:00', NULL),
(1237, 58, 'HECTOR MOLINA 310720.pdf', '255_1599174300.pdf', '2020-09-03 23:05:00', '2020-09-03 23:05:00', NULL),
(1238, 58, 'HILARIO MOZO 310720 RICARDO.pdf', '265_1599174300.pdf', '2020-09-03 23:05:00', '2020-09-03 23:05:00', NULL),
(1239, 58, 'IGNACIO M TENORIO 310720.pdf', '490_1599174300.pdf', '2020-09-03 23:05:00', '2020-09-03 23:05:00', NULL),
(1240, 58, 'IRVING MENDEZ 310720.pdf', '218_1599174349.pdf', '2020-09-03 23:05:49', '2020-09-03 23:05:49', NULL),
(1241, 58, 'JORGE A ESCRIBANO 310720 RICARDO.pdf', '201_1599174349.pdf', '2020-09-03 23:05:49', '2020-09-03 23:05:49', NULL),
(1242, 58, 'JORGE L DGUEZ 310720.pdf', '470_1599174349.pdf', '2020-09-03 23:05:49', '2020-09-03 23:05:49', NULL),
(1243, 58, 'JOSE L VERGARA 310720.pdf', '65_1599174349.pdf', '2020-09-03 23:05:49', '2020-09-03 23:05:49', NULL),
(1244, 58, 'JUAN C VERGARA 310720.pdf', '166_1599174349.pdf', '2020-09-03 23:05:49', '2020-09-03 23:05:49', NULL),
(1245, 58, 'JULIO C SERDAN 310720.pdf', '234_1599174349.pdf', '2020-09-03 23:05:49', '2020-09-03 23:05:49', NULL),
(1246, 58, 'LEONARDO LOPEZ 310720.pdf', '302_1599174350.pdf', '2020-09-03 23:05:50', '2020-09-03 23:05:50', NULL),
(1247, 58, 'MARCELINO ZAPO 310720.pdf', '100_1599174350.pdf', '2020-09-03 23:05:50', '2020-09-03 23:05:50', NULL),
(1248, 58, 'MAURICIO GOXCON 310720 RICARDO.pdf', '254_1599174350.pdf', '2020-09-03 23:05:50', '2020-09-03 23:05:50', NULL),
(1249, 58, 'MAXIMINO GLEZ 310720.pdf', '352_1599174350.pdf', '2020-09-03 23:05:50', '2020-09-03 23:05:50', NULL),
(1250, 58, 'RIGOBERTO CHACHA 310720.pdf', '225_1599174350.pdf', '2020-09-03 23:05:50', '2020-09-03 23:05:50', NULL),
(1251, 58, 'RUSBEL CABRERA 310720.pdf', '217_1599174350.pdf', '2020-09-03 23:05:50', '2020-09-03 23:05:50', NULL),
(1252, 56, 'SERGIO TORRES 170720.pdf', '299_1599174461.pdf', '2020-09-03 23:07:41', '2020-09-03 23:07:41', NULL),
(1253, 56, 'SILVANO BARBA 170720.pdf', '35_1599174461.pdf', '2020-09-03 23:07:41', '2020-09-03 23:07:41', NULL),
(1254, 56, 'ROCIO NAZARO 170720.pdf', '305_1599174461.pdf', '2020-09-03 23:07:41', '2020-09-03 23:08:26', '2020-09-03 23:08:26'),
(1255, 56, 'VICTOR A AVELINO 170720.pdf', '184_1599174506.pdf', '2020-09-03 23:08:26', '2020-09-03 23:08:26', NULL),
(1256, 56, 'ABERLAY LEON 310720.pdf', '273_1599174577.pdf', '2020-09-03 23:09:37', '2020-09-03 23:09:37', NULL),
(1257, 56, 'ALBERTO OBIL 310720 RICARDO.pdf', '493_1599174577.pdf', '2020-09-03 23:09:37', '2020-09-03 23:09:37', NULL),
(1258, 56, 'ALFREDO XOLO 310720.pdf', '32_1599174577.pdf', '2020-09-03 23:09:37', '2020-09-03 23:09:37', NULL),
(1259, 56, 'AUGUSTO HDEZ 310720.pdf', '169_1599174577.pdf', '2020-09-03 23:09:37', '2020-09-03 23:09:37', NULL),
(1260, 56, 'AURELIO ZAPO 310720.pdf', '297_1599174577.pdf', '2020-09-03 23:09:37', '2020-09-03 23:09:37', NULL),
(1261, 56, 'DANIEL C HDEZ 310720.pdf', '282_1599174577.pdf', '2020-09-03 23:09:37', '2020-09-03 23:09:37', NULL),
(1262, 56, 'EZEQUIAS ANTELE 310720.pdf', '147_1599174577.pdf', '2020-09-03 23:09:37', '2020-09-03 23:09:37', NULL),
(1263, 56, 'HILARIO MOZO 310720 RICARDO.pdf', '232_1599174577.pdf', '2020-09-03 23:09:37', '2020-09-03 23:09:37', NULL),
(1264, 56, 'JORGE A ESCRIBANO 310720 RICARDO.pdf', '423_1599174577.pdf', '2020-09-03 23:09:37', '2020-09-03 23:09:37', NULL),
(1265, 56, 'JORGE L DGUEZ 310720.pdf', '4_1599174577.pdf', '2020-09-03 23:09:37', '2020-09-03 23:09:37', NULL),
(1266, 56, 'JOSE L VERGARA 310720.pdf', '144_1599174577.pdf', '2020-09-03 23:09:37', '2020-09-03 23:09:37', NULL),
(1267, 56, 'JUAN C VERGARA 310720 RICARDO.pdf', '165_1599174577.pdf', '2020-09-03 23:09:37', '2020-09-03 23:09:37', NULL),
(1268, 56, 'MARCELINO ZAPO 310720.pdf', '310_1599174577.pdf', '2020-09-03 23:09:37', '2020-09-03 23:09:37', NULL),
(1269, 56, 'MAURICIO GOXCON 310720 RICARDO.pdf', '239_1599174577.pdf', '2020-09-03 23:09:37', '2020-09-03 23:09:37', NULL),
(1270, 56, 'RIGOBERTO CHACHA 310720.pdf', '180_1599174577.pdf', '2020-09-03 23:09:37', '2020-09-03 23:09:37', NULL),
(1271, 56, 'DANIEL MONTIEL 310720.pdf', '289_1599174648.pdf', '2020-09-03 23:10:48', '2020-09-03 23:10:48', NULL),
(1272, 56, 'FERNANDO ANTONIO 310720.pdf', '432_1599174648.pdf', '2020-09-03 23:10:48', '2020-09-03 23:10:48', NULL),
(1273, 56, 'GUILLERMO S CELAYA 310720.pdf', '370_1599174648.pdf', '2020-09-03 23:10:48', '2020-09-03 23:10:48', NULL),
(1274, 56, 'HECTOR MOLINA 310720.pdf', '171_1599174648.pdf', '2020-09-03 23:10:48', '2020-09-03 23:10:48', NULL),
(1275, 56, 'IGNACIO M TENORIO 310720.pdf', '126_1599174648.pdf', '2020-09-03 23:10:48', '2020-09-03 23:10:48', NULL),
(1276, 56, 'IRVING MENDEZ 310720.pdf', '57_1599174648.pdf', '2020-09-03 23:10:48', '2020-09-03 23:10:48', NULL),
(1277, 56, 'JULIO C SERDAN 310720.pdf', '472_1599174648.pdf', '2020-09-03 23:10:48', '2020-09-03 23:10:48', NULL),
(1278, 56, 'LEONARDO A TORRES 310720.pdf', '450_1599174649.pdf', '2020-09-03 23:10:49', '2020-09-03 23:10:49', NULL),
(1279, 56, 'LEONARDO LOPEZ 310720.pdf', '453_1599174649.pdf', '2020-09-03 23:10:49', '2020-09-03 23:10:49', NULL),
(1280, 56, 'LUIS E CARMONA 310720.pdf', '270_1599174649.pdf', '2020-09-03 23:10:49', '2020-09-03 23:10:49', NULL),
(1281, 56, 'MARIO TORRES 310720.pdf', '202_1599174649.pdf', '2020-09-03 23:10:49', '2020-09-03 23:10:49', NULL),
(1282, 56, 'MAXIMINO GLEZ 310720.pdf', '380_1599174649.pdf', '2020-09-03 23:10:49', '2020-09-03 23:10:49', NULL),
(1283, 56, 'MIGUEL A ARANO 310720.pdf', '372_1599174649.pdf', '2020-09-03 23:10:49', '2020-09-03 23:10:49', NULL),
(1284, 56, 'RUSBEL CABRERA 310720.pdf', '187_1599174649.pdf', '2020-09-03 23:10:49', '2020-09-03 23:10:49', NULL),
(1285, 56, 'SALVADOR RGUEZ 310720.pdf', '437_1599174649.pdf', '2020-09-03 23:10:49', '2020-09-03 23:10:49', NULL),
(1286, 69, 'BBVA 040920.pdf', '190_1599778336.pdf', '2020-09-10 22:52:16', '2020-09-10 22:52:16', NULL),
(1287, 69, 'INTERBANCARIOS 040920.pdf', '88_1599778336.pdf', '2020-09-10 22:52:16', '2020-09-10 22:52:16', NULL),
(1288, 69, 'BBVA 040920.pdf', '428_1599778336.pdf', '2020-09-10 22:52:16', '2020-09-10 22:52:16', NULL),
(1289, 69, 'INTERBANCARIO 040920.pdf', '305_1599778336.pdf', '2020-09-10 22:52:16', '2020-09-10 22:52:16', NULL),
(1290, 69, 'MARCO A PAEZ 070920.pdf', '312_1599778336.pdf', '2020-09-10 22:52:16', '2020-09-10 22:52:16', NULL),
(1291, 69, 'PEDRO A FLORES 040920.pdf', '440_1599778336.pdf', '2020-09-10 22:52:16', '2020-09-10 22:52:16', NULL),
(1292, 69, 'RICARDO A SERENA 070920.pdf', '58_1599778336.pdf', '2020-09-10 22:52:16', '2020-09-10 22:52:16', NULL),
(1293, 70, 'ABERLAY LEON 040920.pdf', '42_1599778435.pdf', '2020-09-10 22:53:55', '2020-09-10 22:53:55', NULL),
(1294, 70, 'ALBERO OBIL 040920.pdf', '119_1599778435.pdf', '2020-09-10 22:53:55', '2020-09-10 22:53:55', NULL),
(1295, 70, 'ALFREDO XOLO 040920.pdf', '112_1599778435.pdf', '2020-09-10 22:53:55', '2020-09-10 22:53:55', NULL),
(1296, 70, 'AUGUSTO HDEZ 040920.pdf', '306_1599778435.pdf', '2020-09-10 22:53:55', '2020-09-10 22:53:55', NULL),
(1297, 70, 'AURELIO ZAPO 040920.pdf', '418_1599778435.pdf', '2020-09-10 22:53:55', '2020-09-10 22:53:55', NULL),
(1298, 70, 'DANIEL C HDEZ 040920.pdf', '374_1599778435.pdf', '2020-09-10 22:53:55', '2020-09-10 22:53:55', NULL),
(1299, 70, 'FERNANDO ANTONIO 040920.pdf', '484_1599778435.pdf', '2020-09-10 22:53:55', '2020-09-10 22:53:55', NULL),
(1300, 70, 'HECTOR MOLINA 040920.pdf', '318_1599778435.pdf', '2020-09-10 22:53:55', '2020-09-10 22:53:55', NULL),
(1301, 70, 'DANIEL MONTIEL 040920.pdf', '144_1599778435.pdf', '2020-09-10 22:53:55', '2020-09-10 22:53:55', NULL),
(1302, 70, 'HILARIO MOZO 040920.pdf', '6_1599778435.pdf', '2020-09-10 22:53:55', '2020-09-10 22:53:55', NULL),
(1303, 70, 'IGNACIO M TENORIO 040920.pdf', '451_1599778435.pdf', '2020-09-10 22:53:55', '2020-09-10 22:53:55', NULL),
(1304, 70, 'IRVING MENDEZ 040920.pdf', '409_1599778435.pdf', '2020-09-10 22:53:55', '2020-09-10 22:53:55', NULL),
(1305, 70, 'JIMMY H MENDEZ 040920.pdf', '483_1599778435.pdf', '2020-09-10 22:53:55', '2020-09-10 22:53:55', NULL),
(1306, 70, 'JORGE A ESCRIBANO 040920.pdf', '331_1599778435.pdf', '2020-09-10 22:53:55', '2020-09-10 22:53:55', NULL),
(1307, 70, 'JOSE L VERGARA 040920.pdf', '397_1599778501.pdf', '2020-09-10 22:55:01', '2020-09-10 22:55:01', NULL),
(1308, 70, 'JUAN C VERGARA 040920.pdf', '148_1599778501.pdf', '2020-09-10 22:55:01', '2020-09-10 22:55:01', NULL),
(1309, 70, 'JUAN M DIAZ 040920.pdf', '306_1599778501.pdf', '2020-09-10 22:55:01', '2020-09-10 22:55:01', NULL),
(1310, 70, 'JULIO C SERDAN 040920.pdf', '49_1599778501.pdf', '2020-09-10 22:55:01', '2020-09-10 22:55:01', NULL),
(1311, 70, 'LEONARDO LOPEZ 040920.pdf', '405_1599778501.pdf', '2020-09-10 22:55:01', '2020-09-10 22:55:01', NULL),
(1312, 70, 'LILIANA LURIA 040920.pdf', '100_1599778501.pdf', '2020-09-10 22:55:01', '2020-09-10 22:55:01', NULL),
(1313, 70, 'MARCELINO ZAPO 040920.pdf', '144_1599778501.pdf', '2020-09-10 22:55:01', '2020-09-10 22:55:01', NULL),
(1314, 70, 'MARCOS LOPEZ 040920.pdf', '68_1599778501.pdf', '2020-09-10 22:55:01', '2020-09-10 22:55:01', NULL),
(1315, 70, 'MAURICIO GOXCON 040920.pdf', '70_1599778501.pdf', '2020-09-10 22:55:01', '2020-09-10 22:55:01', NULL),
(1316, 70, 'MAXIMINO GLEZ 040920.pdf', '12_1599778501.pdf', '2020-09-10 22:55:01', '2020-09-10 22:55:01', NULL),
(1317, 70, 'RAUL PEREZ 040920.pdf', '209_1599778501.pdf', '2020-09-10 22:55:01', '2020-09-10 22:55:01', NULL),
(1318, 70, 'RIGOBERTO CHACHA 040920.pdf', '245_1599778501.pdf', '2020-09-10 22:55:01', '2020-09-10 22:55:01', NULL),
(1319, 70, 'RUSBEL CABRERA 040920.pdf', '292_1599778501.pdf', '2020-09-10 22:55:01', '2020-09-10 22:55:01', NULL),
(1320, 70, 'URIEL SEBA 040920 (2).pdf', '146_1599778501.pdf', '2020-09-10 22:55:01', '2020-09-10 22:55:01', NULL),
(1321, 70, 'URIEL SEBA 040920.pdf', '91_1599778501.pdf', '2020-09-10 22:55:01', '2020-09-10 22:55:01', NULL),
(1322, 70, 'ALEJANDRO RETAMA 040920.pdf', '479_1599778612.pdf', '2020-09-10 22:56:52', '2020-09-10 22:56:52', NULL),
(1323, 70, 'ALEJANDRO RIOS 040920.pdf', '131_1599778612.pdf', '2020-09-10 22:56:52', '2020-09-10 22:56:52', NULL),
(1324, 70, 'BENITO HUESCA 040920.pdf', '433_1599778612.pdf', '2020-09-10 22:56:52', '2020-09-10 22:56:52', NULL),
(1325, 70, 'CELESTINO VILLANUEVA 040920.pdf', '19_1599778612.pdf', '2020-09-10 22:56:52', '2020-09-10 22:56:52', NULL),
(1326, 70, 'CONCEPCION JIMENEZ 040920.pdf', '206_1599778612.pdf', '2020-09-10 22:56:52', '2020-09-10 22:56:52', NULL),
(1327, 70, 'DANIEL I FDEZ 040920.pdf', '345_1599778612.pdf', '2020-09-10 22:56:52', '2020-09-10 22:56:52', NULL),
(1328, 70, 'DIANA L CEBALLOS 040920.pdf', '469_1599778612.pdf', '2020-09-10 22:56:52', '2020-09-10 22:56:52', NULL),
(1329, 70, 'ERICK G TORNADO 040920.pdf', '58_1599778612.pdf', '2020-09-10 22:56:52', '2020-09-10 22:56:52', NULL),
(1330, 70, 'FEDERICO HUESCA 040920.pdf', '216_1599778612.pdf', '2020-09-10 22:56:52', '2020-09-10 22:56:52', NULL),
(1331, 70, 'FERNANDO MAYO 040920.pdf', '90_1599778612.pdf', '2020-09-10 22:56:52', '2020-09-10 22:56:52', NULL),
(1332, 70, 'FRANCISCO BEJARANO 040920.pdf', '215_1599778612.pdf', '2020-09-10 22:56:52', '2020-09-10 22:56:52', NULL),
(1333, 70, 'FRANCISCO J RUIZ 040920.pdf', '378_1599778612.pdf', '2020-09-10 22:56:52', '2020-09-10 22:56:52', NULL),
(1334, 70, 'HIPOLITO A PULIDO 040920.pdf', '152_1599778612.pdf', '2020-09-10 22:56:52', '2020-09-10 22:56:52', NULL),
(1335, 70, 'HUGO A BOLAÑOS 040920.pdf', '256_1599778612.pdf', '2020-09-10 22:56:52', '2020-09-10 22:56:52', NULL),
(1336, 70, 'IGNACIO MURILLO 040920.pdf', '188_1599778612.pdf', '2020-09-10 22:56:52', '2020-09-10 22:56:52', NULL),
(1337, 70, 'IRAM G HUESCA 040920.pdf', '443_1599778612.pdf', '2020-09-10 22:56:52', '2020-09-10 22:56:52', NULL),
(1338, 70, 'ISMAEL RENERO 040920.pdf', '153_1599778612.pdf', '2020-09-10 22:56:52', '2020-09-10 22:56:52', NULL);
INSERT INTO `nomina_dispersion` (`id`, `nomina_id`, `name`, `file_url`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1339, 70, 'IVAN D NOLASCO 040920.pdf', '437_1599778612.pdf', '2020-09-10 22:56:52', '2020-09-10 22:56:52', NULL),
(1340, 70, 'JAIME R NOLASCO 040920.pdf', '78_1599778702.pdf', '2020-09-10 22:58:22', '2020-09-10 22:58:22', NULL),
(1341, 70, 'JAIME SOTO 040920.pdf', '202_1599778702.pdf', '2020-09-10 22:58:22', '2020-09-10 22:58:22', NULL),
(1342, 70, 'JAIRO I CRUZ 040920.pdf', '457_1599778702.pdf', '2020-09-10 22:58:22', '2020-09-10 22:58:22', NULL),
(1343, 70, 'JAVIER DEGOLLADO 040920.pdf', '138_1599778702.pdf', '2020-09-10 22:58:22', '2020-09-10 22:58:22', NULL),
(1344, 70, 'JESUS HUSECA 040920.pdf', '431_1599778703.pdf', '2020-09-10 22:58:23', '2020-09-10 22:58:23', NULL),
(1345, 70, 'JOAQUIN AQUINO 040920.pdf', '108_1599778703.pdf', '2020-09-10 22:58:23', '2020-09-10 22:58:23', NULL),
(1346, 70, 'JOEL EVIA 040920.pdf', '17_1599778703.pdf', '2020-09-10 22:58:23', '2020-09-10 22:58:23', NULL),
(1347, 70, 'JORGE L CARMONA 040920.pdf', '320_1599778703.pdf', '2020-09-10 22:58:23', '2020-09-10 22:58:23', NULL),
(1348, 70, 'JOSE M DIONISIO 040920.pdf', '297_1599778703.pdf', '2020-09-10 22:58:23', '2020-09-10 22:58:23', NULL),
(1349, 70, 'JULIO C CHACON 040920.pdf', '93_1599778703.pdf', '2020-09-10 22:58:23', '2020-09-10 22:58:23', NULL),
(1350, 70, 'JULIO C GUZMAN 040920.pdf', '240_1599778703.pdf', '2020-09-10 22:58:23', '2020-09-10 22:58:23', NULL),
(1351, 70, 'LAURO SALOMON 040920.pdf', '109_1599778703.pdf', '2020-09-10 22:58:23', '2020-09-10 22:58:23', NULL),
(1352, 70, 'LEONARDO GLEZ 040920.pdf', '45_1599778703.pdf', '2020-09-10 22:58:23', '2020-09-10 22:58:23', NULL),
(1353, 70, 'LEONEL LOPEZ 040920.pdf', '151_1599778703.pdf', '2020-09-10 22:58:23', '2020-09-10 22:58:23', NULL),
(1354, 70, 'LILIA I DIAZ 040920.pdf', '119_1599778703.pdf', '2020-09-10 22:58:23', '2020-09-10 22:58:23', NULL),
(1355, 70, 'LUIS GUZMAN 040920.pdf', '315_1599778703.pdf', '2020-09-10 22:58:23', '2020-09-10 22:58:23', NULL),
(1356, 70, 'MARCO A PAEZ 040920.pdf', '60_1599778778.pdf', '2020-09-10 22:59:38', '2020-09-10 22:59:38', NULL),
(1357, 70, 'MARTIN ANOTA 040920.pdf', '492_1599778778.pdf', '2020-09-10 22:59:38', '2020-09-10 22:59:38', NULL),
(1358, 70, 'MARTIN G CONTRERAS 040920.pdf', '347_1599778778.pdf', '2020-09-10 22:59:38', '2020-09-10 22:59:38', NULL),
(1359, 70, 'OBDULIA AVELINO 040920.pdf', '286_1599778778.pdf', '2020-09-10 22:59:38', '2020-09-10 22:59:38', NULL),
(1360, 70, 'PEDRO A FLORES 040920.pdf', '333_1599778778.pdf', '2020-09-10 22:59:38', '2020-09-10 22:59:38', NULL),
(1361, 70, 'RAFAEL RAMON 040920.pdf', '83_1599778778.pdf', '2020-09-10 22:59:38', '2020-09-10 22:59:38', NULL),
(1362, 70, 'RAYMUNDO LOPEZ 040920.pdf', '255_1599778778.pdf', '2020-09-10 22:59:38', '2020-09-10 22:59:38', NULL),
(1363, 70, 'RICARDO A SERENA 040920.pdf', '81_1599778778.pdf', '2020-09-10 22:59:38', '2020-09-10 22:59:38', NULL),
(1364, 70, 'ROBERTO FLORES 040920.pdf', '121_1599778778.pdf', '2020-09-10 22:59:38', '2020-09-10 22:59:38', NULL),
(1365, 70, 'ROCIO NAZARO 040920.pdf', '461_1599778778.pdf', '2020-09-10 22:59:38', '2020-09-10 22:59:38', NULL),
(1366, 70, 'SANTIAGO GLEZ 040920.pdf', '345_1599778778.pdf', '2020-09-10 22:59:38', '2020-09-10 22:59:38', NULL),
(1367, 70, 'SERGIO TORRES 040920.pdf', '156_1599778778.pdf', '2020-09-10 22:59:38', '2020-09-10 22:59:38', NULL),
(1368, 70, 'SILVANO BARBA 040920.pdf', '198_1599778778.pdf', '2020-09-10 22:59:38', '2020-09-10 22:59:38', NULL),
(1369, 70, 'VICTOR A AVELINO 040920.pdf', '130_1599778778.pdf', '2020-09-10 22:59:38', '2020-09-10 22:59:38', NULL),
(1370, 45, 'FRANCISCO BEJARANO 190620.pdf', '280_1599778936.pdf', '2020-09-10 23:02:16', '2020-09-10 23:02:16', NULL),
(1371, 45, 'FRANCISCO DOLORES 190620.pdf', '461_1599778936.pdf', '2020-09-10 23:02:16', '2020-09-10 23:02:16', NULL),
(1372, 45, 'FRANCISCO J RUIZ 190620.pdf', '267_1599778936.pdf', '2020-09-10 23:02:16', '2020-09-10 23:02:16', NULL),
(1373, 45, 'GUILLERMO S CELAYA 190620.pdf', '368_1599778936.pdf', '2020-09-10 23:02:16', '2020-09-10 23:02:16', NULL),
(1374, 45, 'HECTOR M GUZMAN 190620.pdf', '23_1599778937.pdf', '2020-09-10 23:02:17', '2020-09-10 23:02:17', NULL),
(1375, 45, 'HECTOR MOLINA 190620.pdf', '268_1599778937.pdf', '2020-09-10 23:02:17', '2020-09-10 23:02:17', NULL),
(1376, 45, 'HILARIO MOZO 190620.pdf', '296_1599778937.pdf', '2020-09-10 23:02:17', '2020-09-10 23:02:17', NULL),
(1377, 45, 'HIPOLITO A PULIDO 190620.pdf', '237_1599778937.pdf', '2020-09-10 23:02:17', '2020-09-10 23:02:17', NULL),
(1378, 45, 'HUGO A BOLAÑOS 190620.pdf', '338_1599778937.pdf', '2020-09-10 23:02:17', '2020-09-10 23:02:17', NULL),
(1379, 45, 'IGNACIO M TENORIO 190620.pdf', '105_1599778937.pdf', '2020-09-10 23:02:17', '2020-09-10 23:02:17', NULL),
(1380, 45, 'IGNACIO MURILLO 190620.pdf', '457_1599778937.pdf', '2020-09-10 23:02:17', '2020-09-10 23:02:17', NULL),
(1381, 45, 'IRAM G HUESCA 190620.pdf', '132_1599778937.pdf', '2020-09-10 23:02:17', '2020-09-10 23:02:17', NULL),
(1382, 45, 'IRVING MENDEZ 190620.pdf', '27_1599778937.pdf', '2020-09-10 23:02:17', '2020-09-10 23:02:17', NULL),
(1383, 45, 'ISMAEL RENERO 190620.pdf', '228_1599778937.pdf', '2020-09-10 23:02:17', '2020-09-10 23:02:17', NULL),
(1384, 45, 'JAIME R NOLASCO 190620.pdf', '322_1599778937.pdf', '2020-09-10 23:02:17', '2020-09-10 23:02:17', NULL),
(1385, 45, 'JAIME SOTO 190620.pdf', '326_1599778937.pdf', '2020-09-10 23:02:17', '2020-09-10 23:02:17', NULL),
(1386, 45, 'JAVIER DEGOLLADO 190620.pdf', '192_1599778937.pdf', '2020-09-10 23:02:17', '2020-09-10 23:02:17', NULL),
(1387, 45, 'JESUS A GUILLEN 190620.pdf', '143_1599778937.pdf', '2020-09-10 23:02:17', '2020-09-10 23:02:17', NULL),
(1388, 45, 'JESUS HUESCA 190620.pdf', '141_1599779049.pdf', '2020-09-10 23:04:09', '2020-09-10 23:04:09', NULL),
(1389, 45, 'JIMMY H MENDEZ 190620.pdf', '362_1599779049.pdf', '2020-09-10 23:04:09', '2020-09-10 23:04:09', NULL),
(1390, 45, 'JOAQUIN AQUINO 190620.pdf', '368_1599779049.pdf', '2020-09-10 23:04:09', '2020-09-10 23:04:09', NULL),
(1391, 45, 'JOEL EVIA 190620.pdf', '275_1599779049.pdf', '2020-09-10 23:04:09', '2020-09-10 23:04:09', NULL),
(1392, 45, 'JORGE A ANDRARDE 190620.pdf', '230_1599779049.pdf', '2020-09-10 23:04:09', '2020-09-10 23:04:09', NULL),
(1393, 45, 'JORGE A ESCRIBANO 190620.pdf', '23_1599779049.pdf', '2020-09-10 23:04:09', '2020-09-10 23:04:09', NULL),
(1394, 45, 'JORGE L CARMONA 190620.pdf', '193_1599779049.pdf', '2020-09-10 23:04:09', '2020-09-10 23:04:09', NULL),
(1395, 45, 'JORGE L DGUEZ 190620.pdf', '126_1599779049.pdf', '2020-09-10 23:04:09', '2020-09-10 23:04:09', NULL),
(1396, 45, 'JOSE L VERGARA 190620.pdf', '251_1599779049.pdf', '2020-09-10 23:04:09', '2020-09-10 23:04:09', NULL),
(1397, 45, 'JOSE M DIONICIO 190620.pdf', '55_1599779049.pdf', '2020-09-10 23:04:09', '2020-09-10 23:04:09', NULL),
(1398, 45, 'JUAN C VERGARA 190620.pdf', '301_1599779049.pdf', '2020-09-10 23:04:09', '2020-09-10 23:04:09', NULL),
(1399, 45, 'JUAN M DIAZ 190620.pdf', '203_1599779049.pdf', '2020-09-10 23:04:09', '2020-09-10 23:04:09', NULL),
(1400, 45, 'JULIO C CHACON 190620.pdf', '368_1599779049.pdf', '2020-09-10 23:04:09', '2020-09-10 23:04:09', NULL),
(1401, 45, 'JULIO C GUZMAN 190620.pdf', '64_1599779049.pdf', '2020-09-10 23:04:09', '2020-09-10 23:04:09', NULL),
(1402, 45, 'JULIO C SERDAN 190620.pdf', '122_1599779049.pdf', '2020-09-10 23:04:09', '2020-09-10 23:04:09', NULL),
(1403, 45, 'LAURO SALOMON 190620.pdf', '42_1599779049.pdf', '2020-09-10 23:04:09', '2020-09-10 23:04:09', NULL),
(1404, 45, 'LEONARDO A TORRES 190620.pdf', '289_1599779049.pdf', '2020-09-10 23:04:09', '2020-09-10 23:04:09', NULL),
(1405, 45, 'LEONARDO GLEZ 190620.pdf', '37_1599779049.pdf', '2020-09-10 23:04:09', '2020-09-10 23:04:09', NULL),
(1406, 45, 'LEONARDO LOPEZ 190620.pdf', '454_1599779049.pdf', '2020-09-10 23:04:09', '2020-09-10 23:04:09', NULL),
(1407, 45, 'LILIANA LURIA 190620.pdf', '17_1599779148.pdf', '2020-09-10 23:05:48', '2020-09-10 23:05:48', NULL),
(1408, 45, 'LUIS A ORTIZ 190620.pdf', '426_1599779148.pdf', '2020-09-10 23:05:48', '2020-09-10 23:05:48', NULL),
(1409, 45, 'LUIS E CARMONA 190620.pdf', '15_1599779148.pdf', '2020-09-10 23:05:48', '2020-09-10 23:05:48', NULL),
(1410, 45, 'LUIS GUZMAN 190620.pdf', '26_1599779148.pdf', '2020-09-10 23:05:48', '2020-09-10 23:05:48', NULL),
(1411, 45, 'MARCELINO ZAPO 190620.pdf', '51_1599779148.pdf', '2020-09-10 23:05:48', '2020-09-10 23:05:48', NULL),
(1412, 45, 'MARCO A PAEZ 190620.pdf', '180_1599779148.pdf', '2020-09-10 23:05:48', '2020-09-10 23:05:48', NULL),
(1413, 45, 'MARCOS LOPEZ 190620.pdf', '38_1599779148.pdf', '2020-09-10 23:05:48', '2020-09-10 23:05:48', NULL),
(1414, 45, 'MARIO TORRES 190620.pdf', '494_1599779148.pdf', '2020-09-10 23:05:48', '2020-09-10 23:05:48', NULL),
(1415, 45, 'MARTIN ANOTA 190620.pdf', '145_1599779148.pdf', '2020-09-10 23:05:48', '2020-09-10 23:05:48', NULL),
(1416, 45, 'MARTIN G CONTRERAS 190620.pdf', '279_1599779148.pdf', '2020-09-10 23:05:48', '2020-09-10 23:05:48', NULL),
(1417, 45, 'MAURICIO GOXCON 190620.pdf', '173_1599779148.pdf', '2020-09-10 23:05:48', '2020-09-10 23:05:48', NULL),
(1418, 45, 'MIGUEL A ARANO 190620.pdf', '209_1599779148.pdf', '2020-09-10 23:05:48', '2020-09-10 23:05:48', NULL),
(1419, 45, 'OBDULIA ABELINO 190620.pdf', '466_1599779148.pdf', '2020-09-10 23:05:48', '2020-09-10 23:05:48', NULL),
(1420, 45, 'RAFAEL RAMON 190620.pdf', '149_1599779148.pdf', '2020-09-10 23:05:48', '2020-09-10 23:05:48', NULL),
(1421, 45, 'RAUL PEREZ 190620.pdf', '463_1599779148.pdf', '2020-09-10 23:05:48', '2020-09-10 23:05:48', NULL),
(1422, 45, 'RAYMUNDO LOPEZ 190620.pdf', '115_1599779148.pdf', '2020-09-10 23:05:48', '2020-09-10 23:05:48', NULL),
(1423, 45, 'RIGOBERTO CHACHA 190620.pdf', '10_1599779216.pdf', '2020-09-10 23:06:56', '2020-09-10 23:06:56', NULL),
(1424, 45, 'ROBERTO FLORES 190620.pdf', '146_1599779216.pdf', '2020-09-10 23:06:56', '2020-09-10 23:06:56', NULL),
(1425, 45, 'ROCIO NAZARO 190620.pdf', '348_1599779216.pdf', '2020-09-10 23:06:56', '2020-09-10 23:06:56', NULL),
(1426, 45, 'ROGELIO HERRERA 190620.pdf', '395_1599779216.pdf', '2020-09-10 23:06:56', '2020-09-10 23:06:56', NULL),
(1427, 45, 'RUSBEL CABRERA 190620.pdf', '412_1599779216.pdf', '2020-09-10 23:06:56', '2020-09-10 23:06:56', NULL),
(1428, 45, 'SALVADOR RGUEZ 190620.pdf', '20_1599779216.pdf', '2020-09-10 23:06:56', '2020-09-10 23:06:56', NULL),
(1429, 45, 'SANTIAGO GLEZ 190620 (2).pdf', '58_1599779216.pdf', '2020-09-10 23:06:56', '2020-09-10 23:06:56', NULL),
(1430, 45, 'SANTIAGO GLEZ 190620.pdf', '320_1599779216.pdf', '2020-09-10 23:06:56', '2020-09-10 23:06:56', NULL),
(1431, 45, 'SERGIO TORRES 190620.pdf', '148_1599779216.pdf', '2020-09-10 23:06:56', '2020-09-10 23:06:56', NULL),
(1432, 45, 'SILVANO BARBA 190620.pdf', '373_1599779216.pdf', '2020-09-10 23:06:56', '2020-09-10 23:06:56', NULL),
(1433, 45, 'VICTOR A AVELINO 190620.pdf', '210_1599779216.pdf', '2020-09-10 23:06:56', '2020-09-10 23:06:56', NULL),
(1434, 47, 'JAVIER DEGOLLADO 260620.pdf', '230_1599779331.pdf', '2020-09-10 23:08:51', '2020-09-10 23:08:51', NULL),
(1435, 47, 'JESUS HUESCA 260620.pdf', '485_1599779331.pdf', '2020-09-10 23:08:51', '2020-09-10 23:08:51', NULL),
(1436, 47, 'JOAQUIN AQUINO 260620.pdf', '393_1599779331.pdf', '2020-09-10 23:08:51', '2020-09-10 23:08:51', NULL),
(1437, 47, 'JOEL EVIA 260620.pdf', '343_1599779331.pdf', '2020-09-10 23:08:51', '2020-09-10 23:08:51', NULL),
(1438, 47, 'JORGE L CARMONA 260620.pdf', '163_1599779331.pdf', '2020-09-10 23:08:51', '2020-09-10 23:08:51', NULL),
(1439, 47, 'JOSE M DIONICIO 260620.pdf', '464_1599779331.pdf', '2020-09-10 23:08:51', '2020-09-10 23:08:51', NULL),
(1440, 47, 'JULIO C CHACON 260620.pdf', '496_1599779331.pdf', '2020-09-10 23:08:51', '2020-09-10 23:08:51', NULL),
(1441, 47, 'JULIO C GUZMAN 260620.pdf', '410_1599779331.pdf', '2020-09-10 23:08:51', '2020-09-10 23:08:51', NULL),
(1442, 47, 'LAURO SALOMON 260620.pdf', '109_1599779331.pdf', '2020-09-10 23:08:51', '2020-09-10 23:08:51', NULL),
(1443, 47, 'LEONARDO GLEZ 260620.pdf', '205_1599779331.pdf', '2020-09-10 23:08:51', '2020-09-10 23:08:51', NULL),
(1444, 47, 'LUIS A ORTIZ 260620.pdf', '290_1599779331.pdf', '2020-09-10 23:08:51', '2020-09-10 23:08:51', NULL),
(1445, 47, 'LUIS GUZMAN 260620.pdf', '145_1599779331.pdf', '2020-09-10 23:08:51', '2020-09-10 23:08:51', NULL),
(1446, 47, 'MARCO A PAEZ 260620.pdf', '137_1599779331.pdf', '2020-09-10 23:08:51', '2020-09-10 23:08:51', NULL),
(1447, 47, 'MARTIN ANOTA 260620.pdf', '9_1599779331.pdf', '2020-09-10 23:08:51', '2020-09-10 23:08:51', NULL),
(1448, 47, 'MARTIN G CONTRERAS 260620.pdf', '429_1599779331.pdf', '2020-09-10 23:08:51', '2020-09-10 23:08:51', NULL),
(1449, 47, 'OBDULIA ABELINO 260620.pdf', '345_1599779331.pdf', '2020-09-10 23:08:51', '2020-09-10 23:08:51', NULL),
(1450, 47, 'RAFAEL RAMON 260620.pdf', '367_1599779345.pdf', '2020-09-10 23:09:05', '2020-09-10 23:09:05', NULL),
(1451, 47, 'RAYMUNDO LOPEZ 260620.pdf', '349_1599779386.pdf', '2020-09-10 23:09:46', '2020-09-10 23:09:46', NULL),
(1452, 47, 'ROBERTO FLORES 260620.pdf', '299_1599779386.pdf', '2020-09-10 23:09:46', '2020-09-10 23:09:46', NULL),
(1453, 47, 'ROCIO NAZARO 260620.pdf', '21_1599779386.pdf', '2020-09-10 23:09:46', '2020-09-10 23:09:46', NULL),
(1454, 47, 'ROGELIO HERRERA 260620.pdf', '194_1599779386.pdf', '2020-09-10 23:09:46', '2020-09-10 23:09:46', NULL),
(1455, 47, 'SANTIAGO GLEZ 260620.pdf', '286_1599779386.pdf', '2020-09-10 23:09:46', '2020-09-10 23:09:46', NULL),
(1456, 47, 'SERGIO TORRES 260620.pdf', '101_1599779386.pdf', '2020-09-10 23:09:46', '2020-09-10 23:09:46', NULL),
(1457, 47, 'SILVANO BARBA 260620.pdf', '397_1599779386.pdf', '2020-09-10 23:09:46', '2020-09-10 23:09:46', NULL),
(1458, 47, 'VICTOR A AVELINO 260620.pdf', '81_1599779386.pdf', '2020-09-10 23:09:46', '2020-09-10 23:09:46', NULL),
(1459, 47, 'ABERLAY LEON 300620.pdf', '45_1599779467.pdf', '2020-09-10 23:11:07', '2020-09-10 23:11:07', NULL),
(1460, 47, 'ALBERTO OBIL 300620.pdf', '122_1599779467.pdf', '2020-09-10 23:11:07', '2020-09-10 23:11:07', NULL),
(1461, 47, 'ALFREDO XOLO 300620.pdf', '184_1599779467.pdf', '2020-09-10 23:11:07', '2020-09-10 23:11:07', NULL),
(1462, 47, 'ALONSO LOPEZ 300620.pdf', '140_1599779467.pdf', '2020-09-10 23:11:07', '2020-09-10 23:11:07', NULL),
(1463, 47, 'AUGUSTO HDEZ 300620.pdf', '363_1599779467.pdf', '2020-09-10 23:11:07', '2020-09-10 23:11:07', NULL),
(1464, 47, 'AURELIO ZAPO 300620.pdf', '385_1599779467.pdf', '2020-09-10 23:11:07', '2020-09-10 23:11:07', NULL),
(1465, 47, 'DANIEL C HDEZ 300620.pdf', '16_1599779467.pdf', '2020-09-10 23:11:07', '2020-09-10 23:11:07', NULL),
(1466, 47, 'EZEQUIAS ANTELE 300620.pdf', '136_1599779467.pdf', '2020-09-10 23:11:07', '2020-09-10 23:11:07', NULL),
(1467, 47, 'FERNANDO ANTONIO 300620.pdf', '142_1599779467.pdf', '2020-09-10 23:11:07', '2020-09-10 23:11:07', NULL),
(1468, 47, 'FRANCISCO DOLORES 300620.pdf', '90_1599779467.pdf', '2020-09-10 23:11:07', '2020-09-10 23:11:07', NULL),
(1469, 47, 'GUILLERMO S CELAYA 300620.pdf', '432_1599779467.pdf', '2020-09-10 23:11:07', '2020-09-10 23:11:07', NULL),
(1470, 47, 'HECTOR MOLINA 300620.pdf', '348_1599779467.pdf', '2020-09-10 23:11:07', '2020-09-10 23:11:07', NULL),
(1471, 47, 'HILARIO MOZO 300620.pdf', '214_1599779467.pdf', '2020-09-10 23:11:07', '2020-09-10 23:11:07', NULL),
(1472, 47, 'IGNACIO M TENORIO 300620.pdf', '266_1599779467.pdf', '2020-09-10 23:11:07', '2020-09-10 23:11:07', NULL),
(1473, 47, 'IRVING MENDEZ 300620.pdf', '339_1599779467.pdf', '2020-09-10 23:11:07', '2020-09-10 23:11:07', NULL),
(1474, 47, 'JIMMY H MENDEZ 300620.pdf', '13_1599779467.pdf', '2020-09-10 23:11:07', '2020-09-10 23:11:07', NULL),
(1475, 47, 'JORGE A ESCRIBANO 300620.pdf', '206_1599779467.pdf', '2020-09-10 23:11:07', '2020-09-10 23:11:07', NULL),
(1476, 47, 'JORGE L DGUEZ 300620.pdf', '110_1599779467.pdf', '2020-09-10 23:11:07', '2020-09-10 23:11:07', NULL),
(1477, 47, 'JOSE L VERGARA 300620.pdf', '128_1599779542.pdf', '2020-09-10 23:12:22', '2020-09-10 23:12:22', NULL),
(1478, 47, 'JUAN C VERGARA 300620.pdf', '399_1599779542.pdf', '2020-09-10 23:12:22', '2020-09-10 23:12:22', NULL),
(1479, 47, 'JUAN M DIAZ 300620.pdf', '399_1599779542.pdf', '2020-09-10 23:12:22', '2020-09-10 23:12:22', NULL),
(1480, 47, 'JULIO C SERDAN 300620.pdf', '31_1599779542.pdf', '2020-09-10 23:12:22', '2020-09-10 23:12:22', NULL),
(1481, 47, 'LEONARDO A TORRES 300620.pdf', '164_1599779542.pdf', '2020-09-10 23:12:22', '2020-09-10 23:12:22', NULL),
(1482, 47, 'LEONARDO LOPEZ 300620.pdf', '500_1599779542.pdf', '2020-09-10 23:12:22', '2020-09-10 23:12:22', NULL),
(1483, 47, 'LILIANA LURIA 300620.pdf', '172_1599779542.pdf', '2020-09-10 23:12:22', '2020-09-10 23:12:22', NULL),
(1484, 47, 'LUIS E CARMONA 300620.pdf', '483_1599779542.pdf', '2020-09-10 23:12:22', '2020-09-10 23:12:22', NULL),
(1485, 47, 'MARCELINO ZAPO 300620.pdf', '168_1599779542.pdf', '2020-09-10 23:12:22', '2020-09-10 23:12:22', NULL),
(1486, 47, 'MARCOS LOPEZ 300620.pdf', '341_1599779542.pdf', '2020-09-10 23:12:22', '2020-09-10 23:12:22', NULL),
(1487, 47, 'MARIO TORRES 300620.pdf', '481_1599779542.pdf', '2020-09-10 23:12:22', '2020-09-10 23:12:22', NULL),
(1488, 47, 'MAURICIO GOXCON 300620.pdf', '396_1599779542.pdf', '2020-09-10 23:12:22', '2020-09-10 23:12:22', NULL),
(1489, 47, 'MIGUEL A ARANO 300620.pdf', '225_1599779542.pdf', '2020-09-10 23:12:22', '2020-09-10 23:12:22', NULL),
(1490, 47, 'RAUL PEREZ 300620.pdf', '440_1599779542.pdf', '2020-09-10 23:12:22', '2020-09-10 23:12:22', NULL),
(1491, 47, 'RIGOBERTO CHACHA 300620.pdf', '195_1599779542.pdf', '2020-09-10 23:12:22', '2020-09-10 23:12:22', NULL),
(1492, 47, 'RUSBEL CABRERA 300620.pdf', '454_1599779542.pdf', '2020-09-10 23:12:22', '2020-09-10 23:12:22', NULL),
(1493, 47, 'SALVADOR RGUEZ 300620.pdf', '167_1599779542.pdf', '2020-09-10 23:12:22', '2020-09-10 23:12:22', NULL),
(1494, 49, 'FRANCISCO J RUIZ 030720.pdf', '100_1599779729.pdf', '2020-09-10 23:15:29', '2020-09-10 23:15:29', NULL),
(1495, 49, 'GUILLERMO S CELAYA 030720.pdf', '72_1599779729.pdf', '2020-09-10 23:15:29', '2020-09-10 23:15:29', NULL),
(1496, 49, 'HECTOR MOLINA 030720.pdf', '189_1599779729.pdf', '2020-09-10 23:15:29', '2020-09-10 23:15:29', NULL),
(1497, 49, 'HILARIO MOZO 030720.pdf', '489_1599779729.pdf', '2020-09-10 23:15:29', '2020-09-10 23:15:29', NULL),
(1498, 49, 'HIPOLITO A PULIDO 030720.pdf', '85_1599779729.pdf', '2020-09-10 23:15:29', '2020-09-10 23:15:29', NULL),
(1499, 49, 'HUGO A BOLAÑOS 030720.pdf', '423_1599779729.pdf', '2020-09-10 23:15:29', '2020-09-10 23:15:29', NULL),
(1500, 49, 'IGNACIO MURILLO 030720.pdf', '299_1599779729.pdf', '2020-09-10 23:15:29', '2020-09-10 23:15:29', NULL),
(1501, 49, 'IRAM G HUESCA 030720.pdf', '36_1599779729.pdf', '2020-09-10 23:15:29', '2020-09-10 23:15:29', NULL),
(1502, 49, 'IRVING MENDEZ 030720.pdf', '123_1599779729.pdf', '2020-09-10 23:15:29', '2020-09-10 23:15:29', NULL),
(1503, 49, 'ISMAEL RENERO 030720.pdf', '242_1599779729.pdf', '2020-09-10 23:15:29', '2020-09-10 23:15:29', NULL),
(1504, 49, 'JAIME R NOLASCO 030720.pdf', '8_1599779729.pdf', '2020-09-10 23:15:29', '2020-09-10 23:15:29', NULL),
(1505, 49, 'JAVIER DEGOLLADO 030720.pdf', '365_1599779729.pdf', '2020-09-10 23:15:29', '2020-09-10 23:15:29', NULL),
(1506, 49, 'JAIME SOTO 030720.pdf', '83_1599779729.pdf', '2020-09-10 23:15:29', '2020-09-10 23:15:29', NULL),
(1507, 49, 'JESUS HUESCA 030720.pdf', '65_1599779729.pdf', '2020-09-10 23:15:29', '2020-09-10 23:15:29', NULL),
(1508, 49, 'JIMMY H MENDEZ 030720.pdf', '7_1599779729.pdf', '2020-09-10 23:15:29', '2020-09-10 23:15:29', NULL),
(1509, 49, 'JOAQUIN AQUINO 030720.pdf', '25_1599779729.pdf', '2020-09-10 23:15:29', '2020-09-10 23:15:29', NULL),
(1510, 49, 'JOEL EVIA 030720.pdf', '94_1599779729.pdf', '2020-09-10 23:15:29', '2020-09-10 23:15:29', NULL),
(1511, 49, 'JORGE A ESCRIBANO 030720.pdf', '367_1599779729.pdf', '2020-09-10 23:15:29', '2020-09-10 23:15:29', NULL),
(1512, 49, 'JORGE L CARMONA 030720.pdf', '91_1599779835.pdf', '2020-09-10 23:17:15', '2020-09-10 23:17:15', NULL),
(1513, 49, 'JORGE L DGUEZ 030720.pdf', '481_1599779835.pdf', '2020-09-10 23:17:15', '2020-09-10 23:17:15', NULL),
(1514, 49, 'JOSE L VERGARA 030720.pdf', '373_1599779835.pdf', '2020-09-10 23:17:15', '2020-09-10 23:17:15', NULL),
(1515, 49, 'JOSE M DIONICIO 030720.pdf', '205_1599779835.pdf', '2020-09-10 23:17:15', '2020-09-10 23:17:15', NULL),
(1516, 49, 'JUAN C VERGARA 030720.pdf', '217_1599779835.pdf', '2020-09-10 23:17:15', '2020-09-10 23:17:15', NULL),
(1517, 49, 'JUAN M DIAZ 030720.pdf', '381_1599779835.pdf', '2020-09-10 23:17:15', '2020-09-10 23:17:15', NULL),
(1518, 49, 'JULIO C CHACON 030720.pdf', '223_1599779835.pdf', '2020-09-10 23:17:15', '2020-09-10 23:17:15', NULL),
(1519, 49, 'JULIO C GUZMAN 030720.pdf', '273_1599779835.pdf', '2020-09-10 23:17:15', '2020-09-10 23:17:15', NULL),
(1520, 49, 'JULIO C SERDAN 030720.pdf', '226_1599779835.pdf', '2020-09-10 23:17:15', '2020-09-10 23:17:15', NULL),
(1521, 49, 'LAURO SALOMON 030720.pdf', '277_1599779835.pdf', '2020-09-10 23:17:15', '2020-09-10 23:17:15', NULL),
(1522, 49, 'LEONARDO A TORRES 030720.pdf', '232_1599779835.pdf', '2020-09-10 23:17:15', '2020-09-10 23:17:15', NULL),
(1523, 49, 'LEONARDO GLEZ 030720.pdf', '161_1599779835.pdf', '2020-09-10 23:17:15', '2020-09-10 23:17:15', NULL),
(1524, 49, 'LEONARDO LOPEZ 030720.pdf', '484_1599779835.pdf', '2020-09-10 23:17:15', '2020-09-10 23:17:15', NULL),
(1525, 49, 'LEONEL LOPEZ 030720.pdf', '288_1599779835.pdf', '2020-09-10 23:17:15', '2020-09-10 23:17:15', NULL),
(1526, 49, 'LILIA I DIAZ 030720.pdf', '374_1599779835.pdf', '2020-09-10 23:17:15', '2020-09-10 23:17:15', NULL),
(1527, 49, 'LILIANA LURIA 030720.pdf', '341_1599779835.pdf', '2020-09-10 23:17:15', '2020-09-10 23:17:15', NULL),
(1528, 49, 'LUIS E CARMONA 030720.pdf', '396_1599779835.pdf', '2020-09-10 23:17:15', '2020-09-10 23:17:15', NULL),
(1529, 49, 'LUIS GUZMAN 030720.pdf', '465_1599779835.pdf', '2020-09-10 23:17:15', '2020-09-10 23:17:15', NULL),
(1530, 49, 'MARCELINO ZAPO 030720.pdf', '328_1599779969.pdf', '2020-09-10 23:19:29', '2020-09-10 23:19:29', NULL),
(1531, 49, 'MARCO A PAEZ 030720.pdf', '27_1599779969.pdf', '2020-09-10 23:19:29', '2020-09-10 23:19:29', NULL),
(1532, 49, 'MARCOS LOPEZ 030720.pdf', '453_1599779969.pdf', '2020-09-10 23:19:29', '2020-09-10 23:19:29', NULL),
(1533, 49, 'MARIO TORRES 030720.pdf', '292_1599779969.pdf', '2020-09-10 23:19:29', '2020-09-10 23:19:29', NULL),
(1534, 49, 'MARTIN ANOTA 030720.pdf', '425_1599779969.pdf', '2020-09-10 23:19:29', '2020-09-10 23:19:29', NULL),
(1535, 49, 'MARTIN G CONTRERAS 030720.pdf', '365_1599779969.pdf', '2020-09-10 23:19:29', '2020-09-10 23:19:29', NULL),
(1536, 49, 'MAURICIO GOXCON 030720.pdf', '401_1599779969.pdf', '2020-09-10 23:19:29', '2020-09-10 23:19:29', NULL),
(1537, 49, 'MIGUEL A ARANO 030720.pdf', '212_1599779969.pdf', '2020-09-10 23:19:29', '2020-09-10 23:19:29', NULL),
(1538, 49, 'OBDULIA ABELINO 030720.pdf', '80_1599779969.pdf', '2020-09-10 23:19:29', '2020-09-10 23:19:29', NULL),
(1539, 49, 'RAFAEL RAMON 030720.pdf', '89_1599779969.pdf', '2020-09-10 23:19:29', '2020-09-10 23:19:29', NULL),
(1540, 49, 'RAUL PEREZ 030720.pdf', '145_1599779969.pdf', '2020-09-10 23:19:29', '2020-09-10 23:19:29', NULL),
(1541, 49, 'RAYMUNDO LOPEZ 030720.pdf', '152_1599779969.pdf', '2020-09-10 23:19:29', '2020-09-10 23:19:29', NULL),
(1542, 49, 'RIGOBERTO CHACHA 030720.pdf', '202_1599779969.pdf', '2020-09-10 23:19:29', '2020-09-10 23:19:29', NULL),
(1543, 49, 'ROBERTO FLORES 030720.pdf', '378_1599779969.pdf', '2020-09-10 23:19:29', '2020-09-10 23:19:29', NULL),
(1544, 49, 'ROCIO NAZARO 030720.pdf', '157_1599779969.pdf', '2020-09-10 23:19:29', '2020-09-10 23:19:29', NULL),
(1545, 49, 'ROGELIO HERRERA 030720.pdf', '236_1599779969.pdf', '2020-09-10 23:19:29', '2020-09-10 23:19:29', NULL),
(1546, 49, 'RUSBEL CABRERA 030720.pdf', '432_1599779970.pdf', '2020-09-10 23:19:30', '2020-09-10 23:19:30', NULL),
(1547, 49, 'SALVADOR RGUEZ 030720.pdf', '443_1599779970.pdf', '2020-09-10 23:19:30', '2020-09-10 23:19:30', NULL),
(1548, 49, 'SANTIAGO GLEZ 030720.pdf', '147_1599779970.pdf', '2020-09-10 23:19:30', '2020-09-10 23:19:30', NULL),
(1549, 49, 'SERGIO TORRES 030720.pdf', '390_1599779970.pdf', '2020-09-10 23:19:30', '2020-09-10 23:19:30', NULL),
(1550, 49, 'SILVANO BARBA 030720 (2).pdf', '430_1599779994.pdf', '2020-09-10 23:19:54', '2020-09-10 23:19:54', NULL),
(1551, 49, 'SILVANO BARBA 030720.pdf', '176_1599779994.pdf', '2020-09-10 23:19:54', '2020-09-10 23:19:54', NULL),
(1552, 49, 'VICTOR A AVELINO 030720.pdf', '143_1599779994.pdf', '2020-09-10 23:19:54', '2020-09-10 23:19:54', NULL),
(1553, 50, 'GUILLERMO S CELAYA 140720.pdf', '184_1599780084.pdf', '2020-09-10 23:21:24', '2020-09-10 23:21:24', NULL),
(1554, 50, 'HECTOR MOLINA 140720.pdf', '248_1599780084.pdf', '2020-09-10 23:21:24', '2020-09-10 23:21:24', NULL),
(1555, 50, 'HILARIO MOZO 140720.pdf', '351_1599780084.pdf', '2020-09-10 23:21:24', '2020-09-10 23:21:24', NULL),
(1556, 50, 'HIPOLITO A PULIDO 140720.pdf', '395_1599780084.pdf', '2020-09-10 23:21:24', '2020-09-10 23:21:24', NULL),
(1557, 50, 'HUGO A BOLAÑOS 140720.pdf', '381_1599780084.pdf', '2020-09-10 23:21:24', '2020-09-10 23:21:24', NULL),
(1558, 50, 'IGNACIO M TENORIO 140720.pdf', '4_1599780084.pdf', '2020-09-10 23:21:24', '2020-09-10 23:21:24', NULL),
(1559, 50, 'IGNACIO MURILLO 140720.pdf', '263_1599780084.pdf', '2020-09-10 23:21:24', '2020-09-10 23:21:24', NULL),
(1560, 50, 'IRAM G HUESCA 140720.pdf', '15_1599780084.pdf', '2020-09-10 23:21:24', '2020-09-10 23:21:24', NULL),
(1561, 50, 'IRVING MENDEZ 140720.pdf', '184_1599780084.pdf', '2020-09-10 23:21:24', '2020-09-10 23:21:24', NULL),
(1562, 50, 'ISMAEL RENERO 140720.pdf', '191_1599780084.pdf', '2020-09-10 23:21:24', '2020-09-10 23:21:24', NULL),
(1563, 50, 'JAIME R NOLASCO 140720.pdf', '120_1599780084.pdf', '2020-09-10 23:21:24', '2020-09-10 23:21:24', NULL),
(1564, 50, 'JAIME SOTO 140720.pdf', '125_1599780084.pdf', '2020-09-10 23:21:24', '2020-09-10 23:21:24', NULL),
(1565, 50, 'JAVIER DEGOLLADO 140720.pdf', '44_1599780084.pdf', '2020-09-10 23:21:24', '2020-09-10 23:21:24', NULL),
(1566, 50, 'JESUS HUESCA 140720.pdf', '443_1599780084.pdf', '2020-09-10 23:21:24', '2020-09-10 23:21:24', NULL),
(1567, 50, 'JIMMY H MENDEZ 140720.pdf', '390_1599780084.pdf', '2020-09-10 23:21:24', '2020-09-10 23:21:24', NULL),
(1568, 50, 'JOAQUIN AQUINO 140720.pdf', '298_1599780084.pdf', '2020-09-10 23:21:24', '2020-09-10 23:21:24', NULL),
(1569, 50, 'JOEL EVIA 140720.pdf', '73_1599780084.pdf', '2020-09-10 23:21:24', '2020-09-10 23:21:24', NULL),
(1570, 50, 'JORGE A ESCRIBANO 140720.pdf', '405_1599780084.pdf', '2020-09-10 23:21:24', '2020-09-10 23:21:24', NULL),
(1571, 50, 'JORGE L CARMONA 140720.pdf', '145_1599780084.pdf', '2020-09-10 23:21:24', '2020-09-10 23:21:24', NULL),
(1572, 50, 'JORGE L DGUEZ 140720.pdf', '266_1599780205.pdf', '2020-09-10 23:23:25', '2020-09-10 23:23:25', NULL),
(1573, 50, 'JOSE L VERGARA 140720.pdf', '29_1599780205.pdf', '2020-09-10 23:23:25', '2020-09-10 23:23:25', NULL),
(1574, 50, 'JOSE M DIONISIO 140720.pdf', '146_1599780205.pdf', '2020-09-10 23:23:25', '2020-09-10 23:23:25', NULL),
(1575, 50, 'JUAN C VERGARA 140720.pdf', '14_1599780205.pdf', '2020-09-10 23:23:25', '2020-09-10 23:23:25', NULL),
(1576, 50, 'JUAN M DIAZ 140720.pdf', '274_1599780205.pdf', '2020-09-10 23:23:25', '2020-09-10 23:23:25', NULL),
(1577, 50, 'JULIO C CHACON 140720.pdf', '51_1599780205.pdf', '2020-09-10 23:23:25', '2020-09-10 23:23:25', NULL),
(1578, 50, 'JULIO C GUZMAN 140720.pdf', '435_1599780205.pdf', '2020-09-10 23:23:25', '2020-09-10 23:23:25', NULL),
(1579, 50, 'JULIO C SERDAN 140720.pdf', '88_1599780206.pdf', '2020-09-10 23:23:26', '2020-09-10 23:23:26', NULL),
(1580, 50, 'LAURO SALOMON 140720.pdf', '417_1599780206.pdf', '2020-09-10 23:23:26', '2020-09-10 23:23:26', NULL),
(1581, 50, 'LEONARDO A TORRES 140720.pdf', '351_1599780206.pdf', '2020-09-10 23:23:26', '2020-09-10 23:23:26', NULL),
(1582, 50, 'LEONARDO GLEZ 140720.pdf', '241_1599780206.pdf', '2020-09-10 23:23:26', '2020-09-10 23:23:26', NULL),
(1583, 50, 'LEONARDO LOPEZ 140720.pdf', '417_1599780206.pdf', '2020-09-10 23:23:26', '2020-09-10 23:23:26', NULL),
(1584, 50, 'LEONEL LOPEZ 140720.pdf', '437_1599780206.pdf', '2020-09-10 23:23:26', '2020-09-10 23:23:26', NULL),
(1585, 50, 'LILIA I DIAZ 140720.pdf', '32_1599780206.pdf', '2020-09-10 23:23:26', '2020-09-10 23:23:26', NULL),
(1586, 50, 'LILIANA LURIA 140720.pdf', '186_1599780206.pdf', '2020-09-10 23:23:26', '2020-09-10 23:23:26', NULL),
(1587, 50, 'LUIS E CARMONA 140720.pdf', '16_1599780206.pdf', '2020-09-10 23:23:26', '2020-09-10 23:23:26', NULL),
(1588, 50, 'LUIS GUZMAN 140720.pdf', '328_1599780206.pdf', '2020-09-10 23:23:26', '2020-09-10 23:23:26', NULL),
(1589, 50, 'MARCELINO ZAPO 140720.pdf', '249_1599780206.pdf', '2020-09-10 23:23:26', '2020-09-10 23:23:26', NULL),
(1590, 50, 'MARCO A PAEZ 140720.pdf', '147_1599780206.pdf', '2020-09-10 23:23:26', '2020-09-10 23:23:26', NULL),
(1591, 50, 'MARCOS LOPEZ 140720.pdf', '208_1599780206.pdf', '2020-09-10 23:23:26', '2020-09-10 23:23:26', NULL),
(1592, 50, 'MARIO TORRES 140720.pdf', '373_1599780328.pdf', '2020-09-10 23:25:28', '2020-09-10 23:25:28', NULL),
(1593, 50, 'MARTIN ANOTA 140720.pdf', '15_1599780328.pdf', '2020-09-10 23:25:28', '2020-09-10 23:25:28', NULL),
(1594, 50, 'MARTIN G CONTRERAS 140720.pdf', '99_1599780328.pdf', '2020-09-10 23:25:28', '2020-09-10 23:25:28', NULL),
(1595, 50, 'MAURICIO GOXCON 140720.pdf', '9_1599780328.pdf', '2020-09-10 23:25:28', '2020-09-10 23:25:28', NULL),
(1596, 50, 'MAXIMINO GLEZ 140720.pdf', '35_1599780328.pdf', '2020-09-10 23:25:28', '2020-09-10 23:25:28', NULL),
(1597, 50, 'MIGUEL A ARANO 140720.pdf', '433_1599780328.pdf', '2020-09-10 23:25:28', '2020-09-10 23:25:28', NULL),
(1598, 50, 'OBDULIA ABELINO 140720.pdf', '381_1599780328.pdf', '2020-09-10 23:25:28', '2020-09-10 23:25:28', NULL),
(1599, 50, 'RAFAEL RAMON 140720.pdf', '77_1599780328.pdf', '2020-09-10 23:25:28', '2020-09-10 23:25:28', NULL),
(1600, 50, 'RAUL PEREZ 140720.pdf', '230_1599780328.pdf', '2020-09-10 23:25:28', '2020-09-10 23:25:28', NULL),
(1601, 50, 'RAYMUNDO LOPEZ 140720.pdf', '423_1599780328.pdf', '2020-09-10 23:25:28', '2020-09-10 23:25:28', NULL),
(1602, 50, 'ROBERTO FLORES 140720.pdf', '377_1599780328.pdf', '2020-09-10 23:25:28', '2020-09-10 23:25:28', NULL),
(1603, 50, 'ROCIO NAZARO 140720.pdf', '460_1599780328.pdf', '2020-09-10 23:25:28', '2020-09-10 23:25:28', NULL),
(1604, 50, 'ROGELIO HERRERA 140720.pdf', '416_1599780328.pdf', '2020-09-10 23:25:28', '2020-09-10 23:25:28', NULL),
(1605, 50, 'RUSBEL CABRERA 140720.pdf', '136_1599780328.pdf', '2020-09-10 23:25:28', '2020-09-10 23:25:28', NULL),
(1606, 50, 'SALVADOR RGUEZ 140720.pdf', '253_1599780328.pdf', '2020-09-10 23:25:28', '2020-09-10 23:25:28', NULL),
(1607, 50, 'SANTIAGO GLEZ 140720.pdf', '81_1599780328.pdf', '2020-09-10 23:25:28', '2020-09-10 23:25:28', NULL),
(1608, 50, 'SERGIO TORRES 140720.pdf', '327_1599780328.pdf', '2020-09-10 23:25:28', '2020-09-10 23:25:28', NULL),
(1609, 50, 'SILVANO BARBA 140720 (2).pdf', '473_1599780328.pdf', '2020-09-10 23:25:28', '2020-09-10 23:25:28', NULL),
(1610, 50, 'SILVANO BARBA 140720.pdf', '92_1599780328.pdf', '2020-09-10 23:25:28', '2020-09-10 23:25:28', NULL),
(1611, 50, 'VICTOR A AVELINO 140720.pdf', '401_1599780328.pdf', '2020-09-10 23:25:28', '2020-09-10 23:25:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('00e50542f999177baf2f06bf8a16754ec9893a71dba2881704ea651c2bd37f4aca102eb086d264e7', 13, 3, 'Personal Access Token', '[]', 0, '2019-12-20 19:55:29', '2019-12-20 19:55:29', '2020-12-20 12:55:29'),
('0194b6807d430ee061e5f95608ee524db9e707f80b299941c658281ae08bcf00ff5c2059102db93e', 1, 3, 'Personal Access Token', '[]', 0, '2020-02-10 20:04:06', '2020-02-10 20:04:06', '2021-02-10 13:04:06'),
('058cd09fe60e4fc2400a12fd67b6765e99f8c5c18385cf85fe84ccb375a9913a83aa3e313301d0c1', 16, 3, 'Personal Access Token', '[]', 0, '2020-07-27 17:57:08', '2020-07-27 17:57:08', '2021-07-27 11:57:08'),
('06f8442d6a1fb9ae4e2c84251f59d006c5fafc22f5fe74e0a3c404d60f8ce95da492c3f41bf902b9', 16, 3, 'Personal Access Token', '[]', 0, '2020-02-12 18:07:36', '2020-02-12 18:07:36', '2021-02-12 11:07:36'),
('08d02b6bc28ee0b64b9af463f5d1255a006619d58ce4286dbd75b727406a7dcfc143df2b2f34eb35', 16, 3, 'Personal Access Token', '[]', 0, '2020-02-08 20:33:42', '2020-02-08 20:33:42', '2021-02-08 13:33:42'),
('097ac1a990c76334c206ddd2402b6a0d07220ee40276734a801d7afca99ffc5a2a6fc8eccc45489e', 13, 3, 'Personal Access Token', '[]', 0, '2019-12-19 04:57:21', '2019-12-19 04:57:21', '2020-12-18 21:57:21'),
('0ae1336e14c8491f8f624b933103b7af7ac5aeab3abb954c604404455a21447f7405128331b6630c', 16, 3, 'Personal Access Token', '[]', 0, '2020-06-22 23:30:30', '2020-06-22 23:30:30', '2021-06-22 17:30:30'),
('0e4eb93a0f72c4c6fcb676f4ef5bff262f32c553f056e8af153672045cdd34448ddd74761c2ab3cb', 1, 3, 'Personal Access Token', '[]', 0, '2020-01-22 16:33:48', '2020-01-22 16:33:48', '2021-01-22 09:33:48'),
('218d80821706ab5cdc2e9fefdcfb9e9017fe186ce35ca06bdbc3526d790a2b966b243b306ea7044e', 16, 3, 'Personal Access Token', '[]', 0, '2020-02-10 18:05:04', '2020-02-10 18:05:04', '2021-02-10 11:05:04'),
('2462a959a87caa13cad7b3b489cadd3ab178f855798c44203a0324ecfa48bbe1a0832336f8142341', 1, 3, 'Personal Access Token', '[]', 0, '2019-12-26 17:18:45', '2019-12-26 17:18:45', '2020-12-26 10:18:45'),
('269d52cbe0d30584e412d335d475de66444c47483abe831df29f0ac5411e7ce87d3e8bdfd680f11f', 13, 3, 'Personal Access Token', '[]', 0, '2020-02-04 17:50:01', '2020-02-04 17:50:01', '2021-02-04 10:50:01'),
('294537b22e16a128bf679a1f417ecfff5d2e00e3c9e7e308d0fe0c7a3563731ee6ab9476cca3a2f1', 1, 3, 'Personal Access Token', '[]', 0, '2019-12-19 05:54:05', '2019-12-19 05:54:05', '2020-12-18 22:54:05'),
('2fa9af95288333413b2d82c07eb8b0afbeca35c506b200cc6045b79bea07c26a3c8378c531b2a3be', 1, 3, 'Personal Access Token', '[]', 0, '2020-02-05 00:11:57', '2020-02-05 00:11:57', '2021-02-04 17:11:57'),
('332885e3b3808a8fa56c00c5f81bf5f2d334be1f648b7771cba79ddb5b3c370d3d5dc9b7c9abbb10', 16, 3, 'Personal Access Token', '[]', 0, '2020-06-10 18:48:04', '2020-06-10 18:48:04', '2021-06-10 12:48:04'),
('3bab767acee5d637f2019de2b9f20dac7030c471572b474b9f643d9cf663a182dd6fb63313e47062', 16, 3, 'Personal Access Token', '[]', 0, '2020-07-06 22:26:27', '2020-07-06 22:26:27', '2021-07-06 16:26:27'),
('3c19968a2a71b3c9526b69bd3e64af2f088a5506d33f61ea7a43e592bc9a0a2be40d3d08eb5a9a51', 16, 3, 'Personal Access Token', '[]', 0, '2020-09-10 23:50:55', '2020-09-10 23:50:55', '2021-09-10 17:50:55'),
('3dbf9bd3673be22514befedb260d75fa68eb5e51e238dccd873d70978903e746df87343397a3f0a9', 13, 3, 'Personal Access Token', '[]', 0, '2020-01-21 23:35:08', '2020-01-21 23:35:08', '2021-01-21 16:35:08'),
('3dcacf33b7efbdf0285e06244115da940c0dfd3665f6de59f15baafd9eb8679dc8a51725aa03f41d', 16, 3, 'Personal Access Token', '[]', 0, '2020-04-01 22:16:25', '2020-04-01 22:16:25', '2021-04-01 16:16:25'),
('3eb82159e2beb032386ceec0d8d912938e4ad9528435fe4db80e00607a122fac059421634c4155d5', 16, 3, 'Personal Access Token', '[]', 0, '2020-04-06 23:03:46', '2020-04-06 23:03:46', '2021-04-06 17:03:46'),
('3f8052d24a3c234755ee112f0de411db87003b8a2e3793105e7b640a603fe1a96179dfdbb1899eb6', 13, 3, 'Personal Access Token', '[]', 0, '2019-12-21 06:34:43', '2019-12-21 06:34:43', '2020-12-20 23:34:43'),
('43336b223ef93835f7b444b7cdd557f0048b88a7f0cfcb87ebb2e78e3f7bf915750605a995453529', 16, 3, 'Personal Access Token', '[]', 0, '2020-04-14 22:48:40', '2020-04-14 22:48:40', '2021-04-14 16:48:40'),
('486e887cae342e16547b3065ee2b5f07c3a635365eddcecc361f7589ae9fdbcf31e526b8e742642e', 1, 3, 'Personal Access Token', '[]', 0, '2019-12-19 07:09:54', '2019-12-19 07:09:54', '2020-12-19 00:09:54'),
('4e4af9013d27e1b4fd7603e79cb929e3a089046f95826cc5992b9e0aff74acaa91382d0924cc4fad', 13, 3, 'Personal Access Token', '[]', 0, '2019-12-26 18:08:31', '2019-12-26 18:08:31', '2020-12-26 11:08:31'),
('54b1e249bb10b1c3b06e00e46ec17940f99599bef876b164f909770c9a765b3019df659caf0dbee4', 16, 3, 'Personal Access Token', '[]', 0, '2020-03-09 23:06:15', '2020-03-09 23:06:15', '2021-03-09 17:06:15'),
('57dd256896d51d02e75dec645b5fa93910052f0b922ee712835f1318ff124c668a416fee04a355a4', 16, 3, 'Personal Access Token', '[]', 0, '2020-08-10 16:27:02', '2020-08-10 16:27:02', '2021-08-10 10:27:02'),
('580c451c3f14c3405dc8ab455e4da56e5fe286aa38a142ed1ccbb03897f850b2334cca0fa0f7dc7b', 13, 3, 'Personal Access Token', '[]', 0, '2019-12-27 08:06:59', '2019-12-27 08:06:59', '2020-12-27 01:06:59'),
('589b422f6c13a3eba601a8b4ee4394e8b246a9a94e5ab70e871f2047d9c14f6f4f2382bbf2da7c3e', 13, 3, 'Personal Access Token', '[]', 0, '2020-09-12 19:33:43', '2020-09-12 19:33:43', '2021-09-12 13:33:43'),
('5cbe8005385a87d6b63f82cc36d74f4270a0a12441f8c3cbf7ad531582fe6080d238b49d45404e11', 16, 3, 'Personal Access Token', '[]', 0, '2020-03-28 18:34:36', '2020-03-28 18:34:36', '2021-03-28 12:34:36'),
('63e9c6b79d895dd7ea2c4462625a96f72be32ce207cb30d284b230ebc76379d5092c86c3a5214f37', 16, 3, 'Personal Access Token', '[]', 0, '2020-02-18 00:02:14', '2020-02-18 00:02:14', '2021-02-17 17:02:14'),
('676cffda756957aff97fc4ed75d17974af6e11a42d3f114d807a9908fa9b8c6e58ecf3d6f1bb7c09', 13, 3, 'Personal Access Token', '[]', 0, '2020-02-07 05:49:50', '2020-02-07 05:49:50', '2021-02-06 22:49:50'),
('6b2a3534ffa0e0d445edefa87a2a9f4ba1b11c232f1e7dc45dd38c90ed59cd16518b82888ce25dfd', 13, 3, 'Personal Access Token', '[]', 0, '2020-02-06 20:28:29', '2020-02-06 20:28:29', '2021-02-06 13:28:29'),
('6c242fef8536531a10f2b6ac66e8897a35aa69f6d8816d8808f3d37eb9c9527950bacb9614eec0ba', 14, 3, 'Personal Access Token', '[]', 0, '2020-02-18 18:46:32', '2020-02-18 18:46:32', '2021-02-18 11:46:32'),
('6ee93fea2ef5dbee1fecb0965829554974faf98d05304c60dc0cb47a07730a9ed9ea6dbed73ad832', 16, 3, 'Personal Access Token', '[]', 0, '2020-05-06 21:55:39', '2020-05-06 21:55:39', '2021-05-06 15:55:39'),
('72bfe749a7264ed2a555a4409a700bcea1d7ed6e5e7d904a41ce8d2ee02e5edfe7815cf1a27dcf2f', 16, 3, 'Personal Access Token', '[]', 0, '2020-05-26 23:06:56', '2020-05-26 23:06:56', '2021-05-26 17:06:56'),
('73bb7cff7d7c75cd6f0741e503ad9c7745792e8e40001434568dd39277ec471f6d2249cd90ee3c0c', 13, 3, 'Personal Access Token', '[]', 0, '2020-02-06 07:16:14', '2020-02-06 07:16:14', '2021-02-06 00:16:14'),
('74f1b4fea8aa6349abc21695cbdc042042c4a56fcf22a9a1668ed97eb0c6b7d4c67206d22af63cc1', 16, 3, 'Personal Access Token', '[]', 0, '2020-05-12 16:40:15', '2020-05-12 16:40:15', '2021-05-12 10:40:15'),
('75815467e227a7a9ac3d8f7fd24d4b760d27d499981864c9e3fe8e49c22a69320f8436dd8d5d79c1', 13, 3, 'Personal Access Token', '[]', 0, '2020-02-06 19:31:39', '2020-02-06 19:31:39', '2021-02-06 12:31:39'),
('7dfb5bd0014ea1cd94af6ac38cc5ded77404b94e3fe09b21c2947f382ca9d68e78e1c61e3cf85575', 13, 3, 'Personal Access Token', '[]', 0, '2019-12-25 08:35:30', '2019-12-25 08:35:30', '2020-12-25 01:35:30'),
('7e6e53164ce8027c774c74961eec2f5d19f375432a8a640555ae5bd71ce52b5ac4c1c571da7497dc', 1, 3, 'Personal Access Token', '[]', 0, '2019-12-21 19:25:35', '2019-12-21 19:25:35', '2020-12-21 12:25:35'),
('8406f65aa0e138d08ac989035e1e7bdc9ddba2503d573082c6c1248ad539420f60371beb7572e815', 13, 3, 'Personal Access Token', '[]', 0, '2020-01-21 23:40:57', '2020-01-21 23:40:57', '2021-01-21 16:40:57'),
('84cab9ef6604552af22df53cbf7fa1331ff701ee140669c08de255490f81e692ac8e1fa534241361', 16, 3, 'Personal Access Token', '[]', 0, '2020-09-03 18:17:40', '2020-09-03 18:17:40', '2021-09-03 12:17:40'),
('84cd283ea8c49b21248ec242c80597663f3658cb3ce58f674813cf51dd2727b37e740a1f9099f6c0', 14, 3, 'Personal Access Token', '[]', 0, '2020-02-08 04:28:52', '2020-02-08 04:28:52', '2021-02-07 21:28:52'),
('8a47ea2f2f63af15666c51259e518904ae2a1158e81a744a4d864d6dbed96ee43fd7b262bcd4b65d', 13, 3, 'Personal Access Token', '[]', 0, '2020-02-05 00:22:23', '2020-02-05 00:22:23', '2021-02-04 17:22:23'),
('8dd64669f8f5ad6f949ec9acb0332feef4f7c72f91563f6d0127a9dc887044156b993b45c3d35fd0', 1, 3, 'Personal Access Token', '[]', 0, '2019-12-19 19:04:14', '2019-12-19 19:04:14', '2020-12-19 12:04:14'),
('914537ff8d178c9ad75fa5197b5e69b4ef0e6f669acb04104d7bf51db6bd55e0ad5b6b4e11682731', 13, 3, 'Personal Access Token', '[]', 0, '2020-01-21 23:41:39', '2020-01-21 23:41:39', '2021-01-21 16:41:39'),
('968721766e17dcbf26413b93f37d785860cbb609522bb299ece07b2606a12be8e1d2bfa9476679e6', 1, 3, 'Personal Access Token', '[]', 0, '2019-12-18 20:36:49', '2019-12-18 20:36:49', '2020-12-18 13:36:49'),
('9bf6015bdc3504cad30ac8f9fd51943865d2d5fc785b19a2d340e1e0b6f3d4c5d50ff7c070ef15e3', 1, 3, 'Personal Access Token', '[]', 0, '2019-12-18 06:10:38', '2019-12-18 06:10:38', '2020-12-17 23:10:38'),
('9c0a5d498bf1d04fd59d4e5f4773900d44251d40447b89c8cd1719ef62c64842c99c695fb7476d8a', 1, 3, 'Personal Access Token', '[]', 0, '2019-12-19 06:37:18', '2019-12-19 06:37:18', '2020-12-18 23:37:18'),
('9eb39af17bfdccb7c120e06506dbf1235f2422d3788d414b74f914c109118d6a79e1d94bfa746094', 1, 3, 'Personal Access Token', '[]', 0, '2020-02-10 20:06:58', '2020-02-10 20:06:58', '2021-02-10 13:06:58'),
('9f4bae4fe75e7f72f059c05cac0db2b2412fc9bad3b3d3420d2274c0f3d5b36a219d90ed5773957b', 16, 3, 'Personal Access Token', '[]', 0, '2020-05-19 22:49:18', '2020-05-19 22:49:18', '2021-05-19 16:49:18'),
('9f9d115fa485d2ac146ed10de7ff79b36ccb01e988473ece6b37b271818acce25cfbea68e81ac5ae', 13, 3, 'Personal Access Token', '[]', 0, '2019-12-21 02:33:25', '2019-12-21 02:33:25', '2020-12-20 19:33:25'),
('a1c13711f92b6ea5bbbc73603f5bc72deb3cacd493e0ffd4a0026b0e1d92ca7508b4db1ad4149817', 16, 3, 'Personal Access Token', '[]', 0, '2020-06-20 18:18:45', '2020-06-20 18:18:45', '2021-06-20 12:18:45'),
('a217b704d27c69310d1fa5670384f49ab6ab381241441bb976f08e42697900d733630bd16ad4e367', 13, 3, 'Personal Access Token', '[]', 0, '2020-01-18 18:42:25', '2020-01-18 18:42:25', '2021-01-18 11:42:25'),
('a361027161136ebedbf59aab90166af2387d67cf31483ddaadd18bbbefe86728f6404c9bf5022c56', 13, 3, 'Personal Access Token', '[]', 0, '2019-12-19 19:59:57', '2019-12-19 19:59:57', '2020-12-19 12:59:57'),
('a3d5b9c50f31459e5ff527b988c4e3e7281236952ad4738d1257def100c191169fc723a56c4ab5ac', 16, 3, 'Personal Access Token', '[]', 0, '2020-07-06 16:22:01', '2020-07-06 16:22:01', '2021-07-06 10:22:01'),
('a633189a4e851cf33cfc3dbaa9b4bfd65f3d5dd3da33c4509fb2692cecc15353a6add509798a805f', 13, 3, 'Personal Access Token', '[]', 0, '2020-03-03 21:50:11', '2020-03-03 21:50:11', '2021-03-03 14:50:11'),
('a8c511cee82e40ec2e77dea5738c3b4549d82b71043a9387a4123967a58064c098713011a2b964f1', 1, 3, 'Personal Access Token', '[]', 0, '2019-12-19 07:17:48', '2019-12-19 07:17:48', '2020-12-19 00:17:48'),
('a97b0420efb24e69810b8127f026acf581e1151006a7c96151ddddb5f207d77cd940e9b36aea87be', 13, 3, 'Personal Access Token', '[]', 0, '2019-12-21 06:43:30', '2019-12-21 06:43:30', '2020-12-20 23:43:30'),
('aa3a413764032199e2bc8f651b076ad0d15bb248f0acb9c5cc04c427355a6d91c2c8c339c6ec44ab', 13, 3, 'Personal Access Token', '[]', 0, '2019-12-23 07:30:55', '2019-12-23 07:30:55', '2020-12-23 00:30:55'),
('acc8d387effac30d2872dfe70ab6921a8f28e3507ebe31a0b6b1df448bf988aff61e7e20d59e6084', 16, 3, 'Personal Access Token', '[]', 0, '2020-03-28 18:55:33', '2020-03-28 18:55:33', '2021-03-28 12:55:33'),
('aeff83d92bafc4ede84f2ab9e036acb01873cf382d2c5ba8d7256bd022735dc7696287702e94001e', 13, 3, 'Personal Access Token', '[]', 0, '2020-02-05 00:15:18', '2020-02-05 00:15:18', '2021-02-04 17:15:18'),
('bb4fc206afa0420b0f45e40938d3d80b680fc968a8bf4306e320bb25d6b15880daa0e5e6aaf0a1fe', 13, 3, 'Personal Access Token', '[]', 0, '2019-12-27 08:16:55', '2019-12-27 08:16:55', '2020-12-27 01:16:55'),
('bcf90b856591906578eda4bec1a712132b83b61bfee0f8342903fc7d91084dc37b6a03e4fa54e224', 13, 3, 'Personal Access Token', '[]', 0, '2020-01-22 16:35:44', '2020-01-22 16:35:44', '2021-01-22 09:35:44'),
('bd3f269f78465d12409949228f8387fcf083ac6ed378fa46e196a0ead764d15f9f09d24bf95daeb8', 16, 3, 'Personal Access Token', '[]', 0, '2020-02-24 20:19:16', '2020-02-24 20:19:16', '2021-02-24 13:19:16'),
('c7e6e01278eb0324887a851ecc1a3bcf2d0f2b8867cea04fa15b7ce8359d416b90ccc866fe5e1420', 16, 3, 'Personal Access Token', '[]', 0, '2020-03-16 21:29:15', '2020-03-16 21:29:15', '2021-03-16 15:29:15'),
('ce32fb42900b17dfff87d22305b1d762efbb278d170149084782e110ed29add90d47271cf428f96e', 16, 3, 'Personal Access Token', '[]', 0, '2020-02-13 19:33:54', '2020-02-13 19:33:54', '2021-02-13 12:33:54'),
('d0602a7092ec7ea16d946ffa2d55a9cbd2b99064b14a71acfc620fb4f802a12285ddafad9359b467', 16, 3, 'Personal Access Token', '[]', 0, '2020-04-21 16:58:13', '2020-04-21 16:58:13', '2021-04-21 10:58:13'),
('d38c35ad84f8d4d192f693538041932cf4a654374bfe6c04643bce0dd6999fe3a81a72b7e55efbbe', 13, 3, 'Personal Access Token', '[]', 0, '2019-12-23 20:12:02', '2019-12-23 20:12:02', '2020-12-23 13:12:02'),
('d6a35012a0b5405847371c6cf9a353595cdac66abc01b034c8a5a28fbe1f6ea3fa96862cc83c8135', 1, 3, 'Personal Access Token', '[]', 0, '2019-12-19 07:20:13', '2019-12-19 07:20:13', '2020-12-19 00:20:13'),
('da0d8cab083bbe8b528d9048e458bf57f255196d433268892f359a80b564a40b000cca6e2dd35972', 1, 3, 'Personal Access Token', '[]', 0, '2020-01-22 06:19:53', '2020-01-22 06:19:53', '2021-01-21 23:19:53'),
('dcca55dfd8641cedc0e1b53c1264957901a018bd59035c06dcbc408ecb1b786c15a83e0c0d3cdd74', 16, 3, 'Personal Access Token', '[]', 0, '2020-07-20 16:36:17', '2020-07-20 16:36:17', '2021-07-20 10:36:17'),
('e096a45c3692b4fb89566f445157cccf20827894d7af687e88d38f4f5bcf21e7782f7326f40f7c11', 16, 3, 'Personal Access Token', '[]', 0, '2020-02-10 22:20:56', '2020-02-10 22:20:56', '2021-02-10 15:20:56'),
('e2b7dc5396caa9aa09ad200d7c8ef06fb822fe925d39b781be1ef89397fc045130aebdd6dc2587d2', 13, 3, 'Personal Access Token', '[]', 0, '2020-09-03 18:15:53', '2020-09-03 18:15:53', '2021-09-03 12:15:53'),
('e5eb50e7bbfbae6c74fb7b4dae4888212d8aea7e963b20ee6a98289fbff3e987750421acd813263c', 16, 3, 'Personal Access Token', '[]', 0, '2020-09-03 18:29:28', '2020-09-03 18:29:28', '2021-09-03 12:29:28'),
('ea2d01b9139ad8fed8c83c74ec8126a3a00bf2e48822067981a70c677094f22bfdf4d0cc69f6198c', 16, 3, 'Personal Access Token', '[]', 0, '2020-07-06 16:47:43', '2020-07-06 16:47:43', '2021-07-06 10:47:43'),
('edbb5a9230e1c6d774a2c3a66b2dc3f252a3ce4b4a4082edcad9cdd600c7133e955e6b3a892ada30', 16, 3, 'Personal Access Token', '[]', 0, '2020-09-03 23:37:02', '2020-09-03 23:37:02', '2021-09-03 17:37:02'),
('eecfe0ab14dbff4efebe9f9f2bd4d94c6828818b5bfd683d7677df746d0aeea931a06edec0f1e748', 16, 3, 'Personal Access Token', '[]', 0, '2020-03-02 19:01:30', '2020-03-02 19:01:30', '2021-03-02 12:01:30'),
('f8d4930205b08c6d4326b7905a718312808effef65c7a4ab448007cd39d25f7760294e1ed91e970f', 16, 3, 'Personal Access Token', '[]', 0, '2020-07-13 16:18:44', '2020-07-13 16:18:44', '2021-07-13 10:18:44'),
('fa2aef7be9f1cac1205ac7cad82cb6c847e1e4bca47545807c55f86d1cdbb05cc99c9b9e8af822ee', 16, 3, 'Personal Access Token', '[]', 0, '2020-06-20 17:34:42', '2020-06-20 17:34:42', '2021-06-20 11:34:42'),
('fe72a2727ef6184e02a5e3340215cc4e3526588188076c26b829a0315ca0c9f9d537b0fc37ee126a', 13, 3, 'Personal Access Token', '[]', 0, '2019-12-27 08:23:48', '2019-12-27 08:23:48', '2020-12-27 01:23:48'),
('fec2ccfe34b8a825513b82849b7f1f60760fda580f26344496fcab5461b7c2b02fc3d1556dfacebd', 1, 3, 'Personal Access Token', '[]', 0, '2019-12-19 18:19:26', '2019-12-19 18:19:26', '2020-12-19 11:19:26');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(3, NULL, 'Laravel Personal Access Client', 'rK0uWAoOZEPDmzMbZx2gqSGuliNSKBUvvMJFTFs7', 'http://localhost', 1, 0, 0, '2019-12-18 12:10:27', '2019-12-18 12:10:27'),
(4, NULL, 'Laravel Password Grant Client', 'GubTP33Yu8HKRRzfcURaZHSHzavOXGs9Q9ZkYimU', 'http://localhost', 0, 1, 0, '2019-12-18 12:10:27', '2019-12-18 12:10:27');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(2, 3, '2019-12-18 12:10:27', '2019-12-18 12:10:27');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `description` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `description`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(20, '01 Efectivo', NULL, 4, NULL, '2019-12-27 01:14:22', '2019-12-27 01:14:22'),
(21, '02 Cheque Nominativo', NULL, 4, NULL, '2019-12-27 01:14:27', '2019-12-27 01:14:27'),
(22, '03 Transferencia de Fondo', NULL, 4, NULL, '2019-12-27 01:14:33', '2019-12-27 01:14:33'),
(23, '01', 'Efectivo', 4, NULL, NULL, NULL),
(24, '02', 'Cheque Nominativo', 4, NULL, NULL, NULL),
(25, '03', 'Transferencia de Fondos', 3, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment_receipts`
--

CREATE TABLE `payment_receipts` (
  `id` int(10) UNSIGNED NOT NULL,
  `date` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `period` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_receipts_transference1`
--

CREATE TABLE `payment_receipts_transference1` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_receipt_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `file_url` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_receipts_transference2`
--

CREATE TABLE `payment_receipts_transference2` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_receipt_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `file_url` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_receipts_xml`
--

CREATE TABLE `payment_receipts_xml` (
  `id` int(10) UNSIGNED NOT NULL,
  `payment_receipt_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `file_url` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `period_types`
--

CREATE TABLE `period_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `period_types`
--

INSERT INTO `period_types` (`id`, `name`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 'Semanal', 4, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sexs`
--

CREATE TABLE `sexs` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `sexs`
--

INSERT INTO `sexs` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'F', NULL, NULL, NULL),
(2, 'M', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `unionizeds`
--

CREATE TABLE `unionizeds` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `description` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `unionizeds`
--

INSERT INTO `unionizeds` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 'S', 'Sí', NULL, NULL, NULL),
(6, 'N', 'No', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_company_id` int(10) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `group_id`, `avatar`, `default_company_id`, `active`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Samuel Regino Placido', 'samuel.regino@next-io.com', NULL, '$2y$10$lhfiQ4PxkL50BCPU4eYSS.JjkDom9MyeDDJcx1OtkZwnZFPzuc5aO', NULL, 4, 'avatar.png', 3, 1, '2019-10-01 03:22:22', '2019-10-20 05:15:35', NULL),
(13, 'David Reyes', 'david.reyes@esifiscal.com.mx', NULL, '$2y$10$QB0bwHKeN7eOfEWIwiJUne4V70fLHRrROZQWkx6.MPsshd8OdkszC', NULL, 1, 'avatar.png', 3, 1, '2019-12-18 20:39:20', '2019-12-21 19:25:48', NULL),
(14, 'Nelicia', 'contabilidad.re.do@hotmail.com', NULL, '$2y$10$ME5DSn2Tttw3I5Ko1Vc6weO0Zt6uEPQ5pEwdSiVAoWdPWlN4gYJom', NULL, 1, 'avatar.png', NULL, 1, '2020-02-06 20:30:15', '2020-02-06 20:32:59', NULL),
(15, 'Nelicia', 'david.rehd@hotmail.com', NULL, '$2y$10$TICps4nq5Re4Wbxw.efFV.V5ktfVt0YEIN6SAr5PlV6ctzuzrTmH2', NULL, 1, 'avatar.png', NULL, 1, '2020-02-06 20:33:52', '2020-02-07 05:54:24', '2020-02-06 22:54:24'),
(16, 'Rodivert Robles', 'rodiver.robles@esifiscal.com.mx', NULL, '$2y$10$Hnvi1G7hOiL/cUquQuj7U.Q8T65K5Cv1MnXhf9PeZO7bPY5/OSfm2', NULL, 1, 'avatar.png', NULL, 1, '2020-02-08 18:47:49', '2020-03-28 18:53:36', NULL),
(17, 'Miguel Angel Hernandez', 'supervisor@esifiscal.com.mx', NULL, '$2y$10$JbaVYEM57tR8kazaRcutwurRSERZRn8fNN4KhJjaeWPd.65QJVUb6', NULL, 1, 'avatar.png', NULL, 1, '2020-09-12 19:44:16', '2020-09-12 19:44:16', NULL),
(18, 'Esther Gonzalez Iglesias', 'esther.gonzalez@esifiscal.com.mx', NULL, '$2y$10$8lto9qjZ1G2tv4ETKgT7De3.VVw7tp2iI31MqRQIIi2ZT95kQBMYq', NULL, 1, 'avatar.png', NULL, 1, '2020-09-12 19:45:47', '2020-09-12 19:48:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `works`
--

CREATE TABLE `works` (
  `id` int(10) UNSIGNED NOT NULL,
  `work_status_id` int(11) UNSIGNED DEFAULT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `code` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `discharge_date` date DEFAULT NULL,
  `termination_date` date DEFAULT NULL,
  `reentry_date` date DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `first_name` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `contract_type_id` int(10) UNSIGNED DEFAULT NULL,
  `period_type_id` int(10) UNSIGNED DEFAULT NULL,
  `real_daily_salary` decimal(20,2) DEFAULT NULL,
  `imss_daily_salary` decimal(20,2) DEFAULT NULL,
  `contribution_base_salary` decimal(20,2) DEFAULT NULL,
  `contribution_base_id` int(11) UNSIGNED DEFAULT NULL,
  `department_id` int(10) UNSIGNED DEFAULT NULL,
  `job_id` int(10) UNSIGNED DEFAULT NULL,
  `employee_type_id` int(10) UNSIGNED DEFAULT NULL,
  `unionized_id` int(10) UNSIGNED DEFAULT NULL,
  `payment_method_id` int(10) UNSIGNED DEFAULT NULL,
  `work_shift_id` int(10) UNSIGNED DEFAULT NULL,
  `number_afore` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `social_security_number` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `rfc` varchar(13) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `curp` varchar(22) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `sex_id` int(11) UNSIGNED DEFAULT NULL,
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
  `discount_type_id` int(10) UNSIGNED DEFAULT NULL,
  `monthly_factor` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `ine_file_url` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `address_file_url` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `curp_file_url` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `contract_file_url` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `imss_file_url` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `baja_imss_file_url` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `finiquito_file_url` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `baja_imss_date` date DEFAULT NULL,
  `causa_baja` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `observations_baja` varchar(200) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `works`
--

INSERT INTO `works` (`id`, `work_status_id`, `company_id`, `code`, `discharge_date`, `termination_date`, `reentry_date`, `name`, `first_name`, `last_name`, `contract_type_id`, `period_type_id`, `real_daily_salary`, `imss_daily_salary`, `contribution_base_salary`, `contribution_base_id`, `department_id`, `job_id`, `employee_type_id`, `unionized_id`, `payment_method_id`, `work_shift_id`, `number_afore`, `social_security_number`, `rfc`, `curp`, `sex_id`, `birth_city`, `birth_date`, `umf`, `fathers_name`, `mothers_name`, `current_address`, `current_population`, `current_state`, `cp`, `telephone`, `back_electronic_payment`, `acount_number`, `branch_office`, `fonacot_number`, `email`, `key_account`, `state`, `infonavit_credit_number`, `discount_type_id`, `monthly_factor`, `ine_file_url`, `address_file_url`, `curp_file_url`, `contract_file_url`, `imss_file_url`, `baja_imss_file_url`, `finiquito_file_url`, `baja_imss_date`, `causa_baja`, `observations_baja`, `created_at`, `updated_at`, `deleted_at`) VALUES
(185, 1, 4, '042', '2019-12-05', '1899-12-30', '1899-12-30', 'Jorge Luis', 'Dominguez', 'Leyva', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, 23, 7, NULL, '04169682798', 'DOLJ9610274Q3', 'DOLJ961027HVZMYR01', 2, 'VERACRUZ', '1996-10-27', '0', NULL, NULL, NULL, NULL, 'VER', '0', NULL, NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:05', '2020-01-21 17:39:36', NULL),
(186, 1, 4, '043', '2019-12-05', '1899-12-30', '1899-12-30', 'Mario', 'Torres', 'Borbonio', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, NULL, '65937428111', 'TOBM740722AH4', 'TOBM740722HVZRRR02', 2, 'VERACRUZ', '1974-07-22', '0', NULL, NULL, NULL, NULL, 'VER', '0', NULL, NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:05', '2020-01-21 17:36:05', NULL),
(187, 1, 4, '044', '2019-12-05', '1899-12-30', '1899-12-30', 'Jorge Luis', 'Carmona', 'Amaya', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, NULL, '10190077668', 'CAAJ000226JF6', 'CAAJ000226HVZRMRA5', 2, 'VERACRUZ', '2000-02-26', '0', NULL, NULL, NULL, NULL, 'VER', '0', NULL, NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:05', '2020-01-21 17:36:05', NULL),
(188, 1, 4, '045', '2019-12-05', '1899-12-30', '1899-12-30', 'Joaquin', 'Aquino', 'Perez', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, 23, 7, NULL, '65997414944', 'AUPJ7407037Z1', 'AUPJ740703HOCQRQ07', 2, 'OAXACA', '1974-07-03', '0', NULL, NULL, NULL, NULL, 'VER', '0', NULL, NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:05', '2020-01-21 17:36:05', NULL),
(189, 1, 4, '046', '2019-12-05', '1899-12-30', '1899-12-30', 'Leonel', 'Lopez ', 'Velazquez ', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, NULL, '83037701857', 'LOVL770203I69', 'LOVL770203HTCPLN01', 2, NULL, '1977-02-03', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:05', '2020-01-21 17:36:05', NULL),
(190, 1, 4, '047', '2019-12-05', '1899-12-30', '1899-12-30', 'Roberto', 'Flores', 'Fernandez', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, NULL, '65107301270', 'FOFR730705S1A', 'FOFR730705HVZLRB00', 2, NULL, '1973-07-05', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:05', '2020-01-21 17:36:05', NULL),
(191, 1, 4, '048', '2019-12-05', '1899-12-30', '1899-12-30', 'Hilario', 'Mozo', 'Quino', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, NULL, '01137878623', 'MOQH7810216P5', 'MOQH781021HVZZNL08', 2, NULL, '1978-10-21', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(192, 1, 4, '049', '2019-12-05', '1899-12-30', '1899-12-30', 'Luis Alberto', 'Ortiz', 'Avendaño', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, NULL, '65119157991', 'OIAL910930PC1', 'OIAL910930HVZRVS00', 2, NULL, '1991-09-30', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(193, 1, 4, '050', '2019-12-05', '1899-12-30', '1899-12-30', 'Lauro', 'Salomon', 'Caballero', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, 23, 7, NULL, '65927329253', 'SACL7301069H6', 'SACL730106HVZLBR00', 2, NULL, '1973-01-06', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(194, 1, 4, '051', '2019-12-05', '1899-12-30', '1899-12-30', 'Yazmin', 'Sustersik', 'Lopez', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, NULL, '67129243779', 'SULY921206MI1', 'SULY921206MVZSPZ07', 1, NULL, '1992-12-06', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(195, 1, 4, '052', '2019-12-05', '1899-12-30', '1899-12-30', 'Alejandro', 'Retama', 'Munive', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, NULL, '67048004773', 'REMA800518I19', 'REMA800518HHGTNL01', 2, NULL, '1980-05-18', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(196, 1, 4, '053', '2019-12-05', '1899-12-30', '1899-12-30', 'Benito', 'Huesca', 'Garcia', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, 23, 7, NULL, '65927531916', 'HUGB7503212U7', 'HUGB750321HVZSRN09', 2, NULL, '1975-03-21', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(197, 1, 4, '054', '2019-12-05', '1899-12-30', '1899-12-30', 'Hugo Alberto', 'Bolaños', 'Palacios', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, 23, 7, NULL, '65907236825', 'BOPH720302CK9', 'BOPH720302HVZLLG08', 2, NULL, '1972-03-02', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(198, 1, 4, '056', '2019-12-05', '1899-12-30', '1899-12-30', 'Jaime Rafael', 'Nolasco', 'Salgado', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, NULL, '65836801442', 'NOSJ681119651', 'NOSJ681119HVZLLM09', 2, NULL, '1968-11-19', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(199, 1, 4, '001', '2019-12-05', '1899-12-30', '1899-12-30', 'Fernando', 'Antonio', 'Luis', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67815752000', 'AOLF570618NW2', 'AOLF570618HVZNSR04', 2, ' ', '1957-06-18', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(200, 1, 4, '002', '2019-12-05', '1899-12-30', '1899-12-30', 'Miguel Angel', 'Arano', 'Lira', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67017714840', 'AALM770908E5A', 'AALM770908HVZRRG08', 2, ' ', '1977-09-08', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(201, 1, 4, '003', '2019-12-05', '1899-12-30', '1899-12-30', 'Victor Alfonso', 'Avelino', 'Fonseca', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '14169868347', 'AEFV980331SD0', 'AEFV980331HVZVNC06', 2, ' ', '1998-03-31', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(202, 1, 4, '004', '2019-12-05', '1899-12-30', '1899-12-30', 'Silvano', 'Barba', 'Estevez', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '65654710956', 'BAES4711189P7', 'BAES471118HVZRSL06', 2, ' ', '1947-11-18', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(203, 1, 4, '005', '2019-12-05', '1899-12-30', '1899-12-30', 'Rusbel', 'Cabrera', 'Morales', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67816651607', 'CAMR660130FG3', 'CAMR660130HOCBRS02', 2, ' ', '1966-01-30', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(204, 1, 4, '006', '2019-12-05', '1899-12-30', '1899-12-30', 'Julio Cesar', 'Chacon', 'Campos', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67088953285', 'CACJ891112DT2', 'CACJ891112HVZHML05', 2, ' ', '1989-11-12', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(205, 1, 4, '007', '2019-12-05', '1899-12-30', '1899-12-30', 'Jairo Ivan', 'Cruz', 'Hernandez', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '70149542030', 'CUHJ9510081WA', 'CUHJ951008HVZRRR03', 2, ' ', '1995-10-08', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(206, 1, 4, '008', '2019-12-05', '1899-12-30', '1899-12-30', 'Javier', 'Degollado', 'Avelino', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67047400014', 'DEAJ740625DC8', 'DEAJ740625HVZGBV06', 2, ' ', '1974-06-25', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(207, 1, 4, '009', '2019-12-05', '1899-12-30', '1899-12-30', 'Juan Manuel', 'Diaz', 'Flores', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67139502701', 'DIFJ950310AR9', 'DIFJ950310HVZZLN02', 2, ' ', '1995-03-10', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(208, 1, 4, '010', '2019-12-05', '1899-12-30', '1899-12-30', 'Jose Manuel', 'Dionicio', 'Chacon', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67997907869', 'DICM7909127H7', 'DICM790912HVZNHN08', 2, ' ', '1979-09-12', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(209, 1, 4, '011', '2019-12-05', '1899-12-30', '1899-12-30', 'Francisco', 'Dolores', 'Hipolito', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67765500722', 'DOHF5601106R6', 'DOHF560110HVZLPR06', 2, ' ', '1956-01-10', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(210, 1, 4, '012', '2019-12-05', '1899-12-30', '1899-12-30', 'Juan Jose', 'Dominguez', 'Celaya', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67907157019', 'DOCJ710416TN5', 'DOCJ710416HOCMLN09', 2, ' ', '1971-04-16', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(211, 1, 4, '013', '2019-12-05', '1899-12-30', '1899-12-30', 'Joel', 'Evia', 'Mendoza', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '83937414791', 'EIMJ740426L34', 'EIMJ740426HTCVNL04', 2, ' ', '1974-04-26', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(212, 1, 4, '014', '2019-12-05', '1899-12-30', '1899-12-30', 'Daniel Ivan', 'Fernandez', 'Naguatt', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67968159938', 'FEND810329HT0', 'FEND810329HVZRGN01', 2, ' ', '1981-03-29', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(213, 1, 4, '015', '2019-12-05', '1899-12-30', '1899-12-30', 'Santiago', 'Gonzalez', 'Jeronimo', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '83037807076', 'GOJS7809262A6', 'GOJS780926HTCNRN09', 2, ' ', '1978-09-26', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(214, 1, 4, '016', '2019-12-05', '1899-12-30', '1899-12-30', 'Maximino', 'Gonzalez', 'Toto', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '07907312321', 'GOTM731217I2A', 'GOTM731217HVZNTZ00', 2, ' ', '1973-12-17', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(215, 1, 4, '017', '2019-12-05', '1899-12-30', '1899-12-30', 'Jesus Alberto', 'Guillen', 'Velasco', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '65129306075', 'GUVJ9308158V9', 'GUVJ930815HVZLLS08', 2, ' ', '1993-08-15', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(216, 1, 4, '018', '2019-12-05', '1899-12-30', '1899-12-30', 'Julio Cesar', 'Guzman', 'Bosquez', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67887090511', 'GUBJ700730NS6', 'GUBJ700730HVZZSL04', 2, ' ', '1970-07-30', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(217, 1, 4, '019', '2019-12-05', '1899-12-30', '1899-12-30', 'Hector Manuel', 'Guzman', 'Flores', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '78967640679', 'GUFH761001PI4', 'GUFH761001HVZZLC07', 2, ' ', '1976-10-01', '0', ' ', ' ', NULL, ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(218, 1, 4, '021', '2019-12-05', '1899-12-30', '1899-12-30', 'Daniel Cecilio', 'Hernandez', 'Tenorio', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '65967300883', 'HETD731122KG8', 'HETD731122HVZRNN06', 2, ' ', '1973-11-22', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(219, 1, 4, '022', '2019-12-05', '1899-12-30', '1899-12-30', 'Marcos', 'Lopez', 'Cervantes', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67068608453', 'LOCM8612052X8', 'LOCM861205HVZPRR04', 2, ' ', '1986-12-05', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(220, 1, 4, '023', '2019-12-05', '1899-12-30', '1899-12-30', 'Leonardo', 'Lopez', 'Estrada', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67089110331', 'LOEL910624LI1', 'LOEL910624HVZPSN06', 2, ' ', '1991-06-24', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(221, 1, 4, '024', '2019-12-05', '1899-12-30', '1899-12-30', 'Raymundo', 'Lopez', 'Luna', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67917387234', 'LOLR730228JL7', 'LOLR730228HVZPNY07', 2, ' ', '1973-02-28', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(222, 1, 4, '025', '2019-12-05', '1899-12-30', '1899-12-30', 'Fernando', 'Mayo', 'Cruz', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '65947133610', 'MACF710816GW7', 'MACF710816HVZYRR07', 2, ' ', '1971-08-16', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(223, 1, 4, '026', '2019-12-05', '1899-12-30', '1899-12-30', 'Irving', 'Mendez', 'Arias', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67018508597', 'MEAI850323M14', 'MEAI850323HVZNRR02', 2, ' ', '1985-03-23', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(224, 1, 4, '027', '2019-12-05', '1899-12-30', '1899-12-30', 'Jimmy Humberto', 'Mendez', 'Pineda', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67078101838', 'MEPJ810227562', 'MEPJ810227HVZNNM06', 2, ' ', '1981-02-27', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(225, 1, 4, '028', '2019-12-05', '1899-12-30', '1899-12-30', 'Hector', 'Molina', 'Lopez', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '71008025224', 'MOLH801118HJ1', 'MOLH801118HCSLPC02', 2, ' ', '1980-11-18', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(226, 1, 4, '029', '2019-12-05', '1899-12-30', '1899-12-30', 'Alberto', 'Obil', 'Quino', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '65129102789', 'OIQA9103209X5', 'OIQA910320HVZBNL04', 2, ' ', '1991-03-20', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(227, 1, 4, '030', '2019-12-05', '1899-12-30', '1899-12-30', 'Raul', 'Perez', 'Flores', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67968052950', 'PEFR800525BKA', 'PEFR800525HTCRLL07', 2, ' ', '1980-05-25', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(228, 1, 4, '031', '2019-12-05', '1899-12-30', '1899-12-30', 'Alejandro', 'Rios', 'Vigil', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67088924286', 'RIVA890222GL2', 'RIVA890222HVZSGL01', 2, ' ', '1989-02-22', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(229, 1, 4, '032', '2019-12-05', '1899-12-30', '1899-12-30', 'Julio Cesar', 'Serdan', 'Castellanos', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67856653349', 'SECJ680818TF9', 'SECJ680818HVZRSL00', 2, ' ', '1968-08-18', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(230, 1, 4, '033', '2019-12-05', '1899-12-30', '1899-12-30', 'Ignacio Manuel', 'Tenorio', 'Vazquez', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67927370394', 'TEVI730216TI9', 'TEVI730216HVZNZG04', 2, ' ', '1973-02-16', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(231, 1, 4, '034', '2019-12-05', '1899-12-30', '1899-12-30', 'Erick Gerardo', 'Tornado', 'Gonzalez', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67129234109', 'TOGE921029ME4', 'TOGE921029HVZRNR02', 2, ' ', '1992-10-29', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(232, 1, 4, '035', '2019-12-05', '1899-12-30', '1899-12-30', 'Sergio', 'Torres', 'Sanchez', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '78725202416', 'TOSS5209092Q8', 'TOSS520909HVZRNR08', 2, ' ', '1952-09-09', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(233, 1, 4, '036', '2019-12-05', '1899-12-30', '1899-12-30', 'Jose Luis', 'Vergara', 'Gonzalez', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67067701630', 'VEGL770414NE1', 'VEGL770414HDFRNS00', 2, ' ', '1977-04-14', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(234, 1, 4, '037', '2019-12-05', '1899-12-30', '1899-12-30', 'Juan Carlos', 'Vergara', 'Gonzalez', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67978060050', 'VEGJ801104QNA', 'VEGJ801104HDFRNN06', 2, ' ', '1980-11-04', '0', ' ', ' ', NULL, ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(235, 1, 4, '038', '2019-12-05', '1899-12-30', '1899-12-30', 'Celestino', 'Villanueva', 'Pablo', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67018102920', 'VIPC8103021LA', 'VIPC810302HVZLBL08', 2, ' ', '1981-03-02', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(236, 1, 4, '039', '2019-12-05', '1899-12-30', '1899-12-30', 'Alfredo', 'Xolo', 'Sosme', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67998034374', 'XOSA800309SA3', 'XOSA800309HVZLSL03', 2, ' ', '1980-03-09', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(237, 1, 4, '040', '2019-12-05', '1899-12-30', '1899-12-30', 'Aurelio', 'Zapo', 'Quino', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '65068706608', 'ZAQA870415P11', 'ZAQA870415HVZPNR06', 2, ' ', '1987-04-15', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(238, 1, 4, '041', '2019-12-05', '1899-12-30', '1899-12-30', 'Marcelino', 'Zapo', 'Quino', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, ' ', '65018330624', 'ZAQM831005V15', 'ZAQM831005HVZPNR00', 2, ' ', '1983-10-05', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(239, 1, 4, '057', '2019-12-05', '1899-12-30', '1899-12-30', 'Alonso', 'Lopez', 'De Jesus', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, NULL, '67866672701', 'LOJA6610125U8', 'LOJA661012HVZPSL06', 2, NULL, '1966-10-12', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(240, 1, 4, '059', '2019-12-05', '1899-12-30', '1899-12-30', 'Porfirio Mizael', 'Morales', 'Moreno', 14, 5, 0.00, 124.17, 129.78, 8, NULL, NULL, 8, 5, NULL, 7, NULL, '65099108022', 'MOMP910918954', 'MOMP910918HVZRRR05', 2, NULL, '1991-09-18', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(241, 1, 4, '060', '2019-12-05', '1899-12-30', '1899-12-30', 'Martin Guadalupe', 'Contreras', 'Salmeron', 14, 5, 0.00, 124.17, 129.78, 8, NULL, NULL, 8, 5, NULL, 7, NULL, '65068638751', 'COSM861212UP6', 'COSM861212HVZNLR04', 2, NULL, '1986-12-12', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(242, 1, 4, '061', '2019-12-05', '1899-12-30', '1899-12-30', 'Isaac', 'Crisostomo', 'Jimenez', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, NULL, '83098914159', 'CIJI890227BJ8', 'CIJI890227HTCRMS07', 2, NULL, '1989-02-27', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(243, 1, 4, '062', '2019-12-05', '1899-12-30', '1899-12-30', 'Jesus', 'Huesca', 'Garcia', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, NULL, '65047101392', 'HUGJ710105JD5', 'HUGJ710105HVZSRS09', 2, NULL, '1971-01-05', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(244, 1, 4, '063', '2019-12-19', '1899-12-30', '1899-12-30', 'Martin', 'Anota ', 'Tepach', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, NULL, '65866409371', 'AOTM640930S85', 'AOTM640930HVZNPR01', 2, 'COATZACOALCOS', '1964-09-30', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(245, 1, 4, '064', '2019-12-26', '1899-12-30', '1899-12-30', 'Francisco Javier', 'Ruiz ', 'Acopa', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, NULL, '67947355029', 'RUAF731004RC7', 'RUAF731004HVZZCR01', 2, 'VERACRUZ', '1973-10-04', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(246, 1, 4, '065', '2020-01-09', '1899-12-30', '1899-12-30', 'Aberlay', 'Leon', 'Galvez', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, NULL, '71915532429', 'LEGA550710262', 'LEGA550710HCSNLB00', 2, NULL, '1955-07-10', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(247, 1, 4, '066', '2020-01-16', '1899-12-30', '1899-12-30', 'David', 'Pena', 'Diaz', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, NULL, '43998080238', 'PEDD8012293G0', 'PEDD801229HVZNZV03', 2, NULL, '1980-12-29', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(248, 1, 4, '067', '2020-01-16', '1899-12-30', '1899-12-30', 'Deni', 'Jimenez', 'Reyes', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, NULL, '56160025906', 'JIRD001028BR6', 'JIRD001028HVZMYNA0', 2, NULL, '2000-10-28', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(249, 1, 4, '068', '2020-01-18', '1899-12-30', '1899-12-30', 'Ismael', 'Renero', 'Serena', 14, 5, 0.00, 123.22, 128.79, 8, NULL, NULL, 8, 5, NULL, 7, NULL, '65109294127', 'RESI920306E76', 'RESI920306HVZNRS05', 2, NULL, '1992-03-06', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `work_documentations`
--

CREATE TABLE `work_documentations` (
  `id` int(10) UNSIGNED NOT NULL,
  `work_id` int(11) UNSIGNED NOT NULL,
  `document_id` int(11) UNSIGNED NOT NULL,
  `other_name` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `work_shifts`
--

CREATE TABLE `work_shifts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `work_shifts`
--

INSERT INTO `work_shifts` (`id`, `name`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(7, 'Matutino', 4, NULL, NULL, NULL),
(8, 'Vespertino', 4, NULL, NULL, NULL),
(9, 'Nocturno', 4, NULL, NULL, NULL),
(10, 'Mixto', 4, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `work_states`
--

CREATE TABLE `work_states` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `description` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `work_states`
--

INSERT INTO `work_states` (`id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'PA', 'En proceso de alta', '2019-09-27 12:00:00', NULL, NULL),
(2, 'R', 'Proceso de reingreso', '2019-09-27 12:00:00', NULL, NULL),
(3, 'A', 'Activo', '2019-09-27 12:00:00', NULL, NULL),
(4, 'PB', 'Proceso de baja', '2019-09-27 12:00:00', NULL, NULL),
(5, 'B', 'Dado de baja', '2019-09-27 12:00:00', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `company_users`
--
ALTER TABLE `company_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `company_user_company_id_idx` (`company_id`),
  ADD KEY `company_users_user_id_fk_idx` (`user_id`);

--
-- Indexes for table `contract_types`
--
ALTER TABLE `contract_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `contract_types_company_id_fk_idx` (`company_id`);

--
-- Indexes for table `contribution_bases`
--
ALTER TABLE `contribution_bases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `contribution_bases_company_id_fk_idx` (`company_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `departments_company_id_fk_idx` (`company_id`);

--
-- Indexes for table `discount_types`
--
ALTER TABLE `discount_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `discount_types_company_id_fk_idx` (`company_id`);

--
-- Indexes for table `documentations`
--
ALTER TABLE `documentations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `employee_types`
--
ALTER TABLE `employee_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `employee_types_company_id_idx` (`company_id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `imss`
--
ALTER TABLE `imss`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `imss_file`
--
ALTER TABLE `imss_file`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `imss_impuesto`
--
ALTER TABLE `imss_impuesto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `imss_infonavit`
--
ALTER TABLE `imss_infonavit`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `imss_pago_impuesto`
--
ALTER TABLE `imss_pago_impuesto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `imss_pago_imss`
--
ALTER TABLE `imss_pago_imss`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `jobs_department_id_fk_idx` (`department_id`),
  ADD KEY `jobs_company_id_fk_idx` (`company_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nomina`
--
ALTER TABLE `nomina`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `nomina_dispersion`
--
ALTER TABLE `nomina_dispersion`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `nomina_dispersion_idx` (`nomina_id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`(191));

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `payment_methods_company_id_fk_idx` (`company_id`);

--
-- Indexes for table `payment_receipts`
--
ALTER TABLE `payment_receipts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `payment_receipts_transference1`
--
ALTER TABLE `payment_receipts_transference1`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `payment_receipts_transference2`
--
ALTER TABLE `payment_receipts_transference2`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `payment_receipts_xml`
--
ALTER TABLE `payment_receipts_xml`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `period_types`
--
ALTER TABLE `period_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `period_types_company_id_fk_idx` (`company_id`);

--
-- Indexes for table `sexs`
--
ALTER TABLE `sexs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `unionizeds`
--
ALTER TABLE `unionizeds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_group_id_fk_idx` (`group_id`),
  ADD KEY `uers_company_id_fk_idx` (`default_company_id`);

--
-- Indexes for table `works`
--
ALTER TABLE `works`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `workers_contact_type_id_fk_idx` (`contract_type_id`),
  ADD KEY `workers_period_type_id_fk_idx` (`period_type_id`),
  ADD KEY `workers_contribution_base_id_fk_idx` (`contribution_base_id`),
  ADD KEY `workers_department_id_fk_idx` (`department_id`),
  ADD KEY `workers_job_id_fk_idx` (`job_id`),
  ADD KEY `workers_employee_type_id_fk_idx` (`employee_type_id`),
  ADD KEY `workers_payment_id_fk_idx` (`payment_method_id`),
  ADD KEY `workers_work_shift_id_fk_idx` (`work_shift_id`),
  ADD KEY `workers_sex_id_fk_idx` (`sex_id`),
  ADD KEY `workers_discount_type_id_fk_idx` (`discount_type_id`),
  ADD KEY `works_company_id_fk_idx` (`company_id`),
  ADD KEY `works_work_status_id_fk_idx` (`work_status_id`);

--
-- Indexes for table `work_documentations`
--
ALTER TABLE `work_documentations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `worker_documentarion_worker_id_fk_idx` (`work_id`),
  ADD KEY `worker_documentation_documentation_id_fk_idx` (`document_id`);

--
-- Indexes for table `work_shifts`
--
ALTER TABLE `work_shifts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `work_shifts_company_id_fk_idx` (`company_id`);

--
-- Indexes for table `work_states`
--
ALTER TABLE `work_states`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `company_users`
--
ALTER TABLE `company_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `contract_types`
--
ALTER TABLE `contract_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `contribution_bases`
--
ALTER TABLE `contribution_bases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `discount_types`
--
ALTER TABLE `discount_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `documentations`
--
ALTER TABLE `documentations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employee_types`
--
ALTER TABLE `employee_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `imss`
--
ALTER TABLE `imss`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `imss_file`
--
ALTER TABLE `imss_file`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `imss_impuesto`
--
ALTER TABLE `imss_impuesto`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `imss_infonavit`
--
ALTER TABLE `imss_infonavit`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `imss_pago_impuesto`
--
ALTER TABLE `imss_pago_impuesto`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `imss_pago_imss`
--
ALTER TABLE `imss_pago_imss`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `nomina`
--
ALTER TABLE `nomina`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `nomina_dispersion`
--
ALTER TABLE `nomina_dispersion`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1612;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `payment_receipts`
--
ALTER TABLE `payment_receipts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment_receipts_transference1`
--
ALTER TABLE `payment_receipts_transference1`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment_receipts_transference2`
--
ALTER TABLE `payment_receipts_transference2`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payment_receipts_xml`
--
ALTER TABLE `payment_receipts_xml`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `period_types`
--
ALTER TABLE `period_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sexs`
--
ALTER TABLE `sexs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `unionizeds`
--
ALTER TABLE `unionizeds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `works`
--
ALTER TABLE `works`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=250;

--
-- AUTO_INCREMENT for table `work_documentations`
--
ALTER TABLE `work_documentations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `work_shifts`
--
ALTER TABLE `work_shifts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `work_states`
--
ALTER TABLE `work_states`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `company_users`
--
ALTER TABLE `company_users`
  ADD CONSTRAINT `company_user_company_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `company_users_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `contract_types`
--
ALTER TABLE `contract_types`
  ADD CONSTRAINT `contract_types_company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `contribution_bases`
--
ALTER TABLE `contribution_bases`
  ADD CONSTRAINT `contribution_bases_company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `discount_types`
--
ALTER TABLE `discount_types`
  ADD CONSTRAINT `discount_types_company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `employee_types`
--
ALTER TABLE `employee_types`
  ADD CONSTRAINT `employee_types_company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `jobs_company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `jobs_department_id_fk` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

--
-- Constraints for table `nomina_dispersion`
--
ALTER TABLE `nomina_dispersion`
  ADD CONSTRAINT `nomina_dispersion` FOREIGN KEY (`nomina_id`) REFERENCES `nomina` (`id`);

--
-- Constraints for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD CONSTRAINT `payment_methods_company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `period_types`
--
ALTER TABLE `period_types`
  ADD CONSTRAINT `period_types_company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `uers_company_id_fk` FOREIGN KEY (`default_company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `users_group_id_fk` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`);

--
-- Constraints for table `works`
--
ALTER TABLE `works`
  ADD CONSTRAINT `workers_contact_type_id_fk` FOREIGN KEY (`contract_type_id`) REFERENCES `contract_types` (`id`),
  ADD CONSTRAINT `workers_contribution_base_id_fk` FOREIGN KEY (`contribution_base_id`) REFERENCES `contribution_bases` (`id`),
  ADD CONSTRAINT `workers_department_id_fk` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `workers_discount_type_id_fk` FOREIGN KEY (`discount_type_id`) REFERENCES `discount_types` (`id`),
  ADD CONSTRAINT `workers_employee_type_id_fk` FOREIGN KEY (`employee_type_id`) REFERENCES `employee_types` (`id`),
  ADD CONSTRAINT `workers_job_id_fk` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`),
  ADD CONSTRAINT `workers_payment_id_fk` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_methods` (`id`),
  ADD CONSTRAINT `workers_period_type_id_fk` FOREIGN KEY (`period_type_id`) REFERENCES `period_types` (`id`),
  ADD CONSTRAINT `workers_sex_id_fk` FOREIGN KEY (`sex_id`) REFERENCES `sexs` (`id`),
  ADD CONSTRAINT `workers_work_shift_id_fk` FOREIGN KEY (`work_shift_id`) REFERENCES `work_shifts` (`id`),
  ADD CONSTRAINT `works_company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  ADD CONSTRAINT `works_work_status_id_fk` FOREIGN KEY (`work_status_id`) REFERENCES `work_states` (`id`);

--
-- Constraints for table `work_documentations`
--
ALTER TABLE `work_documentations`
  ADD CONSTRAINT `worker_documentarion_worker_id_fk` FOREIGN KEY (`work_id`) REFERENCES `works` (`id`),
  ADD CONSTRAINT `worker_documentation_documentation_id_fk` FOREIGN KEY (`document_id`) REFERENCES `documentations` (`id`);

--
-- Constraints for table `work_shifts`
--
ALTER TABLE `work_shifts`
  ADD CONSTRAINT `work_shifts_company_id_fk` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
