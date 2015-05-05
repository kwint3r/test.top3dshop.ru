<?php echo $header; ?>
<link href="http://my3dgift.ru/js/fancybox/jquery.fancybox.css" media="screen" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://my3dgift.ru/js/fancybox/jquery.fancybox.pack.js"></script>

<?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/wrapper_top.tpl'); ?>
<div itemscope itemtype="http://data-vocabulary.org/Product">
  <span itemprop="name" class="hidden"><?php echo $heading_title; ?></span>
	<div class="row">
		<div class="col-sm-12 product-title">
			<h1><?php echo $heading_title; ?></h1>
		</div>
  <div class="product-info">
  	<div class="row">

  		<div class="col-sm-<?php if($this->theme_options->get( 'custom_block', 'product_page', $this->config->get( 'config_language_id' ), 'status' ) == 1) { echo 9; } else { echo 12; } ?>">
  			<div class="row">
			    <?php if($this->theme_options->get( 'product_image_zoom' ) != 2) { ?>
			    <script>
			    	$(document).ready(function(){
			    		<?php if($this->theme_options->get( 'product_image_zoom' ) == 1) { ?>
			    			$('#image').elevateZoom({
			    				zoomType: "inner",
			    				cursor: "pointer",
			    				zoomWindowFadeIn: 500,
			    				zoomWindowFadeOut: 750
			    			});
			    		<?php } else { ?>
				    		$('#image').elevateZoom({
								zoomWindowFadeIn: 500,
								zoomWindowFadeOut: 500,
								zoomWindowOffetx: 20,
								zoomWindowOffety: -1,
								cursor: "pointer",
								lensFadeIn: 500,
								lensFadeOut: 500
				    		});
			    		<?php } ?>
			    		
			    		/*$('.thumbnails a').click(function() {
			    			var smallImage = $(this).attr('data-image');
			    			var largeImage = $(this).attr('data-zoom-image');
			    			var ez =   $('#image').data('elevateZoom');	
			    			$('#ex1').attr('href', largeImage);  
			    			ez.swaptheimage(smallImage, largeImage); 
			    			return false;
			    		});*/

                        $(".fancybox").fancybox({
                            helpers: {
                                overlay: {
                                    locked: false
                                }
                            }
                        });
                        $('.tooltip').tooltipster({
                            contentAsHTML: true
                        });
			    	});
			    </script>
			    <?php } ?>
			    <?php $image_grid = 6; $product_center_grid = 6; 
			    if ($this->theme_options->get( 'product_image_size' ) == 1) {
			    	$image_grid = 4; $product_center_grid = 8;
			    }
			    
			    if ($this->theme_options->get( 'product_image_size' ) == 3) {
			    	$image_grid = 8; $product_center_grid = 4;
			    }
			    ?>
			    <div class="col-sm-<?php echo $image_grid; ?> popup-gallery">
			      <div class="row">
			      	  <?php if ($images && $this->theme_options->get( 'position_image_additional' ) == 2) { ?>
			      	  <div class="col-sm-2">
						<div class="thumbnails thumbnails-left clearfix">
							<ul>
							  <?php if($this->theme_options->get( 'product_image_zoom' ) != 2 && $thumb) { ?>
						      <li>
                                  <p>
                                      <a class="fancybox" href="<?php echo $popup; ?>" rel="group1">
                                          <img alt="" src="<?php echo $thumb; ?>">
                                      </a>

                                      <!--<a href="<?php echo $popup; ?>" data-image="<?php echo $thumb; ?>" data-zoom-image="<?php echo $popup; ?>">
                                          <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                                      </a>-->
                                  </p>
                              </li>
							  <?php } ?>
						      <?php foreach ($images as $image) { ?>
						      <li>
                                  <p>
                                      <a class="fancybox" href="<?php echo $image['popup']; ?>" rel="group1">
                                          <img alt="" src="<?php echo $image['thumb']; ?>">
                                      </a>
                                      <!--<a href="<?php echo $image['popup']; ?>" data-image="<?php echo $image['popup']; ?>" data-zoom-image="<?php echo $image['popup']; ?>">
                                          <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                                      </a>-->
                                  </p>
                              </li>
						      <?php } ?>
						  </ul>
						</div>
			      	  </div>
			      	  <?php } ?>
			      	  
				      <div class="col-sm-<?php if($this->theme_options->get( 'position_image_additional' ) == 2) { echo 10; } else { echo 12; } ?>">
				      	<?php if ($thumb) { ?>
					      <div class="product-image <?php if($this->theme_options->get( 'product_image_zoom' ) != 2) { if($this->theme_options->get( 'product_image_zoom' ) == 1) { echo 'inner-cloud-zoom'; } else { echo 'cloud-zoom'; } } ?>">
					      	 <?php if($special && $this->theme_options->get( 'display_text_sale' ) != '0') { ?>
					      	 	<?php $text_sale = 'Sale';
					      	 	if($this->theme_options->get( 'sale_text', $this->config->get( 'config_language_id' ) ) != '') {
					      	 		$text_sale = $this->theme_options->get( 'sale_text', $this->config->get( 'config_language_id' ) );
					      	 	} ?>
					      	 	<?php if($this->theme_options->get( 'type_sale' ) == '1') { ?>
					      	 	<?php $product_detail = $this->theme_options->getDataProduct( $product_id );
					      	 	$roznica_ceny = $product_detail['price']-$product_detail['special'];
					      	 	$procent = ($roznica_ceny*100)/$product_detail['price']; ?>
					      	 	<div class="sale">-<?php echo round($procent); ?>%</div>
					      	 	<?php } else { ?>
					      	 	<div class="sale"><?php echo $text_sale; ?></div>
					      	 	<?php } ?>
					      	 <?php } ?>



                              <a class="fancybox" href="<?php echo $popup; ?>" rel="group1" id="ex1" title="<?php echo $heading_title; ?>">
                                  <img alt="" src="<?php echo $thumb; ?>" data-zoom-image="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" id="image" itemprop="image" >
                              </a>
					     	 <!--<a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" id="ex1">
                                 <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" itemprop="image" data-zoom-image="<?php echo $popup; ?>" />
                             </a>-->
					      </div>
					  	 <?php } else { ?>
					  	 <div class="product-image">
					  	 	 <img src="image/no_image.jpg" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" itemprop="image" />
					  	 </div>
					  	 <?php } ?>
				      </div>
				      
				      <?php if ($images && $this->theme_options->get( 'position_image_additional' ) != 2) { ?>
				      <div class="col-sm-12">
					      <div class="thumbnails clearfix">
					      	<ul>
					      		<?php if($this->theme_options->get( 'product_image_zoom' ) != 2 && $thumb) { ?>
					      		<li>
                                    <p>

                                        <a class="fancybox" href="<?php echo $popup; ?>" rel="group1">
                                            <img alt="" src="<?php echo $thumb; ?>">
                                        </a>

                                        <!--<a href="<?php echo $popup; ?>" data-image="<?php echo $thumb; ?>" data-zoom-image="<?php echo $popup; ?>">
                                            <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                                        </a>-->
                                    </p>
                                </li>
					      		<?php } ?>
						        <?php foreach ($images as $image) { ?>
						        <li>
                                    <p>
                                        <a class="fancybox" href="<?php echo $image['popup']; ?>" rel="group1">
                                            <img alt="" src="<?php echo $image['thumb']; ?>">
                                        </a>


                                        <!--<a href="<?php echo $image['popup']; ?>" data-image="<?php echo $image['popup']; ?>" data-zoom-image="<?php echo $image['popup']; ?>">
                                            <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                                        </a>-->
                                    </p>
                                </li>
						        <?php } ?>
					        </ul>
					      </div>
				      </div>
				      <?php } ?>
			      </div>
			    </div>

			    <div class="col-sm-<?php echo $product_center_grid; ?> product-center clearfix">
			     <div itemprop="offerDetails" itemscope itemtype="http://data-vocabulary.org/Offer">
			      <div class="description">
			        <?php if ($manufacturer) { ?>
			        <span><?php echo $text_manufacturer; ?></span> <a href="<?php echo $manufacturers; ?>" itemprop="brand"><?php echo $manufacturer; ?></a><br />
			        <?php } ?>
			        <span><?php echo $text_model; ?></span> <?php echo $model; ?><br />
			        <?php if ($reward) { ?>
			        <span><?php echo $text_reward; ?></span> <?php echo $reward; ?><br />
			        <?php } ?>
			        <span><?php echo $text_stock; ?></span> <?php echo $stock; ?></div>
			      <?php if ($price>0) { ?>
			      <div class="price">
			        <?php if (!$special) { ?>
			        <span class="price-new"><?php echo $text_price; ?> <span itemprop="price"><?php echo $price; ?></span></span>
			        <?php } else { ?>
			        <span class="price-new"><?php echo $text_price; ?> <span itemprop="price"><?php echo $special; ?></span></span> <span class="price-old"><?php echo $price; ?></span>
			        <?php } ?>
			        <br />
			        <?php if ($tax) { ?>
			        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span><br />
			        <?php } ?>
			        <?php if ($points) { ?>
			        <span class="reward"><small><?php echo $text_points; ?> <?php echo $points; ?></small></span><br />
			        <?php } ?>
			        <?php if ($discounts) { ?>
			        <br />
			        <div class="discount">
			          <?php foreach ($discounts as $discount) { ?>
			          <?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?><br />
			          <?php } ?>
			        </div>
			        <?php } ?>
			      </div>
			      <?php } ?>
			     </div>
			     
			     <?php if ($profiles): ?>
			     <div class="options">
			         <h2><span class="required">*</span><?php echo $text_payment_profile ?></h2>
			         <div class="option">
				         <select name="profile_id">
				             <option value=""><?php echo $text_select; ?></option>
				             <?php foreach ($profiles as $profile): ?>
				             <option value="<?php echo $profile['profile_id'] ?>"><?php echo $profile['name'] ?></option>
				             <?php endforeach; ?>
				         </select>
				         <br />
				         <span id="profile-description"></span>
			         </div>
			     </div>
			     <?php endif; ?>
			     
			      <?php if ($options) { ?>
			      <div class="options">
			        <h2><?php echo $text_option; ?></h2>
			        <?php foreach ($options as $option) { ?>
			        <?php if ($option['type'] == 'select') { ?>
			        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
			          <?php if ($option['required']) { ?>
			          <span class="required">*</span>
			          <?php } ?>
			          <b><?php echo $option['name']; ?>:</b><br />
			          <select name="option[<?php echo $option['product_option_id']; ?>]">
			            <option value=""><?php echo $text_select; ?></option>
			            <?php foreach ($option['option_value'] as $option_value) { ?>
			            <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
			            <?php if ($option_value['price']) { ?>
			            <!--(<?php //echo $option_value['price_prefix']; ?><?php //echo $option_value['price']; ?>)-->
			            (<?php echo $option_value['sum_price']; ?>)
			            <?php } ?>
			            </option>
			            <?php } ?>
			          </select>
			        </div>
			        <?php } ?>
			        <?php if ($option['type'] == 'radio') { ?>
			        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
			          <?php if ($option['required']) { ?>
			          <span class="required">*</span>
			          <?php } ?>
			          <b><?php echo $option['name']; ?>:</b><br />
			          <?php foreach ($option['option_value'] as $option_value) { ?>
			          <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
			          <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
			            <!--<?php //if ($option_value['price']) { ?>
			            (<?php //echo $option_value['price_prefix']; ?><?php //echo $option_value['price']; ?>)
			            <?php //} ?>-->

			            (<?php echo $option_value['sum_price']; ?>)

			          </label>
			          <br />
			          <?php } ?>
			        </div>
			        <?php } ?>
			        <?php if ($option['type'] == 'checkbox') { ?>
			        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
			          <?php if ($option['required']) { ?>
			          <span class="required">*</span>
			          <?php } ?>
			          <b><?php echo $option['name']; ?>:</b><br />
			          <?php foreach ($option['option_value'] as $option_value) { ?>
			          <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
			          <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
			            <?php if ($option_value['price']) { ?>
			            <!--(<?php //echo $option_value['price_prefix']; ?><?php //echo $option_value['price']; ?>)-->
			            (<?php echo $option_value['sum_price']; ?>)
			            <?php } ?>
			          </label>
			          <br />
			          <?php } ?>
			        </div>
			        <?php } ?>
			        <?php if ($option['type'] == 'image') { ?>
			        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
			          <?php if ($option['required']) { ?>
			          <span class="required">*</span>
			          <?php } ?>
			          <b><?php echo $option['name']; ?>:</b><br />
			          <table class="option-image">
			            <?php foreach ($option['option_value'] as $option_value) { ?>
			            <tr>
			              <td style="width: 1px;"><input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /></td>
			              <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /></label></td>
			              <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
			                  <?php if ($option_value['price']) { ?>
			                  <!--(<?php //echo $option_value['price_prefix']; ?><?php //echo $option_value['price']; ?>)-->
				            (<?php echo $option_value['sum_price']; ?>)
			                  <?php } ?>
			                </label></td>
			            </tr>
			            <?php } ?>
			          </table>
			        </div>
			        <?php } ?>
			        <?php if ($option['type'] == 'text') { ?>
			        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
			          <?php if ($option['required']) { ?>
			          <span class="required">*</span>
			          <?php } ?>
			          <b><?php echo $option['name']; ?>:</b><br />
			          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
			        </div>
			        <?php } ?>
			        <?php if ($option['type'] == 'textarea') { ?>
			        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
			          <?php if ($option['required']) { ?>
			          <span class="required">*</span>
			          <?php } ?>
			          <b><?php echo $option['name']; ?>:</b><br />
			          <textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo $option['option_value']; ?></textarea>
			        </div>
			        <?php } ?>
			        <?php if ($option['type'] == 'file') { ?>
			        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
			          <?php if ($option['required']) { ?>
			          <span class="required">*</span>
			          <?php } ?>
			          <b><?php echo $option['name']; ?>:</b><br />
			          <input type="button" value="<?php echo $button_upload; ?>" id="button-option-<?php echo $option['product_option_id']; ?>" class="button">
			          <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
			        </div>
			        <?php } ?>
			        <?php if ($option['type'] == 'date') { ?>
			        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
			          <?php if ($option['required']) { ?>
			          <span class="required">*</span>
			          <?php } ?>
			          <b><?php echo $option['name']; ?>:</b><br />
			          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date" />
			        </div>
			        <?php } ?>
			        <?php if ($option['type'] == 'datetime') { ?>
			        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
			          <?php if ($option['required']) { ?>
			          <span class="required">*</span>
			          <?php } ?>
			          <b><?php echo $option['name']; ?>:</b><br />
			          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime" />
			        </div>
			        <?php } ?>
			        <?php if ($option['type'] == 'time') { ?>
			        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
			          <?php if ($option['required']) { ?>
			          <span class="required">*</span>
			          <?php } ?>
			          <b><?php echo $option['name']; ?>:</b><br />
			          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time" />
			        </div>
			        <?php } ?>
			        <?php } ?>
			      </div>
			      <?php } ?>
		
				  <?php if ($stock == 'Нет в наличии') { ?>
				  <a class="button"  onclick="instockrequest('<?php echo $product_id; ?>');" style="width:135px!important;font-size: 13px;height: 34px;">Запросить КП</a>
				  <?php }
				  else { ?>
			      <div class="cart">
			        <div class="add-to-cart clearfix">
			          <p style="width: 88px"><?php echo $text_qty; ?></p>
			          <div class="quantity" style="width: 75px">
				          <input type="text" name="quantity" id="quantity_wanted" size="2" style="width: 65px" value="<?php echo $minimum; ?>" />
				          <a href="#" id="q_up"><i class="icon-plus"></i></a>
				          <a href="#" id="q_down"><i class="icon-minus"></i></a>
			          </div>
			          <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
			          &nbsp;
					  <?php if ($price >0) { ?>
					<? /*  <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button"><?php echo $button_cart; ?></a> */ ?>
			          <input type="button" value="<?php echo $button_cart; ?>" id="button-cart" class="button" /> 
					  <?php } ?>
						<a class="button"  onclick="instockrequest('<?php echo $product_id; ?>'); return true;" style="width: 135px !important;font-size: 13px;height: 34px;margin-left: -10px;">Запросить КП</a>
			        </div>
			        <?php } ?>
					
<?php /* ADD OCDESIGN.RU VKREDIT PAYMENT */ ?>
				<?php if ($price > 0) { ?>
				
					<div class="add-to-vkredit clearfix" style="margin-left: 164px">
					<?php if ($lizing_id == 0) { ?>
						<input type="hidden" id="vkredit" name="vkredit" value="" />
						<input type="button" id="button-vkredit" class="button-vkredit" value="Купить в кредит" />
						<a href="catalog/view/theme/vitalia/image/promo-kvk.jpg" class="vkredit" rel="vkredit" title="О кредите">?</a>
					<?php } else { ?>
						<input type="button" class="button-vkredit" onclick="window.location.href = '<?php echo $lizing; ?>';" value="Купить в лизинг" />
					<?php } ?>
					</div>
					
				<?php } else { ?>
				
					<div class="add-to-vkredit clearfix" style="margin-left: 160px">
					<?php if (!$lizing_id == 0) { ?>
						<input type="button" class="button-vkredit" onclick="window.location.href = '<?php echo $lizing; ?>';" value="Купить в лизинг" />
					<?php } ?>	
					</div>
					
				<?php } ?>

				
<?php /* END OCDESIGN.RU VKREDIT PAYMENT */ ?>




			        <div class="links">
						<a onclick="addToCompare('<?php echo $product_id; ?>');">Сравнить</a>
			        </div>
			         <?php if ($minimum > 1) { ?>
			        <div class="minimum"><?php echo $text_minimum; ?></div>
			        <?php } ?>
			      </div>
				  
				  
				  
				<div style="text-align:center"><img src="/image/data/main/all.jpg" width="400"> </div>
				<div style="text-align:center; margin-top:15px;"><input type="button" value="Записаться на демонстрацию" class="button link_demonstration" /></div>
                 <div class="form_demonstration">
                     <form id="demonstration">
                         <div style="margin: 0 0 10px 0; font-size: 18px;">Запишитесь на демонстрацию</div>
                         <p style="text-align: center; margin: 0 0 10px 0">Адрес демо зала</p>
                         <select id="demonstration_address" name="demonstration_address">
                             <option selected value="САНКТ-ПЕТЕРБУРГ, ул. Киевская, 6, офис 314">САНКТ-ПЕТЕРБУРГ, ул. Киевская, 6, офис 314</option>
                             <option value="МОСКВА, Лужнецкая набережная, 10а стр.7 оф. 302">МОСКВА, Лужнецкая набережная, 10а стр.7 оф. 302</option>
                         </select> <br>
                         <input type="text" id="demonstration_name" name="demonstration_name" placeholder="Имя"> <br>
                         <input type="text" id="demonstration_phone" name="demonstration_phone" placeholder="Телефон"> <br>
                         <button class="button link_demonstration_send" >Записаться на демонстрацию</button>
                     </form>

                 </div>
		    	</div>
				</div>
    	</div>
    	
    	<?php if($this->theme_options->get( 'custom_block', 'product_page', $this->config->get( 'config_language_id' ), 'status' ) == 1) { ?>
    	<div class="col-sm-3">
    		<div class="product-block">
    			<?php if($this->theme_options->get( 'custom_block', 'product_page', $this->config->get( 'config_language_id' ), 'heading' ) != '') { ?>
    			<h4 class="title-block"><?php echo $this->theme_options->get( 'custom_block', 'product_page', $this->config->get( 'config_language_id' ), 'heading' ); ?></h4>
    			<div class="strip-line"></div>
    			<?php } ?>
    			<div class="block-content">
    				<?php echo html_entity_decode($this->theme_options->get( 'custom_block', 'product_page', $this->config->get( 'config_language_id' ), 'text' )); ?>
    			</div>
    		</div>
    	</div>
    	<?php } ?>
    </div>
  </div>
  <p style="font:16px Arial;margin-left:67%;margin-bottom:25px;"> Наши преимущества </p>
  <div class="tooltip_group">
	  <div class="tooltip my_tooltip tooltip4" title="Сертифицированный дилер главных производителей 3D-техники">
      </div>
	  <div class="tooltip my_tooltip tooltip5" title="Профессиональная консультация совершенно бесплатно">
      </div>
      <div class="tooltip my_tooltip tooltip1" title="Доставка по всей РФ и СНГ проверенными ТК">
      </div>
      <div class="tooltip my_tooltip tooltip2" title="Оплата любым удобным способом, как для физических так и для юридических лиц">
      </div>
	  <div class="tooltip my_tooltip tooltip6" title="Полный комплект документов (Счет, товарная накладная или акт, гарантийный талон) отправляем вместе с оборудованием">
      </div>
      <div class="tooltip my_tooltip tooltip3" title="Собственная сервисная служба обеспечивает гарантийное и сервисное обслуживание">
      </div>
  </div>
  <?php 
  	  $language_id = $this->config->get( 'config_language_id' );
	  $tabs = array();
	  
	  $tabs[] = array(
	  	'heading' => $tab_description,
	  	'content' => 'description',
	  	'sort' => 1
	  );
	  
	  if (isset($record_info)) { 
		  $tabs[] = array(
		  	'heading' => 'Обзор',
		  	'content' => 'desc',
		  	'sort' => 7
		  );
	  }
	  
	  if ($attribute_groups) { 
		  $tabs[] = array(
		  	'heading' => $tab_attribute,
		  	'content' => 'attribute',
		  	'sort' => 3
		  );
	  }
	  
	  if ($review_status) { 
	  	  $tabs[] = array(
	  	  	'heading' => $tab_review,
	  	  	'content' => 'review',
	  	  	'sort' => 5
	  	  );
	  }
	  
	  if(is_array($this->config->get('product_tabs'))) {
		  foreach($this->config->get('product_tabs') as $tab) {
		  	if($tab['status'] == 1 || $tab['product_id'] == $product_id) {
		  		foreach($tab['tabs'] as $zakladka) {
		  			if($zakladka['status'] == 1) {
		  				$heading = false; $content = false;
		  				if(isset($zakladka[$language_id])) {
		  					$heading = $zakladka[$language_id]['name'];
		  					$content = html_entity_decode($zakladka[$language_id]['html']);
		  				}
		  				$tabs[] = array(
		  					'heading' => $heading,
		  					'content' => $content,
		  					'sort' => $zakladka['sort_order']
		  				);
		  			}
		  		}
		  	}
		  }
	  }
	  
	  usort($tabs, "cmp_by_optionNumber");
  ?>
  <div id="tabs" class="htabs">
  	<?php $i = 0; foreach($tabs as $tab) { $i++;
  		$id = 'tab_'.$i;
  		if($tab['content'] == 'description') { $id = 'tab-description'; }
		if($tab['content'] == 'desc') { $id = 'tab-desc'; }
  		if($tab['content'] == 'attribute') { $id = 'tab-attribute'; }
  		if($tab['content'] == 'review') { $id = 'tab-review'; }
  		echo '<a href="#'.$id.'">'.$tab['heading'].'</a>';
  	} ?>
  </div>
  <?php $i = 0; foreach($tabs as $tab) { $i++;
  	$id = 'tab_'.$i;	
  	if($tab['content'] != 'description' && $tab['content'] != 'attribute' && $tab['content'] != 'review' && $tab['content'] != 'desc') {		
  		echo '<div id="'.$id.'" class="tab-content">'.$tab['content'].'</div>';
  	}
  } ?>
  <div id="tab-description" class="tab-content" itemprop="description"><a href="/top-3d-shop-2-years.html"><img src="/image/data/main/banners/dr_product.png"></a><br/><br/><br/> <?php echo $description; ?></div>
  <?php if (isset($record_info)) { ?>
	<div id="tab-desc" class="tab-content" itemprop="desc"><?php echo html_entity_decode($record_info[0]['description']); ?></div>
  <?php } ?>
  <?php if ($attribute_groups) { ?>
  <div id="tab-attribute" class="tab-content">
    <table class="attribute" cellspacing="0">
      <?php foreach ($attribute_groups as $attribute_group) { ?>
      <thead>
        <tr>
          <td colspan="2"><?php echo $attribute_group['name']; ?></td>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
        <tr>
          <td><?php echo $attribute['name']; ?></td>
          <td><?php echo $attribute['text']; ?></td>
        </tr>
        <?php } ?>
      </tbody>
      <?php } ?>
    </table>
  </div>
  <?php } ?>
  <?php if ($review_status) { ?>
  <div id="tab-review" class="tab-content">
    <div id="review"></div>
    <h2 id="review-title"><?php echo $text_write; ?></h2>
    <b><?php echo $entry_name; ?></b><br />
    <input type="text" name="name" value="" />
    <br />
    <br />
    <b><?php echo $entry_review; ?></b>
    <textarea name="text" cols="40" rows="8" style="width: 100%;"></textarea>
    <span style="font-size: 11px;"><?php echo $text_note; ?></span><br />
    <br />
    <b><?php echo $entry_rating; ?></b> <span><?php echo $entry_bad; ?></span>&nbsp;
    <input type="radio" name="rating" value="1" />
    &nbsp;
    <input type="radio" name="rating" value="2" />
    &nbsp;
    <input type="radio" name="rating" value="3" />
    &nbsp;
    <input type="radio" name="rating" value="4" />
    &nbsp;
    <input type="radio" name="rating" value="5" />
    &nbsp;<span><?php echo $entry_good; ?></span><br />
    <br />
    <b><?php echo $entry_captcha; ?></b><br />
    <input type="text" name="captcha" value="" />
    <br />
    <img src="index.php?route=product/product/captcha" alt="" id="captcha" /><br />
    <br />
    <div class="buttons">
      <div class="right"><a id="button-review" class="button"><?php echo $button_continue; ?></a></div>
    </div>
  </div>
  <?php } ?>
  <? /*
  <?php if ($tags) { ?>
  <div class="tags_product"><b><?php echo $text_tags; ?></b>
    <?php for ($i = 0; $i < count($tags); $i++) { ?>
    <?php if ($i < (count($tags) - 1)) { ?>
    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
    <?php } else { ?>
    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
    <?php } ?>
    <?php } ?>
  </div>
  <?php } ?> */ ?>
  <?php if ($products) { ?>
  <?php 
  $class = 3; 
  $id = rand(0, 5000)*rand(0, 5000); 
  $all = 4; 
  $row = 4; 
  
  if($this->theme_options->get( 'product_per_pow' ) == 6) { $class = 2; }
  if($this->theme_options->get( 'product_per_pow' ) == 5) { $class = 25; }
  if($this->theme_options->get( 'product_per_pow' ) == 3) { $class = 4; }
  
  if($this->theme_options->get( 'product_per_pow' ) > 1) { $row = $this->theme_options->get( 'product_per_pow' ); $all = $this->theme_options->get( 'product_per_pow' ); } 
  ?>
	<div class="row">	
					<div class="col-sm-12">	
													<div class="box">
		<div class="box-content">			

		<!--script src="https://www.google.com/recaptcha/api.js"></script-->
		<? /* <?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/module/simple_form.tpl'); ?> */ ?>
	
				</div>
			</div>
		</div>
	</div>
	<div class="box">
    <div class="box-heading"><?php echo $cat_names[$j];//echo $tab_related; ?> 
	<div style="display:none;">(<?php echo count($products); ?>) </div>
	</div>
    <div class="strip-line"></div>
	
    <div class="box-content products related-products">
    <h3 style="text-align: center;">Сопутствующие товары</h3>
<script type="text/javascript" src="catalog/view/javascript/jquery/video/scripts/jq.carousel.min.js"></script>
	<div class="filter-product">
			<ul id="tab<?php echo $id;?>"  class="nav nav-tabs" data-tabs="tabs" style="padding-left: 0px;border: none;">
  	<?php 	
  		$cats = array();
      	foreach ($products as $product) { 
	  		$cats[] = $product['category_id'];
		}
		$uniq_cats_1 = array_values(array_unique($cats));
		if(($key = array_search(70, $uniq_cats_1)) !== false) {
		    unset($uniq_cats_1[$key]);
			$uniq_cats = array_merge([70],$uniq_cats_1);
		} else {
			$uniq_cats = $uniq_cats_1;
		}
		$num_uniq_cats = count($uniq_cats);
		$cat_names = array();
		$products_new = array();
		for ($j = 0; $j < $num_uniq_cats; $j++) {

			foreach ($products as $prod) {
				if ($prod['category_id'] == $uniq_cats[$j]) {
					$products_new[] = $prod;
					if(($key = array_search($prod['category_name'], $cat_names)) === false) {
						$add_to_cats = $prod['category_name'];
						$cat_names[] = $add_to_cats;
					}
				}
			}

	?>
			<?php if($cat_names[$j]) { ?>
				<?php if ($j == 0) {?>
					<li class="active">
				<?php } else { ?>
					<li class="">
				<?php } ?>
				<a href="#related-<?php echo $id."-".$j;?>" data-toggle="tab" style="font-weight: bold"><?php echo $cat_names[$j];?></a></li>
			<?php } ?>
	<?php }?>
			</ul>

	<div class="tab-content">
  	<?php 	
  		$cats = array();
      	foreach ($products as $product) { 
	  		$cats[] = $product['category_id'];
		}
		$uniq_cats_1 = array_values(array_unique($cats));
		if(($key = array_search(70, $uniq_cats_1)) !== false) {
		    unset($uniq_cats_1[$key]);
			$uniq_cats = array_merge([70],$uniq_cats_1);
		} else {
			$uniq_cats = $uniq_cats_1;
		}
		$num_uniq_cats = count($uniq_cats);
		for ($j = 0; $j < $num_uniq_cats; $j++) {

			$cat_names = array();
			$products_new = array();
			foreach ($products as $prod) {
				if ($prod['category_id'] == $uniq_cats[$j]) {
					$products_new[] = $prod;
					$cat_names[] = $prod['category_name'];
				}
			}
	?>

			<div class="tab-pane <?php if ($j == 0) { echo "active"; } ?>" id="related-<?php echo $id."-".$j;?>">

      <div class="box-product">
      	<div id="myCarousel<?php echo $id."-".$j; ?>" <?php if($this->theme_options->get( 'product_scroll_related' ) != '0') { ?>class="carousel slide"<?php } ?>>
      		<!-- Carousel items -->
      		<div class="carousel-inner">
      			<?php 
					$i = 0; 
					$row_fluid = 0; 
					$item = 0; 
					$all = 3;
					$row = 3;
					foreach ($products_new as $product) { 
						$row_fluid++;
						if($i == 0) {
							$item++; 
							echo '<div class="active item"><div class="product-grid"><div class="row">';?>

							<div class="col-sm-<?php echo $class; ?> col-xs-6"  id="block_<?php echo $j;?>">
														<!--add current product-->
							<div class="product clearfix <?php if($this->theme_options->get( 'hover_product' ) != '0') { echo 'product-hover'; } ?>">
								<div class="left">
									<?php if ($thumb) { ?>
									<?php if($special && $this->theme_options->get( 'display_text_sale' ) != '0') { ?>
										<?php $text_sale = 'Sale';
										if($this->theme_options->get( 'sale_text', $this->config->get( 'config_language_id' ) ) != '') {
											$text_sale = $this->theme_options->get( 'sale_text', $this->config->get( 'config_language_id' ) );
										} ?>
										<?php if($this->theme_options->get( 'type_sale' ) == '1') { ?>
										<?php $product_detail = $this->theme_options->getDataProduct( $product_id );
										$roznica_ceny = $product_detail['price']-$product_detail['special'];
										$procent = ($roznica_ceny*100)/$product_detail['price']; ?>
										<div class="sale">-<?php echo round($procent); ?>%</div>
										<?php } else { ?>
										<div class="sale"><?php echo $text_sale; ?></div>
										<?php } ?>
									<?php } ?>
									<div class="image"><img id="image_<?php echo $product_id; ?>" src="<?php echo $thumb; ?>" alt="<?php echo $model; ?>" /></div>
									<?php } else { ?>
									<div class="image"><img id="image_<?php echo $product_id; ?>" src="image/no_image.jpg" alt="<?php echo $model; ?>" /></a></div>
									<?php } ?>
								</div>
								
								<div class="right" style="text-align: center">
								
								
									<div class="name"><?php echo $model; ?></a></div>
									
									
									
									<?php if ($price>0) {?>
									<div class="price">
										<?php if (!$special) { ?>
										<?php echo $price; ?>
										<?php } else { ?>
										<span class="price-old"><?php echo $price; ?></span> <span class="price-new"><?php echo $special; ?></span>
										<?php } ?>
									</div>
									<?php } else {?>
									<div class="price">
									</div>
									<?php } ?>
								
								</div>
								<div class="takeit">
									
									<span class="checkbox" id="<?php echo $j;?>">
										<input class="checkbox_input" type="checkbox" name="accessories" id="<?php echo $id;?>" checked=checked>
									</span>
									<label class="checkbox_label" for="<?php echo $id;?>">Добавить</label>
									
								</div>
							</div>
							</div>
						<? }
						//if ($i > 3) $all = 4;
						$r = $row_fluid - floor($row_fluid / $all) * $all; 
						if($row_fluid > $all) {
							//if($this->theme_options->get( 'product_scroll_related' ) != '0') { 
								echo '</div></div></div><div class="item"><div class="product-grid"><div class="row">'; 
								$item++; 
								$row_fluid = 0;
							//} else { 
							//	echo '</div><div class="row">'; 
							//} 
						} else {
							$r = $row_fluid - floor($row_fluid / $row) * $row; 
							if($row_fluid > $row && $r == 1){
								echo '</div><div class="row">'; 
						}
					}
						?>
						<div class="col-sm-<?php echo $class; ?> col-xs-6" id="block_<?php echo $j;?>">
							<?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/product.tpl'); ?>
						</div>

      			<?php $i++; } ?>
      			<?php if($i > 0) { echo '</div></div></div>'; } ?>

  		</div>
  	<div class="col-sm-12 col-xs-12 buyblock"  id="block_<?php echo $j;?>">
	  	<div class="text-muted" id="accAmounts" style="float: left;  margin-top: 7px;">
	  		Получите персональную скидку при покупке от двух единиц товара
	    </div>
		<a class="button" onclick="massAddToCart(<?php echo $j;?>)" style="width: 135px !important;font-size: 13px;height: 34px;margin-left: 20px;">Запросить КП</a>		
	</div>

		<a class="next-button" href="#myCarousel<?php echo $id."-".$j;?>" data-slide="next"><span></span></a>
		<a class="prev-button" href="#myCarousel<?php echo $id."-".$j;?>" data-slide="prev"><span></span></a>
      </div>
      </div>
      </div>
  		<?php } ?>
 		</div>
    </div>
  </div>

  <?php } ?>
  <?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/module/simple_form.tpl'); ?>
  <a href="/files/top3dshop_print_small.pdf"><img src="http://top3dshop.ru/image/data/main/cases.png"/></a>
</div>

<?php /* ADD OCDESIGN.RU VKREDIT PAYMENT */ ?>

    <script type="text/javascript">
    	var maxBlocks = <?php echo $num_uniq_cats; ?>;
    	var checkedGoods = [];
    	var accSumArr = [];
    	var prodBase = <?php echo $product_id;?>;
    	var prodsArr = [];

    	function massAddToCart(id_block){
    		instockrequestmass(prodsArr[id_block]); 

//	    	for(i = 0; i < checkedGoods[id_block]; i++) {
//	    		var id = prodsArr[id_block][i];
	    		//alert(id+", 1, 'image_'"+id);
//	    		instockrequestmass(prodsArr[id_block]); 
	    		//addToCart(id, 1, 'image_'+id);
//	    	}
    	}

    	function updateInfo() {
	    	for(i = 0; i < maxBlocks; i++) {
		    	if (checkedGoods[i] == 1) {
		    		$("#block_"+i+" #accNum").html("Вы выбрали "+checkedGoods[i]+" товар на сумму")
		    	}else if (checkedGoods[i] == 2 || checkedGoods[i] == 3 || checkedGoods[i] == 4) {
		    		$("#block_"+i+" #accNum").html("Вы выбрали "+checkedGoods[i]+" товара на сумму")
		    	}else {
		    		$("#block_"+i+" #accNum").html("Вы выбрали "+checkedGoods[i]+" товаров на сумму")
		    	}
		    	$("#block_"+i+" #accSum").html(accSumArr[i]+" ₽");
		    }    		
		    return false;
    	}
	    $(function(){

			$('#tab<?php echo $id;?> a').click(function (e) {
			  e.preventDefault()
			  $(this).tab('show')
			})

	    	for(i = 0; i < maxBlocks; i++) {
	    		checkedGoods[i] = 1;
	    		prodsArr[i] = [prodBase];
	    	}
	    	var accSum = <?php echo $price_digit;?>;
	    	accSum = parseInt(accSum);
	    	for(i = 0; i < maxBlocks; i++) {
	    		accSumArr[i] = accSum;
	    	}

	    	//updateInfo();

	    	$(".carousel .checkbox_input").unbind().click(function(event){
	    		var id_block = $(this).parent().attr('id');
	    		var prod_id  = parseInt($(".prod_id").attr("id"));
	    		accSum = $("#"+id_block+"_"+prod_id).text().replace(" ₽", "");
	    		accSum = accSum.replace(/\s+/g, '');
	    		var accPrice = accSumArr[id_block];
	    		var chProds = checkedGoods[id_block];

	    		if (!$(this).is(':checked')){
					prodsArr[id_block] = jQuery.grep(prodsArr[id_block], function(value) {
					  return value != prod_id;
					});
		    		accSumArr[id_block] = accPrice - parseInt(accSum);
		    		checkedGoods[id_block] = chProds - 1;
	    		} else {
		    		prodsArr[id_block].push(prod_id);
		    		accSumArr[id_block] = accPrice + parseInt(accSum);
		    		checkedGoods[id_block] = chProds + 1;
		    	}
	    	//	updateInfo();
	    	})


	    });
    </script>

<script type="text/javascript">
function upd_state2(qval) {
  var realprice = parseInt($(".popover_prod #real_price_"+qval).val());
  var qty = parseInt($('.popover_prod #product_qty_'+qval).val());
  $('.popover_prod #oldprice_'+qval).html(formatMoney(realprice * qty));
}

function pluscon2(qval) {
  var qty = parseInt($('.popover_prod #product_qty_'+qval).val());
  $('.popover_prod #product_qty_'+qval).val(++qty);
  upd_state2(qval);
}
function minuscon2(qval) {
  var qty = parseInt($('.popover_prod #product_qty_'+qval).val());
  if (qty > 1) {
    $('.popover_prod #product_qty_'+qval).val(--qty);
    upd_state2(qval);
  }

}

</script>
<script>
$('#button-vkredit').bind('click', function() {
	$('[name="vkredit"]').val('1');
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
			
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
					}
				}
				
				if (json['error']['profile']) {
				    $('select[name="profile_id"]').after('<span class="error">' + json['error']['profile'] + '</span>');
				}
			} 
			
			if (json['success']) {
                var pixels_per_second = 50;
                distance = Math.abs($(document.body).scrollTop( ) - $('#button-vkredit').offset( ).top);
                scroll_duration = (distance / pixels_per_second) * 1000;
                scroll_duration = $('#button-vkredit').offset( ).top+$('#button-vkredit').offset( ).top*0.2;
				$('html, body').animate({
				        scrollTop: $("#button-vkredit").offset().top-300
				    }, 500);
				setTimeout(function(){ }, 500);
				$('#image')
				  .clone()
				  .css({'position' : 'absolute', 'z-index' : '11100', 
				  	top: $('#button-vkredit').offset().top+300, 
				  	left:$('#button-vkredit').offset().left, 
				  	width:150, height:150})
				  .appendTo("body")
				  .animate({opacity: 0.05,
					left: $("#cart_block").offset()['left'],
					top: $("#cart_block").offset()['top'],
					width: 20}, scroll_duration, function() {
					$(this).remove();
				});				

				/*$('#image')
				  .clone()
				  .css({'position' : 'absolute', 'z-index' : '11100', top: $('#image').offset().top-300, left:$('#image').offset().left-100})
				  .appendTo("body")
				  .animate({opacity: 0.05,
					left: $("#cart_block").offset()['left'],
					top: $("#cart_block").offset()['top'],
					width: 20}, 1000, function() {
					$(this).remove();
				});*/
				$('#cart_block').load('index.php?route=module/cart #cart_block > *');
			}	
		}
	});
});

