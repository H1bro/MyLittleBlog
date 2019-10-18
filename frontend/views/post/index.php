<?php

use yii\helpers\Html;
use yii\widgets\LinkPager;

/* @var $this yii\web\View */
/* @var $posts yii\data\ActiveDataProvider */
/* @var $categories yii\data\ActiveDataProvider */
/* @var $post common\models\Post */

$this->title = Yii::t('frontend', 'Blog');
?>

<div class="col-sm-12 post-index">
    <div class="container">
        <div class="row">

            <?php
            foreach ($posts->models as $post) {
                echo $this->render('shortView', [
                    'model' => $post
                ]);
            }
            ?>


        </div>

        <div>
            <?= LinkPager::widget([
                'pagination' => $posts->getPagination()
            ]) ?>
        </div>
    </div>
</div>

