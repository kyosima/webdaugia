<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Product
 * 
 * @property int $id
 * @property string $product_slug
 * @property string|null $product_category
 * @property string $product_name
 * @property string|null $product_price
 * @property string|null $product_sku
 * @property int|null $product_quantity
 * @property string $product_feature_img
 * @property string|null $product_gallery
 * @property string|null $product_brand
 * @property int $product_variation_status
 * @property string|null $product_variation
 * @property int $product_status
 * @property string|null $product_shortdsc
 * @property string|null $product_longdsc
 * @property string|null $product_info
 * @property string|null $product_offer
 * @property int|null $is_highlight
 * @property Carbon $created_at
 * @property Carbon $updated_at
 *
 * @package App\Models
 */
class Product extends Model
{
	protected $table = 'product';

	protected $casts = [
		'product_quantity' => 'int',
		'product_variation_status' => 'int',
		'product_status' => 'int',
		'is_highlight' => 'int'
	];

	protected $fillable = [
		'product_slug',
		'product_category',
		'product_name',
		'product_price',
		'product_sku',
		'product_quantity',
		'product_feature_img',
		'product_gallery',
		'product_brand',
		'product_variation_status',
		'product_variation',
		'product_status',
		'product_shortdsc',
		'product_longdsc',
		'product_info',
		'product_offer',
		'is_highlight'
	];
	public function category()
    {
        return $this->belongsTo(ProductCategory::class, 'product_category', 'id');
    }

}
