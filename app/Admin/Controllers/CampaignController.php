<?php

namespace App\Admin\Controllers;

use App\Models\Campaign;
use App\Models\CampaignDetail;

use App\Models\Product;
use Encore\Admin\Layout\Content;

use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Illuminate\Support\Str;
use Illuminate\Http\Request;

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
        $grid->column('avatar', __('Ảnh đại diện'))->image(url('/'), '100','100');
        $grid->column('title', __('Tiêu đề'));
        $grid->column('time_start', __('Time start'));
        $grid->column('time_end', __('Time end'));
        return $grid;
    }

    public function postCampaign(Request $request){
            CampaignDetail::whereId($_POST['campaign_detail_id'])->update([
                'detail_price_start'=>$_POST['detail_price_start'],
                'detail_price_step'=>$_POST['detail_price_step'],
                'video'=>$_POST['video']
            ]);
       
        return 'Thành công';
    }

    public function removeCampaignDetail(Request $request){
        CampaignDetail::whereId($request->id)->delete();
        return 'Thành công';
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
        $show->field('video', __('Video'));
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
            ->body($this->formEdit($id)->edit($id,$content));
    }

    public function update($id)
    {
        return $this->formEdit($id)->update($id);
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
            ->body($this->form());
    }

    protected function form()
    {
        $form = new Form(new Campaign());   

        $form->text('title', __('Tiêu đề'));
        return $form;
    }

    protected function formEdit($id)
    {
        $form = new Form(new Campaign());   
        $form->text('id', __('ID'))->readonly();
        $form->text('title', __('Tiêu đề'));
        $form->inputImage('avatar', __('Ảnh đại diện'))->value('/public/upload/product_default.png')->attribute('data-type', '');
        $form->inputProduct('id', __('Chọn sản phẩm'))->value($id);
        $form->datetime('time_start', __('Thời gian bắt đầu'))->default(date('Y-m-d H:i:s'));
        $form->number('time_range', 'Thời gian đấu giá 1 sản phẩm');
        $form->ckeditor('description', __('Mô tả'));
        $form->saving(function (Form $form) {
            $form->avatar = Str::after($form->avatar, URL('/'));
        });
        return $form;
    }
}
