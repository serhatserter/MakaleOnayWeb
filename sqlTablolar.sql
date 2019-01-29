-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tasarimdersi
-- ------------------------------------------------------
-- Server version	5.7.21-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `editorkullanici`
--

DROP TABLE IF EXISTS `editorkullanici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `editorkullanici` (
  `ID` int(11) NOT NULL,
  `KullaniciAdi` varchar(20) DEFAULT NULL,
  `Sifre` varchar(45) DEFAULT NULL,
  `Isim` varchar(45) DEFAULT NULL,
  `Soyisim` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editorkullanici`
--

LOCK TABLES `editorkullanici` WRITE;
/*!40000 ALTER TABLE `editorkullanici` DISABLE KEYS */;
INSERT INTO `editorkullanici` VALUES (2000,'editor','editor','Editör','Editör','editor@mail.com');
/*!40000 ALTER TABLE `editorkullanici` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hakemkullanici`
--

DROP TABLE IF EXISTS `hakemkullanici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hakemkullanici` (
  `ID` int(11) NOT NULL,
  `KullaniciAdi` varchar(20) DEFAULT NULL,
  `Sifre` varchar(45) DEFAULT NULL,
  `Isim` varchar(45) DEFAULT NULL,
  `Soyisim` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hakemkullanici`
--

LOCK TABLES `hakemkullanici` WRITE;
/*!40000 ALTER TABLE `hakemkullanici` DISABLE KEYS */;
INSERT INTO `hakemkullanici` VALUES (3000,'hakem','hakem','Hakem','Hakem','hakem@mail.com');
/*!40000 ALTER TABLE `hakemkullanici` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yazarkullanici`
--

DROP TABLE IF EXISTS `yazarkullanici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yazarkullanici` (
  `ID` int(11) NOT NULL,
  `KullaniciAdi` varchar(20) DEFAULT NULL,
  `Sifre` varchar(45) DEFAULT NULL,
  `Isim` varchar(45) DEFAULT NULL,
  `Soyisim` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yazarkullanici`
--

LOCK TABLES `yazarkullanici` WRITE;
/*!40000 ALTER TABLE `yazarkullanici` DISABLE KEYS */;
/*!40000 ALTER TABLE `yazarkullanici` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yazarmakale`
--

DROP TABLE IF EXISTS `yazarmakale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yazarmakale` (
  `ID` int(11) NOT NULL,
  `MakaleID` int(11) NOT NULL,
  `alan` varchar(20) DEFAULT NULL,
  `baslik` varchar(50) DEFAULT NULL,
  `aciklama` varchar(200) DEFAULT NULL,
  `makalepdf` varchar(250) NOT NULL,
  `onay` varchar(45) DEFAULT NULL,
  `hakem` varchar(45) DEFAULT NULL,
  UNIQUE KEY `makalepdf_UNIQUE` (`makalepdf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yazarmakale`
--

LOCK TABLES `yazarmakale` WRITE;
/*!40000 ALTER TABLE `yazarmakale` DISABLE KEYS */;
/*!40000 ALTER TABLE `yazarmakale` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-29 18:00:15
