<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Model;

/**
 * Class ProductReview
 * 
 * @property int $id
 * @property int $product_id
 * @property int $user_id
 * @property float $rating
 * @property string $content
 * @property Carbon $updated_at
 * @property Carbon $created_at
 *
 * @package App\Models
 */
class ProductReview extends Model
{
	protected $table = 'product_review';
	public $incrementing = false;

	protected $casts = [
		'id' => 'int',
		'product_id' => 'int',
		'user_id' => 'int',
		'rating' => 'float'
	];

	protected $fillable = [
		'product_id',
		'user_id',
		'rating',
		'content'
	];
}
