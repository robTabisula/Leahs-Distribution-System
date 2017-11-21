-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 04, 2017 at 02:07 AM
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
  `email` varchar(20) NOT NULL,
  `contact_no` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'Disabled',
  `branch` varchar(50) DEFAULT NULL,
  `acctype` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`acc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`acc_id`, `username`, `first_name`, `last_name`, `password`, `email`, `contact_no`, `status`, `branch`, `acctype`) VALUES
(1, 'res', 'res', 'res', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'res@email.com', '753153', 'Enabled', 'Pangasinan', NULL);

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
-- Table structure for table `category_list`
--

DROP TABLE IF EXISTS `category_list`;
CREATE TABLE IF NOT EXISTS `category_list` (
  `category_id` int(15) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(100) NOT NULL,
  `category_status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `issuance`
--

DROP TABLE IF EXISTS `issuance`;
CREATE TABLE IF NOT EXISTS `issuance` (
  `issue_id` int(15) NOT NULL AUTO_INCREMENT,
  `issue_date_time` datetime(6) NOT NULL,
  `issue_account` int(12) DEFAULT NULL,
  `remarks` varchar(45) DEFAULT NULL,
  `other_clients` varchar(45) DEFAULT NULL,
  `penthouse_clients` varchar(45) DEFAULT NULL,
  `client_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`issue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=latin1;

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
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
CREATE TABLE IF NOT EXISTS `request` (
  `request_id` int(12) NOT NULL AUTO_INCREMENT,
  `act` varchar(20) NOT NULL,
  `account_req` int(11) NOT NULL,
  `account_appr` int(11) DEFAULT NULL,
  `date_time` datetime(6) NOT NULL,
  `target` varchar(15) NOT NULL,
  `changed` varchar(20) NOT NULL,
  `remarks` varchar(20) NOT NULL,
  `status` varchar(8) NOT NULL DEFAULT 'pending',
  PRIMARY KEY (`request_id`),
  KEY `account_appr_idx` (`account_appr`),
  KEY `account_req_idx` (`account_req`)
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
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `account_appr` FOREIGN KEY (`account_appr`) REFERENCES `accounts` (`acc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `account_req` FOREIGN KEY (`account_req`) REFERENCES `accounts` (`acc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
