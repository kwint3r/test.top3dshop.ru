  	<?php foreach ($products as $product) { ?>
  	<!-- Product -->
  	<div>
  		<div class="row">
  			<div class="image col-sm-3">
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
  				<?php if($product['thumb']) { ?>
  				<a href="<?php echo $product['href']; ?>"><img id="image_<?php echo $product['product_id']; ?>" src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a>
  				<?php } else { ?>
  				<a href="<?php echo $product['href']; ?>"><img src="image/no_image.jpg" alt="<?php echo $product['name']; ?>" /></a>
  				<?php } ?>
  			</div>
  			
  			<div class="name-desc col-sm-6">
  				<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
  				<div class="description"><a href="<?php echo $product['href']; ?>"><?php echo $product['description']; ?></a></div>
  				<?php if ($product['rating']) { ?>
  				<div class="rating-reviews clearfix">
  					<div class="rating"><i class="icon-star<?php if($product['rating'] >= 1) { echo ' active'; } ?>"></i><i class="icon-star<?php if($product['rating'] >= 2) { echo ' active'; } ?>"></i><i class="icon-star<?php if($product['rating'] >= 3) { echo ' active'; } ?>"></i><i class="icon-star<?php if($product['rating'] >= 4) { echo ' active'; } ?>"></i><i class="icon-star<?php if($product['rating'] >= 5) { echo ' active'; } ?>"></i></div>
  				</div>
  				<?php } ?>
  			</div>
  			
  			<div class="actions col-sm-3">
  				<div>
				<?php if ($product['price']>0) { ?>
  					<div class="price">
  						<?php if (!$product['special']) { ?>
  						<?php echo !empty($product['price'])?$product['price']:'&nbsp;'; ?>
  						<?php } else { ?>
  						<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
  						<?php } ?>

  					</div>
					
					<div class="add-to-cart">
					<a onclick="addToCart('<?php echo $product['product_id']; ?>', 1, 'image_<?php echo $product['product_id']; ?>');" id="ay" style="margin-bottom: 5px" class="button"><?php echo $button_cart; ?></a>
					</div>
					<a class="button" id="ay" onclick="instockrequest('<?php echo $product['product_id']; ?>');" style="margin-left: 2px;margin-top: 5px;">Запросить КП</a>

			<?php /* ADD OCDESIGN.RU VKREDIT PAYMENT */ ?>
				<div class="add-to-vkredit" style="text-align: center">
				<?php if ($product['link_id'] == 0) { ?>
						<input type="button" class="button-vkredit" onclick="addToVkredit('<?php echo $product['product_id']; ?>', 1, 'image_<?php echo $product['product_id']; ?>');" value="Купить в кредит" />
					<?php } else { ?>
						<input type="button" class="button-vkredit" onclick="window.location.href = '<?php echo $product['link']; ?>';" value="Купить в лизинг" />
					<?php } ?>
					</div>
			<?php /* END OCDESIGN.RU VKREDIT PAYMENT */ ?>

					<ul>
  						<li>+ <a onclick="addToCompare('<?php echo $product['product_id']; ?>');">Сравнить</a></li>  						
					</ul>
										
					<?php } else { ?>
		
					<div class="price">
  						&nbsp;
  					</div>
		
					<a class="button" id="ay" onclick="instockrequest('<?php echo $product['product_id']; ?>');" style="margin-left: 2px;margin-top: 5px;">Запросить КП</a>
			
				<?php /* ADD OCDESIGN.RU VKREDIT PAYMENT */ ?>
					<div class="add-to-vkredit" style="text-align: center">
					<?php if (!$product['link_id'] == 0) { ?>
							<input type="button" class="button-vkredit" onclick="window.location.href = '<?php echo $product['link']; ?>';" value="Купить в лизинг" />
					<?php } ?>
					</div>
				<?php /* END OCDESIGN.RU VKREDIT PAYMENT */ ?>
				
					<ul>
  						<li>+ <a onclick="addToCompare('<?php echo $product['product_id']; ?>');">Сравнить</a></li>  						
					</ul>
					<?php } ?>
  				</div>
  			</div>
  		</div>
  	</div>
  	<?php } ?>