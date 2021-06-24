<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Cviebrock\EloquentSluggable\Sluggable;
use Encore\Admin\Facades\Admin;
use Carbon\Carbon;

class Posts extends Model
{
    use SoftDeletes, Sluggable;
    protected $table = 'posts';
    protected $guarded =[];
    public function category(){
    	return $this->belongsToMany(CategoryPost::class, 'category_to_post', 'post_id', 'category_id');
    }
    public function getPostsPaginate($paginate){
        return Posts::where('status', 1)->where('timer_at', '<=', Carbon::now())->orderBy('id', 'DESC')->paginate($paginate);
    }
    public function admin(){
        return $this->belongsTo(Admin::class, 'id_ofauthor', 'id');
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
