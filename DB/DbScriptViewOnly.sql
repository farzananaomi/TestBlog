/*
SQLyog Ultimate
MySQL - 5.7.11 : Database - d5a5a
*********************************************************************
*/


 DROP VIEW IF EXISTS `story_view` 
/*!50001 DROP TABLE IF EXISTS `story_view` */;



/*View structure for view comment_view */

/*!50001 DROP TABLE IF EXISTS `comment_view` */;
/*!50001 DROP VIEW IF EXISTS `comment_view` */;

 CREATE  VIEW `comment_view` AS (select `comments`.`id` AS `cid`,`comments`.`story_id` AS `story_id`,`comments`.`user_id` AS `cuser_id`,`comments`.`comment` AS `comment`,`comments`.`is_delete` AS `cis_delete`,`comments`.`update_by` AS `cupdate_by`,`comments`.`created_at` AS `ccreated_at`,`comments`.`updated_at` AS `cupdated_at`,`users`.`name` AS `cname`,`users`.`avatar` AS `cavatar`,`users`.`email` AS `cemail` from (`comments` left join `users` on((`comments`.`user_id` = `users`.`id`)))) ;

/*View structure for view story_view */

/*!50001 DROP TABLE IF EXISTS `story_view` */;
 DROP VIEW IF EXISTS `story_view`;

 CREATE  VIEW `story_view` AS (select `storys`.`id` AS `id`,`storys`.`user_id` AS `user_id`,`storys`.`title` AS `title`,`storys`.`story_body` AS `story_body`,`storys`.`section` AS `section`,`storys`.`image_story` AS `image_story`,`storys`.`image_caption` AS `image_caption`,`storys`.`blocked` AS `blocked`,`storys`.`is_delete` AS `is_delete`,`storys`.`update_by` AS `update_by`,`storys`.`created_at` AS `created_at`,`storys`.`updated_at` AS `updated_at`,`su`.`name` AS `name`,`su`.`avatar` AS `avatar`,group_concat(`tags`.`tag` separator ',') AS `tags` from ((`storys` left join `tags` on((`storys`.`id` = `tags`.`story_id`))) left join `users` `su` on((`storys`.`user_id` = `su`.`id`))) group by `storys`.`id` order by `storys`.`id` desc);

 
