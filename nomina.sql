-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 16, 2019 at 08:25 AM
-- Server version: 5.6.41-84.1
-- PHP Version: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `consuoh7_esifiscal`
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
(1, 'Badak_2', 'Nacho Badak_6000', 'REPS890903975', '921 304 36 70', '2019-09-26 12:00:00', '2019-10-16 22:47:14', NULL),
(2, 'Badak', 'Nacho Badak', 'REPS890903975', '921 304 36 70', '2019-10-01 22:51:59', '2019-10-01 22:51:59', NULL);

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
(6, 10, 1, '2019-11-05 15:08:49', '2019-11-05 15:08:49', NULL),
(7, 11, 2, '2019-11-05 16:39:07', '2019-11-05 16:39:07', NULL),
(8, 12, 1, '2019-11-05 16:39:46', '2019-11-05 16:39:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contract_types`
--

CREATE TABLE `contract_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `contract_types`
--

INSERT INTO `contract_types` (`id`, `name`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(11, 'Tipo de Contrato Badak', 2, NULL, '2019-11-11 09:32:07', NULL),
(12, '01', 2, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contribution_bases`
--

CREATE TABLE `contribution_bases` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `contribution_bases`
--

INSERT INTO `contribution_bases` (`id`, `name`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 'F', 2, NULL, NULL, NULL),
(6, 'M', 2, NULL, NULL, NULL);

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

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'DIRECCION', 1, '2019-10-07 23:11:43', '2019-10-07 23:14:39', NULL),
(2, 'VENTAS', 1, '2019-10-07 23:12:04', '2019-10-07 23:12:04', NULL),
(3, 'CONTABILIDAD', 1, NULL, NULL, NULL),
(4, 'VENTAS', 2, NULL, '2019-10-19 23:02:27', NULL),
(5, 'CONTABILIDAD', 2, NULL, NULL, NULL),
(6, 'DIRECCION', 2, '2019-10-07 23:11:43', '2019-10-07 23:14:39', NULL),
(7, 'VENTAS', 2, '2019-10-07 23:12:04', '2019-10-07 23:12:04', NULL),
(8, 'CONTABILIDAD', 2, NULL, NULL, NULL);

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
(6, 'Tipos de descuento Badak', 2, NULL, NULL, NULL);

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
(4, 'Tipo de empleado Badak', 2, NULL, NULL, NULL),
(5, 'Sindicalizado', 1, NULL, NULL, NULL),
(6, 'S', 2, NULL, NULL, NULL);

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

--
-- Dumping data for table `imss`
--

INSERT INTO `imss` (`id`, `date`, `period`, `created_at`, `updated_at`, `deleted_at`) VALUES
(12, '10-12-2019', 'NOVIEMBRE', '2019-12-11 05:17:04', '2019-12-11 05:17:04', NULL);

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

--
-- Dumping data for table `imss_file`
--

INSERT INTO `imss_file` (`id`, `imss_id`, `name`, `file_url`, `created_at`, `updated_at`, `deleted_at`) VALUES
(11, 12, 'Aeroméxico.pdf', '186_1576041424.pdf', '2019-12-11 05:17:04', '2019-12-11 05:17:04', NULL);

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

--
-- Dumping data for table `imss_impuesto`
--

INSERT INTO `imss_impuesto` (`id`, `imss_id`, `name`, `file_url`, `created_at`, `updated_at`, `deleted_at`) VALUES
(8, '12', 'Aeroméxico.pdf', '119_1576041424.pdf', '2019-12-11 05:17:04', '2019-12-11 05:17:04', NULL);

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

--
-- Dumping data for table `imss_infonavit`
--

INSERT INTO `imss_infonavit` (`id`, `imss_id`, `name`, `file_url`, `created_at`, `updated_at`, `deleted_at`) VALUES
(9, 12, 'Aeroméxico.pdf', '23_1576041424.pdf', '2019-12-11 05:17:04', '2019-12-11 05:17:04', NULL);

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

--
-- Dumping data for table `imss_pago_impuesto`
--

