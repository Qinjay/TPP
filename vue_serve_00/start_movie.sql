-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2019-07-01 03:54:39
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
-- 表的结构 `start_movie`
--

CREATE TABLE `start_movie` (
  `oid` int(11) NOT NULL,
  `sopen` time NOT NULL,
  `send` time NOT NULL,
  `shose` varchar(11) CHARACTER SET utf8 NOT NULL DEFAULT '1号厅',
  `sprice` decimal(3,1) NOT NULL,
  `stype` varchar(11) CHARACTER SET utf8 NOT NULL DEFAULT '3D英语'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `start_movie`
--

INSERT INTO `start_movie` (`oid`, `sopen`, `send`, `shose`, `sprice`, `stype`) VALUES
(1, '09:15:00', '11:22:00', '7号厅', '34.0', '3D英语'),
(2, '10:10:00', '12:17:00', 'IMAX号厅', '42.9', '3D英语'),
(3, '10:25:00', '12:32:00', 'VIP2厅', '57.9', '3D英语'),
(4, '10:40:00', '13:17:00', '5号厅', '32.9', '3D英语'),
(5, '11:10:00', '00:00:00', '1号厅', '0.0', '3D英语'),
(6, '12:00:00', '14:07:00', '3号厅', '32.9', '3D英语'),
(7, '13:35:00', '15:42:00', '7号厅', '32.9', '3D英语'),
(8, '15:00:00', '17:07:00', 'IMAX厅', '42.9', '3D英语');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `start_movie`
--
ALTER TABLE `start_movie`
  ADD PRIMARY KEY (`oid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `start_movie`
--
ALTER TABLE `start_movie`
  MODIFY `oid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
