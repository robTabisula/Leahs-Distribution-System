-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 11, 2018 at 04:09 PM
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`acc_id`, `username`, `first_name`, `last_name`, `password`, `email`, `contact_no`, `status`, `branch`, `acctype`, `security_key`) VALUES
(1, 'lvl1', 'admin', 'admin', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'admin@leahs.com', '0123456789', 'Enabled', 'Pangasinan', 'Admin', NULL);

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
(1, 'January 11, 2018, 11:11 pm', 'lvl1', NULL, '');

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
  KEY `bo_id_idx` (`bo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bo_list`
--

INSERT INTO `bo_list` (`bo_id`, `bo_price`, `bo_qty`, `branch`, `bo_product_id`, `po_remarks`) VALUES
(1, 50, 5, 'Baguio', 287, '');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`category_id`, `category_name`, `category_status`) VALUES
(20, 'Specialty', 'Enabled'),
(21, 'TEST', 'Enabled');

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
  `c_contactpersonnumber` int(50) DEFAULT NULL,
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`c_id`, `c_name`, `c_address`, `c_location`, `c_contactperson`, `c_contactpersonnumber`) VALUES
(40, 'PureGold', 'La-Trinidad, KM-4', 'Baguio', NULL, NULL),
(41, 'PureGold', 'Pangasinan', 'Pangasinan', NULL, NULL),
(42, 'SM', 'session', 'Baguio', NULL, NULL),
(43, 'asdasdasd', 'asdasdas', 'Baguio', NULL, NULL),
(44, '1', '1', 'Baguio', NULL, NULL),
(45, '2', '2', 'Baguio', NULL, NULL),
(46, '3', '3', 'Baguio', NULL, NULL),
(47, '4', '4', 'Baguio', NULL, NULL),
(48, '5', '5', 'Baguio', NULL, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`iS_inventoryid`, `iS_product_id`, `iS_restock_lvl`, `iS_quantity`, `iS_location`) VALUES
(88, 276, 50, 0, 'Baguio'),
(89, 276, 50, 0, 'Pangasinan'),
(90, 277, 50, 0, 'Baguio'),
(91, 277, 50, 0, 'Pangasinan'),
(92, 278, 50, 0, 'Baguio'),
(93, 278, 50, 0, 'Pangasinan'),
(94, 279, 50, 0, 'Baguio'),
(95, 279, 50, 0, 'Pangasinan'),
(96, 279, 50, 0, 'Baguio'),
(97, 279, 50, 0, 'Pangasinan'),
(98, 281, 50, 0, 'Baguio'),
(99, 281, 50, 0, 'Pangasinan'),
(100, 282, 50, 0, 'Baguio'),
(101, 282, 50, 0, 'Pangasinan'),
(102, 283, 50, 0, 'Baguio'),
(103, 283, 50, 0, 'Pangasinan'),
(104, 284, 50, 0, 'Baguio'),
(105, 284, 50, 0, 'Pangasinan'),
(106, 285, 50, 0, 'Baguio'),
(107, 285, 50, 0, 'Pangasinan'),
(108, 286, 50, 0, 'Baguio'),
(109, 286, 50, 0, 'Pangasinan'),
(110, 287, 50, 850, 'Baguio'),
(111, 287, 50, 850, 'Pangasinan');

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
  `client_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`issue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `issuance`
--

INSERT INTO `issuance` (`issue_id`, `issue_date_time`, `issue_account`, `issue_type`, `remarks`, `other_clients`, `penthouse_clients`, `client_id`) VALUES
(1, 'January 11, 2018, 10:57 pm', 'lvl1', '1', '', NULL, NULL, '40'),
(2, 'January 11, 2018, 10:59 pm', 'lvl1', '1', '', NULL, NULL, '41'),
(3, 'January 11, 2018, 11:00 pm', 'lvl1', '2', '', NULL, '1', NULL),
(4, 'January 11, 2018, 11:01 pm', 'lvl1', '2', '', NULL, '1', NULL),
(5, 'January 11, 2018, 11:01 pm', 'lvl1', '3', '', 'RAI Baguio', NULL, NULL),
(6, 'January 11, 2018, 11:01 pm', 'lvl1', '3', '', 'Rai Pangasinan', NULL, NULL),
(7, 'January 11, 2018, 11:03 pm', 'lvl1', '4', '', NULL, NULL, NULL),
(8, 'January 11, 2018, 11:03 pm', 'lvl1', '1', '', NULL, NULL, '40'),
(9, 'January 11, 2018, 11:04 pm', 'lvl1', '4', '', NULL, NULL, NULL),
(10, 'January 11, 2018, 11:04 pm', 'lvl1', '4', '', NULL, NULL, NULL),
(11, 'January 11, 2018, 11:45 pm', 'lvl1', '1', '', NULL, NULL, '40'),
(12, 'January 11, 2018, 11:45 pm', 'lvl1', '3', '', '26562', NULL, NULL);

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
  KEY `FK_issuancelist_productlist_idx` (`prod_id`),
  KEY `issue_id_idx` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `issuance_list`
