<?php

namespace App\Models;

use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class CategoryPost extends Model
{
    use Sluggable;
    protected $table = 'category_post';

    public function posts(){
    	return $this->belongsToMany(Posts::class, 'category_to_post', 'category_id', 'post_id');
    }
    public function getPostFirst(){
        return $this->posts()->where('status', 1)->where('timer_at', '<=', Carbon::now())->orderBy('id', 'DESC')->first();
    }
    public function getPostsPaginate($paginate){
        return $this->posts()->where('status', 1)->where('timer_at', '<=', Carbon::now())->orderBy('id', 'DESC')->paginate($paginate);
    }
    public function getPostHasTake($take){
        return $this->posts()->where('status', 1)->where('timer_at', '<=', Carbon::now())->orderBy('id', 'DESC')->take($take)->get();
    }
    public function getPostNotInHasTake($id,$take){
        return $this->posts()->where('status', 1)->where('timer_at', '<=', Carbon::now())->whereNotIn('id', $id)->orderBy('id', 'DESC')->take($take)->get();
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
