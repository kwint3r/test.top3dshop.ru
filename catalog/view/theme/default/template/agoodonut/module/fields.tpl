<?php if (isset($fields) && !empty($fields)) {	?>
<div class="marginbottom5">
	<a href="#" class="hrefajax" onclick="$('.addfields').toggle(); return false;"><?php echo $this->language->get('entry_addfields_begin');  ?><ins class="lowercase"><?php
		$i=0;
		foreach   ($fields as $af_name => $field) {
			$i++;
		if (isset($field['field_description'][$this->config->get('config_language_id')])) {
		echo str_replace('?','',$field['field_description'][$this->config->get('config_language_id')]);
		if (count($fields)!=$i) echo ", ";
		}
		}
		?></ins></a>
</div>
<div class="addfields" style="<?php if (!$fields_view) echo 'display: none;'; ?>">
	<div style="width:100%;">
		<?php
			foreach ($fields as $af_name =>$field) {
			?>
		<div style="margin-bottom:5px;">
			<?php
				if (isset($field['field'][$this->config->get('config_language_id')]['field_class']) && $field['field'][$this->config->get('config_language_id')]['field_class']!='') {
					$class = $field['field'][$this->config->get('config_language_id')]['field_class'];
				} else {
					$class = '';
				}


				if ($class!='') {
				$field_class = $class;
				} else {
				$field_class = 'blog-record';
				}

				if ($field['field_must']=="1") {
				 $field_class.=' borderleft3pxred';
				}

				                 if ($field['field'][$this->config->get('config_language_id')]['field_template_in']!='') {

				                 $field_html = $field['field'][$this->config->get('config_language_id')]['field_template_in'];
				                 $field_text ='';

							if (isset($field['field_type']) && $field['field_type']=='rating') {

								if (isset($settings_widget['visual_rating']) && $settings_widget['visual_rating']) {

						            $field_text = '
									<div style="height: 25px;">
									    <input type="hidden" name="af['.$field['field_name'].']" value="">
									    <input type="radio" class="visual_star" name="af['.$field['field_name'].']" alt="#8c0000" title="'.$this->language->get('entry_bad').' 1" value="1" >
									    <input type="radio" class="visual_star" name="af['.$field['field_name'].']" alt="#8c4500" title="'.$this->language->get('entry_bad').' 2" value="2" >
									    <input type="radio" class="visual_star" name="af['.$field['field_name'].']" alt="#b6b300" title="'.$this->language->get('entry_bad').' 3" value="3" >
									    <input type="radio" class="visual_star" name="af['.$field['field_name'].']" alt="#698c00" title="'.$this->language->get('entry_bad').' 4" value="4" >
									    <input type="radio" class="visual_star" name="af['.$field['field_name'].']" alt="#008c00" title="'.$this->language->get('entry_bad').' 5" value="5" >
									   <div class="floatleft"  style="padding-top: 5px; "><b><ins class="color_entry_name marginleft10"><span id="hover-test" ></span></ins></b></div>
									   <div  class="bordernone overflowhidden width100  clearboth lineheight1"></div>
									</div>';

							} else {
										$field_text  = '
										<span><ins class="color_bad">'.$this->language->get('entry_bad').'</ins></span>&nbsp;
										    <input type="hidden" name="af['.$field['field_name'].']" value="">
										    <input type="radio"  name="af['.$field['field_name'].']" value="1">
										    <ins class="blog-ins_rating" style="">1</ins>
										    <input type="radio"  name="af['.$field['field_name'].']" value="2">
										    <ins class="blog-ins_rating" >2</ins>
										    <input type="radio"  name="af['.$field['field_name'].']" value="3">
										    <ins class="blog-ins_rating" >3</ins>
										    <input type="radio"  name="af['.$field['field_name'].']" value="4">
										    <ins class="blog-ins_rating" >4</ins>
										    <input type="radio"  name="af['.$field['field_name'].']" value="5">
										    <ins class="blog-ins_rating" >5</ins>
										   &nbsp;&nbsp; <span><ins  class="color_good">'.$this->language->get('entry_good').'</ins></span>
										';

								}
							}



				if (isset($field['field'][$this->config->get('config_language_id')]['field_class']) && $field['field'][$this->config->get('config_language_id')]['field_class']!='') {
				$class = $field['field'][$this->config->get('config_language_id')]['field_class'];
				} else {
				$class = '';
				}

				if ($class!='') {
				$field_class = $class;
				} else {
				$field_class = 'blog-record';
				}
				if ($field['field_must']=="1") {
				 $field_class.=' borderleft3pxred';
				}

				if (isset($field['field_type']) && $field['field_type']=='text') {
				$field_text = '<input type="text" name="af['.$field['field_name'].']" class="<?php echo $field_class; ?>">';
			}
			if ($class!='') {
			$field_class = $class;
			} else {
			$field_class = 'blog-record-textarea';
			}
			if ($field['field_must']=="1") {
			$field_class.=' borderleft3pxred';
			}
			if (isset($field['field_type']) && $field['field_type']=='textarea') {
			$field_text = '
			<textarea name="af['.$field['field_name'].']" cols="40" rows="1" class="<?php echo $field_class; ?>"></textarea>
			';
			}
			$field_html = str_replace('{FIELD}', $field_text, $field_html);
			if ($field['field_image']!='') {
			$field_html = str_replace('{IMAGE}', '<img src="'.$this->getHttpImage().$field['field_image'].'" title="'.$field['field_description'][$this->config->get('config_language_id')].'" alt="'.$field['field_description'][$this->config->get('config_language_id')].'">', $field_html);
			} else {
			$field_html = str_replace('{IMAGE}', '',$field_html);
			}
			if ($field['field_description'][$this->config->get('config_language_id')]!='') {
			$field_html = str_replace('{DESCRIPTION}',$field['field_description'][$this->config->get('config_language_id')], $field_html);
			} else {
			$field_html = str_replace('{DESCRIPTION}', '',$field_html);
			}
			?>
			<?php echo html_entity_decode($field_html, ENT_QUOTES, 'UTF-8') ; ?>
			<?php
				if (isset($field['field_must']) && $field['field_must']) {
			?>
			<span class="blog_require">*</span>
			<?php
				}
				?>
			<?php
				} else {
				?>
			<?php
				if ($field['field_image']!='') {
			?>
			<div style="width: 24px; float:left;">
				<img src="<?php echo $this->getHttpImage().$field['field_image']; ?>" title="<?php echo $field['field_description'][$this->config->get('config_language_id')]; ?>" alt="<?php echo $field['field_description'][$this->config->get('config_language_id')]; ?>">
			</div>
			<?php
				} else {
				 $themeFile = $this->getThemeFile('image/'.$field['field_name'].'.png');
				 if ($themeFile) {
				?>
			<div style="width: 24px; float:left;">
				<img src="catalog/view/theme/<?php echo $themeFile; ?>" title="<?php echo $field['field_description'][$this->config->get('config_language_id')]; ?>" alt="<?php echo $field['field_description'][$this->config->get('config_language_id')]; ?>">
			</div>
			<?php } else { ?>
			<div style="width: 24px; float:left;">&nbsp;</div>
			<?php
				}
				} ?>
			<div>
				<?php
					if (!isset($field['field_public'])) $field['field_public'] = true;

					if(!$field['field_public']) {
					$field['field_description'][$this->config->get('config_language_id')].=$this->language->get('text_unpublic');
					}
					?>
				<b><ins class="color_entry_name"><?php echo $field['field_description'][$this->config->get('config_language_id')]; ?></ins></b>
				<?php
					if (isset($field['field_must']) && $field['field_must']) {
					?>
				<span class="blog_require">*</span>
				<?php
					}
					?>
				<br>
				<?php
					if ((isset($field['field_type']) && $field['field_type']=='textarea') || !isset($field['field_type'])) {
						if ($class!='') {
							$field_class = $class;
							} else {
							$field_class = 'blog-record-textarea';
							}
					if ($field['field_must']=="1") {
					$field_class.=' borderleft3pxred';
					}
					?>
				<textarea name="af[<?php echo $field['field_name']; ?>]" cols="40" rows="1" class="<?php echo $field_class; ?>"></textarea>
				<?php
					}
					?>
				<?php
					if (isset($field['field_type']) && $field['field_type']=='text') {
						if ($class!='') {
							$field_class = $class;
							} else {
							$field_class = 'blog-record';
							}
					if ($field['field_must']=="1") {
					$field_class.=' borderleft3pxred';
					}
					?>
				<input type="text" name="af[<?php echo $field['field_name']; ?>]" class="<?php echo $field_class; ?>">
				<?php
					}
					?>
				<?php
					if (isset($field['field_type']) && $field['field_type']=='rating') {
					?>
				<?php if (isset($settings_widget['visual_rating']) && $settings_widget['visual_rating']) { ?>
				<div style="height: 25px;">
					<input type="hidden" name="af[<?php echo $field['field_name']; ?>]" value="">
					<input type="radio" class="visual_star" name="af[<?php echo $field['field_name']; ?>]" alt="#8c0000" title="<?php echo $this->language->get('entry_bad'); ?> 1" value="1" >
					<input type="radio" class="visual_star" name="af[<?php echo $field['field_name']; ?>]" alt="#8c4500" title="<?php echo $this->language->get('entry_bad'); ?> 2" value="2" >
					<input type="radio" class="visual_star" name="af[<?php echo $field['field_name']; ?>]" alt="#b6b300" title="<?php echo $this->language->get('entry_bad'); ?> 3" value="3" >
					<input type="radio" class="visual_star" name="af[<?php echo $field['field_name']; ?>]" alt="#698c00" title="<?php echo $this->language->get('entry_good'); ?> 4" value="4" >
					<input type="radio" class="visual_star" name="af[<?php echo $field['field_name']; ?>]" alt="#008c00" title="<?php echo $this->language->get('entry_good'); ?> 5" value="5" >
					<div class="floatleft"  style="padding-top: 5px; "><b><ins class="color_entry_name marginleft10"><span id="hover-test" ></span></ins></b></div>
					<div  class="bordernone overflowhidden width100  clearboth lineheight1"></div>
				</div>
				<?php } else { ?>
				<span><ins class="color_bad"><?php echo $this->language->get('entry_bad'); ?></ins></span>&nbsp;
				<input type="hidden" name="af[<?php echo $field['field_name']; ?>]" value="">
				<input type="radio"  name="af[<?php echo $field['field_name']; ?>]" value="1">
				<ins class="blog-ins_rating" style="">1</ins>
				<input type="radio"  name="af[<?php echo $field['field_name']; ?>]" value="2">
				<ins class="blog-ins_rating" >2</ins>
				<input type="radio"  name="af[<?php echo $field['field_name']; ?>]" value="3">
				<ins class="blog-ins_rating" >3</ins>
				<input type="radio"  name="af[<?php echo $field['field_name']; ?>]" value="4">
				<ins class="blog-ins_rating" >4</ins>
				<input type="radio"  name="af[<?php echo $field['field_name']; ?>]" value="5">
				<ins class="blog-ins_rating" >5</ins>
				&nbsp;&nbsp; <span><ins  class="color_good"><?php echo $this->language->get('entry_good'); ?></ins></span>
				<?php
					}
					}
					?>
			</div>
			<?php } ?>
		</div>
		<?php
			}
			?>
	</div>
</div>
<?php  } ?>