-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: fvpr3
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cajeros` (
  `CUIT_CAJERO` int(11) NOT NULL,
  `NOMBRE_CAJERO` varchar(250) NOT NULL,
  `APELLIDO_CAJERO` varchar(250) NOT NULL,
  PRIMARY KEY (`CUIT_CAJERO`),
  UNIQUE KEY `CAJEROS_PK` (`CUIT_CAJERO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cajeros_ventas` (
  `CUIT_CAJERO` int(11) NOT NULL,
  `ID_VENTA` int(11) NOT NULL,
  PRIMARY KEY (`CUIT_CAJERO`,`ID_VENTA`),
  UNIQUE KEY `CAJEROS_VENTAS_PK` (`CUIT_CAJERO`,`ID_VENTA`),
  KEY `CAJEROS_VENTAS_FK2` (`CUIT_CAJERO`),
  KEY `CAJEROS_VENTAS_FK` (`ID_VENTA`),
  CONSTRAINT `cajeros_ventas_ibfk_1` FOREIGN KEY (`CUIT_CAJERO`) REFERENCES `cajeros` (`CUIT_CAJERO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `ID_CATEGORIA` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_CATEGORIA` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID_CATEGORIA`),
  UNIQUE KEY `CATEGORIAS_PK` (`ID_CATEGORIA`),
  UNIQUE KEY `nombre_unique` (`NOMBRE_CATEGORIA`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (28,'cereal'),(3,'condimento '),(36,'educorante'),(29,'frutas secas'),(1,'ningun0');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `CUIL_CLIENTE` int(11) NOT NULL,
  `ID_DOMICILIO` int(11) DEFAULT NULL,
  `NOMBRE_CLIENTE` varchar(250) NOT NULL,
  PRIMARY KEY (`CUIL_CLIENTE`),
  UNIQUE KEY `CLIENTES_PK` (`CUIL_CLIENTE`),
  KEY `RELATION_174_FK` (`ID_DOMICILIO`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`ID_DOMICILIO`) REFERENCES `domicilios` (`ID_DOMICILIO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalledeventas` (
  `ID_VENTA` int(11) NOT NULL,
  `ID_LOTE` int(11) NOT NULL,
  `CANTIDAD_DETALLEVENTA` int(11) DEFAULT NULL,
  `precioFecha` int(10) unsigned NOT NULL,
  `ID_DETALLe` int(10) unsigned NOT NULL AUTO_INCREMENT,
  KEY `ID_DETALLe` (`ID_DETALLe`),
  KEY `ID_VENTA` (`ID_VENTA`),
  CONSTRAINT `detalledeventas_ibfk_1` FOREIGN KEY (`ID_VENTA`) REFERENCES `ventas` (`ID_VENTA`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalledeventas`
--

/*!40000 ALTER TABLE `detalledeventas` DISABLE KEYS */;
INSERT INTO `detalledeventas` VALUES (107,10,1,1300,125),(107,20,1,9000,126),(108,16,5,9000,127),(108,17,9,7000,128),(109,14,5,9000,129),(109,15,4,500,130),(109,21,4,7000,131),(109,22,5,3456,132),(110,10,1,1300,133),(110,13,1,1300,134),(110,20,1,9000,135),(110,11,1,8000,136),(110,12,1,8000,137),(111,16,1,9000,138),(111,17,3,7000,139),(111,14,3,9000,140),(111,19,3,5000,141),(112,12,1,8000,142),(112,11,1,8000,143),(112,17,1,7000,144),(112,18,3,2000,145),(112,14,4,9000,146),(113,23,1,4555,147),(113,24,1,900,148),(113,25,1,3000,149),(114,19,1,5000,150),(114,15,1,500,151),(115,11,1,8000,152),(115,12,1,8000,153),(115,16,1,9000,154),(116,10,1,1300,155),(117,21,9,7000,156),(118,14,1,9000,157),(118,19,1,5000,158),(119,11,8,8000,159),(120,10,1,1300,160),(120,13,1,1300,161),(120,20,1,9000,162),(121,16,1,9000,163),(121,17,1,7000,164),(121,18,1,2000,165),(122,12,5,8000,166),(122,11,7,8000,167),(123,12,5,8000,168),(123,11,7,8000,169),(124,20,12,9000,170),(125,19,5,5000,171),(126,18,12,2000,172),(127,11,9,8000,173),(128,10,1,1300,174),(128,20,0,9000,175),(128,19,0,5000,176),(128,15,1,500,177),(129,11,6,8000,178),(129,12,10,8000,179),(130,24,6,900,180),(131,13,1,1300,181),(131,12,1,8000,182),(132,25,5,3000,183),(133,10,1,1300,184),(133,13,1,1300,185),(133,20,0,9000,186),(133,11,1,8000,187),(133,12,1,8000,188),(133,16,1,9000,189),(133,17,1,7000,190),(133,18,1,2000,191),(133,14,1,9000,192),(133,19,0,5000,193),(133,15,1,500,194),(133,21,1,7000,195),(133,22,1,3456,196),(133,23,1,4555,197),(133,24,1,900,198),(133,25,1,3000,199),(134,13,5,1300,200),(134,10,9,1300,201),(135,20,0,9000,202),(135,11,1,8000,203),(135,12,1,8000,204),(136,10,5,1300,205),(136,13,6,1300,206),(137,14,13,9000,207);
/*!40000 ALTER TABLE `detalledeventas` ENABLE KEYS */;

--
-- Table structure for table `detallesdepago`
--

DROP TABLE IF EXISTS `detallesdepago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallesdepago` (
  `ID_PEDIDO` int(11) NOT NULL,
  `METODO_DETALLEDEPAGO` varchar(250) NOT NULL,
  `MONTO_DETALLEDEPAGO` int(11) NOT NULL,
  `FECHA_DETALLEDEPAGO` date NOT NULL,
  `ESTADODEACREDITACION_DETALLEDE` decimal(1,0) DEFAULT NULL,
  PRIMARY KEY (`ID_PEDIDO`),
  UNIQUE KEY `DETALLESDEPAGO_PK` (`ID_PEDIDO`),
  CONSTRAINT `detallesdepago_ibfk_1` FOREIGN KEY (`ID_PEDIDO`) REFERENCES `estadosdepagos` (`ID_PEDIDO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devoluciones` (
  `ID_DEVOLUCION` int(11) NOT NULL,
  `ID_VENTA` int(11) NOT NULL,
  `DINEROARESTITUIR_DEVOLUCION` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_DEVOLUCION`),
  UNIQUE KEY `DEVOLUCIONES_PK` (`ID_DEVOLUCION`),
  KEY `VENTAS_DEVOLUCIONES_FK` (`ID_VENTA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `domicilios` (
  `ID_DOMICILIO` int(11) NOT NULL,
  `ID_LOCALIDAD` int(11) NOT NULL,
  `DIRECCION_DOMICILIO` varchar(250) NOT NULL,
  PRIMARY KEY (`ID_DOMICILIO`),
  UNIQUE KEY `DOMICILIOS_PK` (`ID_DOMICILIO`),
  KEY `LOCALIDADES_DOMICILIOS_FK` (`ID_LOCALIDAD`),
  CONSTRAINT `domicilios_ibfk_1` FOREIGN KEY (`ID_LOCALIDAD`) REFERENCES `localidades` (`ID_LOCALIDAD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domicilios`
--

/*!40000 ALTER TABLE `domicilios` DISABLE KEYS */;
/*!40000 ALTER TABLE `domicilios` ENABLE KEYS */;

--
-- Table structure for table `estadoinventariolote`
--

DROP TABLE IF EXISTS `estadoinventariolote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadoinventariolote` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadoinventariolote`
--

/*!40000 ALTER TABLE `estadoinventariolote` DISABLE KEYS */;
/*!40000 ALTER TABLE `estadoinventariolote` ENABLE KEYS */;

--
-- Table structure for table `estadosdepagos`
--

DROP TABLE IF EXISTS `estadosdepagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadosdepagos` (
  `ID_PEDIDO` int(11) NOT NULL,
  `FECHA_ESTADODEPAGO` date NOT NULL,
  `PAGOFALTANTE_ESTADODEPAGO` int(11) NOT NULL,
  `ESTADO_ESTADODEPAGO` varchar(250) NOT NULL,
  PRIMARY KEY (`ID_PEDIDO`),
  UNIQUE KEY `ESTADOSDEPAGOS_PK` (`ID_PEDIDO`),
  CONSTRAINT `estadosdepagos_ibfk_1` FOREIGN KEY (`ID_PEDIDO`) REFERENCES `pedidos` (`ID_PEDIDO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadosenviopedidos` (
  `ID_PEDIDO` int(11) NOT NULL,
  `PRECIO_ESTADOENVIOPEDIDO` int(11) NOT NULL,
  `FECHA_ESTADOENVIOPEDIDO` date NOT NULL,
  `ESTADO_ESTADOENVIOPEDIDO` varchar(250) NOT NULL,
  PRIMARY KEY (`ID_PEDIDO`),
  UNIQUE KEY `ESTADOSENVIOPEDIDOS_PK` (`ID_PEDIDO`),
  CONSTRAINT `estadosenviopedidos_ibfk_1` FOREIGN KEY (`ID_PEDIDO`) REFERENCES `pedidos` (`ID_PEDIDO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadosrcepciones` (
  `ID_PEDIDO` int(11) NOT NULL,
  `FECHA_ESTADORECEPCION` date NOT NULL,
  `ESTADO_ESTADORECEPCION` varchar(250) NOT NULL,
  PRIMARY KEY (`ID_PEDIDO`),
  UNIQUE KEY `ESTADOSRCEPCIONES_PK` (`ID_PEDIDO`),
  CONSTRAINT `estadosrcepciones_ibfk_1` FOREIGN KEY (`ID_PEDIDO`) REFERENCES `pedidos` (`ID_PEDIDO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadosrcepciones`
--

/*!40000 ALTER TABLE `estadosrcepciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `estadosrcepciones` ENABLE KEYS */;

--
-- Table structure for table `estadovencimiento`
--

DROP TABLE IF EXISTS `estadovencimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadovencimiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `nombre` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadovencimiento`
--

/*!40000 ALTER TABLE `estadovencimiento` DISABLE KEYS */;
INSERT INTO `estadovencimiento` VALUES (1,'vencimiento largo'),(2,'por vencer'),(3,'vencido'),(5,'Vencimiento largo.'),(6,'Por vencer.'),(7,'Vencido.');
/*!40000 ALTER TABLE `estadovencimiento` ENABLE KEYS */;

--
-- Table structure for table `facturacompras`
--

DROP TABLE IF EXISTS `facturacompras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturacompras` (
  `ID_PEDIDO` int(11) NOT NULL,
  `NUMEROFACTURACOMPRAS` int(11) NOT NULL,
  `TIPO_FACTURACOMRPAS` varchar(10) NOT NULL,
  PRIMARY KEY (`ID_PEDIDO`,`NUMEROFACTURACOMPRAS`),
  UNIQUE KEY `FACTURACOMPRAS_PK` (`ID_PEDIDO`,`NUMEROFACTURACOMPRAS`),
  KEY `FACTURACOMPRAS_PEDIDOS_FK` (`ID_PEDIDO`),
  CONSTRAINT `facturacompras_ibfk_1` FOREIGN KEY (`ID_PEDIDO`) REFERENCES `pedidos` (`ID_PEDIDO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidades` (
  `ID_LOCALIDAD` int(11) NOT NULL,
  `ID_PROVINCIA` int(11) NOT NULL,
  `NOMBRE_LOCALIDAD` varchar(250) NOT NULL,
  PRIMARY KEY (`ID_LOCALIDAD`),
  UNIQUE KEY `LOCALIDADES_PK` (`ID_LOCALIDAD`),
  KEY `PROVINCIAS_LOCALIDADES_FK` (`ID_PROVINCIA`),
  CONSTRAINT `localidades_ibfk_1` FOREIGN KEY (`ID_PROVINCIA`) REFERENCES `provincias` (`ID_PROVINCIA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lotes` (
  `ID_LOTE` int(11) NOT NULL AUTO_INCREMENT,
  `ID_PRODUCTO` int(11) NOT NULL,
  `ID_PROVEEDOR` int(11) DEFAULT NULL,
  `FECHAVENCIMEINTO_LOTE` date NOT NULL,
  `CANTIDAD_LOTE` int(11) NOT NULL,
  `fechaIngreso` date NOT NULL,
  `idEstadoInventario` int(11) NOT NULL DEFAULT 1,
  `idEstadoVencimiento` int(11) NOT NULL,
  PRIMARY KEY (`ID_LOTE`),
  UNIQUE KEY `LOTES_PK` (`ID_LOTE`),
  KEY `RELATION_193_FK` (`ID_PRODUCTO`),
  KEY `LOTES_PROVEEDORES_FK` (`ID_PROVEEDOR`),
  CONSTRAINT `lotes_ibfk_1` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `productos` (`ID_PRODUCTO`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lotes`
--

/*!40000 ALTER TABLE `lotes` DISABLE KEYS */;
INSERT INTO `lotes` VALUES (10,1,2,'2025-03-25',480,'2024-11-01',1,5),(11,3,2,'2024-11-27',558,'2024-10-31',1,6),(12,3,2,'2024-11-23',274,'2024-10-16',1,6),(13,1,2,'2024-11-23',529,'2024-11-11',1,6),(14,67,5,'2024-12-26',573,'2024-11-11',1,6),(15,33333333,1,'2025-01-14',29,'2024-11-18',1,5),(16,4,2,'2025-03-12',491,'2024-11-23',1,5),(17,5,4,'2024-12-20',9,'2024-11-23',1,5),(18,17,2,'2025-10-01',8,'2024-11-23',1,6),(19,3778876,5,'2025-11-24',0,'2024-11-23',1,5),(20,2,2,'2025-09-01',0,'2024-11-23',1,6),(21,33335555,2,'2025-05-01',10,'2024-11-23',1,6),(22,34567890,4,'2025-08-01',9,'2024-11-23',1,6),(23,37087655,3,'2024-12-31',28,'2024-11-23',1,6),(24,37098760,3,'2025-01-01',6,'2024-11-23',1,6),(25,37643464,1,'2024-11-24',3,'2024-11-24',1,7);
/*!40000 ALTER TABLE `lotes` ENABLE KEYS */;

--
-- Table structure for table `mediopago`
--

DROP TABLE IF EXISTS `mediopago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mediopago` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mediopago`
--

/*!40000 ALTER TABLE `mediopago` DISABLE KEYS */;
INSERT INTO `mediopago` VALUES (1,'efectivo'),(2,'transferencia');
/*!40000 ALTER TABLE `mediopago` ENABLE KEYS */;

--
-- Table structure for table `modificacion_vencimiento`
--

DROP TABLE IF EXISTS `modificacion_vencimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modificacion_vencimiento` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modificacion_vencimiento`
--

/*!40000 ALTER TABLE `modificacion_vencimiento` DISABLE KEYS */;
INSERT INTO `modificacion_vencimiento` VALUES (1,'2024-11-18 21:37:35'),(3,'2024-11-19 22:11:49'),(4,'2024-11-20 00:05:41'),(5,'2024-11-21 20:33:25'),(6,'2024-11-22 00:07:00'),(7,'2024-11-23 18:05:31'),(8,'2024-11-24 00:19:41');
/*!40000 ALTER TABLE `modificacion_vencimiento` ENABLE KEYS */;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,36,'castanas',1300,NULL,'0','2024-09-28 00:30:27'),(2,29,'banana seca',9000,NULL,'0','2024-07-30 23:14:10'),(3,29,'nueces brasil',8000,NULL,'0','2024-07-30 19:33:05'),(4,29,'mani',9000,NULL,'0','2024-07-30 19:34:59'),(5,28,'alfagor maizena',7000,NULL,'','2024-09-28 00:38:07'),(17,3,'paprica',2000,NULL,'','2024-10-27 22:54:42'),(67,3,'romero',9000,NULL,'','2024-09-30 16:30:58'),(3778876,29,'bananas disecadas',5000,NULL,'','2024-08-01 20:56:21'),(33333333,28,'avena',500,NULL,'','2024-11-09 01:49:12'),(33335555,28,'almendras',7000,NULL,'','2024-07-31 19:14:02'),(34567890,28,'avena',3456,NULL,'','2024-09-30 16:30:08'),(36789430,29,'Pistachos Tostados',4567,NULL,'','2024-07-31 19:17:36'),(37081908,28,'avena',900,NULL,'','2024-07-31 18:09:42'),(37087655,3,'sesamo',4555,NULL,'','2024-07-31 18:32:40'),(37098760,3,'provensal',900,NULL,'','2024-07-31 18:10:42'),(37643464,29,'Castaña De Cajú',3000,NULL,'','2024-07-31 19:21:23'),(37888777,29,'mani japones',3000,NULL,'','2024-07-31 18:28:42'),(37897521,28,'Mix De Cereales Con Pasas Y Manzana',534,NULL,'','2024-07-31 19:16:00'),(37898765,29,'MixGarrapiñada De Maní',37654,NULL,'','2024-07-31 19:20:06'),(37987654,29,'Castañas De Para',7000,NULL,'','2024-07-31 19:18:45'),(44540000,3,'sal',300,NULL,'','2024-08-01 23:00:29'),(44568954,28,'matias',5,NULL,'','2024-10-21 20:06:30'),(45677778,29,'Almendras Tostadas Y Saladas',7000,NULL,'ttttt','2024-07-31 19:15:00');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

--
-- Table structure for table `propiedades`
--

DROP TABLE IF EXISTS `propiedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propiedades` (
  `ID_PROPIEDADES` int(11) NOT NULL AUTO_INCREMENT,
  `NOMBRE_PROPIEDADES` varchar(250) DEFAULT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID_PROPIEDADES`),
  UNIQUE KEY `PROPIEDADES_PK` (`ID_PROPIEDADES`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedades`
--

/*!40000 ALTER TABLE `propiedades` DISABLE KEYS */;
INSERT INTO `propiedades` VALUES (1,'sinTacc','Sin tacc'),(2,'esDiuretico','Diurectico'),(3,'sinSodio','Bajo sodio'),(4,'aptoDiabetico','Apto diabetico'),(5,'esNatural','Natural');
/*!40000 ALTER TABLE `propiedades` ENABLE KEYS */;

--
-- Table structure for table `propiedades_productos`
--

DROP TABLE IF EXISTS `propiedades_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propiedades_productos` (
  `ID_PROPIEDADES` int(11) NOT NULL,
  `ID_PRODUCTO` int(11) NOT NULL,
  PRIMARY KEY (`ID_PROPIEDADES`,`ID_PRODUCTO`),
  UNIQUE KEY `PROPIEDADES_PRODUCTOS_PK` (`ID_PROPIEDADES`,`ID_PRODUCTO`),
  KEY `PROPIEDADES_PRODUCTOS_FK2` (`ID_PROPIEDADES`),
  KEY `PROPIEDADES_PRODUCTOS_FK` (`ID_PRODUCTO`),
  CONSTRAINT `propiedades_productos_ibfk_1` FOREIGN KEY (`ID_PROPIEDADES`) REFERENCES `propiedades` (`ID_PROPIEDADES`),
  CONSTRAINT `propiedades_productos_ibfk_2` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `productos` (`ID_PRODUCTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propiedades_productos`
--

/*!40000 ALTER TABLE `propiedades_productos` DISABLE KEYS */;
INSERT INTO `propiedades_productos` VALUES (1,4),(1,37643464),(1,37898765),(1,37987654),(3,1),(3,5),(3,36789430),(3,44540000),(4,3),(4,67),(4,33333333),(4,37081908),(4,45677778),(5,2),(5,17),(5,67),(5,3778876),(5,33335555),(5,34567890),(5,37081908),(5,37087655),(5,37897521),(5,37987654),(5,45677778);
/*!40000 ALTER TABLE `propiedades_productos` ENABLE KEYS */;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `ID_PROVEEDOR` int(11) NOT NULL AUTO_INCREMENT,
  `ID_DOMICILIO` int(11) DEFAULT NULL,
  `CUIL_PROVEEDOR` int(11) DEFAULT NULL,
  `razonSocial` varchar(250) NOT NULL,
  `TEL_PROVEEDOR` int(11) DEFAULT NULL,
  `EMAIL_PROVEEDOR` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID_PROVEEDOR`),
  UNIQUE KEY `PROVEEDORES_PK` (`ID_PROVEEDOR`),
  KEY `PROVEEDOR_DOMICILIOS_FK` (`ID_DOMICILIO`),
  CONSTRAINT `proveedores_ibfk_1` FOREIGN KEY (`ID_DOMICILIO`) REFERENCES `domicilios` (`ID_DOMICILIO`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,NULL,NULL,'propio',NULL,NULL),(2,NULL,NULL,'manuel srl',NULL,NULL),(3,NULL,NULL,'acme',NULL,NULL),(4,NULL,NULL,'arcor',NULL,NULL),(5,NULL,NULL,'fiston',NULL,NULL);
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;

--
-- Table structure for table `provincias`
--

DROP TABLE IF EXISTS `provincias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincias` (
  `ID_PROVINCIA` int(11) NOT NULL,
  `NOMBRE_PROVINCIA` varchar(250) NOT NULL,
  PRIMARY KEY (`ID_PROVINCIA`),
  UNIQUE KEY `PROVINCIAS_PK` (`ID_PROVINCIA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincias`
--

/*!40000 ALTER TABLE `provincias` DISABLE KEYS */;
/*!40000 ALTER TABLE `provincias` ENABLE KEYS */;

--
-- Table structure for table `registro_modificacion_inventario`
--

DROP TABLE IF EXISTS `registro_modificacion_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_modificacion_inventario` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `fecha` datetime NOT NULL DEFAULT current_timestamp() COMMENT 'Create Time',
  `motivo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_detalle` int(11) DEFAULT NULL,
  `id_devolucion` int(11) DEFAULT NULL,
  `inv_mom` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_modificacion_inventario`
--

/*!40000 ALTER TABLE `registro_modificacion_inventario` DISABLE KEYS */;
/*!40000 ALTER TABLE `registro_modificacion_inventario` ENABLE KEYS */;

--
-- Table structure for table `remplazados`
--

DROP TABLE IF EXISTS `remplazados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
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
  CONSTRAINT `remplazados_ibfk_1` FOREIGN KEY (`ID_DEVOLUCION`) REFERENCES `devoluciones` (`ID_DEVOLUCION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (107,NULL,'2024-10-08','10:15:37',2,0,NULL,NULL,10300),(108,NULL,'2024-10-09','09:20:54',1,0,NULL,NULL,108000),(109,NULL,'2024-10-09','14:34:20',2,0,NULL,NULL,92280),(110,NULL,'2024-10-10','16:28:32',2,0,NULL,NULL,27600),(111,NULL,'2024-10-10','21:14:56',1,0,NULL,NULL,72000),(112,NULL,'2024-10-11','09:46:25',1,0,NULL,NULL,65000),(113,NULL,'2024-10-11','10:15:38',1,0,NULL,NULL,8455),(114,NULL,'2024-10-11','14:07:47',1,0,NULL,NULL,5500),(115,NULL,'2024-10-11','18:47:55',1,0,NULL,NULL,25000),(116,NULL,'2024-10-12','10:37:04',1,0,NULL,NULL,1300),(117,NULL,'2024-10-17','11:41:23',1,0,NULL,NULL,63000),(118,NULL,'2024-10-18','15:47:40',1,0,NULL,NULL,14000),(119,NULL,'2024-10-23','10:47:52',2,0,NULL,NULL,64000),(120,NULL,'2024-10-25','11:18:01',1,0,NULL,NULL,11600),(121,NULL,'2024-10-29','14:38:37',1,0,NULL,NULL,18000),(122,NULL,'2024-11-01','09:40:49',1,0,NULL,NULL,96000),(123,NULL,'2024-11-05','10:43:50',1,0,NULL,NULL,96000),(124,NULL,'2024-11-08','20:34:08',1,0,NULL,NULL,108000),(125,NULL,'2024-11-11','17:27:39',1,0,NULL,NULL,25000),(126,NULL,'2024-11-14','14:24:03',2,0,NULL,NULL,24000),(127,NULL,'2024-11-15','15:30:26',1,0,NULL,NULL,72000),(128,NULL,'2024-11-18','19:35:37',1,0,NULL,NULL,1800),(129,NULL,'2024-11-21','11:54:59',1,0,NULL,NULL,128000),(130,NULL,'2024-11-22','06:07:13',2,0,NULL,NULL,5400),(131,NULL,'2024-11-24','08:05:51',2,0,NULL,NULL,9300),(132,NULL,'2024-11-24','08:19:03',2,0,NULL,NULL,15000),(133,NULL,'2024-11-24','08:23:25',2,0,NULL,NULL,65011),(134,NULL,'2024-11-24','10:34:36',2,0,NULL,NULL,18200),(135,NULL,'2024-11-24','12:15:08',1,0,NULL,NULL,16000),(136,NULL,'2024-11-24','17:23:19',1,0,NULL,NULL,14300),(137,NULL,'2024-11-24','19:43:31',1,0,NULL,NULL,117000);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;

--
-- Dumping routines for database 'fvpr3'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-23 21:20:32
