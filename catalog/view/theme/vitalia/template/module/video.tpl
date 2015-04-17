<div class="carousel">
  <p class="btns" style="text-align: right">
    <input type="button" id="carousel_<?php echo $module; ?>_prev" value="<" class="bnts-prev">
    <input type="button" id="carousel_<?php echo $module; ?>_next" value=">" class="bnts-next">
  </p>
  <div id="carousel_<?php echo $module; ?>" class="carousel_inner">
	<?php foreach ($videos as $video) { ?>
		<div class="carousel_box"><div class="carousel_name"><?php echo $video['title']; ?></div>
		<iframe width="<?php echo $width; ?>" height="<?php echo $height; ?>" src="<?php echo $video['link']; ?>?autoplay=0&controls=0&showinfo=0&rel=0" frameborder="0" allowfullscreen></iframe>
		</div>
	<?php } ?>
  </div>
</div>
<script>
var $carousel = $('#carousel_<?php echo $module; ?>').jqcarousel();
  
$('#carousel_<?php echo $module; ?>_prev').on('click', function(ev) {
  ev.preventDefault();
  $carousel.jqcarousel('prev');
});
$('#carousel_<?php echo $module; ?>_next').on('click', function(ev) {
  ev.preventDefault();
  $carousel.jqcarousel('next');
});
</script>