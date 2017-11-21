-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 03, 2017 at 07:32 AM
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
  `security_key` varchar(45) NOT NULL,
  PRIMARY KEY (`acc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`acc_id`, `username`, `first_name`, `last_name`, `password`, `email`, `contact_no`, `status`, `branch`, `acctype`, `security_key`) VALUES
(1, 'res', 'res', 'res', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'res@email.com', '753153', 'Enabled', 'Baguio', 'Bookkeeper', ''),
(2, 'mark', 'mark', 'abad', '3b4f122b181aeef98042c4219b554f4d76934f125c0c183494e9fa909f5f249e0ccfbd626da5851e904d5b8f66e29dbe819d2ba4fd2439f53462caaed4eeee90', 'markk@gmail.com', '123123213', 'Disabled', 'Pangasinan', 'User', ''),
(3, 'testAdmin', 'test', 'testing', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', 'test@email.com', '09999999999', 'Enabled', 'Baguio', 'User', ''),
(4, 'test', 'test', 'testing', 'd404559f602eab6fd602ac7680dacbfaadd13630335e951f097af3900e9de176b6db28512f2e000b9d04fba5133e8b1c6e8df59db3a8ab9d60be4b97cc9e81db', 'test@yahoo.com', '09173968691', 'Enabled', 'Pangasinan', 'Admin', '');

-- --------------------------------------------------------

--
-- Table structure for table `bad_order`
--

DROP TABLE IF EXISTS `bad_order`;
CREATE TABLE IF NOT EXISTS `bad_order` (
  `bo_id` int(15) NOT NULL AUTO_INCREMENT,
  `bo_price` int(20) NOT NULL,
  `bo_dateReleased` datetime(6) NOT NULL,
  `bo_quantity` int(10) NOT NULL,
  `bo_product_id` int(10) NOT NULL,
  `bo_issueid` int(15) DEFAULT NULL,
  PRIMARY KEY (`bo_id`),
  KEY `product_id_idx` (`bo_product_id`),
  KEY `bo_issueid_idx` (`bo_issueid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bad_order_list`
--

DROP TABLE IF EXISTS `bad_order_list`;
CREATE TABLE IF NOT EXISTS `bad_order_list` (
  `bo_id` int(15) NOT NULL,
  `prod_qty` int(15) NOT NULL,
  `prod_price` int(15) NOT NULL,
  `branch` varchar(20) NOT NULL,
  `remarks` varchar(200) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`category_id`, `category_name`, `category_status`) VALUES
(13, 'Specialty', 'Enabled'),
(14, 'Sweets', 'Enabled'),
(15, 'JamAndJellies', 'Enabled'),
(16, 'Condiments', 'Enabled'),
(17, 'Baking', 'Enabled'),
(18, 'testCategory', 'Enabled');

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
  PRIMARY KEY (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`c_id`, `c_name`, `c_address`, `c_location`) VALUES
(18, 'asd', 'baguio', 'Baguio'),
(19, 'SM pangasinan', 'pangasinan', 'Pangasinan'),
(20, 'tsiongsan baguio', 'baguio', 'Baguio'),
(21, 'tsiongsan pangasinan', 'pangasinan', 'Pangasinan'),
(26, 'sm20', 'asd', 'Baguio'),
(27, 'smde', 'asdasd', 'Pangasinan'),
(30, 'sma', 'fghjkasda', 'Baguio'),
(31, 'sma', 'ajs', 'Pangasinan'),
(32, 'tiongsan', 'harrison road', 'Baguio');

-- --------------------------------------------------------

--
-- Table structure for table `client_contact`
--

DROP TABLE IF EXISTS `client_contact`;
CREATE TABLE IF NOT EXISTS `client_contact` (
  `contact_clientid` int(11) NOT NULL,
  `contact_name` varchar(45) DEFAULT NULL,
  `contact_number` int(50) DEFAULT NULL,
  KEY `contact_clientid_idx` (`contact_clientid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_contact`
--

INSERT INTO `client_contact` (`contact_clientid`, `contact_name`, `contact_number`) VALUES
(18, 'alex', 1234567899),
(19, 'rai', 1234567899),
(20, 'Michael', 321546888),
(21, 'rull', 359877544),
(26, 'asd', 32),
(27, 'asdasd', 23423),
(26, 'asd', 342),
(30, 'asdasd', 567890),
(31, 'assdasd', 34),
(32, 'Abad', 6070488);

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
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`iS_inventoryid`, `iS_product_id`, `iS_restock_lvl`, `iS_quantity`, `iS_location`) VALUES
(18, 241, 20, 101, 'Baguio'),
(19, 241, 30, 20, 'Pangasinan'),
(20, 242, 30, 54, 'Baguio'),
(21, 242, 30, 65, 'Pangasinan'),
(22, 243, 30, 24, 'Baguio'),
(23, 243, 30, 87, 'Pangasinan'),
(24, 244, 30, 66, 'Baguio'),
(25, 244, 30, 57, 'Pangasinan'),
(26, 245, 30, 8, 'Baguio'),
(27, 245, 30, 54, 'Pangasinan'),
(28, 246, 30, 22, 'Baguio'),
(29, 246, 30, 78, 'Pangasinan'),
(30, 247, 30, 64, 'Baguio'),
(31, 247, 30, 54, 'Pangasinan'),
(32, 248, 30, 75, 'Baguio'),
(33, 248, 30, 54, 'Pangasinan'),
(34, 249, 30, 79, 'Baguio'),
(35, 249, 30, 78, 'Pangasinan'),
(36, 250, 30, 38, 'Baguio'),
(37, 250, 30, 75, 'Pangasinan'),
(38, 251, 30, 64, 'Baguio'),
(39, 251, 30, 73, 'Pangasinan'),
(40, 252, 30, 28, 'Baguio'),
(41, 252, 30, 97, 'Pangasinan'),
(42, 253, 30, 43, 'Baguio'),
(43, 253, 30, 86, 'Pangasinan'),
(44, 254, 30, 95, 'Baguio'),
(45, 254, 30, 88, 'Pangasinan'),
(46, 255, 30, 64, 'Baguio'),
(47, 255, 30, 57, 'Pangasinan'),
(48, 256, 30, 85, 'Baguio'),
(49, 256, 30, 86, 'Pangasinan'),
(50, 257, 30, 75, 'Baguio'),
(51, 257, 30, 25, 'Pangasinan'),
(52, 258, 30, 9, 'Baguio'),
(53, 258, 30, 54, 'Pangasinan'),
(54, 259, 30, 87, 'Baguio'),
(55, 259, 30, 64, 'Pangasinan'),
(56, 260, 30, 55, 'Baguio'),
(57, 260, 30, 24, 'Pangasinan'),
(58, 261, 30, 75, 'Baguio'),
(59, 261, 30, 85, 'Pangasinan'),
(60, 262, 30, 64, 'Baguio'),
(61, 262, 30, 31, 'Pangasinan'),
(62, 263, 30, 27, 'Baguio'),
(63, 263, 30, 82, 'Pangasinan'),
(64, 264, 30, 57, 'Baguio'),
(65, 264, 30, 75, 'Pangasinan'),
(66, 265, 31, 54, 'Baguio'),
(67, 265, 30, 58, 'Pangasinan'),
(68, 266, 20, 5, 'Baguio'),
(69, 266, 20, 0, 'Pangasinan');

-- --------------------------------------------------------

--
-- Table structure for table `issuance`
--

DROP TABLE IF EXISTS `issuance`;
CREATE TABLE IF NOT EXISTS `issuance` (
  `issue_id` int(15) NOT NULL AUTO_INCREMENT,
  `issue_date_time` datetime(6) NOT NULL,
  `issue_account` int(12) DEFAULT NULL,
  `issue_type` varchar(45) NOT NULL,
  `remarks` varchar(45) DEFAULT NULL,
  `other_clients` varchar(45) DEFAULT NULL,
  `penthouse_clients` varchar(45) DEFAULT NULL,
  `client_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`issue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `issuance`
--

INSERT INTO `issuance` (`issue_id`, `issue_date_time`, `issue_account`, `issue_type`, `remarks`, `other_clients`, `penthouse_clients`, `client_id`) VALUES
(1, '2017-10-10 18:42:16.000000', 1, '', 'jhkjhj', NULL, NULL, '18'),
(2, '2017-10-10 18:53:12.000000', 1, '', 'none', NULL, NULL, '20'),
(3, '2017-10-10 18:54:24.000000', 1, '', '', NULL, NULL, '27'),
(4, '2017-10-11 03:43:59.000000', 1, '', 'testing', NULL, NULL, '32');

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
  `remarks` varchar(200) DEFAULT NULL,
  KEY `FK_issuancelist_productlist_idx` (`prod_id`),
  KEY `issue_id_idx` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `issuance_list`
--

INSERT INTO `issuance_list` (`issue_id`, `prod_qty`, `prod_price`, `branch`, `prod_id`, `remarks`) VALUES
(1, 6, 3, 'Baguio', 245, 'yes'),
(2, 20, 50, 'Baguio', 241, 'minus 20'),
(3, 5, 35, 'Pangasinan', 241, 'minus 5 pang'),
(4, 10, 42, 'Baguio', 245, 'test vigan'),
(4, 10, 38, 'Baguio', 241, 'test beef');

-- --------------------------------------------------------

--
-- Table structure for table `ledger`
--

DROP TABLE IF EXISTS `ledger`;
CREATE TABLE IF NOT EXISTS `ledger` (
  `ledger_id` int(10) NOT NULL AUTO_INCREMENT,
  `ledger_date` date NOT NULL,
  `ledger_in` int(10) NOT NULL,
  `ledger_out` int(10) NOT NULL,
  `ledger_product_id` int(15) NOT NULL,
  PRIMARY KEY (`ledger_id`),
  KEY `FK_ledger_product_list_idx` (`ledger_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
CREATE TABLE IF NOT EXISTS `logs` (
  `logs_id` int(15) NOT NULL AUTO_INCREMENT,
  `acc_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `act` varchar(15) NOT NULL,
  `date_time` datetime(6) NOT NULL,
  `related_id` int(15) NOT NULL,
  `remarks` varchar(20) NOT NULL,
  PRIMARY KEY (`logs_id`),
  KEY `acc_id_idx` (`acc_id`)
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
  PRIMARY KEY (`productList_id`),
  KEY `FK_product_list_category_idx` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`productList_id`, `productList_name`, `category_id`) VALUES
(241, 'Beef', 13),
(242, 'Chicken', 13),
(243, 'De Recado', 13),
(244, 'Hamonado', 13),
(245, 'Vigan', 13),
(246, 'Puto Seco', 14),
(247, 'Long Rice', 14),
(248, 'Meringue', 14),
(249, 'Pop Rice Square', 14),
(250, 'Pop Rice Roun', 14),
(251, 'Peanut Butter (small)', 15),
(252, 'Strawberry  Jelly', 15),
(253, 'Strawberry Buo', 15),
(254, 'Honey', 15),
(255, 'Peanut Butter (Tall)', 15),
(256, 'Paminta', 16),
(257, 'Laurel', 16),
(258, 'Garlic Fried', 16),
(259, 'Curry Powder', 16),
(260, 'Star Anis', 16),
(261, 'Colored Sprinkle', 17),
(262, 'Choco Lentils', 17),
(263, 'Caster Sugar', 17),
(264, 'Icing Sugar', 17),
(265, 'Baking Soy', 13),
(266, 'testProduct', 13);

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
  `barcode` varchar(45) DEFAULT NULL,
  KEY `prod_id_idx` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_loc`
--

INSERT INTO `product_loc` (`product_id`, `location`, `status`, `altprice`, `barcode`) VALUES
(241, 'Baguio', 'Enabled', '38', '2125'),
(241, 'Pangasinan', 'Enabled', '40', '2125'),
(242, 'Baguio', 'Enabled', '38', ''),
(242, 'Pangasinan', 'Enabled', '40', ''),
(243, 'Baguio', 'Enabled', '38', ''),
(243, 'Pangasinan', 'Enabled', '40', ''),
(244, 'Baguio', 'Enabled', '40', ''),
(244, 'Pangasinan', 'Enabled', '42', ''),
(245, 'Baguio', 'Enabled', '40', ''),
(245, 'Pangasinan', 'Enabled', '42', ''),
(246, 'Baguio', 'Enabled', '4.5', ''),
(246, 'Pangasinan', 'Enabled', '5', ''),
(247, 'Baguio', 'Enabled', '9', ''),
(247, 'Pangasinan', 'Enabled', '10', ''),
(248, 'Baguio', 'Enabled', '9', ''),
(248, 'Pangasinan', 'Enabled', '10', ''),
(249, 'Baguio', 'Enabled', '9', ''),
(249, 'Pangasinan', 'Enabled', '9', ''),
(250, 'Baguio', 'Enabled', '9', ''),
(250, 'Pangasinan', 'Enabled', '10', ''),
(251, 'Baguio', 'Enabled', '47', ''),
(251, 'Pangasinan', 'Enabled', '50', ''),
(252, 'Baguio', 'Enabled', '48', ''),
(252, 'Pangasinan', 'Enabled', '50', ''),
(253, 'Baguio', 'Enabled', '87', ''),
(253, 'Pangasinan', 'Enabled', '90', ''),
(254, 'Baguio', 'Enabled', '82', ''),
(254, 'Pangasinan', 'Enabled', '85', ''),
(255, 'Baguio', 'Enabled', '81', ''),
(255, 'Pangasinan', 'Enabled', '84', ''),
(256, 'Baguio', 'Disabled', '18', ''),
(256, 'Pangasinan', 'Disabled', '19', ''),
(257, 'Baguio', 'Enabled', '9.5', ''),
(257, 'Pangasinan', 'Enabled', '10', ''),
(258, 'Baguio', 'Enabled', '22', ''),
(258, 'Pangasinan', 'Enabled', '23', ''),
(259, 'Baguio', 'Enabled', '18.5', ''),
(259, 'Pangasinan', 'Enabled', '19', ''),
(260, 'Baguio', 'Enabled', '27.5', ''),
(260, 'Pangasinan', 'Enabled', '28', ''),
(261, 'Baguio', 'Enabled', '43', ''),
(261, 'Pangasinan', 'Enabled', '44', ''),
(262, 'Baguio', 'Enabled', '30', ''),
(262, 'Pangasinan', 'Enabled', '31', ''),
(263, 'Baguio', 'Enabled', '57', ''),
(263, 'Pangasinan', 'Enabled', '58', ''),
(264, 'Baguio', 'Enabled', '57', ''),
(264, 'Pangasinan', 'Enabled', '58', ''),
(265, 'Baguio', 'Enabled', '17', '1111111'),
(265, 'Pangasinan', 'Disabled', '21', '1111111'),
(266, 'Baguio', 'Enabled', '10', ''),
(266, 'Pangasinan', 'Enabled', '12', '');

-- --------------------------------------------------------

--
-- Table structure for table `pull_out`
--

DROP TABLE IF EXISTS `pull_out`;
CREATE TABLE IF NOT EXISTS `pull_out` (
  `po_id` int(10) NOT NULL AUTO_INCREMENT,
  `po_price` int(10) NOT NULL,
  `po_qty` int(10) NOT NULL,
  `po_remarks` varchar(10) NOT NULL,
  `po_date` datetime NOT NULL,
  `po_product_id` int(15) NOT NULL,
  `po_issueid` int(15) NOT NULL,
  PRIMARY KEY (`po_id`),
  KEY `FK_pull_out_product_list_idx` (`po_product_id`),
  KEY `po_issueid_idx` (`po_issueid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pull_out_list`
--

DROP TABLE IF EXISTS `pull_out_list`;
CREATE TABLE IF NOT EXISTS `pull_out_list` (
  `po_id` int(15) NOT NULL,
  `prod_qty` int(15) NOT NULL,
  `prod_price` int(15) NOT NULL,
  `branch` varchar(20) NOT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  KEY `po_id_idx` (`po_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustments`
--

DROP TABLE IF EXISTS `stock_adjustments`;
CREATE TABLE IF NOT EXISTS `stock_adjustments` (
  `sA_id` int(15) NOT NULL AUTO_INCREMENT,
  `sA_product_id` int(15) NOT NULL,
  `sA_qty` int(10) NOT NULL,
  `sA_remarks` varchar(10) NOT NULL,
  `sA_in` int(15) NOT NULL,
  `sA_out` int(15) NOT NULL,
  PRIMARY KEY (`sA_id`),
  KEY `FK_stock_adjustments_product_idx` (`sA_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock_transfer`
--

DROP TABLE IF EXISTS `stock_transfer`;
CREATE TABLE IF NOT EXISTS `stock_transfer` (
  `sT_id` int(10) NOT NULL AUTO_INCREMENT,
  `sT_price` int(10) NOT NULL,
  `sT_qty` int(10) NOT NULL,
  `sT_branch` text NOT NULL,
  `sT_product_id` int(15) NOT NULL,
  PRIMARY KEY (`sT_id`),
  KEY `FK_stock_transfer_product_list_idx` (`sT_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bad_order`
--
ALTER TABLE `bad_order`
  ADD CONSTRAINT `bo_issueid` FOREIGN KEY (`bo_issueid`) REFERENCES `issuance` (`issue_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `bo_product_id` FOREIGN KEY (`bo_product_id`) REFERENCES `product_list` (`productList_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `bad_order_list`
--
ALTER TABLE `bad_order_list`
  ADD CONSTRAINT `bo_id` FOREIGN KEY (`bo_id`) REFERENCES `bad_order` (`bo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `client_contact`
--
ALTER TABLE `client_contact`
  ADD CONSTRAINT `contact_clientid` FOREIGN KEY (`contact_clientid`) REFERENCES `clients` (`c_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

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
-- Constraints for table `ledger`
--
ALTER TABLE `ledger`
  ADD CONSTRAINT `ledger_product_id` FOREIGN KEY (`ledger_id`) REFERENCES `product_list` (`productList_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `acc_id` FOREIGN KEY (`acc_id`) REFERENCES `accounts` (`acc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Constraints for table `pull_out`
--
ALTER TABLE `pull_out`
  ADD CONSTRAINT `po_issueid` FOREIGN KEY (`po_issueid`) REFERENCES `issuance` (`issue_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `po_product_id` FOREIGN KEY (`po_product_id`) REFERENCES `product_list` (`productList_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `pull_out_list`
--
ALTER TABLE `pull_out_list`
  ADD CONSTRAINT `po_id` FOREIGN KEY (`po_id`) REFERENCES `pull_out` (`po_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stock_adjustments`
--
ALTER TABLE `stock_adjustments`
  ADD CONSTRAINT `sA_product_id` FOREIGN KEY (`sA_product_id`) REFERENCES `product_list` (`productList_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `stock_transfer`
--
ALTER TABLE `stock_transfer`
  ADD CONSTRAINT `sT_product_id` FOREIGN KEY (`sT_product_id`) REFERENCES `product_list` (`productList_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
