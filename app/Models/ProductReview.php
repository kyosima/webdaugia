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
 * @property int $id_ofproduct
 * @property int $id_ofuser
 * @property float $rating
 * @property string $content
 * @property Carbon $updated_at
 * @property Carbon $created_at
 * 
 * @property User $user
 * @property Product $product
 *
 * @package App\Models
 */
class ProductReview extends Model
{
	protected $table = 'product_review';
	public $incrementing = false;

	protected $casts = [
		'id' => 'int',
		'id_ofproduct' => 'int',
		'id_ofuser' => 'int',
		'rating' => 'float'
	];

	protected $fillable = [
		'id_ofproduct',
		'id_ofuser',
		'rating',
		'content'
	];

	public function user()
	{
		return $this->belongsTo(User::class, 'id_ofuser');
	}

	public function product()
	{
		return $this->belongsTo(Product::class, 'id_ofproduct');
	}
}
