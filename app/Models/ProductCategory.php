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
 * @property string|null $logo
 * @property string|null $parent_id
 * @property string $slug
 * @property string|null $sku
 * @property string $title
 * @property int $order
 * @property bool $status
 * @property Carbon $created_at
 * @property Carbon $updated_at
 * 
 * @property CategoryToProduct $category_to_product
 *
 * @package App\Models
 */
class ProductCategory extends Model
{
	protected $table = 'product_category';

	protected $casts = [
		'order' => 'int',
		'status' => 'bool'
	];

	protected $fillable = [
		'logo',
		'parent_id',
		'slug',
		'sku',
		'title',
		'order',
		'status'
	];

	public function category_to_product()
	{
		return $this->hasOne(CategoryToProduct::class, 'id_ofcategory');
	}
}
