<?php

namespace App\Admin\Controllers;

use App\Models\Posts;
use App\Models\CategoryPost;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use \Cviebrock\EloquentSluggable\Services\SlugService;
use Encore\Admin\Facades\Admin;
use App\Admin\Actions\Post\Restore;
use App\Admin\Extensions\Tools\RestorePost;
use App\Admin\Actions\Post\BatchRestore;
use Carbon\Carbon;

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

        $grid->id('ID')->sortable();
        // $grid->title('Tiêu đề');
        $grid->column('title', 'Tiêu đề');
        // $grid->column('avatar', 'avatar')->image(url('/'), 100, 100);
        $grid->category('Danh mục')->display(function ($category) {

            $category = array_map(function ($category) {
                return "<span class='label label-success'>{$category['title']}</span>";
            }, $category);
        
            return join('&nbsp;', $category);
        }, 'Danh mục');
        $grid->desc_short('Mô tả ngắn')->display(function($desc_short) {
            return Str::limit($desc_short, 150, '...');
        });;
        $grid->column('created_at', __('Ngày tạo'))->display(function ($created_at) {
            return date("d/m/Y",strtotime($created_at));
            })->filter('range', 'date');
        $grid->expandFilter();
        $grid->filter(function($filter){

            // Remove the default id filter
            $filter->disableIdFilter();
            $filter->column(1/2, function ($filter) {
                $filter->equal('ID')->integer();
            });
            $filter->column(1/2, function ($filter) {
                $filter->contains('title', 'Tiêu đề')->placeholder('Tiêu đề...');
            });
            $filter->scope('trashed', 'Thùng rác')->onlyTrashed();
        });
        $grid->actions(function ($actions) {
            if (\ request('_ scope_') == 'trashed') {
                $actions->add(new Restore());
            }
            $actions->disableView();
        });
        $grid->batchActions(function($batch) {

            if (\request('_scope_') == 'trashed') {
                $batch->add(new BatchRestore());
            }
            
        });
        $grid->disableExport();
        $grid->disableColumnSelector();
        
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
            $form->text('slug', 'Đường dẫn')->readonly();
            $form->textarea('desc_short', 'Mô tả ngắn');
            $form->ckeditor('body', 'Nội dung');
        });

        $form->column(4/12, function ($form) {

            $form->checkbox('category' ,'Danh mục')->options(CategoryPost::all()->pluck('title','id')); 

            $form->radio('status', 'Trạng thái')->options(['1' => 'Hiện', '0'=> 'Ẩn'])->default('1');
            $form->datetime('timer_at', 'Thời gian đăng');
            // Add a form item to this column
            $form->inputImage('avatar', 'Ảnh đại điện')->value('/public/upload/product_default.png');
        });
        
        $form->setWidth(12, 12);
        $form->saving(function (Form $form) {
            $form->slug = SlugService::createSlug(Posts::class, 'slug',  $form->title);
            $form->avatar = Str::after($form->avatar, URL('/'));
            if(!$form->timer_at){
                $form->timer_at = Carbon::now();
            }
        });
        return $form;
    }

    public function createSlug(Request $request){
        if($request->type == 'post'){
            $slug = SlugService::createSlug(Posts::class, 'slug',  $request->slug);
        }
        else{
            $slug = SlugService::createSlug(CategoryPost::class, 'slug',  $request->slug);
        }
        
        
        return $slug;
    }
}
