<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class ProductPrice
 * 
 * @property int $id
 * @property float|null $price_regular
 * @property float|null $price_promotion
 *
 * @package App\Models
 */
class ProductPrice extends Model
{
	protected $table = 'product_price';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'id' => 'int',
		'price_regular' => 'float',
		'price_promotion' => 'float'
	];

	protected $fillable = [
		'price_regular',
		'price_promotion'
	];
}
