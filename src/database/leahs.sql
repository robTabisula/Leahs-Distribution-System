-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 29, 2017 at 08:02 PM
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
(3, 'res', 'res', 'res', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'res@email.com', '753153', 'Enabled', 'Pangasinan', NULL),
(5, 'alex121', 'Alexandria', 'Rull', '3c9909afec25354d551dae21590bb26e38d53f2173b8d3dc3eee4c047e7ab1c1eb8b85103e3be7ba613b31bb5c9c36214dc9f14a42fd7a2fdb84856bca5c44c2', 'alex@gmail.com', '0909091901', 'Disabled', 'Baguio', 'Admin'),
(6, 'admin', 'Admin', 'Ako', 'c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec', 'markabad@gmail.com', '09152856391', 'Disabled', 'Pangasinan', 'User'),
(7, 'asd', 'add', 'asd', 'e54ee7e285fbb0275279143abc4c554e5314e7b417ecac83a5984a964facbaad68866a2841c3e83ddf125a2985566261c4014f9f960ec60253aebcda9513a9b4', 'oui@e', '45', 'Disabled', 'Baguio', 'Admin'),
(16, 'mark', 'mark', 'mark', 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', 'markabad@gmail.com', '2323', 'Disabled', 'Pangasinan', 'User'),
(17, 'ram', 'ram', 'ram', 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', 'ram@gmail.com', '09890', 'Disabled', 'Pangasinan', 'User'),
(18, 'john', 'john', 'john', 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', 'john@gmail.com', '09090909', 'Disabled', 'Pangasinan', 'User'),
(19, 'Henry', 'Mark', 'Abad', 'cf83e1357eefb8bdf1542850d66d8007d620e4050b5715dc83f4a921d36ce9ce47d0d13c5d85f2b0ff8318d2877eec2f63b931bd47417a81a538327af927da3e', 'markabad@gmail.com', '23232323', 'Disabled', 'Pangasinan', 'User');

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
(1, 'Specialty Products', 'Disabled'),
(2, 'Specialty Products', 'Disabled'),
(3, 'Specialty Products', 'Disabled'),
(4, 'Specialty Products', 'Disabled'),
(5, 'Specialty Products', 'Disabled'),
(6, 'Specialty Products', 'Enabled'),
(7, 'Specialty Products', 'Enabled'),
(8, 'Specialty Products', 'Enabled'),
(9, 'Specialty Products', 'Enabled'),
(10, 'Specialty Products', 'Enabled'),
(11, 'Specialty Products', 'Enabled'),
(12, 'Specialty Products', 'Disabled');

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
(9, 'Tiongsan', 'Harrison Road, B.C', 'Baguio'),
(10, 'Victoria', '19 General Luna Road', 'Baguio'),
(11, 'Sunshine', '78 Crossing', 'Baguio'),
(12, 'Sari Sari', '34 Nowhere', 'Baguio');

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
(9, 'Tiongnin', 4443717),
(10, 'Victoria', 4446712),
(11, 'Cruz', 4441212),
(12, 'Maria Clara', 912292910);

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
(12, 236, 100, 202, 'Baguio'),
(13, 236, 100, 202, 'Pangasinan'),
(14, 239, 30, 0, 'Baguio'),
(15, 239, 30, 0, 'Pangasinan'),
(16, 240, 90, 0, 'Baguio'),
(17, 240, 90, 0, 'Pangasinan');

-- --------------------------------------------------------

--
-- Table structure for table `issuance`
--

CREATE TABLE `issuance` (
  `issue_id` int(15) NOT NULL,
  `issue_date_time` datetime(6) NOT NULL,
  `client_id` int(15) DEFAULT NULL,
  `issue_account` int(12) DEFAULT NULL,
  `remarks` varchar(45) DEFAULT NULL,
  `other_clients` varchar(45) DEFAULT NULL,
  `penthouse_clients` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `issuance`
--

INSERT INTO `issuance` (`issue_id`, `issue_date_time`, `client_id`, `issue_account`, `remarks`, `other_clients`, `penthouse_clients`) VALUES
(7, '2017-09-20 11:21:10.000000', 9, 3, 'sample', NULL, NULL),
(8, '2017-10-18 11:13:07.000000', 10, 5, 'yeah', NULL, NULL);

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

--
-- Dumping data for table `issuance_list`
--

INSERT INTO `issuance_list` (`issue_id`, `prod_qty`, `prod_price`, `branch`, `prod_id`, `remarks`) VALUES
(7, 10, 90, '', 2, 'TRY'),
(8, 10, 80, 'Baguio', 10, 'haha');

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

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`logs_id`, `acc_id`, `name`, `act`, `date_time`, `related_id`, `remarks`) VALUES
(1, 5, 'none', 'remove item', '2017-09-20 10:26:24.000000', 2, 'asd');

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
(1, 'Beef', 1),
(2, 'Chicken', 1),
(3, 'De Recado', 1),
(4, 'Hamondo', 1),
(5, 'Vigan', 1),
(6, 'Smoked Hamondo (500 gms)', 1),
(7, 'Smoked Hamondo (250 gms)', 1),
(8, 'Smoked Vigan (500 gms)', 1),
(9, 'Smoked Vigan (250 gms)', 1),
(10, 'Embotido (450 gms)', 1),
(11, 'Embotido (250 gms)', 1),
(12, 'Tocino (500gms)', 1),
(13, 'Tocino (200gms)', 1),
(14, 'Lumpiang Shanghai', 1),
(15, 'Bangus Shanghai', 1),
(16, 'Chicken Shanghai', 1),
(17, 'Burger Patties (200 gms)', 1),
(18, 'Fish Ball (500 gms)', 1),
(19, 'Fish Ball (250 gms)', 1),
(20, 'Kikiam (500 gms)', 1),
(21, 'Kikiam (250 gms)', 1),
(22, 'Fish Lumpia (500 gms)', 1),
(23, 'Chicken Balls (250 gms)', 1),
(24, 'Squid Balls (250 gms)', 1),
(25, 'Jumbo Hotdog (500 gms)', 1),
(26, 'Jumbo Hotdog (250 gms)', 1),
(27, 'Odocs (500 gms)', 1),
(28, 'Odocs (250 gms)', 1),
(29, 'Green Peas (400 gms)', 1),
(30, 'Green Peas (200 gms)', 1),
(31, 'Mixed Vegetable (400 gms)', 1),
(32, 'Mixed Vegetable (200 gms)', 1),
(33, 'French Fries (500 gms)', 1),
(34, 'French Fries (1 kg)', 1),
(35, 'French Fries (2.5 kg)', 1),
(36, 'Puto Seco (25 pc)', 2),
(37, 'Long Rice (20 pc)', 2),
(38, 'Meringue (20 pc)', 2),
(39, 'Pop Rice Round (15 pc)', 2),
(40, 'Pop Rice Square (20 pc)', 2),
(41, 'Belicoy (50 pc)', 2),
(42, 'Bilog (50 pc)', 2),
(43, 'Cornbar/Macarena (20 pc)', 2),
(44, 'Bocarilyo (50 pc)', 2),
(45, 'Katol (50 pc)', 2),
(46, 'Lapad (50 pc)', 2),
(47, 'Silag (50 pc)', 2),
(48, 'Tamarind (50 pc)', 2),
(49, 'Tira-Tira (50 pc)', 2),
(50, 'With Mani (50 pc)', 2),
(51, 'Prawn Cracker (175 gms)', 2),
(52, 'Peanut Butter (small)', 3),
(53, 'Peanut Butter (tall)', 3),
(54, 'Peanut Butter (medium)', 3),
(55, 'Strawberry Jelly (big)', 3),
(56, 'Strawberry Jelly (small)', 3),
(57, 'Strawberry Buo (big)', 3),
(58, 'Strawberry Buo (small)', 3),
(59, 'Honey (2x2)', 3),
(60, 'Paminta (15pc)', 4),
(61, 'Paminta Ground (20gms)', 4),
(62, 'Paminta Crack (20gms)', 4),
(63, 'Paminta Whole (20gms)', 4),
(64, 'Paminta Ground (250gms)', 4),
(65, 'Paminta Crack (250gms)', 4),
(66, 'Paminta Whole (250gms)', 4),
(67, 'Laurel (15pc)', 4),
(68, 'Laurel (20gms)', 4),
(69, 'Garlic Fried (100gms)', 4),
(70, 'Curry Powder (50gms)', 4),
(71, 'Curry Powder (200gms)', 4),
(72, 'Star Anis (50gms)', 4),
(73, 'Chili Powder (20gms)', 4),
(74, 'Chili Powder (200gms)', 4),
(75, 'JP Bagoong Big (750ml)', 4),
(76, 'JP Bagoong Small (290ml)', 4),
(77, 'Merly\'s Bagoong (750ml)', 4),
(78, 'Merly\'s Bagoong (320ml)', 4),
(79, 'Pangasinan\'s Best Bagoong', 4),
(80, 'Patis (750ml)', 4),
(81, 'Patis (320ml)', 4),
(82, 'Padas (320ml)', 4),
(83, 'Colored Sprinkle (200gms)', 5),
(84, 'Choco Sprinkle (200gms)', 5),
(85, 'Choco Lentils (100gms)', 5),
(86, 'Peotraco Caster Suugar (24pcs)', 5),
(87, 'Peotraco Icing Sugar (24pcs)', 5),
(88, 'Confectioner\'s Icing Sugar (200gms)', 5),
(89, 'Desiccated Coconut (100gms)', 5),
(90, 'A & H Baking Soda (454 gms)', 5),
(91, 'Baking Soda (250gms)', 5),
(92, 'Baking Powder (250gms)', 5),
(93, 'Cupcake Liners with Asst Designs', 5),
(94, 'Sago Colored Big (400gms)', 5),
(95, 'Sago Colored Medium (400gms)', 5),
(96, 'Sago Colored Small (400gms)', 5),
(97, 'Sago White Big (400gms)', 5),
(98, 'Sago White Medium (400gms)', 5),
(99, 'Sago White Small (400gms)', 5),
(100, 'Polar (500gms)', 6),
(101, 'Kings (20pc x 25gms)', 6),
(102, 'Kangaroo (500gms)', 6),
(103, 'Erawan (500 gms)', 6),
(104, 'All-Purpose Flour 1st Class (1kg)', 6),
(105, 'All-Purpose Flour (1kg)', 6),
(106, 'Skim Milk (500gms)', 6),
(107, 'Skim Milk (250gms)', 6),
(108, 'Cake Flour (1kg)', 6),
(109, 'Cassava Flour (250gms)', 6),
(110, 'Cassava Flour (500gms)', 6),
(111, 'Leah\'s Cornstarch (250gms)', 6),
(112, 'Musovado (Raw Sugar) (500gms)', 6),
(113, 'Agar-agar (250gms)', 6),
(114, 'Agar Agar/Donfrank (50gms)', 6),
(115, 'Glutinous Rice Powder (250gms)', 6),
(116, 'Cheese Powder (100gms)', 6),
(117, 'Cheese Powder (200gms)', 6),
(118, 'Bensdrop Cocoa (200gms)', 6),
(119, 'Margarine (250gms)', 6),
(120, 'Star/Heart/Asst\'d (100gms)', 7),
(121, 'Mini MM (100gms)', 7),
(122, 'Canadian (100gms)', 7),
(123, 'Cubes (100gms)', 7),
(124, 'Mallow (100gms)', 7),
(125, 'Caterpillar (100gms)', 7),
(126, 'Snake  (100gms)', 7),
(127, 'Melon (100gms)', 7),
(128, 'Twist Rainbow (100gms)', 7),
(129, 'Choco LENTILS (100gms)', 7),
(130, 'Flower  (100gms)', 7),
(131, 'Jelly Balls (100gms)', 7),
(132, 'Wisel (100gms)', 7),
(133, 'Black Beans (250gms)', 8),
(134, 'White Beans (250gms)', 8),
(135, 'Red Beans (250gms)', 8),
(136, 'Mongo Buo  (250gms)', 8),
(137, 'Mongo Split  (250gms)', 8),
(138, 'Komeya 3Q (12pc x 500g)', 9),
(139, '3Q Bihon (12pc)', 9),
(140, 'Japanese Ramen Red (250gms)', 9),
(141, 'Macaroni Elbow (500gms)', 9),
(142, 'Macaroni Twist (500gms)', 9),
(143, 'Macaroni Shell (500gms)', 9),
(144, 'Spaghetti Mac (1kg)', 9),
(145, 'RICE (BIGAS) (10kg)', 9),
(146, 'RICE (BIGAS) (25kg)', 9),
(147, 'RICE (BIGAS) (50kg)', 9),
(148, 'Roll Bag 20x30 (20pc)', 10),
(149, 'Counter Bag/CALYPSO (60pc)', 10),
(150, 'Clingwrap (6pc)', 10),
(151, 'Aluminium Foil (8m)', 10),
(152, 'Aluminium Foil (5m)', 10),
(153, 'Nylon Tali (10pc x 400g)', 10),
(154, 'Starex (20 x 10)', 10),
(155, 'Guarntee Calypso (20 x 10)', 10),
(156, 'White Horse (20 x 10)', 10),
(157, 'Mini Apple Sando Bag (10 x 40)', 10),
(158, 'Tiny Texas Sando Bag (10 x 30)', 10),
(159, 'Medium Texas Sando Bag (10 x 15)', 10),
(160, 'Large Texas Sando Bag (10 x 10)', 10),
(161, 'Oil Repacking Plastic (100pcs) (6 x 14)', 10),
(162, 'Garbage bag  10\'s (XXL) (18 1/2x 18x1/2 x 40)', 10),
(163, 'Garbage bag  10\'s (XL) (18 1/2x 18x1/2 x 37)', 10),
(164, 'Garbage bag  10\'s (L) (13 x 13 x 32)', 10),
(165, 'Garbage bag  10\'s  (M) (11 x 11 x 25)', 10),
(166, 'Sandwich bag #2 (60pc)', 10),
(167, 'Bending Drinking Straw (100pc)', 10),
(168, 'Disposable Glove (50pc)', 10),
(169, 'Sago Drinking Straw (30pc)', 10),
(170, 'SP 10 ROUND (5pc)', 11),
(171, 'SP 16 ROUND (5pc)', 11),
(172, 'SP 30 ROUND (5pc)', 11),
(173, 'SP 10 ROUND (10pc)', 11),
(174, 'SP 16 ROUND (10pc)', 11),
(175, 'SP 30 ROUND (10pc)', 11),
(176, 'SP 500 RECTANGULAR (5pc)', 11),
(177, 'SP 750 RECTANGULAR  (5pc)', 11),
(178, 'SP 1000 RECTANGULAR  (5pc)', 11),
(179, 'SP 1600 RECTANGULAR  (5pc)', 11),
(180, 'SP 2500 RECTANGULAR  (5pc)', 11),
(181, 'SP 500 RECTANGULAR (10pc)', 11),
(182, 'SP 750 RECTANGULAR (10pc)', 11),
(183, 'SP 1000 RECTANGULAR (10pc)', 11),
(184, 'Packaging Tape Clear/Tan (12MMx50M)', 12),
(185, 'Packaging Tape Clear/Tan (12MMx100M)', 12),
(186, 'Packaging Tape Clear/Tan (24MMx50M)', 12),
(187, 'Packaging Tape Clear/Tan (48MMx50M)', 12),
(188, 'Packaging Tape Clear/Tan (24MMx100M)', 12),
(189, 'Packaging Tape Clear/Tan (48MMx100M)', 12),
(190, 'Kraft Tape (24MMx50YRDS)', 12),
(191, 'Cloth Duct Tape (48MMx25M)', 12),
(192, 'Cloth Duct Tape (72MM x 25M)', 12),
(193, 'Aluminum Tape (48MM x 50YRDS)', 12),
(194, 'Floor Marketing tape (48MM x 33YRDS)', 12),
(195, 'Kraft Tape (48 MM X 50 YRDS)', 12),
(196, 'Double Sided Tape (12MM X 10M)', 12),
(197, 'Double Sided Tape (12MM X 50M)', 12),
(198, 'Double Sided Tape (24MM X 50M)', 12),
(199, 'Double Sided Tape (48MM X 50M)', 12),
(200, 'Masking Tape (12MM X 15 YRDS)', 12),
(201, 'Masking Tape (24MM X 15 YRDS)', 12),
(202, 'Masking Tape (48MM X 15 YRDS)', 12),
(203, 'Masking Tape (12MM X 20 YRDS)', 12),
(204, 'Masking Tape (24MM X 20 YRDS)', 12),
(205, 'Masking Tape (48MM X 20 YRDS)', 12),
(206, 'Masking Tape (12MM X 25 YRDS)', 12),
(207, 'Masking Tape (24MM X 25 YRDS)', 12),
(208, 'Masking Tape (48MM X 25 YRDS )', 12),
(209, 'Nopi Tape (9MM X 40M )', 12),
(210, 'Small bubble Bag (1M X 52")', 12),
(211, 'Big Bubble Bag (1M X 40")', 12),
(235, 'Candy', 1),
(236, 'Dog', 1),
(237, 'Chocolate', 1),
(238, 'Dog', 1),
(239, 'water', 1),
(240, 'Empanado', 1);

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
(1, 'Baguio', 'Enabled', '1.5', ''),
(1, 'Pangasinan', 'Enabled', '1.5', ''),
(2, 'Baguio', 'Enabled', '10', NULL),
(2, 'Pangasinan', 'Enabled', '123', NULL),
(3, 'Baguio', 'Enabled', '412', NULL),
(3, 'Pangasinan', 'Enabled', '123', NULL),
(4, 'Baguio', 'Enabled', '412', NULL),
(4, 'Pangasinan', 'Enabled', '213', NULL),
(5, 'Baguio', 'Enabled', '213', NULL),
(5, 'Pangasinan', 'Enabled', '4221', NULL),
(239, 'Baguio', 'Enabled', '20', '123213aasd'),
(239, 'Pangasinan', 'Enabled', '20', '123213aasd'),
(240, 'Baguio', 'Disabled', '12.00', '19090123'),
(240, 'Pangasinan', 'Disabled', '90.00', '19090123');

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
  ADD KEY `issue_acc_idx` (`issue_account`),
  ADD KEY `client_id_idx` (`client_id`);

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
  MODIFY `acc_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
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
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `c_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `iS_inventoryid` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `issuance`
--
ALTER TABLE `issuance`
  MODIFY `issue_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `ledger`
--
ALTER TABLE `ledger`
  MODIFY `ledger_id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `logs_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `productList_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;
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
-- Constraints for table `issuance`
--
ALTER TABLE `issuance`
  ADD CONSTRAINT `client_id` FOREIGN KEY (`client_id`) REFERENCES `clients` (`c_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
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
