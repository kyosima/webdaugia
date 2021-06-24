<?php

namespace App\Admin\Actions\Post;

use Encore\Admin\Actions\BatchAction;
use Illuminate\Database\Eloquent\Collection;

class BatchRestore extends BatchAction
{
    public $name = 'Khôi phục';

    public function handle (Collection $collection)
    {
        $collection->each->restore();

        return $this->response()->success('Phục hồi')->refresh();
    }

    public function dialog ()
    {
        $this->confirm('Bạn có chắc chắn muốn tiếp tục không?');
    }
}