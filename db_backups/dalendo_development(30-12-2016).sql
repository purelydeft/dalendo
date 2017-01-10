-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2016 at 08:11 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dalendo_development`
--

-- --------------------------------------------------------

--
-- Table structure for table `ar_internal_metadata`
--

CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `ar_internal_metadata`
--

INSERT INTO `ar_internal_metadata` (`key`, `value`, `created_at`, `updated_at`) VALUES
('environment', 'development', '2016-12-08 13:05:53', '2016-12-08 13:05:53');

-- --------------------------------------------------------

--
-- Table structure for table `badges`
--

CREATE TABLE `badges` (
  `id` int(11) NOT NULL,
  `badge_name` varchar(255) DEFAULT NULL,
  `badge_description` varchar(255) DEFAULT NULL,
  `badge_image` varchar(255) DEFAULT NULL,
  `badge_status` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `badges`
--

INSERT INTO `badges` (`id`, `badge_name`, `badge_description`, `badge_image`, `badge_status`, `created_at`, `updated_at`) VALUES
(1, 'Dalendryo', 'You are still at baby level. And, you are growing fast!', '2383831ac9e5_1.dalendryo.jpg', 'active', '2016-12-14 12:12:14', '2016-12-29 19:46:44'),
(2, 'New Dalender', '30 days after registration, we are happy to welcome you in our community', '28091db78df6_2.New Dalender.jpg', 'active', '2016-12-14 12:13:11', '2016-12-14 12:13:11'),
(3, 'Enthusiast', 'Your smiling face is adorable. You are preparing for the Big trip', 'bbee23744152_3.Enthusiast.jpg', 'active', '2016-12-14 12:14:06', '2016-12-14 12:14:06'),
(4, 'Explorer', 'As an adventurer, you climb step after step', '95e53002a9c6_4.Explorer.jpg', 'active', '2016-12-14 12:14:42', '2016-12-14 12:14:42'),
(5, 'Helper', 'You help others and get higher with them', 'cda455994521_5.Helper.jpg', 'active', '2016-12-14 12:15:13', '2016-12-14 12:15:13'),
(6, 'Defender', 'You feel alright to offer support publicly', '78505e446f17_6.Defender.jpg', 'active', '2016-12-14 12:15:46', '2016-12-14 12:15:46'),
(7, 'Campaigner', 'Your friends of friends know about your support', 'a221c4d5f9ad_7.Campaigner.jpg', 'active', '2016-12-14 12:16:13', '2016-12-14 12:16:13'),
(8, 'Knight', 'Theres no brave like you as a champion for the quest of the Holy grail', '69ce3c68aa7d_8.knight.jpg', 'active', '2016-12-14 12:17:59', '2016-12-14 12:17:59'),
(9, 'Ambassador', 'Your knowledge and presence are a real plus to boost relationships', '12f0814991b0_9.Ambassador.jpeg', 'active', '2016-12-14 12:18:56', '2016-12-14 12:18:56'),
(10, 'Expert', 'At the hill top, your advice are gold and your attitude is source of inspiration', '8325a140ced2_10.Expert.jpg', 'active', '2016-12-14 12:19:27', '2016-12-14 12:19:27'),
(11, 'Alchemist', 'You build up your legend and test the force', '08d6b01343d5_11.Alchimist.jpg', 'active', '2016-12-14 12:19:57', '2016-12-14 12:19:57'),
(12, 'Federator', 'Creativity is your best friend, your intuition is speechless', '60b83483e381_12.Federator.jpg', 'active', '2016-12-14 12:20:25', '2016-12-14 12:20:25'),
(13, 'Brainer', 'You see the matrix. Others need you to better understand the world', '1b18699d60b5_13.Brainer.jpg', 'active', '2016-12-14 12:20:54', '2016-12-14 12:20:54'),
(14, 'Eminence', 'Your achievements help others to persevere to build a better future', '329103e51565_14.Eminence.jpg', 'active', '2016-12-14 12:21:27', '2016-12-14 12:21:27'),
(15, 'Emperor', 'As a citizen of the world, your footprints are graved for a long term', '80c83a1a0cc8_15.Emperor.jpg', 'active', '2016-12-14 12:22:27', '2016-12-14 12:23:32'),
(16, 'Overlord', 'Humility is your DNA. The positive effects of your actions give life to new forces', '8b64a58f78e7_1.dalendryo.jpg', 'active', '2016-12-14 12:25:23', '2016-12-14 12:25:23'),
(17, 'Ninja', 'Thanks to your support, 3 projects were supported. The best is coming…', '23a968fd00d0_4.Explorer.jpg', 'active', '2016-12-14 12:25:52', '2016-12-14 12:25:52'),
(18, 'Initiator', 'You got successfully funded for 2 projects at least', 'a0cad5c66aed_2.New Dalender.jpg', 'active', '2016-12-14 12:26:22', '2016-12-14 12:26:22'),
(19, 'Screen lover', 'Thanks to you, 3 film projects were supported. Congratulations!', '60bae3d54c31_SCREEN LOVER.jpg', 'active', '2016-12-14 12:27:24', '2016-12-14 12:27:24'),
(20, 'Musicalover', 'Thanks to you, 3 music projects were supported. We thank you for them!', 'db30c2b376e8_MUSICALOVER.jpg', 'active', '2016-12-14 12:27:53', '2016-12-14 12:27:53'),
(21, 'Geek', 'Thanks to you, 3 Technology projects were supported. You re doing well!', 'b6d0469b3468_GEEK.jpg', 'active', '2016-12-14 12:28:51', '2016-12-14 12:28:51'),
(22, 'Food lover', 'Thanks to you, 3 Food projects were supported. You re a gourmet!', '345ed9b7201d_FOOD LOVER.jpg', 'active', '2016-12-14 12:29:31', '2016-12-14 12:29:31'),
(23, 'Wine lover', 'Thanks to you, 3 wine related projects were supported. Bacchus is happy!', '03d47066f0bf_WINE LOVER.jpg', 'active', '2016-12-14 12:31:30', '2016-12-14 12:31:30'),
(24, 'Fashion lover', 'Thanks to you, 3 Fashion & Design projects were supported. Many thanks!', 'f6a39c3584bc_FASHION LOVER.jpg', 'active', '2016-12-14 12:31:41', '2016-12-14 12:31:41'),
(25, 'Green lover', 'Thanks to you, 3 green projects were supported. You are doing well!', 'ff1654c9fe14_GREEN LOVER.jpg', 'active', '2016-12-14 12:31:59', '2016-12-14 12:31:59'),
(26, 'Soul gamer', 'Thanks to you, 3 game projects were supported. Congratulations!', '5cf56b4b19fb_SOUL GAMER.jpg', 'active', '2016-12-14 12:32:30', '2016-12-14 12:32:30');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `category_description` varchar(255) DEFAULT NULL,
  `category_icon` varchar(255) DEFAULT NULL,
  `category_image` varchar(255) DEFAULT NULL,
  `category_status` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_description`, `category_icon`, `category_image`, `category_status`, `created_at`, `updated_at`) VALUES
