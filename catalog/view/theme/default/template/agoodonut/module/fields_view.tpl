<div style="width:100%;">
<?php
		foreach ($comment['fields'] as $af_name =>$field) {
		if (!isset($field['field_public'])) $field['field_public'] = true;
					if($field['value']!="" && $field['field_public']) {
		?>
	<div style="margin-bottom:5px;">
		<?php
			if ($field['field'][$this->config->get('config_language_id')]['field_template_out']!='') {

			$field_html = $field['field'][$this->config->get('config_language_id')]['field_template_out'];

			if ($field['field_type']=='rating') {
			    if ($field['value']!= "0") {
					$themeFile = $this->getThemeFile('image/blogstars-'.$field['value'].'.png');
					if ($themeFile) {
					$field_html = str_replace('{FIELD}', '<img style="border: 0px;"  title="'.$field['value'].'" alt="'.$field['value'].'" src="catalog/view/theme/'.$themeFile.'">', $field_html);
					}
				}
			} else {
				$field_html = str_replace('{FIELD}', $field['value'], $field_html);
			}

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
			} else {
			?>
		<div style="width: 24px; float:left;">
			<?php
				if ($field['value']!= "0") {
					if ($field['field_image']!='') {
				 ?>
			<img src="<?php echo $this->getHttpImage().$field['field_image']; ?>" title="<?php echo $field['field_description'][$this->config->get('config_language_id')]; ?>" alt="<?php echo $field['field_description'][$this->config->get('config_language_id')]; ?>">
			<?php
				} else {
				$themeFile = $this->getThemeFile('image/'.$field['field_name'].'.png');
				if ($themeFile) {
				?>
			<img src="catalog/view/theme/<?php echo $themeFile; ?>" title="<?php echo $field['field_description'][$this->config->get('config_language_id')]; ?>" alt="<?php echo $field['field_description'][$this->config->get('config_language_id')]; ?>">
			<?php } } } ?>
		</div>
		<div>
			<?php
				if ($field['field_type']=='rating') {
				                      if ($field['value']!= "0") {
					$themeFile = $this->getThemeFile('image/blogstars-'.$field['value'].'.png');
					if ($themeFile) {
					?>
			<ins class="field_title"><?php echo $field['field_description'][$this->config->get('config_language_id')]; ?>:&nbsp;</ins><img style="border: 0px;"  title="<?php echo $field['value']; ?>" alt="<?php echo $field['value']; ?>" src="catalog/view/theme/<?php echo $themeFile; ?>">
			<?php } }
				} else {
				?>
			<ins class="field_title"><?php echo $field['field_description'][$this->config->get('config_language_id')]; ?>:&nbsp;</ins><ins class="field_text"><?php echo $field['value']; ?></ins>
			<?php } ?>
		</div>
		<?php } ?>
	</div>
	<?php
		}
	  }
?>
</div>