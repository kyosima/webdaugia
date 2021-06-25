<?php

namespace App\Admin\Controllers;

use App\Models\ProductBrand;
use App\Models\Product;
use Illuminate\Support\Str;

use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use App\Models\ProductCategory;

class ProductController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Product';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Product());
        $grid->model()->latest();
        $grid->column('avatar', __('Ảnh đại diện'))->image(url('/'), '100','100');
        $grid->column('title', __('Tiêu đề'));
        $grid->column('slug', __('Đường dẫn'));
        $grid->column('category_id', __('Danh mục'));
        $grid->column('price', __('Giá'));
        $grid->column('discount', __('Giảm giá'));
        $grid->column('sku', __('Mã'));
        $grid->column('quantity', __('Số lượng'));

        $grid->filter(function ($filter) {

            // Remove the default id filter
            //$filter->disableIdFilter();

            // Add a column filter
            $filter->like('title', 'Tên sản phẩm');
            $filter->like('sku', 'Mã sản phẩm');
            $filter->between('price', 'Giá');
            $filter->in('category_id', 'Danh mục sản phẩm')->multipleSelect(ProductCategory::all()->pluck('title', 'id')->toArray());
        });

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        
        $show = new Show(Product::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('slug', __('Product slug'));
        $show->field('category_id', __('Product category'));
        $show->field('title', __('Product name'));
        $show->field('price', __('Product price'));
        $show->field('discount', __('Product discount'));
        $show->field('sku', __('Product sku'));
        $show->field('quantity', __('Product quantity'));
        $show->field('feature_img', __('Product feature img'));
        $show->field('gallery', __('Product gallery'));
        $show->field('brand_id', __('Product brand'));
        $show->field('variation_status', __('Product variation status'));
        $show->field('variation_id', __('Product variation'));
        $show->field('status', __('Product status'));
        $show->field('desc_short', __('Product shortdsc'));
        $show->field('desc_long', __('Product longdsc'));
        $show->field('info', __('Product info'));
        $show->field('offer', __('Product offer'));
        $show->field('is_highlight', __('Is highlight'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Product());
            $form->select('category_id', __('Danh mục'))->options(ProductCategory::all()->pluck('title','id')); 
            $form->text('title', __('Tên sản phẩm'))->rules('required');
            $form->text('sku', __('Mã sản phẩm'));
            $form->currency('price', 'Giá')->symbol('đ');
            $form->number('discount', __('Giảm giá(%)'))->max(100)->min(0)->default(0);
            $form->number('quantity', __('Số lượng'))->min(0)->default(1);
            $states = [
                'on' => ['value' => 1, 'text' => 'Hiện', 'color' => 'success'],
                'off' => ['value' => 0, 'text' => 'Không', 'color' => 'danger'],
            ];
            $form->switch('status', __('Hiển thị'))->states($states)->default(1);
            $form->switch('is_highlight', __('Nổi bật'))->states($states)->default(0);
            $form->inputImage('avatar', 'Ảnh đại điện')->value('/public/upload/product_default.png')->attribute('data-type', '');
            $form->inputGallery('gallery', 'Thư viên ảnh');
    
            $form->ckeditor('desc_short', __('Mô tả ngắn'));
            $form->ckeditor('desc_long', __('Mô tả dài'));
            $form->ckeditor('info', __('Thông tin'));
            $form->ckeditor('offer', __('Ưu đãi'));
            $form->saving(function (Form $form) {
                $form->avatar = Str::after($form->avatar, URL('/'));
            });
        return $form;
    }
}
