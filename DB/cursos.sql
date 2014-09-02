-- phpMyAdmin SQL Dump
-- version 4.0.10
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 02, 2014 at 02:15 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

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
-- Table structure for table `blogforos`
--

CREATE TABLE IF NOT EXISTS `blogforos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `curso_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fechapublicacion` datetime NOT NULL,
  `asunto` varchar(150) NOT NULL,
  `cuerpo` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `blogforos`
--

INSERT INTO `blogforos` (`id`, `curso_id`, `usuario_id`, `fechapublicacion`, `asunto`, `cuerpo`) VALUES
(5, 3, 12, '2014-07-18 23:46:44', 'prueba de tema de discusiÃ³n 1', 'asdf sdaf adsf dsaf\r\n adsf\r\nsadf'),
(6, 8, 12, '2014-07-26 18:39:19', 'asdf', 'asdf'),
(7, 10, 12, '2014-08-08 23:16:49', 'comentario 1', 'este es un comentario'),
(8, 5, 25, '2014-08-21 23:26:49', 'prueba de tema por estudiante', 'soy un estudiante'),
(9, 5, 25, '2014-08-21 23:27:45', 's', 'sa'),
(10, 3, 26, '2014-08-21 23:40:41', 'prueba andre', 'asdf'),
(15, 3, 25, '2014-08-22 00:51:22', '1234', '1234'),
(16, 3, 17, '2014-08-22 01:01:28', 'ins', 'ins');

-- --------------------------------------------------------

--
-- Table structure for table `comentarios`
--

CREATE TABLE IF NOT EXISTS `comentarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blogforo_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `comentario` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `comentarios`
--

