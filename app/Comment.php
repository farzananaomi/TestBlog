<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Model;
class Comment extends Model
{
    //

    use Notifiable;
    protected $primaryKey = 'id';
    protected $table = 'comments';
    protected $fillable = [
        'story_id',
        'user_id',
        'comment',
        'is_delete',
        'update_by',

    ];
}
