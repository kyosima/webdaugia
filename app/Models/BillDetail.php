<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class BillDetail
 * 
 * @property int $id_ofbill
 * @property int $id_ofproduct
 * @property float|null $end_price
 * @property int $SL
 * 
 * @property Bill $bill
 * @property Product $product
 *
 * @package App\Models
 */
class BillDetail extends Model
{
	protected $table = 'bill_details';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'id_ofbill' => 'int',
		'id_ofproduct' => 'int',
		'end_price' => 'float',
		'SL' => 'int'
	];

	protected $fillable = [
		'id_ofbill',
		'id_ofproduct',
		'end_price',
		'SL'
	];

	public function bill()
	{
		return $this->belongsTo(Bill::class, 'id_ofbill');
	}

	public function product()
	{
		return $this->belongsTo(Product::class, 'id_ofproduct');
	}
}
