-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2020 at 01:34 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `emart`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill_details_table`
--

CREATE TABLE `bill_details_table` (
  `bill_details_id` int(11) NOT NULL,
  `bill_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill_details_table`
--

INSERT INTO `bill_details_table` (`bill_details_id`, `bill_id`, `item_id`) VALUES
(756, 646, 501),
(757, 646, 502),
(758, 647, 504),
(759, 648, 501);

-- --------------------------------------------------------

--
-- Table structure for table `bill_table`
--

CREATE TABLE `bill_table` (
  `bill_id` int(20) NOT NULL,
  `buyer_id` int(30) NOT NULL,
  `bill_type` varchar(50) NOT NULL,
  `bill_date` date NOT NULL,
  `bill_remark` varchar(25) NOT NULL,
  `bill_amount` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill_table`
--

INSERT INTO `bill_table` (`bill_id`, `buyer_id`, `bill_type`, `bill_date`, `bill_remark`, `bill_amount`) VALUES
(646, 209, 'Debit', '2020-03-13', 'paid', 39999),
(647, 210, 'Debit', '2020-03-13', 'paid', 69900),
(648, 209, 'Debit', '2020-03-13', 'paid', 22000);

-- --------------------------------------------------------

--
-- Table structure for table `buyers_signup_table`
--

