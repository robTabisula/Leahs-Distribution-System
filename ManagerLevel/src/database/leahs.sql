-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2017 at 12:14 PM
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
(2, 'mark', 'Mark', 'Abad', '3b4f122b181aeef98042c4219b554f4d76934f125c0c183494e9fa909f5f249e0ccfbd626da5851e904d5b8f66e29dbe819d2ba4fd2439f53462caaed4eeee90', 'markk@gmail.com', '123123213', 'Enabled', 'Baguio', 'Admin', ''),
(6, 'rai', 'Michael', 'Angelo', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'rai@gmail.com', '09172899011', 'Disabled', 'Pangasinan', 'Manager', NULL),
(7, 'alex', 'Alex', 'Rull', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'ahlex@yahoo.com', '09128281234', 'Disabled', 'Baguio', 'Secretary', NULL),
(8, 'rajja', 'Rajja', 'Mecca', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'rajja@google.com', '09128222133', 'Disabled', 'Pangasinan', 'Secretary', NULL),
(9, 'robijn', 'Robijn', 'Tabisula', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'rob@popup.com', '09012121214', 'Disabled', 'Pangasinan', 'Admin', NULL);

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
(1, 'November 18, 2017, 4:21 am', 'res ', 0, 'test bo'),
(2, 'November 18, 2017, 4:32 am', 'res ', 0, 'bo sample'),
(3, 'November 18, 2017, 4:35 am', 'res ', 0, 'test 123'),
(4, 'November 20, 2017, 7:57 pm', 'res', 0, 'sample bad order'),
(5, 'November 21, 2017, 3:20 am', 'mark', NULL, '');

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
(4, 45, 18, 'Baguio', 252, ''),
(5, 38, 10, 'Pangasinan', 241, '');

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
  `c_location` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`c_id`, `c_name`, `c_address`, `c_location`) VALUES
