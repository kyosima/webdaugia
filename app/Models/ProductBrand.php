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
 * @property string $brand_slug
 * @property string $brand_name
 * @property string|null $brand_sku
 * @property int|null $brand_status
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
		'brand_status' => 'int'
	];

	protected $dates = [
		'update_at'
	];

	protected $fillable = [
		'brand_slug',
		'brand_name',
		'brand_sku',
		'brand_status',
		'update_at'
	];
}