INSERT INTO `comentarios` (`id`, `blogforo_id`, `usuario_id`, `fecha`, `comentario`) VALUES
(10, 5, 19, '2014-07-18 23:51:22', 'prueba de comentario de usuario estudiante'),
(11, 5, 12, '2014-07-27 00:23:31', 'prueba de comentario 2'),
(12, 7, 12, '2014-08-08 23:17:42', 'respuesta'),
(13, 7, 28, '2014-08-09 21:34:30', 'asd'),
(14, 5, 12, '2014-08-21 23:08:56', '''"'),
(15, 10, 26, '2014-08-21 23:43:27', 'asdf'),
(16, 16, 25, '2014-08-24 20:07:11', 'comentario estudiante'),
(17, 16, 25, '2014-08-24 20:10:49', 'comentario estudiante 2');

-- --------------------------------------------------------

--
-- Table structure for table `cursos`
--

CREATE TABLE IF NOT EXISTS `cursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(300) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fechainicio` date NOT NULL,
  `fechafin` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `cursos`
--

INSERT INTO `cursos` (`id`, `nombre`, `usuario_id`, `fechainicio`, `fechafin`) VALUES
(3, 'prueba de curso 1', 17, '2014-07-18', '2014-07-20'),
(10, 'Seminario 2', 27, '2014-08-08', '2014-08-10');

-- --------------------------------------------------------

--
-- Table structure for table `matriculas`
--

CREATE TABLE IF NOT EXISTS `matriculas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `matriculas`
--

INSERT INTO `matriculas` (`id`, `usuario_id`, `curso_id`) VALUES
(4, 19, 3),
(5, 20, 3),
(6, 21, 4),
(7, 22, 4),
(8, 24, 3),
(9, 25, 3),
(10, 28, 10);

-- --------------------------------------------------------

--
-- Table structure for table `my_files`
--

CREATE TABLE IF NOT EXISTS `my_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `curso_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `name` varchar(75) NOT NULL,
  `type` varchar(255) NOT NULL,
  `size` int(11) NOT NULL,
  `data` longblob NOT NULL,
  `created` datetime DEFAULT NULL,
  `programas` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `my_files`
--

INSERT INTO `my_files` (`id`, `curso_id`, `usuario_id`, `name`, `type`, `size`, `data`, `created`, `programas`) VALUES
(2, 3, 12, 'TAREAS_PENDIENTES.txt', 'text/plain', 707, 0x4f42534552564143494f4e45532044452050454e4449454e5445532041554c412043415041434954410a0a2d20616c206d6174726963756c617220756e20657374756469616e74652c207175697461726c6f206465206c61206c697374612e0a0a2d2066616c746120617369676e617220696e7374727563746f72206120756e20637572736f20616c206d6f6d656e746f2064652063726561726c6f2e20536520706f6472c3ad6120686163657220636f6e20756e20636f6d626f626f7820717565206d75657374726520746f646f73206c6f73207573756172696f73207469706f20696e7374727563746f72206f20636f6d6f2073652068697a6f20656e206d617472c3ad63756c612e0a0a2d206c61206f706369c3b36e206465207375626972206172636869766f2073c3b36c6f206465626572c3ad61206465206170617265636572206375616e646f20736520696e67726573612061206c61207365636369c3b36e206465206d6174657269616c206465206465736361726761732e0a0a2d20656e206c612076697374612064656c2061756c612070617261206c6f73207573756172696f7320696e7374727563746f72207920657374756469616e7465206167726567617220756e612061636369c3b36e207061726120726567726573617220616c20686f6d652064656c2061756c612e0a0a2d206167726567617220656c206f7264656e616d69656e746f206465207461626c617320706f7220636f6c756d6e617320656e2061756c61732c206d6174726963756c61207920637572736f732e0a657374696c6f2064656c2061756c61207669727475616c20656e2067656e6572616c2e0a0a2d20657374696c6f2064656c2061756c61207669727475616c20656e2067656e6572616c2e0a0a0a4f545241530a0a2d2061727265676c6172206c612066756e6369c3b36e20646520656469746172206172636869766f2e, '2014-07-26 18:52:32', ''),
(3, 3, 12, 'howToShowHiddenFilesFolders.txt', 'text/plain', 117, 0x50617261206d6f7374726172206172636869766f732079206361727065746173206f63756c7461730a0a242064656661756c747320777269746520636f6d2e6170706c652e66696e646572204170706c6553686f77416c6c46696c657320545255450a24206b696c6c616c6c2046696e6465720a20, '2014-08-03 18:48:18', ''),
(5, 3, 25, 'Assembly Language For Intel-Based Computers, 5-e.webloc', 'application/octet-stream', 108, 0x62706c6973743030d101025355524c5f1037687474703a2f2f6b6970697276696e652e636f6d2f61736d2f67657474696e67537461727465645653323031302f696e6465782e68746d080b0f0000000000000101000000000000000300000000000000000000000000000049, '2014-08-24 20:17:52', 'chrome');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `identificacion` varchar(20) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  `email` varchar(35) NOT NULL,
  `tipo` int(11) NOT NULL,
  `nick` varchar(35) NOT NULL,
  `contrasena` varchar(32) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `identificacion`, `nombre`, `apellidos`, `email`, `tipo`, `nick`, `contrasena`, `fecha`) VALUES
(12, '113800289', 'Daniel', 'Obando Montero', '', 1, 'daniel.obando', '81dc9bdb52d04dc20036dbd8313ed055', '2014-07-18 17:59:00'),
(17, 'ins1', 'instructor1', 'prueba', 'instructor1@prueba.com', 2, 'instructor1@prueba.com', '81dc9bdb52d04dc20036dbd8313ed055', '2014-07-18 22:36:58'),
(18, 'ins2', 'instructor2', 'prueba', 'instructor2@prueba.com', 2, 'instructor2@prueba.com', '81dc9bdb52d04dc20036dbd8313ed055', '2014-07-18 22:37:26'),
(19, 'est01', 'estudiante1', 'prueba', 'estudiante1@prueba.com', 3, 'estudiante1@prueba.com', '81dc9bdb52d04dc20036dbd8313ed055', '2014-07-18 22:37:58'),
(20, 'est02', 'estudiante2', 'prueba', 'estudiante2@prueba.com', 3, 'estudiante2@prueba.com', '81dc9bdb52d04dc20036dbd8313ed055', '2014-07-18 22:38:19'),
(21, 'est03', 'estudiante3', 'prueba', 'estudiante3@prueba.com', 3, 'estudiante3@prueba.com', '81dc9bdb52d04dc20036dbd8313ed055', '2014-07-18 22:40:51'),
(22, 'est04', 'estudiante4', 'prueba', 'estudiante4@prueba.com', 3, 'estudiante4@prueba.com', '81dc9bdb52d04dc20036dbd8313ed055', '2014-07-18 22:42:03'),
(23, '34123421421', 'sadf', 'asdf sadf', 'asdf@sadf.com', 2, 'prueba', '81dc9bdb52d04dc20036dbd8313ed055', '2014-07-27 00:14:57'),
(24, '123412341234', 'estudiante5', 'prueba', 'e5@correo.com', 3, 'e5', '81dc9bdb52d04dc20036dbd8313ed055', '2014-07-31 19:21:23'),
(25, '423156782134', 'e6', 'prueba', 'e5@prueba.com', 3, 'e6', '81dc9bdb52d04dc20036dbd8313ed055', '2014-07-31 20:18:58'),
(26, '1234234', 'AndrÃ©', 'Barrantes', 'andre@prueba.com', 1, 'andre', '81dc9bdb52d04dc20036dbd8313ed055', '2014-08-08 22:59:20'),
(27, '12341234', 'Instructor5', 'Prueba', 'instructor5@prueba.com', 2, 'ins5', '81dc9bdb52d04dc20036dbd8313ed055', '2014-08-08 23:01:03'),
(28, '423423', 'Estudiante10', 'Prueba', 'estudiante10@prueba.com', 3, 'est10', '81dc9bdb52d04dc20036dbd8313ed055', '2014-08-08 23:01:36'),
(29, '121234123434', 'pp', 'pp', 'pp@pp.com', 3, ' pp', '81dc9bdb52d04dc20036dbd8313ed055', '2014-08-21 00:50:52');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
