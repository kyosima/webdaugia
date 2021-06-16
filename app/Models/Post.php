<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Post
 * 
 * @property int $id
 * @property string $title
 * @property string|null $desc_short
 * @property string $slug
 * @property string|null $body
 * @property string $avatar
 * @property int $category_id
 * @property int $status
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 *
 * @package App\Models
 */
class Post extends Model
{
	protected $table = 'posts';

	protected $casts = [
		'category_id' => 'int',
		'status' => 'int'
	];

	protected $fillable = [
		'title',
		'desc_short',
		'slug',
		'body',
		'avatar',
		'category_id',
		'status'
	];
}
