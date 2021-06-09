<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class UserCampaign
 * 
 * @property int $id
 * @property int $id_ofuser
 * @property int $id_ofproduct
 * @property int $id_ofcampaign
 * @property float $bid_price
 *
 * @package App\Models
 */
class UserCampaign extends Model
{
	protected $table = 'user_campaign';
	public $timestamps = false;

	protected $casts = [
		'id_ofuser' => 'int',
		'id_ofproduct' => 'int',
		'id_ofcampaign' => 'int',
		'bid_price' => 'float'
	];

	protected $fillable = [
		'id_ofuser',
		'id_ofproduct',
		'id_ofcampaign',
		'bid_price'
	];
}