INSERT INTO `imss_pago_impuesto` (`id`, `imss_id`, `name`, `file_url`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 12, 'Aeroméxico.pdf', '249_1576041424.pdf', '2019-12-11 05:17:04', '2019-12-11 05:17:04', NULL);

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

--
-- Dumping data for table `imss_pago_imss`
--

INSERT INTO `imss_pago_imss` (`id`, `imss_id`, `name`, `file_url`, `created_at`, `updated_at`, `deleted_at`) VALUES
(11, 12, 'Aeroméxico.pdf', '188_1576041424.pdf', '2019-12-11 05:17:04', '2019-12-11 05:17:04', NULL);

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

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `name`, `department_id`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 'DIRECTOR GENERAL', 6, 2, NULL, NULL, NULL),
(6, 'GERENTE DE VENTAS', 7, 2, NULL, NULL, NULL),
(7, 'CONTADOR GENERAL', 8, 2, NULL, NULL, NULL),
(8, 'DIRECTOR COMERCIAL', 6, 2, NULL, NULL, NULL),
(9, 'DIRECTOR DE FINANZAS', 6, 2, NULL, NULL, NULL);

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
(21, '2019-12-6', '1RA SEMANA DE DICIEMBRE', 'Desconocida', '2019-12-06 18:03:40', '2019-12-06 18:03:40', NULL);

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
(21, 21, 'DISPERSION SEM 49 ATIX.rar', '240_1575655420.rar', '2019-12-06 18:03:40', '2019-12-06 18:03:40', NULL);

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
('0210c0a25c0859d7c648ede6b28e5ec61614f9e0dcbd348146415c16685070edf112b3508bf0af4c', 1, 1, 'Personal Access Token', '[]', 0, '2019-10-17 02:27:47', '2019-10-17 02:27:47', '2020-10-16 21:27:47'),
('042d5b0027378061f5f654f70805888542005937e8ca0a6ea8c86aa4400dcf81edd2dd472a100b05', 1, 1, 'Personal Access Token', '[]', 0, '2019-11-19 15:04:26', '2019-11-19 15:04:26', '2020-11-19 09:04:26'),
('04c0cc8ebcf90403db3c698c1553b003c359bb7b50538a7c0d257d047dac92ba67ffb06c49acd188', 1, 1, 'Personal Access Token', '[]', 0, '2019-10-19 22:10:58', '2019-10-19 22:10:58', '2020-10-19 17:10:58'),
('04fc201d08a0be21e6e1386a2fd6a79011e4b4845cc7510b8bdf8ef5fa6764ce1a1c70507d2c5ebd', 1, 1, 'Personal Access Token', '[]', 0, '2019-11-05 17:48:35', '2019-11-05 17:48:35', '2020-11-05 11:48:35'),
('084bf432c0c4c7562ecb006e44a316d0f47de10f007c192f9c449277a2fac63c075e1ebcd5ba678f', 1, 1, 'Personal Access Token', '[]', 0, '2019-10-01 04:15:33', '2019-10-01 04:15:33', '2020-09-30 23:15:33'),
('092346046f299046c392ca50749c5dd8fd8c76143c0af50c81a8c55c75fc74f224b322bbf993cdcc', 1, 1, 'Personal Access Token', '[]', 0, '2019-10-19 22:09:28', '2019-10-19 22:09:28', '2020-10-19 17:09:28'),
('18d0a186f30aac118e3575217fcacb63427c3f5520dd2abb3e1726297fd3f3d517f89a6dfee708a0', 1, 1, 'Personal Access Token', '[]', 0, '2019-10-19 21:58:03', '2019-10-19 21:58:03', '2020-10-19 16:58:03'),
('1afa52043eff60e8ebe1dc25e66d9f5e374998204668356d5b39374105896935edd6477209e02220', 1, 1, 'Personal Access Token', '[]', 0, '2019-12-09 22:09:32', '2019-12-09 22:09:32', '2020-12-09 15:09:32'),
('28b94ab9f782c5530945b4ef2e96488c6dca8af987f5a5db07ffd5d4c79c3994059fd96a876688a7', 1, 1, 'Personal Access Token', '[]', 0, '2019-11-27 15:03:01', '2019-11-27 15:03:01', '2020-11-27 09:03:01'),
('2c52340407246d6b4d383e91907d91e00a07252a8b79215d6b1ab8ff19534b4c7f62a71382181f9e', 1, 1, 'Personal Access Token', '[]', 0, '2019-10-19 22:05:39', '2019-10-19 22:05:39', '2020-10-19 17:05:39'),
('34618b611059e08e00931daa0d85c64b8b8549e059fcbf9e375b5d90fa6985f8a6a56a44a81c0b8d', 1, 1, 'Personal Access Token', '[]', 0, '2019-12-04 15:50:32', '2019-12-04 15:50:32', '2020-12-04 09:50:32'),
('363e84527072ca6351d0755fdf64bfcb483bf68666b174ac2f3ca3c3b61fa53012415721b286a6cc', 1, 1, 'Personal Access Token', '[]', 0, '2019-10-12 21:33:14', '2019-10-12 21:33:14', '2020-10-12 16:33:14'),
('3762f226e6642e4ba80b199bd212d6e0f2d8c94fc5927f11902112c681650e5c4f72a26b27f7b6c9', 1, 1, 'Personal Access Token', '[]', 0, '2019-11-26 16:44:04', '2019-11-26 16:44:04', '2020-11-26 10:44:04'),
('38621b84643eaf739b46857f579dc8d82958ef392b5c69b6224ef1dbe819e9cc010d381b093f531a', 1, 1, 'Personal Access Token', '[]', 0, '2019-12-06 19:02:39', '2019-12-06 19:02:39', '2020-12-06 12:02:39'),
('444541f2c2dd5e4d83ad248780ecdbf0679743117d76e607551968b85126ca164c85b48794297286', 1, 1, 'Personal Access Token', '[]', 0, '2019-10-19 21:58:29', '2019-10-19 21:58:29', '2020-10-19 16:58:29'),
('4448fd631e8bc280c6b1666aa5fb5fbba45babe16fcd4362b72eba1c6a1c8228a3139d97cba1121e', 10, 1, 'Personal Access Token', '[]', 0, '2019-11-05 22:51:08', '2019-11-05 22:51:08', '2020-11-05 16:51:08'),
('488f7ced464001cc51538456af877531a2678c20f540ffd565ce6c00c165d78af36e6b7a7772f9ec', 1, 1, 'Personal Access Token', '[]', 0, '2019-11-28 18:36:30', '2019-11-28 18:36:30', '2020-11-28 12:36:30'),
('4b48290b1ba4fe14a91b3c79244ee55df679b422c702d223dd628e012973bed2d712f0e340cfa6ba', 1, 1, 'Personal Access Token', '[]', 0, '2019-10-19 22:09:04', '2019-10-19 22:09:04', '2020-10-19 17:09:04'),
('50c24c2748c51f5c4cb0d69df7b9bad939b4ca4145020b4bdd9b2bda5e5ebf68dd3568b1ae6a5586', 1, 1, 'Personal Access Token', '[]', 0, '2019-10-16 04:23:11', '2019-10-16 04:23:11', '2020-10-15 23:23:11'),
('545092440429b682cc5875eff548a85b6e4a081f29fca9009c6bfc0f084e30f4f1a75b9111a8d60c', 1, 1, 'Personal Access Token', '[]', 0, '2019-10-19 22:10:14', '2019-10-19 22:10:14', '2020-10-19 17:10:14'),
('556d93ca1935186ba3cbfb3ad53654dbf75da33ed7b6d7a1db1d52280a8b5bba92171ffcfc122fa4', 1, 1, 'Personal Access Token', '[]', 0, '2019-10-19 23:25:51', '2019-10-19 23:25:51', '2020-10-19 18:25:51'),
('558921367866f8c64ae7d0a5e28cbba8f38d9ce90bb816c8eb6940eb4efa5b1e6578f614fd5c587e', 1, 1, 'Personal Access Token', '[]', 0, '2019-12-14 20:12:11', '2019-12-14 20:12:11', '2020-12-14 13:12:11'),
('587a7021f4a1799080be1afd7a2d350d60ef8c0231a6c6c455f0a04760a363e346500a6bd1eb1984', 1, 1, 'Personal Access Token', '[]', 0, '2019-10-19 22:06:13', '2019-10-19 22:06:13', '2020-10-19 17:06:13'),
('5cad29189559635f140dcddedf64fdb42b3f075bfc62fde4c7a8abc5346d42f596f3a68536f32de5', 1, 1, 'Personal Access Token', '[]', 0, '2019-10-19 20:25:45', '2019-10-19 20:25:45', '2020-10-19 15:25:45'),
('6b541840866dd1b32b5e3d8b07d193fda3d50462e7911a4b9109077ceb26d6d01a16ba9401336f1a', 1, 1, 'Personal Access Token', '[]', 0, '2019-11-19 16:22:51', '2019-11-19 16:22:51', '2020-11-19 10:22:51'),
('750047fceb50ad1b4ef6179d3636739e953be07ad69ceaca23ff7016a9721fe00de57f6ff98a5a67', 1, 1, 'Personal Access Token', '[]', 0, '2019-11-26 02:21:16', '2019-11-26 02:21:16', '2020-11-25 20:21:16'),
('827645ea983e903585984358999cf28460f8a6334bb153fdc2279fcd64a85eebfba0ca7dce5c6290', 1, 1, 'Personal Access Token', '[]', 0, '2019-12-14 19:21:53', '2019-12-14 19:21:53', '2020-12-14 12:21:53'),
('866af9b515f3fce3c373b4b14f47feff59c74b9afd6c600a004c7ec2b47b8bf3c5dad56196ec6011', 1, 1, 'Personal Access Token', '[]', 0, '2019-10-20 15:28:10', '2019-10-20 15:28:10', '2020-10-20 10:28:10'),
('8e736948ffe348235190d605221d38d0266a2ab5bb0ed78b44a4d2da028e976278ba98e607771b4a', 1, 1, 'Personal Access Token', '[]', 0, '2019-10-19 22:10:26', '2019-10-19 22:10:26', '2020-10-19 17:10:26'),
('9094b5dcbedaeb6a9d9ffdfe8aa57d2671d69b3041403ba1bdee28dbdfe7ada3fd5ace2a9dc228f9', 1, 1, 'Personal Access Token', '[]', 0, '2019-10-19 21:53:42', '2019-10-19 21:53:42', '2020-10-19 16:53:42'),
('9329ea21d34e37377e3c63914b32d5f5dae8a4f6d38739e3855b22a58250167fe1d709d3939494d2', 1, 1, 'Personal Access Token', '[]', 0, '2019-11-21 01:53:41', '2019-11-21 01:53:41', '2020-11-20 19:53:41'),
('966a28159485b8e11672e19ab45e201cb58974f66ccaa4c1f303f2d2c190452dbfd80e9e9bc806ed', 1, 1, 'Personal Access Token', '[]', 0, '2019-10-19 21:53:14', '2019-10-19 21:53:14', '2020-10-19 16:53:14'),
('990b1e901660e77d972a1c00b05bb7fd4ace86cc0e76ffa68e2d1cc0a913b28de14a06bcab2f5911', 1, 1, 'Personal Access Token', '[]', 0, '2019-10-03 02:24:03', '2019-10-03 02:24:03', '2020-10-02 21:24:03'),
('9be0058a0c2b368d8d59bd1eeae138708b8c528be3e6ab323685c964f1fda41bec0dbc2b77a2a029', 1, 1, 'Personal Access Token', '[]', 0, '2019-10-19 21:52:29', '2019-10-19 21:52:29', '2020-10-19 16:52:29'),
('9cd724f606a64b2414dd4cfe9c71804f829518d804da1f8baf203a95ce030f9d5a2d0ed607cb8ea5', 1, 1, 'Personal Access Token', '[]', 0, '2019-11-11 15:30:29', '2019-11-11 15:30:29', '2020-11-11 09:30:29'),
('a4dfb0e12b156fa92a7be7becbdf9fbd4349c031cbe57835ecea2c065e3195c35ad08eb87f57fe3f', 1, 1, 'Personal Access Token', '[]', 0, '2019-10-20 18:58:05', '2019-10-20 18:58:05', '2020-10-20 13:58:05'),
('a8454c104eecc203e00b47aaa24f60432ae5785e950b07b1b3f76f055ee65994f478ee1c763fd884', 1, 1, 'Personal Access Token', '[]', 0, '2019-10-20 04:19:21', '2019-10-20 04:19:21', '2020-10-19 23:19:21'),
('af307c8fe7230a9b004273a8f3358c2a84d320fefca752a9d8ee2ce0df942fd78287f567676b5400', 1, 1, 'Personal Access Token', '[]', 0, '2019-11-26 15:10:06', '2019-11-26 15:10:06', '2020-11-26 09:10:06'),
('af984ca55c5bf5cbcd2a2f2006dfe57cb8e637c5a48dd022c7959c664d314ba20bfb63f64696edaf', 1, 1, 'Personal Access Token', '[]', 0, '2019-12-03 15:53:38', '2019-12-03 15:53:38', '2020-12-03 09:53:38'),
('b0b44fad3087ee6fd47c56de68681f732e81423174f279dda0d5a0aaea8b509f3ad773cb6b7efee4', 1, 1, 'Personal Access Token', '[]', 0, '2019-12-11 06:31:16', '2019-12-11 06:31:16', '2020-12-10 23:31:16'),
('b0ba372056e71bffe9a4648386c5fa00e1a22c6b9cdff38eff0a3286d9339cb0e0e53aad2cd3e2bd', 1, 1, 'Personal Access Token', '[]', 0, '2019-10-19 23:23:41', '2019-10-19 23:23:41', '2020-10-19 18:23:41'),
('b461298a9e072d38387d643b1c3ccaea07935f66da193bdcec40ed84e4bd82a5dcf564ef0e599d8c', 1, 1, 'Personal Access Token', '[]', 0, '2019-12-11 05:51:38', '2019-12-11 05:51:38', '2020-12-10 22:51:38'),
('bb99e4a54209cb3a26952af43a9bdebb1d7c90efc560959dd78170f40c735752a64affb5818ca1a8', 1, 1, 'Personal Access Token', '[]', 0, '2019-11-23 15:03:29', '2019-11-23 15:03:29', '2020-11-23 09:03:29'),
('c272d91b9821635826c85da13206b0235ea7c2f734360e233a65d3574631e203edfc403cef9551c1', 1, 1, 'Personal Access Token', '[]', 0, '2019-10-19 21:56:41', '2019-10-19 21:56:41', '2020-10-19 16:56:41'),
('cc6446354d8297f432e7be45645c418e278b84f5bf79eac9822831d3d39a6fcb6932fd04d7801a63', 1, 1, 'Personal Access Token', '[]', 0, '2019-12-15 06:10:08', '2019-12-15 06:10:08', '2020-12-14 23:10:08'),
('ce7b79990ced2ea13f976b816b3ca8cacc9d36f3c4173d167c58dad93bdcbad1d2f5fad46b8c0f96', 1, 1, 'Personal Access Token', '[]', 0, '2019-10-19 22:08:29', '2019-10-19 22:08:29', '2020-10-19 17:08:29'),
('d3a1f723259bb66c80fc463318416c1855278d6ed4f4a543db2a7ee1653931a6973d3206dbc163c4', 1, 1, 'Personal Access Token', '[]', 0, '2019-12-06 00:28:08', '2019-12-06 00:28:08', '2020-12-05 17:28:08'),
('d941c0f2f70ab44e3ecd8f1c6ee4cf4706f0e8d8812f4c7170201ac874f4507c1db2f466ecdf1acb', 1, 1, 'Personal Access Token', '[]', 0, '2019-11-28 21:52:25', '2019-11-28 21:52:25', '2020-11-28 15:52:25'),
('da69280385bc0feae1b8629cf098b83a7f30d400360db93368b2084dbb36f5a712091ac240b4b312', 1, 1, 'Personal Access Token', '[]', 0, '2019-12-07 19:45:23', '2019-12-07 19:45:23', '2020-12-07 12:45:23'),
('ddc0d3b7fcd63140d6e24b63c87cd5ab0cb5818e7f2426c0dde8e56540858f3a68e5998773c314c9', 1, 1, 'Personal Access Token', '[]', 0, '2019-11-20 02:56:29', '2019-11-20 02:56:29', '2020-11-19 20:56:29'),
('dea4841e34b24ad6156b616ef838c9b91ea55afda7193b9b5463390369c15d2945e76e7952863b93', 1, 1, 'Personal Access Token', '[]', 0, '2019-10-16 02:32:07', '2019-10-16 02:32:07', '2020-10-15 21:32:07'),
('e14311cd446d10653a0a4318a32af7ced7812a0ad8dcfac645f480e56be520070eab1d63c3ce27fe', 1, 1, 'Personal Access Token', '[]', 0, '2019-12-16 15:50:51', '2019-12-16 15:50:51', '2020-12-16 08:50:51'),
('e8ada755b859e66ef3f917acd3fc357d09c447363b48b5159d70132862e0461e82ead8005fb03776', 1, 1, 'Personal Access Token', '[]', 0, '2019-11-22 14:08:26', '2019-11-22 14:08:26', '2020-11-22 08:08:26'),
('ec5179ede1c7de0759321dda2de5557639446b410c7141f2756f84e7b517fabdc5260585bc4aa936', 1, 1, 'Personal Access Token', '[]', 0, '2019-10-19 01:17:59', '2019-10-19 01:17:59', '2020-10-18 20:17:59'),
('f171111cef7a24f5ad3a5f00ca6edb39709b2978042574075749cea6c0463c14bbe0a1b5d1e43efc', 1, 1, 'Personal Access Token', '[]', 0, '2019-12-11 06:18:23', '2019-12-11 06:18:23', '2020-12-10 23:18:23'),
('f219631518e88aab1c44e49e3566ab24b66aee23a59b158d95df22ee3842f70cdc6028388dfac5a8', 1, 1, 'Personal Access Token', '[]', 0, '2019-10-19 21:58:49', '2019-10-19 21:58:49', '2020-10-19 16:58:49'),
('fc2591d52f52f5f0fc5cef62ec4303863cdac34eac699148b1ae68307e4d3c29a819b06b355c05ab', 1, 1, 'Personal Access Token', '[]', 0, '2019-11-20 02:55:22', '2019-11-20 02:55:22', '2020-11-19 20:55:22'),
('ffafdc7f8bfb9bb901064d6277a8eb3ade91be68fce70a89d3f517684aec90e74d510d3ed8326c7b', 1, 1, 'Personal Access Token', '[]', 0, '2019-12-05 14:22:22', '2019-12-05 14:22:22', '2020-12-05 08:22:22');

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
(1, NULL, 'Laravel Personal Access Client', '2ekSXJVoXhyjROl4auzQAXjXn9u21q2UJZzMx7HR', 'http://localhost', 1, 0, 0, '2019-09-29 08:24:19', '2019-09-29 08:24:19'),
(2, NULL, 'Laravel Password Grant Client', 'RslPYXiBvZFosvxJY8Zs7oSQp3Bd73B0aKe6rOrb', 'http://localhost', 0, 1, 0, '2019-09-29 08:24:19', '2019-09-29 08:24:19');

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
(1, 1, '2019-09-29 08:24:19', '2019-09-29 08:24:19');

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
  `company_id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `company_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(18, '03', 2, NULL, NULL, NULL);

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

