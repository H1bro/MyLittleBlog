<?php //Блок view index POST

use common\models\TagPost;
use yii\helpers\Html;

/* @var $model common\models\Post */
/* @var TagPost $postTag */
?>


<?php
//    $tags = [];
//    foreach($model->getTagPost()->all() as $postTag) {
//        $tag = $postTag->getTag()->one();
//        $tags[] = Html::a($tag->title, ['tag/view', 'id' => $tag->id]);
//    } ?>
<? //= Yii::t('frontend', 'Tags') ?><!--: --><? //= implode($tags, ', ') ?>


<div class="col-sm-6 colblog" >
    <div class="row rowblog">
    <!-- Main -->
        <!-- Blog -->
        <div class="col-12 col-12-medium">

            <div class="headerblog">
                <h2 class="major">
                    <a href="post/<?= $model->id ?>">
                        <span><?= $model->title ?></span>
                    </a>
                </h2>
            </div>

            <div class="contentblog">
                <p>
                   <?= $model->anons ?>
                </p>
            </div>

            <div class="buttonforblog">
                <div class="row">

<!--                    <div class="col-5">-->
<!--                        <?// //= Html::a(Yii::t('frontend', 'More'), ['post/view', 'id' => $model->id], ['class' => 'btn btn-success']) ?> -->
<!--                        <a href="post/--><?//= $model->id ?><!--">Открыть пост</a>-->
<!--                    </div>-->

<!--                    <div class="col-7">-->
<!--                        <span>--><?//= $model->publish_date ?><!--</span>&emsp;-->
<!--                        <span class="icon fa-clock"></span>-->
<!--                        <span>--><?//= $model->author->username ?><!--</span>-->
<!--                    </div>-->
                </div>
            </div>
        </div>

    </div>
</div>