$(".vkredit").colorbox({rel:'vkredit'});
</script>
<?php /* END OCDESIGN.RU VKREDIT PAYMENT */ ?>
<script type="text/javascript"><!--
$(document).ready(function() {
	/*$('.popup-gallery').magnificPopup({
		delegate: 'a',
		type: 'image',
		tLoading: 'Loading image #%curr%...',
		mainClass: 'mfp-img-mobile',
		gallery: {
			enabled: true,
			navigateByImgClick: true,
			preload: [0,1] // Will preload 0 - before current, and 1 after the current image
		},
		image: {
			tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
			titleSrc: function(item) {
				return item.el.attr('title');
			}
		}
	});*/
});
//--></script> 
<script type="text/javascript"><!--
$('select[name="profile_id"], input[name="quantity"]').change(function(){
    $.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name="product_id"], input[name="quantity"], select[name="profile_id"]'),
		dataType: 'json',
        beforeSend: function() {
            $('#profile-description').html('');
        },
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
            
			if (json['success']) {
                $('#profile-description').html(json['success']);
			}	
		}
	});
});

$('#button-cart').bind('click', function() {
<?php /* ADD OCDESIGN.RU VKREDIT PAYMENT */ ?>
	$('[name="vkredit"]').val('');
<?php /* END OCDESIGN.RU VKREDIT PAYMENT */ ?>
	var data_cart = $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea');

	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: data_cart,
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
			
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
					}
				}
				
				if (json['error']['profile']) {
				    $('select[name="profile_id"]').after('<span class="error">' + json['error']['profile'] + '</span>');
				}
			} 
			
			if (json['success']) {				
                var pixels_per_second = 50;
                distance = Math.abs($(document.body).scrollTop( ) - $('#button-cart').offset( ).top);
                scroll_duration = (distance / pixels_per_second) * 1000;
                scroll_duration = $('#button-cart').offset( ).top+$('#button-cart').offset( ).top*0.2;
				$('html, body').animate({
				        scrollTop: $("#button-cart").offset().top-300
				    }, 500);
				setTimeout(function(){ }, 500);
				$('#image')
				  .clone()
				  .css({'position' : 'absolute', 'z-index' : '11100', 
				  	top: $('#button-cart').offset().top+300, 
				  	left:$('#button-cart').offset().left, 
				  	width:150, height:150})
				  .appendTo("body")
				  .animate({opacity: 0.05,
					left: $("#cart_block").offset()['left'],
					top: $("#cart_block").offset()['top'],
					width: 20}, scroll_duration, function() {
					$(this).remove();
				});				

				/*$('#image')
				  .clone()
				  .css({'position' : 'absolute', 'z-index' : '11100', top: $('#image').offset().top-300, left:$('#image').offset().left-100})
				  .appendTo("body")
				  .animate({opacity: 0.05,
					left: $("#cart_block").offset()['left'],
					top: $("#cart_block").offset()['top'],
					width: 20}, 1000, function() {
					$(this).remove();
				});*/
				$('#cart_block').load('index.php?route=module/cart #cart_block > *');
			}	
		}
	});
});
//--></script>
<?php if ($options) { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'file') { ?>
<script type="text/javascript"><!--
new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
	action: 'index.php?route=product/product/upload',
	name: 'file',
	autoSubmit: true,
	responseType: 'json',
	onSubmit: function(file, extension) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/default/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
	},
	onComplete: function(file, json) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);
		
		$('.error').remove();
		
		if (json['success']) {
			alert(json['success']);
			
			$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
		}
		
		if (json['error']) {
			$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json['error'] + '</span>');
		}
		
		$('.loading').remove();	
	}
});
//--></script>
<?php } ?>
<?php } ?>
<?php } ?>
<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
	$('#review').fadeOut('slow');
		
	$('#review').load(this.href);
	
	$('#review').fadeIn('slow');
	
	return false;
});			

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').bind('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			$('#review-title').after('<div class="attention"><img src="catalog/view/theme/default/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#review-title').after('<div class="warning">' + data['error'] + '</div>');
			}
			
			if (data['success']) {
				$('#review-title').after('<div class="success">' + data['success'] + '</div>');
								
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
	if ($.browser.msie && $.browser.version == 6) {
		$('.date, .datetime, .time').bgIframe();
	}

	$('.date').datepicker({dateFormat: 'yy-mm-dd'});
	$('.datetime').datetimepicker({
		dateFormat: 'yy-mm-dd',
		timeFormat: 'h:m'
	});
	$('.time').timepicker({timeFormat: 'h:m'});
});
//--></script> 
<?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/wrapper_bottom.tpl'); ?>
<script type="text/javascript"><!--
$('#feedback-form').css('margin', '0 8%');
//--></script> 
<?php echo $footer; ?>