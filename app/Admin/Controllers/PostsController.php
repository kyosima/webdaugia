<?php

namespace App\Admin\Controllers;

use App\Models\Posts;
use App\Models\Category_post;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class PostsController extends Controller
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
            ->header(trans('Tất cả bài viết'))
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
            ->header(trans('Chi tiết bài viết'))
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
            ->header(trans('Sửa bài viết'))
            ->description(trans('admin.description'))
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
            ->header(trans('Thêm bài viết'))
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
        $grid = new Grid(new Posts);

        $grid->id('ID');
        $grid->title('title');
        $grid->desc_short('Mô tả ngắn');
        // $grid->slug('slug');
        // $grid->body('body');
        // $grid->avatar('avatar');
        $grid->column('created_at', __('Ngày tạo'))->filter('range', 'date');
        $grid->expandFilter();
        $grid->filter(function($filter){

            // Remove the default id filter
            $filter->disableIdFilter();
            $filter->column(1/2, function ($filter) {
                $filter->equal('ID')->integer();
            });
            $filter->column(1/2, function ($filter) {
                $filter->contains('title')->placeholder('Tiêu đề...');
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
        $show = new Show(Posts::findOrFail($id));

        $show->id('ID');
        $show->title('Tiêu đề');
        $show->desc_short('desc_short');
        $show->slug('slug');
        $show->body('body');
        $show->avatar()->image();
        $show->created_at(trans('admin.created_at'));
        $show->updated_at(trans('admin.updated_at'));
        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Posts);
        // The first column occupies 1/2 of the page width
        $form->column(8/12, function ($form) {

            // Add a form item to this column

            $form->text('title', 'Tiêu đề')->required()->autofocus();
            $form->text('slug', 'Đường dẫn')->readonly()->required()
            ->attribute(['class' => 'create_slug form-control', 'data-focus' => '#title', 'data-type' => 'post']);
            $form->textarea('desc_short', 'Mô tả ngắn');
            $form->ckeditor('body', 'Nội dung');
        });

        $form->column(4/12, function ($form) {

            $form->checkbox('category' ,'Danh mục')->options(Category_post::all()->pluck('name','id'));

            // Add a form item to this column
            $form->inputImage('avatar', 'Ảnh đại điện')->value(URL('/').'/public/upload/product_default.png')
            ->attribute('data-type', '');
        });
        
        
        $form->setWidth(12, 12);
        return $form;
    }

    public function createSlug(Request $request){
        
        $slug = Str::slug($request->slug, '-');
        if($request->type == 'post'){
            if(Posts::where('slug', $slug)->first()){
                return response('Đã tồn tại tên này, vui lòng thay đổi tên khác', 400);
            }
        }
        elseif($request->type == 'category_post'){
            if(Category_post::where('slug', $slug)->first()){
                return response('Đã tồn tại tên này, vui lòng thay đổi tên khác', 400);
            }
        }
        
        return $slug;
    }
}
