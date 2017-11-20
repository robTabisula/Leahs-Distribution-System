-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2017 at 12:02 PM
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
  `security_key` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `bad_order` (
  `bo_id` int(15) NOT NULL,
  `bo_dateReleased` varchar(50) NOT NULL,
  `bo_issue_account` varchar(200) NOT NULL,
  `bo_remarks` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bad_order`
--

INSERT INTO `bad_order` (`bo_id`, `bo_dateReleased`, `bo_issue_account`, `bo_remarks`) VALUES
(1, 'November 18, 2017, 4:21 am', 'res ', 'test bo'),
(2, 'November 18, 2017, 4:32 am', 'res ', 'bo'),
(3, 'November 18, 2017, 4:35 am', 'res ', 'asdgdf'),
(4, 'November 20, 2017, 7:57 pm', 'res', 'sample bad order');

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
  `po_remarks` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bo_list`
--

INSERT INTO `bo_list` (`bo_id`, `bo_price`, `bo_qty`, `branch`, `bo_product_id`, `po_remarks`) VALUES
(2, 45, 18, 'Baguio', 252, 'tesst bo'),
(3, 8, 10, 'Baguio', 250, '1'),
(3, 11, 4, 'Baguio', 247, '2'),
(4, 45, 18, 'Baguio', 252, '');

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
(18, 'testCategory', 'Enabled');

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `c_id` int(15) NOT NULL,
  `c_name` varchar(20) NOT NULL,
  `c_address` varchar(20) NOT NULL,
  `c_location` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `client_contact` (
  `contact_clientid` int(11) NOT NULL,
  `contact_name` varchar(45) DEFAULT NULL,
  `contact_number` int(50) DEFAULT NULL
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
(18, 241, 20, 86, 'Baguio'),
(19, 241, 30, 5, 'Pangasinan'),
(20, 242, 30, 54, 'Baguio'),
(21, 242, 30, 65, 'Pangasinan'),
(22, 243, 30, 24, 'Baguio'),
(23, 243, 30, 87, 'Pangasinan'),
(24, 244, 30, 10, 'Baguio'),
(25, 244, 30, 57, 'Pangasinan'),
(26, 245, 30, 5, 'Baguio'),
(27, 245, 30, 54, 'Pangasinan'),
(28, 246, 30, 12, 'Baguio'),
(29, 246, 30, 78, 'Pangasinan'),
(30, 247, 30, 0, 'Baguio'),
(31, 247, 30, 54, 'Pangasinan'),
(32, 248, 30, 50, 'Baguio'),
(33, 248, 30, 54, 'Pangasinan'),
(34, 249, 30, 60, 'Baguio'),
(35, 249, 30, 78, 'Pangasinan'),
(36, 250, 30, 20, 'Baguio'),
(37, 250, 30, 75, 'Pangasinan'),
(38, 251, 30, 64, 'Baguio'),
(39, 251, 30, 73, 'Pangasinan'),
(40, 252, 30, 0, 'Baguio'),
(41, 252, 30, 97, 'Pangasinan'),
(42, 253, 30, 20, 'Baguio'),
(43, 253, 30, 86, 'Pangasinan'),
(44, 254, 30, 5, 'Baguio'),
(45, 254, 30, 88, 'Pangasinan'),
(46, 255, 30, 40, 'Baguio'),
(47, 255, 30, 57, 'Pangasinan'),
(48, 256, 30, 85, 'Baguio'),
(49, 256, 30, 86, 'Pangasinan'),
(50, 257, 30, 50, 'Baguio'),
(51, 257, 30, 10, 'Pangasinan'),
(52, 258, 30, -3, 'Baguio'),
(53, 258, 30, 54, 'Pangasinan'),
(54, 259, 30, 60, 'Baguio'),
(55, 259, 30, 64, 'Pangasinan'),
(56, 260, 30, 50, 'Baguio'),
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

CREATE TABLE `issuance` (
  `issue_id` int(15) NOT NULL,
  `issue_date_time` varchar(50) NOT NULL,
  `issue_account` varchar(50) DEFAULT NULL,
  `issue_type` varchar(45) NOT NULL,
  `remarks` varchar(45) DEFAULT NULL,
  `other_clients` varchar(45) DEFAULT NULL,
  `penthouse_clients` varchar(45) DEFAULT NULL,
  `client_id` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `issuance`
--

INSERT INTO `issuance` (`issue_id`, `issue_date_time`, `issue_account`, `issue_type`, `remarks`, `other_clients`, `penthouse_clients`, `client_id`) VALUES
(1, 'November 5, 2017, 9:14 pm', NULL, '1', 'mark', NULL, NULL, '18'),
(2, 'November 5, 2017, 9:18 pm', NULL, '1', 'sample', NULL, NULL, '21'),
(3, 'November 6, 2017, 9:25 pm', NULL, '1', '', NULL, NULL, '18'),
(4, 'November 6, 2017, 9:26 pm', NULL, '1', 'sample', NULL, NULL, '20'),
(5, 'November 6, 2017, 9:27 pm', NULL, '1', 'sample 5', NULL, NULL, '30'),
(6, 'November 6, 2017, 9:46 pm', NULL, '2', 'sample pent', NULL, '30', NULL),
(7, 'November 6, 2017, 9:52 pm', NULL, '2', 'pent admin', NULL, 'test', NULL),
(8, 'November 6, 2017, 9:57 pm', NULL, '2', 'pent sample 3', NULL, '4', NULL),
(9, 'November 14, 2017, 4:40 pm', NULL, '1', 'sample issuance in baguio', NULL, NULL, '18'),
(10, 'November 14, 2017, 4:41 pm', NULL, '2', 'sample penth', NULL, '4', NULL),
(11, 'November 14, 2017, 4:42 pm', NULL, '3', 'sample other issuance', 'cicm', NULL, NULL),
(12, 'November 14, 2017, 4:45 pm', NULL, '4', 'stock transfer sample', NULL, NULL, '18'),
(13, 'November 14, 2017, 4:49 pm', NULL, '1', 'sample  reg issue abag', NULL, NULL, '30'),
(14, 'November 14, 2017, 4:50 pm', NULL, '1', 'issue baguuo', NULL, NULL, '20'),
(15, 'November 14, 2017, 4:55 pm', NULL, '1', '', NULL, NULL, '18'),
(16, 'November 14, 2017, 4:57 pm', NULL, '2', 'pent issue multiple', NULL, '4', NULL),
(17, 'November 16, 2017, 10:21 pm', 'res', '1', '', NULL, NULL, '20');

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
  `prod_remarks` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `issuance_list`
--

INSERT INTO `issuance_list` (`issue_id`, `prod_qty`, `prod_price`, `branch`, `prod_id`, `prod_remarks`) VALUES
(1, 18, 45, 'Baguio', 252, ''),
(2, 15, 38, 'Pangasinan', 241, 'leng in beef must be 5'),
(3, 10, 80, 'Baguio', 254, ''),
(4, 5, 85, 'Baguio', 254, ''),
(5, 3, 35, 'Baguio', 245, ''),
(6, 9, 8, 'Baguio', 249, ''),
(7, 10, 8, 'Baguio', 249, ''),
(8, 3, 80, 'Baguio', 253, ''),
(9, 10, 80, 'Baguio', 253, ''),
(10, 8, 8, 'Baguio', 250, ''),
(11, 5, 25, 'Baguio', 260, ''),
(12, 4, 80, 'Baguio', 255, ''),
(13, 20, 45, 'Baguio', 244, ''),
(14, 5, 35, 'Baguio', 241, ''),
(15, 10, 8, 'Baguio', 250, ''),
(15, 4, 11, 'Baguio', 247, ''),
(16, 10, 82, 'Baguio', 255, ''),
(16, 20, 8, 'Baguio', 248, ''),
(17, 60, 9, 'Baguio', 247, ''),
(17, 10, 48, 'Baguio', 252, '');

-- --------------------------------------------------------

--
-- Table structure for table `ledger`
--

CREATE TABLE `ledger` (
  `ledger_id` int(10) NOT NULL,
  `ledger_date` date NOT NULL,
  `ledger_in` int(10) NOT NULL,
  `ledger_out` int(10) NOT NULL,
  `ledger_product_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `logs_id` int(15) NOT NULL,
  `acc_id` int(11) NOT NULL,
  `act_type` varchar(15) NOT NULL,
  `date_time` varchar(30) NOT NULL,
  `related_id` int(15) DEFAULT NULL,
  `remarks` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`logs_id`, `acc_id`, `act_type`, `date_time`, `related_id`, `remarks`) VALUES
(1, 1, 'login', 'November 6, 2017, 9:45 am', NULL, 'has successfully login'),
(2, 1, 'login', 'November 6, 2017, 8:38 pm', NULL, 'has successfully login'),
(3, 1, 'login', 'November 14, 2017, 4:27 pm', NULL, 'has successfully login'),
(4, 1, 'login', 'November 16, 2017, 10:17 pm', NULL, 'has successfully login'),
(5, 1, 'login', 'November 18, 2017, 4:30 am', NULL, 'has successfully login'),
(6, 1, 'login', 'November 19, 2017, 9:02 pm', NULL, 'has successfully login'),
(7, 1, 'login', 'November 20, 2017, 7:19 pm', NULL, 'has successfully login');

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
  `po_remarks` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `po_list`
--

INSERT INTO `po_list` (`po_id`, `po_price`, `po_qty`, `branch`, `po_product_id`, `po_remarks`) VALUES
(7, 45, 18, 'Baguio', 252, '7'),
(8, 9, 60, 'Baguio', 247, ''),
(8, 48, 10, 'Baguio', 252, ''),
(9, 8, 10, 'Baguio', 250, ''),
(9, 11, 4, 'Baguio', 247, ''),
(10, 8, 10, 'Baguio', 250, 'test1'),
(10, 11, 4, 'Baguio', 247, 'test 2'),
(11, 8, 5, 'Baguio', 250, '');

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `productList_id` int(15) NOT NULL,
  `productList_name` varchar(50) DEFAULT NULL,
  `category_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

CREATE TABLE `product_loc` (
  `product_id` int(15) NOT NULL,
  `location` varchar(50) NOT NULL,
  `status` varchar(45) NOT NULL,
  `altprice` varchar(45) DEFAULT NULL,
  `barcode` varchar(45) DEFAULT NULL
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

CREATE TABLE `pull_out` (
  `po_id` int(10) NOT NULL,
  `po_date` varchar(50) NOT NULL,
  `po_issue_account` varchar(200) NOT NULL,
  `po_remarks` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pull_out`
--

INSERT INTO `pull_out` (`po_id`, `po_date`, `po_issue_account`, `po_remarks`) VALUES
(1, 'November 17, 2017, 2:08 am', 'res', 'test'),
(2, 'November 17, 2017, 2:11 am', 'res', ''),
(3, 'November 17, 2017, 2:12 am', 'res', ''),
(4, 'November 17, 2017, 2:15 am', 'res', '4'),
(5, 'November 17, 2017, 2:18 am', 'res', '4'),
(6, 'November 17, 2017, 2:19 am', 'res', '6'),
(7, 'November 17, 2017, 2:28 am', 'res', '7'),
(8, 'November 17, 2017, 2:29 am', 'res', '8'),
(9, 'November 18, 2017, 3:52 am', 'res ', ''),
(10, 'November 18, 2017, 4:34 am', 'res ', 'asd'),
(11, 'November 19, 2017, 1:12 am', 'res', '');

-- --------------------------------------------------------

--
-- Table structure for table `purchased_order`
--

CREATE TABLE `purchased_order` (
  `order_id` int(50) NOT NULL,
  `order_date` varchar(50) NOT NULL,
  `client_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchased_order`
--

INSERT INTO `purchased_order` (`order_id`, `order_date`, `client_id`) VALUES
(4, 'November 19, 2017, 9:40 pm', 20);

-- --------------------------------------------------------

--
-- Table structure for table `purchased_order_list`
--

CREATE TABLE `purchased_order_list` (
  `p_order_id` int(50) NOT NULL,
  `order_qty` int(10) NOT NULL,
  `branch` varchar(10) NOT NULL,
  `prdct_id` int(15) NOT NULL,
  `order_remarks` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchased_order_list`
--

INSERT INTO `purchased_order_list` (`p_order_id`, `order_qty`, `branch`, `prdct_id`, `order_remarks`) VALUES
(4, 12, 'Baguio', 243, ''),
(4, 121, 'Baguio', 248, '');

-- --------------------------------------------------------

--
-- Table structure for table `stock_adjustments`
--

CREATE TABLE `stock_adjustments` (
  `sA_id` int(15) NOT NULL,
  `sA_product_id` int(15) NOT NULL,
  `sA_qty` int(10) NOT NULL,
  `sA_remarks` varchar(10) NOT NULL,
  `sA_in` int(15) NOT NULL,
  `sA_out` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stock_transfer`
--

CREATE TABLE `stock_transfer` (
  `sT_id` int(10) NOT NULL,
  `sT_price` int(10) NOT NULL,
  `sT_qty` int(10) NOT NULL,
  `sT_branch` text NOT NULL,
  `sT_product_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Indexes for table `client_contact`
--
ALTER TABLE `client_contact`
  ADD KEY `contact_clientid_idx` (`contact_clientid`);

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
-- Indexes for table `ledger`
--
ALTER TABLE `ledger`
  ADD PRIMARY KEY (`ledger_id`),
  ADD KEY `FK_ledger_product_list_idx` (`ledger_product_id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`logs_id`),
  ADD KEY `acc_id_idx` (`acc_id`);

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
-- Indexes for table `stock_adjustments`
--
ALTER TABLE `stock_adjustments`
  ADD PRIMARY KEY (`sA_id`),
  ADD KEY `FK_stock_adjustments_product_idx` (`sA_product_id`);

--
-- Indexes for table `stock_transfer`
--
ALTER TABLE `stock_transfer`
  ADD PRIMARY KEY (`sT_id`),
  ADD KEY `FK_stock_transfer_product_list_idx` (`sT_product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `acc_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `bad_order`
--
ALTER TABLE `bad_order`
  MODIFY `bo_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `category_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `c_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `iS_inventoryid` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
--
-- AUTO_INCREMENT for table `issuance`
--
ALTER TABLE `issuance`
  MODIFY `issue_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `ledger`
--
ALTER TABLE `ledger`
  MODIFY `ledger_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `logs_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `productList_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=267;
--
-- AUTO_INCREMENT for table `pull_out`
--
ALTER TABLE `pull_out`
  MODIFY `po_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `purchased_order`
--
ALTER TABLE `purchased_order`
  MODIFY `order_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `stock_adjustments`
--
ALTER TABLE `stock_adjustments`
  MODIFY `sA_id` int(15) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `stock_transfer`
--
ALTER TABLE `stock_transfer`
  MODIFY `sT_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bo_list`
--
ALTER TABLE `bo_list`
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
