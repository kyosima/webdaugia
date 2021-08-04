<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Coupon
 * 
 * @property int $id
 * @property int $coupon_type
 * @property string $coupon_code
 * @property string|null $coupon_desc
 * @property int $coupon_value
 * @property string|null $coupon_product
 * @property string|null $coupon_category
 * @property string|null $coupon_exp
 * @property Carbon $created_at
 * @property Carbon $updated_at
 *
 * @package App\Models
 */
class Coupon extends Model
{
	protected $table = 'coupons';

	protected $casts = [
		'id' => 'int',
		'coupon_type' => 'int',
		'coupon_value' => 'int'
	];

	protected $fillable = [
		'coupon_type',
		'coupon_code',
		'coupon_desc',
		'coupon_value',
		'coupon_product',
		'coupon_category',
		'coupon_exp'
	];

	public static function findByCode($code){
        return Coupon::where('coupon_code', $code)->first();
    }

    public function discount($total)
    {
        if($this->coupon_type == 1){
            return $this->coupon_value;
        } 
        elseif ($this->coupon_type == 2) {
            return round(($this->coupon_value / 100) * $total);
        }
        else {
            return 0;
        }
    }
}
