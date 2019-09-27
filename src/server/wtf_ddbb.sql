CREATE DATABASE  IF NOT EXISTS `tempus_fugit` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tempus_fugit`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: tempus_fugit
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
-- Table structure for table `tchat`
--

DROP TABLE IF EXISTS `tchat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tchat` (
  `idChat` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` int(11) DEFAULT NULL,
  `direccion` tinyint(4) DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `mensaje` varchar(200) DEFAULT NULL,
  `adjuntos` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idChat`),
  KEY `usuario_idx` (`usuario`),
  CONSTRAINT `usuarioChat` FOREIGN KEY (`usuario`) REFERENCES `tusuarios` (`idusuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tchat`
--

LOCK TABLES `tchat` WRITE;
/*!40000 ALTER TABLE `tchat` DISABLE KEYS */;
/*!40000 ALTER TABLE `tchat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tcliente`
--

DROP TABLE IF EXISTS `tcliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tcliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `cp` varchar(10) DEFAULT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `pais` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tcliente`
--

LOCK TABLES `tcliente` WRITE;
/*!40000 ALTER TABLE `tcliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tcliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tequipos`
--

DROP TABLE IF EXISTS `tequipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tequipos` (
  `idequipos` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto` int(11) DEFAULT NULL,
  `usuario` int(11) DEFAULT NULL,
  `inicio` date DEFAULT NULL,
  `fin` date DEFAULT NULL,
  `cargo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idequipos`),
  KEY `usuario_idx` (`usuario`),
  KEY `proyecto_idx` (`proyecto`),
  CONSTRAINT `proyecto` FOREIGN KEY (`proyecto`) REFERENCES `tproyectos` (`idproyectos`),
  CONSTRAINT `usuarioEquipo` FOREIGN KEY (`usuario`) REFERENCES `tusuarios` (`idusuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tequipos`
--

LOCK TABLES `tequipos` WRITE;
/*!40000 ALTER TABLE `tequipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tequipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tfichajes`
--

DROP TABLE IF EXISTS `tfichajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tfichajes` (
  `idfichajes` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` int(11) DEFAULT NULL,
  `tipo` tinyint(4) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  PRIMARY KEY (`idfichajes`),
  KEY `usuario_idx` (`usuario`),
  CONSTRAINT `usuario` FOREIGN KEY (`usuario`) REFERENCES `tusuarios` (`idusuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tfichajes`
--

LOCK TABLES `tfichajes` WRITE;
/*!40000 ALTER TABLE `tfichajes` DISABLE KEYS */;
INSERT INTO `tfichajes` VALUES (1,2,0,'2010-09-24','09:00:00'),(2,2,1,'2010-09-24','11:00:00');
/*!40000 ALTER TABLE `tfichajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tpermisos`
--

DROP TABLE IF EXISTS `tpermisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tpermisos` (
  `idpermisos` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` int(11) DEFAULT NULL,
  `inicio` date DEFAULT NULL,
  `fin` date DEFAULT NULL,
  `tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`idpermisos`),
  KEY `usuaio_idx` (`usuario`),
  CONSTRAINT `usuaioPermisos` FOREIGN KEY (`usuario`) REFERENCES `tusuarios` (`idusuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tpermisos`
--

LOCK TABLES `tpermisos` WRITE;
/*!40000 ALTER TABLE `tpermisos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tpermisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tprivilegios`
--

DROP TABLE IF EXISTS `tprivilegios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tprivilegios` (
  `idPrivilegios` int(11) NOT NULL AUTO_INCREMENT,
  `nivel` int(11) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `adminUsuarios` tinyint(4) DEFAULT NULL,
  `adminProyectos` tinyint(4) DEFAULT NULL,
  `accesoFichajes` tinyint(4) DEFAULT NULL,
  `visualizarResultados` tinyint(4) DEFAULT NULL,
  `infoPerosnal` tinyint(4) DEFAULT NULL,
  `verChat` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idPrivilegios`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tprivilegios`
--

LOCK TABLES `tprivilegios` WRITE;
/*!40000 ALTER TABLE `tprivilegios` DISABLE KEYS */;
INSERT INTO `tprivilegios` VALUES (1,1,'superAdmin',0,0,0,0,0,0),(2,2,'user',1,1,1,1,1,1);
/*!40000 ALTER TABLE `tprivilegios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tproyectos`
--

DROP TABLE IF EXISTS `tproyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tproyectos` (
  `idproyectos` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `proyectoscol` varchar(45) DEFAULT NULL,
  `inicio` date DEFAULT NULL,
  `fin` date DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `cliente` int(11) DEFAULT NULL,
  `foto` varchar(45) DEFAULT NULL,
  `activo` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idproyectos`),
  KEY `cliente_idx` (`cliente`),
  CONSTRAINT `cliente` FOREIGN KEY (`cliente`) REFERENCES `tcliente` (`idcliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tproyectos`
--

LOCK TABLES `tproyectos` WRITE;
/*!40000 ALTER TABLE `tproyectos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tusuarios`
--

DROP TABLE IF EXISTS `tusuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tusuarios` (
  `idusuarios` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `dni` varchar(9) DEFAULT NULL,
  `telefono` varchar(16) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `contrasena` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `cp` varchar(10) DEFAULT NULL,
  `pais` varchar(45) DEFAULT NULL,
  `nivel` int(11) DEFAULT NULL,
  `foto` varchar(45) DEFAULT NULL,
  `activo` tinyint(4) DEFAULT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `privilegio` int(11) DEFAULT NULL,
  PRIMARY KEY (`idusuarios`),
  KEY `privilegios_idx` (`privilegio`),
  CONSTRAINT `privilegios` FOREIGN KEY (`privilegio`) REFERENCES `tprivilegios` (`idPrivilegios`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tusuarios`
--

LOCK TABLES `tusuarios` WRITE;
/*!40000 ALTER TABLE `tusuarios` DISABLE KEYS */;
INSERT INTO `tusuarios` VALUES (1,'Robert ','Chirila','11425369M','123456789','robert@gmail.com','12345678','Calle de mi casa','Madrid','28031','Espana',1,'foto',NULL,'1993-04-16',1),(2,'Carlos','G','12345678R','111111111','carlos@gmail.com','11122233','Una Calle ','Madrid','21078','Espana',2,'foto',NULL,'1980-10-28',2),(3,'Juan','Piedra','12345788H','122222222','piedra@gmail.com','22233344','Calle Puente Pino ','Mostoles','28000','Espana',2,'fot',NULL,'2000-05-30',2);
/*!40000 ALTER TABLE `tusuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'tempus_fugit'
--

--
-- Dumping routines for database 'tempus_fugit'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-27  7:49:03
