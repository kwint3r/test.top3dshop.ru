<?php   if ($records) {  ?>
<div class="cms" id="cmswidget-<?php echo $cmswidget; ?>">

<div class="cms__title"><?php echo $heading_title; ?> <span><a href="<?php echo $records[0]['blog_href']; ?>">Все</a></span></div>

<?php foreach ($records as $record) { ?>
<div class="cms__content">
<?php if ($this->request->get['route'] == 'product/category') { ?>
	<!--<div class="cms__left">
		<div class="cms__image">
			<a href="<?php echo $record['href']; ?>"><img src="<?php echo $record['thumb']; ?>" title="<?php echo $record['name']; ?>" alt="<?php echo $record['name']; ?>" /></a>
		</div>
	</div>

	<div class="cms__right">
		<?php if ($record['date_available']) { ?>
			<div class="cms__date"><?php echo $record['date_available']; ?></div>
		<?php } ?>-->
		<div class="cms__name"><a href="<?php echo $record['href']; ?>"><?php echo $record['name']; ?></a></div>
	<!--	<div class="cms__description"><?php echo $record['description']; ?></div>
	</div>-->

<?php } else { ?>
	<div class="cms__left">
		<div class="cms__image">
			<a href="<?php echo $record['href']; ?>"><img src="<?php echo $record['thumb']; ?>" title="<?php echo $record['name']; ?>" alt="<?php echo $record['name']; ?>" /></a>
		</div>
	</div>

	<div class="cms__right">
		<?php if ($record['date_available']) { ?>
			<div class="cms__date"><?php echo $record['date_available']; ?></div>
		<?php } ?>
		<div class="cms__name"><a href="<?php echo $record['href']; ?>"><?php echo $record['name']; ?></a></div>
		<div class="cms__description"><?php echo $record['description']; ?></div>
	</div>

<?php } ?>
</div>
<?php } ?>
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

<?php  } ?>