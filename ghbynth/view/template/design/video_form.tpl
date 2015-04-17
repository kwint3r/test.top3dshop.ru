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
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/banner.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <table class="form">
          <tr>
            <td><span class="required">*</span> <?php echo $entry_name; ?></td>
            <td><input type="text" name="name" value="<?php echo $name; ?>" size="100" />
              <?php if ($error_name) { ?>
              <span class="error"><?php echo $error_name; ?></span>
              <?php } ?></td>
          </tr>
          <tr>
            <td><?php echo $entry_status; ?></td>
            <td><select name="status">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select></td>
          </tr>
        </table>
        <table id="images" class="list">
          <thead>
            <tr>
              <td class="left" style="width: 45%"><?php echo $entry_title; ?></td>
              <td class="left" style="width: 45%"><?php echo $entry_link; ?></td>
              <td style="width: 10%"></td>
            </tr>
          </thead>
          <?php $image_row = 0; ?>
          <?php foreach ($video_players as $video_player) { ?>
          <tbody id="image-row<?php echo $image_row; ?>">
            <tr>
              <td class="left" style="width: 45%"><?php foreach ($languages as $language) { ?>
                <input size="100" type="text" name="video_player[<?php echo $image_row; ?>][video_player_description][<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($video_player['video_player_description'][$language['language_id']]) ? $video_player['video_player_description'][$language['language_id']]['title'] : ''; ?>" />
                <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                <?php if (isset($error_video_player[$image_row][$language['language_id']])) { ?>
                <span class="error"><?php echo $error_video_player[$image_row][$language['language_id']]; ?></span>
                <?php } ?>
                <?php } ?></td>
              <td class="left" style="width: 40%"><input size="100" type="text" name="video_player[<?php echo $image_row; ?>][link]" value="<?php echo $video_player['link']; ?>" /></td>
              <td class="left" style="width: 15%"><a onclick="$('#image-row<?php echo $image_row; ?>').remove();" class="button"><?php echo $button_remove; ?></a></td>
            </tr>
          </tbody>
          <?php $image_row++; ?>
          <?php } ?>
          <tfoot>
            <tr>
              <td colspan="2"></td>
              <td class="left"><a onclick="addImage();" class="button"><?php echo $button_add_video; ?></a></td>
            </tr>
          </tfoot>
        </table>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
var image_row = <?php echo $image_row; ?>;

function addImage() {
    html  = '<tbody id="image-row' + image_row + '">';
	html += '<tr>';
    html += '<td class="left" style="width: 45%">';
	<?php foreach ($languages as $language) { ?>
	html += '<input type="text" size="100" name="video_player[' + image_row + '][video_player_description][<?php echo $language['language_id']; ?>][title]" value="" /> <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />';
    <?php } ?>
	html += '</td>';	
	html += '<td class="left" style="width: 40%"><input size="100" type="text" name="video_player[' + image_row + '][link]" value="" /></td>';	
	html += '<td class="left" style="width: 15%"><a onclick="$(\'#image-row' + image_row  + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
	html += '</tr>';
	html += '</tbody>'; 
	
	$('#images tfoot').before(html);
	
	image_row++;
}
//--></script>
<?php echo $footer; ?>
