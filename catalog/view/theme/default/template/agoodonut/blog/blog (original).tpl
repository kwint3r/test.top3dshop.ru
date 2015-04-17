<?php echo $header; ?>

<div class="breadcrumb full-width">
<div class="background-breadcrumb"></div>
<div class="background">
<div class="shadow"></div>
<div class="pattern">
<div class="container">
<div class="clearfix">
<span xmlns:v="http://rdf.data-vocabulary.org/#">
<?php $i=0; foreach ($breadcrumbs as $breadcrumb) { $i++; ?>
<span typeof="v:Breadcrumb">
<?php echo $breadcrumb['separator']; ?><?php if (count($breadcrumbs)!= $i) { ?><a href="<?php echo $breadcrumb['href']; ?>" rel="v:url" property="v:title" title="<?php echo $breadcrumb['text']; ?>" alt="<?php echo $breadcrumb['text']; ?>"><?php } ?><?php echo $breadcrumb['text']; ?><?php if (count($breadcrumbs)!=$i) { ?></a><?php } ?>
</span>
<?php } ?>
</span>
<div class="strip-line"></div>
</div>
</div>
</div>
</div>
</div>
		
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content">
<style>
.blog-image{
float: none;
margin: 0;
text-align:center;
}
.blog-content {
border-left: 1px solid #eee;
padding: 20px;
box-sizing: border-box;
-moz-box-sizing: border-box;
-webkit-box-sizing: border-box;
padding-right: 100px;
}
.blog-new-date {
padding: 0px;
padding-top:15px;
font-size: 13px;
color: #AAA;
margin-bottom: 15px;
margin-left: 0px;
border-bottom: 1px solid black;
}
</style>
<div class="blog-content">
	<?php echo $content_top; ?>
	<?php if (isset ($settings_blog['view_rss']) && $settings_blog['view_rss'] ) { ?>
	<a href="<?php echo $url_rss; ?>" class="floatright"><img style="border: 0px;"  title="RSS" alt="RSS" src="catalog/view/theme/<?php
		$template = '/image/rss24.png';
		if (file_exists(DIR_TEMPLATE . $theme . $template)) {
			$rsspath = $theme . $template;
		} else {
			$rsspath = 'default' . $template;
		}
		echo $rsspath;
		?>"></a>
	<?php } ?>
	
	<?php if ($description) { ?>
	<div class="blog-info">
		<?php if ($thumb && $description) { ?>
		<div class="image blog-image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
		<?php } ?>
		<?php if ($description) { ?>
		<div class="blog-description">
			<?php echo $description; ?>
		</div>
		<?php } ?>
	</div>
	<?php } ?>
	

	
	<div class="blog-divider"></div>

	<?php if ($records) { ?>
	<div>
		<?php foreach ($records as $record) {
			?>
		<div class="content-records">
		
			<div class="name marginbottom5">
				<?php if (isset ($record['settings']['category_status']) && $record['settings']['category_status'] ) { ?>
				<?php if (isset ($record['settings_blog']['category_status']) && $record['settings_blog']['category_status'] ) { ?>
				<a href="<?php echo $record['blog_href']; ?>" class="blog-title blog-record-list"><?php echo $record['blog_name']; ?></a><ins class="blog-arrow">&nbsp;&rarr;&nbsp;</ins>
				<?php } ?>
				<?php } ?>
				<a href="<?php echo $record['href']; ?>" class="blog-title blog-record-list" style="line-height: 1.5; font-size: 30px"><b><?php echo $record['name']; ?></b></a>
			</div>
			
			<div class="blog-new-date"><?php echo $record['date_available']; ?></div>		
		
			<?php if ($record['thumb']) { ?>
			<div class="image blog-image">
				<div>
					<a href="<?php echo $record['href']; ?>"><img src="<?php echo $record['thumb']; ?>" title="<?php echo $record['name']; ?>" alt="<?php echo $record['name']; ?>" /></a>
				</div>
				<?php if (isset ($record['settings_blog']['images_view']) && $record['settings_blog']['images_view'] ) { ?>
				<?php foreach ($record['images'] as $numi => $images) { ?>
				<div class="image blog-image">
					<a class="imagebox" rel="imagebox" title="<?php echo $images['title']; ?>" href="<?php echo $images['popup']; ?>">
					<img alt="<?php echo $images['title']; ?>" title="<?php echo $images['title']; ?>" src="<?php echo $images['thumb']; ?>">
					</a>
				</div>
				<?php } ?>
				<?php } ?>
			</div>
			<?php } ?>


			<div class="description record_description"><?php echo ($record['description_full']) ? $record['description_full'] : $record['description']; ?></div>
			<div style="text-align: left">
			<a href="<?php echo $record['href']; ?>#readmore-<?php echo $record['record_id']; ?>" class="blog_further"><?php if (isset($settings_general['further'][$this->config->get('config_language_id')])) echo html_entity_decode($settings_general['further'][$this->config->get('config_language_id')]); ?></a>
			</div>
			<div class="overflowhidden width100 lineheight1 bordernone">&nbsp;</div>
			<div class="blog-child_divider width100 bordernone">&nbsp;</div>

			<?php
				if ($userLogged)  {
				?>
			<div class="blog-edit_container">
				<a class="zametki" target="_blank" href="<?php echo $admin_path; ?>index.php?route=catalog/record/update&token=<?php echo $this->session->data['token']; ?>&record_id=<?php echo $record['record_id']; ?>"><?php echo $this->language->get('text_edit');?></a>
			</div>
			<?php
				}
				?>
			<div class="blog-child_divider">&nbsp;</div>
		</div>
		<?php } ?>
	</div>

<?php /*
		<div class="record-filter">
		<div class="limit floatleft">
			<b><?php echo $text_limit; ?></b>
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
		<div class="sort floatleft marginleft10">
			<b><?php echo $text_sort; ?></b>
			<select onchange="location = this.value;">
				<?php foreach ($sorts as $sorts) { ?>
				<?php if ($sorts['value'] == $sort . '-' . $order) { ?>
				<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
				<?php } else { ?>
				<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
				<?php } ?>
				<?php } ?>
			</select>
		</div>
	</div>
*/ ?>
	
	<div class="pagination margintop5" style="padding-top: 10px"><?php echo $pagination; ?></div>
	<?php } ?>
	<?php if (!$categories && !$records) { ?>
	<div class="content"><?php echo $text_empty; ?></div>
	<div class="buttons">
		<div class="right"><a href="<?php echo $continue; ?>" class="button"><span><?php echo $button_continue; ?></span></a></div>
	</div>
	<?php } ?>
	<?php echo $content_bottom; ?>
 </div>
 
 
</div>
<?php echo $footer; ?>