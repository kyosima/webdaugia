<?php

namespace App\Admin\Controllers;

use App\Models\Category_post;
use App\Http\Controllers\Controller;
use Encore\Admin\Controllers\HasResourceActions;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Layout\Content;
use Encore\Admin\Show;

class CategoryPostController extends Controller
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
            ->header(trans('Danh mục bài viết'))
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
            ->header(trans('Chi tiết danh mục'))
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
            ->header(trans('Sửa danh mục'))
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
            ->header(trans('Tạo danh mục'))
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
        $grid = new Grid(new Category_post);

        $grid->id('ID');
        $grid->name('Tên', 'name');
        $grid->slug('Đường dẫn', 'slug');
        $grid->column('created_at', __('Ngày tạo'))->filter('range', 'date');
        // $grid->updated_at(trans('admin.updated_at'));
        $grid->filter(function($filter){

            // Remove the default id filter
            $filter->disableIdFilter();
            $filter->column(1/2, function ($filter) {
                $filter->equal('ID')->integer();
            });
            $filter->column(1/2, function ($filter) {
                $filter->contains('name', 'Tên')->placeholder('Tên danh mục...');
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
        $show = new Show(Category_post::findOrFail($id));

        $show->id('ID');
        $show->name('name', 'Tên');
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
        $form = new Form(new Category_post);

        // $form->display('ID');
        $form->text('name', 'Tên')->required()->autofocus();
        $form->text('slug', 'Đường dẫn')->readonly()->required()
        ->attribute(['class' => 'create_slug form-control', 'data-focus' => '#name', 'data-type' => 'category_post']);
        // $form->display(trans('Ngày tạo'));
        // $form->display(trans('admin.updated_at'));

        return $form;
    }
}