(2, 'Women Entrepreneuship', 'Women Entrepreneuship', 'icon-001', '', 'active', '2016-12-12 20:03:48', '2016-12-27 16:06:32'),
(3, 'Craft & Business', 'Craft & Business', 'icon-002', '', 'active', '2016-12-12 20:05:57', '2016-12-12 20:05:57'),
(4, 'Agriculture ', 'Agriculture ', 'icon-003', '', 'active', '2016-12-12 20:06:29', '2016-12-12 20:06:29'),
(5, 'Agrifood', 'Agrifood', 'icon-004', '', 'active', '2016-12-12 20:07:07', '2016-12-12 20:07:07'),
(6, 'Wine & Vineyard', 'Wine & Vineyard', 'icon-005', '', 'active', '2016-12-12 20:07:29', '2016-12-12 20:07:29'),
(7, 'Consuming', 'Consuming', 'icon-006', '', 'active', '2016-12-12 20:07:59', '2016-12-12 20:07:59'),
(8, 'Restaurant & Food', 'Restaurant & Food', 'icon-007', '', 'active', '2016-12-12 20:08:20', '2016-12-12 20:08:20'),
(9, 'Charities & Communities', 'Charities & Communities', 'icon-008', '', 'active', '2016-12-12 20:08:49', '2016-12-12 20:08:49'),
(10, 'Environment & Climate', 'Environment & Climate', 'icon-009', '', 'active', '2016-12-12 20:09:08', '2016-12-12 20:09:22'),
(11, 'Culture & Stage', 'Culture & Stage', 'icon-0010', '', 'active', '2016-12-12 20:09:45', '2016-12-12 20:10:02'),
(12, 'Fashion & Design', 'Fashion & Design', 'icon-0011', '', 'active', '2016-12-12 20:10:22', '2016-12-12 20:10:22'),
(13, 'Music', 'Music', 'icon-0012', '', 'active', '2016-12-12 20:10:38', '2016-12-12 20:10:38'),
(14, 'Art', 'Art', 'icon-0013', '', 'active', '2016-12-12 20:11:02', '2016-12-12 20:11:02'),
(15, 'Games', 'Games', 'icon-0014', '', 'active', '2016-12-12 20:11:39', '2016-12-12 20:11:39'),
(16, 'Film & Video', 'Film & Video', 'icon-0015', '', 'active', '2016-12-12 20:12:05', '2016-12-12 20:12:05'),
(17, 'Photo & Video', 'Photo & Video', 'icon-0016', '', 'active', '2016-12-12 20:12:29', '2016-12-12 20:12:29'),
(18, 'Publishing & Journal', 'Publishing & Journal', 'icon-0017', '', 'active', '2016-12-12 20:12:46', '2016-12-12 20:12:46'),
(19, 'Comics', 'Comics', 'icon-0018', '', 'active', '2016-12-12 20:13:10', '2016-12-12 20:13:10'),
(20, 'Health', 'Health', 'icon-0019', '', 'active', '2016-12-12 20:13:29', '2016-12-12 20:13:29'),
(21, 'Sport', 'Sport', 'icon-0020', '', 'active', '2016-12-12 20:13:56', '2016-12-12 20:13:56'),
(22, 'Mobility & Transportation', 'Mobility & Transportation', 'icon-0021', '', 'active', '2016-12-12 20:14:15', '2016-12-12 20:14:15'),
(23, 'Housing', 'Housing', 'icon-0022', '', 'active', '2016-12-12 20:14:27', '2016-12-12 20:14:27'),
(24, 'Events', 'Events', 'icon-0023', '', 'active', '2016-12-12 20:14:40', '2016-12-12 20:14:40'),
(25, 'Education & Childhood', 'Education & Childhood', 'icon-0024', '', 'active', '2016-12-12 20:14:54', '2016-12-12 20:14:54'),
(26, 'Communication ', 'Communication ', 'icon-0025', '', 'active', '2016-12-12 20:15:23', '2016-12-12 20:15:23'),
(27, 'Technology', 'Technology', 'icon-0026', '', 'active', '2016-12-12 20:15:42', '2016-12-12 20:15:42'),
(28, 'Biotechnology', 'Biotechnology', 'icon-0027', '', 'active', '2016-12-12 20:16:01', '2016-12-12 20:16:01'),
(29, 'Renewable energy', 'Renewable energy', 'icon-0028', '', 'active', '2016-12-12 20:16:24', '2016-12-12 20:16:36'),
(30, 'Digital & Internet of things', 'Digital & Internet of things', 'icon-0029', '', 'active', '2016-12-12 20:16:55', '2016-12-12 20:16:55'),
(31, 'Social innovation', 'Social innovation', 'icon-0030', '', 'active', '2016-12-12 20:17:14', '2016-12-12 20:17:14'),
(32, 'Heritage & Monuments', 'Heritage & Monuments', 'icon-0031', '', 'active', '2016-12-12 20:17:38', '2016-12-12 20:17:38'),
(33, 'Tourism (Eco- & Innovation)', 'Tourism (Eco- & Innovation)', 'icon-0032', '', 'active', '2016-12-12 20:17:56', '2016-12-12 20:17:56'),
(34, 'Travel', 'Travel', 'icon-0033', '', 'active', '2016-12-12 20:18:08', '2016-12-12 20:18:08'),
(35, 'Industry', 'Industry', 'icon-0034', '', 'active', '2016-12-12 20:18:20', '2016-12-12 20:18:20');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `country_name` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_name`, `nationality`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', 'Afghan', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(2, 'Albania', 'Albanian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(3, 'Algeria', 'Algerian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(4, 'Andorra', 'Andorran', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(5, 'Angola', 'Angolan', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(6, 'Antigua and Barbuda', 'Antiguans and Barbudans', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(7, 'Argentina', 'Argentinean', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(8, 'Armenia', 'Armenian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(9, 'Australia', 'Australian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(10, 'Austria', 'Austrian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(11, 'Azerbaijan', 'Azerbaijani', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(12, 'The Bahamas', 'Bahamian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(13, 'Bahrain', 'Bahraini', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(14, 'Bangladesh', 'Bangladeshi', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(15, 'Barbados', 'Barbadian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(16, 'Belarus', 'Belarusian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(17, 'Belgium', 'Belgian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(18, 'Belize', 'Belizean', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(19, 'Benin', 'Beninese', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(20, 'Bhutan', 'Bhutanese', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(21, 'Bolivia', 'Bolivian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(22, 'Bosnia and Herzegovina', 'Bosnian and Herzegovinian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(23, 'Botswana', 'Batswana', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(24, 'Brazil', 'Brazilian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(25, 'Brunei', 'Bruneian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(26, 'Bulgaria', 'Bulgarian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(27, 'Burkina Faso', 'Burkinabe', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(28, 'Burundi', 'Burundian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(29, 'Cambodia', 'Cambodian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(30, 'Cameroon', 'Cameroonian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(31, 'Canada', 'Canadian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(32, 'Cape Verde', 'Cape Verdian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(33, 'Central African Republic', 'Central African', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(34, 'Chad', 'Chadian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(35, 'Chile', 'Chilean', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(36, 'China', 'Chinese', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(37, 'Colombia', 'Colombian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(38, 'Comoros', 'Comoran', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(39, 'Congo Republic of the', 'Congolese', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(40, 'Congo Democratic Republic of the', 'Congolese', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(41, 'Costa Rica', 'Costa Rican', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(42, 'Cote d', 'Ivorian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(43, 'Croatia', 'Croatian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(44, 'Cuba', 'Cuban', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(45, 'Cyprus', 'Cypriot', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(46, 'Czech Republic', 'Czech', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(47, 'Denmark', 'Danish', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(48, 'Djibouti', 'Djibouti', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(49, 'Dominica', 'Dominican', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(50, 'Dominican Republic', 'Dominican', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(51, 'East Timor', 'East Timorese', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(52, 'Ecuador', 'Ecuadorean', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(53, 'Egypt', 'Egyptian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(54, 'El Salvador', 'Salvadoran', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(55, 'Equatorial Guinea', 'Equatorial Guinean', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(56, 'Eritrea', 'Eritrean', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(57, 'Estonia', 'Estonian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(58, 'Ethiopia', 'Ethiopian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(59, 'Fiji', 'Fijian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(60, 'Finland', 'Finnish', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(61, 'France', 'French', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(62, 'Gabon', 'Gabonese', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(63, 'The Gambia', 'Gambian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(64, 'Georgia', 'Georgian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(65, 'Germany', 'German', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(66, 'Ghana', 'Ghanaian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(67, 'Greece', 'Greek', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(68, 'Grenada', 'Grenadian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(69, 'Guatemala', 'Guatemalan', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(70, 'Guinea', 'Guinean', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(71, 'Guinea-Bissau', 'Guinea-Bissauan', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(72, 'Guyana', 'Guyanese', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(73, 'Haiti', 'Haitian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(74, 'Honduras', 'Honduran', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(75, 'Hungary', 'Hungarian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(76, 'Iceland', 'Icelander', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(77, 'India', 'Indian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(78, 'Indonesia', 'Indonesian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(79, 'Iran', 'Iranian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(80, 'Iraq', 'Iraqi', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(81, 'Ireland', 'Irish', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(82, 'Israel', 'Israeli', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(83, 'Italy', 'Italian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(84, 'Jamaica', 'Jamaican', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(85, 'Japan', 'Japanese', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(86, 'Jordan', 'Jordanian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(87, 'Kazakhstan', 'Kazakhstani', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(88, 'Kenya', 'Kenyan', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(89, 'Kiribati', 'I-Kiribati', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(90, 'Korea, North', 'North Korean', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(91, 'Korea, South', 'South Korean', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(92, 'Kuwait', 'Kuwaiti', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(93, 'Kyrgyz Republic', 'Kirghiz', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(94, 'Laos', 'Laotian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(95, 'Latvia', 'Latvian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(96, 'Lebanon', 'Lebanese', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(97, 'Lesotho', 'Mosotho', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(98, 'Liberia', 'Liberian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(99, 'Libya', 'Libyan', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(100, 'Liechtenstein', 'Liechtensteiner', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(101, 'Lithuania', 'Lithuanian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(102, 'Luxembourg', 'Luxembourger', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(103, 'Macedonia', 'Macedonian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(104, 'Madagascar', 'Malagasy', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(105, 'Malawi', 'Malawian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(106, 'Malaysia', 'Malaysian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(107, 'Maldives', 'Maldivan', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(108, 'Mali', 'Malian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(109, 'Malta', 'Maltese', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(110, 'Marshall Islands', 'Marshallese', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(111, 'Mauritania', 'Mauritanian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(112, 'Mauritius', 'Mauritian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(113, 'Mexico', 'Mexican', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(114, 'Federated States of Micronesia', 'Micronesian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(115, 'Moldova', 'Moldovan', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(116, 'Monaco', 'Monegasque', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(117, 'Mongolia', 'Mongolian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(118, 'Morocco', 'Moroccan', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(119, 'Mozambique', 'Mozambican', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(120, 'Myanmar (Burma)', 'Burmese', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(121, 'Namibia', 'Namibian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(122, 'Nauru', 'Nauruan', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(123, 'Nepal', 'Nepalese', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(124, 'Netherlands', 'Dutch', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(125, 'New Zealand', 'New Zealander', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(126, 'Nicaragua', 'Nicaraguan', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(127, 'Niger', 'Nigerien', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(128, 'Nigeria', 'Nigerian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(129, 'Norway', 'Norwegian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(130, 'Oman', 'Omani', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(131, 'Pakistan', 'Pakistani', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(132, 'Palau', 'Palauan', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(133, 'Panama', 'Panamanian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(134, 'Papua New Guinea', 'Papua New Guinean', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(135, 'Paraguay', 'Paraguayan', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(136, 'Peru', 'Peruvian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(137, 'Philippines', 'Filipino', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(138, 'Poland', 'Polish', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(139, 'Portugal', 'Portuguese', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(140, 'Qatar', 'Qatari', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(141, 'Romania', 'Romanian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(142, 'Russia', 'Russian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(143, 'Rwanda', 'Rwandan', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(144, 'Saint Kitts and Nevis', 'Kittian and Nevisian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(145, 'Saint Lucia', 'Saint Lucian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(146, 'Samoa', 'Samoan', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(147, 'San Marino', 'Sammarinese', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(148, 'Sao Tome and Principe', 'Sao Tomean', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(149, 'Saudi Arabia', 'Saudi Arabian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(150, 'Senegal', 'Senegalese', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(151, 'Serbia and Montenegro', 'Serbian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(152, 'Seychelles', 'Seychellois', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(153, 'Sierra Leone', 'Sierra Leonean', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(154, 'Singapore', 'Singaporean', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(155, 'Slovakia', 'Slovak', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(156, 'Slovenia', 'Slovene', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(157, 'Solomon Islands', 'Solomon Islander', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(158, 'Somalia', 'Somali', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(159, 'South Africa', 'South African', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(160, 'Spain', 'Spanish', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(161, 'Sri Lanka', 'Sri Lankan', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(162, 'Sudan', 'Sudanese', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(163, 'Suriname', 'Surinamer', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(164, 'Swaziland', 'Swazi', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(165, 'Sweden', 'Swedish', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(166, 'Switzerland', 'Swiss', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(167, 'Syria', 'Syrian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(168, 'Taiwan', 'Taiwanese', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(169, 'Tajikistan', 'Tadzhik', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(170, 'Tanzania', 'Tanzanian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(171, 'Thailand', 'Thai', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(172, 'Togo', 'Togolese', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(173, 'Tonga', 'Tongan', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(174, 'Trinidad and Tobago', 'Trinidadian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(175, 'Tunisia', 'Tunisian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(176, 'Turkey', 'Turkish', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(177, 'Turkmenistan', 'Turkmen', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(178, 'Tuvalu', 'Tuvaluan', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(179, 'Uganda', 'Ugandan', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(180, 'Ukraine', 'Ukrainian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(181, 'United Arab Emirates', 'Emirian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(182, 'United Kingdom', 'British', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(183, 'United States', 'American', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(184, 'Uruguay', 'Uruguayan', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(185, 'Uzbekistan', 'Uzbekistani', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(186, 'Vanuatu', 'Ni-Vanuatu', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(187, 'Vatican City (Holy See)', 'none', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(188, 'Venezuela', 'Venezuelan', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(189, 'Vietnam', 'Vietnamese', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(190, 'Yemen', 'Yemeni', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(191, 'Zambia', 'Zambian', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00'),
(192, 'Zimbabwe', 'Zimbabwean', 'active', '2016-12-15 00:00:00', '2016-12-15 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(11) NOT NULL,
  `currency_name` varchar(255) DEFAULT NULL,
  `currency_code` varchar(255) DEFAULT NULL,
  `currency_status` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `currency_name`, `currency_code`, `currency_status`, `created_at`, `updated_at`) VALUES
(1, '$USD', 'USD', 'active', '2016-12-15 05:24:30', '2016-12-15 05:24:30'),
(2, '$AUD', 'AUD', 'active', '2016-12-15 05:24:30', '2016-12-15 05:24:30'),
(3, 'CHF', 'CHF', 'active', '2016-12-15 12:38:45', '2016-12-15 12:38:45'),
(4, 'kr NOK', 'NOK', 'active', '2016-12-15 12:38:45', '2016-12-15 12:38:45'),
(5, '£', 'GBP', 'active', '2016-12-15 02:07:10', '2016-12-15 02:07:10'),
(6, '$CAD', 'CAD', 'active', '2016-12-15 02:07:10', '2016-12-15 02:07:10'),
(7, 'kr SEK', 'SEK', 'active', '2016-12-15 03:09:08', '2016-12-15 03:09:08'),
(8, 'kr DKK', 'DKK', 'active', '2016-12-15 12:09:16', '2016-12-15 12:09:16'),
(9, '€', 'EUR', 'active', '2016-12-15 12:09:16', '2016-12-15 12:09:16');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `language_name` varchar(255) DEFAULT NULL,
  `language_code` varchar(255) DEFAULT NULL,
  `language_status` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language_name`, `language_code`, `language_status`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 'active', '2016-12-15 10:22:20', '2016-12-15 11:23:41'),
