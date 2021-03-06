/*
SQLyog Community v10.3 
MySQL - 5.5.12 : Database - racetrack_dev
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`racetrack_dev` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `racetrack_dev`;

/*Table structure for table `fixtures` */

DROP TABLE IF EXISTS `fixtures`;

CREATE TABLE `fixtures` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `end_date` datetime NOT NULL,
  `fixture_title` varchar(255) NOT NULL,
  `start_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=latin1;

/*Data for the table `fixtures` */

insert  into `fixtures`(`id`,`version`,`end_date`,`fixture_title`,`start_date`) values (1,0,'2013-09-27 00:00:00','Australian Grand Prix 1','2013-08-28 00:00:00'),(2,0,'2013-11-26 00:00:00','Australian Grand Prix 2','2013-10-27 00:00:00'),(3,0,'2014-01-25 00:00:00','Malaysian Grand Prix 1','2013-12-26 00:00:00'),(4,0,'2014-03-26 00:00:00','Malaysian Grand Prix 2','2014-02-24 00:00:00'),(5,0,'2014-05-25 00:00:00','Candian Grand Prix 1','2014-04-25 00:00:00'),(6,0,'2014-07-24 00:00:00','Candian Grand Prix 2','2014-06-24 00:00:00'),(7,0,'2014-09-22 00:00:00','Candian Grand Prix 3','2014-08-23 00:00:00'),(8,0,'2014-11-21 00:00:00','Indian Grand Prix 1','2014-10-22 00:00:00'),(9,0,'2015-01-20 00:00:00','Indian Grand Prix 2','2014-12-21 00:00:00'),(10,0,'2015-03-21 00:00:00','Indian Grand Prix 3','2015-02-19 00:00:00'),(11,0,'2013-09-27 00:00:00','Australian Grand Prix 1','2013-08-28 00:00:00'),(12,0,'2013-11-26 00:00:00','Australian Grand Prix 2','2013-10-27 00:00:00'),(13,0,'2014-01-25 00:00:00','Malaysian Grand Prix 1','2013-12-26 00:00:00'),(14,0,'2014-03-26 00:00:00','Malaysian Grand Prix 2','2014-02-24 00:00:00'),(15,0,'2014-05-25 00:00:00','Candian Grand Prix 1','2014-04-25 00:00:00'),(16,0,'2014-07-24 00:00:00','Candian Grand Prix 2','2014-06-24 00:00:00'),(17,0,'2014-09-22 00:00:00','Candian Grand Prix 3','2014-08-23 00:00:00'),(18,0,'2014-11-21 00:00:00','Indian Grand Prix 1','2014-10-22 00:00:00'),(19,0,'2015-01-20 00:00:00','Indian Grand Prix 2','2014-12-21 00:00:00'),(20,0,'2015-03-21 00:00:00','Indian Grand Prix 3','2015-02-19 00:00:00'),(21,0,'2013-09-27 00:00:00','Australian Grand Prix 1','2013-08-28 00:00:00'),(22,0,'2013-11-26 00:00:00','Australian Grand Prix 2','2013-10-27 00:00:00'),(23,0,'2014-01-25 00:00:00','Malaysian Grand Prix 1','2013-12-26 00:00:00'),(24,0,'2014-03-26 00:00:00','Malaysian Grand Prix 2','2014-02-24 00:00:00'),(25,0,'2014-05-25 00:00:00','Candian Grand Prix 1','2014-04-25 00:00:00'),(26,0,'2014-07-24 00:00:00','Candian Grand Prix 2','2014-06-24 00:00:00'),(27,0,'2014-09-22 00:00:00','Candian Grand Prix 3','2014-08-23 00:00:00'),(28,0,'2014-11-21 00:00:00','Indian Grand Prix 1','2014-10-22 00:00:00'),(29,0,'2015-01-20 00:00:00','Indian Grand Prix 2','2014-12-21 00:00:00'),(30,0,'2015-03-21 00:00:00','Indian Grand Prix 3','2015-02-19 00:00:00'),(31,0,'2013-09-27 00:00:00','Australian Grand Prix 1','2013-08-28 00:00:00'),(32,0,'2013-11-26 00:00:00','Australian Grand Prix 2','2013-10-27 00:00:00'),(33,0,'2014-01-25 00:00:00','Malaysian Grand Prix 1','2013-12-26 00:00:00'),(34,0,'2014-03-26 00:00:00','Malaysian Grand Prix 2','2014-02-24 00:00:00'),(35,0,'2014-05-25 00:00:00','Candian Grand Prix 1','2014-04-25 00:00:00'),(36,0,'2014-07-24 00:00:00','Candian Grand Prix 2','2014-06-24 00:00:00'),(37,0,'2014-09-22 00:00:00','Candian Grand Prix 3','2014-08-23 00:00:00'),(38,0,'2014-11-21 00:00:00','Indian Grand Prix 1','2014-10-22 00:00:00'),(39,0,'2015-01-20 00:00:00','Indian Grand Prix 2','2014-12-21 00:00:00'),(40,0,'2015-03-21 00:00:00','Indian Grand Prix 3','2015-02-19 00:00:00'),(41,0,'2013-09-27 00:00:00','Australian Grand Prix 1','2013-08-28 00:00:00'),(42,0,'2013-11-26 00:00:00','Australian Grand Prix 2','2013-10-27 00:00:00'),(43,0,'2014-01-25 00:00:00','Malaysian Grand Prix 1','2013-12-26 00:00:00'),(44,0,'2014-03-26 00:00:00','Malaysian Grand Prix 2','2014-02-24 00:00:00'),(45,0,'2014-05-25 00:00:00','Candian Grand Prix 1','2014-04-25 00:00:00'),(46,0,'2014-07-24 00:00:00','Candian Grand Prix 2','2014-06-24 00:00:00'),(47,0,'2014-09-22 00:00:00','Candian Grand Prix 3','2014-08-23 00:00:00'),(48,0,'2014-11-21 00:00:00','Indian Grand Prix 1','2014-10-22 00:00:00'),(49,0,'2015-01-20 00:00:00','Indian Grand Prix 2','2014-12-21 00:00:00'),(50,0,'2015-03-21 00:00:00','Indian Grand Prix 3','2015-02-19 00:00:00'),(51,0,'2013-09-27 00:00:00','Australian Grand Prix 1','2013-08-28 00:00:00'),(52,0,'2013-11-26 00:00:00','Australian Grand Prix 2','2013-10-27 00:00:00'),(53,0,'2014-01-25 00:00:00','Malaysian Grand Prix 1','2013-12-26 00:00:00'),(54,0,'2014-03-26 00:00:00','Malaysian Grand Prix 2','2014-02-24 00:00:00'),(55,0,'2014-05-25 00:00:00','Candian Grand Prix 1','2014-04-25 00:00:00'),(56,0,'2014-07-24 00:00:00','Candian Grand Prix 2','2014-06-24 00:00:00'),(57,0,'2014-09-22 00:00:00','Candian Grand Prix 3','2014-08-23 00:00:00'),(58,0,'2014-11-21 00:00:00','Indian Grand Prix 1','2014-10-22 00:00:00'),(59,0,'2015-01-20 00:00:00','Indian Grand Prix 2','2014-12-21 00:00:00'),(60,0,'2015-03-21 00:00:00','Indian Grand Prix 3','2015-02-19 00:00:00'),(61,0,'2013-09-27 00:00:00','Australian Grand Prix 1','2013-08-28 00:00:00'),(62,0,'2013-11-26 00:00:00','Australian Grand Prix 2','2013-10-27 00:00:00'),(63,0,'2014-01-25 00:00:00','Malaysian Grand Prix 1','2013-12-26 00:00:00'),(64,0,'2014-03-26 00:00:00','Malaysian Grand Prix 2','2014-02-24 00:00:00'),(65,0,'2014-05-25 00:00:00','Candian Grand Prix 1','2014-04-25 00:00:00'),(66,0,'2014-07-24 00:00:00','Candian Grand Prix 2','2014-06-24 00:00:00'),(67,0,'2014-09-22 00:00:00','Candian Grand Prix 3','2014-08-23 00:00:00'),(68,0,'2014-11-21 00:00:00','Indian Grand Prix 1','2014-10-22 00:00:00'),(69,0,'2015-01-20 00:00:00','Indian Grand Prix 2','2014-12-21 00:00:00'),(70,0,'2015-03-21 00:00:00','Indian Grand Prix 3','2015-02-19 00:00:00'),(71,0,'2013-09-27 00:00:00','Australian Grand Prix 1','2013-08-28 00:00:00'),(72,0,'2013-11-26 00:00:00','Australian Grand Prix 2','2013-10-27 00:00:00'),(73,0,'2014-01-25 00:00:00','Malaysian Grand Prix 1','2013-12-26 00:00:00'),(74,0,'2014-03-26 00:00:00','Malaysian Grand Prix 2','2014-02-24 00:00:00'),(75,0,'2014-05-25 00:00:00','Candian Grand Prix 1','2014-04-25 00:00:00'),(76,0,'2014-07-24 00:00:00','Candian Grand Prix 2','2014-06-24 00:00:00'),(77,0,'2014-09-22 00:00:00','Candian Grand Prix 3','2014-08-23 00:00:00'),(78,0,'2014-11-21 00:00:00','Indian Grand Prix 1','2014-10-22 00:00:00'),(79,0,'2015-01-20 00:00:00','Indian Grand Prix 2','2014-12-21 00:00:00'),(80,0,'2015-03-21 00:00:00','Indian Grand Prix 3','2015-02-19 00:00:00'),(81,0,'2013-09-27 00:00:00','Australian Grand Prix 1','2013-08-28 00:00:00'),(82,0,'2013-11-26 00:00:00','Australian Grand Prix 2','2013-10-27 00:00:00'),(83,0,'2014-01-25 00:00:00','Malaysian Grand Prix 1','2013-12-26 00:00:00'),(84,0,'2014-03-26 00:00:00','Malaysian Grand Prix 2','2014-02-24 00:00:00'),(85,0,'2014-05-25 00:00:00','Candian Grand Prix 1','2014-04-25 00:00:00'),(86,0,'2014-07-24 00:00:00','Candian Grand Prix 2','2014-06-24 00:00:00'),(87,0,'2014-09-22 00:00:00','Candian Grand Prix 3','2014-08-23 00:00:00'),(88,0,'2014-11-21 00:00:00','Indian Grand Prix 1','2014-10-22 00:00:00'),(89,0,'2015-01-20 00:00:00','Indian Grand Prix 2','2014-12-21 00:00:00'),(90,0,'2015-03-21 00:00:00','Indian Grand Prix 3','2015-02-19 00:00:00'),(91,0,'2013-09-27 00:00:00','Australian Grand Prix 1','2013-08-28 00:00:00'),(92,0,'2013-11-26 00:00:00','Australian Grand Prix 2','2013-10-27 00:00:00'),(93,0,'2014-01-25 00:00:00','Malaysian Grand Prix 1','2013-12-26 00:00:00'),(94,0,'2014-03-26 00:00:00','Malaysian Grand Prix 2','2014-02-24 00:00:00'),(95,0,'2014-05-25 00:00:00','Candian Grand Prix 1','2014-04-25 00:00:00'),(96,0,'2014-07-24 00:00:00','Candian Grand Prix 2','2014-06-24 00:00:00'),(97,0,'2014-09-22 00:00:00','Candian Grand Prix 3','2014-08-23 00:00:00'),(98,0,'2014-11-21 00:00:00','Indian Grand Prix 1','2014-10-22 00:00:00'),(99,0,'2015-01-20 00:00:00','Indian Grand Prix 2','2014-12-21 00:00:00'),(100,0,'2015-03-21 00:00:00','Indian Grand Prix 3','2015-02-19 00:00:00'),(101,0,'2013-09-27 00:00:00','Australian Grand Prix 1','2013-08-28 00:00:00'),(102,0,'2013-11-26 00:00:00','Australian Grand Prix 2','2013-10-27 00:00:00'),(103,0,'2014-01-25 00:00:00','Malaysian Grand Prix 1','2013-12-26 00:00:00'),(104,0,'2014-03-26 00:00:00','Malaysian Grand Prix 2','2014-02-24 00:00:00'),(105,0,'2014-05-25 00:00:00','Candian Grand Prix 1','2014-04-25 00:00:00'),(106,0,'2014-07-24 00:00:00','Candian Grand Prix 2','2014-06-24 00:00:00'),(107,0,'2014-09-22 00:00:00','Candian Grand Prix 3','2014-08-23 00:00:00'),(108,0,'2014-11-21 00:00:00','Indian Grand Prix 1','2014-10-22 00:00:00'),(109,0,'2015-01-20 00:00:00','Indian Grand Prix 2','2014-12-21 00:00:00'),(110,0,'2015-03-21 00:00:00','Indian Grand Prix 3','2015-02-19 00:00:00'),(111,0,'2013-09-27 00:00:00','Australian Grand Prix 1','2013-08-28 00:00:00'),(112,0,'2013-11-26 00:00:00','Australian Grand Prix 2','2013-10-27 00:00:00'),(113,0,'2014-01-25 00:00:00','Malaysian Grand Prix 1','2013-12-26 00:00:00'),(114,0,'2014-03-26 00:00:00','Malaysian Grand Prix 2','2014-02-24 00:00:00'),(115,0,'2014-05-25 00:00:00','Candian Grand Prix 1','2014-04-25 00:00:00'),(116,0,'2014-07-24 00:00:00','Candian Grand Prix 2','2014-06-24 00:00:00'),(117,0,'2014-09-22 00:00:00','Candian Grand Prix 3','2014-08-23 00:00:00'),(118,0,'2014-11-21 00:00:00','Indian Grand Prix 1','2014-10-22 00:00:00'),(119,0,'2015-01-20 00:00:00','Indian Grand Prix 2','2014-12-21 00:00:00'),(120,0,'2015-03-21 00:00:00','Indian Grand Prix 3','2015-02-19 00:00:00'),(121,0,'2013-09-27 00:00:00','Australian Grand Prix 1','2013-08-28 00:00:00'),(122,0,'2013-11-26 00:00:00','Australian Grand Prix 2','2013-10-27 00:00:00'),(123,0,'2014-01-25 00:00:00','Malaysian Grand Prix 1','2013-12-26 00:00:00'),(124,0,'2014-03-26 00:00:00','Malaysian Grand Prix 2','2014-02-24 00:00:00'),(125,0,'2014-05-25 00:00:00','Candian Grand Prix 1','2014-04-25 00:00:00'),(126,0,'2014-07-24 00:00:00','Candian Grand Prix 2','2014-06-24 00:00:00'),(127,0,'2014-09-22 00:00:00','Candian Grand Prix 3','2014-08-23 00:00:00'),(128,0,'2014-11-21 00:00:00','Indian Grand Prix 1','2014-10-22 00:00:00'),(129,0,'2015-01-20 00:00:00','Indian Grand Prix 2','2014-12-21 00:00:00'),(130,0,'2015-03-21 00:00:00','Indian Grand Prix 3','2015-02-19 00:00:00'),(131,0,'2013-09-27 00:00:00','Australian Grand Prix 1','2013-08-28 00:00:00'),(132,0,'2013-11-26 00:00:00','Australian Grand Prix 2','2013-10-27 00:00:00'),(133,0,'2014-01-25 00:00:00','Malaysian Grand Prix 1','2013-12-26 00:00:00'),(134,0,'2014-03-26 00:00:00','Malaysian Grand Prix 2','2014-02-24 00:00:00'),(135,0,'2014-05-25 00:00:00','Candian Grand Prix 1','2014-04-25 00:00:00'),(136,0,'2014-07-24 00:00:00','Candian Grand Prix 2','2014-06-24 00:00:00'),(137,0,'2014-09-22 00:00:00','Candian Grand Prix 3','2014-08-23 00:00:00'),(138,0,'2014-11-21 00:00:00','Indian Grand Prix 1','2014-10-22 00:00:00'),(139,0,'2015-01-20 00:00:00','Indian Grand Prix 2','2014-12-21 00:00:00'),(140,0,'2015-03-21 00:00:00','Indian Grand Prix 3','2015-02-19 00:00:00'),(141,0,'2013-09-27 00:00:00','Australian Grand Prix 1','2013-08-28 00:00:00'),(142,0,'2013-11-26 00:00:00','Australian Grand Prix 2','2013-10-27 00:00:00'),(143,0,'2014-01-25 00:00:00','Malaysian Grand Prix 1','2013-12-26 00:00:00'),(144,0,'2014-03-26 00:00:00','Malaysian Grand Prix 2','2014-02-24 00:00:00'),(145,0,'2014-05-25 00:00:00','Candian Grand Prix 1','2014-04-25 00:00:00'),(146,0,'2014-07-24 00:00:00','Candian Grand Prix 2','2014-06-24 00:00:00'),(147,0,'2014-09-22 00:00:00','Candian Grand Prix 3','2014-08-23 00:00:00'),(148,0,'2014-11-21 00:00:00','Indian Grand Prix 1','2014-10-22 00:00:00'),(149,0,'2015-01-20 00:00:00','Indian Grand Prix 2','2014-12-21 00:00:00'),(150,0,'2015-03-21 00:00:00','Indian Grand Prix 3','2015-02-19 00:00:00'),(151,0,'2013-09-27 00:00:00','Australian Grand Prix 1','2013-08-28 00:00:00'),(152,0,'2013-11-26 00:00:00','Australian Grand Prix 2','2013-10-27 00:00:00'),(153,0,'2014-01-25 00:00:00','Malaysian Grand Prix 1','2013-12-26 00:00:00'),(154,0,'2014-03-26 00:00:00','Malaysian Grand Prix 2','2014-02-24 00:00:00'),(155,0,'2014-05-25 00:00:00','Candian Grand Prix 1','2014-04-25 00:00:00'),(156,0,'2014-07-24 00:00:00','Candian Grand Prix 2','2014-06-24 00:00:00'),(157,0,'2014-09-22 00:00:00','Candian Grand Prix 3','2014-08-23 00:00:00'),(158,0,'2014-11-21 00:00:00','Indian Grand Prix 1','2014-10-22 00:00:00'),(159,0,'2015-01-20 00:00:00','Indian Grand Prix 2','2014-12-21 00:00:00'),(160,0,'2015-03-21 00:00:00','Indian Grand Prix 3','2015-02-19 00:00:00'),(161,0,'2013-09-27 00:00:00','Australian Grand Prix 1','2013-08-28 00:00:00'),(162,0,'2013-11-26 00:00:00','Australian Grand Prix 2','2013-10-27 00:00:00'),(163,0,'2014-01-25 00:00:00','Malaysian Grand Prix 1','2013-12-26 00:00:00'),(164,0,'2014-03-26 00:00:00','Malaysian Grand Prix 2','2014-02-24 00:00:00'),(165,0,'2014-05-25 00:00:00','Candian Grand Prix 1','2014-04-25 00:00:00'),(166,0,'2014-07-24 00:00:00','Candian Grand Prix 2','2014-06-24 00:00:00'),(167,0,'2014-09-22 00:00:00','Candian Grand Prix 3','2014-08-23 00:00:00'),(168,0,'2014-11-21 00:00:00','Indian Grand Prix 1','2014-10-22 00:00:00'),(169,0,'2015-01-20 00:00:00','Indian Grand Prix 2','2014-12-21 00:00:00'),(170,0,'2015-03-21 00:00:00','Indian Grand Prix 3','2015-02-19 00:00:00'),(171,0,'2013-09-27 00:00:00','Australian Grand Prix 1','2013-08-28 00:00:00'),(172,0,'2013-11-26 00:00:00','Australian Grand Prix 2','2013-10-27 00:00:00'),(173,0,'2014-01-25 00:00:00','Malaysian Grand Prix 1','2013-12-26 00:00:00'),(174,0,'2014-03-26 00:00:00','Malaysian Grand Prix 2','2014-02-24 00:00:00'),(175,0,'2014-05-25 00:00:00','Candian Grand Prix 1','2014-04-25 00:00:00'),(176,0,'2014-07-24 00:00:00','Candian Grand Prix 2','2014-06-24 00:00:00'),(177,0,'2014-09-22 00:00:00','Candian Grand Prix 3','2014-08-23 00:00:00'),(178,0,'2014-11-21 00:00:00','Indian Grand Prix 1','2014-10-22 00:00:00'),(179,0,'2015-01-20 00:00:00','Indian Grand Prix 2','2014-12-21 00:00:00'),(180,0,'2015-03-21 00:00:00','Indian Grand Prix 3','2015-02-19 00:00:00'),(181,0,'2013-09-27 00:00:00','Australian Grand Prix 1','2013-08-28 00:00:00'),(182,0,'2013-11-26 00:00:00','Australian Grand Prix 2','2013-10-27 00:00:00'),(183,0,'2014-01-25 00:00:00','Malaysian Grand Prix 1','2013-12-26 00:00:00'),(184,0,'2014-03-26 00:00:00','Malaysian Grand Prix 2','2014-02-24 00:00:00'),(185,0,'2014-05-25 00:00:00','Candian Grand Prix 1','2014-04-25 00:00:00'),(186,0,'2014-07-24 00:00:00','Candian Grand Prix 2','2014-06-24 00:00:00'),(187,0,'2014-09-22 00:00:00','Candian Grand Prix 3','2014-08-23 00:00:00'),(188,0,'2014-11-21 00:00:00','Indian Grand Prix 1','2014-10-22 00:00:00'),(189,0,'2015-01-20 00:00:00','Indian Grand Prix 2','2014-12-21 00:00:00'),(190,0,'2015-03-21 00:00:00','Indian Grand Prix 3','2015-02-19 00:00:00'),(191,0,'2013-09-28 00:00:00','Australian Grand Prix 1','2013-08-29 00:00:00'),(192,0,'2013-11-27 00:00:00','Australian Grand Prix 2','2013-10-28 00:00:00'),(193,0,'2014-01-26 00:00:00','Malaysian Grand Prix 1','2013-12-27 00:00:00'),(194,0,'2014-03-27 00:00:00','Malaysian Grand Prix 2','2014-02-25 00:00:00'),(195,0,'2014-05-26 00:00:00','Candian Grand Prix 1','2014-04-26 00:00:00'),(196,0,'2014-07-25 00:00:00','Candian Grand Prix 2','2014-06-25 00:00:00'),(197,0,'2014-09-23 00:00:00','Candian Grand Prix 3','2014-08-24 00:00:00'),(198,0,'2014-11-22 00:00:00','Indian Grand Prix 1','2014-10-23 00:00:00'),(199,0,'2015-01-21 00:00:00','Indian Grand Prix 2','2014-12-22 00:00:00'),(200,0,'2015-03-22 00:00:00','Indian Grand Prix 3','2015-02-20 00:00:00'),(201,0,'2013-09-28 00:00:00','Australian Grand Prix 1','2013-08-29 00:00:00'),(202,0,'2013-11-27 00:00:00','Australian Grand Prix 2','2013-10-28 00:00:00'),(203,0,'2014-01-26 00:00:00','Malaysian Grand Prix 1','2013-12-27 00:00:00'),(204,0,'2014-03-27 00:00:00','Malaysian Grand Prix 2','2014-02-25 00:00:00'),(205,0,'2014-05-26 00:00:00','Candian Grand Prix 1','2014-04-26 00:00:00'),(206,0,'2014-07-25 00:00:00','Candian Grand Prix 2','2014-06-25 00:00:00'),(207,0,'2014-09-23 00:00:00','Candian Grand Prix 3','2014-08-24 00:00:00'),(208,0,'2014-11-22 00:00:00','Indian Grand Prix 1','2014-10-23 00:00:00'),(209,0,'2015-01-21 00:00:00','Indian Grand Prix 2','2014-12-22 00:00:00'),(210,0,'2015-03-22 00:00:00','Indian Grand Prix 3','2015-02-20 00:00:00'),(211,0,'2013-09-28 00:00:00','Australian Grand Prix 1','2013-08-29 00:00:00'),(212,0,'2013-11-27 00:00:00','Australian Grand Prix 2','2013-10-28 00:00:00'),(213,0,'2014-01-26 00:00:00','Malaysian Grand Prix 1','2013-12-27 00:00:00'),(214,0,'2014-03-27 00:00:00','Malaysian Grand Prix 2','2014-02-25 00:00:00'),(215,0,'2014-05-26 00:00:00','Candian Grand Prix 1','2014-04-26 00:00:00'),(216,0,'2014-07-25 00:00:00','Candian Grand Prix 2','2014-06-25 00:00:00'),(217,0,'2014-09-23 00:00:00','Candian Grand Prix 3','2014-08-24 00:00:00'),(218,0,'2014-11-22 00:00:00','Indian Grand Prix 1','2014-10-23 00:00:00'),(219,0,'2015-01-21 00:00:00','Indian Grand Prix 2','2014-12-22 00:00:00'),(220,0,'2015-03-22 00:00:00','Indian Grand Prix 3','2015-02-20 00:00:00'),(221,0,'2013-09-28 00:00:00','Australian Grand Prix 1','2013-08-29 00:00:00'),(222,0,'2013-11-27 00:00:00','Australian Grand Prix 2','2013-10-28 00:00:00'),(223,0,'2014-01-26 00:00:00','Malaysian Grand Prix 1','2013-12-27 00:00:00'),(224,0,'2014-03-27 00:00:00','Malaysian Grand Prix 2','2014-02-25 00:00:00'),(225,0,'2014-05-26 00:00:00','Candian Grand Prix 1','2014-04-26 00:00:00'),(226,0,'2014-07-25 00:00:00','Candian Grand Prix 2','2014-06-25 00:00:00'),(227,0,'2014-09-23 00:00:00','Candian Grand Prix 3','2014-08-24 00:00:00'),(228,0,'2014-11-22 00:00:00','Indian Grand Prix 1','2014-10-23 00:00:00'),(229,0,'2015-01-21 00:00:00','Indian Grand Prix 2','2014-12-22 00:00:00'),(230,0,'2015-03-22 00:00:00','Indian Grand Prix 3','2015-02-20 00:00:00'),(231,0,'2013-09-28 00:00:00','Australian Grand Prix 1','2013-08-29 00:00:00'),(232,0,'2013-11-27 00:00:00','Australian Grand Prix 2','2013-10-28 00:00:00'),(233,0,'2014-01-26 00:00:00','Malaysian Grand Prix 1','2013-12-27 00:00:00'),(234,0,'2014-03-27 00:00:00','Malaysian Grand Prix 2','2014-02-25 00:00:00'),(235,0,'2014-05-26 00:00:00','Candian Grand Prix 1','2014-04-26 00:00:00'),(236,0,'2014-07-25 00:00:00','Candian Grand Prix 2','2014-06-25 00:00:00'),(237,0,'2014-09-23 00:00:00','Candian Grand Prix 3','2014-08-24 00:00:00'),(238,0,'2014-11-22 00:00:00','Indian Grand Prix 1','2014-10-23 00:00:00'),(239,0,'2015-01-21 00:00:00','Indian Grand Prix 2','2014-12-22 00:00:00'),(240,0,'2015-03-22 00:00:00','Indian Grand Prix 3','2015-02-20 00:00:00'),(241,0,'2013-09-28 00:00:00','Australian Grand Prix 1','2013-08-29 00:00:00'),(242,0,'2013-11-27 00:00:00','Australian Grand Prix 2','2013-10-28 00:00:00'),(243,0,'2014-01-26 00:00:00','Malaysian Grand Prix 1','2013-12-27 00:00:00'),(244,0,'2014-03-27 00:00:00','Malaysian Grand Prix 2','2014-02-25 00:00:00'),(245,0,'2014-05-26 00:00:00','Candian Grand Prix 1','2014-04-26 00:00:00'),(246,0,'2014-07-25 00:00:00','Candian Grand Prix 2','2014-06-25 00:00:00'),(247,0,'2014-09-23 00:00:00','Candian Grand Prix 3','2014-08-24 00:00:00'),(248,0,'2014-11-22 00:00:00','Indian Grand Prix 1','2014-10-23 00:00:00'),(249,0,'2015-01-21 00:00:00','Indian Grand Prix 2','2014-12-22 00:00:00'),(250,0,'2015-03-22 00:00:00','Indian Grand Prix 3','2015-02-20 00:00:00');

/*Table structure for table `race` */

DROP TABLE IF EXISTS `race`;

CREATE TABLE `race` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `city` varchar(255) NOT NULL,
  `cost` decimal(5,2) NOT NULL,
  `distance` decimal(19,2) NOT NULL,
  `max_runners` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `start_date` datetime NOT NULL,
  `state` varchar(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `race` */

/*Table structure for table `registration` */

DROP TABLE IF EXISTS `registration`;

CREATE TABLE `registration` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `race_id` bigint(20) NOT NULL,
  `runner_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKAF83E8B91E08232E` (`runner_id`),
  KEY `FKAF83E8B92866C08E` (`race_id`),
  CONSTRAINT `FKAF83E8B91E08232E` FOREIGN KEY (`runner_id`) REFERENCES `runner` (`id`),
  CONSTRAINT `FKAF83E8B92866C08E` FOREIGN KEY (`race_id`) REFERENCES `race` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `registration` */

/*Table structure for table `runner` */

DROP TABLE IF EXISTS `runner`;

CREATE TABLE `runner` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_of_birth` datetime NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `gender` varchar(1) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `last_updated` datetime NOT NULL,
  `state` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `first_name` (`first_name`),
  KEY `FKC92CDF301FCA71F6` (`user_id`),
  CONSTRAINT `FKC92CDF301FCA71F6` FOREIGN KEY (`user_id`) REFERENCES `shiro_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `runner` */

/*Table structure for table `runner_service` */

DROP TABLE IF EXISTS `runner_service`;

CREATE TABLE `runner_service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `runner_service` */

