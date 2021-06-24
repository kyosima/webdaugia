<?php

namespace App\Admin\Actions\Post;

use Encore\Admin\Actions\RowAction;
use Illuminate\Database\Eloquent\Model;

class Restore extends RowAction
{
    public $name = 'Khôi phục';

    public function handle (Model $model)
    {
        $model->restore();

        return $this->response()->success('Khôi phục')->refresh();
    }

    public function dialog()
    {
        $this->confirm('bạn có muốn khôi phục lại?');
    }
}