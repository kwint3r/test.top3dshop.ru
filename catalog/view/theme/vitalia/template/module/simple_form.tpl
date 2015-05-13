<style type="text/css">

</style>
<form action="/simple_mail.php" enctype="multipart/form-data" id="feedback-form" method="post">
<p style="font:24px Open Sans;font-weight:bold;text-align:center;"> Сделать заказ </p>
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
		
        <label for="fileFF" >Прикрепить файлы:</label>
        <input class="w100" id="fileFF" name="fileFF" type="file" multiple="true"/><br/>

        <input type="hidden" name="file_up" id="file_up" value="0">
        <input id="submitFF" type="submit" value="Отправить заявку"/>&nbsp;
    </span>
    <span class="feedback-error"></span>
	<br/>
	<br/>
	<p style="font-size:18px;font-family:Open Sans;text-align:center"> Остались вопросы? Позвоните нам по телефону  <span class="new roistat-phone"><a class="new roistat-phone">8 (800) 555 11 59</a></span>
</form>

<script type="text/javascript">

    <?php $timestamp = time();?>
    var lastFile = 0;
    $(document).ready(function() {

    $("#feedback-form").unbind('submit').bind('submit', function(){
        $.ajax({
            url: $(this).attr('action'),
            type: "POST",
            dataType: "JSON",
            data: $(this).serialize(),
            success: function(data){
                if (data.success){
                    alert(data.output);
                    ga('send', 'event', '/virtual/feedback-form'); 
                    yaCounter26190288.reachGoal('feedback-form');
                    //$("#feedback-form").html(data.output);
                }else{
                    //$("#feedback-form .feedback-error").html(data.output);
                    $("#feedback-form .g_recaptcha > div > div")
                        .css("border","2px solid red")
                        .css("margin-top","84px")
                        .css("height","80px")
                        .css("width","306px");
                }
            },
            error: function(data){
                ga('send', 'event', '/virtual/feedback-form'); 
                yaCounter26190288.reachGoal('feedback-form');
                alert(data.responseText);
            }
        });
        return false;
    });


/*        $("#feedback-form").unbind('submit').bind('submit', function(){
            event.preventDefault();
            $.post( "/simple_mail.php", $( "#feedback-form" ).serialize(), function( data ) {
                ga('send', 'event', '/virtual/feedback-form'); 
                yaCounter26190288.reachGoal('feedback-form');
            });

        })
*/
        $('#fileFF').uploadify({
            'formData'     : {
                'timestamp' : '<?php echo $timestamp;?>',
                'token'     : '<?php echo md5('unique_salt' . $timestamp);?>'
            },
            'uploader' : '/uploadify.php',
            'auto'     : true,
            'multi'      : true,
            'buttonText' : 'Выберите файлы',
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
                    if ($('#file_up').val() != '')  {
                        var file_data = $('#file_up').val() + ';' + data;
                        $('#file_up').val(file_data);
                    } else {
                        $('#file_up').val(data);
                    }
                }
            },
            'onUploadError' : function(file, errorCode, errorMsg, errorString) {
                alert('The file ' + file.name + ' could not be uploaded: ' + errorString);
            }

        });
    });

</script>