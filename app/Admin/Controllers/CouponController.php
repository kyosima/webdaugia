<?php

namespace App\Admin\Controllers;

use App\Models\CategoryPost;
use App\Http\Controllers\Controller;
use App\Models\Coupon;
use App\Models\Product;
use App\Models\ProductCategory;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use \Cviebrock\EloquentSluggable\Services\SlugService;

class CouponController extends Controller
{
    use HasResourceActions;

    /**
     * Index interface.
     *
     * @param Content $content
     * @return Content
     */
    public function index(Content $content)
    {
        return $content
            ->header(trans('Coupons'))
            // ->description(trans('admin.description'))
            ->body($this->grid());
    }

    /**
     * Show interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function show($id, Content $content)
    {
        return $content
            ->header(trans('Chi tiết coupon'))
            // ->description(trans('admin.description'))
            ->body($this->detail($id));
    }

    /**
     * Edit interface.
     *
     * @param mixed $id
     * @param Content $content
     * @return Content
     */
    public function edit($id, Content $content)
    {
        return $content
            ->header(trans('Sửa coupon'))
            // ->description(trans('admin.description'))
            ->body($this->form()->edit($id));
    }

    /**
     * Create interface.
     *
     * @param Content $content
     * @return Content
     */
    public function create(Content $content)
    {
        return $content
            ->header(trans('Tạo coupon'))
            // ->description(trans('admin.description'))
            ->body($this->form());
    }

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Coupon);
        $grid->model()->latest();
        $grid->id('ID');
        $grid->column('coupon_code', 'Mã coupon');
        $grid->column('coupon_type', 'Loại coupon')->hide();
        $grid->column('coupon_value', 'Giảm giá')->display(function($value){
            switch ($this->coupon_type) {
                case 1:
                    return '<span class="label label-success">'.$value.'đ</span>';
                    break;
                case 2:
                    return '<span class="label label-warning">'.$value.'%</span>';
                    break;
                default:
                    # code...
                    break;
            }
        });
        $grid->column('coupon_desc', 'Thông tin');
        $grid->column('created_at', 'Ngày tạo')->display(function($created_at){
            $date = date_create($created_at);
            return date_format($date, 'd-m-Y');
        })->filter('range', 'date');

        $grid->column('coupon_exp', 'Ngày hết hạn')->display(function($coupon_exp){
            if($coupon_exp != null) {
                $date = date_create($coupon_exp);
                return date_format($date, 'd-m-Y');
            }
        })->filter('range', 'date');

        $grid->filter(function($filter){

            // Remove the default id filter
            $filter->disableIdFilter();
            $filter->column(1/2, function ($filter) {
                $filter->equal('ID')->integer();
            });
            $filter->column(1/2, function ($filter) {
                $filter->contains('coupon_code', 'Mã coupon')->placeholder('Mã coupon...');
            });       
        
        });
        $grid->actions(function ($actions) {
            $actions->disableView();
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
        $show = new Show(Coupon::findOrFail($id));

        $show->id('ID');
        $show->title('Title', 'Tiêu đề');
        $show->slug('slug', 'Đường dẫn');
        $show->created_at(trans('ngày tạo'));
        $show->updated_at(trans('Ngày cập nhật'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Coupon);

        // $form->display('ID');
        $form->text('coupon_code', 'Mã coupon')->required()->autofocus();

        $form->select('coupon_type', 'Loại coupon')->options([
            1 => 'Giảm giá trực tiếp',
            2 => 'Giảm theo %',
        ])->required()->default('coupon_type');
        $form->text('coupon_value', 'Giảm giá')->rules([
            'regex:/^[0-9]*$/',
            'required'
        ]);
        $form->text('coupon_desc', 'Thông tin coupon');
        $form->multipleSelect('coupon_product', 'Coupon dành cho sản phẩm')->options(Product::all()->pluck('title', 'id'));
        $form->multipleSelect('coupon_category', 'Coupon dành cho danh mục')->options(ProductCategory::all()->pluck('title', 'id'));
        $form->datetime('coupon_exp', 'Ngày hết hạn')->format('DD-MM-YYYY');
        return $form;
    }
}
