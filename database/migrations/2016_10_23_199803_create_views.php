<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateViews extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //



        DB::unprepared('DROP TABLE IF EXISTS `story_view`;CREATE  VIEW `story_view` AS (
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
  GROUP_CONCAT(`tags`.`tag` SEPARATOR \',\') AS `tags`
FROM (((`storys`
     LEFT JOIN `tags`
       ON ((`storys`.`id` = `tags`.`story_id`)))
    LEFT JOIN `users` `su`
      ON ((`storys`.`user_id` = `su`.`id`)))
   LEFT JOIN `sections`
     ON ((`sections`.`id` = `storys`.`section`)))
GROUP BY `storys`.`id`
ORDER BY `storys`.`id` DESC)');

        DB::unprepared('DROP TABLE IF EXISTS `stories_view`;CREATE   VIEW `stories_view` AS (
SELECT
  `storys`.`id`            AS `id`,
  `storys`.`title`         AS `title`,
  `storys`.`story_body`    AS `body`,
  `storys`.`section`       AS `section`,
  `storys`.`image_story`   AS `image_url`,
  `storys`.`image_caption` AS `image_caption`
FROM `storys`
WHERE ((`storys`.`is_delete` = 0)
       AND (`storys`.`blocked` = 0)));');

        DB::unprepared('DROP TABLE IF EXISTS `comment_view`;CREATE  VIEW `comment_view` AS (
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
     ON ((`comments`.`user_id` = `users`.`id`))))');
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        DB::unprepared(' DROP TABLE IF EXISTS `comment_view`;');
        DB::unprepared(' DROP TABLE IF EXISTS `story_view`;');
        DB::unprepared(' DROP TABLE IF EXISTS `stories_view`;');
    }
}
