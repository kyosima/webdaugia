<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Posts extends Model
{
    use SoftDeletes;
    protected $table = 'posts';

    public function category(){
    	return $this->belongsToMany(Category_post::class, 'category_to_post', 'post_id', 'category_id');
    }
}
