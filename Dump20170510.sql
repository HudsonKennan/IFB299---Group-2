CREATE DATABASE  IF NOT EXISTS `ifb299` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ifb299`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: ifb299
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `properties`
--

DROP TABLE IF EXISTS `properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `properties` (
  `property_id` int(11) NOT NULL AUTO_INCREMENT,
  `suburb` varchar(45) NOT NULL,
  `property_type` varchar(45) NOT NULL,
  `furnished` varchar(45) NOT NULL,
  `property_address` varchar(45) NOT NULL,
  `bedroom_no` varchar(45) DEFAULT NULL,
  `bathroom_no` varchar(45) DEFAULT NULL,
  `garage_no` varchar(45) DEFAULT NULL,
  `property_description` longtext NOT NULL,
  `property_rent` varchar(45) NOT NULL,
  `property_available` varchar(45) DEFAULT NULL,
  `property_image_1` varchar(45) NOT NULL,
  `property_image_2` varchar(45) DEFAULT NULL,
  `property_image_3` varchar(45) DEFAULT NULL,
  `property_image_4` varchar(45) DEFAULT NULL,
  `property_image_5` varchar(45) DEFAULT NULL,
  `property_image_6` varchar(45) DEFAULT NULL,
  `property_image_7` varchar(45) DEFAULT NULL,
  `property_image_8` varchar(45) DEFAULT NULL,
  `property_image_9` varchar(45) DEFAULT NULL,
  `property_image_10` varchar(45) DEFAULT NULL,
  `property_rent_category` varchar(45) NOT NULL,
  PRIMARY KEY (`property_id`),
  UNIQUE KEY `property_id_UNIQUE` (`property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `properties`
--

LOCK TABLES `properties` WRITE;
/*!40000 ALTER TABLE `properties` DISABLE KEYS */;
INSERT INTO `properties` VALUES (1,'Sunnybank','house','Yes','3 Test Street','4','3','3','Large family home located close to schools and public transport. Popular shopping centres are located just 10 minutes walk away. Property also has a large backyard, perfect for pets.','550','Yes','pexels-photo-186077',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'600'),(2,'Carindale','house','No','14 Test Street','3','1','2','house','400','Yes','pexels-photo-186077',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'400'),(3,'Sunnybank','house','Yes','2 Tester Street','3','2','2','house','420','No','pexels-photo-186077',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'500');
/*!40000 ALTER TABLE `properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheduling`
--

DROP TABLE IF EXISTS `scheduling`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduling` (
  `scheduling_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `property_id` int(11) NOT NULL,
  `user_id_tenant` int(11) NOT NULL,
  `user_id_staff` int(11) NOT NULL,
  PRIMARY KEY (`scheduling_id`),
  UNIQUE KEY `scheduling_id_UNIQUE` (`scheduling_id`),
  KEY `property_id_idx` (`property_id`),
  KEY `user_id_idx` (`user_id_tenant`),
  KEY `user_id_staff_idx` (`user_id_staff`),
  CONSTRAINT `property_id` FOREIGN KEY (`property_id`) REFERENCES `properties` (`property_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id_tenant`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `user_id_staff` FOREIGN KEY (`user_id_staff`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheduling`
--

LOCK TABLES `scheduling` WRITE;
/*!40000 ALTER TABLE `scheduling` DISABLE KEYS */;
/*!40000 ALTER TABLE `scheduling` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(45) NOT NULL,
  `l_name` varchar(45) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `rent_status` varchar(45) NOT NULL DEFAULT 'available',
  `email` varchar(45) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  `mobile_number` varchar(45) DEFAULT NULL,
  `phone_number` varchar(45) NOT NULL,
  `permission` varchar(45) NOT NULL DEFAULT 'tenant',
  `tc` varchar(45) NOT NULL,
  `sub` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `phone_number_UNIQUE` (`phone_number`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `mobile_number_UNIQUE` (`mobile_number`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Phyllis','Yaw','1996-09-06','female','miggles3','available','phyvo@hotmail.com',NULL,NULL,'0435831787','tenant','Y','Y');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ifb299'
--

--
-- Dumping routines for database 'ifb299'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-10  9:08:00
