-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2019 at 07:05 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tokai_rika_ph`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `codename` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `codename`) VALUES
(1, 'TRP-QC'),
(2, 'SUJI-TOSHI'),
(3, 'PPAP'),
(4, 'TRP-IN HOUSE');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `emp_idn` varchar(45) NOT NULL,
  `person_id` int(11) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `emp_idn`, `person_id`, `department_id`) VALUES
(1, '2015-000020', 3, 1),
(2, '2005-000100', 1, 4),
(3, '2019-100002', 2, 3),
(4, '2010-300450', 5, 1),
(5, '2014-204055', 4, 2);

-- --------------------------------------------------------

--
-- Stand-in structure for view `employee_details`
-- (See below for the actual view)
--
CREATE TABLE `employee_details` (
`first_name` varchar(45)
,`last_name` varchar(45)
,`contact_number` varchar(15)
,`address` varchar(80)
,`emp_idn` varchar(45)
,`codename` varchar(45)
);

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `price` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `subtotal` double NOT NULL,
  `of_id` int(11) DEFAULT NULL,
  `sp_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_detail`
--

INSERT INTO `order_detail` (`id`, `price`, `quantity`, `subtotal`, `of_id`, `sp_id`) VALUES
(1, 1500, 20, 30000, 5, 1),
(2, 500, 30, 15000, 4, 2),
(3, 250, 100, 25000, 3, 3),
(4, 1000, 55, 55000, 2, 4),
(5, 750, 75, 56250, 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `order_form`
--

CREATE TABLE `order_form` (
  `id` int(11) NOT NULL,
  `order_date` varchar(45) NOT NULL,
  `total` double NOT NULL,
  `tax` double NOT NULL,
  `delivery_date` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order_form`
--

INSERT INTO `order_form` (`id`, `order_date`, `total`, `tax`, `delivery_date`) VALUES
(1, 'July 06, 2010', 14521, 156, 'October 15, 2010'),
(2, 'January 15, 2012', 49756, 1524, 'May 31, 2012'),
(3, 'April 24, 2013', 56487, 1765, 'August 1, 2013'),
(4, 'December 12, 2014', 16421, 684, 'March 16, 2015'),
(5, 'July 08, 2016', 46872, 945, 'December 27, 2016');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) NOT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `address` varchar(80) NOT NULL,
  `age` int(3) NOT NULL,
  `birthdate` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`id`, `first_name`, `middle_name`, `last_name`, `contact_number`, `address`, `age`, `birthdate`) VALUES
(1, 'Alana', 'Gay', 'Lara', '9187635601', '135 Andover Street\n		Canal Winchester, OH 43110', 20, 'July 06, 1999'),
(2, 'Steve', 'Grave', 'Frank', '9256632901', '380 High Ave.\n		Chevy Chase, MD 20815', 36, 'November 28, 1983'),
(3, 'Zain', 'Cole', 'Wiley', '9094567872', '9697 North Heather Drive\n		Lake Villa, IL 60046', 25, 'March 06, 1994'),
(4, 'Jayden', 'Moss', 'Park', '9983216791', '7436 Adams Dr.\n		Severn, MD 21144', 40, 'October 20, 1979'),
(5, 'Ricky', 'Joe', 'Ruiz', '9220923119', '749 County St.\n		Buckeye, AZ 85326', 23, 'August 13, 1996');

-- --------------------------------------------------------

--
-- Stand-in structure for view `product_details`
-- (See below for the actual view)
--
CREATE TABLE `product_details` (
`product_desc` varchar(500)
,`quantity` int(11)
,`subtotal` double
,`delivery_date` varchar(45)
);

-- --------------------------------------------------------

--
-- Table structure for table `supplier_parts`
--

CREATE TABLE `supplier_parts` (
  `id` int(11) NOT NULL,
  `product_desc` varchar(500) NOT NULL,
  `supp_code` varchar(45) NOT NULL,
  `manufactured_date` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier_parts`
--

INSERT INTO `supplier_parts` (`id`, `product_desc`, `supp_code`, `manufactured_date`) VALUES
(1, 'Touchpad', 'AK12GB5', 'September 20, 2016'),
(2, 'Steering Switch', 'BZ45H12', 'January 10, 2016'),
(3, 'Seatbelt', '12ZCM4L', 'June 01, 2013'),
(4, 'Outer Mirror', 'DDL091G', 'February 06, 2012'),
(5, 'Speed Sensor', '09LOPQS', 'August 10, 2010');

-- --------------------------------------------------------

--
-- Structure for view `employee_details`
--
DROP TABLE IF EXISTS `employee_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employee_details`  AS  select `person`.`first_name` AS `first_name`,`person`.`last_name` AS `last_name`,`person`.`contact_number` AS `contact_number`,`person`.`address` AS `address`,`employee`.`emp_idn` AS `emp_idn`,`department`.`codename` AS `codename` from ((`employee` join `person` on((`employee`.`id` = `person`.`id`))) join `department` on((`employee`.`id` = `department`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `product_details`
--
DROP TABLE IF EXISTS `product_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `product_details`  AS  select `supplier_parts`.`product_desc` AS `product_desc`,`order_detail`.`quantity` AS `quantity`,`order_detail`.`subtotal` AS `subtotal`,`order_form`.`delivery_date` AS `delivery_date` from ((`order_detail` join `order_form` on((`order_detail`.`id` = `order_form`.`id`))) join `supplier_parts` on((`order_detail`.`id` = `supplier_parts`.`id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `emp_idn` (`emp_idn`),
  ADD KEY `person_id` (`person_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `of_id` (`of_id`),
  ADD KEY `sp_id` (`sp_id`);

--
-- Indexes for table `order_form`
--
ALTER TABLE `order_form`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_parts`
--
ALTER TABLE `supplier_parts`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_form`
--
ALTER TABLE `order_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `supplier_parts`
--
ALTER TABLE `supplier_parts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`),
  ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`of_id`) REFERENCES `order_form` (`id`),
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`sp_id`) REFERENCES `supplier_parts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
