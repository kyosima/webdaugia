<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class Province
 * 
 * @property int $id
 * @property string|null $_name
 * @property string|null $_code
 *
 * @package App\Models
 */
class Province extends Model
{
	protected $table = 'province';
	public $timestamps = false;

	protected $fillable = [
		'_name',
		'_code'
	];
}
