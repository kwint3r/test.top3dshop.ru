<?php 
if($this->registry->has('theme_options') == true) { 
	require_once( DIR_TEMPLATE.$this->config->get('config_template')."/lib/module.php" );
	$modules = new Modules($this->registry);
	
	// Pobranie zmiennych
	$language_id = $this->config->get( 'config_language_id' );
	$customfooter = $this->theme_options->get( 'customfooter' );
	if(!isset($customfooter[$language_id])) {
		$customfooter[$language_id] = array(
			'aboutus_status' => 0,
			'twitter_status' => 0,
			'facebook_status' => 0,
			'contact_status' => 0
		);
	}
	
	$customfooter_top = $modules->getModules('customfooter_top');
	$customfooter_bottom = $modules->getModules('customfooter_bottom');
	
	// Sprawdzanie czy panele sa wlaczone
	if(isset($customfooter[$language_id]) || count($customfooter_top) || count($customfooter_bottom)) { 
		if($customfooter[$language_id]['twitter_status'] == '1' || $customfooter[$language_id]['contact_status'] == '1' || $customfooter[$language_id]['aboutus_status'] == '1' || $customfooter[$language_id]['facebook_status'] == '1' || count($customfooter_top) || count($customfooter_bottom)) { 
			
			// Ustalanie szerokosci paneli
			$grids = 12; $test = 0;  
			if($customfooter[$language_id]['aboutus_status'] == '1') { $test++; } 
			if($customfooter[$language_id]['twitter_status'] == '1') { $test++; } 
			if($customfooter[$language_id]['facebook_status'] == '1') { $test++; } 
			if($customfooter[$language_id]['contact_status'] == '1') { $test++; } 
			if($test == 0) { $test = 1; }
			$grids = 12/$test; 
	
	?>
	<!-- CUSTOM FOOTER
		================================================== -->
	<div class="custom-footer <?php if($this->theme_options->get( 'custom_footer_layout' ) == 1) { echo 'full-width'; } else { echo 'fixed'; } ?>">
		<div class="background-custom-footer"></div>
		<div class="background">
			<div class="shadow"></div>
			<div class="pattern">
				<div class="container">
					<?php 
					if( count($customfooter_top) ) { 
						foreach ($customfooter_top as $module) {
							echo $module;
						}
					} ?>
				
					<div class="row">
						<?php if($customfooter[$language_id]['aboutus_status'] == '1') { ?>
						<!-- About us -->
						<div class="col-sm-<?php echo $grids; ?>">
							<?php if($customfooter[$language_id]['aboutus_title'] != '') { ?>
							<h4><i class="icon-info-sign"></i> <?php echo $customfooter[$language_id]['aboutus_title']; ?></h4>
							<?php } ?>
							<p><?php echo html_entity_decode(nl2br($customfooter[$language_id]['aboutus_text'])); ?></p>
						</div>
						<?php } ?>
						
						<?php if($customfooter[$language_id]['contact_status'] == '1') { ?>
						<!-- Contact -->
						<div class="col-sm-<?php echo $grids; ?>">
							<?php if($customfooter[$language_id]['contact_title'] != '') { ?>
							<h4><i class="icon-envelope"></i> <?php echo $customfooter[$language_id]['contact_title']; ?></h4>
							<?php } ?>
							<ul class="contact-us clearfix">
								<?php if($customfooter[$language_id]['contact_phone'] != '' || $customfooter[$language_id]['contact_phone2'] != '') { ?>
								<!-- Phone -->
								<li>
									<i class="icon-mobile-phone"></i>
									<p>
										<?php if($customfooter[$language_id]['contact_phone'] != '') { ?>
											<?php echo $customfooter[$language_id]['contact_phone']; ?><br>
										<?php } ?>
										<?php if($customfooter[$language_id]['contact_phone2'] != '') { ?>
											<?php echo $customfooter[$language_id]['contact_phone2']; ?>
										<?php } ?>
									</p>
								</li>
								<?php } ?>
								<?php if($customfooter[$language_id]['contact_email'] != '' || $customfooter[$language_id]['contact_email2'] != '') { ?>
								<!-- Email -->
								<li>
									<i class="icon-envelope"></i>
									<p>
										<?php if($customfooter[$language_id]['contact_email'] != '') { ?>
											<span><?php echo $customfooter[$language_id]['contact_email']; ?></span><br>
										<?php } ?>
										<?php if($customfooter[$language_id]['contact_email2'] != '') { ?>
											<span><?php echo $customfooter[$language_id]['contact_email2']; ?></span>
										<?php } ?>
									</p>
								</li>
								<?php } ?>
								<?php if($customfooter[$language_id]['contact_skype'] != '' || $customfooter[$language_id]['contact_skype2'] != '') { ?>
								<!-- Phone -->
								<li>
									<i class="icon-skype"></i>
									<p>
										<?php if($customfooter[$language_id]['contact_skype'] != '') { ?>
											<?php echo $customfooter[$language_id]['contact_skype']; ?><br>
										<?php } ?>
										<?php if($customfooter[$language_id]['contact_skype2'] != '') { ?>
											<?php echo $customfooter[$language_id]['contact_skype2']; ?>
										<?php } ?>
									</p>
								</li>
								<?php } ?>
							</ul>
						</div>
						<?php } ?>
						
						<?php if($customfooter[$language_id]['twitter_status'] == '1') { ?>
						<!-- Twitter -->
						<div class="col-sm-<?php echo $grids; ?>">
							<?php if($customfooter[$language_id]['twitter_title'] != '') { ?>
							<h4><i class="icon-twitter"></i> <?php echo $customfooter[$language_id]['twitter_title']; ?></h4>
							<?php } ?>
							
							<div style="position: relative;margin-top: -10px;margin-bottom: -10px;"><a class="twitter-timeline"  href="https://twitter.com/@<?php echo $customfooter[$language_id]['twitter_profile']; ?>" data-chrome="noheader nofooter noborders noscrollbar transparent" data-tweet-limit="2"  data-widget-id="<?php echo $customfooter[$language_id]['twitter_widget_id'] ; ?>" data-theme="<?php if($customfooter[$language_id]['twitter_theme'] == 'dark') { echo 'dark'; } else { echo 'light'; } ?>" data-related="twitterapi,twitter" data-aria-polite="assertive">Tweets by @<?php echo $customfooter[$language_id]['twitter_profile'] ; ?></a>
							<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");
							window.setTimeout(function(){
							    $(".twitter-timeline").contents().find(".e-entry-title").css("font-size","12px");
							    $(".twitter-timeline").contents().find(".tweet").css("font-size","12px");
							    $(".twitter-timeline").contents().find(".p-name").css("font-size","12px");
							  }, 1000);</script></div>
						</div>
						<?php } ?>
						
						<?php if($customfooter[$language_id]['facebook_status'] == '1') { ?>
						<!-- Facebook -->
						<div class="col-sm-<?php echo $grids; ?>">
							<?php if($customfooter[$language_id]['facebook_title'] != '') { ?>
							<h4><i class="icon-facebook-sign"></i> <?php echo $customfooter[$language_id]['facebook_title']; ?></h4>
							<?php } ?>
							
							<div id="fb-root"></div>
							<script>(function(d, s, id) {
							  var js, fjs = d.getElementsByTagName(s)[0];
							  if (d.getElementById(id)) return;
							  js = d.createElement(s); js.id = id;
							  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
							  fjs.parentNode.insertBefore(js, fjs);
							}(document, 'script', 'facebook-jssdk'));</script>
							
							<div id="facebook">
								<div class="fb-like-box fb_iframe_widget" profile_id="<?php echo $customfooter[$language_id]['facebook_id']; ?>" data-show-border="false"
								 data-width="260" data-height="<?php if($customfooter[$language_id]['facebook_height'] > 0) { echo $customfooter[$language_id]['facebook_height']; } else { echo '210'; } ?>" <?php if($customfooter[$language_id]['show_faces'] != '1') { ?>data-connections="<?php if($customfooter[$language_id]['facebook_faces'] > 0) { echo $customfooter[$language_id]['facebook_faces']; } else { echo '8'; } ?>"<?php } ?> data-colorscheme="light" data-stream="false" data-header="false" data-show-faces="<?php if($customfooter[$language_id]['show_faces'] == '1') { echo 'false'; } else { echo 'true'; } ?>" fb-xfbml-state="rendered"></div>
							</div>
						</div>

						<?php } ?>

					
					<?php 
					if( count($customfooter_bottom) ) { 
						foreach ($customfooter_bottom as $module) {
							echo $module;
						}
					} ?>
				</div>

			</div>

		</div>
	</div>
	<?php } } ?>
		
	<!-- FOOTER
		================================================== -->
	<div class="footer <?php if($this->theme_options->get( 'footer_layout' ) == 2) { echo 'fixed'; } else { echo 'full-width'; } ?>">
		<div class="background-footer"></div>
		<div class="background">
			<div class="shadow"></div>
			<div class="pattern">
				<div class="container">
					<?php 
					$footer_top = $modules->getModules('footer_top');
					if( count($footer_top) ) { 
						foreach ($footer_top as $module) {
							echo $module;
						}
					} ?>
					<div class="row">
						<?php 
						$footer_left = $modules->getModules('footer_left');
						$footer_right = $modules->getModules('footer_right');
						
						$span = 3;
						if( count($footer_left) && count($footer_right) ) {
							$span = 2;
						} elseif( count($footer_left) || count($footer_right) ) {
							$span = 25;
						} ?>
						
						<?php if( count($footer_left) ) { ?>
						<div class="col-sm-<?php echo $span; ?>">
						<?php foreach ($footer_left as $module) {
								echo $module;
							} ?>
						</div>
						<?php } ?>
						
							<!-- 3D Equipment -->
						<div class="col-sm-<?php echo $span; ?>">
							<div class="h4"><?php echo "3D Оборудование"; ?></div>
							<?/* <div class="strip-line"></div> */?>
							<ul>
								<li><a href="/kupit-3d-printer">3D принтеры</a></li>
								<li><a href="/kupit-3d-skaner">3D сканеры</a></li>
								<li><a href="/chpu-stanki">ЧПУ станки</a></li>
								<li><a href="/prof-oborudovanie">Проф. оборудование</a></li>
								<li><a href="/kupit-3d-gadjet">3D гаджеты</a></li>
								<li><a href="/materiali">Материалы</a></li>
								<li><a href="/soft">Софт</a></li>
							</ul> 
						</div>
						
								<div class="col-sm-<?php echo $span; ?>">
							<div class="h4"><?php echo "Услуги"; ?></div>
							<?/* <div class="strip-line"></div> */?>
							<ul>
								<li><a href="/3d-pechat-ob-ektov.html">3D печать</a></li>
								<li><a href="/3d-skanirovanie.html/">3D сканирование</a></li>
								<li><a href="/3d-modeling.html">3D моделирование</a></li>
								<li><a href="/silicon-molding.html">Литье в силикон</a></li>
								<li><a href="http://my3dgift.ru/">Изготовление 3D фигурок</a></li>
								<li><a href="/obuchenie.html">Обучение</a></li>
								<li><a href="/servisnoe-obsluzhivanie-i-remont.html">Сервисное обслуживание и ремонт</a></li>
								
							</ul> 
						</div>
						
						<!-- Information -->
						<div class="col-sm-<?php echo $span; ?>">
							<div class="h4"><?php echo $text_information; ?></div>
							<?/* <div class="strip-line"></div> */?>
							<ul>
								<?php foreach ($informations as $information) { ?>
								<li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
								<?php } ?>
								<? /*<li><a href="/akcii/">Акции </a> </li> */ ?>
								<li><a href="/terms-and-conditions.html">Условия соглашения</a></li>
								<li><a href="/wiki">База знаний</a></li>
								<li><a href="<?=$vacantion?>" class="colorbox">Резюме</a> </li>
								<li><a href="<?php echo $sitemap; ?>" rel="nofollow"><?php echo $text_sitemap; ?></a></li>
							</ul>
							
						</div>
						
<?/*						<!-- Customer Service -->
						<div class="col-sm-<?php echo $span; ?>">
							<div class="h4"><?php echo $text_service; ?></div>
							 <div class="strip-line"></div> 
							<ul>
								
								<li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
								<li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
								
								
								<li><a href="/contacts.html">Контакты</a></li>
							</ul> 
						</div>*/?>
						
						<!-- Extras -->
						<div class="col-sm-<?php echo $span; ?>">
							<div class="h4"><?php echo $text_extra; ?></div>
							<?/* <div class="strip-line"></div> */?>
							<ul>
								<li><a href="<?php echo $manufacturer; ?>" rel="nofollow"><?php echo $text_manufacturer; ?></a></li>
								<li><a href="/dealer-network.html">Дилерская сеть</a></li>
								<li><a href="/to-dealers.html">Поставщикам</a></li>
								<li><a href="/franchise.html">Франшиза</a></li>
								<li><a href="/tender.html">Участие в госзакупках</a></li>
								<li><a href="/leasing.html">Лизинг оборудования </a> </li>
								<li><a href="/arenda.html">Аренда оборудования </a> </li>
								
							<!--	<li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li> -->
							</ul>
						</div>

						<!-- My Account -->
<?/* 						<div class="col-sm-<?php echo $span; ?>">
							<div class="h4"><?php echo $text_account; ?></div>
							<div class="strip-line"></div> 
							<ul>
								<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
								<li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
								<li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
								<li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
							</ul>
						</div>*/?>
						
						<?php if( count($footer_right) ) { ?>
						<div class="col-sm-<?php echo $span; ?>">
						<?php foreach ($footer_right as $module) {
								echo $module;
							} ?>
						</div>
						<?php } ?>
					</div>
					
					<?php 
					$footer_bottom = $modules->getModules('footer_bottom');
					if( count($footer_bottom) ) { 
						foreach ($footer_bottom as $module) {
							echo $module;
						}
					} ?>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
    $(document).ready(function(){
        $(".colorbox").colorbox({width:800});
    })
</script>
	<!-- COPYRIGHT
		================================================== -->

	<div class="copyright <?php if($this->theme_options->get( 'footer_layout' ) == 2) { echo 'fixed'; } else { echo 'full-width'; } ?>">
		<div class="background-copyright"></div>
		<div class="background">
			<div class="shadow"></div>
			<div class="pattern">
				<div class="container">
				
					<div class="line"></div>
					<?php if(is_array($this->theme_options->get( 'payment' ))) { if($this->theme_options->get( 'payment_status' ) != '0') { ?>
					<ul>
					<a href="http://geektimes.ru/company/top3dshop/"><img src="/image/data/main/gt.png"></a>
					<a href="http://3dtoday.ru/blogs/top3dshop/"><img src="/image/data/main/td.png"></a>
						<?php foreach($this->theme_options->get( 'payment' ) as $payment) { 
							echo '<li>';
							if($payment['link'] != '') {
								$new_tab = false;
								if($payment['new_tab'] == 1) {
									$new_tab = ' target="_blank"';
								}
								echo '<a href="' .$payment['link']. '"'.$new_tab.'>';
							}
							echo '<img src="image/' .$payment['img']. '" alt="' .$payment['name']. '">';
							if($payment['link'] != '') {
								echo '</a>';
							}
							echo '</li>'; 
						} ?>
					</ul>
					<?php } } ?>
					<!--
					OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
					Please donate via PayPal to donate@opencart.com
					//-->

					<p>Все права защищены <a href="http://top3dshop.ru" style="text-decoration:none;">Top3DShop.Ru</a> © 2013-2015</p><br/><br/>
					<!--
					OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
					Please donate via PayPal to donate@opencart.com
					//-->
					
					<?php 
					$bottom = $modules->getModules('bottom');
					if( count($bottom) ) { 
						foreach ($bottom as $module) {
							echo $module;
						}
					} ?>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="catalog/view/theme/<?php echo $this->config->get( 'config_template' ); ?>/js/megamenu.js"></script>
</div>

<a href="#" class="scrollup"><i class="icon-chevron-up"></i></a>
</div>
<?php } ?>
<!-- Google Tag -->
<?php

	if (!isset($this->request->get['route'])) {
		$prodid=0;
		$pagetype = "home";
		$totalvalue=0;
	} else {
		if ($this->request->get['route'] == 'product/category') {
			$pagetype = "category";
		}
		elseif ($this->request->get['route'] == 'product/product'){
			$pagetype = "product";
		}
		elseif ($this->request->get['route'] == 'checkout/cart' || $this->request->get['route'] == 'checkout/simplecheckout'){
			$pagetype = "cart";
		}
		elseif ($this->request->get['route'] == 'checkout/success'){
			$pagetype = "purchase";
		}
		elseif ($this->request->get['route'] == ''){
			$pagetype = "home";
		}
		elseif ($this->request->get['route'] == 'common/home'){
			$pagetype = "home";
		}
		elseif ($this->request->get['route'] == 'product/search'){
			$pagetype = "searchresults";
		}
		else {
			$pagetype = "other";
		}
	}

	if (isset($this->request->get['product_id'])) {
		$Id=$this->request->get['product_id'];
		$product_info = $this->model_catalog_product->getProduct($Id);

		$product_id = $Id;
		if ($product_info['special'] > 0) {
			$price = $product_info['special'];
		} else {
			$price = $product_info['price'];
		}

	} else {
		$product_id = 0;
	}

	if ($this->request->get['route'] == 'product/product') {
		$prodid = $this->request->get['product_id'];
	} elseif ($this->request->get['route'] == 'checkout/cart' || $this->request->get['route'] == 'checkout/simplecheckout'){
		$prodid = "[";
		$max_items = count($this->cart->getProducts());
		$i = 1;
		foreach ($this->cart->getProducts() as $product) {
			if($i < $max_items){
				$prodid .= "'".$product['product_id']."',";
			} else{
				$prodid .= "'".$product['product_id']."'";
			}
			$i++;
		}
		$prodid .= "]";
	} elseif ($this->request->get['route'] == 'checkout/success'){
		$prodid = "[";
		$max_items = count($this->cart_products);
		$i = 1;
		foreach ($this->cart_products as $product) {
			var_dump($product);
			if($i < $max_items){
				$prodid .= "'".$product['product_id']."',";
			} else{
				$prodid .= "'".$product['product_id']."'";
			}
			$i++;
		}
		$prodid .= "]";
	} else {
		$prodid = "";
	}

	$totalvalue=0;

	if ($this->request->get['route'] == 'product/product') {
		$prodid = $product_id;
		$totalvalue = round($price, 2);
	} elseif ($this->request->get['route'] == 'checkout/cart' || $this->request->get['route'] == 'checkout/simplecheckout'){
		$totalvalue = round($this->cart->getTotal(),2);
	} elseif ($this->request->get['route'] == 'checkout/success'){
		$totalvalue = $this->cart_total;
	}
