<div id="cmswidget-<?php echo $cmswidget; ?>">
<?php
if (count($myblogs) > 0) {
	foreach ($myblogs as $blogs) {
		for ($i = 0; $i < $blogs['flag_start']; $i++) {
?>
<li><a href="<?php echo $blogs['href'];?>"><?php echo $blogs['name'];?></a>
<?php
			if ($i >= $blogs['flag_end']) {
?>
<ul>
<?php
			}
?>
<?php
			for ($m = 0; $m < $blogs['flag_end']; $m++) {
?>

		<?php
				if ($blogs['flag_start'] <= $m) {
?>
</ul>
<?php
				}
						?>
			</li>
		<?php



			}

		}
	}
}
?>
</div>

<?php if (isset($settings_widget['anchor']) && $settings_widget['anchor']!='') { ?>
<script>
	var prefix = '<?php echo $prefix;?>';
	var cmswidget = '<?php echo $cmswidget; ?>';
	var data = $('#cmswidget-<?php echo $cmswidget; ?>').html();
	<?php echo $settings_widget['anchor']; ?>;
 	// widget code
 	//$('.sitemap-info .right ul:first').append(data);
 	delete data;
	delete prefix;
	delete cmswidget;
	$('#cmswidget-<?php echo $cmswidget; ?>').remove();
</script>
<?php  } ?>