
USE `d5a5a`;

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

/*Data for the table `migrations` */

insert  into `migrations`(`id`,`migration`,`batch`) values (16,'2014_10_12_000000_create_users_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (17,'2014_10_12_100000_create_password_resets_table',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (18,'2016_10_23_181322_create_story',1);
insert  into `migrations`(`id`,`migration`,`batch`) values (19,'2016_10_29_060758_create_comments_table',29);
insert  into `migrations`(`id`,`migration`,`batch`) values (20,'2016_10_29_060758_create_password_resets_table',29);
insert  into `migrations`(`id`,`migration`,`batch`) values (21,'2016_10_29_060758_create_sections_table',29);
insert  into `migrations`(`id`,`migration`,`batch`) values (22,'2016_10_29_060758_create_sessions_table',29);
insert  into `migrations`(`id`,`migration`,`batch`) values (23,'2016_10_29_060758_create_storys_table',29);
insert  into `migrations`(`id`,`migration`,`batch`) values (24,'2016_10_29_060758_create_tags_table',29);
insert  into `migrations`(`id`,`migration`,`batch`) values (25,'2016_10_29_060758_create_users_table',29);

/*Data for the table `password_resets` */

insert  into `password_resets`(`email`,`token`,`created_at`) values ('farzananaomi@gmail.com','0927e3021319044638134df0d6fc54e45fb46bfe998469a1669e2beed62b55bb','2016-10-26 18:05:23');

/*Data for the table `sections` */

insert  into `sections`(`id`,`section_name`) values (1,'Literature');
insert  into `sections`(`id`,`section_name`) values (2,'Technology');
insert  into `sections`(`id`,`section_name`) values (3,'Health & Fitness');
insert  into `sections`(`id`,`section_name`) values (4,'History');
insert  into `sections`(`id`,`section_name`) values (5,'other');

/*Data for the table `sessions` */

insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values ('d259670b78d2a34550c4605ba63d9201be97124b',2,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','YTo2OntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiUDg3dlU4SlVEaGtuTlpsRmJHa01IQ3BOYWdKSnQybzVoemJaMVllNiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbiI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjI7czoyMjoiUEhQREVCVUdCQVJfU1RBQ0tfREFUQSI7YTowOnt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0Nzc3MTY5NDI7czoxOiJjIjtpOjE0Nzc3MTU5ODg7czoxOiJsIjtzOjE6IjAiO319',1477716942);
insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values ('6412f2c584820b0563f64bd5f45a0b5413b53eb9',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; WOW64; rv:49.0) Gecko/20100101 Firefox/49.0','YTo1OntzOjY6Il90b2tlbiI7czo0MDoidmlHcDhVZVI4U2R4MUoxUEpjaTdoN1ZnOUR1dGNhaFRGSElid3JkZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6MjI6IlBIUERFQlVHQkFSX1NUQUNLX0RBVEEiO2E6MDp7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6OToiX3NmMl9tZXRhIjthOjM6e3M6MToidSI7aToxNDc3NzE3Mzk5O3M6MToiYyI7aToxNDc3NzE2NzEyO3M6MToibCI7czoxOiIwIjt9fQ==',1477717399);
insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values ('57e34b50915c113c66a6d0e7ba530effa8183991',1,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','YTo3OntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiQXVWcVhNUjRwcFhiTlR1M0NSUThNVWJVZWJZcEFNZ0hxcmFJNnNrViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6OTkvcHJvZmlsZSI7fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO3M6MjI6IlBIUERFQlVHQkFSX1NUQUNLX0RBVEEiO2E6MDp7fXM6OToiX3NmMl9tZXRhIjthOjM6e3M6MToidSI7aToxNDc3NzEwNTc2O3M6MToiYyI7aToxNDc3NjY4NTE5O3M6MToibCI7czoxOiIwIjt9fQ==',1477710576);
insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values ('a84761ab4872e12193345d6ecbbb15825a6e1a6d',1,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','YTo2OntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiZndNVEdkaHFEd3c0SVVCc1J1emNGNmNGUTRTcmdPWk5aV3Q3UlZGVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly9sb2NhbGhvc3Q6OTkvcHJvZmlsZSI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoyMjoiUEhQREVCVUdCQVJfU1RBQ0tfREFUQSI7YTowOnt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0Nzc3MTA2OTQ7czoxOiJjIjtpOjE0Nzc2Njg1MTk7czoxOiJsIjtzOjE6IjAiO319',1477710694);
insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values ('ed2de182e6d6a7dcd5abd6d84cbe9948132f6a77',1,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','YTo3OntzOjY6Il90b2tlbiI7czo0MDoiMWxlcG94ZFhLU3JybEFCR2VBMm9xYjdDRGx1NlBjV1NNQ1UyOVlKZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9wcm9maWxlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoyMjoiUEhQREVCVUdCQVJfU1RBQ0tfREFUQSI7YTowOnt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0Nzc3MTYwMTg7czoxOiJjIjtpOjE0Nzc3MTU5ODg7czoxOiJsIjtzOjE6IjAiO319',1477716018);
insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values ('34cacd90edf82b5ce36044acdd3ef4a528cddb09',1,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','YTo3OntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiZG5IMDFxM3lyTnEzSnpEa0pmWjBZOG9CQzMzaU9XS0ZacDVYdzNMNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9wcm9maWxlIjt9czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoyMjoiUEhQREVCVUdCQVJfU1RBQ0tfREFUQSI7YTowOnt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0Nzc3MTYxODc7czoxOiJjIjtpOjE0Nzc3MTU5ODg7czoxOiJsIjtzOjE6IjAiO319',1477716187);
insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values ('e37ea3468ab576ac2da618161b5781486b9bcaa0',1,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','YTo3OntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiN0JWYXFibVp5eXJLRTlDeU83ZUdkSDFyNFYwUVE5VHBpWkFGbTZEbiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9wcm9maWxlIjt9czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czoyMjoiUEhQREVCVUdCQVJfU1RBQ0tfREFUQSI7YTowOnt9czo5OiJfc2YyX21ldGEiO2E6Mzp7czoxOiJ1IjtpOjE0Nzc3MTk3NTY7czoxOiJjIjtpOjE0Nzc3MTU5ODg7czoxOiJsIjtzOjE6IjAiO319',1477719756);
insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values ('e6f0d7befdb9143155182806260efb8650a443a2',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.71 Safari/537.36','YTo0OntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiblZvT1NkcVdKVzVOd1pkcngzVjRwM25oUXk0NGs0aFZ3Rm5iM1VtTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6OToiX3NmMl9tZXRhIjthOjM6e3M6MToidSI7aToxNDc3NzE5NzU4O3M6MToiYyI7aToxNDc3NzE1OTg4O3M6MToibCI7czoxOiIwIjt9fQ==',1477719758);

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

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`email`,`is_admin`,`dob`,`phone`,`gender`,`avatar`,`password`,`block`,`is_delete`,`update_by`,`api_token`,`remember_token`,`created_at`,`updated_at`) values (1,'Farzana Naomi','farzananaomi@gmail.com',0,'1991-09-11','1234567890','female','avatar/Farzana_Naomi_1477454465.jpg','$2y$10$QvUzJUzm1bWH2rgRve9dIuIqJTkA45.Sb5Tb8wVWowTx2kg7Kcx7q',1,1,1,'28ac5987b54e599ccb1fc687d80d69d11c11c82d28ac5987b54e599ccb1fc687d80d69d11c11c82d','ZnXtOU820pwXqRQpO0phXktHR1RU8DoBubHdgUqQivZd9V1HN9YFUqofrbdl','2016-10-26 04:01:06','2016-10-29 05:42:38');
insert  into `users`(`id`,`name`,`email`,`is_admin`,`dob`,`phone`,`gender`,`avatar`,`password`,`block`,`is_delete`,`update_by`,`api_token`,`remember_token`,`created_at`,`updated_at`) values (2,'Admin ','admin',1,'2009-01-01','1234567890','male','avatar/img_2_1477556623.jpg','$2y$10$Fkw/EsYXkr1AZaOGCtMB4Og5JhHqY3B6vL/7yyF/D3O4Ow8/n.Wz.',0,0,NULL,NULL,'YvqfdVoQL8ymba8NWQNx0mvh5NKf7qEeNtbXJjvttyMgMWwXc4P4WRnbcBhi','2016-10-26 04:07:24','2016-10-29 04:55:48');
insert  into `users`(`id`,`name`,`email`,`is_admin`,`dob`,`phone`,`gender`,`avatar`,`password`,`block`,`is_delete`,`update_by`,`api_token`,`remember_token`,`created_at`,`updated_at`) values (3,'nami','naomi@yahoo.com',0,'1992-10-27','01944232494','female','avatar/nami_1477586074.jpg','$2y$10$SVEAEVZ.PPs2wHYnnNOOauFvI.VGTKMX9NLVC28WqFEzjlyG4qS8K',0,0,NULL,NULL,'PWq4h4Zhs2qdSlovVq35GHpvCuDNCTvaarv2ivfKKlWjnWzRY4nU3521W0Qc','2016-10-27 16:34:34','2016-10-27 17:20:26');
insert  into `users`(`id`,`name`,`email`,`is_admin`,`dob`,`phone`,`gender`,`avatar`,`password`,`block`,`is_delete`,`update_by`,`api_token`,`remember_token`,`created_at`,`updated_at`) values (4,'nami','farzananaomi@yyyy.com',0,'2002-01-01','123456789','male','avatar/nami_1477687341.jpg','$2y$10$rSqQK2Zbp9PgabJE12ybL.FxqEiar.zai53pnUgb9RMq1ZRp1XH8G',0,0,NULL,NULL,'qe5BiJqjFQ7MDFPVQR7fVAkE26KCbLve5BfrHxUpS1AVPeCPS8oChKcCHEM8','2016-10-28 20:42:22','2016-10-28 21:01:09');
insert  into `users`(`id`,`name`,`email`,`is_admin`,`dob`,`phone`,`gender`,`avatar`,`password`,`block`,`is_delete`,`update_by`,`api_token`,`remember_token`,`created_at`,`updated_at`) values (5,'test Test','test@test2.com',0,'12/12/2002','sdffsdfsd','female','avatar/test_Test_1477688512.jpg','$2y$10$UB5juY3D4afYEidpF28ZKOkx8v4ykMnB3cTeBxhAe4OhOxQIZTlSq',1,0,2,NULL,NULL,NULL,'2016-10-29 00:28:31');
insert  into `users`(`id`,`name`,`email`,`is_admin`,`dob`,`phone`,`gender`,`avatar`,`password`,`block`,`is_delete`,`update_by`,`api_token`,`remember_token`,`created_at`,`updated_at`) values (6,'test Test','test2@test2.com',0,'12/12/2002','sdffsdfsd','female','avatar/test_Test_1477698350.jpg','$2y$10$sluUUgEFhrLDDO4Buv7owOUcQdvdR3HQqvMM1kfrb1XmPTgv2WOxm',0,0,NULL,NULL,NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
