<?php

namespace App\Admin\Controllers;

use App\Models\ProductCategory;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Tree;
use Illuminate\Support\Str;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Layout\Content;

class ProductCategoryController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'ProductCategory';

    /**
     * Make a grid builder.
     *
     * @return Tree
     */

    public function index(Content $content)
    {
        return $content
            ->title('Danh mục sản phẩm')
            ->body($this->tree());
    }

    protected function tree()
    {
        return ProductCategory::tree(function (Tree $tree) {

            $tree->branch(function ($branch) {

                $src = asset( $branch['logo']);
                $parent = ProductCategory::where('id', $branch['parent_id'])->first();

                $logo = "<img src=".$src." style='max-width:30px;max-height:30px' class='img'/>";
                if($parent){
                     return "{$branch['id']}  $logo {$branch['title']} link: ".url($parent->slug.'/'.$branch['slug']);
 
                }else{
                    return "{$branch['id']} $logo {$branch['title']} link: ".url($branch['slug']);

                }
            });
        });
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(ProductCategory::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('parent_id', __('Parent id'));
        $show->field('slug', __('Slug'));
        $show->field('sku', __('Sku'));
        $show->field('title', __('Title'));
        $show->field('order', __('Order'));
        $show->field('status', __('Status'));
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
        $form = new Form(new ProductCategory());

        $form->select('parent_id', __('Danh mục cha'))->options(ProductCategory::selectOptions());
        $form->inputImage('logo', __('Logo'))->value('/public/upload/product_default.png')->attribute('data-type', '');
        $form->text('title', __('Title'));
        $form->text('sku', __('Sku'));
        $form->saving(function (Form $form) {
            $form->logo = Str::after($form->logo, URL('/'));
        });
        $states = [
            'on' => ['value' => 1, 'text' => 'Hiện', 'color' => 'success'],
            'off' => ['value' => 0, 'text' => 'Không', 'color' => 'danger'],
        ];
        $form->switch('status', __('Hiển thị'))->states($states)->default(1);
        return $form;
    }
}
