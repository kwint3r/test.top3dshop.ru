<!-- HEADER
	================================================== -->
<header>
	<div class="background-header"></div>
	<div class="slider-header">
		<!-- Top Bar -->
		<div id="top-bar" class="<?php if($this->theme_options->get( 'top_bar_layout' ) == 2) { echo 'fixed'; } else { echo 'full-width'; } ?>">
			<div class="background-top-bar"></div>
			<div class="background">
				<div class="shadow"></div>
				<div class="pattern">
					<div class="container">
						<div class="row">
							<!-- Top Bar Left -->
							<div class="col-sm-6">
								<!-- Welcome text -->
								<div class="welcome-text">
									<?php if (!$logged) { ?>
									<?php echo $text_welcome; ?>
									<?php } else { ?>
									<?php echo $text_logged; ?>
									<?php } ?>
								</div>
							</div>
							<? /*
							<!-- Top Bar Right -->
							<div class="col-sm-6" id="top-bar-right">
								<?php echo $currency.$language; ?>
							</div> */ ?>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Top of pages -->
		<div id="top" class="<?php if($this->theme_options->get( 'header_layout' ) == 1) { echo 'full-width'; } else { echo 'fixed'; } ?>">
			<div class="background-top"></div>
			<div class="background">
				<div class="shadow"></div>
				<div class="pattern">
					<div class="container">
						<div class="row">
							<!-- Header Left -->
							<div class="col-sm-8" id="header-left">
								<?php if ($logo) { ?>
								<!-- Logo -->
								<? /*<h1><a href="<?php echo $home; ?>"><img style="width:100%;" src="http://top3dshop.ru/image/data/top3dshop_banner.png" title="<?php echo $name; ?>" alt="Магазин 3D техники № 1 в России. 3D принтеры и 3D сканеры с доставкой по РФ и СНГ! - Top 3D Shop" /></a></h1> */ ?>
								
								<div><a href="http://top3dshop.ru/" class="active-link"><img alt="Магазин 3D техники № 1 в России. 3D принтеры и 3D сканеры с доставкой по РФ и СНГ! - Top 3D Shop" title="Top3DShop.Ru" src="http://top3dshop.ru/image/data/top3dshop_banner2.png" style="height:99px;"></a>  
								<img style="height: 25px; position: absolute; margin-top: 70px; margin-left: -370px;" src="/image/data/main/footer/mail.png">
								<a style="height: 25px; position: absolute; margin-top: 70px; margin-left: -330px; font: 18px Open Sans;" href="mailto:3d@top3dshop.ru">3d@top3dshop.ru </a>  
								<div style="margin-left:400px;margin-top:-95px;">
								  <table >
									<tr><td colspan="2"><span style="margin-left:50px;color:red;font-size:11px;font-weight:bold;font-family:Open Sans;">Бесплатный звонок по РФ! </span></td>    </tr>
									<tr><td><img src="/image/data/trubka.png" style="height:40px;"></td><td><div class="roistat-phone phone" style="margin-left:5px;font-size:21px;">8 (800) <span style="color:red"> 555-11-59 </div> </div></td>    </tr>
									<tr><td colspan="2"><span style="margin-left:55px;font-size:11px;font-weight:bold;font-family:Open Sans;">с 10 до 19 без выходных</td>    </tr>
								  </table>
								  </div>
								</div>
								
								<?php } ?>
							</div>
							
							<!-- Header Center 
							<div class="col-sm-4" id="header-center">	
								<img src="http://top3dshop.ru/image/data/banner.png" style="margin-top:39px;">
								<div style="text-align: center;margin-top: 36px;font-size: 33px;color: #a3a4a7;"><a id="spcallmeback_btn_1" class="spcallmeback_raise_btn" href="#spcallmeback_1"><img src="http://top3dshop.ru/image/data/phone-ico.png" style="width: 50px;margin: 3px 5px 0 22px;float: left;"></a><div>8(800) <span style="color: #FF0000;">555-11-59</span></div><div style="color: #FF0000;font-size: 12px;/* letter-spacing: -1px; */margin: 23px 0 0 38px">Бесплатный звонок по РФ!&nbsp;<span style="font-size:12px;color:#a3a4a7;margin-left:15px;">с 9 до 20 без выходных</span></div></div>
							</div>-->
							
							<!-- Header Right -->
							<div class="col-sm-4" id="header-right">
								<?php echo $cart; ?>

