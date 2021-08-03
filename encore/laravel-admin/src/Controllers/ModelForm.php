<?php

namespace Encore\Admin\Controllers;

use Encore\Admin\Facades\Admin;
use Encore\Admin\Layout\Content;

/**
 * Trait ModelForm.
 *
 * @deprecated Use `HasResourceActions` instead.
 */
trait ModelForm
{
    use HasResourceActions;

    // public function update($id)
    // {
    //     return $this->form($id)->update($id);
    // }

    // public function edit($id)
    // {
    //     return Admin::content(
    //         function (Content $content) use ($id) {

    //             $content->header($this->headerText);
    //             $content->description('edit');

    //             $content->body($this->form($id)->edit($id));
    //         }
    //     );
    // }
    

}
