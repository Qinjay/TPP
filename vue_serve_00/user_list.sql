-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2019-07-01 03:46:33
-- 服务器版本： 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tpp`
--

-- --------------------------------------------------------

--
-- 表的结构 `user_list`
--

CREATE TABLE `user_list` (
  `uid` int(16) NOT NULL,
  `uname` varchar(11) CHARACTER SET utf8 NOT NULL,
  `upwd` varchar(16) CHARACTER SET utf8 NOT NULL,
  `zname` varchar(16) CHARACTER SET utf8 NOT NULL DEFAULT '亲爱的小主'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `user_list`
--

INSERT INTO `user_list` (`uid`, `uname`, `upwd`, `zname`) VALUES
(1, '13212345678', '123456', '亲爱的小主'),
(2, '13512345678', '654321', '亲爱的小主'),
(3, '13312345678', '123456', '亲爱的小主'),
(4, '13412345678', '123456', '亲爱的小主'),
(9, '13612345678', '235082', '亲爱的小主'),
(10, '13512315236', '139726', '亲爱的小主'),
(11, '13587151214', '293426', '亲爱的小主'),
(12, '13645123645', '335965', '亲爱的小主'),
(13, '13598746213', '496256', '亲爱的小主'),
(14, '13596465858', '579197', '亲爱的小主'),
(15, '13513564568', '407018', '亲爱的小主'),
(16, '13578965456', '706257', '亲爱的小主');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user_list`
--
ALTER TABLE `user_list`
  ADD PRIMARY KEY (`uid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `user_list`
--
ALTER TABLE `user_list`
  MODIFY `uid` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
