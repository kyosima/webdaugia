<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CampaignDetail extends Model
{
    use HasFactory;

    protected $table = 'campaign_details';

	protected $casts = [
		'detail_price_start' => 'int',
		'detail_price_step' => 'int',
		'status' => 'int'
	];



	protected $fillable = [
		'campaign_id',
		'product_id',
		'detail_price_start',
		'detail_price_step',
		'video',
		'status'
	];

	public function product(){
		return $this->hasOne(Product::class, 'id', 'product_id');
	}

	public function wishlist(){
		return $this->hasOne(CampaignWishlist::class, 'campaign_detail_id', 'id');
	}

	public function auctions()
    {
        return $this->hasMany(CampaignAuction::class, 'campaign_detail_id', 'id');
    }

	
}
