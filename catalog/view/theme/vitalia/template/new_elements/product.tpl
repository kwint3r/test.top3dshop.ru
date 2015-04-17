<!-- Product -->
<div class="product clearfix <?php if($this->theme_options->get( 'hover_product' ) != '0') { echo 'product-hover'; } ?>">
	<div class="prod_id" id="<?php echo $product['product_id']; ?>"></div>
	<div class="left">
		<?php if ($product['thumb']) { ?>
		<?php if($product['special'] && $this->theme_options->get( 'display_text_sale' ) != '0') { ?>
			<?php $text_sale = 'Sale';
			if($this->theme_options->get( 'sale_text', $this->config->get( 'config_language_id' ) ) != '') {
				$text_sale = $this->theme_options->get( 'sale_text', $this->config->get( 'config_language_id' ) );
			} ?>
			<?php if($this->theme_options->get( 'type_sale' ) == '1') { ?>
			<?php $product_detail = $this->theme_options->getDataProduct( $product['product_id'] );
			$roznica_ceny = $product_detail['price']-$product_detail['special'];
			$procent = ($roznica_ceny*100)/$product_detail['price']; ?>
			<div class="sale">-<?php echo round($procent); ?>%</div>
			<?php } else { ?>
			<div class="sale"><?php echo $text_sale; ?></div>
			<?php } ?>
		<?php } ?>
		<div class="image"><a href="<?php echo $product['href']; ?>"><img id="image_<?php echo $product['product_id']; ?>" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
		<?php } else { ?>
		<div class="image"><a href="<?php echo $product['href']; ?>"><img id="image_<?php echo $product['product_id']; ?>" src="image/no_image.jpg" alt="<?php echo $product['name']; ?>" /></a></div>
		<?php } ?>
	</div>
	
	<div class="right" style="text-align: center">
	
	
		<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
		
		
		
		<?php if ($product['price']>0) {?>
		<div class="price" id="<?php echo $product['product_id']; ?>">
			<?php if (!$product['special']) { ?>
			<?php echo $product['price']; ?>
			<?php } else { ?>
			<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
			<?php } ?>
		</div>
		<?php } else {?>
		<div class="price">
		</div>
		<?php } ?>
		
		
		<?php if ($product['rating'] && $this->theme_options->get( 'display_rating' ) != '0') { ?>
		<div class="rating"><i class="icon-star<?php if($product['rating'] >= 1) { echo ' active'; } ?>"></i><i class="icon-star<?php if($product['rating'] >= 2) { echo ' active'; } ?>"></i><i class="icon-star<?php if($product['rating'] >= 3) { echo ' active'; } ?>"></i><i class="icon-star<?php if($product['rating'] >= 4) { echo ' active'; } ?>"></i><i class="icon-star<?php if($product['rating'] >= 5) { echo ' active'; } ?>"></i></div>
		<?php } ?>
		<?php if($this->theme_options->get( 'display_add_to_compare' ) != '0' || $this->theme_options->get( 'display_add_to_wishlist' ) != '0' || $this->theme_options->get( 'display_add_to_cart' ) != '0') { ?>
		<?php if ($this->request->get['route'] != 'product/product') {?>

		<div class="only-hover">
			<?php if($this->theme_options->get( 'display_add_to_compare' ) != '0' || $this->theme_options->get( 'display_add_to_wishlist' ) != '0') { ?>
			<ul>
				<?php if($this->theme_options->get( 'display_add_to_compare' ) != '0') { ?>
				<li><a onclick="addToCompare('<?php echo $product['product_id']; ?>');">Сравнить</a></li>
				<?php } ?>				
			</ul>
			<?php } ?>
			<?php if ($product['price']>0) {?>
			<?php if($this->theme_options->get( 'display_add_to_cart' ) != '0') { ?>
			<div><a onclick="addToCart('<?php echo $product['product_id']; ?>', 1, 'image_<?php echo $product['product_id']; ?>');" class="button" id="ay" style="margin-bottom: 10px">В корзину</a></div>
			<?php } ?>
			<?php } ?>
			<a class="button" id="ay" onclick="instockrequest('<?php echo $product['product_id']; ?>')">Запросить КП</a>


			<?php /* ADD OCDESIGN.RU VKREDIT PAYMENT */ ?>
            <div class="add-to-vkredit" style="text-align: center">
                <?php if (isset($product['link_id']) && $product['link_id'] == 0) { ?>
					<? if ($product['price'] > 0){ ?>
						<input type="button" class="button-vkredit" onclick="addToVkredit('<?php echo $product['product_id']; ?>', 1, 'image_<?php echo $product['product_id']; ?>');" value="Купить в кредит" />
					<? } ?>
                <?php } else { ?>
                <input type="button" class="button-vkredit" onclick="window.location.href = '<?= isset($product['link']) ? $product['link'] : '' ?>';" value="Купить в лизинг" />
                <?php } ?>
            </div>
			<?php /* END OCDESIGN.RU VKREDIT PAYMENT */ ?>
			
		</div>

		<?php } ?>


		<?php } ?>
	</div>

	<?php if ($this->request->get['route'] == 'product/product') {?>
		<div class="takeit">
		
		  	<!--<div class="checkboxFive" id="<?php echo $j;?>">
		  		<input type="checkbox" value="1" id="<?php echo $product['product_id'];?>" name="accessories" />
			  	<label for="<?php echo $product['product_id'];?>"></label>
		  	</div>-->

			<span class="checkbox"  id="<?php echo $j;?>">
				<input class="checkbox_input" type="checkbox" name="accessories" id="<?php echo $product['product_id'];?>">
			</span>
			<label class="checkbox_label" for="<?php echo $product['product_id'];?>">Добавить</label>
				
		</div>
	<?php } ?>
</div>