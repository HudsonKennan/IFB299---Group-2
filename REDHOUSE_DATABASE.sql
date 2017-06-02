-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 02, 2017 at 10:24 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `redhouse`
--

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `propertyID` int(30) NOT NULL,
  `suburb` text NOT NULL,
  `pType` text NOT NULL,
  `furnis` text NOT NULL,
  `address` text NOT NULL,
  `bedrooms` varchar(5) NOT NULL,
  `bathrooms` varchar(5) NOT NULL,
  `garage` text NOT NULL,
  `rent` text NOT NULL,
  `descr` longtext NOT NULL,
  `img` longtext NOT NULL,
  `available` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`propertyID`, `suburb`, `pType`, `furnis`, `address`, `bedrooms`, `bathrooms`, `garage`, `rent`, `descr`, `img`, `available`) VALUES
(21, 'vsfsdfsds', 'sdfsdfds', 'sfsdfsdf', 'fsdfsdfsdf', 'sfsdf', '', 'sdfsdfsdf', 'sdfsdfsdf', 'ssdfsdf', '', 'dsfsdfsd');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userID` int(30) NOT NULL,
  `fname` text NOT NULL,
  `lname` text NOT NULL,
  `password` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `DOB` varchar(15) NOT NULL,
  `Gender` text NOT NULL,
  `Renting` text NOT NULL,
  `Address` text NOT NULL,
  `PHNO` int(15) NOT NULL,
  `Permissions` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userID`, `fname`, `lname`, `password`, `email`, `DOB`, `Gender`, `Renting`, `Address`, `PHNO`, `Permissions`) VALUES
(1, 'Hudson', 'Kennan', 'dummy', 'hudson.kennan@hotmail.com', '19/03/1997', 'male', 'Yes', '45-58', 430233957, 'Staff'),
(2, 'Connor', 'Nicoles', 'dummy', 'na@gmail.com', '19/03/1997', 'F', 'No', '45/58', 430233957, 'Staff'),
(3, 'Jess', 'Cockett', 'dummy', 'kennanhudson@gmail.com', '19/03/1997', 'F', 'No', '45/58 Goodfellows Road, Kallangur', 430233957, 'Staff'),
(12, 'Phyllis', 'Yaw', '', 'pw@gmail.com', '29/05/1990', 'female', 'Yes', 'Boo', 46620128, NULL),
(15, 'Terry', 'White', '', 'tw@gmail.com', '21/09/1978', 'M', 'Yes', 'Chermside', 461101010, NULL),
(22, '', '', '', '', '', '', '', '10 Hudson Place', 0, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`propertyID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `propertyID` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
