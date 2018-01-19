-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2018 at 03:25 PM
-- Server version: 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `leahs`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `acc_id` int(12) NOT NULL,
  `username` varchar(15) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contact_no` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'Disabled',
  `branch` varchar(50) DEFAULT NULL,
  `acctype` varchar(45) DEFAULT NULL,
  `security_key` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`acc_id`, `username`, `first_name`, `last_name`, `password`, `email`, `contact_no`, `status`, `branch`, `acctype`, `security_key`) VALUES
(1, 'res', 'Resilyn', 'Amos', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'res@email.com', '753153', 'Enabled', 'Baguio', 'Bookkeeper', ''),
(2, 'mark', 'Mark', 'Abad', '3b4f122b181aeef98042c4219b554f4d76934f125c0c183494e9fa909f5f249e0ccfbd626da5851e904d5b8f66e29dbe819d2ba4fd2439f53462caaed4eeee90', 'markk@gmail.coa', '123123213', 'Enabled', 'Baguio', 'Admin', '15612'),
(6, 'rai', 'Michael', 'Angelo', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'rai@gmail.com', '09172899011', 'Enabled', 'Baguio', 'Manager', '15786'),
(7, 'alex', 'Alex', 'Rull', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'ahlex@yahoo.com', '09128281234', 'Enabled', 'Pangasinan', 'Secretary', NULL),
(8, 'rajja', 'Rajja', 'Mecca', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'rajja@google.com', '09128222133', 'Enabled', 'Pangasinan', 'Manager', '55487'),
(9, 'robijn', 'Robijn', 'Tabisula', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'rob@popup.com', '09012121214', 'Enabled', 'Pangasinan', 'Admin', '63598');

-- --------------------------------------------------------

--
-- Table structure for table `bad_order`
--

CREATE TABLE `bad_order` (
  `bo_id` int(15) NOT NULL,
  `bo_dateReleased` varchar(50) NOT NULL,
  `bo_issue_account` varchar(200) NOT NULL,
  `bo_client` int(20) DEFAULT NULL,
  `bo_remarks` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bad_order`
--

INSERT INTO `bad_order` (`bo_id`, `bo_dateReleased`, `bo_issue_account`, `bo_client`, `bo_remarks`) VALUES
(1, 'January 12, 2018, 12:05 am', 'mark', 20, ''),
(2, 'January 12, 2018, 10:42 am', 'mark', 20, ''),
(3, 'January 19, 2018, 12:54 am', 'mark', 20, '');

-- --------------------------------------------------------

--
-- Table structure for table `bo_list`
--

CREATE TABLE `bo_list` (
  `bo_id` int(15) NOT NULL,
  `bo_price` int(15) NOT NULL,
  `bo_qty` int(15) NOT NULL,
  `branch` varchar(45) NOT NULL,
  `bo_product_id` int(11) NOT NULL,
  `po_remarks` varchar(200) DEFAULT NULL,
  `bo_client` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bo_list`
--

INSERT INTO `bo_list` (`bo_id`, `bo_price`, `bo_qty`, `branch`, `bo_product_id`, `po_remarks`, `bo_client`) VALUES
(1, 10, 1, 'Baguio', 257, '', 20),
(1, 50, 2, 'Baguio', 252, '', 20),
(2, 10, 10, 'Baguio', 250, '', 20),
(3, 10, 20, 'Baguio', 250, '', 20);

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `category_id` int(15) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `category_status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`category_id`, `category_name`, `category_status`) VALUES
(13, 'Specialty', 'Enabled'),
(14, 'Sweets', 'Enabled'),
(15, 'JamAndJellies', 'Enabled'),
(16, 'Condiments', 'Enabled'),
(17, 'Baking', 'Enabled'),
(18, 'Beverages', 'Enabled'),
(19, 'Crocks', 'Enabled');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `c_id` int(15) NOT NULL,
  `c_name` varchar(20) NOT NULL,
  `c_address` varchar(20) NOT NULL,
  `c_location` varchar(50) DEFAULT NULL,
  `c_contactperson` varchar(50) DEFAULT NULL,
  `c_contactpersonnumber` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`c_id`, `c_name`, `c_address`, `c_location`, `c_contactperson`, `c_contactpersonnumber`) VALUES
(18, 'Harison TS', 'Harrison Rd', 'Baguio', 'Ramon Tiko', '09587463210'),
(19, 'SM pangasinan', 'Sison', 'Pangasinan', 'Juan Carlos', '09154623658'),
(20, 'Tsiongsan Trinidad', 'La Trinindad', 'Baguio', 'Moira Chan', '444-23568'),
(21, 'Tsiongsan Pangasinan', 'Pangasinan Area', 'Pangasinan', 'Lany Mis', '444-11215'),
(26, 'Save Less', 'Marcos Highway', 'Baguio', 'Sonny Veg', '032154787'),
(27, 'Sari Sari', 'Kanto', 'Pangasinan', 'Aly Mang', '09526333333'),
(30, 'San Marino', 'Bakakeng', 'Baguio', 'Mardhie Lamin', '444-56454'),
(31, 'Mang Mengs', 'Rosario', 'Pangasinan', 'Mac Dee', '03168716'),
(32, 'Tiongsan Mabini', 'Mabini Highway', 'Baguio', 'Jess Mark', '09123654763'),
(35, 'Victoria', 'Gen Luna Rd', 'Baguio', 'Jeff Besy', '444-45645'),
(36, 'Uno', 'Magsaysay', 'Baguio', 'Many Pag', '444-32323');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `iS_inventoryid` int(15) NOT NULL,
  `iS_product_id` int(15) NOT NULL,
  `iS_restock_lvl` int(10) NOT NULL,
  `iS_quantity` int(10) NOT NULL DEFAULT '0',
  `iS_location` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`iS_inventoryid`, `iS_product_id`, `iS_restock_lvl`, `iS_quantity`, `iS_location`) VALUES
