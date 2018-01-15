-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 15, 2018 at 10:31 PM
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`acc_id`, `username`, `first_name`, `last_name`, `password`, `email`, `contact_no`, `status`, `branch`, `acctype`, `security_key`) VALUES
(2, 'mark', 'Mark', 'Abad', '3b4f122b181aeef98042c4219b554f4d76934f125c0c183494e9fa909f5f249e0ccfbd626da5851e904d5b8f66e29dbe819d2ba4fd2439f53462caaed4eeee90', 'markk@gmail.coa', '123123213', 'Enabled', 'Baguio', 'Admin', '10291'),
(10, 'lvl1', 'admin', 'admin', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'admin@leahs.com', '09260876469', 'Enabled', 'Baguio', 'Admin', NULL),
(11, 'lvl2B', 'Manager', 'Baguio', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'manager@leahs.com', '096087464', 'Enabled', 'Baguio', 'Manager', NULL),
(12, 'lvl2P', 'Manager', 'Pangasinan', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'managerPangasinan@leahs.com', '09260827948', 'Enabled', 'Pangasinan', 'Manager', NULL),
(13, 'lvl3B', 'SecretaryBookkeeper', 'Baguio', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'managersecretaryBaguio@leahs.com', '09260827182', 'Enabled', 'Baguio', 'Secretary', NULL),
(14, 'lvl3P', 'SecretaryBookkeeper', 'Pangasinan', 'fa585d89c851dd338a70dcf535aa2a92fee7836dd6aff1226583e88e0996293f16bc009c652826e0fc5c706695a03cddce372f139eff4d13959da6f1f5d3eabe', 'secretarybookkeeperPangasinan@leahs.com', '09268026475', 'Enabled', 'Pangasinan', 'Secretary', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`category_id`, `category_name`, `category_status`) VALUES
(25, 'Specialty Products', 'Enabled'),
(26, 'Sweets', 'Enabled'),
(27, 'Jam & Jellies', 'Enabled'),
(28, 'Condiments, Sauce & Oils', 'Enabled'),
(29, 'Baking Products', 'Enabled'),
(30, 'Mallows & Gummies', 'Enabled'),
(31, 'Beans and Mongo', 'Enabled'),
(32, 'Others', 'Enabled');

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
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`iS_inventoryid`, `iS_product_id`, `iS_restock_lvl`, `iS_quantity`, `iS_location`) VALUES
(92, 278, 30, 0, 'Baguio'),
(93, 278, 30, 0, 'Pangasinan'),
(94, 279, 30, 0, 'Baguio'),
(95, 279, 30, 0, 'Pangasinan'),
(96, 280, 30, 0, 'Baguio'),
(97, 280, 30, 0, 'Pangasinan'),
(98, 281, 44, 0, 'Baguio'),
(99, 281, 44, 0, 'Pangasinan'),
(100, 282, 30, 0, 'Baguio'),
(101, 282, 30, 0, 'Pangasinan'),
(104, 284, 30, 0, 'Baguio'),
(105, 284, 30, 0, 'Pangasinan'),
(106, 285, 30, 0, 'Baguio'),
(107, 285, 30, 0, 'Pangasinan'),
(108, 286, 30, 0, 'Baguio'),
(109, 286, 30, 0, 'Pangasinan'),
(110, 287, 30, 0, 'Baguio'),
(111, 287, 30, 0, 'Pangasinan'),
(112, 288, 30, 0, 'Baguio'),
(113, 288, 30, 0, 'Pangasinan'),
(114, 289, 30, 0, 'Baguio'),
(115, 289, 30, 0, 'Pangasinan'),
(116, 290, 30, 0, 'Baguio'),
(117, 290, 30, 0, 'Pangasinan'),
(118, 291, 30, 0, 'Baguio'),
(119, 291, 30, 0, 'Pangasinan'),
(120, 292, 30, 0, 'Baguio'),
(121, 292, 30, 0, 'Pangasinan'),
(122, 293, 30, 0, 'Baguio'),
(123, 293, 30, 0, 'Pangasinan'),
(124, 294, 50, 0, 'Baguio'),
(125, 294, 50, 0, 'Pangasinan'),
(126, 295, 50, 0, 'Baguio'),
(127, 295, 50, 0, 'Pangasinan'),
(128, 296, 50, 0, 'Baguio'),
(129, 296, 50, 0, 'Pangasinan'),
(130, 297, 50, 0, 'Baguio'),
(131, 297, 50, 0, 'Pangasinan'),
(132, 298, 50, 0, 'Baguio'),
(133, 298, 50, 0, 'Pangasinan'),
(134, 299, 50, 0, 'Baguio'),
(135, 299, 50, 0, 'Pangasinan'),
(136, 300, 50, 0, 'Baguio'),
(137, 300, 50, 0, 'Pangasinan'),
(138, 301, 50, 0, 'Baguio'),
(139, 301, 50, 0, 'Pangasinan'),
(140, 302, 30, 0, 'Baguio'),
(141, 302, 30, 0, 'Pangasinan'),
(142, 303, 30, 0, 'Baguio'),
(143, 303, 30, 0, 'Pangasinan'),
(144, 304, 30, 0, 'Baguio'),
(145, 304, 30, 0, 'Pangasinan'),
(146, 305, 30, 0, 'Baguio'),
(147, 305, 30, 0, 'Pangasinan'),
(148, 306, 30, 0, 'Baguio'),
(149, 306, 30, 0, 'Pangasinan'),
(150, 307, 30, 0, 'Baguio'),
(151, 307, 30, 0, 'Pangasinan'),
(152, 308, 30, 0, 'Baguio'),
(153, 308, 30, 0, 'Pangasinan'),
(154, 309, 50, 0, 'Baguio'),
(155, 309, 50, 0, 'Pangasinan'),
(156, 310, 50, 0, 'Baguio'),
(157, 310, 50, 0, 'Pangasinan'),
(158, 311, 50, 0, 'Baguio'),
(159, 311, 50, 0, 'Pangasinan'),
(160, 312, 50, 0, 'Baguio'),
(161, 312, 50, 0, 'Pangasinan'),
(162, 313, 50, 0, 'Baguio'),
(163, 313, 50, 0, 'Pangasinan'),
(164, 314, 50, 0, 'Baguio'),
(165, 314, 50, 0, 'Pangasinan'),
(166, 315, 50, 0, 'Baguio'),
(167, 315, 50, 0, 'Pangasinan'),
(168, 316, 50, 0, 'Baguio'),
(169, 316, 50, 0, 'Pangasinan'),
(170, 317, 50, 0, 'Baguio'),
(171, 317, 50, 0, 'Pangasinan'),
(172, 318, 50, 0, 'Baguio'),
(173, 318, 50, 0, 'Pangasinan'),
(174, 319, 50, 0, 'Baguio'),
(175, 319, 50, 0, 'Pangasinan'),
(176, 320, 40, 0, 'Baguio'),
(177, 320, 40, 0, 'Pangasinan'),
(178, 321, 50, 0, 'Baguio'),
(179, 321, 50, 0, 'Pangasinan'),
(180, 322, 50, 0, 'Baguio'),
(181, 322, 50, 0, 'Pangasinan'),
(182, 323, 50, 0, 'Baguio'),
(183, 323, 50, 0, 'Pangasinan'),
(184, 324, 50, 0, 'Baguio'),
(185, 324, 50, 0, 'Pangasinan'),
(186, 325, 50, 0, 'Baguio'),
(187, 325, 50, 0, 'Pangasinan'),
(188, 326, 50, 0, 'Baguio'),
(189, 326, 50, 0, 'Pangasinan'),
(190, 327, 50, 0, 'Baguio'),
(191, 327, 50, 0, 'Pangasinan'),
(192, 328, 50, 0, 'Baguio'),
(193, 328, 50, 0, 'Pangasinan'),
(194, 329, 50, 0, 'Baguio'),
(195, 329, 50, 0, 'Pangasinan'),
(196, 330, 50, 0, 'Baguio'),
(197, 330, 50, 0, 'Pangasinan'),
(198, 331, 50, 0, 'Baguio'),
(199, 331, 50, 0, 'Pangasinan'),
(200, 332, 50, 0, 'Baguio'),
(201, 332, 50, 0, 'Pangasinan'),
(202, 333, 50, 0, 'Baguio'),
(203, 333, 50, 0, 'Pangasinan'),
(204, 334, 50, 0, 'Baguio'),
(205, 334, 50, 0, 'Pangasinan');

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=293 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`logs_id`, `issue_acnt`, `act_type`, `date_time`, `related_id`, `remarks`) VALUES
(222, 'mark', 'Login', 'January 16, 2018, 5:15 am', NULL, 'has successfully login'),
(223, 'mark', 'Added User', 'January 16, 2018, 5:16 am', NULL, 'has successfully added a new user'),
(224, 'mark', 'Added User', 'January 16, 2018, 5:17 am', NULL, 'has successfully added a new user'),
(225, 'mark', 'Added User', 'January 16, 2018, 5:18 am', NULL, 'has successfully added a new user'),
(226, 'mark', 'Added User', 'January 16, 2018, 5:20 am', NULL, 'has successfully added a new user'),
(227, 'mark', 'Added User', 'January 16, 2018, 5:31 am', NULL, 'has successfully added a new user'),
(228, 'lvl1', 'Added Category', 'January 16, 2018, 5:47 am', NULL, 'has successfully added a new category'),
(229, 'lvl1', 'Added Product', 'January 16, 2018, 5:48 am', NULL, 'has successfully added a new product'),
(230, 'lvl1', 'Added Product', 'January 16, 2018, 5:48 am', NULL, 'has successfully added a new product'),
(231, 'lvl1', 'Added Product', 'January 16, 2018, 5:48 am', NULL, 'has successfully added a new product'),
(232, 'lvl1', 'Added Product', 'January 16, 2018, 5:49 am', NULL, 'has successfully added a new product'),
(233, 'lvl1', 'Added Product', 'January 16, 2018, 5:50 am', NULL, 'has successfully added a new product'),
(234, 'lvl1', 'Added Product', 'January 16, 2018, 5:51 am', NULL, 'has successfully added a new product'),
(235, 'lvl1', 'Added Product', 'January 16, 2018, 5:53 am', NULL, 'has successfully added a new product'),
(236, 'lvl1', 'Added Product', 'January 16, 2018, 6:01 am', NULL, 'has successfully added a new product'),
(237, 'lvl1', 'Added Product', 'January 16, 2018, 6:02 am', NULL, 'has successfully added a new product'),
(238, 'lvl1', 'Added Product', 'January 16, 2018, 6:02 am', NULL, 'has successfully added a new product'),
(239, 'lvl1', 'Added Product', 'January 16, 2018, 6:03 am', NULL, 'has successfully added a new product'),
(240, 'lvl1', 'Added Product', 'January 16, 2018, 6:03 am', NULL, 'has successfully added a new product'),
(241, 'lvl1', 'Added Product', 'January 16, 2018, 6:03 am', NULL, 'has successfully added a new product'),
(242, 'lvl1', 'Added Product', 'January 16, 2018, 6:04 am', NULL, 'has successfully added a new product'),
(243, 'lvl1', 'Added Product', 'January 16, 2018, 6:05 am', NULL, 'has successfully added a new product'),
(244, 'lvl1', 'Added Product', 'January 16, 2018, 6:05 am', NULL, 'has successfully added a new product'),
(245, 'lvl1', 'Added Category', 'January 16, 2018, 6:06 am', NULL, 'has successfully added a new category'),
(246, 'lvl1', 'Added Product', 'January 16, 2018, 6:07 am', NULL, 'has successfully added a new product'),
(247, 'lvl1', 'Added Product', 'January 16, 2018, 6:07 am', NULL, 'has successfully added a new product'),
(248, 'lvl1', 'Added Product', 'January 16, 2018, 6:08 am', NULL, 'has successfully added a new product'),
(249, 'lvl1', 'Added Product', 'January 16, 2018, 6:08 am', NULL, 'has successfully added a new product'),
(250, 'lvl1', 'Added Product', 'January 16, 2018, 6:09 am', NULL, 'has successfully added a new product'),
(251, 'lvl1', 'Added Product', 'January 16, 2018, 6:09 am', NULL, 'has successfully added a new product'),
(252, 'lvl1', 'Added Product', 'January 16, 2018, 6:10 am', NULL, 'has successfully added a new product'),
(253, 'lvl1', 'Added Product', 'January 16, 2018, 6:10 am', NULL, 'has successfully added a new product'),
(254, 'lvl1', 'Added Category', 'January 16, 2018, 6:11 am', NULL, 'has successfully added a new category'),
(255, 'lvl1', 'Added Product', 'January 16, 2018, 6:11 am', NULL, 'has successfully added a new product'),
(256, 'lvl1', 'Added Product', 'January 16, 2018, 6:11 am', NULL, 'has successfully added a new product'),
(257, 'lvl1', 'Added Product', 'January 16, 2018, 6:12 am', NULL, 'has successfully added a new product'),
(258, 'lvl1', 'Added Product', 'January 16, 2018, 6:12 am', NULL, 'has successfully added a new product'),
(259, 'lvl1', 'Added Product', 'January 16, 2018, 6:13 am', NULL, 'has successfully added a new product'),
(260, 'lvl1', 'Added Product', 'January 16, 2018, 6:13 am', NULL, 'has successfully added a new product'),
(261, 'lvl1', 'Added Product', 'January 16, 2018, 6:14 am', NULL, 'has successfully added a new product'),
(262, 'lvl1', 'Added Category', 'January 16, 2018, 6:14 am', NULL, 'has successfully added a new category'),
(263, 'lvl1', 'Added Product', 'January 16, 2018, 6:15 am', NULL, 'has successfully added a new product'),
(264, 'lvl1', 'Added Product', 'January 16, 2018, 6:15 am', NULL, 'has successfully added a new product'),
(265, 'lvl1', 'Added Product', 'January 16, 2018, 6:16 am', NULL, 'has successfully added a new product'),
(266, 'lvl1', 'Added Product', 'January 16, 2018, 6:17 am', NULL, 'has successfully added a new product'),
(267, 'lvl1', 'Added Product', 'January 16, 2018, 6:17 am', NULL, 'has successfully added a new product'),
(268, 'lvl1', 'Added Product', 'January 16, 2018, 6:18 am', NULL, 'has successfully added a new product'),
(269, 'lvl1', 'Added Product', 'January 16, 2018, 6:18 am', NULL, 'has successfully added a new product'),
(270, 'lvl1', 'Added Category', 'January 16, 2018, 6:18 am', NULL, 'has successfully added a new category'),
(271, 'lvl1', 'Added Product', 'January 16, 2018, 6:19 am', NULL, 'has successfully added a new product'),
(272, 'lvl1', 'Added Product', 'January 16, 2018, 6:19 am', NULL, 'has successfully added a new product'),
(273, 'lvl1', 'Added Product', 'January 16, 2018, 6:20 am', NULL, 'has successfully added a new product'),
(274, 'lvl1', 'Added Product', 'January 16, 2018, 6:20 am', NULL, 'has successfully added a new product'),
(275, 'lvl1', 'Added Product', 'January 16, 2018, 6:20 am', NULL, 'has successfully added a new product'),
(276, 'lvl1', 'Added Category', 'January 16, 2018, 6:21 am', NULL, 'has successfully added a new category'),
(277, 'lvl1', 'Added Product', 'January 16, 2018, 6:22 am', NULL, 'has successfully added a new product'),
(278, 'lvl1', 'Added Product', 'January 16, 2018, 6:22 am', NULL, 'has successfully added a new product'),
(279, 'lvl1', 'Added Product', 'January 16, 2018, 6:22 am', NULL, 'has successfully added a new product'),
(280, 'lvl1', 'Added Product', 'January 16, 2018, 6:23 am', NULL, 'has successfully added a new product'),
(281, 'lvl1', 'Added Product', 'January 16, 2018, 6:23 am', NULL, 'has successfully added a new product'),
(282, 'lvl1', 'Added Product', 'January 16, 2018, 6:24 am', NULL, 'has successfully added a new product'),
(283, 'lvl1', 'Added Category', 'January 16, 2018, 6:24 am', NULL, 'has successfully added a new category'),
(284, 'lvl1', 'Added Product', 'January 16, 2018, 6:24 am', NULL, 'has successfully added a new product'),
(285, 'lvl1', 'Added Product', 'January 16, 2018, 6:25 am', NULL, 'has successfully added a new product'),
(286, 'lvl1', 'Added Product', 'January 16, 2018, 6:25 am', NULL, 'has successfully added a new product'),
(287, 'lvl1', 'Added Product', 'January 16, 2018, 6:26 am', NULL, 'has successfully added a new product'),
(288, 'lvl1', 'Added Product', 'January 16, 2018, 6:26 am', NULL, 'has successfully added a new product'),
(289, 'lvl1', 'Added Category', 'January 16, 2018, 6:27 am', NULL, 'has successfully added a new category'),
(290, 'lvl1', 'Added Product', 'January 16, 2018, 6:27 am', NULL, 'has successfully added a new product'),
(291, 'lvl1', 'Added Product', 'January 16, 2018, 6:28 am', NULL, 'has successfully added a new product'),
(292, 'lvl1', 'Added Product', 'January 16, 2018, 6:28 am', NULL, 'has successfully added a new product');

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
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`productList_id`, `productList_name`, `category_id`, `barcode`) VALUES
(278, 'Beef 500g', 25, ''),
(279, 'Chicken 500g', 25, ''),
(280, 'De Recado 500g', 25, ''),
(281, 'Hamonado 500g', 25, ''),
(282, 'Vigan 500g', 25, ''),
(284, 'Smoked Hamonado 250g', 25, ''),
(285, 'Smoked Vigan 500g', 25, ''),
(286, 'Smoked Vigan 250g', 25, ''),
(287, 'Embotido 450g', 25, ''),
(288, 'Embotido 200g', 25, ''),
(289, 'Tocino 500g', 25, ''),
(290, 'Tocino 250g', 25, ''),
(291, 'Lumpiang Shanghai 500g', 25, ''),
(292, 'Bangus Shanghai 500g', 25, ''),
(293, 'Chicken Shanghai 500g', 25, ''),
(294, 'Puto Seco 1pc', 26, ''),
(295, 'Long Rice 1pc', 26, ''),
(296, 'Meringue 1pc', 26, ''),
(297, 'Pop Rice Round 1pc', 26, ''),
(298, 'Pop Rice Square 1pc', 26, ''),
(299, 'Belicoy 1pc', 26, ''),
(300, 'Bilog 1pc', 26, ''),
(301, 'Bocarilyo 1pc', 26, ''),
(302, 'Peanut Butter Small', 27, ''),
(303, 'Peanut Butter Medium', 27, ''),
(304, 'Peanut Butter Tall', 27, ''),
(305, 'Strawberry Jelly Small', 27, ''),
(306, 'Strawberry Jelly Big', 27, ''),
(307, 'Strawberry Buo Big', 27, ''),
(308, 'Strawberry Buo Small', 27, ''),
(309, 'Paminta 15s ', 28, ''),
(310, 'Paminta Ground 20g', 28, ''),
(311, 'Paminta Crack 20g', 28, ''),
(312, 'Paminta Whole 20g', 28, ''),
(313, 'Laurel 20g', 28, ''),
(314, 'Fried Garlic 100g', 28, ''),
(315, 'Curry Powder 200g', 28, ''),
(316, 'Colored Sprinkles 200g', 29, ''),
(317, 'Choco Sprinkles 200g', 29, ''),
(318, 'Choco Lentils 100g', 29, ''),
(319, 'Caster Sugar 50g', 29, ''),
(320, 'Baking Soda 250g', 29, ''),
(321, 'Star and Heart 100g', 30, ''),
(322, 'Mini MM 100g', 30, ''),
(323, 'Mallows 100g', 30, ''),
(324, 'Snake 100g', 30, ''),
(325, 'Catterpillar 100g', 30, ''),
(326, 'Melon 100g', 30, ''),
(327, 'Black Beans 250g', 31, ''),
(328, 'White Beans 250g', 31, ''),
(329, 'Red Beans 250g', 31, ''),
(330, 'Mongo Buo 250g', 31, ''),
(331, 'Mongo Split 250g', 31, ''),
(332, 'Bihon 1pc', 32, ''),
(333, 'Macaroni Twist 500g', 32, ''),
(334, 'Macaroni Shell 500g', 32, '');

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
(278, 'Baguio', 'Enabled', '38'),
(278, 'Pangasinan', 'Enabled', '38'),
(279, 'Baguio', 'Enabled', '38'),
(279, 'Pangasinan', 'Enabled', '38'),
(280, 'Baguio', 'Enabled', '38'),
(280, 'Pangasinan', 'Enabled', '38'),
(281, 'Baguio', 'Enabled', '38'),
(281, 'Pangasinan', 'Enabled', '38'),
(282, 'Baguio', 'Enabled', '38'),
(282, 'Pangasinan', 'Enabled', '38'),
(284, 'Baguio', 'Enabled', '32'),
(284, 'Pangasinan', 'Enabled', '36'),
(285, 'Baguio', 'Enabled', '78'),
(285, 'Pangasinan', 'Enabled', '78'),
(286, 'Baguio', 'Enabled', '40'),
(286, 'Pangasinan', 'Enabled', '40'),
(287, 'Baguio', 'Enabled', '70'),
(287, 'Pangasinan', 'Enabled', '70'),
(288, 'Baguio', 'Enabled', '39'),
(288, 'Pangasinan', 'Enabled', '39'),
(289, 'Baguio', 'Enabled', '70'),
(289, 'Pangasinan', 'Enabled', '70'),
(290, 'Baguio', 'Enabled', '40'),
(290, 'Pangasinan', 'Enabled', '40'),
(291, 'Baguio', 'Enabled', '36'),
(291, 'Pangasinan', 'Enabled', '36'),
(292, 'Baguio', 'Enabled', '36'),
(292, 'Pangasinan', 'Enabled', '36'),
(293, 'Baguio', 'Enabled', '36'),
(293, 'Pangasinan', 'Enabled', '36'),
(294, 'Baguio', 'Enabled', '4.5'),
(294, 'Pangasinan', 'Enabled', '4.5'),
(295, 'Baguio', 'Enabled', '9'),
(295, 'Pangasinan', 'Enabled', '9'),
(296, 'Baguio', 'Enabled', '9'),
(296, 'Pangasinan', 'Enabled', '9'),
(297, 'Baguio', 'Enabled', '9'),
(297, 'Pangasinan', 'Enabled', '9'),
(298, 'Baguio', 'Enabled', '9'),
(298, 'Pangasinan', 'Enabled', '9'),
(299, 'Baguio', 'Enabled', '8.5'),
(299, 'Pangasinan', 'Enabled', '8.5'),
(300, 'Baguio', 'Enabled', '8.5'),
(300, 'Pangasinan', 'Enabled', '8.5'),
(301, 'Baguio', 'Enabled', '8.5'),
(301, 'Pangasinan', 'Enabled', '8.5'),
(302, 'Baguio', 'Enabled', '47'),
(302, 'Pangasinan', 'Enabled', '47'),
(303, 'Baguio', 'Enabled', '81'),
(303, 'Pangasinan', 'Enabled', '81'),
(304, 'Baguio', 'Enabled', '70'),
(304, 'Pangasinan', 'Enabled', '70'),
(305, 'Baguio', 'Enabled', '35'),
(305, 'Pangasinan', 'Enabled', '35'),
(306, 'Baguio', 'Enabled', '48'),
(306, 'Pangasinan', 'Enabled', '48'),
(307, 'Baguio', 'Enabled', '87'),
(307, 'Pangasinan', 'Enabled', '87'),
(308, 'Baguio', 'Enabled', '53'),
(308, 'Pangasinan', 'Enabled', '53'),
(309, 'Baguio', 'Enabled', '9.5'),
(309, 'Pangasinan', 'Enabled', '9.5'),
(310, 'Baguio', 'Enabled', '18'),
(310, 'Pangasinan', 'Enabled', '18'),
(311, 'Baguio', 'Enabled', '18'),
(311, 'Pangasinan', 'Enabled', '18'),
(312, 'Baguio', 'Enabled', '18'),
(312, 'Pangasinan', 'Enabled', '18'),
(313, 'Baguio', 'Enabled', '14'),
(313, 'Pangasinan', 'Enabled', '14'),
(314, 'Baguio', 'Enabled', '25'),
(314, 'Pangasinan', 'Enabled', '25'),
(315, 'Baguio', 'Enabled', '65'),
(315, 'Pangasinan', 'Enabled', '65'),
(316, 'Baguio', 'Enabled', '37.5'),
(316, 'Pangasinan', 'Enabled', '37.3'),
(317, 'Baguio', 'Enabled', '43'),
(317, 'Pangasinan', 'Enabled', '43'),
(318, 'Baguio', 'Enabled', '57'),
(318, 'Pangasinan', 'Enabled', '57'),
(319, 'Baguio', 'Enabled', '57'),
(319, 'Pangasinan', 'Enabled', '57'),
(320, 'Baguio', 'Enabled', '18.5'),
(320, 'Pangasinan', 'Enabled', '18.5'),
(321, 'Baguio', 'Enabled', '20'),
(321, 'Pangasinan', 'Enabled', '20'),
(322, 'Baguio', 'Enabled', '20'),
(322, 'Pangasinan', 'Enabled', '20'),
(323, 'Baguio', 'Enabled', '20'),
(323, 'Pangasinan', 'Enabled', '20'),
(324, 'Baguio', 'Enabled', '20'),
(324, 'Pangasinan', 'Enabled', '20'),
(325, 'Baguio', 'Enabled', '20'),
(325, 'Pangasinan', 'Enabled', '20'),
(326, 'Baguio', 'Enabled', '20'),
(326, 'Pangasinan', 'Enabled', '20'),
(327, 'Baguio', 'Enabled', '23.5'),
(327, 'Pangasinan', 'Enabled', '23.5'),
(328, 'Baguio', 'Enabled', '23.5'),
(328, 'Pangasinan', 'Enabled', '23.5'),
(329, 'Baguio', 'Enabled', '32.5'),
(329, 'Pangasinan', 'Enabled', '32.5'),
(330, 'Baguio', 'Enabled', '25.5'),
(330, 'Pangasinan', 'Enabled', '25.5'),
(331, 'Baguio', 'Enabled', '25.5'),
(331, 'Pangasinan', 'Enabled', '25.5'),
(332, 'Baguio', 'Enabled', '25.85'),
(332, 'Pangasinan', 'Enabled', '25.85'),
(333, 'Baguio', 'Enabled', '27.5'),
(333, 'Pangasinan', 'Enabled', '27.5'),
(334, 'Baguio', 'Enabled', '27.5'),
(334, 'Pangasinan', 'Enabled', '27.5');

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

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
