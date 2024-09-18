/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.5.2-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Kartverket
-- ------------------------------------------------------
-- Server version	11.5.2-MariaDB-ubu2404

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `Bruker`
--

DROP TABLE IF EXISTS `Bruker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bruker` (
  `BrukerID` int(11) NOT NULL AUTO_INCREMENT,
  `Brukernavn` varchar(100) NOT NULL,
  `Passord` varchar(100) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Rolle` enum('bruker','saksbehandler') DEFAULT 'bruker',
  PRIMARY KEY (`BrukerID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bruker`
--

LOCK TABLES `Bruker` WRITE;
/*!40000 ALTER TABLE `Bruker` DISABLE KEYS */;
INSERT INTO `Bruker` VALUES
(1,'john_doe','pass123','john@example.com','bruker');
/*!40000 ALTER TABLE `Bruker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Innmelding`
--

DROP TABLE IF EXISTS `Innmelding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Innmelding` (
  `InnmeldingID` int(11) NOT NULL AUTO_INCREMENT,
  `BrukerID` int(11) DEFAULT NULL,
  `Beskrivelse` text DEFAULT NULL,
  `Status` enum('innsendt','behandles','fullført') DEFAULT 'innsendt',
  `DatoInnsendt` date DEFAULT NULL,
  PRIMARY KEY (`InnmeldingID`),
  KEY `BrukerID` (`BrukerID`),
  CONSTRAINT `Innmelding_ibfk_1` FOREIGN KEY (`BrukerID`) REFERENCES `Bruker` (`BrukerID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Innmelding`
--

LOCK TABLES `Innmelding` WRITE;
/*!40000 ALTER TABLE `Innmelding` DISABLE KEYS */;
INSERT INTO `Innmelding` VALUES
(1,1,'Feil i kartvisning for skogsvei','innsendt','2024-09-18');
/*!40000 ALTER TABLE `Innmelding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Kart`
--

DROP TABLE IF EXISTS `Kart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Kart` (
  `KartID` int(11) NOT NULL AUTO_INCREMENT,
  `InnmeldingID` int(11) DEFAULT NULL,
  `GeoData` text DEFAULT NULL,
  `OppdatertDato` date DEFAULT NULL,
  PRIMARY KEY (`KartID`),
  KEY `InnmeldingID` (`InnmeldingID`),
  CONSTRAINT `Kart_ibfk_1` FOREIGN KEY (`InnmeldingID`) REFERENCES `Innmelding` (`InnmeldingID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Kart`
--

LOCK TABLES `Kart` WRITE;
/*!40000 ALTER TABLE `Kart` DISABLE KEYS */;
INSERT INTO `Kart` VALUES
(1,1,'GeoJSON-data for oppdatert skogsvei','2024-09-18');
/*!40000 ALTER TABLE `Kart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Saksbehandler`
--

DROP TABLE IF EXISTS `Saksbehandler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Saksbehandler` (
  `SaksbehandlerID` int(11) NOT NULL AUTO_INCREMENT,
  `BrukerID` int(11) DEFAULT NULL,
  `Ansvarsområde` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`SaksbehandlerID`),
  KEY `BrukerID` (`BrukerID`),
  CONSTRAINT `Saksbehandler_ibfk_1` FOREIGN KEY (`BrukerID`) REFERENCES `Bruker` (`BrukerID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Saksbehandler`
--

LOCK TABLES `Saksbehandler` WRITE;
/*!40000 ALTER TABLE `Saksbehandler` DISABLE KEYS */;
INSERT INTO `Saksbehandler` VALUES
(1,1,'Skosgvei');
/*!40000 ALTER TABLE `Saksbehandler` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2024-09-18 12:50:58