(18, 241, 20, 60, 'Baguio'),
(19, 241, 30, 81, 'Pangasinan'),
(20, 242, 30, 54, 'Baguio'),
(21, 242, 30, 96, 'Pangasinan'),
(22, 243, 30, 44, 'Baguio'),
(23, 243, 30, 39, 'Pangasinan'),
(24, 244, 30, 4, 'Baguio'),
(25, 244, 30, 7, 'Pangasinan'),
(26, 245, 30, 12, 'Baguio'),
(27, 245, 30, 54, 'Pangasinan'),
(28, 246, 30, 38, 'Baguio'),
(29, 246, 30, 78, 'Pangasinan'),
(30, 247, 30, 50, 'Baguio'),
(31, 247, 30, 54, 'Pangasinan'),
(34, 249, 30, 50, 'Baguio'),
(35, 249, 30, 40, 'Pangasinan'),
(36, 250, 30, 70, 'Baguio'),
(37, 250, 30, 89, 'Pangasinan'),
(38, 251, 30, 64, 'Baguio'),
(39, 251, 30, 73, 'Pangasinan'),
(40, 252, 30, 65, 'Baguio'),
(41, 252, 30, 70, 'Pangasinan'),
(42, 253, 30, 85, 'Baguio'),
(43, 253, 30, 86, 'Pangasinan'),
(44, 254, 30, 10, 'Baguio'),
(45, 254, 30, 48, 'Pangasinan'),
(46, 255, 30, 90, 'Baguio'),
(47, 255, 30, 30, 'Pangasinan'),
(48, 256, 30, 85, 'Baguio'),
(49, 256, 30, 86, 'Pangasinan'),
(50, 257, 30, 45, 'Baguio'),
(51, 257, 30, 79, 'Pangasinan'),
(52, 258, 30, 50, 'Baguio'),
(53, 258, 30, 37, 'Pangasinan'),
(54, 259, 30, 30, 'Baguio'),
(55, 259, 30, 54, 'Pangasinan'),
(56, 260, 30, 40, 'Baguio'),
(57, 260, 30, 73, 'Pangasinan'),
(58, 261, 30, 75, 'Baguio'),
(59, 261, 30, 85, 'Pangasinan'),
(60, 262, 30, 64, 'Baguio'),
(61, 262, 30, 31, 'Pangasinan'),
(62, 263, 30, 62, 'Baguio'),
(63, 263, 30, 82, 'Pangasinan'),
(64, 264, 30, 57, 'Baguio'),
(65, 264, 30, 75, 'Pangasinan'),
(66, 265, 31, 54, 'Baguio'),
(67, 265, 30, 58, 'Pangasinan'),
(68, 266, 20, 19, 'Baguio'),
(69, 266, 20, 16, 'Pangasinan'),
(72, 268, 20, 29, 'Baguio'),
(73, 268, 20, 15, 'Pangasinan'),
(74, 269, 15, 10, 'Baguio'),
(75, 269, 15, 16, 'Pangasinan'),
(76, 270, 50, 100, 'Baguio'),
(77, 270, 50, 70, 'Pangasinan'),
(78, 271, 10, 0, 'Baguio'),
(79, 271, 10, 0, 'Pangasinan'),
(80, 272, 15, 0, 'Baguio'),
(81, 272, 15, 0, 'Pangasinan'),
(82, 273, 10, 0, 'Baguio'),
(83, 273, 10, 0, 'Pangasinan'),
(86, 275, 30, 0, 'Baguio'),
(87, 275, 30, 0, 'Pangasinan'),
(88, 276, 20, 0, 'Baguio'),
(89, 276, 20, 0, 'Pangasinan');

-- --------------------------------------------------------

--
-- Table structure for table `issuance`
--

