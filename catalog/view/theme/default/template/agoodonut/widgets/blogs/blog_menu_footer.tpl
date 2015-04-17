<div id="cmswidget-<?php echo $cmswidget; ?>">
<?php
if (count($myblogs) > 0) {
	foreach ($myblogs as $blogs) {
		for ($i = 0; $i < $blogs['flag_start']; $i++) {
?>
<li><a href="<?php if ($blogs['active'] == 'active') echo $blogs['href'] . "#"; else echo $blogs['href'];?>" class=" <?php if ($blogs['active'] == 'active') echo 'active'; if ($blogs['active'] == 'pass')	echo 'pass'; ?>"><?php echo $blogs['name'];
?></a>
<?php
			if ($i >= $blogs['flag_end']) {
?>
<div><ul>
<?php
			}
?>
<?php
			for ($m = 0; $m < $blogs['flag_end']; $m++) {
?>

		<?php
				if ($blogs['flag_start'] <= $m) {
?>
</ul></div>
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