-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 19-07-2014 a las 00:30:29
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `cursos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blogforos`
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `blogforos`
--

INSERT INTO `blogforos` (`id`, `curso_id`, `usuario_id`, `fechapublicacion`, `asunto`, `cuerpo`) VALUES
(5, 3, 12, '2014-07-18 23:46:44', 'prueba de tema de discusiÃ³n 1', 'asdf sdaf adsf dsaf\r\n adsf\r\nsadf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE IF NOT EXISTS `comentarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blogforo_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `comentario` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`id`, `blogforo_id`, `usuario_id`, `fecha`, `comentario`) VALUES
(10, 5, 19, '2014-07-18 23:51:22', 'prueba de comentario de usuario estudiante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE IF NOT EXISTS `cursos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(300) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fechainicio` date NOT NULL,
  `fechafin` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`id`, `nombre`, `usuario_id`, `fechainicio`, `fechafin`) VALUES
(3, 'prueba de curso 1', 12, '2014-07-18', '2014-07-20'),
(4, 'prueba de curso 2', 12, '2014-07-18', '2014-07-20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `matriculas`
--

CREATE TABLE IF NOT EXISTS `matriculas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `curso_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Volcado de datos para la tabla `matriculas`
--

INSERT INTO `matriculas` (`id`, `usuario_id`, `curso_id`) VALUES
(4, 19, 3),
(5, 20, 3),
(6, 21, 4),
(7, 22, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `my_files`
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `my_files`
--
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `identificacion`, `nombre`, `apellidos`, `email`, `tipo`, `nick`, `contrasena`, `fecha`) VALUES
(12, '113800289', 'Daniel', 'Obando Montero', '', 1, 'daniel.obando', '81dc9bdb52d04dc20036dbd8313ed055', '2014-07-18 17:59:00'),
(17, 'ins01', 'instructor1', 'prueba', 'instructor1@prueba.com', 2, 'instructor1@prueba.com', '81dc9bdb52d04dc20036dbd8313ed055', '2014-07-18 22:36:58'),
(18, 'ins2', 'instructor2', 'prueba', 'instructor2@prueba.com', 2, 'instructor2@prueba.com', '81dc9bdb52d04dc20036dbd8313ed055', '2014-07-18 22:37:26'),
(19, 'est01', 'estudiante1', 'prueba', 'estudiante1@prueba.com', 3, 'estudiante1@prueba.com', '81dc9bdb52d04dc20036dbd8313ed055', '2014-07-18 22:37:58'),
(20, 'est02', 'estudiante2', 'prueba', 'estudiante2@prueba.com', 3, 'estudiante2@prueba.com', '81dc9bdb52d04dc20036dbd8313ed055', '2014-07-18 22:38:19'),
(21, 'est03', 'estudiante3', 'prueba', 'estudiante3@prueba.com', 3, 'estudiante3@prueba.com', '81dc9bdb52d04dc20036dbd8313ed055', '2014-07-18 22:40:51'),
(22, 'est04', 'estudiante4', 'prueba', 'estudiante4@prueba.com', 3, 'estudiante4@prueba.com', '81dc9bdb52d04dc20036dbd8313ed055', '2014-07-18 22:42:03');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
