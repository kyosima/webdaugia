<?php

namespace App\Admin\Controllers;

use App\Models\Campaign;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class CampaignController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Campaign';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Campaign());

        $grid->column('id', __('Id'));
        $grid->column('title', __('Title'));
        $grid->column('avatar', __('Avatar'));
        $grid->column('description', __('Description'));
        $grid->column('product_id', __('Product id'));
        $grid->column('price_start', __('Price start'));
        $grid->column('price_end', __('Price end'));
        $grid->column('price_step', __('Price step'));
        $grid->column('time_start', __('Time start'));
        $grid->column('time_end', __('Time end'));
        $grid->column('status', __('Status'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));

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
        $show = new Show(Campaign::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('title', __('Title'));
        $show->field('avatar', __('Avatar'));
        $show->field('description', __('Description'));
        $show->field('product_id', __('Product id'));
        $show->field('price_start', __('Price start'));
        $show->field('price_end', __('Price end'));
        $show->field('price_step', __('Price step'));
        $show->field('time_start', __('Time start'));
        $show->field('time_end', __('Time end'));
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
        $form = new Form(new Campaign());

        $form->text('title', __('Title'));
        $form->image('avatar', __('Avatar'));
        $form->textarea('description', __('Description'));
        $form->text('product_id', __('Product id'));
        $form->number('price_start', __('Price start'));
        $form->number('price_end', __('Price end'));
        $form->number('price_step', __('Price step'));
        $form->datetime('time_start', __('Time start'))->default(date('Y-m-d H:i:s'));
        $form->datetime('time_end', __('Time end'))->default(date('Y-m-d H:i:s'));
        $form->number('status', __('Status'));

        return $form;
    }
}
