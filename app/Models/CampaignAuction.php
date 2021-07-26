<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class CampaignNoti
 * 
 * @property int $id
 * @property int $price
 * @property int $campaign_id
 * @property int $user_id
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 *
 * @package App\Models
 */
class CampaignAuction extends Model
{
	protected $table = 'campaign_auction';

	protected $casts = [
		'price' => 'int',
		'campaign_id' => 'int',
		'user_id' => 'int'
	];

	protected $fillable = [
		'price',
		'campaign_id',
		'user_id'
	];
	public function CampaignDetail(){
		return $this->hasOne(CampaignDetail::class, 'id', 'campaign_detail_id');
	}
}
