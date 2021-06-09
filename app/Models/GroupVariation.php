<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class GroupVariation
 * 
 * @property int $id
 * @property string $id_variation
 * @property string|null $id_price
 *
 * @package App\Models
 */
class GroupVariation extends Model
{
	protected $table = 'group_variation';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'id' => 'int'
	];

	protected $fillable = [
		'id_variation',
		'id_price'
	];
}
