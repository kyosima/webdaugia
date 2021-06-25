<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class BillAddress
 * 
 * @property int $id
 * @property int $id_ofbill
 * @property string $name
 * @property string $email
 * @property string $phone
 * @property string $address
 * 
 * @property Bill $bill
 *
 * @package App\Models
 */
class BillAddress extends Model
{
	protected $table = 'bill_address';
	public $timestamps = false;

	protected $casts = [
		'id_ofbill' => 'int'
	];

	protected $fillable = [
		'id_ofbill',
		'name',
		'email',
		'phone',
		'address'
	];

	public function bill()
	{
		return $this->belongsTo(Bill::class, 'id_ofbill');
	}
}