CREATE TABLE `issuance` (
  `issue_id` int(15) NOT NULL,
  `issue_date_time` varchar(50) NOT NULL,
  `issue_account` varchar(50) DEFAULT NULL,
  `issue_type` varchar(45) NOT NULL,
  `remarks` varchar(45) DEFAULT NULL,
  `other_clients` varchar(45) DEFAULT NULL,
  `penthouse_clients` varchar(45) DEFAULT NULL,
  `client_id` int(15) DEFAULT NULL,
  `merch_id` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `issuance`
--

INSERT INTO `issuance` (`issue_id`, `issue_date_time`, `issue_account`, `issue_type`, `remarks`, `other_clients`, `penthouse_clients`, `client_id`, `merch_id`) VALUES
(1, 'January 11, 2018, 10:08 pm', 'mark', '1', 'sample issuance', NULL, NULL, 20, NULL),
(2, 'January 11, 2018, 10:13 pm', 'mark', '1', 'issuance to pangasinan', NULL, NULL, 27, NULL),
(3, 'January 11, 2018, 10:14 pm', 'mark', '1', 'sample 2 issuance ', NULL, NULL, 20, NULL),
(6, 'January 12, 2018, 12:43 am', 'mark', '1', '', NULL, NULL, 20, 3),
(7, 'January 12, 2018, 1:02 am', 'mark', '4', '', NULL, NULL, NULL, NULL),
(8, 'January 12, 2018, 1:04 am', 'mark', '2', '', NULL, '2', NULL, NULL),
(9, 'January 12, 2018, 1:27 am', 'mark', '1', '', NULL, NULL, 27, 4),
(10, 'January 12, 2018, 1:29 am', 'mark', '1', '', NULL, NULL, 20, 3),
(11, 'January 12, 2018, 10:52 am', 'mark', '1', '', NULL, NULL, 20, 3),
(12, 'January 12, 2018, 10:54 am', 'mark', '1', '', NULL, NULL, 19, 1),
(13, 'January 12, 2018, 10:55 am', 'mark', '1', '', NULL, NULL, 19, 5),
(14, 'January 12, 2018, 10:56 am', 'mark', '1', '', NULL, NULL, 19, 5),
(15, 'January 12, 2018, 11:09 am', 'res', '1', '', NULL, NULL, 20, 3),
(16, 'January 14, 2018, 9:05 pm', 'mark', '1', '', NULL, NULL, 27, 4),
(17, 'January 14, 2018, 9:07 pm', 'mark', '1', '', NULL, NULL, 27, 4),
(18, 'January 14, 2018, 9:08 pm', 'mark', '1', '', NULL, NULL, 20, 3),
(19, 'January 14, 2018, 9:09 pm', 'mark', '1', '', NULL, NULL, 35, 4),
(20, 'January 14, 2018, 9:10 pm', 'mark', '1', '', NULL, NULL, 35, 4),
(21, 'January 14, 2018, 9:13 pm', 'mark', '1', '', NULL, NULL, 35, 4),
(22, 'January 16, 2018, 2:13 pm', 'mark', '1', '', NULL, NULL, 20, 5),
(23, 'January 16, 2018, 2:19 pm', 'res', '4', 'st to pang', NULL, NULL, NULL, NULL),
(24, 'January 17, 2018, 9:27 pm', 'res', '1', '', NULL, NULL, 20, 3),
(25, 'January 17, 2018, 9:29 pm', 'res', '1', '', NULL, NULL, 35, 4),
(26, 'January 17, 2018, 9:37 pm', 'mark', '1', '', NULL, NULL, 20, 3),
(27, 'January 17, 2018, 9:43 pm', 'mark', '1', '', NULL, NULL, 18, NULL),
(29, 'January 19, 2018, 12:35 am', 'mark', '1', '', NULL, NULL, 20, 3),
(30, 'January 19, 2018, 1:09 am', 'mark', '3', 'try', 'Jammu', NULL, NULL, NULL),
(31, 'January 19, 2018, 1:10 am', 'mark', '3', 'try', 'jam', NULL, NULL, NULL),
(32, 'January 19, 2018, 1:12 am', 'mark', '3', 'try others issue', 'Jam', NULL, NULL, NULL),
(33, 'January 19, 2018, 1:13 am', 'mark', '3', '', 'Kim', NULL, NULL, NULL),
(34, 'January 19, 2018, 1:14 am', 'mark', '3', '', 'Lim', NULL, NULL, NULL),
(36, 'January 19, 2018, 1:20 am', 'mark', '2', 'try penth', NULL, '9', NULL, NULL),
(37, 'January 19, 2018, 1:21 am', 'mark', '3', 'try io', 'Kamie', NULL, NULL, NULL),
(38, 'January 19, 2018, 1:28 am', 'rajja', '3', 'asd', 'na', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `issuance_list`
--

CREATE TABLE `issuance_list` (
  `issue_id` int(15) NOT NULL,
  `prod_qty` int(15) NOT NULL,
  `prod_price` int(15) NOT NULL,
  `branch` varchar(20) NOT NULL,
  `prod_id` int(15) NOT NULL,
  `prod_remarks` varchar(200) DEFAULT NULL,
  `client_id` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `issuance_list`
--

INSERT INTO `issuance_list` (`issue_id`, `prod_qty`, `prod_price`, `branch`, `prod_id`, `prod_remarks`, `client_id`) VALUES
(1, -40, 10, 'Baguio', 250, '', 20),
(2, 15, 30, 'Pangasinan', 260, '', 27),
(2, 7, 82, 'Pangasinan', 255, '', 27),
(2, 5, 39, 'Pangasinan', 243, '', 27),
(3, 2, 10, 'Baguio', 257, '', 20),
(3, 2, 50, 'Baguio', 252, '', 20),
(6, 20, 20, 'Baguio', 244, '', 20),
(7, 3, 22, 'Baguio', 258, '', NULL),
(8, 20, 100, 'Pangasinan', 270, '', NULL),
(9, 0, 20, 'Pangasinan', 244, '', 27),
(9, -3, 30, 'Pangasinan', 250, '', 27),
(10, 5, 20, 'Baguio', 245, '', 20),
(11, 20, 10, 'Baguio', 244, '', 20),
(12, 9, 20, 'Pangasinan', 242, '', 19),
(13, 12, 20, 'Pangasinan', 243, '', 19),
(14, 24, 5, 'Pangasinan', 243, '', 19),
(15, 51, 20, 'Baguio', 244, '', 20),
(16, 10, 25, 'Pangasinan', 244, '', 27),
(16, 5, 36, 'Pangasinan', 250, '', 27),
(17, 15, 45, 'Pangasinan', 244, '', 27),
(17, 10, 45, 'Pangasinan', 250, '', 27),
(19, 20, 20, 'Baguio', 254, '', 35),
(20, 10, 10, 'Baguio', 254, '', 35),
(21, 10, 25, 'Baguio', 245, '', 35),
(22, 5, 15, 'Baguio', 243, '', 20),
(23, 26, 40, 'Baguio', 241, '', NULL),
(24, 10, 40, 'Baguio', 245, '', 20),
(25, 18, 40, 'Baguio', 245, '', 35),
(27, 3, 80, 'Baguio', 254, '', 18),
(29, 10, 40, 'Baguio', 245, '', 20),
(32, 10, 28, 'Baguio', 260, '', NULL),
(33, 10, 20, 'Pangasinan', 259, '', NULL),
(34, 5, 88, 'Baguio', 253, '', NULL),
(36, 3, 48, 'Baguio', 252, '', NULL),
(37, 2, 5, 'Baguio', 246, '', NULL),
(38, 1, 10, 'Pangasinan', 257, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `logs_id` int(15) NOT NULL,
  `issue_acnt` varchar(20) NOT NULL,
  `act_type` varchar(30) NOT NULL,
  `date_time` varchar(30) NOT NULL,
  `related_id` int(15) DEFAULT NULL,
  `remarks` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`logs_id`, `issue_acnt`, `act_type`, `date_time`, `related_id`, `remarks`) VALUES
(146, 'mark', 'Added Issuance', 'January 11, 2018, 10:08 pm', NULL, 'has successfully issued a product'),
(147, 'mark', 'Added Issuance', 'January 11, 2018, 10:13 pm', NULL, 'has successfully issued a product'),
(148, 'mark', 'Added Issuance', 'January 11, 2018, 10:13 pm', NULL, 'has successfully issued a product'),
(149, 'mark', 'Added Issuance', 'January 11, 2018, 10:13 pm', NULL, 'has successfully issued a product'),
(150, 'mark', 'Added Issuance', 'January 11, 2018, 10:14 pm', NULL, 'has successfully issued a product'),
(151, 'mark', 'Added Issuance', 'January 11, 2018, 10:14 pm', NULL, 'has successfully issued a product'),
(152, 'mark', 'Added Order', 'January 12, 2018, 12:35 am', NULL, 'has successfully added a new order'),
(153, 'mark', 'Added Order', 'January 12, 2018, 12:35 am', NULL, 'has successfully added a new order'),
(154, 'mark', 'Added Product', 'January 12, 2018, 12:58 am', NULL, 'has successfully added a new product'),
(155, 'mark', 'Added Low Stock', 'January 12, 2018, 12:58 am', NULL, 'has successfully added a stock to low stock products'),
(156, 'mark', 'Added Low Stock', 'January 12, 2018, 12:58 am', NULL, 'has successfully added a stock to low stock products'),
(157, 'mark', 'Added Stock Transfer', 'January 12, 2018, 1:02 am', NULL, 'has successfully transfered product(s)'),
(158, 'mark', 'Penthouse Issuance', 'January 12, 2018, 1:04 am', NULL, 'has successfully issued products to penthouse'),
(159, 'mark', 'Issued Order', '', NULL, 'has successfully issued a new order'),
(160, 'mark', 'Issued Order', '', NULL, 'has successfully issued a new order'),
(161, 'mark', 'Issued Order', 'January 12, 2018, 1:29 am', NULL, 'has successfully issued a new order'),
(162, 'mark', 'Added Product', 'January 12, 2018, 1:37 am', NULL, 'has successfully added a new product'),
(163, 'res', 'Login', 'January 12, 2018, 2:50 am', NULL, 'has successfully login'),
(164, 'res', 'Added Low Stock', 'January 12, 2018, 2:52 am', NULL, 'has successfully added a stock to low stock products'),
(165, 'mark', 'Login', 'January 12, 2018, 2:52 am', NULL, 'has successfully login'),
(166, 'res', 'Login', 'January 12, 2018, 2:53 am', NULL, 'has successfully login'),
(167, 'res', 'Login', 'January 12, 2018, 2:59 am', NULL, 'has successfully login'),
(168, 'res', 'Login', 'January 12, 2018, 3:00 am', NULL, 'has successfully login'),
(169, 'res', 'Login', 'January 12, 2018, 3:00 am', NULL, 'has successfully login'),
(170, 'res', 'Login', 'January 12, 2018, 3:01 am', NULL, 'has successfully login'),
(171, 'res', 'Login', 'January 12, 2018, 3:05 am', NULL, 'has successfully login'),
(172, 'res', 'Login', 'January 12, 2018, 3:06 am', NULL, 'has successfully login'),
(173, 'mark', 'Login', 'January 12, 2018, 3:21 am', NULL, 'has successfully login'),
(174, 'res', 'Login', 'January 12, 2018, 3:22 am', NULL, 'has successfully login'),
(175, 'mark', 'Login', 'January 12, 2018, 3:25 am', NULL, 'has successfully login'),
(176, 'mark', 'Added Order', 'January 12, 2018, 3:25 am', NULL, 'has successfully added a new order'),
(177, 'res', 'Login', 'January 12, 2018, 3:25 am', NULL, 'has successfully login'),
(178, 'res', 'Issued Order', 'January 12, 2018, 3:26 am', NULL, 'has successfully issued a new order'),
(179, 'mark', 'Login', 'January 12, 2018, 3:36 am', NULL, 'has successfully login'),
(180, 'res', 'Login', 'January 12, 2018, 3:37 am', NULL, 'has successfully login'),
(181, 'mark', 'Login', 'January 12, 2018, 9:09 am', NULL, 'has successfully login'),
(182, 'mark', 'Issued Order', 'January 12, 2018, 10:52 am', NULL, 'has successfully issued a new order'),
(183, 'mark', 'Issued Order', 'January 12, 2018, 10:54 am', NULL, 'has successfully issued a new order'),
(184, 'mark', 'Issued Order', 'January 12, 2018, 10:55 am', NULL, 'has successfully issued a new order'),
(185, 'mark', 'Issued Order', 'January 12, 2018, 10:56 am', NULL, 'has successfully issued a new order'),
(186, 'res', 'Login', 'January 12, 2018, 10:58 am', NULL, 'has successfully login'),
(187, 'res', 'Issued Order', 'January 12, 2018, 11:09 am', NULL, 'has successfully issued a new order'),
(188, 'rai', 'Login', 'January 12, 2018, 11:16 am', NULL, 'has successfully login'),
(189, 'res', 'Login', 'January 12, 2018, 8:27 pm', NULL, 'has successfully login'),
(190, 'alex', 'Login', 'January 12, 2018, 8:28 pm', NULL, 'has successfully login'),
(191, 'rajja', 'Login', 'January 12, 2018, 8:29 pm', NULL, 'has successfully login'),
(192, 'mark', 'Login', 'January 14, 2018, 7:34 pm', NULL, 'has successfully login'),
(193, 'mark', 'Added Product', 'January 14, 2018, 8:05 pm', NULL, 'has successfully added a new product'),
(194, 'mark', 'Added Product', 'January 14, 2018, 8:13 pm', NULL, 'has successfully added a new product'),
(195, 'mark', 'Issued Order', 'January 14, 2018, 9:05 pm', NULL, 'has successfully issued a new order'),
(196, 'mark', 'Issued Order', 'January 14, 2018, 9:05 pm', NULL, 'has successfully issued a new order'),
(197, 'mark', 'Issued Order', 'January 14, 2018, 9:07 pm', NULL, 'has successfully issued a new order'),
(198, 'mark', 'Issued Order', 'January 14, 2018, 9:07 pm', NULL, 'has successfully issued a new order'),
(199, 'mark', 'Issued Order', 'January 14, 2018, 9:08 pm', NULL, 'has successfully issued a new order'),
(200, 'mark', 'Issued Order', 'January 14, 2018, 9:09 pm', NULL, 'has successfully issued a new order'),
(201, 'mark', 'Issued Order', 'January 14, 2018, 9:10 pm', NULL, 'has successfully issued a new order'),
(202, 'mark', 'Issued Order', 'January 14, 2018, 9:13 pm', NULL, 'has successfully issued a new order'),
(203, 'mark', 'Login', 'January 16, 2018, 12:52 am', NULL, 'has successfully login'),
(204, 'mark', 'Login', 'January 16, 2018, 12:53 am', NULL, 'has successfully login'),
(205, 'mark', 'Login', 'January 16, 2018, 12:53 am', NULL, 'has successfully login'),
(206, 'mark', 'Added Product', 'January 16, 2018, 1:10 am', NULL, 'has successfully added a new product'),
(207, 'res', 'Login', 'January 16, 2018, 2:05 pm', NULL, 'has successfully login'),
(208, 'rai', 'Login', 'January 16, 2018, 2:06 pm', NULL, 'has successfully login'),
(209, 'mark', 'Login', 'January 16, 2018, 2:07 pm', NULL, 'has successfully login'),
(210, 'mark', 'Login', 'January 16, 2018, 2:09 pm', NULL, 'has successfully login'),
(211, 'mark', 'Added Order', 'January 16, 2018, 2:12 pm', NULL, 'has successfully added a new order'),
(212, 'mark', 'Added Order', 'January 16, 2018, 2:12 pm', NULL, 'has successfully added a new order'),
(213, 'mark', 'Issued Order', 'January 16, 2018, 2:13 pm', NULL, 'has successfully issued a new order'),
(214, 'res', 'Login', 'January 16, 2018, 2:15 pm', NULL, 'has successfully login'),
(215, 'mark', 'Login', 'January 16, 2018, 2:15 pm', NULL, 'has successfully login'),
(216, 'res', 'Login', 'January 16, 2018, 2:15 pm', NULL, 'has successfully login'),
(217, 'mark', 'Login', 'January 16, 2018, 2:16 pm', NULL, 'has successfully login'),
(218, 'res', 'Login', 'January 16, 2018, 2:17 pm', NULL, 'has successfully login'),
(219, 'res', 'Added Stock Transfer', 'January 16, 2018, 2:19 pm', NULL, 'has successfully transfered product(s)'),
(220, 'mark', 'Login', 'January 17, 2018, 7:39 pm', NULL, 'has successfully login'),
(221, 'rai', 'Login', 'January 17, 2018, 7:40 pm', NULL, 'has successfully login'),
(222, 'rajja', 'Login', 'January 17, 2018, 7:41 pm', NULL, 'has successfully login'),
(223, 'res', 'Login', 'January 17, 2018, 7:42 pm', NULL, 'has successfully login'),
(224, 'alex', 'Login', 'January 17, 2018, 7:43 pm', NULL, 'has successfully login'),
(225, 'mark', 'Login', 'January 17, 2018, 8:43 pm', NULL, 'has successfully login'),
(226, 'res', 'Login', 'January 17, 2018, 8:44 pm', NULL, 'has successfully login'),
(227, 'rajja', 'Login', 'January 17, 2018, 8:59 pm', NULL, 'has successfully login'),
(228, 'mark', 'Login', 'January 17, 2018, 9:03 pm', NULL, 'has successfully login'),
(229, 'res', 'Login', 'January 17, 2018, 9:10 pm', NULL, 'has successfully login'),
(230, 'res', 'Issued Order', 'January 17, 2018, 9:27 pm', NULL, 'has successfully issued a new order'),
(231, 'res', 'Issued Order', 'January 17, 2018, 9:29 pm', NULL, 'has successfully issued a new order'),
(232, 'rajja', 'Login', 'January 17, 2018, 9:30 pm', NULL, 'has successfully login'),
(233, 'mark', 'Login', 'January 17, 2018, 9:31 pm', NULL, 'has successfully login'),
(234, 'mark', 'Added Order', 'January 17, 2018, 9:34 pm', NULL, 'has successfully added a new order'),
(235, 'mark', 'Added Order', 'January 17, 2018, 9:34 pm', NULL, 'has successfully added a new order'),
(236, 'mark', 'Added Order', 'January 17, 2018, 9:34 pm', NULL, 'has successfully added a new order'),
(237, 'mark', 'Added Order', 'January 17, 2018, 9:34 pm', NULL, 'has successfully added a new order'),
(238, 'mark', 'Added Order', 'January 17, 2018, 9:34 pm', NULL, 'has successfully added a new order'),
(239, 'mark', 'Issued Order', 'January 17, 2018, 9:37 pm', NULL, 'has successfully issued a new order'),
(240, 'mark', 'Added Issuance', 'January 17, 2018, 9:43 pm', NULL, 'has successfully issued a product'),
(241, 'mark', 'Added Product', 'January 17, 2018, 9:52 pm', NULL, 'has successfully added a new product'),
(242, 'res', 'Login', 'January 18, 2018, 9:23 am', NULL, 'has successfully login'),
(243, 'rajja', 'Login', 'January 18, 2018, 9:24 am', NULL, 'has successfully login'),
(244, 'mark', 'Login', 'January 18, 2018, 8:15 pm', NULL, 'has successfully login'),
(245, 'mark', 'Login', 'January 19, 2018, 12:31 am', NULL, 'has successfully login'),
(246, 'mark', 'Issued Order', 'January 19, 2018, 12:35 am', NULL, 'has successfully issued a new order'),
(247, 'mark', 'Login', 'January 19, 2018, 12:46 am', NULL, 'has successfully login'),
(248, 'mark', 'Login', 'January 19, 2018, 12:59 am', NULL, 'has successfully login'),
(249, 'mark', 'Others Issuance', 'January 19, 2018, 1:09 am', NULL, 'has successfully issued products to others'),
(250, 'mark', 'Others Issuance', 'January 19, 2018, 1:10 am', NULL, 'has successfully issued products to others'),
(251, 'mark', 'Others Issuance', 'January 19, 2018, 1:12 am', NULL, 'has successfully issued products to others'),
(252, 'mark', 'Others Issuance', 'January 19, 2018, 1:13 am', NULL, 'has successfully issued products to others'),
(253, 'mark', 'Others Issuance', 'January 19, 2018, 1:14 am', NULL, 'has successfully issued products to others'),
(254, 'mark', 'Penthouse Issuance', 'January 19, 2018, 1:15 am', NULL, 'has successfully issued products to penthouse'),
(255, 'mark', 'Penthouse Issuance', 'January 19, 2018, 1:20 am', NULL, 'has successfully issued products to penthouse'),
(256, 'mark', 'Others Issuance', 'January 19, 2018, 1:21 am', NULL, 'has successfully issued products to others'),
(257, 'rajja', 'Login', 'January 19, 2018, 1:23 am', NULL, 'has successfully login'),
(258, 'rajja', 'Others Issuance', 'January 19, 2018, 1:28 am', NULL, 'has successfully issued products to others'),
(259, 'res', 'Login', 'January 19, 2018, 1:31 am', NULL, 'has successfully login'),
(260, 'mark', 'Login', 'January 19, 2018, 7:10 pm', NULL, 'has successfully login'),
(261, 'mark', 'Added Product', 'January 19, 2018, 7:41 pm', NULL, 'has successfully added a new product'),
(262, 'mark', 'Added Issuance', 'January 19, 2018, 7:45 pm', NULL, 'has successfully issued a product'),
(263, 'rajja', 'Login', 'January 19, 2018, 8:16 pm', NULL, 'has successfully login'),
(264, 'res', 'Login', 'January 19, 2018, 8:25 pm', NULL, 'has successfully login'),
(265, 'res', 'Login', 'January 19, 2018, 8:27 pm', NULL, 'has successfully login'),
(266, 'mark', 'Login', 'January 19, 2018, 8:28 pm', NULL, 'has successfully login');

-- --------------------------------------------------------

--
-- Table structure for table `merchandiser`
--

CREATE TABLE `merchandiser` (
  `m_id` int(15) NOT NULL,
  `m_name` varchar(25) NOT NULL,
  `m_contact_number` int(25) NOT NULL,
  `m_address` varchar(50) NOT NULL,
  `m_branch` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `merchandiser`
--

INSERT INTO `merchandiser` (`m_id`, `m_name`, `m_contact_number`, `m_address`, `m_branch`) VALUES
(1, 'Mark', 99818212, 'Bonifacio', 'Baguio'),
(2, 'Res', 102912121, 'Sison', 'Pangasinan'),
(3, 'Vic', 912121234, 'Lupaw', 'Pangasinan'),
(4, 'Ross', 912121255, 'Trancoville', 'Baguio'),
(5, 'Mark', 912120910, 'Bakakeng', 'Baguio');

-- --------------------------------------------------------

--
-- Table structure for table `po_list`
--

CREATE TABLE `po_list` (
  `po_id` int(15) NOT NULL,
  `po_price` int(15) NOT NULL,
  `po_qty` int(15) NOT NULL,
  `branch` varchar(45) NOT NULL,
  `po_product_id` int(15) NOT NULL,
  `po_remarks` varchar(200) DEFAULT NULL,
  `po_client` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `po_list`
--

INSERT INTO `po_list` (`po_id`, `po_price`, `po_qty`, `branch`, `po_product_id`, `po_remarks`, `po_client`) VALUES
(1, 30, 5, 'Pangasinan', 260, '', 27),
(1, 80, 2, 'Pangasinan', 255, '', 27),
(2, 10, 2, 'Baguio', 257, '', 20),
(2, 50, 2, 'Baguio', 252, '', 20),
(3, 30, 5, 'Pangasinan', 260, '', 27),
(3, 82, 5, 'Pangasinan', 255, '', 27),
(4, 10, 10, 'Baguio', 244, '', 20),
(7, 20, 3, 'Pangasinan', 244, '', 27),
(8, 20, 3, 'Pangasinan', 244, '', 27),
(8, 30, 3, 'Pangasinan', 250, '', 27),
(9, 10, 2, 'Baguio', 257, '', 20),
(9, 50, 2, 'Baguio', 252, '', 20),
(10, 20, 5, 'Baguio', 245, '', 20),
(11, 20, 10, 'Baguio', 245, '', 20),
(12, 20, 3, 'Pangasinan', 244, '', 27),
(12, 30, 3, 'Pangasinan', 250, '', 27),
(13, 10, 10, 'Baguio', 250, '', 20),
(14, 10, 10, 'Baguio', 250, '', 20);

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `productList_id` int(15) NOT NULL,
  `productList_name` varchar(120) DEFAULT NULL,
  `category_id` int(15) NOT NULL,
  `barcode` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`productList_id`, `productList_name`, `category_id`, `barcode`) VALUES
(241, 'Beef', 13, '1254511'),
(242, 'Chicken', 13, '654681'),
(243, 'De Recado', 13, '2161213'),
(244, 'Hamonado', 13, '1584651'),
(245, 'Vigan Longganisa', 13, '546125'),
(246, 'Puto Seco', 14, '4586920'),
(247, 'Long Rice', 14, '5484984'),
(249, 'Pop Rice Square', 14, '2548796'),
(250, 'Pop Rice Roun', 14, '1545487'),
(251, 'Peanut Butter (small)', 15, '454654'),
(252, 'Strawberry  Jelly', 15, '784141'),
(253, 'Strawberry Buo', 15, '2546821'),
(254, 'Honey', 15, '5487878'),
(255, 'Peanut Butter (Tall)', 15, '2154545'),
(256, 'Paminta', 16, '5555444'),
(257, 'Laurel', 16, '6358885'),
(258, 'Garlic Fried', 16, '5454543'),
(259, 'Curry Powder', 16, '4577888'),
(260, 'Star Anis', 16, '698882'),
(261, 'Colored Sprinkle', 17, '1548755'),
(262, 'Choco Lentils', 17, '235681'),
(263, 'Caster Sugar', 17, '3255451'),
(264, 'Icing Sugar', 17, '121145'),
(265, 'Baking Soy', 13, '1112458'),
(266, 'Kapusan', 13, '365989'),
(267, 'Meringue', 19, '659822'),
(268, 'Cracklings', 19, '32323211'),
(269, 'Soy', 13, '124578'),
(270, 'Embotido', 13, '9182912'),
(271, 'Salamagi', 14, '891212'),
(272, 'Malagkit', 14, '1254548'),
(273, 'Ham', 13, ''),
(275, 'Corn', 16, ''),
(276, 'Chichacorn 1 pck', 19, '124558');

-- --------------------------------------------------------

--
-- Table structure for table `product_loc`
--

CREATE TABLE `product_loc` (
  `product_id` int(15) NOT NULL,
  `location` varchar(50) NOT NULL,
  `status` varchar(45) NOT NULL,
  `altprice` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_loc`
--

INSERT INTO `product_loc` (`product_id`, `location`, `status`, `altprice`) VALUES
(241, 'Baguio', 'Enabled', '38'),
(241, 'Pangasinan', 'Enabled', '40'),
(242, 'Baguio', 'Enabled', '38'),
(242, 'Pangasinan', 'Enabled', '40'),
(243, 'Baguio', 'Enabled', '38'),
(243, 'Pangasinan', 'Enabled', '40'),
(244, 'Baguio', 'Enabled', '40'),
(244, 'Pangasinan', 'Enabled', '42'),
(245, 'Baguio', 'Enabled', '40'),
(245, 'Pangasinan', 'Enabled', '42'),
(246, 'Baguio', 'Enabled', '4.5'),
(246, 'Pangasinan', 'Enabled', '5'),
(247, 'Baguio', 'Enabled', '9'),
(247, 'Pangasinan', 'Enabled', '10'),
(249, 'Baguio', 'Enabled', '9'),
(249, 'Pangasinan', 'Enabled', '9'),
(250, 'Baguio', 'Enabled', '9'),
(250, 'Pangasinan', 'Enabled', '10'),
(251, 'Baguio', 'Enabled', '47'),
(251, 'Pangasinan', 'Enabled', '50'),
(252, 'Baguio', 'Enabled', '48'),
(252, 'Pangasinan', 'Enabled', '50'),
(253, 'Baguio', 'Enabled', '87'),
(253, 'Pangasinan', 'Enabled', '90'),
(254, 'Baguio', 'Enabled', '82'),
(254, 'Pangasinan', 'Enabled', '85'),
(255, 'Baguio', 'Enabled', '81'),
(255, 'Pangasinan', 'Enabled', '84'),
(256, 'Baguio', 'Disabled', '18'),
(256, 'Pangasinan', 'Disabled', '19'),
(257, 'Baguio', 'Enabled', '9.5'),
(257, 'Pangasinan', 'Enabled', '10'),
(258, 'Baguio', 'Enabled', '22'),
(258, 'Pangasinan', 'Enabled', '23'),
(259, 'Baguio', 'Enabled', '18.5'),
(259, 'Pangasinan', 'Enabled', '19'),
(260, 'Baguio', 'Enabled', '27.5'),
(260, 'Pangasinan', 'Enabled', '28'),
(261, 'Baguio', 'Enabled', '43'),
(261, 'Pangasinan', 'Enabled', '44'),
(262, 'Baguio', 'Enabled', '30'),
(262, 'Pangasinan', 'Enabled', '31'),
(263, 'Baguio', 'Enabled', '57'),
(263, 'Pangasinan', 'Enabled', '58'),
(264, 'Baguio', 'Enabled', '57'),
(264, 'Pangasinan', 'Enabled', '58'),
(265, 'Baguio', 'Enabled', '17'),
(265, 'Pangasinan', 'Disabled', '21'),
(266, 'Baguio', 'Enabled', '10'),
(266, 'Pangasinan', 'Enabled', '12'),
(268, 'Baguio', 'Enabled', '10'),
(268, 'Pangasinan', 'Enabled', '10'),
(269, 'Baguio', 'Enabled', '10'),
(269, 'Pangasinan', 'Enabled', '14'),
(270, 'Baguio', 'Enabled', '120'),
(270, 'Pangasinan', 'Enabled', '110'),
(271, 'Baguio', 'Enabled', '20'),
(271, 'Pangasinan', 'Enabled', '15'),
(272, 'Baguio', 'Enabled', '45'),
(272, 'Pangasinan', 'Enabled', '45'),
(273, 'Baguio', 'Enabled', '55'),
(273, 'Pangasinan', 'Enabled', '50'),
(275, 'Baguio', 'Enabled', '65'),
(275, 'Pangasinan', 'Enabled', '60'),
(276, 'Baguio', 'Enabled', '15'),
(276, 'Pangasinan', 'Enabled', '15');

-- --------------------------------------------------------

--
-- Table structure for table `pull_out`
--

CREATE TABLE `pull_out` (
  `po_id` int(10) NOT NULL,
  `po_date` varchar(50) NOT NULL,
  `po_issue_account` varchar(200) NOT NULL,
  `po_client` int(20) DEFAULT NULL,
  `po_remarks` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pull_out`
--

INSERT INTO `pull_out` (`po_id`, `po_date`, `po_issue_account`, `po_client`, `po_remarks`) VALUES
(1, 'January 12, 2018, 12:03 am', 'mark', 27, ''),
(2, 'January 12, 2018, 12:25 am', 'mark', 20, ''),
(3, 'January 12, 2018, 12:27 am', 'mark', 27, ''),
(4, 'January 12, 2018, 10:11 am', 'mark', 20, ''),
(5, 'January 12, 2018, 10:13 am', 'mark', 20, ''),
(6, 'January 12, 2018, 10:13 am', 'mark', 20, ''),
(7, 'January 12, 2018, 10:14 am', 'mark', 27, ''),
(8, 'January 12, 2018, 10:20 am', 'mark', 27, ''),
(9, 'January 12, 2018, 10:23 am', 'mark', 20, ''),
(10, 'January 12, 2018, 10:25 am', 'mark', 20, ''),
(11, 'January 12, 2018, 10:26 am', 'mark', 20, ''),
(12, 'January 12, 2018, 10:27 am', 'mark', 27, ''),
(13, 'January 19, 2018, 12:35 am', 'mark', 20, ''),
(14, 'January 19, 2018, 12:53 am', 'mark', 20, '');

-- --------------------------------------------------------

--
-- Table structure for table `purchased_order`
--

CREATE TABLE `purchased_order` (
  `order_id` int(50) NOT NULL,
  `order_date` varchar(50) NOT NULL,
  `client_id` int(15) NOT NULL,
  `merchandiser_id` int(15) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchased_order`
--

INSERT INTO `purchased_order` (`order_id`, `order_date`, `client_id`, `merchandiser_id`, `status`) VALUES
(17, 'January 11, 2018, 6:22 pm', 20, 3, 'Pending'),
(18, 'January 12, 2018, 12:35 am', 35, 4, 'Pending'),
(21, 'January 16, 2018, 2:12 pm', 20, 5, 'Pending'),
(22, 'January 17, 2018, 9:34 pm', 19, 2, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `purchased_order_list`
--

CREATE TABLE `purchased_order_list` (
  `p_order_id` int(50) NOT NULL,
  `order_qty` int(10) NOT NULL,
  `branch` varchar(10) NOT NULL,
  `prdct_id` int(15) NOT NULL,
  `order_remarks` varchar(100) NOT NULL,
  `client_id` int(15) NOT NULL,
  `merchandiser_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchased_order_list`
--

INSERT INTO `purchased_order_list` (`p_order_id`, `order_qty`, `branch`, `prdct_id`, `order_remarks`, `client_id`, `merchandiser_id`) VALUES
(17, 10, 'Baguio', 245, '', 20, 3),
(18, 78, 'Baguio', 245, '', 35, 4),
(18, 68, 'Baguio', 254, '', 35, 4),
(21, 10, 'Baguio', 243, '', 20, 5),
(21, 50, 'Baguio', 249, '', 20, 5),
(22, 50, 'Pangasinan', 242, 'Curry-Curry', 19, 2),
(22, 60, 'Pangasinan', 244, 'Laman', 19, 2),
(22, 20, 'Pangasinan', 253, 'Sweet', 19, 2),
(22, 16, 'Pangasinan', 259, '', 19, 2),
(22, 65, 'Pangasinan', 271, '', 19, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`acc_id`);

--
-- Indexes for table `bad_order`
--
ALTER TABLE `bad_order`
  ADD PRIMARY KEY (`bo_id`);

--
-- Indexes for table `bo_list`
--
ALTER TABLE `bo_list`
  ADD KEY `bo_id_idx` (`bo_id`);

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`iS_inventoryid`),
  ADD KEY `product_id_idx` (`iS_product_id`);

--
-- Indexes for table `issuance`
--
ALTER TABLE `issuance`
  ADD PRIMARY KEY (`issue_id`);

--
-- Indexes for table `issuance_list`
--
ALTER TABLE `issuance_list`
  ADD KEY `FK_issuancelist_productlist_idx` (`prod_id`),
  ADD KEY `issue_id_idx` (`issue_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`logs_id`),
  ADD KEY `acc_id_idx` (`issue_acnt`);

--
-- Indexes for table `merchandiser`
--
ALTER TABLE `merchandiser`
  ADD PRIMARY KEY (`m_id`);

--
-- Indexes for table `po_list`
--
ALTER TABLE `po_list`
  ADD KEY `po_id_idx` (`po_id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`productList_id`),
  ADD KEY `FK_product_list_category_idx` (`category_id`);

--
-- Indexes for table `product_loc`
--
ALTER TABLE `product_loc`
  ADD KEY `prod_id_idx` (`product_id`);

--
-- Indexes for table `pull_out`
--
ALTER TABLE `pull_out`
  ADD PRIMARY KEY (`po_id`);

--
-- Indexes for table `purchased_order`
--
ALTER TABLE `purchased_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `purchased_order_list`
--
ALTER TABLE `purchased_order_list`
  ADD KEY `order_id_idx` (`p_order_id`),
  ADD KEY `product_id_idx` (`prdct_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `acc_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `bad_order`
--
ALTER TABLE `bad_order`
  MODIFY `bo_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `category_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `c_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `iS_inventoryid` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;
--
-- AUTO_INCREMENT for table `issuance`
--
ALTER TABLE `issuance`
  MODIFY `issue_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `logs_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=267;
--
-- AUTO_INCREMENT for table `merchandiser`
--
ALTER TABLE `merchandiser`
  MODIFY `m_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `productList_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=277;
--
-- AUTO_INCREMENT for table `pull_out`
--
ALTER TABLE `pull_out`
  MODIFY `po_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `purchased_order`
--
ALTER TABLE `purchased_order`
  MODIFY `order_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bo_list`
--
ALTER TABLE `bo_list`
  ADD CONSTRAINT `bo_id` FOREIGN KEY (`bo_id`) REFERENCES `bad_order` (`bo_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `iS_product_id` FOREIGN KEY (`iS_product_id`) REFERENCES `product_list` (`productList_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `issuance_list`
--
ALTER TABLE `issuance_list`
  ADD CONSTRAINT `issue_id` FOREIGN KEY (`issue_id`) REFERENCES `issuance` (`issue_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prod_id` FOREIGN KEY (`prod_id`) REFERENCES `product_list` (`productList_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `po_list`
--
ALTER TABLE `po_list`
  ADD CONSTRAINT `po_id` FOREIGN KEY (`po_id`) REFERENCES `pull_out` (`po_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`category_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `product_loc`
--
ALTER TABLE `product_loc`
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `product_list` (`productList_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchased_order_list`
--
ALTER TABLE `purchased_order_list`
  ADD CONSTRAINT `p_order_id` FOREIGN KEY (`p_order_id`) REFERENCES `purchased_order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prdct_id` FOREIGN KEY (`prdct_id`) REFERENCES `product_list` (`productList_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
