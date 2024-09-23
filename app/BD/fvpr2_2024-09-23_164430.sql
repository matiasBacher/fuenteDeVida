-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: fvpr2
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cajeros`
--

DROP TABLE IF EXISTS `cajeros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cajeros` (
  `CUIT_CAJERO` int(11) NOT NULL,
  `NOMBRE_CAJERO` varchar(250) NOT NULL,
  `APELLIDO_CAJERO` varchar(250) NOT NULL,
  PRIMARY KEY (`CUIT_CAJERO`),
  UNIQUE KEY `CAJEROS_PK` (`CUIT_CAJERO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cajeros`
--

/*!40000 ALTER TABLE `cajeros` DISABLE KEYS */;
/*!40000 ALTER TABLE `cajeros` ENABLE KEYS */;

--
-- Table structure for table `cajeros_ventas`
--

DROP TABLE IF EXISTS `cajeros_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cajeros_ventas` (
  `CUIT_CAJERO` int(11) NOT NULL,
  `ID_VENTA` int(11) NOT NULL,
  PRIMARY KEY (`CUIT_CAJERO`,`ID_VENTA`),
  UNIQUE KEY `CAJEROS_VENTAS_PK` (`CUIT_CAJERO`,`ID_VENTA`),
  KEY `CAJEROS_VENTAS_FK2` (`CUIT_CAJERO`),
  KEY `CAJEROS_VENTAS_FK` (`ID_VENTA`),
  CONSTRAINT `cajeros_ventas_ibfk_1` FOREIGN KEY (`CUIT_CAJERO`) REFERENCES `cajeros` (`CUIT_CAJERO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cajeros_ventas`
--

/*!40000 ALTER TABLE `cajeros_ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `cajeros_ventas` ENABLE KEYS */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `ID_CATEGORIA` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_CATEGORIA` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID_CATEGORIA`),
  UNIQUE KEY `CATEGORIAS_PK` (`ID_CATEGORIA`),
  UNIQUE KEY `nombre_unique` (`NOMBRE_CATEGORIA`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (28,'cereales'),(3,'condimento '),(36,'educorante'),(29,'frutas secas'),(1,'ningun0');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clientes` (
  `CUIL_CLIENTE` int(11) NOT NULL,
  `ID_DOMICILIO` int(11) DEFAULT NULL,
  `NOMBRE_CLIENTE` varchar(250) NOT NULL,
  PRIMARY KEY (`CUIL_CLIENTE`),
  UNIQUE KEY `CLIENTES_PK` (`CUIL_CLIENTE`),
  KEY `RELATION_174_FK` (`ID_DOMICILIO`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`ID_DOMICILIO`) REFERENCES `domicilios` (`ID_DOMICILIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;

--
-- Table structure for table `detalledecompras`
--

DROP TABLE IF EXISTS `detalledecompras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalledecompras` (
  `ID_PEDIDO` int(11) NOT NULL,
  `ID_PRODUCTO` int(11) NOT NULL,
  `CANTIDAD` int(11) NOT NULL,
  `PRECIOUNITARIO` int(11) NOT NULL,
  PRIMARY KEY (`ID_PEDIDO`),
  UNIQUE KEY `DETALLEDECOMPRAS_PK` (`ID_PEDIDO`),
  KEY `DETALLEDECOMPRAS_PRODUCTOS_FK` (`ID_PRODUCTO`),
  CONSTRAINT `detalledecompras_ibfk_1` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `productos` (`ID_PRODUCTO`),
  CONSTRAINT `detalledecompras_ibfk_2` FOREIGN KEY (`ID_PEDIDO`) REFERENCES `pedidos` (`ID_PEDIDO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalledecompras`
--

/*!40000 ALTER TABLE `detalledecompras` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalledecompras` ENABLE KEYS */;

--
-- Table structure for table `detalledeventas`
--

DROP TABLE IF EXISTS `detalledeventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalledeventas` (
  `ID_VENTA` int(11) NOT NULL,
  `ID_LOTE` int(11) NOT NULL,
  `CANTIDAD_DETALLEVENTA` int(11) DEFAULT NULL,
  `precioFecha` int(10) unsigned NOT NULL,
  `ID_DETALLe` int(10) unsigned NOT NULL,
  UNIQUE KEY `DETALLEDEVENTAS_PK` (`ID_VENTA`),
  KEY `LOTES_DETALLEDEVENTAS_FK` (`ID_LOTE`),
  KEY `ID_DETALLe` (`ID_DETALLe`),
  CONSTRAINT `detalledeventas_ibfk_2` FOREIGN KEY (`ID_LOTE`) REFERENCES `productos` (`ID_PRODUCTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalledeventas`
--

/*!40000 ALTER TABLE `detalledeventas` DISABLE KEYS */;
INSERT INTO `detalledeventas` VALUES (15,1,5,500,0),(16,3,2,8000,0);
/*!40000 ALTER TABLE `detalledeventas` ENABLE KEYS */;

--
-- Table structure for table `detallesdepago`
--

DROP TABLE IF EXISTS `detallesdepago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detallesdepago` (
  `ID_PEDIDO` int(11) NOT NULL,
  `METODO_DETALLEDEPAGO` varchar(250) NOT NULL,
  `MONTO_DETALLEDEPAGO` int(11) NOT NULL,
  `FECHA_DETALLEDEPAGO` date NOT NULL,
  `ESTADODEACREDITACION_DETALLEDE` decimal(1,0) DEFAULT NULL,
  PRIMARY KEY (`ID_PEDIDO`),
  UNIQUE KEY `DETALLESDEPAGO_PK` (`ID_PEDIDO`),
  CONSTRAINT `detallesdepago_ibfk_1` FOREIGN KEY (`ID_PEDIDO`) REFERENCES `estadosdepagos` (`ID_PEDIDO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallesdepago`
--

/*!40000 ALTER TABLE `detallesdepago` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallesdepago` ENABLE KEYS */;

--
-- Table structure for table `devoluciones`
--

DROP TABLE IF EXISTS `devoluciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devoluciones` (
  `ID_DEVOLUCION` int(11) NOT NULL,
  `ID_VENTA` int(11) NOT NULL,
  `DINEROARESTITUIR_DEVOLUCION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_DEVOLUCION`),
  UNIQUE KEY `DEVOLUCIONES_PK` (`ID_DEVOLUCION`),
  KEY `VENTAS_DEVOLUCIONES_FK` (`ID_VENTA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devoluciones`
--

/*!40000 ALTER TABLE `devoluciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `devoluciones` ENABLE KEYS */;

--
-- Table structure for table `domicilios`
--

DROP TABLE IF EXISTS `domicilios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domicilios` (
  `ID_DOMICILIO` int(11) NOT NULL,
  `ID_LOCALIDAD` int(11) NOT NULL,
  `DIRECCION_DOMICILIO` varchar(250) NOT NULL,
  PRIMARY KEY (`ID_DOMICILIO`),
  UNIQUE KEY `DOMICILIOS_PK` (`ID_DOMICILIO`),
  KEY `LOCALIDADES_DOMICILIOS_FK` (`ID_LOCALIDAD`),
  CONSTRAINT `domicilios_ibfk_1` FOREIGN KEY (`ID_LOCALIDAD`) REFERENCES `localidades` (`ID_LOCALIDAD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domicilios`
--

/*!40000 ALTER TABLE `domicilios` DISABLE KEYS */;
/*!40000 ALTER TABLE `domicilios` ENABLE KEYS */;

--
-- Table structure for table `estadosdepagos`
--

DROP TABLE IF EXISTS `estadosdepagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadosdepagos` (
  `ID_PEDIDO` int(11) NOT NULL,
  `FECHA_ESTADODEPAGO` date NOT NULL,
  `PAGOFALTANTE_ESTADODEPAGO` int(11) NOT NULL,
  `ESTADO_ESTADODEPAGO` varchar(250) NOT NULL,
  PRIMARY KEY (`ID_PEDIDO`),
  UNIQUE KEY `ESTADOSDEPAGOS_PK` (`ID_PEDIDO`),
  CONSTRAINT `estadosdepagos_ibfk_1` FOREIGN KEY (`ID_PEDIDO`) REFERENCES `pedidos` (`ID_PEDIDO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadosdepagos`
--

/*!40000 ALTER TABLE `estadosdepagos` DISABLE KEYS */;
/*!40000 ALTER TABLE `estadosdepagos` ENABLE KEYS */;

--
-- Table structure for table `estadosenviopedidos`
--

DROP TABLE IF EXISTS `estadosenviopedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadosenviopedidos` (
  `ID_PEDIDO` int(11) NOT NULL,
  `PRECIO_ESTADOENVIOPEDIDO` int(11) NOT NULL,
  `FECHA_ESTADOENVIOPEDIDO` date NOT NULL,
  `ESTADO_ESTADOENVIOPEDIDO` varchar(250) NOT NULL,
  PRIMARY KEY (`ID_PEDIDO`),
  UNIQUE KEY `ESTADOSENVIOPEDIDOS_PK` (`ID_PEDIDO`),
  CONSTRAINT `estadosenviopedidos_ibfk_1` FOREIGN KEY (`ID_PEDIDO`) REFERENCES `pedidos` (`ID_PEDIDO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadosenviopedidos`
--

/*!40000 ALTER TABLE `estadosenviopedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `estadosenviopedidos` ENABLE KEYS */;

--
-- Table structure for table `estadosrcepciones`
--

DROP TABLE IF EXISTS `estadosrcepciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estadosrcepciones` (
  `ID_PEDIDO` int(11) NOT NULL,
  `FECHA_ESTADORECEPCION` date NOT NULL,
  `ESTADO_ESTADORECEPCION` varchar(250) NOT NULL,
  PRIMARY KEY (`ID_PEDIDO`),
  UNIQUE KEY `ESTADOSRCEPCIONES_PK` (`ID_PEDIDO`),
  CONSTRAINT `estadosrcepciones_ibfk_1` FOREIGN KEY (`ID_PEDIDO`) REFERENCES `pedidos` (`ID_PEDIDO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadosrcepciones`
--

/*!40000 ALTER TABLE `estadosrcepciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `estadosrcepciones` ENABLE KEYS */;

--
-- Table structure for table `facturacompras`
--

DROP TABLE IF EXISTS `facturacompras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facturacompras` (
  `ID_PEDIDO` int(11) NOT NULL,
  `NUMEROFACTURACOMPRAS` int(11) NOT NULL,
  `TIPO_FACTURACOMRPAS` varchar(10) NOT NULL,
  PRIMARY KEY (`ID_PEDIDO`,`NUMEROFACTURACOMPRAS`),
  UNIQUE KEY `FACTURACOMPRAS_PK` (`ID_PEDIDO`,`NUMEROFACTURACOMPRAS`),
  KEY `FACTURACOMPRAS_PEDIDOS_FK` (`ID_PEDIDO`),
  CONSTRAINT `facturacompras_ibfk_1` FOREIGN KEY (`ID_PEDIDO`) REFERENCES `pedidos` (`ID_PEDIDO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturacompras`
--

/*!40000 ALTER TABLE `facturacompras` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturacompras` ENABLE KEYS */;

--
-- Table structure for table `facturasventas`
--

DROP TABLE IF EXISTS `facturasventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facturasventas` (
  `NUMEROFACTURAVENTAS` int(11) NOT NULL,
  `ID_VENTA` int(11) NOT NULL,
  `CUIL_CLIENTE` int(11) NOT NULL,
  `TIPO_FACTURAVENTA` varchar(250) NOT NULL,
  PRIMARY KEY (`NUMEROFACTURAVENTAS`),
  UNIQUE KEY `FACTURASVENTAS_PK` (`NUMEROFACTURAVENTAS`),
  KEY `VENTAS_FACTURAVENTAS_FK` (`ID_VENTA`),
  KEY `FACTURADEVENTAS_CLIENTES_FK` (`CUIL_CLIENTE`),
  CONSTRAINT `facturasventas_ibfk_2` FOREIGN KEY (`CUIL_CLIENTE`) REFERENCES `clientes` (`CUIL_CLIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturasventas`
--

/*!40000 ALTER TABLE `facturasventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturasventas` ENABLE KEYS */;

--
-- Table structure for table `listaprecios`
--

DROP TABLE IF EXISTS `listaprecios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listaprecios` (
  `ID_PRODUCTO` int(11) NOT NULL,
  `ID_PROVEEDOR` int(11) NOT NULL,
  `PRECIO_LISTAPRECIO` int(11) NOT NULL,
  PRIMARY KEY (`ID_PRODUCTO`,`ID_PROVEEDOR`),
  UNIQUE KEY `LISTAPRECIOS_PK` (`ID_PRODUCTO`,`ID_PROVEEDOR`),
  KEY `LISTAPRECIOS_PROVEEDORES_FK` (`ID_PROVEEDOR`),
  KEY `LISTAPRECIOS_PRODUCTOES_FK` (`ID_PRODUCTO`),
  CONSTRAINT `listaprecios_ibfk_1` FOREIGN KEY (`ID_PROVEEDOR`) REFERENCES `proveedores` (`ID_PROVEEDOR`),
  CONSTRAINT `listaprecios_ibfk_2` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `productos` (`ID_PRODUCTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listaprecios`
--

/*!40000 ALTER TABLE `listaprecios` DISABLE KEYS */;
/*!40000 ALTER TABLE `listaprecios` ENABLE KEYS */;

--
-- Table structure for table `localidades`
--

DROP TABLE IF EXISTS `localidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localidades` (
  `ID_LOCALIDAD` int(11) NOT NULL,
  `ID_PROVINCIA` int(11) NOT NULL,
  `NOMBRE_LOCALIDAD` varchar(250) NOT NULL,
  PRIMARY KEY (`ID_LOCALIDAD`),
  UNIQUE KEY `LOCALIDADES_PK` (`ID_LOCALIDAD`),
  KEY `PROVINCIAS_LOCALIDADES_FK` (`ID_PROVINCIA`),
  CONSTRAINT `localidades_ibfk_1` FOREIGN KEY (`ID_PROVINCIA`) REFERENCES `provincias` (`ID_PROVINCIA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidades`
--

/*!40000 ALTER TABLE `localidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `localidades` ENABLE KEYS */;

--
-- Table structure for table `lotes`
--

DROP TABLE IF EXISTS `lotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lotes` (
  `ID_LOTE` int(11) NOT NULL,
  `ID_PRODUCTO` int(11) NOT NULL,
  `ID_PROVEEDOR` int(11) DEFAULT NULL,
  `FECHAVENCIMEINTO_LOTE` date NOT NULL,
  `CANTIDAD_LOTE` int(11) NOT NULL,
  PRIMARY KEY (`ID_LOTE`),
  UNIQUE KEY `LOTES_PK` (`ID_LOTE`),
  KEY `RELATION_193_FK` (`ID_PRODUCTO`),
  KEY `LOTES_PROVEEDORES_FK` (`ID_PROVEEDOR`),
  CONSTRAINT `lotes_ibfk_1` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `productos` (`ID_PRODUCTO`),
  CONSTRAINT `lotes_ibfk_2` FOREIGN KEY (`ID_PROVEEDOR`) REFERENCES `proveedores` (`ID_PROVEEDOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lotes`
--

/*!40000 ALTER TABLE `lotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `lotes` ENABLE KEYS */;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos` (
  `ID_PEDIDO` int(11) NOT NULL,
  `EST_ID_PEDIDO` int(11) DEFAULT NULL,
  `EST2_ID_PEDIDO` int(11) DEFAULT NULL,
  `EST3_ID_PEDIDO` int(11) DEFAULT NULL,
  `FAC_ID_PEDIDO` int(11) DEFAULT NULL,
  `NUMEROFACTURACOMPRAS` int(11) DEFAULT NULL,
  `ID_PROVEEDOR` int(11) NOT NULL,
  `TOTALPRECIO_PEDIDO` int(11) NOT NULL,
  PRIMARY KEY (`ID_PEDIDO`),
  UNIQUE KEY `PEDIDOS_PK` (`ID_PEDIDO`),
  KEY `PEDIDOS_ESTADOENVIOPEDIDOS_FK` (`EST_ID_PEDIDO`),
  KEY `PEDIDOS_ESTADORECEPCIONES_FK` (`EST2_ID_PEDIDO`),
  KEY `PEDIDOS_ESTADOSDEPAGOS_FK` (`EST3_ID_PEDIDO`),
  KEY `FACTURACOMPRAS_PEDIDOS_FK2` (`FAC_ID_PEDIDO`,`NUMEROFACTURACOMPRAS`),
  KEY `PROVEEDORES_PEDIDOS_FK` (`ID_PROVEEDOR`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`EST_ID_PEDIDO`) REFERENCES `estadosenviopedidos` (`ID_PEDIDO`),
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`EST2_ID_PEDIDO`) REFERENCES `estadosrcepciones` (`ID_PEDIDO`),
  CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`EST3_ID_PEDIDO`) REFERENCES `estadosdepagos` (`ID_PEDIDO`),
  CONSTRAINT `pedidos_ibfk_4` FOREIGN KEY (`FAC_ID_PEDIDO`, `NUMEROFACTURACOMPRAS`) REFERENCES `facturacompras` (`ID_PEDIDO`, `NUMEROFACTURACOMPRAS`),
  CONSTRAINT `pedidos_ibfk_5` FOREIGN KEY (`ID_PROVEEDOR`) REFERENCES `proveedores` (`ID_PROVEEDOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `ID_PRODUCTO` int(11) NOT NULL,
  `ID_CATEGORIA` int(11) DEFAULT NULL,
  `NOMBRE_PRODUCTO` varchar(250) DEFAULT NULL,
  `PRECIODEVENTA_PRODUCTO` int(11) DEFAULT NULL,
  `GANANCIA_PRODUCTO` int(11) DEFAULT NULL,
  `descripcion_producto` varchar(255) DEFAULT NULL,
  `FECHA_CREACION_PRODUCTO` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID_PRODUCTO`),
  UNIQUE KEY `PRODUCTOS_PK` (`ID_PRODUCTO`),
  UNIQUE KEY `ID_PRODUCTO` (`ID_PRODUCTO`),
  KEY `CATEGORIAS_PRODUCTOS_FK` (`ID_CATEGORIA`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`ID_CATEGORIA`) REFERENCES `categorias` (`ID_CATEGORIA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,29,'nuez',500,NULL,'0','2024-07-30 19:30:17'),(2,29,'banana seca',9000,NULL,'0','2024-07-30 23:14:10'),(3,29,'nueces brasil',8000,NULL,'0','2024-07-30 19:33:05'),(4,29,'mani',9000,NULL,'0','2024-07-30 19:34:59'),(67,3,'romero',9000,NULL,'0','2024-07-30 19:35:56'),(3778876,29,'bananas disecadas',5000,NULL,'','2024-08-01 20:56:21'),(33335555,28,'almendras',7000,NULL,'','2024-07-31 19:14:02'),(36789430,29,'Pistachos Tostados',4567,NULL,'','2024-07-31 19:17:36'),(37081908,28,'avena',900,NULL,'','2024-07-31 18:09:42'),(37087655,3,'sesamo',4555,NULL,'','2024-07-31 18:32:40'),(37098760,3,'provensal',900,NULL,'','2024-07-31 18:10:42'),(37643464,29,'Castaña De Cajú',3000,NULL,'','2024-07-31 19:21:23'),(37888777,29,'mani japones',3000,NULL,'','2024-07-31 18:28:42'),(37897521,28,'Mix De Cereales Con Pasas Y Manzana',534,NULL,'','2024-07-31 19:16:00'),(37898765,29,'MixGarrapiñada De Maní',37654,NULL,'','2024-07-31 19:20:06'),(37987654,29,'Castañas De Para',7000,NULL,'','2024-07-31 19:18:45'),(44540000,3,'sal',300,NULL,'','2024-08-01 23:00:29'),(45677778,29,'Almendras Tostadas Y Saladas',7000,NULL,'','2024-07-31 19:15:00');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

--
-- Table structure for table `propiedades`
--

DROP TABLE IF EXISTS `propiedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propiedades` (
  `ID_PROPIEDADES` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_PROPIEDADES` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID_PROPIEDADES`),
  UNIQUE KEY `PROPIEDADES_PK` (`ID_PROPIEDADES`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedades`
--

/*!40000 ALTER TABLE `propiedades` DISABLE KEYS */;
INSERT INTO `propiedades` VALUES (1,'sinTacc'),(2,'esDiuretico'),(3,'sinSodio'),(4,'aptoDiabetico'),(5,'esNatural');
/*!40000 ALTER TABLE `propiedades` ENABLE KEYS */;

--
-- Table structure for table `propiedades_productos`
--

DROP TABLE IF EXISTS `propiedades_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propiedades_productos` (
  `ID_PROPIEDADES` int(11) NOT NULL,
  `ID_PRODUCTO` int(11) NOT NULL,
  PRIMARY KEY (`ID_PROPIEDADES`,`ID_PRODUCTO`),
  UNIQUE KEY `PROPIEDADES_PRODUCTOS_PK` (`ID_PROPIEDADES`,`ID_PRODUCTO`),
  KEY `PROPIEDADES_PRODUCTOS_FK2` (`ID_PROPIEDADES`),
  KEY `PROPIEDADES_PRODUCTOS_FK` (`ID_PRODUCTO`),
  CONSTRAINT `propiedades_productos_ibfk_1` FOREIGN KEY (`ID_PROPIEDADES`) REFERENCES `propiedades` (`ID_PROPIEDADES`),
  CONSTRAINT `propiedades_productos_ibfk_2` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `productos` (`ID_PRODUCTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedades_productos`
--

/*!40000 ALTER TABLE `propiedades_productos` DISABLE KEYS */;
INSERT INTO `propiedades_productos` VALUES (1,4),(1,37643464),(1,37898765),(1,37987654),(3,36789430),(3,44540000),(4,3),(4,67),(4,37081908),(5,2),(5,67),(5,3778876),(5,33335555),(5,37081908),(5,37087655),(5,37897521),(5,37987654);
/*!40000 ALTER TABLE `propiedades_productos` ENABLE KEYS */;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedores` (
  `ID_PROVEEDOR` int(11) NOT NULL,
  `ID_DOMICILIO` int(11) DEFAULT NULL,
  `CUIL_PROVEEDOR` int(11) DEFAULT NULL,
  `NOMBRE_PROVEEDOR` varchar(250) NOT NULL,
  `APELIIDO_PROVEEDOR` varchar(250) NOT NULL,
  `TEL_PROVEEDOR` int(11) NOT NULL,
  `EMAIL_PROVEEDOR` varchar(250) NOT NULL,
  PRIMARY KEY (`ID_PROVEEDOR`),
  UNIQUE KEY `PROVEEDORES_PK` (`ID_PROVEEDOR`),
  KEY `PROVEEDOR_DOMICILIOS_FK` (`ID_DOMICILIO`),
  CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`ID_DOMICILIO`) REFERENCES `domicilios` (`ID_DOMICILIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provincias` (
  `ID_PROVINCIA` int(11) NOT NULL,
  `NOMBRE_PROVINCIA` varchar(250) NOT NULL,
  PRIMARY KEY (`ID_PROVINCIA`),
  UNIQUE KEY `PROVINCIAS_PK` (`ID_PROVINCIA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias`
--

/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;

--
-- Table structure for table `remplazados`
--

DROP TABLE IF EXISTS `remplazados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `remplazados` (
  `ID_DEVOLUCION` int(11) NOT NULL,
  `REM_ID_DEVOLUCION` int(11) DEFAULT NULL,
  `ID_LOTE` int(11) NOT NULL,
  `MOTIVO_REMPLAZADOS` varchar(250) DEFAULT NULL,
  `CANTIDAD_REMPLAZADO` int(11) NOT NULL,
  `PARADESCARTAR_REMPLAZADOS` decimal(1,0) NOT NULL,
  PRIMARY KEY (`ID_DEVOLUCION`),
  UNIQUE KEY `REMPLAZADOS_PK` (`ID_DEVOLUCION`),
  KEY `LOTES_REMPLAZADOS_FK` (`ID_LOTE`),
  CONSTRAINT `remplazados_ibfk_1` FOREIGN KEY (`ID_DEVOLUCION`) REFERENCES `devoluciones` (`ID_DEVOLUCION`),
  CONSTRAINT `remplazados_ibfk_2` FOREIGN KEY (`ID_LOTE`) REFERENCES `lotes` (`ID_LOTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remplazados`
--

/*!40000 ALTER TABLE `remplazados` DISABLE KEYS */;
/*!40000 ALTER TABLE `remplazados` ENABLE KEYS */;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ventas` (
  `ID_VENTA` int(11) NOT NULL AUTO_INCREMENT,
  `NUMEROFACTURAVENTAS` int(11) DEFAULT NULL,
  `FECHA_VENTA` date NOT NULL DEFAULT current_timestamp(),
  `HORA_VENTA` time NOT NULL DEFAULT current_timestamp(),
  `METODODEPAGO_VENTA` varchar(250) NOT NULL,
  `ERROR_VENTA` tinyint(1) NOT NULL DEFAULT 0,
  `motivoCorreccion` varchar(250) DEFAULT NULL,
  `ventaAnterior` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_VENTA`),
  KEY `VENTAS_FACTURAVENTAS_FK2` (`NUMEROFACTURAVENTAS`),
  KEY `ventaAnterior` (`ventaAnterior`),
  CONSTRAINT `ventaAnterior` FOREIGN KEY (`ventaAnterior`) REFERENCES `ventas` (`ID_VENTA`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`NUMEROFACTURAVENTAS`) REFERENCES `facturasventas` (`NUMEROFACTURAVENTAS`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (15,NULL,'2024-09-23','03:03:29','efectivo',1,NULL,NULL),(16,NULL,'2024-09-23','03:12:16','efectivo',0,'prueba',15);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;

--
-- Dumping routines for database 'fvpr2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-23 16:45:11
