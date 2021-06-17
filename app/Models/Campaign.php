<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Campaign
 * 
 * @property int $id
 * @property string $campaign_name
 * @property string|null $campaign_desc
 * @property string $campaign_feture_img
 * @property string $time_start
 * @property string $time_end
 * @property int $campaign_status
 * @property int|null $notify_time
 * @property Carbon $created_at
 * @property Carbon $updated_at
 *
 * @package App\Models
 */
class Campaign extends Model
{
	protected $table = 'campaign';

	protected $casts = [
		'campaign_status' => 'int',
		'notify_time' => 'int'
	];

	protected $fillable = [
		'campaign_name',
		'campaign_desc',
		'campaign_feture_img',
		'time_start',
		'time_end',
		'campaign_status',
		'notify_time'
	];
}
