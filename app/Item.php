<?php

namespace App;


use Illuminate\Database\Eloquent\Model;


class Item extends Model
{


    public $fillable = ['title','description', 'user_id'];
    
    public function user()
    {
    	return $this->belongsTo(User::class);
    }

}