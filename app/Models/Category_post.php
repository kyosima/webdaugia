<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category_post extends Model
{
    protected $table = 'category_post';

    public function product(){
    	return $this->belongsToMany(Posts::class, 'category_to_post', 'category_id', 'post_id');
    }

}
