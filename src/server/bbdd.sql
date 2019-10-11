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
  `fecha` varchar(11) DEFAULT NULL,
  `hora` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idfichajes`),
  KEY `usuario_idx` (`usuario`),
  CONSTRAINT `usuario` FOREIGN KEY (`usuario`) REFERENCES `tusuarios` (`idusuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tfichajes`
--

LOCK TABLES `tfichajes` WRITE;
/*!40000 ALTER TABLE `tfichajes` DISABLE KEYS */;
INSERT INTO `tfichajes` VALUES (1,1,0,'2010-09-24','09:00:00'),(2,1,1,'2010-09-24','11:00:00'),(3,1,0,'2010-09-24','11:30:00'),(4,1,1,'2010-09-24','14:00:00'),(5,1,0,'2010-09-24','15:00:00'),(6,1,1,'2010-09-24','18:00:00'),(9,3,0,'2010-09-24','09:01:01'),(10,3,1,'2010-09-24','11:11:11'),(11,1,0,'2019-10-08','09:00:00'),(12,1,1,'2019-10-08','11:00:00'),(13,1,0,'2019-10-08','11:30:00'),(14,1,1,'2019-10-08','14:00:00'),(15,1,0,'2019-10-08','15:00:00'),(16,1,1,'2019-10-08','18:00:00'),(17,1,0,'2019-10-09','09:00:00'),(18,3,0,'2019-10-10','09:00:00'),(19,3,1,'2019-10-10','11:00:00'),(20,3,0,'2019-10-10','11:30:00'),(21,3,1,'2019-10-10','14:00:00'),(22,3,0,'2019-10-10','15:26:08'),(24,3,1,'2019-10-10','20:28:22'),(40,3,0,'2019-10-11','09:00:00'),(41,3,1,'2019-10-11','11:00:00'),(42,3,0,'2019-10-11','11:30:00'),(43,3,1,'2019-10-11','14:00:00'),(44,3,0,'2019-10-11','15:26:08'),(45,2,1,'2019-10-11','16:28:22'),(58,3,1,'2019-10-11','00:32:07'),(59,3,0,'2019-10-11','02:40:21'),(60,3,1,'2019-10-11','02:40:23');
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
-- Table structure for table `tposition`
--

DROP TABLE IF EXISTS `tposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tposition` (
  `idposition` int(10) unsigned NOT NULL,
  `position` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idposition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tposition`
--

LOCK TABLES `tposition` WRITE;
/*!40000 ALTER TABLE `tposition` DISABLE KEYS */;
INSERT INTO `tposition` VALUES (1,'CEO'),(2,'CFO'),(3,'CTO'),(4,'CIO'),(5,'COO'),(6,'CMO');
/*!40000 ALTER TABLE `tposition` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tprivilegios`
--

LOCK TABLES `tprivilegios` WRITE;
/*!40000 ALTER TABLE `tprivilegios` DISABLE KEYS */;
INSERT INTO `tprivilegios` VALUES (1,1,'superAdmin',0,0,0,0,0,0),(2,2,'admin',0,0,0,0,0,0),(3,3,'user',1,1,1,1,1,1);
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
  `nombreproyecto` varchar(45) DEFAULT NULL,
  `inicio` varchar(11) DEFAULT NULL,
  `fin` varchar(11) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `cliente` int(11) DEFAULT NULL,
  `foto` varchar(45) DEFAULT NULL,
  `activo` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idproyectos`),
  KEY `cliente_idx` (`cliente`),
  CONSTRAINT `cliente` FOREIGN KEY (`cliente`) REFERENCES `tcliente` (`idcliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tproyectos`
--

LOCK TABLES `tproyectos` WRITE;
/*!40000 ALTER TABLE `tproyectos` DISABLE KEYS */;
INSERT INTO `tproyectos` VALUES (1,'Kasiopea','2012-02-12','2015-05-09','Estas es una descripcion',NULL,NULL,NULL),(2,'Taurus','2015-05-10','2016-08-11','Descripcion',NULL,NULL,NULL),(3,'Corvus','2016-08-12','2017-02-12','Descriotisdfsdfsd',NULL,NULL,NULL),(4,'Cefo','2017-02-14','2018-03-01','Descript',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tproyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tuserproject`
--

