-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: HotelBooking
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'John','Doe','john.doe@example.com','password123','1234567890'),(2,'Jane','Smith','jane.smith@example.com','mysecurepassword','0987654321'),(3,'Ganesh','Ahire','ganeshahire123123@gmail.com','$2b$10$vIcrGmHItTn6qZAULPX6JuKz/I0eG9.7GHDL/XnmBX/HKzpMwXqza','8459629079'),(4,'Rohida','Ahire','rohidasahire@gmail.com','rohidas1999','9561637571'),(5,'Milind','Nichal','milind@gmail.com','milind2000','9960302655'),(6,'Vaibhav','Ahire','vaibhav@gmail.com','$2b$10$xn.S7T8.e6t/6lL.JudYJ.u5Z7kAHhRPc4z/iwr9NdnjrfwRnU89y','9637470427'),(7,'Harish','Jadhav','harish@gmail.com','$2b$10$7saxES3WadDhFpruLxjPyOem3MXjoromsdinCDK7iTqfeS5m7ynoe','8766592511'),(8,'Tushar','Bagul','tushar@gmail.com','$2b$10$aehrr.VSJNTTRBGQHpRn1utQk3kV.sPxxDUbZoRGhcY.R/r5YmZ72','9766384952'),(9,'Pushpak','Patil','pushpak@gmail.com','$2b$10$X7MtfGlbjK9QdoCSSFflROTez7/QjcXSDdzoFUzNf5YUFlUCA3KhG','7875125856'),(10,'Dipak ','Patil ','dipak@gmail.com','$2b$10$ACp.fT6cJeXI5LPhlNN0b.B9CGgdiRTsSrpgSdgavLOstho/cw1yi','9370842235'),(11,'Amol','Patil','amol@gmail.com','$2b$10$4E3FXHkuj8NTYufVSAXzWuEI0hsiTFRAgXwGfRwIb6Ul60BTPt3fG','8687653311'),(12,'Bhartari','Ahire','bhartari@gmail.com','$2b$10$Gkip90lLukwKXCLaJtEJ.Og8spwxbdErBX2R5gYI9q7cj/Dx48n8q','7895623014'),(13,'chandu','patil','chandu@gmail.com','$2b$10$AbDY1E8MX.97HISqeF86lexL8mZk4L1LVhbZoLV8ntE6Jvy2Yk.Xa','8766954563'),(14,'Hemant ','Mahajan','heman@gmail.com','$2b$10$xdwnRW3CMEGAqjIs9sbvZenXCyXa3jn0upWEbpAkKNIQ9l2tFdwXy','9988753215'),(15,'Mahesh','Khairnar','mahesh@gmail.com','$2b$10$FnWV8C2e7x8/7WS5XtBmk.EG6S8l/CoumjyXDXShgecy4rb2Xfa9S','9865321445');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hotel`
--

DROP TABLE IF EXISTS `Hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hotel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `rating` decimal(2,1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hotel`
--

LOCK TABLES `Hotel` WRITE;
/*!40000 ALTER TABLE `Hotel` DISABLE KEYS */;
INSERT INTO `Hotel` VALUES (1,'Sunrise Hotel','New York',4.5),(2,'Moonlight Resort','California',4.8),(3,'Starry Night Inn','Texas',4.2),(4,'Ocean View Resort','Florida',4.7),(5,'Mountain Escape','Colorado',4.6),(6,'Desert Oasis','Arizona',4.3),(7,'City Lights Hotel','Chicago',4.4);
/*!40000 ALTER TABLE `Hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HotelBooking`
--

DROP TABLE IF EXISTS `HotelBooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HotelBooking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `hotel_id` int NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `customer_id` (`customer_id`),
  KEY `hotel_id` (`hotel_id`),
  CONSTRAINT `HotelBooking_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `Customer` (`id`),
  CONSTRAINT `HotelBooking_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `Hotel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HotelBooking`
--

LOCK TABLES `HotelBooking` WRITE;
/*!40000 ALTER TABLE `HotelBooking` DISABLE KEYS */;
INSERT INTO `HotelBooking` VALUES (1,1,1,'2024-08-15','2024-08-20'),(2,2,2,'2024-09-01','2024-09-10'),(3,1,2,'2024-08-15','2024-08-20'),(4,1,2,'2024-08-15','2024-08-20'),(5,1,2,'2024-08-15','2024-08-20'),(6,1,2,'2024-08-15','2024-08-20');
/*!40000 ALTER TABLE `HotelBooking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HotelManager`
--

DROP TABLE IF EXISTS `HotelManager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HotelManager` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `hotel_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `hotel_id` (`hotel_id`),
  CONSTRAINT `HotelManager_ibfk_1` FOREIGN KEY (`hotel_id`) REFERENCES `Hotel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HotelManager`
--

LOCK TABLES `HotelManager` WRITE;
/*!40000 ALTER TABLE `HotelManager` DISABLE KEYS */;
INSERT INTO `HotelManager` VALUES (1,'Alice','Johnson','alice.johnson@example.com','manager123','1122334455',1),(2,'Bob','Williams','bob.williams@example.com','manager456','5566778899',2);
/*!40000 ALTER TABLE `HotelManager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserAccount`
--

DROP TABLE IF EXISTS `UserAccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UserAccount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserAccount`
--

LOCK TABLES `UserAccount` WRITE;
/*!40000 ALTER TABLE `UserAccount` DISABLE KEYS */;
INSERT INTO `UserAccount` VALUES (1,'mukund@gmail.com','mukund2001'),(2,'ganesh@gmail.com','ganesh2002'),(3,'ganeshahire@gmail.com','ganeshahire2001'),(4,'rohit@gmail.com','$2b$10$HxYWc.EMESKMeaGU90.nyeg.Yv4Gs/DpZ/1NcTgSYyv.6dEecQTay'),(5,'sachin@gmail.com','sachin12');
/*!40000 ALTER TABLE `UserAccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Visit`
--

DROP TABLE IF EXISTS `Visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Visit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `custid` int NOT NULL,
  `hotelid` int NOT NULL,
  `timestamp` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `custid` (`custid`),
  KEY `hotelid` (`hotelid`),
  CONSTRAINT `Visit_ibfk_1` FOREIGN KEY (`custid`) REFERENCES `Customer` (`id`),
  CONSTRAINT `Visit_ibfk_2` FOREIGN KEY (`hotelid`) REFERENCES `Hotel` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Visit`
--

LOCK TABLES `Visit` WRITE;
/*!40000 ALTER TABLE `Visit` DISABLE KEYS */;
INSERT INTO `Visit` VALUES (1,1,1,'2024-08-15 14:00:00'),(2,2,2,'2024-09-01 15:30:00');
/*!40000 ALTER TABLE `Visit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-12 23:31:12
