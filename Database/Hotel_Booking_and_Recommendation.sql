-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: Hotel_Booking
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `Booking`
--

DROP TABLE IF EXISTS `Booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Booking` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `User_id` int NOT NULL,
  `Hotel_id` int NOT NULL,
  `NoOfNights` int NOT NULL,
  `NoOfPeople` int NOT NULL,
  `check_in_time` timestamp NOT NULL,
  `check_out_time` timestamp NOT NULL,
  `Payment_Status` enum('completed','draft') NOT NULL,
  `Booking_Status` enum('completed','draft') NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `User_id` (`User_id`),
  KEY `Hotel_id` (`Hotel_id`),
  CONSTRAINT `Booking_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `Users` (`user_id`),
  CONSTRAINT `Booking_ibfk_2` FOREIGN KEY (`Hotel_id`) REFERENCES `Hotels` (`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Booking`
--

LOCK TABLES `Booking` WRITE;
/*!40000 ALTER TABLE `Booking` DISABLE KEYS */;
INSERT INTO `Booking` VALUES (1,2,4,2,5,'2024-08-12 20:30:00','2024-08-13 05:30:00','completed','completed'),(2,2,4,2,5,'2024-08-12 20:30:00','2024-08-13 05:30:00','draft','draft'),(3,1,1,2,3,'2024-08-14 17:24:00','2024-08-17 17:24:00','completed','completed'),(4,1,1,2,4,'2024-08-14 17:24:00','2024-08-18 17:24:00','draft','draft'),(5,1,2,2,2,'2024-08-12 17:35:00','2024-08-14 17:36:00','completed','completed'),(6,1,2,2,2,'2024-08-12 17:35:00','2024-08-14 17:36:00','draft','draft'),(7,1,1,2,2,'2024-08-18 17:48:00','2024-08-20 17:48:00','completed','completed'),(8,1,1,2,2,'2024-08-18 17:48:00','2024-08-20 17:48:00','draft','draft'),(9,1,14,2,2,'2024-08-12 20:41:00','2024-08-14 20:41:00','completed','completed'),(10,2,14,2,2,'2024-08-12 20:41:00','2024-08-14 20:41:00','draft','draft'),(11,1,13,2,2,'2024-08-14 20:58:00','2024-08-16 20:58:00','completed','completed'),(12,1,13,2,2,'2024-08-14 20:58:00','2024-08-16 20:58:00','draft','draft');
/*!40000 ALTER TABLE `Booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Hotels`
--

DROP TABLE IF EXISTS `Hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Hotels` (
  `hotel_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `address` varchar(250) NOT NULL,
  `rating` float NOT NULL,
  `price_per_night` decimal(10,2) NOT NULL,
  `discount` varchar(100) DEFAULT NULL,
  `available` tinyint(1) NOT NULL,
  `Area` varchar(100) NOT NULL,
  `City` varchar(100) NOT NULL,
  `State` varchar(100) NOT NULL,
  `Time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hotels`
--

