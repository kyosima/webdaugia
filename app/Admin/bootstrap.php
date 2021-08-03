<?php
use Encore\Admin\Form;
use App\Admin\Extensions\Form\CKEditor;
use App\Admin\Extensions\Form\InputImage;
use App\Admin\Extensions\Form\InputGallery;
use App\Admin\Extensions\Form\InputProductOrder;
use App\Admin\Extensions\Form\InputProduct;

Use Encore\Admin\Admin;

/**
 * Laravel-admin - admin builder based on Laravel.
 * @author z-song <https://github.com/z-song>
 *
 * Bootstraper for Admin.
 *
 * Here you can remove builtin form field:
 * Encore\Admin\Form::forget(['map', 'editor']);
 *
 * Or extend custom form field:
 * Encore\Admin\Form::extend('php', PHPEditor::class);
 *
 * Or require js and css assets:
 * Admin::css('/packages/prettydocs/css/styles.css');
 * Admin::js('/packages/prettydocs/js/main.js');
 *
 */

Encore\Admin\Form::forget(['map', 'editor']);

Form::extend('ckeditor', CKEditor::class);

Admin::js('public/packages/ckfinder/ckfinder.js');

Admin::js('public/admin/js/input-image.js');

Admin::js('public/admin/js/slug.js');

Admin::js('public/admin/js/input-product.js');

Admin::css('public/admin/css/style.css');

Admin::css('public/mevivu/css/style.css');

Form::extend('inputImage', InputImage::class);

Form::extend('inputGallery', InputGallery::class);

Form::extend('inputProductOrder', InputProductOrder::class);
Form::extend('inputProduct', InputProduct::class);




