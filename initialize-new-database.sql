CREATE DATABASE  IF NOT EXISTS `zoe_test` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `zoe_test`;
-- MySQL dump 10.13  Distrib 5.5.37, for debian-linux-gnu (x86_64)
--
-- Host: dragonfly    Database: zoe_test
-- ------------------------------------------------------
-- Server version	5.5.37-0ubuntu0.13.10.1

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
-- Table structure for table `arduino`
--

DROP TABLE IF EXISTS `arduino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arduino` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `arduino_location_id` int(11) NOT NULL,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_arduino_1_idx` (`arduino_location_id`),
  CONSTRAINT `fk_arduino_1` FOREIGN KEY (`arduino_location_id`) REFERENCES `arduino_location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arduino`
--

LOCK TABLES `arduino` WRITE;
/*!40000 ALTER TABLE `arduino` DISABLE KEYS */;
INSERT INTO `arduino` VALUES (1,'outdoor-porch','Outdoor Porch',1,'2014-05-16 01:23:28','2014-05-16 01:22:49'),(2,'inside-living-room','Inside Living Room',2,'2014-05-16 01:22:49','2014-05-16 01:22:49');
/*!40000 ALTER TABLE `arduino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arduino_location`
--

DROP TABLE IF EXISTS `arduino_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arduino_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arduino_location`
--

LOCK TABLES `arduino_location` WRITE;
/*!40000 ALTER TABLE `arduino_location` DISABLE KEYS */;
INSERT INTO `arduino_location` VALUES (1,'porch','Porch','2014-05-16 01:07:47','2014-05-16 01:05:46'),(2,'living-room','Living Room','2014-05-16 01:07:47','2014-05-16 01:05:46');
/*!40000 ALTER TABLE `arduino_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arduino_sensor`
--

DROP TABLE IF EXISTS `arduino_sensor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arduino_sensor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `arduino_id` int(11) NOT NULL,
  `arduino_sensor_type_id` int(11) NOT NULL,
  `modifiedOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdOn` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `fk_arduino_sensor_1_idx` (`arduino_id`),
  KEY `fk_arduino_sensor_2_idx` (`arduino_sensor_type_id`),
  CONSTRAINT `fk_arduino_sensor_1` FOREIGN KEY (`arduino_id`) REFERENCES `arduino` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_arduino_sensor_2` FOREIGN KEY (`arduino_sensor_type_id`) REFERENCES `arduino_sensor_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arduino_sensor`
--

LOCK TABLES `arduino_sensor` WRITE;
/*!40000 ALTER TABLE `arduino_sensor` DISABLE KEYS */;
INSERT INTO `arduino_sensor` VALUES (1,1,2,'2014-05-16 01:53:23','2014-05-15 20:53:04'),(2,1,3,'2014-05-16 01:53:23','2014-05-15 20:53:04'),(3,2,3,'2014-05-16 01:53:23','2014-05-15 20:53:04'),(4,2,2,'2014-05-16 01:53:23','2014-05-15 20:53:04'),(5,2,5,'2014-05-16 01:53:23','2014-05-15 20:53:04');
/*!40000 ALTER TABLE `arduino_sensor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arduino_sensor_reading`
--

DROP TABLE IF EXISTS `arduino_sensor_reading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arduino_sensor_reading` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(10,5) NOT NULL,
  `arduino_sensor_reading_type_id` int(11) NOT NULL,
  `arduino_sensor_id` int(11) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_arduino_sensor_reading_1_idx` (`arduino_sensor_reading_type_id`),
  KEY `fk_arduino_sensor_reading_2_idx` (`arduino_sensor_id`),
  CONSTRAINT `fk_arduino_sensor_reading_1` FOREIGN KEY (`arduino_sensor_reading_type_id`) REFERENCES `arduino_sensor_reading_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_arduino_sensor_reading_2` FOREIGN KEY (`arduino_sensor_id`) REFERENCES `arduino_sensor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arduino_sensor_reading`
--

