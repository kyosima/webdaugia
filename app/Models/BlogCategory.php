<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class BlogCategory
 * 
 * @property int $id
 * @property string $category_parent
 * @property string $category_slug
 * @property string $category_name
 * @property Carbon $created_at
 * @property Carbon $update_at
 *
 * @package App\Models
 */
class BlogCategory extends Model
{
	protected $table = 'blog_category';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'id' => 'int'
	];

	protected $dates = [
		'update_at'
	];

	protected $fillable = [
		'category_parent',
		'category_slug',
		'category_name',
		'update_at'
	];
}
