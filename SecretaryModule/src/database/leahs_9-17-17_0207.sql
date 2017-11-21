-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2017 at 06:06 PM
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
(2, 'Chicken', 1, '38.00'),
(3, 'De Recado', 1, '38.00'),
(4, 'Hamondo', 1, '38.00'),
(5, 'Vigan', 1, '38.00'),
(6, 'Smoked Hamondo (500 gms)', 1, '63.00'),
(7, 'Smoked Hamondo (250 gms)', 1, '32.50'),
(8, 'Smoked Vigan (500 gms)', 1, '78.00'),
(9, 'Smoked Vigan (250 gms)', 1, '40.00'),
(10, 'Embotido (450 gms)', 1, '70.00'),
(11, 'Embotido (250 gms)', 1, '39.00'),
(12, 'Tocino (500gms)', 1, '70.00'),
(13, 'Tocino (200gms)', 1, '40.00'),
(14, 'Lumpiang Shanghai', 1, '36.00'),
(15, 'Bangus Shanghai', 1, '36.00'),
(16, 'Chicken Shanghai', 1, '36.00'),
(17, 'Burger Patties (200 gms)', 1, '35.00'),
(18, 'Fish Ball (500 gms)', 1, '35.00'),
(19, 'Fish Ball (250 gms)', 1, '20.50'),
(20, 'Kikiam (500 gms)', 1, '50.00'),
(21, 'Kikiam (250 gms)', 1, '27.00'),
(22, 'Fish Lumpia (500 gms)', 1, '29.00'),
(23, 'Chicken Balls (250 gms)', 1, '34.50'),
(24, 'Squid Balls (250 gms)', 1, '34.50'),
(25, 'Jumbo Hotdog (500 gms)', 1, '85.00'),
(26, 'Jumbo Hotdog (250 gms)', 1, '45.50'),
(27, 'Odocs (500 gms)', 1, '128.00'),
(28, 'Odocs (250 gms)', 1, '66.00'),
(29, 'Green Peas (400 gms)', 1, '55.00'),
(30, 'Green Peas (200 gms)', 1, '30.00'),
(31, 'Mixed Vegetable (400 gms)', 1, '55.00'),
(32, 'Mixed Vegetable (200 gms)', 1, '30.00'),
(33, 'French Fries (500 gms)', 1, '62.00'),
(34, 'French Fries (1 kg)', 1, '120.00'),
(35, 'French Fries (2.5 kg)', 1, '300.00'),
(36, 'Puto Seco (25 pc)', 2, '4.50'),
(37, 'Long Rice (20 pc)', 2, '9.00'),
(38, 'Meringue (20 pc)', 2, '9.00'),
(39, 'Pop Rice Round (15 pc)', 2, '9.00'),
(40, 'Pop Rice Square (20 pc)', 2, '9.00'),
(41, 'Belicoy (50 pc)', 2, '8.50'),
(42, 'Bilog (50 pc)', 2, '8.50'),
(43, 'Cornbar/Macarena (20 pc)', 2, '9.00'),
(44, 'Bocarilyo (50 pc)', 2, '8.50'),
(45, 'Katol (50 pc)', 2, '8.50'),
(46, 'Lapad (50 pc)', 2, '8.50'),
(47, 'Silag (50 pc)', 2, '8.50'),
(48, 'Tamarind (50 pc)', 2, '8.50'),
(49, 'Tira-Tira (50 pc)', 2, '8.50'),
(50, 'With Mani (50 pc)', 2, '8.50'),
(51, 'Prawn Cracker (175 gms)', 2, '44.50'),
(52, 'Peanut Butter (small)', 3, '47.00'),
(53, 'Peanut Butter (tall)', 3, '81.00'),
(54, 'Peanut Butter (medium)', 3, '70.00'),
(55, 'Strawberry Jelly (big)', 3, '48.00'),
(56, 'Strawberry Jelly (small)', 3, '35.00'),
(57, 'Strawberry Buo (big)', 3, '87.00'),
(58, 'Strawberry Buo (small)', 3, '53.00'),
(59, 'Honey (2x2)', 3, '82.00'),
(60, 'Paminta (15pc)', 4, '9.50'),
(61, 'Paminta Ground (20gms)', 4, '18.00'),
(62, 'Paminta Crack (20gms)', 4, '18.00'),
(63, 'Paminta Whole (20gms)', 4, '18.00'),
(64, 'Paminta Ground (250gms)', 4, '210.00'),
(65, 'Paminta Crack (250gms)', 4, '210.00'),
(66, 'Paminta Whole (250gms)', 4, '210.00'),
(67, 'Laurel (15pc)', 4, '9.50'),
(68, 'Laurel (20gms)', 4, '14.00'),
(69, 'Garlic Fried (100gms)', 4, '22.00'),
(70, 'Curry Powder (50gms)', 4, '18.50'),
(71, 'Curry Powder (200gms)', 4, '65.00'),
(72, 'Star Anis (50gms)', 4, '27.50'),
(73, 'Chili Powder (20gms)', 4, '16.50'),
(74, 'Chili Powder (200gms)', 4, '78.50'),
(75, 'JP Bagoong Big (750ml)', 4, '26.50'),
(76, 'JP Bagoong Small (290ml)', 4, '14.00'),
(77, 'Merly\'s Bagoong (750ml)', 4, '28.50'),
(78, 'Merly\'s Bagoong (320ml)', 4, '15.25'),
(79, 'Pangasinan\'s Best Bagoong', 4, '14.00'),
(80, 'Patis (750ml)', 4, '27.25'),
(81, 'Patis (320ml)', 4, '15.00'),
(82, 'Padas (320ml)', 4, '35.00'),
(83, 'Colored Sprinkle (200gms)', 5, '37.50'),
(84, 'Choco Sprinkle (200gms)', 5, '43.00'),
(85, 'Choco Lentils (100gms)', 5, '30.00'),
(86, 'Peotraco Caster Suugar (24pcs)', 5, '57.00'),
(87, 'Peotraco Icing Sugar (24pcs)', 5, '57.00'),
(88, 'Confectioner\'s Icing Sugar (200gms)', 5, '24.50'),
(89, 'Desiccated Coconut (100gms)', 5, '16.50'),
(90, 'A & H Baking Soda (454 gms)', 5, '79.80'),
(91, 'Baking Soda (250gms)', 5, '18.50'),
(92, 'Baking Powder (250gms)', 5, '15.00'),
(93, 'Cupcake Liners with Asst Designs', 5, '51.00'),
(94, 'Sago Colored Big (400gms)', 5, '34.50'),
(95, 'Sago Colored Medium (400gms)', 5, '34.50'),
(96, 'Sago Colored Small (400gms)', 5, '34.50'),
(97, 'Sago White Big (400gms)', 5, '32.50'),
(98, 'Sago White Medium (400gms)', 5, '32.50'),
(99, 'Sago White Small (400gms)', 5, '32.50'),
(100, 'Polar (500gms)', 6, '39.50'),
(101, 'Kings (20pc x 25gms)', 6, '39.50'),
(102, 'Kangaroo (500gms)', 6, '39.50'),
(103, 'Erawan (500 gms)', 6, '44.00'),
(104, 'All-Purpose Flour 1st Class (1kg)', 6, '45.00'),
(105, 'All-Purpose Flour (1kg)', 6, '38.00'),
(106, 'Skim Milk (500gms)', 6, '32.00'),
(107, 'Skim Milk (250gms)', 6, '17.50'),
(108, 'Cake Flour (1kg)', 6, '55.00'),
(109, 'Cassava Flour (250gms)', 6, '17.50'),
(110, 'Cassava Flour (500gms)', 6, '32.50'),
(111, 'Leah\'s Cornstarch (250gms)', 6, '17.50'),
(112, 'Musovado (Raw Sugar) (500gms)', 6, '55.00'),
(113, 'Agar-agar (250gms)', 6, '90.00'),
(114, 'Agar Agar/Donfrank (50gms)', 6, '25.00'),
(115, 'Glutinous Rice Powder (250gms)', 6, '25.00'),
(116, 'Cheese Powder (100gms)', 6, '25.00'),
(117, 'Cheese Powder (200gms)', 6, '32.00'),
(118, 'Bensdrop Cocoa (200gms)', 6, '86.00'),
(119, 'Margarine (250gms)', 6, '24.25'),
(120, 'Star/Heart/Asst\'d (100gms)', 7, '20.00'),
(121, 'Mini MM (100gms)', 7, '20.00'),
(122, 'Canadian (100gms)', 7, '20.00'),
(123, 'Cubes (100gms)', 7, '20.00'),
(124, 'Mallow (100gms)', 7, '20.00'),
(125, 'Caterpillar (100gms)', 7, '20.00'),
(126, 'Snake  (100gms)', 7, '20.00'),
(127, 'Melon (100gms)', 7, '20.00'),
(128, 'Twist Rainbow (100gms)', 7, '20.00'),
(129, 'Choco LENTILS (100gms)', 7, '20.00'),
(130, 'Flower  (100gms)', 7, '20.00'),
(131, 'Jelly Balls (100gms)', 7, '20.00'),
(132, 'Wisel (100gms)', 7, '20.00'),
(133, 'Black Beans (250gms)', 8, '23.50'),
(134, 'White Beans (250gms)', 8, '23.50'),
(135, 'Red Beans (250gms)', 8, '32.50'),
(136, 'Mongo Buo  (250gms)', 8, '25.50'),
(137, 'Mongo Split  (250gms)', 8, '25.50'),
(138, 'Komeya 3Q (12pc x 500g)', 9, '310.00'),
(139, '3Q Bihon (12pc)', 9, '25.85'),
(140, 'Japanese Ramen Red (250gms)', 9, '12.50'),
(141, 'Macaroni Elbow (500gms)', 9, '27.50'),
(142, 'Macaroni Twist (500gms)', 9, '27.50'),
(143, 'Macaroni Shell (500gms)', 9, '27.50'),
(144, 'Spaghetti Mac (1kg)', 9, '56.00'),
(145, 'RICE (BIGAS) (10kg)', 9, '0.00'),
(146, 'RICE (BIGAS) (25kg)', 9, '0.00'),
(147, 'RICE (BIGAS) (50kg)', 9, '0.00'),
(148, 'Roll Bag 20x30 (20pc)', 10, '155.00'),
(149, 'Counter Bag/CALYPSO (60pc)', 10, '16.50'),
(150, 'Clingwrap (6pc)', 10, '298.00'),
(151, 'Aluminium Foil (8m)', 10, '27.00'),
(152, 'Aluminium Foil (5m)', 10, '22.00'),
(153, 'Nylon Tali (10pc x 400g)', 10, '298.00'),
(154, 'Starex (20 x 10)', 10, '16.50'),
(155, 'Guarntee Calypso (20 x 10)', 10, '16.50'),
(156, 'White Horse (20 x 10)', 10, '16.50'),
(157, 'Mini Apple Sando Bag (10 x 40)', 10, '9.25'),
(158, 'Tiny Texas Sando Bag (10 x 30)', 10, '13.25'),
(159, 'Medium Texas Sando Bag (10 x 15)', 10, '25.50'),
(160, 'Large Texas Sando Bag (10 x 10)', 10, '42.25'),
(161, 'Oil Repacking Plastic (100pcs) (6 x 14)', 10, '365.00'),
(162, 'Garbage bag  10\'s (XXL) (18 1/2x 18x1/2 x 40)', 10, '72.50'),
(163, 'Garbage bag  10\'s (XL) (18 1/2x 18x1/2 x 37)', 10, '68.00'),
(164, 'Garbage bag  10\'s (L) (13 x 13 x 32)', 10, '50.00'),
(165, 'Garbage bag  10\'s  (M) (11 x 11 x 25)', 10, '35.00'),
(166, 'Sandwich bag #2 (60pc)', 10, '17.50'),
(167, 'Bending Drinking Straw (100pc)', 10, '24.00'),
(168, 'Disposable Glove (50pc)', 10, '22.50'),
(169, 'Sago Drinking Straw (30pc)', 10, '20.50'),
(170, 'SP 10 ROUND (5pc)', 11, '32.00'),
(171, 'SP 16 ROUND (5pc)', 11, '35.00'),
(172, 'SP 30 ROUND (5pc)', 11, '40.00'),
(173, 'SP 10 ROUND (10pc)', 11, '52.00'),
(174, 'SP 16 ROUND (10pc)', 11, '58.00'),
(175, 'SP 30 ROUND (10pc)', 11, '68.00'),
(176, 'SP 500 RECTANGULAR (5pc)', 11, '45.00'),
(177, 'SP 750 RECTANGULAR  (5pc)', 11, '50.00'),
(178, 'SP 1000 RECTANGULAR  (5pc)', 11, '55.00'),
(179, 'SP 1600 RECTANGULAR  (5pc)', 11, '80.00'),
(180, 'SP 2500 RECTANGULAR  (5pc)', 11, '125.00'),
(181, 'SP 500 RECTANGULAR (10pc)', 11, '75.00'),
(182, 'SP 750 RECTANGULAR (10pc)', 11, '83.00'),
(183, 'SP 1000 RECTANGULAR (10pc)', 11, '92.00'),
(184, 'Packaging Tape Clear/Tan (12MMx50M)', 12, '6.00'),
(185, 'Packaging Tape Clear/Tan (12MMx100M)', 12, '10.00'),
(186, 'Packaging Tape Clear/Tan (24MMx50M)', 12, '11.25'),
(187, 'Packaging Tape Clear/Tan (48MMx50M)', 12, '25.00'),
(188, 'Packaging Tape Clear/Tan (24MMx100M)', 12, '25.00'),
(189, 'Packaging Tape Clear/Tan (48MMx100M)', 12, '37.00'),
(190, 'Kraft Tape (24MMx50YRDS)', 12, '56.80'),
(191, 'Cloth Duct Tape (48MMx25M)', 12, '265.00'),
(192, 'Cloth Duct Tape (72MM x 25M)', 12, '335.00'),
(193, 'Aluminum Tape (48MM x 50YRDS)', 12, '355.00'),
(194, 'Floor Marketing tape (48MM x 33YRDS)', 12, '155.00'),
(195, 'Kraft Tape (48 MM X 50 YRDS)', 12, '102.80'),
(196, 'Double Sided Tape (12MM X 10M)', 12, '9.25'),
(197, 'Double Sided Tape (12MM X 50M)', 12, '37.28'),
(198, 'Double Sided Tape (24MM X 50M)', 12, '72.80'),
(199, 'Double Sided Tape (48MM X 50M)', 12, '138.00'),
(200, 'Masking Tape (12MM X 15 YRDS)', 12, '7.80'),
(201, 'Masking Tape (24MM X 15 YRDS)', 12, '14.85'),
(202, 'Masking Tape (48MM X 15 YRDS)', 12, '27.80'),
(203, 'Masking Tape (12MM X 20 YRDS)', 12, '10.80'),
(204, 'Masking Tape (24MM X 20 YRDS)', 12, '18.90'),
(205, 'Masking Tape (48MM X 20 YRDS)', 12, '36.80'),
(206, 'Masking Tape (12MM X 25 YRDS)', 12, '12.80'),
(207, 'Masking Tape (24MM X 25 YRDS)', 12, '22.98'),
(208, 'Masking Tape (48MM X 25 YRDS )', 12, '44.80'),
(209, 'Nopi Tape (9MM X 40M )', 12, '21.80'),
(210, 'Small bubble Bag (1M X 52")', 12, '38.50'),
(211, 'Big Bubble Bag (1M X 40")', 12, '37.80'),
(212, 'dog meat (5gms)', 1, '45.00');

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
