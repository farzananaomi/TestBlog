/*
SQLyog Ultimate
MySQL - 5.7.11 : Database - d5a5a
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`d5a5a` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `d5a5a`;

/*Table structure for table `comments` */

DROP TABLE IF EXISTS `comments`;

CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `story_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `is_delete` tinyint(4) DEFAULT '0',
  `update_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `comments` */

insert  into `comments`(`id`,`story_id`,`user_id`,`comment`,`is_delete`,`update_by`,`created_at`,`updated_at`) values (14,24,1,'comment for test api',0,1,'2016-10-28 21:51:45','2016-10-28 21:51:45');
insert  into `comments`(`id`,`story_id`,`user_id`,`comment`,`is_delete`,`update_by`,`created_at`,`updated_at`) values (2,17,1,'test comment',0,1,'2016-10-26 04:02:15','2016-10-26 04:02:15');
insert  into `comments`(`id`,`story_id`,`user_id`,`comment`,`is_delete`,`update_by`,`created_at`,`updated_at`) values (3,17,2,'test comment test comment',1,1,'2016-10-26 04:02:15','2016-10-26 04:02:15');
insert  into `comments`(`id`,`story_id`,`user_id`,`comment`,`is_delete`,`update_by`,`created_at`,`updated_at`) values (4,17,3,'test comment test comment test comment',0,1,'2016-10-26 04:02:15','2016-10-24 18:29:25');
insert  into `comments`(`id`,`story_id`,`user_id`,`comment`,`is_delete`,`update_by`,`created_at`,`updated_at`) values (13,1,4,'grt',0,4,'2016-10-28 20:42:57','2016-10-28 20:42:57');
insert  into `comments`(`id`,`story_id`,`user_id`,`comment`,`is_delete`,`update_by`,`created_at`,`updated_at`) values (12,17,4,'awesome',0,4,'2016-10-28 20:42:52','2016-10-28 20:42:52');
insert  into `comments`(`id`,`story_id`,`user_id`,`comment`,`is_delete`,`update_by`,`created_at`,`updated_at`) values (11,18,4,'wow',0,4,'2016-10-28 20:42:41','2016-10-28 20:42:41');
insert  into `comments`(`id`,`story_id`,`user_id`,`comment`,`is_delete`,`update_by`,`created_at`,`updated_at`) values (10,19,4,'test',0,4,'2016-10-28 20:42:36','2016-10-28 20:42:36');
insert  into `comments`(`id`,`story_id`,`user_id`,`comment`,`is_delete`,`update_by`,`created_at`,`updated_at`) values (15,25,1,'comment for test api',0,1,'2016-10-28 23:43:56','2016-10-28 23:43:56');

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (16,'2014_10_12_000000_create_users_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (17,'2014_10_12_100000_create_password_resets_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (18,'2016_10_23_181322_create_story',1);

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `password_resets` */

insert  into `password_resets`(`email`,`token`,`created_at`) values ('farzananaomi@gmail.com','0927e3021319044638134df0d6fc54e45fb46bfe998469a1669e2beed62b55bb','2016-10-26 18:05:23');

/*Table structure for table `sections` */

DROP TABLE IF EXISTS `sections`;

CREATE TABLE `sections` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `section_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `sections` */

insert  into `sections`(`id`,`section_name`) values (1,'Literature');
insert  into `sections`(`id`,`section_name`) values (2,'Technology');
insert  into `sections`(`id`,`section_name`) values (3,'Health & Fitness');
insert  into `sections`(`id`,`section_name`) values (4,'History');
insert  into `sections`(`id`,`section_name`) values (5,'other');

/*Table structure for table `sessions` */

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8_unicode_ci,
  `payload` text COLLATE utf8_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `sessions` */

insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values ('d259670b78d2a34550c4605ba63d9201be97124b',2,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','YTo2OntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiUDg3dlU4SlVEaGtuTlpsRmJHa01IQ3BOYWdKSnQybzVoemJaMVllNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbiI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7czoyMjoiUEhQREVCVUdCQVJfU1RBQ0tfREFUQSI7YTowOnt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0Nzc3MTY5NDI7czoxOiJjIjtpOjE0Nzc3MTU5ODg7czoxOiJsIjtzOjE6IjAiO319',1477716942);
insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values ('6412f2c584820b0563f64bd5f45a0b5413b53eb9',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; WOW64; rv:49.0) Gecko/20100101 Firefox/49.0','YTo1OntzOjY6Il90b2tlbiI7czo0MDoidmlHcDhVZVI4U2R4MUoxUEpjaTdoN1ZnOUR1dGNhaFRGSElid3JkZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6MjI6IlBIUERFQlVHQkFSX1NUQUNLX0RBVEEiO2E6MDp7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6OToiX3NmMl9tZXRhIjthOjM6e3M6MToidSI7aToxNDc3NzE3Mzk5O3M6MToiYyI7aToxNDc3NzE2NzEyO3M6MToibCI7czoxOiIwIjt9fQ==',1477717399);
insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values ('57e34b50915c113c66a6d0e7ba530effa8183991',1,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','YTo3OntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiQXVWcVhNUjRwcFhiTlR1M0NSUThNVWJVZWJZcEFNZ0hxcmFJNnNrViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6OTkvcHJvZmlsZSI7fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjI6IlBIUERFQlVHQkFSX1NUQUNLX0RBVEEiO2E6MDp7fXM6OToiX3NmMl9tZXRhIjthOjM6e3M6MToidSI7aToxNDc3NzEwNTc2O3M6MToiYyI7aToxNDc3NjY4NTE5O3M6MToibCI7czoxOiIwIjt9fQ==',1477710576);
insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values ('a84761ab4872e12193345d6ecbbb15825a6e1a6d',1,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','YTo2OntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiZndNVEdkaHFEd3c0SVVCc1J1emNGNmNGUTRTcmdPWk5aV3Q3UlZGVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6OTkvcHJvZmlsZSI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoyMjoiUEhQREVCVUdCQVJfU1RBQ0tfREFUQSI7YTowOnt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0Nzc3MTA2OTQ7czoxOiJjIjtpOjE0Nzc2Njg1MTk7czoxOiJsIjtzOjE6IjAiO319',1477710694);
insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values ('ed2de182e6d6a7dcd5abd6d84cbe9948132f6a77',1,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','YTo3OntzOjY6Il90b2tlbiI7czo0MDoiMWxlcG94ZFhLU3JybEFCR2VBMm9xYjdDRGx1NlBjV1NNQ1UyOVlKZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9wcm9maWxlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoyMjoiUEhQREVCVUdCQVJfU1RBQ0tfREFUQSI7YTowOnt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0Nzc3MTYwMTg7czoxOiJjIjtpOjE0Nzc3MTU5ODg7czoxOiJsIjtzOjE6IjAiO319',1477716018);
insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values ('34cacd90edf82b5ce36044acdd3ef4a528cddb09',1,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','YTo3OntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiZG5IMDFxM3lyTnEzSnpEa0pmWjBZOG9CQzMzaU9XS0ZacDVYdzNMNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9wcm9maWxlIjt9czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoyMjoiUEhQREVCVUdCQVJfU1RBQ0tfREFUQSI7YTowOnt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0Nzc3MTYxODc7czoxOiJjIjtpOjE0Nzc3MTU5ODg7czoxOiJsIjtzOjE6IjAiO319',1477716187);
insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values ('e37ea3468ab576ac2da618161b5781486b9bcaa0',1,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','YTo2OntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiN0JWYXFibVp5eXJLRTlDeU83ZUdkSDFyNFYwUVE5VHBpWkFGbTZEbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9wcm9maWxlIjt9czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0Nzc3MTgyOTI7czoxOiJjIjtpOjE0Nzc3MTU5ODg7czoxOiJsIjtzOjE6IjAiO319',1477718292);

/*Table structure for table `storys` */

DROP TABLE IF EXISTS `storys`;

CREATE TABLE `storys` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `story_body` mediumtext COLLATE utf8_unicode_ci,
  `section` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_story` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_caption` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked` tinyint(4) NOT NULL DEFAULT '0',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0',
  `update_by` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `storys` */

insert  into `storys`(`id`,`user_id`,`title`,`story_body`,`section`,`image_story`,`image_caption`,`blocked`,`is_delete`,`update_by`,`created_at`,`updated_at`) values (21,1,'test tile api',NULL,'2','story/img_1_1477690408.jpg','test image_caption',0,0,1,'2016-10-28 21:33:28','2016-10-28 21:33:28');
insert  into `storys`(`id`,`user_id`,`title`,`story_body`,`section`,`image_story`,`image_caption`,`blocked`,`is_delete`,`update_by`,`created_at`,`updated_at`) values (19,1,'BIRTHDAY FLOWERS','Birthday Flower Delivery - Make a birthday special with a unique birthday delivery! It is fun to send love with happy birthday flowers, birthday teddy bears and birthday gifts delivered same day. Whether they are celebrating their 8th birthday or their 80th birthday, we have the perfect birthday bouquet to make their day bright','1','story/img_1_1477585232.jpg','flower',0,0,2,'2016-10-27 16:20:32','2016-10-29 00:29:00');
insert  into `storys`(`id`,`user_id`,`title`,`story_body`,`section`,`image_story`,`image_caption`,`blocked`,`is_delete`,`update_by`,`created_at`,`updated_at`) values (18,2,'A revenge','Revenge is an American television soap opera/drama series, created by Mike Kelley and starring Madeleine Stowe and Emily VanCamp, which debuted on September 21, 2011 on ABC. The plot is inspired by the Alexandre Dumas novel The Count of Monte Cristo.[2] During its first season it aired on Wednesdays at 10:00 pm (Eastern), and later airing on Sundays at 9:00 pm for seasons 2 through 4.[3][4]','2','story/img_2_1477575541.jpg','nature',0,0,2,'2016-10-27 13:39:02','2016-10-27 13:39:02');
insert  into `storys`(`id`,`user_id`,`title`,`story_body`,`section`,`image_story`,`image_caption`,`blocked`,`is_delete`,`update_by`,`created_at`,`updated_at`) values (17,1,'This Is Test Title','This Is Test Story','3','story/img_1_1477454535.jpg','This Is Test Image Caption',0,0,2,'2016-10-26 04:02:15','2016-10-27 09:35:46');
insert  into `storys`(`id`,`user_id`,`title`,`story_body`,`section`,`image_story`,`image_caption`,`blocked`,`is_delete`,`update_by`,`created_at`,`updated_at`) values (1,1,'Imgae change','Imgae change','4','story/img_1_1477308590.jpg','Image CaptionImage CaptionImage Caption',0,1,1,'2016-10-24 11:30:30','2016-10-29 00:50:49');
insert  into `storys`(`id`,`user_id`,`title`,`story_body`,`section`,`image_story`,`image_caption`,`blocked`,`is_delete`,`update_by`,`created_at`,`updated_at`) values (20,1,'test tile api',NULL,'2','story/img_1_1477690371.jpg','test image_caption',0,0,1,'2016-10-28 21:32:51','2016-10-28 21:32:51');
insert  into `storys`(`id`,`user_id`,`title`,`story_body`,`section`,`image_story`,`image_caption`,`blocked`,`is_delete`,`update_by`,`created_at`,`updated_at`) values (22,1,'test tile api',NULL,'2','story/img_1_1477690440.jpg','test image_caption',0,0,1,'2016-10-28 21:34:00','2016-10-28 21:34:00');
insert  into `storys`(`id`,`user_id`,`title`,`story_body`,`section`,`image_story`,`image_caption`,`blocked`,`is_delete`,`update_by`,`created_at`,`updated_at`) values (23,1,'test tile api',NULL,'2','story/img_1_1477690485.jpg','test image_caption',0,0,1,'2016-10-28 21:34:45','2016-10-28 21:34:45');
insert  into `storys`(`id`,`user_id`,`title`,`story_body`,`section`,`image_story`,`image_caption`,`blocked`,`is_delete`,`update_by`,`created_at`,`updated_at`) values (24,1,'test tile api',NULL,'2','story/img_1_1477690572.jpg','test image_caption',0,0,2,'2016-10-28 21:36:12','2016-10-29 00:28:49');
insert  into `storys`(`id`,`user_id`,`title`,`story_body`,`section`,`image_story`,`image_caption`,`blocked`,`is_delete`,`update_by`,`created_at`,`updated_at`) values (25,1,'test title api test title api','body api body body api body body api body body api body body api body body api body body api body body api body body api body body api body body api body body api body body api body ','4','story/img_1_1477710093.jpg','test image_caption32',0,0,1,'2016-10-28 21:38:06','2016-10-29 03:01:33');
insert  into `storys`(`id`,`user_id`,`title`,`story_body`,`section`,`image_story`,`image_caption`,`blocked`,`is_delete`,`update_by`,`created_at`,`updated_at`) values (26,1,'test after ','this is final test','3','story/img_1_1477695836.jpg','caption df',0,1,1,'2016-10-28 23:03:56','2016-10-29 02:47:22');
insert  into `storys`(`id`,`user_id`,`title`,`story_body`,`section`,`image_story`,`image_caption`,`blocked`,`is_delete`,`update_by`,`created_at`,`updated_at`) values (27,1,'test title api test title api','body api body body api body body api body body api body body api body body api body body api body body api body body api body body api body body api body body api body body api body ','3','story/img_1_1477710258.jpg','test image_caption32',0,1,1,'2016-10-28 23:44:16','2016-10-29 03:04:18');

/*Table structure for table `tags` */

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `story_id` int(11) DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tags` */

insert  into `tags`(`id`,`story_id`,`tag`,`updated_at`,`created_at`) values (1,17,'tag','2016-10-26 04:02:15','2016-10-26 04:02:15');
insert  into `tags`(`id`,`story_id`,`tag`,`updated_at`,`created_at`) values (2,17,' etc','2016-10-26 04:02:15','2016-10-26 04:02:15');
insert  into `tags`(`id`,`story_id`,`tag`,`updated_at`,`created_at`) values (3,17,'','2016-10-26 04:02:15','2016-10-26 04:02:15');
insert  into `tags`(`id`,`story_id`,`tag`,`updated_at`,`created_at`) values (4,18,'From Wikipedia','2016-10-27 13:39:02','2016-10-27 13:39:02');
insert  into `tags`(`id`,`story_id`,`tag`,`updated_at`,`created_at`) values (5,18,' the free encyclopedia','2016-10-27 13:39:02','2016-10-27 13:39:02');
insert  into `tags`(`id`,`story_id`,`tag`,`updated_at`,`created_at`) values (6,19,'hjjkkk j/kn/ hjhhkl;\'','2016-10-27 16:20:32','2016-10-27 16:20:32');
insert  into `tags`(`id`,`story_id`,`tag`,`updated_at`,`created_at`) values (7,24,'test','2016-10-28 21:36:12','2016-10-28 21:36:12');
insert  into `tags`(`id`,`story_id`,`tag`,`updated_at`,`created_at`) values (8,24,'tesing','2016-10-28 21:36:12','2016-10-28 21:36:12');
insert  into `tags`(`id`,`story_id`,`tag`,`updated_at`,`created_at`) values (9,24,'tag api','2016-10-28 21:36:12','2016-10-28 21:36:12');
insert  into `tags`(`id`,`story_id`,`tag`,`updated_at`,`created_at`) values (10,24,'test tag api','2016-10-28 21:36:12','2016-10-28 21:36:12');
insert  into `tags`(`id`,`story_id`,`tag`,`updated_at`,`created_at`) values (33,25,'test2','2016-10-29 03:01:33','2016-10-29 03:01:33');
insert  into `tags`(`id`,`story_id`,`tag`,`updated_at`,`created_at`) values (35,25,'tag api3 ','2016-10-29 03:01:33','2016-10-29 03:01:33');
insert  into `tags`(`id`,`story_id`,`tag`,`updated_at`,`created_at`) values (15,26,'fsdf','2016-10-28 23:03:56','2016-10-28 23:03:56');
insert  into `tags`(`id`,`story_id`,`tag`,`updated_at`,`created_at`) values (16,26,'sdfd','2016-10-28 23:03:56','2016-10-28 23:03:56');
insert  into `tags`(`id`,`story_id`,`tag`,`updated_at`,`created_at`) values (17,26,'sffds','2016-10-28 23:03:56','2016-10-28 23:03:56');
insert  into `tags`(`id`,`story_id`,`tag`,`updated_at`,`created_at`) values (18,26,'f','2016-10-28 23:03:56','2016-10-28 23:03:56');
insert  into `tags`(`id`,`story_id`,`tag`,`updated_at`,`created_at`) values (19,26,'ds','2016-10-28 23:03:56','2016-10-28 23:03:56');
insert  into `tags`(`id`,`story_id`,`tag`,`updated_at`,`created_at`) values (20,26,'f','2016-10-28 23:03:56','2016-10-28 23:03:56');
insert  into `tags`(`id`,`story_id`,`tag`,`updated_at`,`created_at`) values (43,27,'tesing 3 ','2016-10-29 03:04:18','2016-10-29 03:04:18');
insert  into `tags`(`id`,`story_id`,`tag`,`updated_at`,`created_at`) values (42,27,'tag api3 ','2016-10-29 03:04:18','2016-10-29 03:04:18');
insert  into `tags`(`id`,`story_id`,`tag`,`updated_at`,`created_at`) values (41,27,'test tag api4','2016-10-29 03:04:18','2016-10-29 03:04:18');
insert  into `tags`(`id`,`story_id`,`tag`,`updated_at`,`created_at`) values (34,25,'tesing 3 ','2016-10-29 03:01:33','2016-10-29 03:01:33');
insert  into `tags`(`id`,`story_id`,`tag`,`updated_at`,`created_at`) values (36,25,'test tag api4','2016-10-29 03:01:33','2016-10-29 03:01:33');
insert  into `tags`(`id`,`story_id`,`tag`,`updated_at`,`created_at`) values (44,27,'test2','2016-10-29 03:04:18','2016-10-29 03:04:18');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_admin` tinyint(4) DEFAULT '0',
  `dob` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `block` tinyint(1) DEFAULT '0',
  `is_delete` tinyint(1) DEFAULT '0',
  `update_by` int(10) DEFAULT NULL,
  `api_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`is_admin`,`dob`,`phone`,`gender`,`avatar`,`password`,`block`,`is_delete`,`update_by`,`api_token`,`remember_token`,`created_at`,`updated_at`) values (1,'Farzana Naomi','farzananaomi@gmail.com',0,'1991-09-11','1234567890','female','avatar/Farzana_Naomi_1477454465.jpg','$2y$10$QvUzJUzm1bWH2rgRve9dIuIqJTkA45.Sb5Tb8wVWowTx2kg7Kcx7q',1,1,1,'28ac5987b54e599ccb1fc687d80d69d11c11c82d28ac5987b54e599ccb1fc687d80d69d11c11c82d','TDNZjubOaZXsxA6AQN8CDXpxAkssJQzyBc7DNlmIfUEQCJLnnhzGT6XScsWZ','2016-10-26 04:01:06','2016-10-29 04:55:21');
insert  into `users`(`id`,`name`,`email`,`is_admin`,`dob`,`phone`,`gender`,`avatar`,`password`,`block`,`is_delete`,`update_by`,`api_token`,`remember_token`,`created_at`,`updated_at`) values (2,'Admin ','admin',1,'2009-01-01','1234567890','male','avatar/img_2_1477556623.jpg','$2y$10$Fkw/EsYXkr1AZaOGCtMB4Og5JhHqY3B6vL/7yyF/D3O4Ow8/n.Wz.',0,0,NULL,NULL,'YvqfdVoQL8ymba8NWQNx0mvh5NKf7qEeNtbXJjvttyMgMWwXc4P4WRnbcBhi','2016-10-26 04:07:24','2016-10-29 04:55:48');
insert  into `users`(`id`,`name`,`email`,`is_admin`,`dob`,`phone`,`gender`,`avatar`,`password`,`block`,`is_delete`,`update_by`,`api_token`,`remember_token`,`created_at`,`updated_at`) values (3,'nami','naomi@yahoo.com',0,'1992-10-27','01944232494','female','avatar/nami_1477586074.jpg','$2y$10$SVEAEVZ.PPs2wHYnnNOOauFvI.VGTKMX9NLVC28WqFEzjlyG4qS8K',0,0,NULL,NULL,'PWq4h4Zhs2qdSlovVq35GHpvCuDNCTvaarv2ivfKKlWjnWzRY4nU3521W0Qc','2016-10-27 16:34:34','2016-10-27 17:20:26');
insert  into `users`(`id`,`name`,`email`,`is_admin`,`dob`,`phone`,`gender`,`avatar`,`password`,`block`,`is_delete`,`update_by`,`api_token`,`remember_token`,`created_at`,`updated_at`) values (4,'nami','farzananaomi@yyyy.com',0,'2002-01-01','123456789','male','avatar/nami_1477687341.jpg','$2y$10$rSqQK2Zbp9PgabJE12ybL.FxqEiar.zai53pnUgb9RMq1ZRp1XH8G',0,0,NULL,NULL,'qe5BiJqjFQ7MDFPVQR7fVAkE26KCbLve5BfrHxUpS1AVPeCPS8oChKcCHEM8','2016-10-28 20:42:22','2016-10-28 21:01:09');
insert  into `users`(`id`,`name`,`email`,`is_admin`,`dob`,`phone`,`gender`,`avatar`,`password`,`block`,`is_delete`,`update_by`,`api_token`,`remember_token`,`created_at`,`updated_at`) values (5,'test Test','test@test2.com',0,'12/12/2002','sdffsdfsd','female','avatar/test_Test_1477688512.jpg','$2y$10$UB5juY3D4afYEidpF28ZKOkx8v4ykMnB3cTeBxhAe4OhOxQIZTlSq',1,0,2,NULL,NULL,NULL,'2016-10-29 00:28:31');
insert  into `users`(`id`,`name`,`email`,`is_admin`,`dob`,`phone`,`gender`,`avatar`,`password`,`block`,`is_delete`,`update_by`,`api_token`,`remember_token`,`created_at`,`updated_at`) values (6,'test Test','test2@test2.com',0,'12/12/2002','sdffsdfsd','female','avatar/test_Test_1477698350.jpg','$2y$10$sluUUgEFhrLDDO4Buv7owOUcQdvdR3HQqvMM1kfrb1XmPTgv2WOxm',0,0,NULL,NULL,NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

/*Table structure for table `comment_view` */

DROP TABLE IF EXISTS `comment_view`;
 

DROP TABLE IF EXISTS `story_view`;
DROP TABLE IF EXISTS `stories_view`;
 
 /*
SQLyog Ultimate
MySQL - 5.7.11 : Database - d5a5a
*********************************************************************
*/



 


CREATE  VIEW `story_view` AS (
SELECT
  `storys`.`id`             AS `id`,
  `storys`.`user_id`        AS `user_id`,
  `storys`.`title`          AS `title`,
  `storys`.`story_body`     AS `story_body`,
  `sections`.`section_name` AS `section`,
  `sections`.`id`           AS `section_id`,
  `storys`.`image_story`    AS `image_story`,
  `storys`.`image_caption`  AS `image_caption`,
  `storys`.`blocked`        AS `blocked`,
  `storys`.`is_delete`      AS `is_delete`,
  `storys`.`update_by`      AS `update_by`,
  `storys`.`created_at`     AS `created_at`,
  `storys`.`updated_at`     AS `updated_at`,
  `su`.`name`               AS `name`,
  `su`.`avatar`             AS `avatar`,
  GROUP_CONCAT(`tags`.`tag` SEPARATOR ',') AS `tags`
FROM (((`storys`
     LEFT JOIN `tags`
       ON ((`storys`.`id` = `tags`.`story_id`)))
    LEFT JOIN `users` `su`
      ON ((`storys`.`user_id` = `su`.`id`)))
   LEFT JOIN `sections`
     ON ((`sections`.`id` = `storys`.`section`)))
GROUP BY `storys`.`id`
ORDER BY `storys`.`id` DESC)

 ;
 

CREATE   VIEW `stories_view` AS (
SELECT
  `storys`.`id`            AS `id`,
  `storys`.`title`         AS `title`,
  `storys`.`story_body`    AS `body`,
  `storys`.`section`       AS `section`,
  `storys`.`image_story`   AS `image_url`,
  `storys`.`image_caption` AS `image_caption`
FROM `storys`
WHERE ((`storys`.`is_delete` = 0)
       AND (`storys`.`blocked` = 0)));
	   
	   
 

CREATE  VIEW `comment_view` AS (
SELECT
  `comments`.`id`         AS `cid`,
  `comments`.`story_id`   AS `story_id`,
  `comments`.`user_id`    AS `cuser_id`,
  `comments`.`comment`    AS `comment`,
  `comments`.`is_delete`  AS `cis_delete`,
  `comments`.`update_by`  AS `cupdate_by`,
  `comments`.`created_at` AS `ccreated_at`,
  `comments`.`updated_at` AS `cupdated_at`,
  `users`.`name`          AS `cname`,
  `users`.`avatar`        AS `cavatar`,
  `users`.`email`         AS `cemail`
FROM (`comments`
   LEFT JOIN `users`
     ON ((`comments`.`user_id` = `users`.`id`))))
