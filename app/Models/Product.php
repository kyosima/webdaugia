<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Product
 * 
 * @property int $id
 * @property string $slug
 * @property string $title
 * @property float|null $price
 * @property float|null $discount
 * @property int|null $category_id
 * @property string|null $sku
 * @property int|null $quantity
 * @property string $avatar
 * @property string|null $gallery
 * @property int $status
 * @property string|null $desc_short
 * @property string|null $desc_long
 * @property string|null $info
 * @property string|null $offer
 * @property int|null $is_highlight
 * @property Carbon $created_at
 * @property Carbon $updated_at
 * 
 * @property BillDetail $bill_detail
 * @property CategoryToProduct $category_to_product
 * @property Collection|ProductReview[] $product_reviews
 *
 * @package App\Models
 */
class Product extends Model
{
	protected $table = 'product';

	protected $casts = [
		'price' => 'float',
		'discount' => 'float',
		'category_id' => 'int',
		'quantity' => 'int',
		'status' => 'int',
		'is_highlight' => 'int'
	];

	protected $fillable = [
		'slug',
		'title',
		'price',
		'discount',
		'category_id',
		'sku',
		'quantity',
		'avatar',
		'gallery',
		'status',
		'desc_short',
		'desc_long',
		'info',
		'offer',
		'is_highlight'
	];

	public function bill_detail()
	{
		return $this->hasOne(BillDetail::class, 'id_ofproduct');
	}

	public function category_to_product()
	{
		return $this->hasOne(CategoryToProduct::class, 'id_ofproduct');
	}

	public function product_reviews()
	{
		return $this->hasMany(ProductReview::class, 'id_ofproduct');
	}
}
