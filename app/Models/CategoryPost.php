<?php

namespace App\Models;

use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\Model;

class CategoryPost extends Model
{
    use Sluggable;
    protected $table = 'category_post';

    public function posts(){
    	return $this->belongsToMany(Posts::class, 'category_to_post', 'category_id', 'post_id');
    }
    public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => 'title'
            ]
        ];
    }
}
