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
 * Class ProductBrand
 * 
 * @property int $id
 * @property string $title
 * @property string $logo
 * @property string|null $slug
 * @property int|null $order
 * @property int $status
 * @property Carbon $created_at
 * @property Carbon $update_at
 *
 * @package App\Models
 */
class ProductBrand extends Model
{
	use ModelTree, AdminBuilder, Sluggable;

	protected $table = 'product_brand';
	public $incrementing = false;
	public $timestamps = false;

	public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => 'title'
            ]
        ];
    }
	protected $casts = [
		'id' => 'int',
		'order' => 'int',
		'status' => 'int'
	];

	protected $dates = [
		'update_at'
	];

	protected $fillable = [
		'title',
		'logo',
		'slug',
		'order',
		'status',
		'update_at'
	];
}
