-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 18, 2024 at 05:19 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `c237_bookreviewapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `bookid` int(11) NOT NULL,
  `name` varchar(1000) NOT NULL,
  `author` text NOT NULL,
  `summary` text NOT NULL,
  `rating` int(11) NOT NULL,
  `review` text NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`bookid`, `name`, `author`, `summary`, `rating`, `review`, `image`) VALUES
(3, 'Dance Of Thieves', 'Mary E. Pearson', 'Dance of Thieves by Mary E. Pearson follows Kazi, a thief turned soldier, and Jase, leader of the Ballenger family, who are captured and chained together by a rival gang. Forced to cooperate, they navigate political schemes and threats in the kingdom of Eislandia, developing a complex relationship of distrust and attraction. Themes of loyalty, power, and love drive this action-packed fantasy.', 2, 'three words: i am obsessed.\r\n\r\nthis is just one of those stories that really gets everything right. the plot is super engaging, I would die for any of the characters, and the writing feels like breathing', 'DanceOfThieves.jpg'),
(4, 'Magnolia Parks', 'Jessa Hastings', 'A contemporary romance novel that centers on the tumultuous relationship between Magnolia Parks and her on-again, off-again boyfriend BJ Ballentine. Set in the glamorous and privileged world of London\'s elite, the story explores themes of love, heartache, and personal growth.', 1, 'I have a lot of regrets.. jail to the person who recommended me this book you will answer for your crimes.', 'MagParks.jpg'),
(5, 'The Joy Of Small Things', 'Hannah Jane Parkinson', 'A heartwarming collection of essays that celebrate the simple pleasures and little moments that bring joy and comfort in everyday life. Drawing from her own experiences, Parkinson highlights the beauty and significance of the small things that often go unnoticed but can significantly impact our happiness and well-being.', 5, 'I’m very grateful for this book. Since picking it up I often find myself seeking my own small things of joy.', 'TheJoyOfSmallThings.jpg'),
(6, 'Normal People', 'Sally Rooney\r\n', 'A contemporary novel that explores the complex relationship between two Irish teenagers, Connell and Marianne, as they navigate love, friendship, and personal growth from high school through university.', 3, 'Wow. one of the most frustrating, but humanising, books I have read in a long time. for sure. I feel so exhausted after reading this, but I think that may have been the authors intent. its shows that normal people living normal lives can be quite tiresome.', 'NormalPeople.jpg'),
(7, 'Almond', 'Sohn Won-Pyung', '\"Almond\" is a novel that tells the story of Yunjae, a teenage boy with a unique condition called Alexithymia, which prevents him from feeling emotions or understanding them in others. Yunjae struggles to connect with people and navigate social situations due to his condition. However, his life changes when he meets Gon, a girl at his new school who seems to understand him in ways others cannot. As their friendship deepens, Yunjae begins to experience emotions for the first time, leading him on a journey of self-discovery and understanding.', 5, 'I learned and discovered some new experiences in this book, especially about human emotions.\r\n\r\nI don\'t know how to describe this novel but a very emotional story to tell.\r\n\r\nDiscover psychology and human thinking here.', 'Almond.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`bookid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `bookid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
