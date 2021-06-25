<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class District
 * 
 * @property int $id
 * @property string|null $_name
 * @property string|null $_prefix
 * @property int|null $_province_id
 *
 * @package App\Models
 */
class District extends Model
{
	protected $table = 'district';
	public $timestamps = false;

	protected $casts = [
		'_province_id' => 'int'
	];

	protected $fillable = [
		'_name',
		'_prefix',
		'_province_id'
	];
}
