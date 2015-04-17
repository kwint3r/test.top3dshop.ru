<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>

<div style="margin:5px;">
<a href="<?php echo $url_fields; ?>" class="markbutton"><div style="float: left;"><img src="view/image/blog-rec-m.png"  style="" ></div><div style="float: left; margin-left: 7px; margin-top: 3px; "><?php echo $url_fields_text; ?></div></a>
<a href="<?php echo $url_back; ?>" class="markbutton"><div style="float: left;"><img src="view/image/blog-back-m.png"  style="" ></div><div style="float: left; margin-left: 7px; margin-top: 3px; "><?php echo $url_back_text; ?></div></a>
</div>



      <div class="buttons" style="float:right; clear: both;"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a>
      <a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a>
      </div>
      <div style="width: 100%; overflow: hidden; clear: both; height: 1px; line-height: 1px;">&nbsp;</div>


  <div class="box">
   <div class="content">
      <div id="tabs" class="htabs"><a href="#tab-data"><?php echo $tab_data; ?></a><a href="#tab-general"><?php echo $tab_general; ?></a></div>

      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <div id="tab-general">
          <div id="languages" class="htabs">
            <?php foreach ($languages as $language) { ?>
            <a href="#language<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
            <?php } ?>
          </div>

          <?php foreach ($languages as $language) {

         if (isset($field_description[$language['language_id']]['field'])) {
          $field_description[$language['language_id']]['field'] =  unserialize(base64_decode($field_description[$language['language_id']]['field']));
         } else {          $field_description[$language['language_id']]['field'] = Array();
         }


          ?>
          <div id="language<?php echo $language['language_id']; ?>">
            <table class="form">


              <tr>
                <td><?php echo $this->language->get('entry_description'); ?></td>
                <td><textarea name="fields_description[<?php echo $language['language_id']; ?>][field_description]" id="field_description<?php echo $language['language_id']; ?>" style="width: 100%; height: 200px;"><?php echo isset($field_description[$language['language_id']]['field_description']) ? $field_description[$language['language_id']]['field_description'] : ''; ?></textarea>
                	<br>
					<a href="" class="hrefajax" onclick="load_editor('field_description<?php echo $language['language_id']; ?>', '100'); return false;"><?php echo $this->language->get('entry_editor'); ?></a>
                </td>
              </tr>

              <tr>
                <td><?php echo $this->language->get('entry_description_error'); ?></td>
                <td><textarea name="fields_description[<?php echo $language['language_id']; ?>][field_error]" id="field_error<?php echo $language['language_id']; ?>" style="width: 100%; height: 200px;"><?php echo isset($field_description[$language['language_id']]['field_error']) ? $field_description[$language['language_id']]['field_error'] : ''; ?></textarea>
       				<br>
					<a href="" class="hrefajax" onclick="load_editor('field_error<?php echo $language['language_id']; ?>', '100'); return false;"><?php echo $this->language->get('entry_editor'); ?></a>
                </td>
              </tr>


              <tr>
                <td><?php echo $this->language->get('entry_description_value'); ?></td>
                <td><textarea name="fields_description[<?php echo $language['language_id']; ?>][field_value]" id="field_value<?php echo $language['language_id']; ?>"><?php echo isset($field_description[$language['language_id']]['field_value']) ? $field_description[$language['language_id']]['field_value'] : ''; ?></textarea></td>
              </tr>

              <tr>
                <td><?php echo $this->language->get('entry_field_tempalte_out'); ?></td>
                <td><textarea name="fields_description[<?php echo $language['language_id']; ?>][field][field_template_out]" id="field_template_out<?php echo $language['language_id']; ?>" style="width: 100%; height: 200px;"><?php echo isset($field_description[$language['language_id']]['field']['field_template_out']) ? $field_description[$language['language_id']]['field']['field_template_out'] : ''; ?></textarea>
       				<br>
					<a href="" class="hrefajax" onclick="load_editor('field_template_out<?php echo $language['language_id']; ?>', '100'); return false;"><?php echo $this->language->get('entry_editor'); ?></a>
                </td>
              </tr>

              <tr>
                <td><?php echo $this->language->get('entry_field_tempalte_in'); ?></td>
                <td><textarea name="fields_description[<?php echo $language['language_id']; ?>][field][field_template_in]" id="field_template_in<?php echo $language['language_id']; ?>" style="width: 100%; height: 200px;"><?php echo isset($field_description[$language['language_id']]['field']['field_template_in'] ) ? $field_description[$language['language_id']]['field']['field_template_in'] : ''; ?></textarea>
       				<br>
					<a href="" class="hrefajax" onclick="load_editor('field_template_in<?php echo $language['language_id']; ?>', '100'); return false;"><?php echo $this->language->get('entry_editor'); ?></a>
                </td>
              </tr>

              <tr>
                <td><?php echo $this->language->get('entry_field_class'); ?></td>
                <td><input type="text" name="fields_description[<?php echo $language['language_id']; ?>][field][field_class]" id="field_class<?php echo $language['language_id']; ?>" value="<?php echo isset($field_description[$language['language_id']]['field']['field_class']) ? $field_description[$language['language_id']]['field']['field_class'] : ''; ?>" size="20"/></td>
              </tr>



            </table>
          </div>
          <?php } ?>
        </div>



        <div id="tab-data">
          <table class="form">


            <tr>
              <td><span class="required">*</span> <?php echo $entry_name; ?></td>
              <td><input type="text" id="field_name" name="field_name" value="<?php echo $field_name; ?>" size="50"/></td>
            </tr>

            <tr>
              <td><span class="required">*</span> <?php echo $this->language->get('entry_type'); ?></td>
              <td>

              <?php
              $fileds_types = Array("text", "textarea", 'rating');

              ?>
               <select name="field_type">
                    <?php foreach ($fileds_types as $fields_type) { ?>
                    <?php if ($field_type == $fields_type) { ?>
                    <option value="<?php echo $fields_type; ?>" selected="selected"><?php echo $fields_type; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $fields_type; ?>"><?php echo $fields_type; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>


              </td>
            </tr>





            <tr>
              <td><?php echo $this->language->get('entry_must'); ?></td>
              <td><?php if ($field_must) { ?>
                <input type="checkbox" name="field_must" value="1" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="field_must" value="1" />
                <?php } ?></td>
            </tr>





            <tr>
              <td><?php echo $entry_image; ?></td>
              <td><div class="image"><img src="<?php echo $thumb; ?>" alt="" id="thumb" /><br />
                  <input type="hidden" name="field_image" value="<?php echo $field_image; ?>" id="image" />
                  <a onclick="image_upload('image', 'thumb');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$('#thumb').attr('src', '<?php echo $no_image; ?>'); $('#image').attr('value', '');"><?php echo $text_clear; ?></a></div></td>
            </tr>


             <tr>
              <td><?php echo $this->language->get('entry_public'); ?></td>
              <td><select name="field_public">
                  <?php if ($field_public) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>


             <tr>
              <td><?php echo $entry_status; ?></td>
              <td><select name="field_status">
                  <?php if ($field_status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>



            <tr>
              <td><?php echo $entry_sort_order; ?></td>
              <td><input type="text" name="field_order" value="<?php echo $field_order; ?>" size="2" /></td>
            </tr>
          </table>
        </div>









   </form>
    </div>
  </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>



<script language="javascript">
var myEditor = new Array();

function load_editor(idName, idHeight) {
	if (!myEditor[idName]) {
	    CKEDITOR.remove(idName);
		var html = $('#'+idName).html();
		var config = {
						filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
						filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
						filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
						filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
						filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
						filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
						enterMode 	: CKEDITOR.ENTER_BR,
						entities 	: false,
						htmlEncodeOutput : false


					};


		myEditor[idName] = CKEDITOR.replace(idName, config, html );

		CKEDITOR.remove(myEditor[idName]);
	} 	else {
		$('#'+idName).html(myEditor[idName].getData());
		// Destroy editor
		myEditor[idName].destroy();
		myEditor[idName] = null;
	}
}
</script>


<script type="text/javascript">
function image_upload(field, thumb) {
	$('#dialog').remove();

	$('#content').prepend('<div id="dialog" style="padding: 3px 0px 0px 0px;"><iframe src="index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field) + '" style="padding:0; margin: 0; display: block; width: 100%; height: 100%;" frameborder="no" scrolling="auto"></iframe></div>');

	$('#dialog').dialog({
		title: '<?php echo $text_image_manager; ?>',
		close: function (event, ui) {
			if ($('#' + field).attr('value')) {
				$.ajax({
					url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).attr('value')),
					dataType: 'text',
					success: function(text) {
						$('#' + thumb).replaceWith('<img src="' + text + '" alt="" id="' + thumb + '" />');
					}
				});
			}
		},
		bgiframe: false,
		width: 800,
		height: 400,
		resizable: false,
		modal: false
	});
};
</script>

<script type="text/javascript">
$('#tabs a').tabs();
$('#languages a').tabs();
</script>


<?php echo $footer; ?>