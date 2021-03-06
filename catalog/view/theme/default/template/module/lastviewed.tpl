<div class="box latestproduct">
  <div class="box-heading">Другие пользователи смотрят<?php //echo $heading_title; ?></div>
  <div class="box-content">
    <div class="box-product">
      <?php foreach ($products as $product) { ?>
      <div class="lastitem">
        <?php if ($product['thumb']) { ?>
        <div class="left">
        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
        </div>
        <?php } ?>
        <div class="right">
        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
        <?php if ($product['price'] && $product['price'] > 0) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
        </div>
        <?php } else { ?>
        <?php }?>

        <?php if ($product['rating']) { ?>
        <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
        <?php } ?>
        <?php if ($product['price'] && $product['price'] > 0) { ?>
        <div class="cart">
          <a class="button" href="<?php echo $product['href']; ?>"><span>Купить<?php //echo $button_cart; ?></span></a>
        </div>
        <?php } else { ?>
        <div class="cart">
          <a class="button" href="<?php echo $product['href']; ?>">Купить</a>
        </div>
        <?php }?>
        </div>
      </div>
      <?php } ?>
    </div>
  </div>
</div>
