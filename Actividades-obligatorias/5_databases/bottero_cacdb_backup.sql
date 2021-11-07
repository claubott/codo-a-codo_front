-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 03-11-2021 a las 05:46:33
-- Versión del servidor: 10.5.12-MariaDB
-- Versión de PHP: 7.3.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `id17867489_cacdb`
--
CREATE DATABASE IF NOT EXISTS `id17867489_cacdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `id17867489_cacdb`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `fecha_nac` date NOT NULL,
  `fecha_alta` timestamp NOT NULL DEFAULT current_timestamp(),
  `provincia` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id`, `nombre`, `apellido`, `fecha_nac`, `fecha_alta`, `provincia`) VALUES
(1, 'Lola', 'Mora', '1866-11-17', '2021-11-03 04:13:34', 90),
(2, 'Emilia', 'Bertolé', '1896-06-21', '2021-11-03 04:16:03', 82),
(3, 'Mildred', 'Burton', '1942-12-28', '2021-11-03 04:17:19', 30),
(4, 'Gaby', 'Herbstein', '1969-05-03', '2021-11-03 04:18:18', 6),
(5, 'Florencia', 'Aise', '1983-12-09', '2021-11-03 04:19:04', 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE `provincias` (
  `id` int(11) NOT NULL,
  `id_pais` smallint(3) NOT NULL,
  `id_provincia` tinyint(2) NOT NULL,
  `nb_provincia` varchar(53) COLLATE utf8_unicode_ci NOT NULL,
  `fuente_dat` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `provincias`
--

INSERT INTO `provincias` (`id`, `id_pais`, `id_provincia`, `nb_provincia`, `fuente_dat`) VALUES
(1, 32, 2, 'Ciudad Autónoma de Buenos Aires', 'IDERA'),
(2, 32, 6, 'Buenos Aires', 'IDERA'),
(3, 32, 10, 'Catamarca', 'IDERA'),
(4, 32, 14, 'Córdoba', 'IDERA'),
(7, 32, 18, 'Corrientes', 'IDERA'),
(8, 32, 22, 'Chaco', 'IDERA'),
(9, 32, 26, 'Chubut', 'IDERA'),
(10, 32, 30, 'Entre Ríos', 'IDERA'),
(11, 32, 34, 'Formosa', 'IDERA'),
(12, 32, 38, 'Jujuy', 'IDERA'),
(13, 32, 42, 'La Pampa', 'IDERA'),
(14, 32, 46, 'La Rioja', 'IDERA'),
(15, 32, 50, 'Mendoza', 'IDERA'),
(16, 32, 54, 'Misiones', 'IDERA'),
(17, 32, 58, 'Neuquén', 'IDERA'),
(18, 32, 62, 'Río Negro', 'IDERA'),
(19, 32, 66, 'Salta', 'IDERA'),
(20, 32, 70, 'San Juan', 'IDERA'),
(21, 32, 74, 'San Luis', 'IDERA'),
(22, 32, 78, 'Santa Cruz', 'IDERA'),
(23, 32, 82, 'Santa Fe', 'IDERA'),
(24, 32, 86, 'Santiago del Estero', 'IDERA'),
(25, 32, 90, 'Tucumán', 'IDERA'),
(26, 32, 94, 'Tierra del Fuego, Antártida e Islas del Atlántico Sur', 'IDERA');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `personas-provincias_ibfk` (`provincia`);

--
-- Indices de la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_provincia` (`id_provincia`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `provincias`
--
ALTER TABLE `provincias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `personas`
--
ALTER TABLE `personas`
  ADD CONSTRAINT `personas-provincias_ibfk` FOREIGN KEY (`provincia`) REFERENCES `provincias` (`id_provincia`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
