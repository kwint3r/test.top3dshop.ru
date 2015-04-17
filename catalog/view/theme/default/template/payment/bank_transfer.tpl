<style>.bank_button {background-color: #3CB868;color: #fff;font-weight: bold;font-size: 14px;text-transform: uppercase;cursor: pointer;border: 0px;padding: 10px 160px 10px 160px;border-radius: 5px;-webit-border-radius: 5px;-moz-border-radius: 5px;} .bank_comment {width: 400px;min-height: 80px;border-radius: 5px;-webit-border-radius: 5px;-moz-border-radius: 5px;resize: vertical;}</style>
<h2><?php echo $text_instruction; ?></h2>
<div class="content">
  <p><?php echo $bank; ?></p>
  <p><textarea type="text" name="bank_comment" class="bank_comment"></textarea></p>
  <p><input type="button" value="Загрузить" id="filename" class="bank_button"><input type="hidden" name="filename" /><input type="hidden" name="name" /></p>

<script type="text/javascript"><!--
$('#button-confirm').bind('click', function() {
	$.ajax({ 
		type: 'get',
		url: 'index.php?route=payment/bank_transfer/confirm',
		data: $('textarea[name="bank_comment"], input[name="filename"], input[name="name"]'),
		success: function() {
			$('textarea[name="bank_comment"]').attr('value');
			location = '<?php echo $continue; ?>';
		}		
	});
});
//--></script> 
<script src="catalog/view/javascript/jquery/ajaxupload.js"></script>
<script>
var $filename = $('#filename');

new AjaxUpload('#filename', {
	action: 'index.php?route=payment/bank_transfer/upload',
	name: 'file',
	autoSubmit: true,
	responseType: 'json',
	onSubmit: function(file, extension) {
		$filename.after('<img src="catalog/view/theme/default/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		$filename.attr('disabled', true);
	},
	onComplete: function(file, json) {
		$filename.attr('disabled', false);
		
		$('.error').remove();
		
		if (json['success']) {
			alert(json['success']);
			//alert(json['filename1']);
			$('input[name="filename"]').attr('value', json['file']);
			$('input[name="name"]').attr('value', json['mask']);
		}
		
		if (json['error']) {
			$filename.after('<span class="error">' + json['error'] + '</span>');
		}
		
		$('.loading').remove();	
	}
});
//--></script>

</div>
<div class="buttons">
  <div class="right">
    <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="button" />
  </div>
</div>
