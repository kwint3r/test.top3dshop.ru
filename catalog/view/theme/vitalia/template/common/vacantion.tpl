<style type="text/css">

</style>

<!--script src='https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit' async defer></script-->

<form action="/simple_mail.php" enctype="multipart/form-data" id="vacancy-form" method="post">
    <span style="font-family:arial,helvetica,sans-serif;">
        <span style="float: left;">
            <label for="nameFF">Имя:</label>
            <input class="w102 border" id="nameFFV" name="nameFF" placeholder="Иван Иванович Иванов" required="" type="text" x-autocompletetype="name"/>
        </span>
        <span style="float: right;">
            <label for="contactFF">Email:</label>
            <input class="w101 border" id="contactFFV" name="contactFF" placeholder="ivan@yandex.ru" required="" type="email" x-autocompletetype="email"/>
        </span>
        <label for="messageFF">Сопроводительное письмо:</label>
        <textarea class="w100 border" id="messageFFV" name="messageFF" placeholder="Детали заявки…" required="" rows="5"></textarea>

        <label for="phoneFF">Мобильный телефон:</label>
        <input class="w100 border" id="phoneFFV" name="phoneFF" placeholder="89051234567" required="" type="text" x-autocompletetype="name"/>
		
		<div id="grecaptcha"  class="g_recaptcha"></div>
		
        <label for="fileFF" >Прикрепить резюме:</label>
        <input class="w100" id="fileFFR" name="fileFF" type="file" multiple="false"/><br/>

        <input type="hidden" name="file_up" id="file_upr" value="0">
        <input id="submitFF" type="submit" value="Отправить заявку"/>&nbsp;
    </span>
    <span class="vacancy-error"></span>
</form>

<script type="text/javascript">

    grecaptcha.render('grecaptcha', {
        'sitekey' : '6Lc3SgITAAAAAPavlrEZvo_EHNO4BbSTtdPHeOpZ'
    });

    <?php $timestamp = time()+50;?>
    var lastFile1 = 0;
    $(function() {
        $('#fileFFR').uploadify({
            'formData'     : {
                'timestamp' : '<?php echo $timestamp;?>',
                'token'     : '<?php echo md5('unique_salt' . $timestamp);?>'
            },
            'uploader' : 'uploadify.php',
            'auto'     : true,
            'buttonText' : 'Выберите файл',
            'removeCompleted' : false,

            'onUploadSuccess' : function(file, data, response) {
                if (lastFile1){
                    $('#V' + lastFile1.id).remove();

                }
                lastFile1 = file;

                if (data == 0)
                {
                    $('#V' + file.id).find('.data').text(" - Загрузка файлов данного типа запрешена. Загрузите другой файл").css("color", "red");
                    $('#V' + file.id).find('.uploadify-progress').remove();
                    $('#file_upr').val('');
                }
                else
                {
                    $('#file_upr').val(data);
                }
            }
        });

        $("#vacancy-form").submit(function(){
            var that = this;
            $.ajax({
                url:$(that).attr("action"),
                type:"POST",
                dataType: "JSON",
                data: $(this).serialize(),
                success:function(data){
                    if (data.success){
                        //$("#vacancy-form").html("Ваше резюме отправлено!");
                        alert("Ваше резюме отправлено!");
                        setTimeout(function(){$.colorbox.close();},2000);
                    }else{
                        //$("#vacancy-form .vacancy-error").html(data.output);
                        $("#vacancy-form .g_recaptcha > div > div")
                                .css("border","2px solid red")
                                .css("margin-top","84px")
                                .css("height","80px")
                                .css("width","306px");
                    }
                },
                error: function(data){
                    alert(data.responseText);
                }
            });
            return false;
        });
    });

</script>