<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\captcha\Captcha;

/* @var $this yii\web\View */
/* @var $form yii\widgets\ActiveForm */
/* @var $model \frontend\models\ContactForm */

//$this->title = Yii::t('frontend', 'Contact');
//$this->params['breadcrumbs'][] = $this->title;
?>

    <div class="row">
        <div class="col-12 col-sm-12">
        <div class="viewblog">


            <h1>
                <?= Html::encode($this->title) ?>
            </h1>


            <?php $form = ActiveForm::begin(['id' => 'contact-form']); ?>
            <?= $form->field($model, 'name') ?>
            <?= $form->field($model, 'email') ?>
            <?= $form->field($model, 'subject') ?>
            <?= $form->field($model, 'body')->textArea(['rows' => 6]) ?>
            <?= $form->field($model, 'verifyCode')->widget(Captcha::class, [
                'template' => '<div class="verification">
                                <div class="col-lg-4">{image}</div>
                                <div class="col-lg-5">{input}</div>
                               </div>',
            ]) ?>

            <div class="form-group">
                <?= Html::submitButton(Yii::t('frontend', 'Submit'), ['class' => 'btn btn-primary', 'name' => 'contact-button']) ?>
            </div>

            <?php ActiveForm::end(); ?>

        </div>
    </div>
</div>
