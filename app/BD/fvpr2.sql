-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-06-2024 a las 00:25:34
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 7.4.29

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
(0, 'frutas secas'),
(1, 'condimentos ');

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

CREATE TABLE `correccionventas` (
  `VEN_ID_VENTA` int(11) NOT NULL,
  `ID_VENTA` int(11) NOT NULL,
  `MOTIVO_CORRECIONVENTA` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `CANTIDAD_DETALLEVENTA` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `CANTIDAD_LOTE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `GANANCIA_PRODUCTO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`ID_PRODUCTO`, `ID_CATEGORIA`, `NOMBRE_PRODUCTO`, `PRECIODEVENTA_PRODUCTO`, `GANANCIA_PRODUCTO`) VALUES
(1, 0, 'mani 100gr', 125, NULL),
(2, 1, 'oregano 100gr', NULL, NULL),
(3, 0, 'avellana 100gr', 600, NULL),
(4, 1, 'sesamo 200gr', 500, NULL),
(5, 1, 'curry ', 3000, NULL),
(6, 0, 'nueces 100gr', 400, NULL),
(7, 0, 'bellotas 100gr', 250, NULL),
(8, 1, 'sal del himalaya', 300, NULL),
(9, 1, 'provenzal', 900, NULL),
(10, 0, 'nuez brasil 100gr', 500, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `propiedades`
--

CREATE TABLE `propiedades` (
  `ID_PROPIEDADES` int(11) NOT NULL,
  `NOMBRE_PROPIEDADES` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `propiedades`
--

INSERT INTO `propiedades` (`ID_PROPIEDADES`, `NOMBRE_PROPIEDADES`) VALUES
(1, 'sinTacc'),
(2, 'esDiuretico'),
(3, 'sinSodio'),
(4, 'aptoDiabetico'),
(5, 'esNatural');

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
(1, 6),
(1, 7),
(3, 8),
(4, 4),
(4, 6),
(5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `ID_PROVEEDOR` int(11) NOT NULL,
  `ID_DOMICILIO` int(11) DEFAULT NULL,
  `CUIL_PROVEEDOR` int(11) DEFAULT NULL,
  `NOMBRE_PROVEEDOR` varchar(250) NOT NULL,
  `APELIIDO_PROVEEDOR` varchar(250) NOT NULL,
  `TEL_PROVEEDOR` int(11) NOT NULL,
  `EMAIL_PROVEEDOR` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `VEN_ID_VENTA` int(11) DEFAULT NULL,
  `COR_ID_VENTA` int(11) DEFAULT NULL,
  `COR_VEN_ID_VENTA` int(11) DEFAULT NULL,
  `COR2_ID_VENTA` int(11) DEFAULT NULL,
  `FECHA_VENTA` date NOT NULL,
  `HORA_VENTA` time NOT NULL,
  `METODODEPAGO_VENTA` varchar(250) NOT NULL,
  `ERROR_VENTA` decimal(1,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  ADD UNIQUE KEY `CATEGORIAS_PK` (`ID_CATEGORIA`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`CUIL_CLIENTE`),
  ADD UNIQUE KEY `CLIENTES_PK` (`CUIL_CLIENTE`),
  ADD KEY `RELATION_174_FK` (`ID_DOMICILIO`);

--
-- Indices de la tabla `correccionventas`
--
ALTER TABLE `correccionventas`
  ADD PRIMARY KEY (`VEN_ID_VENTA`,`ID_VENTA`),
  ADD UNIQUE KEY `CORRECCIONVENTAS_PK` (`VEN_ID_VENTA`,`ID_VENTA`),
  ADD KEY `CORRECIONDEVENTA_FK` (`ID_VENTA`),
  ADD KEY `VENTACORREGIDA_FK` (`VEN_ID_VENTA`);

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
  ADD PRIMARY KEY (`ID_VENTA`),
  ADD UNIQUE KEY `DETALLEDEVENTAS_PK` (`ID_VENTA`),
  ADD KEY `LOTES_DETALLEDEVENTAS_FK` (`ID_LOTE`);

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
  ADD UNIQUE KEY `VENTAS_PK` (`ID_VENTA`),
  ADD KEY `VENTAS_FACTURAVENTAS_FK2` (`NUMEROFACTURAVENTAS`),
  ADD KEY `CORRECIONDEVENTA_FK2` (`VEN_ID_VENTA`,`COR_ID_VENTA`),
  ADD KEY `VENTACORREGIDA_FK2` (`COR_VEN_ID_VENTA`,`COR2_ID_VENTA`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `propiedades`
--
ALTER TABLE `propiedades`
  MODIFY `ID_PROPIEDADES` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cajeros_ventas`
--
ALTER TABLE `cajeros_ventas`
  ADD CONSTRAINT `cajeros_ventas_ibfk_1` FOREIGN KEY (`CUIT_CAJERO`) REFERENCES `cajeros` (`CUIT_CAJERO`),
  ADD CONSTRAINT `cajeros_ventas_ibfk_2` FOREIGN KEY (`ID_VENTA`) REFERENCES `ventas` (`ID_VENTA`);

--
-- Filtros para la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`ID_DOMICILIO`) REFERENCES `domicilios` (`ID_DOMICILIO`);

--
-- Filtros para la tabla `correccionventas`
--
ALTER TABLE `correccionventas`
  ADD CONSTRAINT `correccionventas_ibfk_1` FOREIGN KEY (`ID_VENTA`) REFERENCES `ventas` (`ID_VENTA`),
  ADD CONSTRAINT `correccionventas_ibfk_2` FOREIGN KEY (`VEN_ID_VENTA`) REFERENCES `ventas` (`ID_VENTA`);

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
  ADD CONSTRAINT `detalledeventas_ibfk_1` FOREIGN KEY (`ID_VENTA`) REFERENCES `ventas` (`ID_VENTA`),
  ADD CONSTRAINT `detalledeventas_ibfk_2` FOREIGN KEY (`ID_LOTE`) REFERENCES `lotes` (`ID_LOTE`);

--
-- Filtros para la tabla `detallesdepago`
--
ALTER TABLE `detallesdepago`
  ADD CONSTRAINT `detallesdepago_ibfk_1` FOREIGN KEY (`ID_PEDIDO`) REFERENCES `estadosdepagos` (`ID_PEDIDO`);

--
-- Filtros para la tabla `devoluciones`
--
ALTER TABLE `devoluciones`
  ADD CONSTRAINT `devoluciones_ibfk_1` FOREIGN KEY (`ID_VENTA`) REFERENCES `ventas` (`ID_VENTA`);

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
  ADD CONSTRAINT `facturasventas_ibfk_1` FOREIGN KEY (`ID_VENTA`) REFERENCES `ventas` (`ID_VENTA`),
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
  ADD CONSTRAINT `lotes_ibfk_1` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `productos` (`ID_PRODUCTO`),
  ADD CONSTRAINT `lotes_ibfk_2` FOREIGN KEY (`ID_PROVEEDOR`) REFERENCES `proveedores` (`ID_PROVEEDOR`);

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
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`NUMEROFACTURAVENTAS`) REFERENCES `facturasventas` (`NUMEROFACTURAVENTAS`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`VEN_ID_VENTA`,`COR_ID_VENTA`) REFERENCES `correccionventas` (`VEN_ID_VENTA`, `ID_VENTA`),
  ADD CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`COR_VEN_ID_VENTA`,`COR2_ID_VENTA`) REFERENCES `correccionventas` (`VEN_ID_VENTA`, `ID_VENTA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
