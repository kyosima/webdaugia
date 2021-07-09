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
class CampaignNoti extends Model
{
	protected $table = 'campaign_noti';

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
	public function campaign() {
        return $this->belongsTo(Campaign::class);
    }
}
