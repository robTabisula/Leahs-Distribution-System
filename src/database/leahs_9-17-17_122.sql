-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2017 at 05:22 PM
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
  `email` varchar(20) NOT NULL,
  `contact_no` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'Disabled',
  `branch` varchar(50) DEFAULT NULL,
  `acctype` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`acc_id`, `username`, `first_name`, `last_name`, `password`, `email`, `contact_no`, `status`, `branch`, `acctype`) VALUES
(1, 'ahlexrull', 'Alexandria', 'Rull', '123', 'ahlexrull@aol.com', '09772570566', 'Enabled', 'Baguio', NULL),
(2, 'rob', 'Robijn', 'Tabisula', '123', 'rob', '21535', 'Enabled', 'Baguio', NULL),
(3, 'res', 'res', 'res', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'res@email.com', '753153', 'Enabled', 'Pangasinan', NULL),
(4, 'jake1', 'jake', 'no', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'jake@email.com', '4645465', 'Disabled', 'Baguio', 'User');

-- --------------------------------------------------------

--
-- Table structure for table `bad_order`
--

CREATE TABLE `bad_order` (
  `bo_id` int(15) NOT NULL,
  `bo_price` int(20) NOT NULL,
  `bo_dateReleased` datetime(6) NOT NULL,
  `bo_quantity` int(10) NOT NULL,
  `bo_product_id` int(10) NOT NULL,
  `bo_issueid` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(1, 'Specialty Products', NULL),
(2, 'Sweets', NULL),
(3, 'Jam & Jellies', NULL),
(4, 'Condiments, Sauces, & Oils', NULL),
(5, 'Baking Products', NULL),
(6, 'Glutinous/Powders', NULL),
(7, 'Mallows/Gummies', NULL),
(8, 'Beans/Mongo', NULL),
(9, 'Others', NULL),
(10, 'Roll Bag/Plastic Bags/Drinking Straws', NULL),
(11, 'Microwave Containers', NULL),
(12, 'Stationary Products', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `c_id` int(15) NOT NULL,
  `c_name` varchar(20) NOT NULL,
  `c_address` varchar(20) NOT NULL,
  `c_contact_no` int(20) NOT NULL,
  `c_contact_person` varchar(20) NOT NULL,
  `c_location` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`c_id`, `c_name`, `c_address`, `c_contact_no`, `c_contact_person`, `c_location`) VALUES
(1, 'John', 'North Cambridge', 2, 'Alex', 'Baguio');

-- --------------------------------------------------------

--
-- Table structure for table `client_contact`
--

CREATE TABLE `client_contact` (
  `contact_clientid` int(11) NOT NULL,
  `contact_name` varchar(45) DEFAULT NULL,
  `contact_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `iS_inventoryid` int(15) NOT NULL,
  `iS_product_id` int(15) NOT NULL,
  `iS_re-stock_lvl` int(10) NOT NULL,
  `iS_quantity` int(10) NOT NULL,
  `iS_location` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`iS_inventoryid`, `iS_product_id`, `iS_re-stock_lvl`, `iS_quantity`, `iS_location`) VALUES
(1, 2, 6, 43, 'Baguio'),
(2, 3, 2, 30, 'Pangasinan');

-- --------------------------------------------------------

--
-- Table structure for table `issuance`
--

CREATE TABLE `issuance` (
  `issue_id` int(15) NOT NULL,
  `issue_date_time` datetime(6) NOT NULL,
  `client_id` int(15) NOT NULL,
  `issue_account` int(12) DEFAULT NULL,
  `remarks` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `issuance_list`
--

CREATE TABLE `issuance_list` (
  `issue_id` int(15) NOT NULL,
  `prod_qty` int(15) NOT NULL,
  `prod_price` int(15) NOT NULL,
  `prod_id` int(15) NOT NULL,
  `remarks` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `name` text NOT NULL,
  `act` varchar(15) NOT NULL,
  `date_time` datetime(6) NOT NULL,
  `related_id` int(15) NOT NULL,
  `remarks` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `productList_id` int(15) NOT NULL,
  `productList_name` varchar(50) DEFAULT NULL,
  `category_id` int(15) NOT NULL,
  `productList_origprice` decimal(13,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`productList_id`, `productList_name`, `category_id`, `productList_origprice`) VALUES
(1, 'Beef', 1, '38.00'),
(2, 'Beef', 1, '38.00'),
(3, 'Beef', 1, '38.00'),
(4, 'Beef', 1, '38.00'),
(5, 'Beef', 1, '38.00'),
(6, 'Beef', 1, '38.00'),
(7, 'Beef', 1, '38.00'),
(8, 'Beef', 1, '38.00'),
(9, 'Beef', 1, '38.00'),
(10, 'Beef', 1, '38.00'),
(11, 'Beef', 1, '38.00'),
(12, 'Beef', 1, '38.00'),
(13, 'Beef', 1, '38.00'),
(14, 'Beef', 1, '38.00'),
(15, 'Beef', 1, '38.00'),
(16, 'Beef', 1, '38.00'),
(17, 'Beef', 1, '38.00'),
(18, 'Beef', 1, '38.00'),
(19, 'Beef', 1, '38.00'),
(20, 'Beef', 1, '38.00'),
(21, 'Beef', 1, '38.00'),
(22, 'Beef', 1, '38.00'),
(23, 'Beef', 1, '38.00'),
(24, 'Beef', 1, '38.00'),
(25, 'Beef', 1, '38.00'),
(26, 'Beef', 1, '38.00'),
(27, 'Beef', 1, '38.00'),
(28, 'Beef', 1, '38.00'),
(29, 'Beef', 1, '38.00'),
(30, 'Beef', 1, '38.00'),
(31, 'Beef', 1, '38.00'),
(32, 'Beef', 1, '38.00'),
(33, 'Beef', 1, '38.00'),
(34, 'Beef', 1, '38.00'),
(35, 'Beef', 1, '38.00'),
(36, 'Beef', 1, '38.00'),
(37, 'Beef', 1, '38.00'),
(38, 'Beef', 1, '38.00'),
(39, 'Beef', 1, '38.00'),
(40, 'Beef', 1, '38.00'),
(41, 'Beef', 1, '38.00'),
(42, 'Beef', 1, '38.00'),
(43, 'Beef', 1, '38.00'),
(44, 'Beef', 1, '38.00'),
(45, 'Beef', 1, '38.00'),
(46, 'Beef', 1, '38.00'),
(47, 'Beef', 1, '38.00'),
(48, 'Beef', 1, '38.00'),
(49, 'Beef', 1, '38.00'),
(50, 'Beef', 1, '38.00'),
(51, 'Beef', 1, '38.00'),
(52, 'Beef', 1, '38.00'),
(53, 'Beef', 1, '38.00'),
(54, 'Beef', 1, '38.00'),
(55, 'Beef', 1, '38.00'),
(56, 'Beef', 1, '38.00'),
(57, 'Beef', 1, '38.00'),
(58, 'Beef', 1, '38.00'),
(59, 'Beef', 1, '38.00'),
(60, 'Beef', 1, '38.00'),
(61, 'Beef', 1, '38.00'),
(62, 'Beef', 1, '38.00'),
(63, 'Beef', 1, '38.00'),
(64, 'Beef', 1, '38.00'),
(65, 'Beef', 1, '38.00'),
(66, 'Beef', 1, '38.00'),
(67, 'Beef', 1, '38.00'),
(68, 'Beef', 1, '38.00'),
(69, 'Beef', 1, '38.00'),
(70, 'Beef', 1, '38.00'),
(71, 'Beef', 1, '38.00'),
(72, 'Beef', 1, '38.00'),
(73, 'Beef', 1, '38.00'),
(74, 'Beef', 1, '38.00'),
(75, 'Beef', 1, '38.00'),
(76, 'Beef', 1, '38.00'),
(77, 'Beef', 1, '38.00'),
(78, 'Beef', 1, '38.00'),
(79, 'Beef', 1, '38.00'),
(80, 'Beef', 1, '38.00'),
(81, 'Beef', 1, '38.00'),
(82, 'Beef', 1, '38.00'),
(83, 'Beef', 1, '38.00'),
(84, 'Beef', 1, '38.00'),
(85, 'Beef', 1, '38.00'),
(86, 'Beef', 1, '38.00'),
(87, 'Beef', 1, '38.00'),
(88, 'Beef', 1, '38.00'),
(89, 'Beef', 1, '38.00'),
(90, 'Beef', 1, '38.00'),
(91, 'Beef', 1, '38.00'),
(92, 'Beef', 1, '38.00'),
(93, 'Beef', 1, '38.00'),
(94, 'Beef', 1, '38.00'),
(95, 'Beef', 1, '38.00'),
(96, 'Beef', 1, '38.00'),
(97, 'Beef', 1, '38.00'),
(98, 'Beef', 1, '38.00'),
(99, 'Beef', 1, '38.00'),
(100, 'Beef', 1, '38.00'),
(101, 'Beef', 1, '38.00'),
(102, 'Beef', 1, '38.00'),
(103, 'Beef', 1, '38.00'),
(104, 'Beef', 1, '38.00'),
(105, 'Beef', 1, '38.00'),
(106, 'Beef', 1, '38.00'),
(107, 'Beef', 1, '38.00'),
(108, 'Beef', 1, '38.00'),
(109, 'Beef', 1, '38.00'),
(110, 'Beef', 1, '38.00'),
(111, 'Beef', 1, '38.00'),
(112, 'Beef', 1, '38.00'),
(113, 'Beef', 1, '38.00'),
(114, 'Beef', 1, '38.00'),
(115, 'Beef', 1, '38.00'),
(116, 'Beef', 1, '38.00'),
(117, 'Beef', 1, '38.00'),
(118, 'Beef', 1, '38.00'),
(119, 'Beef', 1, '38.00'),
(120, 'Beef', 1, '38.00'),
(121, 'Beef', 1, '38.00'),
(122, 'Beef', 1, '38.00'),
(123, 'Beef', 1, '38.00'),
(124, 'Beef', 1, '38.00'),
(125, 'Beef', 1, '38.00'),
(126, 'Beef', 1, '38.00'),
(127, 'Beef', 1, '38.00'),
(128, 'Beef', 1, '38.00'),
(129, 'Beef', 1, '38.00'),
(130, 'Beef', 1, '38.00'),
(131, 'Beef', 1, '38.00'),
(132, 'Beef', 1, '38.00'),
(133, 'Beef', 1, '38.00'),
(134, 'Beef', 1, '38.00'),
(135, 'Beef', 1, '38.00'),
(136, 'Beef', 1, '38.00'),
(137, 'Beef', 1, '38.00'),
(138, 'Beef', 1, '38.00'),
(139, 'Beef', 1, '38.00'),
(140, 'Beef', 1, '38.00'),
(141, 'Beef', 1, '38.00'),
(142, 'Beef', 1, '38.00'),
(143, 'Beef', 1, '38.00'),
(144, 'Beef', 1, '38.00'),
(145, 'Beef', 1, '38.00'),
(146, 'Beef', 1, '38.00'),
(147, 'Beef', 1, '38.00'),
(148, 'Beef', 1, '38.00'),
(149, 'Beef', 1, '38.00'),
(150, 'Beef', 1, '38.00'),
(151, 'Beef', 1, '38.00'),
(152, 'Beef', 1, '38.00'),
(153, 'Beef', 1, '38.00'),
(154, 'Beef', 1, '38.00'),
(155, 'Beef', 1, '38.00'),
(156, 'Beef', 1, '38.00'),
(157, 'Beef', 1, '38.00'),
(158, 'Beef', 1, '38.00'),
(159, 'Beef', 1, '38.00'),
(160, 'Beef', 1, '38.00'),
(161, 'Beef', 1, '38.00'),
(162, 'Beef', 1, '38.00'),
(163, 'Beef', 1, '38.00'),
(164, 'Beef', 1, '38.00'),
(165, 'Beef', 1, '38.00'),
(166, 'Beef', 1, '38.00'),
(167, 'Beef', 1, '38.00'),
(168, 'Beef', 1, '38.00'),
(169, 'Beef', 1, '38.00'),
(170, 'Beef', 1, '38.00'),
(171, 'Beef', 1, '38.00'),
(172, 'Beef', 1, '38.00'),
(173, 'Beef', 1, '38.00'),
(174, 'Beef', 1, '38.00'),
(175, 'Beef', 1, '38.00'),
(176, 'Beef', 1, '38.00'),
(177, 'Beef', 1, '38.00'),
(178, 'Beef', 1, '38.00'),
(179, 'Beef', 1, '38.00'),
(180, 'Beef', 1, '38.00'),
(181, 'Beef', 1, '38.00'),
(182, 'Beef', 1, '38.00'),
(183, 'Beef', 1, '38.00'),
(184, 'Beef', 1, '38.00'),
(185, 'Beef', 1, '38.00'),
(186, 'Beef', 1, '38.00'),
(187, 'Beef', 1, '38.00'),
(188, 'Beef', 1, '38.00'),
(189, 'Beef', 1, '38.00'),
(190, 'Beef', 1, '38.00'),
(191, 'Beef', 1, '38.00'),
(192, 'Beef', 1, '38.00'),
(193, 'Beef', 1, '38.00'),
(194, 'Beef', 1, '38.00'),
(195, 'Beef', 1, '38.00'),
(196, 'Beef', 1, '38.00'),
(197, 'Beef', 1, '38.00'),
(198, 'Beef', 1, '38.00'),
(199, 'Beef', 1, '38.00'),
(200, 'Beef', 1, '38.00'),
(201, 'Beef', 1, '38.00'),
(202, 'Beef', 1, '38.00'),
(203, 'Beef', 1, '38.00'),
(204, 'Beef', 1, '38.00'),
(205, 'Beef', 1, '38.00'),
(206, 'Beef', 1, '38.00'),
(207, 'Beef', 1, '38.00'),
(208, 'Beef', 1, '38.00'),
(209, 'Beef', 1, '38.00'),
(210, 'Beef', 1, '38.00'),
(211, 'Beef', 1, '38.00'),
(212, 'Beef', 1, '38.00');

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
(1, 'Baguio', 'Enabled', '68', ''),
(1, 'Baguio', 'Enabled', '68', ''),
(1, 'Baguio', 'Enabled', '68', ''),
(1, 'Baguio', 'Enabled', '68', ''),
(1, 'Baguio', 'Enabled', '68', ''),
(1, 'Baguio', 'Enabled', '68', ''),
(1, 'Baguio', 'Enabled', '68', ''),
(1, 'Baguio', 'Enabled', '68', ''),
(1, 'Baguio', 'Enabled', '68', ''),
(1, 'Baguio', 'Enabled', '68', ''),
(1, 'Baguio', 'Enabled', '68', ''),
(1, 'Baguio', 'Enabled', '68', ''),
(1, 'Baguio', 'Enabled', '68', ''),
(1, 'Baguio', 'Enabled', '68', ''),
(1, 'Baguio', 'Enabled', '68', ''),
(1, 'Baguio', 'Enabled', '68', ''),
(1, 'Baguio', 'Enabled', '68', ''),
(1, 'Baguio', 'Enabled', '68', ''),
(1, 'Baguio', 'Enabled', '68', ''),
(1, 'Baguio', 'Enabled', '68', '');

-- --------------------------------------------------------

--
-- Table structure for table `pull_out`
--

CREATE TABLE `pull_out` (
  `po_id` int(10) NOT NULL,
  `po_price` int(10) NOT NULL,
  `po_qty` int(10) NOT NULL,
  `po_remarks` varchar(10) NOT NULL,
  `po_date` datetime NOT NULL,
  `po_product_id` int(15) NOT NULL,
  `po_issueid` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `request_id` int(12) NOT NULL,
  `act` varchar(20) NOT NULL,
  `account_req` int(11) NOT NULL,
  `account_appr` int(11) DEFAULT NULL,
  `date_time` datetime(6) NOT NULL,
  `target` varchar(15) NOT NULL,
  `changed` varchar(20) NOT NULL,
  `remarks` varchar(20) NOT NULL,
  `status` varchar(8) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  ADD PRIMARY KEY (`bo_id`),
  ADD KEY `product_id_idx` (`bo_product_id`),
  ADD KEY `bo_issueid_idx` (`bo_issueid`);

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
  ADD PRIMARY KEY (`issue_id`),
  ADD KEY `client_id_idx` (`client_id`),
  ADD KEY `issue_acc_idx` (`issue_account`);

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
  ADD PRIMARY KEY (`po_id`),
  ADD KEY `FK_pull_out_product_list_idx` (`po_product_id`),
  ADD KEY `po_issueid_idx` (`po_issueid`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `account_appr_idx` (`account_appr`),
  ADD KEY `account_req_idx` (`account_req`);

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
  MODIFY `bo_id` int(15) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `category_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `iS_inventoryid` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `issuance`
--
ALTER TABLE `issuance`
  MODIFY `issue_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ledger`
--
ALTER TABLE `ledger`
  MODIFY `ledger_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `logs_id` int(15) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `productList_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=213;
--
-- AUTO_INCREMENT for table `pull_out`
--
ALTER TABLE `pull_out`
  MODIFY `po_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `request_id` int(12) NOT NULL AUTO_INCREMENT;
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
-- Constraints for table `bad_order`
--
ALTER TABLE `bad_order`
  ADD CONSTRAINT `bo_issueid` FOREIGN KEY (`bo_issueid`) REFERENCES `issuance` (`issue_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `bo_product_id` FOREIGN KEY (`bo_product_id`) REFERENCES `product_list` (`productList_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `client_contact`
--
ALTER TABLE `client_contact`
  ADD CONSTRAINT `contact_clientid` FOREIGN KEY (`contact_clientid`) REFERENCES `clients` (`c_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `iS_product_id` FOREIGN KEY (`iS_product_id`) REFERENCES `product_list` (`productList_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `issuance`
--
ALTER TABLE `issuance`
  ADD CONSTRAINT `client_id` FOREIGN KEY (`client_id`) REFERENCES `clients` (`c_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `issue_account` FOREIGN KEY (`issue_account`) REFERENCES `accounts` (`acc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
