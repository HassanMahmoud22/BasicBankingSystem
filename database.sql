-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: banksystem
-- ------------------------------------------------------
-- Server version	8.0.27

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(25) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `phone_number` varchar(11) NOT NULL,
  `current_balance` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Hassan','hassan@gmail.com','01285669367',44),(2,'Mohamed','Mohamed@gmail.com','01145763367',1620),(3,'Ahmed','ahmed@gmail.com','01005484219',1065),(4,'Mona','mona@gmail.com','01124975134',540),(5,'Omnia','omnia@gmail.com','01524875146',781),(6,'Rahma','rahma@gmail.com','01247126458',1080),(7,'Yousef','yousef@gmail.com','01257463124',1070),(8,'Nouran','nouran@gmail.com','01086224719',1050),(9,'Nourhan','nourhan@gmail.com','01574612947',1300),(10,'Mahmoud','mahmoud@gmail.com','01141379633',950);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transfers`
--

DROP TABLE IF EXISTS `transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transfers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Sender` int NOT NULL,
  `Receiver` int NOT NULL,
  `Amount` double NOT NULL,
  `Transfer_Date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `Sender` (`Sender`),
  KEY `Receiver` (`Receiver`),
  CONSTRAINT `transfers_ibfk_1` FOREIGN KEY (`Sender`) REFERENCES `customers` (`id`),
  CONSTRAINT `transfers_ibfk_2` FOREIGN KEY (`Receiver`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfers`
--

LOCK TABLES `transfers` WRITE;
/*!40000 ALTER TABLE `transfers` DISABLE KEYS */;
INSERT INTO `transfers` VALUES (1,1,2,100,'2022-02-07 22:49:24'),(2,1,2,100,'2022-02-07 23:06:33'),(3,1,2,100,'2022-02-07 23:07:27'),(4,1,2,100,'2022-02-07 23:09:39'),(5,1,2,50,'2022-02-08 01:49:54'),(6,1,2,50,'2022-02-08 14:41:29'),(7,1,2,50,'2022-02-08 15:07:31'),(8,1,2,50,'2022-02-08 15:14:22'),(9,1,2,50,'2022-02-08 15:15:59'),(10,1,2,50,'2022-02-08 15:18:00'),(11,1,2,50,'2022-02-08 15:18:52'),(12,3,6,20,'2022-02-09 01:58:56'),(13,4,8,50,'2022-02-09 02:03:00'),(14,6,10,40,'2022-02-09 02:04:24'),(15,9,10,10,'2022-02-09 18:23:26'),(16,5,3,120,'2022-02-09 19:28:27'),(17,5,9,310,'2022-02-09 19:29:50'),(18,2,4,40,'2022-02-09 19:53:57'),(19,2,5,20,'2022-02-09 19:55:13'),(20,2,7,70,'2022-02-09 20:02:39'),(21,3,1,35,'2022-02-10 03:12:38'),(22,1,5,41,'2022-02-12 18:43:41'),(23,4,5,50,'2022-02-12 23:24:30'),(24,4,6,100,'2022-02-14 14:39:25'),(25,4,2,300,'2022-02-14 15:37:46'),(26,10,5,100,'2022-02-14 20:05:13');
/*!40000 ALTER TABLE `transfers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-15  1:07:27