LOCK TABLES `Hotels` WRITE;
/*!40000 ALTER TABLE `Hotels` DISABLE KEYS */;
INSERT INTO `Hotels` VALUES (1,'ABC','Shivaji Nagar,Pune,Maharashtra',4.5,2500.00,'3% on Monday to Thursday',1,'Shivaji Nagar','Pune','Maharashtra','2024-08-09 14:06:59'),(2,'DEF','Hadpsar,Pune,Maharashtra',4.7,3500.00,'2% on every Monday',1,'Hadpsar','Pune','Maharashtra','2024-08-09 16:41:51'),(3,'GHI','Navi Mumbai,Mumbai,Maharashtra',3.8,4500.00,'2% on every Wednesday',1,'Navi Mumbai','Mumbai','Maharashtra','2024-08-09 16:44:40'),(4,'JKL','Camp,Malegaon-Nashik,Maharashtra',3,2500.00,NULL,1,'Camp','Malegaon','Maharashtra','2024-08-09 16:47:21'),(5,'JKL-2','Sudko,Nashik,Maharashtra',3.5,1500.00,'5% on Weedays',0,'Sudko','Nashik','Maharashtra','2024-08-09 16:51:48'),(6,'MNO','XYZ,Amravati,Andra Pradesh',4,2500.00,NULL,1,'XYZ','Amravati','Andra Pradesh','2024-08-09 16:59:09'),(7,'PQR','XYZ,Shimla,Himachal Pradesh',4,3500.00,'2% on tuesday to friday',1,'XYZ','Shimla','Himachal Pradesh','2024-08-09 17:03:17'),(8,'STU','Shivaji Nagar,Pune,Maharashtra',4.8,2800.00,NULL,1,'Shivaji Nagar','Pune','Maharashtra','2024-08-10 09:17:15'),(9,'VWX','Navi Mumbai,Mumbai,Maharashtra',4.3,5000.00,NULL,1,'Navi Mumbai','Mumbai','Maharashtra','2024-08-10 09:24:46'),(10,'ZYX','Shivaji Nagar,Pune,Maharashtra',4.4,26.00,NULL,1,'Shivaji Nagar','Pune','Maharashtra','2024-08-11 18:20:46'),(11,'ZYX','Shivaji Nagar,Pune,Maharashtra',4.6,2700.00,NULL,1,'Shivaji Nagar','Pune','Maharashtra','2024-08-11 18:22:13'),(12,'ABC-1','Shivaji Nagar,Pune,Maharashtra',4.4,2800.00,'2 % on monday to thursday',1,'Shivaji Nagar','Pune','Maharashtra','2024-08-11 20:23:53'),(13,'Crowne Plaza','Shivaji Nagar,Pune,Maharashtra',4.6,2400.00,'3% on monday to thursday',1,'Shivaji Nagar','Pune','Maharashtra','2024-08-11 20:28:10'),(14,'JW Marriott','Shivaji Nagar,Pune,Maharashtra',4.8,2900.00,'2% on weekdays',1,'Shivaji Nagar','Pune','Maharashtra','2024-08-11 20:30:39');
/*!40000 ALTER TABLE `Hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Users`
--

DROP TABLE IF EXISTS `Users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(150) NOT NULL,
  `email` varchar(200) NOT NULL,
  `Time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `PhoneNo` bigint NOT NULL,
  `Password` varchar(150) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Users`
--

LOCK TABLES `Users` WRITE;
/*!40000 ALTER TABLE `Users` DISABLE KEYS */;
INSERT INTO `Users` VALUES (1,'Dhanraj Chitte','chittedhanraj3@gmail.com','2024-08-09 13:00:57',7822969515,'DhanrajSC@02'),(2,'Chandrashekhar Patil','chandu@gmail.com','2024-08-09 18:09:44',7822969515,'Chandu@123'),(3,'Ganesh Ahire','ganeshahire@gmail.com','2024-08-09 18:10:53',7822969515,'Ganesh@123'),(4,'Valmik Chitte','valmikchitte95@gmail.com','2024-08-09 18:12:06',9518955343,'Valmik@123'),(5,'Vishal','chittedhanraj3@gmail.com','2024-08-10 12:02:35',7822969515,'DhanrajSC@02'),(6,'DhanrajChitte','chittedhanraj3@gmail.com','2024-08-10 12:05:02',7822969515,'DhanrajSC@02'),(7,'DhanrajChitte','chittedhanraj3@gmail.com','2024-08-10 12:14:27',7822969515,'DhanrajSC@02'),(8,'Dhanraj Chitte','chittedhanraj3@gmail.com','2024-08-10 12:22:16',7822969515,'Dhanraj@123'),(9,'Vishal','abdullah@gmai.com','2024-08-10 12:40:31',7822969515,'Vishal@123'),(10,'Darshan kshetri','darshan@gmail.com','2024-08-10 13:32:59',7822969515,'Darshan@123'),(11,'Chandu','chandupatil@gmail.com','2024-08-10 15:44:01',7822969515,'Chandu@123'),(12,'Dhanraj Chitte','ganesh@gamil.com','2024-08-10 16:58:33',7822969515,'Ganesh@123'),(13,'Valmik Chitte','valmikchitte95@gmail.com','2024-08-11 19:51:10',9518955343,'Valmik@123'),(14,'Sushant Nalage','sushantnalage@gmail.com','2024-08-11 19:59:14',7822969515,'Sushant@123'),(15,'Dhanraj Chitte','chittedhanraj3@gmail.com','2024-08-11 20:02:18',7822969515,'DhanrajSC@02'),(16,'Pratik Bagale','pratikbagale@gmail.com','2024-08-11 21:25:51',7822969515,'Pratik@123');
/*!40000 ALTER TABLE `Users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Visits`
--

DROP TABLE IF EXISTS `Visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Visits` (
  `visit_id` int NOT NULL AUTO_INCREMENT,
  `User_id` int NOT NULL,
  `Hotel_id` int NOT NULL,
  `visit_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`visit_id`),
  KEY `User_id` (`User_id`),
  KEY `Hotel_id` (`Hotel_id`),
  CONSTRAINT `Visits_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `Users` (`user_id`),
  CONSTRAINT `Visits_ibfk_2` FOREIGN KEY (`Hotel_id`) REFERENCES `Hotels` (`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Visits`
--

LOCK TABLES `Visits` WRITE;
/*!40000 ALTER TABLE `Visits` DISABLE KEYS */;
INSERT INTO `Visits` VALUES (1,1,1,'2024-08-09 18:02:03','2024-08-09 18:02:03'),(2,1,2,'2024-08-09 18:15:06','2024-08-09 18:15:06'),(3,2,3,'2024-08-09 18:15:37','2024-08-09 18:15:37'),(4,2,4,'2024-08-09 18:15:57','2024-08-09 18:15:57'),(5,3,5,'2024-08-09 18:16:10','2024-08-09 18:16:10'),(6,3,6,'2024-08-09 18:16:19','2024-08-09 18:16:19'),(7,4,7,'2024-08-09 18:16:32','2024-08-09 18:16:32'),(10,1,1,'2024-08-10 19:39:20','2024-08-10 19:39:20'),(11,1,2,'2024-08-10 19:47:33','2024-08-10 19:47:33'),(12,1,1,'2024-08-11 10:38:03','2024-08-11 10:38:03'),(13,1,2,'2024-08-11 10:38:22','2024-08-11 10:38:22'),(14,1,1,'2024-08-11 12:49:20','2024-08-11 12:49:20'),(15,1,8,'2024-08-11 12:50:41','2024-08-11 12:50:41'),(16,1,2,'2024-08-11 12:51:48','2024-08-11 12:51:48'),(17,1,1,'2024-08-11 13:42:44','2024-08-11 13:42:44'),(18,1,1,'2024-08-11 13:43:00','2024-08-11 13:43:00'),(19,1,2,'2024-08-11 14:11:04','2024-08-11 14:11:04'),(20,1,8,'2024-08-11 14:11:23','2024-08-11 14:11:23'),(21,1,8,'2024-08-11 14:26:42','2024-08-11 14:26:42'),(22,1,2,'2024-08-11 14:27:02','2024-08-11 14:27:02'),(23,1,1,'2024-08-11 14:28:14','2024-08-11 14:28:14'),(24,1,1,'2024-08-11 17:24:27','2024-08-11 17:24:27'),(25,1,1,'2024-08-11 17:24:40','2024-08-11 17:24:40'),(26,1,2,'2024-08-11 17:35:12','2024-08-11 17:35:12'),(27,1,2,'2024-08-11 17:35:25','2024-08-11 17:35:25'),(28,1,1,'2024-08-11 17:38:11','2024-08-11 17:38:11'),(29,1,1,'2024-08-11 17:44:42','2024-08-11 17:44:42'),(30,1,1,'2024-08-11 17:44:52','2024-08-11 17:44:52'),(31,1,1,'2024-08-11 17:48:22','2024-08-11 17:48:22'),(32,1,1,'2024-08-11 18:57:38','2024-08-11 18:57:38'),(33,1,1,'2024-08-11 19:03:11','2024-08-11 19:03:11'),(34,1,1,'2024-08-11 19:35:42','2024-08-11 19:35:42'),(35,1,11,'2024-08-11 19:38:35','2024-08-11 19:38:35'),(36,1,11,'2024-08-11 19:39:05','2024-08-11 19:39:05'),(37,1,10,'2024-08-11 20:14:23','2024-08-11 20:14:23'),(38,1,14,'2024-08-11 20:40:36','2024-08-11 20:40:36'),(39,1,14,'2024-08-11 20:41:00','2024-08-11 20:41:00'),(40,1,12,'2024-08-11 20:57:15','2024-08-11 20:57:15'),(41,1,13,'2024-08-11 20:58:02','2024-08-11 20:58:02'),(42,1,12,'2024-08-11 21:27:02','2024-08-11 21:27:02'),(43,1,12,'2024-08-11 21:27:17','2024-08-11 21:27:17');
/*!40000 ALTER TABLE `Visits` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-12  3:34:09
