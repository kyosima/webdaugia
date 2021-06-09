<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Blog
 * 
 * @property int $id
 * @property string $blog_name
 * @property string $blog_slug
 * @property string|null $blog_category
 * @property string|null $blog_feature_img
 * @property string|null $blog_excerpt
 * @property string $blog_content
 * @property int $blog_status
 * @property Carbon $created_at
 * @property Carbon $updated_at
 *
 * @package App\Models
 */
class Blog extends Model
{
	protected $table = 'blogs';

	protected $casts = [
		'blog_status' => 'int'
	];

	protected $fillable = [
		'blog_name',
		'blog_slug',
		'blog_category',
		'blog_feature_img',
		'blog_excerpt',
		'blog_content',
		'blog_status'
	];
}
