<?php

namespace App\Admin\Selectable;

use App\Models\Product;
use Encore\Admin\Grid\Filter;
use Encore\Admin\Grid\Selectable;

class Products extends Selectable
{
    public $model = Product::class;


    public function make()
    { 
        $this->column('avatar', 'Ảnh sản phẩm')->image();
        $this->column('title', 'Tên sản phẩm');

        // $vcl = request()->route()->parameters();

        // $this->column('bills', 'Số lượng')->display(function ($roles) use ($vcl){
        //     $roles = array_map(function ($role) use ($vcl){
        //         // var_dump($vcl['order']);
        //         if($role['id'] == $vcl['order'])
        //             return $role['pivot']['SL'];
        //     }, $roles);
        
        //     return join('&nbsp;', $roles);
        // });

        $this->column('bill_detail', 'SL');

        $this->column('price', 'Giá bán')->hide();
        $this->column('discount', 'Giá khuyến mãi')->hide();

        $this->column('Giá bán')->display(function () {
            if($this->discount != NULL) {
                return $this->price - round($this->price*$this->discount/100);
            }
            return $this->price;
        });


        $this->filter(function (Filter $filter) {
            $filter->like('name');
        });
    }
}
