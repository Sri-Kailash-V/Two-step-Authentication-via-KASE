-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2019 at 05:04 PM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `intern`
--

-- --------------------------------------------------------

--
-- Table structure for table `aufiles`
--

CREATE TABLE `aufiles` (
  `filename` varchar(45) NOT NULL,
  `size` varchar(45) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `skey` varchar(45) NOT NULL DEFAULT '0',
  `SecretKey` varchar(45) NOT NULL DEFAULT 'SecretKey'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `authority`
--

CREATE TABLE `authority` (
  `name` varchar(45) NOT NULL,
  `emailid` varchar(45) NOT NULL,
  `pass` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authority`
--

INSERT INTO `authority` (`name`, `emailid`, `pass`) VALUES
('authority', 'authority', 'password');

-- --------------------------------------------------------

--
-- Table structure for table `authorityservice`
--

CREATE TABLE `authorityservice` (
  `filename` varchar(45) NOT NULL,
  `uploadedon` varchar(45) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `requestby` varchar(45) NOT NULL,
  `status` varchar(45) DEFAULT 'Requested',
  `secretkey` varchar(45) DEFAULT 'Issue Key'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cloud`
--

CREATE TABLE `cloud` (
  `name` varchar(45) NOT NULL,
  `emailid` varchar(45) NOT NULL,
  `pass` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cloud`
--

INSERT INTO `cloud` (`name`, `emailid`, `pass`) VALUES
('cloud', 'cloud', 'password');

-- --------------------------------------------------------

--
-- Table structure for table `filedownloads`
--

CREATE TABLE `filedownloads` (
  `filename` varchar(45) NOT NULL,
  `downloadedby` varchar(45) NOT NULL,
  `downloadon` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `regotp`
--

CREATE TABLE `regotp` (
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `pass` varchar(45) DEFAULT NULL,
  `otp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `truste`
--

CREATE TABLE `truste` (
  `name` varchar(45) NOT NULL,
  `emailid` varchar(45) NOT NULL,
  `pass` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `truste`
--

INSERT INTO `truste` (`name`, `emailid`, `pass`) VALUES
('sri', 'activesriii@gmail.com', 'sri'),
('sri', 'srikailash98@gmail.com', 'kailash');

-- --------------------------------------------------------

--
-- Table structure for table `trustservice`
--

CREATE TABLE `trustservice` (
  `filename` varchar(45) NOT NULL,
  `uploadedon` varchar(45) NOT NULL,
  `size` int(11) NOT NULL,
  `requestby` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL DEFAULT 'No Access',
  `response` varchar(45) NOT NULL DEFAULT 'Grant Access',
  `requestto` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `name` varchar(45) NOT NULL,
  `emailid` varchar(45) NOT NULL,
  `pass` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`name`, `emailid`, `pass`) VALUES
('sri', 'activesriii@gmail.com', 'sri'),
('Kailash', 'srikailash98@gmail.com', 'kailash');

-- --------------------------------------------------------

--
-- Table structure for table `userfiles`
--

CREATE TABLE `userfiles` (
  `emailid` varchar(45) NOT NULL,
  `filename` varchar(45) NOT NULL,
  `uploadedon` varchar(45) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `status` varchar(45) NOT NULL DEFAULT 'Requested',
  `autstatus` varchar(45) NOT NULL DEFAULT 'Trustee respond?'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aufiles`
--
ALTER TABLE `aufiles`
  ADD PRIMARY KEY (`filename`);

--
-- Indexes for table `authority`
--
ALTER TABLE `authority`
  ADD PRIMARY KEY (`emailid`);

--
-- Indexes for table `authorityservice`
--
ALTER TABLE `authorityservice`
  ADD PRIMARY KEY (`filename`,`requestby`);

--
-- Indexes for table `cloud`
--
ALTER TABLE `cloud`
  ADD PRIMARY KEY (`emailid`);

--
-- Indexes for table `filedownloads`
--
ALTER TABLE `filedownloads`
  ADD PRIMARY KEY (`filename`,`downloadedby`);

--
-- Indexes for table `regotp`
--
ALTER TABLE `regotp`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `truste`
--
ALTER TABLE `truste`
  ADD PRIMARY KEY (`emailid`);

--
-- Indexes for table `trustservice`
--
ALTER TABLE `trustservice`
  ADD PRIMARY KEY (`filename`,`requestby`),
  ADD KEY `uploadedon_idx` (`uploadedon`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`emailid`);

--
-- Indexes for table `userfiles`
--
ALTER TABLE `userfiles`
  ADD PRIMARY KEY (`emailid`,`filename`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `trustservice`
--
ALTER TABLE `trustservice`
  ADD CONSTRAINT `filename` FOREIGN KEY (`filename`) REFERENCES `aufiles` (`filename`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
