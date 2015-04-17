<div id="cmswidget-<?php echo $cmswidget; ?>" style="display: none;">
<?php
if (count($records) > 0) {
	foreach ($records as $record) {
?>
<li><a href="<?php echo $record['href'];?>" class="blog-menu-title"><?php echo $record['name'];?></a></li>
<?php
	}
}
?>
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