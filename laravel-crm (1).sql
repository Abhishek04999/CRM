-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jun 12, 2026 at 08:40 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel-crm`
--

-- --------------------------------------------------------

--
-- Table structure for table `activities`
--

CREATE TABLE `activities` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `comment` text DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `schedule_from` datetime DEFAULT NULL,
  `schedule_to` datetime DEFAULT NULL,
  `is_done` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity_files`
--

CREATE TABLE `activity_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `activity_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `activity_participants`
--

CREATE TABLE `activity_participants` (
  `id` int(10) UNSIGNED NOT NULL,
  `activity_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `person_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `lookup_type` varchar(255) DEFAULT NULL,
  `entity_type` varchar(255) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `validation` varchar(255) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 0,
  `is_unique` tinyint(1) NOT NULL DEFAULT 0,
  `quick_add` tinyint(1) NOT NULL DEFAULT 0,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `code`, `name`, `type`, `lookup_type`, `entity_type`, `sort_order`, `validation`, `is_required`, `is_unique`, `quick_add`, `is_user_defined`, `created_at`, `updated_at`) VALUES
(19, 'title', 'Title', 'text', NULL, 'leads', 1, NULL, 1, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(20, 'description', 'Description', 'textarea', NULL, 'leads', 2, NULL, 0, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(21, 'lead_value', 'Lead Value', 'price', NULL, 'leads', 3, 'decimal', 1, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(22, 'lead_source_id', 'Source', 'select', 'lead_sources', 'leads', 4, NULL, 1, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(23, 'lead_type_id', 'Type', 'select', 'lead_types', 'leads', 5, NULL, 1, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(24, 'user_id', 'Sales Owner', 'select', 'users', 'leads', 7, NULL, 0, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(25, 'expected_close_date', 'Expected Close Date', 'date', NULL, 'leads', 8, NULL, 0, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(26, 'lead_pipeline_id', 'Pipeline', 'lookup', 'lead_pipelines', 'leads', 9, NULL, 1, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(27, 'lead_pipeline_stage_id', 'Stage', 'lookup', 'lead_pipeline_stages', 'leads', 10, NULL, 1, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(28, 'name', 'Name', 'text', NULL, 'persons', 1, NULL, 1, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(29, 'emails', 'Emails', 'email', NULL, 'persons', 2, NULL, 1, 1, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(30, 'contact_numbers', 'Contact Numbers', 'phone', NULL, 'persons', 3, 'numeric', 0, 1, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(31, 'job_title', 'Job Title', 'text', NULL, 'persons', 4, NULL, 0, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(32, 'user_id', 'Sales Owner', 'lookup', 'users', 'persons', 5, NULL, 0, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(33, 'organization_id', 'Organization', 'lookup', 'organizations', 'persons', 6, NULL, 0, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(34, 'name', 'Name', 'text', NULL, 'organizations', 1, NULL, 1, 1, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(35, 'address', 'Address', 'address', NULL, 'organizations', 2, NULL, 0, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(36, 'user_id', 'Sales Owner', 'lookup', 'users', 'organizations', 3, NULL, 0, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(37, 'name', 'Name', 'text', NULL, 'products', 1, NULL, 1, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(38, 'description', 'Description', 'textarea', NULL, 'products', 2, NULL, 0, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(39, 'sku', 'SKU', 'text', NULL, 'products', 3, NULL, 1, 1, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(40, 'quantity', 'Quantity', 'text', NULL, 'products', 4, 'numeric', 1, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(41, 'price', 'Price', 'price', NULL, 'products', 5, 'decimal', 1, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(42, 'user_id', 'Sales Owner', 'select', 'users', 'quotes', 1, NULL, 1, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(43, 'subject', 'Subject', 'text', NULL, 'quotes', 2, NULL, 1, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(44, 'description', 'Description', 'textarea', NULL, 'quotes', 3, NULL, 0, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(45, 'billing_address', 'Billing Address', 'address', NULL, 'quotes', 4, NULL, 1, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(46, 'shipping_address', 'Shipping Address', 'address', NULL, 'quotes', 5, NULL, 0, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(47, 'discount_percent', 'Discount Percent', 'text', NULL, 'quotes', 6, 'decimal', 0, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(48, 'discount_amount', 'Discount Amount', 'price', NULL, 'quotes', 7, 'decimal', 0, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(49, 'tax_amount', 'Tax Amount', 'price', NULL, 'quotes', 8, 'decimal', 0, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(50, 'adjustment_amount', 'Adjustment Amount', 'price', NULL, 'quotes', 9, 'decimal', 0, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(51, 'sub_total', 'Sub Total', 'price', NULL, 'quotes', 10, 'decimal', 1, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(52, 'grand_total', 'Grand Total', 'price', NULL, 'quotes', 11, 'decimal', 1, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(53, 'expired_at', 'Expired At', 'date', NULL, 'quotes', 12, NULL, 1, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(54, 'person_id', 'Person', 'lookup', 'persons', 'quotes', 13, NULL, 1, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(55, 'name', 'Name', 'text', NULL, 'warehouses', 1, NULL, 1, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(56, 'description', 'Description', 'textarea', NULL, 'warehouses', 2, NULL, 0, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(57, 'contact_name', 'Contact Name', 'text', NULL, 'warehouses', 3, NULL, 1, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(58, 'contact_emails', 'Contact Emails', 'email', NULL, 'warehouses', 4, NULL, 1, 1, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(59, 'contact_numbers', 'Contact Numbers', 'phone', NULL, 'warehouses', 5, 'numeric', 0, 1, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(60, 'contact_address', 'Contact Address', 'address', NULL, 'warehouses', 6, NULL, 1, 0, 1, 0, '2026-02-27 19:37:56', '2026-02-27 19:37:56');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_options`
--

CREATE TABLE `attribute_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `entity_type` varchar(255) NOT NULL DEFAULT 'leads',
  `text_value` text DEFAULT NULL,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `integer_value` int(11) DEFAULT NULL,
  `float_value` double DEFAULT NULL,
  `datetime_value` datetime DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `json_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`json_value`)),
  `entity_id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `unique_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_config`
--

CREATE TABLE `core_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `core_config`
--

INSERT INTO `core_config` (`id`, `code`, `value`, `created_at`, `updated_at`) VALUES
(1, 'general.settings.menu.mail.mail', 'Mail', '2026-03-14 08:42:56', '2026-03-14 08:42:56'),
(2, 'general.settings.menu.mail.inbox', 'Inbox', '2026-03-14 08:42:56', '2026-03-14 08:42:56'),
(3, 'general.settings.menu.mail.draft', 'Draft', '2026-03-14 08:42:56', '2026-03-14 08:42:56'),
(4, 'general.settings.menu.mail.outbox', 'Outbox', '2026-03-14 08:42:56', '2026-03-14 08:42:56'),
(5, 'general.settings.menu.mail.sent', 'Sent', '2026-03-14 08:42:56', '2026-03-14 08:42:56'),
(6, 'general.settings.menu.mail.trash', 'Trash', '2026-03-14 08:42:56', '2026-03-14 08:42:56'),
(7, 'general.settings.menu.contacts.contacts', 'Contacts', '2026-03-14 08:42:56', '2026-03-14 08:42:56'),
(8, 'general.settings.menu.contacts.persons', 'Persons', '2026-03-14 08:42:56', '2026-03-14 08:42:56'),
(9, 'general.settings.menu.contacts.organizations', 'Organizations', '2026-03-14 08:42:56', '2026-03-14 08:42:56'),
(10, 'general.settings.footer.label', '<p>Powered by <span style=\"color: rgb(14, 144, 217);\"><a href=\"http://www.krayincrm.com\" target=\"_blank\" rel=\"noopener\">NexusCRM</a></span>, an project by <span style=\"color: rgb(14, 144, 217);\"><a href=\"https://webkul.com\" target=\"_blank\" rel=\"noopener\">Tech Solutions</a></span>.</p>', '2026-03-14 08:42:56', '2026-03-14 08:42:56'),
(11, 'general.settings.menu.dashboard', 'Dashboard', '2026-03-14 08:42:56', '2026-03-14 08:42:56'),
(12, 'general.settings.menu.leads', 'Leads', '2026-03-14 08:42:56', '2026-03-14 08:42:56'),
(13, 'general.settings.menu.quotes', 'Quotes', '2026-03-14 08:42:56', '2026-03-14 08:42:56'),
(14, 'general.settings.menu.activities', 'Activities', '2026-03-14 08:42:56', '2026-03-14 08:42:56'),
(15, 'general.settings.menu.products', 'Products', '2026-03-14 08:42:56', '2026-03-14 08:42:56'),
(16, 'general.settings.menu.settings', 'Settings', '2026-03-14 08:42:56', '2026-03-14 08:42:56'),
(17, 'general.settings.menu.configuration', 'Configuration', '2026-03-14 08:42:56', '2026-03-14 08:42:56'),
(18, 'general.settings.menu_color.brand_color', '#0e90d9', '2026-03-14 08:42:56', '2026-03-14 08:43:53'),
(19, 'email.imap.account.host', 'imap.gmail.com', '2026-05-16 13:37:59', '2026-05-16 13:37:59'),
(20, 'email.imap.account.port', '993', '2026-05-16 13:37:59', '2026-05-16 13:37:59'),
(21, 'email.imap.account.encryption', 'ssl', '2026-05-16 13:37:59', '2026-05-16 13:37:59'),
(22, 'email.imap.account.validate_cert', '1', '2026-05-16 13:37:59', '2026-05-16 13:37:59'),
(23, 'email.imap.account.username', 'piyushsharma58932@gmail.com', '2026-05-16 13:37:59', '2026-05-16 13:37:59'),
(24, 'email.imap.account.password', 'oysk vnhg rsgg lvvo', '2026-05-16 13:37:59', '2026-05-16 13:58:08');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AX', 'Åland Islands'),
(3, 'AL', 'Albania'),
(4, 'DZ', 'Algeria'),
(5, 'AS', 'American Samoa'),
(6, 'AD', 'Andorra'),
(7, 'AO', 'Angola'),
(8, 'AI', 'Anguilla'),
(9, 'AQ', 'Antarctica'),
(10, 'AG', 'Antigua & Barbuda'),
(11, 'AR', 'Argentina'),
(12, 'AM', 'Armenia'),
(13, 'AW', 'Aruba'),
(14, 'AC', 'Ascension Island'),
(15, 'AU', 'Australia'),
(16, 'AT', 'Austria'),
(17, 'AZ', 'Azerbaijan'),
(18, 'BS', 'Bahamas'),
(19, 'BH', 'Bahrain'),
(20, 'BD', 'Bangladesh'),
(21, 'BB', 'Barbados'),
(22, 'BY', 'Belarus'),
(23, 'BE', 'Belgium'),
(24, 'BZ', 'Belize'),
(25, 'BJ', 'Benin'),
(26, 'BM', 'Bermuda'),
(27, 'BT', 'Bhutan'),
(28, 'BO', 'Bolivia'),
(29, 'BA', 'Bosnia & Herzegovina'),
(30, 'BW', 'Botswana'),
(31, 'BR', 'Brazil'),
(32, 'IO', 'British Indian Ocean Territory'),
(33, 'VG', 'British Virgin Islands'),
(34, 'BN', 'Brunei'),
(35, 'BG', 'Bulgaria'),
(36, 'BF', 'Burkina Faso'),
(37, 'BI', 'Burundi'),
(38, 'KH', 'Cambodia'),
(39, 'CM', 'Cameroon'),
(40, 'CA', 'Canada'),
(41, 'IC', 'Canary Islands'),
(42, 'CV', 'Cape Verde'),
(43, 'BQ', 'Caribbean Netherlands'),
(44, 'KY', 'Cayman Islands'),
(45, 'CF', 'Central African Republic'),
(46, 'EA', 'Ceuta & Melilla'),
(47, 'TD', 'Chad'),
(48, 'CL', 'Chile'),
(49, 'CN', 'China'),
(50, 'CX', 'Christmas Island'),
(51, 'CC', 'Cocos (Keeling) Islands'),
(52, 'CO', 'Colombia'),
(53, 'KM', 'Comoros'),
(54, 'CG', 'Congo - Brazzaville'),
(55, 'CD', 'Congo - Kinshasa'),
(56, 'CK', 'Cook Islands'),
(57, 'CR', 'Costa Rica'),
(58, 'CI', 'Côte d’Ivoire'),
(59, 'HR', 'Croatia'),
(60, 'CU', 'Cuba'),
(61, 'CW', 'Curaçao'),
(62, 'CY', 'Cyprus'),
(63, 'CZ', 'Czechia'),
(64, 'DK', 'Denmark'),
(65, 'DG', 'Diego Garcia'),
(66, 'DJ', 'Djibouti'),
(67, 'DM', 'Dominica'),
(68, 'DO', 'Dominican Republic'),
(69, 'EC', 'Ecuador'),
(70, 'EG', 'Egypt'),
(71, 'SV', 'El Salvador'),
(72, 'GQ', 'Equatorial Guinea'),
(73, 'ER', 'Eritrea'),
(74, 'EE', 'Estonia'),
(75, 'ET', 'Ethiopia'),
(76, 'EZ', 'Eurozone'),
(77, 'FK', 'Falkland Islands'),
(78, 'FO', 'Faroe Islands'),
(79, 'FJ', 'Fiji'),
(80, 'FI', 'Finland'),
(81, 'FR', 'France'),
(82, 'GF', 'French Guiana'),
(83, 'PF', 'French Polynesia'),
(84, 'TF', 'French Southern Territories'),
(85, 'GA', 'Gabon'),
(86, 'GM', 'Gambia'),
(87, 'GE', 'Georgia'),
(88, 'DE', 'Germany'),
(89, 'GH', 'Ghana'),
(90, 'GI', 'Gibraltar'),
(91, 'GR', 'Greece'),
(92, 'GL', 'Greenland'),
(93, 'GD', 'Grenada'),
(94, 'GP', 'Guadeloupe'),
(95, 'GU', 'Guam'),
(96, 'GT', 'Guatemala'),
(97, 'GG', 'Guernsey'),
(98, 'GN', 'Guinea'),
(99, 'GW', 'Guinea-Bissau'),
(100, 'GY', 'Guyana'),
(101, 'HT', 'Haiti'),
(102, 'HN', 'Honduras'),
(103, 'HK', 'Hong Kong SAR China'),
(104, 'HU', 'Hungary'),
(105, 'IS', 'Iceland'),
(106, 'IN', 'India'),
(107, 'ID', 'Indonesia'),
(108, 'IR', 'Iran'),
(109, 'IQ', 'Iraq'),
(110, 'IE', 'Ireland'),
(111, 'IM', 'Isle of Man'),
(112, 'IL', 'Israel'),
(113, 'IT', 'Italy'),
(114, 'JM', 'Jamaica'),
(115, 'JP', 'Japan'),
(116, 'JE', 'Jersey'),
(117, 'JO', 'Jordan'),
(118, 'KZ', 'Kazakhstan'),
(119, 'KE', 'Kenya'),
(120, 'KI', 'Kiribati'),
(121, 'XK', 'Kosovo'),
(122, 'KW', 'Kuwait'),
(123, 'KG', 'Kyrgyzstan'),
(124, 'LA', 'Laos'),
(125, 'LV', 'Latvia'),
(126, 'LB', 'Lebanon'),
(127, 'LS', 'Lesotho'),
(128, 'LR', 'Liberia'),
(129, 'LY', 'Libya'),
(130, 'LI', 'Liechtenstein'),
(131, 'LT', 'Lithuania'),
(132, 'LU', 'Luxembourg'),
(133, 'MO', 'Macau SAR China'),
(134, 'MK', 'Macedonia'),
(135, 'MG', 'Madagascar'),
(136, 'MW', 'Malawi'),
(137, 'MY', 'Malaysia'),
(138, 'MV', 'Maldives'),
(139, 'ML', 'Mali'),
(140, 'MT', 'Malta'),
(141, 'MH', 'Marshall Islands'),
(142, 'MQ', 'Martinique'),
(143, 'MR', 'Mauritania'),
(144, 'MU', 'Mauritius'),
(145, 'YT', 'Mayotte'),
(146, 'MX', 'Mexico'),
(147, 'FM', 'Micronesia'),
(148, 'MD', 'Moldova'),
(149, 'MC', 'Monaco'),
(150, 'MN', 'Mongolia'),
(151, 'ME', 'Montenegro'),
(152, 'MS', 'Montserrat'),
(153, 'MA', 'Morocco'),
(154, 'MZ', 'Mozambique'),
(155, 'MM', 'Myanmar (Burma)'),
(156, 'NA', 'Namibia'),
(157, 'NR', 'Nauru'),
(158, 'NP', 'Nepal'),
(159, 'NL', 'Netherlands'),
(160, 'NC', 'New Caledonia'),
(161, 'NZ', 'New Zealand'),
(162, 'NI', 'Nicaragua'),
(163, 'NE', 'Niger'),
(164, 'NG', 'Nigeria'),
(165, 'NU', 'Niue'),
(166, 'NF', 'Norfolk Island'),
(167, 'KP', 'North Korea'),
(168, 'MP', 'Northern Mariana Islands'),
(169, 'NO', 'Norway'),
(170, 'OM', 'Oman'),
(171, 'PK', 'Pakistan'),
(172, 'PW', 'Palau'),
(173, 'PS', 'Palestinian Territories'),
(174, 'PA', 'Panama'),
(175, 'PG', 'Papua New Guinea'),
(176, 'PY', 'Paraguay'),
(177, 'PE', 'Peru'),
(178, 'PH', 'Philippines'),
(179, 'PN', 'Pitcairn Islands'),
(180, 'PL', 'Poland'),
(181, 'PT', 'Portugal'),
(182, 'PR', 'Puerto Rico'),
(183, 'QA', 'Qatar'),
(184, 'RE', 'Réunion'),
(185, 'RO', 'Romania'),
(186, 'RU', 'Russia'),
(187, 'RW', 'Rwanda'),
(188, 'WS', 'Samoa'),
(189, 'SM', 'San Marino'),
(190, 'ST', 'São Tomé & Príncipe'),
(191, 'SA', 'Saudi Arabia'),
(192, 'SN', 'Senegal'),
(193, 'RS', 'Serbia'),
(194, 'SC', 'Seychelles'),
(195, 'SL', 'Sierra Leone'),
(196, 'SG', 'Singapore'),
(197, 'SX', 'Sint Maarten'),
(198, 'SK', 'Slovakia'),
(199, 'SI', 'Slovenia'),
(200, 'SB', 'Solomon Islands'),
(201, 'SO', 'Somalia'),
(202, 'ZA', 'South Africa'),
(203, 'GS', 'South Georgia & South Sandwich Islands'),
(204, 'KR', 'South Korea'),
(205, 'SS', 'South Sudan'),
(206, 'ES', 'Spain'),
(207, 'LK', 'Sri Lanka'),
(208, 'BL', 'St. Barthélemy'),
(209, 'SH', 'St. Helena'),
(210, 'KN', 'St. Kitts & Nevis'),
(211, 'LC', 'St. Lucia'),
(212, 'MF', 'St. Martin'),
(213, 'PM', 'St. Pierre & Miquelon'),
(214, 'VC', 'St. Vincent & Grenadines'),
(215, 'SD', 'Sudan'),
(216, 'SR', 'Suriname'),
(217, 'SJ', 'Svalbard & Jan Mayen'),
(218, 'SZ', 'Swaziland'),
(219, 'SE', 'Sweden'),
(220, 'CH', 'Switzerland'),
(221, 'SY', 'Syria'),
(222, 'TW', 'Taiwan'),
(223, 'TJ', 'Tajikistan'),
(224, 'TZ', 'Tanzania'),
(225, 'TH', 'Thailand'),
(226, 'TL', 'Timor-Leste'),
(227, 'TG', 'Togo'),
(228, 'TK', 'Tokelau'),
(229, 'TO', 'Tonga'),
(230, 'TT', 'Trinidad & Tobago'),
(231, 'TA', 'Tristan da Cunha'),
(232, 'TN', 'Tunisia'),
(233, 'TR', 'Turkey'),
(234, 'TM', 'Turkmenistan'),
(235, 'TC', 'Turks & Caicos Islands'),
(236, 'TV', 'Tuvalu'),
(237, 'UM', 'U.S. Outlying Islands'),
(238, 'VI', 'U.S. Virgin Islands'),
(239, 'UG', 'Uganda'),
(240, 'UA', 'Ukraine'),
(241, 'AE', 'United Arab Emirates'),
(242, 'GB', 'United Kingdom'),
(243, 'UN', 'United Nations'),
(244, 'US', 'United States'),
(245, 'UY', 'Uruguay'),
(246, 'UZ', 'Uzbekistan'),
(247, 'VU', 'Vanuatu'),
(248, 'VA', 'Vatican City'),
(249, 'VE', 'Venezuela'),
(250, 'VN', 'Vietnam'),
(251, 'WF', 'Wallis & Futuna'),
(252, 'EH', 'Western Sahara'),
(253, 'YE', 'Yemen'),
(254, 'ZM', 'Zambia'),
(255, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `country_states`
--

CREATE TABLE `country_states` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_code` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `country_states`
--

INSERT INTO `country_states` (`id`, `country_code`, `code`, `name`, `country_id`) VALUES
(1, 'US', 'AL', 'Alabama', 244),
(2, 'US', 'AK', 'Alaska', 244),
(3, 'US', 'AS', 'American Samoa', 244),
(4, 'US', 'AZ', 'Arizona', 244),
(5, 'US', 'AR', 'Arkansas', 244),
(6, 'US', 'AE', 'Armed Forces Africa', 244),
(7, 'US', 'AA', 'Armed Forces Americas', 244),
(8, 'US', 'AE', 'Armed Forces Canada', 244),
(9, 'US', 'AE', 'Armed Forces Europe', 244),
(10, 'US', 'AE', 'Armed Forces Middle East', 244),
(11, 'US', 'AP', 'Armed Forces Pacific', 244),
(12, 'US', 'CA', 'California', 244),
(13, 'US', 'CO', 'Colorado', 244),
(14, 'US', 'CT', 'Connecticut', 244),
(15, 'US', 'DE', 'Delaware', 244),
(16, 'US', 'DC', 'District of Columbia', 244),
(17, 'US', 'FM', 'Federated States Of Micronesia', 244),
(18, 'US', 'FL', 'Florida', 244),
(19, 'US', 'GA', 'Georgia', 244),
(20, 'US', 'GU', 'Guam', 244),
(21, 'US', 'HI', 'Hawaii', 244),
(22, 'US', 'ID', 'Idaho', 244),
(23, 'US', 'IL', 'Illinois', 244),
(24, 'US', 'IN', 'Indiana', 244),
(25, 'US', 'IA', 'Iowa', 244),
(26, 'US', 'KS', 'Kansas', 244),
(27, 'US', 'KY', 'Kentucky', 244),
(28, 'US', 'LA', 'Louisiana', 244),
(29, 'US', 'ME', 'Maine', 244),
(30, 'US', 'MH', 'Marshall Islands', 244),
(31, 'US', 'MD', 'Maryland', 244),
(32, 'US', 'MA', 'Massachusetts', 244),
(33, 'US', 'MI', 'Michigan', 244),
(34, 'US', 'MN', 'Minnesota', 244),
(35, 'US', 'MS', 'Mississippi', 244),
(36, 'US', 'MO', 'Missouri', 244),
(37, 'US', 'MT', 'Montana', 244),
(38, 'US', 'NE', 'Nebraska', 244),
(39, 'US', 'NV', 'Nevada', 244),
(40, 'US', 'NH', 'New Hampshire', 244),
(41, 'US', 'NJ', 'New Jersey', 244),
(42, 'US', 'NM', 'New Mexico', 244),
(43, 'US', 'NY', 'New York', 244),
(44, 'US', 'NC', 'North Carolina', 244),
(45, 'US', 'ND', 'North Dakota', 244),
(46, 'US', 'MP', 'Northern Mariana Islands', 244),
(47, 'US', 'OH', 'Ohio', 244),
(48, 'US', 'OK', 'Oklahoma', 244),
(49, 'US', 'OR', 'Oregon', 244),
(50, 'US', 'PW', 'Palau', 244),
(51, 'US', 'PA', 'Pennsylvania', 244),
(52, 'US', 'PR', 'Puerto Rico', 244),
(53, 'US', 'RI', 'Rhode Island', 244),
(54, 'US', 'SC', 'South Carolina', 244),
(55, 'US', 'SD', 'South Dakota', 244),
(56, 'US', 'TN', 'Tennessee', 244),
(57, 'US', 'TX', 'Texas', 244),
(58, 'US', 'UT', 'Utah', 244),
(59, 'US', 'VT', 'Vermont', 244),
(60, 'US', 'VI', 'Virgin Islands', 244),
(61, 'US', 'VA', 'Virginia', 244),
(62, 'US', 'WA', 'Washington', 244),
(63, 'US', 'WV', 'West Virginia', 244),
(64, 'US', 'WI', 'Wisconsin', 244),
(65, 'US', 'WY', 'Wyoming', 244),
(66, 'CA', 'AB', 'Alberta', 40),
(67, 'CA', 'BC', 'British Columbia', 40),
(68, 'CA', 'MB', 'Manitoba', 40),
(69, 'CA', 'NL', 'Newfoundland and Labrador', 40),
(70, 'CA', 'NB', 'New Brunswick', 40),
(71, 'CA', 'NS', 'Nova Scotia', 40),
(72, 'CA', 'NT', 'Northwest Territories', 40),
(73, 'CA', 'NU', 'Nunavut', 40),
(74, 'CA', 'ON', 'Ontario', 40),
(75, 'CA', 'PE', 'Prince Edward Island', 40),
(76, 'CA', 'QC', 'Quebec', 40),
(77, 'CA', 'SK', 'Saskatchewan', 40),
(78, 'CA', 'YT', 'Yukon Territory', 40),
(79, 'DE', 'NDS', 'Niedersachsen', 88),
(80, 'DE', 'BAW', 'Baden-Württemberg', 88),
(81, 'DE', 'BAY', 'Bayern', 88),
(82, 'DE', 'BER', 'Berlin', 88),
(83, 'DE', 'BRG', 'Brandenburg', 88),
(84, 'DE', 'BRE', 'Bremen', 88),
(85, 'DE', 'HAM', 'Hamburg', 88),
(86, 'DE', 'HES', 'Hessen', 88),
(87, 'DE', 'MEC', 'Mecklenburg-Vorpommern', 88),
(88, 'DE', 'NRW', 'Nordrhein-Westfalen', 88),
(89, 'DE', 'RHE', 'Rheinland-Pfalz', 88),
(90, 'DE', 'SAR', 'Saarland', 88),
(91, 'DE', 'SAS', 'Sachsen', 88),
(92, 'DE', 'SAC', 'Sachsen-Anhalt', 88),
(93, 'DE', 'SCN', 'Schleswig-Holstein', 88),
(94, 'DE', 'THE', 'Thüringen', 88),
(95, 'AT', 'WI', 'Wien', 16),
(96, 'AT', 'NO', 'Niederösterreich', 16),
(97, 'AT', 'OO', 'Oberösterreich', 16),
(98, 'AT', 'SB', 'Salzburg', 16),
(99, 'AT', 'KN', 'Kärnten', 16),
(100, 'AT', 'ST', 'Steiermark', 16),
(101, 'AT', 'TI', 'Tirol', 16),
(102, 'AT', 'BL', 'Burgenland', 16),
(103, 'AT', 'VB', 'Vorarlberg', 16),
(104, 'CH', 'AG', 'Aargau', 220),
(105, 'CH', 'AI', 'Appenzell Innerrhoden', 220),
(106, 'CH', 'AR', 'Appenzell Ausserrhoden', 220),
(107, 'CH', 'BE', 'Bern', 220),
(108, 'CH', 'BL', 'Basel-Landschaft', 220),
(109, 'CH', 'BS', 'Basel-Stadt', 220),
(110, 'CH', 'FR', 'Freiburg', 220),
(111, 'CH', 'GE', 'Genf', 220),
(112, 'CH', 'GL', 'Glarus', 220),
(113, 'CH', 'GR', 'Graubünden', 220),
(114, 'CH', 'JU', 'Jura', 220),
(115, 'CH', 'LU', 'Luzern', 220),
(116, 'CH', 'NE', 'Neuenburg', 220),
(117, 'CH', 'NW', 'Nidwalden', 220),
(118, 'CH', 'OW', 'Obwalden', 220),
(119, 'CH', 'SG', 'St. Gallen', 220),
(120, 'CH', 'SH', 'Schaffhausen', 220),
(121, 'CH', 'SO', 'Solothurn', 220),
(122, 'CH', 'SZ', 'Schwyz', 220),
(123, 'CH', 'TG', 'Thurgau', 220),
(124, 'CH', 'TI', 'Tessin', 220),
(125, 'CH', 'UR', 'Uri', 220),
(126, 'CH', 'VD', 'Waadt', 220),
(127, 'CH', 'VS', 'Wallis', 220),
(128, 'CH', 'ZG', 'Zug', 220),
(129, 'CH', 'ZH', 'Zürich', 220),
(130, 'ES', 'A Coruсa', 'A Coruña', 206),
(131, 'ES', 'Alava', 'Alava', 206),
(132, 'ES', 'Albacete', 'Albacete', 206),
(133, 'ES', 'Alicante', 'Alicante', 206),
(134, 'ES', 'Almeria', 'Almeria', 206),
(135, 'ES', 'Asturias', 'Asturias', 206),
(136, 'ES', 'Avila', 'Avila', 206),
(137, 'ES', 'Badajoz', 'Badajoz', 206),
(138, 'ES', 'Baleares', 'Baleares', 206),
(139, 'ES', 'Barcelona', 'Barcelona', 206),
(140, 'ES', 'Burgos', 'Burgos', 206),
(141, 'ES', 'Caceres', 'Caceres', 206),
(142, 'ES', 'Cadiz', 'Cadiz', 206),
(143, 'ES', 'Cantabria', 'Cantabria', 206),
(144, 'ES', 'Castellon', 'Castellon', 206),
(145, 'ES', 'Ceuta', 'Ceuta', 206),
(146, 'ES', 'Ciudad Real', 'Ciudad Real', 206),
(147, 'ES', 'Cordoba', 'Cordoba', 206),
(148, 'ES', 'Cuenca', 'Cuenca', 206),
(149, 'ES', 'Girona', 'Girona', 206),
(150, 'ES', 'Granada', 'Granada', 206),
(151, 'ES', 'Guadalajara', 'Guadalajara', 206),
(152, 'ES', 'Guipuzcoa', 'Guipuzcoa', 206),
(153, 'ES', 'Huelva', 'Huelva', 206),
(154, 'ES', 'Huesca', 'Huesca', 206),
(155, 'ES', 'Jaen', 'Jaen', 206),
(156, 'ES', 'La Rioja', 'La Rioja', 206),
(157, 'ES', 'Las Palmas', 'Las Palmas', 206),
(158, 'ES', 'Leon', 'Leon', 206),
(159, 'ES', 'Lleida', 'Lleida', 206),
(160, 'ES', 'Lugo', 'Lugo', 206),
(161, 'ES', 'Madrid', 'Madrid', 206),
(162, 'ES', 'Malaga', 'Malaga', 206),
(163, 'ES', 'Melilla', 'Melilla', 206),
(164, 'ES', 'Murcia', 'Murcia', 206),
(165, 'ES', 'Navarra', 'Navarra', 206),
(166, 'ES', 'Ourense', 'Ourense', 206),
(167, 'ES', 'Palencia', 'Palencia', 206),
(168, 'ES', 'Pontevedra', 'Pontevedra', 206),
(169, 'ES', 'Salamanca', 'Salamanca', 206),
(170, 'ES', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife', 206),
(171, 'ES', 'Segovia', 'Segovia', 206),
(172, 'ES', 'Sevilla', 'Sevilla', 206),
(173, 'ES', 'Soria', 'Soria', 206),
(174, 'ES', 'Tarragona', 'Tarragona', 206),
(175, 'ES', 'Teruel', 'Teruel', 206),
(176, 'ES', 'Toledo', 'Toledo', 206),
(177, 'ES', 'Valencia', 'Valencia', 206),
(178, 'ES', 'Valladolid', 'Valladolid', 206),
(179, 'ES', 'Vizcaya', 'Vizcaya', 206),
(180, 'ES', 'Zamora', 'Zamora', 206),
(181, 'ES', 'Zaragoza', 'Zaragoza', 206),
(182, 'FR', '1', 'Ain', 81),
(183, 'FR', '2', 'Aisne', 81),
(184, 'FR', '3', 'Allier', 81),
(185, 'FR', '4', 'Alpes-de-Haute-Provence', 81),
(186, 'FR', '5', 'Hautes-Alpes', 81),
(187, 'FR', '6', 'Alpes-Maritimes', 81),
(188, 'FR', '7', 'Ardèche', 81),
(189, 'FR', '8', 'Ardennes', 81),
(190, 'FR', '9', 'Ariège', 81),
(191, 'FR', '10', 'Aube', 81),
(192, 'FR', '11', 'Aude', 81),
(193, 'FR', '12', 'Aveyron', 81),
(194, 'FR', '13', 'Bouches-du-Rhône', 81),
(195, 'FR', '14', 'Calvados', 81),
(196, 'FR', '15', 'Cantal', 81),
(197, 'FR', '16', 'Charente', 81),
(198, 'FR', '17', 'Charente-Maritime', 81),
(199, 'FR', '18', 'Cher', 81),
(200, 'FR', '19', 'Corrèze', 81),
(201, 'FR', '2A', 'Corse-du-Sud', 81),
(202, 'FR', '2B', 'Haute-Corse', 81),
(203, 'FR', '21', 'Côte-d\'Or', 81),
(204, 'FR', '22', 'Côtes-d\'Armor', 81),
(205, 'FR', '23', 'Creuse', 81),
(206, 'FR', '24', 'Dordogne', 81),
(207, 'FR', '25', 'Doubs', 81),
(208, 'FR', '26', 'Drôme', 81),
(209, 'FR', '27', 'Eure', 81),
(210, 'FR', '28', 'Eure-et-Loir', 81),
(211, 'FR', '29', 'Finistère', 81),
(212, 'FR', '30', 'Gard', 81),
(213, 'FR', '31', 'Haute-Garonne', 81),
(214, 'FR', '32', 'Gers', 81),
(215, 'FR', '33', 'Gironde', 81),
(216, 'FR', '34', 'Hérault', 81),
(217, 'FR', '35', 'Ille-et-Vilaine', 81),
(218, 'FR', '36', 'Indre', 81),
(219, 'FR', '37', 'Indre-et-Loire', 81),
(220, 'FR', '38', 'Isère', 81),
(221, 'FR', '39', 'Jura', 81),
(222, 'FR', '40', 'Landes', 81),
(223, 'FR', '41', 'Loir-et-Cher', 81),
(224, 'FR', '42', 'Loire', 81),
(225, 'FR', '43', 'Haute-Loire', 81),
(226, 'FR', '44', 'Loire-Atlantique', 81),
(227, 'FR', '45', 'Loiret', 81),
(228, 'FR', '46', 'Lot', 81),
(229, 'FR', '47', 'Lot-et-Garonne', 81),
(230, 'FR', '48', 'Lozère', 81),
(231, 'FR', '49', 'Maine-et-Loire', 81),
(232, 'FR', '50', 'Manche', 81),
(233, 'FR', '51', 'Marne', 81),
(234, 'FR', '52', 'Haute-Marne', 81),
(235, 'FR', '53', 'Mayenne', 81),
(236, 'FR', '54', 'Meurthe-et-Moselle', 81),
(237, 'FR', '55', 'Meuse', 81),
(238, 'FR', '56', 'Morbihan', 81),
(239, 'FR', '57', 'Moselle', 81),
(240, 'FR', '58', 'Nièvre', 81),
(241, 'FR', '59', 'Nord', 81),
(242, 'FR', '60', 'Oise', 81),
(243, 'FR', '61', 'Orne', 81),
(244, 'FR', '62', 'Pas-de-Calais', 81),
(245, 'FR', '63', 'Puy-de-Dôme', 81),
(246, 'FR', '64', 'Pyrénées-Atlantiques', 81),
(247, 'FR', '65', 'Hautes-Pyrénées', 81),
(248, 'FR', '66', 'Pyrénées-Orientales', 81),
(249, 'FR', '67', 'Bas-Rhin', 81),
(250, 'FR', '68', 'Haut-Rhin', 81),
(251, 'FR', '69', 'Rhône', 81),
(252, 'FR', '70', 'Haute-Saône', 81),
(253, 'FR', '71', 'Saône-et-Loire', 81),
(254, 'FR', '72', 'Sarthe', 81),
(255, 'FR', '73', 'Savoie', 81),
(256, 'FR', '74', 'Haute-Savoie', 81),
(257, 'FR', '75', 'Paris', 81),
(258, 'FR', '76', 'Seine-Maritime', 81),
(259, 'FR', '77', 'Seine-et-Marne', 81),
(260, 'FR', '78', 'Yvelines', 81),
(261, 'FR', '79', 'Deux-Sèvres', 81),
(262, 'FR', '80', 'Somme', 81),
(263, 'FR', '81', 'Tarn', 81),
(264, 'FR', '82', 'Tarn-et-Garonne', 81),
(265, 'FR', '83', 'Var', 81),
(266, 'FR', '84', 'Vaucluse', 81),
(267, 'FR', '85', 'Vendée', 81),
(268, 'FR', '86', 'Vienne', 81),
(269, 'FR', '87', 'Haute-Vienne', 81),
(270, 'FR', '88', 'Vosges', 81),
(271, 'FR', '89', 'Yonne', 81),
(272, 'FR', '90', 'Territoire-de-Belfort', 81),
(273, 'FR', '91', 'Essonne', 81),
(274, 'FR', '92', 'Hauts-de-Seine', 81),
(275, 'FR', '93', 'Seine-Saint-Denis', 81),
(276, 'FR', '94', 'Val-de-Marne', 81),
(277, 'FR', '95', 'Val-d\'Oise', 81),
(278, 'RO', 'AB', 'Alba', 185),
(279, 'RO', 'AR', 'Arad', 185),
(280, 'RO', 'AG', 'Argeş', 185),
(281, 'RO', 'BC', 'Bacău', 185),
(282, 'RO', 'BH', 'Bihor', 185),
(283, 'RO', 'BN', 'Bistriţa-Năsăud', 185),
(284, 'RO', 'BT', 'Botoşani', 185),
(285, 'RO', 'BV', 'Braşov', 185),
(286, 'RO', 'BR', 'Brăila', 185),
(287, 'RO', 'B', 'Bucureşti', 185),
(288, 'RO', 'BZ', 'Buzău', 185),
(289, 'RO', 'CS', 'Caraş-Severin', 185),
(290, 'RO', 'CL', 'Călăraşi', 185),
(291, 'RO', 'CJ', 'Cluj', 185),
(292, 'RO', 'CT', 'Constanţa', 185),
(293, 'RO', 'CV', 'Covasna', 185),
(294, 'RO', 'DB', 'Dâmboviţa', 185),
(295, 'RO', 'DJ', 'Dolj', 185),
(296, 'RO', 'GL', 'Galaţi', 185),
(297, 'RO', 'GR', 'Giurgiu', 185),
(298, 'RO', 'GJ', 'Gorj', 185),
(299, 'RO', 'HR', 'Harghita', 185),
(300, 'RO', 'HD', 'Hunedoara', 185),
(301, 'RO', 'IL', 'Ialomiţa', 185),
(302, 'RO', 'IS', 'Iaşi', 185),
(303, 'RO', 'IF', 'Ilfov', 185),
(304, 'RO', 'MM', 'Maramureş', 185),
(305, 'RO', 'MH', 'Mehedinţi', 185),
(306, 'RO', 'MS', 'Mureş', 185),
(307, 'RO', 'NT', 'Neamţ', 185),
(308, 'RO', 'OT', 'Olt', 185),
(309, 'RO', 'PH', 'Prahova', 185),
(310, 'RO', 'SM', 'Satu-Mare', 185),
(311, 'RO', 'SJ', 'Sălaj', 185),
(312, 'RO', 'SB', 'Sibiu', 185),
(313, 'RO', 'SV', 'Suceava', 185),
(314, 'RO', 'TR', 'Teleorman', 185),
(315, 'RO', 'TM', 'Timiş', 185),
(316, 'RO', 'TL', 'Tulcea', 185),
(317, 'RO', 'VS', 'Vaslui', 185),
(318, 'RO', 'VL', 'Vâlcea', 185),
(319, 'RO', 'VN', 'Vrancea', 185),
(320, 'FI', 'Lappi', 'Lappi', 80),
(321, 'FI', 'Pohjois-Pohjanmaa', 'Pohjois-Pohjanmaa', 80),
(322, 'FI', 'Kainuu', 'Kainuu', 80),
(323, 'FI', 'Pohjois-Karjala', 'Pohjois-Karjala', 80),
(324, 'FI', 'Pohjois-Savo', 'Pohjois-Savo', 80),
(325, 'FI', 'Etelä-Savo', 'Etelä-Savo', 80),
(326, 'FI', 'Etelä-Pohjanmaa', 'Etelä-Pohjanmaa', 80),
(327, 'FI', 'Pohjanmaa', 'Pohjanmaa', 80),
(328, 'FI', 'Pirkanmaa', 'Pirkanmaa', 80),
(329, 'FI', 'Satakunta', 'Satakunta', 80),
(330, 'FI', 'Keski-Pohjanmaa', 'Keski-Pohjanmaa', 80),
(331, 'FI', 'Keski-Suomi', 'Keski-Suomi', 80),
(332, 'FI', 'Varsinais-Suomi', 'Varsinais-Suomi', 80),
(333, 'FI', 'Etelä-Karjala', 'Etelä-Karjala', 80),
(334, 'FI', 'Päijät-Häme', 'Päijät-Häme', 80),
(335, 'FI', 'Kanta-Häme', 'Kanta-Häme', 80),
(336, 'FI', 'Uusimaa', 'Uusimaa', 80),
(337, 'FI', 'Itä-Uusimaa', 'Itä-Uusimaa', 80),
(338, 'FI', 'Kymenlaakso', 'Kymenlaakso', 80),
(339, 'FI', 'Ahvenanmaa', 'Ahvenanmaa', 80),
(340, 'EE', 'EE-37', 'Harjumaa', 74),
(341, 'EE', 'EE-39', 'Hiiumaa', 74),
(342, 'EE', 'EE-44', 'Ida-Virumaa', 74),
(343, 'EE', 'EE-49', 'Jõgevamaa', 74),
(344, 'EE', 'EE-51', 'Järvamaa', 74),
(345, 'EE', 'EE-57', 'Läänemaa', 74),
(346, 'EE', 'EE-59', 'Lääne-Virumaa', 74),
(347, 'EE', 'EE-65', 'Põlvamaa', 74),
(348, 'EE', 'EE-67', 'Pärnumaa', 74),
(349, 'EE', 'EE-70', 'Raplamaa', 74),
(350, 'EE', 'EE-74', 'Saaremaa', 74),
(351, 'EE', 'EE-78', 'Tartumaa', 74),
(352, 'EE', 'EE-82', 'Valgamaa', 74),
(353, 'EE', 'EE-84', 'Viljandimaa', 74),
(354, 'EE', 'EE-86', 'Võrumaa', 74),
(355, 'LV', 'LV-DGV', 'Daugavpils', 125),
(356, 'LV', 'LV-JEL', 'Jelgava', 125),
(357, 'LV', 'Jēkabpils', 'Jēkabpils', 125),
(358, 'LV', 'LV-JUR', 'Jūrmala', 125),
(359, 'LV', 'LV-LPX', 'Liepāja', 125),
(360, 'LV', 'LV-LE', 'Liepājas novads', 125),
(361, 'LV', 'LV-REZ', 'Rēzekne', 125),
(362, 'LV', 'LV-RIX', 'Rīga', 125),
(363, 'LV', 'LV-RI', 'Rīgas novads', 125),
(364, 'LV', 'Valmiera', 'Valmiera', 125),
(365, 'LV', 'LV-VEN', 'Ventspils', 125),
(366, 'LV', 'Aglonas novads', 'Aglonas novads', 125),
(367, 'LV', 'LV-AI', 'Aizkraukles novads', 125),
(368, 'LV', 'Aizputes novads', 'Aizputes novads', 125),
(369, 'LV', 'Aknīstes novads', 'Aknīstes novads', 125),
(370, 'LV', 'Alojas novads', 'Alojas novads', 125),
(371, 'LV', 'Alsungas novads', 'Alsungas novads', 125),
(372, 'LV', 'LV-AL', 'Alūksnes novads', 125),
(373, 'LV', 'Amatas novads', 'Amatas novads', 125),
(374, 'LV', 'Apes novads', 'Apes novads', 125),
(375, 'LV', 'Auces novads', 'Auces novads', 125),
(376, 'LV', 'Babītes novads', 'Babītes novads', 125),
(377, 'LV', 'Baldones novads', 'Baldones novads', 125),
(378, 'LV', 'Baltinavas novads', 'Baltinavas novads', 125),
(379, 'LV', 'LV-BL', 'Balvu novads', 125),
(380, 'LV', 'LV-BU', 'Bauskas novads', 125),
(381, 'LV', 'Beverīnas novads', 'Beverīnas novads', 125),
(382, 'LV', 'Brocēnu novads', 'Brocēnu novads', 125),
(383, 'LV', 'Burtnieku novads', 'Burtnieku novads', 125),
(384, 'LV', 'Carnikavas novads', 'Carnikavas novads', 125),
(385, 'LV', 'Cesvaines novads', 'Cesvaines novads', 125),
(386, 'LV', 'Ciblas novads', 'Ciblas novads', 125),
(387, 'LV', 'LV-CE', 'Cēsu novads', 125),
(388, 'LV', 'Dagdas novads', 'Dagdas novads', 125),
(389, 'LV', 'LV-DA', 'Daugavpils novads', 125),
(390, 'LV', 'LV-DO', 'Dobeles novads', 125),
(391, 'LV', 'Dundagas novads', 'Dundagas novads', 125),
(392, 'LV', 'Durbes novads', 'Durbes novads', 125),
(393, 'LV', 'Engures novads', 'Engures novads', 125),
(394, 'LV', 'Garkalnes novads', 'Garkalnes novads', 125),
(395, 'LV', 'Grobiņas novads', 'Grobiņas novads', 125),
(396, 'LV', 'LV-GU', 'Gulbenes novads', 125),
(397, 'LV', 'Iecavas novads', 'Iecavas novads', 125),
(398, 'LV', 'Ikšķiles novads', 'Ikšķiles novads', 125),
(399, 'LV', 'Ilūkstes novads', 'Ilūkstes novads', 125),
(400, 'LV', 'Inčukalna novads', 'Inčukalna novads', 125),
(401, 'LV', 'Jaunjelgavas novads', 'Jaunjelgavas novads', 125),
(402, 'LV', 'Jaunpiebalgas novads', 'Jaunpiebalgas novads', 125),
(403, 'LV', 'Jaunpils novads', 'Jaunpils novads', 125),
(404, 'LV', 'LV-JL', 'Jelgavas novads', 125),
(405, 'LV', 'LV-JK', 'Jēkabpils novads', 125),
(406, 'LV', 'Kandavas novads', 'Kandavas novads', 125),
(407, 'LV', 'Kokneses novads', 'Kokneses novads', 125),
(408, 'LV', 'Krimuldas novads', 'Krimuldas novads', 125),
(409, 'LV', 'Krustpils novads', 'Krustpils novads', 125),
(410, 'LV', 'LV-KR', 'Krāslavas novads', 125),
(411, 'LV', 'LV-KU', 'Kuldīgas novads', 125),
(412, 'LV', 'Kārsavas novads', 'Kārsavas novads', 125),
(413, 'LV', 'Lielvārdes novads', 'Lielvārdes novads', 125),
(414, 'LV', 'LV-LM', 'Limbažu novads', 125),
(415, 'LV', 'Lubānas novads', 'Lubānas novads', 125),
(416, 'LV', 'LV-LU', 'Ludzas novads', 125),
(417, 'LV', 'Līgatnes novads', 'Līgatnes novads', 125),
(418, 'LV', 'Līvānu novads', 'Līvānu novads', 125),
(419, 'LV', 'LV-MA', 'Madonas novads', 125),
(420, 'LV', 'Mazsalacas novads', 'Mazsalacas novads', 125),
(421, 'LV', 'Mālpils novads', 'Mālpils novads', 125),
(422, 'LV', 'Mārupes novads', 'Mārupes novads', 125),
(423, 'LV', 'Naukšēnu novads', 'Naukšēnu novads', 125),
(424, 'LV', 'Neretas novads', 'Neretas novads', 125),
(425, 'LV', 'Nīcas novads', 'Nīcas novads', 125),
(426, 'LV', 'LV-OG', 'Ogres novads', 125),
(427, 'LV', 'Olaines novads', 'Olaines novads', 125),
(428, 'LV', 'Ozolnieku novads', 'Ozolnieku novads', 125),
(429, 'LV', 'LV-PR', 'Preiļu novads', 125),
(430, 'LV', 'Priekules novads', 'Priekules novads', 125),
(431, 'LV', 'Priekuļu novads', 'Priekuļu novads', 125),
(432, 'LV', 'Pārgaujas novads', 'Pārgaujas novads', 125),
(433, 'LV', 'Pāvilostas novads', 'Pāvilostas novads', 125),
(434, 'LV', 'Pļaviņu novads', 'Pļaviņu novads', 125),
(435, 'LV', 'Raunas novads', 'Raunas novads', 125),
(436, 'LV', 'Riebiņu novads', 'Riebiņu novads', 125),
(437, 'LV', 'Rojas novads', 'Rojas novads', 125),
(438, 'LV', 'Ropažu novads', 'Ropažu novads', 125),
(439, 'LV', 'Rucavas novads', 'Rucavas novads', 125),
(440, 'LV', 'Rugāju novads', 'Rugāju novads', 125),
(441, 'LV', 'Rundāles novads', 'Rundāles novads', 125),
(442, 'LV', 'LV-RE', 'Rēzeknes novads', 125),
(443, 'LV', 'Rūjienas novads', 'Rūjienas novads', 125),
(444, 'LV', 'Salacgrīvas novads', 'Salacgrīvas novads', 125),
(445, 'LV', 'Salas novads', 'Salas novads', 125),
(446, 'LV', 'Salaspils novads', 'Salaspils novads', 125),
(447, 'LV', 'LV-SA', 'Saldus novads', 125),
(448, 'LV', 'Saulkrastu novads', 'Saulkrastu novads', 125),
(449, 'LV', 'Siguldas novads', 'Siguldas novads', 125),
(450, 'LV', 'Skrundas novads', 'Skrundas novads', 125),
(451, 'LV', 'Skrīveru novads', 'Skrīveru novads', 125),
(452, 'LV', 'Smiltenes novads', 'Smiltenes novads', 125),
(453, 'LV', 'Stopiņu novads', 'Stopiņu novads', 125),
(454, 'LV', 'Strenču novads', 'Strenču novads', 125),
(455, 'LV', 'Sējas novads', 'Sējas novads', 125),
(456, 'LV', 'LV-TA', 'Talsu novads', 125),
(457, 'LV', 'LV-TU', 'Tukuma novads', 125),
(458, 'LV', 'Tērvetes novads', 'Tērvetes novads', 125),
(459, 'LV', 'Vaiņodes novads', 'Vaiņodes novads', 125),
(460, 'LV', 'LV-VK', 'Valkas novads', 125),
(461, 'LV', 'LV-VM', 'Valmieras novads', 125),
(462, 'LV', 'Varakļānu novads', 'Varakļānu novads', 125),
(463, 'LV', 'Vecpiebalgas novads', 'Vecpiebalgas novads', 125),
(464, 'LV', 'Vecumnieku novads', 'Vecumnieku novads', 125),
(465, 'LV', 'LV-VE', 'Ventspils novads', 125),
(466, 'LV', 'Viesītes novads', 'Viesītes novads', 125),
(467, 'LV', 'Viļakas novads', 'Viļakas novads', 125),
(468, 'LV', 'Viļānu novads', 'Viļānu novads', 125),
(469, 'LV', 'Vārkavas novads', 'Vārkavas novads', 125),
(470, 'LV', 'Zilupes novads', 'Zilupes novads', 125),
(471, 'LV', 'Ādažu novads', 'Ādažu novads', 125),
(472, 'LV', 'Ērgļu novads', 'Ērgļu novads', 125),
(473, 'LV', 'Ķeguma novads', 'Ķeguma novads', 125),
(474, 'LV', 'Ķekavas novads', 'Ķekavas novads', 125),
(475, 'LT', 'LT-AL', 'Alytaus Apskritis', 131),
(476, 'LT', 'LT-KU', 'Kauno Apskritis', 131),
(477, 'LT', 'LT-KL', 'Klaipėdos Apskritis', 131),
(478, 'LT', 'LT-MR', 'Marijampolės Apskritis', 131),
(479, 'LT', 'LT-PN', 'Panevėžio Apskritis', 131),
(480, 'LT', 'LT-SA', 'Šiaulių Apskritis', 131),
(481, 'LT', 'LT-TA', 'Tauragės Apskritis', 131),
(482, 'LT', 'LT-TE', 'Telšių Apskritis', 131),
(483, 'LT', 'LT-UT', 'Utenos Apskritis', 131),
(484, 'LT', 'LT-VL', 'Vilniaus Apskritis', 131),
(485, 'BR', 'AC', 'Acre', 31),
(486, 'BR', 'AL', 'Alagoas', 31),
(487, 'BR', 'AP', 'Amapá', 31),
(488, 'BR', 'AM', 'Amazonas', 31),
(489, 'BR', 'BA', 'Bahia', 31),
(490, 'BR', 'CE', 'Ceará', 31),
(491, 'BR', 'ES', 'Espírito Santo', 31),
(492, 'BR', 'GO', 'Goiás', 31),
(493, 'BR', 'MA', 'Maranhão', 31),
(494, 'BR', 'MT', 'Mato Grosso', 31),
(495, 'BR', 'MS', 'Mato Grosso do Sul', 31),
(496, 'BR', 'MG', 'Minas Gerais', 31),
(497, 'BR', 'PA', 'Pará', 31),
(498, 'BR', 'PB', 'Paraíba', 31),
(499, 'BR', 'PR', 'Paraná', 31),
(500, 'BR', 'PE', 'Pernambuco', 31),
(501, 'BR', 'PI', 'Piauí', 31),
(502, 'BR', 'RJ', 'Rio de Janeiro', 31),
(503, 'BR', 'RN', 'Rio Grande do Norte', 31),
(504, 'BR', 'RS', 'Rio Grande do Sul', 31),
(505, 'BR', 'RO', 'Rondônia', 31),
(506, 'BR', 'RR', 'Roraima', 31),
(507, 'BR', 'SC', 'Santa Catarina', 31),
(508, 'BR', 'SP', 'São Paulo', 31),
(509, 'BR', 'SE', 'Sergipe', 31),
(510, 'BR', 'TO', 'Tocantins', 31),
(511, 'BR', 'DF', 'Distrito Federal', 31),
(512, 'HR', 'HR-01', 'Zagrebačka županija', 59),
(513, 'HR', 'HR-02', 'Krapinsko-zagorska županija', 59),
(514, 'HR', 'HR-03', 'Sisačko-moslavačka županija', 59),
(515, 'HR', 'HR-04', 'Karlovačka županija', 59),
(516, 'HR', 'HR-05', 'Varaždinska županija', 59),
(517, 'HR', 'HR-06', 'Koprivničko-križevačka županija', 59),
(518, 'HR', 'HR-07', 'Bjelovarsko-bilogorska županija', 59),
(519, 'HR', 'HR-08', 'Primorsko-goranska županija', 59),
(520, 'HR', 'HR-09', 'Ličko-senjska županija', 59),
(521, 'HR', 'HR-10', 'Virovitičko-podravska županija', 59),
(522, 'HR', 'HR-11', 'Požeško-slavonska županija', 59),
(523, 'HR', 'HR-12', 'Brodsko-posavska županija', 59),
(524, 'HR', 'HR-13', 'Zadarska županija', 59),
(525, 'HR', 'HR-14', 'Osječko-baranjska županija', 59),
(526, 'HR', 'HR-15', 'Šibensko-kninska županija', 59),
(527, 'HR', 'HR-16', 'Vukovarsko-srijemska županija', 59),
(528, 'HR', 'HR-17', 'Splitsko-dalmatinska županija', 59),
(529, 'HR', 'HR-18', 'Istarska županija', 59),
(530, 'HR', 'HR-19', 'Dubrovačko-neretvanska županija', 59),
(531, 'HR', 'HR-20', 'Međimurska županija', 59),
(532, 'HR', 'HR-21', 'Grad Zagreb', 59),
(533, 'IN', 'AN', 'Andaman and Nicobar Islands', 106),
(534, 'IN', 'AP', 'Andhra Pradesh', 106),
(535, 'IN', 'AR', 'Arunachal Pradesh', 106),
(536, 'IN', 'AS', 'Assam', 106),
(537, 'IN', 'BR', 'Bihar', 106),
(538, 'IN', 'CH', 'Chandigarh', 106),
(539, 'IN', 'CT', 'Chhattisgarh', 106),
(540, 'IN', 'DN', 'Dadra and Nagar Haveli', 106),
(541, 'IN', 'DD', 'Daman and Diu', 106),
(542, 'IN', 'DL', 'Delhi', 106),
(543, 'IN', 'GA', 'Goa', 106),
(544, 'IN', 'GJ', 'Gujarat', 106),
(545, 'IN', 'HR', 'Haryana', 106),
(546, 'IN', 'HP', 'Himachal Pradesh', 106),
(547, 'IN', 'JK', 'Jammu and Kashmir', 106),
(548, 'IN', 'JH', 'Jharkhand', 106),
(549, 'IN', 'KA', 'Karnataka', 106),
(550, 'IN', 'KL', 'Kerala', 106),
(551, 'IN', 'LD', 'Lakshadweep', 106),
(552, 'IN', 'MP', 'Madhya Pradesh', 106),
(553, 'IN', 'MH', 'Maharashtra', 106),
(554, 'IN', 'MN', 'Manipur', 106),
(555, 'IN', 'ML', 'Meghalaya', 106),
(556, 'IN', 'MZ', 'Mizoram', 106),
(557, 'IN', 'NL', 'Nagaland', 106),
(558, 'IN', 'OR', 'Odisha', 106),
(559, 'IN', 'PY', 'Puducherry', 106),
(560, 'IN', 'PB', 'Punjab', 106),
(561, 'IN', 'RJ', 'Rajasthan', 106),
(562, 'IN', 'SK', 'Sikkim', 106),
(563, 'IN', 'TN', 'Tamil Nadu', 106),
(564, 'IN', 'TG', 'Telangana', 106),
(565, 'IN', 'TR', 'Tripura', 106),
(566, 'IN', 'UP', 'Uttar Pradesh', 106),
(567, 'IN', 'UT', 'Uttarakhand', 106),
(568, 'IN', 'WB', 'West Bengal', 106);

-- --------------------------------------------------------

--
-- Table structure for table `datagrid_saved_filters`
--

CREATE TABLE `datagrid_saved_filters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `src` varchar(255) NOT NULL,
  `applied` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`applied`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `emails`
--

CREATE TABLE `emails` (
  `id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `source` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `reply` text DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `folders` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`folders`)),
  `from` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`from`)),
  `sender` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`sender`)),
  `reply_to` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`reply_to`)),
  `cc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`cc`)),
  `bcc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`bcc`)),
  `unique_id` varchar(255) DEFAULT NULL,
  `message_id` varchar(255) NOT NULL,
  `reference_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`reference_ids`)),
  `person_id` int(10) UNSIGNED DEFAULT NULL,
  `lead_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `emails`
--

INSERT INTO `emails` (`id`, `subject`, `source`, `user_type`, `name`, `reply`, `is_read`, `folders`, `from`, `sender`, `reply_to`, `cc`, `bcc`, `unique_id`, `message_id`, `reference_ids`, `person_id`, `lead_id`, `created_at`, `updated_at`, `parent_id`) VALUES
(1, 'test personal project', 'web', 'admin', NULL, '<p>this is test personal project</p>', 1, '[\"inbox\"]', '\"laravel@krayincrm.com\"', NULL, '[\"abhishek62.spanco@gmail.com\"]', NULL, NULL, '1778937630@webkul.com', '1778937630@webkul.com', '[\"1778937630@webkul.com\"]', NULL, NULL, '2026-05-16 13:20:30', '2026-06-12 18:24:09', NULL);
INSERT INTO `emails` (`id`, `subject`, `source`, `user_type`, `name`, `reply`, `is_read`, `folders`, `from`, `sender`, `reply_to`, `cc`, `bcc`, `unique_id`, `message_id`, `reference_ids`, `person_id`, `lead_id`, `created_at`, `updated_at`, `parent_id`) VALUES
(2, 'AI Breakthroughs + Free Resources + 50% Off IEEE', 'email', 'person', 'IEEE Membership', '<!doctype html>\r\n<html lang=\"en-US\" xmlns=\"http://www.w3.org/1999/xhtml\" xmlns:v=\"urn:schemas-microsoft-com:vml\" xmlns:o=\"urn:schemas-microsoft-com:office:office\">\r\n<head>\r\n<title></title>\r\n<!--[if !mso]><!-- -->\r\n<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n<!--<![endif]-->\r\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\r\n<meta name=\"viewport\" content=\"width=device-width,initial-scale=1\">\r\n<style type=\"text/css\">#outlook a { padding:0; }\r\n          table { border-spacing:0;}\r\n          img { border:0;height:auto;line-height:100%; outline:none;text-decoration:none;-ms-interpolation-mode:bicubic; }\r\n          p { display:block; }</style>\r\n<!--[if mso]>         \r\n          <xml>         \r\n            <o:OfficeDocumentSettings xmlns:o=\"urn:schemas-microsoft-com:office:office\">     \r\n              <o:AllowPNG/>           \r\n              <o:PixelsPerInch>96</o:PixelsPerInch>         \r\n            </o:OfficeDocumentSettings>      \r\n            <w:WordDocument xmlns:w=\"urn:schemas-microsoft-com:office:word\">\r\n              <w:DontUseAdvancedTypographyReadingMail/>\r\n            </w:WordDocument>       \r\n          </xml>             \r\n          <style type=\"text/css\">\r\n            table { border-collapse:collapse;mso-table-lspace:0pt;mso-table-rspace:0pt; }\r\n            .mj-outlook-group-fix { width:100% !important; }\r\n          </style>         \r\n        <![endif]-->\r\n<!--[if !mso]><!-->\r\n<link href=\"https://client-data.knak.io/production/company_data/608319dc9b8e2/custom-fonts/617b07765c709/fonts.css\" rel=\"stylesheet\" type=\"text/css\">\r\n<link href=\"https://client-data.knak.io/production/company_data/608319dc9b8e2/custom-fonts/617b07765c709/fonts.css\" rel=\"stylesheet\" type=\"text/css\">\r\n<style type=\"text/css\">@import url(https://client-data.knak.io/production/company_data/608319dc9b8e2/custom-fonts/617b07765c709/fonts.css);\r\n@import url(https://client-data.knak.io/production/company_data/608319dc9b8e2/custom-fonts/617b07765c709/fonts.css);</style>\r\n<!--<![endif]-->\r\n<style type=\"text/css\">@media only screen and (min-width:480px) {\r\n        .mj-column-per-100 { width:100% !important; max-width: 100%; }\r\n.mj-column-per-51 { width:51% !important; max-width: 51%; }\r\n.mj-column-per-49 { width:49% !important; max-width: 49%; }\r\n.mj-column-per-35 { width:35% !important; max-width: 35%; }\r\n.mj-column-per-65 { width:65% !important; max-width: 65%; }\r\n      }</style>\r\n<style type=\"text/css\">body, .body { margin:0;padding:0;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%; }\r\n.links-006699-underline a { color: #006699; text-decoration: underline; }\r\n#body #main [x-apple-data-detectors-type] { \r\n          color: inherit !important; \r\n          -webkit-text-decoration-color: inherit !important; \r\n          text-decoration: inherit !important;\r\n          font-weight: inherit !important;\r\n         }\r\nu ~ div .img-container img + div { display: none }\r\n[data-ogsc] .img-container img:hover, [data-ogsb] .img-container img:hover { background-color: transparent !important }\r\n.mso-button-dark-mode a {background: transparent !important;}\r\n.links-FFFFFF-underline a { color: #FFFFFF; text-decoration: underline; }\r\n[data-ogsc] .social-container img:hover, [data-ogsb] .social-container img:hover { background-color: transparent !important }\r\n        \r\n\r\n        \r\n        \r\n            @media only screen and (min-width:480px) {        \r\n                .padding-0px-30px-0px-30px { padding: 0px 30px 0px 30px !important}\r\n.padding-0px { padding: 0px !important}\r\n.margin-0-auto-0-0 { margin: 0 auto 0 0 !important}\r\n.text-align-left { text-align: left !important}\r\n.padding-0px-25px-0px-25px { padding: 0px 25px 0px 25px !important}\r\n.img-full-width { max-width: 100% !important}\r\n.padding-20px-25px-10px-25px { padding: 20px 25px 10px 25px !important}\r\n.padding-10px-25px-10px-25px { padding: 10px 25px 10px 25px !important}\r\n            }</style>\r\n<style type=\"text/css\">ul{display: block;}sup, sub{line-height:0;}body a{text-decoration: none; color: #006699;}.image-highlight{transition: 0.3s;}.image-highlight:hover{filter: brightness(1.2);}@media only screen and (min-width: 480px) { .hide-on-mobile{display:block !important;}.hide-on-desktop{display:none !important;} }.hide-on-desktop{display:block;}.hide-on-mobile{display:none;}</style>\r\n<!--[if mso]>\r\n            <style>\r\n                .hide-on-mobile {display:block !important}\r\n            </style>\r\n        <![endif]-->\r\n<!--[if mso]>\r\n                <style>         \r\n                    .mso-text-align-left { text-align: left !important; }\r\n                </style>\r\n            <![endif]-->\r\n<style>[class~=\"x_body\"] { width: 99.9% }</style>\r\n</head>\r\n<body style=\"word-spacing:normal;background-color:#E4E6EC;\" class=\"body\" id=\"body\"><style type=\"text/css\">div#emailPreHeader{ display: none !important; }</style><div id=\"emailPreHeader\" style=\"mso-hide:all; visibility:hidden; opacity:0; color:transparent; mso-line-height-rule:exactly; line-height:0; font-size:0px; overflow:hidden; border-width:0; display:none !important;\"> </div>\r\n<!--[if !mso 9]><!-->\r\n<div id=\"emailPreHeader\" class=\"mktEditable\" style=\"display: none;\">\r\nExplore what IEEE members are learning,﻿ building,﻿ and accessing today\r\n</div>\r\n<div style=\"display: none;\">\r\n                                                    ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏  ‍͏  ͏ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ ͏‌ ­ ­ ­ ­ &nbsp;\r\n</div>\r\n<!--<![endif]-->\r\n<img id=\"k_trk\" src=\"https://production.k-trk.com/ktrack/?k=6a0e146b30330&amp;l=61132885\" style=\"height:1px !important;\r\n                width:1px !important;\r\n                border-width:0 !important;\r\n                margin-top:0 !important;\r\n                margin-bottom:0 !important;\r\n                margin-right:0 !important;\r\n                margin-left:0 !important;\r\n                padding-top:0 !important;\r\n                padding-bottom:0 !important;\r\n                padding-right:0 !important;\r\n                padding-left:0 !important;\r\n                display:block;\" alt=\"\" title=\"\" border=\"0\" width=\"1\" height=\"1\">\r\n<div style=\"background-color:#E4E6EC;background-position:center center;background-size:auto;background-repeat:repeat;\" id=\"main\">\r\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\" class=\"section\">\r\n<tbody>\r\n<tr>\r\n<td align=\"center\">\r\n<div role=\"none\">\r\n<!--[if mso | IE]><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"block-grid-outlook\" style=\"width:600px;\" width=\"600\" ><tr><td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\"><![endif]-->\r\n<div style=\"margin:0 auto;max-width:600px;\">\r\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"font-size:0px;padding:0px;text-align:center;vertical-align:top;\" class=\"block-grid\">\r\n<!--[if mso | IE]><table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td style=\"vertical-align:top;width:600px;\" ><![endif]-->\r\n<div class=\"mj-column-per-100 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-radius:0px;vertical-align:top;\" width=\"100%\">\r\n<tbody>\r\n<tr>\r\n<td class=\"text-container\" style=\"font-size:0px;padding:5px 25px 5px 25px;word-break:break-word;text-align:center;\">\r\n<div class=\"mktEditable\" id=\"ktext-hoz5ual49\" style=\"font-family:\'Formata\', Arial, sans-serif;font-size:13px;font-weight:normal;letter-spacing:none;line-height:1.2;text-align:center;mso-line-height-alt:1em;color:#000000;\">\r\n<div class=\"links-006699-underline\">\r\n<div style=\"font-family:\'Formata\', Arial, sans-serif;font-size:13px;font-weight:normal;letter-spacing:none;line-height:1.2;text-align:center;mso-line-height-alt:1em;color:#000000;\">\r\n<p style=\"margin: 0 0 0px 0;\">To view this email as a webpage, <a href=\"https://connect.ieee.org/v/NzU2LUdQSC04OTkAAAGiRvlo7Xta_zcDtVRQreWmDl2CI1Prye1qC2ip5Ckv5xOTr5lvD6NX9tEr3vUeTLFaXb23y8Y=\" target=\"_blank\" rel=\"noopener\" style=\"color: rgb(0, 102, 153); text-decoration: underline;\">click here</a>.</p>\r\n</div>\r\n</div>\r\n</div></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<!--[if mso | IE]></td></tr></table><![endif]--></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<!--[if mso | IE]></td></tr></table><![endif]-->\r\n</div></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"background-color:#E4E6EC;width:100%;\" class=\"section\">\r\n<tbody>\r\n<tr>\r\n<td align=\"center\">\r\n<div role=\"none\">\r\n<!--[if mso | IE]><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"block-grid-outlook\" style=\"width:600px;\" width=\"600\" ><tr><td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\"><![endif]-->\r\n<div style=\"margin:0 auto;max-width:600px;\">\r\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"font-size:0px;padding:0px;text-align:center;vertical-align:top;\" class=\"block-grid\">\r\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n<tbody>\r\n<tr>\r\n<td style=\"background-color:#FFFFFF;line-height:0;font-size:0;direction:ltr;\">\r\n<!--[if mso | IE]><table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td style=\"vertical-align:top;width:600px;\" ><![endif]-->\r\n<div class=\"mj-column-per-100 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-radius:0px;vertical-align:top;\" width=\"100%\">\r\n<tbody>\r\n<tr>\r\n<td class=\"img-container\" style=\"font-size:0px;padding:0px;word-break:break-word;text-align:center;\">\r\n<div style=\"margin:0 auto;\">\r\n<div class=\"mktoImg\" id=\"kimage-przjry2wh\">\r\n<img height=\"auto\" width=\"600\" src=\"https://engage.ieee.org/rs/ieeecorporate/images/upeoy42kIUBG9MgsGLVxswpK9yY8UD30mHZAuuZG.png\" style=\"border:none;outline:none;text-decoration:none;height:auto;width:100%;font-size:13px;display:block;\">\r\n</div>\r\n<!--[if !mso 9]><!-->\r\n<div class=\"mktEditable\" id=\"image-plain-text-uk397dj1n\" style=\"mso-hide:all; visibility:hidden; opacity:0; color:transparent; mso-line-height-rule:exactly; line-height:0; font-size:0px; overflow:hidden; border-width:0; display:none !important;\">\r\n[ Image ]\r\n</div>\r\n<!--<![endif]-->\r\n</div></td>\r\n</tr>\r\n<tr>\r\n<td style=\"font-size:0px;word-break:break-word;\">\r\n<div style=\"line-height:30px;height:30px;mso-line-height-alt:30px;\">\r\n&nbsp;\r\n</div></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<!--[if mso | IE]></td></tr></table><![endif]--></td>\r\n</tr>\r\n</tbody>\r\n</table></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<!--[if mso | IE]></td></tr></table><![endif]-->\r\n</div></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\" class=\"section\">\r\n<tbody>\r\n<tr>\r\n<td align=\"center\">\r\n<div role=\"none\">\r\n<!--[if mso | IE]><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"block-grid-outlook\" style=\"width:600px;\" width=\"600\" ><tr><td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\"><![endif]-->\r\n<div style=\"background:#FFFFFF;background-color:#FFFFFF;margin:0 auto;max-width:600px;\">\r\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"background-color:#FFFFFF;width:100%;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"font-size:0px;padding:0px 10px 0px 10px;text-align:center;vertical-align:top;mso-padding-alt:0px 30px 0px 30px;\" class=\"block-grid padding-0px-30px-0px-30px\">\r\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n<tbody>\r\n<tr>\r\n<td style=\"background-color:#FFFFFF;line-height:0;font-size:0;direction:ltr;\">\r\n<!--[if mso | IE]><table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td style=\"vertical-align:top;width:540px;\" ><![endif]-->\r\n<div class=\"mj-column-per-100 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-radius:0px;vertical-align:top;\" width=\"100%\">\r\n<tbody>\r\n<tr>\r\n<td>\r\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\" class=\"section\">\r\n<tbody>\r\n<tr>\r\n<td align=\"center\" style=\"font-size:0px;text-align:center;vertical-align:top;padding:0px;word-break:break-word;\">\r\n<div role=\"none\">\r\n<!--[if mso | IE]><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td><table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td style=\"vertical-align:top;width:275.4px;\" ><![endif]-->\r\n<div class=\"mj-column-per-51 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-radius:0px;vertical-align:top;\" width=\"100%\">\r\n<tbody>\r\n<tr>\r\n<td class=\"padding-0px img-container\" style=\"font-size:0px;padding:0px 10px 0px 10px;word-break:break-word;mso-padding-alt:0px;text-align:left;\">\r\n<div style=\"margin:0 auto;max-width:274px;\" class=\"margin-0-auto-0-0\">\r\n<div class=\"mktoImg\" id=\"kimage-hnb72d2c3\">\r\n<a href=\r\n\"https://connect.ieee.org/NzU2LUdQSC04OTkAAAGiRvlo7cYTFnbIJ8wX8W-iUBo_ltBTG9-I1O4YAi_pvKOdXZAuDOlPqEB1WBSV-GHPTMralDM=\" target=\"_blank\" style=\"text-decoration: none; color: #006699;\"\r\n><img height=\"auto\" width=\"274\" src=\"https://engage.ieee.org/rs/ieeecorporate/images/cHDzEC70y2mJZbkoXq8RSzQSoxcRRcO4Mkiod0Zq.png\" style=\"border:none;outline:none;text-decoration:none;height:auto;width:100%;font-size:13px;display:block;\"></a>\r\n</div>\r\n<!--[if !mso 9]><!-->\r\n<div class=\"mktEditable\" id=\"image-plain-text-udu43jygm\" style=\"mso-hide:all; visibility:hidden; opacity:0; color:transparent; mso-line-height-rule:exactly; line-height:0; font-size:0px; overflow:hidden; border-width:0; display:none !important;\">\r\n[ Image ] [[https://www.ieee.org/membership/join?utm_source=mkto&amp;utm_medium=email&amp;utm_campaign=mmo_learnmore26&amp;utm_id=&amp;utm_content=checkin3]]\r\n</div>\r\n<!--<![endif]-->\r\n</div></td>\r\n</tr>\r\n<!--[if !mso]><!-->\r\n<tr>\r\n<td class=\"hide-on-desktop\" style=\"display: block; font-size: 0px; word-break: break-word;\">\r\n<div style=\"line-height:7px;height:7px;mso-line-height-alt:7px;\">\r\n&nbsp;\r\n</div></td>\r\n</tr>\r\n<!--<![endif]-->\r\n</tbody>\r\n</table>\r\n</div>\r\n<!--[if mso | IE]></td><td style=\"vertical-align:top;width:264.6px;\" ><![endif]-->\r\n<div class=\"mj-column-per-49 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-radius:0px;vertical-align:top;\" width=\"100%\">\r\n<tbody>\r\n<tr>\r\n<td class=\"padding-0px-25px-0px-25px text-container\" style=\"font-size:0px;padding:10px 10px 10px 10px;word-break:break-word;mso-padding-alt:0px 25px 0px 25px;text-align:center;\">\r\n<div class=\"mktEditable\" id=\"ktext-eg409y5yk\" style=\"font-family:\'Formata\', Arial, sans-serif;font-size:18px;font-weight:bold;letter-spacing:none;line-height:1.2;text-align:center;mso-line-height-alt:1.375em;color:#000000;\">\r\n<div class=\"links-006699-underline\">\r\n<div style=\"font-family:\'Formata\', Arial, sans-serif;font-size:18px;font-weight:bold;letter-spacing:none;line-height:1.2;text-align:center;mso-line-height-alt:1.375em;color:#000000;\" class=\"mso-text-align-left text-align-left\">\r\n<p style=\"margin: 0 0 0px 0;\"><span><a href=\r\n\"https://connect.ieee.org/NzU2LUdQSC04OTkAAAGiRvlo7cYTFnbIJ8wX8W-iUBo_ltBTG9-I1O4YAi_pvKOdXZAuDOlPqEB1WBSV-GHPTMralDM=\" target=\"_blank\" rel=\"noopener\" style=\"color: rgb(0, 102, 153); text-decoration: underline;\"\r\n>Try IEEE at 50% Off—Now Through 15 August 2026</a></span></p>\r\n</div>\r\n</div>\r\n</div></td>\r\n</tr>\r\n<tr>\r\n<td class=\"padding-0px-25px-0px-25px text-container\" style=\"font-size:0px;padding:0px 10px 0px 10px;word-break:break-word;mso-padding-alt:0px 25px 0px 25px;text-align:center;\">\r\n<div class=\"mktEditable\" id=\"ktext-t9lyagcc1\" style=\"font-family:\'Formata\', Arial, sans-serif;font-size:16px;font-weight:normal;letter-spacing:none;line-height:1.40;text-align:center;mso-line-height-alt:1.375em;color:#000000;\">\r\n<div class=\"links-006699-underline\">\r\n<div style=\"font-family:\'Formata\', Arial, sans-serif;font-size:16px;font-weight:normal;letter-spacing:none;line-height:1.40;text-align:center;mso-line-height-alt:1.375em;color:#000000;\" class=\"mso-text-align-left text-align-left\">\r\n<p style=\"margin: 0 0 0px 0;\"><span style=\"font-size: 16px;\">Join over 500,000 technologists and get full access to IEEE benefits through the end of the year.</span></p>\r\n</div>\r\n</div>\r\n</div></td>\r\n</tr>\r\n<tr>\r\n<td valign=\"middle\" class=\"button-container\" style=\"font-size:0px;padding:10px 25px;word-break:break-word;text-align:center;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-collapse:separate;line-height:100%;margin:0 auto;\">\r\n<tbody>\r\n<tr>\r\n<td align=\"center\" bgcolor=\"#00629B\" role=\"presentation\" style=\"border:none;border-radius:50px;cursor:auto;mso-padding-alt:10px 10px 10px 10px;text-align:center;background:#00629B;\" valign=\"middle\">\r\n<div class=\"mktEditable\" id=\"kbutton-le5auhm9q\">\r\n<a href=\r\n\"https://connect.ieee.org/NzU2LUdQSC04OTkAAAGiRvlo7cYTFnbIJ8wX8W-iUBo_ltBTG9-I1O4YAi_pvKOdXZAuDOlPqEB1WBSV-GHPTMralDM=\" style=\"display: inline-block; background: #00629B; color: #ffffff; font-family: \'Formata\', Arial, sans-serif; font-size: 16px; font-weight: normal; line-height: 1.2; margin: 0; text-decoration: none; text-transform: none; padding: 10px 10px 10px 10px; mso-padding-alt: 0px; border-radius: 50px;\" target=\"_blank\"\r\n><strong><span style=\"font-size: 16px;\">Become an IEEE Member</span></strong></a>\r\n</div></td>\r\n</tr>\r\n</tbody>\r\n</table></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<!--[if mso | IE]></td></tr></table></td></tr></table><![endif]-->\r\n</div></td>\r\n</tr>\r\n</tbody>\r\n</table></td>\r\n</tr>\r\n<tr>\r\n<td style=\"font-size:0px;word-break:break-word;\">\r\n<div style=\"line-height:20px;height:20px;mso-line-height-alt:20px;\">\r\n&nbsp;\r\n</div></td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\" class=\"section\">\r\n<tbody>\r\n<tr>\r\n<td align=\"center\" style=\"font-size:0px;text-align:center;vertical-align:top;padding:0px;word-break:break-word;\">\r\n<div role=\"none\">\r\n<!--[if mso | IE]><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td><table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td style=\"vertical-align:top;width:189px;\" ><![endif]-->\r\n<div class=\"mj-column-per-35 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-radius:0px;vertical-align:top;\" width=\"100%\">\r\n<tbody>\r\n<tr>\r\n<td class=\"padding-0px img-container\" style=\"font-size:0px;padding:0px 10px 0px 10px;word-break:break-word;mso-padding-alt:0px;text-align:left;\">\r\n<div style=\"margin:0 auto;max-width:189px;\" class=\"img-full-width margin-0-auto-0-0\">\r\n<div class=\"mktoImg\" id=\"kimage-6u8qry3c3\">\r\n<a href=\r\n\"https://connect.ieee.org/NzU2LUdQSC04OTkAAAGiRvlo7XkRsgkJlSh-2hhPkjIdDJgXQEqb7lOOZZuPY1MF31sTYllogWODK1GUsZaGzWK7ImY=\" target=\"_blank\" style=\"text-decoration: none; color: #006699;\"\r\n><img height=\"auto\" width=\"189\" src=\"https://engage.ieee.org/rs/ieeecorporate/images/I1cow6yTWQVjcb7zNSivCMlwGKpxGCipb9PQvthD.png\" style=\"border:none;outline:none;text-decoration:none;height:auto;width:100%;font-size:13px;display:block;\"></a>\r\n</div>\r\n<!--[if !mso 9]><!-->\r\n<div class=\"mktEditable\" id=\"image-plain-text-jvlmz3e4a\" style=\"mso-hide:all; visibility:hidden; opacity:0; color:transparent; mso-line-height-rule:exactly; line-height:0; font-size:0px; overflow:hidden; border-width:0; display:none !important;\">\r\n[ Image ] [[https://spectrum.ieee.org/sparse-ai?utm_source=mkto&amp;utm_medium=email&amp;utm_campaign=mmo_learnmore26&amp;utm_id=&amp;utm_content=checkin3]]\r\n</div>\r\n<!--<![endif]-->\r\n</div></td>\r\n</tr>\r\n<!--[if !mso]><!-->\r\n<tr>\r\n<td class=\"hide-on-desktop\" style=\"display: block; font-size: 0px; word-break: break-word;\">\r\n<div style=\"line-height:7px;height:7px;mso-line-height-alt:7px;\">\r\n&nbsp;\r\n</div></td>\r\n</tr>\r\n<!--<![endif]-->\r\n</tbody>\r\n</table>\r\n</div>\r\n<!--[if mso | IE]></td><td style=\"vertical-align:top;width:351px;\" ><![endif]-->\r\n<div class=\"mj-column-per-65 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-radius:0px;vertical-align:top;\" width=\"100%\">\r\n<tbody>\r\n<tr>\r\n<td class=\"padding-0px-25px-0px-25px text-container\" style=\"font-size:0px;padding:10px 10px 10px 10px;word-break:break-word;mso-padding-alt:0px 25px 0px 25px;text-align:center;\">\r\n<div class=\"mktEditable\" id=\"ktext-9xq2n477f\" style=\"font-family:\'Formata\', Arial, sans-serif;font-size:15px;font-weight:bold;letter-spacing:none;line-height:1.2;text-align:center;mso-line-height-alt:1.125em;color:#000000;\">\r\n<div class=\"links-006699-underline\">\r\n<div style=\"font-family:\'Formata\', Arial, sans-serif;font-size:15px;font-weight:bold;letter-spacing:none;line-height:1.2;text-align:center;mso-line-height-alt:1.125em;color:#000000;\" class=\"mso-text-align-left text-align-left\">\r\n<p style=\"margin: 0 0 0px 0;\"><a href=\r\n\"https://connect.ieee.org/NzU2LUdQSC04OTkAAAGiRvlo7XkRsgkJlSh-2hhPkjIdDJgXQEqb7lOOZZuPY1MF31sTYllogWODK1GUsZaGzWK7ImY=\" target=\"_blank\" rel=\"noopener\" style=\"color: rgb(0, 102, 153); text-decoration: underline;\"\r\n>Better Hardware Could Turn Zeros into AI Heroes</a></p>\r\n</div>\r\n</div>\r\n</div></td>\r\n</tr>\r\n<tr>\r\n<td class=\"padding-0px-25px-0px-25px text-container\" style=\"font-size:0px;padding:0px 10px 0px 10px;word-break:break-word;mso-padding-alt:0px 25px 0px 25px;text-align:center;\">\r\n<div class=\"mktEditable\" id=\"ktext-wnsvyjrwg\" style=\"font-family:\'Formata\', Arial, sans-serif;font-size:14px;font-weight:normal;letter-spacing:none;line-height:1.40;text-align:center;mso-line-height-alt:1.25em;color:#000000;\">\r\n<div class=\"links-006699-underline\">\r\n<div style=\"font-family:\'Formata\', Arial, sans-serif;font-size:14px;font-weight:normal;letter-spacing:none;line-height:1.40;text-align:center;mso-line-height-alt:1.25em;color:#000000;\" class=\"mso-text-align-left text-align-left\">\r\n<p style=\"margin: 0 0 0px 0;\">Sparse AI is enabling faster, more energy-efficient systems by skipping unnecessary computations.</p>\r\n<p style=\"margin: 0 0 0px 0;\"><a href=\r\n\"https://connect.ieee.org/NzU2LUdQSC04OTkAAAGiRvlo7XkRsgkJlSh-2hhPkjIdDJgXQEqb7lOOZZuPY1MF31sTYllogWODK1GUsZaGzWK7ImY=\" target=\"_blank\" rel=\"noopener\" style=\"color: rgb(0, 102, 153); text-decoration: underline;\"\r\n>Read more &gt;</a></p>\r\n</div>\r\n</div>\r\n</div></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<!--[if mso | IE]></td></tr></table></td></tr></table><![endif]-->\r\n</div></td>\r\n</tr>\r\n</tbody>\r\n</table></td>\r\n</tr>\r\n<tr>\r\n<td style=\"font-size:0px;word-break:break-word;\">\r\n<div style=\"line-height:20px;height:20px;mso-line-height-alt:20px;\">\r\n&nbsp;\r\n</div></td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\" class=\"section\">\r\n<tbody>\r\n<tr>\r\n<td align=\"center\" style=\"font-size:0px;text-align:center;vertical-align:top;padding:0px;word-break:break-word;\">\r\n<div role=\"none\">\r\n<!--[if mso | IE]><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td><table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td style=\"vertical-align:top;width:189px;\" ><![endif]-->\r\n<div class=\"mj-column-per-35 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-radius:0px;vertical-align:top;\" width=\"100%\">\r\n<tbody>\r\n<tr>\r\n<td class=\"padding-0px img-container\" style=\"font-size:0px;padding:0px 10px 0px 10px;word-break:break-word;mso-padding-alt:0px;text-align:left;\">\r\n<div style=\"margin:0 auto;max-width:189px;\" class=\"img-full-width margin-0-auto-0-0\">\r\n<div class=\"mktoImg\" id=\"kimage-qn6xa75aw\">\r\n<a href=\r\n\"https://connect.ieee.org/NzU2LUdQSC04OTkAAAGiRvlo7XD3E1wtJJtPuo2HdsiEQC6iI9vKii64FJnbxi9AKW77gJ8aIq3qSeEVG0T8jb4pAEc=\" target=\"_blank\" style=\"text-decoration: none; color: #006699;\"\r\n><img height=\"auto\" width=\"189\" src=\"https://engage.ieee.org/rs/ieeecorporate/images/W0kn3F7tsf8m4p1Dj1Gdo8qddXrEoiNCyLxB8YqN.png\" style=\"border:none;outline:none;text-decoration:none;height:auto;width:100%;font-size:13px;display:block;\"></a>\r\n</div>\r\n<!--[if !mso 9]><!-->\r\n<div class=\"mktEditable\" id=\"image-plain-text-dn70lpp33\" style=\"mso-hide:all; visibility:hidden; opacity:0; color:transparent; mso-line-height-rule:exactly; line-height:0; font-size:0px; overflow:hidden; border-width:0; display:none !important;\">\r\n[ Image ] [[https://iln.ieee.org/public/contentdetails.aspx?utm_source=mkto&amp;utm_medium=email&amp;utm_campaign=mmo_learnmore26&amp;utm_id=&amp;utm_content=checkin3&amp;id=B570F53B5DA44B258042A12AE5BD6846&amp;utm_campaign=May26MBB&amp;utm_source=member-benefits-bulletin&amp;utm_medium=email&amp;utm_content=May26MBB]]\r\n</div>\r\n<!--<![endif]-->\r\n</div></td>\r\n</tr>\r\n<!--[if !mso]><!-->\r\n<tr>\r\n<td class=\"hide-on-desktop\" style=\"display: block; font-size: 0px; word-break: break-word;\">\r\n<div style=\"line-height:7px;height:7px;mso-line-height-alt:7px;\">\r\n&nbsp;\r\n</div></td>\r\n</tr>\r\n<!--<![endif]-->\r\n</tbody>\r\n</table>\r\n</div>\r\n<!--[if mso | IE]></td><td style=\"vertical-align:top;width:351px;\" ><![endif]-->\r\n<div class=\"mj-column-per-65 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-radius:0px;vertical-align:top;\" width=\"100%\">\r\n<tbody>\r\n<tr>\r\n<td class=\"padding-0px-25px-0px-25px text-container\" style=\"font-size:0px;padding:10px 10px 10px 10px;word-break:break-word;mso-padding-alt:0px 25px 0px 25px;text-align:center;\">\r\n<div class=\"mktEditable\" id=\"ktext-klzgep25b\" style=\"font-family:\'Formata\', Arial, sans-serif;font-size:15px;font-weight:bold;letter-spacing:none;line-height:1.2;text-align:center;mso-line-height-alt:1.125em;color:#000000;\">\r\n<div class=\"links-006699-underline\">\r\n<div style=\"font-family:\'Formata\', Arial, sans-serif;font-size:15px;font-weight:bold;letter-spacing:none;line-height:1.2;text-align:center;mso-line-height-alt:1.125em;color:#000000;\" class=\"mso-text-align-left text-align-left\">\r\n<p style=\"margin: 0 0 0px 0;\"><a href=\r\n\"https://connect.ieee.org/NzU2LUdQSC04OTkAAAGiRvlo7XD3E1wtJJtPuo2HdsiEQC6iI9vKii64FJnbxi9AKW77gJ8aIq3qSeEVG0T8jb4pAEc=\" target=\"_blank\" rel=\"noopener\" style=\"color: rgb(0, 102, 153); text-decoration: underline;\"\r\n>Save on AI Skills: Large Language Models Demystified</a></p>\r\n</div>\r\n</div>\r\n</div></td>\r\n</tr>\r\n<tr>\r\n<td class=\"padding-0px-25px-0px-25px text-container\" style=\"font-size:0px;padding:0px 10px 0px 10px;word-break:break-word;mso-padding-alt:0px 25px 0px 25px;text-align:center;\">\r\n<div class=\"mktEditable\" id=\"ktext-p3xpgveia\" style=\"font-family:\'Formata\', Arial, sans-serif;font-size:14px;font-weight:normal;letter-spacing:none;line-height:1.40;text-align:center;mso-line-height-alt:1.25em;color:#000000;\">\r\n<div class=\"links-006699-underline\">\r\n<div style=\"font-family:\'Formata\', Arial, sans-serif;font-size:14px;font-weight:normal;letter-spacing:none;line-height:1.40;text-align:center;mso-line-height-alt:1.25em;color:#000000;\" class=\"mso-text-align-left text-align-left\">\r\n<p style=\"margin: 0 0 0px 0;\">Build in-demand AI expertise and explore how LLMs work—from transformers to deployment. Members save on enrollment.</p>\r\n<p style=\"margin: 0 0 0px 0;\"><a href=\r\n\"https://connect.ieee.org/NzU2LUdQSC04OTkAAAGiRvlo7XD3E1wtJJtPuo2HdsiEQC6iI9vKii64FJnbxi9AKW77gJ8aIq3qSeEVG0T8jb4pAEc=\" target=\"_blank\" rel=\"noopener\" style=\"color: rgb(0, 102, 153); text-decoration: underline;\"\r\n>Unlock member savings &gt;</a></p>\r\n</div>\r\n</div>\r\n</div></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<!--[if mso | IE]></td></tr></table></td></tr></table><![endif]-->\r\n</div></td>\r\n</tr>\r\n</tbody>\r\n</table></td>\r\n</tr>\r\n<tr>\r\n<td style=\"font-size:0px;word-break:break-word;\">\r\n<div style=\"line-height:20px;height:20px;mso-line-height-alt:20px;\">\r\n&nbsp;\r\n</div></td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\" class=\"section\">\r\n<tbody>\r\n<tr>\r\n<td align=\"center\" style=\"font-size:0px;text-align:center;vertical-align:top;padding:0px;word-break:break-word;\">\r\n<div role=\"none\">\r\n<!--[if mso | IE]><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td><table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td style=\"vertical-align:top;width:189px;\" ><![endif]-->\r\n<div class=\"mj-column-per-35 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-radius:0px;vertical-align:top;\" width=\"100%\">\r\n<tbody>\r\n<tr>\r\n<td class=\"padding-0px img-container\" style=\"font-size:0px;padding:0px 10px 0px 10px;word-break:break-word;mso-padding-alt:0px;text-align:left;\">\r\n<div style=\"margin:0 auto;max-width:189px;\" class=\"img-full-width margin-0-auto-0-0\">\r\n<div class=\"mktoImg\" id=\"kimage-lw8aezlah\">\r\n<a href=\r\n\"https://connect.ieee.org/NzU2LUdQSC04OTkAAAGiRvlo7QKlYZ4v1pmEn5teP3PNq5xK3eyRWF1zSp6B-d13oudZwozHD_IDcj7QblZoRv6JE94=\" target=\"_blank\" style=\"text-decoration: none; color: #006699;\"\r\n><img height=\"auto\" width=\"189\" src=\"https://engage.ieee.org/rs/ieeecorporate/images/XPU42lwrwvCd6ez1ddRSSOLi0LDRSteALlD3ovxl.png\" style=\"border:none;outline:none;text-decoration:none;height:auto;width:100%;font-size:13px;display:block;\"></a>\r\n</div>\r\n<!--[if !mso 9]><!-->\r\n<div class=\"mktEditable\" id=\"image-plain-text-dxsvkk39m\" style=\"mso-hide:all; visibility:hidden; opacity:0; color:transparent; mso-line-height-rule:exactly; line-height:0; font-size:0px; overflow:hidden; border-width:0; display:none !important;\">\r\n[ Image ] [[https://event.on24.com/wcc/r/5303399/03EB1EE1FA3DE5A82575C334500C22DB?utm_source=mkto&amp;utm_medium=email&amp;utm_campaign=mmo_learnmore26&amp;utm_id=&amp;utm_content=checkin3&amp;partnerref=XPLHL_XPL_4.2026_RFW_Spring_OA_Authorship_Workshop_EMEALA_Innovate]]\r\n</div>\r\n<!--<![endif]-->\r\n</div></td>\r\n</tr>\r\n<!--[if !mso]><!-->\r\n<tr>\r\n<td class=\"hide-on-desktop\" style=\"display: block; font-size: 0px; word-break: break-word;\">\r\n<div style=\"line-height:7px;height:7px;mso-line-height-alt:7px;\">\r\n&nbsp;\r\n</div></td>\r\n</tr>\r\n<!--<![endif]-->\r\n</tbody>\r\n</table>\r\n</div>\r\n<!--[if mso | IE]></td><td style=\"vertical-align:top;width:351px;\" ><![endif]-->\r\n<div class=\"mj-column-per-65 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-radius:0px;vertical-align:top;\" width=\"100%\">\r\n<tbody>\r\n<tr>\r\n<td class=\"padding-0px-25px-0px-25px text-container\" style=\"font-size:0px;padding:10px 10px 10px 10px;word-break:break-word;mso-padding-alt:0px 25px 0px 25px;text-align:center;\">\r\n<div class=\"mktEditable\" id=\"ktext-lfnf0n0oz\" style=\"font-family:\'Formata\', Arial, sans-serif;font-size:15px;font-weight:bold;letter-spacing:none;line-height:1.2;text-align:center;mso-line-height-alt:1.125em;color:#000000;\">\r\n<div class=\"links-006699-underline\">\r\n<div style=\"font-family:\'Formata\', Arial, sans-serif;font-size:15px;font-weight:bold;letter-spacing:none;line-height:1.2;text-align:center;mso-line-height-alt:1.125em;color:#000000;\" class=\"mso-text-align-left text-align-left\">\r\n<p style=\"margin: 0 0 0px 0;\"><a href=\r\n\"https://connect.ieee.org/NzU2LUdQSC04OTkAAAGiRvlo7QKlYZ4v1pmEn5teP3PNq5xK3eyRWF1zSp6B-d13oudZwozHD_IDcj7QblZoRv6JE94=\" target=\"_blank\" rel=\"noopener\" style=\"color: rgb(0, 102, 153); text-decoration: underline;\"\r\n>Free Webinar: Get Published with IEEE</a></p>\r\n</div>\r\n</div>\r\n</div></td>\r\n</tr>\r\n<tr>\r\n<td class=\"padding-0px-25px-0px-25px text-container\" style=\"font-size:0px;padding:0px 10px 0px 10px;word-break:break-word;mso-padding-alt:0px 25px 0px 25px;text-align:center;\">\r\n<div class=\"mktEditable\" id=\"ktext-pd644w610\" style=\"font-family:\'Formata\', Arial, sans-serif;font-size:14px;font-weight:normal;letter-spacing:none;line-height:1.40;text-align:center;mso-line-height-alt:1.25em;color:#000000;\">\r\n<div class=\"links-006699-underline\">\r\n<div style=\"font-family:\'Formata\', Arial, sans-serif;font-size:14px;font-weight:normal;letter-spacing:none;line-height:1.40;text-align:center;mso-line-height-alt:1.25em;color:#000000;\" class=\"mso-text-align-left text-align-left\">\r\n<p style=\"margin: 0 0 0px 0;\">Learn how to prepare manuscripts, navigate peer review, and improve your chances of publication.</p>\r\n<p style=\"margin: 0 0 0px 0;\"><a href=\r\n\"https://connect.ieee.org/NzU2LUdQSC04OTkAAAGiRvlo7QKlYZ4v1pmEn5teP3PNq5xK3eyRWF1zSp6B-d13oudZwozHD_IDcj7QblZoRv6JE94=\" target=\"_blank\" rel=\"noopener\" style=\"color: rgb(0, 102, 153); text-decoration: underline;\"\r\n>Register for free &gt;</a>&nbsp;</p>\r\n</div>\r\n</div>\r\n</div></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<!--[if mso | IE]></td></tr></table></td></tr></table><![endif]-->\r\n</div></td>\r\n</tr>\r\n</tbody>\r\n</table></td>\r\n</tr>\r\n<tr>\r\n<td style=\"font-size:0px;word-break:break-word;\">\r\n<div style=\"line-height:20px;height:20px;mso-line-height-alt:20px;\">\r\n&nbsp;\r\n</div></td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\" class=\"section\">\r\n<tbody>\r\n<tr>\r\n<td align=\"center\" style=\"font-size:0px;text-align:center;vertical-align:top;padding:0px;word-break:break-word;\">\r\n<div role=\"none\">\r\n<!--[if mso | IE]><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td><table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td style=\"vertical-align:top;width:189px;\" ><![endif]-->\r\n<div class=\"mj-column-per-35 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-radius:0px;vertical-align:top;\" width=\"100%\">\r\n<tbody>\r\n<tr>\r\n<td class=\"padding-0px img-container\" style=\"font-size:0px;padding:0px 10px 0px 10px;word-break:break-word;mso-padding-alt:0px;text-align:left;\">\r\n<div style=\"margin:0 auto;max-width:189px;\" class=\"img-full-width margin-0-auto-0-0\">\r\n<div class=\"mktoImg\" id=\"kimage-6gudyfdq1\">\r\n<a href=\r\n\"https://connect.ieee.org/NzU2LUdQSC04OTkAAAGiRvlo7Yg6K8H0avj7jH3aIbGy_TgMd2ILAQ6ZSY2MoDCcNymkNQj2ySpqYLREa411ddp7yGM=\" target=\"_blank\" style=\"text-decoration: none; color: #006699;\"\r\n><img height=\"auto\" width=\"189\" src=\"https://engage.ieee.org/rs/ieeecorporate/images/TCWZX7fDvPYFgvhrC7vCa8EMPpp4txD5eUIzPaFK.png\" style=\"border:none;outline:none;text-decoration:none;height:auto;width:100%;font-size:13px;display:block;\"></a>\r\n</div>\r\n<!--[if !mso 9]><!-->\r\n<div class=\"mktEditable\" id=\"image-plain-text-f8y2391pk\" style=\"mso-hide:all; visibility:hidden; opacity:0; color:transparent; mso-line-height-rule:exactly; line-height:0; font-size:0px; overflow:hidden; border-width:0; display:none !important;\">\r\n[ Image ] [[https://ieee-dataport.org/?utm_source=mkto&amp;utm_medium=email&amp;utm_campaign=mmo_learnmore26&amp;utm_id=&amp;utm_content=checkin3]]\r\n</div>\r\n<!--<![endif]-->\r\n</div></td>\r\n</tr>\r\n<!--[if !mso]><!-->\r\n<tr>\r\n<td class=\"hide-on-desktop\" style=\"display: block; font-size: 0px; word-break: break-word;\">\r\n<div style=\"line-height:7px;height:7px;mso-line-height-alt:7px;\">\r\n&nbsp;\r\n</div></td>\r\n</tr>\r\n<!--<![endif]-->\r\n</tbody>\r\n</table>\r\n</div>\r\n<!--[if mso | IE]></td><td style=\"vertical-align:top;width:351px;\" ><![endif]-->\r\n<div class=\"mj-column-per-65 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-radius:0px;vertical-align:top;\" width=\"100%\">\r\n<tbody>\r\n<tr>\r\n<td class=\"padding-0px-25px-0px-25px text-container\" style=\"font-size:0px;padding:10px 10px 10px 10px;word-break:break-word;mso-padding-alt:0px 25px 0px 25px;text-align:center;\">\r\n<div class=\"mktEditable\" id=\"ktext-75kbl1kk0\" style=\"font-family:\'Formata\', Arial, sans-serif;font-size:15px;font-weight:bold;letter-spacing:none;line-height:1.2;text-align:center;mso-line-height-alt:1.125em;color:#000000;\">\r\n<div class=\"links-006699-underline\">\r\n<div style=\"font-family:\'Formata\', Arial, sans-serif;font-size:15px;font-weight:bold;letter-spacing:none;line-height:1.2;text-align:center;mso-line-height-alt:1.125em;color:#000000;\" class=\"mso-text-align-left text-align-left\">\r\n<p style=\"margin: 0 0 0px 0;\"><a href=\r\n\"https://connect.ieee.org/NzU2LUdQSC04OTkAAAGiRvlo7Yg6K8H0avj7jH3aIbGy_TgMd2ILAQ6ZSY2MoDCcNymkNQj2ySpqYLREa411ddp7yGM=\" target=\"_blank\" rel=\"noopener\" style=\"color: rgb(0, 102, 153); text-decoration: underline;\"\r\n>IEEE DataPort Surpasses 12,000 Datasets</a></p>\r\n</div>\r\n</div>\r\n</div></td>\r\n</tr>\r\n<tr>\r\n<td class=\"padding-0px-25px-0px-25px text-container\" style=\"font-size:0px;padding:0px 10px 0px 10px;word-break:break-word;mso-padding-alt:0px 25px 0px 25px;text-align:center;\">\r\n<div class=\"mktEditable\" id=\"ktext-js3kas13x\" style=\"font-family:\'Formata\', Arial, sans-serif;font-size:14px;font-weight:normal;letter-spacing:none;line-height:1.40;text-align:center;mso-line-height-alt:1.25em;color:#000000;\">\r\n<div class=\"links-006699-underline\">\r\n<div style=\"font-family:\'Formata\', Arial, sans-serif;font-size:14px;font-weight:normal;letter-spacing:none;line-height:1.40;text-align:center;mso-line-height-alt:1.25em;color:#000000;\" class=\"mso-text-align-left text-align-left\">\r\n<p style=\"margin: 0 0 0px 0;\">Explore one of the fastest-growing open research platforms accelerating AI and engineering innovation.</p>\r\n<p style=\"margin: 0 0 0px 0;\"><a href=\r\n\"https://connect.ieee.org/NzU2LUdQSC04OTkAAAGiRvlo7Yg6K8H0avj7jH3aIbGy_TgMd2ILAQ6ZSY2MoDCcNymkNQj2ySpqYLREa411ddp7yGM=\" target=\"_blank\" rel=\"noopener\" style=\"color: rgb(0, 102, 153); text-decoration: underline;\"\r\n>Explore datasets &gt;</a></p>\r\n</div>\r\n</div>\r\n</div></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<!--[if mso | IE]></td></tr></table></td></tr></table><![endif]-->\r\n</div></td>\r\n</tr>\r\n</tbody>\r\n</table></td>\r\n</tr>\r\n<tr>\r\n<td style=\"font-size:0px;word-break:break-word;\">\r\n<div style=\"line-height:20px;height:20px;mso-line-height-alt:20px;\">\r\n&nbsp;\r\n</div></td>\r\n</tr>\r\n<tr>\r\n<td>\r\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\" class=\"section\">\r\n<tbody>\r\n<tr>\r\n<td align=\"center\" style=\"font-size:0px;text-align:center;vertical-align:top;padding:0px;word-break:break-word;\">\r\n<div role=\"none\">\r\n<!--[if mso | IE]><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td><table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td style=\"vertical-align:top;width:189px;\" ><![endif]-->\r\n<div class=\"mj-column-per-35 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-radius:0px;vertical-align:top;\" width=\"100%\">\r\n<tbody>\r\n<tr>\r\n<td class=\"padding-0px img-container\" style=\"font-size:0px;padding:0px 10px 0px 10px;word-break:break-word;mso-padding-alt:0px;text-align:left;\">\r\n<div style=\"margin:0 auto;max-width:189px;\" class=\"img-full-width margin-0-auto-0-0\">\r\n<div class=\"mktoImg\" id=\"kimage-t2iv8x8a6\">\r\n<a href=\r\n\"https://connect.ieee.org/NzU2LUdQSC04OTkAAAGiRvlo7dXNNuL13CPSU0Wri5I7LqlRGHczReuQwPEbc9BwOKyn3GYJX2YG4W8GzxBF71NMzFg=\" target=\"_blank\" style=\"text-decoration: none; color: #006699;\"\r\n><img height=\"auto\" width=\"189\" src=\"https://engage.ieee.org/rs/ieeecorporate/images/6KCPi9uk8FfcHEFdSQmC3pR7g4hBOSVC2hPCF151.png\" style=\"border:none;outline:none;text-decoration:none;height:auto;width:100%;font-size:13px;display:block;\"></a>\r\n</div>\r\n<!--[if !mso 9]><!-->\r\n<div class=\"mktEditable\" id=\"image-plain-text-nbdt7mh0o\" style=\"mso-hide:all; visibility:hidden; opacity:0; color:transparent; mso-line-height-rule:exactly; line-height:0; font-size:0px; overflow:hidden; border-width:0; display:none !important;\">\r\n[ Image ] [[https://epics.ieee.org/blogs/epics-in-ieee-healthcare-access-flies-high-in-kenya/?utm_source=mkto&amp;utm_medium=email&amp;utm_campaign=mmo_learnmore26&amp;utm_id=&amp;utm_content=checkin3]]\r\n</div>\r\n<!--<![endif]-->\r\n</div></td>\r\n</tr>\r\n<!--[if !mso]><!-->\r\n<tr>\r\n<td class=\"hide-on-desktop\" style=\"display: block; font-size: 0px; word-break: break-word;\">\r\n<div style=\"line-height:7px;height:7px;mso-line-height-alt:7px;\">\r\n&nbsp;\r\n</div></td>\r\n</tr>\r\n<!--<![endif]-->\r\n</tbody>\r\n</table>\r\n</div>\r\n<!--[if mso | IE]></td><td style=\"vertical-align:top;width:351px;\" ><![endif]-->\r\n<div class=\"mj-column-per-65 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-radius:0px;vertical-align:top;\" width=\"100%\">\r\n<tbody>\r\n<tr>\r\n<td class=\"padding-0px-25px-0px-25px text-container\" style=\"font-size:0px;padding:10px 10px 10px 10px;word-break:break-word;mso-padding-alt:0px 25px 0px 25px;text-align:center;\">\r\n<div class=\"mktEditable\" id=\"ktext-jc8jpv6c2\" style=\"font-family:\'Formata\', Arial, sans-serif;font-size:15px;font-weight:bold;letter-spacing:none;line-height:1.2;text-align:center;mso-line-height-alt:1.125em;color:#000000;\">\r\n<div class=\"links-006699-underline\">\r\n<div style=\"font-family:\'Formata\', Arial, sans-serif;font-size:15px;font-weight:bold;letter-spacing:none;line-height:1.2;text-align:center;mso-line-height-alt:1.125em;color:#000000;\" class=\"mso-text-align-left text-align-left\">\r\n<p style=\"margin: 0 0 0px 0;\"><a href=\r\n\"https://connect.ieee.org/NzU2LUdQSC04OTkAAAGiRvlo7dXNNuL13CPSU0Wri5I7LqlRGHczReuQwPEbc9BwOKyn3GYJX2YG4W8GzxBF71NMzFg=\" target=\"_blank\" rel=\"noopener\" style=\"color: rgb(0, 102, 153); text-decoration: underline;\"\r\n>EPICS in IEEE: Engineering Impact in Action</a></p>\r\n</div>\r\n</div>\r\n</div></td>\r\n</tr>\r\n<tr>\r\n<td class=\"padding-0px-25px-0px-25px text-container\" style=\"font-size:0px;padding:0px 10px 0px 10px;word-break:break-word;mso-padding-alt:0px 25px 0px 25px;text-align:center;\">\r\n<div class=\"mktEditable\" id=\"ktext-sjhwc8yqa\" style=\"font-family:\'Formata\', Arial, sans-serif;font-size:14px;font-weight:normal;letter-spacing:none;line-height:1.40;text-align:center;mso-line-height-alt:1.25em;color:#000000;\">\r\n<div class=\"links-006699-underline\">\r\n<div style=\"font-family:\'Formata\', Arial, sans-serif;font-size:14px;font-weight:normal;letter-spacing:none;line-height:1.40;text-align:center;mso-line-height-alt:1.25em;color:#000000;\" class=\"mso-text-align-left text-align-left\">\r\n<p style=\"margin: 0 0 0px 0;\">Students are using engineering innovation to expand healthcare access through real-world solutions.</p>\r\n<p style=\"margin: 0 0 0px 0;\"><a href=\r\n\"https://connect.ieee.org/NzU2LUdQSC04OTkAAAGiRvlo7dXNNuL13CPSU0Wri5I7LqlRGHczReuQwPEbc9BwOKyn3GYJX2YG4W8GzxBF71NMzFg=\" target=\"_blank\" rel=\"noopener\" style=\"color: rgb(0, 102, 153); text-decoration: underline;\"\r\n>Read the story &gt;</a></p>\r\n</div>\r\n</div>\r\n</div></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<!--[if mso | IE]></td></tr></table></td></tr></table><![endif]-->\r\n</div></td>\r\n</tr>\r\n</tbody>\r\n</table></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<!--[if mso | IE]></td></tr></table><![endif]--></td>\r\n</tr>\r\n</tbody>\r\n</table></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<!--[if mso | IE]></td></tr></table><![endif]-->\r\n</div></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"background-color:transparent;width:100%;\" class=\"section\">\r\n<tbody>\r\n<tr>\r\n<td align=\"center\">\r\n<div role=\"none\">\r\n<!--[if mso | IE]><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"block-grid-outlook\" style=\"width:600px;\" width=\"600\" ><tr><td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\"><![endif]-->\r\n<div style=\"background:#FFFFFF;background-color:#FFFFFF;margin:0 auto;max-width:600px;\">\r\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"background-color:#FFFFFF;width:100%;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"font-size:0px;padding:0;text-align:center;vertical-align:top;\" class=\"block-grid\">\r\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n<tbody>\r\n<tr>\r\n<td style=\"background-color:#FFFFFF;line-height:0;font-size:0;direction:ltr;\">\r\n<!--[if mso | IE]><table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td style=\"vertical-align:top;width:600px;\" ><![endif]-->\r\n<div class=\"mj-column-per-100 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-radius:0px;vertical-align:top;\" width=\"100%\">\r\n<tbody>\r\n<tr>\r\n<td style=\"font-size:0px;word-break:break-word;\">\r\n<div style=\"line-height:30px;height:30px;mso-line-height-alt:30px;\">\r\n&nbsp;\r\n</div></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<!--[if mso | IE]></td></tr></table><![endif]--></td>\r\n</tr>\r\n</tbody>\r\n</table></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<!--[if mso | IE]></td></tr></table><![endif]-->\r\n</div></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\" class=\"section\">\r\n<tbody>\r\n<tr>\r\n<td align=\"center\">\r\n<div role=\"none\">\r\n<!--[if mso | IE]><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"block-grid-outlook\" style=\"width:600px;\" width=\"600\" ><tr><td style=\"line-height:0px;font-size:0px;mso-line-height-rule:exactly;\"><![endif]-->\r\n<div style=\"margin:0 auto;max-width:600px;\">\r\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"font-size:0px;padding:0px;text-align:center;vertical-align:top;\" class=\"block-grid\">\r\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" width=\"100%\">\r\n<tbody>\r\n<tr>\r\n<td style=\"background-color:#002855;line-height:0;font-size:0;direction:ltr;\">\r\n<!--[if mso | IE]><table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td style=\"vertical-align:top;width:600px;\" ><![endif]-->\r\n<div class=\"mj-column-per-100 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-radius:0px;vertical-align:top;\" width=\"100%\">\r\n<tbody>\r\n<tr>\r\n<td>\r\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"width:100%;\" class=\"section\">\r\n<tbody>\r\n<tr>\r\n<td align=\"center\" style=\"font-size:0px;text-align:center;vertical-align:top;padding:0px;word-break:break-word;\">\r\n<!--[if mso | IE]><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td><table role=\"presentation\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\"><tr><td style=\"vertical-align:top;width:600px;\" ><![endif]-->\r\n<div class=\"mj-column-per-100 mj-outlook-group-fix\" style=\"font-size:0px;text-align:left;direction:ltr;display:inline-block;vertical-align:top;width:100%;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"border-radius:0px;vertical-align:top;\" width=\"100%\">\r\n<tbody>\r\n<tr>\r\n<td class=\"padding-20px-25px-10px-25px text-container\" style=\"font-size:0px;padding:20px 10px 10px 10px;word-break:break-word;mso-padding-alt:20px 25px 10px 25px;text-align:center;\">\r\n<div class=\"mktEditable\" id=\"ktext-rzxbsf2q1\" style=\"font-family:\'Formata\', Arial, sans-serif;font-size:12px;font-weight:normal;letter-spacing:none;line-height:1.2;text-align:center;mso-line-height-alt:0.875em;color:#FFFFFF;\">\r\n<div class=\"links-FFFFFF-underline\">\r\n<div style=\"font-family:\'Formata\', Arial, sans-serif;font-size:12px;font-weight:normal;letter-spacing:none;line-height:1.2;text-align:center;mso-line-height-alt:0.875em;color:#FFFFFF;\">\r\n<p style=\"margin: 0 0 0px 0;\"><a href=\r\n\"https://connect.ieee.org/NzU2LUdQSC04OTkAAAGiRvlo7WTWkxQi3igiJ2HALDdBuVqGpAg9xbSzsW8Y_lB_ZKxJlQTRZubSxnT9aqLsFqHGWaE=\" target=\"_blank\" rel=\"noopener\" style=\"color: rgb(255, 255, 255); text-decoration: underline;\"\r\n>Website</a> | &nbsp;<a href=\r\n\"https://connect.ieee.org/NzU2LUdQSC04OTkAAAGiRvlo7UlNi1d-CW7Kh0qV2SzZNqGTrewrMF-Z1ztwaTQMmWzCN90UZkOhDbDLbW-d3XPrvTE=\" target=\"_blank\" rel=\"noopener\" style=\"color: rgb(255, 255, 255); text-decoration: underline;\"\r\n>Privacy Policy</a> | &nbsp;<a href=\r\n\"https://connect.ieee.org/NzU2LUdQSC04OTkAAAGiRvlo7ZwWwAAYeUbzzgQ-kUGpCIWdeSk8khC8EmVndswDlxBgyaBxRP4lLcKmemNU77eTw50=\" target=\"_blank\" rel=\"noopener\" style=\"color: rgb(255, 255, 255); text-decoration: underline;\"\r\n>Contact</a></p>\r\n</div>\r\n</div>\r\n</div></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<!--[if mso | IE]></td></tr></table></td></tr></table><![endif]--></td>\r\n</tr>\r\n</tbody>\r\n</table></td>\r\n</tr>\r\n<tr>\r\n<td class=\"social-container\" style=\"font-size:0px;padding:10px;word-break:break-word;text-align:center;\">\r\n<!--[if mso | IE]><table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" ><tr><td><![endif]-->\r\n<div style=\"display:inline-block;\">\r\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"float:none;display:inline-table;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"padding:4px;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"background:#00629B;border-radius:50px;width:24px;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"padding:2px;font-size:0;height:24px;vertical-align:middle;width:24px;\">\r\n<div class=\"mktEditable\" id=\"ksocial-0vugxch02\">\r\n<a href=\r\n\"https://connect.ieee.org/NzU2LUdQSC04OTkAAAGiRvlo7P_k8VuITrBsENWNADhLCCQWI6vWHXppoqRXqSJiOhGTeP95Nb7Xst3COFKFXrcVwE0=\" target=\"_blank\" style=\"text-decoration: none; color: #006699;\"\r\n><img alt=\"Custom social icon\" height=\"24\" src=\"https://engage.ieee.org/rs/ieeecorporate/images/xVGAfjBj78RmIYkq9misqIgi6GCAvbSmHBs9bo7X.png\" style=\"border-radius:50px;display:block;\" width=\"24\"></a>\r\n</div></td>\r\n</tr>\r\n</tbody>\r\n</table></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<!--[if mso | IE]></td><td><![endif]-->\r\n<div style=\"display:inline-block;\">\r\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"float:none;display:inline-table;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"padding:4px;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"background:#00629B;border-radius:50px;width:24px;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"padding:2px;font-size:0;height:24px;vertical-align:middle;width:24px;\">\r\n<div class=\"mktEditable\" id=\"ksocial-rp82pv904\">\r\n<a href=\r\n\"https://connect.ieee.org/NzU2LUdQSC04OTkAAAGiRvlo7QJx97ZHq0Q8QJgDs8bkoC2YdwISlvjbwsrUDor_mFc0XFAVVQMTVwMaAnGXye6F3s4=\" target=\"_blank\" style=\"text-decoration: none; color: #006699;\"\r\n><img alt=\"Linkedin\" height=\"24\" src=\"https://engage.ieee.org/rs/ieeecorporate/images/kne4vrSgGAsHb9cX00yeoSQurCuhwDTP48ftTiL7.png\" style=\"border-radius:50px;display:block;\" width=\"24\"></a>\r\n</div></td>\r\n</tr>\r\n</tbody>\r\n</table></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<!--[if mso | IE]></td><td><![endif]-->\r\n<div style=\"display:inline-block;\">\r\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"float:none;display:inline-table;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"padding:4px;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"background:#00629B;border-radius:50px;width:24px;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"padding:2px;font-size:0;height:24px;vertical-align:middle;width:24px;\">\r\n<div class=\"mktEditable\" id=\"ksocial-psbvqxjix\">\r\n<a href=\r\n\"https://connect.ieee.org/NzU2LUdQSC04OTkAAAGiRvlo7drAyRhWj4zPbvS1FkxYipRF8Klf6kFUib-lmVslgiE2ztRjCAos9hiCi9b0jxJR75Y=\" target=\"_blank\" style=\"text-decoration: none; color: #006699;\"\r\n><img alt=\"Facebook\" height=\"24\" src=\"https://engage.ieee.org/rs/ieeecorporate/images/cA1EUXn6NGTHcAdBH6S7JDHHFgJn8J6Mo5E5UfTC.png\" style=\"border-radius:50px;display:block;\" width=\"24\"></a>\r\n</div></td>\r\n</tr>\r\n</tbody>\r\n</table></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<!--[if mso | IE]></td><td><![endif]-->\r\n<div style=\"display:inline-block;\">\r\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"float:none;display:inline-table;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"padding:4px;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"background:#00629B;border-radius:50px;width:24px;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"padding:2px;font-size:0;height:24px;vertical-align:middle;width:24px;\">\r\n<div class=\"mktEditable\" id=\"ksocial-h1fb1oh4e\">\r\n<a href=\r\n\"https://connect.ieee.org/NzU2LUdQSC04OTkAAAGiRvlo7YDkMIzf9KkbU6dq3fg6HC_k_LqWCCYnrbUL-xYfWWgl7K7ue4Q9jWdXQi9Cw3EKP2Q=\" target=\"_blank\" style=\"text-decoration: none; color: #006699;\"\r\n><img alt=\"YouTube\" height=\"24\" src=\"https://engage.ieee.org/rs/ieeecorporate/images/1m0IsEwALk56tTTQ87HVx44Yg3AgteaYW2TDyTr5.png\" style=\"border-radius:50px;display:block;\" width=\"24\"></a>\r\n</div></td>\r\n</tr>\r\n</tbody>\r\n</table></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<!--[if mso | IE]></td><td><![endif]-->\r\n<div style=\"display:inline-block;\">\r\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"float:none;display:inline-table;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"padding:4px;\">\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" role=\"presentation\" style=\"background:#00629B;border-radius:50px;width:24px;\">\r\n<tbody>\r\n<tr>\r\n<td style=\"padding:2px;font-size:0;height:24px;vertical-align:middle;width:24px;\">\r\n<div class=\"mktEditable\" id=\"ksocial-ysk6rmu1u\">\r\n<a href=\r\n\"https://connect.ieee.org/NzU2LUdQSC04OTkAAAGiRvlo7ZX3aG9CWeawRfrUZFzjR75h0jTBXeT4z1NK4N7EOrK_v1tBWlx5qv9qQ-HYwDRjVYY=\" target=\"_blank\" style=\"text-decoration: none; color: #006699;\"\r\n><img alt=\"Instagram\" height=\"24\" src=\"https://engage.ieee.org/rs/ieeecorporate/images/ZS82XKRGvYGMlx7am8iYCHFZoH9ckUajKVH8k8zV.png\" style=\"border-radius:50px;display:block;\" width=\"24\"></a>\r\n</div></td>\r\n</tr>\r\n</tbody>\r\n</table></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<!--[if mso | IE]></td></tr></table><![endif]--></td>\r\n</tr>\r\n<tr>\r\n<td class=\"padding-10px-25px-10px-25px text-container\" style=\"font-size:0px;padding:10px 10px 10px 10px;word-break:break-word;mso-padding-alt:10px 25px 10px 25px;text-align:center;\">\r\n<div class=\"mktEditable\" id=\"ktext-dc8el0p40\" style=\"font-family:\'Formata\', Arial, sans-serif;font-size:11px;font-weight:normal;letter-spacing:none;line-height:1.2;text-align:center;mso-line-height-alt:0.813em;color:#FFFFFF;\">\r\n<div class=\"links-006699-underline\">\r\n<div style=\"font-family:\'Formata\', Arial, sans-serif;font-size:11px;font-weight:normal;letter-spacing:none;line-height:1.2;text-align:center;mso-line-height-alt:0.813em;color:#FFFFFF;\">\r\n<p style=\"margin: 0 0 0px 0;\">© 2026 IEEE – All rights reserved.</p>\r\n<p style=\"margin: 0 0 0px 0;\">&nbsp;</p>\r\n<p style=\"margin: 0 0 0px 0;\">IEEE • 445 Hoes Lane, Piscataway, NJ 08854 USA</p>\r\n</div>\r\n</div>\r\n</div></td>\r\n</tr>\r\n<tr>\r\n<td class=\"padding-10px-25px-10px-25px text-container\" style=\"font-size:0px;padding:10px 10px 10px 10px;word-break:break-word;mso-padding-alt:10px 25px 10px 25px;text-align:center;\">\r\n<div class=\"mktEditable\" id=\"ktext-zp4xww7mw\" style=\"font-family:\'Formata\', Arial, sans-serif;font-size:11px;font-weight:normal;letter-spacing:none;line-height:1.2;text-align:center;mso-line-height-alt:0.813em;color:#FFFFFF;\">\r\n<div class=\"links-FFFFFF-underline\">\r\n<div style=\"font-family:\'Formata\', Arial, sans-serif;font-size:11px;font-weight:normal;letter-spacing:none;line-height:1.2;text-align:center;mso-line-height-alt:0.813em;color:#FFFFFF;\">\r\n<p style=\"margin: 0 0 0px 0;\">You are receiving this email because you signed up to learn more about becoming an IEEE member. To unsubscribe, users with an IEEE account can update their <a href=\r\n\"https://connect.ieee.org/NzU2LUdQSC04OTkAAAGiRvlo7Zc18r8kA0J3k8SOCXXg0LVE5mDlvhvqhYQzbrcMuQ3d-6MKYoeiN1lv9uaV1XhdDhs=\" target=\"_blank\" rel=\"noopener\" style=\"color: rgb(255, 255, 255); text-decoration: underline;\"\r\n>communication preferences</a>. Users without an IEEE account can update their preferences <a href=\r\n\"https://connect.ieee.org/NzU2LUdQSC04OTkAAAGiRvlo7Z_4Mly0aX4dT_wHMVfTIRfWA8o_ngASNhlC9aYl0qQCmETARpjkQkLcKi8AXKr28Ys=\" target=\"_blank\" rel=\"noopener\" style=\"color: rgb(255, 255, 255); text-decoration: underline;\"\r\n>here</a>.</p>\r\n</div>\r\n</div>\r\n</div></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<!--[if mso | IE]></td></tr></table><![endif]--></td>\r\n</tr>\r\n</tbody>\r\n</table></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<!--[if mso | IE]></td></tr></table><![endif]-->\r\n</div></td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n</div>\r\n<a href=\r\n\"https://connect.ieee.org/NzU2LUdQSC04OTkAAAGiRvlo7UPL5nXrRioWeWB7wbdAUxBCwQOtveWJT6gGY2dQKNimDdw1oQMm1WrKfJaAHVRFOpw=\"\r\n></a>\r\n<img src=\"https://connect.ieee.org/trk?t=1&mid=NzU2LUdQSC04OTkAAAGiRvlo7eli2c0vXWSNl4m4U6DOxxKIchI5wHp8EnhU3rVvBwue3lcPo0hTciOHP83fQq9YjiKsvVRzScE89vPQaqRp5ayndEekDRE-cfDWW5KLEU3Qr8EvLziCJFJ0aamRd8RtgPvmn6QzVVrjg0zUFmIRldoizA\" width=\"1\" height=\"1\" style=\"display:none !important;\" alt=\"\" />\r\n\r\n<div></div>\r\n</body>\r\n</html>', 0, '[\"inbox\"]', '\"ieee@deliver.ieee.org\"', NULL, '[\"piyushsharma58932@gmail.com\"]', '[]', '[]', '795665863.5069163.1780935080182@marketo-platform--email-sender-prod-batch-cluster-588c84d5dptx7', '795665863.5069163.1780935080182@marketo-platform--email-sender-prod-batch-cluster-588c84d5dptx7', '[\"795665863.5069163.1780935080182@marketo-platform--email-sender-prod-batch-cluster-588c84d5dptx7\"]', NULL, NULL, '2026-06-08 16:11:20', '2026-06-12 18:38:41', NULL);
INSERT INTO `emails` (`id`, `subject`, `source`, `user_type`, `name`, `reply`, `is_read`, `folders`, `from`, `sender`, `reply_to`, `cc`, `bcc`, `unique_id`, `message_id`, `reference_ids`, `person_id`, `lead_id`, `created_at`, `updated_at`, `parent_id`) VALUES
(3, 'Your new InfinityFree account has been created', 'email', 'person', 'InfinityFree', '<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\r\n<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n\r\n<head>\r\n    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <meta content=\"telephone=no\" name=\"format-detection\">\r\n    <title></title>\r\n    <style type=\"text/css\" data-premailer=\"ignore\">\r\n        @import url(https://fonts.googleapis.com/css?family=Open+Sans:300,400,500,600,700);\r\n    </style>\r\n    <style data-premailer=\"ignore\">\r\n        @media screen and (max-width: 600px) {\r\n            u+.body {\r\n                width: 100vw !important;\r\n            }\r\n        }\r\n\r\n        a[x-apple-data-detectors] {\r\n            color: inherit !important;\r\n            text-decoration: none !important;\r\n            font-size: inherit !important;\r\n            font-family: inherit !important;\r\n            font-weight: inherit !important;\r\n            line-height: inherit !important;\r\n        }\r\n    </style>\r\n    <!--[if mso]>\r\n    <style type=\"text/css\">\r\n        body, table, td {\r\n            font-family: Arial, Helvetica, sans-serif !important;\r\n        }\r\n\r\n        img {\r\n            -ms-interpolation-mode: bicubic;\r\n        }\r\n\r\n        .box {\r\n            border-color: #eee !important;\r\n        }\r\n    </style>\r\n    <![endif]-->\r\n</head>\r\n\r\n<body class=\"bg-body\" style=\"margin: 0; padding: 0; font-size: 15px; line-height: 160%; mso-line-height-rule: exactly; color: #444; width: 100%; font-family: Open Sans, -apple-system, BlinkMacSystemFont, Roboto, Helvetica Neue, Helvetica, Arial, sans-serif; background-color: #f5f7fb;\">\r\n<center>\r\n    <table class=\"main bg-body\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-family: Open Sans, -apple-system, BlinkMacSystemFont, Roboto, Helvetica Neue, Helvetica, Arial, sans-serif; border-collapse: collapse; width: 100%; -webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%; background-color: #f5f7fb;\">\r\n        <tr>\r\n            <td align=\"center\" valign=\"top\" style=\"font-family: Open Sans, -apple-system, BlinkMacSystemFont, Roboto, Helvetica Neue, Helvetica, Arial, sans-serif;\">\r\n                <!--[if (gte mso 9)|(IE)]>\r\n                <table border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                    <tr>\r\n                        <td align=\"center\" valign=\"top\" width=\"640\">\r\n                <![endif]-->\r\n\r\n                <table class=\"wrap\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-family: Open Sans, -apple-system, BlinkMacSystemFont, Roboto, Helvetica Neue, Helvetica, Arial, sans-serif; border-collapse: collapse; width: 100%; max-width: 640px; text-align: left; -premailer-cellpadding: 0; -premailer-cellspacing: 0;\">\r\n                    <tr>\r\n                        <td class=\"p-sm\" style=\"font-family: Open Sans, -apple-system, BlinkMacSystemFont, Roboto, Helvetica Neue, Helvetica, Arial, sans-serif; padding: 8px;\">\r\n                            <table cellpadding=\"0\" cellspacing=\"0\" style=\"font-family: Open Sans, -apple-system, BlinkMacSystemFont, Roboto, Helvetica Neue, Helvetica, Arial, sans-serif; border-collapse: collapse; width: 100%; -premailer-cellpadding: 0; -premailer-cellspacing: 0;\">\r\n                                <tr>\r\n                                    <td class=\"py-lg\" style=\"font-family: Open Sans, -apple-system, BlinkMacSystemFont, Roboto, Helvetica Neue, Helvetica, Arial, sans-serif; padding-top: 24px; padding-bottom: 24px;\">\r\n                                        <table cellspacing=\"0\" cellpadding=\"0\" style=\"font-family: Open Sans, -apple-system, BlinkMacSystemFont, Roboto, Helvetica Neue, Helvetica, Arial, sans-serif; border-collapse: collapse; width: 100%; -premailer-cellpadding: 0; -premailer-cellspacing: 0;\">\r\n                                            <tr>\r\n                                                <td style=\"font-family: Open Sans, -apple-system, BlinkMacSystemFont, Roboto, Helvetica Neue, Helvetica, Arial, sans-serif;\">\r\n                                                    <a href=\"https://www.infinityfree.com/\" style=\"color: #467fcf; text-decoration: none;\">\r\n                                                        <img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAAAqCAYAAAD21BQXAAARVUlEQVR42u2de5wU1ZXHv7fmxRtRwbhqdH0laoxEcVcNdM3UDEjAF2ZdX9E15uNHRZnC+ABXdk2IZhGTMNWgqGwU4jM+cRMEYbqmuxEQH0uiRlejaNDEqAjynhmm6+4f9zRTtN3T3eMMKNPn8+nPzHRV3Xur6vzuOed3zr2j6AHi1iQHo/Qk4FxgGVpfurnVav71skhASUrSgahOKZwTHwzqRKX08oZY9WdfCZDUxhVaDQV+DFShuAvNbKA/8A7wB+BF0MutFuudGcsiuqQeJVFFgKIcVASYANQBvTWcpKAZOAb4R2AfYBCwAdgKfAC8qGF11Ld3G5AmjlyhdGr7/qC/ARwKvA4MROm30OoJYKic+jowPSjn/pmL7ZJ1KUl+gFxt+1ZZWdkI4BfACRnXrAcGAGV5mlkHLAPmaK2XRJuqm3eJ1XASBwIXAOcBRwD95NAm4C4Nt1uK7VozDViEYqHW7K/gZmCl1jwWbbI/LalJCSBZpd5JDlDoBuDiAkBQqLwG/EQTzI/6NaluAsbBwC3AmeJC5ZK1gIfWM4Ky8hYrSF0BTBUrmAb2A0oxtSFWAkoJIDsHtkeh9KPAt7qp78UKrmrw7be7qsH62nil0uo64MaQtcgUDQTAZ0BfsSbvgZoCepZYmkz5CLgxpfW8WU3VJderpwPEdeLDQD0N/EM3978WuNzz7Se7wGocAMwDajMOtUg8VCV/twG9gQpgG9AKVAKbgXrgeuD4HN3cj2WN9xpHbC6pTg8FiOskjgJ84Gu7aAxtgKu1NTvaNEJ3EhzfBH4HHCDWIRAAbAX2Aqwsl20MgSb9czNwNXApEMnR3TJQ4zw/8klJfXoYQFwnsbcE09/cxePQwE0aPS3qVxcFknoneZxCPwkMBPYuILbSGJatv8RVbUB56HgrhgoeBZyRo43ngTGeb68vqdCeLTtmVrfOV0DDbgBHWqFvVaibJzgJq2DLUZs4QaEXY6jbfaSdjsCxXcAxUMCRygAH4m41ACuBB3K0cxIwr96Jl5dUqIcAhKBsFIYSLVRS4sp0JUimWDC1vm5ZXsbMdRIno3kWGFJg+83y2SsEolxgLAd+BnwM3CFWJ1NOV6hJJRXqAS7WxOp4ubbUKgpnrFYAk4D7gEOAT4E48Ja4KAFwOOBIXJBN4YOQu1MhwXR/+f6eVMq6dlZiRCoHiWCDeop2OjafbBal3wI8C7wAfCL3vz9wigT3A7Jcex/wN2BylvtoVnBSg2//saRKezBAXCdxNvA4+ROHGpiOKruZINWK4npgRUUZK36xxG7LPHl8JF5WUa6GCzN0qgCpv8zkvQUMfXP0dY8uLx8fXfzdVIblGAU8lkOZyRGMfwTcgqWe9BojWRkotyY5CKUvAP4zi1V6WlyuqVlcsmeA0z2/lHnfkwGySBQ4n/y8zbKm3NFYHNs0ZXij2lRZfj6ou8mdn8gmc1WbuqwhGWkzSpyoRJEE/rmAawOxTgvQaoLXFCmo1GVibWJ/rZkrQXpYksBTwDTaWa+02J5vJ7/k77pcLHUg1vpE4DsY9u/DTrT3T5gSnf8B/r7HAsR1EgdhivUqCpiJz/J8u6m+tkmhrMpoo91STGeukzhFHug+RVz2iA6CS6LxmhYJzL+GZiHt9VPZpEVcvdnbm6sm37n8JF3kOKuAh4FxGYf+CMwB/oudM/S/1do6v7M09S6QHwA3YGrmfgnMF5e4AnhDnmVrEe0Nx6QCKjD1a0OFANkjg/ThBYADYK1CvwKgAstSAVHXSRxSTGeeby9HMVpcnkLlPGVZD9XXxvsAeDH770rpkcBLOc7fiqFuG7CCosEh42xBqR8AqzIOHYehgCdhkpxpGassBnbTO7obuBfDrFV14voREkcdK+9bS9yYfucHZnEb80n4+oNC10+Xsc4RMqRYGSxjvTfH54zdAZDWHCxNZuwxocGv/hTAa7JTQB+gya1LHlaU8sXsl5RxX/5WxGVnK60enVib7AfQEKteKy7hiowxbpJA+laFdbPXWNPpGd2LRbYCVwnYwnIo8BPgP0L30A8djOomF/hi4IeYgsuKTrQxJqTASWCBxJszxApcKZNKMfKoANYHLsdUJAD8i4z1Yokxi5V+wCXSRrbP0N3hlw4rIDj/RJdZyzNe3WS0DlRA0UV8Db79iuskaoVR+nqBl43VWj/lOsnve35ko+fb69yaxBgUT8ssuUFAO9lSVsOM2Bd3dzzfXuE6ifny4sMyBLgNuAlwhbGrFcXpbukl4NTAX4HfAKPFQqyVmOIvIYUdGbr2Q1HcQaLUK0LgGSL3ooWNnA+cBhwpE0E41hgkoFoRAu2NIVaxTFi/jcBz8n4AXsl4RkcKmNJjWxg6tk3uL6yb64TU+XcZ5xqxOHViXeeHJv7jAFss2XvAEmkvm9Wqk7FswSTKX0xPjMp1Es8A38vzUl7VcHzU/zxT9UXEdZJHgF4IFGOFkhILrQeor4kPVEo9IEriWjB7hm/rrhtjYhzwRI5JZCvwU+BCYFuLVXnyXY0nd2UcoqSPXuKWHi4Knc7g/1msZrh2bANm5eSzAp6LMtqcLt+/Jn8vkvd/NPAn+e4PAqRvhK77GBgrru2xouxpFm+sHB+chSg5VcZiAe9jEtFpizVN3FXkOc4DVsvfjQJuleElDAm56M8D7wLnA/cL2PqKO3Z2huu4QeKwOSGP6VxgFrBvRh+LJG5bZwly8smfuhocZoaO/BnUSODNIi6LAM9MrE0OBog2VW9AcSEwzvPtO7sSHEZFVQKTFM0mfYBblKGB365MtVaxa+UIcTtaQmMcCNwjoNqeMfbWLC5jNhkqbbfQngweIspV3gExojP+bgaWhsB0IKYKIe29nCO/b5ExZ7r/vcQyVOWYoIYJOHZyUIB/lfbbQvcwUMBQLeedCMwVcGg5r036+R5wV3oQ+xXwwD7qrjfs+ZF3hVJ9rYjLTtJaP+E6if0lrtno+fbvu2V8sci6PDRohYYbUMrF2uVMjgZ+hKlBq8WU8KcV8XjgMlHqtJwOTCnApd4OfF9cprNCDNdREpRnk4NDrt12sXYDRPHuyIipEPfn0JAVynzGjrhZ6Y+TI0T4SBjHpZikbxow7wiABgH/JspfIfePuJO95PfrBShHAS+n417g25bMgrtVPN9eIyBZVaBSbJaZ6BlZNdjdsjbP8SqUao3G7NQufnT/J+7SViABxEKz7760VyuEXZ5CLOwL4s9vk5jm+R33mXsBWrhtLZYr/Tzmh9zCMwXQ54WuvbPAcWXKRrEEF8hEcAztiedtAoI7ZPIIQkzkAPmJAOfbQFRim7JQHDXMojD+e/AuAMmHaD1KXk4uSYnP3U9mg6HAs8XSzZ2QfJNIG0GgJWa523USUyY68d67ACCZVQGbMlyUzsqGLIoYjos6M8E8LL/vJXTtafL3KgnkM8WXOCj98bOc8zpm34Ns7+lbIfbrEkwRKvKzKmQ9ykNMYSZT1scSZiCfHF1fm+yWylW3JllZXxvvZejj6rUKPVqYhExpFZ82s8TkaGCJ6yQP7Y7xXe00VXTgVoQVNRVyL85MEbTQcyVbVfUc2pOJt9G+3mhejrgooL3AtJnshbGZFvu9kCV6WCb2weLuVcunRnQ+zWilNx0ZLOHGcDnPBh6wgIkFBG7HKq0P6uqnWF+ztBKl71ZaPV7vJPsaCrh6vbLUmIwZYxsd120dDtp3ncSRXT3GMqwTQrNNLtmEUl8P+b4/nek7PbE2a31oVr4ds/lFWYjifSkU8CMx07wu7P9NTGUAQgDcCVwnMU5cPuMEWGlKuBcmL3SduGNJOe8xIGV5vv1YASxSmfhzXSYT6poqlQrmivkbq9BPTXQSJhHYGNkYKHWW0G1bxJ3Kp6QHA77rJI7p4pd+NPnLKA5C6zozd+qnIbVoYk2izHUSp/UwgDwRsiDpwk8rZBGiGec/FCIWukJaMInLjSGWbBLtTO3/YnbnAZgNLA6RD5MweaN02HEFsCk9+IUFdH6pW5M4rEvAMfK5XlZgPZJB0Y3U8Du3OjkQYGYssikwN7iYwkshDhB36/gufOivUUgGW7PUsF7VqzVWL634DV2z+EyHPh19l/m9zvgu8zw6aLeQMWQ7/5eYdTRrchACi0KER4BJ8hXaF3n6Tstz4h49iMnNbAfeBn6ewfS1iDWZDLwqoPgMQ9nXYQpTd1TzOphMY77AboVS1DXE7K2dBkdNoo+leBSTXMomz2nFmdGYvc6MLd4b1FwMt11EUKjO8vzIsi+imVeOWWlVNjcvYudsdDb5QKMOj/qRFtdJHgn6BuBtLDXba4xs6AJ/PlOxs333ZTm3o2MnCCNWLqxbdYH325lzuuQ8BXBNXbw8CNTrZN/yJlPmo7jIi9lF7+zh1iQHoPTjeRSuBVipFedEY/bHJlZJVCnFf2Oym8X4w2d4vr0TQ3LJiCY1oLKsD4Eq17pt88x47r25XCcxCZPtzSf3er79o6vHvqjKmrft58Uie2z59xeUh8Rr0PIuH/qyD9gCmNFY3SZBVSFyFpolrpPYq0hwHIDSC/KAY4vEOxGlecatNYnAaJPdorW6FPh1EV0OAha6TuLM8JcDK6xRSuv1SgXTylWF1QE4LgNuLbCvewFmLThRl8DRYYyYrsb9SFwZvhIAEcPykPhqhch3gDNcJzHmxyM7pn/r6+K9XCdxIUq/LBQaOSi9LRi+O93eQAKV5q6JNkW2o/UVSAlAgdIPeNx1EjdkWKiblFJXzWga/rngu96J7+M6iVnSTyG7ScbVzlXFJckRw9LOQt4j7/tLL5nb/pyKKYfOpxjbxPW4GVPg9iAmi/uB1iqllK7AbGY9WkxqR8F9gMkEh1cavoFitBez13ye/Xqu3ApS0zH0dKFJqzWgbc+vfs+tXVqe0ltTs/xTdQgUfRXqIDH7l1H4RhABMMrz7VhJ//Pq2U20Z/c92stSvjoAmVCbtCyt7xCKizyu0K8wZddhaRXWoEpA1L8AWg52Xgj0KjDa8+2c60UmjmyydMq6RRiIQkGyBZNbWaBhpcJaDcFkzHqJfTF1PMVmn+d6vv3Dkv7vubKTQsyMRYIAfS2m8KsjaSU79VkpZrRcfm7NAw4rAxwvAXUdgQOgYUlNsHVL1U2YhUuF1vD0xRTr3aVgFQQvCJX3MmaL1WLBsVq3l2qXZA82fWTzwxWqkdwruN7F5E7GFzBr983holVmuHLLleaMhiL/3YDEF9PofI3QRXKft1D4DvabAMfz7ZdKKtSDLMiOgNgsrR1F9pooMLUsha7BDhdDatoXAJVh6mCeAs4NgqBGKw5xncSJxdyA59vTMZtOd6aSdl9MycE6TOZ3UwHXbAXOKYGjBwNEFO8TrdRIYRwy64rWFwiQvrSvV24TsPQWV2oSmkO0Zjywt2VZSWC8VjsW1xQDklmYmv/O7LpehWGshgmp8H4H534KnOb59rMl1enhAAGIxiLbUOpKDH/9VujQZxS+cZuSwP0vwBwNQ5XWtcAqFDOV4m3MKrAFCn15NGZ3qgrW8+0HMWufX+nE5QpTrHatgCSbdXgZ1CmebzeV1KaHxyBZ45LaRF+luQi4BlMmMAyTD8knr2NWbCUxybvxmDXcB0r/b6C4wot1zcZrbk2yD0pPkD736UQTL2vFxUozFbOqbhNwG5pfeU32tpLKlADSsQLWLq3SQbCfUvwesyilozY+AepRLPNi9vvyr9HuxdTk/xW4TaHua/AjXZ40cuuWDiEIzsf809GDKW7vp/cxtV+HAUnPt98vqUoJIEUCJb43Wg3HbAN6AqaOa7D49C2YNcZTMbtVTPF8+xGAa2riFYFSw7XWL0Sbqrs9m1p/6guW2r7tOOC7mHXN4/Jc0gas1HB71LefLqlICSDdJq6TGI9ZYvmE59tv7u6bnejE+2nUbzHb2fQPxVNrMAttVgEJz7dXl1SjJAD/D1agr3ZjzyyXAAAAAElFTkSuQmCC\" alt=\"InfinityFree\" style=\"line-height: 100%; outline: 0; text-decoration: none; vertical-align: baseline; font-size: 0; border: 0 none;\">\r\n                                                    </a>\r\n                                                </td>\r\n                                            </tr>\r\n                                        </table>\r\n                                    </td>\r\n                                </tr>\r\n                            </table>\r\n                            <div class=\"main-content\">\r\n                                <table class=\"box\" cellpadding=\"0\" cellspacing=\"0\" style=\"font-family: Open Sans, -apple-system, BlinkMacSystemFont, Roboto, Helvetica Neue, Helvetica, Arial, sans-serif; border-collapse: collapse; width: 100%; background: #fff; border-radius: 3px; -webkit-box-shadow: 0 1px 4px rgba(0, 0, 0, .05); box-shadow: 0 1px 4px rgba(0, 0, 0, .05); border: 1px solid #f0f0f0; -premailer-cellpadding: 0; -premailer-cellspacing: 0;\">\r\n                                    <tr>\r\n                                        <td style=\"font-family: Open Sans, -apple-system, BlinkMacSystemFont, Roboto, Helvetica Neue, Helvetica, Arial, sans-serif;\">\r\n                                            <table cellpadding=\"0\" cellspacing=\"0\" style=\"font-family: Open Sans, -apple-system, BlinkMacSystemFont, Roboto, Helvetica Neue, Helvetica, Arial, sans-serif; border-collapse: collapse; width: 100%; -premailer-cellpadding: 0; -premailer-cellspacing: 0;\">\r\n                                                <tr>\r\n                                                    <td class=\"content\" style=\"font-family: Open Sans, -apple-system, BlinkMacSystemFont, Roboto, Helvetica Neue, Helvetica, Arial, sans-serif; padding: 40px 48px;\">\r\n                                                        <p>Hi piyushsharma58932@gmail.com,</p>\r\n<p>Thank you for signing up with InfinityFree! Your hosting account will now be setup over the next few minutes and this email contains all the information you will need in order to begin using your account.</p>\r\n<p>Here are the details of your new hosting account:</p>\r\n<h2>Hosting Account Details</h2>\r\n<p>Username: if0_42168450<br>\r\nPassword: (can be found in your client area)<br>\r\nLabel: Website for nexuscrm.infy.click<br>\r\nDomain: nexuscrm.infy.click</p>\r\n<p><strong style=\"font-weight: 600;\">Please note that it takes up to 72 hours for your domain name to start working. This is caused by DNS caching, and depends on many factors (your internet settings being the most important one).</strong>\r\n<a href=\"https://forum.infinityfree.com/docs?topic=49237\" style=\"color: #467fcf; text-decoration: none;\">Learn more about this.</a></p>\r\n<h2>What to do now?</h2>\r\n<p>The first thing to do now is to login to your control panel. Go to your client area, find the account and click Control Panel.</p>\r\n<p>From there you will be able to install scripts, create databases, add additional domains and more.</p>\r\n<p>You can also upload your website with FTP. Please make sure you have logged into the Control Panel once first to enable FTP access.</p>\r\n<table cellspacing=\"0\" cellpadding=\"0\" style=\"font-family: Open Sans, -apple-system, BlinkMacSystemFont, Roboto, Helvetica Neue, Helvetica, Arial, sans-serif; border-collapse: collapse; width: 100%; -premailer-cellpadding: 0; -premailer-cellspacing: 0;\">\r\n    <tr>\r\n        <td align=\"center\" style=\"font-family: Open Sans, -apple-system, BlinkMacSystemFont, Roboto, Helvetica Neue, Helvetica, Arial, sans-serif;\">\r\n            <table cellpadding=\"0\" cellspacing=\"0\" border=\"0\" class=\"bg-blue rounded w-auto\" style=\"font-family: Open Sans, -apple-system, BlinkMacSystemFont, Roboto, Helvetica Neue, Helvetica, Arial, sans-serif; background-color: #467fcf; color: #fff; border-radius: 3px; width: auto; -premailer-cellpadding: 0; -premailer-cellspacing: 0; border-collapse: separate;\">\r\n                <tr>\r\n                    <td align=\"center\" valign=\"top\" class=\"lh-1\" style=\"font-family: Open Sans, -apple-system, BlinkMacSystemFont, Roboto, Helvetica Neue, Helvetica, Arial, sans-serif; line-height: 100%;\">\r\n                        <a href=\"https://dash.infinityfree.com/accounts/if0_42168450\" class=\"btn bg-blue border-blue\" style=\"text-decoration: none; white-space: nowrap; font-weight: 600; font-size: 16px; padding: 12px 32px; border-radius: 3px; line-height: 100%; display: block; border: 1px solid transparent; -webkit-transition: .3s background-color; transition: .3s background-color; background-color: #467fcf; color: #fff; border-color: #467fcf;\">\r\n                            <span class=\"btn-span\" style=\"color: #fff; font-size: 16px; text-decoration: none; white-space: nowrap; font-weight: 600; line-height: 100%;\">View Account in Client Area</span>\r\n                        </a>\r\n                    </td>\r\n                </tr>\r\n            </table>\r\n        </td>\r\n    </tr>\r\n</table>\r\n<h2>Get Support</h2>\r\n<p>Do you need help in getting started or would you like to know more about what you can do with our hosting? Check out our\r\n<a href=\"https://forum.infinityfree.com/docs\" style=\"color: #467fcf; text-decoration: none;\">knowledge base</a>!</p>\r\n<p>Are you unable to find your answer there, or would you like to talk to someone, please check our\r\n<a href=\"https://forum.infinityfree.com\" style=\"color: #467fcf; text-decoration: none;\">community forum</a>!</p>\r\n<p>Regards<br>\r\nInfinityFree</p>\r\n\r\n\r\n                                                        \r\n                                                    </td>\r\n                                                </tr>\r\n                                            </table>\r\n                                        </td>\r\n                                    </tr>\r\n                                </table>\r\n                            </div>\r\n                            <table cellspacing=\"0\" cellpadding=\"0\" style=\"font-family: Open Sans, -apple-system, BlinkMacSystemFont, Roboto, Helvetica Neue, Helvetica, Arial, sans-serif; border-collapse: collapse; width: 100%; -premailer-cellpadding: 0; -premailer-cellspacing: 0;\">\r\n                                <tr>\r\n                                    <td class=\"py-xl\" style=\"font-family: Open Sans, -apple-system, BlinkMacSystemFont, Roboto, Helvetica Neue, Helvetica, Arial, sans-serif; padding-top: 48px; padding-bottom: 48px;\">\r\n                                        <table class=\"font-sm text-center text-muted\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-family: Open Sans, -apple-system, BlinkMacSystemFont, Roboto, Helvetica Neue, Helvetica, Arial, sans-serif; border-collapse: collapse; width: 100%; color: #9eb0b7; text-align: center; font-size: 13px; -premailer-cellpadding: 0; -premailer-cellspacing: 0;\">\r\n                                            <tr>\r\n                                                <td class=\"px-lg\" style=\"font-family: Open Sans, -apple-system, BlinkMacSystemFont, Roboto, Helvetica Neue, Helvetica, Arial, sans-serif; padding-right: 24px; padding-left: 24px;\">\r\n                                                    Have any questions about this email? Check our community forum at <a href=\"https://forum.infinityfree.com\" style=\"color: #467fcf; text-decoration: none;\">forum.infinityfree.com</a>.\r\n                                                </td>\r\n                                            </tr>\r\n                                            <tr>\r\n                                                <td class=\"pt-md\" style=\"font-family: Open Sans, -apple-system, BlinkMacSystemFont, Roboto, Helvetica Neue, Helvetica, Arial, sans-serif; padding-top: 16px;\">\r\n                                                    Copyright © 2026 InfinityFree. All rights reserved.                                                </td>\r\n                                            </tr>\r\n                                        </table>\r\n                                    </td>\r\n                                </tr>\r\n                            </table>\r\n                        </td>\r\n                    </tr>\r\n                </table>\r\n                <!--[if (gte mso 9)|(IE)]>\r\n                </td>\r\n                </tr>\r\n                </table>\r\n                <![endif]-->\r\n            </td>\r\n        </tr>\r\n    </table>\r\n</center>\r\n</body>\r\n\r\n</html>', 0, '[\"inbox\"]', '\"noreply@infinityfree.com\"', NULL, '[\"piyushsharma58932@gmail.com\"]', '[]', '[]', '0102019ebd1dcd20-70f6e42c-52f1-4698-bd9e-8b1666d8fba9-000000@eu-west-1.amazonses.com', '0102019ebd1dcd20-70f6e42c-52f1-4698-bd9e-8b1666d8fba9-000000@eu-west-1.amazonses.com', '[\"0102019ebd1dcd20-70f6e42c-52f1-4698-bd9e-8b1666d8fba9-000000@eu-west-1.amazonses.com\"]', NULL, NULL, '2026-06-12 18:35:07', '2026-06-12 18:38:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `email_attachments`
--

CREATE TABLE `email_attachments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `size` int(11) DEFAULT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `content_id` varchar(255) DEFAULT NULL,
  `email_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_tags`
--

CREATE TABLE `email_tags` (
  `tag_id` int(10) UNSIGNED NOT NULL,
  `email_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `subject`, `content`, `created_at`, `updated_at`) VALUES
(1, 'Activity created', 'Activity created: {%activities.title%}', '<p style=\"font-size: 16px; color: #5e5e5e;\">You have a new activity, please find the details bellow:</p>\n                                <p><strong style=\"font-size: 16px;\">Details</strong></p>\n                                <table style=\"height: 97px; width: 952px;\">\n                                    <tbody>\n                                        <tr>\n                                            <td style=\"width: 116.953px; color: #546e7a; font-size: 16px;\">Title</td>\n                                            <td style=\"width: 770.047px; font-size: 16px;\">{%activities.title%}</td>\n                                        </tr>\n                                        <tr>\n                                            <td style=\"width: 116.953px; color: #546e7a; font-size: 16px;\">Type</td>\n                                                <td style=\"width: 770.047px; font-size: 16px;\">{%activities.type%}</td>\n                                        </tr>\n                                        <tr>\n                                            <td style=\"width: 116.953px; color: #546e7a; font-size: 16px;\">Date</td>\n                                            <td style=\"width: 770.047px; font-size: 16px;\">{%activities.schedule_from%} to&nbsp;{%activities.schedule_to%}</td>\n                                        </tr>\n                                        <tr>\n                                            <td style=\"width: 116.953px; color: #546e7a; font-size: 16px; vertical-align: text-top;\">Participants</td>\n                                            <td style=\"width: 770.047px; font-size: 16px;\">{%activities.participants%}</td>\n                                        </tr>\n                                    </tbody>\n                                </table>', '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(2, 'Activity modified', 'Activity modified: {%activities.title%}', '<p style=\"font-size: 16px; color: #5e5e5e;\">You have a new activity modified, please find the details bellow:</p>\n                                <p><strong style=\"font-size: 16px;\">Details</strong></p>\n                                <table style=\"height: 97px; width: 952px;\">\n                                    <tbody>\n                                        <tr>\n                                            <td style=\"width: 116.953px; color: #546e7a; font-size: 16px;\">Title</td>\n                                            <td style=\"width: 770.047px; font-size: 16px;\">{%activities.title%}</td>\n                                        </tr>\n                                        <tr>\n                                            <td style=\"width: 116.953px; color: #546e7a; font-size: 16px;\">Type</td>\n                                            <td style=\"width: 770.047px; font-size: 16px;\">{%activities.type%}</td>\n                                        </tr>\n                                        <tr>\n                                            <td style=\"width: 116.953px; color: #546e7a; font-size: 16px;\">Date</td>\n                                            <td style=\"width: 770.047px; font-size: 16px;\">{%activities.schedule_from%} to&nbsp;{%activities.schedule_to%}</td>\n                                        </tr>\n                                        <tr>\n                                            <td style=\"width: 116.953px; color: #546e7a; font-size: 16px; vertical-align: text-top;\">Participants</td>\n                                            <td style=\"width: 770.047px; font-size: 16px;\">{%activities.participants%}</td>\n                                        </tr>\n                                    </tbody>\n                                </table>', '2026-02-27 19:37:56', '2026-02-27 19:37:56');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `imports`
--

CREATE TABLE `imports` (
  `id` int(10) UNSIGNED NOT NULL,
  `state` varchar(255) NOT NULL DEFAULT 'pending',
  `process_in_queue` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `validation_strategy` varchar(255) NOT NULL,
  `allowed_errors` int(11) NOT NULL DEFAULT 0,
  `processed_rows_count` int(11) NOT NULL DEFAULT 0,
  `invalid_rows_count` int(11) NOT NULL DEFAULT 0,
  `errors_count` int(11) NOT NULL DEFAULT 0,
  `errors` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`errors`)),
  `field_separator` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `error_file_path` varchar(255) DEFAULT NULL,
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`summary`)),
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `import_batches`
--

CREATE TABLE `import_batches` (
  `id` int(10) UNSIGNED NOT NULL,
  `state` varchar(255) NOT NULL DEFAULT 'pending',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`summary`)),
  `import_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` text NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `lead_value` decimal(12,4) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `lost_reason` text DEFAULT NULL,
  `closed_at` datetime DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `person_id` int(10) UNSIGNED DEFAULT NULL,
  `lead_source_id` int(10) UNSIGNED DEFAULT NULL,
  `lead_type_id` int(10) UNSIGNED DEFAULT NULL,
  `lead_pipeline_id` int(10) UNSIGNED DEFAULT NULL,
  `lead_pipeline_stage_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expected_close_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_activities`
--

CREATE TABLE `lead_activities` (
  `activity_id` int(10) UNSIGNED NOT NULL,
  `lead_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_pipelines`
--

CREATE TABLE `lead_pipelines` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `rotten_days` int(11) NOT NULL DEFAULT 30,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lead_pipelines`
--

INSERT INTO `lead_pipelines` (`id`, `name`, `is_default`, `rotten_days`, `created_at`, `updated_at`) VALUES
(1, 'Default Pipeline', 1, 30, '2026-02-27 19:37:56', '2026-02-27 19:37:56');

-- --------------------------------------------------------

--
-- Table structure for table `lead_pipeline_stages`
--

CREATE TABLE `lead_pipeline_stages` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `probability` int(11) NOT NULL DEFAULT 0,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `lead_pipeline_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lead_pipeline_stages`
--

INSERT INTO `lead_pipeline_stages` (`id`, `code`, `name`, `probability`, `sort_order`, `lead_pipeline_id`) VALUES
(1, 'new', 'New', 100, 1, 1),
(2, 'follow-up', 'Follow Up', 100, 2, 1),
(3, 'prospect', 'Prospect', 100, 3, 1),
(4, 'negotiation', 'Negotiation', 100, 4, 1),
(5, 'won', 'Won', 100, 5, 1),
(6, 'lost', 'Lost', 0, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `lead_products`
--

CREATE TABLE `lead_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `price` decimal(12,4) DEFAULT NULL,
  `amount` decimal(12,4) DEFAULT NULL,
  `lead_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_quotes`
--

CREATE TABLE `lead_quotes` (
  `quote_id` int(10) UNSIGNED NOT NULL,
  `lead_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_sources`
--

CREATE TABLE `lead_sources` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lead_sources`
--

INSERT INTO `lead_sources` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Email', '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(2, 'Web', '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(3, 'Web Form', '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(4, 'Phone', '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(5, 'Direct', '2026-02-27 19:37:56', '2026-02-27 19:37:56');

-- --------------------------------------------------------

--
-- Table structure for table `lead_stages`
--

CREATE TABLE `lead_stages` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_tags`
--

CREATE TABLE `lead_tags` (
  `tag_id` int(10) UNSIGNED NOT NULL,
  `lead_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_types`
--

CREATE TABLE `lead_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lead_types`
--

INSERT INTO `lead_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'New Business', '2026-02-27 19:37:56', '2026-02-27 19:37:56'),
(2, 'Existing Business', '2026-02-27 19:37:56', '2026-02-27 19:37:56');

-- --------------------------------------------------------

--
-- Table structure for table `marketing_campaigns`
--

CREATE TABLE `marketing_campaigns` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(255) NOT NULL,
  `mail_to` varchar(255) NOT NULL,
  `spooling` varchar(255) DEFAULT NULL,
  `marketing_template_id` int(10) UNSIGNED DEFAULT NULL,
  `marketing_event_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_events`
--

CREATE TABLE `marketing_events` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_08_19_000000_create_failed_jobs_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2021_03_12_060658_create_core_config_table', 1),
(4, '2021_03_12_074578_create_groups_table', 1),
(5, '2021_03_12_074597_create_roles_table', 1),
(6, '2021_03_12_074857_create_users_table', 1),
(7, '2021_03_12_074867_create_user_groups_table', 1),
(8, '2021_03_12_074957_create_user_password_resets_table', 1),
(9, '2021_04_02_080709_create_attributes_table', 1),
(10, '2021_04_02_080837_create_attribute_options_table', 1),
(11, '2021_04_06_122751_create_attribute_values_table', 1),
(12, '2021_04_09_051326_create_organizations_table', 1),
(13, '2021_04_09_065617_create_persons_table', 1),
(14, '2021_04_09_065617_create_products_table', 1),
(15, '2021_04_12_173232_create_countries_table', 1),
(16, '2021_04_12_173344_create_country_states_table', 1),
(17, '2021_04_21_172825_create_lead_sources_table', 1),
(18, '2021_04_21_172847_create_lead_types_table', 1),
(19, '2021_04_22_153258_create_lead_stages_table', 1),
(20, '2021_04_22_155706_create_lead_pipelines_table', 1),
(21, '2021_04_22_155838_create_lead_pipeline_stages_table', 1),
(22, '2021_04_22_164215_create_leads_table', 1),
(23, '2021_04_22_171805_create_lead_products_table', 1),
(24, '2021_05_12_150329_create_activities_table', 1),
(25, '2021_05_12_150329_create_lead_activities_table', 1),
(26, '2021_05_15_151855_create_activity_files_table', 1),
(27, '2021_05_20_141230_create_tags_table', 1),
(28, '2021_05_20_141240_create_lead_tags_table', 1),
(29, '2021_05_24_075618_create_emails_table', 1),
(30, '2021_05_25_072700_create_email_attachments_table', 1),
(31, '2021_06_07_162808_add_lead_view_permission_column_in_users_table', 1),
(32, '2021_07_01_230345_create_quotes_table', 1),
(33, '2021_07_01_231317_create_quote_items_table', 1),
(34, '2021_07_02_201822_create_lead_quotes_table', 1),
(35, '2021_07_28_142453_create_activity_participants_table', 1),
(36, '2021_08_26_133538_create_workflows_table', 1),
(37, '2021_09_03_172713_create_email_templates_table', 1),
(38, '2021_09_22_194103_add_unique_index_to_name_in_organizations_table', 1),
(39, '2021_09_22_194622_add_unique_index_to_name_in_groups_table', 1),
(40, '2021_09_23_221138_add_column_expected_close_date_in_leads_table', 1),
(41, '2021_09_30_135857_add_column_rotten_days_in_lead_pipelines_table', 1),
(42, '2021_09_30_154222_alter_lead_pipeline_stages_table', 1),
(43, '2021_09_30_161722_alter_leads_table', 1),
(44, '2021_09_30_183825_change_user_id_to_nullable_in_leads_table', 1),
(45, '2021_10_02_170105_insert_expected_closed_date_column_in_attributes_table', 1),
(46, '2021_11_11_180804_change_lead_pipeline_stage_id_constraint_in_leads_table', 1),
(47, '2021_11_12_171510_add_image_column_in_users_table', 1),
(48, '2021_11_17_190943_add_location_column_in_activities_table', 1),
(49, '2021_12_14_213049_create_web_forms_table', 1),
(50, '2021_12_14_214923_create_web_form_attributes_table', 1),
(51, '2024_01_11_154640_create_imports_table', 1),
(52, '2024_01_11_154741_create_import_batches_table', 1),
(53, '2024_05_10_152848_create_saved_filters_table', 1),
(54, '2024_06_21_160707_create_warehouses_table', 1),
(55, '2024_06_21_160735_create_warehouse_locations_table', 1),
(56, '2024_06_24_174241_insert_warehouse_attributes_in_attributes_table', 1),
(57, '2024_06_28_154009_create_product_inventories_table', 1),
(58, '2024_07_24_150821_create_webhooks_table', 1),
(59, '2024_07_31_092951_add_job_title_in_persons_table', 1),
(60, '2024_07_31_093603_add_organization_sales_owner_attribute_in_attributes_table', 1),
(61, '2024_07_31_093605_add_person_job_title_attribute_in_attributes_table', 1),
(62, '2024_07_31_093605_add_person_sales_owner_attribute_in_attributes_table', 1),
(63, '2024_08_06_145943_create_person_tags_table', 1),
(64, '2024_08_06_161212_create_person_activities_table', 1),
(65, '2024_08_10_100329_create_warehouse_activities_table', 1),
(66, '2024_08_10_100340_create_warehouse_tags_table', 1),
(67, '2024_08_10_150329_create_product_activities_table', 1),
(68, '2024_08_10_150340_create_product_tags_table', 1),
(69, '2024_08_14_102116_add_user_id_column_in_persons_table', 1),
(70, '2024_08_14_102136_add_user_id_column_in_organizations_table', 1),
(71, '2024_08_21_153011_add_leads_stage_and_pipeline_attributes', 1),
(72, '2024_08_27_091619_create_email_tags_table', 1),
(73, '2024_09_06_065808_alter_product_inventories_table', 1),
(74, '2024_09_09_094040_create_job_batches_table', 1),
(75, '2024_09_09_094042_create_jobs_table', 1),
(76, '2024_09_09_112201_add_unique_id_to_person_table', 1),
(77, '2024_10_29_044744_create_marketing_events_table', 1),
(78, '2024_11_04_122500_create_marketing_campaigns_table', 1),
(79, '2024_11_29_120302_modify_foreign_keys_in_leads_table', 1),
(80, '2025_01_17_151632_alter_activities_table', 1),
(81, '2025_01_29_133500_update_text_column_type_in_core_config_table', 1),
(82, '2025_03_19_132236_update_organization_id_column_in_persons_table', 1),
(83, '2025_07_01_133612_alter_lead_pipelines_table', 1),
(84, '2025_07_02_191710_alter_attribute_values_table', 1),
(85, '2025_07_09_133553_alter_email_templates_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`address`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `persons`
--

CREATE TABLE `persons` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `emails` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`emails`)),
  `contact_numbers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`contact_numbers`)),
  `organization_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `unique_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `person_activities`
--

CREATE TABLE `person_activities` (
  `activity_id` int(10) UNSIGNED NOT NULL,
  `person_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `person_tags`
--

CREATE TABLE `person_tags` (
  `tag_id` int(10) UNSIGNED NOT NULL,
  `person_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `sku` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `price` decimal(12,4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_activities`
--

CREATE TABLE `product_activities` (
  `activity_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_inventories`
--

CREATE TABLE `product_inventories` (
  `id` int(10) UNSIGNED NOT NULL,
  `in_stock` int(11) NOT NULL DEFAULT 0,
  `allocated` int(11) NOT NULL DEFAULT 0,
  `product_id` int(10) UNSIGNED NOT NULL,
  `warehouse_id` int(10) UNSIGNED DEFAULT NULL,
  `warehouse_location_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_tags`
--

CREATE TABLE `product_tags` (
  `tag_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotes`
--

CREATE TABLE `quotes` (
  `id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `billing_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`billing_address`)),
  `shipping_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`shipping_address`)),
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT NULL,
  `tax_amount` decimal(12,4) DEFAULT NULL,
  `adjustment_amount` decimal(12,4) DEFAULT NULL,
  `sub_total` decimal(12,4) DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT NULL,
  `expired_at` datetime DEFAULT NULL,
  `person_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quote_items`
--

CREATE TABLE `quote_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT 0,
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `coupon_code` varchar(255) DEFAULT NULL,
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `tax_percent` decimal(12,4) DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `product_id` int(10) UNSIGNED NOT NULL,
  `quote_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `permission_type` varchar(255) NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `permission_type`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'Administrator Role', 'all', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `view_permission` varchar(255) DEFAULT 'global',
  `role_id` int(10) UNSIGNED NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `status`, `view_permission`, `role_id`, `remember_token`, `created_at`, `updated_at`, `image`) VALUES
(1, 'Example Admin', 'admin@example.com', '$2y$10$OeEp6R754Ja/5Wl.8G50h.HrO8vwKyX4qQemA4VoLtCrP4KSK.lPi', 1, 'global', 1, NULL, '2026-02-27 19:37:57', '2026-02-27 19:37:57', NULL),
(2, 'abhishek sharma', 'abhi@gmail.com', '$2y$10$3Kp/MUibMQ6QBHg9.rNwdORH/SMOMR8oXNhaqqJPfjS6fuWJ3IoZq', 1, 'individual', 1, NULL, '2026-03-14 07:23:02', '2026-03-14 07:23:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `group_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_password_resets`
--

CREATE TABLE `user_password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `contact_name` varchar(255) NOT NULL,
  `contact_emails` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`contact_emails`)),
  `contact_numbers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`contact_numbers`)),
  `contact_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`contact_address`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_activities`
--

CREATE TABLE `warehouse_activities` (
  `activity_id` int(10) UNSIGNED NOT NULL,
  `warehouse_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_locations`
--

CREATE TABLE `warehouse_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `warehouse_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse_tags`
--

CREATE TABLE `warehouse_tags` (
  `tag_id` int(10) UNSIGNED NOT NULL,
  `warehouse_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `webhooks`
--

CREATE TABLE `webhooks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `entity_type` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `method` varchar(255) NOT NULL,
  `end_point` varchar(255) NOT NULL,
  `query_params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`query_params`)),
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`headers`)),
  `payload_type` varchar(255) NOT NULL,
  `raw_payload_type` varchar(255) NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payload`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `web_forms`
--

CREATE TABLE `web_forms` (
  `id` int(10) UNSIGNED NOT NULL,
  `form_id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `submit_button_label` text NOT NULL,
  `submit_success_action` varchar(255) NOT NULL,
  `submit_success_content` varchar(255) NOT NULL,
  `create_lead` tinyint(1) NOT NULL DEFAULT 0,
  `background_color` varchar(255) DEFAULT NULL,
  `form_background_color` varchar(255) DEFAULT NULL,
  `form_title_color` varchar(255) DEFAULT NULL,
  `form_submit_button_color` varchar(255) DEFAULT NULL,
  `attribute_label_color` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `web_form_attributes`
--

CREATE TABLE `web_form_attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `placeholder` varchar(255) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 0,
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(11) DEFAULT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `web_form_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workflows`
--

CREATE TABLE `workflows` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `entity_type` varchar(255) NOT NULL,
  `event` varchar(255) NOT NULL,
  `condition_type` varchar(255) NOT NULL DEFAULT 'and',
  `conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`conditions`)),
  `actions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`actions`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workflows`
--

INSERT INTO `workflows` (`id`, `name`, `description`, `entity_type`, `event`, `condition_type`, `conditions`, `actions`, `created_at`, `updated_at`) VALUES
(1, 'Emails to participants after activity creation', 'Emails to participants after activity creation', 'activities', 'activity.create.after', 'and', '[{\"value\": [\"call\", \"meeting\", \"lunch\"], \"operator\": \"{}\", \"attribute\": \"type\", \"attribute_type\": \"multiselect\"}]', '[{\"id\": \"send_email_to_participants\", \"value\": \"1\"}]', '2026-02-27 19:37:57', '2026-02-27 19:37:57'),
(2, 'Emails to participants after activity updation', 'Emails to participants after activity updation', 'activities', 'activity.update.after', 'and', '[{\"value\": [\"call\", \"meeting\", \"lunch\"], \"operator\": \"{}\", \"attribute\": \"type\", \"attribute_type\": \"multiselect\"}]', '[{\"id\": \"send_email_to_participants\", \"value\": \"2\"}]', '2026-02-27 19:37:57', '2026-02-27 19:37:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activities_user_id_foreign` (`user_id`);

--
-- Indexes for table `activity_files`
--
ALTER TABLE `activity_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_files_activity_id_foreign` (`activity_id`);

--
-- Indexes for table `activity_participants`
--
ALTER TABLE `activity_participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_participants_activity_id_foreign` (`activity_id`),
  ADD KEY `activity_participants_user_id_foreign` (`user_id`),
  ADD KEY `activity_participants_person_id_foreign` (`person_id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attributes_code_entity_type_unique` (`code`,`entity_type`);

--
-- Indexes for table `attribute_options`
--
ALTER TABLE `attribute_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_options_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `entity_type_attribute_value_index_unique` (`entity_type`,`entity_id`,`attribute_id`),
  ADD UNIQUE KEY `attribute_values_unique_id_unique` (`unique_id`),
  ADD KEY `attribute_values_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `core_config`
--
ALTER TABLE `core_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country_states`
--
ALTER TABLE `country_states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_states_country_id_foreign` (`country_id`);

--
-- Indexes for table `datagrid_saved_filters`
--
ALTER TABLE `datagrid_saved_filters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `datagrid_saved_filters_user_id_name_src_unique` (`user_id`,`name`,`src`);

--
-- Indexes for table `emails`
--
ALTER TABLE `emails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emails_message_id_unique` (`message_id`),
  ADD UNIQUE KEY `emails_unique_id_unique` (`unique_id`),
  ADD KEY `emails_person_id_foreign` (`person_id`),
  ADD KEY `emails_lead_id_foreign` (`lead_id`),
  ADD KEY `emails_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `email_attachments`
--
ALTER TABLE `email_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_attachments_email_id_foreign` (`email_id`);

--
-- Indexes for table `email_tags`
--
ALTER TABLE `email_tags`
  ADD KEY `email_tags_tag_id_foreign` (`tag_id`),
  ADD KEY `email_tags_email_id_foreign` (`email_id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_templates_name_unique` (`name`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `groups_name_unique` (`name`);

--
-- Indexes for table `imports`
--
ALTER TABLE `imports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `import_batches`
--
ALTER TABLE `import_batches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `import_batches_import_id_foreign` (`import_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leads_lead_pipeline_id_foreign` (`lead_pipeline_id`),
  ADD KEY `leads_lead_pipeline_stage_id_foreign` (`lead_pipeline_stage_id`),
  ADD KEY `leads_user_id_foreign` (`user_id`),
  ADD KEY `leads_person_id_foreign` (`person_id`),
  ADD KEY `leads_lead_source_id_foreign` (`lead_source_id`),
  ADD KEY `leads_lead_type_id_foreign` (`lead_type_id`);

--
-- Indexes for table `lead_activities`
--
ALTER TABLE `lead_activities`
  ADD KEY `lead_activities_activity_id_foreign` (`activity_id`),
  ADD KEY `lead_activities_lead_id_foreign` (`lead_id`);

--
-- Indexes for table `lead_pipelines`
--
ALTER TABLE `lead_pipelines`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lead_pipelines_name_unique` (`name`);

--
-- Indexes for table `lead_pipeline_stages`
--
ALTER TABLE `lead_pipeline_stages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lead_pipeline_stages_code_lead_pipeline_id_unique` (`code`,`lead_pipeline_id`),
  ADD UNIQUE KEY `lead_pipeline_stages_name_lead_pipeline_id_unique` (`name`,`lead_pipeline_id`),
  ADD KEY `lead_pipeline_stages_lead_pipeline_id_foreign` (`lead_pipeline_id`);

--
-- Indexes for table `lead_products`
--
ALTER TABLE `lead_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_products_lead_id_foreign` (`lead_id`),
  ADD KEY `lead_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `lead_quotes`
--
ALTER TABLE `lead_quotes`
  ADD KEY `lead_quotes_quote_id_foreign` (`quote_id`),
  ADD KEY `lead_quotes_lead_id_foreign` (`lead_id`);

--
-- Indexes for table `lead_sources`
--
ALTER TABLE `lead_sources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lead_stages`
--
ALTER TABLE `lead_stages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lead_tags`
--
ALTER TABLE `lead_tags`
  ADD KEY `lead_tags_tag_id_foreign` (`tag_id`),
  ADD KEY `lead_tags_lead_id_foreign` (`lead_id`);

--
-- Indexes for table `lead_types`
--
ALTER TABLE `lead_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marketing_campaigns`
--
ALTER TABLE `marketing_campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_campaigns_marketing_template_id_foreign` (`marketing_template_id`),
  ADD KEY `marketing_campaigns_marketing_event_id_foreign` (`marketing_event_id`);

--
-- Indexes for table `marketing_events`
--
ALTER TABLE `marketing_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `organizations_name_unique` (`name`),
  ADD KEY `organizations_user_id_foreign` (`user_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `persons_unique_id_unique` (`unique_id`),
  ADD KEY `persons_user_id_foreign` (`user_id`),
  ADD KEY `persons_organization_id_foreign` (`organization_id`);

--
-- Indexes for table `person_activities`
--
ALTER TABLE `person_activities`
  ADD KEY `person_activities_activity_id_foreign` (`activity_id`),
  ADD KEY `person_activities_person_id_foreign` (`person_id`);

--
-- Indexes for table `person_tags`
--
ALTER TABLE `person_tags`
  ADD KEY `person_tags_tag_id_foreign` (`tag_id`),
  ADD KEY `person_tags_person_id_foreign` (`person_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`);

--
-- Indexes for table `product_activities`
--
ALTER TABLE `product_activities`
  ADD KEY `product_activities_activity_id_foreign` (`activity_id`),
  ADD KEY `product_activities_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_inventories`
--
ALTER TABLE `product_inventories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_inventories_product_id_foreign` (`product_id`),
  ADD KEY `product_inventories_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `product_inventories_warehouse_location_id_foreign` (`warehouse_location_id`);

--
-- Indexes for table `product_tags`
--
ALTER TABLE `product_tags`
  ADD KEY `product_tags_tag_id_foreign` (`tag_id`),
  ADD KEY `product_tags_product_id_foreign` (`product_id`);

--
-- Indexes for table `quotes`
--
ALTER TABLE `quotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotes_person_id_foreign` (`person_id`),
  ADD KEY `quotes_user_id_foreign` (`user_id`);

--
-- Indexes for table `quote_items`
--
ALTER TABLE `quote_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quote_items_quote_id_foreign` (`quote_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tags_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD KEY `user_groups_group_id_foreign` (`group_id`),
  ADD KEY `user_groups_user_id_foreign` (`user_id`);

--
-- Indexes for table `user_password_resets`
--
ALTER TABLE `user_password_resets`
  ADD KEY `user_password_resets_email_index` (`email`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `warehouse_activities`
--
ALTER TABLE `warehouse_activities`
  ADD KEY `warehouse_activities_activity_id_foreign` (`activity_id`),
  ADD KEY `warehouse_activities_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `warehouse_locations`
--
ALTER TABLE `warehouse_locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `warehouse_locations_warehouse_id_name_unique` (`warehouse_id`,`name`);

--
-- Indexes for table `warehouse_tags`
--
ALTER TABLE `warehouse_tags`
  ADD KEY `warehouse_tags_tag_id_foreign` (`tag_id`),
  ADD KEY `warehouse_tags_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `webhooks`
--
ALTER TABLE `webhooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `web_forms`
--
ALTER TABLE `web_forms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `web_forms_form_id_unique` (`form_id`);

--
-- Indexes for table `web_form_attributes`
--
ALTER TABLE `web_form_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `web_form_attributes_attribute_id_foreign` (`attribute_id`),
  ADD KEY `web_form_attributes_web_form_id_foreign` (`web_form_id`);

--
-- Indexes for table `workflows`
--
ALTER TABLE `workflows`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_files`
--
ALTER TABLE `activity_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `activity_participants`
--
ALTER TABLE `activity_participants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `attribute_options`
--
ALTER TABLE `attribute_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_config`
--
ALTER TABLE `core_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT for table `country_states`
--
ALTER TABLE `country_states`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=569;

--
-- AUTO_INCREMENT for table `datagrid_saved_filters`
--
ALTER TABLE `datagrid_saved_filters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `emails`
--
ALTER TABLE `emails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `email_attachments`
--
ALTER TABLE `email_attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `imports`
--
ALTER TABLE `imports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `import_batches`
--
ALTER TABLE `import_batches`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lead_pipelines`
--
ALTER TABLE `lead_pipelines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `lead_pipeline_stages`
--
ALTER TABLE `lead_pipeline_stages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `lead_products`
--
ALTER TABLE `lead_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lead_sources`
--
ALTER TABLE `lead_sources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `lead_stages`
--
ALTER TABLE `lead_stages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lead_types`
--
ALTER TABLE `lead_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `marketing_campaigns`
--
ALTER TABLE `marketing_campaigns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_events`
--
ALTER TABLE `marketing_events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `organizations`
--
ALTER TABLE `organizations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `persons`
--
ALTER TABLE `persons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_inventories`
--
ALTER TABLE `product_inventories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotes`
--
ALTER TABLE `quotes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quote_items`
--
ALTER TABLE `quote_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warehouse_locations`
--
ALTER TABLE `warehouse_locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `webhooks`
--
ALTER TABLE `webhooks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `web_forms`
--
ALTER TABLE `web_forms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `web_form_attributes`
--
ALTER TABLE `web_form_attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workflows`
--
ALTER TABLE `workflows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activities`
--
ALTER TABLE `activities`
  ADD CONSTRAINT `activities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `activity_files`
--
ALTER TABLE `activity_files`
  ADD CONSTRAINT `activity_files_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `activity_participants`
--
ALTER TABLE `activity_participants`
  ADD CONSTRAINT `activity_participants_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `activity_participants_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `activity_participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_options`
--
ALTER TABLE `attribute_options`
  ADD CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD CONSTRAINT `attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `country_states`
--
ALTER TABLE `country_states`
  ADD CONSTRAINT `country_states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `emails`
--
ALTER TABLE `emails`
  ADD CONSTRAINT `emails_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `emails_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `emails` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `emails_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `email_attachments`
--
ALTER TABLE `email_attachments`
  ADD CONSTRAINT `email_attachments_email_id_foreign` FOREIGN KEY (`email_id`) REFERENCES `emails` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `email_tags`
--
ALTER TABLE `email_tags`
  ADD CONSTRAINT `email_tags_email_id_foreign` FOREIGN KEY (`email_id`) REFERENCES `emails` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `email_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `import_batches`
--
ALTER TABLE `import_batches`
  ADD CONSTRAINT `import_batches_import_id_foreign` FOREIGN KEY (`import_id`) REFERENCES `imports` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `leads`
--
ALTER TABLE `leads`
  ADD CONSTRAINT `leads_lead_pipeline_id_foreign` FOREIGN KEY (`lead_pipeline_id`) REFERENCES `lead_pipelines` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `leads_lead_pipeline_stage_id_foreign` FOREIGN KEY (`lead_pipeline_stage_id`) REFERENCES `lead_pipeline_stages` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `leads_lead_source_id_foreign` FOREIGN KEY (`lead_source_id`) REFERENCES `lead_sources` (`id`),
  ADD CONSTRAINT `leads_lead_type_id_foreign` FOREIGN KEY (`lead_type_id`) REFERENCES `lead_types` (`id`),
  ADD CONSTRAINT `leads_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`),
  ADD CONSTRAINT `leads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `lead_activities`
--
ALTER TABLE `lead_activities`
  ADD CONSTRAINT `lead_activities_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lead_activities_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lead_pipeline_stages`
--
ALTER TABLE `lead_pipeline_stages`
  ADD CONSTRAINT `lead_pipeline_stages_lead_pipeline_id_foreign` FOREIGN KEY (`lead_pipeline_id`) REFERENCES `lead_pipelines` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lead_products`
--
ALTER TABLE `lead_products`
  ADD CONSTRAINT `lead_products_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lead_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lead_quotes`
--
ALTER TABLE `lead_quotes`
  ADD CONSTRAINT `lead_quotes_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lead_quotes_quote_id_foreign` FOREIGN KEY (`quote_id`) REFERENCES `quotes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lead_tags`
--
ALTER TABLE `lead_tags`
  ADD CONSTRAINT `lead_tags_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `leads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lead_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `marketing_campaigns`
--
ALTER TABLE `marketing_campaigns`
  ADD CONSTRAINT `marketing_campaigns_marketing_event_id_foreign` FOREIGN KEY (`marketing_event_id`) REFERENCES `marketing_events` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `marketing_campaigns_marketing_template_id_foreign` FOREIGN KEY (`marketing_template_id`) REFERENCES `email_templates` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `organizations`
--
ALTER TABLE `organizations`
  ADD CONSTRAINT `organizations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `persons`
--
ALTER TABLE `persons`
  ADD CONSTRAINT `persons_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `organizations` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `persons_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `person_activities`
--
ALTER TABLE `person_activities`
  ADD CONSTRAINT `person_activities_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `person_activities_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `person_tags`
--
ALTER TABLE `person_tags`
  ADD CONSTRAINT `person_tags_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `person_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_activities`
--
ALTER TABLE `product_activities`
  ADD CONSTRAINT `product_activities_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_activities_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_inventories`
--
ALTER TABLE `product_inventories`
  ADD CONSTRAINT `product_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_inventories_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_inventories_warehouse_location_id_foreign` FOREIGN KEY (`warehouse_location_id`) REFERENCES `warehouse_locations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_tags`
--
ALTER TABLE `product_tags`
  ADD CONSTRAINT `product_tags_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quotes`
--
ALTER TABLE `quotes`
  ADD CONSTRAINT `quotes_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `persons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quotes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quote_items`
--
ALTER TABLE `quote_items`
  ADD CONSTRAINT `quote_items_quote_id_foreign` FOREIGN KEY (`quote_id`) REFERENCES `quotes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tags`
--
ALTER TABLE `tags`
  ADD CONSTRAINT `tags_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD CONSTRAINT `user_groups_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_groups_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `warehouse_activities`
--
ALTER TABLE `warehouse_activities`
  ADD CONSTRAINT `warehouse_activities_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `activities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `warehouse_activities_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `warehouse_locations`
--
ALTER TABLE `warehouse_locations`
  ADD CONSTRAINT `warehouse_locations_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `warehouse_tags`
--
ALTER TABLE `warehouse_tags`
  ADD CONSTRAINT `warehouse_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `warehouse_tags_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `web_form_attributes`
--
ALTER TABLE `web_form_attributes`
  ADD CONSTRAINT `web_form_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `web_form_attributes_web_form_id_foreign` FOREIGN KEY (`web_form_id`) REFERENCES `web_forms` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
