-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2020 at 07:49 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `the lengends`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `serial_number` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone_number` bigint(10) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`serial_number`, `Name`, `email`, `phone_number`, `msg`, `date`) VALUES
(1, 'satysm', 'efff', 334435544, 'fdggfffmvmfg', '2020-09-18 12:48:07'),
(2, 'satyam yadav', 'yadav@gmail.com', 45544, 'dfsgf', NULL),
(3, 'sekhar gour', 'yadav@gmail.com', 285473664, 'hii this is my first learning tutorial for connecting database', NULL),
(4, 'dsf', 'yadav@gmail.com', 45544, 'hii now date will be send to database', '2020-09-19 10:17:39'),
(5, '', '', 0, '', '2020-12-05 12:59:42'),
(6, '', '', 0, '', '2020-12-05 12:59:46'),
(7, 'satyam yadav', 'yadav@gmail.com', 45544, 'hii now database is ready to go', '2020-12-05 13:00:17'),
(9, 'satyam yadav', 'satyamyadav7861@gmail.com', 5555555555, 'hii bro you getting email?', '2020-12-05 13:07:46'),
(10, '', '', 0, '', '2020-12-09 16:49:12'),
(11, 'satyam yadav', 'yadav@gmail.com', 5555555555, 'hii this is msg', '2020-12-09 16:49:40');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `serial_number` int(11) NOT NULL,
  `post_heading` text NOT NULL,
  `tagline` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `img_url` varchar(10) NOT NULL,
  `date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`serial_number`, `post_heading`, `tagline`, `slug`, `content`, `img_url`, `date`) VALUES
(1, 'let\'s learn about flask framwork', 'ever', 'second-post', '  This is complete code but data is not saved in the database. All the elements of this code are discussed in Chapter 1. The remaining database-related codes are as follows,  Store ‘questions’ in the database (Lines 23-24). Read question from the database (Lines 34-35). Read answer from the database to compare with submitted-answer (Lines 42-43). # routes.py  from my_app import app from flask import render_template, request  # home page @app.route(\'/\')  # root : main page', 'admin-bg', '2020-12-13 15:50:01'),
(2, 'let\'s learn about flask framwork', 'best tutorial', 'third', '  This is complete code but data is not saved in the database. All the elements of this code are discussed in Chapter 1. The remaining database-related codes are as follows,  Store ‘questions’ in the database (Lines 23-24). Read question from the database (Lines 34-35). Read answer from the database to compare with submitted-answer (Lines 42-43). # routes.py  from my_app import app from flask import render_template, request  # home page @app.route(\'/\')  # root : main page', 'admin-bg', '2020-12-13 15:50:01'),
(3, 'let\'s learn about flask framwork', 'best tutorial ever', 'fourth-post', 'This is complete code but data is not saved in the database. All the elements of this code are discussed in Chapter 1. The remaining database-related codes are as follows,  Store ‘questions’ in the database (Lines 23-24). Read question from the database (Lines 34-35). Read answer from the database to compare with submitted-answer (Lines 42-43). # routes.py  from my_app import app from flask import render_template, request  # home page @app.route(\'/\')  # root : main page', 'admin-bg', '2020-12-13 15:50:01'),
(4, 'let\'s learn about flask framwork', 'best tutorial ever', 'fifth-post', 'This is complete code but data is not saved in the database. All the elements of this code are discussed in Chapter 1. The remaining database-related codes are as follows,  Store ‘questions’ in the database (Lines 23-24). Read question from the database (Lines 34-35). Read answer from the database to compare with submitted-answer (Lines 42-43). # routes.py  from my_app import app from flask import render_template, request  # home page @app.route(\'/\')  # root : main page', 'admin-bg', '2020-12-13 15:50:01'),
(5, 'let\'s learn about flask framwork', 'best tutorial ever', 'six-post', 'This is complete code but data is not saved in the database. All the elements of this code are discussed in Chapter 1. The remaining database-related codes are as follows,  Store ‘questions’ in the database (Lines 23-24). Read question from the database (Lines 34-35). Read answer from the database to compare with submitted-answer (Lines 42-43). # routes.py  from my_app import app from flask import render_template, request  # home page @app.route(\'/\')  # root : main page', 'home-bg', '2020-12-13 15:50:01'),
(6, 'this is heading', 'heading best', 'heading-post', 'heading is a title and title is heading', 'admin-bg', '2020-12-19 12:34:38'),
(19, 'this is new post', 'new post', 'new-', '  hii yhis ', 'ff', '2020-12-19 15:14:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`serial_number`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`serial_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `serial_number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `serial_number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
