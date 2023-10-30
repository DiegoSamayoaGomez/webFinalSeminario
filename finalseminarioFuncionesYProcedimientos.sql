-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: finalseminario
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ID_CLIENTE` int(11) NOT NULL AUTO_INCREMENT,
  `ESTADO` bit(1) DEFAULT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `APELLIDO` varchar(50) DEFAULT NULL,
  `NIT` varchar(50) DEFAULT NULL,
  `TELEFONO` varchar(50) DEFAULT NULL,
  `DIRECCION` varchar(50) DEFAULT NULL,
  `FECHA_INGRESA` date DEFAULT NULL,
  `FECHA_MODIFICA` date DEFAULT NULL,
  `USUARIO_INGRESA` int(11) DEFAULT NULL,
  `USUARIO_MODIFICA` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_CLIENTE`),
  KEY `CLIENTE` (`ID_CLIENTE`),
  KEY `fk_CLIENTE_USUARIO1_idx` (`USUARIO_INGRESA`),
  KEY `fk_CLIENTE_USUARIO2_idx` (`USUARIO_MODIFICA`),
  CONSTRAINT `fk_CLIENTE_USUARIO1` FOREIGN KEY (`USUARIO_INGRESA`) REFERENCES `usuario` (`ID_USUARIO`),
  CONSTRAINT `fk_CLIENTE_USUARIO2` FOREIGN KEY (`USUARIO_MODIFICA`) REFERENCES `usuario` (`ID_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,_binary '','CLIENTE','CLIENTEAP','123','1792','CASA','2023-07-26','2023-07-26',1,1),(2,_binary '','CLIENTE2','CLIENTEAP2','1232','17922','CASA2','2023-07-26','2023-07-26',1,1);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `ID_COMPRA` int(11) NOT NULL AUTO_INCREMENT,
  `ESTADO` bit(1) DEFAULT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `ESTADO_FINALIZADO` bit(1) DEFAULT NULL,
  `FECHA_COMPRA` date DEFAULT NULL,
  `FECHA_INGRESA` date DEFAULT NULL,
  `FECHA_MODIFICA` date DEFAULT NULL,
  `USUARIO_INGRESA` int(11) DEFAULT NULL,
  `USUARIO_MODIFICA` int(11) DEFAULT NULL,
  `ID_PROVEEDOR` int(11) DEFAULT NULL,
  `ID_TIPO_PAGO` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_COMPRA`),
  KEY `fk_COMPRA_TIPO_PAGO1_idx` (`ID_TIPO_PAGO`),
  KEY `fk_COMPRA_PROVEEDOR1_idx` (`ID_PROVEEDOR`),
  KEY `fk_COMPRA_USUARIO1_idx` (`USUARIO_INGRESA`),
  KEY `fk_COMPRA_USUARIO2_idx` (`USUARIO_MODIFICA`),
  CONSTRAINT `fk_COMPRA_PROVEEDOR1` FOREIGN KEY (`ID_PROVEEDOR`) REFERENCES `proveedor` (`ID_PROVEEDOR`),
  CONSTRAINT `fk_COMPRA_TIPO_PAGO1` FOREIGN KEY (`ID_TIPO_PAGO`) REFERENCES `tipo_pago` (`ID_TIPO_PAGO`),
  CONSTRAINT `fk_COMPRA_USUARIO1` FOREIGN KEY (`USUARIO_INGRESA`) REFERENCES `usuario` (`ID_USUARIO`),
  CONSTRAINT `fk_COMPRA_USUARIO2` FOREIGN KEY (`USUARIO_MODIFICA`) REFERENCES `usuario` (`ID_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,_binary '',NULL,_binary '','2023-10-28','2023-10-28',NULL,1,NULL,4,1),(2,_binary '',NULL,_binary '','2023-10-29','2023-10-29',NULL,1,NULL,4,2),(3,_binary '',NULL,_binary '','2023-10-29','2023-10-29',NULL,1,NULL,4,2),(4,_binary '',NULL,_binary '','2023-10-29','2023-10-29',NULL,1,NULL,4,2),(5,_binary '',NULL,_binary '','2023-10-29','2023-10-29',NULL,1,NULL,4,2),(6,_binary '',NULL,_binary '','2023-10-29','2023-10-29',NULL,1,NULL,4,2),(7,_binary '',NULL,_binary '','2023-10-29','2023-10-29',NULL,1,NULL,3,2),(8,_binary '',NULL,_binary '','2023-10-29','2023-10-29',NULL,1,NULL,4,2);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_compra` (
  `ID_DETALLE_COMPRA` int(11) NOT NULL AUTO_INCREMENT,
  `CANTIDAD` int(11) DEFAULT NULL,
  `MONTO` decimal(10,2) DEFAULT NULL,
  `ID_COMPRA` int(11) DEFAULT NULL,
  `ID_PRODUCTO` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_DETALLE_COMPRA`),
  KEY `fk_DETALLE_COMPRA_COMPRA1_idx` (`ID_COMPRA`),
  KEY `fk_DETALLE_COMPRA_PRODUCTO1_idx` (`ID_PRODUCTO`),
  CONSTRAINT `fk_DETALLE_COMPRA_COMPRA1` FOREIGN KEY (`ID_COMPRA`) REFERENCES `compra` (`ID_COMPRA`),
  CONSTRAINT `fk_DETALLE_COMPRA_PRODUCTO1` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `producto` (`ID_PRODUCTO`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compra`
--

LOCK TABLES `detalle_compra` WRITE;
/*!40000 ALTER TABLE `detalle_compra` DISABLE KEYS */;
INSERT INTO `detalle_compra` VALUES (1,5,3.00,1,2),(2,7,5.00,1,1),(3,5,3.00,2,2),(4,3,5.00,2,1),(5,4,3.00,3,2),(6,3,5.00,4,1),(7,12,3.00,5,2),(8,5,3.00,6,2),(9,13,3.00,7,2),(10,32,5.00,7,1),(11,2,5.00,8,1),(12,2,3.00,8,2);
/*!40000 ALTER TABLE `detalle_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_venta` (
  `ID_DETALLE_VENTA` int(11) NOT NULL AUTO_INCREMENT,
  `CANTIDAD` int(11) DEFAULT NULL,
  `MONTO` decimal(10,2) DEFAULT NULL,
  `ID_VENTA` int(11) DEFAULT NULL,
  `ID_PRODUCTO` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_DETALLE_VENTA`),
  KEY `fk_DETALLE_VENTA_VENTA1_idx` (`ID_VENTA`),
  KEY `fk_detalle_venta_producto1_idx` (`ID_PRODUCTO`),
  CONSTRAINT `fk_DETALLE_VENTA_VENTA1` FOREIGN KEY (`ID_VENTA`) REFERENCES `venta` (`ID_VENTA`),
  CONSTRAINT `fk_detalle_venta_producto1` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `producto` (`ID_PRODUCTO`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` VALUES (2,5,5.00,1,1),(3,18,3.00,2,2),(4,5,5.00,2,1),(5,5,3.00,3,2),(6,2,5.00,3,1),(7,5,3.00,4,2),(8,5,3.00,5,2),(9,5,5.00,6,1),(10,5,3.00,7,2),(11,5,3.00,8,2),(12,5,3.00,9,2),(13,3,5.00,9,1),(14,3,3.00,10,2),(15,5,3.00,11,2),(16,5,3.00,12,2),(17,5,5.00,13,1),(18,5,3.00,14,2),(19,5,5.00,15,1),(20,3,5.00,16,1),(21,2,3.00,16,2),(22,5,3.00,17,2),(23,3,5.00,17,1),(24,3,3.00,18,2),(25,3,3.00,19,2),(26,32,5.00,19,1),(27,13,3.00,20,2),(28,3,3.00,21,2);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `ID_PRODUCTO` int(11) NOT NULL AUTO_INCREMENT,
  `ESTADO` bit(1) DEFAULT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `CANTIDAD` int(11) DEFAULT NULL,
  `PRECIO` decimal(10,2) DEFAULT NULL,
  `FECHA_INGRESA` date DEFAULT NULL,
  `FECHA_MODIFICA` date DEFAULT NULL,
  `USUARIO_INGRESA` int(11) DEFAULT NULL,
  `USUARIO_MODIFICA` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_PRODUCTO`),
  KEY `fk_PRODUCTO_USUARIO1_idx` (`USUARIO_INGRESA`),
  KEY `fk_PRODUCTO_USUARIO2_idx` (`USUARIO_MODIFICA`),
  CONSTRAINT `fk_PRODUCTO_USUARIO1` FOREIGN KEY (`USUARIO_INGRESA`) REFERENCES `usuario` (`ID_USUARIO`),
  CONSTRAINT `fk_PRODUCTO_USUARIO2` FOREIGN KEY (`USUARIO_MODIFICA`) REFERENCES `usuario` (`ID_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,_binary '','PRODUCTO',2,5.00,'2023-07-20','2023-07-20',1,1),(2,_binary '','PRODUCTO2',3,3.00,'2023-07-20','2023-07-20',1,1);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `ID_PROVEEDOR` int(11) NOT NULL AUTO_INCREMENT,
  `ESTADO` bit(1) DEFAULT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `DIRECCION` varchar(50) DEFAULT NULL,
  `TELEFONO` varchar(50) DEFAULT NULL,
  `FECHA_INGRESA` date DEFAULT NULL,
  `FECHA_MODIFICA` date DEFAULT NULL,
  `USUARIO_INGRESA` int(11) DEFAULT NULL,
  `USUARIO_MODIFICA` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_PROVEEDOR`),
  KEY `fk_PROVEEDOR_USUARIO1_idx` (`USUARIO_INGRESA`),
  KEY `fk_PROVEEDOR_USUARIO2_idx` (`USUARIO_MODIFICA`),
  CONSTRAINT `fk_PROVEEDOR_USUARIO1` FOREIGN KEY (`USUARIO_INGRESA`) REFERENCES `usuario` (`ID_USUARIO`),
  CONSTRAINT `fk_PROVEEDOR_USUARIO2` FOREIGN KEY (`USUARIO_MODIFICA`) REFERENCES `usuario` (`ID_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (3,_binary '','PROVEEDOR1','CAMBOTE','987654','2023-07-26','2023-07-27',1,1),(4,_binary '','PROVEEDOR 2','XELA','654321','2023-07-25','2023-07-29',1,1);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `ID_ROL` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPCION` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_ROL`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'ADMINISTRADOR'),(2,'ESTANDAR');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_pago`
--

DROP TABLE IF EXISTS `tipo_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_pago` (
  `ID_TIPO_PAGO` int(11) NOT NULL AUTO_INCREMENT,
  `ESTADO` bit(1) DEFAULT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_TIPO_PAGO`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_pago`
--

LOCK TABLES `tipo_pago` WRITE;
/*!40000 ALTER TABLE `tipo_pago` DISABLE KEYS */;
INSERT INTO `tipo_pago` VALUES (1,_binary '','EFECTIVO'),(2,_binary '','TARJETA');
/*!40000 ALTER TABLE `tipo_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `ID_USUARIO` int(11) NOT NULL AUTO_INCREMENT,
  `ESTADO` bit(1) DEFAULT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `CONTRASENIA` varchar(50) DEFAULT NULL,
  `ID_ROL` int(11) NOT NULL,
  PRIMARY KEY (`ID_USUARIO`),
  KEY `fk_USUARIO_ROL1_idx` (`ID_ROL`),
  CONSTRAINT `fk_USUARIO_ROL1` FOREIGN KEY (`ID_ROL`) REFERENCES `rol` (`ID_ROL`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,_binary '','DIEGO','123',1),(22,_binary '','JUAN','321',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `ID_VENTA` int(11) NOT NULL AUTO_INCREMENT,
  `ESTADO` bit(1) DEFAULT NULL,
  `NOMBRE` varchar(50) DEFAULT NULL,
  `ESTADO_FINALIZADO` bit(1) DEFAULT NULL,
  `FECHA_VENTA` date DEFAULT NULL,
  `FECHA_INGRESA` date DEFAULT NULL,
  `FECHA_MODIFICA` date DEFAULT NULL,
  `USUARIO_INGRESA` int(11) DEFAULT NULL,
  `USUARIO_MODIFICA` int(11) DEFAULT NULL,
  `ID_CLIENTE` int(11) DEFAULT NULL,
  `ID_TIPO_PAGO` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_VENTA`),
  KEY `fk_VENTA_TIPO_PAGO1_idx` (`ID_TIPO_PAGO`),
  KEY `fk_VENTA_CLIENTE1_idx` (`ID_CLIENTE`),
  KEY `fk_VENTA_USUARIO1_idx` (`USUARIO_INGRESA`),
  KEY `fk_VENTA_USUARIO2_idx` (`USUARIO_MODIFICA`),
  CONSTRAINT `fk_VENTA_CLIENTE1` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `cliente` (`ID_CLIENTE`),
  CONSTRAINT `fk_VENTA_TIPO_PAGO1` FOREIGN KEY (`ID_TIPO_PAGO`) REFERENCES `tipo_pago` (`ID_TIPO_PAGO`),
  CONSTRAINT `fk_VENTA_USUARIO1` FOREIGN KEY (`USUARIO_INGRESA`) REFERENCES `usuario` (`ID_USUARIO`),
  CONSTRAINT `fk_VENTA_USUARIO2` FOREIGN KEY (`USUARIO_MODIFICA`) REFERENCES `usuario` (`ID_USUARIO`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,_binary '',NULL,_binary '','2023-10-28','2023-10-28',NULL,1,NULL,2,2),(2,_binary '',NULL,_binary '','2023-10-28','2023-10-28',NULL,1,NULL,2,2),(3,_binary '',NULL,_binary '','2023-10-28','2023-10-28',NULL,1,NULL,2,2),(4,_binary '',NULL,_binary '','2023-10-28','2023-10-28',NULL,1,NULL,2,2),(5,_binary '',NULL,_binary '','2023-10-28','2023-10-28',NULL,1,NULL,2,2),(6,_binary '',NULL,_binary '','2023-10-28','2023-10-28',NULL,1,NULL,2,2),(7,_binary '',NULL,_binary '','2023-10-28','2023-10-28',NULL,1,NULL,2,2),(8,_binary '',NULL,_binary '','2023-10-28','2023-10-28',NULL,1,NULL,2,2),(9,_binary '',NULL,_binary '','2023-10-28','2023-10-28',NULL,1,NULL,2,2),(10,_binary '',NULL,_binary '','2023-10-28','2023-10-28',NULL,1,NULL,2,2),(11,_binary '',NULL,_binary '','2023-10-28','2023-10-28',NULL,1,NULL,2,2),(12,_binary '',NULL,_binary '','2023-10-28','2023-10-28',NULL,1,NULL,2,2),(13,_binary '',NULL,_binary '','2023-10-28','2023-10-28',NULL,1,NULL,2,2),(14,_binary '',NULL,_binary '','2023-10-28','2023-10-28',NULL,1,NULL,2,2),(15,_binary '',NULL,_binary '','2023-10-28','2023-10-28',NULL,1,NULL,2,2),(16,_binary '',NULL,_binary '','2023-10-28','2023-10-28',NULL,1,NULL,1,2),(17,_binary '',NULL,_binary '','2023-10-28','2023-10-28',NULL,1,NULL,2,2),(18,_binary '',NULL,_binary '','2023-10-29','2023-10-29',NULL,1,NULL,2,2),(19,_binary '',NULL,_binary '','2023-10-29','2023-10-29',NULL,1,NULL,2,2),(20,_binary '',NULL,_binary '','2023-10-29','2023-10-29',NULL,1,NULL,2,2),(21,_binary '',NULL,_binary '','2023-10-30','2023-10-30',NULL,1,NULL,2,2);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'finalseminario'
--

--
-- Dumping routines for database 'finalseminario'
--
/*!50003 DROP FUNCTION IF EXISTS `funcionTotalCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `funcionTotalCompra`(id_compra int) RETURNS decimal(10,2)
    NO SQL
BEGIN
set @monto=(select sum(monto) from compra_detalle where id_compra=idCompra);
RETURN @monto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `funcionTotalVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `funcionTotalVenta`(id_venta int) RETURNS decimal(10,2)
    NO SQL
BEGIN
set @monto=(select sum(monto) from venta_detalle where id_venta=idVenta);
RETURN @monto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procedimientoTotalCompra` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedimientoTotalCompra`(in idCompra int)
BEGIN
select sum(total) totalFinal from (
select (cantidad*monto) as total from detalle_compra where id_compra=idCompra)tabla;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `procedimientoTotalVenta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedimientoTotalVenta`(in idVenta int)
BEGIN
select sum(total) totalFinal from (
select (cantidad*monto) as total from detalle_venta where id_venta=idVenta)tabla;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-29 18:27:23
