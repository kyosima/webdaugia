<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * Class CategoryToProduct
 * 
 * @property int $id_ofproduct
 * @property int $id_ofcategory
 * 
 * @property ProductCategory $product_category
 * @property Product $product
 *
 * @package App\Models
 */
class CategoryToProduct extends Model
{
	protected $table = 'category_to_product';
	public $incrementing = false;
	public $timestamps = false;

	protected $casts = [
		'id_ofproduct' => 'int',
		'id_ofcategory' => 'int'
	];

	protected $fillable = [
		'id_ofproduct',
		'id_ofcategory'
	];

	public function product_category()
	{
		return $this->belongsTo(ProductCategory::class, 'id_ofcategory');
	}

	public function product()
	{
		return $this->belongsTo(Product::class, 'id_ofproduct');
	}
}
