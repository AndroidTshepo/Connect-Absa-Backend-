-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2017 at 07:39 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `connectabsa_db`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getComments` ()  BEGIN
	select* from connectabsa_db.comment where commentSeen = 0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertComment` (IN `commentsIN` VARCHAR(45), IN `commentBIN` TEXT, IN `commentStarIN` INT(11), IN `commentSeenIN` INT(11))  BEGIN
INSERT INTO connectabsa_db.comment (commentS, commentB, commentStar, commentSeen)
VALUES (commentsIN,commentBIN, commentStarIN, commentSeenIN);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `updateSeen` (IN `id` INT(11))  BEGIN
UPDATE connectabsa_db.comment
SET commentSeen=1
WHERE commentID=id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `commentID` int(11) NOT NULL,
  `commentS` varchar(45) DEFAULT NULL,
  `commentB` text,
  `commentStar` int(11) DEFAULT NULL,
  `commentSeen` int(11) DEFAULT '0',
  `dateTime` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`commentID`, `commentS`, `commentB`, `commentStar`, `commentSeen`, `dateTime`) VALUES
(39, 'test', 'test', 1, 1, '2017-04-17 22:06:32'),
(40, 'The Landing page ', 'Please ake the index text color blue', 1, 0, '2017-04-17 22:14:33');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`commentID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `commentID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
