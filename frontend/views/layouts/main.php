<?php

use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use frontend\assets\AppAsset;
use frontend\widgets\Alert;

/* @var $this \yii\web\View */
/* @var $content string */

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>
<div class="wrap">

<!--    url: --><?php //var_dump(Yii::$app->request->url) ?>
<!--    Id: --><?php //var_dump(Yii::$app->controller->action->uniqueId) ?>
<!--    Params: --><?php //var_dump(Yii::$app->controller->actionParams) ?>
    <?php
    NavBar::begin([
//                'brandLabel' => 'Site.comp',
//                'brandUrl' => Yii::$app->homeUrl,
        'options' => [
            'class' => 'nav navbar-fixed-top',
        ],
    ]);

    if (Yii::$app->controller->action->uniqueId == 'post/index') {
        $menuItems[] = ['label' => Yii::t('frontend', 'Blog'), 'url' => ['/post/index']];
        $menuItems[] = ['label' => Yii::t('frontend', 'About1'), 'url' => ['/site/about']];
        $menuItems[] = ['label' => Yii::t('frontend', 'Contact'), 'url' => ['/site/contact']];

    } elseif (Yii::$app->controller->action->uniqueId == 'post/view') {
        $menuItems[] = ['label' => Yii::t('frontend', 'Blog'), 'url' => ['/post/index'], 'active' => true];
        $menuItems[] = ['label' => Yii::t('frontend', 'About2'), 'url' => ['/site/about']];
        $menuItems[] = ['label' => Yii::t('frontend', 'Contact'), 'url' => ['/site/contact']];
    } else {
        $menuItems[] = ['label' => Yii::t('frontend', 'Blog'), 'url' => ['/post/index']];
        $menuItems[] = ['label' => Yii::t('frontend', 'About3'), 'url' => ['/site/about']];
        $menuItems[] = ['label' => Yii::t('frontend', 'Contact'), 'url' => ['/site/contact']];
    }
    //            $menuItems = [] =
    //                ['label' => Yii::t('frontend', 'Blog'), 'url' => ['/post/view']],
    //                ['label' => Yii::t('frontend', 'About'), 'url' => ['/site/about']],
    //                ['label' => Yii::t('frontend', 'Contact'), 'url' => ['/site/contact']],
    //            ];
    if (Yii::$app->user->isGuest) {
        $menuItems[] = ['label' => Yii::t('frontend', 'Sign up'), 'url' => ['/site/signup']];
        $menuItems[] = ['label' => Yii::t('frontend', 'Login'), 'url' => ['/site/login']];
    } else {
        $menuItems[] = [
            'label' => Yii::t('frontend', 'Logout ({username})', ['username' => Yii::$app->user->identity->username]),
            'url' => ['/site/logout'],
            'linkOptions' => ['data-method' => 'post']
        ];
        $menuItems[] = [
            'label' => Yii::t('frontend', 'Administration'),
            'url' => ['/admin/site']
        ];

    }

    echo Nav::widget([
        'options' => ['class' => ''],
        'items' => $menuItems,
    ]);

    NavBar::end();
    ?>
    <!-- content-->

    <div class="container">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>
        <?= Alert::widget() ?>
        <?= $content ?>
    </div>
    <!-- /content-->
</div>

<!--    <footer class="footer">-->
<!--        <div class="container">-->
<!--            <p class="pull-left">&copy; <a href="https://site.test" target="_blank">site.ru</a> -->
<? //= date('Y') ?><!--</p>-->
<!--            <p class="pull-right">--><? //= Yii::powered() ?><!--</p>-->
<!--        </div>-->
<!--    </footer>-->

<!-- Footer -->
<footer id="footer">
    <div class="container footertext">
<!--        <div class="row gtr-200">-->
<!--            <div class="col-12">-->
<!---->
<!--                About -->
<!--                <section>-->
<!--                    <h2 class="major"><span>What's this about?</span></h2>-->
<!--                    <p>-->
<!--                        This is <strong>TXT</strong>, yet another free responsive site template designed by-->
<!--                        <a href="http://twitter.com/ajlkn">AJ</a> for <a href="http://html5up.net">HTML5 UP</a>. It's-->
<!--                        released under the-->
<!--                        <a href="http://html5up.net/license/">Creative Commons Attribution</a> license so feel free to-->
<!--                        use it for-->
<!--                        whatever you're working on (personal or commercial), just be sure to give us credit for the-->
<!--                        design.-->
<!--                        That's basically it :)-->
<!--                    </p>-->
<!--                </section>-->
<!---->
<!--            </div>-->
<!--            <div class="col-12">-->
<!---->
                <!-- Contact -->
<!--                <section>-->
<!--                    <h2 class="major"><span>Get in touch</span></h2>-->
<!--                    <ul class="contact">-->
<!--                        <li><a class="icon brands fa-facebook-f" href="#"><span class="label">Facebook</span></a></li>-->
<!--                        <li><a class="icon brands fa-twitter" href="#"><span class="label">Twitter</span></a></li>-->
<!--                        <li><a class="icon brands fa-instagram" href="#"><span class="label">Instagram</span></a></li>-->
<!--                        <li><a class="icon brands fa-dribbble" href="#"><span class="label">Dribbble</span></a></li>-->
<!--                        <li><a class="icon brands fa-linkedin-in" href="#"><span class="label">LinkedIn</span></a></li>-->
<!--                    </ul>-->
<!--                </section>-->
<!---->
<!--            </div>-->
<!--        </div>-->

        <!-- Copyright -->
<!--        <div id="copyright">-->
<!--            <ul class="menu">-->
<!--                <li>&copy; Untitled. All rights reserved</li>-->
<!--                <li>Design: <a href="http://html5up.net">HTML5 UP</a></li>-->
<!--            </ul>-->
<!--        </div>-->

    </div>
</footer>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
