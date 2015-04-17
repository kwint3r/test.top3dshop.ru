function instockrequestmass(products) {
    $.ajax({
        type:'post',
        data: {data: JSON.stringify(products) },
        url:'index.php?route=module/clicker/instockrequestmass',
        dataType:'html',
        success:function (data) {
            $.colorbox({
                html:data,
                fastIframe:false,
                scrolling:true,
                initialWidth:false,
                innerWidth:false,
                maxWidth:false,
                height:false,
                onComplete:function () {
                    //$(this).colorbox.resize();
                }
            });
            
            $('#upload_file').ajaxfileupload({
                'action': '/index.php?route=module/clicker/upload',
                'validate_extensions': false,
                onStart: function(file, extension) {
                    $('#upload_div').after('<img src="catalog/view/theme/default/image/loading.gif" class="loading" style="padding-left: 5px;" />');
                    $('#file_description').html('');
                },
                'onComplete': function (json) {
                    $('.error').remove();
                    if (json['success']) {
                        $('#filename').attr('value', json['file']);
                        $('#file_description').html(this[0].files[0].name);
                    }

                    if (json['error']) {
                        $('#upload_div').after('<span class="error">' + json['error'] + '</span>');
                    }

                    $('.loading').remove();
                }
            });
            $("#upload_div").click(function() {
                 $("#upload_file").trigger('click');
            });
        }
    });
}

function instockrequest(product_id) {
    $.ajax({
        type:'post',
        data:'product_id=' + product_id,
        url:'index.php?route=module/clicker/instockrequest',
        dataType:'html',
        success:function (data) {
            $.colorbox({
                html:data,
                fastIframe:false,
                scrolling:false,
                initialWidth:false,
                innerWidth:false,
                maxWidth:false,
                height:false,
                initialHeight:false,
                innerHeight:false,
                onComplete:function () {
                    $(this).colorbox.resize();
                }
            });
			
            $('#upload_file').ajaxfileupload({
                'action': '/index.php?route=module/clicker/upload',
                'validate_extensions': false,
                onStart: function(file, extension) {
               		$('#upload_div').after('<img src="catalog/view/theme/default/image/loading.gif" class="loading" style="padding-left: 5px;" />');
                    $('#file_description').html('');
               	},
                'onComplete': function (json) {
                    $('.error').remove();
                    if (json['success']) {
                        $('#filename').attr('value', json['file']);
                        $('#file_description').html(this[0].files[0].name);
                    }

                    if (json['error']) {
                        $('#upload_div').after('<span class="error">' + json['error'] + '</span>');
                    }

                    $('.loading').remove();
                }
            });
            $("#upload_div").click(function() {
                 $("#upload_file").trigger('click');
            });
        }
    });
}

function post_instockrequest() {
    $('.ocjoyajaxcheckout_errorfields').html('');
    $.ajax({
        type:'post',
        data:$('#form_instockrequest').serialize(),
        url:'index.php?route=module/clicker/email',
        dataType:'json',
        success:function (json) {
            if (json.errors) {
                for (var index in json.errors) {
                    $('#error_'+index).html(json.errors[index]);
                }
            } else if(json.response) {
                $('#ajaxorder').html(json.response);
                $.colorbox.resize();
				yaCounter26190288.reachGoal('CP');
				ga('send', 'pageview', '/virtual/kp-form'); 
				
            }
        }
    });
}



