<?php

namespace App\Admin\Controllers;

use App\Models\ProductBrand;
use App\Models\Product;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Models\CampaignDetail;

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
    public function getProduct(Request $request)
    {   
        $product = Product::findOrFail($request->id);
        CampaignDetail::insert([
            'campaign_id'=>$request->campaign_id,
            'product_id'=>$request->id
        ]);
        $detail = CampaignDetail::whereCampaignId($request->campaign_id)->whereProductId($product->id)->first();
        return view('admin.campaign_detail',['product'=>$product,'campaign_id'=>$request->campaign_id,'detail'=>$detail])->render();
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {   
        $product = Product::findOrFail($id);
        $returnHTML = view('admin.campaign_detail')->renderSections()['content'];
        return ($returnHTML);
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