--

INSERT INTO `issuance_list` (`issue_id`, `prod_qty`, `prod_price`, `branch`, `prod_id`, `prod_remarks`) VALUES
(1, 50, 50, 'Baguio', 287, ''),
(2, 50, 50, 'Pangasinan', 287, ''),
(3, 50, 50, 'Baguio', 287, ''),
(4, 50, 50, 'Pangasinan', 287, ''),
(5, 50, 50, 'Baguio', 287, ''),
(6, 50, 50, 'Pangasinan', 287, ''),
(9, 50, 50, 'Baguio', 287, ''),
(10, 50, 50, 'Pangasinan', 287, '');

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
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`logs_id`, `issue_acnt`, `act_type`, `date_time`, `related_id`, `remarks`) VALUES
(111, 'robijn', 'Login', 'January 11, 2018, 10:02 pm', NULL, 'has successfully login'),
(112, 'robijn', 'Added User', 'January 11, 2018, 10:03 pm', NULL, 'has successfully added a new user'),
(113, 'lvl1', 'Login', 'January 11, 2018, 10:04 pm', NULL, 'has successfully login'),
(114, 'lvl11', 'Login', 'January 11, 2018, 10:05 pm', NULL, 'has successfully login'),
(115, 'lvl1', 'Login', 'January 11, 2018, 10:05 pm', NULL, 'has successfully login'),
(116, 'lvl1', 'Added Client', 'January 11, 2018, 10:07 pm', NULL, 'has successfully added a new client'),
(117, 'lvl1', 'Added Client', 'January 11, 2018, 10:07 pm', NULL, 'has successfully added a new client'),
(118, 'lvl1', 'Added Client', 'January 11, 2018, 10:08 pm', NULL, 'has successfully added a new client'),
(119, 'lvl1', 'Added Client', 'January 11, 2018, 10:08 pm', NULL, 'has successfully added a new client'),
(120, 'lvl1', 'Added Category', 'January 11, 2018, 10:13 pm', NULL, 'has successfully added a new category'),
(121, 'lvl1', 'Added Product', 'January 11, 2018, 10:15 pm', NULL, 'has successfully added a new product'),
(122, 'lvl1', 'Added Product', 'January 11, 2018, 10:17 pm', NULL, 'has successfully added a new product'),
(123, 'lvl1', 'Added Product', 'January 11, 2018, 10:17 pm', NULL, 'has successfully added a new product'),
(124, 'lvl1', 'Added Product', 'January 11, 2018, 10:18 pm', NULL, 'has successfully added a new product'),
(125, 'lvl1', 'Added Product', 'January 11, 2018, 10:29 pm', NULL, 'has successfully added a new product'),
(126, 'lvl1', 'Added Product', 'January 11, 2018, 10:29 pm', NULL, 'has successfully added a new product'),
(127, 'lvl1', 'Added Product', 'January 11, 2018, 10:34 pm', NULL, 'has successfully added a new product'),
(128, 'lvl1', 'Added Product', 'January 11, 2018, 10:35 pm', NULL, 'has successfully added a new product'),
(129, 'lvl1', 'Added Product', 'January 11, 2018, 10:37 pm', NULL, 'has successfully added a new product'),
(130, 'lvl1', 'Added Product', 'January 11, 2018, 10:37 pm', NULL, 'has successfully added a new product'),
(131, 'lvl1', 'Added Product', 'January 11, 2018, 10:37 pm', NULL, 'has successfully added a new product'),
(132, 'lvl1', 'Added Product', 'January 11, 2018, 10:38 pm', NULL, 'has successfully added a new product'),
(133, 'lvl1', 'Added Product', 'January 11, 2018, 10:39 pm', NULL, 'has successfully added a new product'),
(134, 'lvl1', 'Added Product', 'January 11, 2018, 10:39 pm', NULL, 'has successfully added a new product'),
(135, 'lvl1', 'Added Product', 'January 11, 2018, 10:39 pm', NULL, 'has successfully added a new product'),
(136, 'lvl1', 'Added Product', 'January 11, 2018, 10:40 pm', NULL, 'has successfully added a new product'),
(137, 'lvl1', 'Added Product', 'January 11, 2018, 10:44 pm', NULL, 'has successfully added a new product'),
(138, 'lvl1', 'Added Category', 'January 11, 2018, 10:47 pm', NULL, 'has successfully added a new category'),
(139, 'lvl1', 'Added Product', 'January 11, 2018, 10:48 pm', NULL, 'has successfully added a new product'),
(140, 'lvl1', 'Added Stocks', 'January 11, 2018, 10:48 pm', NULL, 'has successfully added a new stock'),
(141, 'lvl1', 'Added Stocks', 'January 11, 2018, 10:48 pm', NULL, 'has successfully added a new stock'),
(142, 'lvl1', 'Added Merchandiser', 'January 11, 2018, 10:49 pm', NULL, 'has successfully added a new merchandiser'),
(143, 'lvl1', 'Added Merchandiser', 'January 11, 2018, 10:49 pm', NULL, 'has successfully added a new merchandiser'),
(144, 'lvl1', 'Added Merchandiser', 'January 11, 2018, 10:50 pm', NULL, 'has successfully added a new merchandiser'),
(145, 'lvl1', 'Added Merchandiser', 'January 11, 2018, 10:51 pm', NULL, 'has successfully added a new merchandiser'),
(146, 'lvl1', 'Added Issuance', 'January 11, 2018, 10:57 pm', NULL, 'has successfully issued a product'),
(147, 'lvl1', 'Added Client', 'January 11, 2018, 10:58 pm', NULL, 'has successfully added a new client'),
(148, 'lvl1', 'Added Issuance', 'January 11, 2018, 10:59 pm', NULL, 'has successfully issued a product'),
(149, 'lvl1', 'Penthouse Issuance', 'January 11, 2018, 11:00 pm', NULL, 'has successfully issued products to penthouse'),
(150, 'lvl1', 'Penthouse Issuance', 'January 11, 2018, 11:01 pm', NULL, 'has successfully issued products to penthouse'),
(151, 'lvl1', 'Others Issuance', 'January 11, 2018, 11:01 pm', NULL, 'has successfully issued products to others'),
(152, 'lvl1', 'Others Issuance', 'January 11, 2018, 11:01 pm', NULL, 'has successfully issued products to others'),
(153, 'lvl1', 'Added Stock Transfer', 'January 11, 2018, 11:04 pm', NULL, 'has successfully transfered product(s)'),
(154, 'lvl1', 'Added Stock Transfer', 'January 11, 2018, 11:04 pm', NULL, 'has successfully transfered product(s)'),
(155, 'lvl1', 'Added Client', 'January 11, 2018, 11:59 pm', NULL, 'has successfully added a new client'),
(156, 'lvl1', 'Added Client', 'January 12, 2018, 12:01 am', NULL, 'has successfully added a new client'),
(157, 'lvl1', 'Added Client', 'January 12, 2018, 12:01 am', NULL, 'has successfully added a new client'),
(158, 'lvl1', 'Added Client', 'January 12, 2018, 12:02 am', NULL, 'has successfully added a new client'),
(159, 'lvl1', 'Added Client', 'January 12, 2018, 12:02 am', NULL, 'has successfully added a new client'),
(160, 'lvl1', 'Added Client', 'January 12, 2018, 12:02 am', NULL, 'has successfully added a new client'),
(161, 'lvl1', 'Added Client', 'January 12, 2018, 12:03 am', NULL, 'has successfully added a new client');

