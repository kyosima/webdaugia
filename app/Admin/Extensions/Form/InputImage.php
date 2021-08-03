<?php

namespace App\Admin\Extensions\Form;

use Encore\Admin\Form\Field;

class InputImage extends Field
{
    // public static $js = [
    //     '/public/packages/ckeditor/ckeditor.js',
    //     '/public/packages/ckeditor/adapters/jquery.js',
    // ];

    protected $view = 'admin.input-image';

    public function render()
    {
        return parent::render();
    }
}