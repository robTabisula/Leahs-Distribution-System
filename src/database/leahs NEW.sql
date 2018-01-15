-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 15, 2018 at 07:59 PM
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
(6, 'rai', 'Michael', 'Angelo', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'rai@gmail.com', '09172899011', 'Enabled', 'Baguio', 'Manager', NULL),
(7, 'alex', 'Alex', 'Rull', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'ahlex@yahoo.com', '09128281234', 'Enabled', 'Pangasinan', 'Secretary', NULL),
(8, 'rajja', 'Rajja', 'Mecca', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'rajja@google.com', '09128222133', 'Enabled', 'Pangasinan', 'Manager', NULL),
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bad_order`
--

INSERT INTO `bad_order` (`bo_id`, `bo_dateReleased`, `bo_issue_account`, `bo_client`, `bo_remarks`) VALUES
(1, 'January 12, 2018, 12:05 am', 'mark', 20, ''),
(2, 'January 12, 2018, 10:42 am', 'mark', 20, '');

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
(1, 50, 2, 'Baguio', 252, '', 20),
(2, 10, 10, 'Baguio', 250, '', 20);

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

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
(19, 'Crocks', 'Enabled'),
(20, 'TEST', 'Disabled'),
(21, 'Test Category 1', 'Enabled'),
(22, 'test', 'Disabled'),
(23, 'Test Category 5', 'Enabled'),
(24, 'Test Category 10', 'Enabled');

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
  `c_contactperson` varchar(50) DEFAULT NULL,
  `c_contactpersonnumber` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`c_id`, `c_name`, `c_address`, `c_location`, `c_contactperson`, `c_contactpersonnumber`) VALUES
(18, 'Harison TS', 'Harrison Rd', 'Baguio', 'Ramon Tiko', '09587463210'),
(19, 'SM pangasinan', 'Sison', 'Pangasinan', 'Juan Carlos', '09154623658'),
(20, 'Tsiongsan LT', 'La Trinindad', 'Baguio', 'Moira Low', '444-23568'),
(21, 'Tsiongsan Pangasinan', 'Pangasinan Area', 'Pangasinan', 'Lany Mis', '444-11215'),
(26, 'Save Less', 'Marcos Highway', 'Baguio', 'Sonny Veg', '032154787'),
(27, 'Sari Sari', 'Kanto', 'Pangasinan', 'Aly Mang', '09526333333'),
(30, 'James and Juliet', 'Bakakeng', 'Baguio', 'Joly Bee', '444-56454'),
(31, 'Sa Bahay', 'Rosario', 'Pangasinan', 'Mac Dee', '03168716'),
(32, 'Tiongsan Mabini', 'Mabini Highway', 'Baguio', 'Globes Mark', '09123654763'),
(35, 'Victoria', 'Gen Luna Rd', 'Baguio', 'Jeff Besy', '444-45645'),
(36, 'Uno', 'Magsaysay', 'Baguio', 'Many Pag', '444-32323');

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
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`iS_inventoryid`, `iS_product_id`, `iS_restock_lvl`, `iS_quantity`, `iS_location`) VALUES
(18, 241, 20, 36, 'Baguio'),
(19, 241, 30, 55, 'Pangasinan'),
(20, 242, 30, 54, 'Baguio'),
(21, 242, 30, 96, 'Pangasinan'),
(22, 243, 30, 49, 'Baguio'),
(23, 243, 30, 39, 'Pangasinan'),
(24, 244, 30, 4, 'Baguio'),
(25, 244, 30, 32, 'Pangasinan'),
(26, 245, 30, 80, 'Baguio'),
(27, 245, 30, 54, 'Pangasinan'),
(28, 246, 30, 40, 'Baguio'),
(29, 246, 30, 78, 'Pangasinan'),
(30, 247, 30, 50, 'Baguio'),
(31, 247, 30, 54, 'Pangasinan'),
(34, 249, 30, 50, 'Baguio'),
(35, 249, 30, 40, 'Pangasinan'),
(36, 250, 30, 50, 'Baguio'),
(37, 250, 30, 104, 'Pangasinan'),
(38, 251, 30, 64, 'Baguio'),
(39, 251, 30, 73, 'Pangasinan'),
(40, 252, 30, -22, 'Baguio'),
(41, 252, 30, 70, 'Pangasinan'),
(42, 253, 30, 90, 'Baguio'),
(43, 253, 30, 86, 'Pangasinan'),
(44, 254, 30, 43, 'Baguio'),
(45, 254, 30, 48, 'Pangasinan'),
(46, 255, 30, 90, 'Baguio'),
(47, 255, 30, 30, 'Pangasinan'),
(48, 256, 30, 85, 'Baguio'),
(49, 256, 30, 86, 'Pangasinan'),
(50, 257, 30, -2, 'Baguio'),
(51, 257, 30, 80, 'Pangasinan'),
(52, 258, 30, 50, 'Baguio'),
(53, 258, 30, 57, 'Pangasinan'),
(54, 259, 30, 40, 'Baguio'),
(55, 259, 30, 64, 'Pangasinan'),
(56, 260, 30, -5, 'Baguio'),
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
(80, 272, 30, -50, 'Baguio'),
(81, 272, 30, 0, 'Pangasinan'),
(82, 273, 45, 0, 'Baguio'),
(83, 273, 45, 0, 'Pangasinan'),
(84, 274, 30, 0, 'Baguio'),
(85, 274, 30, 0, 'Pangasinan'),
(86, 275, 30, 0, 'Baguio'),
(87, 275, 30, 0, 'Pangasinan'),
(88, 275, 30, 0, 'Baguio'),
(89, 275, 30, 0, 'Pangasinan'),
(90, 277, 30, 850, 'Baguio'),
(91, 277, 30, 850, 'Pangasinan');

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

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
(16, 'January 15, 2018, 10:11 pm', 'mark', '1', '', NULL, NULL, 18, NULL),
(17, 'January 15, 2018, 10:20 pm', 'mark', '1', '', NULL, NULL, 18, NULL),
(18, 'January 16, 2018, 3:34 am', 'mark', '1', 'somewhat', NULL, NULL, 18, NULL),
(19, 'January 16, 2018, 3:34 am', 'mark', '1', 'someone', NULL, NULL, 19, NULL),
(20, 'January 16, 2018, 3:49 am', 'mark', '2', 'something', NULL, '2', NULL, NULL),
(21, 'January 16, 2018, 3:50 am', 'mark', '2', '', NULL, '2', NULL, NULL),
(22, 'January 16, 2018, 3:51 am', 'mark', '3', 'reasd', 'rai', NULL, NULL, NULL),
(23, 'January 16, 2018, 3:52 am', 'mark', '3', '1052ad', 'rai', NULL, NULL, NULL),
(24, 'January 16, 2018, 3:53 am', 'mark', '4', '', NULL, NULL, NULL, NULL),
(25, 'January 16, 2018, 3:53 am', 'mark', '4', '', NULL, NULL, NULL, NULL);

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
(1, 0, 10, 'Baguio', 250, '', 20),
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
(16, 50, 56, 'Baguio', 241, '', NULL),
(16, 50, 56, 'Baguio', 257, '', NULL),
(16, 55, 56, 'Baguio', 260, '', NULL),
(16, 90, 56, 'Baguio', 252, '', NULL),
(17, 50, 50, 'Baguio', 272, '', NULL),
(18, 50, 60, 'Baguio', 277, 'something', NULL),
(19, 50, 60, 'Pangasinan', 277, 'somwwhat', NULL),
(20, 50, 59, 'Baguio', 277, '', NULL),
(21, 50, 59, 'Pangasinan', 277, '', NULL),
(22, 50, 59, 'Baguio', 277, '', NULL),
(23, 50, 59, 'Pangasinan', 277, '', NULL),
(24, 50, 59, 'Baguio', 277, '', NULL),
(25, 50, 59, 'Pangasinan', 277, '', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=latin1;

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
(193, 'mark', 'Login', 'January 15, 2018, 10:03 pm', NULL, 'has successfully login'),
(194, 'mark', 'Added Issuance', 'January 15, 2018, 10:11 pm', NULL, 'has successfully issued a product'),
(195, 'mark', 'Added Issuance', 'January 15, 2018, 10:11 pm', NULL, 'has successfully issued a product'),
(196, 'mark', 'Added Issuance', 'January 15, 2018, 10:11 pm', NULL, 'has successfully issued a product'),
(197, 'mark', 'Added Issuance', 'January 15, 2018, 10:11 pm', NULL, 'has successfully issued a product'),
(198, 'mark', 'Added Category', 'January 15, 2018, 10:14 pm', NULL, 'has successfully added a new category'),
(199, 'mark', 'Added Category', 'January 15, 2018, 10:14 pm', NULL, 'has successfully added a new category'),
(200, 'mark', 'Added Product', 'January 15, 2018, 10:16 pm', NULL, 'has successfully added a new product'),
(201, 'mark', 'Added Issuance', 'January 15, 2018, 10:20 pm', NULL, 'has successfully issued a product'),
(202, 'mark', 'Added Category', 'January 15, 2018, 10:36 pm', NULL, 'has successfully added a new category'),
(203, 'mark', 'Added Category', 'January 15, 2018, 10:37 pm', NULL, 'has successfully added a new category'),
(204, 'mark', 'Added Product', 'January 15, 2018, 10:39 pm', NULL, 'has successfully added a new product'),
(205, 'mark', 'Added Product', 'January 15, 2018, 10:42 pm', NULL, 'has successfully added a new product'),
(206, 'mark', 'Added Product', 'January 16, 2018, 3:09 am', NULL, 'has successfully added a new product'),
(207, 'mark', 'Added Category', 'January 16, 2018, 3:15 am', NULL, 'has successfully added a new category'),
(208, 'mark', 'Added Product', 'January 16, 2018, 3:16 am', NULL, 'has successfully added a new product'),
(209, 'mark', 'Added Product', 'January 16, 2018, 3:17 am', NULL, 'has successfully added a new product'),
(210, 'mark', 'Added Low Stock', 'January 16, 2018, 3:20 am', NULL, 'has successfully added a stock to low stock products'),
(211, 'mark', 'Added Low Stock', 'January 16, 2018, 3:20 am', NULL, 'has successfully added a stock to low stock products'),
(212, 'mark', 'Added Issuance', 'January 16, 2018, 3:34 am', NULL, 'has successfully issued a product'),
(213, 'mark', 'Added Issuance', 'January 16, 2018, 3:34 am', NULL, 'has successfully issued a product'),
(214, 'mark', 'Penthouse Issuance', 'January 16, 2018, 3:49 am', NULL, 'has successfully issued products to penthouse'),
(215, 'mark', 'Penthouse Issuance', 'January 16, 2018, 3:50 am', NULL, 'has successfully issued products to penthouse'),
(216, 'mark', 'Others Issuance', 'January 16, 2018, 3:51 am', NULL, 'has successfully issued products to others'),
(217, 'mark', 'Others Issuance', 'January 16, 2018, 3:52 am', NULL, 'has successfully issued products to others'),
(218, 'mark', 'Added Stock Transfer', 'January 16, 2018, 3:53 am', NULL, 'has successfully transfered product(s)'),
(219, 'mark', 'Added Stock Transfer', 'January 16, 2018, 3:53 am', NULL, 'has successfully transfered product(s)');

-- --------------------------------------------------------

--
-- Table structure for table `merchandiser`
--

DROP TABLE IF EXISTS `merchandiser`;
CREATE TABLE IF NOT EXISTS `merchandiser` (
  `m_id` int(15) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(25) NOT NULL,
  `m_contact_number` int(25) NOT NULL,
  `m_address` varchar(50) NOT NULL,
  `m_branch` varchar(10) NOT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `merchandiser`
--

INSERT INTO `merchandiser` (`m_id`, `m_name`, `m_contact_number`, `m_address`, `m_branch`) VALUES
(1, 'Mark', 99818212, 'Bonifacio', 'Baguio'),
(2, 'Res', 102912121, 'Manila', 'Pangasinan'),
(3, 'Vic Sotto', 912121234, 'Kalinga', 'Pangasinan'),
(4, 'Ross', 912121255, 'Malacanang', 'Baguio'),
(5, 'Mark', 912120910, 'Bakakeng', 'Baguio');

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
(12, 30, 3, 'Pangasinan', 250, '', 27);

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

DROP TABLE IF EXISTS `product_list`;
CREATE TABLE IF NOT EXISTS `product_list` (
  `productList_id` int(15) NOT NULL AUTO_INCREMENT,
  `productList_name` varchar(50) DEFAULT NULL,
  `category_id` int(15) NOT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`productList_id`),
  KEY `FK_product_list_category_idx` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=latin1;

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
(272, 'TEST PRODUCT 1.5(gm(s))(gm(s))', 13, '1111'),
(273, 'Test Product 5(gm(s))', 23, '1012121'),
(274, 'Test Product 5.1(gm(s))(gm(s))', 21, '111111111'),
(275, 'Test Product 10', 13, ''),
(277, 'Test Product 11', 24, '');

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
(270, 'Pangasinan', 'Enabled', '110'),
(271, 'Baguio', 'Enabled', '20'),
(271, 'Pangasinan', 'Enabled', '15'),
(272, 'Baguio', 'Enabled', '60'),
(272, 'Pangasinan', 'Enabled', '58'),
(273, 'Baguio', 'Enabled', '65.00'),
(273, 'Pangasinan', 'Enabled', '61'),
(274, 'Baguio', 'Enabled', '5665'),
(274, 'Pangasinan', 'Enabled', '665'),
(275, 'Baguio', 'Enabled', '50.00'),
(275, 'Pangasinan', 'Enabled', '56.00'),
(275, 'Baguio', 'Enabled', '50.00'),
(275, 'Pangasinan', 'Enabled', '56.00'),
(277, 'Baguio', 'Enabled', '58'),
(277, 'Pangasinan', 'Enabled', '59');

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
(3, 'January 12, 2018, 12:27 am', 'mark', 27, ''),
(4, 'January 12, 2018, 10:11 am', 'mark', 20, ''),
(5, 'January 12, 2018, 10:13 am', 'mark', 20, ''),
(6, 'January 12, 2018, 10:13 am', 'mark', 20, ''),
(7, 'January 12, 2018, 10:14 am', 'mark', 27, ''),
(8, 'January 12, 2018, 10:20 am', 'mark', 27, ''),
(9, 'January 12, 2018, 10:23 am', 'mark', 20, ''),
(10, 'January 12, 2018, 10:25 am', 'mark', 20, ''),
(11, 'January 12, 2018, 10:26 am', 'mark', 20, ''),
(12, 'January 12, 2018, 10:27 am', 'mark', 27, '');

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchased_order`
--

INSERT INTO `purchased_order` (`order_id`, `order_date`, `client_id`, `merchandiser_id`) VALUES
(11, 'January 11, 2018, 10:24 am', 20, 3),
(12, 'January 11, 2018, 4:38 pm', 27, 4),
(17, 'January 11, 2018, 6:22 pm', 20, 3),
(18, 'January 12, 2018, 12:35 am', 35, 4),
(19, 'January 12, 2018, 3:25 am', 19, 5);

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
(11, -1, 'Baguio', 244, 'another', 20, 3),
(12, 25, 'Pangasinan', 244, '', 27, 4),
(12, 5, 'Pangasinan', 250, '', 27, 4),
(17, 20, 'Baguio', 245, '', 20, 3),
(18, 78, 'Baguio', 245, '', 35, 4),
(18, 90, 'Baguio', 254, '', 35, 4),
(19, 0, 'Pangasinan', 243, '', 19, 5);

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