--
-- Dumping data for table `payment_receipts`
--

INSERT INTO `payment_receipts` (`id`, `date`, `period`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, '10-12-19', 'SEMANA 49', '2019-12-11 05:13:35', '2019-12-11 05:19:33', NULL);

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

--
-- Dumping data for table `payment_receipts_transference1`
--

INSERT INTO `payment_receipts_transference1` (`id`, `payment_receipt_id`, `name`, `file_url`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 5, 'Aeroméxico.pdf', '6_1576041215.pdf', '2019-12-11 05:13:35', '2019-12-11 05:13:35', NULL);

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

--
-- Dumping data for table `payment_receipts_transference2`
--

INSERT INTO `payment_receipts_transference2` (`id`, `payment_receipt_id`, `name`, `file_url`, `created_at`, `updated_at`, `deleted_at`) VALUES
(5, 5, 'Aeroméxico.pdf', '368_1576041573.pdf', '2019-12-11 05:19:33', '2019-12-11 05:19:33', NULL);

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

--
-- Dumping data for table `payment_receipts_xml`
--

INSERT INTO `payment_receipts_xml` (`id`, `payment_receipt_id`, `name`, `file_url`, `created_at`, `updated_at`, `deleted_at`) VALUES
(6, 5, 'carta propuesta Hector Partida.pdf', '191_1576041215.pdf', '2019-12-11 05:13:35', '2019-12-11 05:13:35', NULL);

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
(2, 'Quincenal', 2, NULL, NULL, NULL),
(3, 'Semanal', 1, NULL, NULL, NULL);

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
(1, 'H', NULL, NULL, NULL),
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
(1, 'S', 'Sindicalizado', NULL, NULL, NULL),
(2, 'C', 'Confianza', NULL, NULL, NULL);

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
(1, 'Samuel Regino Placido', 'samuel.regino@next-io.com', NULL, '$2y$10$lhfiQ4PxkL50BCPU4eYSS.JjkDom9MyeDDJcx1OtkZwnZFPzuc5aO', NULL, 4, 'avatar.png', 1, 1, '2019-10-01 03:22:22', '2019-10-20 05:15:35', NULL),
(9, 'Enrique Lopez', 'enrique.lopez@gmail.com', NULL, '$2y$10$/AFqRUTGCdBiYntHtluIneVNR4f4Ktqxt8b38wt/n4A7Hl68sOsOa', NULL, 4, 'avatar.png', 1, 1, '2019-11-05 21:08:06', '2019-11-05 21:08:06', NULL),
(10, 'Roberto Hernandez', 'roberto.hernandez@gmail.com', NULL, '$2y$10$g4O8tJyl4qKfJSk6IAskDuKt4uovNy2eF/csAvaKDLU6hffz1R/0W', NULL, 1, 'avatar.png', 1, 1, '2019-11-05 21:08:49', '2019-11-05 21:08:49', NULL),
(11, 'Esau Munive', 'esau.munive@gmail.com', NULL, '$2y$10$uMLfdIsfeXQbcV1eennY.u7ILU3YKC7hM2T40AyvbA5lKXEY.VAiy', NULL, 2, 'avatar.png', 2, 1, '2019-11-05 22:39:07', '2019-11-05 22:39:07', NULL),
(12, 'Josefa Ortiz', 'josefa.ortiz@gmail.com.mx', NULL, '$2y$10$amtLSazc3gIjKncgH8guaOPlWKlsAqk3tHPARTddTiw37FB4.z0kG', NULL, 3, 'avatar.png', 1, 1, '2019-11-05 22:39:46', '2019-11-05 22:39:46', NULL);

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
  `unionized_id` int(11) UNSIGNED DEFAULT NULL,
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
(148, 3, 1, '001', '2019-12-05', '1899-12-30', '1899-12-30', 'Fernando', 'Antonio', 'Luis', NULL, 3, NULL, '114.64', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, ' ', '67815752000', 'AOLF570618NW2', 'AOLF570618HVZNSR04', 2, ' ', '1957-06-18', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-14 23:10:56', '2019-12-14 23:10:56', NULL),
(149, 3, 1, '002', '2019-12-05', '1899-12-30', '1899-12-30', 'Miguel Angel', 'Arano', 'Lira', NULL, 3, NULL, '114.64', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, ' ', '67017714840', 'AALM770908E5A', 'AALM770908HVZRRG08', 2, ' ', '1977-09-08', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-14 23:10:56', '2019-12-14 23:10:56', NULL),
(150, 3, 1, '003', '2019-12-05', '1899-12-30', '1899-12-30', 'Victor Alfonso', 'Avelino', 'Fonseca', NULL, 3, NULL, '114.63', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, ' ', '14169868347', 'AEFV980331SD0', 'AEFV980331HVZVNC06', 2, ' ', '1998-03-31', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-14 23:10:56', '2019-12-14 23:10:56', NULL),
(151, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-14 23:10:56', '2019-12-14 23:10:56', NULL),
(152, 1, 2, '100', '2019-12-14', NULL, NULL, 'DAVID', 'REYES', 'HERNANDEZ', 11, 2, '500.00', '200.00', '250.00', 5, 4, NULL, 4, NULL, 18, 5, NULL, '32131321231321', 'REHD820323S11', 'REHD820323SS1', 1, 'COATZACOALCOS', '1982-03-23', NULL, NULL, NULL, 'JAGUARES No 2108', NULL, 'Veracruz', '96536', '9212654104', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '346_1576387136.pdf', '294_1576387136.pdf', '393_1576387136.pdf', '194_1576387159.pdf', '319_1576387159.pdf', NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-14 23:20:09', NULL),
(153, 5, 2, '101', '2019-12-14', NULL, NULL, 'DIANA', 'ZAMORA', 'PEREZ', 11, 2, '300.00', '250.00', '325.55', 5, 4, NULL, 4, NULL, 18, 5, '2656', '5151515151', 'ZAPD810513Z5D', 'ZAPD810513', 1, NULL, '1981-05-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '321_1576387340.pdf', '222_1576387340.pdf', '309_1576387340.pdf', '327_1576387365.pdf', '115_1576387365.pdf', NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-14 23:26:13', NULL),
(154, 3, 2, '001', '2019-12-05', '1899-12-30', '1899-12-30', 'Fernando', 'Antonio', 'Luis', 12, NULL, NULL, '114.64', NULL, 5, NULL, NULL, NULL, 1, 18, 5, ' ', '67815752000', 'AOLF570618NW2', 'AOLF570618HVZNSR04', 2, ' ', '1957-06-18', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'david.rehd@hotmail.com', '789456321002021', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-14 23:48:18', '2019-12-14 23:48:18', NULL),
(155, 3, 2, '002', '2019-12-05', '1899-12-30', '1899-12-30', 'Miguel Angel', 'Arano', 'Lira', 12, NULL, NULL, '114.64', NULL, 5, NULL, NULL, NULL, 1, 18, 5, ' ', '67017714840', 'AALM770908E5A', 'AALM770908HVZRRG08', 2, ' ', '1977-09-08', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'david.rehd@hotmail.com', '789456321002021', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-14 23:48:18', '2019-12-14 23:48:18', NULL),
(156, 4, 2, '003', '2019-12-05', '1899-12-30', '1899-12-30', 'Victor Alfonso', 'Avelino', 'Fonseca', 12, NULL, NULL, '114.63', NULL, 5, NULL, NULL, NULL, 1, 18, 5, ' ', '14169868347', 'AEFV980331SD0', 'AEFV980331HVZVNC06', 2, ' ', '1998-03-31', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'david.rehd@hotmail.com', '789456321002021', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-14 23:48:18', '2019-12-16 08:51:51', NULL),
(157, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-12-14 23:48:18', '2019-12-14 23:48:18', NULL);

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
(5, 'Matutino', 2, NULL, NULL, NULL);

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
  ADD KEY `works_work_status_id_fk_idx` (`work_status_id`),
  ADD KEY `unionized_id` (`unionized_id`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `company_users`
--
ALTER TABLE `company_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `contract_types`
--
ALTER TABLE `contract_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `contribution_bases`
--
ALTER TABLE `contribution_bases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `discount_types`
--
ALTER TABLE `discount_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `documentations`
--
ALTER TABLE `documentations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employee_types`
--
ALTER TABLE `employee_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `nomina`
--
ALTER TABLE `nomina`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `nomina_dispersion`
--
ALTER TABLE `nomina_dispersion`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sexs`
--
ALTER TABLE `sexs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `unionizeds`
--
ALTER TABLE `unionizeds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `works`
--
ALTER TABLE `works`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `work_documentations`
--
ALTER TABLE `work_documentations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `work_shifts`
--
ALTER TABLE `work_shifts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
