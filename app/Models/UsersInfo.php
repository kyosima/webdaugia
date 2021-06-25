<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class UsersInfo
 * 
 * @property int $id
 * @property int $user_id
 * @property string $fullname
 * @property string $phone
 * @property string|null $address
 * @property Carbon|null $birthday
 * @property int $gender
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * 
 * @property User $user
 *
 * @package App\Models
 */
class UsersInfo extends Model
{
	protected $table = 'users_info';

	protected $casts = [
		'user_id' => 'int',
		'gender' => 'int'
	];

	protected $dates = [
		'birthday'
	];

	protected $fillable = [
		'user_id',
		'fullname',
		'phone',
		'address',
		'birthday',
		'gender'
	];

	public function user()
	{
		return $this->belongsTo(User::class);
	}
}
