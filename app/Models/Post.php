<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Class Post
 * 
 * @property int $id
 * @property string $title
 * @property string|null $desc_short
 * @property string $slug
 * @property string|null $body
 * @property string $avatar
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * @property string|null $deleted_at
 *
 * @package App\Models
 */
class Post extends Model
{
	use SoftDeletes;
	protected $table = 'posts';

	protected $fillable = [
		'title',
		'desc_short',
		'slug',
		'body',
		'avatar'
	];
}
