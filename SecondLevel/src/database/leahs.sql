-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 11, 2018 at 05:26 PM
-- Server version: 5.7.19
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
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

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `acc_id` int(12) NOT NULL AUTO_INCREMENT,
  `username` varchar(15) NOT NULL,
  `first_name` varchar(20) NOT NULL,
  `last_name` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contact_no` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'Disabled',
  `branch` varchar(50) DEFAULT NULL,
  `acctype` varchar(45) DEFAULT NULL,
  `security_key` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`acc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`acc_id`, `username`, `first_name`, `last_name`, `password`, `email`, `contact_no`, `status`, `branch`, `acctype`, `security_key`) VALUES
(1, 'res', 'Resilyn', 'Amos', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'res@email.com', '753153', 'Enabled', 'Baguio', 'Bookkeeper', ''),
(2, 'mark', 'Mark', 'Abad', '3b4f122b181aeef98042c4219b554f4d76934f125c0c183494e9fa909f5f249e0ccfbd626da5851e904d5b8f66e29dbe819d2ba4fd2439f53462caaed4eeee90', 'markk@gmail.coa', '123123213', 'Enabled', 'Baguio', 'Admin', '10291'),
(6, 'rai', 'Michael', 'Angelo', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'rai@gmail.com', '09172899011', 'Disabled', 'Pangasinan', 'Manager', NULL),
(7, 'alex', 'Alex', 'Rull', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'ahlex@yahoo.com', '09128281234', 'Disabled', 'Baguio', 'Secretary', NULL),
(8, 'rajja', 'Rajja', 'Mecca', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'rajja@google.com', '09128222133', 'Disabled', 'Pangasinan', 'Secretary', NULL),
(9, 'robijn', 'Robijn', 'Tabisula', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'rob@popup.com', '09012121214', 'Enabled', 'Pangasinan', 'Admin', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bad_order`
--

DROP TABLE IF EXISTS `bad_order`;
CREATE TABLE IF NOT EXISTS `bad_order` (
  `bo_id` int(15) NOT NULL AUTO_INCREMENT,
  `bo_dateReleased` varchar(50) NOT NULL,
  `bo_issue_account` varchar(200) NOT NULL,
  `bo_client` int(20) DEFAULT NULL,
  `bo_remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`bo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bad_order`
--

INSERT INTO `bad_order` (`bo_id`, `bo_dateReleased`, `bo_issue_account`, `bo_client`, `bo_remarks`) VALUES
(1, 'January 12, 2018, 12:05 am', 'mark', 20, '');

-- --------------------------------------------------------

--
-- Table structure for table `bo_list`
--

DROP TABLE IF EXISTS `bo_list`;
CREATE TABLE IF NOT EXISTS `bo_list` (
  `bo_id` int(15) NOT NULL,
  `bo_price` int(15) NOT NULL,
  `bo_qty` int(15) NOT NULL,
  `branch` varchar(45) NOT NULL,
  `bo_product_id` int(11) NOT NULL,
  `po_remarks` varchar(200) DEFAULT NULL,
  `bo_client` int(15) NOT NULL,
  KEY `bo_id_idx` (`bo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bo_list`
--

INSERT INTO `bo_list` (`bo_id`, `bo_price`, `bo_qty`, `branch`, `bo_product_id`, `po_remarks`, `bo_client`) VALUES
(1, 10, 1, 'Baguio', 257, '', 20),
(1, 50, 2, 'Baguio', 252, '', 20);

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

DROP TABLE IF EXISTS `category_list`;
CREATE TABLE IF NOT EXISTS `category_list` (
  `category_id` int(15) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `category_status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`category_id`, `category_name`, `category_status`) VALUES
(13, 'Specialty', 'Enabled'),
(14, 'Sweets', 'Enabled'),
(15, 'JamAndJellies', 'Enabled'),
(16, 'Condiments', 'Enabled'),
(17, 'Baking', 'Disabled'),
(18, 'Beverages', 'Disabled'),
(19, 'Crocks', 'Enabled');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
CREATE TABLE IF NOT EXISTS `clients` (
  `c_id` int(15) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(20) NOT NULL,
  `c_address` varchar(20) NOT NULL,
  `c_location` varchar(50) DEFAULT NULL,
  `c_contactperson` varchar(45) DEFAULT NULL,
  `c_contactpersonnumber` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`c_id`, `c_name`, `c_address`, `c_location`, `c_contactperson`, `c_contactpersonnumber`) VALUES
(18, 'Harison TS', 'Harrison Rd', 'Baguio', NULL, NULL),
(19, 'SM pangasinan', 'Sison', 'Pangasinan', NULL, NULL),
(20, 'Tsiongsan LT', 'La Trinindad', 'Baguio', NULL, NULL),
(21, 'Tsiongsan Pangasinan', 'Pangasinan Area', 'Pangasinan', NULL, NULL),
(26, 'Save Less', 'Marcos Highway', 'Baguio', NULL, NULL),
(27, 'Sari Sari', 'Kanto', 'Pangasinan', NULL, NULL),
(30, 'James and Juliet', 'Bakakeng', 'Baguio', NULL, NULL),
(31, 'Sa Bahay', 'Rosario', 'Pangasinan', NULL, NULL),
(32, 'Tiongsan Mabini', 'Mabini Highway', 'Baguio', NULL, NULL),
(35, 'Victoria', 'Gen Luna Rd', 'Baguio', NULL, NULL),
(36, 'Uno', 'Magsaysay', 'Baguio', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
CREATE TABLE IF NOT EXISTS `inventory` (
  `iS_inventoryid` int(15) NOT NULL AUTO_INCREMENT,
  `iS_product_id` int(15) NOT NULL,
  `iS_restock_lvl` int(10) NOT NULL,
  `iS_quantity` int(10) NOT NULL DEFAULT '0',
  `iS_location` varchar(45) NOT NULL,
  PRIMARY KEY (`iS_inventoryid`),
  KEY `product_id_idx` (`iS_product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`iS_inventoryid`, `iS_product_id`, `iS_restock_lvl`, `iS_quantity`, `iS_location`) VALUES
(18, 241, 20, 86, 'Baguio'),
(19, 241, 30, 55, 'Pangasinan'),
(20, 242, 30, 54, 'Baguio'),
(21, 242, 30, 105, 'Pangasinan'),
(22, 243, 30, 49, 'Baguio'),
(23, 243, 30, 75, 'Pangasinan'),
(24, 244, 30, -5, 'Baguio'),
(25, 244, 30, 37, 'Pangasinan'),
(26, 245, 30, 90, 'Baguio'),
(27, 245, 30, 54, 'Pangasinan'),
(28, 246, 30, 40, 'Baguio'),
(29, 246, 30, 78, 'Pangasinan'),
(30, 247, 30, 50, 'Baguio'),
(31, 247, 30, 54, 'Pangasinan'),
(34, 249, 30, 50, 'Baguio'),
(35, 249, 30, 40, 'Pangasinan'),
(36, 250, 30, 50, 'Baguio'),
(37, 250, 30, 105, 'Pangasinan'),
(38, 251, 30, 64, 'Baguio'),
(39, 251, 30, 73, 'Pangasinan'),
(40, 252, 30, 68, 'Baguio'),
(41, 252, 30, 70, 'Pangasinan'),
(42, 253, 30, 90, 'Baguio'),
(43, 253, 30, 86, 'Pangasinan'),
(44, 254, 30, 43, 'Baguio'),
(45, 254, 30, 48, 'Pangasinan'),
(46, 255, 30, 90, 'Baguio'),
(47, 255, 30, 30, 'Pangasinan'),
(48, 256, 30, 85, 'Baguio'),
(49, 256, 30, 86, 'Pangasinan'),
(50, 257, 30, 48, 'Baguio'),
(51, 257, 30, 80, 'Pangasinan'),
(52, 258, 30, 50, 'Baguio'),
(53, 258, 30, 57, 'Pangasinan'),
(54, 259, 30, 40, 'Baguio'),
(55, 259, 30, 64, 'Pangasinan'),
(56, 260, 30, 50, 'Baguio'),
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
(77, 270, 50, 70, 'Pangasinan');

-- --------------------------------------------------------

--
-- Table structure for table `issuance`
--

DROP TABLE IF EXISTS `issuance`;
CREATE TABLE IF NOT EXISTS `issuance` (
  `issue_id` int(15) NOT NULL AUTO_INCREMENT,
  `issue_date_time` varchar(50) NOT NULL,
  `issue_account` varchar(50) DEFAULT NULL,
  `issue_type` varchar(45) NOT NULL,
  `remarks` varchar(45) DEFAULT NULL,
  `other_clients` varchar(45) DEFAULT NULL,
  `penthouse_clients` varchar(45) DEFAULT NULL,
  `client_id` int(15) DEFAULT NULL,
  `merch_id` int(15) DEFAULT NULL,
  PRIMARY KEY (`issue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `issuance`
--

INSERT INTO `issuance` (`issue_id`, `issue_date_time`, `issue_account`, `issue_type`, `remarks`, `other_clients`, `penthouse_clients`, `client_id`, `merch_id`) VALUES
(1, 'January 11, 2018, 10:08 pm', 'mark', '1', 'sample issuance', NULL, NULL, 20, NULL),
(2, 'January 11, 2018, 10:13 pm', 'mark', '1', 'issuance to pangasinan', NULL, NULL, 27, NULL),
(3, 'January 11, 2018, 10:14 pm', 'mark', '1', 'sample 2 issuance ', NULL, NULL, 20, NULL),
(4, 'January 12, 2018, 12:39 am', 'mark', '1', '', NULL, NULL, 20, 3),
(5, 'January 12, 2018, 12:42 am', 'mark', '1', '', NULL, NULL, 20, 3),
(6, 'January 12, 2018, 12:43 am', 'mark', '1', '', NULL, NULL, 20, 3),
(7, 'January 12, 2018, 1:02 am', 'mark', '4', '', NULL, NULL, NULL, NULL),
(8, 'January 12, 2018, 1:04 am', 'mark', '2', '', NULL, '2', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `issuance_list`
--

DROP TABLE IF EXISTS `issuance_list`;
CREATE TABLE IF NOT EXISTS `issuance_list` (
  `issue_id` int(15) NOT NULL,
  `prod_qty` int(15) NOT NULL,
  `prod_price` int(15) NOT NULL,
  `branch` varchar(20) NOT NULL,
  `prod_id` int(15) NOT NULL,
  `prod_remarks` varchar(200) DEFAULT NULL,
  `client_id` int(15) DEFAULT NULL,
  KEY `FK_issuancelist_productlist_idx` (`prod_id`),
  KEY `issue_id_idx` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `issuance_list`
--

INSERT INTO `issuance_list` (`issue_id`, `prod_qty`, `prod_price`, `branch`, `prod_id`, `prod_remarks`, `client_id`) VALUES
(1, 10, 10, 'Baguio', 250, '', 20),
(2, 15, 30, 'Pangasinan', 260, '', 27),
(2, 7, 82, 'Pangasinan', 255, '', 27),
(2, 5, 39, 'Pangasinan', 243, '', 27),
(3, 2, 10, 'Baguio', 257, '', 20),
(3, 12, 50, 'Baguio', 252, '', 20),
(6, 20, 20, 'Baguio', 244, '', 20),
(7, 3, 22, 'Baguio', 258, '', NULL),
(8, 20, 100, 'Pangasinan', 270, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
  `logs_id` int(15) NOT NULL AUTO_INCREMENT,
  `issue_acnt` varchar(20) NOT NULL,
  `act_type` varchar(30) NOT NULL,
  `date_time` varchar(30) NOT NULL,
  `related_id` int(15) DEFAULT NULL,
  `remarks` varchar(65) NOT NULL,
  PRIMARY KEY (`logs_id`),
  KEY `acc_id_idx` (`issue_acnt`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=latin1;

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
(159, 'mark', 'Login', 'January 12, 2018, 1:22 am', NULL, 'has successfully login');

-- --------------------------------------------------------

--
-- Table structure for table `merchandiser`
--

DROP TABLE IF EXISTS `merchandiser`;
CREATE TABLE IF NOT EXISTS `merchandiser` (
  `m_id` int(15) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(25) NOT NULL,
  `m_contact_number` varchar(25) NOT NULL,
  `m_address` varchar(50) NOT NULL,
  `m_branch` varchar(10) NOT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `merchandiser`
--

INSERT INTO `merchandiser` (`m_id`, `m_name`, `m_contact_number`, `m_address`, `m_branch`) VALUES
(1, 'Mark', '99818212', 'Bonifacio', 'Baguio'),
(2, 'Res', '102912121', 'Manila', 'Pangasinan'),
(3, 'Vic Sotto', '912121234', 'Kalinga', 'Pangasinan'),
(4, 'Ross', '91212', 'Malacanang', 'Baguio'),
(5, 'Mark', '912120910', 'Bakakeng', 'Baguio');

-- --------------------------------------------------------

--
-- Table structure for table `po_list`
--

DROP TABLE IF EXISTS `po_list`;
CREATE TABLE IF NOT EXISTS `po_list` (
  `po_id` int(15) NOT NULL,
  `po_price` int(15) NOT NULL,
  `po_qty` int(15) NOT NULL,
  `branch` varchar(45) NOT NULL,
  `po_product_id` int(15) NOT NULL,
  `po_remarks` varchar(200) DEFAULT NULL,
  `po_client` int(15) NOT NULL,
  KEY `po_id_idx` (`po_id`)
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
(3, 82, 5, 'Pangasinan', 255, '', 27);

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

DROP TABLE IF EXISTS `product_list`;
CREATE TABLE IF NOT EXISTS `product_list` (
  `productList_id` int(15) NOT NULL AUTO_INCREMENT,
  `productList_name` varchar(50) DEFAULT NULL,
  `value` int(50) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `category_id` int(15) NOT NULL,
  `barcode` int(255) DEFAULT NULL,
  PRIMARY KEY (`productList_id`),
  KEY `FK_product_list_category_idx` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`productList_id`, `productList_name`, `value`, `unit`, `category_id`, `barcode`) VALUES
(241, 'Beef', NULL, '1kg', 13, 1254511),
(242, 'Chicken', NULL, '500g', 13, 654681),
(243, 'De Recado', NULL, '1pcs', 13, 2161213),
(244, 'Hamonado', NULL, '100g', 13, 1584651),
(245, 'Vigan Longganisa', NULL, '1pck', 13, 546125),
(246, 'Puto Seco', NULL, '1pck', 14, 4586920),
(247, 'Long Rice', NULL, '500g', 14, 5484984),
(249, 'Pop Rice Square', NULL, '250g', 14, 2548796),
(250, 'Pop Rice Roun', NULL, '100g', 14, 1545487),
(251, 'Peanut Butter (small)', NULL, '100g', 15, 454654),
(252, 'Strawberry  Jelly', NULL, '300g', 15, 784141),
(253, 'Strawberry Buo', NULL, '200g', 15, 2546821),
(254, 'Honey', NULL, '500g', 15, 5487878),
(255, 'Peanut Butter (Tall)', NULL, '500g', 15, 2154545),
(256, 'Paminta', NULL, '1pck', 16, 5555444),
(257, 'Laurel', NULL, '1pck', 16, 6358885),
(258, 'Garlic Fried', NULL, '200g', 16, 5454543),
(259, 'Curry Powder', NULL, '100g', 16, 4577888),
(260, 'Star Anis', NULL, '1pck', 16, 698882),
(261, 'Colored Sprinkle', NULL, '1pck', 17, 1548755),
(262, 'Choco Lentils', NULL, '1pck', 17, 235681),
(263, 'Caster Sugar', NULL, '1kg', 17, 3255451),
(264, 'Icing Sugar', NULL, '250g', 17, 121145),
(265, 'Baking Soy', NULL, '1pck', 13, 1112458),
(266, 'Kapusan', NULL, '1pcs', 13, 365989),
(267, 'Meringue', NULL, '500g', 19, 659822),
(268, 'Cracklings', NULL, '200g', 19, 32323211),
(269, 'Soy', NULL, '100g', 13, 124578),
(270, 'Embotido', 500, 'gm(s)', 13, 9182912);

-- --------------------------------------------------------

--
-- Table structure for table `product_loc`
--

DROP TABLE IF EXISTS `product_loc`;
CREATE TABLE IF NOT EXISTS `product_loc` (
  `product_id` int(15) NOT NULL,
  `location` varchar(50) NOT NULL,
  `status` varchar(45) NOT NULL,
  `altprice` varchar(45) DEFAULT NULL,
  KEY `prod_id_idx` (`product_id`)
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
(270, 'Pangasinan', 'Enabled', '110');

-- --------------------------------------------------------

--
-- Table structure for table `pull_out`
--

DROP TABLE IF EXISTS `pull_out`;
CREATE TABLE IF NOT EXISTS `pull_out` (
  `po_id` int(10) NOT NULL AUTO_INCREMENT,
  `po_date` varchar(50) NOT NULL,
  `po_issue_account` varchar(200) NOT NULL,
  `po_client` int(20) DEFAULT NULL,
  `po_remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`po_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pull_out`
--

INSERT INTO `pull_out` (`po_id`, `po_date`, `po_issue_account`, `po_client`, `po_remarks`) VALUES
(1, 'January 12, 2018, 12:03 am', 'mark', 27, ''),
(2, 'January 12, 2018, 12:25 am', 'mark', 20, ''),
(3, 'January 12, 2018, 12:27 am', 'mark', 27, '');

-- --------------------------------------------------------

--
-- Table structure for table `purchased_order`
--

DROP TABLE IF EXISTS `purchased_order`;
CREATE TABLE IF NOT EXISTS `purchased_order` (
  `order_id` int(50) NOT NULL AUTO_INCREMENT,
  `order_date` varchar(50) NOT NULL,
  `client_id` int(15) NOT NULL,
  `merchandiser_id` int(15) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchased_order`
--

INSERT INTO `purchased_order` (`order_id`, `order_date`, `client_id`, `merchandiser_id`) VALUES
(11, 'January 11, 2018, 10:24 am', 20, 3),
(12, 'January 11, 2018, 4:38 pm', 27, 4),
(16, 'January 11, 2018, 4:52 pm', 19, 1),
(17, 'January 11, 2018, 6:22 pm', 20, 3),
(18, 'January 12, 2018, 12:35 am', 35, 4);

-- --------------------------------------------------------

--
-- Table structure for table `purchased_order_list`
--

DROP TABLE IF EXISTS `purchased_order_list`;
CREATE TABLE IF NOT EXISTS `purchased_order_list` (
  `p_order_id` int(50) NOT NULL,
  `order_qty` int(10) NOT NULL,
  `branch` varchar(10) NOT NULL,
  `prdct_id` int(15) NOT NULL,
  `order_remarks` varchar(100) NOT NULL,
  `client_id` int(15) NOT NULL,
  `merchandiser_id` int(15) NOT NULL,
  KEY `order_id_idx` (`p_order_id`),
  KEY `product_id_idx` (`prdct_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchased_order_list`
--

INSERT INTO `purchased_order_list` (`p_order_id`, `order_qty`, `branch`, `prdct_id`, `order_remarks`, `client_id`, `merchandiser_id`) VALUES
(11, 50, 'Baguio', 244, 'another', 20, 3),
(12, 25, 'Pangasinan', 244, '', 27, 4),
(12, 5, 'Pangasinan', 250, '', 27, 4),
(16, 9, 'Pangasinan', 242, '', 19, 1),
(17, 20, 'Baguio', 245, '', 20, 3),
(18, 78, 'Baguio', 245, '', 35, 4),
(18, 90, 'Baguio', 254, '', 35, 4);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;