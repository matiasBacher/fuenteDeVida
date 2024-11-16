-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 22-10-2024 a las 01:08:26
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fvpr2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajeros`
--

CREATE TABLE `cajeros` (
  `CUIT_CAJERO` int(11) NOT NULL,
  `NOMBRE_CAJERO` varchar(250) NOT NULL,
  `APELLIDO_CAJERO` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cajeros_ventas`
--

CREATE TABLE `cajeros_ventas` (
  `CUIT_CAJERO` int(11) NOT NULL,
  `ID_VENTA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `ID_CATEGORIA` int(11) NOT NULL,
  `NOMBRE_CATEGORIA` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`ID_CATEGORIA`, `NOMBRE_CATEGORIA`) VALUES
(28, 'cereales'),
(3, 'condimento '),
(36, 'educorante'),
(29, 'frutas secas'),
(1, 'ningun0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `CUIL_CLIENTE` int(11) NOT NULL,
  `ID_DOMICILIO` int(11) DEFAULT NULL,
  `NOMBRE_CLIENTE` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `correccionventas`
--
-- Error leyendo la estructura de la tabla fvpr2.correccionventas: #1932 - Table 'fvpr2.correccionventas' doesn't exist in engine
-- Error leyendo datos de la tabla fvpr2.correccionventas: #1064 - Algo está equivocado en su sintax cerca 'FROM `fvpr2`.`correccionventas`' en la linea 1

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalledecompras`
--

CREATE TABLE `detalledecompras` (
  `ID_PEDIDO` int(11) NOT NULL,
  `ID_PRODUCTO` int(11) NOT NULL,
  `CANTIDAD` int(11) NOT NULL,
  `PRECIOUNITARIO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalledeventas`
--

CREATE TABLE `detalledeventas` (
  `ID_VENTA` int(11) NOT NULL,
  `ID_LOTE` int(11) NOT NULL,
  `CANTIDAD_DETALLEVENTA` int(11) DEFAULT NULL,
  `precioFecha` int(10) UNSIGNED NOT NULL,
  `ID_DETALLe` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalledeventas`
--

INSERT INTO `detalledeventas` (`ID_VENTA`, `ID_LOTE`, `CANTIDAD_DETALLEVENTA`, `precioFecha`, `ID_DETALLe`) VALUES
(30, 2, 1, 9000, 11),
(32, 2, 5, 9000, 15),
(33, 1, 3, 500, 16),
(33, 2, 1, 9000, 17),
(34, 67, 6, 9001, 18),
(35, 1, 4, 1300, 19),
(35, 2, 1, 9000, 20),
(35, 3, 1, 8000, 21),
(35, 4, 1, 9000, 22),
(36, 4, 26, 9000, 23),
(37, 3, 4, 8000, 24),
(37, 2, 4, 9000, 25),
(37, 1, 3, 1300, 26),
(38, 4, 17, 9000, 27),
(39, 1, 1, 1300, 28),
(39, 2, 1, 9000, 29),
(40, 33335555, 7, 7000, 30),
(41, 33335555, 6, 7000, 31),
(42, 33335555, 5, 7000, 32),
(44, 2, 1, 9000, 33),
(46, 5, 2, 7000, 34),
(48, 1, 2, 1300, 35),
(50, 4, 2, 9000, 36),
(51, 2, 4, 9000, 37),
(52, 1, 3, 1300, 38),
(53, 3, 4, 8000, 39),
(54, 3, 3, 8000, 40),
(55, 3, 4, 8000, 41),
(56, 1, 1, 1300, 42),
(56, 2, 1, 9000, 43),
(57, 1, 1, 1300, 44),
(57, 2, 1, 9000, 45),
(58, 1, 4, 1300, 46),
(59, 1, 1, 1300, 47),
(59, 2, 1, 9000, 48),
(59, 3, 1, 8000, 49),
(60, 1, 1, 1300, 50),
(60, 2, 1, 9000, 51),
(60, 3, 1, 8000, 52),
(61, 1, 1, 1300, 53),
(61, 2, 1, 9000, 54),
(62, 1, 1, 1300, 55),
(63, 2, 1, 9000, 56),
(65, 2, 5, 9000, 58),
(66, 5, 4, 7000, 59),
(67, 1, 3, 1300, 60),
(67, 2, 1, 9000, 61),
(68, 67, 7, 9001, 62),
(69, 1, 4, 1300, 63),
(69, 2, 1, 9000, 64),
(69, 3, 1, 8000, 65),
(69, 4, 1, 9000, 66),
(70, 1, 4, 1300, 67),
(70, 2, 1, 9000, 68),
(70, 3, 1, 8000, 69),
(70, 4, 1, 9000, 70),
(71, 4, 26, 9000, 71),
(72, 3, 4, 8000, 72),
(72, 2, 4, 9000, 73),
(72, 1, 4, 1300, 74),
(73, 1, 1, 1300, 75),
(74, 2, 3, 9000, 76),
(75, 1, 1, 1300, 77),
(76, 1, 1, 1300, 78),
(77, 4, 18, 9000, 79),
(78, 1, 2, 1300, 80),
(78, 2, 1, 9000, 81),
(79, 1, 3, 1300, 82),
(79, 2, 3, 9000, 83),
(80, 34567890, 3, 3456, 84),
(80, 1, 1, 1300, 85),
(81, 34567890, 3, 3456, 86),
(81, 4, 1, 9000, 87),
(82, 1, 1, 1300, 88),
(82, 4, 1, 9000, 89);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallesdepago`
--

CREATE TABLE `detallesdepago` (
  `ID_PEDIDO` int(11) NOT NULL,
  `METODO_DETALLEDEPAGO` varchar(250) NOT NULL,
  `MONTO_DETALLEDEPAGO` int(11) NOT NULL,
  `FECHA_DETALLEDEPAGO` date NOT NULL,
  `ESTADODEACREDITACION_DETALLEDE` decimal(1,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `devoluciones`
--

CREATE TABLE `devoluciones` (
  `ID_DEVOLUCION` int(11) NOT NULL,
  `ID_VENTA` int(11) NOT NULL,
  `DINEROARESTITUIR_DEVOLUCION` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilios`
--

CREATE TABLE `domicilios` (
  `ID_DOMICILIO` int(11) NOT NULL,
  `ID_LOCALIDAD` int(11) NOT NULL,
  `DIRECCION_DOMICILIO` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadoinventariolote`
--

CREATE TABLE `estadoinventariolote` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadosdepagos`
--

CREATE TABLE `estadosdepagos` (
  `ID_PEDIDO` int(11) NOT NULL,
  `FECHA_ESTADODEPAGO` date NOT NULL,
  `PAGOFALTANTE_ESTADODEPAGO` int(11) NOT NULL,
  `ESTADO_ESTADODEPAGO` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadosenviopedidos`
--

CREATE TABLE `estadosenviopedidos` (
  `ID_PEDIDO` int(11) NOT NULL,
  `PRECIO_ESTADOENVIOPEDIDO` int(11) NOT NULL,
  `FECHA_ESTADOENVIOPEDIDO` date NOT NULL,
  `ESTADO_ESTADOENVIOPEDIDO` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadosrcepciones`
--

CREATE TABLE `estadosrcepciones` (
  `ID_PEDIDO` int(11) NOT NULL,
  `FECHA_ESTADORECEPCION` date NOT NULL,
  `ESTADO_ESTADORECEPCION` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadovencimiento`
--

CREATE TABLE `estadovencimiento` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estadovencimiento`
--

INSERT INTO `estadovencimiento` (`id`, `nombre`) VALUES
(1, 'vencimiento largo'),
(2, 'por vencer'),
(3, 'vencido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturacompras`
--

CREATE TABLE `facturacompras` (
  `ID_PEDIDO` int(11) NOT NULL,
  `NUMEROFACTURACOMPRAS` int(11) NOT NULL,
  `TIPO_FACTURACOMRPAS` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturasventas`
--

CREATE TABLE `facturasventas` (
  `NUMEROFACTURAVENTAS` int(11) NOT NULL,
  `ID_VENTA` int(11) NOT NULL,
  `CUIL_CLIENTE` int(11) NOT NULL,
  `TIPO_FACTURAVENTA` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listaprecios`
--

CREATE TABLE `listaprecios` (
  `ID_PRODUCTO` int(11) NOT NULL,
  `ID_PROVEEDOR` int(11) NOT NULL,
  `PRECIO_LISTAPRECIO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localidades`
--

CREATE TABLE `localidades` (
  `ID_LOCALIDAD` int(11) NOT NULL,
  `ID_PROVINCIA` int(11) NOT NULL,
  `NOMBRE_LOCALIDAD` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lotes`
--

CREATE TABLE `lotes` (
  `ID_LOTE` int(11) NOT NULL,
  `ID_PRODUCTO` int(11) NOT NULL,
  `ID_PROVEEDOR` int(11) DEFAULT NULL,
  `FECHAVENCIMEINTO_LOTE` date NOT NULL,
  `CANTIDAD_LOTE` int(11) NOT NULL,
  `fechaIngreso` date NOT NULL,
  `idEstadoInventario` int(11) NOT NULL DEFAULT 1,
  `idEstadoVencimiento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `lotes`
--

INSERT INTO `lotes` (`ID_LOTE`, `ID_PRODUCTO`, `ID_PROVEEDOR`, `FECHAVENCIMEINTO_LOTE`, `CANTIDAD_LOTE`, `fechaIngreso`, `idEstadoInventario`, `idEstadoVencimiento`) VALUES
(0, 1, 1, '2024-10-30', 1, '2024-10-17', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mediopago`
--

CREATE TABLE `mediopago` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mediopago`
--

INSERT INTO `mediopago` (`id`, `nombre`) VALUES
(1, 'efectivo'),
(2, 'transferencia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `ID_PEDIDO` int(11) NOT NULL,
  `EST_ID_PEDIDO` int(11) DEFAULT NULL,
  `EST2_ID_PEDIDO` int(11) DEFAULT NULL,
  `EST3_ID_PEDIDO` int(11) DEFAULT NULL,
  `FAC_ID_PEDIDO` int(11) DEFAULT NULL,
  `NUMEROFACTURACOMPRAS` int(11) DEFAULT NULL,
  `ID_PROVEEDOR` int(11) NOT NULL,
  `TOTALPRECIO_PEDIDO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ID_PRODUCTO` int(11) NOT NULL,
  `ID_CATEGORIA` int(11) DEFAULT NULL,
  `NOMBRE_PRODUCTO` varchar(250) DEFAULT NULL,
  `PRECIODEVENTA_PRODUCTO` int(11) DEFAULT NULL,
  `GANANCIA_PRODUCTO` int(11) DEFAULT NULL,
  `descripcion_producto` varchar(255) DEFAULT NULL,
  `FECHA_CREACION_PRODUCTO` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`ID_PRODUCTO`, `ID_CATEGORIA`, `NOMBRE_PRODUCTO`, `PRECIODEVENTA_PRODUCTO`, `GANANCIA_PRODUCTO`, `descripcion_producto`, `FECHA_CREACION_PRODUCTO`) VALUES
(1, 36, 'castanas', 1300, NULL, '0', '2024-09-28 00:30:27'),
(2, 29, 'banana seca', 9000, NULL, '0', '2024-07-30 23:14:10'),
(3, 29, 'nueces brasil', 8000, NULL, '0', '2024-07-30 19:33:05'),
(4, 29, 'mani', 9000, NULL, '0', '2024-07-30 19:34:59'),
(5, 28, 'alfagor maizena', 7000, NULL, '', '2024-09-28 00:38:07'),
(67, 3, 'romero', 9000, NULL, '', '2024-09-30 16:30:58'),
(3778876, 29, 'bananas disecadas', 5000, NULL, '', '2024-08-01 20:56:21'),
(33335555, 28, 'almendras', 7000, NULL, '', '2024-07-31 19:14:02'),
(34567890, 28, 'avena', 3456, NULL, '', '2024-09-30 16:30:08'),
(36789430, 29, 'Pistachos Tostados', 4567, NULL, '', '2024-07-31 19:17:36'),
(37081908, 28, 'avena', 900, NULL, '', '2024-07-31 18:09:42'),
(37087655, 3, 'sesamo', 4555, NULL, '', '2024-07-31 18:32:40'),
(37098760, 3, 'provensal', 900, NULL, '', '2024-07-31 18:10:42'),
(37643464, 29, 'Castaña De Cajú', 3000, NULL, '', '2024-07-31 19:21:23'),
(37888777, 29, 'mani japones', 3000, NULL, '', '2024-07-31 18:28:42'),
(37897521, 28, 'Mix De Cereales Con Pasas Y Manzana', 534, NULL, '', '2024-07-31 19:16:00'),
(37898765, 29, 'MixGarrapiñada De Maní', 37654, NULL, '', '2024-07-31 19:20:06'),
(37987654, 29, 'Castañas De Para', 7000, NULL, '', '2024-07-31 19:18:45'),
(44540000, 3, 'sal', 300, NULL, '', '2024-08-01 23:00:29'),
(44568954, 28, 'matias', 5, NULL, '', '2024-10-21 20:06:30'),
(45677778, 29, 'Almendras Tostadas Y Saladas', 7000, NULL, 'ttttt', '2024-07-31 19:15:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propiedades`
--

CREATE TABLE `propiedades` (
  `ID_PROPIEDADES` int(11) NOT NULL,
  `NOMBRE_PROPIEDADES` varchar(250) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `propiedades`
--

INSERT INTO `propiedades` (`ID_PROPIEDADES`, `NOMBRE_PROPIEDADES`, `descripcion`) VALUES
(1, 'sinTacc', 'sin tacc'),
(2, 'esDiuretico', 'diurectico'),
(3, 'sinSodio', 'sin sodio'),
(4, 'aptoDiabetico', 'apto diabetico'),
(5, 'esNatural', 'natural');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propiedades_productos`
--

CREATE TABLE `propiedades_productos` (
  `ID_PROPIEDADES` int(11) NOT NULL,
  `ID_PRODUCTO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `propiedades_productos`
--

INSERT INTO `propiedades_productos` (`ID_PROPIEDADES`, `ID_PRODUCTO`) VALUES
(1, 4),
(1, 37643464),
(1, 37898765),
(1, 37987654),
(3, 1),
(3, 5),
(3, 36789430),
(3, 44540000),
(4, 3),
(4, 67),
(4, 37081908),
(4, 45677778),
(5, 2),
(5, 67),
(5, 3778876),
(5, 33335555),
(5, 34567890),
(5, 37081908),
(5, 37087655),
(5, 37897521),
(5, 37987654),
(5, 45677778);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `ID_PROVEEDOR` int(11) NOT NULL,
  `ID_DOMICILIO` int(11) DEFAULT NULL,
  `CUIL_PROVEEDOR` int(11) DEFAULT NULL,
  `razonSocial` varchar(250) NOT NULL,
  `TEL_PROVEEDOR` int(11) DEFAULT NULL,
  `EMAIL_PROVEEDOR` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`ID_PROVEEDOR`, `ID_DOMICILIO`, `CUIL_PROVEEDOR`, `razonSocial`, `TEL_PROVEEDOR`, `EMAIL_PROVEEDOR`) VALUES
(1, NULL, NULL, 'propio', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE `provincias` (
  `ID_PROVINCIA` int(11) NOT NULL,
  `NOMBRE_PROVINCIA` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remplazados`
--

CREATE TABLE `remplazados` (
  `ID_DEVOLUCION` int(11) NOT NULL,
  `REM_ID_DEVOLUCION` int(11) DEFAULT NULL,
  `ID_LOTE` int(11) NOT NULL,
  `MOTIVO_REMPLAZADOS` varchar(250) DEFAULT NULL,
  `CANTIDAD_REMPLAZADO` int(11) NOT NULL,
  `PARADESCARTAR_REMPLAZADOS` decimal(1,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `ID_VENTA` int(11) NOT NULL,
  `NUMEROFACTURAVENTAS` int(11) DEFAULT NULL,
  `FECHA_VENTA` date NOT NULL DEFAULT current_timestamp(),
  `HORA_VENTA` time NOT NULL DEFAULT current_timestamp(),
  `METODODEPAGO_VENTA` int(11) DEFAULT 1,
  `ERROR_VENTA` tinyint(1) NOT NULL DEFAULT 0,
  `motivoCorreccion` varchar(250) DEFAULT NULL,
  `ventaAnterior` int(11) DEFAULT NULL,
  `total` int(10) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`ID_VENTA`, `NUMEROFACTURAVENTAS`, `FECHA_VENTA`, `HORA_VENTA`, `METODODEPAGO_VENTA`, `ERROR_VENTA`, `motivoCorreccion`, `ventaAnterior`, `total`) VALUES
(30, NULL, '2024-09-27', '00:09:38', 1, 1, NULL, NULL, 9000),
(32, NULL, '2024-09-27', '01:47:52', 1, 1, NULL, NULL, 9000),
(33, NULL, '2024-09-27', '01:53:51', 1, 1, NULL, NULL, 9500),
(34, NULL, '2024-09-28', '06:00:24', 1, 1, NULL, NULL, 9001),
(35, NULL, '2024-09-28', '06:07:36', 2, 1, NULL, NULL, 27300),
(36, NULL, '2024-09-28', '18:33:55', 2, 1, NULL, NULL, 9000),
(37, NULL, '2024-09-28', '19:29:21', 2, 1, NULL, NULL, 18300),
(38, NULL, '2024-09-28', '19:32:13', 1, 1, NULL, NULL, 9000),
(39, NULL, '2024-09-28', '19:39:20', 1, 1, NULL, NULL, 10300),
(40, NULL, '2024-09-28', '19:55:49', 1, 0, NULL, NULL, 7000),
(41, NULL, '2024-09-28', '19:56:30', 1, 0, NULL, NULL, 7000),
(42, NULL, '2024-09-28', '19:56:54', 1, 0, NULL, NULL, 7000),
(43, NULL, '2024-09-28', '20:00:38', 1, 1, NULL, NULL, 0),
(44, NULL, '2024-09-28', '20:05:18', 1, 0, NULL, NULL, 9000),
(45, NULL, '2024-09-28', '20:05:18', 1, 1, NULL, NULL, 0),
(46, NULL, '2024-09-28', '20:07:32', 1, 1, NULL, NULL, 7000),
(47, NULL, '2024-09-28', '20:07:33', 1, 1, NULL, NULL, 0),
(48, NULL, '2024-09-28', '20:11:21', 1, 0, NULL, NULL, 1300),
(49, NULL, '2024-09-28', '20:11:21', 1, 1, NULL, NULL, 0),
(50, NULL, '2024-09-28', '20:14:39', 1, 0, NULL, NULL, 9000),
(51, NULL, '2024-09-28', '20:16:20', 1, 0, NULL, NULL, 9000),
(52, NULL, '2024-09-28', '20:17:03', 1, 0, NULL, NULL, 1300),
(53, NULL, '2024-09-28', '20:19:31', 1, 0, NULL, NULL, 8000),
(54, NULL, '2024-09-28', '20:19:57', 1, 0, NULL, NULL, 8000),
(55, NULL, '2024-09-28', '20:22:17', 1, 0, NULL, NULL, 8000),
(56, NULL, '2024-09-28', '20:24:14', 1, 0, NULL, NULL, 10300),
(57, NULL, '2024-09-28', '20:26:59', 1, 0, NULL, NULL, 10300),
(58, NULL, '2024-09-28', '20:35:14', 1, 0, NULL, NULL, 1300),
(59, NULL, '2024-09-28', '20:38:41', 1, 0, NULL, NULL, 18300),
(60, NULL, '2024-09-28', '20:39:39', 1, 0, NULL, NULL, 18300),
(61, NULL, '2024-09-28', '20:42:01', 1, 0, NULL, NULL, 10300),
(62, NULL, '2024-09-28', '20:45:47', 1, 0, NULL, NULL, 1300),
(63, NULL, '2024-09-28', '22:10:23', 1, 0, 'aaaa', 30, 9000),
(65, NULL, '2024-09-28', '22:12:38', 1, 0, 'qqq', 32, 9000),
(66, NULL, '2024-09-28', '22:14:46', 1, 0, 'qqq', 46, 7000),
(67, NULL, '2024-09-28', '22:22:31', 1, 0, '2', 33, 10300),
(68, NULL, '2024-09-28', '22:24:21', 1, 0, '', 34, 9001),
(69, NULL, '2024-09-28', '22:27:26', 2, 0, 'q', 35, 27300),
(70, NULL, '2024-09-28', '22:29:28', 2, 0, 'q', 35, 27300),
(71, NULL, '2024-09-29', '00:34:05', 2, 0, '', 36, 9000),
(72, NULL, '2024-09-29', '00:40:44', 2, 0, 'modifique las nueces ', 37, 18300),
(73, NULL, '2024-09-29', '00:42:22', 1, 0, 'se agrego productos', 45, 1300),
(74, NULL, '2024-09-29', '00:45:47', 1, 0, 'agregar productos', 43, 9000),
(75, NULL, '2024-09-29', '00:47:02', 1, 0, 'agregar pro', 49, 1300),
(76, NULL, '2024-09-29', '00:48:14', 1, 0, '', 47, 1300),
(77, NULL, '2024-09-29', '00:51:07', 1, 0, 'prueba', 38, 9000),
(78, NULL, '2024-09-29', '00:51:52', 1, 0, '2', 39, 10300),
(79, NULL, '2024-09-30', '20:59:04', 1, 0, NULL, NULL, 10300),
(80, NULL, '2024-09-30', '21:33:50', 2, 1, NULL, NULL, 4756),
(81, NULL, '2024-09-30', '21:38:16', 2, 0, NULL, NULL, 12456),
(82, NULL, '2024-09-30', '21:40:34', 2, 0, 'no quiere avena', 80, 10300);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cajeros`
--
ALTER TABLE `cajeros`
  ADD PRIMARY KEY (`CUIT_CAJERO`),
  ADD UNIQUE KEY `CAJEROS_PK` (`CUIT_CAJERO`);

--
-- Indices de la tabla `cajeros_ventas`
--
ALTER TABLE `cajeros_ventas`
  ADD PRIMARY KEY (`CUIT_CAJERO`,`ID_VENTA`),
  ADD UNIQUE KEY `CAJEROS_VENTAS_PK` (`CUIT_CAJERO`,`ID_VENTA`),
  ADD KEY `CAJEROS_VENTAS_FK2` (`CUIT_CAJERO`),
  ADD KEY `CAJEROS_VENTAS_FK` (`ID_VENTA`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`ID_CATEGORIA`),
  ADD UNIQUE KEY `CATEGORIAS_PK` (`ID_CATEGORIA`),
  ADD UNIQUE KEY `nombre_unique` (`NOMBRE_CATEGORIA`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`CUIL_CLIENTE`),
  ADD UNIQUE KEY `CLIENTES_PK` (`CUIL_CLIENTE`),
  ADD KEY `RELATION_174_FK` (`ID_DOMICILIO`);

--
-- Indices de la tabla `detalledecompras`
--
ALTER TABLE `detalledecompras`
  ADD PRIMARY KEY (`ID_PEDIDO`),
  ADD UNIQUE KEY `DETALLEDECOMPRAS_PK` (`ID_PEDIDO`),
  ADD KEY `DETALLEDECOMPRAS_PRODUCTOS_FK` (`ID_PRODUCTO`);

--
-- Indices de la tabla `detalledeventas`
--
ALTER TABLE `detalledeventas`
  ADD KEY `ID_DETALLe` (`ID_DETALLe`),
  ADD KEY `ID_VENTA` (`ID_VENTA`);

--
-- Indices de la tabla `detallesdepago`
--
ALTER TABLE `detallesdepago`
  ADD PRIMARY KEY (`ID_PEDIDO`),
  ADD UNIQUE KEY `DETALLESDEPAGO_PK` (`ID_PEDIDO`);

--
-- Indices de la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD PRIMARY KEY (`ID_DEVOLUCION`),
  ADD UNIQUE KEY `DEVOLUCIONES_PK` (`ID_DEVOLUCION`),
  ADD KEY `VENTAS_DEVOLUCIONES_FK` (`ID_VENTA`);

--
-- Indices de la tabla `domicilios`
--
ALTER TABLE `domicilios`
  ADD PRIMARY KEY (`ID_DOMICILIO`),
  ADD UNIQUE KEY `DOMICILIOS_PK` (`ID_DOMICILIO`),
  ADD KEY `LOCALIDADES_DOMICILIOS_FK` (`ID_LOCALIDAD`);

--
-- Indices de la tabla `estadoinventariolote`
--
ALTER TABLE `estadoinventariolote`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `estadosdepagos`
--
ALTER TABLE `estadosdepagos`
  ADD PRIMARY KEY (`ID_PEDIDO`),
  ADD UNIQUE KEY `ESTADOSDEPAGOS_PK` (`ID_PEDIDO`);

--
-- Indices de la tabla `estadosenviopedidos`
--
ALTER TABLE `estadosenviopedidos`
  ADD PRIMARY KEY (`ID_PEDIDO`),
  ADD UNIQUE KEY `ESTADOSENVIOPEDIDOS_PK` (`ID_PEDIDO`);

--
-- Indices de la tabla `estadosrcepciones`
--
ALTER TABLE `estadosrcepciones`
  ADD PRIMARY KEY (`ID_PEDIDO`),
  ADD UNIQUE KEY `ESTADOSRCEPCIONES_PK` (`ID_PEDIDO`);

--
-- Indices de la tabla `estadovencimiento`
--
ALTER TABLE `estadovencimiento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `facturacompras`
--
ALTER TABLE `facturacompras`
  ADD PRIMARY KEY (`ID_PEDIDO`,`NUMEROFACTURACOMPRAS`),
  ADD UNIQUE KEY `FACTURACOMPRAS_PK` (`ID_PEDIDO`,`NUMEROFACTURACOMPRAS`),
  ADD KEY `FACTURACOMPRAS_PEDIDOS_FK` (`ID_PEDIDO`);

--
-- Indices de la tabla `facturasventas`
--
ALTER TABLE `facturasventas`
  ADD PRIMARY KEY (`NUMEROFACTURAVENTAS`),
  ADD UNIQUE KEY `FACTURASVENTAS_PK` (`NUMEROFACTURAVENTAS`),
  ADD KEY `VENTAS_FACTURAVENTAS_FK` (`ID_VENTA`),
  ADD KEY `FACTURADEVENTAS_CLIENTES_FK` (`CUIL_CLIENTE`);

--
-- Indices de la tabla `listaprecios`
--
ALTER TABLE `listaprecios`
  ADD PRIMARY KEY (`ID_PRODUCTO`,`ID_PROVEEDOR`),
  ADD UNIQUE KEY `LISTAPRECIOS_PK` (`ID_PRODUCTO`,`ID_PROVEEDOR`),
  ADD KEY `LISTAPRECIOS_PROVEEDORES_FK` (`ID_PROVEEDOR`),
  ADD KEY `LISTAPRECIOS_PRODUCTOES_FK` (`ID_PRODUCTO`);

--
-- Indices de la tabla `localidades`
--
ALTER TABLE `localidades`
  ADD PRIMARY KEY (`ID_LOCALIDAD`),
  ADD UNIQUE KEY `LOCALIDADES_PK` (`ID_LOCALIDAD`),
  ADD KEY `PROVINCIAS_LOCALIDADES_FK` (`ID_PROVINCIA`);

--
-- Indices de la tabla `lotes`
--
ALTER TABLE `lotes`
  ADD PRIMARY KEY (`ID_LOTE`),
  ADD UNIQUE KEY `LOTES_PK` (`ID_LOTE`),
  ADD KEY `RELATION_193_FK` (`ID_PRODUCTO`),
  ADD KEY `LOTES_PROVEEDORES_FK` (`ID_PROVEEDOR`);

--
-- Indices de la tabla `mediopago`
--
ALTER TABLE `mediopago`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`ID_PEDIDO`),
  ADD UNIQUE KEY `PEDIDOS_PK` (`ID_PEDIDO`),
  ADD KEY `PEDIDOS_ESTADOENVIOPEDIDOS_FK` (`EST_ID_PEDIDO`),
  ADD KEY `PEDIDOS_ESTADORECEPCIONES_FK` (`EST2_ID_PEDIDO`),
  ADD KEY `PEDIDOS_ESTADOSDEPAGOS_FK` (`EST3_ID_PEDIDO`),
  ADD KEY `FACTURACOMPRAS_PEDIDOS_FK2` (`FAC_ID_PEDIDO`,`NUMEROFACTURACOMPRAS`),
  ADD KEY `PROVEEDORES_PEDIDOS_FK` (`ID_PROVEEDOR`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ID_PRODUCTO`),
  ADD UNIQUE KEY `PRODUCTOS_PK` (`ID_PRODUCTO`),
  ADD UNIQUE KEY `ID_PRODUCTO` (`ID_PRODUCTO`),
  ADD KEY `CATEGORIAS_PRODUCTOS_FK` (`ID_CATEGORIA`);

--
-- Indices de la tabla `propiedades`
--
ALTER TABLE `propiedades`
  ADD PRIMARY KEY (`ID_PROPIEDADES`),
  ADD UNIQUE KEY `PROPIEDADES_PK` (`ID_PROPIEDADES`);

--
-- Indices de la tabla `propiedades_productos`
--
ALTER TABLE `propiedades_productos`
  ADD PRIMARY KEY (`ID_PROPIEDADES`,`ID_PRODUCTO`),
  ADD UNIQUE KEY `PROPIEDADES_PRODUCTOS_PK` (`ID_PROPIEDADES`,`ID_PRODUCTO`),
  ADD KEY `PROPIEDADES_PRODUCTOS_FK2` (`ID_PROPIEDADES`),
  ADD KEY `PROPIEDADES_PRODUCTOS_FK` (`ID_PRODUCTO`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`ID_PROVEEDOR`),
  ADD UNIQUE KEY `PROVEEDORES_PK` (`ID_PROVEEDOR`),
  ADD KEY `PROVEEDOR_DOMICILIOS_FK` (`ID_DOMICILIO`);

--
-- Indices de la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`ID_PROVINCIA`),
  ADD UNIQUE KEY `PROVINCIAS_PK` (`ID_PROVINCIA`);

--
-- Indices de la tabla `remplazados`
--
ALTER TABLE `remplazados`
  ADD PRIMARY KEY (`ID_DEVOLUCION`),
  ADD UNIQUE KEY `REMPLAZADOS_PK` (`ID_DEVOLUCION`),
  ADD KEY `LOTES_REMPLAZADOS_FK` (`ID_LOTE`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`ID_VENTA`),
  ADD KEY `VENTAS_FACTURAVENTAS_FK2` (`NUMEROFACTURAVENTAS`),
  ADD KEY `ventaAnterior` (`ventaAnterior`),
  ADD KEY `METODODEPAGO_VENTA` (`METODODEPAGO_VENTA`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `ID_CATEGORIA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de la tabla `detalledeventas`
--
ALTER TABLE `detalledeventas`
  MODIFY `ID_DETALLe` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT de la tabla `estadoinventariolote`
--
ALTER TABLE `estadoinventariolote`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT de la tabla `estadovencimiento`
--
ALTER TABLE `estadovencimiento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `mediopago`
--
ALTER TABLE `mediopago`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `propiedades`
--
ALTER TABLE `propiedades`
  MODIFY `ID_PROPIEDADES` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `ID_PROVEEDOR` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `ID_VENTA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cajeros_ventas`
--
ALTER TABLE `cajeros_ventas`
  ADD CONSTRAINT `cajeros_ventas_ibfk_1` FOREIGN KEY (`CUIT_CAJERO`) REFERENCES `cajeros` (`CUIT_CAJERO`);

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`ID_DOMICILIO`) REFERENCES `domicilios` (`ID_DOMICILIO`);

--
-- Filtros para la tabla `detalledecompras`
--
ALTER TABLE `detalledecompras`
  ADD CONSTRAINT `detalledecompras_ibfk_1` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `productos` (`ID_PRODUCTO`),
  ADD CONSTRAINT `detalledecompras_ibfk_2` FOREIGN KEY (`ID_PEDIDO`) REFERENCES `pedidos` (`ID_PEDIDO`);

--
-- Filtros para la tabla `detalledeventas`
--
ALTER TABLE `detalledeventas`
  ADD CONSTRAINT `detalledeventas_ibfk_1` FOREIGN KEY (`ID_VENTA`) REFERENCES `ventas` (`ID_VENTA`) ON DELETE CASCADE;

--
-- Filtros para la tabla `detallesdepago`
--
ALTER TABLE `detallesdepago`
  ADD CONSTRAINT `detallesdepago_ibfk_1` FOREIGN KEY (`ID_PEDIDO`) REFERENCES `estadosdepagos` (`ID_PEDIDO`);

--
-- Filtros para la tabla `domicilios`
--
ALTER TABLE `domicilios`
  ADD CONSTRAINT `domicilios_ibfk_1` FOREIGN KEY (`ID_LOCALIDAD`) REFERENCES `localidades` (`ID_LOCALIDAD`);

--
-- Filtros para la tabla `estadosdepagos`
--
ALTER TABLE `estadosdepagos`
  ADD CONSTRAINT `estadosdepagos_ibfk_1` FOREIGN KEY (`ID_PEDIDO`) REFERENCES `pedidos` (`ID_PEDIDO`);

--
-- Filtros para la tabla `estadosenviopedidos`
--
ALTER TABLE `estadosenviopedidos`
  ADD CONSTRAINT `estadosenviopedidos_ibfk_1` FOREIGN KEY (`ID_PEDIDO`) REFERENCES `pedidos` (`ID_PEDIDO`);

--
-- Filtros para la tabla `estadosrcepciones`
--
ALTER TABLE `estadosrcepciones`
  ADD CONSTRAINT `estadosrcepciones_ibfk_1` FOREIGN KEY (`ID_PEDIDO`) REFERENCES `pedidos` (`ID_PEDIDO`);

--
-- Filtros para la tabla `facturacompras`
--
ALTER TABLE `facturacompras`
  ADD CONSTRAINT `facturacompras_ibfk_1` FOREIGN KEY (`ID_PEDIDO`) REFERENCES `pedidos` (`ID_PEDIDO`);

--
-- Filtros para la tabla `facturasventas`
--
ALTER TABLE `facturasventas`
  ADD CONSTRAINT `facturasventas_ibfk_2` FOREIGN KEY (`CUIL_CLIENTE`) REFERENCES `clientes` (`CUIL_CLIENTE`);

--
-- Filtros para la tabla `listaprecios`
--
ALTER TABLE `listaprecios`
  ADD CONSTRAINT `listaprecios_ibfk_1` FOREIGN KEY (`ID_PROVEEDOR`) REFERENCES `proveedores` (`ID_PROVEEDOR`),
  ADD CONSTRAINT `listaprecios_ibfk_2` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `productos` (`ID_PRODUCTO`);

--
-- Filtros para la tabla `localidades`
--
ALTER TABLE `localidades`
  ADD CONSTRAINT `localidades_ibfk_1` FOREIGN KEY (`ID_PROVINCIA`) REFERENCES `provincias` (`ID_PROVINCIA`);

--
-- Filtros para la tabla `lotes`
--
ALTER TABLE `lotes`
  ADD CONSTRAINT `lotes_ibfk_1` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `productos` (`ID_PRODUCTO`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`EST_ID_PEDIDO`) REFERENCES `estadosenviopedidos` (`ID_PEDIDO`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`EST2_ID_PEDIDO`) REFERENCES `estadosrcepciones` (`ID_PEDIDO`),
  ADD CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`EST3_ID_PEDIDO`) REFERENCES `estadosdepagos` (`ID_PEDIDO`),
  ADD CONSTRAINT `pedidos_ibfk_4` FOREIGN KEY (`FAC_ID_PEDIDO`,`NUMEROFACTURACOMPRAS`) REFERENCES `facturacompras` (`ID_PEDIDO`, `NUMEROFACTURACOMPRAS`),
  ADD CONSTRAINT `pedidos_ibfk_5` FOREIGN KEY (`ID_PROVEEDOR`) REFERENCES `proveedores` (`ID_PROVEEDOR`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`ID_CATEGORIA`) REFERENCES `categorias` (`ID_CATEGORIA`);

--
-- Filtros para la tabla `propiedades_productos`
--
ALTER TABLE `propiedades_productos`
  ADD CONSTRAINT `propiedades_productos_ibfk_1` FOREIGN KEY (`ID_PROPIEDADES`) REFERENCES `propiedades` (`ID_PROPIEDADES`),
  ADD CONSTRAINT `propiedades_productos_ibfk_2` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `productos` (`ID_PRODUCTO`);

--
-- Filtros para la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`ID_DOMICILIO`) REFERENCES `domicilios` (`ID_DOMICILIO`);

--
-- Filtros para la tabla `remplazados`
--
ALTER TABLE `remplazados`
  ADD CONSTRAINT `remplazados_ibfk_1` FOREIGN KEY (`ID_DEVOLUCION`) REFERENCES `devoluciones` (`ID_DEVOLUCION`),
  ADD CONSTRAINT `remplazados_ibfk_2` FOREIGN KEY (`ID_LOTE`) REFERENCES `lotes` (`ID_LOTE`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventaAnterior` FOREIGN KEY (`ventaAnterior`) REFERENCES `ventas` (`ID_VENTA`),
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`NUMEROFACTURAVENTAS`) REFERENCES `facturasventas` (`NUMEROFACTURAVENTAS`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`METODODEPAGO_VENTA`) REFERENCES `mediopago` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
