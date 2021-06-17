<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class CampaignDetail
 * 
 * @property int $id
 * @property int $id_ofcampaign
 * @property int $id_ofproduct
 * @property float $price_start
 * @property float $price_step
 * @property float $price_end
 * @property int $id_userwin
 *
 * @package App\Models
 */
class CampaignDetail extends Model
{
	protected $table = 'campaign_details';
	public $timestamps = false;

	protected $casts = [
		'id_ofcampaign' => 'int',
		'id_ofproduct' => 'int',
		'price_start' => 'float',
		'price_step' => 'float',
		'price_end' => 'float',
		'id_userwin' => 'int'
	];

	protected $fillable = [
		'id_ofcampaign',
		'id_ofproduct',
		'price_start',
		'price_step',
		'price_end',
		'id_userwin'
	];
}
