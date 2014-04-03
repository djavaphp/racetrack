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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

/*Data for the table `fixtures` */

insert  into `fixtures`(`id`,`version`,`end_date`,`fixture_title`,`start_date`) values (1,0,'2013-07-20 00:00:00','Australian Grand Prix 1','2013-06-20 00:00:00'),(2,0,'2013-09-18 00:00:00','Australian Grand Prix 2','2013-08-19 00:00:00'),(3,0,'2013-11-17 00:00:00','Malaysian Grand Prix 1','2013-10-18 00:00:00'),(4,0,'2014-01-16 00:00:00','Malaysian Grand Prix 2','2013-12-17 00:00:00'),(5,0,'2014-03-17 00:00:00','Candian Grand Prix 1','2014-02-15 00:00:00'),(6,0,'2014-05-16 00:00:00','Candian Grand Prix 2','2014-04-16 00:00:00'),(7,0,'2014-07-15 00:00:00','Candian Grand Prix 3','2014-06-15 00:00:00'),(8,0,'2014-09-13 00:00:00','Indian Grand Prix 1','2014-08-14 00:00:00'),(9,0,'2014-11-12 00:00:00','Indian Grand Prix 2','2014-10-13 00:00:00'),(10,0,'2015-01-11 00:00:00','Indian Grand Prix 3','2014-12-12 00:00:00');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `race` */

insert  into `race`(`id`,`version`,`city`,`cost`,`distance`,`max_runners`,`name`,`start_date`,`state`) values (4,1,'Germany','45.00','67.00',100000,'Grand Prix 2','2013-08-20 00:00:00','GA'),(5,1,'Russia','56.00','23.00',100000,'Grand Prix 3','2013-08-20 00:00:00','DF'),(6,1,'Abu Dhabi','34.00','67.00',100000,'Grand Prix 5','2013-08-20 00:00:00','SC'),(7,1,'Canada','34.00','56.00',100000,'Grand Prix 1','2013-07-20 00:00:00','SC'),(8,1,'USA','67.00','56.00',100000,'Grand Prix 6','2013-10-28 00:00:00','SA'),(9,1,'Banglore','34.00','67.00',100000,'Grand Prix 7','2014-06-20 00:00:00','SA'),(10,0,'Sydney','33.00','3333.00',100000,'Australian Grand Prix','2021-06-20 00:00:00','SA'),(11,0,'Ahmedabad','30.00','123.00',100000,'Prix 1','2013-08-20 00:00:00','SA'),(12,0,'ny','50.00','550.00',100000,'mobileptix','2013-06-23 00:00:00','DF');

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
  CONSTRAINT `FKAF83E8B92866C08E` FOREIGN KEY (`race_id`) REFERENCES `race` (`id`),
  CONSTRAINT `FKAF83E8B91E08232E` FOREIGN KEY (`runner_id`) REFERENCES `runner` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `registration` */

insert  into `registration`(`id`,`version`,`race_id`,`runner_id`) values (5,2,10,5),(7,0,6,3),(8,1,7,7),(9,0,6,2),(10,0,7,4),(11,0,6,2);

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `runner` */

insert  into `runner`(`id`,`version`,`address`,`city`,`date_created`,`date_of_birth`,`email`,`first_name`,`gender`,`last_name`,`last_updated`,`state`,`zipcode`) values (2,2,'asdas','ahmedabad','2013-06-20 14:51:47','1994-06-20 00:00:00','abcd@gmail.com','Jolly','M','Shah','2013-06-20 15:46:40','gujarat','360007'),(3,0,'asdas','Ahmedabad','2013-06-20 14:52:17','1993-06-20 00:00:00','jini.juju@yahoomail.com','Jinnie','F','Shah','2013-06-20 14:52:17','gujarat','360085'),(4,0,'C.G.rd','ahmedabad','2013-06-20 14:52:50','1975-06-20 00:00:00','ghshah@gmail.com','Jack','M','Shah','2013-06-20 14:52:50','gujarat','360007'),(5,0,'kalawad rd','Baroda','2013-06-20 14:53:29','1985-06-20 00:00:00','abcd@gmail.com','Jenny','F','Shah','2013-06-20 14:53:29','gujarat','360007'),(6,0,'asdas','ahmedabad','2013-06-20 14:54:07','2004-06-28 00:00:00','abcd@gmail.com','Joy','M','Shah','2013-06-20 14:54:07','gujarat','360007'),(7,0,'asdas','ahmedabad','2013-06-20 14:55:23','1994-01-05 00:00:00','abcd@gmail.com','Steve','M','Mehta','2013-06-20 14:55:23','gujarat','360007');

/*Table structure for table `shiro_role` */

DROP TABLE IF EXISTS `shiro_role`;

CREATE TABLE `shiro_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `shiro_role` */

/*Table structure for table `shiro_role_permissions` */

DROP TABLE IF EXISTS `shiro_role_permissions`;

CREATE TABLE `shiro_role_permissions` (
  `shiro_role_id` bigint(20) DEFAULT NULL,
  `permissions_string` varchar(255) DEFAULT NULL,
  KEY `FK389B46C98BA4B1D` (`shiro_role_id`),
  CONSTRAINT `FK389B46C98BA4B1D` FOREIGN KEY (`shiro_role_id`) REFERENCES `shiro_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `shiro_role_permissions` */

/*Table structure for table `shiro_user` */

DROP TABLE IF EXISTS `shiro_user`;

CREATE TABLE `shiro_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `shiro_user` */

/*Table structure for table `shiro_user_permissions` */

DROP TABLE IF EXISTS `shiro_user_permissions`;

CREATE TABLE `shiro_user_permissions` (
  `shiro_user_id` bigint(20) DEFAULT NULL,
  `permissions_string` varchar(255) DEFAULT NULL,
  KEY `FK34555A9EADE50EFD` (`shiro_user_id`),
  CONSTRAINT `FK34555A9EADE50EFD` FOREIGN KEY (`shiro_user_id`) REFERENCES `shiro_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `shiro_user_permissions` */

/*Table structure for table `shiro_user_roles` */

DROP TABLE IF EXISTS `shiro_user_roles`;

CREATE TABLE `shiro_user_roles` (
  `shiro_user_id` bigint(20) NOT NULL,
  `shiro_role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`shiro_user_id`,`shiro_role_id`),
  KEY `FKBA221057ADE50EFD` (`shiro_user_id`),
  KEY `FKBA2210578BA4B1D` (`shiro_role_id`),
  CONSTRAINT `FKBA2210578BA4B1D` FOREIGN KEY (`shiro_role_id`) REFERENCES `shiro_role` (`id`),
  CONSTRAINT `FKBA221057ADE50EFD` FOREIGN KEY (`shiro_user_id`) REFERENCES `shiro_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `shiro_user_roles` */

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id`,`version`,`login`,`password`,`role`) values (1,0,'admin','wordpass','admin'),(2,0,'jdoe','password','user');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
