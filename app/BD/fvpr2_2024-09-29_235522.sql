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
  `ID_DETALLe` int(10) unsigned NOT NULL AUTO_INCREMENT,
  KEY `ID_DETALLe` (`ID_DETALLe`),
  KEY `ID_VENTA` (`ID_VENTA`),
  CONSTRAINT `detalledeventas_ibfk_1` FOREIGN KEY (`ID_VENTA`) REFERENCES `ventas` (`ID_VENTA`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalledeventas`
--

/*!40000 ALTER TABLE `detalledeventas` DISABLE KEYS */;
INSERT INTO `detalledeventas` VALUES (30,2,1,9000,11),(32,2,5,9000,15),(33,1,3,500,16),(33,2,1,9000,17),(34,67,6,9001,18),(35,1,4,1300,19),(35,2,1,9000,20),(35,3,1,8000,21),(35,4,1,9000,22),(36,4,26,9000,23),(37,3,4,8000,24),(37,2,4,9000,25),(37,1,3,1300,26),(38,4,17,9000,27),(39,1,1,1300,28),(39,2,1,9000,29),(40,33335555,7,7000,30),(41,33335555,6,7000,31),(42,33335555,5,7000,32),(44,2,1,9000,33),(46,5,2,7000,34),(48,1,2,1300,35),(50,4,2,9000,36),(51,2,4,9000,37),(52,1,3,1300,38),(53,3,4,8000,39),(54,3,3,8000,40),(55,3,4,8000,41),(56,1,1,1300,42),(56,2,1,9000,43),(57,1,1,1300,44),(57,2,1,9000,45),(58,1,4,1300,46),(59,1,1,1300,47),(59,2,1,9000,48),(59,3,1,8000,49),(60,1,1,1300,50),(60,2,1,9000,51),(60,3,1,8000,52),(61,1,1,1300,53),(61,2,1,9000,54),(62,1,1,1300,55),(63,2,1,9000,56),(65,2,5,9000,58),(66,5,4,7000,59),(67,1,3,1300,60),(67,2,1,9000,61),(68,67,7,9001,62),(69,1,4,1300,63),(69,2,1,9000,64),(69,3,1,8000,65),(69,4,1,9000,66),(70,1,4,1300,67),(70,2,1,9000,68),(70,3,1,8000,69),(70,4,1,9000,70),(71,4,26,9000,71),(72,3,4,8000,72),(72,2,4,9000,73),(72,1,4,1300,74),(73,1,1,1300,75),(74,2,3,9000,76),(75,1,1,1300,77),(76,1,1,1300,78),(77,4,18,9000,79),(78,1,2,1300,80),(78,2,1,9000,81);
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
-- Table structure for table `mediopago`
--

DROP TABLE IF EXISTS `mediopago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mediopago` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mediopago`
--

/*!40000 ALTER TABLE `mediopago` DISABLE KEYS */;
INSERT INTO `mediopago` VALUES (1,'efectivo'),(2,'transferencia');
/*!40000 ALTER TABLE `mediopago` ENABLE KEYS */;

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
INSERT INTO `productos` VALUES (1,36,'castanas',1300,NULL,'0','2024-09-28 00:30:27'),(2,29,'banana seca',9000,NULL,'0','2024-07-30 23:14:10'),(3,29,'nueces brasil',8000,NULL,'0','2024-07-30 19:33:05'),(4,29,'mani',9000,NULL,'0','2024-07-30 19:34:59'),(5,28,'alfagor maizena',7000,NULL,'','2024-09-28 00:38:07'),(67,3,'romero',9001,NULL,'','2024-09-28 00:59:21'),(3778876,29,'bananas disecadas',5000,NULL,'','2024-08-01 20:56:21'),(33335555,28,'almendras',7000,NULL,'','2024-07-31 19:14:02'),(36789430,29,'Pistachos Tostados',4567,NULL,'','2024-07-31 19:17:36'),(37081908,28,'avena',900,NULL,'','2024-07-31 18:09:42'),(37087655,3,'sesamo',4555,NULL,'','2024-07-31 18:32:40'),(37098760,3,'provensal',900,NULL,'','2024-07-31 18:10:42'),(37643464,29,'Castaña De Cajú',3000,NULL,'','2024-07-31 19:21:23'),(37888777,29,'mani japones',3000,NULL,'','2024-07-31 18:28:42'),(37897521,28,'Mix De Cereales Con Pasas Y Manzana',534,NULL,'','2024-07-31 19:16:00'),(37898765,29,'MixGarrapiñada De Maní',37654,NULL,'','2024-07-31 19:20:06'),(37987654,29,'Castañas De Para',7000,NULL,'','2024-07-31 19:18:45'),(44540000,3,'sal',300,NULL,'','2024-08-01 23:00:29'),(45677778,29,'Almendras Tostadas Y Saladas',7000,NULL,'','2024-07-31 19:15:00');
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
INSERT INTO `propiedades_productos` VALUES (1,4),(1,37643464),(1,37898765),(1,37987654),(3,1),(3,5),(3,36789430),(3,44540000),(4,3),(4,67),(4,37081908),(5,2),(5,67),(5,3778876),(5,33335555),(5,37081908),(5,37087655),(5,37897521),(5,37987654);
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
  `METODODEPAGO_VENTA` int(11) DEFAULT 1,
  `ERROR_VENTA` tinyint(1) NOT NULL DEFAULT 0,
  `motivoCorreccion` varchar(250) DEFAULT NULL,
  `ventaAnterior` int(11) DEFAULT NULL,
  `total` int(10) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`ID_VENTA`),
  KEY `VENTAS_FACTURAVENTAS_FK2` (`NUMEROFACTURAVENTAS`),
  KEY `ventaAnterior` (`ventaAnterior`),
  KEY `METODODEPAGO_VENTA` (`METODODEPAGO_VENTA`),
  CONSTRAINT `ventaAnterior` FOREIGN KEY (`ventaAnterior`) REFERENCES `ventas` (`ID_VENTA`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`NUMEROFACTURAVENTAS`) REFERENCES `facturasventas` (`NUMEROFACTURAVENTAS`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`METODODEPAGO_VENTA`) REFERENCES `mediopago` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (30,NULL,'2024-09-27','00:09:38',1,1,NULL,NULL,9000),(32,NULL,'2024-09-27','01:47:52',1,1,NULL,NULL,9000),(33,NULL,'2024-09-27','01:53:51',1,1,NULL,NULL,9500),(34,NULL,'2024-09-28','06:00:24',1,1,NULL,NULL,9001),(35,NULL,'2024-09-28','06:07:36',2,1,NULL,NULL,27300),(36,NULL,'2024-09-28','18:33:55',2,1,NULL,NULL,9000),(37,NULL,'2024-09-28','19:29:21',2,1,NULL,NULL,18300),(38,NULL,'2024-09-28','19:32:13',1,1,NULL,NULL,9000),(39,NULL,'2024-09-28','19:39:20',1,1,NULL,NULL,10300),(40,NULL,'2024-09-28','19:55:49',1,0,NULL,NULL,7000),(41,NULL,'2024-09-28','19:56:30',1,0,NULL,NULL,7000),(42,NULL,'2024-09-28','19:56:54',1,0,NULL,NULL,7000),(43,NULL,'2024-09-28','20:00:38',1,1,NULL,NULL,0),(44,NULL,'2024-09-28','20:05:18',1,0,NULL,NULL,9000),(45,NULL,'2024-09-28','20:05:18',1,1,NULL,NULL,0),(46,NULL,'2024-09-28','20:07:32',1,1,NULL,NULL,7000),(47,NULL,'2024-09-28','20:07:33',1,1,NULL,NULL,0),(48,NULL,'2024-09-28','20:11:21',1,0,NULL,NULL,1300),(49,NULL,'2024-09-28','20:11:21',1,1,NULL,NULL,0),(50,NULL,'2024-09-28','20:14:39',1,0,NULL,NULL,9000),(51,NULL,'2024-09-28','20:16:20',1,0,NULL,NULL,9000),(52,NULL,'2024-09-28','20:17:03',1,0,NULL,NULL,1300),(53,NULL,'2024-09-28','20:19:31',1,0,NULL,NULL,8000),(54,NULL,'2024-09-28','20:19:57',1,0,NULL,NULL,8000),(55,NULL,'2024-09-28','20:22:17',1,0,NULL,NULL,8000),(56,NULL,'2024-09-28','20:24:14',1,0,NULL,NULL,10300),(57,NULL,'2024-09-28','20:26:59',1,0,NULL,NULL,10300),(58,NULL,'2024-09-28','20:35:14',1,0,NULL,NULL,1300),(59,NULL,'2024-09-28','20:38:41',1,0,NULL,NULL,18300),(60,NULL,'2024-09-28','20:39:39',1,0,NULL,NULL,18300),(61,NULL,'2024-09-28','20:42:01',1,0,NULL,NULL,10300),(62,NULL,'2024-09-28','20:45:47',1,0,NULL,NULL,1300),(63,NULL,'2024-09-28','22:10:23',1,0,'aaaa',30,9000),(65,NULL,'2024-09-28','22:12:38',1,0,'qqq',32,9000),(66,NULL,'2024-09-28','22:14:46',1,0,'qqq',46,7000),(67,NULL,'2024-09-28','22:22:31',1,0,'2',33,10300),(68,NULL,'2024-09-28','22:24:21',1,0,'',34,9001),(69,NULL,'2024-09-28','22:27:26',2,0,'q',35,27300),(70,NULL,'2024-09-28','22:29:28',2,0,'q',35,27300),(71,NULL,'2024-09-29','00:34:05',2,0,'',36,9000),(72,NULL,'2024-09-29','00:40:44',2,0,'modifique las nueces ',37,18300),(73,NULL,'2024-09-29','00:42:22',1,0,'se agrego productos',45,1300),(74,NULL,'2024-09-29','00:45:47',1,0,'agregar productos',43,9000),(75,NULL,'2024-09-29','00:47:02',1,0,'agregar pro',49,1300),(76,NULL,'2024-09-29','00:48:14',1,0,'',47,1300),(77,NULL,'2024-09-29','00:51:07',1,0,'prueba',38,9000),(78,NULL,'2024-09-29','00:51:52',1,0,'2',39,10300);
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

-- Dump completed on 2024-09-29 23:55:25
