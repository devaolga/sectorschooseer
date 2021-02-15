-- MySQL dump 10.13  Distrib 8.0.23, for osx10.15 (x86_64)
--
-- Host: localhost    Database: helmes
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `sector`
--

DROP TABLE IF EXISTS `sector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sector` (
  `id` bigint unsigned NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sector`
--

LOCK TABLES `sector` WRITE;
/*!40000 ALTER TABLE `sector` DISABLE KEYS */;
INSERT INTO `sector` VALUES (1,'Manufacturing',0);
INSERT INTO `sector` VALUES (2,'Service',0);
INSERT INTO `sector` VALUES (3,'Other',0);
INSERT INTO `sector` VALUES (5,'Printing ',1);
INSERT INTO `sector` VALUES (6,'Food and Beverage',1);
INSERT INTO `sector` VALUES (7,'Textile and Clothing',1);
INSERT INTO `sector` VALUES (8,'Wood',1);
INSERT INTO `sector` VALUES (9,'Plastic and Rubber',1);
INSERT INTO `sector` VALUES (11,'Metalworking',1);
INSERT INTO `sector` VALUES (12,'Machinery',1);
INSERT INTO `sector` VALUES (13,'Furniture',1);
INSERT INTO `sector` VALUES (18,'Electronics and Optics',1);
INSERT INTO `sector` VALUES (19,'Construction materials',1);
INSERT INTO `sector` VALUES (21,'Transport and Logistics',2);
INSERT INTO `sector` VALUES (22,'Tourism',2);
INSERT INTO `sector` VALUES (25,'Business services',2);
INSERT INTO `sector` VALUES (28,'Information Technology and Telecommunications',2);
INSERT INTO `sector` VALUES (29,'Energy technology',3);
INSERT INTO `sector` VALUES (33,'Environment',3);
INSERT INTO `sector` VALUES (35,'Engineering',2);
INSERT INTO `sector` VALUES (37,'Creative industries',3);
INSERT INTO `sector` VALUES (39,'Milk &amp; dairy products',6);
INSERT INTO `sector` VALUES (40,'Meat &amp; meat products',6);
INSERT INTO `sector` VALUES (42,'Fish &amp; fish products',6);
INSERT INTO `sector` VALUES (43,'Beverages',6);
INSERT INTO `sector` VALUES (44,'Clothing',7);
INSERT INTO `sector` VALUES (45,'Textile',7);
INSERT INTO `sector` VALUES (47,'Wooden houses',8);
INSERT INTO `sector` VALUES (51,'Wooden building materials',8);
INSERT INTO `sector` VALUES (53,'Plastics welding and processing',559);
INSERT INTO `sector` VALUES (54,'Packaging',9);
INSERT INTO `sector` VALUES (55,'Blowing',559);
INSERT INTO `sector` VALUES (57,'Moulding',559);
INSERT INTO `sector` VALUES (62,'Forgings, Fasteners ',542);
INSERT INTO `sector` VALUES (66,'MIG, TIG, Aluminum welding',542);
INSERT INTO `sector` VALUES (67,'Construction of metal structures',11);
INSERT INTO `sector` VALUES (69,'Gas, Plasma, Laser cutting',542);
INSERT INTO `sector` VALUES (75,'CNC-machining',542);
INSERT INTO `sector` VALUES (91,'Machinery equipment/tools',12);
INSERT INTO `sector` VALUES (93,'Metal structures',12);
INSERT INTO `sector` VALUES (94,'Machinery components',12);
INSERT INTO `sector` VALUES (97,'Maritime',12);
INSERT INTO `sector` VALUES (98,'Kitchen ',13);
INSERT INTO `sector` VALUES (99,'Project furniture',13);
INSERT INTO `sector` VALUES (101,'Living room ',13);
INSERT INTO `sector` VALUES (111,'Air',21);
INSERT INTO `sector` VALUES (112,'Road',21);
INSERT INTO `sector` VALUES (113,'Water',21);
INSERT INTO `sector` VALUES (114,'Rail',21);
INSERT INTO `sector` VALUES (121,'Software, Hardware',28);
INSERT INTO `sector` VALUES (122,'Telecommunications',28);
INSERT INTO `sector` VALUES (141,'Translation services',2);
INSERT INTO `sector` VALUES (145,'Labelling and packaging printing',5);
INSERT INTO `sector` VALUES (148,'Advertising',5);
INSERT INTO `sector` VALUES (150,'Book/Periodicals printing',5);
INSERT INTO `sector` VALUES (224,'Manufacture of machinery ',12);
INSERT INTO `sector` VALUES (227,'Repair and maintenance service',12);
INSERT INTO `sector` VALUES (230,'Ship repair and conversion',97);
INSERT INTO `sector` VALUES (263,'Houses and buildings',11);
INSERT INTO `sector` VALUES (267,'Metal products',11);
INSERT INTO `sector` VALUES (269,'Boat/Yacht building',97);
INSERT INTO `sector` VALUES (271,'Aluminium and steel workboats',97);
INSERT INTO `sector` VALUES (337,'Other (Wood)',8);
INSERT INTO `sector` VALUES (341,'Outdoor',13);
INSERT INTO `sector` VALUES (342,'Bakery &amp; confectionery products',6);
INSERT INTO `sector` VALUES (378,'Sweets &amp; snack food',6);
INSERT INTO `sector` VALUES (385,'Bedroom',13);
INSERT INTO `sector` VALUES (389,'Bathroom/sauna ',13);
INSERT INTO `sector` VALUES (390,'Children&apos;s room ',13);
INSERT INTO `sector` VALUES (392,'Office',13);
INSERT INTO `sector` VALUES (394,'Other (Furniture)',13);
INSERT INTO `sector` VALUES (437,'Other',6);
INSERT INTO `sector` VALUES (508,'Other',12);
INSERT INTO `sector` VALUES (542,'Metal works',11);
INSERT INTO `sector` VALUES (556,'Plastic goods',9);
INSERT INTO `sector` VALUES (559,'Plastic processing technology',9);
INSERT INTO `sector` VALUES (560,'Plastic profiles',9);
INSERT INTO `sector` VALUES (576,'Programming, Consultancy',28);
INSERT INTO `sector` VALUES (581,'Data processing, Web portals, E-marketing',28);
/*!40000 ALTER TABLE `sector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `accept_terms` smallint unsigned NOT NULL DEFAULT '0',
  `name` varchar(45) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'Olga Steoanova up','2021-02-15 14:39:51','2021-02-15 15:34:25');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_sector`
--

DROP TABLE IF EXISTS `user_sector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_sector` (
  `sector_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  KEY `sector_id` (`sector_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_sector_ibfk_1` FOREIGN KEY (`sector_id`) REFERENCES `sector` (`id`),
  CONSTRAINT `user_sector_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_sector`
--

LOCK TABLES `user_sector` WRITE;
/*!40000 ALTER TABLE `user_sector` DISABLE KEYS */;
INSERT INTO `user_sector` VALUES (94,1);
INSERT INTO `user_sector` VALUES (230,1);
/*!40000 ALTER TABLE `user_sector` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-15 15:38:21
