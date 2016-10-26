<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStory extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
           Schema::create('storys', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('user_id');
            $table->string('title')->nullable();;
            $table->mediumText('story_body')->nullable();;
            $table->string('section')->nullable();;
            $table->string('image_story')->nullable();;
            $table->string('image_caption')->nullable();;
            $table->tinyInteger('blocked')->default(0);
            $table->tinyInteger('is_delete')->default(0);
            $table->integer('update_by')->nullable();
            $table->timestamps();

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('storys');//
    }
}
