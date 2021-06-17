<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Bill
 * 
 * @property int $id
 * @property int $id_ofuser
 * @property string $address
 * @property string|null $note
 * @property int $bill_total
 * @property int $bill_status
 * @property int $bill_soluong
 * @property int|null $bill_promo
 * @property string|null $bill_coupon
 * @property Carbon $created_at
 * @property Carbon $updated_at
 *
 * @package App\Models
 */
class Bill extends Model
{
	protected $table = 'bills';
	public $incrementing = false;

	protected $casts = [
		'id' => 'int',
		'id_ofuser' => 'int',
		'bill_total' => 'int',
		'bill_status' => 'int',
		'bill_soluong' => 'int',
		'bill_promo' => 'int'
	];

	protected $fillable = [
		'id_ofuser',
		'address',
		'note',
		'bill_total',
		'bill_status',
		'bill_soluong',
		'bill_promo',
		'bill_coupon'
	];
}
