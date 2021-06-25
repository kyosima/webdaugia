<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Ward
 * 
 * @property int $id
 * @property string $_name
 * @property string|null $_prefix
 * @property int|null $_province_id
 * @property int|null $_district_id
 *
 * @package App\Models
 */
class Ward extends Model
{
	protected $table = 'ward';
	public $timestamps = false;

	protected $casts = [
		'_province_id' => 'int',
		'_district_id' => 'int'
	];

	protected $fillable = [
		'_name',
		'_prefix',
		'_province_id',
		'_district_id'
	];
}
