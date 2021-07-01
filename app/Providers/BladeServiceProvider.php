<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Blade;
class BladeServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
        Blade::directive('money', function ($money) {
            return "{{ number_format($money, 0, ',', '.') }}₫";
        });
        Blade::directive('getimage', function ($image) {
            return '<img src='.asset('storage/app/public/images/'.$image).'/>';
        });
    }
}
