<?php

namespace App;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Model;


class Story extends Model
{
    use Notifiable;
    protected $primaryKey = 'id';
    protected $table = 'storys';
    protected $fillable = [
        'user_id',
        'title',
        'story_body',
        'section',
        'image_story',
        'image_caption',
    ];
    //
}
