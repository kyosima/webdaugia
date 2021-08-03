<?php

namespace App\Admin\Extensions\Form;

use Encore\Admin\Form\Field;

class InputGallery extends Field
{
    // public static $js = [
    //     '/public/packages/ckeditor/ckeditor.js',
    //     '/public/packages/ckeditor/adapters/jquery.js',
    // ];

    protected $view = 'admin.input-gallery';

    public function render()
    {
        return parent::render();
    }
}