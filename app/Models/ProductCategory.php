<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;
use Cviebrock\EloquentSluggable\Sluggable;
use Encore\Admin\Traits\AdminBuilder;
use Encore\Admin\Traits\ModelTree;
/**
 * Class ProductCategory
 * 
 * @property int $id
 * @property string|null $parent_id
 * @property string $slug
 * @property string|null $sku
 * @property string $title
 * @property int $order
 * @property bool $status
 * @property Carbon $created_at
 * @property Carbon $updated_at
 *
 * @package App\Models
 */
class ProductCategory extends Model
{
	use ModelTree, AdminBuilder, Sluggable;

	protected $table = 'product_category';

	public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => 'title'
            ]
        ];
    }

	protected $casts = [
		'order' => 'int',
		'status' => 'bool'
	];

	protected $fillable = [
		'parent_id',
		'slug',
		'sku',
		'title',
		'order',
		'status'
	];

    public function products(){
    	return $this->belongsToMany(Product::class, 'category_to_post', 'id_ofcategory', 'id_ofproduct');
    }

    public function categories()
    {
        return $this->hasMany(ProductCategory::class, 'parent_id', 'id');
    }

    public function category()
    {
        return $this->belongsTo(ProductCategory::class, 'parent_id', 'id');
    }

    public function brands()
    {
        return $this->belongsToMany(Brand::class, Product::class, 'category_id', 'brand_id');
    }
}
