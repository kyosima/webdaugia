<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Bill
 * 
 * @property int $id
 * @property int|null $id_ofuser
 * @property string|null $note
 * @property int $payment_method
 * @property int $bill_total
 * @property int $bill_status
 * @property int $bill_soluong
 * @property int|null $bill_promo
 * @property string|null $bill_coupon
 * @property Carbon $created_at
 * @property Carbon $updated_at
 * 
 * @property User|null $user
 * @property Collection|BillAddress[] $bill_addresses
 * @property BillDetail $bill_detail
 *
 * @package App\Models
 */
class Bill extends Model
{
	protected $table = 'bills';

	protected $casts = [
		'id_ofuser' => 'int',
		'payment_method' => 'int',
		'bill_total' => 'int',
		'bill_status' => 'int',
		'bill_soluong' => 'int',
		'bill_promo' => 'int'
	];

	protected $fillable = [
		'id_ofuser',
		'note',
		'payment_method',
		'bill_total',
		'bill_status',
		'bill_soluong',
		'bill_promo',
		'bill_coupon'
	];

	public function user()
	{
		return $this->belongsTo(User::class, 'id_ofuser');
	}

	public function bill_addresses()
	{
		return $this->hasMany(BillAddress::class, 'id_ofbill');
	}

	public function bill_detail()
	{
		return $this->hasOne(BillDetail::class, 'id_ofbill');
	}
}
