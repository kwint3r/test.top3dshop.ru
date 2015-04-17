<?php echo $header; ?>
<link rel="stylesheet" media="screen" type="text/css" href="view/javascript/colorpicker-opencatmenu/css/colorpicker.css" />
<script type="text/javascript" src="view/javascript/colorpicker-opencatmenu/js/colorpicker.js"></script>
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
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a></div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
        <div class="vtabs">
          <?php $module_row = 1; ?>
          <?php foreach ($modules as $module) { ?>
          <a href="#tab-module-<?php echo $module_row; ?>" id="module-<?php echo $module_row; ?>"><?php echo $tab_module . ' ' . $module_row; ?>&nbsp;<img src="view/image/delete.png" alt="" onclick="$('.vtabs a:first').trigger('click'); $('#module-<?php echo $module_row; ?>').remove(); $('#tab-module-<?php echo $module_row; ?>').remove(); return false;" /></a>
          <?php $module_row++; ?>
          <?php } ?>
          <span id="module-add" onclick="addModule();" style="cursor: pointer;"><?php echo $button_add_menu; ?>&nbsp;<img src="view/image/add.png" /></span> 
		</div>
        <?php $module_row = 1; ?>
        <?php foreach ($modules as $module) { ?>
        <div id="tab-module-<?php echo $module_row; ?>" class="vtabs-content">
          <div id="language-<?php echo $module_row; ?>" class="htabs">
            <?php foreach ($languages as $language) { ?>
            <a href="#tab-language-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
            <?php } ?>
          </div>
          <?php foreach ($languages as $language) { ?>
          <div id="tab-language-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>" style="border-bottom: 1px solid #DDDDDD;">
            <table class="form">
              <tr>
                <td style="border: none;"><?php echo $entry_title; ?></td>
                <td style="border: none;"><input type="text" name="opencatmenu_module[<?php echo $module_row; ?>][opencatmenu_title][<?php echo $language['language_id']; ?>]" id="description-<?php echo $module_row; ?>-<?php echo $language['language_id']; ?>" value="<?php echo isset($module['opencatmenu_title'][$language['language_id']]) ? $module['opencatmenu_title'][$language['language_id']] : ''; ?>" size="60" /></td>
              </tr>
            </table>
          </div>
          <?php } ?>
        <table class="form" style="width: 50%;float: left;">
			<tr>
			  <td><?php echo $entry_image; ?></td>
			  <input type="hidden" name="opencatmenu_module[<?php echo $module_row; ?>][num]" value="<?php echo $module_row; ?>" />
                <td><select name="opencatmenu_module[<?php echo $module_row; ?>][image_active]">
                  <?php if ($module['image_active']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
				</td>
			</tr> 
			<tr>
			  <td><?php echo $entry_config_image_opencatmenu_width; ?></td>
				<td><input type="text" name="opencatmenu_module[<?php echo $module_row; ?>][config_image_opencatmenu_width]" value="<?php echo $module['config_image_opencatmenu_width']; ?>" size="5" /> px</td>
			</tr> 
			<tr>
			  <td><?php echo $entry_config_image_opencatmenu_height; ?></td>
				<td><input type="text" name="opencatmenu_module[<?php echo $module_row; ?>][config_image_opencatmenu_height]" value="<?php echo $module['config_image_opencatmenu_height']; ?>" size="5" /> px</td>
			</tr> 
			<tr>
			  <td><?php echo $entry_image_sub; ?></td>
                <td>
				<select name="opencatmenu_module[<?php echo $module_row; ?>][imagesub_active]">
                  <?php if ($module['imagesub_active']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
				</td>
			</tr> 
			<tr>
              <td><?php echo $entry_config_subimage_opencatmenu_width; ?></td>
				<td><input type="text" name="opencatmenu_module[<?php echo $module_row; ?>][config_subimage_opencatmenu_width]" value="<?php echo $module['config_subimage_opencatmenu_width']; ?>" size="5" /> px</td>
			</tr> 
			<tr>
			  <td><?php echo $entry_config_subimage_opencatmenu_height; ?></td>
				<td><input type="text" name="opencatmenu_module[<?php echo $module_row; ?>][config_subimage_opencatmenu_height]" value="<?php echo $module['config_subimage_opencatmenu_height']; ?>" size="5" /> px</td>
			</tr> 
			<tr>
			  <td><?php echo $entry_description; ?></td>
                <td><select name="opencatmenu_module[<?php echo $module_row; ?>][description_active]">
                  <?php if ($module['description_active']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
			</tr> 
			<tr>
			  <td><?php echo $entry_description_title; ?></td>
				<td><input type="text" name="opencatmenu_module[<?php echo $module_row; ?>][entry_description_count]" value="<?php echo $module['entry_description_count']; ?>" size="5" /></td>
			</tr> 
			<tr>
			  <td><?php echo $entry_description_sub; ?></td>
				<td><select name="opencatmenu_module[<?php echo $module_row; ?>][description_sub_active]">
                  <?php if ($module['description_sub_active']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
			</tr> 
			<tr>
			  <td><?php echo $entry_description_sub_title; ?></td>
				<td><input type="text" name="opencatmenu_module[<?php echo $module_row; ?>][entry_description_sub_count]" value="<?php echo $module['entry_description_sub_count']; ?>" size="5" /></td>	
            </tr>
			<tr>
			  <td><?php echo $entry_sister_category; ?></td>
				<td><select name="opencatmenu_module[<?php echo $module_row; ?>][entry_sister_category]">
                  <?php if ($module['entry_sister_category']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
			</tr>
			<tr>
			  <td><?php echo $entry_popup_level; ?></td>
				<td><select name="opencatmenu_module[<?php echo $module_row; ?>][entry_popup_level]">
                  <?php if ($module['entry_popup_level']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
			</tr>
			<tr>
			  <td><?php echo $entry_popup_level_speed; ?></td>
				<td><input type="text" name="opencatmenu_module[<?php echo $module_row; ?>][entry_popup_level_speed]" value="<?php echo $module['entry_popup_level_speed']; ?>" size="5" /> mc</td>	
            </tr>
			<tr>
			  <td><?php echo $entry_delay_category; ?></td>
				<td><select name="opencatmenu_module[<?php echo $module_row; ?>][delay_category]">
                  <?php if ($module['delay_category']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
			</tr>
			<tr>
			  <td><?php echo $entry_size_delay_category; ?></td>
				<td><input type="text" name="opencatmenu_module[<?php echo $module_row; ?>][size_delay_category]" value="<?php echo $module['size_delay_category']; ?>" size="5" /> mc</td>	
            </tr>
        </table>
        <table class="form" style="width: 50%;float: left;">
			<tr>
			  <td><?php echo $entry_background; ?></td>
				<td># <input id="cpocm1" type="text" name="opencatmenu_module[<?php echo $module_row; ?>][entry_background]" value="<?php echo $module['entry_background']; ?>" size="10" />
				</td>
			</tr> 
			<tr>
			  <td><?php echo $entry_background_hover; ?></td>
				<td># <input id="cpocm2" type="text" name="opencatmenu_module[<?php echo $module_row; ?>][entry_background_hover]" value="<?php echo $module['entry_background_hover']; ?>" size="10" />
				</td>
			</tr> 
			<tr>
			  <td><?php echo $entry_color; ?></td>
				<td># <input id="cpocm3" type="text" name="opencatmenu_module[<?php echo $module_row; ?>][entry_color]" value="<?php echo $module['entry_color']; ?>" size="10" />
				</td>
			</tr> 
			<tr>
			  <td><?php echo $entry_size; ?></td>
				<td><input type="text" name="opencatmenu_module[<?php echo $module_row; ?>][entry_size]" value="<?php echo $module['entry_size']; ?>" size="5" /> px
				</td>
			</tr> 
			<tr>
			  <td><?php echo $entry_desc_color; ?></td>
				<td># <input id="cpocm4" type="text" name="opencatmenu_module[<?php echo $module_row; ?>][entry_desc_color]" value="<?php echo $module['entry_desc_color']; ?>" size="10" />
				</td>
			</tr> 
			<tr>
			  <td><?php echo $entry_desc_size; ?></td>
				<td><input type="text" name="opencatmenu_module[<?php echo $module_row; ?>][entry_desc_size]" value="<?php echo $module['entry_desc_size']; ?>" size="5" /> px
				</td>
			</tr> 
			<tr>
			  <td><?php echo $entry_title_background; ?></td>
				<td># <input id="cpocm5" type="text" name="opencatmenu_module[<?php echo $module_row; ?>][entry_title_background]" value="<?php echo $module['entry_title_background']; ?>" size="10" />
				</td>
			</tr> 
			<tr>
			  <td><?php echo $entry_title_color; ?></td>
				<td># <input id="cpocm6" type="text" name="opencatmenu_module[<?php echo $module_row; ?>][entry_title_color]" value="<?php echo $module['entry_title_color']; ?>" size="10" />
				</td>
			</tr> 
			<tr>
			  <td><?php echo $entry_title_size; ?></td>
				<td><input type="text" name="opencatmenu_module[<?php echo $module_row; ?>][entry_title_size]" value="<?php echo $module['entry_title_size']; ?>" size="5" /> px
				</td>
			</tr> 
			<tr>
			  <td><?php echo $entry_border_color; ?></td>
				<td># <input id="cpocm7" type="text" name="opencatmenu_module[<?php echo $module_row; ?>][entry_border_color]" value="<?php echo $module['entry_border_color']; ?>" size="10" />
				</td>
			</tr> 
			<tr>
			  <td><?php echo $entry_sister_size; ?></td>
				<td><input type="text" name="opencatmenu_module[<?php echo $module_row; ?>][entry_sister_size]" value="<?php echo $module['entry_sister_size']; ?>" size="5" /> px
				</td>
			</tr>
			<tr>
			  <td><?php echo $entry_popup_background_hover; ?></td>
				<td># <input id="cpocm8" type="text" name="opencatmenu_module[<?php echo $module_row; ?>][popup_background_hover]" value="<?php echo $module['popup_background_hover']; ?>" size="10" />
				</td>
			</tr> 
			<tr>
			  <td><?php echo $entry_link_color_hover; ?></td>
				<td># <input id="cpocm9" type="text" name="opencatmenu_module[<?php echo $module_row; ?>][link_color_hover]" value="<?php echo $module['link_color_hover']; ?>" size="10" />
				</td>
			</tr> 
		</table>
        <table id="module" class="list" style="margin-top: 20px;">
        <thead>
            <tr>
                <td class="left"><?php echo $entry_layout; ?></td>
                <td class="left"><?php echo $entry_position; ?></td>
                <td class="left"><?php echo $entry_status; ?></td>
	            <td class="left"><?php echo $entry_count; ?></td>  
                <td class="left"><?php echo $entry_sort_order; ?></td>   
            </tr>
        </thead>
        <tbody id="module-row<?php echo $module_row; ?>">
            <tr>
                <td class="left">
                    <select name="opencatmenu_module[<?php echo $module_row; ?>][layout_id]">
                    <?php foreach ($layouts as $layout) { ?>
                    <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                    <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                    </select>
                </td>
                <td class="left">
                    <select name="opencatmenu_module[<?php echo $module_row; ?>][position]">
                    <?php if ($module['position'] == 'column_left') { ?>
                    <option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>
                    <?php } else { ?>
                    <option value="column_left"><?php echo $text_column_left; ?></option>
                    <?php } ?>
                    <?php if ($module['position'] == 'column_right') { ?>
                    <option value="column_right" selected="selected"><?php echo $text_column_right; ?></option>
                    <?php } else { ?>
                    <option value="column_right"><?php echo $text_column_right; ?></option>
                    <?php } ?>
                    </select>
                </td>
                <td class="left">
                    <select name="opencatmenu_module[<?php echo $module_row; ?>][status]">
                    <?php if ($module['status']) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?>
                    </select>
                </td>     
	            <td class="left">
	                <select name="opencatmenu_module[<?php echo $module_row; ?>][count]">
                    <?php if ($module['count']) { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                    <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                    <?php } ?></select>
				</td>
                <td class="left"><input type="text" name="opencatmenu_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
            </tr>
        </tbody>
        </table>
        </div>
        <?php $module_row++; ?>
        <?php } ?>
      </form>
    </div>
  </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {	
	html  = '<div id="tab-module-' + module_row + '" class="vtabs-content">';
	html += '  <div id="language-' + module_row + '" class="htabs">';
    <?php foreach ($languages as $language) { ?>
    html += '    <a href="#tab-language-'+ module_row + '-<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>';
    <?php } ?>
	html += '  </div>';

	<?php foreach ($languages as $language) { ?>
	html += '    <div id="tab-language-'+ module_row + '-<?php echo $language['language_id']; ?>" style="border-bottom: 1px solid #DDDDDD;">';
	html += '      <table class="form">';
	html += '        <tr>';
	html += '          <td style="border: none;"><?php echo $entry_title; ?></td>';
	html += '          <td style="border: none;"><input name="opencatmenu_module[' + module_row + '][opencatmenu_title][<?php echo $language['language_id']; ?>]" id="description-' + module_row + '-<?php echo $language['language_id']; ?>"  size="60"></input></td>';
	html += '        </tr>';
	html += '      </table>';
	html += '    </div>';
	<?php } ?>

	html += '  <table class="form" style="width: 50%;float: left;">';
	html += '    <tr>';
	html += '      <td><?php echo $entry_image; ?></td>';
	html += '         <input type="hidden" name="opencatmenu_module[' + module_row + '][num]" value="' + module_row + '" />';
	html += '      <td><select name="opencatmenu_module[' + module_row + '][image_active]">';
	html += '        <option value="1"><?php echo $text_enabled; ?></option>';
	html += '        <option value="0"><?php echo $text_disabled; ?></option>';
	html += '      </select></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_config_image_opencatmenu_width; ?></td>';
	html += '      <td><input type="text" name="opencatmenu_module[' + module_row + '][config_image_opencatmenu_width]" value="30" size="5" /> px</td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_config_image_opencatmenu_height; ?></td>';
	html += '      <td><input type="text" name="opencatmenu_module[' + module_row + '][config_image_opencatmenu_height]" value="30" size="5" /> px</td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_image_sub; ?></td>';
	html += '      <td><select name="opencatmenu_module[' + module_row + '][imagesub_active]">';
	html += '        <option value="1"><?php echo $text_enabled; ?></option>';
	html += '        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>';
	html += '      </select></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_config_subimage_opencatmenu_width; ?></td>';
	html += '      <td><input type="text" name="opencatmenu_module[' + module_row + '][config_subimage_opencatmenu_width]" value="20" size="5" /> px</td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_config_subimage_opencatmenu_height; ?></td>';
	html += '      <td><input type="text" name="opencatmenu_module[' + module_row + '][config_subimage_opencatmenu_height]" value="20" size="5" /> px</td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_description; ?></td>';
	html += '      <td><select name="opencatmenu_module[' + module_row + '][description_active]">';
	html += '        <option value="1"><?php echo $text_enabled; ?></option>';
	html += '        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>';
	html += '      </select></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_description_title; ?></td>';
	html += '      <td><input type="text" name="opencatmenu_module[' + module_row + '][entry_description_count]" value="50" size="5" /></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_description_sub; ?></td>';
	html += '      <td><select name="opencatmenu_module[' + module_row + '][description_sub_active]">';
	html += '        <option value="1"><?php echo $text_enabled; ?></option>';
	html += '        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>';
	html += '      </select></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_description_sub_title; ?></td>';
	html += '      <td><input type="text" name="opencatmenu_module[' + module_row + '][entry_description_sub_count]" value="50" size="5" /></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_sister_category; ?></td>';
	html += '      <td><select name="opencatmenu_module[' + module_row + '][entry_sister_category]">';
	html += '        <option value="1"><?php echo $text_enabled; ?></option>';
	html += '        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>';
	html += '      </select></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_popup_level; ?></td>';
	html += '      <td><select name="opencatmenu_module[' + module_row + '][entry_popup_level]">';
	html += '        <option value="1"><?php echo $text_enabled; ?></option>';
	html += '        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>';
	html += '      </select></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_popup_level_speed; ?></td>';
	html += '      <td><input type="text" name="opencatmenu_module[' + module_row + '][entry_popup_level_speed]" value="300" size="5" /> mc</td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_delay_category; ?></td>';
	html += '      <td><select name="opencatmenu_module[' + module_row + '][delay_category]">';
	html += '        <option value="1"><?php echo $text_enabled; ?></option>';
	html += '        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>';
	html += '      </select></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_size_delay_category; ?></td>';
	html += '      <td><input type="text" name="opencatmenu_module[' + module_row + '][size_delay_category]" value="300" size="5" /> mc</td>';
	html += '    </tr>';
	html += '  </table>'; 
	
	html += '  <table class="form" style="width: 50%;float: left;">';
	html += '    <tr>';
	html += '      <td><?php echo $entry_background; ?></td>';
	html += '      <td># <input id="cpocm1" type="text" name="opencatmenu_module[' + module_row + '][entry_background]" value="" size="10" /></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_background_hover; ?></td>';
	html += '      <td># <input id="cpocm2" type="text" name="opencatmenu_module[' + module_row + '][entry_background_hover]" value="" size="10" /></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_color; ?></td>';
	html += '      <td># <input id="cpocm3" type="text" name="opencatmenu_module[' + module_row + '][entry_color]" value="" size="10" /></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_size; ?></td>';
	html += '      <td><input type="text" name="opencatmenu_module[' + module_row + '][entry_size]" value="" size="5" /> px</td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_desc_color; ?></td>';
	html += '      <td># <input id="cpocm4" type="text" name="opencatmenu_module[' + module_row + '][entry_desc_color]" value="" size="10" /></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_desc_size; ?></td>';
	html += '      <td><input type="text" name="opencatmenu_module[' + module_row + '][entry_desc_size]" value="" size="5" /> px</td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_title_background; ?></td>';
	html += '      <td># <input id="cpocm5" type="text" name="opencatmenu_module[' + module_row + '][entry_title_background]" value="" size="10" /></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_title_color; ?></td>';
	html += '      <td># <input id="cpocm6" type="text" name="opencatmenu_module[' + module_row + '][entry_title_color]" value="" size="10" /></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_title_size; ?></td>';
	html += '      <td><input type="text" name="opencatmenu_module[' + module_row + '][entry_title_size]" value="" size="5" /> px</td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_border_color; ?></td>';
	html += '      <td># <input id="cpocm7" type="text" name="opencatmenu_module[' + module_row + '][entry_border_color]" value="" size="10" /></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_sister_size; ?></td>';
	html += '      <td><input type="text" name="opencatmenu_module[' + module_row + '][entry_sister_size]" value="" size="5" /> px</td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_popup_background_hover; ?></td>';
	html += '      <td># <input id="cpocm8" type="text" name="opencatmenu_module[' + module_row + '][popup_background_hover]" value="" size="10" /></td>';
	html += '    </tr>';
	html += '    <tr>';
	html += '      <td><?php echo $entry_link_color_hover; ?></td>';
	html += '      <td># <input id="cpocm9" type="text" name="opencatmenu_module[' + module_row + '][link_color_hover]" value="" size="10" /></td>';
	html += '    </tr>';
	html += '  </table>'; 
	
	html += '  <table id="module" class="list"><thead><tr>';
	html += '    <td class="left"><?php echo $entry_layout; ?></td>';
	html += '    <td class="left"><?php echo $entry_position; ?></td>';
	html += '    <td class="left"><?php echo $entry_status; ?></td>';
	html += '    <td class="left"><?php echo $entry_count; ?></td>';
	html += '    <td class="left"><?php echo $entry_sort_order; ?></td>';
	html += '   </tr></thead>';
	html += '   <tbody id="module-row' + module_row + '"><tr><td class="left">';
	html += '    <select name="opencatmenu_module[' + module_row + '][layout_id]">';
	<?php foreach ($layouts as $layout) { ?>
	html += '      <option value="<?php echo $layout["layout_id"]; ?>"><?php echo $layout["name"]; ?></option>';
	<?php } ?>
	html += '      </select></td>';
	html += '    <td class="left"><select name="opencatmenu_module[' + module_row + '][position]">';
	html += '      <option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>';
	html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><select name="opencatmenu_module[' + module_row + '][status]">';
	html += '      <option value="1"><?php echo $text_enabled; ?></option>';
	html += '      <option value="0"><?php echo $text_disabled; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><select name="opencatmenu_module[' + module_row + '][count]">';
	html += '      <option value="0"><?php echo $text_disabled; ?></option>';
	html += '      <option value="1"><?php echo $text_enabled; ?></option>';
	html += '    </select></td>';
	html += '    <td class="left"><input type="text" name="opencatmenu_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
	html += '   </tr></tbody></table>';
	html += '</div>';
	
	$('#form').append(html);
	
	$('#language-' + module_row + ' a').tabs();
	
	$('#module-add').before('<a href="#tab-module-' + module_row + '" id="module-' + module_row + '"><?php echo $tab_module; ?> ' + module_row + '&nbsp;<img src="view/image/delete.png" alt="" onclick="$(\'.vtabs a:first\').trigger(\'click\'); $(\'#module-' + module_row + '\').remove(); $(\'#tab-module-' + module_row + '\').remove(); return false;" /></a>');
	
	$('.vtabs a').tabs();
	
	$('#cpocm1, #cpocm2, #cpocm3, #cpocm4, #cpocm5, #cpocm6, #cpocm7, #cpocm8, #cpocm9').ColorPicker({
	onSubmit: function(hsb, hex, rgb, el) {
		$(el).val(hex);
		$(el).ColorPickerHide();
	},
	onBeforeShow: function () {
		$(this).ColorPickerSetColor(this.value);
	}
    })
    .bind('keyup', function(){
	$(this).ColorPickerSetColor(this.value);
    });
	
	$(document).ready(function() {
    $(".form tr:even").css("background-color", "#F6F6F6");
    });
	
	$('#module-' + module_row).trigger('click');
	
	module_row++;
}
//--></script> 
<script type="text/javascript"><!--
$('.vtabs a').tabs();
//--></script> 
<script type="text/javascript"><!--
<?php $module_row = 1; ?>
<?php foreach ($modules as $module) { ?>
$('#language-<?php echo $module_row; ?> a').tabs();
<?php $module_row++; ?>
<?php } ?> 
//--></script> 
<script type="text/javascript"><!--
$('#cpocm1, #cpocm2, #cpocm3, #cpocm4, #cpocm5, #cpocm6, #cpocm7, #cpocm8, #cpocm9').ColorPicker({
	onSubmit: function(hsb, hex, rgb, el) {
		$(el).val(hex);
		$(el).ColorPickerHide();
	},
	onBeforeShow: function () {
		$(this).ColorPickerSetColor(this.value);
	}
})
.bind('keyup', function(){
	$(this).ColorPickerSetColor(this.value);
});
//--></script> 
<script type="text/javascript"><!--
    $(document).ready(function() {
    $(".form tr:even").css("background-color", "#F6F6F6");
});
//--></script>
<?php echo $footer; ?>