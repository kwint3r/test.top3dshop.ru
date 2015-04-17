<?php if ($records) { ?>

<?php if (preg_match("[Новости]",$heading_title)){?>
<div class="box" id="cmswidget-<?php echo $cmswidget; ?>" style="width:50%; display: inline-block;">
<?php } else { ?>
<div class="box" id="cmswidget-<?php echo $cmswidget; ?>" style="width:50%; display: inline-block;float: right;">

<?php } ?>
<?php if (preg_match("[Новости]",$heading_title)){?>
	<div class="box-heading" style="float: left;margin-left: 30px;font-weight: 800;"><?php echo $heading_title; ?><span style="margin-left: 40px;"> <a href="http://top3dshop.ru/novosti/novosti-kompanii/"style="line-height: 1.5;color: #276FC8;">Все</a></span></div>
	<?php } else { ?>
	<div class="box-heading" style="float: left;margin-left: 30px;font-weight: 800;"><?php echo $heading_title; ?> <span style="margin-left: 40px;"><a href="http://top3dshop.ru/news/"style="line-height: 1.5;color: #276FC8;">Все</a></span></div>
	<?php } ?>
	<div class="box-content">
		<div class="blog-record-list-small">
			<?php foreach ($records as $record) {  ?>
			<div style="height: 120px;">
				<?php if (isset ($record['settings_blog']['view_date']) && $record['settings_blog']['view_date'] ) { ?>
				<?php if (isset ($record['settings']['view_date']) && $record['settings']['view_date'] ) { ?>
				<?php if ($record['date_available']) { ?>
						<?php if ($record['thumb']) { ?>
				<?php if ($record['thumb'] && isset ($settings_widget['avatar_status']) && $settings_widget['avatar_status'] ) { ?>
				
				<div class="image blog-image">
					<a href="<?php echo $record['href']; ?>"><img src="<?php echo $record['thumb']; ?>" title="<?php echo $record['name']; ?>" alt="<?php echo $record['name']; ?>" /></a>
				</div>
				<?php } ?>
				<?php } ?>
				<div class="blog-date"><?php echo $record['date_available']; ?></div>
				<?php } ?>
				<?php } ?>
				<?php } ?>
				<div class="name marginbottom5" style="margin-left: 68px;">
					<?php if (isset ($record['settings']['category_status']) && $record['settings']['category_status'] ) { ?>
					<a href="<?php echo $record['blog_href']; ?>" class="blog-title" style="line-height: 1.5;color: #276fc8;"><?php echo $record['blog_name']; ?></a><ins class="blog-arrow">&nbsp;&rarr;&nbsp;</ins>
					<?php } ?>
					<a href="<?php echo $record['href']; ?>" class="blog-title" style="line-height: 1.5;color: #276fc8;"><?php echo $record['name']; ?></a>
				</div>
		
				<?php if (isset ($settings_widget['description_status']) && $settings_widget['description_status'] ) { ?>
				<div class="description" style="margin-top: 13px;color: #737373;font-size: 12px;font-family: Arial; "><?php echo $record['description']; ?>&nbsp;
					<a href="<?php echo $record['href']; ?>" class="blog_further"><?php if (isset($settings_general['further'][$this->config->get('config_language_id')])) echo html_entity_decode($settings_general['further'][$this->config->get('config_language_id')]); ?></a>
				</div>
				<?php } ?>
				<div>
					<?php if (isset ($record['settings_blog']['view_rating']) && $record['settings_blog']['view_rating'] ) { ?>
					<?php if (isset ($record['settings']['view_rating']) && $record['settings']['view_rating'] ) { ?>
					<?php if ($record['rating']) { ?>
					<div class="rating">
						<?php
							$themeFile = $this->getThemeFile('image/blogstars-'.$record['rating'].'.png');
							if ($themeFile) {
							?>
						<img style="border: 0px;"  title="<?php echo $record['rating']; ?>" alt="<?php echo $record['rating']; ?>" src="catalog/view/theme/<?php echo $themeFile; ?>">
						<?php } ?>
					</div>
					<?php } ?>
					<?php } ?>
					<?php } ?>
					<div>
						<?php if (isset ($record['settings_blog']['view_comments']) && $record['settings_blog']['view_comments'] ) { ?>
						<?php if ($record['settings_comment']['status']) { ?>
						<?php if (isset ($record['settings']['view_comments']) && $record['settings']['view_comments'] ) { ?>
						<div class="blog-light-small-text"><?php echo $text_comments; ?> <?php echo $record['comments']; ?></div>
						<?php } ?>
						<?php } ?>
						<?php } ?>
						<?php if (isset ($record['settings_blog']['view_viewed']) && $record['settings_blog']['view_viewed'] ) { ?>
						<?php if (isset ($record['settings']['view_viewed']) && $record['settings']['view_viewed'] ) { ?>
						<div class="blog-light-small-text"><?php echo $text_viewed; ?> <?php echo $record['viewed']; ?></div>
						<?php } ?>
						<?php } ?>
					</div>
					<div class="overflowhidden lineheight1 bordernone">&nbsp;</div>
				</div>
				<?php if ($userLogged)  { ?>
				<div class="blog-edit_container">
					<a class="zametki" target="_blank" href="<?php echo $admin_path; ?>index.php?route=catalog/record/update&token=<?php echo $this->session->data['token']; ?>&record_id=<?php echo $record['record_id']; ?>"><?php echo $this->language->get('text_edit');?></a>
				</div>
				<?php } ?>
				<div class="blog-child_divider" style="border: none;">&nbsp;</div>
			</div>
			<?php } ?>
		</div>
	</div>
	<div>
		<?php if (isset ($settings_widget['limit']) && $settings_widget['limit'] ) { ?>
		<div class="limit floatright">
			&nbsp;<b><?php echo $this->language->get('text_limit');?></b>
			<select onchange="location = this.value;">
				<?php foreach ($limits as $limits) { ?>
				<?php if ($limits['value'] == $limit) { ?>
				<option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
				<?php } ?>
				<?php } ?>
			</select>
		</div>
		<?php } ?>
		<?php if (isset ($settings_widget['sort']) && $settings_widget['sort'] ) { ?>
		<div class="sort floatright marginleft10">
			&nbsp;<b><?php echo $this->language->get('text_sort');?></b>
			<select onchange="location = this.value;">
				<!--   <select onchange="alert( this.value);"> -->
				<?php foreach ($sorts as $sorts) { ?>
				<?php if (strtolower($sorts['value']) == strtolower($sort . '-' . $order)) { ?>
				<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
				<?php } ?>
				<?php } ?>
			</select>
		</div>
		<?php } ?>
		<?php if (isset ($settings_widget['pagination']) && $settings_widget['pagination'] ) { ?>
		<div class="pagination margintop5"><?php echo $pagination; ?></div>
		<?php } ?>
	</div>
</div>
<?php if (isset($settings_widget['anchor']) && $settings_widget['anchor']!='') { ?>
<script>
	$(document).ready(function(){
	    var prefix = '<?php echo $prefix;?>';
	    var cmswidget = '<?php echo $cmswidget; ?>';
		var data = $('#cmswidget-<?php echo $cmswidget; ?>').html();
		<?php echo $settings_widget['anchor']; ?>;
		delete data;
		delete prefix;
		delete cmswidget;
		$('#cmswidget-<?php echo $cmswidget; ?>').remove();
	});
</script>
<?php  } ?>
<?php } ?>