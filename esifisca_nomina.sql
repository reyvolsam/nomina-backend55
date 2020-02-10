-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 10, 2020 at 08:49 AM
-- Server version: 5.7.23-23
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
(13, 16, 4, '2020-02-08 11:47:49', '2020-02-08 11:47:49', NULL);

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
(1, '8-2-2020', 'Semana 6', 'Indheca', '2020-02-08 19:34:37', '2020-02-08 19:34:37', NULL);

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
(1, 1, 'Acuse_Certificado_Digital.pdf', '462_1581190477.pdf', '2020-02-08 19:34:37', '2020-02-08 19:34:37', NULL);

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
('08d02b6bc28ee0b64b9af463f5d1255a006619d58ce4286dbd75b727406a7dcfc143df2b2f34eb35', 16, 3, 'Personal Access Token', '[]', 0, '2020-02-08 20:33:42', '2020-02-08 20:33:42', '2021-02-08 13:33:42'),
('097ac1a990c76334c206ddd2402b6a0d07220ee40276734a801d7afca99ffc5a2a6fc8eccc45489e', 13, 3, 'Personal Access Token', '[]', 0, '2019-12-19 04:57:21', '2019-12-19 04:57:21', '2020-12-18 21:57:21'),
('0e4eb93a0f72c4c6fcb676f4ef5bff262f32c553f056e8af153672045cdd34448ddd74761c2ab3cb', 1, 3, 'Personal Access Token', '[]', 0, '2020-01-22 16:33:48', '2020-01-22 16:33:48', '2021-01-22 09:33:48'),
('2462a959a87caa13cad7b3b489cadd3ab178f855798c44203a0324ecfa48bbe1a0832336f8142341', 1, 3, 'Personal Access Token', '[]', 0, '2019-12-26 17:18:45', '2019-12-26 17:18:45', '2020-12-26 10:18:45'),
('269d52cbe0d30584e412d335d475de66444c47483abe831df29f0ac5411e7ce87d3e8bdfd680f11f', 13, 3, 'Personal Access Token', '[]', 0, '2020-02-04 17:50:01', '2020-02-04 17:50:01', '2021-02-04 10:50:01'),
('294537b22e16a128bf679a1f417ecfff5d2e00e3c9e7e308d0fe0c7a3563731ee6ab9476cca3a2f1', 1, 3, 'Personal Access Token', '[]', 0, '2019-12-19 05:54:05', '2019-12-19 05:54:05', '2020-12-18 22:54:05'),
('2fa9af95288333413b2d82c07eb8b0afbeca35c506b200cc6045b79bea07c26a3c8378c531b2a3be', 1, 3, 'Personal Access Token', '[]', 0, '2020-02-05 00:11:57', '2020-02-05 00:11:57', '2021-02-04 17:11:57'),
('3dbf9bd3673be22514befedb260d75fa68eb5e51e238dccd873d70978903e746df87343397a3f0a9', 13, 3, 'Personal Access Token', '[]', 0, '2020-01-21 23:35:08', '2020-01-21 23:35:08', '2021-01-21 16:35:08'),
('3f8052d24a3c234755ee112f0de411db87003b8a2e3793105e7b640a603fe1a96179dfdbb1899eb6', 13, 3, 'Personal Access Token', '[]', 0, '2019-12-21 06:34:43', '2019-12-21 06:34:43', '2020-12-20 23:34:43'),
('486e887cae342e16547b3065ee2b5f07c3a635365eddcecc361f7589ae9fdbcf31e526b8e742642e', 1, 3, 'Personal Access Token', '[]', 0, '2019-12-19 07:09:54', '2019-12-19 07:09:54', '2020-12-19 00:09:54'),
('4e4af9013d27e1b4fd7603e79cb929e3a089046f95826cc5992b9e0aff74acaa91382d0924cc4fad', 13, 3, 'Personal Access Token', '[]', 0, '2019-12-26 18:08:31', '2019-12-26 18:08:31', '2020-12-26 11:08:31'),
('580c451c3f14c3405dc8ab455e4da56e5fe286aa38a142ed1ccbb03897f850b2334cca0fa0f7dc7b', 13, 3, 'Personal Access Token', '[]', 0, '2019-12-27 08:06:59', '2019-12-27 08:06:59', '2020-12-27 01:06:59'),
('676cffda756957aff97fc4ed75d17974af6e11a42d3f114d807a9908fa9b8c6e58ecf3d6f1bb7c09', 13, 3, 'Personal Access Token', '[]', 0, '2020-02-07 05:49:50', '2020-02-07 05:49:50', '2021-02-06 22:49:50'),
('6b2a3534ffa0e0d445edefa87a2a9f4ba1b11c232f1e7dc45dd38c90ed59cd16518b82888ce25dfd', 13, 3, 'Personal Access Token', '[]', 0, '2020-02-06 20:28:29', '2020-02-06 20:28:29', '2021-02-06 13:28:29'),
('73bb7cff7d7c75cd6f0741e503ad9c7745792e8e40001434568dd39277ec471f6d2249cd90ee3c0c', 13, 3, 'Personal Access Token', '[]', 0, '2020-02-06 07:16:14', '2020-02-06 07:16:14', '2021-02-06 00:16:14'),
('75815467e227a7a9ac3d8f7fd24d4b760d27d499981864c9e3fe8e49c22a69320f8436dd8d5d79c1', 13, 3, 'Personal Access Token', '[]', 0, '2020-02-06 19:31:39', '2020-02-06 19:31:39', '2021-02-06 12:31:39'),
('7dfb5bd0014ea1cd94af6ac38cc5ded77404b94e3fe09b21c2947f382ca9d68e78e1c61e3cf85575', 13, 3, 'Personal Access Token', '[]', 0, '2019-12-25 08:35:30', '2019-12-25 08:35:30', '2020-12-25 01:35:30'),
('7e6e53164ce8027c774c74961eec2f5d19f375432a8a640555ae5bd71ce52b5ac4c1c571da7497dc', 1, 3, 'Personal Access Token', '[]', 0, '2019-12-21 19:25:35', '2019-12-21 19:25:35', '2020-12-21 12:25:35'),
('8406f65aa0e138d08ac989035e1e7bdc9ddba2503d573082c6c1248ad539420f60371beb7572e815', 13, 3, 'Personal Access Token', '[]', 0, '2020-01-21 23:40:57', '2020-01-21 23:40:57', '2021-01-21 16:40:57'),
('84cd283ea8c49b21248ec242c80597663f3658cb3ce58f674813cf51dd2727b37e740a1f9099f6c0', 14, 3, 'Personal Access Token', '[]', 0, '2020-02-08 04:28:52', '2020-02-08 04:28:52', '2021-02-07 21:28:52'),
('8a47ea2f2f63af15666c51259e518904ae2a1158e81a744a4d864d6dbed96ee43fd7b262bcd4b65d', 13, 3, 'Personal Access Token', '[]', 0, '2020-02-05 00:22:23', '2020-02-05 00:22:23', '2021-02-04 17:22:23'),
('8dd64669f8f5ad6f949ec9acb0332feef4f7c72f91563f6d0127a9dc887044156b993b45c3d35fd0', 1, 3, 'Personal Access Token', '[]', 0, '2019-12-19 19:04:14', '2019-12-19 19:04:14', '2020-12-19 12:04:14'),
('914537ff8d178c9ad75fa5197b5e69b4ef0e6f669acb04104d7bf51db6bd55e0ad5b6b4e11682731', 13, 3, 'Personal Access Token', '[]', 0, '2020-01-21 23:41:39', '2020-01-21 23:41:39', '2021-01-21 16:41:39'),
('968721766e17dcbf26413b93f37d785860cbb609522bb299ece07b2606a12be8e1d2bfa9476679e6', 1, 3, 'Personal Access Token', '[]', 0, '2019-12-18 20:36:49', '2019-12-18 20:36:49', '2020-12-18 13:36:49'),
('9bf6015bdc3504cad30ac8f9fd51943865d2d5fc785b19a2d340e1e0b6f3d4c5d50ff7c070ef15e3', 1, 3, 'Personal Access Token', '[]', 0, '2019-12-18 06:10:38', '2019-12-18 06:10:38', '2020-12-17 23:10:38'),
('9c0a5d498bf1d04fd59d4e5f4773900d44251d40447b89c8cd1719ef62c64842c99c695fb7476d8a', 1, 3, 'Personal Access Token', '[]', 0, '2019-12-19 06:37:18', '2019-12-19 06:37:18', '2020-12-18 23:37:18'),
('9f9d115fa485d2ac146ed10de7ff79b36ccb01e988473ece6b37b271818acce25cfbea68e81ac5ae', 13, 3, 'Personal Access Token', '[]', 0, '2019-12-21 02:33:25', '2019-12-21 02:33:25', '2020-12-20 19:33:25'),
('a217b704d27c69310d1fa5670384f49ab6ab381241441bb976f08e42697900d733630bd16ad4e367', 13, 3, 'Personal Access Token', '[]', 0, '2020-01-18 18:42:25', '2020-01-18 18:42:25', '2021-01-18 11:42:25'),
('a361027161136ebedbf59aab90166af2387d67cf31483ddaadd18bbbefe86728f6404c9bf5022c56', 13, 3, 'Personal Access Token', '[]', 0, '2019-12-19 19:59:57', '2019-12-19 19:59:57', '2020-12-19 12:59:57'),
('a8c511cee82e40ec2e77dea5738c3b4549d82b71043a9387a4123967a58064c098713011a2b964f1', 1, 3, 'Personal Access Token', '[]', 0, '2019-12-19 07:17:48', '2019-12-19 07:17:48', '2020-12-19 00:17:48'),
('a97b0420efb24e69810b8127f026acf581e1151006a7c96151ddddb5f207d77cd940e9b36aea87be', 13, 3, 'Personal Access Token', '[]', 0, '2019-12-21 06:43:30', '2019-12-21 06:43:30', '2020-12-20 23:43:30'),
('aa3a413764032199e2bc8f651b076ad0d15bb248f0acb9c5cc04c427355a6d91c2c8c339c6ec44ab', 13, 3, 'Personal Access Token', '[]', 0, '2019-12-23 07:30:55', '2019-12-23 07:30:55', '2020-12-23 00:30:55'),
('aeff83d92bafc4ede84f2ab9e036acb01873cf382d2c5ba8d7256bd022735dc7696287702e94001e', 13, 3, 'Personal Access Token', '[]', 0, '2020-02-05 00:15:18', '2020-02-05 00:15:18', '2021-02-04 17:15:18'),
('bb4fc206afa0420b0f45e40938d3d80b680fc968a8bf4306e320bb25d6b15880daa0e5e6aaf0a1fe', 13, 3, 'Personal Access Token', '[]', 0, '2019-12-27 08:16:55', '2019-12-27 08:16:55', '2020-12-27 01:16:55'),
('bcf90b856591906578eda4bec1a712132b83b61bfee0f8342903fc7d91084dc37b6a03e4fa54e224', 13, 3, 'Personal Access Token', '[]', 0, '2020-01-22 16:35:44', '2020-01-22 16:35:44', '2021-01-22 09:35:44'),
('d38c35ad84f8d4d192f693538041932cf4a654374bfe6c04643bce0dd6999fe3a81a72b7e55efbbe', 13, 3, 'Personal Access Token', '[]', 0, '2019-12-23 20:12:02', '2019-12-23 20:12:02', '2020-12-23 13:12:02'),
('d6a35012a0b5405847371c6cf9a353595cdac66abc01b034c8a5a28fbe1f6ea3fa96862cc83c8135', 1, 3, 'Personal Access Token', '[]', 0, '2019-12-19 07:20:13', '2019-12-19 07:20:13', '2020-12-19 00:20:13'),
('da0d8cab083bbe8b528d9048e458bf57f255196d433268892f359a80b564a40b000cca6e2dd35972', 1, 3, 'Personal Access Token', '[]', 0, '2020-01-22 06:19:53', '2020-01-22 06:19:53', '2021-01-21 23:19:53'),
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
(16, 'Rodiver Robles', 'rodiver.robles@esifiscal.com.mx', NULL, '$2y$10$Hnvi1G7hOiL/cUquQuj7U.Q8T65K5Cv1MnXhf9PeZO7bPY5/OSfm2', NULL, 1, 'avatar.png', NULL, 1, '2020-02-08 18:47:49', '2020-02-08 18:47:49', NULL);

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
(185, 1, 4, '042', '2019-12-05', '1899-12-30', '1899-12-30', 'Jorge Luis', 'Dominguez', 'Leyva', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, 23, 7, NULL, '04169682798', 'DOLJ9610274Q3', 'DOLJ961027HVZMYR01', 2, 'VERACRUZ', '1996-10-27', '0', NULL, NULL, NULL, NULL, 'VER', '0', NULL, NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:05', '2020-01-21 17:39:36', NULL),
(186, 1, 4, '043', '2019-12-05', '1899-12-30', '1899-12-30', 'Mario', 'Torres', 'Borbonio', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, NULL, '65937428111', 'TOBM740722AH4', 'TOBM740722HVZRRR02', 2, 'VERACRUZ', '1974-07-22', '0', NULL, NULL, NULL, NULL, 'VER', '0', NULL, NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:05', '2020-01-21 17:36:05', NULL),
(187, 1, 4, '044', '2019-12-05', '1899-12-30', '1899-12-30', 'Jorge Luis', 'Carmona', 'Amaya', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, NULL, '10190077668', 'CAAJ000226JF6', 'CAAJ000226HVZRMRA5', 2, 'VERACRUZ', '2000-02-26', '0', NULL, NULL, NULL, NULL, 'VER', '0', NULL, NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:05', '2020-01-21 17:36:05', NULL),
(188, 1, 4, '045', '2019-12-05', '1899-12-30', '1899-12-30', 'Joaquin', 'Aquino', 'Perez', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, 23, 7, NULL, '65997414944', 'AUPJ7407037Z1', 'AUPJ740703HOCQRQ07', 2, 'OAXACA', '1974-07-03', '0', NULL, NULL, NULL, NULL, 'VER', '0', NULL, NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:05', '2020-01-21 17:36:05', NULL),
(189, 1, 4, '046', '2019-12-05', '1899-12-30', '1899-12-30', 'Leonel', 'Lopez ', 'Velazquez ', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, NULL, '83037701857', 'LOVL770203I69', 'LOVL770203HTCPLN01', 2, NULL, '1977-02-03', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:05', '2020-01-21 17:36:05', NULL),
(190, 1, 4, '047', '2019-12-05', '1899-12-30', '1899-12-30', 'Roberto', 'Flores', 'Fernandez', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, NULL, '65107301270', 'FOFR730705S1A', 'FOFR730705HVZLRB00', 2, NULL, '1973-07-05', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:05', '2020-01-21 17:36:05', NULL),
(191, 1, 4, '048', '2019-12-05', '1899-12-30', '1899-12-30', 'Hilario', 'Mozo', 'Quino', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, NULL, '01137878623', 'MOQH7810216P5', 'MOQH781021HVZZNL08', 2, NULL, '1978-10-21', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(192, 1, 4, '049', '2019-12-05', '1899-12-30', '1899-12-30', 'Luis Alberto', 'Ortiz', 'Avendaño', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, NULL, '65119157991', 'OIAL910930PC1', 'OIAL910930HVZRVS00', 2, NULL, '1991-09-30', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(193, 1, 4, '050', '2019-12-05', '1899-12-30', '1899-12-30', 'Lauro', 'Salomon', 'Caballero', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, 23, 7, NULL, '65927329253', 'SACL7301069H6', 'SACL730106HVZLBR00', 2, NULL, '1973-01-06', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(194, 1, 4, '051', '2019-12-05', '1899-12-30', '1899-12-30', 'Yazmin', 'Sustersik', 'Lopez', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, NULL, '67129243779', 'SULY921206MI1', 'SULY921206MVZSPZ07', 1, NULL, '1992-12-06', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(195, 1, 4, '052', '2019-12-05', '1899-12-30', '1899-12-30', 'Alejandro', 'Retama', 'Munive', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, NULL, '67048004773', 'REMA800518I19', 'REMA800518HHGTNL01', 2, NULL, '1980-05-18', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(196, 1, 4, '053', '2019-12-05', '1899-12-30', '1899-12-30', 'Benito', 'Huesca', 'Garcia', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, 23, 7, NULL, '65927531916', 'HUGB7503212U7', 'HUGB750321HVZSRN09', 2, NULL, '1975-03-21', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(197, 1, 4, '054', '2019-12-05', '1899-12-30', '1899-12-30', 'Hugo Alberto', 'Bolaños', 'Palacios', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, 23, 7, NULL, '65907236825', 'BOPH720302CK9', 'BOPH720302HVZLLG08', 2, NULL, '1972-03-02', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(198, 1, 4, '056', '2019-12-05', '1899-12-30', '1899-12-30', 'Jaime Rafael', 'Nolasco', 'Salgado', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, NULL, '65836801442', 'NOSJ681119651', 'NOSJ681119HVZLLM09', 2, NULL, '1968-11-19', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(199, 1, 4, '001', '2019-12-05', '1899-12-30', '1899-12-30', 'Fernando', 'Antonio', 'Luis', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67815752000', 'AOLF570618NW2', 'AOLF570618HVZNSR04', 2, ' ', '1957-06-18', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(200, 1, 4, '002', '2019-12-05', '1899-12-30', '1899-12-30', 'Miguel Angel', 'Arano', 'Lira', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67017714840', 'AALM770908E5A', 'AALM770908HVZRRG08', 2, ' ', '1977-09-08', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(201, 1, 4, '003', '2019-12-05', '1899-12-30', '1899-12-30', 'Victor Alfonso', 'Avelino', 'Fonseca', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '14169868347', 'AEFV980331SD0', 'AEFV980331HVZVNC06', 2, ' ', '1998-03-31', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(202, 1, 4, '004', '2019-12-05', '1899-12-30', '1899-12-30', 'Silvano', 'Barba', 'Estevez', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '65654710956', 'BAES4711189P7', 'BAES471118HVZRSL06', 2, ' ', '1947-11-18', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(203, 1, 4, '005', '2019-12-05', '1899-12-30', '1899-12-30', 'Rusbel', 'Cabrera', 'Morales', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67816651607', 'CAMR660130FG3', 'CAMR660130HOCBRS02', 2, ' ', '1966-01-30', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(204, 1, 4, '006', '2019-12-05', '1899-12-30', '1899-12-30', 'Julio Cesar', 'Chacon', 'Campos', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67088953285', 'CACJ891112DT2', 'CACJ891112HVZHML05', 2, ' ', '1989-11-12', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(205, 1, 4, '007', '2019-12-05', '1899-12-30', '1899-12-30', 'Jairo Ivan', 'Cruz', 'Hernandez', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '70149542030', 'CUHJ9510081WA', 'CUHJ951008HVZRRR03', 2, ' ', '1995-10-08', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(206, 1, 4, '008', '2019-12-05', '1899-12-30', '1899-12-30', 'Javier', 'Degollado', 'Avelino', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67047400014', 'DEAJ740625DC8', 'DEAJ740625HVZGBV06', 2, ' ', '1974-06-25', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(207, 1, 4, '009', '2019-12-05', '1899-12-30', '1899-12-30', 'Juan Manuel', 'Diaz', 'Flores', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67139502701', 'DIFJ950310AR9', 'DIFJ950310HVZZLN02', 2, ' ', '1995-03-10', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(208, 1, 4, '010', '2019-12-05', '1899-12-30', '1899-12-30', 'Jose Manuel', 'Dionicio', 'Chacon', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67997907869', 'DICM7909127H7', 'DICM790912HVZNHN08', 2, ' ', '1979-09-12', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(209, 1, 4, '011', '2019-12-05', '1899-12-30', '1899-12-30', 'Francisco', 'Dolores', 'Hipolito', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67765500722', 'DOHF5601106R6', 'DOHF560110HVZLPR06', 2, ' ', '1956-01-10', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(210, 1, 4, '012', '2019-12-05', '1899-12-30', '1899-12-30', 'Juan Jose', 'Dominguez', 'Celaya', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67907157019', 'DOCJ710416TN5', 'DOCJ710416HOCMLN09', 2, ' ', '1971-04-16', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(211, 1, 4, '013', '2019-12-05', '1899-12-30', '1899-12-30', 'Joel', 'Evia', 'Mendoza', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '83937414791', 'EIMJ740426L34', 'EIMJ740426HTCVNL04', 2, ' ', '1974-04-26', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(212, 1, 4, '014', '2019-12-05', '1899-12-30', '1899-12-30', 'Daniel Ivan', 'Fernandez', 'Naguatt', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67968159938', 'FEND810329HT0', 'FEND810329HVZRGN01', 2, ' ', '1981-03-29', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(213, 1, 4, '015', '2019-12-05', '1899-12-30', '1899-12-30', 'Santiago', 'Gonzalez', 'Jeronimo', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '83037807076', 'GOJS7809262A6', 'GOJS780926HTCNRN09', 2, ' ', '1978-09-26', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(214, 1, 4, '016', '2019-12-05', '1899-12-30', '1899-12-30', 'Maximino', 'Gonzalez', 'Toto', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '07907312321', 'GOTM731217I2A', 'GOTM731217HVZNTZ00', 2, ' ', '1973-12-17', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(215, 1, 4, '017', '2019-12-05', '1899-12-30', '1899-12-30', 'Jesus Alberto', 'Guillen', 'Velasco', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '65129306075', 'GUVJ9308158V9', 'GUVJ930815HVZLLS08', 2, ' ', '1993-08-15', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(216, 1, 4, '018', '2019-12-05', '1899-12-30', '1899-12-30', 'Julio Cesar', 'Guzman', 'Bosquez', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67887090511', 'GUBJ700730NS6', 'GUBJ700730HVZZSL04', 2, ' ', '1970-07-30', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(217, 1, 4, '019', '2019-12-05', '1899-12-30', '1899-12-30', 'Hector Manuel', 'Guzman', 'Flores', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '78967640679', 'GUFH761001PI4', 'GUFH761001HVZZLC07', 2, ' ', '1976-10-01', '0', ' ', ' ', NULL, ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(218, 1, 4, '021', '2019-12-05', '1899-12-30', '1899-12-30', 'Daniel Cecilio', 'Hernandez', 'Tenorio', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '65967300883', 'HETD731122KG8', 'HETD731122HVZRNN06', 2, ' ', '1973-11-22', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(219, 1, 4, '022', '2019-12-05', '1899-12-30', '1899-12-30', 'Marcos', 'Lopez', 'Cervantes', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67068608453', 'LOCM8612052X8', 'LOCM861205HVZPRR04', 2, ' ', '1986-12-05', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(220, 1, 4, '023', '2019-12-05', '1899-12-30', '1899-12-30', 'Leonardo', 'Lopez', 'Estrada', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67089110331', 'LOEL910624LI1', 'LOEL910624HVZPSN06', 2, ' ', '1991-06-24', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(221, 1, 4, '024', '2019-12-05', '1899-12-30', '1899-12-30', 'Raymundo', 'Lopez', 'Luna', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67917387234', 'LOLR730228JL7', 'LOLR730228HVZPNY07', 2, ' ', '1973-02-28', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(222, 1, 4, '025', '2019-12-05', '1899-12-30', '1899-12-30', 'Fernando', 'Mayo', 'Cruz', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '65947133610', 'MACF710816GW7', 'MACF710816HVZYRR07', 2, ' ', '1971-08-16', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(223, 1, 4, '026', '2019-12-05', '1899-12-30', '1899-12-30', 'Irving', 'Mendez', 'Arias', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67018508597', 'MEAI850323M14', 'MEAI850323HVZNRR02', 2, ' ', '1985-03-23', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(224, 1, 4, '027', '2019-12-05', '1899-12-30', '1899-12-30', 'Jimmy Humberto', 'Mendez', 'Pineda', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67078101838', 'MEPJ810227562', 'MEPJ810227HVZNNM06', 2, ' ', '1981-02-27', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(225, 1, 4, '028', '2019-12-05', '1899-12-30', '1899-12-30', 'Hector', 'Molina', 'Lopez', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '71008025224', 'MOLH801118HJ1', 'MOLH801118HCSLPC02', 2, ' ', '1980-11-18', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(226, 1, 4, '029', '2019-12-05', '1899-12-30', '1899-12-30', 'Alberto', 'Obil', 'Quino', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '65129102789', 'OIQA9103209X5', 'OIQA910320HVZBNL04', 2, ' ', '1991-03-20', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(227, 1, 4, '030', '2019-12-05', '1899-12-30', '1899-12-30', 'Raul', 'Perez', 'Flores', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67968052950', 'PEFR800525BKA', 'PEFR800525HTCRLL07', 2, ' ', '1980-05-25', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(228, 1, 4, '031', '2019-12-05', '1899-12-30', '1899-12-30', 'Alejandro', 'Rios', 'Vigil', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67088924286', 'RIVA890222GL2', 'RIVA890222HVZSGL01', 2, ' ', '1989-02-22', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:06', '2020-01-21 17:36:06', NULL),
(229, 1, 4, '032', '2019-12-05', '1899-12-30', '1899-12-30', 'Julio Cesar', 'Serdan', 'Castellanos', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67856653349', 'SECJ680818TF9', 'SECJ680818HVZRSL00', 2, ' ', '1968-08-18', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(230, 1, 4, '033', '2019-12-05', '1899-12-30', '1899-12-30', 'Ignacio Manuel', 'Tenorio', 'Vazquez', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67927370394', 'TEVI730216TI9', 'TEVI730216HVZNZG04', 2, ' ', '1973-02-16', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(231, 1, 4, '034', '2019-12-05', '1899-12-30', '1899-12-30', 'Erick Gerardo', 'Tornado', 'Gonzalez', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67129234109', 'TOGE921029ME4', 'TOGE921029HVZRNR02', 2, ' ', '1992-10-29', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(232, 1, 4, '035', '2019-12-05', '1899-12-30', '1899-12-30', 'Sergio', 'Torres', 'Sanchez', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '78725202416', 'TOSS5209092Q8', 'TOSS520909HVZRNR08', 2, ' ', '1952-09-09', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(233, 1, 4, '036', '2019-12-05', '1899-12-30', '1899-12-30', 'Jose Luis', 'Vergara', 'Gonzalez', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67067701630', 'VEGL770414NE1', 'VEGL770414HDFRNS00', 2, ' ', '1977-04-14', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(234, 1, 4, '037', '2019-12-05', '1899-12-30', '1899-12-30', 'Juan Carlos', 'Vergara', 'Gonzalez', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67978060050', 'VEGJ801104QNA', 'VEGJ801104HDFRNN06', 2, ' ', '1980-11-04', '0', ' ', ' ', NULL, ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(235, 1, 4, '038', '2019-12-05', '1899-12-30', '1899-12-30', 'Celestino', 'Villanueva', 'Pablo', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67018102920', 'VIPC8103021LA', 'VIPC810302HVZLBL08', 2, ' ', '1981-03-02', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(236, 1, 4, '039', '2019-12-05', '1899-12-30', '1899-12-30', 'Alfredo', 'Xolo', 'Sosme', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '67998034374', 'XOSA800309SA3', 'XOSA800309HVZLSL03', 2, ' ', '1980-03-09', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(237, 1, 4, '040', '2019-12-05', '1899-12-30', '1899-12-30', 'Aurelio', 'Zapo', 'Quino', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '65068706608', 'ZAQA870415P11', 'ZAQA870415HVZPNR06', 2, ' ', '1987-04-15', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(238, 1, 4, '041', '2019-12-05', '1899-12-30', '1899-12-30', 'Marcelino', 'Zapo', 'Quino', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, ' ', '65018330624', 'ZAQM831005V15', 'ZAQM831005HVZPNR00', 2, ' ', '1983-10-05', '0', ' ', ' ', ' ', ' ', NULL, '0', ' ', NULL, NULL, NULL, '0', 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(239, 1, 4, '057', '2019-12-05', '1899-12-30', '1899-12-30', 'Alonso', 'Lopez', 'De Jesus', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, NULL, '67866672701', 'LOJA6610125U8', 'LOJA661012HVZPSL06', 2, NULL, '1966-10-12', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(240, 1, 4, '059', '2019-12-05', '1899-12-30', '1899-12-30', 'Porfirio Mizael', 'Morales', 'Moreno', 14, 5, '0.00', '124.17', '129.78', 8, NULL, NULL, 8, 5, NULL, 7, NULL, '65099108022', 'MOMP910918954', 'MOMP910918HVZRRR05', 2, NULL, '1991-09-18', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(241, 1, 4, '060', '2019-12-05', '1899-12-30', '1899-12-30', 'Martin Guadalupe', 'Contreras', 'Salmeron', 14, 5, '0.00', '124.17', '129.78', 8, NULL, NULL, 8, 5, NULL, 7, NULL, '65068638751', 'COSM861212UP6', 'COSM861212HVZNLR04', 2, NULL, '1986-12-12', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(242, 1, 4, '061', '2019-12-05', '1899-12-30', '1899-12-30', 'Isaac', 'Crisostomo', 'Jimenez', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, NULL, '83098914159', 'CIJI890227BJ8', 'CIJI890227HTCRMS07', 2, NULL, '1989-02-27', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(243, 1, 4, '062', '2019-12-05', '1899-12-30', '1899-12-30', 'Jesus', 'Huesca', 'Garcia', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, NULL, '65047101392', 'HUGJ710105JD5', 'HUGJ710105HVZSRS09', 2, NULL, '1971-01-05', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(244, 1, 4, '063', '2019-12-19', '1899-12-30', '1899-12-30', 'Martin', 'Anota ', 'Tepach', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, NULL, '65866409371', 'AOTM640930S85', 'AOTM640930HVZNPR01', 2, 'COATZACOALCOS', '1964-09-30', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(245, 1, 4, '064', '2019-12-26', '1899-12-30', '1899-12-30', 'Francisco Javier', 'Ruiz ', 'Acopa', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, NULL, '67947355029', 'RUAF731004RC7', 'RUAF731004HVZZCR01', 2, 'VERACRUZ', '1973-10-04', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(246, 1, 4, '065', '2020-01-09', '1899-12-30', '1899-12-30', 'Aberlay', 'Leon', 'Galvez', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, NULL, '71915532429', 'LEGA550710262', 'LEGA550710HCSNLB00', 2, NULL, '1955-07-10', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(247, 1, 4, '066', '2020-01-16', '1899-12-30', '1899-12-30', 'David', 'Pena', 'Diaz', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, NULL, '43998080238', 'PEDD8012293G0', 'PEDD801229HVZNZV03', 2, NULL, '1980-12-29', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(248, 1, 4, '067', '2020-01-16', '1899-12-30', '1899-12-30', 'Deni', 'Jimenez', 'Reyes', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, NULL, '56160025906', 'JIRD001028BR6', 'JIRD001028HVZMYNA0', 2, NULL, '2000-10-28', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL),
(249, 1, 4, '068', '2020-01-18', '1899-12-30', '1899-12-30', 'Ismael', 'Renero', 'Serena', 14, 5, '0.00', '123.22', '128.79', 8, NULL, NULL, 8, 5, NULL, 7, NULL, '65109294127', 'RESI920306E76', 'RESI920306HVZNRS05', 2, NULL, '1992-03-06', '0', NULL, NULL, NULL, NULL, NULL, '0', NULL, NULL, NULL, NULL, NULL, 'contabilidad.re.do@hotmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-01-21 17:36:07', '2020-01-21 17:36:07', NULL);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `nomina_dispersion`
--
ALTER TABLE `nomina_dispersion`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
