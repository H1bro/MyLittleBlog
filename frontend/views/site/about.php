<?php
use yii\helpers\Html;

/* @var $this yii\web\View */
//$this->title = Yii::t('frontend', 'About');
//$this->params['breadcrumbs'][] = $this->title;
//?>



<div class="col-12 col-sm-12">
    <div class="row">
        <div class="viewblog">

            <div class="site-about">
                <h1><?= Html::encode($this->title) ?></h1>

                <p><?= Yii::t('frontend', 'This is the About page. You may modify the following file to customize its content') ?>:</p>

                <code><?= __FILE__ ?></code>
            </div>

        </div>
    </div>
</div>