LOCK TABLES `arduino_sensor_reading` WRITE;
/*!40000 ALTER TABLE `arduino_sensor_reading` DISABLE KEYS */;
/*!40000 ALTER TABLE `arduino_sensor_reading` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arduino_sensor_reading_type`
--

DROP TABLE IF EXISTS `arduino_sensor_reading_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arduino_sensor_reading_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `unit_of_measure_id` int(11) NOT NULL,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_arduino_sensor_reading_type_1_idx` (`unit_of_measure_id`),
  CONSTRAINT `fk_arduino_sensor_reading_type_1` FOREIGN KEY (`unit_of_measure_id`) REFERENCES `unit_of_measure` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arduino_sensor_reading_type`
--

LOCK TABLES `arduino_sensor_reading_type` WRITE;
/*!40000 ALTER TABLE `arduino_sensor_reading_type` DISABLE KEYS */;
INSERT INTO `arduino_sensor_reading_type` VALUES (1,'temperature','Temperature',2,'2014-05-16 02:31:02','2014-05-16 02:30:53'),(2,'humidity','Humidity',3,'2014-05-16 02:31:02','2014-05-16 02:30:53');
/*!40000 ALTER TABLE `arduino_sensor_reading_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `arduino_sensor_reading_view`
--

DROP TABLE IF EXISTS `arduino_sensor_reading_view`;
/*!50001 DROP VIEW IF EXISTS `arduino_sensor_reading_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `arduino_sensor_reading_view` (
  `value` tinyint NOT NULL,
  `arduino_sensor_reading_type_name` tinyint NOT NULL,
  `arduino_sensor_reading_type_display_name` tinyint NOT NULL,
  `unit_of_measure_name` tinyint NOT NULL,
  `unit_of_measure_display_name` tinyint NOT NULL,
  `unit_of_measure_abbreviated_display_name` tinyint NOT NULL,
  `unit_of_measure_symbol_display_name` tinyint NOT NULL,
  `arduino_name` tinyint NOT NULL,
  `arduino_display_name` tinyint NOT NULL,
  `arduino_location_name` tinyint NOT NULL,
  `arduino_location_display_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `arduino_sensor_type`
--

DROP TABLE IF EXISTS `arduino_sensor_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arduino_sensor_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `modified_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arduino_sensor_type`
--

LOCK TABLES `arduino_sensor_type` WRITE;
/*!40000 ALTER TABLE `arduino_sensor_type` DISABLE KEYS */;
INSERT INTO `arduino_sensor_type` VALUES (1,'bmp180','BMP180','2014-05-16 01:50:18','2014-05-16 01:49:59'),(2,'cd5','CD5','2014-05-16 01:50:18','2014-05-16 01:49:59'),(3,'dht','DHT','2014-05-16 01:50:18','2014-05-16 01:49:59'),(4,'tmp36','TMP36','2014-05-16 01:50:18','2014-05-16 01:49:59'),(5,'tsl2561','TSL2561','2014-05-16 01:50:18','2014-05-16 01:49:59');
/*!40000 ALTER TABLE `arduino_sensor_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `arduino_sensor_view`
--

DROP TABLE IF EXISTS `arduino_sensor_view`;
/*!50001 DROP VIEW IF EXISTS `arduino_sensor_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `arduino_sensor_view` (
  `arduino_sensor_type_name` tinyint NOT NULL,
  `arduino_sensor_type_display_name` tinyint NOT NULL,
  `arduino_name` tinyint NOT NULL,
  `arduino_display_name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `unit_of_measure`
--

DROP TABLE IF EXISTS `unit_of_measure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unit_of_measure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `abbreviated_display_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `symbol_display_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_on` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unit_of_measure`
--

LOCK TABLES `unit_of_measure` WRITE;
/*!40000 ALTER TABLE `unit_of_measure` DISABLE KEYS */;
INSERT INTO `unit_of_measure` VALUES (1,'degrees-fahrenheit','Degrees Fahrenheit','F','°F','2014-05-16 02:24:24','2014-05-16 02:24:13'),(2,'degrees-celcius','Degrees Celcius','C','°C','2014-05-16 02:28:56','2014-05-16 02:24:59'),(3,'relative-humidity','Relative Humidity','Percent','%','2014-05-16 02:28:56','2014-05-16 02:24:59'),(4,'units','Units','Units','Units','2014-05-16 02:28:56','2014-05-16 02:24:59');
/*!40000 ALTER TABLE `unit_of_measure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'zoe_test'
--
/*!50003 DROP PROCEDURE IF EXISTS `insert_arduino_sensor_reading` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`firefly` PROCEDURE `insert_arduino_sensor_reading`(sensor_reading DECIMAL(10,5), 
arduino_name VARCHAR(45),
arduino_sensor_type_name VARCHAR(45),
arduino_sensor_reading_type_name VARCHAR(45))
BEGIN

SET @sensor_id = (SELECT arduino_sensor.id FROM zoe_test.arduino_sensor
JOIN zoe_test.arduino ON arduino.id = arduino_sensor.id
JOIN zoe_test.arduino_sensor_type ON arduino_sensor_type.id = arduino_sensor.arduino_sensor_type_id
WHERE
arduino.name = arduino_name
AND arduino_sensor_type.name = arduino_sensor_type_name);
  
SET @sensor_reading_type_id = (SELECT arduino_sensor_reading_type.id FROM zoe_test.arduino_sensor_reading_type 
WHERE arduino_sensor_reading_type.name = arduino_sensor_reading_type_name);

INSERT INTO zoe_test.arduino_sensor_reading
(value, arduino_sensor_id, arduino_sensor_reading_type_id)
VALUES(sensor_reading, @sensor_id, @sensor_reading_type_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `arduino_sensor_reading_view`
--

/*!50001 DROP TABLE IF EXISTS `arduino_sensor_reading_view`*/;
/*!50001 DROP VIEW IF EXISTS `arduino_sensor_reading_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = latin1 */;
/*!50001 SET character_set_results     = latin1 */;
/*!50001 SET collation_connection      = latin1_swedish_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`firefly` SQL SECURITY DEFINER */
/*!50001 VIEW `arduino_sensor_reading_view` AS select `arduino_sensor_reading`.`value` AS `value`,`arduino_sensor_reading_type`.`name` AS `arduino_sensor_reading_type_name`,`arduino_sensor_reading_type`.`display_name` AS `arduino_sensor_reading_type_display_name`,`unit_of_measure`.`name` AS `unit_of_measure_name`,`unit_of_measure`.`display_name` AS `unit_of_measure_display_name`,`unit_of_measure`.`abbreviated_display_name` AS `unit_of_measure_abbreviated_display_name`,`unit_of_measure`.`symbol_display_name` AS `unit_of_measure_symbol_display_name`,`arduino`.`name` AS `arduino_name`,`arduino`.`display_name` AS `arduino_display_name`,`arduino_location`.`name` AS `arduino_location_name`,`arduino_location`.`display_name` AS `arduino_location_display_name` from ((((((`arduino_sensor_reading` join `arduino_sensor_reading_type` on((`arduino_sensor_reading_type`.`id` = `arduino_sensor_reading`.`arduino_sensor_reading_type_id`))) join `arduino_sensor` on((`arduino_sensor`.`id` = `arduino_sensor_reading`.`arduino_sensor_id`))) join `arduino` on((`arduino`.`id` = `arduino_sensor`.`arduino_id`))) join `arduino_sensor_type` on((`arduino_sensor_type`.`id` = `arduino_sensor`.`arduino_sensor_type_id`))) join `unit_of_measure` on((`unit_of_measure`.`id` = `arduino_sensor_reading_type`.`unit_of_measure_id`))) join `arduino_location` on((`arduino_location`.`id` = `arduino`.`arduino_location_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `arduino_sensor_view`
--

/*!50001 DROP TABLE IF EXISTS `arduino_sensor_view`*/;
/*!50001 DROP VIEW IF EXISTS `arduino_sensor_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`firefly` SQL SECURITY DEFINER */
/*!50001 VIEW `arduino_sensor_view` AS select `arduino_sensor_type`.`name` AS `arduino_sensor_type_name`,`arduino_sensor_type`.`display_name` AS `arduino_sensor_type_display_name`,`arduino`.`name` AS `arduino_name`,`arduino`.`display_name` AS `arduino_display_name` from ((`arduino_sensor` join `arduino_sensor_type` on((`arduino_sensor_type`.`id` = `arduino_sensor`.`arduino_sensor_type_id`))) join `arduino` on((`arduino`.`id` = `arduino_sensor`.`arduino_id`))) */;
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

-- Dump completed on 2014-05-15 23:23:25
