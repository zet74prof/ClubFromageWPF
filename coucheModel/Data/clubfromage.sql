CREATE DATABASE  IF NOT EXISTS `clubfromage` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `clubfromage`;
-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: clubfromage
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `avis`
--

DROP TABLE IF EXISTS `avis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avis` (
  `fromageId` int NOT NULL,
  `membreId` int NOT NULL,
  `avis` varchar(2000) DEFAULT NULL,
  `stars` tinyint DEFAULT NULL,
  PRIMARY KEY (`membreId`,`fromageId`),
  KEY `fromageId` (`fromageId`),
  CONSTRAINT `avis_ibfk_1` FOREIGN KEY (`fromageId`) REFERENCES `fromage` (`id`),
  CONSTRAINT `avis_ibfk_2` FOREIGN KEY (`membreId`) REFERENCES `membre` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avis`
--

LOCK TABLES `avis` WRITE;
/*!40000 ALTER TABLE `avis` DISABLE KEYS */;
/*!40000 ALTER TABLE `avis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fromage`
--

DROP TABLE IF EXISTS `fromage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fromage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `pays_origine_id` int DEFAULT NULL,
  `durAffinage` int DEFAULT NULL,
  `histoire` longtext,
  `recette` longtext,
  `creation` date DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pays_origine_id` (`pays_origine_id`),
  CONSTRAINT `fromage_ibfk_1` FOREIGN KEY (`pays_origine_id`) REFERENCES `pays` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fromage`
--

LOCK TABLES `fromage` WRITE;
/*!40000 ALTER TABLE `fromage` DISABLE KEYS */;
INSERT INTO `fromage` VALUES (1,'Abondance',75,NULL,NULL,NULL,'1900-01-01',''),(2,'Angors',75,NULL,NULL,NULL,'1900-01-01',''),(3,'Anneau du Vic-Bilh',75,NULL,NULL,NULL,'1900-01-01',''),(4,'Appenzeller',75,NULL,NULL,NULL,'1900-01-01',''),(5,'Beaufort AOP',75,NULL,NULL,NULL,'1900-01-01',''),(6,'Bergues Torchon',75,NULL,NULL,NULL,'1900-01-01',''),(7,'Besace Fermière',75,NULL,NULL,NULL,'1900-01-01',''),(8,'Bethmale',75,NULL,NULL,NULL,'1900-01-01',''),(9,'Bichonnet',75,NULL,NULL,NULL,'1900-01-01',''),(10,'Bleu d\'Auvergne AOP',75,NULL,NULL,NULL,'1900-01-01',''),(11,'Bleu de Bonneval',75,NULL,NULL,NULL,'1900-01-01',''),(12,'Bleu de brebis',75,NULL,NULL,NULL,'1900-01-01',''),(13,'Bleu de chèvre',75,NULL,NULL,NULL,'1900-01-01',''),(14,'Bleu de Gex',75,NULL,NULL,NULL,'1900-01-01',''),(15,'Bleu de la Chataigneraie',75,NULL,NULL,NULL,'1900-01-01',''),(16,'Bleu de laqueuille',75,NULL,NULL,NULL,'1900-01-01',''),(17,'Bleu des Causses AOP',75,NULL,NULL,NULL,'1900-01-01',''),(18,'Bleu du Val d\'Aillon',75,NULL,NULL,NULL,'1900-01-01',''),(19,'Bleu du Vercors-Sassenage',75,NULL,NULL,NULL,'1900-01-01',''),(20,'Boulette d\'avesnes',75,NULL,NULL,NULL,'1900-01-01',''),(21,'Brézain (Raclette fumée)',75,NULL,NULL,NULL,'1900-01-01',''),(22,'Brie de Meaux AOP',75,NULL,NULL,NULL,'1900-01-01',''),(23,'Brie de Melun AOP',75,NULL,NULL,NULL,'1900-01-01',''),(24,'Brie de Nangis',75,NULL,NULL,NULL,'1900-01-01',''),(25,'Brillat-Savarin AOP',75,NULL,NULL,NULL,'1900-01-01','');
/*!40000 ALTER TABLE `fromage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membre`
--

DROP TABLE IF EXISTS `membre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membre` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(180) DEFAULT NULL,
  `email` varchar(320) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLogin` datetime DEFAULT NULL,
  `pseudo` varchar(30) DEFAULT NULL,
  `entryDate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membre`
--

LOCK TABLES `membre` WRITE;
/*!40000 ALTER TABLE `membre` DISABLE KEYS */;
INSERT INTO `membre` VALUES (1,'Josiane Mottier','jo74@yahoo.fr',1,'password','2021-11-04 17:25:45','jo74','2020-08-26'),(2,'Sylvain Branzin','siss74@gmail.com',1,'password','2021-11-04 17:25:45','siss74','2020-08-26');
/*!40000 ALTER TABLE `membre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pays`
--

DROP TABLE IF EXISTS `pays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pays` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pays`
--

LOCK TABLES `pays` WRITE;
/*!40000 ALTER TABLE `pays` DISABLE KEYS */;
INSERT INTO `pays` VALUES (1,'Afghanistan'),(2,'Albania'),(3,'Antarctica'),(4,'Algeria'),(5,'American Samoa'),(6,'Andorra'),(7,'Angola'),(8,'Antigua and Barbuda'),(9,'Azerbaijan'),(10,'Argentina'),(11,'Australia'),(12,'Austria'),(13,'Bahamas'),(14,'Bahrain'),(15,'Bangladesh'),(16,'Armenia'),(17,'Barbados'),(18,'Belgium'),(19,'Bermuda'),(20,'Bhutan'),(21,'Bolivia'),(22,'Bosnia and Herzegovina'),(23,'Botswana'),(24,'Bouvet Island'),(25,'Brazil'),(26,'Belize'),(27,'British Indian Ocean Territory'),(28,'Solomon Islands'),(29,'British Virgin Islands'),(30,'Brunei Darussalam'),(31,'Bulgaria'),(32,'Myanmar'),(33,'Burundi'),(34,'Belarus'),(35,'Cambodia'),(36,'Cameroon'),(37,'Canada'),(38,'Cape Verde'),(39,'Cayman Islands'),(40,'Central African'),(41,'Sri Lanka'),(42,'Chad'),(43,'Chile'),(44,'China'),(45,'Taiwan'),(46,'Christmas Island'),(47,'Cocos (Keeling) Islands'),(48,'Colombia'),(49,'Comoros'),(50,'Mayotte'),(51,'Republic of the Congo'),(52,'The Democratic Republic Of The Congo'),(53,'Cook Islands'),(54,'Costa Rica'),(55,'Croatia'),(56,'Cuba'),(57,'Cyprus'),(58,'Czech Republic'),(59,'Benin'),(60,'Denmark'),(61,'Dominica'),(62,'Dominican Republic'),(63,'Ecuador'),(64,'El Salvador'),(65,'Equatorial Guinea'),(66,'Ethiopia'),(67,'Eritrea'),(68,'Estonia'),(69,'Faroe Islands'),(70,'Falkland Islands'),(71,'South Georgia and the South Sandwich Islands'),(72,'Fiji'),(73,'Finland'),(74,'Åland Islands'),(75,'France'),(76,'French Guiana'),(77,'French Polynesia'),(78,'French Southern Territories'),(79,'Djibouti'),(80,'Gabon'),(81,'Georgia'),(82,'Gambia'),(83,'Occupied Palestinian Territory'),(84,'Germany'),(85,'Ghana'),(86,'Gibraltar'),(87,'Kiribati'),(88,'Greece'),(89,'Greenland'),(90,'Grenada'),(91,'Guadeloupe'),(92,'Guam'),(93,'Guatemala'),(94,'Guinea'),(95,'Guyana'),(96,'Haiti'),(97,'Heard Island and McDonald Islands'),(98,'Vatican City State'),(99,'Honduras'),(100,'Hong Kong'),(101,'Hungary'),(102,'Iceland'),(103,'India'),(104,'Indonesia'),(105,'Islamic Republic of Iran'),(106,'Iraq'),(107,'Ireland'),(108,'Israel'),(109,'Italy'),(110,'Côte d\'Ivoire'),(111,'Jamaica'),(112,'Japan'),(113,'Kazakhstan'),(114,'Jordan'),(115,'Kenya'),(116,'Democratic People\'s Republic of Korea'),(117,'Republic of Korea'),(118,'Kuwait'),(119,'Kyrgyzstan'),(120,'Lao People\'s Democratic Republic'),(121,'Lebanon'),(122,'Lesotho'),(123,'Latvia'),(124,'Liberia'),(125,'Libyan Arab Jamahiriya'),(126,'Liechtenstein'),(127,'Lithuania'),(128,'Luxembourg'),(129,'Macao'),(130,'Madagascar'),(131,'Malawi'),(132,'Malaysia'),(133,'Maldives'),(134,'Mali'),(135,'Malta'),(136,'Martinique'),(137,'Mauritania'),(138,'Mauritius'),(139,'Mexico'),(140,'Monaco'),(141,'Mongolia'),(142,'Republic of Moldova'),(143,'Montserrat'),(144,'Morocco'),(145,'Mozambique'),(146,'Oman'),(147,'Namibia'),(148,'Nauru'),(149,'Nepal'),(150,'Netherlands'),(151,'Netherlands Antilles'),(152,'Aruba'),(153,'New Caledonia'),(154,'Vanuatu'),(155,'New Zealand'),(156,'Nicaragua'),(157,'Niger'),(158,'Nigeria'),(159,'Niue'),(160,'Norfolk Island'),(161,'Norway'),(162,'Northern Mariana Islands'),(163,'United States Minor Outlying Islands'),(164,'Federated States of Micronesia'),(165,'Marshall Islands'),(166,'Palau'),(167,'Pakistan'),(168,'Panama'),(169,'Papua New Guinea'),(170,'Paraguay'),(171,'Peru'),(172,'Philippines'),(173,'Pitcairn'),(174,'Poland'),(175,'Portugal'),(176,'Guinea-Bissau'),(177,'Timor-Leste'),(178,'Puerto Rico'),(179,'Qatar'),(180,'Réunion'),(181,'Romania'),(182,'Russian Federation'),(183,'Rwanda'),(184,'Saint Helena'),(185,'Saint Kitts and Nevis'),(186,'Anguilla'),(187,'Saint Lucia'),(188,'Saint-Pierre and Miquelon'),(189,'Saint Vincent and the Grenadines'),(190,'San Marino'),(191,'Sao Tome and Principe'),(192,'Saudi Arabia'),(193,'Senegal'),(194,'Seychelles'),(195,'Sierra Leone'),(196,'Singapore'),(197,'Slovakia'),(198,'Vietnam'),(199,'Slovenia'),(200,'Somalia'),(201,'South Africa'),(202,'Zimbabwe'),(203,'Spain'),(204,'Western Sahara'),(205,'Sudan'),(206,'Suriname'),(207,'Svalbard and Jan Mayen'),(208,'Swaziland'),(209,'Sweden'),(210,'Switzerland'),(211,'Syrian Arab Republic'),(212,'Tajikistan'),(213,'Thailand'),(214,'Togo'),(215,'Tokelau'),(216,'Tonga'),(217,'Trinidad and Tobago'),(218,'United Arab Emirates'),(219,'Tunisia'),(220,'Turkey'),(221,'Turkmenistan'),(222,'Turks and Caicos Islands'),(223,'Tuvalu'),(224,'Uganda'),(225,'Ukraine'),(226,'The Former Yugoslav Republic of Macedonia'),(227,'Egypt'),(228,'United Kingdom'),(229,'Isle of Man'),(230,'United Republic Of Tanzania'),(231,'United States'),(232,'U.S. Virgin Islands'),(233,'Burkina Faso'),(234,'Uruguay'),(235,'Uzbekistan'),(236,'Venezuela'),(237,'Wallis and Futuna'),(238,'Samoa'),(239,'Yemen'),(240,'Serbia and Montenegro'),(241,'Zambia');
/*!40000 ALTER TABLE `pays` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-02 16:56:03
