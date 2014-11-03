-- phpMyAdmin SQL Dump
-- version 4.0.10
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 02, 2014 at 07:45 PM
-- Server version: 5.6.21
-- PHP Version: 5.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cursos`
--

-- --------------------------------------------------------

--
-- Table structure for table `tipos_archivos`
--

CREATE TABLE IF NOT EXISTS `tipos_archivos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `extension` text NOT NULL,
  `programas` text NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `tipos_archivos`
--

INSERT INTO `tipos_archivos` (`id`, `extension`, `programas`) VALUES
(1, 'xls', 'excel, calc'),
(2, 'pdf', 'adobe reader, foxit'),
(3, 'xlsx', 'excel, calc'),
(4, 'doc', 'word, writter'),
(5, 'docx', 'word, writter'),
(6, 'ppt', 'power point, impress'),
(8, 'txt', 'bloc de notas, notepad++');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
