<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Notice
 * 
 * @property int $id
 * @property int $user_id
 * @property string $content
 * @property int $is_readed
 * @property string|null $link
 * @property Carbon $updated_at
 * @property Carbon $created_at
 *
 * @package App\Models
 */
class Notice extends Model
{
	protected $table = 'notice';
	public $incrementing = false;

	protected $casts = [
		'id' => 'int',
		'user_id' => 'int',
		'is_readed' => 'int'
	];

	protected $fillable = [
		'id',
		'user_id',
		'content',
		'is_readed',
		'link'
	];
}
