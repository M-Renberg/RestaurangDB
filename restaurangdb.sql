-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: restaurangdb
-- ------------------------------------------------------
-- Server version	8.4.7

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
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `InventoryID` int NOT NULL AUTO_INCREMENT,
  `PurchasingID` int DEFAULT NULL,
  `ProductName` varchar(100) NOT NULL,
  `Quantity` int NOT NULL,
  `LastUpdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`InventoryID`),
  UNIQUE KEY `ProductName` (`ProductName`),
  KEY `PurchasingID` (`PurchasingID`),
  CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`PurchasingID`) REFERENCES `purchasing` (`PurchasingID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,1,'Oxfilé (Kilo)',7,'2025-11-14 09:40:04'),(2,2,'Potatis (Säck)',15,'2025-11-14 09:10:06'),(3,3,'Olivolja (5L)',4,'2025-11-14 09:10:06'),(4,4,'Färsk Basilika (Kruka)',10,'2025-11-14 09:10:06'),(5,5,'Vetemjöl (10kg)',10,'2025-11-14 09:10:06'),(6,6,'Ägg (30-pack)',15,'2025-11-14 09:10:06'),(7,7,'Laxfilé (Kilo)',5,'2025-11-14 09:40:04'),(8,8,'Lök (Kilo)',25,'2025-11-14 09:10:06'),(9,9,'Morötter (Kilo)',20,'2025-11-14 09:10:06'),(10,10,'Risotto Ris (5kg)',5,'2025-11-14 09:10:06'),(11,11,'Mozzarella Ost (Block)',10,'2025-11-14 09:10:06'),(12,12,'Vitlök (Nät)',15,'2025-11-14 09:10:06'),(13,13,'Grädde (1L)',30,'2025-11-14 09:10:06'),(14,14,'Kaffe (Brygg, 1kg)',6,'2025-11-14 09:10:06'),(15,15,'Socker (Kilo)',10,'2025-11-14 09:10:06'),(16,16,'Fläskfilé (Kilo)',10,'2025-11-14 09:10:06'),(17,17,'Färska Champinjoner',8,'2025-11-14 09:10:06'),(18,18,'Vinäger (Balsamico)',3,'2025-11-14 09:10:06'),(19,19,'Kycklingfilé (Kilo)',39,'2025-11-14 09:40:04'),(20,20,'Pasta Linguine (5kg)',6,'2025-11-14 09:40:04'),(21,21,'Tomater (Kilo)',20,'2025-11-14 09:10:06'),(22,22,'Fetaost (Block)',10,'2025-11-14 09:10:06'),(23,23,'Salladsblandning (Stor)',15,'2025-11-14 09:10:06'),(24,24,'Färskt Bröd (Stor)',15,'2025-11-14 09:10:06'),(25,25,'Citroner (Nät)',10,'2025-11-14 09:10:06'),(26,26,'Ölkorv (Förrätt)',5,'2025-11-14 09:10:06'),(27,27,'Rödvin (Husets, Kartong)',3,'2025-11-14 09:10:06'),(28,28,'Spenat (Fryst, Kilo)',10,'2025-11-14 09:10:06'),(29,29,'Havssalt (Fin)',7,'2025-11-14 09:10:06'),(30,30,'Rapsolja (5L)',4,'2025-11-14 09:10:06'),(31,31,'Coca-Cola (33cl, Burkar)',191,'2025-11-14 09:40:04'),(32,32,'Fanta (33cl, Burkar)',150,'2025-11-14 09:10:06'),(33,33,'Mineralvatten (Stor Flaska)',25,'2025-11-14 09:10:06'),(34,34,'Lättöl (33cl, Burkar)',300,'2025-11-14 09:10:06'),(35,35,'Lokalt IPA (33cl, Flaska)',37,'2025-11-14 09:40:04'),(36,36,'Husets Rött Vin (Flaska)',17,'2025-11-14 09:40:04'),(37,37,'Husets Vitt Vin (Flaska)',20,'2025-11-14 09:10:06'),(38,38,'Mousserande Vin (Flaska)',8,'2025-11-14 09:10:06'),(39,39,'Apelsinjuice (1L)',15,'2025-11-14 09:10:06'),(40,40,'Ekologiskt Äppelcider (Flaska)',10,'2025-11-14 09:10:06');
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuitems`
--

DROP TABLE IF EXISTS `menuitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuitems` (
  `MenuID` int NOT NULL AUTO_INCREMENT,
  `MenuItemName` varchar(100) NOT NULL,
  `MenuItemType` enum('Appetizers','Entrees','Side_Dish','Desserts','Beverages') NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`MenuID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuitems`
--

LOCK TABLES `menuitems` WRITE;
/*!40000 ALTER TABLE `menuitems` DISABLE KEYS */;
INSERT INTO `menuitems` VALUES (1,'Vitlöksbröd med örter','Appetizers',65.00),(2,'Caprese Sallad','Appetizers',89.00),(3,'Ölkorv & Ostbricka','Appetizers',125.00),(4,'Friterade Calamari','Appetizers',99.00),(5,'Grillad Lax med Dillsås','Entrees',219.00),(6,'Biff Rydberg på Oxfilé','Entrees',320.00),(7,'Kycklingpasta Linguine','Entrees',189.00),(8,'Vegetarisk Risotto med svamp','Entrees',175.00),(9,'Husets Fläskfilé med Rostad Potatis','Entrees',249.00),(10,'Klassisk Hamburgare','Entrees',159.00),(11,'Extra Pommes Frites','Side_Dish',45.00),(12,'Säsongens Gröna Sallad','Side_Dish',39.00),(13,'Grillade Grönsaker','Side_Dish',55.00),(14,'Chokladtryffel','Desserts',75.00),(15,'Crème Brûlée','Desserts',85.00),(16,'Äppelpaj med Vaniljsås','Desserts',79.00),(17,'Coca-Cola (Burk)','Beverages',35.00),(18,'Lokalt IPA (Flaska)','Beverages',89.00),(19,'Husets Rött Vin (Glas)','Beverages',95.00),(20,'Espresso','Beverages',30.00);
/*!40000 ALTER TABLE `menuitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nextofkin`
--

DROP TABLE IF EXISTS `nextofkin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nextofkin` (
  `NextOfKinID` int NOT NULL AUTO_INCREMENT,
  `PersonalID` int DEFAULT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  PRIMARY KEY (`NextOfKinID`),
  KEY `PersonalID` (`PersonalID`),
  CONSTRAINT `nextofkin_ibfk_1` FOREIGN KEY (`PersonalID`) REFERENCES `personal` (`PersonalID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nextofkin`
--

LOCK TABLES `nextofkin` WRITE;
/*!40000 ALTER TABLE `nextofkin` DISABLE KEYS */;
INSERT INTO `nextofkin` VALUES (1,1,'Eva','Karlsson','07000102001'),(2,2,'Edwin','Bergström','07000102002'),(3,3,'Anna','Andersson','07000202001'),(4,4,'Mats','Carlsson','07000302001'),(5,5,'Bertil','Nilsson','07000402001'),(6,6,'Sara','Malm','07000502001'),(7,7,'Urban','Henriksson','07000602001'),(8,8,'Fredrick','Nilsson','07000702001'),(9,9,'Amanda','Andersson','07000802001'),(10,10,'Stefan','Almen','07000902001');
/*!40000 ALTER TABLE `nextofkin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitems` (
  `OrderItemID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int DEFAULT NULL,
  `MenuID` int DEFAULT NULL,
  `Quantity` int DEFAULT '1',
  PRIMARY KEY (`OrderItemID`),
  KEY `OrderID` (`OrderID`),
  KEY `MenuID` (`MenuID`),
  CONSTRAINT `orderitems_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`),
  CONSTRAINT `orderitems_ibfk_2` FOREIGN KEY (`MenuID`) REFERENCES `menuitems` (`MenuID`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitems`
--

LOCK TABLES `orderitems` WRITE;
/*!40000 ALTER TABLE `orderitems` DISABLE KEYS */;
INSERT INTO `orderitems` VALUES (1,1,6,2),(2,1,19,2),(3,2,7,3),(4,2,9,1),(5,2,17,4),(6,3,10,2),(7,3,11,2),(8,3,18,2),(9,4,8,4),(10,4,20,4),(11,5,5,1),(12,5,14,1),(13,5,17,1),(14,6,3,2),(15,6,5,4),(16,6,6,4),(17,6,12,8),(18,6,19,8),(19,7,4,3),(20,7,7,3),(21,7,10,3),(22,7,15,6),(23,7,18,6),(24,8,2,4),(25,8,8,4),(26,8,16,4),(27,8,17,4),(28,9,6,2),(29,30,9,2),(30,9,19,4),(31,10,1,6),(32,10,5,6),(33,10,13,6),(34,10,20,6),(35,1,6,2),(36,1,19,2),(37,2,7,3),(38,2,9,1),(39,2,17,4),(40,29,10,2),(41,3,11,2),(42,3,18,2),(43,4,8,4),(44,28,20,4),(45,5,5,1),(46,5,14,1),(47,5,17,1),(48,27,3,2),(49,6,5,4),(50,6,6,4),(51,6,12,8),(52,26,19,8),(53,7,4,3),(54,7,7,3),(55,25,10,3),(56,7,15,6),(57,7,18,6),(58,8,2,4),(59,8,8,4),(60,24,16,4),(61,8,17,4),(62,9,6,2),(63,9,9,2),(64,22,19,4),(65,23,1,6),(66,10,5,6),(67,10,13,6),(68,21,20,6),(69,1,6,2),(70,1,19,2),(71,2,7,3),(72,2,9,1),(73,19,17,4),(74,3,10,2),(75,20,11,2),(76,3,18,2),(77,4,8,4),(78,18,20,4),(79,5,5,1),(80,5,14,1),(81,17,17,1),(82,6,3,2),(83,16,5,4),(84,6,6,4),(85,6,12,8),(86,6,19,8),(87,15,4,3),(88,7,7,3),(89,14,10,3),(90,7,15,6),(91,7,18,6),(92,8,2,4),(93,13,8,4),(94,8,16,4),(95,8,17,4),(96,9,6,2),(97,9,9,2),(98,9,19,4),(99,11,1,6),(100,10,5,6),(101,12,13,6),(102,10,20,6),(103,61,1,2);
/*!40000 ALTER TABLE `orderitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `TableID` int DEFAULT NULL,
  `OrderDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `PersonalID` int DEFAULT NULL,
  `TipAmount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `TableID` (`TableID`),
  KEY `PersonalID` (`PersonalID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`TableID`) REFERENCES `tables` (`TableID`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`PersonalID`) REFERENCES `personal` (`PersonalID`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'2025-10-09 12:30:00',6,15.00),(2,3,'2025-10-09 19:00:00',7,80.00),(3,9,'2025-10-09 20:15:00',8,20.00),(4,10,'2025-10-10 13:00:00',9,10.00),(5,6,'2025-10-10 19:30:00',6,105.00),(6,5,'2025-10-10 21:00:00',10,45.00),(7,2,'2025-10-16 12:45:00',8,50.00),(8,7,'2025-10-16 20:30:00',7,10.00),(9,4,'2025-10-16 21:45:00',10,35.00),(10,8,'2025-10-17 13:30:00',9,22.00),(11,1,'2025-10-17 19:15:00',6,55.00),(12,3,'2025-10-17 20:45:00',7,45.00),(13,9,'2025-10-18 12:00:00',8,95.00),(14,10,'2025-10-18 18:30:00',9,80.00),(15,6,'2025-10-18 19:45:00',6,70.00),(16,5,'2025-10-19 13:15:00',10,54.00),(17,2,'2025-10-19 19:00:00',8,26.00),(18,7,'2025-10-19 20:30:00',7,24.00),(19,4,'2025-11-23 12:45:00',10,10.00),(20,8,'2025-11-23 19:45:00',9,12.00),(21,1,'2025-11-23 21:15:00',6,40.00),(22,3,'2025-11-24 13:45:00',7,60.00),(23,9,'2025-11-24 18:45:00',8,21.00),(24,10,'2025-11-24 20:00:00',9,15.00),(25,6,'2025-11-25 12:15:00',6,10.00),(26,5,'2025-11-25 19:00:00',6,16.00),(27,2,'2025-11-25 20:30:00',8,54.00),(28,7,'2025-11-30 13:00:00',7,20.00),(29,4,'2025-11-30 19:30:00',10,15.00),(30,8,'2025-11-30 21:00:00',9,10.00),(61,1,'2025-11-21 08:41:15',6,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal` (
  `PersonalID` int NOT NULL AUTO_INCREMENT,
  `RestaurangID` int DEFAULT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  `Adress` text NOT NULL,
  `Role` enum('head chef','sous chef','head waiter','waiter','bartender','dishwasher','restaurant manager') NOT NULL,
  `EmploymentStatus` enum('Yes','No') DEFAULT NULL,
  PRIMARY KEY (`PersonalID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `RestaurangID` (`RestaurangID`),
  KEY `idx_staffname` (`FirstName`),
  CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`RestaurangID`) REFERENCES `restaurang` (`RestaurangID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (1,1,'Kalle','Karlsson','kallekrogare@fakemail.com','0701110100','gatan 5 12345 staden','restaurant manager','Yes'),(2,1,'Stina','Bergström','bergstrom@fakemail.com','070000000002','stigen 2 13245 byn','head chef','Yes'),(3,1,'Ingvar','Nilsson','inge@fakemail.com','070000000003','stigen 56 13245 byn','sous chef','Yes'),(4,1,'Mattias','Carlsson','mckock@fakemail.com','070000000007','gränden 3 13245 staden','sous chef','Yes'),(5,1,'Emil','Bergström','xxemilxx@fakemail.com','070000000004','stigen 2 13245 byn','dishwasher','Yes'),(6,1,'Evelina','Malm','evemalm@fakemail.com','070000000005','gatan 13 13245 staden','head waiter','Yes'),(7,1,'Lars','Andersson','andersson@fakemail.com','070000000006','strandstigen 17 13245 byn','waiter','Yes'),(8,1,'Lisa','Lundh','lurigalisa@fakemail.com','070000000008','gatan 14 13245 staden','waiter','Yes'),(9,1,'Vincent','Andersson','vinnevinc@fakemail.com','070000000009','gatan 22 13245 staden','bartender','Yes'),(10,1,'Maria','Kronberg','katttjejen@fakemail.com','070000000010','gatan 66 13245 staden','bartender','Yes');
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchasing`
--

DROP TABLE IF EXISTS `purchasing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchasing` (
  `PurchasingID` int NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(100) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Quantity` int NOT NULL,
  `PurchaseDate` date DEFAULT (curdate()),
  PRIMARY KEY (`PurchasingID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchasing`
--

LOCK TABLES `purchasing` WRITE;
/*!40000 ALTER TABLE `purchasing` DISABLE KEYS */;
INSERT INTO `purchasing` VALUES (1,'Oxfilé (Kilo)',450.00,15,'2025-10-01'),(2,'Potatis (Säck)',85.00,20,'2025-10-03'),(3,'Olivolja (5L)',320.50,5,'2025-10-04'),(4,'Färsk Basilika (Kruka)',15.00,30,'2025-10-04'),(5,'Vetemjöl (10kg)',110.00,15,'2025-10-07'),(6,'Ägg (30-pack)',55.00,25,'2025-10-07'),(7,'Laxfilé (Kilo)',240.00,12,'2025-10-09'),(8,'Lök (Kilo)',12.50,40,'2025-10-10'),(9,'Morötter (Kilo)',15.90,35,'2025-10-10'),(10,'Risotto Ris (5kg)',165.00,8,'2025-10-13'),(11,'Mozzarella Ost (Block)',69.90,20,'2025-10-14'),(12,'Vitlök (Nät)',18.00,25,'2025-10-15'),(13,'Grädde (1L)',25.50,50,'2025-10-17'),(14,'Kaffe (Brygg, 1kg)',135.00,10,'2025-10-18'),(15,'Socker (Kilo)',19.90,20,'2025-10-21'),(16,'Fläskfilé (Kilo)',150.00,18,'2025-10-23'),(17,'Färska Champinjoner',45.00,15,'2025-10-24'),(18,'Vinäger (Balsamico)',79.90,5,'2025-10-28'),(19,'Kycklingfilé (Kilo)',95.50,50,'2025-11-01'),(20,'Pasta Linguine (5kg)',120.00,10,'2025-11-01'),(21,'Tomater (Kilo)',25.90,30,'2025-11-02'),(22,'Fetaost (Block)',79.90,15,'2025-11-05'),(23,'Salladsblandning (Stor)',45.00,25,'2025-11-06'),(24,'Färskt Bröd (Stor)',35.00,40,'2025-11-08'),(25,'Citroner (Nät)',29.90,20,'2025-11-08'),(26,'Ölkorv (Förrätt)',99.00,10,'2025-11-10'),(27,'Rödvin (Husets, Kartong)',399.00,5,'2025-11-12'),(28,'Spenat (Fryst, Kilo)',35.00,15,'2025-11-13'),(29,'Havssalt (Fin)',22.00,10,'2025-11-13'),(30,'Rapsolja (5L)',295.00,5,'2025-11-14'),(31,'Coca-Cola (33cl, Burkar)',189.00,240,'2025-11-15'),(32,'Fanta (33cl, Burkar)',179.00,192,'2025-11-15'),(33,'Mineralvatten (Stor Flaska)',29.90,30,'2025-11-16'),(34,'Lättöl (33cl, Burkar)',149.00,360,'2025-11-17'),(35,'Lokalt IPA (33cl, Flaska)',199.00,60,'2025-11-17'),(36,'Husets Rött Vin (Flaska)',99.50,25,'2025-11-19'),(37,'Husets Vitt Vin (Flaska)',95.50,25,'2025-11-19'),(38,'Mousserande Vin (Flaska)',159.00,10,'2025-11-20'),(39,'Apelsinjuice (1L)',22.00,20,'2025-11-21'),(40,'Ekologiskt Äppelcider (Flaska)',35.00,15,'2025-11-21');
/*!40000 ALTER TABLE `purchasing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe` (
  `RecipeID` int NOT NULL AUTO_INCREMENT,
  `MenuID` int NOT NULL,
  `InventoryID` int NOT NULL,
  `QuantityUsed` decimal(10,3) NOT NULL,
  PRIMARY KEY (`RecipeID`),
  UNIQUE KEY `unique_recipe` (`MenuID`,`InventoryID`),
  KEY `InventoryID` (`InventoryID`),
  CONSTRAINT `recipe_ibfk_1` FOREIGN KEY (`MenuID`) REFERENCES `menuitems` (`MenuID`),
  CONSTRAINT `recipe_ibfk_2` FOREIGN KEY (`InventoryID`) REFERENCES `inventory` (`InventoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (21,5,7,0.200),(22,6,1,0.150),(23,7,19,0.180),(24,7,20,0.100),(25,9,16,0.150),(26,10,8,0.050),(27,17,31,1.000),(28,18,35,1.000),(29,19,36,0.250),(30,20,14,0.015);
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurang`
--

DROP TABLE IF EXISTS `restaurang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurang` (
  `RestaurangID` int NOT NULL AUTO_INCREMENT,
  `RestaurangName` varchar(100) NOT NULL,
  `RestaurangEmail` varchar(75) NOT NULL,
  `RestaurangNumber` varchar(20) NOT NULL,
  PRIMARY KEY (`RestaurangID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurang`
--

LOCK TABLES `restaurang` WRITE;
/*!40000 ALTER TABLE `restaurang` DISABLE KEYS */;
INSERT INTO `restaurang` VALUES (1,'Kalles Krog','kalleskrog@fakemail.com','04012345');
/*!40000 ALTER TABLE `restaurang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `ScheduleID` int NOT NULL AUTO_INCREMENT,
  `PersonalID` int DEFAULT NULL,
  `ScheduleDay` date NOT NULL,
  `ScheduleTIME` time NOT NULL,
  `SceduleTimeEnd` time DEFAULT NULL,
  PRIMARY KEY (`ScheduleID`),
  KEY `PersonalID` (`PersonalID`),
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`PersonalID`) REFERENCES `personal` (`PersonalID`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,6,'2025-10-09','11:00:00','20:00:00'),(2,7,'2025-10-09','16:00:00','22:00:00'),(3,8,'2025-10-09','16:00:00','21:00:00'),(4,2,'2025-10-09','11:00:00','20:00:00'),(5,3,'2025-10-09','16:00:00','21:00:00'),(6,9,'2025-10-10','11:00:00','20:00:00'),(7,6,'2025-10-10','16:00:00','22:00:00'),(8,10,'2025-10-10','16:00:00','21:00:00'),(9,2,'2025-10-10','11:00:00','20:00:00'),(10,4,'2025-10-10','16:00:00','21:00:00'),(11,5,'2025-10-10','18:00:00','22:00:00'),(12,8,'2025-10-11','11:00:00','20:00:00'),(13,7,'2025-10-11','16:00:00','22:00:00'),(14,10,'2025-10-11','16:00:00','21:00:00'),(15,3,'2025-10-11','11:00:00','20:00:00'),(16,4,'2025-10-11','16:00:00','22:00:00'),(17,9,'2025-10-17','11:00:00','22:00:00'),(18,6,'2025-10-17','16:00:00','21:00:00'),(19,7,'2025-10-17','16:00:00','21:00:00'),(20,2,'2025-10-17','11:00:00','20:00:00'),(21,4,'2025-10-17','16:00:00','21:00:00'),(22,8,'2025-10-18','11:00:00','20:00:00'),(23,9,'2025-10-18','16:00:00','22:00:00'),(24,6,'2025-10-18','16:00:00','21:00:00'),(25,2,'2025-10-18','11:00:00','20:00:00'),(26,3,'2025-10-18','16:00:00','22:00:00'),(27,5,'2025-10-18','18:00:00','21:00:00'),(28,10,'2025-10-19','11:00:00','20:00:00'),(29,8,'2025-10-19','16:00:00','21:00:00'),(30,7,'2025-10-19','16:00:00','22:00:00'),(31,4,'2025-10-19','11:00:00','20:00:00'),(32,3,'2025-10-19','16:00:00','21:00:00'),(33,10,'2025-10-23','11:00:00','20:00:00'),(34,9,'2025-10-23','16:00:00','22:00:00'),(35,6,'2025-10-23','16:00:00','21:00:00'),(36,2,'2025-10-23','11:00:00','20:00:00'),(37,3,'2025-10-23','16:00:00','21:00:00'),(38,7,'2025-10-24','11:00:00','20:00:00'),(39,8,'2025-10-24','16:00:00','21:00:00'),(40,9,'2025-10-24','16:00:00','21:00:00'),(41,2,'2025-10-24','11:00:00','20:00:00'),(42,4,'2025-10-24','16:00:00','21:00:00'),(43,5,'2025-10-24','18:00:00','22:00:00'),(44,6,'2025-10-25','11:00:00','20:00:00'),(45,8,'2025-10-25','16:00:00','21:00:00'),(46,10,'2025-10-25','16:00:00','22:00:00'),(47,3,'2025-10-25','11:00:00','20:00:00'),(48,4,'2025-10-25','16:00:00','21:00:00'),(49,7,'2025-10-30','11:00:00','20:00:00'),(50,10,'2025-10-30','16:00:00','22:00:00'),(51,9,'2025-10-30','16:00:00','21:00:00'),(52,2,'2025-10-30','11:00:00','20:00:00'),(53,3,'2025-10-30','16:00:00','22:00:00');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables`
--

DROP TABLE IF EXISTS `tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tables` (
  `TableID` int NOT NULL AUTO_INCREMENT,
  `Seats` int NOT NULL,
  PRIMARY KEY (`TableID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables`
--

LOCK TABLES `tables` WRITE;
/*!40000 ALTER TABLE `tables` DISABLE KEYS */;
INSERT INTO `tables` VALUES (1,4),(2,6),(3,4),(4,4),(5,8),(6,4),(7,6),(8,4),(9,2),(10,2);
/*!40000 ALTER TABLE `tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_dailysales`
--

DROP TABLE IF EXISTS `view_dailysales`;
/*!50001 DROP VIEW IF EXISTS `view_dailysales`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_dailysales` AS SELECT 
 1 AS `ODate`,
 1 AS `NumOfOrders`,
 1 AS `Sales`,
 1 AS `Tip`,
 1 AS `TotalSales`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_inventorystatus`
--

DROP TABLE IF EXISTS `view_inventorystatus`;
/*!50001 DROP VIEW IF EXISTS `view_inventorystatus`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_inventorystatus` AS SELECT 
 1 AS `ProductName`,
 1 AS `Quantity`,
 1 AS `Status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_receipts`
--

DROP TABLE IF EXISTS `view_receipts`;
/*!50001 DROP VIEW IF EXISTS `view_receipts`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_receipts` AS SELECT 
 1 AS `OrderID`,
 1 AS `TableID`,
 1 AS `OrderDate`,
 1 AS `Servitor`,
 1 AS `Dishes`,
 1 AS `CostofFood`,
 1 AS `Tip`,
 1 AS `TotalPrice`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_yearlysales`
--

DROP TABLE IF EXISTS `view_yearlysales`;
/*!50001 DROP VIEW IF EXISTS `view_yearlysales`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_yearlysales` AS SELECT 
 1 AS `TotalSales`,
 1 AS `TotalPurcheses`,
 1 AS `TotalWinnings`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'restaurangdb'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_AddOrderItem` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_AddOrderItem`(
    IN p_OrderID INT,
    IN p_MenuID INT,
    IN p_Quantity INT
)
BEGIN
    INSERT INTO restaurangdb.orderitems (OrderID, MenuID, Quantity)
    VALUES (p_OrderID, p_MenuID, p_Quantity);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_NewOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_NewOrder`(
IN p_TableID INT,
IN p_PersonalID INT
)
begin
INSERT INTO restaurangdb.Orders (TableID, PersonalID, OrderDate)
VALUES (p_TableID, p_PersonalID, NOW());
SELECT LAST_INSERT_ID() AS newOrderID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_dailysales`
--

/*!50001 DROP VIEW IF EXISTS `view_dailysales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_dailysales` AS select cast(`o`.`OrderDate` as date) AS `ODate`,count(distinct `o`.`OrderID`) AS `NumOfOrders`,sum((`oi`.`Quantity` * `m`.`Price`)) AS `Sales`,sum(`o`.`TipAmount`) AS `Tip`,(sum((`oi`.`Quantity` * `m`.`Price`)) + coalesce(sum(`o`.`TipAmount`),0)) AS `TotalSales` from ((`orders` `o` join `orderitems` `oi` on((`o`.`OrderID` = `oi`.`OrderID`))) join `menuitems` `m` on((`oi`.`MenuID` = `m`.`MenuID`))) group by cast(`o`.`OrderDate` as date) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_inventorystatus`
--

/*!50001 DROP VIEW IF EXISTS `view_inventorystatus`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_inventorystatus` AS select distinct `i`.`ProductName` AS `ProductName`,`i`.`Quantity` AS `Quantity`,(case when (`i`.`Quantity` < 5) then 'Low' else 'OK' end) AS `Status` from `inventory` `i` order by `i`.`Quantity` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_receipts`
--

/*!50001 DROP VIEW IF EXISTS `view_receipts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_receipts` AS select `o`.`OrderID` AS `OrderID`,`o`.`TableID` AS `TableID`,`o`.`OrderDate` AS `OrderDate`,`s`.`FirstName` AS `Servitor`,group_concat(concat(`oi`.`Quantity`,'x ',`m`.`MenuItemName`) separator ', ') AS `Dishes`,sum((`oi`.`Quantity` * `m`.`Price`)) AS `CostofFood`,coalesce(`o`.`TipAmount`,0) AS `Tip`,(sum((`oi`.`Quantity` * `m`.`Price`)) + coalesce(`o`.`TipAmount`,0)) AS `TotalPrice` from (((`orders` `o` left join `orderitems` `oi` on((`o`.`OrderID` = `oi`.`OrderID`))) left join `menuitems` `m` on((`oi`.`MenuID` = `m`.`MenuID`))) left join `personal` `s` on((`o`.`PersonalID` = `s`.`PersonalID`))) group by `o`.`OrderID`,`o`.`TableID`,`o`.`OrderDate`,`s`.`FirstName` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_yearlysales`
--

/*!50001 DROP VIEW IF EXISTS `view_yearlysales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_yearlysales` AS select `sales`.`AllSales` AS `TotalSales`,`costs`.`AllPurchases` AS `TotalPurcheses`,(`sales`.`AllSales` - `costs`.`AllPurchases`) AS `TotalWinnings` from ((select sum((`o`.`Quantity` * `m`.`Price`)) AS `AllSales` from ((`orderitems` `o` join `menuitems` `m` on((`o`.`MenuID` = `m`.`MenuID`))) join `orders` `o2` on((`o`.`OrderID` = `o2`.`OrderID`))) where (year(`o2`.`OrderDate`) = 2025)) `sales` join (select sum(`p`.`Price`) AS `AllPurchases` from `purchasing` `p` where (year(`p`.`PurchaseDate`) = 2025)) `costs`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-21 14:58:06
