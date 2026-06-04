-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-06-2026 a las 01:22:15
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fullcourt`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comenta`
--

CREATE TABLE `comenta` (
  `id_usuario` int(11) NOT NULL,
  `id_pista` int(11) NOT NULL,
  `texto` text DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_comentario` int(11) NOT NULL,
  `valoracion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `comenta`
--

INSERT INTO `comenta` (`id_usuario`, `id_pista`, `texto`, `fecha`, `id_comentario`, `valoracion`) VALUES
(2, 3, 'mal', '2026-05-22', 9, 1),
(2, 2, '2', '2026-06-02', 13, 2),
(2, 1, '1', '2026-06-03', 15, 5),
(2, 2, '1', '2026-06-03', 16, 3),
(2, 1, '0000', '2026-06-03', 18, 1),
(2, 3, '0000', '2026-06-03', 20, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deporte`
--

CREATE TABLE `deporte` (
  `id_deporte` int(11) NOT NULL,
  `nombre_deporte` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `deporte`
--

INSERT INTO `deporte` (`id_deporte`, `nombre_deporte`) VALUES
(1, 'Fútbol'),
(2, 'Baloncesto'),
(3, 'Pádel');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `favorita`
--

CREATE TABLE `favorita` (
  `id_usuario` int(11) NOT NULL,
  `id_pista` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `favorita`
--

INSERT INTO `favorita` (`id_usuario`, `id_pista`) VALUES
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `incidencia`
--

CREATE TABLE `incidencia` (
  `id_incidencia` int(11) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `respuesta` text NOT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `incidencia`
--

INSERT INTO `incidencia` (`id_incidencia`, `descripcion`, `estado`, `respuesta`, `id_usuario`) VALUES
(1, 'he encontrado la pisto ocupada ', 'solucionada', 'esta todo bien ', 2),
(2, 'hggfghhf', 'solucionada', '', 2),
(3, 'hhhhhhhhhhh', 'solucionada', 'hhhhhhhhhhhhh', 1),
(4, 'llllllllllll', 'solucionada', '', 2),
(5, 'aaaaa', 'solucionada', 'hhhhhhhhh', 2),
(6, '0000', 'revisada', '0000', 2),
(7, 'vvvvvvvvvvvvvv', 'pendiente', '', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

CREATE TABLE `pago` (
  `id_pago` int(11) NOT NULL,
  `importe` decimal(8,2) DEFAULT NULL,
  `fecha_pago` date DEFAULT NULL,
  `metodo_pago` varchar(30) DEFAULT NULL,
  `numero_tarjeta` varchar(20) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_reserva` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`id_pago`, `importe`, `fecha_pago`, `metodo_pago`, `numero_tarjeta`, `id_usuario`, `id_reserva`) VALUES
(20, 10.00, '2026-06-03', 'Tarjeta', NULL, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pista`
--

CREATE TABLE `pista` (
  `id_pista` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `precio_hora` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pista`
--

INSERT INTO `pista` (`id_pista`, `nombre`, `precio_hora`) VALUES
(1, 'Pista Central', 10.00),
(2, 'Pista Basket ', 10.00),
(3, 'Pista Pádel ', 10.00),
(14, 'pista 3', 10.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pista_deporte`
--

CREATE TABLE `pista_deporte` (
  `id_pista` int(11) NOT NULL,
  `id_deporte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pista_deporte`
--

INSERT INTO `pista_deporte` (`id_pista`, `id_deporte`) VALUES
(1, 1),
(2, 2),
(3, 3),
(14, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `id_reserva` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `estado` varchar(30) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_pista` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`id_reserva`, `fecha`, `hora`, `estado`, `id_usuario`, `id_pista`, `fecha_creacion`) VALUES
(1, '2026-06-03', '10:00:00', 'cancelada', 2, 1, '2026-06-03 23:58:52'),
(2, '2026-06-04', '21:00:00', 'cancelada', 2, 2, '2026-06-03 23:59:06'),
(3, '2026-06-16', '20:00:00', 'cancelada', 2, 3, '2026-06-03 23:59:20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `rol` varchar(20) DEFAULT NULL,
  `contraseña` varchar(255) DEFAULT NULL,
  `estado` varchar(20) DEFAULT 'activo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre`, `email`, `telefono`, `rol`, `contraseña`, `estado`) VALUES
(1, 'Administrador', 'fullcourtbooking@gmail.com', '600000000', 'admin', '1234', 'activo'),
(2, 'Mohammed ', 'emmmmmmm60@gmail.com', '614484308', 'cliente', '06082000', 'activo'),
(3, 'Oana Larisa', 'oana123@gmail.com', '', 'cliente', '06082000', 'activo'),
(4, 'Larisa Bejenaru Trifan', 'larylalala@gmail.com', '666112993', 'cliente', '752124', 'activo'),
(5, 'lllll', 'lololo@gmail.com', '666112993', 'cliente', '06082000', 'activo'),
(6, 'hahaha', 'hahaha@gmail.com', '666112665', 'cliente', '06082000', 'activo'),
(7, 'sergio', 'sergio@gmail.com', '666554885', 'cliente', '06082000', 'activo'),
(8, 'papo', 'papo@gmail.com', '666552336', 'cliente', '06082000', 'activo'),
(9, 'roro', 'roro@gmail.com', '666445886', 'cliente', '06082000', 'activo'),
(10, 'fdsfds', 'dsfdsfds@hdasa', '666666666', 'cliente', '', 'activo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comenta`
--
ALTER TABLE `comenta`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `id_pista` (`id_pista`);

--
-- Indices de la tabla `deporte`
--
ALTER TABLE `deporte`
  ADD PRIMARY KEY (`id_deporte`);

--
-- Indices de la tabla `favorita`
--
ALTER TABLE `favorita`
  ADD PRIMARY KEY (`id_usuario`,`id_pista`),
  ADD KEY `id_pista` (`id_pista`);

--
-- Indices de la tabla `incidencia`
--
ALTER TABLE `incidencia`
  ADD PRIMARY KEY (`id_incidencia`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_reserva` (`id_reserva`);

--
-- Indices de la tabla `pista`
--
ALTER TABLE `pista`
  ADD PRIMARY KEY (`id_pista`);

--
-- Indices de la tabla `pista_deporte`
--
ALTER TABLE `pista_deporte`
  ADD PRIMARY KEY (`id_pista`,`id_deporte`),
  ADD KEY `id_deporte` (`id_deporte`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_pista` (`id_pista`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comenta`
--
ALTER TABLE `comenta`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `deporte`
--
ALTER TABLE `deporte`
  MODIFY `id_deporte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `incidencia`
--
ALTER TABLE `incidencia`
  MODIFY `id_incidencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `pista`
--
ALTER TABLE `pista`
  MODIFY `id_pista` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comenta`
--
ALTER TABLE `comenta`
  ADD CONSTRAINT `comenta_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `comenta_ibfk_2` FOREIGN KEY (`id_pista`) REFERENCES `pista` (`id_pista`);

--
-- Filtros para la tabla `favorita`
--
ALTER TABLE `favorita`
  ADD CONSTRAINT `favorita_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `favorita_ibfk_2` FOREIGN KEY (`id_pista`) REFERENCES `pista` (`id_pista`);

--
-- Filtros para la tabla `incidencia`
--
ALTER TABLE `incidencia`
  ADD CONSTRAINT `incidencia_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `pago_ibfk_2` FOREIGN KEY (`id_reserva`) REFERENCES `reserva` (`id_reserva`);

--
-- Filtros para la tabla `pista_deporte`
--
ALTER TABLE `pista_deporte`
  ADD CONSTRAINT `pista_deporte_ibfk_1` FOREIGN KEY (`id_pista`) REFERENCES `pista` (`id_pista`),
  ADD CONSTRAINT `pista_deporte_ibfk_2` FOREIGN KEY (`id_deporte`) REFERENCES `deporte` (`id_deporte`);

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`id_pista`) REFERENCES `pista` (`id_pista`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
