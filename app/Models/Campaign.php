<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Campaign
 * 
 * @property int $id
 * @property string $title
 * @property string $avatar
 * @property string|null $description
 * @property string $product_id
 * @property int $price_start
 * @property int $price_end
 * @property int $price_step
 * @property Carbon $time_start
 * @property Carbon $time_end
 * @property int $status
 * @property Carbon $created_at
 * @property Carbon $updated_at
 *
 * @package App\Models
 */
class Campaign extends Model
{
	protected $table = 'campaign';

	protected $casts = [
		'price_start' => 'int',
		'price_end' => 'int',
		'price_step' => 'int',
		'status' => 'int'
	];

	protected $dates = [
		'time_start',
		'time_end'
	];

	protected $fillable = [
		'title',
		'avatar',
		'description',
		'product_id',
		'price_start',
		'price_end',
		'price_step',
		'time_start',
		'time_end',
		'status'
	];
}