/*Table structure for table `shiro_role` */

DROP TABLE IF EXISTS `shiro_role`;

CREATE TABLE `shiro_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `shiro_role` */

insert  into `shiro_role`(`id`,`version`,`name`) values (1,1,'Administrator');

/*Table structure for table `shiro_role_permissions` */

DROP TABLE IF EXISTS `shiro_role_permissions`;

CREATE TABLE `shiro_role_permissions` (
  `shiro_role_id` bigint(20) DEFAULT NULL,
  `permissions_string` varchar(255) DEFAULT NULL,
  KEY `FK389B46C9706441C8` (`shiro_role_id`),
  CONSTRAINT `FK389B46C9706441C8` FOREIGN KEY (`shiro_role_id`) REFERENCES `shiro_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `shiro_role_permissions` */

insert  into `shiro_role_permissions`(`shiro_role_id`,`permissions_string`) values (1,'*:*');

/*Table structure for table `shiro_role_users` */

DROP TABLE IF EXISTS `shiro_role_users`;

CREATE TABLE `shiro_role_users` (
  `shiro_user_id` bigint(20) NOT NULL,
  `shiro_role_id` bigint(20) NOT NULL,
  KEY `FKB3D7380D158F05A8` (`shiro_user_id`),
  KEY `FKB3D7380D706441C8` (`shiro_role_id`),
  CONSTRAINT `FKB3D7380D158F05A8` FOREIGN KEY (`shiro_user_id`) REFERENCES `shiro_user` (`id`),
  CONSTRAINT `FKB3D7380D706441C8` FOREIGN KEY (`shiro_role_id`) REFERENCES `shiro_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `shiro_role_users` */

/*Table structure for table `shiro_user` */

DROP TABLE IF EXISTS `shiro_user`;

CREATE TABLE `shiro_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `shiro_user` */

insert  into `shiro_user`(`id`,`version`,`password_hash`,`username`) values (1,0,'c0e21a8ff85153deac82fe7f09c0da1b3bd90ac0ae204e78d7148753b4363c03','admin');

/*Table structure for table `shiro_user_permissions` */

DROP TABLE IF EXISTS `shiro_user_permissions`;

CREATE TABLE `shiro_user_permissions` (
  `shiro_user_id` bigint(20) DEFAULT NULL,
  `permissions_string` varchar(255) DEFAULT NULL,
  KEY `FK34555A9E158F05A8` (`shiro_user_id`),
  CONSTRAINT `FK34555A9E158F05A8` FOREIGN KEY (`shiro_user_id`) REFERENCES `shiro_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `shiro_user_permissions` */

/*Table structure for table `shiro_user_roles` */

DROP TABLE IF EXISTS `shiro_user_roles`;

CREATE TABLE `shiro_user_roles` (
  `shiro_role_id` bigint(20) NOT NULL,
  `shiro_user_id` bigint(20) NOT NULL,
  KEY `FKBA221057158F05A8` (`shiro_user_id`),
  KEY `FKBA221057706441C8` (`shiro_role_id`),
  CONSTRAINT `FKBA221057158F05A8` FOREIGN KEY (`shiro_user_id`) REFERENCES `shiro_user` (`id`),
  CONSTRAINT `FKBA221057706441C8` FOREIGN KEY (`shiro_role_id`) REFERENCES `shiro_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `shiro_user_roles` */

insert  into `shiro_user_roles`(`shiro_role_id`,`shiro_user_id`) values (1,1);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
