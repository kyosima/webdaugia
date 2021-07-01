<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Cviebrock\EloquentSluggable\Sluggable;
use Encore\Admin\Traits\AdminBuilder;
use Encore\Admin\Traits\ModelTree;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\DB;
use Money\Money;

/**
 * Class Product
 * 
 * @property int $id
 * @property string $slug
 * @property string|null $title
 * @property int $category_id
 * @property int|null $price
 * @property int $discount
 * @property string|null $sku
 * @property int|null $quantity
 * @property string $avatar
 * @property string|null $gallery
 * @property int|null $brand_id
 * @property int $variation_status
 * @property string|null $variation_id
 * @property int $status
 * @property string|null $desc_short
 * @property string|null $desc_long
 * @property string|null $info
 * @property string|null $offer
 * @property int|null $is_highlight
 * @property Carbon $created_at
 * @property Carbon $updated_at
 *
 * @package App\Models
 */
class Product extends Model
{
	
	protected $table = 'product';
	use Sluggable;

	public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => 'title'
            ]
        ];
    }

	protected $casts = [
		'category_id' => 'int',
		'price' => 'int',
		'discount' => 'int',
		'quantity' => 'int',
		'brand_id' => 'int',
		'variation_status' => 'int',
		'status' => 'int',
		'is_highlight' => 'int'
	];

	// protected $fillable = [
	// 	'slug',
	// 	'title',
	// 	'category_id',
	// 	'price',
	// 	'discount',
	// 	'sku',
	// 	'quantity',
	// 	'avatar',
	// 	'gallery',
	// 	'brand_id',
	// 	'variation_status',
	// 	'variation_id',
	// 	'status',
	// 	'desc_short',
	// 	'desc_long',
	// 	'info',
	// 	'offer',
	// 	'is_highlight'
	// ];

	protected $guarded = [];

	public function category(){
    	return $this->belongsToMany(ProductCategory::class, 'category_to_product', 'id_ofproduct', 'id_ofcategory');
    }

	public function getArrCategory(){
        $categories = DB::table('category_to_product')->select('id_ofcategory')->where('id_ofproduct', $this->id)->get()->toArray();
        $arrIdCategories = array_column($categories, 'id_ofcategory');
        return $arrIdCategories;
    }

	public function bills(){
    	return $this->belongsToMany(Bill::class, 'bill_detail', 'id_ofproduct', 'id_ofbill')->withPivot(['end_price','SL']);
    }
	

    public function brand()
    {
        return $this->belongsTo(Brand::class);
    }

}