CREATE TABLE `buyers_signup_table` (
  `buyer_id` int(30) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mobile` bigint(10) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buyers_signup_table`
--

INSERT INTO `buyers_signup_table` (`buyer_id`, `username`, `password`, `email`, `mobile`, `date`) VALUES
(209, 'Sana Afreen', 'sana', 'sanaafreen@gmail.com', 8247867665, '2020-03-13'),
(210, 'John', 'john', 'john@gmail.com', 9381666615, '2020-03-13');

-- --------------------------------------------------------

--
-- Table structure for table `category_table`
--

CREATE TABLE `category_table` (
  `category_id` int(20) NOT NULL,
  `category_name` varchar(30) NOT NULL,
  `category_brief` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_table`
--

INSERT INTO `category_table` (`category_id`, `category_name`, `category_brief`) VALUES
(301, 'Electronics', 'good'),
(302, 'Clothes', 'good'),
(303, 'Accessories', 'ladies accessories');

-- --------------------------------------------------------

--
-- Table structure for table `item_table`
--

CREATE TABLE `item_table` (
  `item_id` int(20) NOT NULL,
  `item_name` varchar(30) NOT NULL,
  `item_image` varchar(400) NOT NULL,
  `item_price` int(200) NOT NULL,
  `item_stock` int(100) NOT NULL,
  `item_description` varchar(100) NOT NULL,
  `subcategory_id` int(20) NOT NULL,
  `item_remark` varchar(50) NOT NULL,
  `seller_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item_table`
--

INSERT INTO `item_table` (`item_id`, `item_name`, `item_image`, `item_price`, `item_stock`, `item_description`, `subcategory_id`, `item_remark`, `seller_id`) VALUES
(501, 'LG WM', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTfSquKvX1zeFcZ_bUSN4bbquzBHyQ-BdIlNGKAC05eFwi9gza8', 22000, 5, 'Good', 404, 'Good', 101),
(502, 'oppo', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQLdaAPAiujGdU6l3RElm3UAg2pvio-DqBk-2BdCX4ZZCItnK6f', 17999, 20, 'Good', 405, 'Good', 102),
(503, 'Samsung', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQsS2_O0MAwj9b4qFHX_HLnFjko_5WzrdsMcql6Vw8lobjZcGlE', 14999, 5, 'Good', 401, 'Good', 101),
(504, 'iphone', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcStI3MmMgQyvQxx2WxWVq15ibRYKd36sk5dFsAzHLQT-WMW7GPm', 69900, 10, 'Good', 405, 'Good', 102),
(505, 'Denims', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSBd38OI1LoXVwb05_1nb4yL0gXFN04OAEwhabJmnooud45H3Cc', 4000, 15, 'Good', 402, 'Good', 102),
(506, 'Kurtis', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQLuoAH-HanxTqu1I1kAJ6q4qRovVGwpJZ2aDCgEdAm-hjMtz6G', 2500, 15, 'Good', 402, 'Good', 101),
(507, 'T-shirts', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQNinCjcgev39vNFJhZ_zLzlQX5m1N_9Dow_-QmZNddFG2q9cnG', 500, 10, 'Good', 402, 'Good', 102),
(508, 'Saree', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR6XMdPOESgx4uy12AiewxtwBF4HNUKgW2MDDNRz20gynkQKK-w', 4999, 15, 'Good', 402, 'Good', 101),
(509, 'Bracelets', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSh5oeUnI-M6K8hxnX4a3aYAIhc-0KwNBULSY-clmwjYgILfg8U', 999, 15, 'Good', 403, 'Good', 101),
(510, 'Wallets', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQetnP2sOCKiAOeVVLDqcaXY5VvMOHCrtYLW20pfySQh5A33sB6', 4999, 15, 'Good', 403, 'Good', 102),
(511, 'Watches', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSp2fur2ksTFkWcy15hB7zrSxpq3vHm76r627NAnJrAi5zDioSs', 9999, 15, 'Good', 403, 'Good', 101),
(512, 'Rings', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSrXFs-BbueIgo52yaJFPNlvdIG2elO15GJh-tnOoO0pp6mOUCa', 5000, 15, 'Good', 403, 'Good', 102);

-- --------------------------------------------------------

--
-- Table structure for table `seller_signup_table`
--

CREATE TABLE `seller_signup_table` (
  `seller_id` int(10) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `company` varchar(40) NOT NULL,
  `brief` varchar(40) NOT NULL,
  `gst` int(10) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` bigint(10) NOT NULL,
  `website` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seller_signup_table`
--

INSERT INTO `seller_signup_table` (`seller_id`, `username`, `password`, `company`, `brief`, `gst`, `address`, `email`, `contact`, `website`) VALUES
(101, 'Gayathri', '1234', 'abc', 'very good prodcts', 6, 'chennai', 'gayathri@gmail.com', 196633225, 'www.abc.com'),
(102, 'Shanthi', '1234', 'cba', 'Best Products', 5, 'chennai', 'shanthi@gmail.com', 196655223, 'www.cba.com'),
(110, 'Julie', 'julie', 'julie solutions', 'julie pvt ltd', 12, 'colony', 'julie@gmail.com', 7093374855, 'www.julie.com');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory_table`
--

CREATE TABLE `subcategory_table` (
  `subcategory_id` int(20) NOT NULL,
  `subcategory_name` varchar(30) NOT NULL,
  `category_id` int(20) NOT NULL,
  `subcategory_brief` varchar(30) NOT NULL,
  `subcategory_gst` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subcategory_table`
--

INSERT INTO `subcategory_table` (`subcategory_id`, `subcategory_name`, `category_id`, `subcategory_brief`, `subcategory_gst`) VALUES
(401, 'TV', 301, 'gd', 4),
(402, 'Ladie\'s Wear', 302, 'gd', 4),
(403, 'Ladie\'s Accessories', 303, 'Ladies accessories', 10),
(404, 'Washing Machines', 301, 'WM\'s', 10),
(405, 'Mobiles', 301, 'mobiles', 20);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill_details_table`
--
ALTER TABLE `bill_details_table`
  ADD PRIMARY KEY (`bill_details_id`),
  ADD KEY `bill_id` (`bill_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `bill_table`
--
ALTER TABLE `bill_table`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `buyer_id` (`buyer_id`);

--
-- Indexes for table `buyers_signup_table`
--
ALTER TABLE `buyers_signup_table`
  ADD PRIMARY KEY (`buyer_id`);

--
-- Indexes for table `category_table`
--
ALTER TABLE `category_table`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `item_table`
--
ALTER TABLE `item_table`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `subcategory_id` (`subcategory_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Indexes for table `seller_signup_table`
--
ALTER TABLE `seller_signup_table`
  ADD PRIMARY KEY (`seller_id`);

--
-- Indexes for table `subcategory_table`
--
ALTER TABLE `subcategory_table`
  ADD PRIMARY KEY (`subcategory_id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill_details_table`
--
ALTER TABLE `bill_details_table`
  MODIFY `bill_details_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=760;

--
-- AUTO_INCREMENT for table `bill_table`
--
ALTER TABLE `bill_table`
  MODIFY `bill_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=649;

--
-- AUTO_INCREMENT for table `buyers_signup_table`
--
ALTER TABLE `buyers_signup_table`
  MODIFY `buyer_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=211;

--
-- AUTO_INCREMENT for table `category_table`
--
ALTER TABLE `category_table`
  MODIFY `category_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=304;

--
-- AUTO_INCREMENT for table `item_table`
--
ALTER TABLE `item_table`
  MODIFY `item_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=513;

--
-- AUTO_INCREMENT for table `seller_signup_table`
--
ALTER TABLE `seller_signup_table`
  MODIFY `seller_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `subcategory_table`
--
ALTER TABLE `subcategory_table`
  MODIFY `subcategory_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=406;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill_details_table`
--
ALTER TABLE `bill_details_table`
  ADD CONSTRAINT `bill_details_table_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bill_table` (`bill_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bill_details_table_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item_table` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bill_table`
--
ALTER TABLE `bill_table`
  ADD CONSTRAINT `bill_table_ibfk_1` FOREIGN KEY (`buyer_id`) REFERENCES `buyers_signup_table` (`buyer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `item_table`
--
ALTER TABLE `item_table`
  ADD CONSTRAINT `item_table_ibfk_1` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategory_table` (`subcategory_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_table_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `seller_signup_table` (`seller_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subcategory_table`
--
ALTER TABLE `subcategory_table`
  ADD CONSTRAINT `subcategory_table_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category_table` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
