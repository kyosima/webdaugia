<?php

namespace App\Admin\Controllers;

use App\Models\ProductBrand;
use App\Models\Product;

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
        $grid->column('avatar', 'Ảnh đại diện')->image('', '100');
        $states = [
            'on' => ['value' => 1, 'text' => 'Hiện', 'color' => 'success'],
            'off' => ['value' => 0, 'text' => 'Không', 'color' => 'danger'],
        ];
        $grid->column('slug', __('Product slug'));
        $grid->column('title', __('Product name'));
        $grid->column('category_id', __('Danh mục'));
        $grid->column('price', __('Giá'));
        $grid->column('discount', __('Giảm giá'));
        $grid->column('sku', __('Mã'));
        $grid->column('quantity', __('Số lượng'));
        $grid->column('status', __('Product status'))->states($states);


        $grid->filter(function ($filter) {

            // Remove the default id filter
            //$filter->disableIdFilter();

            // Add a column filter
            $filter->like('title', 'Tên sản phẩm');
            $filter->between('price', 'Giá');
            $filter->in('category_id', 'Danh mục sản phẩm')->multipleSelect(ProductCategory::all()->pluck('title', 'id')->toArray());
            $filter->in('brand_id', 'Thương hiệu')->multipleSelect(ProductBrand::all()->pluck('title', 'id')->toArray());
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
        $show->field('titke', __('Product name'));
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
        $form->tab('Thông Tin Cơ Bản', function ($form) {
            $form->select('category', __('Danh mục'))->options(ProductCategory::selectOptions())->rules('required');
            $form->text('title', __('Tên sản phẩm'))->rules('required');
            $form->currency('price', 'Giá')->symbol('đ');
            $form->number('discount', __('Giảm giá(%)'))->max(100)->min(0)->default(0);
            $form->inputImage('avatar', 'Ảnh đại điện')->value(URL('/').'/public/upload/product_default.png')->attribute('data-type', '');
            $form->inputImage('gallery', 'Thư viên ảnh')->value(URL('/').'/public/upload/product_default.png')->attribute('data-type', 'multiple');
            $form->text('sku', __('Mã sản phẩm'));
            $form->number('quantity', __('Số lượng'))->min(0)->default(1);
            $form->select('brand_id', __('Thương hiệu'))->options(ProductBrand::selectOptions())->rules('required');
            $states = [
                'on' => ['value' => 1, 'text' => 'Hiện', 'color' => 'success'],
                'off' => ['value' => 0, 'text' => 'Không', 'color' => 'danger'],
            ];
            $form->switch('variation_status', __('Sản phẩm có biến thể'))->states($states)->default(0);
            $form->text('variation_id', __('Biến thể'));
            $form->switch('status', __('Hiển thị'))->states($states)->default(1);
            $form->switch('is_highlight', __('Nổi bật'))->states($states)->default(0);
        })->tab('Thông tin mô tả', function ($form) {
            $form->textarea('desc_short', __('Mô tả ngắn'));
            $form->textarea('desc_long', __('Mô tả dài'));
            $form->textarea('info', __('Thông tin'));
            $form->textarea('offer', __('Ưu đãi'));
        });

        return $form;
    }
}
