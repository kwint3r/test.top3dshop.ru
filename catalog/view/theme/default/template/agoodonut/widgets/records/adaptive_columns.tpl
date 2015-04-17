<?php if ($records) { ?>
<?php if (isset ($settings_widget['reserved']) && $settings_widget['reserved'] ) {
	echo html_entity_decode($settings_widget['reserved'], ENT_QUOTES, 'UTF-8');
	} ?>
<span id="cmswidget-<?php echo $cmswidget; ?>">
	<div class="box">
		<div class="box-heading"><?php echo $heading_title; ?></div>
		<div class="box-content">
			<div class="record_columns">
				<?php foreach ($records as $record) { ?>
				<div class=" cmswidget-<?php echo $cmswidget; ?>">
					<div class="blog-child_divider"> </div>
					<div class="marginbottom5">
						<?php if (isset ($record['settings']['category_status']) && $record['settings']['category_status'] ) { ?>
						<a href="<?php echo $record['blog_href']; ?>" class="blog-title"><?php echo $record['blog_name']; ?></a><ins class="blog-arrow">&nbsp;&rarr;&nbsp;</ins>
						<?php } ?>
						<a href="<?php echo $record['href']; ?>" class="blog-title"><?php echo $record['name']; ?></a>
					</div>
					<?php if ($record['thumb'] || count($record['images']) > 0) { ?>
					<div class="image blog-image">
						<?php if ($record['thumb'] && isset ($settings_widget['avatar_status']) && $settings_widget['avatar_status'] ) { ?>
						<div>
							<a href="<?php echo $record['href']; ?>"><img src="<?php echo $record['thumb']; ?>" title="<?php echo $record['name']; ?>" alt="<?php echo $record['name']; ?>" /></a>
						</div>
						<?php } ?>
						<?php if (isset ($record['settings_blog']['images_view']) && $record['settings_blog']['images_view'] ) { ?>
						<?php if (isset ($record['settings']['images_view']) && $record['settings']['images_view'] ) { ?>
						<?php foreach ($record['images'] as $numi => $images) { ?>
						<div class="image blog-image">
							<a class="imagebox" rel="imagebox" title="<?php echo $images['title']; ?>" href="<?php echo $images['popup']; ?>">
							<img alt="<?php echo $images['title']; ?>" title="<?php echo $images['title']; ?>" src="<?php echo $images['thumb']; ?>">
							</a>
						</div>
						<?php } ?>
						<?php } ?>
						<?php } ?>
					</div>
					<?php } ?>
					<?php if (isset ($settings_widget['description_status']) && $settings_widget['description_status'] ) { ?>
					<div class="blogdescription  margintop5"><?php echo $record['description']; ?>&nbsp;
						<a href="<?php echo $record['href']; ?>" class="blog_further"><?php if (isset($settings_general['further'][$this->config->get('config_language_id')])) echo html_entity_decode($settings_general['further'][$this->config->get('config_language_id')]); ?></a>
					</div>
					<?php } ?>
					<div class="overflowhidden width100 lineheight1">&nbsp;</div>
					<div class="name marginbottom5">
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
							<?php if (isset ($record['settings_blog']['view_date']) && $record['settings_blog']['view_date'] ) { ?>
							<?php if (isset ($record['settings']['view_date']) && $record['settings']['view_date'] ) { ?>
							<?php if ($record['date_available']) { ?>
							<div class="blog-date"><?php echo $record['date_available']; ?></div>
							<?php } ?>
							<?php } ?>
							<?php } ?>
							<div>
								<?php if (isset ($record['settings_blog']['view_comments']) && $record['settings_blog']['view_comments'] ) { ?>
								<?php if (isset ($record['settings']['view_comments']) && $record['settings']['view_comments'] ) { ?>
								<?php if ($record['settings_comment']['status']) { ?>
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
							<div class="overflowhidden lineheight1">&nbsp;</div>
						</div>
						<?php
							if ($userLogged)    {
							?>
						<div class="blog-edit_container">
							<a class="zametki" target="_blank" href="<?php echo $admin_path; ?>index.php?route=catalog/record/update&token=<?php echo $this->session->data['token']; ?>&record_id=<?php echo $record['record_id']; ?>"><?php echo $this->language->get('text_edit');?></a>
						</div>
						<?php
							}
							?>
					</div>
				</div>
				<?php } ?>
			</div>
			<?php if (isset ($settings_widget['category_button']) && $settings_widget['category_button'] ) { ?>
			<?php
				reset($records);
				foreach ($records as $num => $record) {
				 $category[$record['blog_name']]= $record['blog_href'];
				}

				?>
			<div class="record_columns marginbottom5 textalignright">
				<?php foreach ($category as $name => $href) { ?>
				<div class="textcatbutton">
					<a href="<?php echo $href; ?>" class="button"><?php echo $this->language->get('text_all_begin'); ?><?php echo utf8_strtolower($name); ?><?php echo $this->language->get('text_all_end'); ?></a>
				</div>
				<?php } ?>
			</div>
			<?php } ?>
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
	</div>
</span>
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