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
 * @property int $user_id
 * @property int $campaign_detail_id
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 *
 * @package App\Models
 */
class CampaignWishlist extends Model
{
	protected $table = 'campaign_wishlist';

	protected $casts = [
		'user_id' => 'int',
		'campaign_detail_id' => 'int'
	];

	protected $fillable = [
		'user_id' => 'int',
		'campaign_detail_id' => 'int'
	];

}
