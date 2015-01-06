-- phpMyAdmin SQL Dump
-- version 4.2.10
-- http://www.phpmyadmin.net
--
-- Host: localhost:8889
-- Generation Time: Jan 06, 2015 at 02:19 AM
-- Server version: 5.5.38
-- PHP Version: 5.6.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `etechni1_capacitavirtual`
--

-- --------------------------------------------------------

--
-- Table structure for table `blacklists`
--

CREATE TABLE `blacklists` (
`id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `blogforos`
--

CREATE TABLE `blogforos` (
`id` bigint(20) unsigned NOT NULL,
  `curso_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fechapublicacion` datetime NOT NULL,
  `asunto` varchar(150) NOT NULL,
  `cuerpo` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blogforos`
--

INSERT INTO `blogforos` (`id`, `curso_id`, `usuario_id`, `fechapublicacion`, `asunto`, `cuerpo`) VALUES
(5, 3, 12, '2014-07-18 23:46:44', 'prueba de tema de discusiÃƒÂ³n 1', 'asdf sdaf adsf dsaf\r\n adsf\r\nsadf'),
(6, 8, 12, '2014-07-26 18:39:19', 'asdf', 'asdf'),
(7, 10, 12, '2014-08-08 23:16:49', 'comentario 1', 'este es un comentario'),
(8, 5, 25, '2014-08-21 23:26:49', 'prueba de tema por estudiante', 'soy un estudiante'),
(9, 5, 25, '2014-08-21 23:27:45', 's', 'sa'),
(10, 3, 26, '2014-08-21 23:40:41', 'prueba andre', 'asdf'),
(15, 3, 25, '2014-08-22 00:51:22', '1234', '1234'),
(16, 3, 17, '2014-08-22 01:01:28', 'ins', 'ins'),
(17, 11, 32, '2014-09-18 10:49:25', 'Caso de prueba', 'Favor ver caso adjunto de ...'),
(18, 13, 56, '2014-11-24 07:03:48', '', ''),
(24, 23, 31, '2014-11-24 17:00:20', 'prueba3', '1234'),
(25, 12, 31, '2014-11-24 17:02:40', 'prueba4', '1234'),
(26, 11, 31, '2015-01-01 22:34:20', 'prueba', 'esta es mi foto'),
(27, 11, 31, '2015-01-01 22:34:54', 'prueba', 'esta es mi foto'),
(28, 11, 32, '2015-01-01 23:02:47', 'sss', 'sss');

-- --------------------------------------------------------

--
-- Table structure for table `comentarios`
--

CREATE TABLE `comentarios` (
`id` int(11) NOT NULL,
  `blogforo_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `comentario` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

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
(17, 16, 25, '2014-08-24 20:10:49', 'comentario estudiante 2'),
(18, 5, 12, '2014-09-01 22:09:05', 'houh'),
(19, 5, 12, '2014-09-01 22:09:06', 'houh'),
(20, 5, 12, '2014-09-01 22:09:07', 'houh'),
(21, 5, 12, '2014-09-01 22:09:17', 'pefj'),
(22, 5, 12, '2014-09-01 22:14:26', 'pefj'),
(23, 5, 12, '2014-09-01 22:14:27', 'pefj'),
(24, 5, 12, '2014-09-01 22:14:27', 'pefj'),
(25, 5, 12, '2014-09-01 22:14:38', 'pefj'),
(26, 5, 12, '2014-09-01 22:15:12', 'asfgio'),
(27, 5, 12, '2014-09-01 22:16:38', 'akfj'),
(28, 5, 12, '2014-09-01 22:24:09', 'epifo'),
(29, 5, 12, '2014-09-01 22:24:55', 'ofiej'),
(30, 5, 12, '2014-09-01 22:29:37', 'asoif'),
(31, 5, 12, '2014-09-01 22:32:52', 'aldij'),
(32, 5, 12, '2014-09-01 22:34:36', 'oisdaj'),
(33, 5, 12, '2014-09-01 22:36:05', 'oisdaj'),
(34, 5, 12, '2014-09-01 22:39:09', 'akjnf'),
(35, 5, 12, '2014-09-01 22:44:24', 'fij'),
(36, 5, 12, '2014-09-01 22:44:44', 'fij'),
(37, 5, 12, '2014-09-01 22:44:45', 'fij'),
(38, 5, 12, '2014-09-01 22:44:46', 'fij'),
(39, 5, 12, '2014-09-01 22:44:46', 'fij'),
(40, 5, 12, '2014-09-01 22:44:46', 'fij'),
(41, 5, 12, '2014-09-01 22:44:49', 'pfdj'),
(42, 5, 12, '2014-09-01 22:45:19', 'pfdj'),
(43, 5, 12, '2014-09-01 22:45:20', 'pfdj'),
(44, 5, 12, '2014-09-01 22:45:21', 'pfdj'),
(45, 5, 12, '2014-09-01 22:45:21', 'pfdj'),
(46, 5, 12, '2014-09-01 22:45:30', 'pfdj'),
(47, 5, 12, '2014-09-01 22:46:24', 'sd'),
(48, 5, 12, '2014-09-01 22:48:38', 'sodi'),
(49, 5, 12, '2014-09-01 22:51:24', 'oaijfs'),
(50, 17, 12, '2014-09-18 18:27:06', 'comentario del caso adjunto'),
(51, 17, 33, '2014-10-06 10:48:59', 'Mensaje de prueba'),
(52, 17, 31, '2014-10-22 16:25:39', 'quiero comentar esto'),
(53, 27, 31, '2014-11-24 17:18:10', '5678'),
(54, 0, 37, '2014-11-26 07:31:34', ''),
(55, 18, 37, '2014-11-26 07:31:38', 'Buen dÃ­a don Ariel, agradezco su colaboraciÃ³n para que me enviÃ© los documentos vistos en el seminario.\r\nDe antemano muchas gracias!!!'),
(56, 18, 56, '2014-11-26 10:16:18', 'Con todo gusto.\r\nEstarÃ© subiendo documentos en estos dÃ­as.\r\nSaludos cordiales!!!'),
(57, 26, 32, '2015-01-01 22:51:17', 'que buena foto'),
(58, 26, 31, '2015-01-01 23:12:29', 'gracias');

-- --------------------------------------------------------

--
-- Table structure for table `cursos`
--

CREATE TABLE `cursos` (
`id` int(11) NOT NULL,
  `nombre` varchar(300) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fechainicio` date NOT NULL,
  `fechafin` date DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cursos`
--

INSERT INTO `cursos` (`id`, `nombre`, `usuario_id`, `fechainicio`, `fechafin`) VALUES
(11, 'Curso01', 31, '2014-11-30', '0000-00-00'),
(12, 'Prueba 1', 31, '2014-11-27', '2014-11-28');

-- --------------------------------------------------------

--
-- Table structure for table `materiales`
--

CREATE TABLE `materiales` (
`id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `nombre` varchar(300) NOT NULL,
  `tamano` int(11) NOT NULL,
  `url` varchar(300) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `programas` text NOT NULL,
  `descripcion` text NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `materiales`
--

INSERT INTO `materiales` (`id`, `curso_id`, `usuario_id`, `nombre`, `tamano`, `url`, `link`, `programas`, `descripcion`, `fecha`) VALUES
(1, 11, 31, 'shidokan01.jpg', 70011, 'materiales/shidokan01.jpg', NULL, '', '', '2015-01-03'),
(2, 11, 31, 'https://www.google.co.cr/?gws_rd=ssl', 0, NULL, 'https://www.google.co.cr/?gws_rd=ssl', 'navegadores', 'google', '2015-01-06');

-- --------------------------------------------------------

--
-- Table structure for table `matriculas`
--

CREATE TABLE `matriculas` (
`id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matriculas`
--

INSERT INTO `matriculas` (`id`, `usuario_id`, `curso_id`) VALUES
(6, 21, 4),
(7, 22, 4),
(8, 24, 3),
(9, 25, 3),
(10, 28, 10),
(12, 30, 10),
(14, 36, 13),
(15, 37, 13),
(16, 50, 13),
(17, 39, 13),
(18, 40, 13),
(19, 41, 13),
(20, 42, 13),
(21, 43, 13),
(22, 44, 13),
(23, 46, 13),
(24, 47, 13),
(27, 53, 13),
(28, 54, 12),
(29, 58, 14),
(32, 61, 14),
(33, 62, 14),
(34, 63, 14),
(35, 64, 14),
(36, 65, 14),
(37, 66, 14),
(38, 67, 14),
(39, 68, 14),
(40, 69, 14),
(41, 70, 14),
(42, 71, 14),
(43, 72, 14),
(44, 73, 14),
(45, 74, 14),
(46, 75, 14),
(47, 76, 14),
(48, 77, 14),
(49, 78, 14),
(50, 79, 14),
(51, 80, 13),
(52, 59, 14),
(53, 81, 16),
(54, 82, 16),
(55, 83, 16),
(56, 84, 16),
(57, 85, 16),
(58, 86, 16),
(59, 87, 16),
(60, 88, 16),
(61, 89, 16),
(62, 90, 16),
(63, 91, 16),
(64, 92, 16),
(65, 93, 16),
(66, 94, 16),
(67, 95, 16),
(68, 96, 16),
(70, 98, 16),
(71, 99, 16),
(72, 100, 16),
(73, 101, 16),
(74, 102, 16),
(75, 103, 16),
(76, 104, 16),
(77, 105, 16),
(78, 106, 16),
(79, 107, 16),
(80, 108, 16),
(81, 109, 16),
(82, 110, 16),
(83, 111, 16),
(84, 112, 16),
(85, 113, 16),
(86, 114, 16),
(88, 12, 11),
(89, 32, 11);

-- --------------------------------------------------------

--
-- Table structure for table `tipos_archivos`
--

CREATE TABLE `tipos_archivos` (
`id` bigint(20) unsigned NOT NULL,
  `extension` text NOT NULL,
  `programas` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
`id` bigint(20) unsigned NOT NULL,
  `identificacion` varchar(20) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  `email` varchar(35) NOT NULL,
  `tipo` int(11) NOT NULL,
  `nick` varchar(35) NOT NULL,
  `contrasena` varchar(32) NOT NULL,
  `fecha` datetime NOT NULL,
  `notificaciones` tinyint(1) DEFAULT '1',
  `urlfoto` varchar(255) DEFAULT NULL,
  `blacklisted` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `identificacion`, `nombre`, `apellidos`, `email`, `tipo`, `nick`, `contrasena`, `fecha`, `notificaciones`, `urlfoto`, `blacklisted`) VALUES
(12, '113800289', 'Daniel', 'Obando Montero', 'soporte@capacita.co', 1, 'daniel.obando', '4872a322360d4c7293952a39b5a2eb78', '2014-10-15 14:43:59', 0, '', 0),
(31, '123456789', 'Instructor', 'Prueba Correo', 'dom_2789@yahoo.com', 2, 'Ins.prueba', '81dc9bdb52d04dc20036dbd8313ed055', '2015-01-05 23:09:06', 1, 'fotos_instructores/album_meddle_front.jpg', 0),
(32, '1234', 'Estudiante', 'Prueba', 'dom_2789@yahoo.com', 3, 'e.prueba', '81dc9bdb52d04dc20036dbd8313ed055', '2014-10-15 14:44:29', 1, '', 0),
(33, '113930466', 'AndrÃ©', 'Barrantes Ramirez', 'andre.barrantes@capacita.co', 1, 'andre.barrantes', '21b7e5c0fdc79815f9def9d79096a5bd', '2014-11-19 09:26:32', 1, '', 0),
(34, '113510793', 'Cesar', 'Barrantes Ramirez', 'cbarrantes@comexpcr.com', 3, '', 'ae6baf9e0b3bd6e1bb810d680e91a655', '2014-10-06 10:52:41', 1, '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blacklists`
--
ALTER TABLE `blacklists`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogforos`
--
ALTER TABLE `blogforos`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `comentarios`
--
ALTER TABLE `comentarios`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cursos`
--
ALTER TABLE `cursos`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `materiales`
--
ALTER TABLE `materiales`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `matriculas`
--
ALTER TABLE `matriculas`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipos_archivos`
--
ALTER TABLE `tipos_archivos`
 ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blacklists`
--
ALTER TABLE `blacklists`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `blogforos`
--
ALTER TABLE `blogforos`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `comentarios`
--
ALTER TABLE `comentarios`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT for table `cursos`
--
ALTER TABLE `cursos`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `materiales`
--
ALTER TABLE `materiales`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `matriculas`
--
ALTER TABLE `matriculas`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=90;
--
-- AUTO_INCREMENT for table `tipos_archivos`
--
ALTER TABLE `tipos_archivos`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;