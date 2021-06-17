<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Variation
 * 
 * @property int $id
 * @property int $variation_oftype
 * @property string $variation_sku
 * @property string $variation_name
 *
 * @package App\Models
 */
class Variation extends Model
{
	protected $table = 'variation';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'id' => 'int',
		'variation_oftype' => 'int'
	];

	protected $fillable = [
		'variation_oftype',
		'variation_sku',
		'variation_name'
	];
}
