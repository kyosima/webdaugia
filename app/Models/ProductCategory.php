<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class ProductCategory
 * 
 * @property int $id
 * @property string|null $category_parent
 * @property string $category_slug
 * @property string|null $category_sku
 * @property string $category_name
 * @property bool $category_status
 * @property Carbon $created_at
 * @property Carbon $updated_at
 *
 * @package App\Models
 */
class ProductCategory extends Model
{
	protected $table = 'product_category';

	protected $casts = [
		'category_status' => 'bool'
	];

	protected $fillable = [
		'category_parent',
		'category_slug',
		'category_sku',
		'category_name',
		'category_status'
	];
	public function products()
    {
        return $this->hasMany(Product::class, 'product_category', 'id');
    }

    public function categories()
    {
        return $this->hasMany(ProductCategory::class, 'category_parent', 'id');
    }

    public function category()
    {
        return $this->belongsTo(ProductCategory::class, 'category_parent', 'id');
    }
}
