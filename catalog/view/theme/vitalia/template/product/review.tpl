<?php if ($reviews) { ?>
<?php foreach ($reviews as $review) { ?>
<div class="review-list">
  <div class="author"><b><?php echo $review['author']; ?></b> <?php echo $text_on; ?> <?php echo $review['date_added']; ?></div>
  <div class="rating"><i class="icon-star<?php if($review['rating'] >= 1) { echo ' active'; } ?>"></i><i class="icon-star<?php if($review['rating'] >= 2) { echo ' active'; } ?>"></i><i class="icon-star<?php if($review['rating'] >= 3) { echo ' active'; } ?>"></i><i class="icon-star<?php if($review['rating'] >= 4) { echo ' active'; } ?>"></i><i class="icon-star<?php if($review['rating'] >= 5) { echo ' active'; } ?>"></i></div>
  <div class="text"><?php echo $review['text']; ?></div>
</div>
<?php } ?>
<div class="pagination"><?php echo $pagination; ?></div>
<?php } else { ?>
	<p style="padding-bottom: 10px"><?php echo $text_no_reviews; ?></p>
<?php } ?>
