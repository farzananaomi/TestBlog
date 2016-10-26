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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `comments` */

insert  into `comments`(`id`,`story_id`,`user_id`,`comment`,`is_delete`,`update_by`,`created_at`,`updated_at`) values (2,1,1,'test comment',0,1,'2016-10-26 04:02:15','2016-10-26 04:02:15');
insert  into `comments`(`id`,`story_id`,`user_id`,`comment`,`is_delete`,`update_by`,`created_at`,`updated_at`) values (3,17,1,'test comment test comment',0,1,'2016-10-26 04:02:15','2016-10-26 04:02:15');
insert  into `comments`(`id`,`story_id`,`user_id`,`comment`,`is_delete`,`update_by`,`created_at`,`updated_at`) values (4,17,1,'test comment test comment test comment',0,1,'2016-10-26 04:02:15','2016-10-24 18:29:25');

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

insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values ('ea97e18afcd93f1e3ee278b8130d3b493f559826',1,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','YTo2OntzOjY6Il90b2tlbiI7czo0MDoiSDNWY1FXRlpYUktyNkU4bXdNakZwV21wdkRLcEtiRlBRQ2U1MTA2NyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoyMjoiUEhQREVCVUdCQVJfU1RBQ0tfREFUQSI7YTowOnt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0Nzc0NTQ3OTA7czoxOiJjIjtpOjE0Nzc0NTQzNTU7czoxOiJsIjtzOjE6IjAiO319',1477454790);
insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values ('ce8ccd1e39649d7373b384e23f7c84dd7a7b9609',2,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','YTo2OntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiUmptMFVEakVBYXRnblV4UVptWVg4c1YzcVROTVNxN1pnZkpMengwayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9ob21lIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjtzOjIyOiJQSFBERUJVR0JBUl9TVEFDS19EQVRBIjthOjA6e31zOjk6Il9zZjJfbWV0YSI7YTozOntzOjE6InUiO2k6MTQ3NzQ1NDg1NztzOjE6ImMiO2k6MTQ3NzQ1NDM1NTtzOjE6ImwiO3M6MToiMCI7fX0=',1477454857);

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
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `storys` */

insert  into `storys`(`id`,`user_id`,`title`,`story_body`,`section`,`image_story`,`image_caption`,`blocked`,`is_delete`,`update_by`,`created_at`,`updated_at`) values (17,1,'This Is Test Title','This Is Test Story','This Is Test Section or catagory','story/img_1_1477454535.jpg','This Is Test Image Caption',0,0,1,'2016-10-26 04:02:15','2016-10-26 04:02:15');
insert  into `storys`(`id`,`user_id`,`title`,`story_body`,`section`,`image_story`,`image_caption`,`blocked`,`is_delete`,`update_by`,`created_at`,`updated_at`) values (1,1,'Imgae change','Imgae change','Imgae changeImgae change','story/img_1_1477308590.jpg','Image CaptionImage CaptionImage Caption',0,0,1,'2016-10-24 11:30:30','2016-10-25 19:53:21');

/*Table structure for table `tags` */

DROP TABLE IF EXISTS `tags`;

CREATE TABLE `tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `story_id` int(11) DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tags` */

insert  into `tags`(`id`,`story_id`,`tag`,`updated_at`,`created_at`) values (1,17,'tag','2016-10-26 04:02:15','2016-10-26 04:02:15');
insert  into `tags`(`id`,`story_id`,`tag`,`updated_at`,`created_at`) values (2,17,' etc','2016-10-26 04:02:15','2016-10-26 04:02:15');
insert  into `tags`(`id`,`story_id`,`tag`,`updated_at`,`created_at`) values (3,17,'','2016-10-26 04:02:15','2016-10-26 04:02:15');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_admin` tinyint(4) NOT NULL DEFAULT '0',
  `dob` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`is_admin`,`dob`,`phone`,`gender`,`avatar`,`password`,`remember_token`,`created_at`,`updated_at`) values (1,'Farzana Naomi','farzananaomi@gmail.com',0,'1991-09-11','1234567890','female','avatar/Farzana_Naomi_1477454465.jpg','$2y$10$QvUzJUzm1bWH2rgRve9dIuIqJTkA45.Sb5Tb8wVWowTx2kg7Kcx7q','33oL5qeXI6zdWBxvSbPHSKAKpzHOSzsbQjEHzkZ4BKJMm4TCSALX2FIj5IZq','2016-10-26 04:01:06','2016-10-26 04:06:41');
insert  into `users`(`id`,`name`,`email`,`is_admin`,`dob`,`phone`,`gender`,`avatar`,`password`,`remember_token`,`created_at`,`updated_at`) values (2,'Admin ','admin@admin.com',1,'2009-01-01','1234567890','other','avatar/Admin__1477454843.jpg','$2y$10$6Juh12JPkQNimojIHNsI1.MPLornJleA7BDHHJ5xwvuOkmU/52XQO',NULL,'2016-10-26 04:07:24','2016-10-26 04:07:24');

/*Table structure for table `comment_view` */

DROP TABLE IF EXISTS `comment_view`;

/*!50001 DROP VIEW IF EXISTS `comment_view` */;
/*!50001 DROP TABLE IF EXISTS `comment_view` */;

/*!50001 CREATE TABLE  `comment_view`(
 `cid` int(10) unsigned ,
 `story_id` int(11) ,
 `cuser_id` int(11) ,
 `comment` text ,
 `cis_delete` tinyint(4) ,
 `cupdate_by` int(11) ,
 `ccreated_at` timestamp ,
 `cupdated_at` timestamp ,
 `cname` varchar(255) ,
 `cavatar` varchar(255) ,
 `cemail` varchar(255) 
)*/;

/*Table structure for table `story_view` */

DROP TABLE IF EXISTS `story_view`;

/*!50001 DROP VIEW IF EXISTS `story_view` */;
/*!50001 DROP TABLE IF EXISTS `story_view` */;

/*!50001 CREATE TABLE  `story_view`(
 `id` int(10) unsigned ,
 `user_id` int(11) ,
 `title` varchar(255) ,
 `story_body` mediumtext ,
 `section` varchar(255) ,
 `image_story` varchar(255) ,
 `image_caption` varchar(255) ,
 `blocked` tinyint(4) ,
 `is_delete` tinyint(4) ,
 `update_by` int(11) ,
 `created_at` timestamp ,
 `updated_at` timestamp ,
 `name` varchar(255) ,
 `avatar` varchar(255) ,
 `tags` text 
)*/;

/*View structure for view comment_view */

/*!50001 DROP TABLE IF EXISTS `comment_view` */;
/*!50001 DROP VIEW IF EXISTS `comment_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`U5A5A`@`%` SQL SECURITY DEFINER VIEW `comment_view` AS (select `comments`.`id` AS `cid`,`comments`.`story_id` AS `story_id`,`comments`.`user_id` AS `cuser_id`,`comments`.`comment` AS `comment`,`comments`.`is_delete` AS `cis_delete`,`comments`.`update_by` AS `cupdate_by`,`comments`.`created_at` AS `ccreated_at`,`comments`.`updated_at` AS `cupdated_at`,`users`.`name` AS `cname`,`users`.`avatar` AS `cavatar`,`users`.`email` AS `cemail` from (`comments` left join `users` on((`comments`.`user_id` = `users`.`id`)))) */;

/*View structure for view story_view */

/*!50001 DROP TABLE IF EXISTS `story_view` */;
/*!50001 DROP VIEW IF EXISTS `story_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`U5A5A`@`%` SQL SECURITY DEFINER VIEW `story_view` AS (select `storys`.`id` AS `id`,`storys`.`user_id` AS `user_id`,`storys`.`title` AS `title`,`storys`.`story_body` AS `story_body`,`storys`.`section` AS `section`,`storys`.`image_story` AS `image_story`,`storys`.`image_caption` AS `image_caption`,`storys`.`blocked` AS `blocked`,`storys`.`is_delete` AS `is_delete`,`storys`.`update_by` AS `update_by`,`storys`.`created_at` AS `created_at`,`storys`.`updated_at` AS `updated_at`,`su`.`name` AS `name`,`su`.`avatar` AS `avatar`,group_concat(`tags`.`tag` separator ',') AS `tags` from ((`storys` left join `tags` on((`storys`.`id` = `tags`.`story_id`))) left join `users` `su` on((`storys`.`user_id` = `su`.`id`))) group by `storys`.`id` order by `storys`.`id` desc) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
