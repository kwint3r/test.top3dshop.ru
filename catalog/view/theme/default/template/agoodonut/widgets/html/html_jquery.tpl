<div id="cmswidget-<?php echo $cmswidget; ?>">
	<?php echo($html); ?>
</div>

<?php if (isset($settings_widget['anchor']) && $settings_widget['anchor']!='') { ?>
	<script>
	$(document).ready(function(){
		var data = $('#cmswidget-<?php echo $cmswidget; ?>').html();
		var prefix = '<?php echo $prefix;?>';
		var cmswidget = '<?php echo $cmswidget; ?>';
		<?php echo $settings_widget['anchor']; ?>;
		delete data;
		delete prefix;
		delete cmswidget;
		$('#cmswidget-<?php echo $cmswidget; ?>').remove();
	});
	</script>
<?php  } ?>


