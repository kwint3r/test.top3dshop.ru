<div id="cmswidget-<?php echo $cmswidget; ?>">
	<div id="tab-html-<?php echo $cmswidget; ?>" class="tab-content">
		<div class="box" style="display: block">
			<div class="box-content bordernone">
				<?php echo($html); ?>
 			</div>
		</div>
	</div>
</div>

<?php if (isset($settings_widget['anchor']) && $settings_widget['anchor']!='') { ?>
<script>
$(document).ready(function(){
    var heading_title = '<?php echo $heading_title; ?>';
	var prefix = '<?php echo $prefix;?>';
    var cmswidget = '<?php echo $cmswidget; ?>';
    $('#tabs a').tabs();
	var data = $('#cmswidget-<?php echo $cmswidget; ?>').html();
	<?php echo $settings_widget['anchor']; ?>;

	delete data;
	delete prefix;
	delete heading_title;
	delete cmswidget;

	$('#cmswidget-<?php echo $cmswidget; ?>').remove();

	$('#tabs a').tabs();

	// widget code
	// $('#tabs').append ('<a href="#tab-html-'+cmswidget+'">'+heading_title+'</a>');
	// $('#tab-description').after(data);

});
</script>
<?php  } ?>


