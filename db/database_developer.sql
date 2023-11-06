-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: db_mecanisoft
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `acceso`
--

DROP TABLE IF EXISTS `acceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `acceso` (
  `modulo_codigo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `usuario_id` int NOT NULL,
  `acceso_estado` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`modulo_codigo`,`usuario_id`) USING BTREE,
  KEY `fk_usuario` (`usuario_id`) USING BTREE,
  CONSTRAINT `fk_modulo` FOREIGN KEY (`modulo_codigo`) REFERENCES `modulo` (`modulo_codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acceso`
--

LOCK TABLES `acceso` WRITE;
/*!40000 ALTER TABLE `acceso` DISABLE KEYS */;
INSERT INTO `acceso` VALUES ('1',4,'ACTIVO'),('1',5,'ACTIVO'),('1',34,'ACTIVO'),('1',36,'INACTIVO'),('1-1',4,'INACTIVO'),('1-1',5,'ACTIVO'),('1-1',34,'ACTIVO'),('1-1',36,'ACTIVO'),('1-2',4,'ACTIVO'),('1-2',5,'ACTIVO'),('1-2',34,'ACTIVO'),('1-2',36,'ACTIVO'),('10',4,'ACTIVO'),('10',5,'ACTIVO'),('10',34,'ACTIVO'),('10',36,'ACTIVO'),('10-1',4,'ACTIVO'),('10-1',5,'ACTIVO'),('10-1',34,'ACTIVO'),('10-1',36,'ACTIVO'),('10-2',4,'ACTIVO'),('10-2',5,'ACTIVO'),('10-2',34,'ACTIVO'),('10-3',4,'ACTIVO'),('10-3',5,'ACTIVO'),('10-3',34,'ACTIVO'),('10-4',4,'ACTIVO'),('10-4',5,'ACTIVO'),('10-4',34,'ACTIVO'),('10-5',4,'ACTIVO'),('10-5',5,'ACTIVO'),('10-5',34,'ACTIVO'),('11',4,'ACTIVO'),('11',5,'ACTIVO'),('11',34,'ACTIVO'),('11',36,'ACTIVO'),('11-1',4,'ACTIVO'),('11-1',5,'ACTIVO'),('11-1',34,'ACTIVO'),('11-1',36,'ACTIVO'),('11-2',4,'ACTIVO'),('11-2',5,'ACTIVO'),('11-2',34,'ACTIVO'),('11-3',4,'ACTIVO'),('11-3',5,'ACTIVO'),('11-3',34,'ACTIVO'),('11-4',4,'ACTIVO'),('11-4',5,'ACTIVO'),('11-4',34,'ACTIVO'),('11-5',4,'ACTIVO'),('11-5',5,'ACTIVO'),('11-5',34,'ACTIVO'),('12',4,'ACTIVO'),('12',5,'ACTIVO'),('12',34,'ACTIVO'),('12-1',4,'ACTIVO'),('12-1',5,'ACTIVO'),('12-1',34,'ACTIVO'),('12-1',36,'ACTIVO'),('12-2',4,'ACTIVO'),('12-2',5,'ACTIVO'),('12-2',34,'ACTIVO'),('12-3',4,'ACTIVO'),('12-3',5,'ACTIVO'),('12-3',34,'ACTIVO'),('12-4',4,'ACTIVO'),('12-4',5,'ACTIVO'),('12-4',34,'ACTIVO'),('12-5',5,'ACTIVO'),('12-5',34,'ACTIVO'),('13',5,'ACTIVO'),('13',34,'ACTIVO'),('13-1',5,'ACTIVO'),('13-1',34,'ACTIVO'),('13-10',4,'ACTIVO'),('13-10',5,'ACTIVO'),('13-10',34,'ACTIVO'),('13-11',5,'ACTIVO'),('13-11',34,'ACTIVO'),('13-12',5,'ACTIVO'),('13-12',34,'ACTIVO'),('13-13',4,'ACTIVO'),('13-13',5,'ACTIVO'),('13-13',34,'ACTIVO'),('13-2',5,'ACTIVO'),('13-2',34,'ACTIVO'),('13-3',5,'ACTIVO'),('13-3',34,'ACTIVO'),('13-4',5,'ACTIVO'),('13-4',34,'ACTIVO'),('13-6',4,'ACTIVO'),('13-6',5,'ACTIVO'),('13-6',34,'ACTIVO'),('13-7',4,'ACTIVO'),('13-7',5,'ACTIVO'),('13-7',34,'ACTIVO'),('13-8',5,'ACTIVO'),('13-8',34,'ACTIVO'),('13-9',5,'ACTIVO'),('13-9',34,'ACTIVO'),('14',5,'ACTIVO'),('14',34,'ACTIVO'),('14-1',4,'ACTIVO'),('14-1',5,'ACTIVO'),('14-1',34,'ACTIVO'),('14-2',5,'ACTIVO'),('14-2',34,'ACTIVO'),('14-3',5,'ACTIVO'),('14-3',34,'ACTIVO'),('14-4',5,'ACTIVO'),('14-4',34,'ACTIVO'),('14-5',5,'ACTIVO'),('14-5',34,'ACTIVO'),('14-6',5,'ACTIVO'),('14-6',34,'ACTIVO'),('15',5,'ACTIVO'),('15',34,'ACTIVO'),('15-1',5,'ACTIVO'),('15-1',34,'ACTIVO'),('15-2',5,'ACTIVO'),('15-2',34,'ACTIVO'),('15-3',5,'ACTIVO'),('15-3',34,'ACTIVO'),('16',4,'ACTIVO'),('16',5,'ACTIVO'),('16',34,'ACTIVO'),('16-1',4,'ACTIVO'),('16-1',5,'ACTIVO'),('16-1',34,'ACTIVO'),('16-2',5,'ACTIVO'),('16-2',34,'ACTIVO'),('16-3',5,'ACTIVO'),('16-3',34,'ACTIVO'),('17',5,'ACTIVO'),('17',34,'ACTIVO'),('17-1',5,'ACTIVO'),('17-1',34,'ACTIVO'),('17-2',5,'ACTIVO'),('17-2',34,'ACTIVO'),('18',5,'ACTIVO'),('18',34,'ACTIVO'),('18-1',5,'ACTIVO'),('18-1',34,'ACTIVO'),('18-2',5,'ACTIVO'),('18-2',34,'ACTIVO'),('18-3',5,'ACTIVO'),('18-3',34,'ACTIVO'),('18-4',5,'ACTIVO'),('18-4',34,'ACTIVO'),('18-5',5,'ACTIVO'),('18-5',34,'ACTIVO'),('18-6',5,'ACTIVO'),('18-6',34,'ACTIVO'),('18-7',5,'ACTIVO'),('18-7',34,'ACTIVO'),('18-8',5,'ACTIVO'),('18-8',34,'ACTIVO'),('19',5,'ACTIVO'),('19',34,'ACTIVO'),('19-1',5,'ACTIVO'),('19-1',34,'ACTIVO'),('19-2',5,'ACTIVO'),('19-2',34,'ACTIVO'),('19-3',5,'ACTIVO'),('19-3',34,'ACTIVO'),('19-4',5,'ACTIVO'),('19-4',34,'ACTIVO'),('2',4,'ACTIVO'),('2',5,'ACTIVO'),('2',34,'ACTIVO'),('2',36,'ACTIVO'),('2-1',5,'ACTIVO'),('2-1',34,'ACTIVO'),('2-2',5,'ACTIVO'),('2-2',34,'ACTIVO'),('2-3',5,'ACTIVO'),('2-3',34,'ACTIVO'),('2-4',4,'ACTIVO'),('2-4',5,'ACTIVO'),('2-4',34,'ACTIVO'),('2-4',36,'ACTIVO'),('20',4,'ACTIVO'),('20',5,'ACTIVO'),('20',34,'ACTIVO'),('20-1',5,'ACTIVO'),('20-1',34,'ACTIVO'),('20-2',4,'ACTIVO'),('20-2',5,'ACTIVO'),('20-2',34,'ACTIVO'),('20-2',36,'ACTIVO'),('21',5,'ACTIVO'),('21',34,'ACTIVO'),('22',5,'ACTIVO'),('22',34,'ACTIVO'),('23',5,'ACTIVO'),('23',34,'ACTIVO'),('24',5,'ACTIVO'),('24',34,'ACTIVO'),('24',35,'ACTIVO'),('24',39,'ACTIVO'),('24-1',5,'ACTIVO'),('24-1',34,'ACTIVO'),('24-1',35,'ACTIVO'),('24-2',5,'ACTIVO'),('24-2',34,'ACTIVO'),('24-2',39,'ACTIVO'),('24-3',34,'ACTIVO'),('24-3',39,'ACTIVO'),('3',5,'ACTIVO'),('3',34,'ACTIVO'),('3-1',5,'ACTIVO'),('3-1',34,'ACTIVO'),('3-2',4,'ACTIVO'),('3-2',5,'ACTIVO'),('3-2',34,'ACTIVO'),('3-3',5,'ACTIVO'),('3-3',34,'ACTIVO'),('3-3',36,'ACTIVO'),('4',5,'ACTIVO'),('4',34,'ACTIVO'),('4',36,'ACTIVO'),('4-1',5,'ACTIVO'),('4-1',34,'ACTIVO'),('4-1',36,'ACTIVO'),('4-2',5,'ACTIVO'),('4-2',34,'ACTIVO'),('4-3',5,'ACTIVO'),('4-3',34,'ACTIVO'),('4-4',5,'ACTIVO'),('4-4',34,'ACTIVO'),('4-4',36,'ACTIVO'),('4-5',5,'ACTIVO'),('4-5',34,'ACTIVO'),('4-5',36,'ACTIVO'),('4-6',5,'ACTIVO'),('4-6',34,'ACTIVO'),('5',5,'ACTIVO'),('5',34,'ACTIVO'),('5-1',5,'ACTIVO'),('5-1',34,'ACTIVO'),('5-2',5,'ACTIVO'),('5-2',34,'ACTIVO'),('5-3',5,'ACTIVO'),('5-3',34,'ACTIVO'),('5-4',5,'ACTIVO'),('5-4',34,'ACTIVO'),('6',5,'ACTIVO'),('6',34,'ACTIVO'),('6-1',5,'ACTIVO'),('6-1',34,'ACTIVO'),('6-2',5,'ACTIVO'),('6-2',34,'ACTIVO'),('6-3',5,'ACTIVO'),('6-3',34,'ACTIVO'),('7',5,'ACTIVO'),('7',34,'ACTIVO'),('7-1',5,'ACTIVO'),('7-1',34,'ACTIVO'),('7-2',5,'ACTIVO'),('7-2',34,'ACTIVO'),('7-3',5,'ACTIVO'),('7-3',34,'ACTIVO'),('8',5,'ACTIVO'),('8',34,'ACTIVO'),('8-1',5,'ACTIVO'),('8-1',34,'ACTIVO'),('8-2',5,'ACTIVO'),('8-2',34,'ACTIVO'),('8-3',5,'ACTIVO'),('8-3',34,'ACTIVO'),('9',5,'ACTIVO'),('9',34,'ACTIVO'),('9-1',5,'ACTIVO'),('9-1',34,'ACTIVO'),('9-2',5,'ACTIVO'),('9-2',34,'ACTIVO'),('9-3',5,'ACTIVO'),('9-3',34,'ACTIVO'),('9-4',4,'ACTIVO'),('9-4',5,'ACTIVO'),('9-4',34,'ACTIVO'),('9-5',5,'ACTIVO'),('9-5',34,'ACTIVO');
/*!40000 ALTER TABLE `acceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitacora`
--

DROP TABLE IF EXISTS `bitacora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora` (
  `id_bitacora` int NOT NULL AUTO_INCREMENT,
  `bitacora_accion` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `bitacora_fecha_hora` datetime DEFAULT NULL,
  `bitacora_tabla` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `id_usuario` int DEFAULT NULL,
  `bitacora_descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci,
  `ip_publica` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_bitacora`) USING BTREE,
  KEY `fkey` (`id_usuario`) USING BTREE,
  CONSTRAINT `fkey` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=686 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora`
--

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;
INSERT INTO `bitacora` VALUES (235,'Registrar','2021-11-25 03:23:00','usuario',5,'Se registro usuario','::1'),(236,'Registrar','2021-11-25 03:25:59','proveedor',5,'Se registro un nuevo proveedor','::1'),(253,'Login','2021-11-25 03:28:04','',34,'El usuario inicio sesion','::1'),(254,'Registrar','2021-11-25 03:28:45','proveedor',5,'Se registro un nuevo proveedor','::1'),(255,'Registrar','2021-11-25 03:30:52','proveedor',5,'Se registro un nuevo proveedor','::1'),(256,'Registrar','2021-11-25 03:32:50','usuario',5,'Se registro usuario','::1'),(257,'Registrar','2021-11-25 03:35:46','cliente',5,'Se registro un nuevo cliente(08052001569320)','::1'),(258,'Registrar','2021-11-25 03:37:04','cliente',5,'Se registro un nuevo cliente(080510023569)','::1'),(259,'Login','2021-11-25 03:41:27','',5,'El usuario inicio sesion','170.231.52.142'),(260,'Login','2021-11-25 03:43:21','',34,'El usuario inicio sesion','190.11.236.251'),(261,'Eliminar','2021-11-25 03:47:16','accesos',34,'Se elimino un acceso(1), en el usuario (34)','190.11.236.251'),(262,'Registrar','2021-11-25 03:47:20','accesos',34,'Se registro un acceso(1), en el usuario (34)','190.11.236.251'),(263,'Editar','2021-11-25 03:47:27','accesos',34,'Se edito un acceso(1), en el usuario (34)','190.11.236.251'),(264,'Editar','2021-11-25 03:47:31','accesos',34,'Se edito un acceso(1), en el usuario (34)','190.11.236.251'),(265,'Registrar','2021-11-25 03:51:20','Producto',5,'Se registro un Producto','170.231.52.142'),(266,'Registrar','2021-11-25 03:53:31','Producto',5,'Se registro un Producto','170.231.52.142'),(267,'Registrar','2021-11-25 03:59:59','cliente',34,'Se registro un nuevo cliente(1012198545203)','190.11.236.251'),(268,'Editar','2021-11-25 04:02:15','servicio',34,'Se edito un servicio(29)','190.11.236.251'),(269,'Login','2021-11-25 04:04:37','',34,'El usuario inicio sesion','::1'),(270,'Registrar','2021-11-25 04:07:28','venta',5,'Se registro una nueva venta(243)','170.231.52.142'),(271,'Registrar','2021-11-25 04:11:51','vehiculo',34,'Se registro un nuevo vehiculo','::1'),(272,'Login','2021-11-25 04:11:58','',5,'El usuario inicio sesion','170.231.52.142'),(273,'Registrar','2021-11-25 04:13:34','vehiculo',34,'Se registro un nuevo vehiculo','::1'),(274,'Editar','2021-11-25 04:13:48','vehiculo',34,'Se edito un  vehiculo(12)','::1'),(275,'Editar','2021-11-25 04:13:59','vehiculo',34,'Se edito un  vehiculo(12)','::1'),(276,'Login','2021-11-25 04:16:45','',5,'El usuario inicio sesion','170.231.52.142'),(277,'Login','2021-11-25 04:20:56','',34,'El usuario inicio sesion','190.11.236.251'),(278,'Editar','2021-11-25 04:36:26','servicio',34,'Se edito un servicio(29)','::1'),(279,'Editar','2021-11-25 04:36:33','servicio',34,'Se edito un servicio(29)','::1'),(280,'Login','2021-11-25 04:39:02','',34,'El usuario inicio sesion','::1'),(281,'Editar','2021-11-25 04:39:31','servicio',34,'Se edito un servicio(29)','::1'),(282,'Registrar','2021-11-25 05:05:00','servicio',5,'Se registro una  servicio','170.231.52.142'),(283,'Editar','2021-11-25 05:05:25','servicio',5,'Se edito un servicio(168)','170.231.52.142'),(284,'Registrar','2021-11-25 05:05:51','servicio',34,'Se registro una  servicio','::1'),(285,'Editar','2021-11-25 05:06:14','servicio',34,'Se edito un servicio(170)','::1'),(286,'Editar','2021-11-25 05:09:37','servicio',34,'Se edito un servicio(170)','::1'),(287,'Registrar','2021-11-25 05:17:58','Producto',34,'Se registro un Producto','::1'),(288,'Oferta','2021-11-25 05:18:33','Producto',34,'Se registro una oferta(171)','::1'),(289,'Editar','2021-11-25 05:32:05','accesos',34,'Se edito un acceso(11-1), en el usuario (34)','::1'),(290,'Login','2021-11-25 05:32:14','',34,'El usuario inicio sesion','::1'),(291,'Login','2021-11-25 05:36:27','',5,'El usuario inicio sesion','::1'),(292,'Editar','2021-11-25 05:45:23','accesos',34,'Se edito un acceso(11-1), en el usuario (34)','::1'),(293,'Login','2021-11-25 05:45:35','',34,'El usuario inicio sesion','::1'),(294,'Registrar','2021-11-25 05:50:00','cotizacion',34,'Se registro una nueva cotizacion()','::1'),(295,'Login','2021-11-25 06:01:29','',5,'El usuario inicio sesion','::1'),(296,'Registrar','2021-11-25 06:06:49','Orden',34,'Se registro una nueva orden','::1'),(297,'Editar','2021-11-25 06:13:07','usuario',5,'Se edito password(5)','170.231.52.142'),(298,'Registrar','2021-11-25 06:13:07','Orden',34,'Se registro una nueva orden','::1'),(299,'Login','2021-11-25 06:13:19','',5,'El usuario inicio sesion','170.231.52.142'),(300,'Registrar','2021-11-25 06:13:44','tarea',5,'Se registro una tarea','170.231.52.142'),(301,'Fecha','2021-11-25 06:13:51','tarea',5,'Se cambio la fecha(83)','170.231.52.142'),(302,'Anular','2021-11-25 06:14:41','Orden',34,'Se anulo una  orden(247)','::1'),(303,'Editar','2021-11-25 06:14:55','tarea',5,'Se edito una tarea(83)','170.231.52.142'),(304,'Editar','2021-11-25 06:15:10','tarea',5,'Se edito una tarea(83)','170.231.52.142'),(305,'Registrar','2021-11-25 06:15:29','tarea',34,'Se registro una tarea','::1'),(306,'Registrar','2021-11-25 06:15:29','tarea',5,'Se registro una tarea','170.231.52.142'),(307,'Registrar','2021-11-25 06:16:11','tarea',5,'Se registro una tarea','170.231.52.142'),(308,'Registrar','2021-11-25 06:16:13','tarea',34,'Se registro una tarea','::1'),(309,'Registrar','2021-11-25 06:16:47','tarea',34,'Se registro una tarea','::1'),(310,'Fecha','2021-11-25 06:16:58','tarea',34,'Se cambio la fecha(88)','::1'),(311,'Fecha','2021-11-25 06:17:06','tarea',34,'Se cambio la fecha(88)','::1'),(312,'Registrar','2021-11-25 06:17:56','tarea',34,'Se registro una tarea','::1'),(313,'Fecha','2021-11-25 06:18:23','tarea',34,'Se cambio la fecha(89)','::1'),(314,'Editar','2021-11-25 06:19:47','Orden',34,'Se edito una  orden(246)','::1'),(315,'Login','2021-11-25 06:29:01','',36,'El usuario inicio sesion','::1'),(316,'Registrar','2021-11-25 06:33:11','vehiculo',5,'Se registro un nuevo vehiculo','170.231.52.142'),(317,'Login','2021-11-25 06:33:15','',34,'El usuario inicio sesion','::1'),(318,'Registrar','2021-11-25 06:34:08','accesos',34,'Se registro un acceso(4), en el usuario (36)','::1'),(319,'Registrar','2021-11-25 06:34:23','accesos',34,'Se registro un acceso(4-4), en el usuario (36)','::1'),(320,'Registrar','2021-11-25 06:34:35','Orden',5,'Se registro una nueva orden','170.231.52.142'),(321,'Registrar','2021-11-25 06:34:39','accesos',34,'Se registro un acceso(4-1), en el usuario (36)','::1'),(322,'Registrar','2021-11-25 06:34:50','accesos',34,'Se registro un acceso(4-5), en el usuario (36)','::1'),(323,'Registrar','2021-11-25 06:35:01','accesos',34,'Se registro un acceso(4-2), en el usuario (36)','::1'),(324,'Registrar','2021-11-25 06:35:15','tarea',5,'Se registro una tarea','170.231.52.142'),(325,'Registrar','2021-11-25 06:35:29','tarea',5,'Se registro una tarea','170.231.52.142'),(326,'Login','2021-11-25 06:35:31','',36,'El usuario inicio sesion','::1'),(327,'Fecha','2021-11-25 06:35:34','tarea',5,'Se cambio la fecha(90)','170.231.52.142'),(328,'Registrar','2021-11-25 06:35:43','tarea',5,'Se registro una tarea','170.231.52.142'),(329,'Editar','2021-11-25 06:36:15','tarea',5,'Se edito una tarea(91)','170.231.52.142'),(330,'Login','2021-11-25 06:36:24','',34,'El usuario inicio sesion','::1'),(331,'Eliminar','2021-11-25 06:37:58','accesos',34,'Se elimino un acceso(4-4), en el usuario (36)','::1'),(332,'Eliminar','2021-11-25 06:38:25','accesos',34,'Se elimino un acceso(4-2), en el usuario (36)','::1'),(333,'Login','2021-11-25 06:38:37','',34,'El usuario inicio sesion','::1'),(334,'Editar','2021-11-25 06:39:46','Orden',34,'Se edito una  orden(246)','::1'),(335,'Registrar','2021-11-25 06:40:39','accesos',5,'Se registro un acceso(4), en el usuario (38)','170.231.52.142'),(336,'Registrar','2021-11-25 06:40:49','accesos',5,'Se registro un acceso(4-1), en el usuario (38)','170.231.52.142'),(338,'Fecha','2021-11-25 06:42:17','tarea',34,'Se cambio la fecha(89)','::1'),(339,'Fecha','2021-11-25 06:42:27','tarea',34,'Se cambio la fecha(89)','::1'),(340,'Fecha','2021-11-25 06:42:31','tarea',34,'Se cambio la fecha(89)','::1'),(341,'Fecha','2021-11-25 06:42:37','tarea',34,'Se cambio la fecha(89)','::1'),(342,'Editar','2021-11-25 06:46:54','tarea',34,'Se edito una tarea(89)','::1'),(343,'Editar','2021-11-25 06:48:40','Orden',34,'Se edito una  orden(246)','::1'),(344,'Anular','2021-11-25 06:49:21','Orden',34,'Se anulo una  orden(246)','::1'),(345,'Fecha','2021-11-25 06:54:08','tarea',34,'Se cambio la fecha(90)','::1'),(346,'Registrar','2021-11-25 06:55:54','Orden',34,'Se registro una nueva orden','::1'),(347,'Registrar','2021-11-25 06:56:25','tarea',34,'Se registro una tarea','::1'),(348,'Editar','2021-11-25 06:56:33','tarea',34,'Se edito una tarea(95)','::1'),(349,'Facturar','2021-11-25 06:57:01','Orden',34,'Se facturo una  orden(249)','::1'),(350,'Registrar','2021-11-25 07:44:29','tarea',5,'Se registro una tarea','::1'),(351,'Editar','2021-11-25 07:50:05','tarea',5,'Se edito una tarea(93)','::1'),(352,'Editar','2021-11-25 07:51:29','tarea',5,'Se edito una tarea(93)','::1'),(353,'Fecha','2021-11-25 07:51:58','tarea',5,'Se cambio la fecha(93)','::1'),(354,'Login','2021-11-25 07:52:33','',36,'El usuario inicio sesion','::1'),(355,'Login','2021-11-25 07:53:09','',5,'El usuario inicio sesion','::1'),(356,'Registrar','2021-11-25 07:53:44','accesos',5,'Se registro un acceso(4-4), en el usuario (36)','::1'),(357,'Login','2021-11-25 07:53:58','',36,'El usuario inicio sesion','::1'),(358,'Editar','2021-11-25 07:54:27','tarea',36,'Se edito una tarea(93)','::1'),(359,'Login','2021-11-25 07:55:46','',5,'El usuario inicio sesion','::1'),(360,'Login','2021-11-25 07:58:33','',5,'El usuario inicio sesion','::1'),(361,'Login','2021-11-25 07:59:22','',5,'El usuario inicio sesion','::1'),(362,'Registrar','2021-11-25 07:59:40','accesos',5,'Se registro un acceso(21), en el usuario (5)','::1'),(363,'Registrar','2021-11-25 07:59:41','accesos',5,'Se registro un acceso(22), en el usuario (5)','::1'),(364,'Login','2021-11-25 07:59:58','',5,'El usuario inicio sesion','::1'),(365,'Login','2021-11-25 08:03:47','',5,'El usuario inicio sesion','::1'),(366,'Login','2021-11-25 16:26:26','',5,'El usuario inicio sesion','170.231.52.142'),(367,'Registrar','2021-11-25 16:34:42','Producto',5,'Se registro un Producto','170.231.52.142'),(368,'Registrar','2021-11-25 16:35:35','Producto',5,'Se registro un Producto','170.231.52.142'),(369,'Registrar','2021-11-25 16:36:29','Producto',5,'Se registro un Producto','170.231.52.142'),(370,'Registrar','2021-11-25 16:37:17','Producto',5,'Se registro un Producto','170.231.52.142'),(371,'Registrar','2021-11-25 16:37:59','Producto',5,'Se registro un Producto','170.231.52.142'),(372,'Registrar','2021-11-25 16:40:32','Producto',5,'Se registro un Producto','170.231.52.142'),(373,'Login','2021-11-25 17:02:11','',5,'El usuario inicio sesion','::1'),(374,'Login','2021-11-25 18:58:20','',34,'El usuario inicio sesion','::1'),(375,'Registrar','2021-11-25 19:08:48','Producto',5,'Se registro un Producto','170.231.52.142'),(376,'Registrar','2021-11-25 19:09:19','Producto',5,'Se registro un Producto','170.231.52.142'),(377,'Registrar','2021-11-25 19:18:40','Producto',5,'Se registro un Producto','::1'),(378,'Registrar','2021-11-25 19:26:34','Producto',5,'Se registro un Producto','::1'),(379,'Editar','2021-11-25 19:27:34','Producto',5,'Se edito un Producto(182)','::1'),(380,'Registrar','2021-11-25 19:29:23','Producto',5,'Se registro un Producto','::1'),(381,'Registrar','2021-11-25 19:30:36','Producto',5,'Se registro un Producto','::1'),(382,'Registrar','2021-11-25 19:32:29','Producto',5,'Se registro un Producto','::1'),(383,'Registrar','2021-11-25 19:34:18','Producto',5,'Se registro un Producto','::1'),(384,'Registrar','2021-11-25 19:35:09','Producto',5,'Se registro un Producto','::1'),(385,'Registrar','2021-11-25 19:36:05','Producto',5,'Se registro un Producto','::1'),(386,'Registrar','2021-11-25 19:40:25','Producto',5,'Se registro un Producto','::1'),(387,'Registrar','2021-11-25 19:43:02','Producto',5,'Se registro un Producto','::1'),(388,'Registrar','2021-11-25 19:46:11','Producto',5,'Se registro un Producto','::1'),(389,'Registrar','2021-11-25 19:47:21','Producto',5,'Se registro un Producto','::1'),(390,'Registrar','2021-11-25 19:50:53','servicio',5,'Se registro una  servicio','::1'),(391,'Registrar','2021-11-25 19:52:42','servicio',5,'Se registro una  servicio','::1'),(392,'Registrar','2021-11-25 19:56:04','Producto',5,'Se registro un Producto','::1'),(393,'Registrar','2021-11-25 19:57:24','Producto',5,'Se registro un Producto','::1'),(394,'Registrar','2021-11-25 20:08:51','venta',5,'Se registro una nueva venta(253)','::1'),(395,'Editar','2021-11-25 20:23:35','movimiento',5,'Se edito un  movimiento(256)','170.231.52.142'),(396,'Anular','2021-11-25 20:24:55','movimiento',5,'Se anulo un  movimiento(256)','170.231.52.142'),(397,'Editar','2021-11-25 20:28:16','movimiento',5,'Se edito un  movimiento(257)','170.231.52.142'),(398,'Anular','2021-11-25 20:29:15','movimiento',5,'Se anulo un  movimiento(257)','170.231.52.142'),(399,'Registrar','2021-11-25 20:40:09','venta',5,'Se registro una nueva venta(259)','170.231.52.142'),(400,'Registrar','2021-11-25 20:51:11','venta',5,'Se registro una nueva venta(262)','170.231.52.142'),(401,'Registrar','2021-11-25 20:52:27','venta',5,'Se registro una nueva venta(263)','170.231.52.142'),(402,'Registrar','2021-11-25 20:52:55','venta',5,'Se registro una nueva venta(264)','170.231.52.142'),(403,'Registrar','2021-11-25 20:53:14','venta',5,'Se registro una nueva venta(265)','170.231.52.142'),(404,'Registrar','2021-11-25 20:57:08','vehiculo',5,'Se registro un nuevo vehiculo','170.231.52.142'),(405,'Editar','2021-11-25 20:57:39','vehiculo',5,'Se edito un  vehiculo(14)','170.231.52.142'),(406,'Registrar','2021-11-25 20:59:02','Orden',5,'Se registro una nueva orden','170.231.52.142'),(407,'Editar','2021-11-25 20:59:38','cotizacion',5,'Se edito una cotizacion(245)','170.231.52.142'),(408,'Registrar','2021-11-25 21:03:26','tarea',5,'Se registro una tarea','170.231.52.142'),(409,'Editar','2021-11-25 21:04:15','tarea',5,'Se edito una tarea(97)','170.231.52.142'),(410,'Editar','2021-11-25 21:05:24','tarea',5,'Se edito una tarea(97)','::1'),(411,'Registrar','2021-11-25 21:05:50','tarea',5,'Se registro una tarea','::1'),(412,'Fecha','2021-11-25 21:06:49','tarea',5,'Se cambio la fecha(99)','::1'),(413,'Registrar','2021-11-25 21:07:16','tarea',5,'Se registro una tarea','::1'),(414,'Registrar','2021-11-25 21:07:52','tarea',5,'Se registro una tarea','::1'),(415,'Editar','2021-11-25 21:08:15','tarea',5,'Se edito una tarea(101)','::1'),(416,'Fecha','2021-11-25 21:08:27','tarea',5,'Se cambio la fecha(101)','::1'),(417,'Login','2021-11-25 21:09:58','',5,'El usuario inicio sesion','::1'),(419,'Login','2021-11-25 21:12:12','',5,'El usuario inicio sesion','::1'),(420,'Registrar','2021-11-25 21:12:57','accesos',5,'Se registro un acceso(4), en el usuario (37)','::1'),(421,'Registrar','2021-11-25 21:12:58','accesos',5,'Se registro un acceso(4-1), en el usuario (37)','::1'),(422,'Registrar','2021-11-25 21:13:12','accesos',5,'Se registro un acceso(4-4), en el usuario (37)','::1'),(424,'Login','2021-11-25 21:14:31','',5,'El usuario inicio sesion','::1'),(425,'Registrar','2021-11-25 21:16:04','cliente',5,'Se registro un nuevo cliente(080520014899)','::1'),(426,'Editar','2021-11-25 21:16:30','cliente',5,'Se edito un  cliente(08052001569320)','::1'),(427,'Editar','2021-11-25 21:16:54','cliente',5,'Se edito un  cliente(080510023569)','::1'),(428,'Registrar','2021-11-25 21:17:50','vehiculo',5,'Se registro un nuevo vehiculo','::1'),(429,'Registrar','2021-11-25 21:19:16','Orden',5,'Se registro una nueva orden','::1'),(430,'Registrar','2021-11-25 21:19:47','tarea',5,'Se registro una tarea','::1'),(431,'Fecha','2021-11-25 21:20:10','tarea',5,'Se cambio la fecha(96)','::1'),(432,'Fecha','2021-11-25 21:20:18','tarea',5,'Se cambio la fecha(96)','::1'),(433,'Fecha','2021-11-25 21:20:36','tarea',5,'Se cambio la fecha(98)','::1'),(434,'Fecha','2021-11-25 21:20:43','tarea',5,'Se cambio la fecha(98)','::1'),(435,'Fecha','2021-11-25 21:20:50','tarea',5,'Se cambio la fecha(103)','::1'),(436,'Fecha','2021-11-25 21:20:56','tarea',5,'Se cambio la fecha(103)','::1'),(437,'Login','2021-11-25 21:40:40','',5,'El usuario inicio sesion','::1'),(438,'Login','2021-11-25 21:49:07','',5,'El usuario inicio sesion','::1'),(439,'Login','2021-11-25 21:49:10','',5,'El usuario inicio sesion','::1'),(440,'Login','2021-11-25 21:56:05','',5,'El usuario inicio sesion','127.0.0.1'),(441,'Login','2021-11-25 22:14:30','',5,'El usuario inicio sesion','::1'),(442,'Login','2021-11-25 22:16:52','',34,'El usuario inicio sesion','::1'),(443,'Login','2021-11-25 22:20:07','',5,'El usuario inicio sesion','127.0.0.1'),(444,'Login','2021-11-25 22:20:10','',5,'El usuario inicio sesion','127.0.0.1'),(445,'Login','2021-11-25 22:22:09','',5,'El usuario inicio sesion','127.0.0.1'),(446,'Login','2021-11-25 22:25:22','',5,'El usuario inicio sesion','::1'),(447,'Login','2021-11-25 22:26:23','',34,'El usuario inicio sesion','::1'),(448,'Login','2021-11-25 22:26:24','',34,'El usuario inicio sesion','::1'),(449,'Registrar','2021-11-25 22:43:15','cliente',5,'Se registro un nuevo cliente(080320000020)','::1'),(450,'Registrar','2021-11-25 22:44:27','vehiculo',5,'Se registro un nuevo vehiculo','::1'),(451,'Registrar','2021-11-25 22:46:38','Orden',5,'Se registro una nueva orden','::1'),(452,'Registrar','2021-11-25 22:49:29','accesos',34,'Se registro un acceso(21), en el usuario (34)','::1'),(453,'Registrar','2021-11-25 22:49:34','accesos',34,'Se registro un acceso(22), en el usuario (34)','::1'),(454,'Login','2021-11-25 22:49:49','',34,'El usuario inicio sesion','::1'),(455,'Login','2021-11-25 22:52:23','',34,'El usuario inicio sesion','::1'),(456,'Login','2021-11-25 22:56:38','',5,'El usuario inicio sesion','::1'),(457,'Login','2021-11-25 23:05:43','',5,'El usuario inicio sesion','127.0.0.1'),(458,'Login','2021-11-26 00:02:32','',34,'El usuario inicio sesion','190.11.236.251'),(459,'Login','2021-11-26 00:12:36','',34,'El usuario inicio sesion','190.11.236.251'),(460,'Login','2021-11-26 00:13:27','',5,'El usuario inicio sesion','170.231.52.142'),(461,'Login','2021-11-26 00:16:02','',5,'El usuario inicio sesion','181.189.246.97'),(462,'Registrar','2021-11-26 00:20:52','Producto',5,'Se registro un Producto','181.189.246.97'),(463,'Editar','2021-11-26 00:21:07','Producto',5,'Se edito un Producto(197)','181.189.246.97'),(464,'Registrar','2021-11-26 00:22:39','servicio',5,'Se registro una  servicio','181.189.246.97'),(465,'Editar','2021-11-26 00:23:10','servicio',5,'Se edito un servicio(198)','181.189.246.97'),(466,'Login','2021-11-26 00:30:30','',5,'El usuario inicio sesion','170.231.52.142'),(467,'Login','2021-11-26 00:41:40','',34,'El usuario inicio sesion','190.11.236.251'),(468,'Registrar','2021-11-26 00:48:49','Producto',5,'Se registro un Producto','181.189.246.97'),(469,'Editar','2021-11-26 00:50:17','Producto',5,'Se edito un Producto(199)','181.189.246.97'),(470,'Oferta','2021-11-26 00:50:56','Producto',5,'Se registro una oferta(199)','181.189.246.97'),(471,'Login','2021-11-26 00:57:09','',5,'El usuario inicio sesion','170.231.52.142'),(472,'Registrar','2021-11-26 00:57:59','accesos',34,'Se registro un acceso(1), en el usuario (36)','190.11.236.251'),(473,'Editar','2021-11-26 00:58:07','accesos',34,'Se edito un acceso(1), en el usuario (36)','190.11.236.251'),(474,'Registrar','2021-11-26 01:01:14','cotizacion',34,'Se registro una nueva cotizacion()','190.11.236.251'),(475,'Registrar','2021-11-26 01:05:14','tarea',34,'Se registro una tarea','190.11.236.251'),(476,'Fecha','2021-11-26 01:05:19','tarea',34,'Se cambio la fecha(104)','190.11.236.251'),(477,'Fecha','2021-11-26 01:05:25','tarea',34,'Se cambio la fecha(104)','190.11.236.251'),(478,'Login','2021-11-26 01:06:15','',36,'El usuario inicio sesion','170.231.52.142'),(479,'Editar','2021-11-26 01:06:36','tarea',36,'Se edito una tarea(99)','170.231.52.142'),(480,'Login','2021-11-26 01:07:18','',5,'El usuario inicio sesion','170.231.52.142'),(481,'Login','2021-11-26 01:11:34','',5,'El usuario inicio sesion','170.231.52.142'),(482,'Registrar','2021-11-26 01:13:11','venta',5,'Se registro una nueva venta(273)','170.231.52.142'),(483,'Login','2021-11-26 01:56:06','',34,'El usuario inicio sesion','190.11.236.251'),(484,'Login','2021-11-26 01:56:17','',34,'El usuario inicio sesion','2600:1700:2050:c210:4c92:18d7:e7a9:4059'),(485,'Login','2021-11-26 23:26:03','',5,'El usuario inicio sesion','127.0.0.1'),(486,'Login','2021-11-26 23:26:06','',5,'El usuario inicio sesion','127.0.0.1'),(487,'Login','2021-11-26 23:34:16','',5,'El usuario inicio sesion','181.189.246.97'),(488,'Login','2021-11-27 02:15:57','',5,'El usuario inicio sesion','127.0.0.1'),(489,'Registrar','2021-11-27 02:32:55','cotizacion',34,'Se registro una nueva cotizacion()','::1'),(490,'Login','2021-11-27 02:34:59','',34,'El usuario inicio sesion','::1'),(491,'Login','2021-11-27 02:49:56','',5,'El usuario inicio sesion','::1'),(492,'Registrar','2021-11-27 03:09:39','accesos',5,'Se registro un acceso(1-1), en el usuario (36)','::1'),(493,'Registrar','2021-11-27 03:11:35','accesos',5,'Se registro un acceso(3-1), en el usuario (35)','::1'),(494,'Registrar','2021-11-27 07:21:52','accesos',5,'Se registro un acceso(11-4), en el usuario (35)','::1'),(495,'Registrar','2021-11-27 07:24:27','accesos',5,'Se registro un acceso(1-2), en el usuario (36)','::1'),(496,'Registrar','2021-11-27 07:26:15','accesos',5,'Se registro un acceso(10), en el usuario (36)','::1'),(497,'Registrar','2021-11-27 07:29:22','accesos',5,'Se registro un acceso(1), en el usuario (4)','::1'),(498,'Registrar','2021-11-27 07:29:22','accesos',5,'Se registro un acceso(1-2), en el usuario (4)','::1'),(499,'Registrar','2021-11-27 07:29:22','accesos',5,'Se registro un acceso(10-5), en el usuario (4)','::1'),(500,'Registrar','2021-11-27 07:29:22','accesos',5,'Se registro un acceso(3-2), en el usuario (4)','::1'),(501,'Registrar','2021-11-27 07:30:24','accesos',5,'Se registro un acceso(13-13), en el usuario (4)','::1'),(502,'Registrar','2021-11-27 07:30:24','accesos',5,'Se registro un acceso(13-6), en el usuario (4)','::1'),(503,'Registrar','2021-11-27 07:30:24','accesos',5,'Se registro un acceso(13-7), en el usuario (4)','::1'),(504,'Registrar','2021-11-27 07:32:57','accesos',5,'Se registro un acceso(10), en el usuario (4)','::1'),(505,'Registrar','2021-11-27 07:32:58','accesos',5,'Se registro un acceso(10-1), en el usuario (4)','::1'),(506,'Registrar','2021-11-27 07:32:58','accesos',5,'Se registro un acceso(10-2), en el usuario (4)','::1'),(507,'Registrar','2021-11-27 07:32:58','accesos',5,'Se registro un acceso(10-3), en el usuario (4)','::1'),(508,'Registrar','2021-11-27 07:32:58','accesos',5,'Se registro un acceso(10-4), en el usuario (4)','::1'),(509,'Registrar','2021-11-27 07:32:58','accesos',5,'Se registro un acceso(11), en el usuario (4)','::1'),(510,'Registrar','2021-11-27 07:32:58','accesos',5,'Se registro un acceso(11-1), en el usuario (4)','::1'),(511,'Registrar','2021-11-27 07:32:58','accesos',5,'Se registro un acceso(11-2), en el usuario (4)','::1'),(512,'Registrar','2021-11-27 07:32:58','accesos',5,'Se registro un acceso(11-3), en el usuario (4)','::1'),(513,'Registrar','2021-11-27 07:32:58','accesos',5,'Se registro un acceso(11-4), en el usuario (4)','::1'),(514,'Registrar','2021-11-27 07:32:58','accesos',5,'Se registro un acceso(11-5), en el usuario (4)','::1'),(515,'Registrar','2021-11-27 07:32:58','accesos',5,'Se registro un acceso(12), en el usuario (4)','::1'),(516,'Registrar','2021-11-27 07:32:59','accesos',5,'Se registro un acceso(12-1), en el usuario (4)','::1'),(517,'Registrar','2021-11-27 07:32:59','accesos',5,'Se registro un acceso(12-2), en el usuario (4)','::1'),(518,'Registrar','2021-11-27 07:32:59','accesos',5,'Se registro un acceso(12-3), en el usuario (4)','::1'),(519,'Registrar','2021-11-27 07:33:36','accesos',5,'Se registro un acceso(2), en el usuario (4)','::1'),(520,'Registrar','2021-11-27 07:33:36','accesos',5,'Se registro un acceso(2-4), en el usuario (4)','::1'),(521,'Login','2021-11-27 07:34:21','',5,'El usuario inicio sesion','::1'),(522,'Registrar','2021-11-27 07:35:04','accesos',5,'Se registro un acceso(2), en el usuario (36)','::1'),(523,'Registrar','2021-11-27 07:35:04','accesos',5,'Se registro un acceso(2-4), en el usuario (36)','::1'),(524,'Login','2021-11-27 07:35:19','',36,'El usuario inicio sesion','::1'),(525,'Login','2021-11-27 07:36:37','',5,'El usuario inicio sesion','::1'),(526,'Registrar','2021-11-27 07:49:08','accesos',5,'Se registro un acceso(16-1), en el usuario (4)','::1'),(527,'Registrar','2021-11-27 07:49:34','accesos',5,'Se registro un acceso(13-10), en el usuario (4)','::1'),(528,'Registrar','2021-11-27 07:49:34','accesos',5,'Se registro un acceso(9-4), en el usuario (4)','::1'),(529,'Registrar','2021-11-27 07:52:38','accesos',5,'Se registro un acceso(16), en el usuario (4)','::1'),(530,'Registrar','2021-11-27 07:52:38','accesos',5,'Se registro un acceso(20), en el usuario (4)','::1'),(531,'Registrar','2021-11-27 07:53:09','accesos',5,'Se registro un acceso(12-4), en el usuario (4)','::1'),(532,'Registrar','2021-11-27 07:53:09','accesos',5,'Se registro un acceso(14-1), en el usuario (4)','::1'),(533,'Registrar','2021-11-27 07:53:09','accesos',5,'Se registro un acceso(20-2), en el usuario (4)','::1'),(534,'Login','2021-11-27 07:53:28','',5,'El usuario inicio sesion','::1'),(535,'Eliminar','2021-11-27 07:53:49','accesos',5,'Se elimino un acceso(1), en el usuario (35)','::1'),(536,'Eliminar','2021-11-27 07:54:05','accesos',5,'Se elimino un acceso(3-3), en el usuario (35)','::1'),(537,'Eliminar','2021-11-27 07:54:13','accesos',5,'Se elimino un acceso(3-1), en el usuario (35)','::1'),(538,'Eliminar','2021-11-27 07:54:17','accesos',5,'Se elimino un acceso(20-1), en el usuario (35)','::1'),(539,'Eliminar','2021-11-27 07:54:22','accesos',5,'Se elimino un acceso(20), en el usuario (35)','::1'),(540,'Eliminar','2021-11-27 07:54:25','accesos',5,'Se elimino un acceso(19), en el usuario (35)','::1'),(541,'Eliminar','2021-11-27 07:54:29','accesos',5,'Se elimino un acceso(13-12), en el usuario (35)','::1'),(542,'Eliminar','2021-11-27 07:54:34','accesos',5,'Se elimino un acceso(12-5), en el usuario (35)','::1'),(543,'Eliminar','2021-11-27 07:54:43','accesos',5,'Se elimino un acceso(11-1), en el usuario (35)','::1'),(544,'Eliminar','2021-11-27 07:54:47','accesos',5,'Se elimino un acceso(11-3), en el usuario (35)','::1'),(545,'Eliminar','2021-11-27 07:55:00','accesos',5,'Se elimino un acceso(10-5), en el usuario (35)','::1'),(546,'Eliminar','2021-11-27 07:55:03','accesos',5,'Se elimino un acceso(11-4), en el usuario (35)','::1'),(547,'Eliminar','2021-11-27 07:55:07','accesos',5,'Se elimino un acceso(11-2), en el usuario (35)','::1'),(548,'Login','2021-11-27 16:26:56','',5,'El usuario inicio sesion','181.189.246.97'),(549,'Login','2021-11-27 16:27:40','',34,'El usuario inicio sesion','::1'),(550,'Registrar','2021-11-27 16:28:22','accesos',34,'Se registro un acceso(1), en el usuario (35)','::1'),(551,'Registrar','2021-11-27 16:28:22','accesos',34,'Se registro un acceso(1-1), en el usuario (35)','::1'),(552,'Registrar','2021-11-27 16:28:22','accesos',34,'Se registro un acceso(1-2), en el usuario (35)','::1'),(553,'Registrar','2021-11-27 16:28:22','accesos',34,'Se registro un acceso(10), en el usuario (35)','::1'),(554,'Registrar','2021-11-27 16:28:22','accesos',34,'Se registro un acceso(10-1), en el usuario (35)','::1'),(555,'Registrar','2021-11-27 16:28:23','accesos',34,'Se registro un acceso(10-2), en el usuario (35)','::1'),(556,'Registrar','2021-11-27 16:28:23','accesos',34,'Se registro un acceso(10-3), en el usuario (35)','::1'),(557,'Registrar','2021-11-27 16:28:23','accesos',34,'Se registro un acceso(10-4), en el usuario (35)','::1'),(558,'Eliminar','2021-11-27 16:28:29','accesos',34,'Se elimino un acceso(1), en el usuario (35)','::1'),(559,'Eliminar','2021-11-27 16:28:32','accesos',34,'Se elimino un acceso(1-1), en el usuario (35)','::1'),(560,'Eliminar','2021-11-27 16:28:37','accesos',34,'Se elimino un acceso(1-2), en el usuario (35)','::1'),(561,'Eliminar','2021-11-27 16:28:43','accesos',34,'Se elimino un acceso(10), en el usuario (35)','::1'),(562,'Eliminar','2021-11-27 16:28:46','accesos',34,'Se elimino un acceso(10-1), en el usuario (35)','::1'),(563,'Eliminar','2021-11-27 16:28:50','accesos',34,'Se elimino un acceso(10-2), en el usuario (35)','::1'),(564,'Eliminar','2021-11-27 16:28:53','accesos',34,'Se elimino un acceso(10-3), en el usuario (35)','::1'),(565,'Eliminar','2021-11-27 16:28:59','accesos',34,'Se elimino un acceso(10-4), en el usuario (35)','::1'),(566,'Registrar','2021-11-27 16:35:55','accesos',34,'Se registro un acceso(23), en el usuario (34)','::1'),(567,'Login','2021-11-27 16:36:07','',34,'El usuario inicio sesion','::1'),(568,'Login','2021-11-27 16:38:37','',5,'El usuario inicio sesion','127.0.0.1'),(569,'Login','2021-11-27 16:38:41','',5,'El usuario inicio sesion','127.0.0.1'),(570,'Editar','2021-11-27 17:21:00','Producto',5,'Se edito un Producto(172)','127.0.0.1'),(571,'Login','2021-11-27 17:25:04','',5,'El usuario inicio sesion','::1'),(572,'Login','2021-11-27 17:26:27','',5,'El usuario inicio sesion','::1'),(573,'Login','2021-11-27 17:28:21','',5,'El usuario inicio sesion','::1'),(574,'Login','2021-11-27 17:28:24','',5,'El usuario inicio sesion','::1'),(575,'Login','2021-11-27 17:28:28','',5,'El usuario inicio sesion','::1'),(576,'Registrar','2021-11-27 17:28:58','accesos',5,'Se registro un acceso(23), en el usuario (5)','::1'),(577,'Registrar','2021-11-27 17:28:58','accesos',5,'Se registro un acceso(24), en el usuario (5)','::1'),(578,'Registrar','2021-11-27 17:28:58','accesos',5,'Se registro un acceso(24-1), en el usuario (5)','::1'),(579,'Registrar','2021-11-27 17:28:58','accesos',5,'Se registro un acceso(24-2), en el usuario (5)','::1'),(580,'Login','2021-11-27 17:29:12','',5,'El usuario inicio sesion','::1'),(581,'Login','2021-11-27 21:15:41','',5,'El usuario inicio sesion','181.189.246.97'),(582,'Login','2021-11-28 22:43:56','',5,'El usuario inicio sesion','127.0.0.1'),(583,'Login','2021-11-28 22:43:57','',5,'El usuario inicio sesion','127.0.0.1'),(584,'Login','2021-11-28 22:44:01','',5,'El usuario inicio sesion','127.0.0.1'),(585,'Editar','2021-11-28 22:45:26','Producto',5,'Se edito un Producto(148)','127.0.0.1'),(586,'Editar','2021-11-28 22:56:46','Producto',5,'Se edito un Producto(148)','127.0.0.1'),(587,'Editar','2021-11-28 23:05:48','servicio',5,'Se edito un servicio(29)','127.0.0.1'),(588,'Editar','2021-11-28 23:06:12','servicio',5,'Se edito un servicio(29)','127.0.0.1'),(589,'Login','2021-11-28 23:18:31','',5,'El usuario inicio sesion','127.0.0.1'),(590,'Registrar','2021-11-28 23:20:14','usuario',5,'Se registro usuario','127.0.0.1'),(591,'Login','2021-11-29 01:25:00','',34,'El usuario inicio sesion','::1'),(592,'Login','2021-11-29 01:27:51','',34,'El usuario inicio sesion','::1'),(593,'Login','2021-11-29 01:29:57','',34,'El usuario inicio sesion','::1'),(594,'Login','2021-11-29 02:18:26','',34,'El usuario inicio sesion','::1'),(595,'Login','2021-11-29 02:56:50','',34,'El usuario inicio sesion','::1'),(596,'Login','2021-11-29 03:00:26','',34,'El usuario inicio sesion','::1'),(597,'Registrar','2021-11-29 03:01:10','accesos',34,'Se registro un acceso(24), en el usuario (34)','::1'),(598,'Registrar','2021-11-29 03:01:10','accesos',34,'Se registro un acceso(24-1), en el usuario (34)','::1'),(599,'Registrar','2021-11-29 03:01:11','accesos',34,'Se registro un acceso(24-2), en el usuario (34)','::1'),(600,'Registrar','2021-11-29 03:01:11','accesos',34,'Se registro un acceso(24-3), en el usuario (34)','::1'),(601,'Login','2021-11-29 03:01:18','',34,'El usuario inicio sesion','::1'),(602,'Login','2021-11-29 03:04:38','',5,'El usuario inicio sesion','127.0.0.1'),(603,'Eliminar','2021-11-29 03:12:04','accesos',5,'Se elimino un acceso(24), en el usuario (39)','127.0.0.1'),(604,'Eliminar','2021-11-29 03:12:09','accesos',5,'Se elimino un acceso(24-1), en el usuario (39)','127.0.0.1'),(605,'Eliminar','2021-11-29 03:12:15','accesos',5,'Se elimino un acceso(24-2), en el usuario (39)','127.0.0.1'),(606,'Login','2021-11-29 03:15:34','',5,'El usuario inicio sesion','127.0.0.1'),(607,'Login','2021-11-29 03:15:36','',5,'El usuario inicio sesion','127.0.0.1'),(608,'Login','2021-11-29 03:16:38','',5,'El usuario inicio sesion','127.0.0.1'),(609,'Login','2021-11-29 03:16:42','',5,'El usuario inicio sesion','127.0.0.1'),(610,'Login','2021-11-29 03:17:49','',5,'El usuario inicio sesion','127.0.0.1'),(611,'Login','2021-11-29 03:19:14','',39,'El usuario inicio sesion','127.0.0.1'),(612,'Login','2021-11-29 03:19:17','',39,'El usuario inicio sesion','127.0.0.1'),(613,'Login','2021-11-29 03:19:50','',5,'El usuario inicio sesion','127.0.0.1'),(614,'Registrar','2021-11-29 03:22:24','accesos',5,'Se registro un acceso(24), en el usuario (39)','127.0.0.1'),(615,'Login','2021-11-29 03:22:51','',39,'El usuario inicio sesion','127.0.0.1'),(616,'Registrar','2021-11-29 03:24:01','accesos',34,'Se registro un acceso(24-2), en el usuario (39)','::1'),(617,'Registrar','2021-11-29 03:24:01','accesos',34,'Se registro un acceso(24-3), en el usuario (39)','::1'),(618,'Login','2021-11-29 03:24:17','',39,'El usuario inicio sesion','127.0.0.1'),(619,'Login','2021-11-29 03:24:20','',39,'El usuario inicio sesion','127.0.0.1'),(620,'Login','2021-11-29 03:25:11','',5,'El usuario inicio sesion','127.0.0.1'),(621,'Login','2021-11-29 03:28:44','',5,'El usuario inicio sesion','127.0.0.1'),(622,'Login','2021-11-29 03:38:29','',34,'El usuario inicio sesion','::1'),(623,'Registrar','2021-11-29 03:39:40','cotizacion',34,'Se registro una nueva cotizacion()','::1'),(624,'Registrar','2021-11-29 03:40:59','Orden',34,'Se registro una nueva orden','::1'),(625,'Registrar','2021-11-29 03:41:51','tarea',34,'Se registro una tarea','::1'),(626,'Editar','2021-11-29 03:42:02','tarea',34,'Se edito una tarea(106)','::1'),(627,'Editar','2021-11-29 03:42:10','tarea',34,'Se edito una tarea(105)','::1'),(628,'Facturar','2021-11-29 03:43:12','Orden',34,'Se facturo una  orden(276)','::1'),(629,'Login','2021-11-29 13:01:19','',5,'El usuario inicio sesion','::1'),(630,'Editar','2021-11-29 13:26:16','proveedor',5,'Se edito  un  proveedor(10)','::1'),(631,'Editar','2021-11-29 13:26:21','proveedor',5,'Se edito  un  proveedor(10)','::1'),(632,'Editar','2021-11-29 13:26:39','proveedor',5,'Se edito  un  proveedor(10)','::1'),(633,'Registrar','2021-11-29 13:28:03','proveedor',5,'Se registro un nuevo proveedor','::1'),(634,'Editar','2021-11-29 13:28:16','proveedor',5,'Se edito  un  proveedor(13)','::1'),(635,'Registrar','2021-11-29 13:31:22','proveedor',5,'Se registro un nuevo proveedor','::1'),(636,'Editar','2021-11-29 13:31:53','proveedor',5,'Se edito  un  proveedor(11)','::1'),(637,'Registrar','2021-11-29 13:41:57','cliente',5,'Se registro un nuevo cliente(08011999000256)','::1'),(638,'Registrar','2021-11-29 13:43:18','cliente',5,'Se registro un nuevo cliente(080520001000656)','::1'),(639,'Registrar','2021-11-29 13:45:04','venta',5,'Se registro una nueva venta(279)','::1'),(640,'Registrar','2021-11-29 13:46:17','tarea',5,'Se registro una tarea','::1'),(641,'Fecha','2021-11-29 13:46:23','tarea',5,'Se cambio la fecha(107)','::1'),(642,'Registrar','2021-11-29 13:46:52','servicio',5,'Se registro una  servicio','::1'),(643,'Login','2021-11-29 17:47:11','',34,'El usuario inicio sesion','190.11.236.251'),(644,'Login','2021-11-29 17:47:11','',34,'El usuario inicio sesion','190.11.236.251'),(645,'Login','2021-11-29 17:49:38','',34,'El usuario inicio sesion','190.11.236.251'),(646,'Eliminar','2021-11-29 17:50:32','accesos',34,'Se elimino un acceso(24), en el usuario (34)','190.11.236.251'),(647,'Login','2021-11-29 19:09:50','',5,'El usuario inicio sesion','127.0.0.1'),(648,'Login','2021-11-29 19:09:53','',5,'El usuario inicio sesion','127.0.0.1'),(649,'Login','2021-11-29 20:48:08','',5,'El usuario inicio sesion','127.0.0.1'),(650,'Login','2021-11-29 20:53:21','',5,'El usuario inicio sesion','181.189.246.97'),(651,'Editar','2021-11-29 20:53:52','servicio',5,'Se edito un servicio(29)','181.189.246.97'),(652,'Editar','2021-11-29 20:57:13','servicio',5,'Se edito un servicio(29)','127.0.0.1'),(653,'Registrar','2021-11-29 20:58:50','servicio',5,'Se registro una  servicio','127.0.0.1'),(654,'Login','2021-11-29 20:59:50','',34,'El usuario inicio sesion','190.11.236.251'),(655,'Editar','2021-11-29 21:00:43','Producto',5,'Se edito un Producto(148)','127.0.0.1'),(656,'Editar','2021-11-29 21:01:05','Producto',5,'Se edito un Producto(148)','127.0.0.1'),(657,'Editar','2021-11-29 21:01:07','Producto',5,'Se edito un Producto(148)','127.0.0.1'),(658,'Login','2021-11-29 21:01:32','',34,'El usuario inicio sesion','190.11.236.251'),(659,'Editar','2021-11-29 21:03:57','Producto',5,'Se edito un Producto(148)','127.0.0.1'),(660,'Editar','2021-11-29 21:04:22','servicio',34,'Se edito un servicio(29)','190.11.236.251'),(661,'Login','2021-11-29 21:12:06','',5,'El usuario inicio sesion','181.189.246.97'),(662,'Editar','2021-11-29 21:12:24','servicio',5,'Se edito un servicio(29)','181.189.246.97'),(663,'Editar','2021-11-29 21:27:10','cliente',34,'Se edito un  cliente(080520001000656)','190.11.236.251'),(664,'Editar','2021-11-29 21:36:25','Producto',34,'Se edito un Producto(148)','190.11.236.251'),(665,'Registrar','2021-11-29 21:37:24','cotizacion',5,'Se registro una nueva cotizacion()','181.189.246.97'),(666,'Registrar','2021-11-29 21:37:36','accesos',34,'Se registro un acceso(24), en el usuario (34)','190.11.236.251'),(667,'Login','2021-11-29 21:37:45','',34,'El usuario inicio sesion','190.11.236.251'),(668,'Editar','2021-11-29 21:46:08','cotizacion',34,'Se edito una cotizacion(280)','190.11.236.251'),(669,'Login','2021-11-29 21:54:49','',5,'El usuario inicio sesion','170.231.52.142'),(670,'Login','2021-11-29 22:03:30','',5,'El usuario inicio sesion','::1'),(671,'Login','2021-11-29 22:03:30','',34,'El usuario inicio sesion','::1'),(672,'Login','2021-11-29 22:04:29','',5,'El usuario inicio sesion','170.231.52.142'),(673,'Editar','2021-11-29 22:05:06','usuario',34,'Se edito usuario(34)','190.11.236.251'),(674,'Editar','2021-11-29 22:05:13','usuario',34,'Se edito usuario(34)','190.11.236.251'),(675,'Fecha','2021-11-29 22:08:20','tarea',5,'Se cambio la fecha(102)','170.231.52.142'),(676,'Editar','2021-11-29 22:13:16','Producto',5,'Se edito un Producto(172)','181.189.246.97'),(677,'Login','2021-11-29 22:18:22','',34,'El usuario inicio sesion','190.11.236.251'),(678,'Login','2021-11-29 22:21:48','',34,'El usuario inicio sesion','190.11.236.251'),(679,'Login','2021-11-29 22:42:02','',5,'El usuario inicio sesion','181.189.246.97'),(680,'Login','2021-11-29 22:50:50','',5,'El usuario inicio sesion','170.231.52.142'),(681,'Registrar','2021-11-29 23:07:01','vehiculo',34,'Se registro un nuevo vehiculo','190.11.236.251'),(682,'Registrar','2021-11-29 23:07:07','vehiculo',34,'Se registro un nuevo vehiculo','190.11.236.251'),(683,'Login','2023-11-05 18:03:42','',5,'El usuario inicio sesion','127.0.0.1'),(684,'Login','2023-11-05 22:57:21','',5,'El usuario inicio sesion','127.0.0.1'),(685,'Login','2023-11-05 23:00:28','',5,'El usuario inicio sesion','127.0.0.1');
/*!40000 ALTER TABLE `bitacora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bitacora_marca`
--

DROP TABLE IF EXISTS `bitacora_marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bitacora_marca` (
  `id_bitacora` int NOT NULL AUTO_INCREMENT,
  `accion` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci,
  PRIMARY KEY (`id_bitacora`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bitacora_marca`
--

LOCK TABLES `bitacora_marca` WRITE;
/*!40000 ALTER TABLE `bitacora_marca` DISABLE KEYS */;
INSERT INTO `bitacora_marca` VALUES (26,'EDITAR','2021-11-25 03:38:25','El usuario con id: 34 edito datos de la marca Toyota - 7'),(27,'EDITAR','2021-11-25 03:38:49','El usuario con id: 34 edito datos de la marca Toyota - 7'),(28,'EDITAR','2021-11-25 03:49:34','El usuario con id: 34 edito datos de la marca Lada - 24'),(29,'EDITAR','2021-11-29 21:48:17','El usuario con id: 5 edito datos de la marca  - 7');
/*!40000 ALTER TABLE `bitacora_marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `categoria_id` int NOT NULL AUTO_INCREMENT,
  `categoria_nombre` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `categoria_fregistro` date DEFAULT NULL,
  `categoria_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`categoria_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Nuevo','2021-09-26','ACTIVO'),(2,'Accesorios','2021-09-26','ACTIVO'),(4,'Telecomunicaciones','2021-10-08','INACTIVO'),(5,'Balanceo','2021-10-08','ACTIVO'),(8,'Admisión y escape','2021-11-15','ACTIVO'),(9,'Motor','2021-11-15','ACTIVO'),(10,'Generalidades','2021-11-15','ACTIVO'),(11,'Combustible','2021-11-15','ACTIVO'),(12,'Lubricación de motor','2021-11-15','ACTIVO'),(13,'Sistema de refrigeración de motor ','2021-11-15','ACTIVO'),(14,'Electricidad','2021-11-15','INACTIVO'),(15,'Mantenimiento','2021-11-24','ACTIVO');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cliente_id` int NOT NULL AUTO_INCREMENT,
  `cliente_fregistro` date DEFAULT NULL,
  `cliente_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `persona_id` int DEFAULT NULL,
  PRIMARY KEY (`cliente_id`) USING BTREE,
  KEY `FK_CLIENTE_PERSONA` (`persona_id`) USING BTREE,
  CONSTRAINT `FK_CLIENTE_PERSONA` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`persona_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (23,'2021-11-25','ACTIVO',57),(24,'2021-11-25','ACTIVO',58),(25,'2021-11-25','ACTIVO',59),(26,'2021-11-25','ACTIVO',60),(27,'2021-11-25','ACTIVO',61),(28,'2021-11-29','ACTIVO',65),(29,'2021-11-29','ACTIVO',66);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracion`
--

DROP TABLE IF EXISTS `configuracion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `configuracion` (
  `conf_id` int NOT NULL AUTO_INCREMENT,
  `conf_nombre_empresa` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `conf_direccion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `conf_telefono` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `conf_celular` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `conf_rtn` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `conf_correo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `conf_img_logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `conf_isv` decimal(2,2) DEFAULT NULL,
  `conf_cai` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `conf_fact_fechalimite_emision` date DEFAULT NULL,
  `conf_cantidad_fact` int DEFAULT NULL,
  `conf_numero_inicial` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `conf_numero_final` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `conf_preciodolar` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`conf_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracion`
--

LOCK TABLES `configuracion` WRITE;
/*!40000 ALTER TABLE `configuracion` DISABLE KEYS */;
INSERT INTO `configuracion` VALUES (8,'MecaniSoft','Blvd. Morazán, Tegucigalpa Contiguo a Banco Atlantida','2204-5620','98786588','080360005258','tallerautomotriz905@gmail.com','img/EMP25112021121233.jpg',0.15,'A5128E-9D1T85-K2546A6-8506GE-9FF952-3B','2022-06-15',7000,'000-001-00065001','000-001-00072001',24.10);
/*!40000 ALTER TABLE `configuracion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_transaccion`
--

DROP TABLE IF EXISTS `detalle_transaccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_transaccion` (
  `detalletransaccion_id` int NOT NULL AUTO_INCREMENT,
  `transaccion_id` int NOT NULL,
  `detalletransaccion_cantidad` int DEFAULT NULL,
  `detalletransaccion_precio` decimal(10,2) DEFAULT NULL,
  `detalletransaccion_descuento` decimal(10,2) DEFAULT NULL,
  `detalletransaccion_nombrepro` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `producto_id` int NOT NULL,
  `detalletransaccion_estatus` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`detalletransaccion_id`) USING BTREE,
  KEY `transaccion_id` (`transaccion_id`) USING BTREE,
  CONSTRAINT `fk` FOREIGN KEY (`transaccion_id`) REFERENCES `transacciones` (`transaccion_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=839 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_transaccion`
--

LOCK TABLES `detalle_transaccion` WRITE;
/*!40000 ALTER TABLE `detalle_transaccion` DISABLE KEYS */;
INSERT INTO `detalle_transaccion` VALUES (703,242,15,5200.70,0.00,'Computadora Automotriz para Acura CSX',148,'INGRESADO'),(704,242,25,350.50,0.00,'Aceite Motul 3/4',147,'INGRESADO'),(705,243,1,5200.70,0.00,'Computadora Automotriz para Acura CSX',148,'FACTURADO'),(706,243,2,350.50,0.00,'Aceite Motul 3/4',147,'FACTURADO'),(707,244,20,7.00,0.00,'Balinera 3mm bolsa',171,'INGRESADO'),(709,246,1,750.60,0.00,'Revisión de la distribución del encendido',60,'ORDEN ANULADA'),(710,247,1,360.00,36.00,'Cambio de Luces',29,'ORDEN ANULADA'),(711,248,1,750.60,0.00,'Revisión de la distribución del encendido',60,'ORDENADO'),(712,248,1,450.50,0.00,'Revisión de culata de cilindros',59,'ORDENADO'),(713,248,1,1300.25,0.00,'Reparación de culata de cilindros',58,'ORDENADO'),(714,248,1,900.50,0.00,'Reemplazo de tensor',57,'ORDENADO'),(715,248,1,4500.25,0.00,'Reemplazo de sello',56,'ORDENADO'),(716,248,1,80.20,0.00,'Reemplazo de polea',55,'ORDENADO'),(717,248,1,900.50,0.00,'Reemplazo fluido refrigerante',88,'ORDENADO'),(718,246,3,7.00,1.05,'Balinera 3mm bolsa',171,'ORDEN ANULADA'),(719,249,1,360.00,36.00,'Cambio de Luces',29,'ORDEN FACTURADA'),(720,250,5,870.50,0.00,'Bomba de Agua Cruze Tracker Sonic',172,'ANULADO'),(721,250,10,600.00,0.00,'Carcasa Termostato Renault CLIO21',173,'ANULADO'),(722,250,10,8600.00,0.00,'Barra E. Tacoma/Prerunner',182,'ANULADO'),(723,250,15,1350.00,0.00,'Camisa de motor 1815',177,'ANULADO'),(724,250,5,194.50,0.00,'Filtro C-Santa Fe 2.2',196,'ANULADO'),(725,250,8,300.00,0.00,'Filtro C-111M',195,'ANULADO'),(726,251,10,290.50,0.00,'Aceite SAE 20w40 Marca ESSO',175,'INGRESADO'),(727,251,15,370.00,0.00,'Deposito o frasco de agua R058',174,'INGRESADO'),(728,251,20,600.00,0.00,'Carcasa Termostato Renault CLIO21',173,'INGRESADO'),(729,251,25,870.50,0.00,'Bomba de Agua Cruze Tracker Sonic',172,'INGRESADO'),(730,251,30,5200.70,0.00,'Computadora Automotriz para Acura CSX',148,'INGRESADO'),(731,251,15,1100.50,0.00,'Amoritguadores Gabriel 34-87',176,'INGRESADO'),(732,251,8,780.25,0.00,'Balinera Sentra 98',179,'INGRESADO'),(733,251,12,1350.00,0.00,'Camisa de motor 1815',177,'INGRESADO'),(734,251,5,194.50,0.00,'Filtro C-Santa Fe 2.2',196,'INGRESADO'),(735,252,5,4300.20,0.00,'Propulsor TD27 4x2 98',180,'AJUSTE ANULADO'),(736,253,1,4300.20,0.00,'Propulsor TD27 4x2 98',180,'FACTURADO'),(737,254,5,4300.20,0.00,'Propulsor TD27 4x2 98',180,'INGRESADO'),(742,256,1,0.00,0.00,'Computadora Automotriz para Acura CSX',148,'MOVIMIENTO ANULADO'),(743,256,1,0.00,0.00,'Bomba de Agua Cruze Tracker Sonic',172,'MOVIMIENTO'),(746,257,3,0.00,0.00,'Carcasa Termostato Renault CLIO21',173,'MOVIMIENTO ANULADO'),(747,257,4,0.00,0.00,'Deposito o frasco de agua R058',174,'MOVIMIENTO ANULADO'),(748,258,3,0.00,0.00,'Carcasa Termostato Renault CLIO21',173,'MOVIMIENTO'),(749,258,2,0.00,0.00,'Deposito o frasco de agua R058',174,'MOVIMIENTO'),(750,259,4,1100.50,0.00,'Amoritguadores Gabriel 34-87',176,'FACTURADO'),(751,259,3,290.50,0.00,'Aceite SAE 20w40 Marca ESSO',175,'FACTURADO'),(752,259,2,370.00,0.00,'Deposito o frasco de agua R058',174,'FACTURADO'),(753,260,10,8600.00,0.00,'Barra E. Tacoma/Prerunner',182,'INGRESADO'),(754,260,12,2500.25,0.00,'Barra Pick-Up D22',181,'INGRESADO'),(755,260,20,4600.20,0.00,'Bomba T.HIDR Santa Fe',183,'INGRESADO'),(756,260,25,1900.25,0.00,'Bomba T.HDIR Elantra IX30',184,'INGRESADO'),(757,260,25,5800.25,0.00,'Brazo Trooper USB25',185,'INGRESADO'),(758,261,10,850.25,0.00,'Anillos 1ZZ 3&quot;SV 79M',186,'INGRESADO'),(759,261,15,3750.00,0.00,'Bal. Centro Coaster 1.35G',187,'INGRESADO'),(760,261,40,7900.25,0.00,'Culata Coaster 325G',188,'INGRESADO'),(761,261,5,431.25,0.00,'Banda ALT.1ZZ Corolla 97',189,'INGRESADO'),(762,261,10,370.25,0.00,'Botadores 1HZ/22R/-2L Hilux Modificado',190,'INGRESADO'),(763,261,15,2300.25,0.00,'Camisa 93.00M/M 4JA1',192,'INGRESADO'),(764,262,3,7.00,3.15,'Balinera 3mm bolsa',171,'FACTURADO'),(765,262,3,350.50,0.00,'Aceite Motul 3/4',147,'FACTURADO'),(766,262,2,1350.00,0.00,'Camisa de motor 1815',177,'FACTURADO'),(767,262,1,194.50,0.00,'Filtro C-Santa Fe 2.2',196,'FACTURADO'),(768,263,2,431.25,0.00,'Banda ALT.1ZZ Corolla 97',189,'FACTURADO'),(769,263,2,7900.25,0.00,'Culata Coaster 325G',188,'FACTURADO'),(770,263,3,3750.00,0.00,'Bal. Centro Coaster 1.35G',187,'FACTURADO'),(771,263,3,850.25,0.00,'Anillos 1ZZ 3&quot;SV 79M',186,'FACTURADO'),(772,263,1,5800.25,0.00,'Brazo Trooper USB25',185,'FACTURADO'),(773,263,1,1900.25,0.00,'Bomba T.HDIR Elantra IX30',184,'FACTURADO'),(774,264,3,600.00,0.00,'Carcasa Termostato Renault CLIO21',173,'FACTURADO'),(775,264,1,870.50,0.00,'Bomba de Agua Cruze Tracker Sonic',172,'FACTURADO'),(776,264,2,5200.70,0.00,'Computadora Automotriz para Acura CSX',148,'FACTURADO'),(777,265,2,370.00,0.00,'Deposito o frasco de agua R058',174,'FACTURADO'),(778,265,1,600.00,0.00,'Carcasa Termostato Renault CLIO21',173,'FACTURADO'),(779,266,1,2250.50,0.00,'Reemplazo de ducto de combustible',72,'ORDENADO'),(780,266,1,550.20,0.00,'Reemplazo de bomba de combustible',71,'ORDENADO'),(781,266,1,1500.00,0.00,'Cambio de Pistones',178,'ORDENADO'),(782,266,1,1300.25,0.00,'Reparación de culata de cilindros',58,'ORDENADO'),(783,266,1,4500.25,0.00,'Reemplazo de sello',56,'ORDENADO'),(784,245,4,7.00,1.05,'Balinera 3mm bolsa',171,'COTIZADO'),(785,267,1,1300.25,0.00,'Revisión general',47,'ORDENADO'),(786,267,1,1300.50,0.00,'Cambio de Buje',193,'ORDENADO'),(787,267,1,3600.05,0.00,'Reemplazo lubricante motor',64,'ORDENADO'),(788,267,1,260.32,0.00,'Reemplazo filtro lubricante motor',65,'ORDENADO'),(789,267,1,80.20,0.00,'Reemplazo de sensor de presión de lubricante motor',66,'ORDENADO'),(790,268,1,750.60,0.00,'Reemplazo de depósito de fluido refrigerante',80,'ORDENADO'),(791,268,1,450.50,0.00,'Reemplazo de correa de bomba de fluido refrigerante',79,'ORDENADO'),(792,268,1,1300.25,0.00,'Reemplazo de bomba de fluido refrigerante',78,'ORDENADO'),(793,268,1,900.50,0.00,'Inspección nivel fluido refrigerante',77,'ORDENADO'),(794,268,1,80.20,0.00,'Reemplazo de termostato',86,'ORDENADO'),(795,268,1,4500.25,0.00,'Reparación de intercambiador de calor',87,'ORDENADO'),(796,269,1,5200.70,0.00,'Computadora Automotriz para Acura CSX',148,'COTIZADO'),(797,269,1,870.50,0.00,'Bomba de Agua Cruze Tracker Sonic',172,'COTIZADO'),(798,269,1,600.00,0.00,'Carcasa Termostato Renault CLIO21',173,'COTIZADO'),(799,269,1,370.00,0.00,'Deposito o frasco de agua R058',174,'COTIZADO'),(800,269,1,290.50,0.00,'Aceite SAE 20w40 Marca ESSO',175,'COTIZADO'),(801,269,1,360.00,36.00,'Cambio de Luces',29,'COTIZADO'),(802,269,1,150.00,22.50,'Cambio de Aceite+',26,'COTIZADO'),(803,270,2,780.25,0.00,'Balinera Sentra 98',179,'INGRESADO'),(804,270,2,1100.50,0.00,'Amoritguadores Gabriel 34-87',176,'INGRESADO'),(805,270,3,5200.70,0.00,'Computadora Automotriz para Acura CSX',148,'INGRESADO'),(806,271,4,870.50,0.00,'Bomba de Agua Cruze Tracker Sonic',172,'AJUSTE ANULADO'),(807,272,4,870.50,0.00,'Bomba de Agua Cruze Tracker Sonic',172,'INGRESADO'),(808,273,3,5200.70,0.00,'Computadora Automotriz para Acura CSX',148,'FACTURADO'),(809,273,3,870.50,0.00,'Bomba de Agua Cruze Tracker Sonic',172,'FACTURADO'),(810,273,2,600.00,0.00,'Carcasa Termostato Renault CLIO21',173,'FACTURADO'),(811,273,1,370.00,0.00,'Deposito o frasco de agua R058',174,'FACTURADO'),(812,274,9,370.00,0.00,'Deposito o frasco de agua R058',174,'COTIZADO'),(813,275,9,370.00,0.00,'Deposito o frasco de agua R058',174,'COTIZADO'),(814,276,7,290.50,0.00,'Aceite SAE 20w40 Marca ESSO',175,'ORDEN FACTURADA'),(815,276,1,380.00,38.00,'Cambio de Luces+',29,'ORDEN FACTURADA'),(816,276,1,150.00,22.50,'Cambio de Aceite+',26,'ORDEN FACTURADA'),(817,277,10,290.50,0.00,'Aceite SAE 20w40 Marca ESSO',175,'INGRESADO'),(818,277,15,3498.00,0.00,'Puerta Laterall',197,'INGRESADO'),(819,277,20,7.00,0.00,'Balinera 3mm bolsa',171,'INGRESADO'),(820,277,25,1350.00,0.00,'Camisa de motor 1815',177,'INGRESADO'),(821,278,3,600.00,0.00,'Carcasa Termostato Renault CLIO21',173,'ANULADO'),(822,278,8,870.50,0.00,'Bomba de Agua Cruze Tracker Sonicx',172,'ANULADO'),(823,279,5,350.50,0.00,'Aceite Motul 3/4',147,'FACTURADO'),(824,279,5,1350.00,0.00,'Camisa de motor 1815',177,'FACTURADO'),(825,279,2,7.00,2.10,'Balinera 3mm bolsa',171,'FACTURADO'),(831,280,54,4650.00,0.00,'Computadora Automotriz para Acura C',148,'COTIZADO'),(832,280,47,600.00,0.00,'Carcasa Termostato Renault CLIO21',173,'COTIZADO'),(833,280,1,8600.00,0.00,'Barra E. Tacoma/Prerunner',182,'COTIZADO'),(834,280,1,2500.25,0.00,'Barra Pick-Up D22',181,'COTIZADO'),(835,280,1,4300.20,0.00,'Propulsor TD27 4x2 98',180,'COTIZADO'),(836,281,10,2030.00,0.00,'Bomba de Combustible Ford Escape 2010',199,'INGRESADO'),(837,282,5,600.00,0.00,'Carcasa Termostato Renault CLIO21',173,'INGRESADO'),(838,282,10,2030.00,0.00,'Bomba de Combustible Ford Escape 2010',199,'INGRESADO');
/*!40000 ALTER TABLE `detalle_transaccion` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRG_ORDER_ANULAR` AFTER UPDATE ON `detalle_transaccion` FOR EACH ROW BEGIN
		
		SET @CANTIDAD:=(OLD.detalletransaccion_cantidad);
		SET @TIPOPRO:=(SELECT producto.prod_serv_tipo From producto WHERE producto.producto_id = OLD.producto_id);


		
	
		IF NEW.detalletransaccion_estatus = "ORDEN ANULADA" THEN
			IF @TIPOPRO = "PRODUCTO" THEN
				UPDATE producto SET producto_stock = producto_stock + @CANTIDAD WHERE producto.producto_id = OLD.producto_id;
				
			END IF;
			UPDATE tarea SET tarea.estado = "ORDEN ANULADA" WHERE tarea.detalletransaccion_id = NEW.detalletransaccion_id;
		END IF ;
		
		
		
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `TRG_ORDER_BORRAR_PRODUCTO` BEFORE DELETE ON `detalle_transaccion` FOR EACH ROW BEGIN
		
		SET @CANTIDAD:=(OLD.detalletransaccion_cantidad);
		SET @TIPOPRO:=(SELECT producto.prod_serv_tipo From producto WHERE producto.producto_id = OLD.producto_id);
		
		SET @TIPOORD:=(OLD.detalletransaccion_estatus);
	
		IF @TIPOORD = "ORDENADO" THEN
				IF @TIPOPRO = "PRODUCTO" THEN
					UPDATE producto SET producto_stock = producto_stock + @CANTIDAD WHERE producto.producto_id = OLD.producto_id;

				END IF ;
		END IF ;
		
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `fabricante`
--

DROP TABLE IF EXISTS `fabricante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fabricante` (
  `id_fabricante` int NOT NULL AUTO_INCREMENT,
  `fabricante_nombre` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `fabricante_descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `fabricante_estado` enum('ACTIVO','INACTIVO') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `fabricante_fregistro` date DEFAULT NULL,
  PRIMARY KEY (`id_fabricante`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fabricante`
--

LOCK TABLES `fabricante` WRITE;
/*!40000 ALTER TABLE `fabricante` DISABLE KEYS */;
INSERT INTO `fabricante` VALUES (11,'La Mundial','Fabricante de Productos actualizando','ACTIVO','2021-11-25'),(12,'Autorepuestos','','ACTIVO','2021-11-29'),(13,'Repuestos Atlantida','Distribuidora de respuestos','ACTIVO','2021-11-29');
/*!40000 ALTER TABLE `fabricante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marca`
--

DROP TABLE IF EXISTS `marca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marca` (
  `id_marca` int NOT NULL AUTO_INCREMENT,
  `marca_nombre` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `marca_descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci,
  `marca_estado` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id_marca`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marca`
--

LOCK TABLES `marca` WRITE;
/*!40000 ALTER TABLE `marca` DISABLE KEYS */;
INSERT INTO `marca` VALUES (7,'Toyota','','ACTIVO'),(8,'Kia','','ACTIVO'),(9,'Ford','','ACTIVO'),(10,'BMW','','ACTIVO'),(11,'Chevrolet','','ACTIVO'),(12,'Ferrari','','ACTIVO'),(13,'Fiat','','ACTIVO'),(14,'Honda','','ACTIVO'),(15,'Hyundai','','ACTIVO'),(16,'Isuzu','','ACTIVO'),(17,'Jeep','','ACTIVO'),(18,'Mazda','','ACTIVO'),(19,'Mitsubishi','','ACTIVO'),(20,'Nissan','','ACTIVO'),(21,'Seat','','ACTIVO'),(22,'Suzuki','','ACTIVO'),(23,'Volkswagen','','ACTIVO'),(24,'Lada','','INACTIVO');
/*!40000 ALTER TABLE `marca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo`
--

DROP TABLE IF EXISTS `modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelo` (
  `id_modelo` int NOT NULL AUTO_INCREMENT,
  `modelo_nombre` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `modelo_descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci,
  `modelo_estado` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `id_marca` int DEFAULT NULL,
  PRIMARY KEY (`id_modelo`) USING BTREE,
  KEY `fk_modelo_marca` (`id_marca`) USING BTREE,
  CONSTRAINT `fk_modelo_marca` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id_marca`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo`
--

LOCK TABLES `modelo` WRITE;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
INSERT INTO `modelo` VALUES (6,'Prado','','ACTIVO',7),(7,'Hilux','','INACTIVO',7),(8,'Land Cruiser','','ACTIVO',7),(9,'Tacoma','','ACTIVO',7),(10,'Corola','','ACTIVO',7),(11,'Picanto','','ACTIVO',8),(12,'Rio','','ACTIVO',8),(13,'Venga','','ACTIVO',7),(14,'Sportage','','ACTIVO',8),(15,'Sorento','','ACTIVO',8),(16,'Optima GT','','ACTIVO',8),(17,'Fiesta','','ACTIVO',9),(18,'Focus','','ACTIVO',9),(19,'F-150','','ACTIVO',9),(20,'Scape','','ACTIVO',9),(21,'Mondelo','','ACTIVO',9),(22,'Mustang','','ACTIVO',9),(23,'Civic','','ACTIVO',14),(24,'Jazz','','ACTIVO',14),(25,'Accord','','ACTIVO',14),(26,'I20','','ACTIVO',15),(27,'Santa Fe','','ACTIVO',15),(28,'Elantra','','ACTIVO',15),(29,'Genesis','','ACTIVO',15),(30,'Kona','','ACTIVO',15),(31,'Mazda-2','','ACTIVO',18),(32,'Mazda-6','','ACTIVO',18);
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulo`
--

DROP TABLE IF EXISTS `modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulo` (
  `modulo_codigo` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `modulo_nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `modulo_descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci,
  `modulo_estado` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`modulo_codigo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
INSERT INTO `modulo` VALUES ('1','Formulario de Modelo','Esta es una descripcion','ACTIVO'),('1-1','Agregar Modelo','Esta es una descripcion','ACTIVO'),('1-2','Editar Modelo','Esta es una descripcion','ACTIVO'),('10','Menu Ingreso',NULL,'ACTIVO'),('10-1','Filtros de busqueda',NULL,'ACTIVO'),('10-2','Agregar Ingreso',NULL,'ACTIVO'),('10-3','Imprimir Ingreso',NULL,'ACTIVO'),('10-4','Anular Ingreso',NULL,'ACTIVO'),('10-5','Visualizar Ingreso',NULL,'ACTIVO'),('11','Menu Cliente',NULL,'ACTIVO'),('11-1','Agregar Cliente',NULL,'ACTIVO'),('11-2','Editar Cliente',NULL,'ACTIVO'),('11-3','Activar Cliente',NULL,'ACTIVO'),('11-4','Desactivar Cliente',NULL,'ACTIVO'),('11-5','Visualizar Cliente',NULL,'ACTIVO'),('12','Menu Venta',NULL,'ACTIVO'),('12-1','Filtros Fecha Venta',NULL,'ACTIVO'),('12-2','Agregar Venta',NULL,'ACTIVO'),('12-3','Imprimir Factura',NULL,'ACTIVO'),('12-4','Anular Venta',NULL,'ACTIVO'),('12-5','Visualizar Venta',NULL,'ACTIVO'),('13','Menu Cotizacion/Orden',NULL,'ACTIVO'),('13-1','Acceso a Manipulacion de fechas Orden/Cotizacion',NULL,'ACTIVO'),('13-10','Editar Cotizacion',NULL,'ACTIVO'),('13-11','Editar Orden de trabajo',NULL,'ACTIVO'),('13-12','Imprimir detalle orden',NULL,'ACTIVO'),('13-13','Imprimir factura Orden',NULL,'ACTIVO'),('13-2','Agregar Cotizacion',NULL,'ACTIVO'),('13-3','Agregar Orden',NULL,'ACTIVO'),('13-4','Imprimir Reporte-Factura Cotizacion',NULL,'ACTIVO'),('13-6','Anular Orden',NULL,'ACTIVO'),('13-7','Visualizar Orden',NULL,'ACTIVO'),('13-8','Visualizar Cotizacion',NULL,'ACTIVO'),('13-9','Facturar Orden',NULL,'ACTIVO'),('14','Menu Movimientos',NULL,'ACTIVO'),('14-1','Filtros Fecha Movimientos',NULL,'ACTIVO'),('14-2','Agregar Movimiento',NULL,'ACTIVO'),('14-3','Imprimir Reporte Movimiento',NULL,'ACTIVO'),('14-4','Anular Movimiento',NULL,'ACTIVO'),('14-5','Visualizar Movimiento',NULL,'ACTIVO'),('14-6','Editar Movimiento',NULL,'ACTIVO'),('15','Menu Marca',NULL,'ACTIVO'),('15-1','Agregar Marca',NULL,'ACTIVO'),('15-2','Editar Marca',NULL,'ACTIVO'),('15-3','Visualizar Marca',NULL,'ACTIVO'),('16','Menu Modelo',NULL,'ACTIVO'),('16-1','Agregar Modelo',NULL,'ACTIVO'),('16-2','Editar Modelo',NULL,'ACTIVO'),('16-3','Visualizar Modelo',NULL,'ACTIVO'),('17','Menu Persona',NULL,'ACTIVO'),('17-1','Agregar Persona',NULL,'ACTIVO'),('17-2','Editar Persona',NULL,'ACTIVO'),('18','Menu Usuario',NULL,'ACTIVO'),('18-1','Agregar Usuario',NULL,'ACTIVO'),('18-2','Editar Usuario',NULL,'ACTIVO'),('18-3','Visualizar Usuario',NULL,'ACTIVO'),('18-4','Visualizar Perfil Usuario',NULL,'ACTIVO'),('18-5','Editar Foto Perfil',NULL,'ACTIVO'),('18-6','Editar Informacion Usuario Perfil',NULL,'ACTIVO'),('18-7','Editar Password Profile',NULL,'ACTIVO'),('18-8','Generar Contraseña Usuario',NULL,'ACTIVO'),('19','Menu Servicio',NULL,'ACTIVO'),('19-1','Agregar Servicio',NULL,'ACTIVO'),('19-2','Editar Servicio',NULL,'ACTIVO'),('19-3','Visualizar Servicio',NULL,'ACTIVO'),('19-4','Agregar Oferta Servicio',NULL,'ACTIVO'),('2','Formulario de Accesos','Esta es una descripcion','ACTIVO'),('2-1','Agregar Accesos','Esta es una descripcion','ACTIVO'),('2-2','Editar Accesos','Esta es una descripcion','ACTIVO'),('2-3','Eliminar Accesos','Esta es una descripcion','ACTIVO'),('2-4','Ver Accesos de usuarios','Esta es una descripcion','ACTIVO'),('20','Menu Roles',NULL,'ACTIVO'),('20-1','Agregar Rol',NULL,'ACTIVO'),('20-2','Editar Rol',NULL,'ACTIVO'),('21','Visualizacion Notificaciones',NULL,'ACTIVO'),('22','Visualizacion Graficos',NULL,'ACTIVO'),('23','Acceso a bitacora','Acceso a ver la bitacora del sistema','ACTIVO'),('24','Menu Configuracion',NULL,'ACTIVO'),('24-1','Agregar Configuracion',NULL,'ACTIVO'),('24-2','Editar Configuracion',NULL,'ACTIVO'),('24-3','Visualizar Configuracion',NULL,'ACTIVO'),('3','Formulario de Vehiculos','Esta es una descripcion','ACTIVO'),('3-1','Agregar Vehiculo','Esta es una descripcion','ACTIVO'),('3-2','Editar Vehiculo','Esta es una descripcion','ACTIVO'),('3-3','Visualizar Vehiculo','Esta es una descripcion','ACTIVO'),('4','Menu Tarea','Esta es una descripcion','ACTIVO'),('4-1','Visualizar Tarea','Esta es una descripcion','ACTIVO'),('4-2','Editar Tarea','Esta es una descripcion','ACTIVO'),('4-3','Agregar Tarea','Esta es una descripcion','ACTIVO'),('4-4','Detalle Tarea','Esta es una descripcion','ACTIVO'),('4-5','Editar Estado Tarea','Esta es una descripcion','ACTIVO'),('4-6','Filtrar Tarea',NULL,'ACTIVO'),('5','Menu Producto','Esta es una descripcion','ACTIVO'),('5-1','Agregar Producto','Esta es una descripcion','ACTIVO'),('5-2','Editar Producto','Esta es una descripcion','ACTIVO'),('5-3','Visualizar Producto','Esta es una descripcion','ACTIVO'),('5-4','Agreagr Oferta Producto','Esta es una descripcion','ACTIVO'),('6','Menu Categoria',NULL,'ACTIVO'),('6-1','Agregar Categoria',NULL,'ACTIVO'),('6-2','Editar Categoria',NULL,'ACTIVO'),('6-3','Visualizar Categoria',NULL,'ACTIVO'),('7','Menu Fabricante',NULL,'ACTIVO'),('7-1','Agregar Fabricante',NULL,'ACTIVO'),('7-2','Editar Fabricante',NULL,'ACTIVO'),('7-3','Visualizar fabricante',NULL,'ACTIVO'),('8','Menu Unidad Medida',NULL,'ACTIVO'),('8-1','Agregar Unidad de Medida',NULL,'ACTIVO'),('8-2','Editar Unidad de Medida',NULL,'ACTIVO'),('8-3','Visualizar Unidad de Medida',NULL,'ACTIVO'),('9','Menu Proveedor',NULL,'ACTIVO'),('9-1','Agregar Proveedor',NULL,'ACTIVO'),('9-2','Editar Proveedor',NULL,'ACTIVO'),('9-3','Activar Porveedor',NULL,'ACTIVO'),('9-4','Desactivar Proveedor',NULL,'ACTIVO'),('9-5','Visualizar Proveedor',NULL,'ACTIVO');
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `persona_id` int NOT NULL AUTO_INCREMENT,
  `persona_nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `persona_apepat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `persona_apmat` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `persona_nrodocumento` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `persona_tipodocumento` enum('IDENTIDAD','RTN','DNI','RUC','PASAPORTE') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `persona_sexo` enum('MASCULINO','FEMENINO','OTRO') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `persona_correo` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `persona_telefono` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `persona_fregistro` date DEFAULT NULL,
  `persona_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `persona_empresa` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT '',
  PRIMARY KEY (`persona_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (1,'Brayan Eludes','Alvarez','Gonzales','080510020008','DNI','MASCULINO','10brayanalvarez@gmail.com','88821059','2021-09-22','ACTIVO',''),(2,'Alejandra ','Zuniga','Martinez','0820100050034','RTN','FEMENINO','alejandro@gmail.com','95201010','2021-09-23','ACTIVO',NULL),(51,'Abdiel Emanuel','Licona','Escobar','0105200003646','DNI','MASCULINO','alicoescobar@gmail.com','99564587','2021-11-25','ACTIVO',''),(52,'Marlon Ignacio','Benavidez','Hernandez','0803200000956','IDENTIDAD','MASCULINO','marlon@gmail.com','+50495201026','2021-11-25','ACTIVO',''),(53,'Hector Arturo','Benavidez','Canaca','0803199900256','RTN','MASCULINO','hectorarturo@gmail.com','+50498521683','2021-11-25','ACTIVO',''),(54,'German Saul','Banega','Alvarado','1809199700210','RTN','MASCULINO','german05saul@gmail.com','+50495632015','2021-11-25','ACTIVO',''),(55,'David Alejandro  ','Alvarez','Martinez','0803199102547','RTN','MASCULINO','autorepuestos@gmail.com','98201469','2021-11-25','ACTIVO',''),(56,'Artur Santiago','Castillo','Martinez','080519920056','IDENTIDAD','MASCULINO','santiago@gmail.com','+50498024601','2021-11-25','ACTIVO',''),(57,'Jonathan Josué','Canales','Ortega','08052001569320','IDENTIDAD','MASCULINO','jonathan@gmail.com','+50498521652','2021-11-25','ACTIVO','Empresa01'),(58,'Karla Vanessa ','Zuniga','Martinez','080510023569','IDENTIDAD','MASCULINO','karlavanesa@gmail.com','+50498521685','2021-11-25','ACTIVO',''),(59,'Jorge Elias','Molina','Montoro','1012198545203','IDENTIDAD','MASCULINO','jorge@gmail.com','+504 89456578','2021-11-25','ACTIVO',''),(60,'Ever Joel','Valladares','Matamoro','080520014899','IDENTIDAD','MASCULINO','joel@gmail.com','+50498501020','2021-11-25','ACTIVO',''),(61,'Jose Luis','Medina','Carcamo','080320000020','IDENTIDAD','MASCULINO','brayanuth0803@gmail.com','+50494862510','2021-11-25','ACTIVO',''),(62,'Wilmer','Santos','Orellana','0205200000546','IDENTIDAD','MASCULINO','mecanicoprueba@gmail.com','98765634','2021-11-28','ACTIVO',''),(63,'Cristofer Josue','Hernandez','Licona','0805200010039','RTN','OTRO','cristofer@gmail.com','+50495632015','2021-11-29','ACTIVO',''),(64,'Jouse Hernesto','Figueroa','Valladares','80320001000256','RTN','OTRO','josue@gmail.com','98201469','2021-11-29','ACTIVO',''),(65,'Cristhian Alejandro','Padilla','Matamoros','08011999000256','IDENTIDAD','MASCULINO','','+50495632015','2021-11-29','ACTIVO','Empresa02'),(66,'Luis Daniel','Herrera','Alvarado','080520001000656','IDENTIDAD','MASCULINO','luis@gmail.com','+50498501020','2021-11-29','ACTIVO','');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `producto_id` int NOT NULL AUTO_INCREMENT,
  `producto_nombre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `producto_stock` int DEFAULT NULL,
  `producto_stock_minimo` int DEFAULT NULL,
  `categoria_id` int DEFAULT NULL,
  `id_fabricante` int DEFAULT NULL,
  `unidad_id` int DEFAULT NULL,
  `producto_foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `producto_preciocompra` decimal(10,2) DEFAULT NULL,
  `producto_precioventa` decimal(10,2) DEFAULT NULL,
  `producto_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `producto_oferta` int(1) unsigned zerofill DEFAULT '0',
  `producto_descuento` decimal(2,2) DEFAULT '0.00',
  `producto_descripcion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `prod_serv_tipo` varchar(45) CHARACTER SET ujis COLLATE ujis_japanese_ci DEFAULT NULL,
  `producto_codigo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`producto_id`) USING BTREE,
  KEY `FK_PRODUCTO_CATEGORIA` (`categoria_id`) USING BTREE,
  KEY `FK_PRODUCTO_UNIDAD` (`unidad_id`) USING BTREE,
  KEY `FK_PRODUCTO_FABRICANTE` (`id_fabricante`) USING BTREE,
  KEY `producto_codigo` (`producto_codigo`) USING BTREE,
  KEY `producto_nombre` (`producto_nombre`) USING BTREE,
  CONSTRAINT `FK_PRODUCTO_CATEGORIA` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PRODUCTO_FABRICANTE` FOREIGN KEY (`id_fabricante`) REFERENCES `fabricante` (`id_fabricante`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PRODUCTO_UNIDAD` FOREIGN KEY (`unidad_id`) REFERENCES `unidad_medida` (`unidad_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (26,'Cambio de Aceite+',0,0,2,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,150.00,'ACTIVO',1,0.15,'Servicio de Cambio de Aceite','SERVICIO','89458934'),(28,'Cambio de Llantas',0,0,10,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,551.00,'ACTIVO',1,0.10,'Cambio de Llantas','SERVICIO','2354564'),(29,'Cambio de Luces',0,0,1,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,380.00,'ACTIVO',1,0.10,'Cambio de luces','SERVICIO','54188847'),(30,'Reparacion de Motor',0,0,2,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,1700.00,'ACTIVO',0,0.00,'Servicio Reparacion del Motor','SERVICIO','94355072'),(31,'Cambio de Asientos',0,0,10,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,450.00,'ACTIVO',0,0.00,'Detalle','SERVICIO','89563534'),(37,'Inspección de catalizador',0,0,8,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,450.50,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','9160413610'),(38,'Inspección de estanqueidad del sistema de admisión y escape',0,0,8,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,750.60,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','9160413611'),(39,'Reemplazado de precámara',0,0,8,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,1200.20,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','9160413612'),(40,'Reemplazado de silenciador',0,0,8,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,550.20,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','9160413613'),(41,'Reemplazo de catalizador',0,0,8,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,2250.50,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','9160413614'),(42,'Reemplazo de ducto de escape',0,0,8,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,3600.05,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','9160413615'),(43,'Reemplazo de junta de colector de escape',0,0,8,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,260.32,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','9160413616'),(44,'Reemplazo de juntas de ducto de escape',0,0,8,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,80.20,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','9160413617'),(45,'Reemplazo de soporte de ducto de escape',0,0,8,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,4500.25,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','9160413618'),(46,'Diagnóstico computarizado',0,0,10,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,900.50,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','9160413619'),(47,'Revisión general',0,0,10,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,1300.25,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','9160413620'),(48,'Revisión programada1. ',0,0,10,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,450.50,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','9160413621'),(49,'Ajuste de la distribución de encendido',0,0,9,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,770.60,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','9160413622'),(50,'Ajuste de la velocidad y mezcla de ralentí ',0,0,9,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,1200.20,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','9160413623'),(51,'Reemplazo de corona de arranque',0,0,9,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,550.20,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','9160413624'),(52,'Reemplazo de correa de distribución',0,0,9,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,2250.50,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','9160413625'),(53,'Reemplazo de empaquetadura de culata de cilindros',0,0,9,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,3600.05,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','9160413626'),(54,'Reemplazo de ménsula de motor',0,0,9,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,260.32,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','9160413627'),(55,'Reemplazo de polea',0,0,9,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,80.20,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','9160413628'),(56,'Reemplazo de sello',0,0,9,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,4500.25,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','9160413629'),(57,'Reemplazo de tensor',0,0,9,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,900.50,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','9160413630'),(58,'Reparación de culata de cilindros',0,0,9,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,1300.25,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','9160413631'),(59,'Revisión de culata de cilindros',0,0,9,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,450.50,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','9160413632'),(60,'Revisión de la distribución del encendido',0,0,9,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,750.60,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','9160413633'),(61,'Revisión de la velocidad y mezcla de ralentí ',0,0,9,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,1200.20,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','9160413634'),(62,'Revisión del motor',0,0,9,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,550.20,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','9160413635'),(63,'Inspección de nivel de lubricante de motor',0,0,12,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,2250.50,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','9160413636'),(64,'Reemplazo lubricante motor',0,0,12,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,3600.05,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','9160413637'),(65,'Reemplazo filtro lubricante motor',0,0,12,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,260.32,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','9160413638'),(66,'Reemplazo de sensor de presión de lubricante motor',0,0,12,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,80.20,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','9160413639'),(67,'Combustible',0,0,12,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,4500.25,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','9160413640'),(68,'Limpieza de carburador',0,0,12,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,900.50,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','9160413641'),(69,'Limpieza de depósito de combustible',0,0,12,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,1300.25,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','916041362'),(70,'Limpieza de inyectores',0,0,12,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,1200.20,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','916041363'),(71,'Reemplazo de bomba de combustible',0,0,12,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,550.20,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','916041364'),(72,'Reemplazo de ducto de combustible',0,0,12,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,2250.50,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','916041365'),(73,'Reemplazo de tapón de depósito de combustible',0,0,12,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,3600.05,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','916041366'),(74,'Reemplazo filtro combustible',0,0,12,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,260.32,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','916041367'),(75,'Ajuste de tensión de correa de bomba de fluido refrigerante',0,0,13,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,80.20,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','916041368'),(76,'Inspección de tapa de depósito de fluido refrigerante',0,0,13,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,4500.25,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','916041369'),(77,'Inspección nivel fluido refrigerante',0,0,13,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,900.50,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','916041370'),(78,'Reemplazo de bomba de fluido refrigerante',0,0,13,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,1300.25,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','916041371'),(79,'Reemplazo de correa de bomba de fluido refrigerante',0,0,13,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,450.50,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','916041372'),(80,'Reemplazo de depósito de fluido refrigerante',0,0,13,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,750.60,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','916041373'),(81,'Reemplazo de ducto de fluido refrigerante',0,0,13,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,1200.20,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','916041374'),(82,'Reemplazo de intercambiador de calor',0,0,13,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,550.20,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','916041375'),(83,'Reemplazo de motor de refrigeración',0,0,13,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,2250.50,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','916041376'),(84,'Reemplazo de relay de motor',0,0,13,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,3600.05,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','916041377'),(85,'Reemplazo de sensor de temperatura de fluido refrigerante',0,0,13,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,260.32,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','916041378'),(86,'Reemplazo de termostato',0,0,13,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,80.20,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','916041379'),(87,'Reparación de intercambiador de calor',0,0,13,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,4500.25,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','916041380'),(88,'Reemplazo fluido refrigerante',0,0,13,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,900.50,'ACTIVO',0,0.00,'Lorem ipsum dolor sit amet consectetur adipisicing elit. Libero quam blanditiis ipsam soluta corrupti molestias voluptatem sapiente itaque similique animi!','SERVICIO','916041381'),(146,'Limpieza de motor',0,0,5,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,200.00,'ACTIVO',0,0.00,'Esta es una descripcion','SERVICIO','73605042'),(147,'Aceite Motul 3/4',15,5,9,11,3,'controlador/producto/img/producto_default.png',250.25,350.50,'ACTIVO',0,0.00,'','PRODUCTO','90799141'),(148,'Computadora Automotriz para Acura C',42,10,9,11,1,'controlador/producto/img/producto_default.png',4600.25,4650.00,'ACTIVO',0,0.00,'','PRODUCTO','86281149'),(169,'Cambio Pistones Toyota',0,0,9,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,250.25,'ACTIVO',0,0.00,'','SERVICIO','89192193'),(170,'Servicio de prueba',0,0,1,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,0.00,'INACTIVO',0,0.00,'dsfsdf','SERVICIO','88183569'),(171,'Balinera 3mm bolsa',35,3,1,11,4,'controlador/producto/img/producto_default.png',5.50,7.00,'ACTIVO',1,0.15,'Esta es una descripción del producto','PRODUCTO','53294455'),(172,'Bomba de Agua Cruze Tracker Sonic',22,5,9,11,1,'controlador/producto/img/producto_default.png',750.25,890.50,'ACTIVO',0,0.00,'','PRODUCTO','84334076'),(173,'Carcasa Termostato Renault CLIO21',16,5,10,11,1,'controlador/producto/img/producto_default.png',350.50,600.00,'ACTIVO',0,0.00,'','PRODUCTO','19444038'),(174,'Deposito o frasco de agua R058',8,5,12,11,1,'controlador/producto/img/producto_default.png',300.20,370.00,'ACTIVO',0,0.00,'','PRODUCTO','96656969'),(175,'Aceite SAE 20w40 Marca ESSO',10,5,1,11,1,'controlador/producto/img/producto_default.png',250.50,290.50,'ACTIVO',0,0.00,'','PRODUCTO','89296943'),(176,'Amoritguadores Gabriel 34-87',13,5,5,11,1,'controlador/producto/img/producto_default.png',900.00,1100.50,'ACTIVO',0,0.00,'','PRODUCTO','17118156'),(177,'Camisa de motor 1815',30,5,1,11,2,'controlador/producto/img/producto_default.png',1200.50,1350.00,'ACTIVO',0,0.00,'','PRODUCTO','93550407'),(178,'Cambio de Pistones',0,0,10,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,1500.00,'ACTIVO',0,0.00,'Cambio de Piston para mejoramiento del motor','SERVICIO','23787834'),(179,'Balinera Sentra 98',10,8,10,11,1,'controlador/producto/img/producto_default.png',600.50,780.25,'ACTIVO',0,0.00,'','PRODUCTO','36489684'),(180,'Propulsor TD27 4x2 98',4,3,1,11,1,'controlador/producto/img/producto_default.png',4100.50,4300.20,'ACTIVO',0,0.00,'','PRODUCTO','37629730'),(181,'Barra Pick-Up D22',12,5,1,11,1,'controlador/producto/img/producto_default.png',2000.00,2500.25,'ACTIVO',0,0.00,'','PRODUCTO','76173251'),(182,'Barra E. Tacoma/Prerunner',10,5,1,11,1,'controlador/producto/img/producto_default.png',7500.00,8600.00,'ACTIVO',0,0.00,'','PRODUCTO','90022030'),(183,'Bomba T.HIDR Santa Fe',20,5,1,11,1,'controlador/producto/img/producto_default.png',4500.50,4600.20,'ACTIVO',0,0.00,'','PRODUCTO','56531554'),(184,'Bomba T.HDIR Elantra IX30',24,5,1,11,1,'controlador/producto/img/producto_default.png',1600.50,1900.25,'ACTIVO',0,0.00,'','PRODUCTO','73266037'),(185,'Brazo Trooper USB25',24,5,9,11,1,'controlador/producto/img/producto_default.png',5500.20,5800.25,'ACTIVO',0,0.00,'','PRODUCTO','42884770'),(186,'Anillos 1ZZ 3&quot;SV 79M',7,5,1,11,1,'controlador/producto/img/producto_default.png',780.25,850.25,'ACTIVO',0,0.00,'','PRODUCTO','80103984'),(187,'Bal. Centro Coaster 1.35G',12,5,5,11,1,'controlador/producto/img/producto_default.png',3200.00,3750.00,'ACTIVO',0,0.00,'','PRODUCTO','65878415'),(188,'Culata Coaster 325G',38,5,9,11,1,'controlador/producto/img/producto_default.png',7200.35,7900.25,'ACTIVO',0,0.00,'','PRODUCTO','26137988'),(189,'Banda ALT.1ZZ Corolla 97',3,5,10,11,1,'controlador/producto/img/producto_default.png',430.20,431.25,'ACTIVO',0,0.00,'','PRODUCTO','41937818'),(190,'Botadores 1HZ/22R/-2L Hilux Modificado',10,5,9,11,1,'controlador/producto/img/producto_default.png',300.50,370.25,'ACTIVO',0,0.00,'','PRODUCTO','24409796'),(191,'Buje Pistones 18R-22R',0,5,10,11,1,'controlador/producto/img/producto_default.png',200.25,200.25,'ACTIVO',0,0.00,'','PRODUCTO','75364424'),(192,'Camisa 93.00M/M 4JA1',15,5,10,11,1,'controlador/producto/img/producto_default.png',2000.50,2300.25,'ACTIVO',0,0.00,'','PRODUCTO','59843550'),(193,'Cambio de Buje',0,0,9,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,1300.50,'ACTIVO',0,0.00,'','SERVICIO','37232433'),(194,'Cambio de filtro',0,0,9,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,900.50,'ACTIVO',0,0.00,'','SERVICIO','79832659'),(195,'Filtro C-111M',0,5,12,11,1,'controlador/producto/img/producto_default.png',250.00,300.00,'ACTIVO',0,0.00,'','PRODUCTO','33322277'),(196,'Filtro C-Santa Fe 2.2',4,5,12,11,1,'controlador/producto/img/producto_default.png',150.00,194.50,'ACTIVO',0,0.00,'','PRODUCTO','21811734'),(197,'Puerta Laterall',15,10,2,11,5,'controlador/producto/img/producto_default.png',2500.00,3498.00,'ACTIVO',0,0.00,'Puerta Lateral Toyota','PRODUCTO','35172303'),(198,'Cambio de VidriosS',0,0,10,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,780.00,'ACTIVO',0,0.00,'Cambio de Vidrios para todo tipo de automovil','SERVICIO','64941165'),(199,'Bomba de Combustible Ford Escape 2010',20,10,11,11,3,'controlador/producto/img/producto_default.png',1500.00,2030.00,'ACTIVO',1,0.10,'Bomba de combustible ford escape','PRODUCTO','72164805'),(200,'Cambio de Vidrios',0,0,2,NULL,NULL,'controlador/servicio/img/producto_default.png',0.00,1000.00,'ACTIVO',0,0.00,'Cambio de Vidrios','SERVICIO','71810853');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `cambio_producto` AFTER UPDATE ON `producto` FOR EACH ROW BEGIN
        IF NEW.producto_nombre <> OLD.producto_nombre OR NEW.producto_precioventa <> OLD.producto_precioventa  THEN  
            INSERT INTO producto_historial(producto_codigo,producto_nombre,producto_nombre_nuevo,				     producto_precio_venta,producto_precio_venta_nuevo,prod_serv_tipo,													fecha_historial) 										
												VALUES(OLD.producto_codigo, OLD.producto_nombre,NEW.producto_nombre,OLD.producto_precioventa,NEW.producto_precioventa,OLD.prod_serv_tipo,NOW());
        END IF;
				 
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `producto_historial`
--

DROP TABLE IF EXISTS `producto_historial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_historial` (
  `id_historial` int NOT NULL AUTO_INCREMENT,
  `producto_codigo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `producto_nombre` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `producto_nombre_nuevo` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `producto_precio_venta` decimal(10,2) DEFAULT NULL,
  `producto_precio_venta_nuevo` decimal(10,2) DEFAULT NULL,
  `prod_serv_tipo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `fecha_historial` datetime DEFAULT NULL,
  PRIMARY KEY (`id_historial`) USING BTREE,
  KEY `fkey_productocodigo_historial` (`producto_codigo`) USING BTREE,
  KEY `fkey_productonombre_historial` (`producto_nombre`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_historial`
--

LOCK TABLES `producto_historial` WRITE;
/*!40000 ALTER TABLE `producto_historial` DISABLE KEYS */;
INSERT INTO `producto_historial` VALUES (33,'54188847','Cambio de Luces+','Cambio de Luces',360.00,360.00,'SERVICIO','2021-11-25 04:02:15'),(34,'88183569','dsfsfs','Servicio de prueba',5555.00,0.00,'SERVICIO','2021-11-25 05:06:14'),(35,'86281149','Computadora Automotriz para Acura CSX','Computadora Automotriz para Acura CSXX',5200.70,5200.70,'PRODUCTO','2021-11-25 17:25:00'),(36,'000204669','Cambio de pistones','Cambio de piston',250.00,250.00,'SERVICIO','2021-11-25 17:45:00'),(37,'000204669','Cambio de piston','Cambio de pistones',250.00,250.00,'SERVICIO','2021-11-25 17:45:43'),(38,'19444038','Carcasa Termostato Renault CLIO2','Carcasa Termostato Renault CLIO21',600.00,600.00,'PRODUCTO','2021-11-25 17:47:50'),(39,'89458934','Cambio de Aceite','Cambio de Aceite+',150.00,150.00,'SERVICIO','2021-11-25 17:50:43'),(40,'9160413622','Ajuste de la distribución del encendido','Ajuste de la distribución de encendido',750.60,750.60,'SERVICIO','2021-11-25 17:53:28'),(41,'9160413622','Ajuste de la distribución de encendido','Ajuste de la distribución de encendido',750.60,770.60,'SERVICIO','2021-11-25 17:53:50'),(42,'23787834','Cambio de Piston','Cambio de Pistones',1500.00,1500.00,'SERVICIO','2021-11-25 17:56:57'),(43,'86281149','Computadora Automotriz para Acura CSXX','Computadora Automotriz para Acura CSX',5200.70,5200.70,'PRODUCTO','2021-11-25 18:14:39'),(44,'94355072','Reparacion de Motor','Reparacion de Motor',700.00,1700.00,'SERVICIO','2021-11-25 18:43:18'),(45,'90022030','Barra E. Tacoma/Prerunner','Barra E. Tacoma/Prerunner',250.00,8600.00,'PRODUCTO','2021-11-25 19:27:34'),(46,'35172303','Puerta Lateral','Puerta Laterall',3498.00,3498.00,'PRODUCTO','2021-11-26 00:21:07'),(47,'64941165','Cambio de Vidrios','Cambio de VidriosS',780.00,780.00,'SERVICIO','2021-11-26 00:23:10'),(48,'72164805','Bomba de Combustible Ford Escape 2009','Bomba de Combustible Ford Escape 2010',2000.00,2030.00,'PRODUCTO','2021-11-26 00:50:17'),(49,'84334076','Bomba de Agua Cruze Tracker Sonic','Bomba de Agua Cruze Tracker Sonicx',870.50,870.50,'PRODUCTO','2021-11-27 17:21:00'),(50,'86281149','Computadora Automotriz para Acura CSX','Computadora Automotriz para Acura CS',5200.70,5200.70,'PRODUCTO','2021-11-28 22:45:26'),(51,'86281149','Computadora Automotriz para Acura CS','Computadora Automotriz para Acura CSNF',5200.70,5200.70,'PRODUCTO','2021-11-28 22:56:46'),(52,'54188847','Cambio de Luces','Cambio de Luces+',360.00,360.00,'SERVICIO','2021-11-28 23:05:48'),(53,'54188847','Cambio de Luces+','Cambio de Luces+',360.00,380.00,'SERVICIO','2021-11-28 23:06:12'),(54,'54188847','Cambio de Luces+','Cambio de Luces',380.00,380.00,'SERVICIO','2021-11-29 20:57:13'),(55,'86281149','Computadora Automotriz para Acura CSNF','Computadora Automotriz para Acura C',5200.70,5200.70,'PRODUCTO','2021-11-29 21:00:43'),(56,'86281149','Computadora Automotriz para Acura C','Computadora Automotriz para Acura C',5200.70,4.00,'PRODUCTO','2021-11-29 21:01:05'),(57,'86281149','Computadora Automotriz para Acura C','Computadora Automotriz para Acura C',4.00,4650.00,'PRODUCTO','2021-11-29 21:03:57'),(58,'84334076','Bomba de Agua Cruze Tracker Sonicx','Bomba de Agua Cruze Tracker Sonic',870.50,890.50,'PRODUCTO','2021-11-29 22:13:16');
/*!40000 ALTER TABLE `producto_historial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `proveedor_id` int NOT NULL AUTO_INCREMENT,
  `proveedor_numcontacto` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `proveedor_contacto` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `proveedor_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `persona_id` int DEFAULT NULL,
  `proveedor_razonsocial` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`proveedor_id`) USING BTREE,
  KEY `FK_PROVEEDOR_PERSONA` (`persona_id`) USING BTREE,
  CONSTRAINT `FK_PROVEEDOR_PERSONA` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`persona_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (10,'94521603','Samuel Cortez','ACTIVO',53,'La Mundial'),(11,'50496201345','Karla Suarez Benavidez','ACTIVO',54,'Parrillas y Repuestos ONE'),(12,'96201458','Linda Diaz','ACTIVO',55,'Autorepuestos AR'),(13,'98502045','Bairon Figueroa','ACTIVO',63,'Repuestos Bajaj'),(14,'98502010','Maynor Alvarado','ACTIVO',64,'ToyotaRep');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `rol_id` int NOT NULL AUTO_INCREMENT,
  `rol_nombre` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `rol_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `rol_feregistro` date DEFAULT NULL,
  PRIMARY KEY (`rol_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'','ACTIVO','2021-09-23'),(12,'ALMACENERO','ACTIVO','2021-10-10'),(13,'VENDEDOR','ACTIVO','2021-10-10'),(14,'MECANICO','ACTIVO','2021-11-08'),(16,'CLIENTE','ACTIVO','2021-11-20');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarea`
--

DROP TABLE IF EXISTS `tarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarea` (
  `id_tarea` int NOT NULL AUTO_INCREMENT,
  `detalletransaccion_id` int DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `tarea_notas` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci,
  `estado` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `usuario_id` int DEFAULT NULL,
  PRIMARY KEY (`id_tarea`) USING BTREE,
  KEY `tarea_ibfk_1` (`detalletransaccion_id`) USING BTREE,
  KEY `usuario_id` (`usuario_id`) USING BTREE,
  CONSTRAINT `tarea_ibfk_1` FOREIGN KEY (`detalletransaccion_id`) REFERENCES `detalle_transaccion` (`detalletransaccion_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tarea_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarea`
--

LOCK TABLES `tarea` WRITE;
/*!40000 ALTER TABLE `tarea` DISABLE KEYS */;
INSERT INTO `tarea` VALUES (83,710,'2023-11-05','2023-11-07','El cableado de el tablero esta bastante defectuoso se recomienda hacerle mantenimiento','FINALIZADO',36),(89,709,'2023-11-02','2023-11-03','Esta es una observacion','ORDEN ANULADA',NULL),(90,711,'2023-11-03','2023-11-06','','PENDIENTE',NULL),(91,712,'2023-11-01','2023-11-27','Cilindros bastante bien con el cambio realizado se recomienda dentro de 2 meses volver a revisarlos','FINALIZADO',NULL),(92,717,'2023-11-30','2023-12-01','','PENDIENTE',NULL),(93,714,'2023-12-01','2023-12-03','Esta es una descripcion opcional del automovil que se pretende reparar','FINALIZADO',36),(94,715,'2023-12-01','2023-12-02','','PENDIENTE',NULL),(95,719,'2023-12-05','2023-12-06','','FINALIZADO',36),(96,713,'2023-11-25','2023-11-26','','PENDIENTE',NULL),(97,779,'2023-11-26','2023-11-27','Debe tener cuiadado en las gasolineras donde se surte de combustible el tipo de comstible esta dañando el ducto','FINALIZADO',5),(98,780,'2023-11-26','2023-11-27','','PENDIENTE',NULL),(99,783,'2023-12-03','2023-12-04','Iniciando el reemplazo','FINALIZADO',36),(101,781,'2023-11-30','2023-12-02','Se esta alargando la tarea hemos encontrado problemas en la caja del utomovil','PENDIENTE',5),(102,786,'2023-11-24','2023-11-25','Iniciando Cambio de buje','PENDIENTE',NULL),(103,787,'2023-11-25','2023-11-26','','PENDIENTE',NULL),(104,788,'2023-12-08','2023-12-11','','PENDIENTE',NULL),(105,815,'2023-12-06','2023-12-07','','FINALIZADO',34),(106,816,'2023-12-06','2023-12-07','','FINALIZADO',34),(107,782,'2023-12-07','2023-12-08','','PENDIENTE',NULL);
/*!40000 ALTER TABLE `tarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaccion_proveedor`
--

DROP TABLE IF EXISTS `transaccion_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaccion_proveedor` (
  `transaccion_id` int DEFAULT NULL,
  `proveedor_id` int DEFAULT NULL,
  KEY `id_proveedor` (`proveedor_id`) USING BTREE,
  KEY `transaccion_id` (`transaccion_id`) USING BTREE,
  CONSTRAINT `transaccion_proveedor_ibfk_2` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`proveedor_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `transaccion_proveedor_ibfk_3` FOREIGN KEY (`transaccion_id`) REFERENCES `transacciones` (`transaccion_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion_proveedor`
--

LOCK TABLES `transaccion_proveedor` WRITE;
/*!40000 ALTER TABLE `transaccion_proveedor` DISABLE KEYS */;
INSERT INTO `transaccion_proveedor` VALUES (242,11),(244,11),(250,12),(251,12),(252,11),(254,11),(260,10),(261,12),(270,12),(271,11),(272,11),(277,14),(278,13),(281,11),(282,11);
/*!40000 ALTER TABLE `transaccion_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaccion_vehiculo`
--

DROP TABLE IF EXISTS `transaccion_vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaccion_vehiculo` (
  `id_transaccion` int NOT NULL,
  `id_vehiculo` int NOT NULL,
  `nivel_combustible` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `vehiculo_km/millas` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `id_usuario` int DEFAULT NULL COMMENT 'Campo para el registro del usuario tipo mecanico que hara los servicios al vehiculo',
  `descripcion` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci,
  PRIMARY KEY (`id_transaccion`,`id_vehiculo`) USING BTREE,
  KEY `fk_tranveh_idveh` (`id_vehiculo`) USING BTREE,
  KEY `fk_tranveh_idusuario` (`id_usuario`) USING BTREE,
  CONSTRAINT `fk_tranveh_idtran` FOREIGN KEY (`id_transaccion`) REFERENCES `transacciones` (`transaccion_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tranveh_idusuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`usuario_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tranveh_idveh` FOREIGN KEY (`id_vehiculo`) REFERENCES `vehiculo` (`id_vehiculo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaccion_vehiculo`
--

LOCK TABLES `transaccion_vehiculo` WRITE;
/*!40000 ALTER TABLE `transaccion_vehiculo` DISABLE KEYS */;
INSERT INTO `transaccion_vehiculo` VALUES (246,12,'1/4','1500Km',35,'El auto presenta fallas en el arranque'),(247,11,'E','1000Km',35,'Esta es una descripcion'),(248,13,'1/2','3000',36,'Problemas en las balineras y computadora del automovil, ademas de el aire acondicionado'),(249,11,'E','1000Km',35,'Esta es una desc'),(266,14,'1/4','25000',36,'Problemas en la culata y pistones'),(267,15,'1/4','6000',36,'fallos en las bandas '),(268,16,'F','3000',36,'Tiene un problema en el sistema eléctrico'),(276,11,'1/4','123',36,'rjejdjdjdjdjdjdj');
/*!40000 ALTER TABLE `transaccion_vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transacciones`
--

DROP TABLE IF EXISTS `transacciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transacciones` (
  `transaccion_id` int NOT NULL AUTO_INCREMENT,
  `id_correlativo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `transaccion_tipocomprobante` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `transaccion_seriecomprobante` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `transaccion_numcomprobante` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `transaccion_fecha` datetime DEFAULT NULL,
  `transaccion_impuesto` decimal(10,2) DEFAULT NULL,
  `transaccion_total` decimal(10,2) DEFAULT NULL,
  `transaccion_estatus` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `transaccion_descuento` decimal(10,2) DEFAULT NULL,
  `transaccion_porcentaje` decimal(2,2) DEFAULT NULL,
  `transaccion_observaciones` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci,
  `persona_id` int DEFAULT NULL,
  `usuario_id` int DEFAULT NULL,
  `transaccion_tipo` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `transaccion_cantidadpago` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`transaccion_id`) USING BTREE,
  KEY `usuario_id` (`usuario_id`) USING BTREE,
  KEY `persona_id` (`persona_id`) USING BTREE,
  CONSTRAINT `transacciones_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `transacciones_ibfk_3` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`persona_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacciones`
--

LOCK TABLES `transacciones` WRITE;
/*!40000 ALTER TABLE `transacciones` DISABLE KEYS */;
INSERT INTO `transacciones` VALUES (242,'ING-00001','FACTURA','0000001','0000001','2023-11-02 03:54:11',13015.95,99788.95,'INGRESADO',0.00,0.15,'',NULL,5,'INGRESO',0.00),(243,'FAC-0000243','FACTURA','000-001-00072001    ','000-001-00065001','2023-11-02 03:54:11',885.25,6786.95,'FACTURADO',0.00,0.15,'',52,5,'VENTA',6790.00),(244,'ING-0000244','FACTURA','0000002','0000002','2023-11-02 03:54:11',21.00,161.00,'INGRESADO',0.00,0.15,'',NULL,34,'INGRESO',0.00),(245,'COT-0000245','','','','2023-11-02 03:54:11',4.20,28.00,'COTIZADO',4.20,0.15,'',59,5,'COTIZACION',0.00),(246,'ORD-0000246','','','','2023-11-02 03:54:11',115.74,884.19,'ORDEN ANULADA',3.15,0.15,'El auto presenta fallas en el arranque',57,34,'ORDEN',0.00),(247,'ORD-0000247','','','','2023-11-02 03:54:11',54.00,378.00,'ORDEN ANULADA',36.00,0.15,'',57,34,'ORDEN',0.00),(248,'ORD-0000248','','','','2023-11-02 03:54:11',1332.42,10215.22,'INICIADO',0.00,0.15,'',58,5,'ORDEN',0.00),(249,'ORD-0000249','FACTURA','000-001-00072001    ','000-001-00065002    ','2023-11-02 03:54:11',54.00,378.00,'ORDEN FACTURADA',36.00,0.15,'',57,34,'ORDEN',400.00),(250,'ING-0000250','FACTURA','0000003','0000003','2023-11-02 03:54:11',17996.25,137971.25,'ANULADO',0.00,0.15,'',NULL,5,'INGRESO',0.00),(251,'ING-0000251','FACTURA','0000004','0000004','2023-11-02 03:54:11',35724.07,273884.57,'INGRESADO',0.00,0.15,'',NULL,5,'INGRESO',0.00),(252,'AJT-0000252','AJUSTE','0000005','0000005','2023-11-02 03:54:11',3225.15,24726.15,'AJUSTE ANULADO',0.00,0.15,'',NULL,5,'AJUSTE',0.00),(253,'FAC-0000253','FACTURA','000-001-00072001    ','000-001-00065002    ','2023-11-02 03:54:11',645.03,4945.23,'FACTURADO',0.00,0.15,'',52,5,'VENTA',4946.20),(254,'ING-0000254','FACTURA','0000006','0000006','2023-11-02 03:54:11',3225.15,24726.15,'INGRESADO',0.00,0.15,'',NULL,5,'INGRESO',0.00),(256,'MOV-0000255','','','','2023-11-02 03:54:11',0.00,0.00,'MOVIMIENTO ANULADO',0.00,0.00,'El primer producto tiene un defecto que lo deja inservible para facturar, están totalmente dañados, no es conveniente dejarlos en stock.',NULL,5,'MOVIMIENTO',0.00),(257,'MOV-0000257','','','','2023-11-02 03:54:11',0.00,0.00,'MOVIMIENTO ANULADO',0.00,0.00,'El primer producto tiene un defecto que lo deja inservible para facturar, están totalmente dañados, no es conveniente dejarlos en stock',NULL,5,'MOVIMIENTO',0.00),(258,'MOV-0000258','','','','2023-11-02 03:54:11',0.00,0.00,'MOVIMIENTO',0.00,0.00,'El primer producto tiene un defecto que lo deja inservible para facturar, están totalmente dañados, no es conveniente dejarlos en stock',NULL,5,'MOVIMIENTO',0.00),(259,'FAC-0000259','FACTURA','000-001-00072001    ','000-001-00065003    ','2023-11-02 03:54:11',902.02,6915.52,'FACTURADO',0.00,0.15,'',53,5,'VENTA',7000.00),(260,'ING-0000260','FACTURA','0000007','0000007','2023-11-02 03:54:11',60077.92,460597.42,'INGRESADO',0.00,0.15,'',NULL,5,'INGRESO',0.00),(261,'ING-0000261','FACTURA','0000008','0000008','2023-11-02 03:54:11',63168.75,484293.75,'INGRESADO',0.00,0.15,'',NULL,5,'INGRESO',0.00),(262,'FAC-0000262','FACTURA','000-001-00072001    ','000-001-00065004    ','2023-11-02 03:54:11',595.05,4558.90,'FACTURADO',3.15,0.15,'',57,5,'VENTA',4600.00),(263,'FAC-0000263','FACTURA','000-001-00072001    ','000-001-00065005    ','2023-11-02 03:54:11',5724.64,43888.89,'FACTURADO',0.00,0.15,'',58,5,'VENTA',45000.00),(264,'FAC-0000264','FACTURA','000-001-00072001    ','000-001-00065006    ','2023-11-02 03:54:11',1960.78,15032.68,'FACTURADO',0.00,0.15,'',51,5,'VENTA',16000.00),(265,'FAC-0000265','FACTURA','000-001-00072001    ','000-001-00065007    ','2023-11-02 03:54:11',201.00,1541.00,'FACTURADO',0.00,0.15,'',54,5,'VENTA',1600.00),(266,'ORD-0000266','','','','2023-11-02 03:54:11',1515.18,11616.38,'INICIADO',0.00,0.15,'',59,5,'ORDEN',0.00),(267,'ORD-0000267','','','','2023-11-02 03:54:11',981.20,7522.52,'INICIADO',0.00,0.15,'',60,5,'ORDEN',0.00),(268,'ORD-0000268','','','','2023-11-02 03:54:11',1197.35,9179.65,'INICIADO',0.00,0.15,'',61,5,'ORDEN',0.00),(269,'COT-0000269','','','','2023-11-02 03:54:11',1176.25,8959.45,'COTIZADO',58.50,0.15,'',53,34,'COTIZACION',0.00),(270,'ING-0000270','FACTURA','0000009','0000009','2023-11-02 03:54:11',2904.54,22268.14,'INGRESADO',0.00,0.15,'',NULL,5,'INGRESO',0.00),(271,'AJT-0000271','AJUSTE','0000010','0000010','2023-11-02 03:54:11',522.30,4004.30,'AJUSTE ANULADO',0.00,0.15,'',NULL,5,'AJUSTE',0.00),(272,'ING-0000272','FACTURA','0000010','0000010','2023-11-04 03:54:11',0.00,55712.00,'INGRESADO',0.00,0.99,'',NULL,5,'INGRESO',0.00),(273,'FAC-0000273','FACTURA','000-001-00072001    ','000-001-00065008    ','2023-11-04 03:54:11',2967.54,22751.14,'FACTURADO',0.00,0.15,'',53,5,'VENTA',22755.00),(274,'COT-0000274','','','','2023-11-04 03:54:11',499.50,3829.50,'COTIZADO',0.00,0.15,'',1,34,'COTIZACION',0.00),(275,'COT-0000275','','','','2023-11-04 03:54:11',499.50,3829.50,'COTIZADO',0.00,0.15,'',60,34,'COTIZACION',0.00),(276,'ORD-0000276','FACTURA','000-001-00072001    ','000-001-00065009    ','2023-11-04 03:54:11',384.52,2887.52,'ORDEN FACTURADA',60.50,0.15,'',57,34,'ORDEN',3000.00),(277,'ING-0000277','FACTURA','0000011','0000011','2023-11-04 03:54:11',13389.75,102654.75,'INGRESADO',0.00,0.15,'',NULL,5,'INGRESO',0.00),(278,'ING-0000278','FACTURA','0000012','0000012','2023-11-04 03:54:11',1314.60,10078.60,'ANULADO',0.00,0.15,'',NULL,5,'INGRESO',0.00),(279,'FAC-0000279','FACTURA','000-001-00072001    ','000-001-00065009    ','2023-11-01 03:54:11',1277.47,9791.87,'FACTURADO',2.10,0.15,'',66,5,'VENTA',9850.50),(280,'COT-0000280','','','','2023-11-01 03:54:11',44205.07,338905.52,'COTIZADO',0.00,0.15,'',1,34,'COTIZACION',0.00),(281,'ING-0000281','FACTURA','0000013','0000013','2023-11-01 03:54:11',3045.00,23345.00,'INGRESADO',0.00,0.15,'',NULL,5,'INGRESO',0.00),(282,'ING-0000282','FACTURA','0000014','0000014','2023-11-01 03:54:11',3495.00,26795.00,'INGRESADO',0.00,0.15,'',NULL,5,'INGRESO',0.00);
/*!40000 ALTER TABLE `transacciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad_medida`
--

DROP TABLE IF EXISTS `unidad_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidad_medida` (
  `unidad_id` int NOT NULL AUTO_INCREMENT,
  `unidad_nombre` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `unidad_abreviatura` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `unidad_fregistro` date DEFAULT NULL,
  `unidad_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`unidad_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad_medida`
--

LOCK TABLES `unidad_medida` WRITE;
/*!40000 ALTER TABLE `unidad_medida` DISABLE KEYS */;
INSERT INTO `unidad_medida` VALUES (1,'KILO','KL','2021-09-27','ACTIVO'),(2,'MINILITROS','MN','2021-09-27','ACTIVO'),(3,'LITROS','L','2021-09-27','ACTIVO'),(4,'MILILITROS','MLL','2021-09-27','ACTIVO'),(5,'Unidad','Ud','2021-10-08','ACTIVO'),(6,'KILOGRAMO','KG','2021-11-26','ACTIVO');
/*!40000 ALTER TABLE `unidad_medida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `usuario_id` int NOT NULL AUTO_INCREMENT,
  `usuario_nombre` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `usuario_password` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `usuario_intento` int NOT NULL,
  `usuario_estatus` enum('ACTIVO','INACTIVO') CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci NOT NULL,
  `rol_id` int NOT NULL DEFAULT '0',
  `usuario_imagen` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `persona_id` int DEFAULT NULL,
  `usuario_tipo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT 'USUARIO',
  `usuario_passwordtemp` int DEFAULT '0',
  PRIMARY KEY (`usuario_id`) USING BTREE,
  UNIQUE KEY `usuario_nombre` (`usuario_nombre`) USING BTREE,
  KEY `FK_USUARIO_ROL` (`rol_id`) USING BTREE,
  KEY `FK_USUARIO_PERSONA` (`persona_id`) USING BTREE,
  CONSTRAINT `FK_USUARIO_PERSONA` FOREIGN KEY (`persona_id`) REFERENCES `persona` (`persona_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_USUARIO_ROL` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`rol_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (4,'admin','$2y$10$hw3VM6c9.vVezW6LANsjXOqOcBI0wKtCjW9.zaSMO9c5i6nk19tjq',1,'ACTIVO',1,'controlador/usuario/img/user_default.png',2,'USUARIO',1),(5,'bAlvarez01','$2y$10$7XdB.VeWo/O5wfSSUGGcAOGShwA3AEzQHlZ8SdmCsj9ejUBTf5VnG',1,'ACTIVO',1,'controlador/usuario/img/user_default.png',1,'USUARIO',0),(34,'emanuel','$2y$10$YKNIZBr60yI4VXQ2/BJ3P.PGTg3vnqoqJZ.N4S/gvdGpK5Ov57JdS',1,'ACTIVO',1,'controlador/usuario/img/user_default.png',51,'USUARIO',0),(35,'marlon01','$2y$10$FCfbluQgTeJPwm7lRSiMxu6aRZHpcIRVXd3GexlLWeSkMC9YioAa.',1,'ACTIVO',14,'controlador/usuario/img/user_default.png',52,'USUARIO',0),(36,'artur01','$2y$10$bPY4SsL4MU9YZeKuP7Eueu5TjS.3jUfs0aFK45kocDFFQVO.IsnM2',1,'ACTIVO',14,'controlador/usuario/img/user_default.png',56,'USUARIO',0),(39,'MecanicoPrueba','$2y$10$MrcaKg9EAkfOVVUKrZXKe.ySVTV8DOHNnn7R6LWx/T1hntB7iGDvC',1,'ACTIVO',14,'controlador/usuario/img/user_default.png',62,'USUARIO',0);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehiculo`
--

DROP TABLE IF EXISTS `vehiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehiculo` (
  `id_vehiculo` int NOT NULL AUTO_INCREMENT,
  `vehiculo_placa` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `vehiculo_anio` year DEFAULT NULL,
  `vehiculo_transmision` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `vehiculo_tipo_combustible` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `vehiculo_num_chasis` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `vehiculo_num_motor` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `vehiculo_observaciones` text CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci,
  `vehiculo_imagen` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `vehiculo_tipo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `vehiculo_estado` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish_ci DEFAULT NULL,
  `id_modelo` int DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  PRIMARY KEY (`id_vehiculo`) USING BTREE,
  KEY `fk_vehiculo_modelo` (`id_modelo`) USING BTREE,
  KEY `fk_vehiculo_cliente` (`id_cliente`) USING BTREE,
  CONSTRAINT `fk_vehiculo_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`cliente_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vehiculo_modelo` FOREIGN KEY (`id_modelo`) REFERENCES `modelo` (`id_modelo`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehiculo`
--

LOCK TABLES `vehiculo` WRITE;
/*!40000 ALTER TABLE `vehiculo` DISABLE KEYS */;
INSERT INTO `vehiculo` VALUES (11,'HAB1245',2015,'MANUAL','GASOLINA','12459845','45856954','El auto tiene los vidrios polarizados, es de color rojo y presenta pegatina de rayos','controlador/vehiculo/img/vehiculo_default.png','LIVIANO','ACTIVO',7,23),(12,'JSD45785',2014,'MANUAL','GASOLINA','458548759','585482585','Esta es una descripcion','controlador/vehiculo/img/vehiculo_default.png','LIVIANO','ACTIVO',12,23),(13,'HN125006',2018,'AUTOMATICA','GASOLINA','ACD-80225F-RRG552','BDF-5885B-NOP7987','Automóvil de ultima generación','controlador/vehiculo/img/vehiculo_default.png','LIVIANO','ACTIVO',8,24),(14,'HN10050',2018,'MANUAL','GASOLINA','ADB4-DFG5666-HHJK654654','CHBN-052FV6-HHJK65400','Esta es una observacion','controlador/vehiculo/img/vehiculo_default.png','LIVIANO','ACTIVO',11,25),(15,'HN89071',2020,'MANUAL','GASOLINA','ADB4-DFG5666-HHJK654655','CHBN-072FV6-HHJK65400','Descripcion','controlador/vehiculo/img/vehiculo_default.png','LIVIANO','ACTIVO',14,26),(16,'HN-N2347',2020,'MANUAL','GASOLINA','ADB4-DFG866-HHJK654655','JFBS-052FV6-HHJK65401','Automovil','controlador/vehiculo/img/vehiculo_default.png','LIVIANO','ACTIVO',15,27),(17,'HAB1247',2015,'MANUAL','GASOLINA','458548758','5586894444','Esta es una descripcion','controlador/vehiculo/img/vehiculo_default.png','LIVIANO','ACTIVO',11,24);
/*!40000 ALTER TABLE `vehiculo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_mecanisoft'
--
/*!50003 DROP FUNCTION IF EXISTS `strSplit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `strSplit`(cadena VARCHAR(255), delimitador VARCHAR(12), posicion INT) RETURNS varchar(255) CHARSET utf8mb4 COLLATE utf8mb4_spanish_ci
BEGIN
     RETURN ltrim(replace(substring(substring_index(cadena, delimitador, posicion), length(substring_index(cadena, delimitador, posicion - 1)) + 1), delimitador, ''));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ACTUALIZAR_DATOS_PERSONA_PROFILE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACTUALIZAR_DATOS_PERSONA_PROFILE`(IN ID INT,
	IN NOMBRE VARCHAR(100), 
	IN APELLIDO_PATERNO VARCHAR(50), 
	IN APELLIDO_MATERNO VARCHAR(50), 
	IN TIPO_DOCUMENTO VARCHAR(15), 
	IN N_DOCUMENTO VARCHAR(17), 
	IN SEXO VARCHAR(15),
	IN TELEFONO VARCHAR(17),
	IN CORREO VARCHAR(70))
BEGIN
	DECLARE DOCUMENTO_ACTUAL INT;
	DECLARE CANTIDAD INT;
	DECLARE ID_PERSONA INT;
	SET @ID_PERSONA:=(SELECT persona_id FROM usuario WHERE usuario_id = ID);
	SET @DOCUMENTO_ACTUAL:=(SELECT persona_nrodocumento FROM persona WHERE persona_id = @ID_PERSONA);
	
	IF @DOCUMENTO_ACTUAL = N_DOCUMENTO THEN
		UPDATE persona SET 
			persona_nombre = NOMBRE, 
			persona_apepat = APELLIDO_PATERNO, 
			persona_apmat = APELLIDO_MATERNO, 
			persona_tipodocumento = TIPO_DOCUMENTO, 
			persona_sexo = SEXO,
			persona_telefono = TELEFONO,
			persona_correo = CORREO
		WHERE persona_id = @ID_PERSONA;
		SELECT 1; 
	ELSE
		SET @CANTIDAD:=(SELECT COUNT(*) FROM persona WHERE persona_nrodocumento = N_DOCUMENTO OR persona_correo = CORREO);
		IF @CANTIDAD = 0 THEN
		UPDATE persona SET 
			persona_nombre = NOMBRE, 
			persona_apepat = APELLIDO_PATERNO, 
			persona_apmat = APELLIDO_MATERNO, 
			persona_nrodocumento = N_DOCUMENTO, 
			persona_tipodocumento = TIPO_DOCUMENTO, 
			persona_sexo = SEXO,
			persona_telefono = TELEFONO,
			persona_correo = CORREO
		WHERE persona_id = @ID_PERSONA;
		SELECT 1; 
	ELSE
		SELECT 2;
	END IF;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ACTUALIZAR_PASSWORD_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACTUALIZAR_PASSWORD_USUARIO`(IN ID INT, IN CONTRASENA VARCHAR(250), IN TEMPORAL INT)
UPDATE usuario set usuario_password = CONTRASENA, usuario_passwordtemp = TEMPORAL WHERE usuario_id = ID ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_AGREGAR_OFERTA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AGREGAR_OFERTA`(IN OFERTA INT, IN DESCUENTO DECIMAL(2,2), IN ID_PRODUCTO INT)
UPDATE producto SET producto_oferta = OFERTA, producto_descuento = DESCUENTO WHERE producto_id
 = ID_PRODUCTO ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ANULAR_INGRESO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ANULAR_INGRESO`(IN ID_INGRESO INT)
BEGIN
		DECLARE CANTIDAD INT;
	DECLARE ID_PRODUCTO INT;
	DECLARE STOCK_ACTUAL INT;
	DECLARE DETALLE_ID INT;
	
	UPDATE transacciones SET transaccion_estatus = 'ANULADO' WHERE transaccion_id = ID_INGRESO;
	SET @CANTIDAD:=(SELECT COUNT(*) FROM detalle_transaccion WHERE transaccion_id = ID_INGRESO);
	
	WHILE @CANTIDAD > 0 DO
		SET @ID_PRODUCTO:=(SELECT producto_id FROM detalle_transaccion WHERE detalletransaccion_estatus = 'INGRESADO' AND transaccion_id = ID_INGRESO LIMIT 1);
		
		SET @DETALLE_ID:=(SELECT detalletransaccion_id FROM detalle_transaccion WHERE detalletransaccion_estatus = 'INGRESADO' AND transaccion_id = ID_INGRESO LIMIT 1);
		
		SET @STOCK_ACTUAL:=(SELECT producto_stock FROM producto WHERE producto_id = @ID_PRODUCTO);
		
		UPDATE producto SET producto_stock = @STOCK_ACTUAL-(SELECT detalletransaccion_cantidad FROM detalle_transaccion WHERE detalletransaccion_estatus = 'INGRESADO' AND transaccion_id = ID_INGRESO LIMIT 1) WHERE producto_id = @ID_PRODUCTO;
		
		UPDATE detalle_transaccion SET detalletransaccion_estatus = 'ANULADO' WHERE detalletransaccion_id = @DETALLE_ID;
		SET @CANTIDAD:= @CANTIDAD - 1;
	END WHILE;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ANULAR_MOVIMIENTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ANULAR_MOVIMIENTO`(IN ID_TRANSACCION INT)
BEGIN
	DECLARE CANTIDAD INT;
	DECLARE ID_PRODUCTO INT;
	DECLARE STOCK_ACTUAL INT;
	DECLARE DETALLE_ID INT;
	
	UPDATE transacciones SET transaccion_estatus = 'MOVIMIENTO ANULADO' WHERE transaccion_id = ID_TRANSACCION;
	SET @CANTIDAD:=(SELECT COUNT(*) FROM detalle_transaccion WHERE transaccion_id = ID_TRANSACCION);
	
	WHILE @CANTIDAD > 0 DO
		SET @ID_PRODUCTO:=(SELECT producto_id FROM detalle_transaccion WHERE detalletransaccion_estatus = 'MOVIMIENTO' AND transaccion_id = ID_TRANSACCION LIMIT 1);
		
		SET @DETALLE_ID:=(SELECT detalletransaccion_id FROM detalle_transaccion WHERE detalletransaccion_estatus = 'MOVIMIENTO' AND transaccion_id = ID_TRANSACCION LIMIT 1);
		
		SET @STOCK_ACTUAL:=(SELECT producto_stock FROM producto WHERE producto_id = @ID_PRODUCTO);
		
		UPDATE producto SET producto_stock = @STOCK_ACTUAL + (SELECT detalletransaccion_cantidad FROM detalle_transaccion WHERE detalletransaccion_estatus = 'MOVIMIENTO' AND transaccion_id = ID_TRANSACCION LIMIT 1) WHERE producto_id = @ID_PRODUCTO;
		
		UPDATE detalle_transaccion SET detalletransaccion_estatus = 'MOVIMIENTO ANULADO' WHERE detalletransaccion_id = @DETALLE_ID;
		SET @CANTIDAD:= @CANTIDAD - 1;
	END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ANULAR_ORDEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ANULAR_ORDEN`(IN ID INT)
BEGIN
	UPDATE transacciones SET transaccion_estatus = 'ORDEN ANULADA'
	WHERE transaccion_id = ID;
	
	UPDATE detalle_transaccion SET detalle_transaccion.detalletransaccion_estatus = 'ORDEN ANULADA' 
	WHERE transaccion_id = ID;
	
	SELECT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ANULAR_VENTA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ANULAR_VENTA`(IN ID_VENTA INT)
BEGIN
		DECLARE CANTIDAD INT;
	DECLARE ID_PRODUCTO INT;
	DECLARE STOCK_ACTUAL INT;
	DECLARE DETALLE_ID INT;
	
	UPDATE transacciones SET transaccion_estatus = 'VENTA ANULADA' WHERE transaccion_id = ID_VENTA;
	SET @CANTIDAD:=(SELECT COUNT(*) FROM detalle_transaccion WHERE transaccion_id = ID_VENTA);
	
	WHILE @CANTIDAD > 0 DO
		SET @ID_PRODUCTO:=(SELECT producto_id FROM detalle_transaccion WHERE detalletransaccion_estatus = 'FACTURADO' AND transaccion_id = ID_VENTA LIMIT 1);
		
		SET @DETALLE_ID:=(SELECT detalletransaccion_id FROM detalle_transaccion WHERE detalletransaccion_estatus = 'FACTURADO' AND transaccion_id = ID_VENTA LIMIT 1);
		
		SET @STOCK_ACTUAL:=(SELECT producto_stock FROM producto WHERE producto_id = @ID_PRODUCTO);
		
		UPDATE producto SET producto_stock = @STOCK_ACTUAL + (SELECT detalletransaccion_cantidad FROM detalle_transaccion WHERE detalletransaccion_estatus = 'FACTURADO' AND transaccion_id = ID_VENTA LIMIT 1) WHERE producto_id = @ID_PRODUCTO;
		
		UPDATE detalle_transaccion SET detalletransaccion_estatus = 'VENTA ANULADA' WHERE detalletransaccion_id = @DETALLE_ID;
		SET @CANTIDAD:= @CANTIDAD - 1;
	END WHILE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_COMP_DET_ORDEN_ELIM` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_COMP_DET_ORDEN_ELIM`(IN ID INT)
BEGIN
	SELECT 
	COUNT(tarea.detalletransaccion_id) as cuenta
FROM detalle_transaccion INNER JOIN tarea ON detalle_transaccion.detalletransaccion_id = tarea.detalletransaccion_id
WHERE detalle_transaccion.detalletransaccion_id = ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_COMP_ORDEN_FINALIZADA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_COMP_ORDEN_FINALIZADA`(IN ID INT)
BEGIN
	SELECT
	COUNT(*)
	FROM (SELECT 
					dt.detalletransaccion_id,
					IFNULL(t.estado, "PENDIENTE") as estado
				FROM detalle_transaccion dt INNER JOIN producto p ON dt.producto_id = p.producto_id 
																		LEFT JOIN tarea t ON dt.detalletransaccion_id = t.detalletransaccion_id 
				WHERE dt.transaccion_id = ID
				AND p.prod_serv_tipo = "SERVICIO") as t
				WHERE t.estado = "PENDIENTE";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_ACCESO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_ACCESO`(IN USUARIO INT,
	IN MODULO VARCHAR(100))
BEGIN
		DECLARE ESTADO VARCHAR(50);
		
		SELECT
		 acceso_estado 
		 INTO ESTADO
		FROM acceso 
			WHERE modulo_codigo = MODULO 
			AND usuario_id = USUARIO;
		
		IF ESTADO = 'ACTIVO' THEN
			
			SET	ESTADO = 'INACTIVO';
		
		ELSE  
		 SET	ESTADO = 'ACTIVO';
		END IF;
		
		UPDATE acceso SET acceso_estado = ESTADO WHERE modulo_codigo = MODULO 
			AND usuario_id = USUARIO;
		
		SELECT 1; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_CATEGORIA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_CATEGORIA`(IN ID INT, IN CATEGORIA_ACTUAL VARCHAR(25), IN CATEGORIA_NUEVO VARCHAR(25), IN ESTATUS VARCHAR(10))
BEGIN
	DECLARE CANTIDAD INT;
	DECLARE CANTIDAD_REG INT;
	
	IF ESTATUS = 'INACTIVO' THEN
		SET @CANTIDAD_REG:=(SELECT COUNT(*) FROM producto WHERE categoria_id = ID);
		IF @CANTIDAD_REG = 0 THEN
			IF CATEGORIA_ACTUAL = CATEGORIA_NUEVO THEN
				UPDATE categoria SET categoria_estatus = ESTATUS WHERE categoria_id = ID;
				SELECT 1; 
			ELSE
				SET @CANTIDAD := (SELECT COUNT(*) FROM categoria WHERE categoria_nombre = CATEGORIA_NUEVO);
				
				IF @CANTIDAD = 0 THEN 
					UPDATE categoria SET categoria_nombre = CATEGORIA_NUEVO, categoria_estatus = ESTATUS WHERE categoria_id = ID;
					SELECT 1; 
				ELSE 
					SELECT 2; 
				END IF;
			END IF;
		ELSE
			SELECT 3;
		END IF;

	ELSE
	
		IF CATEGORIA_ACTUAL = CATEGORIA_NUEVO THEN
			UPDATE categoria SET categoria_estatus = ESTATUS WHERE categoria_id = ID;
			SELECT 1; 
		ELSE
			SET @CANTIDAD := (SELECT COUNT(*) FROM categoria WHERE categoria_nombre = CATEGORIA_NUEVO);
			
			IF @CANTIDAD = 0 THEN 
				UPDATE categoria SET categoria_nombre = CATEGORIA_NUEVO, categoria_estatus = ESTATUS WHERE categoria_id = ID;
				SELECT 1; 
			ELSE 
				SELECT 2; 
			END IF;
		END IF;
	END IF;
		
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_CLIENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_CLIENTE`(IN NOMBRE VARCHAR(100), 
	IN APELLIDO_PATERNO VARCHAR(50), 
	IN APELLIDO_MATERNO VARCHAR(50), 
	IN CORREO VARCHAR(70),
	IN N_DOCUMENTO VARCHAR(17),
	IN TELEFONO VARCHAR(17),
	IN TIPO_DOCUMENTO VARCHAR(15), 
	IN SEXO VARCHAR(15),
	IN ID_PERSONA INT,
	IN EMPRESA VARCHAR(100))
BEGIN
	DECLARE CANTIDAD INT;
	DECLARE CANTIDAD_CORREO INT;
	DECLARE RTN_ACTUAL VARCHAR(17);
	DECLARE CORREO_ACTUAL VARCHAR(17);
	
	SET @RTN_ACTUAL:=(SELECT persona_nrodocumento FROM persona WHERE persona_id = ID_PERSONA);
	SET @CORREO_ACTUAL:=(SELECT persona_correo FROM persona WHERE persona_id = ID_PERSONA);
	
			IF @RTN_ACTUAL = N_DOCUMENTO OR @CORREO_ACTUAL = CORREO THEN 
			
				IF @CORREO_ACTUAL = CORREO AND @RTN_ACTUAL = N_DOCUMENTO THEN 
							
						UPDATE persona SET persona_nombre = NOMBRE, persona_apepat = APELLIDO_PATERNO, persona_apmat = APELLIDO_MATERNO, persona_telefono = TELEFONO, persona_sexo = SEXO, persona_empresa = EMPRESA WHERE persona_id = ID_PERSONA;
						SELECT 1;

				ELSE 
					SET @CANTIDAD:=(SELECT COUNT(*) FROM persona WHERE persona_nrodocumento = N_DOCUMENTO);
					SET @CANTIDAD_CORREO:=(SELECT COUNT(*) FROM persona WHERE persona_correo = CORREO);
					
					IF @RTN_ACTUAL = N_DOCUMENTO THEN 
							IF @CANTIDAD_CORREO = 0 THEN 
									UPDATE persona SET persona_nombre = NOMBRE, persona_apepat = APELLIDO_PATERNO, persona_apmat = APELLIDO_MATERNO	, persona_correo = CORREO, persona_telefono = TELEFONO, persona_sexo = SEXO, persona_empresa = EMPRESA WHERE persona_id = ID_PERSONA;
								 SELECT 1;
									
							ELSE 
							
								SELECT 3;
								
							END IF; 
							
					ELSE 
				
						IF @CORREO_ACTUAL = CORREO THEN 
							IF @CANTIDAD = 0 THEN 
									UPDATE persona SET persona_nombre = NOMBRE, persona_apepat = APELLIDO_PATERNO, persona_apmat = APELLIDO_MATERNO	, persona_nrodocumento = N_DOCUMENTO, persona_telefono = TELEFONO, persona_sexo = SEXO, persona_empresa = EMPRESA WHERE persona_id = ID_PERSONA;
								 SELECT 1;
							ELSE 
								SELECT 2;
							END IF; 
						
						ELSE 
							SELECT 4;
						
						END IF; 
					
					END IF; 
					
				END IF; 
				
		
				
			ELSE 
			
				SET @CANTIDAD:=(SELECT COUNT(*) FROM persona WHERE persona_nrodocumento = N_DOCUMENTO);
				SET @CANTIDAD_CORREO:=(SELECT COUNT(*) FROM persona WHERE persona_correo = CORREO);
				
				IF @CANTIDAD = 0 AND @CANTIDAD_CORREO = 0 THEN
						
						UPDATE persona SET persona_nombre = NOMBRE, persona_apepat = APELLIDO_PATERNO, persona_apmat = APELLIDO_MATERNO, persona_correo = CORREO, persona_nrodocumento = N_DOCUMENTO, persona_telefono = TELEFONO, persona_tipodocumento = TIPO_DOCUMENTO, persona_sexo = SEXO, persona_empresa = EMPRESA WHERE persona_id = ID_PERSONA;
						SELECT 1;
				ELSE
				
					IF @CANTIDAD > 0 THEN
						SELECT 2;
					ELSEIF @CANTIDAD_CORREO > 0 THEN
						SELECT 3;
					ELSE
						SELECT 4;
					END IF;
				
				END IF;
			
			END IF; 
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_CONFIGURACION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_CONFIGURACION`(IN ID_CONFIGURACION INT,
IN NOMBRE VARCHAR(255),
IN DIRECCION VARCHAR(255),
IN TELEFONO VARCHAR(20),
IN CELULAR VARCHAR(20),
IN RTN VARCHAR(100),
IN CORREO VARCHAR(100),
IN ISV DECIMAL(2,2),
IN CAI VARCHAR(255),
IN FECHALIMITE DATE,
IN CANTIDADFACTURA INT,
IN NUMERO_INICIAL VARCHAR(50),
IN NUMERO_FINAL VARCHAR(50),
IN PRECIO_DOLAR DECIMAL(5,2))
BEGIN
	DECLARE CANTIDAD INT;
	DECLARE CONF_ACTUAL VARCHAR(255);
	SET @CONF_ACTUAL:=(SELECT conf_nombre_empresa FROM configuracion WHERE conf_id = ID_CONFIGURACION);
	
	IF @CONF_ACTUAL = NOMBRE THEN 
			UPDATE configuracion SET 
				conf_direccion = DIRECCION, 
				conf_telefono = TELEFONO, 
				conf_celular = CELULAR, 
				conf_rtn = RTN,
				conf_correo = CORREO,
				conf_isv = ISV,
				conf_cai = CAI,
				conf_fact_fechalimite_emision = FECHALIMITE,
				conf_cantidad_fact = CANTIDADFACTURA,
				conf_numero_inicial = NUMERO_INICIAL,
				conf_numero_final = NUMERO_FINAL,
				conf_preciodolar = PRECIO_DOLAR
			WHERE conf_id = ID_CONFIGURACION;
			SELECT 1;
	ELSE
		SET @CANTIDAD:=(SELECT COUNT(*) FROM configuracion WHERE conf_nombre_empresa = NOMBRE);
		
		IF @CANTIDAD = 0 THEN
			UPDATE configuracion SET conf_nombre_empresa = NOMBRE, 
				conf_direccion = DIRECCION, 
				conf_telefono = TELEFONO, 
				conf_celular = CELULAR, 
				conf_rtn = RTN,
				conf_correo = CORREO,
				conf_isv = ISV,
				conf_cai = CAI,
				conf_fact_fechalimite_emision = FECHALIMITE,
				conf_cantidad_fact = CANTIDADFACTURA,
				conf_numero_inicial = NUMERO_INICIAL,
				conf_numero_final = NUMERO_FINAL,
				conf_preciodolar = PRECIO_DOLAR
			WHERE conf_id = ID_CONFIGURACION;
			SELECT 1;
		ELSE 
			SELECT 2;
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_CONFIGURACION_FOTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_CONFIGURACION_FOTO`(IN ID INT,
IN IMAGEN VARCHAR(255))
BEGIN
	UPDATE configuracion SET conf_img_logo = IMAGEN WHERE conf_id = ID;
	SELECT 1; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_COTIZACION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_COTIZACION`(IN ID_COTIZACION INT,
IN ID_CLIENTE INT, 
IN ID_USUARIO INT,
IN TOTAL DECIMAL(10,2), 
IN IMPUESTO DECIMAL(10,2), 
IN PORCENTAJE DECIMAL(2,2),
IN DESCUENTO DECIMAL(10,2),
IN OBSER TEXT)
BEGIN
	
		UPDATE transacciones 
			SET persona_id = ID_CLIENTE,
					usuario_id = ID_USUARIO,
					transaccion_total = TOTAL,
					transaccion_impuesto = IMPUESTO,
					transaccion_porcentaje = PORCENTAJE,
					transaccion_descuento = DESCUENTO,
					transaccion_observaciones = OBSER,
					transaccion_fecha = NOW()
		WHERE transaccion_id = ID_COTIZACION;
		
		SELECT ID_COTIZACION;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_DETALLE_ORDEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_DETALLE_ORDEN`(IN TRANSACCION INT(11), 
IN VEHICULO INT(11),
IN COMBUSTIBLE VARCHAR(20), 
IN KILOMETRAJE VARCHAR(20), 
IN MECANICO INT(11),
IN OBSER TEXT)
BEGIN

 	UPDATE transaccion_vehiculo SET 
		nivel_combustible = COMBUSTIBLE, 
		`vehiculo_km/millas` = KILOMETRAJE, 
		id_usuario = MECANICO, 
		descripcion = OBSER
 	WHERE id_transaccion = TRANSACCION;
		
	SELECT TRANSACCION;	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_ESTATUS_CLIENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_ESTATUS_CLIENTE`(IN ID_CLIENTE INT,IN ESTATUS VARCHAR(10))
UPDATE cliente SET cliente_estatus = ESTATUS WHERE cliente_id = ID_CLIENTE ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_ESTATUS_PERSONA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_ESTATUS_PERSONA`(IN ID_PERSONA INT,IN ESTATUS VARCHAR(10))
UPDATE persona SET persona_estatus = ESTATUS WHERE persona_id = ID_PERSONA ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_ESTATUS_PROVEEDOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_ESTATUS_PROVEEDOR`(IN ID_PROVEEDOR INT,IN ESTATUS VARCHAR(10))
UPDATE proveedor SET proveedor_estatus = ESTATUS WHERE proveedor_id = ID_PROVEEDOR ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_FABRICANTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_FABRICANTE`(IN ID INT, 
	IN FABRICANTE_ACTUAL VARCHAR(80), 
	IN FABRICANTE_NUEVO VARCHAR(80), 
	IN ESTATUS VARCHAR(10), 
	IN DESCRIPCION TEXT)
BEGIN
	DECLARE CANTIDAD INT;
	DECLARE CANTIDAD_REG INT;
	
	IF ESTATUS = 'INACTIVO' THEN
		SET @CANTIDAD_REG:=(SELECT COUNT(*) FROM producto WHERE id_fabricante = ID);
		IF @CANTIDAD_REG = 0 THEN
			IF FABRICANTE_ACTUAL = FABRICANTE_NUEVO THEN
		UPDATE fabricante SET fabricante_estado = ESTATUS, fabricante_descripcion = DESCRIPCION WHERE id_fabricante = ID;
		SELECT 1; 
	ELSE
		SET @CANTIDAD := (SELECT COUNT(*) FROM fabricante WHERE fabricante_nombre = FABRICANTE_NUEVO);
		
		IF @CANTIDAD = 0 THEN 
			UPDATE fabricante SET fabricante_nombre = FABRICANTE_NUEVO, fabricante_descripcion = ESTATUS, fabricante_descripcion = DESCRIPCION WHERE 				id_fabricante = ID;
			SELECT 1; 
		ELSE 
			SELECT 2; 
		END IF;
	END IF;		
		ELSE
			SELECT 3;
		END IF;

		
	ELSE
		
		IF FABRICANTE_ACTUAL = FABRICANTE_NUEVO THEN
			UPDATE fabricante SET fabricante_estado = ESTATUS, fabricante_descripcion = DESCRIPCION WHERE id_fabricante = ID;
			SELECT 1; 
		ELSE
			SET @CANTIDAD := (SELECT COUNT(*) FROM fabricante WHERE fabricante_nombre = FABRICANTE_NUEVO);
			
			IF @CANTIDAD = 0 THEN 
				UPDATE fabricante SET fabricante_nombre = FABRICANTE_NUEVO, fabricante_descripcion = ESTATUS, fabricante_descripcion = DESCRIPCION WHERE 			id_fabricante = ID;
				SELECT 1; 
			ELSE 
				SELECT 2; 
			END IF;
		END IF;		
		
		
	END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_MARCA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_MARCA`(IN ID_USUARIO_CAMBIO INT,
		IN ID INT, 
		IN MARCA_ACTUAL VARCHAR(45), 
		IN MARCA_NUEVO VARCHAR(45), 
		IN ESTADO VARCHAR(20), 
		IN DESCRIPCION TEXT)
BEGIN
	DECLARE CANTIDAD INT;
	DECLARE CANTIDAD_REG INT;
	
	IF ESTADO = 'INACTIVO' THEN
		SET @CANTIDAD_REG:=(SELECT COUNT(*) FROM modelo WHERE id_marca = ID);
		IF @CANTIDAD_REG = 0 THEN
		
			IF MARCA_ACTUAL = MARCA_NUEVO THEN
		UPDATE marca SET marca_estado = ESTADO, marca_descripcion = DESCRIPCION WHERE id_marca = ID;
		INSERT INTO bitacora_marca (accion, fecha_hora, descripcion) VALUES('EDITAR', NOW(), CONCAT_WS(' ','El usuario con id:', CONVERT(ID_USUARIO_CAMBIO,CHAR), 'edito datos de la marca', MARCA_ACTUAL,'-', ID));
		SELECT 1; 
	ELSE
		SET @CANTIDAD := (SELECT COUNT(*) FROM marca WHERE marca_nombre = MARCA_NUEVO);
		
		IF @CANTIDAD = 0 THEN 
			UPDATE marca SET marca_nombre = MARCA_NUEVO, marca_descripcion = DESCRIPCION, marca_estado = ESTADO WHERE id_marca = ID;
			
			SELECT 1; 
		ELSE 
			SELECT 2; 
		END IF;
	END IF;
	
		ELSE
			SELECT 3;
	END IF;

	ELSE
	
		IF MARCA_ACTUAL = MARCA_NUEVO THEN
		UPDATE marca SET marca_estado = ESTADO, marca_descripcion = DESCRIPCION WHERE id_marca = ID;
		INSERT INTO bitacora_marca (accion, fecha_hora, descripcion) VALUES('EDITAR', NOW(), CONCAT_WS(' ','El usuario con id:', CONVERT(    ID_USUARIO_CAMBIO,CHAR), 'edito datos de la marca', MARCA_ACTUAL,'-', ID));
		SELECT 1; 
	ELSE
		SET @CANTIDAD := (SELECT COUNT(*) FROM marca WHERE marca_nombre = MARCA_NUEVO);
		
		IF @CANTIDAD = 0 THEN 
			UPDATE marca SET marca_nombre = MARCA_NUEVO, marca_descripcion = DESCRIPCION, marca_estado = ESTADO WHERE id_marca = ID;
			
			SELECT 1; 
		ELSE 
			SELECT 2; 
		END IF;
END IF;
	END IF;
		
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_MODELO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_MODELO`(IN ID_USUARIOG INT,
	IN ID_MODEL INT, 
	IN MODELO_ACTUAL VARCHAR(80), 
	IN MODELO_NUEVO VARCHAR(80), 
	IN ESTATUS VARCHAR(45),
	IN DESCRIPCION TEXT,
	IN ID_MARCA INT)
BEGIN
	DECLARE CANTIDAD INT;
	DECLARE CANT INT;
	
	SET	@CANT :=(SELECT COUNT(*) FROM modelo INNER JOIN vehiculo ON modelo.id_modelo = vehiculo.id_modelo WHERE modelo.id_modelo  = ID_MODEL); 
	
	IF @CANT>0 THEN
		SELECT 3;
	END IF;
	
	IF MODELO_ACTUAL = MODELO_NUEVO THEN
		UPDATE modelo SET modelo_estado=ESTATUS, modelo_descripcion=DESCRIPCION, id_marca=ID_MARCA WHERE id_modelo=ID_MODEL;
		SELECT 1; 
		
		
	ELSE
		SET @CANTIDAD := (SELECT COUNT(*) FROM modelo WHERE modelo_nombre = MODELO_NUEVO);
		
		IF @CANTIDAD = 0 THEN 
			UPDATE modelo SET modelo_nombre = MODELO_NUEVO, modelo_estado = ESTATUS, modelo_descripcion = DESCRIPCION, id_marca = ID_MARCA WHERE id_modelo =ID_MODEL;
			SELECT 1; 
		ELSE 
			SELECT 2; 
		END IF;
END IF;		
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_MOVIMIENTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_MOVIMIENTO`(IN OBSERVACION TEXT,
	IN ID_USUARIO INT,
	IN ID_TRANSACCION INT)
BEGIN
	UPDATE transacciones SET transaccion_observaciones = OBSERVACION, usuario_id = ID_USUARIO, transaccion_estatus = 'MOVIMIENTO' WHERE transaccion_id = ID_TRANSACCION;
	
	SELECT ID_TRANSACCION;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_ORDEN_TRABAJO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_ORDEN_TRABAJO`(IN ID_ORD INT, 
IN ID_CLIENTE INT, 
IN ID_USUARIO INT,
IN TOTAL DECIMAL(10,2), 
IN IMPUESTO DECIMAL(10,2), 
IN PORCENTAJE DECIMAL(2,2),
IN DESCUENTO DECIMAL(10,2),
IN OBSER TEXT)
BEGIN

	UPDATE transacciones SET
		persona_id = ID_CLIENTE, 
		usuario_id = ID_USUARIO,  
		transaccion_impuesto = IMPUESTO, 
		transaccion_total = TOTAL,  
		transaccion_porcentaje = PORCENTAJE,
		transaccion_descuento = DESCUENTO, 
		transaccion_observaciones = OBSER
	WHERE transaccion_id = ID_ORD;

	SELECT ID_ORD;	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_PERSONA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_PERSONA`(IN ID_PERSONA INT, 
	IN NOMBRE VARCHAR(100), 
	IN APELLIDO_PATERNO VARCHAR(50), 
	IN APELLIDO_MATERNO VARCHAR(50), 
	IN TIPO_DOCUMENTO VARCHAR(15), 
	IN N_DOCUMENTO_A VARCHAR(17),
	IN N_DOCUMENTO_N VARCHAR(17),	
	IN SEXO VARCHAR(15),
	IN TELEFONO VARCHAR(17),
	IN ESTATUS VARCHAR(10))
BEGIN
DECLARE CANTIDAD INT;

IF N_DOCUMENTO_A = N_DOCUMENTO_N THEN
	UPDATE persona SET persona_nombre = NOMBRE, 
		persona_apepat = APELLIDO_PATERNO, 
		persona_apmat = APELLIDO_MATERNO, 
		persona_tipodocumento = TIPO_DOCUMENTO, 
		persona_sexo = SEXO,
		persona_telefono = TELEFONO, 
		persona_estatus = ESTATUS
	WHERE persona_id = ID_PERSONA;	
	SELECT 1; 
ELSE
	SET @CANTIDAD:=(SELECT COUNT(*) FROM persona WHERE persona_nrodocumento = N_DOCUMENTO_N);
	IF @CANTIDAD = 0 THEN
		UPDATE persona SET persona_nombre = NOMBRE, 
			persona_apepat = APELLIDO_PATERNO, 
			persona_apmat = APELLIDO_MATERNO, 
			persona_tipodocumento = TIPO_DOCUMENTO, 
			persona_nrodocumento = N_DOCUMENTO_N,
			persona_sexo = SEXO,
			persona_telefono = TELEFONO, 
			persona_estatus = ESTATUS
		WHERE persona_id = ID_PERSONA;
		SELECT 1; 
	ELSE
		SELECT 2; 
	END IF;

END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_PRODUCTO`(IN ID_PRODUCTO INT,
IN PRODUCTO VARCHAR(150),
IN CATEGORIA INT, 
IN UNIDAD INT,
IN PRECIO DECIMAL(10,2),
IN ESTATUS VARCHAR(12),
IN DESCRIPCION VARCHAR(255),
IN PRECIO_COMPRA DECIMAL(10,2),
IN STOCK_MINIMO INT,
IN ID_FABRICANTE INT)
BEGIN
	DECLARE CANTIDAD INT;
	DECLARE PRODUCTO_ACTUAL VARCHAR(150);
	SET @PRODUCTO_ACTUAL:=(SELECT producto_nombre FROM producto WHERE producto_id = ID_PRODUCTO);
	
	IF @PRODUCTO_ACTUAL = PRODUCTO THEN 
			UPDATE producto SET 
				categoria_id = CATEGORIA, 
				unidad_id = UNIDAD, 
				producto_precioventa = PRECIO, 
				producto_estatus = ESTATUS,
				producto_descripcion = DESCRIPCION,
				id_fabricante = ID_FABRICANTE,
				producto_preciocompra = PRECIO_COMPRA,
				producto_stock_minimo = STOCK_MINIMO
			WHERE producto_id = ID_PRODUCTO;
			SELECT 1;
	ELSE
		SET @CANTIDAD:=(SELECT COUNT(*) FROM producto WHERE producto_nombre = PRODUCTO);
		
		IF @CANTIDAD = 0 THEN
			UPDATE producto SET producto_nombre = PRODUCTO, 
				categoria_id = CATEGORIA, 
				unidad_id = UNIDAD, 
				producto_precioventa = PRECIO, 
				producto_estatus = ESTATUS,
				producto_descripcion = DESCRIPCION,
				id_fabricante = ID_FABRICANTE,
				producto_preciocompra = PRECIO_COMPRA,
				producto_stock_minimo = STOCK_MINIMO
			WHERE producto_id = ID_PRODUCTO;
			SELECT 1;
		ELSE 
			SELECT 2;
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_PRODUCTO_FOTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_PRODUCTO_FOTO`(IN ID INT, IN IMAGEN VARCHAR(250))
BEGIN
	UPDATE producto SET producto_foto = IMAGEN WHERE producto_id = ID;
	SELECT 1; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_PROVEEDOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_PROVEEDOR`(IN ID_PROVEEDOR INT, 
	IN RAZON_SOCIAL VARCHAR(255), 
	IN NOMBRE_CONTACTO VARCHAR(100),
	IN NUM_CONTACTO VARCHAR(17),

	IN NOMBRE VARCHAR(100), 
	IN APELLIDO_PATERNO VARCHAR(50), 
	IN APELLIDO_MATERNO VARCHAR(50), 
	IN CORREO VARCHAR(70),
	IN N_DOCUMENTO VARCHAR(17),
	IN TELEFONO VARCHAR(17),
	IN TIPO_DOCUMENTO VARCHAR(15), 
	IN SEXO VARCHAR(15),
	IN ID_PERSONA INT)
BEGIN
	DECLARE CANTIDAD INT;
	DECLARE CANTIDAD_CORREO INT;
	DECLARE RTN_ACTUAL VARCHAR(17);
	DECLARE CORREO_ACTUAL VARCHAR(17);
	
	SET @RTN_ACTUAL:=(SELECT persona_nrodocumento FROM persona WHERE persona_id = ID_PERSONA);
	SET @CORREO_ACTUAL:=(SELECT persona_correo FROM persona WHERE persona_id = ID_PERSONA);
	
			IF @RTN_ACTUAL = N_DOCUMENTO OR @CORREO_ACTUAL = CORREO THEN 
			
				IF @CORREO_ACTUAL = CORREO AND @RTN_ACTUAL = N_DOCUMENTO THEN 
							
						UPDATE proveedor SET proveedor_razonsocial = RAZON_SOCIAL, proveedor_contacto = NOMBRE_CONTACTO, proveedor_numcontacto = 						NUM_CONTACTO WHERE proveedor_id = ID_PROVEEDOR;
						UPDATE persona SET persona_nombre = NOMBRE, persona_apepat = APELLIDO_PATERNO, persona_apmat = APELLIDO_MATERNO, 							persona_telefono = TELEFONO, persona_sexo = SEXO WHERE persona_id = ID_PERSONA;
						SELECT 1;

				ELSE 
					SET @CANTIDAD:=(SELECT COUNT(*) FROM persona WHERE persona_nrodocumento = N_DOCUMENTO);
					SET @CANTIDAD_CORREO:=(SELECT COUNT(*) FROM persona WHERE persona_correo = CORREO);
					
					IF @RTN_ACTUAL = N_DOCUMENTO THEN 
							IF @CANTIDAD_CORREO = 0 THEN 
									UPDATE proveedor SET proveedor_razonsocial = RAZON_SOCIAL, proveedor_contacto = NOMBRE_CONTACTO, 											proveedor_numcontacto = NUM_CONTACTO WHERE proveedor_id = ID_PROVEEDOR;
									UPDATE persona SET persona_nombre = NOMBRE, persona_apepat = APELLIDO_PATERNO, persona_apmat = APELLIDO_MATERNO	, 								persona_correo = CORREO, persona_telefono = TELEFONO, persona_sexo = SEXO WHERE persona_id = ID_PERSONA;
								 SELECT 1;
									
							ELSE 
							
								SELECT 3;
								
							END IF; 
							
					ELSE 
				
						IF @CORREO_ACTUAL = CORREO THEN 
							IF @CANTIDAD = 0 THEN 
									UPDATE proveedor SET proveedor_razonsocial = RAZON_SOCIAL, proveedor_contacto = NOMBRE_CONTACTO, 											proveedor_numcontacto = NUM_CONTACTO WHERE proveedor_id = ID_PROVEEDOR;
									UPDATE persona SET persona_nombre = NOMBRE, persona_apepat = APELLIDO_PATERNO, persona_apmat = APELLIDO_MATERNO	, 								persona_nrodocumento = N_DOCUMENTO, persona_telefono = TELEFONO, persona_sexo = SEXO WHERE persona_id = ID_PERSONA;
								 SELECT 1;
							ELSE 
								SELECT 2;
							END IF; 
						
						ELSE 
							SELECT 4;
						
						END IF; 
					
					END IF; 
					
				END IF; 
				
		
				
			ELSE 
			
				SET @CANTIDAD:=(SELECT COUNT(*) FROM persona WHERE persona_nrodocumento = N_DOCUMENTO);
				SET @CANTIDAD_CORREO:=(SELECT COUNT(*) FROM persona WHERE persona_correo = CORREO);
				
				IF @CANTIDAD = 0 AND @CANTIDAD_CORREO = 0 THEN
				
						UPDATE proveedor SET proveedor_razonsocial = RAZON_SOCIAL, proveedor_contacto = NOMBRE_CONTACTO, proveedor_numcontacto = 						NUM_CONTACTO WHERE proveedor_id = ID_PROVEEDOR;
						
						UPDATE persona SET persona_nombre = NOMBRE, persona_apepat = APELLIDO_PATERNO, persona_apmat = APELLIDO_MATERNO, 						persona_correo = CORREO, persona_nrodocumento = N_DOCUMENTO, persona_telefono = TELEFONO, persona_tipodocumento = 					TIPO_DOCUMENTO, persona_sexo = SEXO WHERE persona_id = ID_PERSONA;
						SELECT 1;
				ELSE
				
					IF @CANTIDAD > 0 THEN
						SELECT 2;
					ELSEIF @CANTIDAD_CORREO > 0 THEN
						SELECT 3;
					ELSE
						SELECT 4;
					END IF;
				
				END IF;
			
			END IF; 
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_ROL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_ROL`(IN ID INT, IN ROL_ACTUAL VARCHAR(25), IN ROL_NUEVO VARCHAR(25), IN ESTATUS VARCHAR(10))
BEGIN
	DECLARE CANTIDAD INT;
	DECLARE CANT INT;
	
	SET	@CANT :=(SELECT COUNT(*) FROM rol INNER JOIN usuario ON rol.rol_id = usuario.rol_id WHERE rol.rol_id  = ID); 
	
	IF @CANT>0 THEN
		SELECT 3;
	END IF;
		
	
	IF ROL_ACTUAL = ROL_NUEVO THEN
		UPDATE rol SET rol_estatus = ESTATUS WHERE rol_id = ID;
		SELECT 1; 
	ELSE
		SET @CANTIDAD := (SELECT COUNT(*) FROM rol WHERE rol_nombre = ROL_NUEVO);
		
		IF @CANTIDAD = 0 THEN 
			UPDATE rol SET rol_nombre = ROL_NUEVO, rol_estatus = ESTATUS WHERE rol_id = ID;
			SELECT 1; 
		ELSE 
			SELECT 2; 
		END IF;
		
	END IF;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_SERVICIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_SERVICIO`(IN ID_PRODUCTO INT,
IN SERVICIO VARCHAR(150),
IN CATEGORIA INT, 
IN PRECIO DECIMAL(10,2),
IN ESTATUS VARCHAR(12),
IN DESCRIPCION VARCHAR(255))
BEGIN
	DECLARE CANTIDAD INT;
	DECLARE PRODUCTO_ACTUAL VARCHAR(150);
	SET @PRODUCTO_ACTUAL:=(SELECT producto_nombre FROM producto WHERE producto_id = ID_PRODUCTO);
	
	IF @PRODUCTO_ACTUAL = SERVICIO THEN 
			UPDATE producto SET 
				categoria_id = CATEGORIA, 
				producto_precioventa = PRECIO, 
				producto_estatus = ESTATUS,
				producto_descripcion = DESCRIPCION
			WHERE producto_id = ID_PRODUCTO;
			SELECT 1;
	ELSE
		SET @CANTIDAD:=(SELECT COUNT(*) FROM producto WHERE producto_nombre = SERVICIO);
		
		IF @CANTIDAD = 0 THEN
			UPDATE producto SET producto_nombre = SERVICIO, 
				categoria_id = CATEGORIA, 
				producto_precioventa = PRECIO, 
				producto_estatus = ESTATUS,
				producto_descripcion = DESCRIPCION
			WHERE producto_id = ID_PRODUCTO;
			SELECT 1;
		ELSE 
			SELECT 2;
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_TAREA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_TAREA`(IN ID INT, IN FECHA_INICIO DATE, IN FECHA_FIN DATE)
BEGIN
	UPDATE tarea t SET t.fecha_inicio = FECHA_INICIO, t.fecha_fin = FECHA_FIN WHERE t.id_tarea = ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_TAREA_IND` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_TAREA_IND`(IN ID INT, IN DESCRIPCION TEXT, IN ESTADO VARCHAR(20), IN ID_USUARIO INT)
UPDATE tarea t SET t.tarea_notas = DESCRIPCION, t.estado = ESTADO, t.usuario_id = ID_USUARIO WHERE t.id_tarea = ID ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_UNIDAD_MEDIDA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_UNIDAD_MEDIDA`(IN ID INT, IN UNIDAD_ACTUAL VARCHAR(100), IN UNIDAD_NUEVO VARCHAR(100), IN ABREVIATURA CHAR(10), IN ESTATUS VARCHAR(10))
BEGIN
	DECLARE CANTIDAD INT;
	DECLARE CANT INT;

	IF ESTATUS = 'INACTIVO' THEN
		SET	@CANT :=(SELECT COUNT(*) FROM unidad_medida INNER JOIN producto ON unidad_medida.unidad_id = producto.unidad_id WHERE unidad_medida.unidad_id = ID); 
		IF @CANT = 0 THEN
			IF UNIDAD_ACTUAL = UNIDAD_NUEVO THEN
				UPDATE unidad_medida SET unidad_abreviatura = ABREVIATURA, unidad_estatus = ESTATUS WHERE unidad_id = ID;
				SELECT 1; 
			ELSE
				SET @CANTIDAD := (SELECT COUNT(*) FROM unidad_medida WHERE unidad_nombre = UNIDAD_NUEVO);
				
				IF @CANTIDAD = 0 THEN 
					UPDATE unidad_medida SET unidad_nombre = UNIDAD_NUEVO, unidad_abreviatura = ABREVIATURA, unidad_estatus = ESTATUS WHERE 					unidad_id = ID;
					SELECT 1; 
				ELSE 
					SELECT 2; 
				END IF;
			END IF;	
				
		ELSE
			SELECT 3;
		END IF;
		
	ELSE
		IF UNIDAD_ACTUAL = UNIDAD_NUEVO THEN
			UPDATE unidad_medida SET unidad_abreviatura = ABREVIATURA, unidad_estatus = ESTATUS WHERE unidad_id = ID;
			SELECT 1; 
		ELSE
			SET @CANTIDAD := (SELECT COUNT(*) FROM unidad_medida WHERE unidad_nombre = UNIDAD_NUEVO);
			
			IF @CANTIDAD = 0 THEN 
				UPDATE unidad_medida SET unidad_nombre = UNIDAD_NUEVO, unidad_abreviatura = ABREVIATURA, unidad_estatus = ESTATUS WHERE 				unidad_id = ID;
				SELECT 1; 
			ELSE 
				SELECT 2; 
			END IF;
		END IF;	
	END IF;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_USUARIO`(IN ID INT,
	IN ID_PERSONA INT,
	IN ID_ROL INT,
	IN ESTATUS VARCHAR(15))
BEGIN
	UPDATE usuario SET persona_id = ID_PERSONA, rol_id = ID_ROL, usuario_estatus = ESTATUS WHERE usuario_id = ID;
	SELECT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_USUARIO_FOTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_USUARIO_FOTO`(IN ID INT, IN IMAGEN VARCHAR(250))
BEGIN
	UPDATE usuario SET usuario_imagen = IMAGEN WHERE usuario_id = ID;
	SELECT 1; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_VEHICULO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_VEHICULO`(IN ID_VEHI INT,
IN PLACA_NUEVA VARCHAR(50),
IN PLACA_ACTUAL VARCHAR(50),
IN ANIO VARCHAR(4),
IN TRANSMISION VARCHAR(50),
IN COMBUSTIBLE VARCHAR(50),
IN CHASIS VARCHAR(100),
IN MOTOR VARCHAR(50),
IN OBSERVACIONES TEXT,
IN TIPO VARCHAR(50),
IN ESTADO VARCHAR(50),
IN MODELO INT,
IN CLIENTE INT)
BEGIN
	DECLARE CANTIDAD INT;
	
	
	
	
	IF PLACA_ACTUAL = PLACA_NUEVA THEN 
			
			UPDATE vehiculo SET 
				vehiculo_anio=ANIO,
				vehiculo_transmision=TRANSMISION,
				vehiculo_tipo_combustible=COMBUSTIBLE,
				vehiculo_num_chasis=CHASIS,
				vehiculo_num_motor=MOTOR,				
				vehiculo_observaciones=OBSERVACIONES,
				vehiculo_tipo=TIPO,
				vehiculo_estado=ESTADO,
				id_modelo=MODELO,
				id_cliente=CLIENTE 
			WHERE id_vehiculo = ID_VEHI;
			
			
			SELECT 1;
	ELSE
		SET @CANTIDAD:=(SELECT COUNT(*) FROM vehiculo WHERE vehiculo_placa = PLACA_NUEVA);
		
		IF @CANTIDAD = 0 THEN
		
			UPDATE vehiculo SET
				vehiculo_placa = PLACA_NUEVA,
				vehiculo_anio=ANIO,
				vehiculo_transmision=TRANSMISION,
				vehiculo_tipo_combustible=COMBUSTIBLE,
				vehiculo_num_chasis=CHASIS,
				vehiculo_num_motor=MOTOR,				
				vehiculo_observaciones=OBSERVACIONES,
				vehiculo_tipo=TIPO,
				vehiculo_estado=ESTADO,
				id_modelo=MODELO,
				id_cliente=CLIENTE 
			WHERE id_vehiculo = ID_VEHI;
			
			SELECT 1;
		ELSE 
			SELECT 2;
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_EDITAR_VEHICULO_FOTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EDITAR_VEHICULO_FOTO`(IN ID INT, IN IMAGEN VARCHAR(250))
BEGIN
	UPDATE vehiculo SET vehiculo_imagen = IMAGEN WHERE id_vehiculo = ID;
	SELECT 1; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ELIMINAR_ACCESO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ELIMINAR_ACCESO`(IN USUARIO INT,
	IN MODULO VARCHAR(100))
BEGIN
		DELETE FROM acceso WHERE usuario_id = USUARIO AND modulo_codigo = MODULO;
		
		SELECT 1; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ELIMINAR_DETALLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ELIMINAR_DETALLE`(IN ID INT)
BEGIN
	DECLARE CANTIDAD INT;
	SET @CANTIDAD:=(SELECT COUNT(*) FROM detalle_transaccion WHERE transaccion_id = ID);
		
			DELETE FROM detalle_transaccion WHERE transaccion_id = ID;


	
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ELIMINAR_DETALLE_ORDEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ELIMINAR_DETALLE_ORDEN`(IN ID INT)
BEGIN
	DECLARE CANTIDAD INT;
	  SET @CANTIDAD:=(SELECT COUNT(tarea.detalletransaccion_id) AS cant
		 FROM detalle_transaccion INNER JOIN tarea ON detalle_transaccion.detalletransaccion_id = tarea.detalletransaccion_id
		WHERE detalle_transaccion.detalletransaccion_id = ID);
		
		IF @CANTIDAD = 0 THEN
			DELETE FROM detalle_transaccion WHERE detalle_transaccion.detalletransaccion_id = ID;
		ELSE
			DELETE FROM detalle_transaccion WHERE detalletransaccion_id = 0;
		END IF;
	
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ELIMINAR_MOVIMIENTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ELIMINAR_MOVIMIENTO`(IN ID_TRANSACCION INT)
DELETE FROM detalle_transaccion WHERE transaccion_id = ID_TRANSACCION ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ELIMINAR_TAREA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ELIMINAR_TAREA`(IN ID INT)
DELETE FROM tarea WHERE detalletransaccion_id = ID ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_FACTURAR_ORDEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_FACTURAR_ORDEN`(IN ID INT,
		IN CANT_PAGO DECIMAL,
		IN NUM_FAC VARCHAR(100),
		IN SERIE_FAC VARCHAR(100))
BEGIN
	UPDATE transacciones SET 
		transaccion_estatus = 'ORDEN FACTURADA',
		transaccion_tipocomprobante = 'FACTURA',
		transaccion_numcomprobante = NUM_FAC,
		transaccion_seriecomprobante = SERIE_FAC,
		transaccion_cantidadpago = CANT_PAGO
	WHERE transaccion_id = ID;
	
	UPDATE detalle_transaccion SET detalle_transaccion.detalletransaccion_estatus = 'ORDEN FACTURADA' 
	WHERE transaccion_id = ID;
	
	SELECT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_GENERARCODIGO_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_GENERARCODIGO_PRODUCTO`()
BEGIN
DECLARE regenerateNumber BOOLEAN default true;
declare regNum int;
declare cn varchar(255);
repeat
SET regNum      := FLOOR(Rand()*90000000+10000000);
SET cn =(SELECT count(*) FROM producto WHERE producto_id = regNum);
select regNum;
if cn=0
then
SET regenerateNumber = false;
end if;
UNTIL regenerateNumber=false
end repeat;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_INFO_EMPRESA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_INFO_EMPRESA`()
SELECT
c.conf_id,
c.conf_nombre_empresa,
c.conf_direccion,
c.conf_telefono,
c.conf_celular,
c.conf_rtn,
c.conf_correo,
c.conf_img_logo,
c.conf_isv
FROM configuracion c ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_ACCESOS_ACTIVOS_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_ACCESOS_ACTIVOS_USUARIO`(IN ID INT)
BEGIN 
		SELECT 

		m.modulo_codigo



	FROM acceso a INNER JOIN modulo m ON a.modulo_codigo = m.modulo_codigo
	WHERE a.usuario_id = ID AND a.acceso_estado = "ACTIVO";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_ACCESOS_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_ACCESOS_USUARIO`(IN ID INT)
BEGIN 
		SELECT 
		a.usuario_id,
		m.modulo_codigo,
		m.modulo_nombre,
		m.modulo_descripcion,
		a.acceso_estado
	FROM acceso a INNER JOIN modulo m ON a.modulo_codigo = m.modulo_codigo
	WHERE a.usuario_id = ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_ACCESOS_USUARIO_NO_TIENE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_ACCESOS_USUARIO_NO_TIENE`(IN ID INT)
BEGIN 
		SELECT 
			*
		FROM modulo m
		WHERE m.modulo_codigo NOT IN(
			SELECT 
				a.modulo_codigo
			FROM acceso a
			WHERE a.usuario_id = ID
			GROUP BY a.modulo_codigo
		);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_BITACORA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_BITACORA`(IN FECHA_INICIO DATE,
	IN FECHA_FIN DATE)
SELECT
	bitacora.id_bitacora,
	bitacora.id_usuario,
	bitacora.ip_publica,
	bitacora.bitacora_fecha_hora,
	bitacora.bitacora_accion,
	bitacora.bitacora_descripcion,
	bitacora.bitacora_tabla,
	usuario.usuario_nombre,
	CONCAT_WS(' ', persona.persona_nombre, persona.persona_apepat, persona.persona_apmat) AS nombre
FROM
	bitacora INNER JOIN usuario ON bitacora.id_usuario = usuario.usuario_id
						INNER JOIN persona ON usuario.persona_id = persona.persona_id
WHERE bitacora.bitacora_fecha_hora BETWEEN FECHA_INICIO AND FECHA_FIN 
ORDER BY bitacora.bitacora_fecha_hora DESC ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_CATEGORIA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_CATEGORIA`()
SELECT
	categoria.categoria_id, 
	categoria.categoria_nombre, 
	categoria.categoria_fregistro, 
	categoria.categoria_estatus
FROM
	categoria ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_CLIENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_CLIENTE`()
SELECT
	persona.persona_id,
	CONCAT_WS(' ',persona_nombre,persona_apepat, persona_apmat) as NOMBRE_PERSONA,
	persona.persona_nombre, 
	persona.persona_apepat, 
	persona.persona_apmat, 
	persona.persona_nrodocumento, 
	persona.persona_tipodocumento, 
	persona.persona_sexo, 
	persona.persona_telefono, 
	persona.persona_correo, 
	cliente.cliente_id,
	cliente.cliente_fregistro, 
	cliente.cliente_estatus,
	persona.persona_empresa
FROM
	cliente INNER JOIN persona ON cliente.persona_id = persona.persona_id ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_CATEGORIA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_COMBO_CATEGORIA`()
SELECT
	categoria.categoria_id, 
	categoria.categoria_nombre
FROM
	categoria
WHERE categoria_estatus = 'ACTIVO' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_FABRICANTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_COMBO_FABRICANTE`()
SELECT fabricante.id_fabricante, fabricante.fabricante_nombre
	FROM fabricante
WHERE fabricante.fabricante_estado = 'ACTIVO' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_MARCA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_COMBO_MARCA`()
SELECT
	id_marca, 
	marca_nombre
FROM
	marca
WHERE marca_estado = 'ACTIVO' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_MODELO_MARCA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_COMBO_MODELO_MARCA`(IN ID INT)
SELECT
	id_modelo, 
	modelo_nombre
FROM
	modelo
WHERE modelo_estado = 'ACTIVO' AND id_marca = ID ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_PERSONA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_COMBO_PERSONA`()
SELECT persona_id ,CONCAT_WS(' ',persona.persona_nombre,persona.persona_apepat,persona.persona_apmat)
	FROM persona
WHERE persona_estatus = 'ACTIVO' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_COMBO_PRODUCTO`()
SELECT producto_id, producto_nombre FROM producto WHERE producto_estatus = 'ACTIVO' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_PROVEEDOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_COMBO_PROVEEDOR`()
SELECT proveedor_id, proveedor_razonsocial FROM proveedor WHERE proveedor_estatus = 'ACTIVO' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_ROL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_COMBO_ROL`()
SELECT rol_id ,rol_nombre
	FROM rol
WHERE rol_estatus = 'ACTIVO' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_COMBO_UNIDAD_MEDIDA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_COMBO_UNIDAD_MEDIDA`()
SELECT
	unidad_medida.unidad_id, 
	unidad_medida.unidad_nombre
FROM
	unidad_medida
WHERE unidad_estatus = 'ACTIVO' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_CONFIGURACION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_CONFIGURACION`()
SELECT
	configuracion.conf_id, 
	configuracion.conf_nombre_empresa,
	configuracion.conf_direccion,
	configuracion.conf_telefono,
	configuracion.conf_celular,
	configuracion.conf_rtn, 
	configuracion.conf_correo, 
	configuracion.conf_img_logo,
	configuracion.conf_isv,	
	configuracion.conf_cai, 
	configuracion.conf_fact_fechalimite_emision, 
	configuracion.conf_cantidad_fact, 
	configuracion.conf_numero_inicial, 
	configuracion.conf_numero_final, 
	configuracion.conf_preciodolar
	
FROM
	configuracion ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_COTIZACION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_COTIZACION`(IN FECHA_INICIO DATE,
	IN FECHA_FIN DATE)
SELECT
	t.transaccion_id as cotizacion_id,
	t.usuario_id,
	t.transaccion_fecha as cotizacion_fecha,
	t.transaccion_total as cotizacion_total,
	t.transaccion_impuesto as cotizacion_impuesto,
	t.transaccion_estatus as cotizacion_estatus,
	u.usuario_nombre,
	t.transaccion_porcentaje as porcentaje,
	CONCAT_WS(' ', p.persona_nombre, p.persona_apepat, p.persona_apmat) AS nombre_cliente,
	p.persona_correo,
	p.persona_empresa,
	p.persona_telefono,
	p.persona_nrodocumento,
	p.persona_id
FROM
	transacciones t INNER JOIN usuario u ON t.usuario_id = u.usuario_id
									INNER JOIN persona p ON t.persona_id = p.persona_id
WHERE transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN AND
t.transaccion_tipo = 'COTIZACION'
ORDER BY t.transaccion_fecha DESC ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_DETALLE_COTIZACION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_DETALLE_COTIZACION`(IN ID_TRANSACCION INT)
SELECT
	detalle_transaccion.detalletransaccion_id,
	detalle_transaccion.transaccion_id,
	detalle_transaccion.producto_id,
	detalle_transaccion.detalletransaccion_nombrepro as producto_nombre,
	producto.prod_serv_tipo,
	detalle_transaccion.detalletransaccion_precio as detalle_precio,
	detalle_transaccion.detalletransaccion_cantidad as detalle_cantidad,
	detalle_transaccion.detalletransaccion_descuento as detalle_descuento,
	(detalle_transaccion.detalletransaccion_descuento*detalle_transaccion.detalletransaccion_cantidad) as descuento_total,
	(detalle_transaccion.detalletransaccion_cantidad * detalle_transaccion.detalletransaccion_precio) as SUB_TOTAL,
	producto_stock
FROM detalle_transaccion INNER JOIN producto ON detalle_transaccion.producto_id = producto.producto_id
WHERE detalle_transaccion.transaccion_id = ID_TRANSACCION ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_DETALLE_MOVIMIENTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_DETALLE_MOVIMIENTO`(IN ID_TRANSACCION INT)
SELECT
	dt.detalletransaccion_nombrepro as producto_nombre,
	dt.detalletransaccion_cantidad as detallemovimiento_cantidad,
	dt.producto_id,
	dt.detalletransaccion_id,
	p.producto_stock
FROM detalle_transaccion dt INNER JOIN producto p ON dt.producto_id = p.producto_id
WHERE dt.transaccion_id = ID_TRANSACCION ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_DETALLE_NGRESO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_DETALLE_NGRESO`(IN ID_TRANSACCION INT)
SELECT detalle_transaccion.detalletransaccion_nombrepro as producto_nombre,
 detalle_transaccion.detalletransaccion_cantidad as detalleingreso_cantidad,
 detalle_transaccion.detalletransaccion_precio as detalleingreso_precio,
 (detalle_transaccion.detalletransaccion_cantidad * detalle_transaccion.detalletransaccion_precio) as SUB_TOTAL ,
 detalle_transaccion.producto_id
FROM detalle_transaccion
WHERE detalle_transaccion.transaccion_id = ID_TRANSACCION ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_DETALLE_ORDENR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_DETALLE_ORDENR`(IN ID_TRANSACCION INT)
SELECT
	detalle_transaccion.detalletransaccion_id,
	detalle_transaccion.transaccion_id,
	detalle_transaccion.producto_id,
	detalle_transaccion.detalletransaccion_nombrepro as producto_nombre,
	producto.prod_serv_tipo,
	detalle_transaccion.detalletransaccion_precio as detalle_precio,
	detalle_transaccion.detalletransaccion_cantidad as detalle_cantidad,
	detalle_transaccion.detalletransaccion_descuento as detalle_descuento,
	(detalle_transaccion.detalletransaccion_descuento*detalle_transaccion.detalletransaccion_cantidad) as descuento_total,
	(detalle_transaccion.detalletransaccion_cantidad * detalle_transaccion.detalletransaccion_precio) as SUB_TOTAL,
	producto_stock,
	(SELECT tarea.estado FROM tarea WHERE tarea.detalletransaccion_id = detalle_transaccion.detalletransaccion_id) as status
FROM detalle_transaccion INNER JOIN producto ON detalle_transaccion.producto_id = producto.producto_id
WHERE detalle_transaccion.transaccion_id = ID_TRANSACCION ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_DETALLE_VENTA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_DETALLE_VENTA`(IN ID_TRANSACCION INT)
SELECT
	detalle_transaccion.detalletransaccion_nombrepro as producto_nombre,
	detalle_transaccion.detalletransaccion_cantidad as detalleventa_cantidad,
	detalle_transaccion.detalletransaccion_precio as detalleventa_precio,
	detalle_transaccion.detalletransaccion_descuento as detalleventa_descuento,
	(detalle_transaccion.detalletransaccion_cantidad * detalle_transaccion.detalletransaccion_precio) as SUB_TOTAL
FROM detalle_transaccion
WHERE detalle_transaccion.transaccion_id = ID_TRANSACCION ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_FABRICANTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_FABRICANTE`()
SELECT
fabricante.fabricante_fregistro,
fabricante.fabricante_estado,
fabricante.fabricante_descripcion,
fabricante.fabricante_nombre,
fabricante.id_fabricante
FROM
fabricante ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_HISTORIAL_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_HISTORIAL_PRODUCTO`(IN ID_CODIGO VARCHAR(20))
SELECT
	h.producto_codigo,
	h.producto_nombre,
	h.producto_nombre_nuevo,
	h.producto_precio_venta,
	h.producto_precio_venta_nuevo,
	h.fecha_historial
FROM producto_historial h
WHERE h.producto_codigo = ID_CODIGO ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_ID_DETALLE_ORDEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_ID_DETALLE_ORDEN`(IN ID_TRANSACCION INT)
BEGIN
	SELECT 
		detalle_transaccion.detalletransaccion_id
	FROM detalle_transaccion WHERE transaccion_id = ID_TRANSACCION;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_IMPUESTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_IMPUESTO`()
SELECT
	conf_isv
FROM configuracion ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_INGRESO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_INGRESO`(IN FECHA_INICIO DATE,
	IN FECHA_FIN DATE, IN ESTADO VARCHAR(30))
SELECT
	t.transaccion_id as ingreso_id,
	tp.proveedor_id,
	t.usuario_id,
	t.transaccion_tipocomprobante as ingreso_tipcomprobante,
	t.transaccion_seriecomprobante as ingreso_seriecomprobante,
	t.transaccion_numcomprobante as ingreso_numcomprobante,
	t.transaccion_fecha as ingreso_fecha,
	t.transaccion_total as ingreso_total,
	t.transaccion_impuesto as ingreso_impuesto,
	t.transaccion_estatus as ingreso_estatus,
	u.usuario_nombre,
	CONCAT_WS(' ',ps.persona_nombre,ps.persona_apepat,ps.persona_apmat) AS NOMBRE_PROVEEDOR,
	ps.persona_nombre, 
	ps.persona_apepat, 
	ps.persona_apmat,
	p.proveedor_razonsocial,
	t.transaccion_porcentaje as porcentaje
FROM
	transacciones t INNER JOIN usuario u ON t.usuario_id = u.usuario_id
	INNER JOIN transaccion_proveedor tp ON tp.transaccion_id = t.transaccion_id
	INNER JOIN proveedor p ON p.proveedor_id = tp.proveedor_id
	INNER JOIN persona ps ON ps.persona_id = p.persona_id
WHERE transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN 
AND CASE
			WHEN ESTADO = 'ANULADO' THEN
				t.transaccion_estatus IN ('ANULADO','AJUSTE ANULADO')
			WHEN ESTADO = 'AJUSTES' THEN	
				t.transaccion_estatus = 'AJUSTE'
			WHEN ESTADO = 'INGRESADO' THEN	
				t.transaccion_estatus = 'INGRESADO'
			WHEN ESTADO = 'TODOS' THEN	
				t.transaccion_estatus IN ('INGRESADO', 'AJUSTE', 'ANULADO', 'AJUSTE ANULADO')	
			ELSE
				t.transaccion_estatus IN ('INGRESADO', 'AJUSTE') 
		END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_INGRESO_COTIZACION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_INGRESO_COTIZACION`(IN FECHA_INICIO DATE,
	IN FECHA_FIN DATE)
SELECT
	*
FROM
	transacciones t 
WHERE transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN AND
t.transaccion_tipo = 'COTIZACION' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_MARCA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_MARCA`()
SELECT
	*
FROM
	marca ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_MODELO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_MODELO`()
SELECT
	m.id_modelo,
	m.modelo_nombre,
	m.modelo_descripcion,
	m.modelo_estado,
	m.id_marca,
	ma.marca_nombre	
FROM
	modelo m  INNER JOIN marca ma ON m.id_marca = ma.id_marca ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_MOVIMIENTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_MOVIMIENTO`(IN FECHA_INICIO DATE, IN FECHA_FIN DATE)
SELECT t.transaccion_id, u.usuario_nombre, t.transaccion_fecha, t.transaccion_observaciones, t.transaccion_estatus
FROM transacciones t INNER JOIN usuario u ON t.usuario_id = u.usuario_id
WHERE transaccion_tipo = 'MOVIMIENTO' 
AND t.transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_NOTIFICACIONES` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_NOTIFICACIONES`()
SELECT producto_nombre, producto_stock FROM producto WHERE producto_stock <= producto_stock_minimo AND prod_serv_tipo = 'PRODUCTO' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_ORDEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_ORDEN`(IN FECHA_INICIO DATE,
	IN FECHA_FIN DATE)
SELECT
	t.transaccion_id as cotizacion_id,
	t.usuario_id,
	t.transaccion_fecha as cotizacion_fecha,
	t.transaccion_total as cotizacion_total,
	t.transaccion_impuesto as cotizacion_impuesto,
	t.transaccion_estatus as cotizacion_estatus,
	u.usuario_nombre,
	t.transaccion_porcentaje as porcentaje,
	CONCAT_WS(' ', p.persona_nombre, p.persona_apepat, p.persona_apmat) AS nombre_cliente,
	p.persona_correo,
	p.persona_empresa,
	p.persona_telefono,
	p.persona_nrodocumento,
	p.persona_id,
	tv.id_usuario as mecanico,
	tv.id_vehiculo,
	tv.nivel_combustible,
	tv.descripcion,
	tv.`vehiculo_km/millas` as kilometraje,
	m.modelo_nombre,
	(SELECT mar.marca_nombre FROM marca mar WHERE mar.id_marca = m.id_marca) as marca_nom,
	v.vehiculo_anio,
	v.id_vehiculo,
	v.vehiculo_placa,
	v.vehiculo_num_chasis,
	v.vehiculo_num_motor,
	v.vehiculo_transmision,
	v.vehiculo_tipo,
	(SELECT CONCAT_WS(' ', per.persona_nombre, per.persona_apepat, per.persona_apmat) FROM usuario usu INNER JOIN persona per ON usu.persona_id = per.persona_id WHERE usu.usuario_id = tv.id_usuario) as nombre_mecanico,
	tv.id_usuario as id_mecanico,
	(SELECT SUM(dt.detalletransaccion_cantidad * dt.detalletransaccion_precio) FROM detalle_transaccion dt WHERE dt.transaccion_id = t.transaccion_id)AS subtotal,
	(SELECT SUM(dt2.detalletransaccion_cantidad * dt2.detalletransaccion_descuento) FROM detalle_transaccion dt2 WHERE dt2.transaccion_id = t.transaccion_id) AS descuento
FROM
	transacciones t INNER JOIN usuario u ON t.usuario_id = u.usuario_id
									INNER JOIN persona p ON t.persona_id = p.persona_id
									INNER JOIN transaccion_vehiculo tv ON t.transaccion_id = tv.id_transaccion
									INNER JOIN vehiculo v ON tv.id_vehiculo = v.id_vehiculo
									INNER JOIN modelo m ON v.id_modelo = m.id_modelo
WHERE transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN AND
t.transaccion_tipo = 'ORDEN' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_ORDEN_CLIENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_ORDEN_CLIENTE`()
SELECT t.transaccion_id, CONCAT(t.id_correlativo,' - ',p.persona_nombre,' ',p.persona_apepat, ' ',p.persona_apmat, ' - '
, IF(ma.marca_nombre IS NULL,'',ma.marca_nombre), ' ',IF(m.modelo_nombre IS NULL,'',m.modelo_nombre), ' - ', IF(v.vehiculo_placa IS NULL,'',v.vehiculo_placa))
	FROM transacciones t INNER JOIN persona p ON t.persona_id = p.persona_id
	INNER JOIN transaccion_vehiculo tv ON t.transaccion_id = tv.id_transaccion
	INNER JOIN vehiculo v ON v.id_vehiculo = tv.id_vehiculo
	INNER JOIN modelo m ON m.id_modelo = v.id_modelo
	INNER JOIN marca ma ON ma.id_marca = m.id_marca
WHERE t.transaccion_tipo = 'ORDEN' AND t.transaccion_estatus = 'INICIADO' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_PERSONA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_PERSONA`()
SELECT
	CONCAT_WS(' ',p.persona_nombre,p.persona_apepat,p.persona_apmat) as NOMBRE_PERSONA,
	p.persona_nombre,
	p.persona_apepat,
	p.persona_apmat,
	p.persona_id,  
	p.persona_nrodocumento, 
	p.persona_tipodocumento, 
	p.persona_sexo, 
	p.persona_telefono,
	p.persona_estatus,
	p.persona_correo,
	p.persona_empresa,
	CASE 
	WHEN c.persona_id IS NOT NULL THEN 'CLIENTE'
	WHEN pr.persona_id IS NOT NULL THEN 'PROVEEDOR'
	WHEN u.persona_id IS NOT NULL THEN 'USUARIO'
	ELSE
		'PERSONA'
END as tipo_persona
	FROM persona p LEFT JOIN cliente c on c.persona_id = p.persona_id
	LEFT JOIN proveedor pr ON pr.persona_id = p.persona_id
	LEFT JOIN usuario u ON p.persona_id = u.persona_id ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_PRODUCTO`()
SELECT
	producto.producto_id, 
	producto.producto_nombre,
	producto.prod_serv_tipo,
	producto.producto_oferta,
	producto.producto_descuento,
	producto.producto_stock, 
	producto.categoria_id, 
	producto.unidad_id,
	producto.id_fabricante,	
	producto.producto_foto, 
	producto.producto_precioventa, 
	producto.producto_descripcion, 
	producto.producto_estatus, 
	unidad_medida.unidad_nombre, 
	categoria.categoria_nombre,
	f.fabricante_nombre,
	producto.producto_preciocompra,
	producto.producto_stock_minimo,
	producto.producto_codigo
	
FROM
	producto INNER JOIN categoria ON producto.categoria_id = categoria.categoria_id
	INNER JOIN unidad_medida ON producto.unidad_id = unidad_medida.unidad_id
	INNER JOIN fabricante f ON f.id_fabricante = producto.id_fabricante
WHERE prod_serv_tipo='PRODUCTO' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_PROVEEDOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_PROVEEDOR`()
SELECT
	proveedor.proveedor_numcontacto, 
	proveedor.proveedor_contacto, 
	CONCAT_WS(' ',persona.persona_nombre,persona.persona_apepat,persona.persona_apmat) AS NOMBRE_PROVEEDOR,
	persona.persona_nombre, 
	persona.persona_apepat, 
	persona.persona_apmat, 
	persona.persona_nrodocumento, 
	persona.persona_tipodocumento, 
	persona.persona_sexo, 
	persona.persona_telefono, 
	proveedor.proveedor_id, 
	proveedor.proveedor_estatus,
	proveedor_razonsocial,
	proveedor.persona_id,
	persona.persona_correo
FROM
	proveedor INNER JOIN persona ON proveedor.persona_id = persona.persona_id ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_ROL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_ROL`()
SELECT
	rol.rol_id, 
	rol.rol_nombre, 
	rol.rol_estatus, 
	rol.rol_feregistro
FROM
	rol ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_SERVICES_CLIENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_SERVICES_CLIENTE`(IN ID_TRANSACCION INT)
SELECT dt.detalletransaccion_id, dt.detalletransaccion_nombrepro, 
	IF(t.estado IS NULL,'DISPONIBLE',t.estado)
	FROM detalle_transaccion dt INNER JOIN producto p ON dt.producto_id = p.producto_id
	LEFT JOIN tarea t ON t.detalletransaccion_id = dt.detalletransaccion_id
WHERE dt.transaccion_id = ID_TRANSACCION AND p.prod_serv_tipo = 'SERVICIO' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_SERVICIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_SERVICIO`()
SELECT
	producto.producto_id, 
	producto.producto_nombre,
	producto.prod_serv_tipo,
	producto.producto_oferta,
	producto.producto_descuento,
	producto.producto_stock, 
	producto.categoria_id, 
	producto.unidad_id,
	producto.id_fabricante,	
	producto.producto_foto, 
	producto.producto_precioventa, 
	producto.producto_descripcion, 
	producto.producto_estatus, 
	categoria.categoria_nombre,
	producto.producto_preciocompra,
	producto.producto_stock_minimo,
	producto.producto_codigo
	
FROM
	producto INNER JOIN categoria ON producto.categoria_id = categoria.categoria_id
WHERE prod_serv_tipo='SERVICIO' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_TAREAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_TAREAS`(IN ID_USER INT)
BEGIN 

	DECLARE TIPO_USER VARCHAR(30);
	DECLARE PERSONA_ID INT;
	
	SET @TIPO_USER:=(SELECT r.rol_nombre FROM usuario u INNER JOIN rol r ON u.rol_id = r.rol_id WHERE u.usuario_id = ID_USER);
	
	CASE 

	WHEN @TIPO_USER = 'CLIENTE' THEN
		SET @PERSONA_ID:=(SELECT p.persona_id FROM usuario u INNER JOIN persona p ON u.persona_id = p.persona_id 
		WHERE u.usuario_id = ID_USER);
	
		SELECT t.id_tarea as id, dt.detalletransaccion_nombrepro as title, t.fecha_inicio as start, t.fecha_fin as end, 
		CASE 
			WHEN t.estado = 'PENDIENTE' THEN '#07C7DA'
			WHEN t.estado = 'ORDEN ANULADA' THEN '#E74C3C '
			ELSE '#78CA25'
		END as color, 
		t.tarea_notas, t.estado, CONCAT_WS(' ',pr.persona_nombre,pr.persona_apepat,pr.persona_apmat) as NOMBRE_CLIENTE,
		CONCAT(ma.marca_nombre,' ',m.modelo_nombre,' - ',v.vehiculo_placa) AS info_vehiculo
		FROM tarea t INNER JOIN detalle_transaccion dt ON t.detalletransaccion_id = dt.detalletransaccion_id
		INNER JOIN producto p ON p.producto_id = dt.producto_id
		INNER JOIN transacciones tr ON tr.transaccion_id = dt.transaccion_id
		INNER JOIN persona pr ON tr.persona_id = pr.persona_id
		LEFT JOIN transaccion_vehiculo tv ON tr.transaccion_id = tv.id_transaccion
		LEFT JOIN vehiculo v ON tv.id_vehiculo = v.id_vehiculo
		LEFT JOIN modelo m ON m.id_modelo = v.id_modelo
		LEFT JOIN marca ma ON ma.id_marca = m.id_marca
		WHERE p.prod_serv_tipo = 'SERVICIO' AND pr.persona_id = @PERSONA_ID;


	WHEN @TIPO_USER = 'MECANICO' THEN 
		
	SELECT t.id_tarea as id, dt.detalletransaccion_nombrepro as title, t.fecha_inicio as start, t.fecha_fin as end, 
		CASE 
			WHEN t.estado = 'PENDIENTE' THEN '#07C7DA'
			WHEN t.estado = 'ORDEN ANULADA' THEN '#E74C3C '
			ELSE '#78CA25'
		END as color, 
		t.tarea_notas, t.estado, CONCAT_WS(' ',pr.persona_nombre,pr.persona_apepat,pr.persona_apmat) as NOMBRE_CLIENTE,
		CONCAT(ma.marca_nombre,' ',m.modelo_nombre,' - ',v.vehiculo_placa) AS info_vehiculo
		FROM tarea t INNER JOIN detalle_transaccion dt ON t.detalletransaccion_id = dt.detalletransaccion_id
		INNER JOIN producto p ON p.producto_id = dt.producto_id
		INNER JOIN transacciones tr ON tr.transaccion_id = dt.transaccion_id
		INNER JOIN persona pr ON tr.persona_id = pr.persona_id
		LEFT JOIN transaccion_vehiculo tv ON tr.transaccion_id = tv.id_transaccion
		LEFT JOIN vehiculo v ON tv.id_vehiculo = v.id_vehiculo
		LEFT JOIN modelo m ON m.id_modelo = v.id_modelo
		LEFT JOIN marca ma ON ma.id_marca = m.id_marca
	WHERE p.prod_serv_tipo = 'SERVICIO' AND tv.id_usuario = ID_USER;

	ELSE
	
		SELECT t.id_tarea as id, dt.detalletransaccion_nombrepro as title, t.fecha_inicio as start, t.fecha_fin as end, 
		CASE 
			WHEN t.estado = 'PENDIENTE' THEN '#07C7DA'
			WHEN t.estado = 'ORDEN ANULADA' THEN '#E74C3C '
			ELSE '#78CA25'
		END as color , 
		t.tarea_notas, t.estado, CONCAT_WS(' ',pr.persona_nombre,pr.persona_apepat,pr.persona_apmat) as NOMBRE_CLIENTE,
	CONCAT(ma.marca_nombre,' ',m.modelo_nombre,' - ',v.vehiculo_placa) AS info_vehiculo
	FROM tarea t INNER JOIN detalle_transaccion dt ON t.detalletransaccion_id = dt.detalletransaccion_id
	INNER JOIN producto p ON p.producto_id = dt.producto_id
	INNER JOIN transacciones tr ON tr.transaccion_id = dt.transaccion_id
	LEFT JOIN transaccion_vehiculo tv ON tr.transaccion_id = tv.id_transaccion
	INNER JOIN persona pr ON tr.persona_id = pr.persona_id
	LEFT JOIN vehiculo v ON tv.id_vehiculo = v.id_vehiculo
	LEFT JOIN modelo m ON m.id_modelo = v.id_modelo
	LEFT JOIN marca ma ON ma.id_marca = m.id_marca
WHERE p.prod_serv_tipo = 'SERVICIO';
 
	END CASE;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_UNIDAD_MEDIDA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_UNIDAD_MEDIDA`()
SELECT
	unidad_medida.unidad_id, 
	unidad_medida.unidad_nombre,
	unidad_medida.unidad_abreviatura,	
	unidad_medida.unidad_fregistro, 
	unidad_medida.unidad_estatus
FROM
	unidad_medida ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_USUARIO`()
SELECT
	usuario.usuario_id, 
	usuario.usuario_nombre,
	usuario.usuario_intento,
	usuario.usuario_estatus, 
	usuario.usuario_imagen, 
	usuario.rol_id, 
	usuario.persona_id, 
	rol.rol_nombre,
	usuario.usuario_password,
	CONCAT_WS(' ',persona.persona_nombre,persona.persona_apepat,persona.persona_apmat) as NOMBRE_PERSONA,
	persona.persona_nombre, 
	persona.persona_apepat, 
	persona.persona_apmat,
	persona.persona_correo,
	persona.persona_tipodocumento,
	persona.persona_nrodocumento,
	persona.persona_telefono,
	persona.persona_sexo
FROM usuario INNER JOIN rol ON usuario.rol_id = rol.rol_id
INNER JOIN persona ON usuario.persona_id = persona.persona_id ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_USUARIO_MECANICO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_USUARIO_MECANICO`()
SELECT
	usuario.usuario_id, 
	usuario.usuario_estatus, 
	usuario.usuario_imagen, 
	usuario.persona_id, 
	usuario.usuario_password,
	CONCAT_WS(' ',persona.persona_nombre,persona.persona_apepat,persona.persona_apmat) as NOMBRE_PERSONA,
	persona.persona_correo,
	persona.persona_tipodocumento,
	persona.persona_nrodocumento,
	persona.persona_telefono,
	persona.persona_sexo
FROM usuario INNER JOIN persona ON usuario.persona_id = persona.persona_id
							INNER JOIN rol ON usuario.rol_id = rol.rol_id

WHERE rol.rol_nombre = 'MECANICO' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_VEHICULO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_VEHICULO`()
SELECT
 v.id_vehiculo,
 v.vehiculo_placa,
 v.vehiculo_anio,
 v.vehiculo_transmision,
 v.vehiculo_tipo_combustible,
 v.vehiculo_num_chasis,
 v.vehiculo_num_motor,
 v.vehiculo_observaciones,
 v.vehiculo_imagen,
 v.vehiculo_tipo,
 v.vehiculo_estado,
 v.id_modelo,
 v.id_cliente,
 mo.modelo_nombre,
 mo.id_marca,
 ma.marca_nombre,
 CONCAT_WS(' ',p.persona_nombre ,p.persona_apepat,p.persona_apmat) AS cliente_nombre
FROM vehiculo v INNER JOIN modelo mo ON v.id_modelo = mo.id_modelo
							  INNER JOIN marca  ma ON mo.id_marca = ma.id_marca
								INNER JOIN cliente c ON v.id_cliente = c.cliente_id
								INNER JOIN persona p ON c.persona_id = p.persona_id ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_VEHICULO_POR_CLIENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_VEHICULO_POR_CLIENTE`(IN ID_CLIENTE INT)
SELECT
vehiculo.vehiculo_placa,
marca.marca_nombre,
modelo.modelo_nombre,
vehiculo.vehiculo_tipo,
vehiculo.vehiculo_num_motor,
vehiculo.vehiculo_num_chasis,
vehiculo.vehiculo_anio,
vehiculo.vehiculo_transmision,
vehiculo.vehiculo_imagen,
vehiculo.vehiculo_estado,
vehiculo.vehiculo_estado,
vehiculo.id_vehiculo
FROM
vehiculo
INNER JOIN modelo ON vehiculo.id_modelo = modelo.id_modelo
INNER JOIN marca ON modelo.id_marca = marca.id_marca
INNER JOIN cliente ON vehiculo.id_cliente = cliente.cliente_id
WHERE cliente.persona_id = ID_CLIENTE ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_LISTAR_VENTA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LISTAR_VENTA`(IN FECHA_INICIO DATE, IN FECHA_FIN DATE)
SELECT
	t.transaccion_id as venta_id,
	t.persona_id as cliente_id,
	t.usuario_id,
	t.transaccion_tipocomprobante as venta_ticomprobante,
	t.transaccion_seriecomprobante as venta_seriecomprobante,
	t.transaccion_numcomprobante as venta_numcomprobante,
	t.transaccion_fecha as venta_fecha,
	t.transaccion_total as venta_total,
	t.transaccion_impuesto as venta_impuesto,
	t.transaccion_estatus as venta_estatus,
	u.usuario_nombre,
	CONCAT_WS(' ',ps.persona_nombre,ps.persona_apepat,ps.persona_apmat) AS NOMBRE_CLIENTE,
	ps.persona_nombre, 
	ps.persona_apepat, 
	ps.persona_apmat,
	t.transaccion_porcentaje
FROM
	transacciones t INNER JOIN usuario u ON t.usuario_id = u.usuario_id
	INNER JOIN persona ps ON ps.persona_id = t.persona_id
WHERE transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN AND
t.transaccion_tipo = 'VENTA' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_MESES_MAS_VENTAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_MESES_MAS_VENTAS`()
SELECT MONTHNAME(transaccion_fecha) NOMBRE_MES, COUNT(transaccion_id) CANTIDAD
	FROM transacciones 
WHERE YEAR(transaccion_fecha) = YEAR(CURDATE()) AND transaccion_estatus IN ('ORDEN FACTURADA', 'FACTURADO')
GROUP BY NOMBRE_MES ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_NUMERO_FINAL_FACTURA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_NUMERO_FINAL_FACTURA`()
SELECT conf_numero_final FROM configuracion ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_NUM_COMPROBANTE_INGRESO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_NUM_COMPROBANTE_INGRESO`()
SELECT MAX(transaccion_numcomprobante) FROM transacciones WHERE transaccion_tipo <> 'VENTA' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_OBTENER_DATOS_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_OBTENER_DATOS_USUARIO`(IN ID_USUARIO INT)
SELECT
	usuario.usuario_id, usuario.usuario_nombre, usuario.usuario_password, persona.persona_correo, 
	usuario.usuario_intento, usuario.usuario_estatus, usuario.rol_id, usuario.usuario_imagen, 
	rol.rol_nombre, persona.persona_nombre, persona.persona_apepat, persona.persona_apmat, 
	persona.persona_nrodocumento, persona.persona_tipodocumento, persona.persona_sexo, 
	persona.persona_telefono, persona.persona_fregistro
FROM usuario INNER JOIN rol ON usuario.rol_id = rol.rol_id
	INNER JOIN persona ON usuario.persona_id = persona.persona_id
WHERE usuario_id = ID_USUARIO ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_OBTENER_DATOS_WIDGET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_OBTENER_DATOS_WIDGET`(IN FECHA_INICIO DATE, IN FECHA_FIN DATE)
SELECT IFNULL(SUM(t.transaccion_total),0) as venta_total,

(SELECT IFNULL(SUM(transaccion_total),0) FROM transacciones WHERE transaccion_estatus = 'INGRESADO' AND transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN) as ingreso_total, 

(SELECT COUNT(*) FROM transacciones t WHERE t.transaccion_estatus IN ('ORDEN FACTURADA', 'FACTURADO') 
AND t.transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN) as cantidad_de_transacciones,

(SELECT COUNT(*) FROM transacciones WHERE transaccion_estatus = 'INGRESADO' AND transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN) as cantidad_ingresos,

(SELECT COUNT(*) FROM transacciones WHERE transaccion_estatus = 'COTIZADO' AND transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN) as cantidad_cotizaciones,

(SELECT COUNT(*) FROM producto WHERE prod_serv_tipo = 'PRODUCTO') as cantidad_productos,
(SELECT COUNT(*) FROM producto WHERE prod_serv_tipo = 'SERVICIO') as cantidad_servicios,

(SELECT COUNT(*) FROM producto WHERE producto_oferta = 1) as cantidad_productos_oferta,

(SELECT CONCAT_WS(' ',p.persona_nombre,p.persona_apmat,p.persona_apepat)  
	FROM usuario u INNER JOIN transacciones t ON u.usuario_id = t.usuario_id 
	INNER JOIN persona p ON u.persona_id = p.persona_id
WHERE t.transaccion_estatus IN ('ORDEN FACTURADA', 'FACTURADO') 
AND t.transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN 
GROUP BY u.usuario_nombre 
ORDER BY COUNT(t.usuario_id) DESC 
LIMIT 1) as empleado_mas_ventas,

(SELECT COUNT(*) FROM transacciones t WHERE t.transaccion_estatus = 'MOVIMIENTO'
AND t.transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN) as cantidad_movimientos,

(SELECT COUNT(*) FROM transacciones t WHERE t.transaccion_estatus = 'AJUSTE'
AND t.transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN) as cantidad_ajustes

	FROM transacciones t 
WHERE t.transaccion_estatus IN ('ORDEN FACTURADA', 'FACTURADO') AND t.transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_ACCESO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_ACCESO`(IN USUARIO INT,
	IN MODULO VARCHAR(100))
INSERT INTO acceso(modulo_codigo, usuario_id, acceso_estado) VALUES(MODULO, USUARIO, 'ACTIVO') ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_BITACORA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_BITACORA`(IN ID_USU INT,
	IN ACCION VARCHAR(45),
	IN TABLA VARCHAR(100),
	IN DESCRIPCION TEXT,
	IN PUBLI VARCHAR(100))
BEGIN
	
				
		INSERT INTO bitacora (
													bitacora.id_usuario, 
													bitacora.bitacora_accion,
													bitacora.bitacora_tabla,
													bitacora.bitacora_fecha_hora,
													bitacora.bitacora_descripcion,
													bitacora.ip_publica
													) 
		VALUES (
						ID_USU,
						ACCION,
						TABLA,
						NOW(),
						DESCRIPCION,
						PUBLI
						);
		SELECT 1;	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_BITACORA_ACCESO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_BITACORA_ACCESO`(IN ID_USU INT,
	IN ACCION VARCHAR(45),
	IN TABLA VARCHAR(100),
	IN DESCRIPCION TEXT,
	IN PUBLI VARCHAR(100))
INSERT INTO bitacora (
			bitacora.id_usuario, 
			bitacora.bitacora_accion,
			bitacora.bitacora_tabla,
			bitacora.bitacora_fecha_hora,
			bitacora.bitacora_descripcion,
			bitacora.ip_publica
			) 
		VALUES (
						ID_USU,
						ACCION,
						TABLA,
						NOW(),
						DESCRIPCION,
						PUBLI
						) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_CATEGORIA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_CATEGORIA`(IN CATEGORIA VARCHAR(100))
BEGIN
	DECLARE CANTIDAD INT;
	SET @CANTIDAD:=(SELECT COUNT(*) FROM categoria WHERE categoria_nombre = CATEGORIA);
	
	IF @CANTIDAD = 0 THEN			
		INSERT INTO categoria (categoria_nombre, categoria_fregistro,categoria_estatus) VALUES (CATEGORIA, CURDATE(), 'ACTIVO'); 
		SELECT 1; 
	ELSE
		SELECT 2; 
	END IF;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_CLIENTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_CLIENTE`(IN NOMBRE VARCHAR(100), 
	IN APELLIDO_PATERNO VARCHAR(50), 
	IN APELLIDO_MATERNO VARCHAR(50), 
	IN TIPO_DOCUMENTO VARCHAR(15), 
	IN N_DOCUMENTO VARCHAR(17), 
	IN SEXO VARCHAR(15),
	IN TELEFONO VARCHAR(17),
	IN CORREO VARCHAR(70),
	IN EMPRESA VARCHAR(100))
BEGIN

	DECLARE CANTIDAD INT;
	DECLARE CANTIDAD_CORREO INT;
	SET @CANTIDAD:=(SELECT COUNT(*) FROM persona WHERE persona_nrodocumento = N_DOCUMENTO);
	SET @CANTIDAD_CORREO:=(SELECT COUNT(*) FROM persona WHERE persona_correo = CORREO);
	
	IF @CANTIDAD = 0 AND @CANTIDAD_CORREO = 0 THEN
		INSERT INTO persona (persona_nombre, persona_apepat, persona_apmat, persona_nrodocumento, persona_tipodocumento, persona_sexo,persona_telefono, persona_fregistro, persona_estatus, persona_correo, persona_empresa) 
		VALUES (NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, N_DOCUMENTO, TIPO_DOCUMENTO, SEXO, TELEFONO, CURDATE(), 'ACTIVO', CORREO, EMPRESA);
		INSERT INTO cliente (cliente_fregistro, cliente_estatus, persona_id) VALUES (CURDATE(), 'ACTIVO', LAST_INSERT_ID());
		
		SELECT 1; 
	ELSE
		IF @CANTIDAD > 0 THEN
				SELECT 2;
			ELSEIF @CANTIDAD_CORREO > 0 THEN
				SELECT 3;
			ELSE
				SELECT 4;
			END IF;
	END IF;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_CONFIGURACION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_CONFIGURACION`(IN NOMBRE VARCHAR(255),
IN DIRECCION VARCHAR(255),
IN TELEFONO VARCHAR(20),
IN CELULAR VARCHAR(20),
IN RTN VARCHAR(100),
IN CORREO VARCHAR(100),
IN FOTO VARCHAR(255),
IN ISV DECIMAL(2,2),
IN CAI VARCHAR(255),
IN FECHALIMITE DATE,
IN CANTIDADFACTURA INT,
IN NUMERO_INICIAL VARCHAR(50),
IN NUMERO_FINAL VARCHAR(50),
IN PRECIO_DOLAR DECIMAL(5,2))
BEGIN
DECLARE CANTIDAD INT;

SET @CANTIDAD:=(SELECT COUNT(*) FROM configuracion WHERE conf_nombre_empresa = NOMBRE);



IF @CANTIDAD = 0 THEN
	
		INSERT INTO configuracion (conf_nombre_empresa, conf_direccion,conf_telefono, conf_celular, conf_rtn,conf_correo,conf_img_logo,conf_isv, conf_cai, conf_fact_fechalimite_emision,conf_cantidad_fact,conf_numero_inicial,conf_numero_final,conf_preciodolar)
		VALUES (NOMBRE,DIRECCION, TELEFONO,CELULAR,RTN, CORREO,FOTO,ISV, CAI, FECHALIMITE,CANTIDADFACTURA,NUMERO_INICIAL,NUMERO_FINAL,PRECIO_DOLAR);
					SELECT 1; 
	ELSE
		SELECT 2; 
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_COTIZACION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_COTIZACION`(IN ID_CLIENTE INT, 
IN ID_USUARIO INT,
IN TOTAL DECIMAL(10,2), 
IN IMPUESTO DECIMAL(10,2), 
IN PORCENTAJE DECIMAL(2,2),
IN DESCUENTO DECIMAL(10,2),
IN OBSER TEXT)
BEGIN

	DECLARE ID_CORRELATIVO INT;
		
	SET @ID_TRANSACCION:=(SELECT IFNULL(MAX(transaccion_id),0) FROM transacciones) + 1;
	

	INSERT INTO transacciones (
		persona_id, 
		usuario_id, 
		transaccion_tipocomprobante, 
		transaccion_seriecomprobante, 
		transaccion_numcomprobante, 
		transaccion_fecha, 
		transaccion_impuesto, 
		transaccion_total, 
		transaccion_estatus, 
		transaccion_porcentaje,
		transaccion_descuento, 
		transaccion_observaciones, 
		transaccion_tipo, 
		id_correlativo) 
	VALUES (
		ID_CLIENTE, 
		ID_USUARIO, 
		'', 
		'', 
		'', 
		NOW(), 
		IMPUESTO, 
		TOTAL, 
		'COTIZADO', 
		PORCENTAJE, 
		DESCUENTO, 
		OBSER, 
		'COTIZACION', 
		CONCAT('COT-0000',@ID_TRANSACCION));

	SELECT LAST_INSERT_ID();	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_CREDENCIALES_PERSONA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_CREDENCIALES_PERSONA`(IN ID_PERSONA INT, IN USERNAME VARCHAR(50), IN CLAVE VARCHAR(255))
BEGIN
	DECLARE	CANTIDAD INT;
	DECLARE ROL VARCHAR(30);
	SET @CANTIDAD:=(SELECT COUNT(*) FROM usuario WHERE usuario_nombre = USERNAME OR persona_id = ID_PERSONA);
	
	IF @CANTIDAD > 0 THEN
	 SELECT 2;
	ELSE
		SET @ROL:=(SELECT rol_id FROM rol WHERE rol_nombre = 'CLIENTE');
		INSERT INTO usuario(usuario_nombre, usuario_password, persona_id, rol_id, usuario_imagen, usuario_intento, usuario_estatus, usuario_passwordtemp) 
		VALUES (USERNAME, CLAVE, ID_PERSONA, @ROL, 'controlador/usuario/img/user_default.png', 1, 'ACTIVO', 1);
		SELECT 1;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_DETALLE_COTIZACION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_DETALLE_COTIZACION`(IN ID_COTIZACION INT, 
IN ID_PRODUCTO INT,
IN CANTIDAD DECIMAL(8,2),
IN PRECIO DECIMAL(10,2),
IN DESCUENTO DECIMAL(10,2))
BEGIN
	DECLARE NOMBRE_PRODUCTO VARCHAR(100);
	SET @NOMBRE_PRODUCTO:=(SELECT producto_nombre FROM producto WHERE producto_id = ID_PRODUCTO);

	INSERT INTO detalle_transaccion (
	transaccion_id,
	producto_id, 
	detalletransaccion_cantidad, 
	detalletransaccion_precio, 	
	detalletransaccion_descuento, 
	detalletransaccion_nombrepro, 
	detalletransaccion_estatus)
	VALUES (ID_COTIZACION, ID_PRODUCTO, CANTIDAD, PRECIO, DESCUENTO, @NOMBRE_PRODUCTO, 'COTIZADO');
	


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_DETALLE_MOVIMIENTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_DETALLE_MOVIMIENTO`(IN ID_MOVIMIENTO INT,
	IN ID_PRODUCTO INT,
	IN CANTIDAD INT)
BEGIN
	DECLARE NOMBRE_PRODUCTO VARCHAR(100);
	SET @NOMBRE_PRODUCTO:=(SELECT producto_nombre FROM producto WHERE producto_id = ID_PRODUCTO);

	INSERT INTO detalle_transaccion (transaccion_id, producto_id, detalletransaccion_cantidad, detalletransaccion_precio, detalletransaccion_descuento, detalletransaccion_nombrepro, detalletransaccion_estatus)
	VALUES (ID_MOVIMIENTO, ID_PRODUCTO, CANTIDAD, 0, 0, @NOMBRE_PRODUCTO, 'MOVIMIENTO');
	
	UPDATE producto SET producto_stock = (producto_stock - CANTIDAD) WHERE producto_id = ID_PRODUCTO;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_DETALLE_ORDEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_DETALLE_ORDEN`(IN TRANSACCION INT(11), 
IN VEHICULO INT(11),
IN COMBUSTIBLE VARCHAR(20), 
IN KILOMETRAJE VARCHAR(20), 
IN MECANICO INT(11),
IN OBSER TEXT)
BEGIN

 	INSERT INTO transaccion_vehiculo (id_transaccion, id_vehiculo, nivel_combustible, `vehiculo_km/millas`, id_usuario, descripcion)
 	VALUES (TRANSACCION, VEHICULO, COMBUSTIBLE, KILOMETRAJE, MECANICO, OBSER);
		
	SELECT TRANSACCION;	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_DETALLE_PRO_SER_ORDEN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_DETALLE_PRO_SER_ORDEN`(IN ID_COTIZACION INT, 
IN ID_PRODUCTO INT,
IN CANTIDAD DECIMAL(8,2),
IN PRECIO DECIMAL(10,2),
IN DESCUENTO DECIMAL(10,2))
BEGIN
	DECLARE NOMBRE_PRODUCTO VARCHAR(100);
	DECLARE TIPO_PRODUCTO VARCHAR(100);
	
	SET @NOMBRE_PRODUCTO:=(SELECT producto_nombre FROM producto WHERE producto_id = ID_PRODUCTO);
	SET @TIPO_PRODUCTO:=(SELECT prod_serv_tipo FROM producto WHERE producto_id = ID_PRODUCTO);
	
	SET @CANTIDAD:=(
		SELECT 
			COUNT(tarea.detalletransaccion_id)
		FROM detalle_transaccion INNER JOIN tarea ON 
		detalle_transaccion.detalletransaccion_id = tarea.detalletransaccion_id
		WHERE detalle_transaccion.transaccion_id = ID_COTIZACION
		AND detalle_transaccion.producto_id = ID_PRODUCTO
	);
	
	
	IF @CANTIDAD = 0 THEN
			INSERT INTO detalle_transaccion (
			transaccion_id,
			producto_id, 
			detalletransaccion_cantidad, 
			detalletransaccion_precio, 	
			detalletransaccion_descuento, 
			detalletransaccion_nombrepro, 
			detalletransaccion_estatus)
		VALUES (ID_COTIZACION, ID_PRODUCTO, CANTIDAD, PRECIO, DESCUENTO, @NOMBRE_PRODUCTO, 'ORDENADO');
		
		
		IF @TIPO_PRODUCTO = 'PRODUCTO' THEN
			UPDATE producto SET producto_stock = (producto_stock - CANTIDAD) WHERE producto_id = ID_PRODUCTO;
		END IF;
	END IF;

	
	

 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_DETALLE_VENTA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_DETALLE_VENTA`(IN ID_VENTA INT, 
IN ID_PRODUCTO INT,
IN CANTIDAD DECIMAL(8,2),
IN PRECIO DECIMAL(10,2),
IN DESCUENTO DECIMAL(10,2))
BEGIN
	DECLARE NOMBRE_PRODUCTO VARCHAR(100);
	SET @NOMBRE_PRODUCTO:=(SELECT producto_nombre FROM producto WHERE producto_id = ID_PRODUCTO);

	INSERT INTO detalle_transaccion (transaccion_id, producto_id, detalletransaccion_cantidad, detalletransaccion_precio, 	detalletransaccion_descuento, detalletransaccion_nombrepro, detalletransaccion_estatus)
	VALUES (ID_VENTA, ID_PRODUCTO, CANTIDAD, PRECIO, DESCUENTO, @NOMBRE_PRODUCTO, 'FACTURADO');
	
	UPDATE producto SET producto_stock = (producto_stock - CANTIDAD) WHERE producto_id = ID_PRODUCTO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_FABRICANTE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_FABRICANTE`(IN FABRICANTE VARCHAR(80), IN DESCRIPCION TEXT)
BEGIN
	DECLARE CANTIDAD INT;
	SET @CANTIDAD:=(SELECT COUNT(*) FROM fabricante WHERE fabricante_nombre = FABRICANTE);
	
	IF @CANTIDAD = 0 THEN			
		INSERT INTO fabricante (fabricante_nombre, fabricante_descripcion, fabricante_estado, fabricante_fregistro
) VALUES (FABRICANTE, DESCRIPCION,'ACTIVO', CURDATE()); 
		SELECT 1; 
	ELSE
		SELECT 2; 
	END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_INGRESO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_INGRESO`(IN ID_PROVEEDOR INT, 
IN ID_USUARIO INT,
IN TIPO_COMPROBANTE VARCHAR(50), 
IN SERIE_COMPROBANTE VARCHAR(20), 
IN NUM_COMPROBANTE VARCHAR(20),
IN TOTAL DECIMAL(10,2), 
IN IMPUESTO DECIMAL(10,2), 
IN PORCENTAJE DECIMAL(2,2),
IN ID_AJUSTE INT,
IN ACCION VARCHAR(15))
BEGIN
	DECLARE ID_TRANSACCION INT;
	DECLARE ID_CORRELATIVO INT;
	DECLARE CANTIDAD_AJ INT;
	DECLARE ID_PRODUCTO_AJ INT;
	DECLARE STOCK_ACTUAL INT;
	DECLARE DETALLE_ID INT;
	DECLARE VAL VARCHAR(3);
	
	IF ACCION = 'AJUSTE' THEN
		UPDATE transacciones SET transaccion_estatus = 'AJUSTE ANULADO' WHERE transaccion_id = ID_AJUSTE;
		SET @CANTIDAD_AJ:=(SELECT COUNT(*) FROM detalle_transaccion WHERE transaccion_id = ID_AJUSTE);
		
		WHILE @CANTIDAD_AJ > 0 DO
			SET @ID_PRODUCTO_AJ:=(SELECT producto_id FROM detalle_transaccion WHERE detalletransaccion_estatus = 'AJUSTE' AND 				transaccion_id = ID_AJUSTE LIMIT 1);
			
			SET @DETALLE_ID:=(SELECT detalletransaccion_id FROM detalle_transaccion WHERE detalletransaccion_estatus = 'AJUSTE' AND transaccion_id = ID_AJUSTE LIMIT 1);
			
			SET @STOCK_ACTUAL:=(SELECT producto_stock FROM producto WHERE producto_id = @ID_PRODUCTO_AJ);
			
			UPDATE producto SET producto_stock = @STOCK_ACTUAL-(SELECT detalletransaccion_cantidad FROM detalle_transaccion WHERE 			detalletransaccion_estatus = 'AJUSTE' AND transaccion_id = ID_AJUSTE LIMIT 1) WHERE producto_id = @ID_PRODUCTO_AJ;
			
			UPDATE detalle_transaccion SET detalletransaccion_estatus = 'AJUSTE ANULADO' WHERE detalletransaccion_id = @DETALLE_ID;
			SET @CANTIDAD_AJ:= @CANTIDAD_AJ - 1;
		END WHILE;	
	ELSE
		SET @VAL:='';
	END IF;

SET @ID_TRANSACCION:=(SELECT IFNULL(MAX(transaccion_id),0) FROM transacciones) + 1;

INSERT INTO transacciones (usuario_id, transaccion_tipocomprobante,transaccion_seriecomprobante, transaccion_numcomprobante, transaccion_fecha, transaccion_total, transaccion_impuesto, transaccion_estatus, transaccion_porcentaje, transaccion_tipo, transaccion_descuento, transaccion_observaciones,id_correlativo) 
VALUES (ID_USUARIO, TIPO_COMPROBANTE, SERIE_COMPROBANTE, NUM_COMPROBANTE, NOW(), TOTAL, IMPUESTO, 
IF(TIPO_COMPROBANTE = 'AJUSTE', 'AJUSTE','INGRESADO'), PORCENTAJE, 
IF(TIPO_COMPROBANTE = 'AJUSTE','AJUSTE','INGRESO'), 00.00, '', 
CONCAT(IF(TIPO_COMPROBANTE = 'AJUSTE','AJT-0000','ING-0000'),@ID_TRANSACCION));
		
INSERT INTO transaccion_proveedor VALUES(LAST_INSERT_ID(), ID_PROVEEDOR);	
SELECT LAST_INSERT_ID();	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_INGRESO_DETALLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_INGRESO_DETALLE`(IN ID_INGRESO INT, 
IN ID_PRODUCTO INT,
IN CANTIDAD DECIMAL(8,2),
IN PRECIO DECIMAL(10,2))
BEGIN
	DECLARE NOMBRE_PRODUCTO VARCHAR(100);
	DECLARE ESTATUS VARCHAR(30);
	
	SET @NOMBRE_PRODUCTO:=(SELECT producto_nombre FROM producto WHERE producto_id = ID_PRODUCTO);
	SET @ESTATUS:=(SELECT transaccion_estatus FROM transacciones WHERE transaccion_id = ID_INGRESO);

	INSERT INTO detalle_transaccion (transaccion_id, producto_id, detalletransaccion_cantidad, detalletransaccion_precio, detalletransaccion_descuento, detalletransaccion_nombrepro, detalletransaccion_estatus)
	VALUES (ID_INGRESO, ID_PRODUCTO, CANTIDAD, PRECIO, 00.00, @NOMBRE_PRODUCTO, @ESTATUS);
	
	UPDATE producto SET producto_stock = (producto_stock + CANTIDAD) WHERE producto_id = ID_PRODUCTO;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_MARCA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_MARCA`(IN ID_USUARIO_GUARDA INT,
	IN NOMBRE VARCHAR(45),
	IN DESCRIPCION TEXT,
	IN ESTADO VARCHAR(45))
BEGIN
	DECLARE CANTIDAD INT;
	SET @CANTIDAD:=(SELECT COUNT(*) FROM marca WHERE marca_nombre = NOMBRE);
	
	IF @CANTIDAD = 0 THEN			
		INSERT INTO marca (marca_nombre, marca_descripcion, marca_estado) VALUES (NOMBRE, DESCRIPCION, 'ACTIVO');
		
		SELECT 1; 
	ELSE
		SELECT 2; 
	END IF;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_MODELO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_MODELO`(IN ID_USUARIO_GUARDA INT,
	IN NOMBRE VARCHAR(45),
	IN DESCRIPCION TEXT,
	IN ESTADO VARCHAR(45),
	IN ID_MARCA INT)
BEGIN
	DECLARE CANTIDAD INT;
	SET @CANTIDAD:=(SELECT COUNT(*) FROM modelo WHERE modelo_nombre = NOMBRE);
	
	IF @CANTIDAD = 0 THEN			
		INSERT INTO modelo (modelo_nombre, modelo_descripcion, modelo_estado, id_marca) VALUES (NOMBRE, DESCRIPCION, 'ACTIVO', ID_MARCA);
		
		SELECT 1; 
	ELSE
		SELECT 2; 
	END IF;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_MOVIMIENTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_MOVIMIENTO`(IN OBSERVACION TEXT,
    IN ID_USUARIO INT)
BEGIN
		DECLARE ID_TRANSACCION INT; 
		SET @ID_TRANSACCION:=(SELECT IFNULL(MAX(transaccion_id),0) FROM transacciones) + 1;
			
	INSERT INTO transacciones(id_correlativo, transaccion_tipocomprobante, transaccion_seriecomprobante,transaccion_numcomprobante,transaccion_fecha, transaccion_impuesto, transaccion_total, transaccion_estatus, 							transaccion_descuento, transaccion_porcentaje, transaccion_observaciones, transaccion_tipo, usuario_id)
	VALUES(CONCAT('MOV-0000',@ID_TRANSACCION), '', '', '',NOW(), 0, 0, 'MOVIMIENTO', 0, 0, OBSERVACION, 'MOVIMIENTO', 			ID_USUARIO);	
	
	SELECT LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_ORDEN_TRABAJO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_ORDEN_TRABAJO`(IN ID_CLIENTE INT, 
IN ID_USUARIO INT,
IN TOTAL DECIMAL(10,2), 
IN IMPUESTO DECIMAL(10,2), 
IN PORCENTAJE DECIMAL(2,2),
IN DESCUENTO DECIMAL(10,2),
IN OBSER TEXT)
BEGIN

	DECLARE ID_CORRELATIVO INT;
		
	SET @ID_TRANSACCION:=(SELECT IFNULL(MAX(transaccion_id),0) FROM transacciones) + 1;
	

	INSERT INTO transacciones (
		persona_id, 
		usuario_id, 
		transaccion_tipocomprobante, 
		transaccion_seriecomprobante, 
		transaccion_numcomprobante, 
		transaccion_fecha, 
		transaccion_impuesto, 
		transaccion_total, 
		transaccion_estatus, 
		transaccion_porcentaje,
		transaccion_descuento, 
		transaccion_observaciones, 
		transaccion_tipo, 
		id_correlativo) 
	VALUES (
		ID_CLIENTE, 
		ID_USUARIO, 
		'', 
		'', 
		'', 
		NOW(), 
		IMPUESTO, 
		TOTAL, 
		'INICIADO', 
		PORCENTAJE, 
		DESCUENTO, 
		OBSER, 
		'ORDEN', 
		CONCAT('ORD-0000',@ID_TRANSACCION));

	SELECT LAST_INSERT_ID();	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_PERSONA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_PERSONA`(IN NOMBRE VARCHAR(100), 
	IN APELLIDO_PATERNO VARCHAR(50), 
	IN APELLIDO_MATERNO VARCHAR(50), 
	IN TIPO_DOCUMENTO VARCHAR(15), 
	IN N_DOCUMENTO VARCHAR(17), 
	IN SEXO VARCHAR(15),
	IN TELEFONO VARCHAR(17))
BEGIN

	DECLARE CANTIDAD INT;
	SET @CANTIDAD:=(SELECT COUNT(*) FROM persona WHERE persona_nrodocumento = N_DOCUMENTO);
	
	IF @CANTIDAD = 0 THEN
		INSERT INTO persona (persona_nombre, persona_apepat, persona_apmat, persona_nrodocumento, persona_tipodocumento, persona_sexo,		persona_telefono, persona_fregistro, persona_estatus) 
		VALUES (NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, N_DOCUMENTO, TIPO_DOCUMENTO, SEXO, TELEFONO, CURDATE(), 'ACTIVO');
		SELECT 1; 
	ELSE
		SELECT 2;
	END IF;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_PRODUCTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_PRODUCTO`(IN PRODUCTO VARCHAR(150),
IN STOCK_MINIMO INT,
IN CATEGORIA INT,
IN ID_FABRICANTE INT,
IN UNIDAD INT,
IN FOTO VARCHAR(255),
IN PRECIO_COMPRA DECIMAL(10,2),
IN PRECIO DECIMAL(10,2),
IN DESCRIPCION VARCHAR(255),
IN TIPO VARCHAR(20),
IN CODIGO VARCHAR(20))
BEGIN
DECLARE CANTIDAD INT;
DECLARE CANT_CODIGO INT;

SET @CANTIDAD:=(SELECT COUNT(*) FROM producto WHERE producto_nombre = PRODUCTO);
SET @CANT_CODIGO:=(SELECT COUNT(*) FROM producto WHERE producto_codigo = CODIGO);


IF @CANTIDAD = 0 THEN
	IF @CANT_CODIGO = 0 THEN
		INSERT INTO producto (producto_nombre, producto_stock,producto_stock_minimo, categoria_id, id_fabricante, unidad_id, 		  		producto_foto,producto_preciocompra, producto_precioventa, producto_estatus, producto_descripcion,prod_serv_tipo,						producto_codigo)
		VALUES (PRODUCTO, 0, STOCK_MINIMO, CATEGORIA,ID_FABRICANTE, UNIDAD, FOTO,PRECIO_COMPRA, PRECIO, 'ACTIVO', DESCRIPCION,				TIPO,CODIGO);
					SELECT 1;
	ELSE
		SELECT 3;
	END IF;
ELSE
	SELECT 2;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_PROVEEDOR` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_PROVEEDOR`(IN NOMBRE VARCHAR(100), 
	IN APELLIDO_PATERNO VARCHAR(50), 
	IN APELLIDO_MATERNO VARCHAR(50), 
	IN TIPO_DOCUMENTO VARCHAR(15), 
	IN N_DOCUMENTO VARCHAR(17), 
	IN SEXO VARCHAR(15),
	IN TELEFONO VARCHAR(17),
	IN RAZON_SOCIAL VARCHAR(255), 
	IN NOMBRE_CONTACTO VARCHAR(100),
	IN NUM_CONTACTO VARCHAR(17),
	IN CORREO VARCHAR(70))
BEGIN

	DECLARE CANTIDAD INT;
	DECLARE CANTIDAD_CORREO INT;
	SET @CANTIDAD:=(SELECT COUNT(*) FROM persona WHERE persona_nrodocumento = N_DOCUMENTO);
	SET @CANTIDAD_CORREO:=(SELECT COUNT(*) FROM persona WHERE persona_correo = CORREO);
	
	IF @CANTIDAD = 0 AND @CANTIDAD_CORREO = 0 THEN
		INSERT INTO persona (persona_nombre, persona_apepat, persona_apmat, persona_nrodocumento, persona_tipodocumento, persona_sexo,		persona_telefono, persona_fregistro, persona_estatus, persona_correo) 
		VALUES (NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, N_DOCUMENTO, TIPO_DOCUMENTO, SEXO, TELEFONO, CURDATE(), 'ACTIVO', CORREO);
		
		INSERT INTO proveedor (proveedor_numcontacto, proveedor_contacto, proveedor_estatus, persona_id, proveedor_razonsocial) 
		VALUES (NUM_CONTACTO, NOMBRE_CONTACTO,'ACTIVO', LAST_INSERT_ID(), RAZON_SOCIAL);
		
		SELECT 1; 
	ELSE
			
			IF @CANTIDAD > 0 THEN
				SELECT 2;
			ELSEIF @CANTIDAD_CORREO > 0 THEN
				SELECT 3;
			ELSE
				SELECT 4;
			END IF;
			
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_ROL` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_ROL`(IN ROL_NOMBRE VARCHAR(15))
BEGIN
	
	DECLARE CANTIDAD INT;
	SET @CANTIDAD:=(SELECT COUNT(*) FROM rol WHERE rol.rol_nombre = ROL_NOMBRE);
	
	IF @CANTIDAD = 0 THEN			
		INSERT INTO rol (rol_nombre, rol_feregistro,rol_estatus) VALUES (ROL_NOMBRE, CURDATE(), 'ACTIVO'); 
		SELECT 1; 
	ELSE
		SELECT 2; 
	END IF;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_SERVICIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_SERVICIO`(IN PRODUCTO VARCHAR(150),
IN CATEGORIA INT,
IN FOTO VARCHAR(255),
IN PRECIO DECIMAL(10,2),
IN DESCRIPCION VARCHAR(255),
IN TIPO VARCHAR(20),
IN CODIGO VARCHAR(20))
BEGIN
DECLARE CANTIDAD INT;
DECLARE CANT_CODIGO INT;

SET @CANTIDAD:=(SELECT COUNT(*) FROM producto WHERE producto_nombre = PRODUCTO);
SET @CANT_CODIGO:=(SELECT COUNT(*) FROM producto WHERE producto_codigo = CODIGO);


IF @CANTIDAD = 0 THEN
	IF @CANT_CODIGO = 0 THEN
			INSERT INTO producto (producto_nombre, producto_stock,producto_stock_minimo, categoria_id,producto_foto,producto_preciocompra, producto_precioventa, producto_estatus, producto_descripcion,prod_serv_tipo,producto_codigo)
			
		VALUES (PRODUCTO, 0, 0, CATEGORIA, FOTO,0, PRECIO, 'ACTIVO', DESCRIPCION,TIPO,CODIGO);
					SELECT 1;
	ELSE
		SELECT 3;
	END IF;
ELSE
	SELECT 2;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_TAREAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_TAREAS`(IN ID_DTRANSACCION INT,IN FECHA_INICIO DATE, IN FECHA_FIN DATE, IN NOTAS TEXT)
INSERT INTO tarea (fecha_inicio, fecha_fin, estado, detalletransaccion_id, tarea_notas) VALUES (FECHA_INICIO, FECHA_FIN, 'PENDIENTE', ID_DTRANSACCION, NOTAS) ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_UNIDAD_MEDIDA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_UNIDAD_MEDIDA`(IN UNIDAD VARCHAR(100), IN ABREVIATURA CHAR(10))
BEGIN
	DECLARE CANTIDAD INT;
	SET @CANTIDAD:=(SELECT COUNT(*) FROM unidad_medida WHERE unidad_nombre = UNIDAD);
	
	IF @CANTIDAD = 0 THEN			
		INSERT INTO unidad_medida (unidad_nombre, unidad_abreviatura ,unidad_fregistro,unidad_estatus) VALUES (			UNIDAD, ABREVIATURA,CURDATE(), 'ACTIVO'); 
		SELECT 1; 
	ELSE
		SELECT 2; 
	END IF;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_USUARIO`(IN USUARIO VARCHAR(20),
	IN PASS VARCHAR(250),
	IN EMAIL VARCHAR(70),
	IN ID_ROL INT,
	IN RUTA VARCHAR(250),
	IN NOMBRE VARCHAR(100), 
	IN APELLIDO_PATERNO VARCHAR(50), 
	IN APELLIDO_MATERNO VARCHAR(50), 
	IN TIPO_DOCUMENTO VARCHAR(15), 
	IN N_DOCUMENTO VARCHAR(17), 
	IN SEXO VARCHAR(15),
	IN TELEFONO VARCHAR(17))
BEGIN
DECLARE	CANTIDAD INT;
	SET @CANTIDAD :=(SELECT COUNT(*) FROM usuario WHERE usuario_nombre = USUARIO);
	SET @CANTIDAD_CORREO:=(SELECT COUNT(*) FROM persona WHERE persona_correo = EMAIL OR persona_nrodocumento = N_DOCUMENTO);
	IF @CANTIDAD = 0 AND @CANTIDAD_CORREO = 0 THEN
		INSERT INTO persona (persona_nombre, persona_apepat, persona_apmat, persona_nrodocumento, persona_tipodocumento, persona_sexo,persona_telefono, persona_fregistro, persona_estatus, persona_correo) 
		VALUES (NOMBRE, APELLIDO_PATERNO, APELLIDO_MATERNO, N_DOCUMENTO, TIPO_DOCUMENTO, SEXO, TELEFONO, CURDATE(), 'ACTIVO', EMAIL);
		
		INSERT INTO usuario(usuario_nombre, usuario_password, persona_id, rol_id, usuario_imagen, usuario_intento, usuario_estatus, usuario_passwordtemp) VALUES (USUARIO, PASS, LAST_INSERT_ID(), ID_ROL, RUTA, 1, 'ACTIVO', 0);
		SELECT 1;
	ELSE
		IF @CANTIDAD > 0 THEN
				SELECT 2;
			ELSEIF @CANTIDAD_CORREO > 0 THEN
				SELECT 3;
			ELSE
				SELECT 4;
			END IF;
	END IF;		
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_VEHICULO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_VEHICULO`(IN PLACA VARCHAR(50),
IN ANIO VARCHAR(4),
IN TRANSMISION VARCHAR(50),
IN COMBUSTIBLE VARCHAR(50),
IN CHASIS VARCHAR(100),
IN MOTOR VARCHAR(50),
IN OBSERVACIONES TEXT,
IN IMAGEN VARCHAR(255),
IN TIPO VARCHAR(50),
IN ESTADO VARCHAR(50),
IN MODELO INT,
IN CLIENTE INT)
BEGIN
DECLARE CANTIDAD INT;
SET @CANTIDAD:=(SELECT COUNT(*) FROM vehiculo WHERE vehiculo_placa = PLACA);

IF @CANTIDAD = 0 THEN
		INSERT INTO vehiculo(vehiculo_placa, vehiculo_anio, vehiculo_transmision, vehiculo_tipo_combustible, vehiculo_num_chasis, vehiculo_num_motor,vehiculo_observaciones, vehiculo_imagen, vehiculo_tipo, vehiculo_estado, 												id_modelo, id_cliente) 
		VALUES (PLACA,ANIO,TRANSMISION,COMBUSTIBLE,CHASIS,MOTOR,OBSERVACIONES,IMAGEN,TIPO,ESTADO,MODELO,CLIENTE);
		SELECT 1;
ELSE
	SELECT 2;
END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REGISTRAR_VENTA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REGISTRAR_VENTA`(IN ID_CLIENTE INT, 
IN ID_USUARIO INT,
IN TIPO_COMPROBANTE VARCHAR(50), 
IN SERIE_COMPROBANTE VARCHAR(20), 
IN NUM_COMPROBANTE VARCHAR(20),
IN TOTAL DECIMAL(10,2), 
IN IMPUESTO DECIMAL(10,2), 
IN PORCENTAJE DECIMAL(2,2),
IN DESCUENTO DECIMAL(10,2),
IN CANT_PAGOCLIENTE DECIMAL(10,2))
BEGIN

	DECLARE ID_CORRELATIVO INT;
	DECLARE NUM_FAC_INICIAL VARCHAR(50);
	DECLARE NUM_FAC_TRANSAC VARCHAR(50);
	
	SET @ID_TRANSACCION:=(SELECT IFNULL(MAX(transaccion_id),0) FROM transacciones) + 1;
	SET @NUM_FAC_INICIAL:=(SELECT conf_numero_inicial FROM configuracion);
	SET @NUM_FAC_TRANSAC:=(SELECT COUNT(*) FROM transacciones WHERE transaccion_numcomprobante = @NUM_FAC_INICIAL);
	
	IF @NUM_FAC_TRANSAC > 0 THEN
		INSERT INTO transacciones (persona_id, usuario_id, transaccion_tipocomprobante, transaccion_seriecomprobante, transaccion_numcomprobante, transaccion_fecha, transaccion_impuesto, transaccion_total, transaccion_estatus, transaccion_porcentaje, transaccion_descuento, transaccion_observaciones, transaccion_tipo, id_correlativo, transaccion_cantidadpago) 
		VALUES (ID_CLIENTE, ID_USUARIO, TIPO_COMPROBANTE, SERIE_COMPROBANTE, NUM_COMPROBANTE, NOW(), IMPUESTO, TOTAL, 'FACTURADO', PORCENTAJE, DESCUENTO, '', 'VENTA', CONCAT('FAC-0000',@ID_TRANSACCION), CANT_PAGOCLIENTE);

	SELECT LAST_INSERT_ID();	
	ELSE
		INSERT INTO transacciones (persona_id, usuario_id, transaccion_tipocomprobante, transaccion_seriecomprobante, transaccion_numcomprobante, transaccion_fecha, transaccion_impuesto, transaccion_total, transaccion_estatus, transaccion_porcentaje, transaccion_descuento, transaccion_observaciones, transaccion_tipo, id_correlativo, transaccion_cantidadpago) 
		VALUES (ID_CLIENTE, ID_USUARIO, TIPO_COMPROBANTE, SERIE_COMPROBANTE, @NUM_FAC_INICIAL, NOW(), IMPUESTO, TOTAL, 'FACTURADO', PORCENTAJE, DESCUENTO, '', 'VENTA', CONCAT('FAC-0000',@ID_TRANSACCION), CANT_PAGOCLIENTE);

	SELECT LAST_INSERT_ID();	
	END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_REPORTE_MOVIMIENTO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_REPORTE_MOVIMIENTO`(IN ID_TRANSACCION INT)
SELECT t.transaccion_fecha, CONCAT_WS(' ',p.persona_nombre,p.persona_apepat,p.persona_apmat) AS NOMBRE_USUARIO,
	t.transaccion_observaciones, t.id_correlativo, p.persona_nrodocumento, p.persona_tipodocumento, t.transaccion_id
	FROM transacciones t INNER JOIN usuario u on t.usuario_id = u.usuario_id
	INNER JOIN persona p ON p.persona_id = u.persona_id
WHERE t.transaccion_id = ID_TRANSACCION ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SERIE_COMPROBANTE_INGRESO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SERIE_COMPROBANTE_INGRESO`()
SELECT MAX(transaccion_seriecomprobante) AS SERIE_COMPROBANTE FROM transacciones WHERE transaccion_tipo <> 'VENTA' ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SERIE_COMPROBANTE_VENTA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SERIE_COMPROBANTE_VENTA`()
SELECT MAX(transaccion_seriecomprobante) AS SERIE_COMPROBANTE FROM transacciones ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TOP10_PRODUCTOS_MENOS_INGRESADOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TOP10_PRODUCTOS_MENOS_INGRESADOS`(IN FECHA_INICIO DATE, IN FECHA_FIN DATE)
SELECT dt.detalletransaccion_nombrepro, SUM(dt.detalletransaccion_cantidad) PRODUCTOS_INGRESADOS
	FROM detalle_transaccion dt INNER JOIN producto p ON dt.producto_id = p.producto_id
	INNER JOIN transacciones t ON dt.transaccion_id= t.transaccion_id
WHERE t.transaccion_estatus = 'INGRESADO' AND t.transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN
AND p.prod_serv_tipo = 'PRODUCTO'	
GROUP BY dt.detalletransaccion_nombrepro, dt.producto_id
ORDER BY PRODUCTOS_INGRESADOS ASC
LIMIT 10 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TOP10_PRODUCTOS_MENOS_VENDIDOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TOP10_PRODUCTOS_MENOS_VENDIDOS`(IN FECHA_INICIO DATE, IN FECHA_FIN DATE)
SELECT dt.detalletransaccion_nombrepro, SUM(dt.detalletransaccion_cantidad) PRODUCTOS_VENDIDOS
	FROM detalle_transaccion dt INNER JOIN producto p ON dt.producto_id = p.producto_id
	INNER JOIN transacciones t ON dt.transaccion_id= t.transaccion_id
WHERE t.transaccion_estatus IN ('ORDEN FACTURADA', 'FACTURADO') 
AND t.transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN
AND p.prod_serv_tipo = 'PRODUCTO'	
GROUP BY dt.detalletransaccion_nombrepro, dt.producto_id
ORDER BY PRODUCTOS_VENDIDOS ASC
LIMIT 10 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TOP10_SERVICIOS_MENOS_SOLIC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TOP10_SERVICIOS_MENOS_SOLIC`(IN FECHA_INICIO DATE, IN FECHA_FIN DATE)
SELECT p.producto_nombre, SUM(dt.detalletransaccion_cantidad) AS CANTIDAD_SERVICIOS
	FROM detalle_transaccion dt INNER JOIN producto p ON dt.producto_id = p.producto_id
	INNER JOIN transacciones t ON t.transaccion_id = dt.transaccion_id
WHERE t.transaccion_estatus IN ('ORDEN FACTURADA', 'FACTURADO') 
AND t.transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN
AND p.prod_serv_tipo = 'SERVICIO'
GROUP BY dt.producto_id
ORDER BY CANTIDAD_SERVICIOS ASC
LIMIT 10 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TOP_10_INGRESOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TOP_10_INGRESOS`(IN FECHA_INICIO DATE, IN FECHA_FIN DATE)
SELECT dt.detalletransaccion_nombrepro, SUM(dt.detalletransaccion_cantidad) AS CANTIDAD_PRODUCTOS
	FROM detalle_transaccion dt INNER JOIN producto p ON dt.producto_id = p.producto_id
	INNER JOIN transacciones t ON t.transaccion_id= dt.transaccion_id
WHERE t.transaccion_estatus = 'INGRESADO' AND t.transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN
AND p.prod_serv_tipo = 'PRODUCTO'
GROUP BY dt.detalletransaccion_nombrepro, dt.producto_id
ORDER BY CANTIDAD_PRODUCTOS DESC
LIMIT 10 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TOP_10_SERVICIOS_SOLICITADOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TOP_10_SERVICIOS_SOLICITADOS`(IN FECHA_INICIO DATE, IN FECHA_FIN DATE)
SELECT p.producto_nombre, SUM(dt.detalletransaccion_cantidad) AS CANTIDAD_SERVICIOS
	FROM detalle_transaccion dt INNER JOIN producto p ON dt.producto_id = p.producto_id
	INNER JOIN transacciones t ON t.transaccion_id = dt.transaccion_id
WHERE t.transaccion_estatus IN ('ORDEN FACTURADA', 'FACTURADO') 
AND t.transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN
AND p.prod_serv_tipo = 'SERVICIO'
GROUP BY dt.producto_id
ORDER BY CANTIDAD_SERVICIOS DESC
LIMIT 10 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TOP_10_VENTAS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TOP_10_VENTAS`(IN FECHA_INICIO DATE, IN FECHA_FIN DATE)
SELECT dt.detalletransaccion_nombrepro, SUM(dt.detalletransaccion_cantidad) AS CANTIDAD_PRODUCTOS
	FROM detalle_transaccion dt INNER JOIN producto p ON dt.producto_id = p.producto_id
	INNER JOIN transacciones t ON t.transaccion_id = dt.transaccion_id
WHERE t.transaccion_estatus IN ('ORDEN FACTURADA', 'FACTURADO') 
AND t.transaccion_fecha BETWEEN FECHA_INICIO AND FECHA_FIN
AND p.prod_serv_tipo = 'PRODUCTO'
GROUP BY dt.detalletransaccion_nombrepro, dt.producto_id
ORDER BY CANTIDAD_PRODUCTOS DESC
LIMIT 10 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ULTIMO_NUM_FACTURA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ULTIMO_NUM_FACTURA`()
BEGIN
	DECLARE ULTIMO_ID_TRANSAC INT;
	SET @ULTIMO_ID_TRANSAC:=(SELECT MAX(transaccion_id) FROM transacciones WHERE transaccion_tipo = 'VENTA');
	
	IF @ULTIMO_ID_TRANSAC IS NULL THEN
		SELECT conf_numero_inicial as num_factura, 
		strSplit(conf_numero_inicial, '-',3) + 0 as ultimo_numero
			FROM configuracion; 
	ELSE
		SELECT transaccion_numcomprobante as num_factura, 
		strSplit(transaccion_numcomprobante, '-',3) + 1 as ultimo_numero
		FROM transacciones 
		WHERE transaccion_id = @ULTIMO_ID_TRANSAC;
	END IF;

	
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_VERIFICAR_INFOUSUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VERIFICAR_INFOUSUARIO`(IN USERNAME VARCHAR(100), IN EMAIL VARCHAR(70))
BEGIN
	DECLARE CANTIDAD INT;
	SET @CANTIDAD:=(SELECT COUNT(*) FROM usuario u INNER JOIN persona p ON p.persona_id = u.persona_id WHERE u.usuario_nombre = USERNAME AND p.persona_correo = EMAIL);
	
	IF @CANTIDAD > 0 THEN
	SELECT u.usuario_id FROM usuario u INNER JOIN persona p ON p.persona_id = u.persona_id WHERE u.usuario_nombre = USERNAME AND p.persona_correo = EMAIL;
ELSE
	SELECT 0;
END IF;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_VERIFICAR_USUARIO` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VERIFICAR_USUARIO`(IN USUARIO VARCHAR(20))
SELECT u.usuario_id, u.usuario_nombre, u.usuario_password, u.usuario_intento,
u.usuario_estatus, u.usuario_imagen, u.persona_id, r.rol_nombre, u.usuario_passwordtemp
	FROM usuario u INNER JOIN rol r ON u.rol_id = r.rol_id
WHERE u.usuario_nombre = USUARIO ;;
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

-- Dump completed on 2023-11-05 23:13:26
