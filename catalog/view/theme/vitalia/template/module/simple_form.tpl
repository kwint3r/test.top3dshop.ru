<style type="text/css">

</style>

<form action="/simple_mail.php" enctype="multipart/form-data" id="feedback-form" method="post">
<div style="font-size:16px;font-family:Open Sans;display:inline-block;margin-left:70px;"> Остались вопросы? Позвоните нам по телефону <div 
style="display:inline-block;font-size:16px;font-weight:bold;" class="new roistat-phone"><a class="new roistat-phone">8 (800) 555 11 59</a></div></div><div 
style="font-size:16px;text-align:center;"> или задайте с помощью этой формы</div>
    <span style="font-family:arial,helvetica,sans-serif;">
        <span style="float: left;">
            <label for="nameFF">Имя:</label>
            <input class="w102 border" id="nameFF" name="nameFF" placeholder="Иван Иванович Иванов" required="" type="text" x-autocompletetype="name"/>
        </span>
        <span style="float: right;">
            <label for="contactFF">Email:</label>
            <input class="w101 border" id="contactFF" name="contactFF" placeholder="ivan@yandex.ru" required="" type="email" x-autocompletetype="email"/>
        </span>
        <label for="messageFF">Сообщение:</label>
        <textarea class="w100 border" id="messageFF" name="messageFF" placeholder="Детали заявки…" required="" rows="5"></textarea>

        <label for="phoneFF">Мобильный телефон:</label>
        <input class="w100 border" id="phoneFF" name="phoneFF" placeholder="89051234567" required="" type="text" x-autocompletetype="name"/>
		
		<div id="g-recaptcha" class="g_recaptcha" data-sitekey="6LdOHAUTAAAAALDPU8O3nDLcSHKV6tnn5jVrPky6"></div>
		
        <label for="fileFF" >Прикрепить файл:</label>
        <input class="w100" id="fileFF" name="fileFF" type="file" multiple="false"/><br/>

        <input type="hidden" name="file_up" id="file_up" value="0">
        <input id="submitFF" type="submit" value="Отправить заявку"/>&nbsp;
    </span>
    <span class="feedback-error"></span>
</form>

<script type="text/javascript">

    <?php $timestamp = time();?>
    var lastFile = 0;
    $(document).ready(function() {
        $('#feedback-form').submit(function(event){
            event.preventDefault();
            $.post( "/simple_mail.php", $( "#feedback-form" ).serialize(), function( data ) {
                ga('send', 'event', '/virtual/feedback-form'); 
                yaCounter26190288.reachGoal('feedback-form');
            });

        })

        $('#fileFF').uploadify({
            'formData'     : {
                'timestamp' : '<?php echo $timestamp;?>',
                'token'     : '<?php echo md5('unique_salt' . $timestamp);?>'
            },
            'uploader' : 'uploadify.php',
            'auto'     : true,
            'buttonText' : 'Выберите файл',
            'removeCompleted' : false,


            'onUploadSuccess' : function(file, data, response) {
                if (lastFile){
                    $('#' + lastFile.id).remove();

                }
                lastFile = file;

                if (data == 0)
                {
                    $('#' + file.id).find('.data').text(" - Загрузка файлов данного типа запрешена. Загрузите другой файл").css("color", "red");
                    $('#' + file.id).find('.uploadify-progress').remove();
                    $('#file_up').val('');
                }
                else
                {
                    $('#file_up').val(data);
                }
            }
        });
    });

</script>