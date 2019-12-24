-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 24, 2019 at 05:35 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(3) NOT NULL,
  `cat_title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(2, 'first '),
(3, 'PHP mysql'),
(14, 'android'),
(19, 'Test 5'),
(20, 'Java'),
(21, 'siam');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(3) NOT NULL,
  `comment_post_id` int(3) NOT NULL,
  `comment_author` varchar(255) NOT NULL,
  `comment_email` varchar(255) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_status` varchar(255) NOT NULL,
  `comment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`comment_id`, `comment_post_id`, `comment_author`, `comment_email`, `comment_content`, `comment_status`, `comment_date`) VALUES
(1, 10, 'Dark Shadow', 'shamsulsiam@gmail.com', 'this is example content', 'approved', '2019-05-12'),
(3, 9, 'hasan siam', 'example@gmail.com', 'This is nice', 'unapproved', '2019-05-16'),
(4, 10, 'RR martin', 'jerry@gmail.com', 'This is funny', 'approved', '2019-05-16'),
(5, 11, 'Shamsul hasan', 'siamss@gmail.com', 'This is my first project', 'unapproved', '2019-05-16'),
(6, 10, 'joker', 'hledger@gmail.com', 'Hahaha hahaha', 'approved', '2019-05-16'),
(7, 10, 'joker', 'hledger@gmail.com', 'Hahaha hahaha', 'unapproved', '2019-05-16'),
(8, 10, 'someone', 'someone@gamil.com', 'some comments', 'unapproved', '2019-05-16');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(3) NOT NULL,
  `post_category_id` int(3) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_author` varchar(255) NOT NULL,
  `post_date` date NOT NULL,
  `post_image` text NOT NULL,
  `post_content` text NOT NULL,
  `post_tags` varchar(255) NOT NULL,
  `post_comment_count` int(11) NOT NULL,
  `post_status` varchar(255) NOT NULL DEFAULT 'draft'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `post_category_id`, `post_title`, `post_author`, `post_date`, `post_image`, `post_content`, `post_tags`, `post_comment_count`, `post_status`) VALUES
(9, 2, 'post 2', 'siam35', '2019-05-26', 'football comedy.jpg', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Inventore, perspiciatis adipisci accusamus laudantium odit aliquam repellat tempore quos aspernatur vero.\r\nakdjflk kajdflaaaaass kadjfffffffffffffffffffffff kasdjf k kajdfl .a fakdfj . kjak f. ajkdf ', 'comedy,football', 4, 'text stat'),
(10, 2, 'Example post', 'Nazmul Hasan', '2019-05-26', '58376837_4698085430520204_883197536943210496_n.jpg', 'This is for testing purpose', 'example,test,java', 5, 'draft'),
(11, 2, 'testing title', 'known author', '2019-05-16', 'html work.png', 'Should have a content', 'testing,example', 4, 'published'),
(12, 2, 'test post', 'test writer', '2019-05-26', '50422605_592322031216675_7472437329110499328_n.jpg', 'there is no content', 'not js, not prg', 0, 'published'),
(13, 3, 'new title', 'diaz', '2019-05-16', '51039939_393809214709917_8554313408852262912_n.jpg', 'some garbish texts', 'something,test,nothing', 0, 'published'),
(20, 3, 'hello', 'siam', '2019-05-19', 'image_5.jpg', 'klj kj aieihg aadifjo', 'Tests,test,testing', 0, 'status'),
(21, 19, 'testing counter', 'test author', '2019-05-25', 'image_5.jpg', 'there is a demo content', 'Tests,test,testing', 0, 'published');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(3) NOT NULL,
  `username` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_firstname` varchar(255) NOT NULL,
  `user_lastname` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_image` text NOT NULL,
  `user_role` varchar(255) NOT NULL,
  `randSalt` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `user_password`, `user_firstname`, `user_lastname`, `user_email`, `user_image`, `user_role`, `randSalt`) VALUES
(1, 'rico', '123', 'Rico', 'Suave', 'ricosuave@gmail.com', '', 'admin', ''),
(5, 'siam', '12345678', 'Hasan', 'Siam', 'an@yahoo.com', '', 'subscriber', ''),
(6, 'robo', '12345', 'ro', 'bo', 'robo@ex.com', '', 'subscriber', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
