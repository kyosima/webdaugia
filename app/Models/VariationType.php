<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class VariationType
 * 
 * @property int $id
 * @property int|null $variation_type_sku
 * @property int $variation_type_name
 *
 * @package App\Models
 */
class VariationType extends Model
{
	protected $table = 'variation_type';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'id' => 'int',
		'variation_type_sku' => 'int',
		'variation_type_name' => 'int'
	];

	protected $fillable = [
		'variation_type_sku',
		'variation_type_name'
	];
}