(2, 'French', 'fr', 'active', '2016-12-15 10:22:20', '2016-12-15 10:22:20'),
(3, 'Chinese', 'zh', 'active', '2016-12-15 05:14:19', '2016-12-15 08:15:18');

-- --------------------------------------------------------

--
-- Table structure for table `projectaboutyous`
--

CREATE TABLE `projectaboutyous` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `project_creator_image` varchar(255) DEFAULT NULL,
  `creator_image_status` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `structure` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `nationality` int(11) DEFAULT NULL,
  `phonenumber` bigint(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `projectaboutyous`
--

INSERT INTO `projectaboutyous` (`id`, `project_id`, `project_creator_image`, `creator_image_status`, `firstname`, `lastname`, `structure`, `address`, `country`, `nationality`, `phonenumber`, `status`, `created_at`, `updated_at`) VALUES
(5, 20, '871aa8137cc1_Koala.jpg', 'new', ' Michaels', ' Admin', 'sam', 'Gurdapur', 77, 77, 94654705499, 'active', '2016-12-21 13:07:44', '2016-12-29 22:39:48'),
(6, 21, 'bc261557d56a_right_single.png', 'new', ' Michael ', ' Admin ', 'asdasdas', ' #5689, chandigarh ', 24, 24, 9988459673, 'active', '2016-12-21 15:05:47', '2016-12-22 16:31:04'),
(7, 22, '2d4754a7d262_user.png', 'old', ' Michael ', ' Admin ', 'dfgdfgdgdfg', ' #5689, chandigarh ', 1, 1, 9988459673, 'active', '2016-12-27 14:45:33', '2016-12-27 14:45:33'),
(8, 23, '2d4754a7d262_user.png', 'old', ' Michael ', ' Admin ', 'dfgfgdfgfdg', ' #5689, chandigarh ', 1, 1, 9988459673, 'active', '2016-12-27 15:09:27', '2016-12-27 15:09:27'),
(9, 24, '2d4754a7d262_user.png', 'old', ' Michael ', ' Admin ', 'test', ' #5689, chandigarh ', 1, 1, 9988459673, 'active', '2016-12-27 16:50:47', '2016-12-27 16:50:47'),
(10, 25, '2d4754a7d262_user.png', 'old', ' Michael ', ' Admin ', 'test comp', ' #5689, chandigarh ', 1, 1, 9988459673, 'active', '2016-12-27 19:47:42', '2016-12-27 19:47:42'),
(11, 26, '2d4754a7d262_user.png', 'old', ' Michael ', ' Admin ', 'solid comp', ' #5689, chandigarh ', 1, 1, 9988459673, 'active', '2016-12-27 19:51:09', '2016-12-27 19:51:09'),
(12, 27, '2d4754a7d262_user.png', 'old', ' Michael ', ' Admin ', 'deft comp', ' #5689, chandigarh ', 1, 1, 9988459673, 'active', '2016-12-27 19:57:23', '2016-12-27 19:57:23'),
(13, 28, '2d4754a7d262_user.png', 'old', ' Michael ', ' Admin ', 'equity comp', ' #5689, chandigarh ', 1, 1, 9988459673, 'active', '2016-12-27 20:01:04', '2016-12-27 20:01:04'),
(14, 29, '2d4754a7d262_user.png', 'old', ' Michael ', ' Admin ', '', ' #5689, chandigarh ', 1, 1, 9988459673, 'active', '2016-12-28 17:15:03', '2016-12-28 17:15:03'),
(15, 30, '7589a80b5de6_5.Helper.jpg', 'new', ' Michael ', ' Admin ', 'dfgdfgdfgdf', ' #5689, chandigarh ', 1, 1, 9988459673, 'active', '2016-12-28 17:42:18', '2016-12-28 17:42:18'),
(16, 31, '', 'old', 'deftsoft', 'company', 'sd', 'asd', 1, 1, 9465470549, 'active', '2016-12-28 17:56:03', '2016-12-28 17:56:03'),
(17, 32, 'e9f04a95f82d_dubai_uae_buildings_skyscrapers_night_96720_1920x1080.jpg', 'new', 'TEST', 'QA ', 'TEST STRUCTURE', ' #5689, chandigarh ', 1, 1, 9988459673, 'active', '2016-12-29 13:23:02', '2016-12-29 13:23:02'),
(18, 33, '725f805b6b5f_dubai_uae_buildings_skyscrapers_night_96720_1920x1080.jpg', 'new', 'TEST', 'QA ', 'TEST STRUCTURE', ' #5689, chandigarh ', 1, 1, 9988459673, 'active', '2016-12-29 13:23:10', '2016-12-29 13:23:10'),
(19, 34, 'e7ca9179b17b_dubai_uae_buildings_skyscrapers_night_96720_1920x1080.jpg', 'new', 'TEST', 'QA ', 'TEST STRUCTURE', ' #5689, chandigarh ', 1, 1, 9988459673, 'active', '2016-12-29 13:23:11', '2016-12-29 13:23:11'),
(20, 35, 'd4b895ec8e6e_dubai_uae_buildings_skyscrapers_night_96720_1920x1080.jpg', 'new', 'TEST', 'QA ', 'TEST STRUCTURE', ' #5689, chandigarh ', 1, 1, 9988459673, 'active', '2016-12-29 13:23:11', '2016-12-29 13:23:11'),
(21, 36, 'c18d20422804_dubai_uae_buildings_skyscrapers_night_96720_1920x1080.jpg', 'new', 'TEST', 'QA ', 'TEST STRUCTURE', ' #5689, chandigarh ', 1, 1, 9988459673, 'active', '2016-12-29 13:23:12', '2016-12-29 13:23:12'),
(22, 37, 'ab4b9a4d3845_4.jpg', 'new', 'TEST', 'QA DEFTSOFR', 'DEFTSOFT HUB', ' #5689, chandigarh ', 1, 1, 9988459673, 'active', '2016-12-29 13:31:13', '2016-12-29 13:31:13'),
(23, 38, '686361be9317_1.jpg', 'new', ' Michael ', ' Admin ', 'tert', ' #5689, chandigarh ', 1, 1, 9988459673, 'active', '2016-12-29 13:35:03', '2016-12-29 13:35:03'),
(24, 39, 'default.jpg', 'old', 'deftsoft', 'company', 'vghvghvg', 'dgdfgdg', 1, 1, 9465470549, 'active', '2016-12-29 16:46:27', '2016-12-29 16:46:27'),
(25, 42, 'default.jpg', 'old', 'sfsdf', 'sdfsdf', 'sdfsdfsd', 'sdfsdf', 8, 6, 9988459673, 'active', '2016-12-29 22:42:47', '2016-12-29 22:42:47');

-- --------------------------------------------------------

--
-- Table structure for table `projectaccounts`
--

CREATE TABLE `projectaccounts` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `bankemail` varchar(255) DEFAULT NULL,
  `bankname` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `bank_ifsc_code` varchar(255) DEFAULT NULL,
  `account_type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `projectaccounts`
--

INSERT INTO `projectaccounts` (`id`, `project_id`, `fullname`, `payment_type`, `bankemail`, `bankname`, `account_number`, `bank_ifsc_code`, `account_type`, `status`, `created_at`, `updated_at`) VALUES
(6, 20, '', 'paypal', 'test23test@gmail.com', '', '', '', '', 'active', '2016-12-21 13:07:44', '2016-12-29 22:39:48'),
(7, 21, '', 'paypal', 'sammpaypal@gmail.com', '', '', '', '', 'active', '2016-12-21 15:05:47', '2016-12-22 16:31:05'),
(8, 22, 'sambhav', 'bank', 'sam@gmail.com', 'sam123', '7887878787878', '125478', 'current_account', 'active', '2016-12-27 14:45:33', '2016-12-27 14:45:33'),
(9, 23, '', 'paypal', 'sam@gmail.com', '', '', '', '', 'active', '2016-12-27 15:09:27', '2016-12-27 15:09:27'),
(10, 24, 'test', 'bank', 'test@gmail.com', 'testgmail.com', '4654646464', 'sadasd4654', 'current_account', 'active', '2016-12-27 16:50:48', '2016-12-27 16:50:48'),
(11, 25, 'jitu anna', 'bank', 'jitu@gmail.com', 'HDFC', '654654644646', 'HDFC0001', 'saving_account', 'active', '2016-12-27 19:47:42', '2016-12-27 19:47:42'),
(12, 26, 'test', 'bank', 'test@gmail.com', 'test bank', '123456545646', 'test123', 'current_account', 'active', '2016-12-27 19:51:09', '2016-12-27 19:51:09'),
(13, 27, 'business', 'bank', 'business@gmail.com', 'business', '6546545648745', 'dsfsdf123', 'saving_account', 'active', '2016-12-27 19:57:23', '2016-12-27 19:57:23'),
(14, 28, 'equity', 'bank', 'equity@gmail.com', 'kotak mahindra', '56456879', 'kotak123', 'saving_account', 'active', '2016-12-27 20:01:04', '2016-12-27 20:01:04'),
(15, 30, '', 'paypal', 'samthakur123sam@gmail.com', '', '', '', '', 'active', '2016-12-28 17:42:18', '2016-12-28 17:42:18'),
(16, 31, '', '', '', '', '', '', '', 'active', '2016-12-28 17:56:03', '2016-12-28 17:56:03'),
(17, 32, '', 'paypal', 'TEZT@TEST.COM', '', '', '', '', 'active', '2016-12-29 13:23:02', '2016-12-29 13:23:02'),
(18, 33, '', 'paypal', 'TEZT@TEST.COM', '', '', '', '', 'active', '2016-12-29 13:23:10', '2016-12-29 13:23:10'),
(19, 34, '', 'paypal', 'TEZT@TEST.COM', '', '', '', '', 'active', '2016-12-29 13:23:11', '2016-12-29 13:23:11'),
(20, 35, '', 'paypal', 'TEZT@TEST.COM', '', '', '', '', 'active', '2016-12-29 13:23:12', '2016-12-29 13:23:12'),
(21, 36, '', 'paypal', 'TEZT@TEST.COM', '', '', '', '', 'active', '2016-12-29 13:23:12', '2016-12-29 13:23:12'),
(22, 37, '', 'paypal', 'TEST@TEST.COM', '', '', '', '', 'active', '2016-12-29 13:31:13', '2016-12-29 13:31:13'),
(23, 38, '', 'paypal', 'tes@r.com', '', '', '', '', 'active', '2016-12-29 13:35:03', '2016-12-29 13:35:03'),
(24, 39, '', '', '', '', '', '', '', 'active', '2016-12-29 16:46:27', '2016-12-29 16:46:27'),
(25, 42, '', 'paypal', 'sam1123@gmail.com', '', '', '', '', 'active', '2016-12-29 22:42:47', '2016-12-29 22:42:47');

-- --------------------------------------------------------

--
-- Table structure for table `projectrewards`
--

CREATE TABLE `projectrewards` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `reward_tile` varchar(255) DEFAULT NULL,
  `reward_amount` int(11) DEFAULT NULL,
  `reward_description` varchar(255) DEFAULT NULL,
  `reward_shipping_details` varchar(255) DEFAULT NULL,
  `reward_estimated_delivery` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `projectrewards`
--

INSERT INTO `projectrewards` (`id`, `project_id`, `reward_tile`, `reward_amount`, `reward_description`, `reward_shipping_details`, `reward_estimated_delivery`, `status`, `created_at`, `updated_at`) VALUES
(13, 20, 'reward1', 100, 'ship3', '222222', '', 'active', '2016-12-21 13:07:44', '2016-12-29 22:39:48'),
(14, 20, 'reward2', 200, 'ship4', '11111', '', 'active', '2016-12-21 13:07:44', '2016-12-29 22:39:48'),
(15, 21, 'Reward 2', 15800, 'Reward 2', 'Reward 2sasadasdasdsad', '12/27/2016', 'active', '2016-12-21 15:05:47', '2016-12-21 15:05:47'),
(16, 22, 'dfgdfgfdg', 15800, 'dfgdfgdfg', 'dfgdfgdfgdfgfdgfdg', '12/28/2016', 'active', '2016-12-27 14:45:33', '2016-12-27 14:45:33'),
(17, 23, 'dfgfdgdfgdf', 15800, 'dfgdfgdfgdfg', 'dgdfgdfgfdgdfgdf', '12/27/2016', 'active', '2016-12-27 15:09:27', '2016-12-27 15:09:27'),
(18, 24, 'test', 1000, 'test', 'test', '12/28/2016', 'active', '2016-12-27 16:50:47', '2016-12-27 16:50:47'),
(19, 25, 'presale reward', 200, 'presale sdhgfjd', 'presale home', '12/29/2016', 'active', '2016-12-27 19:47:42', '2016-12-27 19:47:42'),
(20, 26, 'asdas', 250, 'dfgdf', 'dfgdfgfdg', '01/02/2017', 'active', '2016-12-27 19:51:09', '2016-12-27 19:51:09'),
(21, 27, 'business title', 350, 'business descr', 'business home', '01/20/2017', 'active', '2016-12-27 19:57:23', '2016-12-27 19:57:23'),
(22, 28, 'equity reward', 600, 'sdfsdf', 'equity home', '01/30/2017', 'active', '2016-12-27 20:01:04', '2016-12-27 20:01:04'),
(23, 30, 'dfgdfg', 12, 'dfgdfg', 'dfgfdg', '', 'active', '2016-12-28 17:42:18', '2016-12-28 17:42:18'),
(24, 30, 'dgdfg', 786, 'dfgdfgfdgfdg', 'dfgdfgfdgdfgdfg', '', 'active', '2016-12-28 17:42:18', '2016-12-28 17:42:18'),
(25, 31, 'reward1', 18500, 'asd', 'asd', '', 'active', '2016-12-28 17:56:03', '2016-12-28 17:56:03'),
(26, 31, 'reward2', 90000, 'asd', 'asd', '', 'active', '2016-12-28 17:56:03', '2016-12-28 17:56:03'),
(27, 32, 'QA ENGINEERING DEFTSOFT', 100, 'TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST', 'TES TEST TEST TEST TESTY \r\n#123 HOUSE TEST TEST TEST\r\nHJAB', '', 'active', '2016-12-29 13:23:02', '2016-12-29 13:23:02'),
(28, 33, 'QA ENGINEERING DEFTSOFT', 100, 'TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST', 'TES TEST TEST TEST TESTY \r\n#123 HOUSE TEST TEST TEST\r\nHJAB', '', 'active', '2016-12-29 13:23:10', '2016-12-29 13:23:10'),
(29, 34, 'QA ENGINEERING DEFTSOFT', 100, 'TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST', 'TES TEST TEST TEST TESTY \r\n#123 HOUSE TEST TEST TEST\r\nHJAB', '', 'active', '2016-12-29 13:23:11', '2016-12-29 13:23:11'),
(30, 35, 'QA ENGINEERING DEFTSOFT', 100, 'TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST', 'TES TEST TEST TEST TESTY \r\n#123 HOUSE TEST TEST TEST\r\nHJAB', '', 'active', '2016-12-29 13:23:12', '2016-12-29 13:23:12'),
(31, 36, 'QA ENGINEERING DEFTSOFT', 100, 'TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST', 'TES TEST TEST TEST TESTY \r\n#123 HOUSE TEST TEST TEST\r\nHJAB', '', 'active', '2016-12-29 13:23:12', '2016-12-29 13:23:12'),
(32, 37, 'QA QA QA QA ', 10, 'TEST TEST TEST TEST TEST TESTCTEST T   CTESCTES', 'TEST TEST TEST TEST TEST TESTCTEST T   CTESCTES', '', 'active', '2016-12-29 13:31:13', '2016-12-29 13:31:13'),
(33, 38, 'TEST', 120, 'TEST', 'TEST', '', 'active', '2016-12-29 13:35:03', '2016-12-29 13:35:03'),
(34, 39, 'dsfsdf', 1800, 'sfsdf', 'sdfsdf', '', 'active', '2016-12-29 16:46:27', '2016-12-29 16:46:27'),
(35, 42, 'sdfsdf', 15800, 'sfsdfdsf', 'sdfsdfsdfsd', '', 'active', '2016-12-29 22:42:47', '2016-12-29 22:42:47');

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `project_type` varchar(255) DEFAULT NULL,
  `project_title` varchar(255) DEFAULT NULL,
  `project_image` varchar(255) DEFAULT NULL,
  `short_desp` varchar(255) DEFAULT NULL,
  `project_location` varchar(255) DEFAULT NULL,
  `project_startdate` varchar(255) DEFAULT NULL,
  `project_enddate` varchar(255) DEFAULT NULL,
  `projectlanguage` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `project_minimum_fundinggoal` int(11) DEFAULT NULL,
  `project_funding_goal` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0=pending, 1=approved, 2=disapproved, 3=inactive',
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `category_id`, `project_type`, `project_title`, `project_image`, `short_desp`, `project_location`, `project_startdate`, `project_enddate`, `projectlanguage`, `currency`, `project_minimum_fundinggoal`, `project_funding_goal`, `user_id`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(20, 7, 'Presale', 'Demo Projectssss', 'c2b8aed5b59e_Jellyfish.jpg', 'My first demo projectsssss...', 'France Avenue South, Minneapolis, MN, United States', '12/29/2016', '03/30/2017', '2', '8', 15000000, 19800000, 35, 3, 12, 12, '2016-12-21 13:07:44', '2016-12-29 22:39:47'),
(21, 2, 'Solidarity', 'sadadsa', '539196eb9821_default.jpg', 'asdasdsad', 'Chandigarh, India', '12/21/2016', '01/25/2017', '1', '3', 111111, 111111, 3, 2, 12, 12, '2016-12-21 15:05:47', '2016-12-22 16:31:04'),
(22, 13, 'Donations', 'fgfghg', '90833441ff2d_images.png', 'fghgfhgfh', 'Hawaii, United States', '12/27/2016', '01/27/2017', '1', '1', 15800, 15800, 35, 1, 12, 12, '2016-12-27 14:45:33', '2016-12-27 14:45:33'),
(23, 15, 'Business', 'dfgh', '094e5b9b7288_default.jpg', 'dfgdfgfdg', 'Chandler, AZ, United States', '12/27/2016', '01/28/2017', '1', '8', 15800, 25800, 35, 1, 12, 12, '2016-12-27 15:09:27', '2016-12-27 15:09:27'),
(24, 5, 'Equity', 'test', 'ad8b889192de_Lighthouse.jpg', 'test', 'Chandigarh, India', '12/27/2016', '01/28/2017', '1', '1', 1000, 10000, 35, 1, 12, 12, '2016-12-27 16:50:47', '2016-12-27 16:50:47'),
(25, 12, 'Presale', 'presale test project', '7dd8bffb59bb_Desert.jpg', 'test', 'Delhi, India', '12/29/2016', '01/30/2017', '1', '1', 500, 15000, 39, 1, 12, 12, '2016-12-27 19:47:42', '2016-12-27 19:47:42'),
(26, 8, 'Solidarity', 'SADASD', '3fb2a164da85_Hydrangeas.jpg', 'ASDASD', 'Mumbai, Maharashtra, India', '12/31/2016', '01/31/2017', '1', '2', 600, 1800, 40, 1, 12, 12, '2016-12-27 19:51:09', '2016-12-27 19:51:09'),
(27, 16, 'Business', 'business project', '95fc29430ca0_Chrysanthemum.jpg', 'dfdfgd fgdfgdf', 'Shimla, Himachal Pradesh, India', '12/29/2016', '01/30/2017', '1', '1', 800, 1800, 35, 1, 12, 12, '2016-12-27 19:57:23', '2016-12-27 19:57:23'),
(28, 10, 'Equity', 'equity project', 'd3dda4c59e3d_Penguins.jpg', 'equity sdfsdf', 'Chennai, Tamil Nadu, India', '01/18/2017', '02/28/2017', '1', '1', 800, 2500, 41, 1, 12, 12, '2016-12-27 20:01:04', '2016-12-27 20:01:04'),
(29, 7, 'Donations', 'dfgsd', '9fe55670f654_Penguins.jpg', 'dfgsdfg', 'DFG Noodles, North Interstate 35 Frontage Road, Austin, TX, United States', '', '', '2', '6', 111, 222, 43, 1, 12, 12, '2016-12-28 17:15:03', '2016-12-28 17:15:03'),
(30, 14, 'Presale', 'fghfgh', '3fe9d20a8d10_2.New Dalender.jpg', 'fghfghgfh', 'Mohali, Punjab, India', '12/28/2016', '01/30/2017', '1', '6', 18500, 157800, 43, 1, 12, 12, '2016-12-28 17:42:18', '2016-12-28 17:42:18'),
(31, 2, 'Donations', 'dfgdfgdfg', '996594cec852_4.Explorer.jpg', 'dfgfdgdfgfdg', 'Shimla, Himachal Pradesh, India', '12/28/2016', '01/31/2017', '1', '1', 18000, 25800, 41, 0, 41, 41, '2016-12-28 17:56:03', '2016-12-28 17:56:03'),
(32, 27, 'Presale', 'QA AUTOMATION', 'b152f0615ab2_2.png', 'TEST TEST TEST TEST TETS TETST GTEST TYETSTV TEST TEST TEST TESTT TEST TESTY TEST TEST TEST TEST TEST TEST TEST TEST TEST', 'Mohali, Punjab, India', '12/29/2016', '02/22/2017', '1', '1', 1200, 100, 35, 1, 12, 12, '2016-12-29 13:23:02', '2016-12-29 13:23:02'),
(33, 27, 'Business', 'QA AUTOMATION', '1a75c2aa3e95_2.png', 'TEST TEST TEST TEST TETS TETST GTEST TYETSTV TEST TEST TEST TESTT TEST TESTY TEST TEST TEST TEST TEST TEST TEST TEST TEST', 'Mohali, Punjab, India', '12/29/2016', '02/22/2017', '1', '1', 1200, 100, 35, 0, 12, 12, '2016-12-29 13:23:10', '2016-12-29 13:23:10'),
(34, 27, 'Equity', 'QA AUTOMATION', '3870520dc8f5_2.png', 'TEST TEST TEST TEST TETS TETST GTEST TYETSTV TEST TEST TEST TESTT TEST TESTY TEST TEST TEST TEST TEST TEST TEST TEST TEST', 'Mohali, Punjab, India', '12/29/2016', '02/22/2017', '1', '1', 1200, 100, 35, 0, 12, 12, '2016-12-29 13:23:11', '2016-12-29 13:23:11'),
(35, 27, 'Presale', 'QA AUTOMATION', 'b7be13258db7_2.png', 'TEST TEST TEST TEST TETS TETST GTEST TYETSTV TEST TEST TEST TESTT TEST TESTY TEST TEST TEST TEST TEST TEST TEST TEST TEST', 'Mohali, Punjab, India', '12/29/2016', '02/22/2017', '1', '1', 1200, 100, 35, 0, 12, 12, '2016-12-29 13:23:11', '2016-12-29 13:23:11'),
(36, 27, 'Solidarity', 'QA AUTOMATION', '281dff2d6360_2.png', 'TEST TEST TEST TEST TETS TETST GTEST TYETSTV TEST TEST TEST TESTT TEST TESTY TEST TEST TEST TEST TEST TEST TEST TEST TEST', 'Mohali, Punjab, India', '12/29/2016', '02/22/2017', '1', '1', 1200, 100, 35, 0, 12, 12, '2016-12-29 13:23:12', '2016-12-29 13:23:12'),
(37, 4, 'Donations', 'TEST ABC', '043fcbeeec6b_3.png', 'TEST TEST TEST TEST TEST TESTCTEST T   CTESCTES', 'India', '12/30/2016', '06/14/2017', '2', '7', 12, 100, 43, 0, 12, 12, '2016-12-29 13:31:13', '2016-12-29 13:31:13'),
(38, 5, 'Donations', 'TESTQA', '344512033e57_4.jpg', 'TEST TEST TEST TEST TETS TEST ', 'Indianapolis, IN, United States', '12/30/2016', '04/15/2017', '1', '6', 100, 2100, 42, 0, 12, 12, '2016-12-29 13:35:03', '2016-12-29 13:35:03'),
(39, 2, 'Presale', 'asdasdasd', 'b68972aca6b5_images.png', 'asdasdsad', 'CHS Field, North Broadway Street, Saint Paul, MN, United States', '12/29/2016', '01/31/2017', '1', '1', 111111, 111111, 41, 0, 41, 41, '2016-12-29 16:46:27', '2016-12-29 16:46:27'),
(40, 2, 'Presale', 'aaaaaa', '42230fc92533_default.jpg', 'aaaaaa', 'Aachen, Germany', '12/29/2016', '01/31/2017', '1', '1', 11111, 11111, 41, 0, 41, 41, '2016-12-29 16:58:34', '2016-12-29 16:58:34'),
(41, 2, 'Presale', 'saqqqqqq', '065cc48f8a95_Desert.jpg', 'sdfsdfsdfdsfsd', 'Chandigarh, India', '12/29/2016', '01/30/2017', '1', '1', 25800, 25800, 41, 0, 41, 41, '2016-12-29 22:20:19', '2016-12-29 22:20:19'),
(42, 12, 'Presale', 'ghjhgj', 'cb6fc29a2516_Tulips.jpg', 'gjghjhgjghj', 'Charlotte, NC, United States', '12/29/2016', '01/30/2017', '2', '8', 15800, 15800, 35, 0, 12, 12, '2016-12-29 22:42:47', '2016-12-29 22:42:47'),
(43, 15, 'Presale', 'Raviiiiiiissss', '1719cde55118_Tulips.jpg', 'Raviiiii', 'Chandigarh, India', '12/29/2016', '01/31/2017', '3', '8', 15800, 15800, 35, 0, 12, 12, '2016-12-29 22:51:19', '2016-12-29 22:53:36');

-- --------------------------------------------------------

--
-- Table structure for table `projectstories`
--

CREATE TABLE `projectstories` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `project_video` varchar(255) DEFAULT NULL,
  `project_description` varchar(255) DEFAULT NULL,
  `project_risk` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `projectstories`
--

INSERT INTO `projectstories` (`id`, `project_id`, `project_video`, `project_description`, `project_risk`, `status`, `created_at`, `updated_at`) VALUES
(5, 20, '1c88d5cacf7c_sample.mp4', 'xyz', 'zyzz', 'active', '2016-12-21 13:07:44', '2016-12-29 22:39:48'),
(6, 21, 'c11c200828f4_sample.mp4', 'asdasdsa', 'asdasdasdsad', 'active', '2016-12-21 15:05:47', '2016-12-22 16:31:04'),
(7, 22, '2c2c046c72b7_sample.mp4', 'dfgdfgdfgfdgdfgfd', 'dfgfdgdfgfdgfdgdfg', 'active', '2016-12-27 14:45:33', '2016-12-27 14:45:33'),
(8, 23, 'ca612f292d23_sample.mp4', 'fdgdfgdfgdfg', 'dfgdfgdfgdfg', 'active', '2016-12-27 15:09:27', '2016-12-27 15:09:27'),
(9, 24, '3618e88f8ec0_Sample Vid.mp4', 'test', 'test', 'active', '2016-12-27 16:50:47', '2016-12-27 16:50:47'),
(10, 25, 'daca081704f9_small.mp4', 'ulaa laaa', 'no risk', 'active', '2016-12-27 19:47:42', '2016-12-27 19:47:42'),
(11, 26, '92c0df5a8ff2_Sample Vid.mp4', 'gfhgfh', 'fghgfh', 'active', '2016-12-27 19:51:09', '2016-12-27 19:51:09'),
(12, 27, 'c482535e7b73_sampleVideo1.mp4', 'business descr', 'business risk ', 'active', '2016-12-27 19:57:23', '2016-12-27 19:57:23'),
(13, 28, 'ed91681604a3_small.mp4', 'equity descr', 'equity risk', 'active', '2016-12-27 20:01:04', '2016-12-27 20:01:04'),
(14, 29, '1c88d5cacf7c_sample.mp4', '', '', 'active', '2016-12-28 17:15:03', '2016-12-28 17:15:03'),
(15, 30, 'b4cfff1c8e73_sample.mp4', 'dfgfdgdfgdfg', 'dfgdfgdfgdfgdfg', 'active', '2016-12-28 17:42:18', '2016-12-28 17:42:18'),
(16, 31, '9ffff9ca45cc_sample.mp4', 'asd', 'asd', 'active', '2016-12-28 17:56:03', '2016-12-28 17:56:03'),
(17, 32, '81e348a07eb0_SampleVideo_640x360_5mb.mp4', 'TEST TEST TEST TEST TEST TEST TEST TEST ', 'TEST TEST TEST TEST TEST', 'active', '2016-12-29 13:23:02', '2016-12-29 13:23:02'),
(18, 33, 'd06ba162417e_SampleVideo_640x360_5mb.mp4', 'TEST TEST TEST TEST TEST TEST TEST TEST ', 'TEST TEST TEST TEST TEST', 'active', '2016-12-29 13:23:10', '2016-12-29 13:23:10'),
(19, 34, '1f6db9fafeac_SampleVideo_640x360_5mb.mp4', 'TEST TEST TEST TEST TEST TEST TEST TEST ', 'TEST TEST TEST TEST TEST', 'active', '2016-12-29 13:23:11', '2016-12-29 13:23:11'),
(20, 35, '021ef52c5f36_SampleVideo_640x360_5mb.mp4', 'TEST TEST TEST TEST TEST TEST TEST TEST ', 'TEST TEST TEST TEST TEST', 'active', '2016-12-29 13:23:11', '2016-12-29 13:23:11'),
(21, 36, 'f7c8fa2ee98a_SampleVideo_640x360_5mb.mp4', 'TEST TEST TEST TEST TEST TEST TEST TEST ', 'TEST TEST TEST TEST TEST', 'active', '2016-12-29 13:23:12', '2016-12-29 13:23:12'),
(22, 37, '1806ba4e7f23_baby.mp4', 'TEST TEST TEST TEST TEST TESTCTEST T   CTESCTES', 'TEST TEST TEST TEST TEST TESTCTEST T   CTESCTES', 'active', '2016-12-29 13:31:13', '2016-12-29 13:31:13'),
(23, 38, 'b400586e5b71_SampleVideo_720x480_1mb.mp4', 'TEST TEST TEST TEST TETS TEST ', 'TEST TEST TEST TEST TETS TEST ', 'active', '2016-12-29 13:35:03', '2016-12-29 13:35:03'),
(24, 39, '1559be6b0cf7_sample.mp4', 'sdfsdfsdfs', 'sdfsdfsdfsdfsdfsdfsdfs', 'active', '2016-12-29 16:46:27', '2016-12-29 16:46:27'),
(25, 42, '0cb629de1c85_Sample Vid.mp4', 'sdfsdf', 'sdfsdfsfsdf', 'active', '2016-12-29 22:42:47', '2016-12-29 22:42:47');

-- --------------------------------------------------------

--
-- Table structure for table `project_accounts`
--

CREATE TABLE `project_accounts` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `payment_type` varchar(255) DEFAULT NULL,
  `bankemail` varchar(255) DEFAULT NULL,
  `bankname` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `bank_ifsc_code` varchar(255) DEFAULT NULL,
  `account_type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project_accounts`
--

INSERT INTO `project_accounts` (`id`, `project_id`, `fullname`, `payment_type`, `bankemail`, `bankname`, `account_number`, `bank_ifsc_code`, `account_type`, `status`, `created_at`, `updated_at`) VALUES
(6, 20, '', 'paypal', 'test23test@gmail.com', '', '', '', '', 'active', '2016-12-21 13:07:44', '2016-12-28 17:35:54'),
(7, 21, '', 'paypal', 'sammpaypal@gmail.com', '', '', '', '', 'active', '2016-12-21 15:05:47', '2016-12-22 16:31:05'),
(8, 22, 'sambhav', 'bank', 'sam@gmail.com', 'sam123', '7887878787878', '125478', 'current_account', 'active', '2016-12-27 14:45:33', '2016-12-27 14:45:33'),
(9, 23, '', 'paypal', 'sam@gmail.com', '', '', '', '', 'active', '2016-12-27 15:09:27', '2016-12-27 15:09:27'),
(10, 24, 'test', 'bank', 'test@gmail.com', 'testgmail.com', '4654646464', 'sadasd4654', 'current_account', 'active', '2016-12-27 16:50:48', '2016-12-27 16:50:48'),
(11, 25, 'jitu anna', 'bank', 'jitu@gmail.com', 'HDFC', '654654644646', 'HDFC0001', 'saving_account', 'active', '2016-12-27 19:47:42', '2016-12-27 19:47:42'),
(12, 26, 'test', 'bank', 'test@gmail.com', 'test bank', '123456545646', 'test123', 'current_account', 'active', '2016-12-27 19:51:09', '2016-12-27 19:51:09'),
(13, 27, 'business', 'bank', 'business@gmail.com', 'business', '6546545648745', 'dsfsdf123', 'saving_account', 'active', '2016-12-27 19:57:23', '2016-12-27 19:57:23'),
(14, 28, 'equity', 'bank', 'equity@gmail.com', 'kotak mahindra', '56456879', 'kotak123', 'saving_account', 'active', '2016-12-27 20:01:04', '2016-12-27 20:01:04'),
(15, 30, '', 'paypal', 'samthakur123sam@gmail.com', '', '', '', '', 'active', '2016-12-28 17:42:18', '2016-12-28 17:42:18'),
(16, 31, '', '', '', '', '', '', '', 'active', '2016-12-28 17:56:03', '2016-12-28 17:56:03'),
(17, 32, '', 'paypal', 'TEZT@TEST.COM', '', '', '', '', 'active', '2016-12-29 13:23:02', '2016-12-29 13:23:02'),
(18, 33, '', 'paypal', 'TEZT@TEST.COM', '', '', '', '', 'active', '2016-12-29 13:23:10', '2016-12-29 13:23:10'),
(19, 34, '', 'paypal', 'TEZT@TEST.COM', '', '', '', '', 'active', '2016-12-29 13:23:11', '2016-12-29 13:23:11'),
(20, 35, '', 'paypal', 'TEZT@TEST.COM', '', '', '', '', 'active', '2016-12-29 13:23:12', '2016-12-29 13:23:12'),
(21, 36, '', 'paypal', 'TEZT@TEST.COM', '', '', '', '', 'active', '2016-12-29 13:23:12', '2016-12-29 13:23:12'),
(22, 37, '', 'paypal', 'TEST@TEST.COM', '', '', '', '', 'active', '2016-12-29 13:31:13', '2016-12-29 13:31:13'),
(23, 38, '', 'paypal', 'tes@r.com', '', '', '', '', 'active', '2016-12-29 13:35:03', '2016-12-29 13:35:03'),
(24, 40, '', '', '', '', '', '', '', 'active', '2016-12-29 16:58:34', '2016-12-29 16:58:34'),
(25, 41, '', '', '', '', '', '', '', 'active', '2016-12-29 22:20:19', '2016-12-29 22:20:19'),
(26, 43, 'ravi', 'bank', 'ravi123@gmail.com', 'sbop', '147147147', '123456', 'current_account', 'active', '2016-12-29 22:51:19', '2016-12-29 22:53:36');

-- --------------------------------------------------------

--
-- Table structure for table `project_rewards`
--

CREATE TABLE `project_rewards` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `reward_tile` varchar(255) DEFAULT NULL,
  `reward_amount` int(11) DEFAULT NULL,
  `reward_description` varchar(255) DEFAULT NULL,
  `reward_shipping_details` varchar(255) DEFAULT NULL,
  `reward_estimated_delivery` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project_rewards`
--

INSERT INTO `project_rewards` (`id`, `project_id`, `reward_tile`, `reward_amount`, `reward_description`, `reward_shipping_details`, `reward_estimated_delivery`, `status`, `created_at`, `updated_at`) VALUES
(13, 20, 'reward1', 100, 'ship3', '222222', '', 'active', '2016-12-21 13:07:44', '2016-12-28 17:35:54'),
(14, 20, 'reward2', 200, 'ship4', '11111', '', 'active', '2016-12-21 13:07:44', '2016-12-28 17:35:54'),
(15, 21, 'Reward 2', 15800, 'Reward 2', 'Reward 2sasadasdasdsad', '12/27/2016', 'active', '2016-12-21 15:05:47', '2016-12-21 15:05:47'),
(16, 22, 'dfgdfgfdg', 15800, 'dfgdfgdfg', 'dfgdfgdfgdfgfdgfdg', '12/28/2016', 'active', '2016-12-27 14:45:33', '2016-12-27 14:45:33'),
(17, 23, 'dfgfdgdfgdf', 15800, 'dfgdfgdfgdfg', 'dgdfgdfgfdgdfgdf', '12/27/2016', 'active', '2016-12-27 15:09:27', '2016-12-27 15:09:27'),
(18, 24, 'test', 1000, 'test', 'test', '12/28/2016', 'active', '2016-12-27 16:50:47', '2016-12-27 16:50:47'),
(19, 25, 'presale reward', 200, 'presale sdhgfjd', 'presale home', '12/29/2016', 'active', '2016-12-27 19:47:42', '2016-12-27 19:47:42'),
(20, 26, 'asdas', 250, 'dfgdf', 'dfgdfgfdg', '01/02/2017', 'active', '2016-12-27 19:51:09', '2016-12-27 19:51:09'),
(21, 27, 'business title', 350, 'business descr', 'business home', '01/20/2017', 'active', '2016-12-27 19:57:23', '2016-12-27 19:57:23'),
(22, 28, 'equity reward', 600, 'sdfsdf', 'equity home', '01/30/2017', 'active', '2016-12-27 20:01:04', '2016-12-27 20:01:04'),
(23, 30, 'dfgdfg', 12, 'dfgdfg', 'dfgfdg', '', 'active', '2016-12-28 17:42:18', '2016-12-28 17:42:18'),
(24, 30, 'dgdfg', 786, 'dfgdfgfdgfdg', 'dfgdfgfdgdfgdfg', '', 'active', '2016-12-28 17:42:18', '2016-12-28 17:42:18'),
(25, 31, 'reward1', 18500, 'asd', 'asd', '', 'active', '2016-12-28 17:56:03', '2016-12-28 17:56:03'),
(26, 31, 'reward2', 90000, 'asd', 'asd', '', 'active', '2016-12-28 17:56:03', '2016-12-28 17:56:03'),
(27, 32, 'QA ENGINEERING DEFTSOFT', 100, 'TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST', 'TES TEST TEST TEST TESTY \r\n#123 HOUSE TEST TEST TEST\r\nHJAB', '', 'active', '2016-12-29 13:23:02', '2016-12-29 13:23:02'),
(28, 33, 'QA ENGINEERING DEFTSOFT', 100, 'TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST', 'TES TEST TEST TEST TESTY \r\n#123 HOUSE TEST TEST TEST\r\nHJAB', '', 'active', '2016-12-29 13:23:10', '2016-12-29 13:23:10'),
(29, 34, 'QA ENGINEERING DEFTSOFT', 100, 'TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST', 'TES TEST TEST TEST TESTY \r\n#123 HOUSE TEST TEST TEST\r\nHJAB', '', 'active', '2016-12-29 13:23:11', '2016-12-29 13:23:11'),
(30, 35, 'QA ENGINEERING DEFTSOFT', 100, 'TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST', 'TES TEST TEST TEST TESTY \r\n#123 HOUSE TEST TEST TEST\r\nHJAB', '', 'active', '2016-12-29 13:23:12', '2016-12-29 13:23:12'),
(31, 36, 'QA ENGINEERING DEFTSOFT', 100, 'TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST TEST', 'TES TEST TEST TEST TESTY \r\n#123 HOUSE TEST TEST TEST\r\nHJAB', '', 'active', '2016-12-29 13:23:12', '2016-12-29 13:23:12'),
(32, 37, 'QA QA QA QA ', 10, 'TEST TEST TEST TEST TEST TESTCTEST T   CTESCTES', 'TEST TEST TEST TEST TEST TESTCTEST T   CTESCTES', '', 'active', '2016-12-29 13:31:13', '2016-12-29 13:31:13'),
(33, 38, 'TEST', 120, 'TEST', 'TEST', '', 'active', '2016-12-29 13:35:03', '2016-12-29 13:35:03'),
(34, 40, 'aaaa', 147, 'aaaaa', 'aaaaaaa', '', 'active', '2016-12-29 16:58:34', '2016-12-29 16:58:34'),
(35, 41, 'sdfsdf', 25, 'ddsfdsfsdf', 'sdfsdfsdfsdf', '', 'active', '2016-12-29 22:20:19', '2016-12-29 22:20:19'),
(36, 43, 'raviisssssssssss', 1580022, 'ravi', 'ravi', '', 'active', '2016-12-29 22:51:19', '2016-12-29 22:53:36');

-- --------------------------------------------------------

--
-- Table structure for table `project_stories`
--

CREATE TABLE `project_stories` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `project_video` varchar(255) DEFAULT NULL,
  `project_description` varchar(255) DEFAULT NULL,
  `project_risk` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project_stories`
--

INSERT INTO `project_stories` (`id`, `project_id`, `project_video`, `project_description`, `project_risk`, `status`, `created_at`, `updated_at`) VALUES
(5, 20, '1c88d5cacf7c_sample.mp4', 'xyz', 'zyzz', 'active', '2016-12-21 13:07:44', '2016-12-28 17:35:54'),
(6, 21, 'c11c200828f4_sample.mp4', 'asdasdsa', 'asdasdasdsad', 'active', '2016-12-21 15:05:47', '2016-12-22 16:31:04'),
(7, 22, '2c2c046c72b7_sample.mp4', 'dfgdfgdfgfdgdfgfd', 'dfgfdgdfgfdgfdgdfg', 'active', '2016-12-27 14:45:33', '2016-12-27 14:45:33'),
(8, 23, 'ca612f292d23_sample.mp4', 'fdgdfgdfgdfg', 'dfgdfgdfgdfg', 'active', '2016-12-27 15:09:27', '2016-12-27 15:09:27'),
(9, 24, '3618e88f8ec0_Sample Vid.mp4', 'test', 'test', 'active', '2016-12-27 16:50:47', '2016-12-27 16:50:47'),
(10, 25, 'daca081704f9_small.mp4', 'ulaa laaa', 'no risk', 'active', '2016-12-27 19:47:42', '2016-12-27 19:47:42'),
(11, 26, '92c0df5a8ff2_Sample Vid.mp4', 'gfhgfh', 'fghgfh', 'active', '2016-12-27 19:51:09', '2016-12-27 19:51:09'),
(12, 27, 'c482535e7b73_sampleVideo1.mp4', 'business descr', 'business risk ', 'active', '2016-12-27 19:57:23', '2016-12-27 19:57:23'),
(13, 28, 'ed91681604a3_small.mp4', 'equity descr', 'equity risk', 'active', '2016-12-27 20:01:04', '2016-12-27 20:01:04'),
(14, 29, '1c88d5cacf7c_sample.mp4', '', '', 'active', '2016-12-28 17:15:03', '2016-12-28 17:15:03'),
(15, 30, 'b4cfff1c8e73_sample.mp4', 'dfgfdgdfgdfg', 'dfgdfgdfgdfgdfg', 'active', '2016-12-28 17:42:18', '2016-12-28 17:42:18'),
(16, 31, '9ffff9ca45cc_sample.mp4', 'asd', 'asd', 'active', '2016-12-28 17:56:03', '2016-12-28 17:56:03'),
(17, 32, '81e348a07eb0_SampleVideo_640x360_5mb.mp4', 'TEST TEST TEST TEST TEST TEST TEST TEST ', 'TEST TEST TEST TEST TEST', 'active', '2016-12-29 13:23:02', '2016-12-29 13:23:02'),
(18, 33, 'd06ba162417e_SampleVideo_640x360_5mb.mp4', 'TEST TEST TEST TEST TEST TEST TEST TEST ', 'TEST TEST TEST TEST TEST', 'active', '2016-12-29 13:23:10', '2016-12-29 13:23:10'),
(19, 34, '1f6db9fafeac_SampleVideo_640x360_5mb.mp4', 'TEST TEST TEST TEST TEST TEST TEST TEST ', 'TEST TEST TEST TEST TEST', 'active', '2016-12-29 13:23:11', '2016-12-29 13:23:11'),
(20, 35, '021ef52c5f36_SampleVideo_640x360_5mb.mp4', 'TEST TEST TEST TEST TEST TEST TEST TEST ', 'TEST TEST TEST TEST TEST', 'active', '2016-12-29 13:23:11', '2016-12-29 13:23:11'),
(21, 36, 'f7c8fa2ee98a_SampleVideo_640x360_5mb.mp4', 'TEST TEST TEST TEST TEST TEST TEST TEST ', 'TEST TEST TEST TEST TEST', 'active', '2016-12-29 13:23:12', '2016-12-29 13:23:12'),
(22, 37, '1806ba4e7f23_baby.mp4', 'TEST TEST TEST TEST TEST TESTCTEST T   CTESCTES', 'TEST TEST TEST TEST TEST TESTCTEST T   CTESCTES', 'active', '2016-12-29 13:31:13', '2016-12-29 13:31:13'),
(23, 38, 'b400586e5b71_SampleVideo_720x480_1mb.mp4', 'TEST TEST TEST TEST TETS TEST ', 'TEST TEST TEST TEST TETS TEST ', 'active', '2016-12-29 13:35:03', '2016-12-29 13:35:03'),
(24, 40, 'ce6bdc4c21d6_sample.mp4', 'sadsad', 'asdasdd', 'active', '2016-12-29 16:58:34', '2016-12-29 16:58:34'),
(25, 41, 'c57445c41797_Sample Vid.mp4', 'sdfsdfsdfds', 'fsdfsdfsfsdfsdf', 'active', '2016-12-29 22:20:19', '2016-12-29 22:20:19'),
(26, 43, '027ed4745331_sampleVideo1.mp4', 'ravisssssss', 'ravi', 'active', '2016-12-29 22:51:19', '2016-12-29 22:53:36');

-- --------------------------------------------------------

--
-- Table structure for table `project_users`
--

CREATE TABLE `project_users` (
  `id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `project_creator_image` varchar(255) DEFAULT NULL,
  `creator_image_status` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `structure` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `nationality` int(11) DEFAULT NULL,
  `phonenumber` bigint(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project_users`
--

INSERT INTO `project_users` (`id`, `project_id`, `project_creator_image`, `creator_image_status`, `firstname`, `lastname`, `structure`, `address`, `country`, `nationality`, `phonenumber`, `status`, `created_at`, `updated_at`) VALUES
(5, 20, 'bcf612b590d3_default.jpg', 'new', ' Michaels', ' Admin', 'sam', 'Gurdapur', 77, 77, 94654705499, 'active', '2016-12-21 13:07:44', '2016-12-28 17:35:54'),
(6, 21, 'bc261557d56a_right_single.png', 'new', ' Michael ', ' Admin ', 'asdasdas', ' #5689, chandigarh ', 24, 24, 9988459673, 'active', '2016-12-21 15:05:47', '2016-12-22 16:31:04'),
(7, 22, '2d4754a7d262_user.png', 'old', ' Michael ', ' Admin ', 'dfgdfgdgdfg', ' #5689, chandigarh ', 1, 1, 9988459673, 'active', '2016-12-27 14:45:33', '2016-12-27 14:45:33'),
(8, 23, '2d4754a7d262_user.png', 'old', ' Michael ', ' Admin ', 'dfgfgdfgfdg', ' #5689, chandigarh ', 1, 1, 9988459673, 'active', '2016-12-27 15:09:27', '2016-12-27 15:09:27'),
(9, 24, '2d4754a7d262_user.png', 'old', ' Michael ', ' Admin ', 'test', ' #5689, chandigarh ', 1, 1, 9988459673, 'active', '2016-12-27 16:50:47', '2016-12-27 16:50:47'),
(10, 25, '2d4754a7d262_user.png', 'old', ' Michael ', ' Admin ', 'test comp', ' #5689, chandigarh ', 1, 1, 9988459673, 'active', '2016-12-27 19:47:42', '2016-12-27 19:47:42'),
(11, 26, '2d4754a7d262_user.png', 'old', ' Michael ', ' Admin ', 'solid comp', ' #5689, chandigarh ', 1, 1, 9988459673, 'active', '2016-12-27 19:51:09', '2016-12-27 19:51:09'),
(12, 27, '2d4754a7d262_user.png', 'old', ' Michael ', ' Admin ', 'deft comp', ' #5689, chandigarh ', 1, 1, 9988459673, 'active', '2016-12-27 19:57:23', '2016-12-27 19:57:23'),
(13, 28, '2d4754a7d262_user.png', 'old', ' Michael ', ' Admin ', 'equity comp', ' #5689, chandigarh ', 1, 1, 9988459673, 'active', '2016-12-27 20:01:04', '2016-12-27 20:01:04'),
(14, 29, '2d4754a7d262_user.png', 'old', ' Michael ', ' Admin ', '', ' #5689, chandigarh ', 1, 1, 9988459673, 'active', '2016-12-28 17:15:03', '2016-12-28 17:15:03'),
(15, 30, '7589a80b5de6_5.Helper.jpg', 'new', ' Michael ', ' Admin ', 'dfgdfgdfgdf', ' #5689, chandigarh ', 1, 1, 9988459673, 'active', '2016-12-28 17:42:18', '2016-12-28 17:42:18'),
(16, 31, '', 'old', 'deftsoft', 'company', 'sd', 'asd', 1, 1, 9465470549, 'active', '2016-12-28 17:56:03', '2016-12-28 17:56:03'),
(17, 32, 'e9f04a95f82d_dubai_uae_buildings_skyscrapers_night_96720_1920x1080.jpg', 'new', 'TEST', 'QA ', 'TEST STRUCTURE', ' #5689, chandigarh ', 1, 1, 9988459673, 'active', '2016-12-29 13:23:02', '2016-12-29 13:23:02'),
(18, 33, '725f805b6b5f_dubai_uae_buildings_skyscrapers_night_96720_1920x1080.jpg', 'new', 'TEST', 'QA ', 'TEST STRUCTURE', ' #5689, chandigarh ', 1, 1, 9988459673, 'active', '2016-12-29 13:23:10', '2016-12-29 13:23:10'),
(19, 34, 'e7ca9179b17b_dubai_uae_buildings_skyscrapers_night_96720_1920x1080.jpg', 'new', 'TEST', 'QA ', 'TEST STRUCTURE', ' #5689, chandigarh ', 1, 1, 9988459673, 'active', '2016-12-29 13:23:11', '2016-12-29 13:23:11'),
(20, 35, 'd4b895ec8e6e_dubai_uae_buildings_skyscrapers_night_96720_1920x1080.jpg', 'new', 'TEST', 'QA ', 'TEST STRUCTURE', ' #5689, chandigarh ', 1, 1, 9988459673, 'active', '2016-12-29 13:23:11', '2016-12-29 13:23:11'),
(21, 36, 'c18d20422804_dubai_uae_buildings_skyscrapers_night_96720_1920x1080.jpg', 'new', 'TEST', 'QA ', 'TEST STRUCTURE', ' #5689, chandigarh ', 1, 1, 9988459673, 'active', '2016-12-29 13:23:12', '2016-12-29 13:23:12'),
(22, 37, 'ab4b9a4d3845_4.jpg', 'new', 'TEST', 'QA DEFTSOFR', 'DEFTSOFT HUB', ' #5689, chandigarh ', 1, 1, 9988459673, 'active', '2016-12-29 13:31:13', '2016-12-29 13:31:13'),
(23, 38, '686361be9317_1.jpg', 'new', ' Michael ', ' Admin ', 'tert', ' #5689, chandigarh ', 1, 1, 9988459673, 'active', '2016-12-29 13:35:03', '2016-12-29 13:35:03'),
(24, 40, 'default.jpg', 'old', 'deftsoft', 'company', 'asasdsad', 'asdasdasd', 1, 1, 9465470549, 'active', '2016-12-29 16:58:34', '2016-12-29 16:58:34'),
(25, 41, '7510a3e602a1_Koala.jpg', 'new', 'deftsoft', 'company', 'sdfsdf', 'sdfsdfsdf', 1, 1, 9465470549, 'active', '2016-12-29 22:20:19', '2016-12-29 22:20:19'),
(26, 43, '3e32936e9daf_Penguins.jpg', 'new', 'ravi', 'ravis', 'ravis', 'ravis', 1, 1, 9988459673, 'active', '2016-12-29 22:51:19', '2016-12-29 22:53:36');

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20161208140145'),
('20161209075652'),
('20161209103225'),
('20161209115300'),
('20161209122147'),
('20161209122710'),
('20161213111724'),
('20161213112107'),
('20161213120707'),
('20161213120734'),
('20161213120751'),
('20161214101450'),
('20161214101852'),
('20161215071502'),
('20161215073654'),
('20161215110505'),
('20161216130953'),
('20161217092915'),
('20161217111249'),
('20161217114025'),
('20161217120203'),
('20161219080304'),
('20161219102248'),
('20161219103949'),
('20161219110222'),
('20161221071146'),
('20161222070446'),
('20161222115525'),
('20161226141538'),
('20161229105533'),
('20161229110126'),
('20161229110456'),
('20161229110716');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` text,
  `last_name` text,
  `user_name` text,
  `email` text,
  `password` text,
  `address` text,
  `country` int(11) DEFAULT NULL,
  `state` text,
  `city` text,
  `register_ip` text,
  `last_login_ip` text,
  `login_type` text,
  `facebook_id` text,
  `google_id` text,
  `linkedin_id` text,
  `twitter_id` text,
  `user_role` text,
  `user_status` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_image` varchar(255) DEFAULT NULL,
  `phone_number` text,
  `facebook_link` varchar(255) DEFAULT NULL,
  `twitter_link` varchar(255) DEFAULT NULL,
  `linkedin_link` varchar(255) DEFAULT NULL,
  `registercode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `user_name`, `email`, `password`, `address`, `country`, `state`, `city`, `register_ip`, `last_login_ip`, `login_type`, `facebook_id`, `google_id`, `linkedin_id`, `twitter_id`, `user_role`, `user_status`, `created_at`, `updated_at`, `user_image`, `phone_number`, `facebook_link`, `twitter_link`, `linkedin_link`, `registercode`) VALUES
(12, 'Michael', 'admin', 'admin_admin', 'admin@gmail.com', 'ecd00aa1acd325ba7575cb0f638b04a5', '#5689, chandigarh', 1, 'Punjab', NULL, '192.168.0.44', NULL, NULL, 'facebook/sdsd', NULL, 'linkedin/kjadh', 'twitter/sdfsfsq', 'admin', 'active', '2016-12-13 12:23:11', '2016-12-13 12:23:11', '2d4754a7d262_user.png', '9988459673', 'ffffff', 'tttttt', 'lllllllllllll', NULL),
(35, 'Deftsoft', '', 'deft123', 'gautamg64@gmail.com', 'dd6f35416f1e935b2a95136a8ff39630', 'sdfdsf', 23, 'sdfsdf', NULL, '192.168.0.41', NULL, NULL, NULL, NULL, NULL, NULL, '', 'inactive', '2016-12-26 10:20:19', '2016-12-26 10:20:19', 'default.jpg', '9465470549', '', '', '', '6c0267e8d90715d524caeb6be3026282'),
(39, 'Jitender', 'Anand', 'jitenderanand', 'jitender@gmail.com', '25f9e794323b453885f5181f1b624d0b', 'kullu', 77, 'Himachal Pradesh', NULL, '192.168.0.44', NULL, NULL, NULL, NULL, NULL, NULL, '', 'active', '2016-12-27 15:26:30', '2016-12-27 15:26:30', 'd7a7ae2f6d55_Chrysanthemum.jpg', '9817778478', '', '', '', NULL),
(40, 'test', '', 'test test', 'test@gmail.com', '098f6bcd4621d373cade4e832627b4f6', 'test', 1, 'pb', NULL, '192.168.0.44', NULL, NULL, NULL, NULL, NULL, NULL, '', 'active', '2016-12-27 15:30:23', '2016-12-27 15:30:23', '216d4c845dc2_Koala.jpg', '12345698756', '', '', '', NULL),
(41, 'deftsoft', 'company', 'deft123', 'sam@gmail.com', 'b3076ff5f5295d1ad3783c68da1b0f19', NULL, NULL, NULL, NULL, '192.168.0.41', '192.168.0.44', NULL, NULL, NULL, NULL, NULL, 'user', 'active', '2016-12-27 11:34:36', '2016-12-27 11:34:36', NULL, NULL, NULL, NULL, NULL, 'da0f366ae5ef4765380a52b8ca5b79ed'),
(42, 'asdas', '', 'asdasd', 'sam123@g.com', '96e79218965eb72c92a549dd5a330112', 'deft1231111', 1, 'csdfsfds', NULL, '192.168.0.41', NULL, NULL, NULL, NULL, NULL, NULL, '', 'active', '2016-12-28 12:58:35', '2016-12-28 12:58:35', 'f1870904c2df_images.png', '94654705494444444444444', '', '', '', NULL),
(43, 'sambhavvvvvvaew', '', 'dev123', 'dev@gmail.com', '017e0c498e2978a3ce9e58598bc116a6', 'up', 77, 'Punjab', NULL, '192.168.0.44', NULL, NULL, NULL, NULL, NULL, NULL, '', 'active', '2016-12-28 16:11:40', '2016-12-28 16:11:40', '16410753a8ab_Koala.jpg', '9465470549', 'fgdfg', 'dfgdf', 'gdfgdfg', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ar_internal_metadata`
--
ALTER TABLE `ar_internal_metadata`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `badges`
--
ALTER TABLE `badges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projectaboutyous`
--
ALTER TABLE `projectaboutyous`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projectaccounts`
--
ALTER TABLE `projectaccounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projectrewards`
--
ALTER TABLE `projectrewards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projectstories`
--
ALTER TABLE `projectstories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_accounts`
--
ALTER TABLE `project_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_rewards`
--
ALTER TABLE `project_rewards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_stories`
--
ALTER TABLE `project_stories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_users`
--
ALTER TABLE `project_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schema_migrations`
--
ALTER TABLE `schema_migrations`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `badges`
--
ALTER TABLE `badges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;
--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `projectaboutyous`
--
ALTER TABLE `projectaboutyous`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `projectaccounts`
--
ALTER TABLE `projectaccounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `projectrewards`
--
ALTER TABLE `projectrewards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `projectstories`
--
ALTER TABLE `projectstories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `project_accounts`
--
ALTER TABLE `project_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `project_rewards`
--
ALTER TABLE `project_rewards`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `project_stories`
--
ALTER TABLE `project_stories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `project_users`
--
ALTER TABLE `project_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