(18, 'Harison TS', 'Harrison Rd', 'Baguio'),
(19, 'SM pangasinan', 'Sison', 'Pangasinan'),
(20, 'Tsiongsan LT', 'La Trinindad', 'Baguio'),
(21, 'Tsiongsan Pangasinan', 'Pangasinan Area', 'Pangasinan'),
(26, 'Save Less', 'Marcos Highway', 'Baguio'),
(27, 'Sari Sari', 'Kanto', 'Pangasinan'),
(30, 'James and Juliet', 'Bakakeng', 'Baguio'),
(31, 'Sa Bahay', 'Rosario', 'Pangasinan'),
(32, 'Tiongsan Mabini', 'Mabini Highway', 'Baguio'),
(35, 'Victoria', 'Gen Luna Rd', 'Baguio'),
(36, 'Uno', 'Magsaysay', 'Baguio');

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
(32, 'Abad', 6070488),
(35, 'Vic', 92192121),
(36, 'mark', 90190129);

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
(23, 243, 30, 80, 'Pangasinan'),
(24, 244, 30, 10, 'Baguio'),
(25, 244, 30, 57, 'Pangasinan'),
(26, 245, 30, 5, 'Baguio'),
(27, 245, 30, 54, 'Pangasinan'),
(28, 246, 30, 10, 'Baguio'),
(29, 246, 30, 78, 'Pangasinan'),
(30, 247, 30, 0, 'Baguio'),
(31, 247, 30, 54, 'Pangasinan'),
(32, 248, 30, 100, 'Baguio'),
(33, 248, 30, 54, 'Pangasinan'),
(34, 249, 30, 50, 'Baguio'),
(35, 249, 30, 40, 'Pangasinan'),
(36, 250, 30, 20, 'Baguio'),
(37, 250, 30, 75, 'Pangasinan'),
(38, 251, 30, 64, 'Baguio'),
(39, 251, 30, 73, 'Pangasinan'),
(40, 252, 30, 27, 'Baguio'),
(41, 252, 30, 70, 'Pangasinan'),
(42, 253, 30, 20, 'Baguio'),
(43, 253, 30, 86, 'Pangasinan'),
(44, 254, 30, 43, 'Baguio'),
(45, 254, 30, 48, 'Pangasinan'),
(46, 255, 30, 30, 'Baguio'),
(47, 255, 30, 37, 'Pangasinan'),
(48, 256, 30, 85, 'Baguio'),
(49, 256, 30, 86, 'Pangasinan'),
(50, 257, 30, 50, 'Baguio'),
(51, 257, 30, 0, 'Pangasinan'),
(52, 258, 30, 53, 'Baguio'),
(53, 258, 30, 54, 'Pangasinan'),
(54, 259, 30, 40, 'Baguio'),
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
(69, 266, 20, 0, 'Pangasinan'),
(70, 248, 5, 100, 'Baguio'),
(71, 248, 5, 0, 'Pangasinan'),
(72, 268, 20, 0, 'Baguio'),
(73, 268, 20, 0, 'Pangasinan'),
(74, 269, 15, 0, 'Baguio'),
(75, 269, 15, 0, 'Pangasinan');

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
(1, 'November 5, 2017, 9:14 pm', 'res', '1', 'mark', NULL, NULL, '18'),
(2, 'November 5, 2017, 9:18 pm', 'res', '1', 'sample', NULL, NULL, '21'),
(3, 'November 6, 2017, 9:25 pm', 'res', '1', '', NULL, NULL, '18'),
(4, 'November 6, 2017, 9:26 pm', 'res', '1', 'sample', NULL, NULL, '20'),
(5, 'November 6, 2017, 9:27 pm', 'res', '1', 'sample 5', NULL, NULL, '30'),
(6, 'November 6, 2017, 9:46 pm', 'res', '2', 'sample pent', NULL, '30', NULL),
(7, 'November 6, 2017, 9:52 pm', 'res', '2', 'pent admin', NULL, 'test', NULL),
(8, 'November 6, 2017, 9:57 pm', 'res', '2', 'pent sample 3', NULL, '4', NULL),
(9, 'November 14, 2017, 4:40 pm', 'res', '1', 'sample issuance in baguio', NULL, NULL, '18'),
(10, 'November 14, 2017, 4:41 pm', 'res', '2', 'sample penth', NULL, '4', NULL),
(11, 'November 14, 2017, 4:42 pm', 'res', '3', 'sample other issuance', 'cicm', NULL, NULL),
(12, 'November 14, 2017, 4:45 pm', 'mark', '4', 'stock transfer sample', NULL, NULL, ''),
(13, 'November 14, 2017, 4:49 pm', 'res', '1', 'sample  reg issue abag', NULL, NULL, '30'),
(14, 'November 14, 2017, 4:50 pm', 'res', '1', 'issue baguuo', NULL, NULL, '20'),
(15, 'November 14, 2017, 4:55 pm', 'res', '1', '', NULL, NULL, '18'),
(16, 'November 14, 2017, 4:57 pm', 'res', '2', 'pent issue multiple', NULL, '4', NULL),
(17, 'November 16, 2017, 10:21 pm', 'res', '1', '', NULL, NULL, '20'),
(18, 'November 21, 2017, 3:28 am', 'mark', '1', 'sample issue to victoria', NULL, NULL, '31'),
(21, 'November 21, 2017, 3:42 am', 'mark', '3', 'sample others issuance', 'Panama', NULL, NULL),
(22, 'November 21, 2017, 3:48 am', 'mark', '3', 'sample others issuance', 'Monroe', NULL, NULL),
(23, 'November 21, 2017, 3:51 am', '', '1', 'sample ', NULL, NULL, '26'),
(24, 'November 21, 2017, 3:53 am', 'mark', '1', 'sample issue', NULL, NULL, '31'),
(25, 'November 21, 2017, 4:17 am', 'mark', '1', 'sample issuance regular', NULL, NULL, '35'),
(26, 'November 21, 2017, 4:17 am', 'mark', '2', 'sample penthouse', NULL, '5', NULL),
(27, 'November 21, 2017, 4:18 am', 'mark', '3', 'sample others', 'Shimamo', NULL, NULL),
(28, 'November 21, 2017, 4:23 am', 'mark', '3', 'sample others with logs', 'Monkey', NULL, NULL),
(29, 'November 21, 2017, 4:25 am', 'mark', '2', 'sample issue penth with logs', NULL, '2', NULL),
(30, 'November 21, 2017, 4:27 am', 'mark', '2', 'sample penth with logs', NULL, '2', NULL),
(31, 'November 28, 2017, 1:05 pm', 'mark', '4', 'sample ST from baguio to pang', NULL, NULL, NULL),
(32, 'November 28, 2017, 1:24 pm', 'mark', '4', 'ST to baguio from Pang', NULL, NULL, NULL),
(33, 'November 28, 2017, 1:48 pm', 'mark', '4', 'ST with logs sample', NULL, NULL, NULL),
(34, 'November 28, 2017, 1:51 pm', 'mark', '4', 'sample ST with logs 2', NULL, NULL, NULL),
(35, 'November 28, 2017, 1:56 pm', 'mark', '4', 'ST with logs sample 3', NULL, NULL, NULL);

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
(17, 10, 48, 'Baguio', 252, ''),
(18, 7, 38, 'Pangasinan', 243, ''),
(18, 18, 10, 'Pangasinan', 249, ''),
(23, 2, 5, 'Baguio', 246, ''),
(24, 10, 9, 'Pangasinan', 257, ''),
(25, 10, 85, 'Baguio', 255, ''),
(26, 10, 85, 'Pangasinan', 255, ''),
(27, 10, 89, 'Pangasinan', 255, ''),
(28, 20, 20, 'Baguio', 259, ''),
(29, 20, 10, 'Baguio', 249, ''),
(30, 10, 10, 'Baguio', 249, ''),
(30, 2, 90, 'Baguio', 254, ''),
(31, 10, 10, 'Baguio', 257, '40 left in baguio..+10 pang'),
(32, 10, 10, 'Pangasinan', 257, '0 left in Pang..50 in baguio'),
(33, 20, 10, 'Pangasinan', 249, '40 left in pang..+20 bag'),
(34, 40, 86, 'Pangasinan', 254, '43 in baguio 48 left in pang'),
(35, 27, 50, 'Pangasinan', 252, '');

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
(14, 'res', 'Login', 'November 21, 2017, 2:46 am', NULL, 'has successfully login'),
(15, 'res', 'Added Client', 'November 21, 2017, 2:51 am', NULL, 'has successfully added a client'),
(16, 'res', 'Added Client', 'November 21, 2017, 2:54 am', NULL, 'has successfully added a client'),
(17, 'res', 'Added User', 'November 21, 2017, 2:58 am', NULL, 'has successfully added a new user'),
(18, 'mark', 'Login', 'November 21, 2017, 3:01 am', NULL, 'has successfully login'),
(19, 'mark', 'Added User', 'November 21, 2017, 3:02 am', NULL, 'has successfully added a new user'),
(20, 'mark', 'Added Order', 'November 21, 2017, 3:06 am', NULL, 'has successfully added a new order'),
(21, 'mark', 'Added Order', 'November 21, 2017, 3:06 am', NULL, 'has successfully added a new order'),
(22, 'mark', 'Added Category', 'November 21, 2017, 3:10 am', NULL, 'has successfully added a new category'),
(23, 'mark', 'Added Product', 'November 21, 2017, 3:14 am', NULL, 'has successfully added a new product'),
(24, 'mark', 'Added Product', 'November 21, 2017, 3:16 am', NULL, 'has successfully added a new product'),
(25, 'mark', 'Added Bad order', 'November 21, 2017, 3:20 am', NULL, 'has successfully issued a bad order'),
(26, 'mark', 'Added Pull out', 'November 21, 2017, 3:23 am', NULL, 'has successfully issued a pull out'),
(27, 'mark', 'Added Issuance', 'November 21, 2017, 3:28 am', NULL, 'has successfully issued a product'),
(28, 'mark', 'Added Issuance', 'November 21, 2017, 3:28 am', NULL, 'has successfully issued a product'),
(29, 'mark', 'Issued Stock Transfer', 'November 21, 2017, 3:33 am', NULL, 'has successfully transfered a new product'),
(30, 'mark', 'Others Issuance', 'November 21, 2017, 3:42 am', NULL, 'has successfully issued products to others'),
(31, 'mark', 'Others Issuance', 'November 21, 2017, 3:48 am', NULL, 'has successfully issued products to others'),
(32, '', 'Added Issuance', 'November 21, 2017, 3:51 am', NULL, 'has successfully issued a product'),
(33, 'mark', 'Added Issuance', 'November 21, 2017, 3:53 am', NULL, 'has successfully issued a product'),
(34, 'mark', 'Others Issuance', 'November 21, 2017, 3:54 am', NULL, 'has successfully issued products to others'),
(35, 'mark', 'Issued Penthouse', 'November 21, 2017, 3:57 am', NULL, 'has successfully issued products to penthouse'),
(36, 'mark', 'Issued Penthouse', 'November 21, 2017, 4:04 am', NULL, 'has successfully issued products to penthouse'),
(37, 'mark', 'Issued Penthouse', 'November 21, 2017, 4:04 am', NULL, 'has successfully issued products to penthouse'),
(38, 'mark', 'Added Issuance', 'November 21, 2017, 4:17 am', NULL, 'has successfully issued a product'),
(39, 'mark', 'Others Issuance', 'November 21, 2017, 4:23 am', NULL, 'has successfully issued ptoducts to others'),
(40, 'mark', 'Penthouse Issuance', 'November 21, 2017, 4:27 am', NULL, 'has successfully issued products to penthouse'),
(41, 'mark', 'Penthouse Issuance', 'November 21, 2017, 4:27 am', NULL, 'has successfully issued products to penthouse'),
(42, 'mark', 'Login', 'November 21, 2017, 1:54 pm', NULL, 'has successfully login'),
(43, 'mark', 'Login', 'November 22, 2017, 12:58 am', NULL, 'has successfully login'),
(44, 'mark', 'Added Client', 'November 22, 2017, 12:59 am', NULL, 'has successfully added a new client'),
(45, 'res', 'Login', 'November 24, 2017, 11:32 pm', NULL, 'has successfully login'),
(46, 'res', 'Login', 'November 27, 2017, 10:04 pm', NULL, 'has successfully login'),
(47, 'mark', 'Login', 'November 27, 2017, 10:13 pm', NULL, 'has successfully login'),
(48, 'res', 'Login', 'November 27, 2017, 11:10 pm', NULL, 'has successfully login'),
(49, 'res', 'Login', 'November 28, 2017, 8:52 am', NULL, 'has successfully login'),
(50, 'mark', 'Login', 'November 28, 2017, 9:12 am', NULL, 'has successfully login'),
(51, 'mark', 'Added Product', 'November 28, 2017, 9:24 am', NULL, 'has successfully added a new product'),
(52, 'res', 'Login', 'November 28, 2017, 9:53 am', NULL, 'has successfully login'),
(53, 'mark', 'Login', 'November 28, 2017, 10:02 am', NULL, 'has successfully login'),
(54, 'mark', 'Added User', 'November 28, 2017, 10:07 am', NULL, 'has successfully added a new user'),
(55, 'mark', 'Added User', 'November 28, 2017, 10:08 am', NULL, 'has successfully added a new user'),
(56, 'mark', 'Added User', 'November 28, 2017, 10:09 am', NULL, 'has successfully added a new user'),
(57, 'mark', 'Added User', 'November 28, 2017, 10:10 am', NULL, 'has successfully added a new user'),
(58, 'mark', 'Login', 'November 28, 2017, 12:19 pm', NULL, 'has successfully login'),
(59, 'res', 'Login', 'November 28, 2017, 1:26 pm', NULL, 'has successfully login'),
(60, 'res', 'Login', 'November 28, 2017, 1:31 pm', NULL, 'has successfully login'),
(61, 'res', 'Login', 'November 28, 2017, 1:32 pm', NULL, 'has successfully login'),
(62, 'mark', 'Login', 'November 28, 2017, 1:33 pm', NULL, 'has successfully login'),
(63, 'mark', 'Login', 'November 28, 2017, 1:33 pm', NULL, 'has successfully login'),
(64, 'mark', 'Login', 'November 28, 2017, 1:42 pm', NULL, 'has successfully login'),
(65, 'mark', 'Login', 'November 28, 2017, 1:55 pm', NULL, 'has successfully login'),
(66, 'mark', 'Added Stock Transfer', 'November 28, 2017, 1:56 pm', NULL, 'has successfully transfered product(s)'),
(67, 'mark', 'Login', 'December 1, 2017, 7:15 pm', NULL, 'has successfully login'),
(68, 'mark', 'Login', 'December 1, 2017, 7:15 pm', NULL, 'has successfully login'),
(69, 'res', 'Login', 'December 1, 2017, 7:15 pm', NULL, 'has successfully login'),
(70, 'mark', 'Login', 'December 1, 2017, 7:35 pm', NULL, 'has successfully login'),
(71, 'res', 'Login', 'December 1, 2017, 7:43 pm', NULL, 'has successfully login'),
(72, 'mark', 'Login', 'December 1, 2017, 7:46 pm', NULL, 'has successfully login'),
(73, 'res', 'Login', 'December 1, 2017, 8:00 pm', NULL, 'has successfully login'),
(74, 'mark', 'Login', 'December 1, 2017, 8:02 pm', NULL, 'has successfully login'),
(75, 'res', 'Login', 'December 1, 2017, 8:09 pm', NULL, 'has successfully login');

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
(11, 8, 5, 'Baguio', 250, ''),
(12, 80, 10, 'Baguio', 254, '');

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `productList_id` int(15) NOT NULL,
  `productList_name` varchar(50) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `category_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`productList_id`, `productList_name`, `unit`, `category_id`) VALUES
(241, 'Beef', '1kg', 13),
(242, 'Chicken', '500g', 13),
(243, 'De Recado', '1pcs', 13),
(244, 'Hamonado', '100g', 13),
(245, 'Vigan Longganisa', '1pck', 13),
(246, 'Puto Seco', '1pck', 14),
(247, 'Long Rice', '500g', 14),
(248, 'Meringue', '1pck', 14),
(249, 'Pop Rice Square', '250g', 14),
(250, 'Pop Rice Roun', '100g', 14),
(251, 'Peanut Butter (small)', '100g', 15),
(252, 'Strawberry  Jelly', '300g', 15),
(253, 'Strawberry Buo', '200g', 15),
(254, 'Honey', '500g', 15),
(255, 'Peanut Butter (Tall)', '500g', 15),
(256, 'Paminta', '1pck', 16),
(257, 'Laurel', '1pck', 16),
(258, 'Garlic Fried', '200g', 16),
(259, 'Curry Powder', '100g', 16),
(260, 'Star Anis', '1pck', 16),
(261, 'Colored Sprinkle', '1pck', 17),
(262, 'Choco Lentils', '1pck', 17),
(263, 'Caster Sugar', '1kg', 17),
(264, 'Icing Sugar', '250g', 17),
(265, 'Baking Soy', '1pck', 13),
(266, 'Kapusan', '1pcs', 13),
(267, 'Meringue', '500g', 19),
(268, 'Cracklings', '200g', 19),
(269, 'Soy', '100g', 13);

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
(266, 'Pangasinan', 'Enabled', '12', ''),
(248, 'Baguio', 'Enabled', '10', '1912122'),
(248, 'Pangasinan', 'Enabled', '20', '1912122'),
(268, 'Baguio', 'Enabled', '10', '1010101'),
(268, 'Pangasinan', 'Enabled', '10', '1010101'),
(269, 'Baguio', 'Enabled', '10', '9012012'),
(269, 'Pangasinan', 'Enabled', '14', '9012012');

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
(7, 'November 17, 2017, 2:28 am', 'res', 0, '7'),
(8, 'November 17, 2017, 2:29 am', 'res', 0, '8'),
(9, 'November 18, 2017, 3:52 am', 'res ', 0, ''),
(10, 'November 18, 2017, 4:34 am', 'res ', 0, 'asd'),
(11, 'November 19, 2017, 1:12 am', 'res', 0, ''),
(12, 'November 21, 2017, 3:23 am', 'mark', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `purchased_order`
--

CREATE TABLE `purchased_order` (
  `order_id` int(50) NOT NULL,
  `order_date` varchar(50) NOT NULL,
  `client_id` int(20) NOT NULL,
  `merchandiser` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchased_order`
--

INSERT INTO `purchased_order` (`order_id`, `order_date`, `client_id`, `merchandiser`) VALUES
(4, 'November 19, 2017, 9:40 pm', 20, ''),
(5, 'November 21, 2017, 1:25 am', 21, 'Marko Sielo'),
(6, 'November 21, 2017, 3:06 am', 35, 'Vic Soto');

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
(4, 121, 'Baguio', 248, ''),
(5, 100, 'Pangasinan', 242, 'sample po'),
(5, 72, 'Pangasinan', 246, ''),
(6, 10, 'Baguio', 242, ''),
(6, 20, 'Baguio', 241, '');

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
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`logs_id`),
  ADD KEY `acc_id_idx` (`issue_acnt`);

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
  MODIFY `bo_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
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
  MODIFY `iS_inventoryid` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `issuance`
--
ALTER TABLE `issuance`
  MODIFY `issue_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `logs_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `productList_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=270;
--
-- AUTO_INCREMENT for table `pull_out`
--
ALTER TABLE `pull_out`
  MODIFY `po_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `purchased_order`
--
ALTER TABLE `purchased_order`
  MODIFY `order_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
