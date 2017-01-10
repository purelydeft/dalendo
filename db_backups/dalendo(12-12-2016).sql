/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 10.1.18-MariaDB : Database - dalendo_development
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`dalendo_development` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `dalendo_development`;

/*Table structure for table `ar_internal_metadata` */

DROP TABLE IF EXISTS `ar_internal_metadata`;

CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ar_internal_metadata` */

insert  into `ar_internal_metadata`(`key`,`value`,`created_at`,`updated_at`) values ('environment','development','2016-12-08 13:05:53','2016-12-08 13:05:53');

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `category_description` varchar(255) DEFAULT NULL,
  `category_icon` varchar(255) DEFAULT NULL,
  `category_image` varchar(255) DEFAULT NULL,
  `category_status` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `categories` */

insert  into `categories`(`id`,`category_name`,`category_description`,`category_icon`,`category_image`,`category_status`,`created_at`,`updated_at`) values (1,'Women Entrepreneuship','For women','','5f1e0100f08e_group_bootle.png','inactive','2016-12-09 16:04:40','2016-12-12 15:26:24'),(2,'Craft & Businessssss','For Craftsssssss','','220a3134b056_a4f557d97baefd3c199fc0b3a58748c2.png','active','2016-12-09 16:05:25','2016-12-12 16:57:28'),(3,'Agriculture','For Agriculture','icon-003','','active','2016-12-09 16:06:41','2016-12-09 16:06:41');

/*Table structure for table `schema_migrations` */

DROP TABLE IF EXISTS `schema_migrations`;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `schema_migrations` */

insert  into `schema_migrations`(`version`) values ('20161208140145'),('20161209075652'),('20161209103225'),('20161209115300'),('20161209122147'),('20161209122710');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` text,
  `last_name` text,
  `user_name` text,
  `email` text,
  `password` text,
  `address` text,
  `country` text,
  `state` text,
  `city` text,
  `register_ip` text,
  `last_login_ip` text,
  `login_type` text,
  `facebook_id` text,
  `google_id` text,
  `linkedin_id` text,
  `twitter_id` text,
  `user_role` text,
  `user_status` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_image` varchar(255) DEFAULT NULL,
  `phone_number` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`first_name`,`last_name`,`user_name`,`email`,`password`,`address`,`country`,`state`,`city`,`register_ip`,`last_login_ip`,`login_type`,`facebook_id`,`google_id`,`linkedin_id`,`twitter_id`,`user_role`,`user_status`,`created_at`,`updated_at`,`user_image`,`phone_number`) values (1,'Jitender','Anand','jitender_anand',NULL,NULL,'kullu','India','Himachal Pradesh',NULL,NULL,NULL,NULL,'http://www.facebook.com',NULL,'http://www.linkedin.com','http://www.twitter.com','user','active','2016-12-09 19:09:39','2016-12-09 19:09:39','10499f706d46_Koala.jpg','9988459673'),(2,'Michael','Admin','admin@gmail.com',NULL,NULL,'chandigarh','France','Paris',NULL,NULL,NULL,NULL,'fb_admin',NULL,'linkedin_admin','twitter_admin','admin','active','2016-12-09 19:15:55','2016-12-09 19:15:55','5d8c6ebf7b51_user.png','9999999999'),(3,'test','test','test_test','test@gmail.com',NULL,'test','test','test',NULL,NULL,NULL,NULL,'adadsd',NULL,'asdasdasd','asdasdasd','user','active','2016-12-09 20:18:11','2016-12-09 20:18:11','a15f12a3641d_accout-management-profile.jpg','9856458762'),(4,'jitu','anna','jitu_anna','asdasdasd@gmail.com',NULL,'#2519, sector 22c, chandigarh','india','punjab',NULL,NULL,NULL,NULL,'facebook',NULL,'linkedin','twitter','user','active','2016-12-12 11:47:25','2016-12-12 11:47:25','db49f8eac539_Hydrangeas.jpg','9988459673'),(7,'helo','','dsfsd','sdfsd@gmail.com',NULL,'adad','asdasd','adasd',NULL,NULL,NULL,NULL,'adasd',NULL,'adasd','adasd','adasd','active','2016-12-12 13:53:54','2016-12-12 13:53:54','1f7111eded31_listing-badges-1.png','544845464954544');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
