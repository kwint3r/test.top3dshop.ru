<script type="text/javascript">
if ($('head').html().indexOf('wbbtheme.css') <0) {
	$('head').append('<link href="view/javascript/wysibb/theme/default/wbbtheme.css" type="text/css" rel="stylesheet" />');
 }
</script>

<div id="seocms_review_date_<?php echo $review_id; ?>" style="display: view;">
 <input type="hidden" name="thislist" value="<?php echo base64_encode(serialize($thislist)); ?>">
<table class="form">
          <tr>
            <td><?php echo $entry_date_added; ?></td>
            <td>
                <input type="text" id="date_added" name="date_added" value="<?php echo $date_added; ?>" size="20" class="datetime" >
            </tr>

          <tr>
          <td></td>
          <td>

          </td>
          </tr>


          <?php if (isset($karma) && count($karma)>0) { ?>
          <tr>
            <td><?php echo $this->language->get('entry_karma'); ?></td>
            <td>

            <table style="text-align: center;">
            <tr>
            <td><?php echo $this->language->get('entry_karma'); ?></td>
            <td><?php echo $this->language->get('entry_karma_rate_count'); ?></td>
            <td><?php echo $this->language->get('entry_karma_rate_delta_blog_plus'); ?></td>
            <td><?php echo $this->language->get('entry_karma_rate_delta_blog_minus'); ?></td>
            </tr>
            <tr>
            <?php foreach ($karma_all as $num => $karma_all_val) { ?>


            <td><input type="text" name="karma_delta" value="<?php if (isset($karma_all_val['rate_delta'])) { echo $karma_all_val['rate_delta']; } ?>" disabled="disabled" size="3"></td>
            <td><input type="text" name="karma_rate_count" value="<?php if (isset($karma_all_val['rate_count'])) { echo $karma_all_val['rate_count']; } ?>" disabled="disabled" size="3"></td>
            <td><input type="text" name="karma_rate_delta_blog_plus" value="<?php if (isset($karma_all_val['rate_delta_blog_plus'])) { echo $karma_all_val['rate_delta_blog_plus']; } ?>" disabled="disabled" size="3"></td>
            <td><input type="text" name="karma_rate_delta_blog_minus" value="<?php if (isset($karma_all_val['rate_delta_blog_minus'])) { echo $karma_all_val['rate_delta_blog_minus']; } ?>" disabled="disabled" size="3"></td>

           <?php } ?>
           </tr>
           </table>

			</td>
          </tr>
          <?php }  ?>



		<?php  if (isset($fields) && count($fields)>0) {
				foreach   ($fields as $af_name => $field) { ?>
				 <tr>
		            <td><?php echo html_entity_decode($field['field_description'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8'); ?></td>
		            <td>
		             <textarea name="af[<?php echo $field['field_name']; ?>]" cols="40" rows="1"><?php if (isset($field['value'])) echo $field['value'];  ?></textarea>
		            </td>
		        </tr>
		<?php  }
		} ?>



</table>
</div>

           <div id="notify">
	          <div style="float:right; text-align: right;">
	          <?php echo $this->language->get('entry_notify'); ?>

	          <input type="checkbox" value="1" name="notify">
	          </div>
          </div>


<script type="text/javascript" src="view/javascript/wysibb/jquery.wysibb.js"></script>

<script type="text/javascript">

$(document).ready(function(){

var seocms_review_date_<?php echo $review_id; ?> = $('#seocms_review_date_<?php echo $review_id; ?>').html();
$('#form').append(seocms_review_date_<?php echo $review_id; ?>);

$('#seocms_review_date_<?php echo $review_id; ?>').hide('slow');
$('#seocms_review_date_<?php echo $review_id; ?>').remove();

var notify = $('#notify').html();
$('#content .form tr:first td:nth-child(2)').append(notify);
$('#notify').remove();



	$('textarea[name="text"]').wysibb({
	  img_uploadurl:		"view/javascript/wysibb/iupload.php",
      buttons: 'bold,italic,underline,|,img,video,link,|,fontcolor,fontsize,|'
	});
   $('span.powered').hide();


});
</script>


<script type="text/javascript" src="view/javascript/blog/timepicker/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript" src="view/javascript/blog/timepicker/localization/jquery-ui-timepicker-<?php echo $config_language; ?>.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.datetime').datetimepicker({
		dateFormat: 'yy-mm-dd',
		timeFormat: 'HH:mm:ss'
	});
});
</script>
