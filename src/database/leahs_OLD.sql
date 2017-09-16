-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 10, 2017 at 02:32 PM
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
  `password` varchar(50) NOT NULL,
  `email` varchar(20) NOT NULL,
  `contact_no` varchar(20) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'Disabled',
  `acctype_id` int(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`acc_id`, `username`, `first_name`, `last_name`, `password`, `email`, `contact_no`, `status`, `acctype_id`) VALUES
(1, 'ahlexrull', 'Alexandria', 'Rull', '123', 'ahlexrull@aol.com', '09772570566', 'Enabled', NULL),
(2, 'rob', 'Robijn', 'Tabisula', '123', 'rob', '21535', 'Enabled', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `acc_type`
--

CREATE TABLE `acc_type` (
  `acctype_id` int(12) NOT NULL,
  `acctype_name` varchar(20) NOT NULL,
  `acctype_role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bad_order`
--

CREATE TABLE `bad_order` (
  `bo_id` int(15) NOT NULL,
  `bo_price` int(20) NOT NULL,
  `bo_dateReleased` datetime(6) NOT NULL,
  `bo_quantity` int(10) NOT NULL,
  `bo_product_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `category_id` int(15) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `category_quantity` int(10) DEFAULT NULL,
  `category_status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`category_id`, `category_name`, `category_quantity`, `category_status`) VALUES
(1, 'Specialty Products', NULL, NULL),
(2, 'Sweets', NULL, NULL),
(3, 'Jam & Jellies', NULL, NULL),
(4, 'Condiments, Sauces, & Oils', NULL, NULL),
(5, 'Baking Products', NULL, NULL),
(6, 'Glutinous/Powders', NULL, NULL),
(7, 'Mallows/Gummies', NULL, NULL),
(8, 'Beans/Mongo', NULL, NULL),
(9, 'Others', NULL, NULL),
(10, 'Roll Bag/Plastic Bags/Drinking Straws', NULL, NULL),
(11, 'Microwave Containers', NULL, NULL),
(12, 'Stationary Products', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `c_id` int(15) NOT NULL,
  `c_name` varchar(20) NOT NULL,
  `c_address` varchar(20) NOT NULL,
  `c_contact_no` int(20) NOT NULL,
  `c_contact_person` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`c_id`, `c_name`, `c_address`, `c_contact_no`, `c_contact_person`) VALUES
(1, 'Alexandria', 'North Cambridge', 2, 'Alex');

-- --------------------------------------------------------

--
-- Table structure for table `client_reports`
--

CREATE TABLE `client_reports` (
  `cR_product_id` int(15) NOT NULL,
  `clients` varchar(20) NOT NULL,
  `cR_sales` int(10) NOT NULL,
  `cR_id` int(15) NOT NULL,
  `cR_others` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_status`
--

CREATE TABLE `inventory_status` (
  `iS_product_id` int(15) NOT NULL,
  `iS_re-stock_lvl` int(10) NOT NULL,
  `iS_quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `issuance`
--

CREATE TABLE `issuance` (
  `issue_id` int(15) NOT NULL,
  `issue_date_time` datetime(6) NOT NULL,
  `client_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `issuance`
--

INSERT INTO `issuance` (`issue_id`, `issue_date_time`, `client_id`) VALUES
(1, '0009-10-17 00:00:00.000000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `issuance_list`
--

CREATE TABLE `issuance_list` (
  `issue_id` int(15) NOT NULL,
  `prod_qty` int(15) NOT NULL,
  `prod_price` int(15) NOT NULL,
  `prod_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `issuance_list`
--

INSERT INTO `issuance_list` (`issue_id`, `prod_qty`, `prod_price`, `prod_id`) VALUES
(1, 5, 50, 1),
(1, 65, 100, 2);

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
  `productList_barcode` int(15) DEFAULT NULL,
  `productList_name` varchar(50) DEFAULT NULL,
  `category_id` int(15) NOT NULL,
  `productList_price` decimal(13,2) DEFAULT NULL,
  `productList_status` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`productList_id`, `productList_barcode`, `productList_name`, `category_id`, `productList_price`, `productList_status`) VALUES
(1, NULL, 'Beef', 1, '38.00', NULL),
(2, NULL, 'Chicken', 1, '38.00', NULL),
(3, NULL, 'De Recado', 1, '38.00', NULL),
(4, NULL, 'Hamondo', 1, '38.00', NULL),
(5, NULL, 'Vigan', 1, '38.00', NULL),
(6, NULL, 'Smoked Hamondo (500 gms)', 1, '63.00', NULL),
(7, NULL, 'Smoked Hamondo (250 gms)', 1, '32.50', NULL),
(8, NULL, 'Smoked Vigan (500 gms)', 1, '78.00', NULL),
(9, NULL, 'Smoked Vigan (250 gms)', 1, '40.00', NULL),
(10, NULL, 'Embotido (450 gms)', 1, '70.00', NULL),
(11, NULL, 'Embotido (250 gms)', 1, '39.00', NULL),
(12, NULL, 'Tocino (500gms)', 1, '70.00', NULL),
(13, NULL, 'Tocino (200gms)', 1, '40.00', NULL),
(14, NULL, 'Lumpiang Shanghai', 1, '36.00', NULL),
(15, NULL, 'Bangus Shanghai', 1, '36.00', NULL),
(16, NULL, 'Chicken Shanghai', 1, '36.00', NULL),
(17, NULL, 'Burger Patties (200 gms)', 1, '35.00', NULL),
(18, NULL, 'Fish Ball (500 gms)', 1, '35.00', NULL),
(19, NULL, 'Fish Ball (250 gms)', 1, '20.50', NULL),
(20, NULL, 'Kikiam (500 gms)', 1, '50.00', NULL),
(21, NULL, 'Kikiam (250 gms)', 1, '27.00', NULL),
(22, NULL, 'Fish Lumpia (500 gms)', 1, '29.00', NULL),
(23, NULL, 'Chicken Balls (250 gms)', 1, '34.50', NULL),
(24, NULL, 'Squid Balls (250 gms)', 1, '34.50', NULL),
(25, NULL, 'Jumbo Hotdog (500 gms)', 1, '85.00', NULL),
(26, NULL, 'Jumbo Hotdog (250 gms)', 1, '45.50', NULL),
(27, NULL, 'Odocs (500 gms)', 1, '128.00', NULL),
(28, NULL, 'Odocs (250 gms)', 1, '66.00', NULL),
(29, NULL, 'Green Peas (400 gms)', 1, '55.00', NULL),
(30, NULL, 'Green Peas (200 gms)', 1, '30.00', NULL),
(31, NULL, 'Mixed Vegetable (400 gms)', 1, '55.00', NULL),
(32, NULL, 'Mixed Vegetable (200 gms)', 1, '30.00', NULL),
(33, NULL, 'French Fries (500 gms)', 1, '62.00', NULL),
(34, NULL, 'French Fries (1 kg)', 1, '120.00', NULL),
(35, NULL, 'French Fries (2.5 kg)', 1, '300.00', NULL),
(36, NULL, 'Puto Seco (25 pc)', 2, '4.50', NULL),
(37, NULL, 'Long Rice (20 pc)', 2, '9.00', NULL),
(38, NULL, 'Meringue (20 pc)', 2, '9.00', NULL),
(39, NULL, 'Pop Rice Round (15 pc)', 2, '9.00', NULL),
(40, NULL, 'Pop Rice Square (20 pc)', 2, '9.00', NULL),
(41, NULL, 'Belicoy (50 pc)', 2, '8.50', NULL),
(42, NULL, 'Bilog (50 pc)', 2, '8.50', NULL),
(43, NULL, 'Cornbar/Macarena (20 pc)', 2, '9.00', NULL),
(44, NULL, 'Bocarilyo (50 pc)', 2, '8.50', NULL),
(45, NULL, 'Katol (50 pc)', 2, '8.50', NULL),
(46, NULL, 'Lapad (50 pc)', 2, '8.50', NULL),
(47, NULL, 'Silag (50 pc)', 2, '8.50', NULL),
(48, NULL, 'Tamarind (50 pc)', 2, '8.50', NULL),
(49, NULL, 'Tira-Tira (50 pc)', 2, '8.50', NULL),
(50, NULL, 'With Mani (50 pc)', 2, '8.50', NULL),
(51, NULL, 'Prawn Cracker (175 gms)', 2, '44.50', NULL),
(52, NULL, 'Peanut Butter (small)', 3, '47.00', NULL),
(53, NULL, 'Peanut Butter (tall)', 3, '81.00', NULL),
(54, NULL, 'Peanut Butter (medium)', 3, '70.00', NULL),
(55, NULL, 'Strawberry Jelly (big)', 3, '48.00', NULL),
(56, NULL, 'Strawberry Jelly (small)', 3, '35.00', NULL),
(57, NULL, 'Strawberry Buo (big)', 3, '87.00', NULL),
(58, NULL, 'Strawberry Buo (small)', 3, '53.00', NULL),
(59, NULL, 'Honey (2x2)', 3, '82.00', NULL),
(60, NULL, 'Paminta (15pc)', 4, '9.50', NULL),
(61, NULL, 'Paminta Ground (20gms)', 4, '18.00', NULL),
(62, NULL, 'Paminta Crack (20gms)', 4, '18.00', NULL),
(63, NULL, 'Paminta Whole (20gms)', 4, '18.00', NULL),
(64, NULL, 'Paminta Ground (250gms)', 4, '210.00', NULL),
(65, NULL, 'Paminta Crack (250gms)', 4, '210.00', NULL),
(66, NULL, 'Paminta Whole (250gms)', 4, '210.00', NULL),
(67, NULL, 'Laurel (15pc)', 4, '9.50', NULL),
(68, NULL, 'Laurel (20gms)', 4, '14.00', NULL),
(69, NULL, 'Garlic Fried (100gms)', 4, '22.00', NULL),
(70, NULL, 'Curry Powder (50gms)', 4, '18.50', NULL),
(71, NULL, 'Curry Powder (200gms)', 4, '65.00', NULL),
(72, NULL, 'Star Anis (50gms)', 4, '27.50', NULL),
(73, NULL, 'Chili Powder (20gms)', 4, '16.50', NULL),
(74, NULL, 'Chili Powder (200gms)', 4, '78.50', NULL),
(75, NULL, 'JP Bagoong Big (750ml)', 4, '26.50', NULL),
(76, NULL, 'JP Bagoong Small (290ml)', 4, '14.00', NULL),
(77, NULL, 'Merly\'s Bagoong (750ml)', 4, '28.50', NULL),
(78, NULL, 'Merly\'s Bagoong (320ml)', 4, '15.25', NULL),
(79, NULL, 'Pangasinan\'s Best Bagoong', 4, '14.00', NULL),
(80, NULL, 'Patis (750ml)', 4, '27.25', NULL),
(81, NULL, 'Patis (320ml)', 4, '15.00', NULL),
(82, NULL, 'Padas (320ml)', 4, '35.00', NULL),
(83, NULL, 'Colored Sprinkle (200gms)', 5, '37.50', NULL),
(84, NULL, 'Choco Sprinkle (200gms)', 5, '43.00', NULL),
(85, NULL, 'Choco Lentils (100gms)', 5, '30.00', NULL),
(86, NULL, 'Peotraco Caster Suugar (24pcs)', 5, '57.00', NULL),
(87, NULL, 'Peotraco Icing Sugar (24pcs)', 5, '57.00', NULL),
(88, NULL, 'Confectioner\'s Icing Sugar (200gms)', 5, '24.50', NULL),
(89, NULL, 'Desiccated Coconut (100gms)', 5, '16.50', NULL),
(90, NULL, 'A & H Baking Soda (454 gms)', 5, '79.80', NULL),
(91, NULL, 'Baking Soda (250gms)', 5, '18.50', NULL),
(92, NULL, 'Baking Powder (250gms)', 5, '15.00', NULL),
(93, NULL, 'Cupcake Liners with Asst Designs', 5, '51.00', NULL),
(94, NULL, 'Sago Colored Big (400gms)', 5, '34.50', NULL),
(95, NULL, 'Sago Colored Medium (400gms)', 5, '34.50', NULL),
(96, NULL, 'Sago Colored Small (400gms)', 5, '34.50', NULL),
(97, NULL, 'Sago White Big (400gms)', 5, '32.50', NULL),
(98, NULL, 'Sago White Medium (400gms)', 5, '32.50', NULL),
(99, NULL, 'Sago White Small (400gms)', 5, '32.50', NULL),
(100, NULL, 'Polar (500gms)', 6, '39.50', NULL),
(101, NULL, 'Kings (20pc x 25gms)', 6, '39.50', NULL),
(102, NULL, 'Kangaroo (500gms)', 6, '39.50', NULL),
(103, NULL, 'Erawan (500 gms)', 6, '44.00', NULL),
(104, NULL, 'All-Purpose Flour 1st Class (1kg)', 6, '45.00', NULL),
(105, NULL, 'All-Purpose Flour (1kg)', 6, '38.00', NULL),
(106, NULL, 'Skim Milk (500gms)', 6, '32.00', NULL),
(107, NULL, 'Skim Milk (250gms)', 6, '17.50', NULL),
(108, NULL, 'Cake Flour (1kg)', 6, '55.00', NULL),
(109, NULL, 'Cassava Flour (250gms)', 6, '17.50', NULL),
(110, NULL, 'Cassava Flour (500gms)', 6, '32.50', NULL),
(111, NULL, 'Leah\'s Cornstarch (250gms)', 6, '17.50', NULL),
(112, NULL, 'Musovado (Raw Sugar) (500gms)', 6, '55.00', NULL),
(113, NULL, 'Agar-agar (250gms)', 6, '90.00', NULL),
(114, NULL, 'Agar Agar/Donfrank (50gms)', 6, '25.00', NULL),
(115, NULL, 'Glutinous Rice Powder (250gms)', 6, '25.00', NULL),
(116, NULL, 'Cheese Powder (100gms)', 6, '25.00', NULL),
(117, NULL, 'Cheese Powder (200gms)', 6, '32.00', NULL),
(118, NULL, 'Bensdrop Cocoa (200gms)', 6, '86.00', NULL),
(119, NULL, 'Margarine (250gms)', 6, '24.25', NULL),
(120, NULL, 'Star/Heart/Asst\'d (100gms)', 7, '20.00', NULL),
(121, NULL, 'Mini MM (100gms)', 7, '20.00', NULL),
(122, NULL, 'Canadian (100gms)', 7, '20.00', NULL),
(123, NULL, 'Cubes (100gms)', 7, '20.00', NULL),
(124, NULL, 'Mallow (100gms)', 7, '20.00', NULL),
(125, NULL, 'Caterpillar (100gms)', 7, '20.00', NULL),
(126, NULL, 'Snake  (100gms)', 7, '20.00', NULL),
(127, NULL, 'Melon (100gms)', 7, '20.00', NULL),
(128, NULL, 'Twist Rainbow (100gms)', 7, '20.00', NULL),
(129, NULL, 'Choco LENTILS (100gms)', 7, '20.00', NULL),
(130, NULL, 'Flower  (100gms)', 7, '20.00', NULL),
(131, NULL, 'Jelly Balls (100gms)', 7, '20.00', NULL),
(132, NULL, 'Wisel (100gms)', 7, '20.00', NULL),
(133, NULL, 'Black Beans (250gms)', 8, '23.50', NULL),
(134, NULL, 'White Beans (250gms)', 8, '23.50', NULL),
(135, NULL, 'Red Beans (250gms)', 8, '32.50', NULL),
(136, NULL, 'Mongo Buo  (250gms)', 8, '25.50', NULL),
(137, NULL, 'Mongo Split  (250gms)', 8, '25.50', NULL),
(138, NULL, 'Komeya 3Q (12pc x 500g)', 9, '310.00', NULL),
(139, NULL, '3Q Bihon (12pc)', 9, '25.85', NULL),
(140, NULL, 'Japanese Ramen Red (250gms)', 9, '12.50', NULL),
(141, NULL, 'Macaroni Elbow (500gms)', 9, '27.50', NULL),
(142, NULL, 'Macaroni Twist (500gms)', 9, '27.50', NULL),
(143, NULL, 'Macaroni Shell (500gms)', 9, '27.50', NULL),
(144, NULL, 'Spaghetti Mac (1kg)', 9, '56.00', NULL),
(145, NULL, 'RICE (BIGAS) (10kg)', 9, NULL, NULL),
(146, NULL, 'RICE (BIGAS) (25kg)', 9, NULL, NULL),
(147, NULL, 'RICE (BIGAS) (50kg)', 9, NULL, NULL),
(148, NULL, 'Roll Bag 20x30 (20pc)', 10, '155.00', NULL),
(149, NULL, 'Counter Bag/CALYPSO (60pc)', 10, '16.50', NULL),
(150, NULL, 'Clingwrap (6pc)', 10, '298.00', NULL),
(151, NULL, 'Aluminium Foil (8m)', 10, '27.00', NULL),
(152, NULL, 'Aluminium Foil (5m)', 10, '22.00', NULL),
(153, NULL, 'Nylon Tali (10pc x 400g)', 10, '298.00', NULL),
(154, NULL, 'Starex (20 x 10)', 10, '16.50', NULL),
(155, NULL, 'Guarntee Calypso (20 x 10)', 10, '16.50', NULL),
(156, NULL, 'White Horse (20 x 10)', 10, '16.50', NULL),
(157, NULL, 'Mini Apple Sando Bag (10 x 40)', 10, '9.25', NULL),
(158, NULL, 'Tiny Texas Sando Bag (10 x 30)', 10, '13.25', NULL),
(159, NULL, 'Medium Texas Sando Bag (10 x 15)', 10, '25.50', NULL),
(160, NULL, 'Large Texas Sando Bag (10 x 10)', 10, '42.25', NULL),
(161, NULL, 'Oil Repacking Plastic (100pcs) (6 x 14)', 10, '365.00', NULL),
(162, NULL, 'Garbage bag  10\'s (XXL) (18 1/2x 18x1/2 x 40)', 10, '72.50', NULL),
(163, NULL, 'Garbage bag  10\'s (XL) (18 1/2x 18x1/2 x 37)', 10, '68.00', NULL),
(164, NULL, 'Garbage bag  10\'s (L) (13 x 13 x 32)', 10, '50.00', NULL),
(165, NULL, 'Garbage bag  10\'s  (M) (11 x 11 x 25)', 10, '35.00', NULL),
(166, NULL, 'Sandwich bag #2 (60pc)', 10, '17.50', NULL),
(167, NULL, 'Bending Drinking Straw (100pc)', 10, '24.00', NULL),
(168, NULL, 'Disposable Glove (50pc)', 10, '22.50', NULL),
(169, NULL, 'Sago Drinking Straw (30pc)', 10, '20.50', NULL),
(170, NULL, 'SP 10 ROUND (5pc)', 11, '32.00', NULL),
(171, NULL, 'SP 16 ROUND (5pc)', 11, '35.00', NULL),
(172, NULL, 'SP 30 ROUND (5pc)', 11, '40.00', NULL),
(173, NULL, 'SP 10 ROUND (10pc)', 11, '52.00', NULL),
(174, NULL, 'SP 16 ROUND (10pc)', 11, '58.00', NULL),
(175, NULL, 'SP 30 ROUND (10pc)', 11, '68.00', NULL),
(176, NULL, 'SP 500 RECTANGULAR (5pc)', 11, '45.00', NULL),
(177, NULL, 'SP 750 RECTANGULAR  (5pc)', 11, '50.00', NULL),
(178, NULL, 'SP 1000 RECTANGULAR  (5pc)', 11, '55.00', NULL),
(179, NULL, 'SP 1600 RECTANGULAR  (5pc)', 11, '80.00', NULL),
(180, NULL, 'SP 2500 RECTANGULAR  (5pc)', 11, '125.00', NULL),
(181, NULL, 'SP 500 RECTANGULAR (10pc)', 11, '75.00', NULL),
(182, NULL, 'SP 750 RECTANGULAR (10pc)', 11, '83.00', NULL),
(183, NULL, 'SP 1000 RECTANGULAR (10pc)', 11, '92.00', NULL),
(184, NULL, 'Packaging Tape Clear/Tan (12MMx50M)', 12, '6.00', NULL),
(185, NULL, 'Packaging Tape Clear/Tan (12MMx100M)', 12, '10.00', NULL),
(186, NULL, 'Packaging Tape Clear/Tan (24MMx50M)', 12, '11.25', NULL),
(187, NULL, 'Packaging Tape Clear/Tan (48MMx50M)', 12, '25.00', NULL),
(188, NULL, 'Packaging Tape Clear/Tan (24MMx100M)', 12, '25.00', NULL),
(189, NULL, 'Packaging Tape Clear/Tan (48MMx100M)', 12, '37.00', NULL),
(190, NULL, 'Kraft Tape (24MMx50YRDS)', 12, '56.80', NULL),
(191, NULL, 'Cloth Duct Tape (48MMx25M)', 12, '265.00', NULL),
(192, NULL, 'Cloth Duct Tape (72MM x 25M)', 12, '335.00', NULL),
(193, NULL, 'Aluminum Tape (48MM x 50YRDS)', 12, '355.00', NULL),
(194, NULL, 'Floor Marketing tape (48MM x 33YRDS)', 12, '155.00', NULL),
(195, NULL, 'Kraft Tape (48 MM X 50 YRDS)', 12, '102.80', NULL),
(196, NULL, 'Double Sided Tape (12MM X 10M)', 12, '9.25', NULL),
(197, NULL, 'Double Sided Tape (12MM X 50M)', 12, '37.28', NULL),
(198, NULL, 'Double Sided Tape (24MM X 50M)', 12, '72.80', NULL),
(199, NULL, 'Double Sided Tape (48MM X 50M)', 12, '138.00', NULL),
(200, NULL, 'Masking Tape (12MM X 15 YRDS)', 12, '7.80', NULL),
(201, NULL, 'Masking Tape (24MM X 15 YRDS)', 12, '14.85', NULL),
(202, NULL, 'Masking Tape (48MM X 15 YRDS)', 12, '27.80', NULL),
(203, NULL, 'Masking Tape (12MM X 20 YRDS)', 12, '10.80', NULL),
(204, NULL, 'Masking Tape (24MM X 20 YRDS)', 12, '18.90', NULL),
(205, NULL, 'Masking Tape (48MM X 20 YRDS)', 12, '36.80', NULL),
(206, NULL, 'Masking Tape (12MM X 25 YRDS)', 12, '12.80', NULL),
(207, NULL, 'Masking Tape (24MM X 25 YRDS)', 12, '22.98', NULL),
(208, NULL, 'Masking Tape (48MM X 25 YRDS )', 12, '44.80', NULL),
(209, NULL, 'Nopi Tape (9MM X 40M )', 12, '21.80', NULL),
(210, NULL, 'Small bubble Bag (1M X 52")', 12, '38.50', NULL),
(211, NULL, 'Big Bubble Bag (1M X 40")', 12, '37.80', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_reports`
--

CREATE TABLE `product_reports` (
  `pR_product_id` int(12) NOT NULL,
  `pR_qty` int(10) NOT NULL,
  `pR_id` int(10) NOT NULL
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
  `po_product_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `request_id` int(12) NOT NULL,
  `act` varchar(20) NOT NULL,
  `employee` text NOT NULL,
  `date_time` datetime(6) NOT NULL,
  `target` varchar(15) NOT NULL,
  `changed` varchar(20) NOT NULL,
  `remarks` varchar(20) NOT NULL,
  `status` varchar(8) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `return_id` int(10) NOT NULL,
  `return_date` date NOT NULL,
  `return_adjusted_price` int(10) NOT NULL,
  `return_remarks` varchar(15) NOT NULL,
  `return_product_id` int(15) NOT NULL
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
  ADD PRIMARY KEY (`acc_id`),
  ADD KEY `acctype_idx` (`acctype_id`);

--
-- Indexes for table `acc_type`
--
ALTER TABLE `acc_type`
  ADD PRIMARY KEY (`acctype_id`),
  ADD KEY `acctype_id_idx` (`acctype_id`);

--
-- Indexes for table `bad_order`
--
ALTER TABLE `bad_order`
  ADD PRIMARY KEY (`bo_id`),
  ADD KEY `product_id_idx` (`bo_product_id`);

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
-- Indexes for table `client_reports`
--
ALTER TABLE `client_reports`
  ADD PRIMARY KEY (`cR_id`),
  ADD KEY `product_id_idx` (`cR_product_id`);

--
-- Indexes for table `inventory_status`
--
ALTER TABLE `inventory_status`
  ADD KEY `product_id_idx` (`iS_product_id`);

--
-- Indexes for table `issuance`
--
ALTER TABLE `issuance`
  ADD PRIMARY KEY (`issue_id`),
  ADD KEY `client_id_idx` (`client_id`);

--
-- Indexes for table `issuance_list`
--
ALTER TABLE `issuance_list`
  ADD KEY `FK_issuancelist_productlist_idx` (`prod_id`);

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
  ADD PRIMARY KEY (`logs_id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`productList_id`),
  ADD KEY `FK_product_list_category_idx` (`category_id`);

--
-- Indexes for table `product_reports`
--
ALTER TABLE `product_reports`
  ADD PRIMARY KEY (`pR_id`),
  ADD KEY `FK_product_reports_product_list_idx` (`pR_product_id`);

--
-- Indexes for table `pull_out`
--
ALTER TABLE `pull_out`
  ADD PRIMARY KEY (`po_id`),
  ADD KEY `FK_pull_out_product_list_idx` (`po_product_id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`request_id`);

--
-- Indexes for table `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`return_id`),
  ADD KEY `FK_returns_product_list_idx` (`return_product_id`);

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
  MODIFY `acc_id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
  MODIFY `productList_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;
--
-- AUTO_INCREMENT for table `product_reports`
--
ALTER TABLE `product_reports`
  MODIFY `pR_id` int(10) NOT NULL AUTO_INCREMENT;
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
-- AUTO_INCREMENT for table `returns`
--
ALTER TABLE `returns`
  MODIFY `return_id` int(10) NOT NULL AUTO_INCREMENT;
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
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `acctype_id` FOREIGN KEY (`acctype_id`) REFERENCES `acc_type` (`acctype_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `bad_order`
--
ALTER TABLE `bad_order`
  ADD CONSTRAINT `bo_product_id` FOREIGN KEY (`bo_product_id`) REFERENCES `product_list` (`productList_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `client_reports`
--
ALTER TABLE `client_reports`
  ADD CONSTRAINT `cR_product_id` FOREIGN KEY (`cR_product_id`) REFERENCES `product_list` (`productList_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `inventory_status`
--
ALTER TABLE `inventory_status`
  ADD CONSTRAINT `iS_product_id` FOREIGN KEY (`iS_product_id`) REFERENCES `product_list` (`productList_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `issuance`
--
ALTER TABLE `issuance`
  ADD CONSTRAINT `client_id` FOREIGN KEY (`client_id`) REFERENCES `clients` (`c_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `issuance_list`
--
ALTER TABLE `issuance_list`
  ADD CONSTRAINT `prod_id` FOREIGN KEY (`prod_id`) REFERENCES `product_list` (`productList_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `ledger`
--
ALTER TABLE `ledger`
  ADD CONSTRAINT `ledger_product_id` FOREIGN KEY (`ledger_id`) REFERENCES `product_list` (`productList_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `category_id` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`category_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `product_reports`
--
ALTER TABLE `product_reports`
  ADD CONSTRAINT `pR_product_id` FOREIGN KEY (`pR_product_id`) REFERENCES `product_list` (`productList_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `pull_out`
--
ALTER TABLE `pull_out`
  ADD CONSTRAINT `po_product_id` FOREIGN KEY (`po_product_id`) REFERENCES `product_list` (`productList_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `returns`
--
ALTER TABLE `returns`
  ADD CONSTRAINT `return_product_id` FOREIGN KEY (`return_product_id`) REFERENCES `product_list` (`productList_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