?>



<script type="text/javascript">
var google_tag_params = {
	ecomm_pagetype: '<?php echo $pagetype; ?>',
	ecomm_prodid: <?php if (isset($prod) ) echo $prodid; else echo 0; ?>,
	ecomm_totalvalue: <?php if (isset($prod) ) echo $totalvalue; else echo 0; ?>
};
</script>
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 947294358;
var google_custom_params = window.google_tag_params;
var google_remarketing_only = true;
/* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/947294358/?value=0&amp;guid=ON&amp;script=0"/>
</div>
</noscript>

<!-- END Google Tag-->


<script src="http://api-maps.yandex.ru/2.0-stable/?load=package.standard&lang=ru-RU" type="text/javascript"></script>
<script>
(function(w, d, s, h, id) {
w.roistatProjectId = id; w.roistatHost = h;
var p = d.location.protocol == "https:" ? "https://" : "http://";
var u = /^.*roistat_visit=[^;]+(.*)?$/.test(d.cookie) ? "/dist/module.js" : "/api/site/1.0/"+id+"/init";
var js = d.createElement(s); js.async = 1; js.src = p+h+u; var js2 = d.getElementsByTagName(s)[0]; js2.parentNode.insertBefore(js, js2);
})(window, document, 'script', 'cloud.roistat.com', '2210');
</script>
</body>
</html>