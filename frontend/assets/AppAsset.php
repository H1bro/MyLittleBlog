<?php

namespace frontend\assets;

use yii\web\AssetBundle;

class AppAsset extends AssetBundle
{
    public $basePath = '@webroot'; //алиас каталога с файлами, который соответствует @web
    public $baseUrl = '@web'; //Алиас пути к файлам
    public $css = [
        'css/site.css',
        'css/main_theme.css',
        'css/fontawesome-all.min.css',
    ];
    public $js = [
        'js/prog/jquery.min.js',
        'js/prog/jquery.dropotron.min.js',
        'js/prog/jquery.scrolly.min.js',
        'js/prog/browser.min.js',
        'js/prog/breakpoints.min.js',
        'js/prog/util.js',
        'js/prog/main.js',
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'yii\bootstrap\BootstrapAsset',
    ];
}
