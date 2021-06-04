<?php

namespace App\Admin\Controllers;

use App\Models\Posts;
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
            ->header(trans('admin.Posts'))
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
            ->header(trans('admin.detail'))
            ->description(trans('admin.description'))
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
            ->header(trans('admin.edit'))
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
            ->header(trans('admin.create'))
            ->description(trans('admin.description'))
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
        $grid->created_at(trans('admin.created_at'));
        $grid->updated_at(trans('admin.updated_at'));

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
        $show->title('title');
        $show->desc_short('desc_short');
        $show->slug('slug');
        $show->body('body');
        $show->avatar('avatar');
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

        $form->display('ID');
        $form->text('title', 'title');
        $form->text('slug', 'slug')->readonly()->required()
        ->attribute(['class' => 'create_slug form-control', 'data-focus' => '#title']);
        $form->textarea('desc_short', 'desc_short');
        $form->ckeditor('body', 'body');
        $form->inputImage('avatar')->value(URL('/').'/public/upload/product_default.png')
        ->attribute('data-type', '');
        return $form;
    }

    public function createSlug(Request $request){
        
        $slug = Str::slug($request->slug, '-');
        if(Posts::where('slug', $slug)->first()){
            return response('Đã tồn tại tên bài viết, vui lòng thay đổi tên khác', 400);
        }
        return $slug;
    }
}
