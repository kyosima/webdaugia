<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class ProductBrand
 * 
 * @property int $id
 * @property string $title
 * @property string $logo
 * @property string|null $slug
 * @property int|null $order
 * @property int $status
 * @property Carbon $created_at
 * @property Carbon $update_at
 *
 * @package App\Models
 */
class ProductBrand extends Model
{
	protected $table = 'product_brand';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'id' => 'int',
		'order' => 'int',
		'status' => 'int'
	];

	protected $dates = [
		'update_at'
	];

	protected $fillable = [
		'title',
		'logo',
		'slug',
		'order',
		'status',
		'update_at'
	];
}
