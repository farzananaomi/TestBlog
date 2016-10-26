<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Model;

class Tag extends Model
{
    use Notifiable;
    protected $primaryKey = 'id';
    protected $table = 'tags';
    protected $fillable = [
        'story_id',
        'tag',

    ];
}
