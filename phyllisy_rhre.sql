-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 01, 2017 at 07:40 PM
-- Server version: 5.6.28-76.1-log
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phyllisy_rhre`
--

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `property_id` int(11) NOT NULL,
  `suburb` varchar(45) NOT NULL,
  `property_type` varchar(45) NOT NULL,
  `furnished` varchar(45) NOT NULL,
  `property_address` varchar(45) NOT NULL,
  `bedroom_no` varchar(45) DEFAULT NULL,
  `bathroom_no` varchar(45) DEFAULT NULL,
  `garage_no` varchar(45) DEFAULT NULL,
  `property_description` longtext NOT NULL,
  `property_rent` varchar(45) NOT NULL,
  `property_available` varchar(45) DEFAULT NULL,
  `property_image_1` varchar(45) NOT NULL,
  `property_image_2` varchar(45) DEFAULT NULL,
  `property_image_3` varchar(45) DEFAULT NULL,
  `property_image_4` varchar(45) DEFAULT NULL,
  `property_image_5` varchar(45) DEFAULT NULL,
  `property_image_6` varchar(45) DEFAULT NULL,
  `property_image_7` varchar(45) DEFAULT NULL,
  `property_image_8` varchar(45) DEFAULT NULL,
  `property_image_9` varchar(45) DEFAULT NULL,
  `property_image_10` varchar(45) DEFAULT NULL,
  `property_rent_category` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`property_id`, `suburb`, `property_type`, `furnished`, `property_address`, `bedroom_no`, `bathroom_no`, `garage_no`, `property_description`, `property_rent`, `property_available`, `property_image_1`, `property_image_2`, `property_image_3`, `property_image_4`, `property_image_5`, `property_image_6`, `property_image_7`, `property_image_8`, `property_image_9`, `property_image_10`, `property_rent_category`) VALUES
(1, 'Sunnybank', 'house', 'Yes', '3 Test Street', '4', '3', '3', 'Large family home located close to schools and public transport. Popular shopping centres are located just 10 minutes walk away. Property also has a large backyard, perfect for pets.', '550', 'Yes', 'pexels-photo-186077.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '600'),
(2, 'Carindale', 'house', 'No', '14 Test Street', '3', '1', '2', 'house', '400', 'Yes', 'pexels-photo-186077.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '400'),
(3, 'Sunnybank', 'house', 'Yes', '2 Tester Street', '3', '2', '2', 'house', '420', 'No', 'pexels-photo-186077.jpeg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '500');

-- --------------------------------------------------------

--
-- Table structure for table `scheduling`
--

CREATE TABLE `scheduling` (
  `scheduling_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `property_id` int(11) NOT NULL,
  `user_id_tenant` int(11) NOT NULL,
  `user_id_staff` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `scheduling`
--

INSERT INTO `scheduling` (`scheduling_id`, `date`, `time`, `property_id`, `user_id_tenant`, `user_id_staff`) VALUES
(1, '2017-05-31', '13:00:00.000000', 1, 1, 2),
(2, '2017-06-02', '13:00:00.000000', 1, 2, 1),
(3, '2017-05-31', '14:00:00.000000', 1, 2, 1),
(4, '2017-05-30', '14:00:00.000000', 2, 2, 1),
(5, '2017-05-30', '12:00:00.000000', 2, 2, 1),
(6, '2017-05-30', '12:00:00.000000', 2, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `f_name` varchar(45) NOT NULL,
  `l_name` varchar(45) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `rent_status` varchar(45) NOT NULL DEFAULT 'available',
  `email` varchar(45) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `mobile_number` varchar(45) DEFAULT NULL,
  `phone_number` varchar(45) NOT NULL,
  `permission` varchar(45) NOT NULL DEFAULT 'tenant',
  `tc` varchar(45) NOT NULL,
  `sub` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `f_name`, `l_name`, `dob`, `gender`, `password`, `rent_status`, `email`, `address`, `mobile_number`, `phone_number`, `permission`, `tc`, `sub`) VALUES
(1, 'Phyllis', 'Yaw', '1996-09-06', 'female', 'miggles3', 'available', 'phyvo@hotmail.com', NULL, NULL, '0435831787', 'tenant', 'Y', 'Y'),
(2, 'Tom', 'Test', '2017-12-31', 'male', 'cheese', 'available', 'test@test.com', NULL, NULL, '555555555', 'tenant', 'Y', NULL),
(3, 'Connor', 'N', '1997-10-30', 'male', '12345', 'available', 'connor.nicholls@connect.qut.edu.au', NULL, NULL, '041234567', 'tenant', 'Y', NULL),
(4, 'Jessica', 'Cockett', '1994-08-13', 'female', 'Smesh01', 'available', 'jessica.cockett@gmail.com', NULL, NULL, '423466495', 'tenant', 'Y', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`property_id`),
  ADD UNIQUE KEY `property_id_UNIQUE` (`property_id`);

--
-- Indexes for table `scheduling`
--
ALTER TABLE `scheduling`
  ADD PRIMARY KEY (`scheduling_id`),
  ADD UNIQUE KEY `scheduling_id_UNIQUE` (`scheduling_id`),
  ADD KEY `property_id_idx` (`property_id`),
  ADD KEY `user_id_idx` (`user_id_tenant`),
  ADD KEY `user_id_staff_idx` (`user_id_staff`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  ADD UNIQUE KEY `phone_number_UNIQUE` (`phone_number`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`),
  ADD UNIQUE KEY `mobile_number_UNIQUE` (`mobile_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `property_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `scheduling`
--
ALTER TABLE `scheduling`
  MODIFY `scheduling_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `scheduling`
--
ALTER TABLE `scheduling`
  ADD CONSTRAINT `property_id` FOREIGN KEY (`property_id`) REFERENCES `properties` (`property_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id_tenant`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `user_id_staff` FOREIGN KEY (`user_id_staff`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
