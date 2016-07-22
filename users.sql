-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: users
-- ------------------------------------------------------
-- Server version	5.5.42

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
-- Table structure for table `pokes`
--

DROP TABLE IF EXISTS `pokes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poke` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pokes_users_idx` (`user_id`),
  CONSTRAINT `fk_pokes_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokes`
--

LOCK TABLES `pokes` WRITE;
/*!40000 ALTER TABLE `pokes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pokes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `date_of_birth` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Oliver Rosales','Oliver','joliver@codingdojo.com','$2b$12$QX63S/uxV1UrSt96Wl1tr.yb3fYsdtU6bQpj6LCErI1ISz942K2si','1976-12-31','2016-07-22 09:55:49','2016-07-22 09:55:49'),(2,'Diane Sue Manlulu','Diana','dmanlulu@gmail.com','$2b$12$xI5b9Zda711GL38hHsPcwuCofAnF0MhvaTYzFR9I26KqhRGaulEym','1985-03-02','2016-07-22 09:58:44','2016-07-22 09:58:44'),(3,'Jerry Tonel','j2','j2nel@yahoo.com','$2b$12$pyI.gLOgBndy5dq8CC6bz.KwXAFd0ZFJj47Jc/C/E7dDgOUCQdiTy','1988-08-22','2016-07-22 10:03:26','2016-07-22 10:03:26'),(4,'Jerry Tonel','j2','j2nel@yahoo.com','$2b$12$khJH4CE7vCNRqkQ6VVNTFOK3XQ3ZXl5/ZTyUiwED5OqqLa5DMbB1S','1988-08-22','2016-07-22 10:03:45','2016-07-22 10:03:45'),(5,'John Michael Smith','JM','smith@michael.com','$2b$12$AcBF8mMl/37g6h6UOdnDkOzOpjWC8qVA/A3bYI3.fB/k5wexwWDK2','1962-03-03','2016-07-22 10:04:34','2016-07-22 10:04:34'),(6,'Olivia Winters','Livy','livy@winters.com','$2b$12$JEcLdhObN8O5Ys0Hjt5GnuROlFvn9pSwjGdJ5z9U6Pz1AfBPuxwCa','1983-02-13','2016-07-22 10:05:14','2016-07-22 10:05:14'),(7,'Dahye Hwang','Grace','grace@codingdojo.com','$2b$12$3S9XEmQHa36nnTunIJqO2OGK8FesLB3pr51om9Gtr9.d6Qb4xEenO','1988-10-10','2016-07-22 10:05:58','2016-07-22 10:05:58'),(8,'Brian Hwang','Brian','jshwang83@gmail.com','$2b$12$HWxVBACwIorLPdj4GpqcI.EzSj1rP3aSessuvnsg.ve5zChvthbzK','1977-05-06','2016-07-22 10:38:31','2016-07-22 10:38:31'),(9,'sang','yun','sang@codingdojo.com','$2b$12$VD.k/S4kVVS5t2EiGAFXgO4MXLh9GTsbEbhOwNk0MOo7p0ztA46tm','1972-04-15','2016-07-22 12:14:41','2016-07-22 12:14:41'),(10,'carlos','car','nicecar@coding.com','$2b$12$/sf7Yh308KF6HUgkAlflSuoK3E9RgRyuiXPcZoCLge0.skUzU4bYe','1983-09-11','2016-07-22 12:15:15','2016-07-22 12:15:15');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-22 12:51:12
