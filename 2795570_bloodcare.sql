-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: fdb20.awardspace.net
-- Generation Time: Jul 12, 2020 at 08:14 AM
-- Server version: 5.7.20-log
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `2795570_bloodcare`
--

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `hosid` int(3) NOT NULL,
  `email` varchar(60) NOT NULL,
  `hosname` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `state` varchar(30) NOT NULL,
  `contact` varchar(10) NOT NULL,
  `availbloodtype` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`hosid`, `email`, `hosname`, `password`, `state`, `contact`, `availbloodtype`) VALUES
(8, 'gb123@gmail.com', 'G.B. Pant Hospital', '555ba1ef34cf40d43073ed336cf40a50', 'Delhi', '9818260355', 'A+,A-'),
(9, 'shreya123@gmail.com', 'Shreya Hospital', '555ba1ef34cf40d43073ed336cf40a50', 'Uttar Pradesh', '9971078115', 'AB+,A+');

-- --------------------------------------------------------

--
-- Table structure for table `receiver`
--

CREATE TABLE `receiver` (
  `recid` int(3) NOT NULL,
  `email` varchar(60) NOT NULL,
  `recname` varchar(30) NOT NULL,
  `address` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `bloodtype` enum('A+','B+','AB-','AB+','B-','A-') NOT NULL,
  `contact` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `receiver`
--

INSERT INTO `receiver` (`recid`, `email`, `recname`, `address`, `password`, `bloodtype`, `contact`) VALUES
(4, 'mayanksharma78613@gmail.com', 'Mayank', 'Shalimar Garden Ext-1', '555ba1ef34cf40d43073ed336cf40a50', 'A+', '9971078117');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` int(3) NOT NULL,
  `hosid` int(3) NOT NULL,
  `recid` int(3) NOT NULL,
  `requestbloodtype` enum('A+','A-','B+','B-','AB+','AB-') NOT NULL,
  `resolved` enum('Yes','No') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`id`, `hosid`, `recid`, `requestbloodtype`, `resolved`) VALUES
(8, 8, 4, 'A+', 'Yes'),
(9, 9, 4, 'A+', 'No');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`hosid`);

--
-- Indexes for table `receiver`
--
ALTER TABLE `receiver`
  ADD PRIMARY KEY (`recid`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hosid` (`hosid`),
  ADD KEY `recid` (`recid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `hosid` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `receiver`
--
ALTER TABLE `receiver`
  MODIFY `recid` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`recid`) REFERENCES `receiver` (`recid`),
  ADD CONSTRAINT `request_ibfk_2` FOREIGN KEY (`hosid`) REFERENCES `hospital` (`hosid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