<!-- Search -->
								<div class="search_form">
									<div class="button-search"></div>
									<input type="text" class="input-block-level search-query" name="search" placeholder="<?php echo $text_search; ?>" id="search_query" value="<?php echo $search; ?>" />
									<div id="autocomplete-results" class="autocomplete-results"></div>
									
									<script type="text/javascript">
									$(document).ready(function() {
										$('#search_query').autocomplete({
											delay: 0,
											appendTo: "#autocomplete-results",
											source: function(request, response) {		
												$.ajax({
													url: 'index.php?route=search/autocomplete&filter_name=' +  encodeURIComponent(request.term),
													dataType: 'json',
													success: function(json) {
														response($.map(json, function(item) {
															return {
																label: item.name,
																value: item.product_id,
																href: item.href,
																thumb: item.thumb,
																desc: item.desc,
																price: item.price,
																special: item.special
															}
														}));
													}
												});
											},
											select: function(event, ui) {
												document.location.href = ui.item.href;
												
												return false;
											},
											focus: function(event, ui) {
										      	return false;
										   	},
										   	minLength: 2
										})
										.data( "ui-autocomplete" )._renderItem = function( ul, item ) {
										 var product_price = item.special ? '<span class="price-old">' + item.price + '</span>&ensp;&ensp;<span class="price-new">' + item.special + '</span>' : item.price;
										  return $( "<li>" )
										    .append( "<a><img src='" + item.thumb + "' alt=''>" + item.label + "<br><span class='description'>" + item.desc + "</span><br><span class='price'>" + product_price + "</span></a>" )
										    .appendTo( ul );
										};
									});
									</script>
								</div>
								
								<!-- Links -->
								<ul class="header-links">
									<li> <a href="/o-kompanii.html"> <span style="display:inline-block;border-bottom:1px dashed black;"> О нас </span></a> </li>
									<li> <a href="/contacts.html"><span style="display:inline-block;border-bottom:1px dashed black;"> Контакты </span></a> </li>
									<li> <a href="/oplata-i-dostavka.html"><span style="display:inline-block;border-bottom:1px dashed black;"> Оплата и доставка </span></a> </li>
									<li> <a href="/compare-products/"><span style="display:inline-block;border-bottom:1px dashed black;"> Сравнение </span></a> </li>
									<!--<li><a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></a></li>-->
									<!--<li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>-->
									<!--<li><a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a></li>-->
									<!--<li><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>-->
								</ul>

							</div>
						</div>
					</div>
					
					<?php 
					$menu = $modules->getModules('menu');
					if( count($menu) ) {
						foreach ($menu as $module) {
							echo $module;
						}
					} elseif($categories) {
					?>
					<div class="container-megamenu container horizontal">
						<div id="megaMenuToggle">
							<div class="megamenuToogle-wrapper">
								<div class="megamenuToogle-pattern">
									<div class="container">
										<div><span></span><span></span><span></span></div>
										Navigation
									</div>
								</div>
							</div>
						</div>
						
						<div class="megamenu-wrapper">
							<div class="megamenu-pattern">
								<div class="container">
									<ul class="megamenu">
										<li class="home"><a href="<?php echo $home; ?>"><i class="icon-home"></i></a></li>
										<?php foreach ($categories as $category) { ?>
										<?php if ($category['children']) { ?>
										<li class="with-sub-menu hover"><p class="close-menu"></p>
											<a href="<?php echo $category['href'];?>"><span><strong><?php echo $category['name']; ?></strong></span></a>
										<?php } else { ?>
										<li>
											<a href="<?php echo $category['href']; ?>"><span><strong><?php echo $category['name']; ?></strong></span></a>
										<?php } ?>
											<?php if ($category['children']) { ?>
											<?php 
												$width = '100%';
												$row_fluid = 3;
												if($category['column'] == 1) { $width = '220px'; $row_fluid = 12; }
												if($category['column'] == 2) { $width = '500px'; $row_fluid = 6; }
												if($category['column'] == 3) { $width = '700px'; $row_fluid = 4; }
											?>
											<div class="sub-menu" style="width: <?php echo $width; ?>">
												<div class="content">
													<div class="row hover-menu">
														<?php for ($i = 0; $i < count($category['children']);) { ?>
														<div class="col-sm-<?php echo $row_fluid; ?>">
															<div class="menu">
																<ul>
																  <?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
																  <?php for (; $i < $j; $i++) { ?>
																  <?php if (isset($category['children'][$i])) { ?>
																  <li><a href="<?php echo $category['children'][$i]['href']; ?>" onclick="window.location = '<?php echo $category['children'][$i]['href']; ?>';"><?php echo $category['children'][$i]['name']; ?></a></li>
																  <?php } ?>
																  <?php } ?>
																</ul>
															</div>
														</div>
														<?php } ?>
													</div>
												</div>
											</div>
											<?php } ?>
										</li>
										<?php } ?>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<?php
					}
					?>
				</div>
			</div>
		</div>
	</div>
	
	<?php $slideshow = $modules->getModules('slideshow'); ?>
	<?php  if(count($slideshow)) { ?>
	<!-- Slider -->
	<div id="slider" class="<?php if($this->theme_options->get( 'slideshow_layout' ) == 1) { echo 'full-width'; } else { echo 'fixed'; } ?>">
		<div class="background-slider"></div>
		<div class="background">
			<div class="shadow"></div>
			<div class="pattern">
				<?php foreach($slideshow as $module) { ?>
				<?php echo $module; ?>
				<?php } ?>
			</div>
		</div>
	</div>
	<?php } ?>
</header>