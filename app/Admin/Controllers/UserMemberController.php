<?php

namespace App\Admin\Controllers;

use App\Models\User;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

use App\Admin\Extensions\UserUpgrade;

class UserMemberController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'User';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new User());
        $grid->model()->where('type', '=', 1);

        $grid->column('id', __('Id'));
        // $grid->column('name', __('Tên đăng nhập'));
        $grid->column('Tên thành viên')->display(function () {
            return User::find($this->id)->user_info()->first()->fullname;
        });
        $grid->column('email', __('Email'));
        // $grid->column('email_verified_at', __('Email verified at'));
        // $grid->column('password', __('Password'));
        // $grid->column('remember_token', __('Remember token'));
        $grid->column('created_at', __('Ngày tạo'))->display(function ($created_at) {
            return date("d/m/Y",strtotime($created_at));
            })->filter('range', 'date');
        $grid->filter(function($filter){

            // Remove the default id filter
            $filter->disableIdFilter();
            $filter->column(1/2, function ($filter) {
                $filter->equal('ID')->integer();
            });
            $filter->column(1/2, function ($filter) {
                $filter->contains('name', 'Tên đăng nhập')->placeholder('Tên đăng nhập...');
            });
            
            $filter->column(1/2, function ($filter) {
                $filter->contains('email', 'Email')->placeholder('Email...');
            });
            $filter->column(1/2, function ($filter) {
                $filter->where(function ($query) {

                    $query->whereHas('user_info', function ($query) {
                        $query->where('fullname', 'like', "%{$this->input}%");
                    });
                
                }, 'Họ và tên');
            });
            $filter->column(1/2, function ($filter) {

                $filter->where(function ($query) {

                    $query->whereHas('user_info', function ($query) {
                        $query->where('phone', 'like', "%{$this->input}%");
                    });
                
                }, 'Số điện thoại');
            });
            $filter->column(1/2, function ($filter) {
                $filter->where(function ($query) {

                    $query->whereHas('user_info', function ($query) {
                        $query->where('address', 'like', "%{$this->input}%");
                    });
                
                }, 'Địa chỉ');
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
        $show = new Show(User::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('Tên đăng nhập'));
        $show->field('email', __('Email'));
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
        // $method = Request::method();

        // $rules = ($method === 'PUT') ? 'required' : 'required|unique:demo_users,name';

        $form = new Form(new User());
        $form->column(1/2, function ($form) {
            $form->text('name', __('Tên đăng nhập'))->rules(['required', 'string' , 'min:3', 'max:255', 'unique:users,name,{{id}}'], [
                'required' => 'Họ và tên không được để trống',
                'min'   => 'code can not be less than 10 characters',
                'max'   => 'Tên dài quá'
            ])->required();
            $form->email('email', __('Email'))->rules('required|email|min:8|max:255|unique:users,email,{{id}}', [
                'required' => 'Họ và tên không được để trống',
                'min'   => 'code can not be less than 10 characters',
                'max'   => 'Tên dài quá'
            ])->required();;
            $form->password('password', __('Mật khẩu'));
        });
        $form->column(1/2, function ($form) {
            
            $form->column(1/4, function ($form) {
                $form->text('user_info.fullname', __('Họ và tên'))->rules('required|string|min:3|max:255', [
                    'required' => 'Họ và tên không được để trống',
                    'min'   => 'code can not be less than 10 characters',
                    'max'   => 'Tên dài quá'
                ])->required();
            });
            $form->column(1/4, function ($form) {
                $form->text('user_info.phone', __('Số điện thoại'))->pattern('(84|0[3|5|7|8|9])+([0-9]{8})\b')->rules(['required', 'regex:/((09|03|07|08|05)+([0-9]{8})\b)/'], [
                    'required' => 'Họ và tên không được để trống',
                    'regex'   => 'Số điện thoại không hợp lệ',
                ])->required();
            });
            $form->column(1/2, function ($form) {
                $form->text('user_info.address', __('Địa chỉ đại lý'))->required()->rules(['required'], [
                    'required' => 'Họ và tên không được để trống',
                ])->required();
            });
            $form->column(1/4, function ($form) {
                $form->date('user_info.birthday', __('Ngày sinh'))->placeholder('Ngày sinh')->required();
            });
            $form->column(1/4, function ($form) {
                $form->radio('user_info.gender', __('Giới tính'))->options([1 => 'Nam', 0 => 'Nữ'])->default('1');
            });
            
        });
        $form->column(12, function ($form) {
            $form->radio('type', __('Loại Người Dùng'))->options([1 => 'Thành viên', 2 => 'Đại lý'])->default('1');
        });
        

        $form->setWidth(12, 12);
        
        $form->saving(function (Form $form) {
            if ($form->password && $form->model()->password != $form->password) {
                $form->password = Hash::make($form->password);
            }
        });
        return $form;
    }

    
}
