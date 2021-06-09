<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class CategoryToPost
 * 
 * @property int $id
 * @property int $category_id
 * @property int $post_id
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 *
 * @package App\Models
 */
class CategoryToPost extends Model
{
	protected $table = 'category_to_post';

	protected $casts = [
		'category_id' => 'int',
		'post_id' => 'int'
	];

	protected $fillable = [
		'category_id',
		'post_id'
	];
}
