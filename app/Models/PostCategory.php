<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class PostCategory
 * 
 * @property int $id
 * @property int $parent_id
 * @property string $slug
 * @property string $order
 * @property string $title
 * @property string $desc
 * @property string $logo
 * @property Carbon $created_at
 * @property Carbon $update_at
 *
 * @package App\Models
 */
class PostCategory extends Model
{
	protected $table = 'post_category';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'id' => 'int',
		'parent_id' => 'int'
	];

	protected $dates = [
		'update_at'
	];

	protected $fillable = [
		'parent_id',
		'slug',
		'order',
		'title',
		'desc',
		'logo',
		'update_at'
	];
}
