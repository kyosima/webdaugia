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
 * @property int $review_ofproduct
 * @property float $review_rating
 * @property string $review_content
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
		'review_ofproduct' => 'int',
		'review_rating' => 'float'
	];

	protected $fillable = [
		'review_ofproduct',
		'review_rating',
		'review_content'
	];
}