DROP TABLE IF EXISTS `tuserproject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tuserproject` (
  `iduserproject` int(10) NOT NULL AUTO_INCREMENT,
  `idusuarios` int(11) DEFAULT NULL,
  `idproyectos` int(11) DEFAULT NULL,
  PRIMARY KEY (`iduserproject`),
  KEY `idproyectos_idx` (`idproyectos`),
  KEY `idsuarios` (`idusuarios`),
  CONSTRAINT `idproyectos` FOREIGN KEY (`idproyectos`) REFERENCES `tproyectos` (`idproyectos`),
  CONSTRAINT `idsuarios` FOREIGN KEY (`idusuarios`) REFERENCES `tusuarios` (`idusuarios`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuserproject`
--

LOCK TABLES `tuserproject` WRITE;
/*!40000 ALTER TABLE `tuserproject` DISABLE KEYS */;
INSERT INTO `tuserproject` VALUES (1,1,1),(2,1,2),(3,1,3),(5,3,4),(6,2,2),(7,3,3),(8,4,4),(9,5,3);
/*!40000 ALTER TABLE `tuserproject` ENABLE KEYS */;
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
  `password` varchar(128) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `cp` varchar(10) DEFAULT NULL,
  `pais` varchar(45) DEFAULT NULL,
  `nivel` int(11) DEFAULT NULL,
  `foto` varchar(45) DEFAULT NULL,
  `activo` tinyint(4) DEFAULT NULL,
  `fechaNacimiento` varchar(11) DEFAULT NULL,
  `privilegio` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`idusuarios`),
  KEY `privilegios_idx` (`privilegio`),
  CONSTRAINT `privilegios` FOREIGN KEY (`privilegio`) REFERENCES `tprivilegios` (`idPrivilegios`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tusuarios`
--

LOCK TABLES `tusuarios` WRITE;
/*!40000 ALTER TABLE `tusuarios` DISABLE KEYS */;
INSERT INTO `tusuarios` VALUES (1,'Robert ','Chirila','11425369M','632689541','robert@gmail.com','927eda538a92dd17d6775f37d3af2db8ab3dd811e71999401bc1b26c49a0a8dbb7c8471cb1fc806105138ed52e68224611fb67f150e7aa10f7c5516056a71130','Street X','Madrid','28031','Espana',1,'foto',NULL,'1993-04-16',1,1),(2,'Airi','Satou','98745215T','698254134','airi@gmail.com','927eda538a92dd17d6775f37d3af2db8ab3dd811e71999401bc1b26c49a0a8dbb7c8471cb1fc806105138ed52e68224611fb67f150e7aa10f7c5516056a71130','Street Z ','Madrid','28999','Espana',3,NULL,NULL,'1996-08-02',2,2),(3,'Gabi','Machine','12345788H','698741351','gabi@gmail.com','927eda538a92dd17d6775f37d3af2db8ab3dd811e71999401bc1b26c49a0a8dbb7c8471cb1fc806105138ed52e68224611fb67f150e7aa10f7c5516056a71130','Street Y ','Mostoles','28000','Espana',3,'fot',NULL,'2000-05-30',2,3),(4,'James ','Smith','87459821D','698574123','james@gmail.com','927eda538a92dd17d6775f37d3af2db8ab3dd811e71999401bc1b26c49a0a8dbb7c8471cb1fc806105138ed52e68224611fb67f150e7aa10f7c5516056a71130','Street M','Barcelon','28744','Espana',3,NULL,NULL,'1900-11-22',2,4),(5,'Emily','Brown','98752265E','632596874','emily@gmail.com','927eda538a92dd17d6775f37d3af2db8ab3dd811e71999401bc1b26c49a0a8dbb7c8471cb1fc806105138ed52e68224611fb67f150e7aa10f7c5516056a71130','Street R','Jaen','28994','Espana',3,NULL,NULL,'1985-12-30',2,5),(53,'name','kkwerwew','fsdfds','dggfdgd','jhv@fsfgs','927eda538a92dd17d6775f37d3af2db8ab3dd811e71999401bc1b26c49a0a8dbb7c8471cb1fc806105138ed52e68224611fb67f150e7aa10f7c5516056a71130','dirsdfsfsdfsdffsdfsdfs','sdfsdfsa','12365','fgfdgdfg',3,NULL,NULL,'454545',NULL,1);
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

-- Dump completed on 2019-10-11  9:23:31
