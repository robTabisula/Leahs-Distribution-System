-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2017 at 05:31 PM
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
  `acctype` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`acc_id`, `username`, `first_name`, `last_name`, `password`, `email`, `contact_no`, `status`, `branch`, `acctype`) VALUES
(1, 'res', 'res', 'res', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'res@email.com', '753153', 'Enabled', 'Pangasinan', 'admin');

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
(13, 'Specialty', 'Enabled'),
(14, 'Sweets', 'Enabled'),
(15, 'JamAndJellies', 'Enabled'),
(16, 'Condiments', 'Enabled'),
(17, 'Baking', 'Enabled');

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
(18, 'SM baguio', 'baguio', 'Baguio'),
(19, 'SM pangasinan', 'pangasinan', 'Pangasinan'),
(20, 'tsiongsan baguio', 'baguio', 'Baguio'),
(21, 'tsiongsan pangasinan', 'pangasinan', 'Pangasinan'),
(26, 'sm20', 'asd', 'Baguio'),
(27, 'smde', 'asdasd', 'Pangasinan');

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
(27, 'asdasd', 23423);

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
(18, 241, 30, 21, 'Baguio'),
(19, 241, 30, 25, 'Pangasinan'),
(20, 242, 30, 54, 'Baguio'),
(21, 242, 30, 65, 'Pangasinan'),
(22, 243, 30, 24, 'Baguio'),
(23, 243, 30, 87, 'Pangasinan'),
(24, 244, 30, 66, 'Baguio'),
(25, 244, 30, 57, 'Pangasinan'),
(26, 245, 30, 24, 'Baguio'),
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
(67, 265, 30, 58, 'Pangasinan');

-- --------------------------------------------------------

--
-- Table structure for table `issuance`
--

CREATE TABLE `issuance` (
  `issue_id` int(15) NOT NULL,
  `issue_date_time` datetime(6) NOT NULL,
  `issue_account` int(12) DEFAULT NULL,
  `remarks` varchar(45) DEFAULT NULL,
  `other_clients` varchar(45) DEFAULT NULL,
  `penthouse_clients` varchar(45) DEFAULT NULL,
  `client_id` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(265, 'Baking Soy', 15);

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
(265, 'Baguio', 'Disabled', '17', '1111111'),
(265, 'Pangasinan', 'Disabled', '21', '1111111');

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
  MODIFY `acc_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `bad_order`
--
ALTER TABLE `bad_order`
  MODIFY `bo_id` int(15) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `category_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `c_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `iS_inventoryid` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;
--
-- AUTO_INCREMENT for table `issuance`
--
ALTER TABLE `issuance`
  MODIFY `issue_id` int(15) NOT NULL AUTO_INCREMENT;
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
  MODIFY `productList_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=266;
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
