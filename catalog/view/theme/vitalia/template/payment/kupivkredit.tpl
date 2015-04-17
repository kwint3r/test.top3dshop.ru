<script type="text/javascript">
$.getScript("<?php echo $script; ?>", function() {
  vkredit = new VkreditWidget(1, <?php echo $total; ?>,  {
			order: "<?php echo $base64; ?>",
			sig: "<?php echo $sig; ?>" 
		});
	vkredit.openWidget();
});
</script>

<div class="buttons">
	<div class="right"><a href="<?php echo $action; ?>" class="button"><span><?php echo $button_confirm; ?></span></a></div>
</div>

