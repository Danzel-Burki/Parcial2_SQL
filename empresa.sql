-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-11-2024 a las 22:30:41
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
-- Base de datos: `empresa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catalogo`
--

CREATE TABLE `catalogo` (
  `catalogo_id` int(11) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `disponible` tinyint(1) DEFAULT 1,
  `fecha_actualizacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `catalogo`
--

INSERT INTO `catalogo` (`catalogo_id`, `producto_id`, `disponible`, `fecha_actualizacion`) VALUES
(1, 1, 1, '2024-10-15'),
(2, 2, 1, '2024-10-20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cliente_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `contacto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cliente_id`, `nombre`, `contacto`) VALUES
(1, 'Juan Perez', 'juancito.perez@gmail.com'),
(2, 'Maria Martinez', 'mariamartinez@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas_corrientes`
--

CREATE TABLE `cuentas_corrientes` (
  `cuenta_id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `debito` decimal(10,2) DEFAULT NULL,
  `credito` decimal(10,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cuentas_corrientes`
--

INSERT INTO `cuentas_corrientes` (`cuenta_id`, `cliente_id`, `debito`, `credito`, `fecha`) VALUES
(1, 1, 150.00, 0.00, '2024-10-01'),
(2, 2, 0.00, 200.00, '2024-10-02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `detalle_pedido_id` int(11) NOT NULL,
  `pedido_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_presupuesto`
--

CREATE TABLE `detalle_presupuesto` (
  `detalle_id` int(11) NOT NULL,
  `presupuesto_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `pedido_id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`pedido_id`, `cliente_id`, `fecha`, `estado`) VALUES
(1, 1, '2024-10-01', 'Entregado'),
(2, 1, '2024-10-15', 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `presupuestos`
--

CREATE TABLE `presupuestos` (
  `presupuesto_id` int(11) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `fecha_creacion` date DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `forma_pago` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `producto_id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio_actual` decimal(10,2) NOT NULL,
  `marca` varchar(50) DEFAULT NULL,
  `modelo` varchar(50) DEFAULT NULL,
  `descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`producto_id`, `nombre`, `precio_actual`, `marca`, `modelo`, `descripcion`) VALUES
(1, 'Laptop X1', 1200.00, 'MarcaA', 'ModelX1', 'Laptop de alta gama con 16GB RAM'),
(2, 'Smartphone A5', 300.00, 'MarcaB', 'ModelA5', 'Smartphone con pantalla AMOLED');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variaciones_precio`
--

CREATE TABLE `variaciones_precio` (
  `variacion_id` int(11) NOT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `precio_anterior` decimal(10,2) DEFAULT NULL,
  `precio_nuevo` decimal(10,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `variaciones_precio`
--

INSERT INTO `variaciones_precio` (`variacion_id`, `producto_id`, `precio_anterior`, `precio_nuevo`, `fecha`) VALUES
(1, 1, 1100.00, 1200.00, '2024-01-01'),
(2, 2, 280.00, 300.00, '2024-01-02');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `catalogo`
--
ALTER TABLE `catalogo`
  ADD PRIMARY KEY (`catalogo_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cliente_id`);

--
-- Indices de la tabla `cuentas_corrientes`
--
ALTER TABLE `cuentas_corrientes`
  ADD PRIMARY KEY (`cuenta_id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`detalle_pedido_id`),
  ADD KEY `pedido_id` (`pedido_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `detalle_presupuesto`
--
ALTER TABLE `detalle_presupuesto`
  ADD PRIMARY KEY (`detalle_id`),
  ADD KEY `presupuesto_id` (`presupuesto_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`pedido_id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Indices de la tabla `presupuestos`
--
ALTER TABLE `presupuestos`
  ADD PRIMARY KEY (`presupuesto_id`),
  ADD KEY `cliente_id` (`cliente_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`producto_id`);

--
-- Indices de la tabla `variaciones_precio`
--
ALTER TABLE `variaciones_precio`
  ADD PRIMARY KEY (`variacion_id`),
  ADD KEY `producto_id` (`producto_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `catalogo`
--
ALTER TABLE `catalogo`
  MODIFY `catalogo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `cuentas_corrientes`
--
ALTER TABLE `cuentas_corrientes`
  MODIFY `cuenta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `detalle_pedido_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_presupuesto`
--
ALTER TABLE `detalle_presupuesto`
  MODIFY `detalle_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `pedido_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `presupuestos`
--
ALTER TABLE `presupuestos`
  MODIFY `presupuesto_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `producto_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `variaciones_precio`
--
ALTER TABLE `variaciones_precio`
  MODIFY `variacion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `catalogo`
--
ALTER TABLE `catalogo`
  ADD CONSTRAINT `catalogo_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`);

--
-- Filtros para la tabla `cuentas_corrientes`
--
ALTER TABLE `cuentas_corrientes`
  ADD CONSTRAINT `cuentas_corrientes_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`);

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`pedido_id`),
  ADD CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`);

--
-- Filtros para la tabla `detalle_presupuesto`
--
ALTER TABLE `detalle_presupuesto`
  ADD CONSTRAINT `detalle_presupuesto_ibfk_1` FOREIGN KEY (`presupuesto_id`) REFERENCES `presupuestos` (`presupuesto_id`),
  ADD CONSTRAINT `detalle_presupuesto_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`);

--
-- Filtros para la tabla `presupuestos`
--
ALTER TABLE `presupuestos`
  ADD CONSTRAINT `presupuestos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`cliente_id`);

--
-- Filtros para la tabla `variaciones_precio`
--
ALTER TABLE `variaciones_precio`
  ADD CONSTRAINT `variaciones_precio_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`producto_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