-- --------------------------------------------------------

--
-- Table structure for table `merchandiser`
--

DROP TABLE IF EXISTS `merchandiser`;
CREATE TABLE IF NOT EXISTS `merchandiser` (
  `m_id` int(15) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(25) NOT NULL,
  `m_contact_number` int(15) NOT NULL,
  `m_address` varchar(50) NOT NULL,
  `m_branch` varchar(10) NOT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `merchandiser`
--

INSERT INTO `merchandiser` (`m_id`, `m_name`, `m_contact_number`, `m_address`, `m_branch`) VALUES
(6, 'mike', 123456789, 'somewhere', 'Baguio'),
(7, 'michael', 1234567890, '12345678901234567890', 'Baguio'),
(8, 'Michael', 926082764, 'CentralBalili', 'Baguio'),
(9, 'Michael Angelo Raiii', 1234567890, 'Balili', 'Baguio');

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
  KEY `po_id_idx` (`po_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `po_list`
--

INSERT INTO `po_list` (`po_id`, `po_price`, `po_qty`, `branch`, `po_product_id`, `po_remarks`) VALUES
(1, 50, 5, 'Baguio', 287, ''),
(2, 50, 5, 'Baguio', 287, ''),
(3, 50, 5, 'Baguio', 287, ''),
(4, 50, 10, 'Baguio', 287, ''),
(5, 50, 10, 'Baguio', 287, '');

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

DROP TABLE IF EXISTS `product_list`;
CREATE TABLE IF NOT EXISTS `product_list` (
  `productList_id` int(15) NOT NULL AUTO_INCREMENT,
  `productList_name` varchar(50) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `category_id` int(15) NOT NULL,
  `barcode` int(25) NOT NULL,
  PRIMARY KEY (`productList_id`),
  KEY `FK_product_list_category_idx` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=288 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`productList_id`, `productList_name`, `unit`, `category_id`, `barcode`) VALUES
(276, '100', '100g', 20, 100),
(277, '200', '200g', 20, 200),
(278, '250', '250g', 20, 250),
(279, '300', '300g', 20, 300),
(280, '300', '300g', 20, 300),
(281, '500', '500g', 20, 500),
(282, '1000', '1kg', 20, 1000),
(283, '1pck', '1pck', 20, 101),
(284, 'pcs', '1pcs', 20, 102),
(285, '200g', '200g', 20, 100),
(286, 'test', '250g', 20, 55151),
(287, 'Test Product 1', '100g', 20, 123456);

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
(276, 'Baguio', 'Enabled', '50'),
(276, 'Pangasinan', 'Enabled', '50'),
(277, 'Baguio', 'Enabled', '50'),
(277, 'Pangasinan', 'Enabled', '50'),
(278, 'Baguio', 'Enabled', '50'),
(278, 'Pangasinan', 'Enabled', '50'),
(279, 'Baguio', 'Enabled', '50'),
(279, 'Pangasinan', 'Enabled', '50'),
(279, 'Baguio', 'Enabled', '50'),
(279, 'Pangasinan', 'Enabled', '50'),
(281, 'Baguio', 'Enabled', '50'),
(281, 'Pangasinan', 'Enabled', '50'),
(282, 'Baguio', 'Enabled', '50'),
(282, 'Pangasinan', 'Enabled', '50'),
(283, 'Baguio', 'Enabled', '50'),
(283, 'Pangasinan', 'Enabled', '50'),
(284, 'Baguio', 'Enabled', '50'),
(284, 'Pangasinan', 'Enabled', '50'),
(285, 'Baguio', 'Enabled', '50'),
(285, 'Pangasinan', 'Enabled', '50'),
(286, 'Baguio', 'Enabled', '50'),
(286, 'Pangasinan', 'Enabled', '50'),
(287, 'Baguio', 'Enabled', '50'),
(287, 'Pangasinan', 'Enabled', '50');

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
(1, 'January 11, 2018, 11:05 pm', 'lvl1', NULL, ''),
(2, 'January 11, 2018, 11:06 pm', 'lvl1', NULL, ''),
(3, 'January 11, 2018, 11:42 pm', 'lvl1', NULL, ''),
(4, 'January 11, 2018, 11:43 pm', 'lvl1', NULL, ''),
(5, 'January 11, 2018, 11:44 pm', 'lvl1', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `purchased_order`
--

DROP TABLE IF EXISTS `purchased_order`;
CREATE TABLE IF NOT EXISTS `purchased_order` (
  `order_id` int(50) NOT NULL AUTO_INCREMENT,
  `order_date` varchar(50) NOT NULL,
  `client_id` int(20) NOT NULL,
  `merchandiser` varchar(20) NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

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
  KEY `order_id_idx` (`p_order_id`),
  KEY `product_id_idx` (`prdct_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bo_list`
--
ALTER TABLE `bo_list`
  ADD CONSTRAINT `bo_id` FOREIGN KEY (`bo_id`) REFERENCES `bad_order` (`bo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `iS_product_id` FOREIGN KEY (`iS_product_id`) REFERENCES `product_list` (`productList_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `issuance_list`
--
ALTER TABLE `issuance_list`
  ADD CONSTRAINT `issue_id` FOREIGN KEY (`issue_id`) REFERENCES `issuance` (`issue_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `prod_id` FOREIGN KEY (`prod_id`) REFERENCES `product_list` (`productList_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `po_list`
--
ALTER TABLE `po_list`
  ADD CONSTRAINT `po_id` FOREIGN KEY (`po_id`) REFERENCES `pull_out` (`po_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
