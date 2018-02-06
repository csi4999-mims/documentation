-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 06, 2018 at 03:18 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testing_mims`
--

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `Report_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SubmitterEmail` varchar(50) NOT NULL,
  `FirstName` varchar(256) NOT NULL,
  `LastName` varchar(256) NOT NULL,
  `Gender` varchar(256) NOT NULL,
  `Ethnicity` varchar(256) NOT NULL,
  `EyeColor` varchar(256) NOT NULL,
  `HairColor` varchar(256) NOT NULL,
  `MarksTattoos` varchar(256) NOT NULL,
  `Weight` int(11) NOT NULL,
  `Height` text NOT NULL,
  `DoB` date NOT NULL,
  `Phone` int(11) NOT NULL,
  `SocialMediaAccount` varchar(256) NOT NULL,
  `ReportMiscInfo` text NOT NULL,
  `FamilyFirstName` varchar(256) NOT NULL,
  `FamilyLastName` varchar(256) NOT NULL,
  `FamilyGender` varchar(256) NOT NULL,
  `Relation` varchar(256) NOT NULL,
  `FamilyStreet` varchar(256) NOT NULL,
  `FamilyCity` varchar(256) NOT NULL,
  `FamilyState` varchar(256) NOT NULL,
  `FamilyZip` int(5) NOT NULL,
  `FamilyPhone` int(11) NOT NULL,
  `FamilyEmail` text NOT NULL,
  `PlaceName` varchar(256) NOT NULL,
  `PlaceStreet` varchar(256) NOT NULL,
  `PlaceCity` varchar(256) NOT NULL,
  `PlaceState` varchar(256) NOT NULL,
  `PlaceZip` int(5) NOT NULL,
  `PlaceMiscInfo` text NOT NULL,
  PRIMARY KEY(Report_ID)
);

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`Report_ID`, `SubmitterEmail`, `FirstName`, `LastName`, `Gender`, `Ethnicity`, `EyeColor`, `HairColor`, `MarksTattoos`, `Weight`, `Height`, `DoB`, `Phone`, `SocialMediaAccount`, `ReportMiscInfo`, `FamilyFirstName`, `FamilyLastName`, `FamilyGender`, `Relation`, `FamilyStreet`, `FamilyCity`, `FamilyState`, `FamilyZip`, `FamilyPhone`, `FamilyEmail`, `PlaceName`, `PlaceStreet`, `PlaceCity`, `PlaceState`, `PlaceZip`, `PlaceMiscInfo`) VALUES
(7, '', 'a', 'b', 'f', 'w', 'b', 'b', 'none', 150, '64', '2018-02-06', 2147483647, '@test.test', 'none', 'mom', 'mom', 'm', 'mom', '439878432 fskjfdskjh', 'kjjkfsdkj', 'kjl', 987432, 2147483647, 'test@test.com', 'jhfdkjlfsdlkj', '42398324 jkdfskjfdsk', '', '', 89732897, 'jdskjlldjsk'),
(8, '', 'a', 'b', 'f', 'w', 'b', 'b', 'none', 150, '64', '2018-02-06', 2147483647, '@test.test', 'none', 'mom', 'mom', 'm', 'mom', '439878432 fskjfdskjh', 'kjjkfsdkj', 'kjl', 987432, 2147483647, 'test@test.com', 'jhfdkjlfsdlkj', '42398324 jkdfskjfdsk', '', '', 89732897, 'jdskjlldjsk'),
(9, '', 'a', 'b', 'f', 'w', 'b', 'b', 'none', 150, '64', '2018-02-06', 2147483647, '@test.test', 'none', 'mom', 'mom', 'm', 'mom', '439878432 fskjfdskjh', 'kjjkfsdkj', 'kjl', 987432, 2147483647, 'test@test.com', 'jhfdkjlfsdlkj', '42398324 jkdfskjfdsk', '', '', 89732897, 'jdskjlldjsk');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`Report_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `Report_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
