<?php echo $header; ?>
<?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/wrapper_top.tpl'); ?>
<!-- START TOP BLOCK-->
<?php if ($_SERVER['REQUEST_URI'] == '/kupit-3d-printer/autoprom/') {?>
  <p class="category-header">Автопром</p>

  <p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Современная 3D печать, позволяет создавать высокоточные прототипы и позволяющие выдерживать серьезные нагрузки.&nbsp;</span></span><span style="font-family: arial, helvetica, sans-serif; font-size: 14px; line-height: 1.6;">При самостоятельном создании концептуальных моделей, прототипов, инструментов, а также мелкосерийных конечных деталей большинство инженеров, дизайнеров начинают переходить к серийному производству.</span></p>

  <p style="text-align: justify;"><br />
  <span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">На данном этапе развития, 3D принтеры могут изготавливать прототипы с производительностью, недосягаемой для классических методов производства. Если необходимо снижение расхода топлива, оптимизация соотношения деталей или их веса и габаритов, сокращение расходов на оснастку, 3D-технологии помогут вам улучшить свои показатели в автомобилестроении.</span></span></p>

  <p style="text-align: center;">&nbsp;</p>

  <p style="text-align: center;"><strong><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Использование современных аддитивных технологий в машиностроении позволяет:</span></span></strong></p>

  <p style="text-align: center;">&nbsp;</p>

  <ul>
    <li style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">производить сложнопрофильные и экслюзивные детали, не применяя для этого дорогостояще станки и их оснастку</span></span></li>
    <li style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">повышать рентабельность мелкосерийного производства</span></span></li>
    <li style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">устранять действие &laquo;человеческого&raquo; фактора при производстве деталей: процесс разработки осуществляется в авто- и полуавтоматическом режиме</span></span></li>
    <li style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">снижать вес деталей</span></span></li>
    <li style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">создавать комплексные, интегрированные детали за 1 технологический цикл</span></span></li>
    <li style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">управлять свойствами получаемого изделия</span></span></li>
  </ul>

  <p style="text-align: justify;"><span style="font-family: arial, helvetica, sans-serif; font-size: 14px; text-align: justify; line-height: 1.6;">Изготовление прототипов происходит в течение нескольких часов, давая при этом возможность быстрого принятия решения о доработке или старте изделия в серию. При этом малое количество времени, затраченное на конструкторские работы, позволяет существенно сократить стоимость производства. В текущих рыночных условиях, быстрая поставка на рынок обеспечит высокий спрос со стороны покупателей.</span></p>

  <p style="text-align: justify;"><span style="font-size:14px;"><span style="font-family:arial,helvetica,sans-serif;">Применяя функциональное прототипирование при производстве, Вы можете с большей вероятностью обнаруживать ошибки на этапе разработки и конструирования. Исправление и доводка именно на данном этапе, будет стоить во много раз дешевле аналогичного процесса, замеченного позже.</span></span></p>

  <!-- Slider -->

<link href="/main.css" rel="stylesheet" />
<link href="/catalog/view/theme/default/stylesheet/feedback.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/fotorama/fotorama.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/owl-carousel/owl.carousel.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/owl-carousel/owl.theme.css" rel="stylesheet" />
<link href="http://my3dgift.ru/js/fancybox/jquery.fancybox.css" media="screen" rel="stylesheet" type="text/css" />
<script src="http://my3dgift.ru/js/owl-carousel/owl.carousel.js"></script>
<script type="text/javascript" src="http://my3dgift.ru/js/fancybox/jquery.fancybox.pack.js"></script>

 <script>
    $(document).ready(function() {
        $("[id*='Btn']").stop(true).on('click',function(e){e.preventDefault();$(this).scrolld();})
        $('.spoiler__link').on('click', function(e) {
            $(this).toggleClass('spoiler__link_active').parent().siblings('.spoiler__body').slideToggle('slow');
            e.preventDefault();
        });
        $("#examples1,#examples2,#examples3,#examples4,#examples5,#examples6,#examples7,#examples8").owlCarousel({
            items: 4, //кол-во картинок на странцие
            navigation: true
        });
        $(".fancybox").fancybox({
            helpers: {
                overlay: {
                  locked: false
                }
            }
        });
    });
</script> 

<section class="example" id="example">
  <div class="container__inner">
    <div id="examples2" style="text-align: center;">
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_1.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_1.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_2.png" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_2.png" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_3.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_3.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_4.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_4.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_5.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_5.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_6.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_6.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_7.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_7.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_8.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_8.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_9.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_9.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_10.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_10.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_11.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_11.jpg" />
      </a>
      <a class="fancybox" href="/image/data/catalog/3d-printer/autoprom/autoprom_12.jpg" rel="group2">
        <img alt="" src="/image/data/catalog/3d-printer/autoprom/autoprom_12.jpg" />
      </a>
    </div>
  </div>
</section>


  <p style="text-align: center;font: 14px Arial; font-weight:bold">Мы подобрали для Вас самое оптимальное 3D-оборудование, подходящее для Автопрома</p>

  <!-- Printers -->


<?php } else if ($_SERVER['REQUEST_URI'] == '') {?>

<?php } ?>

<?php if ($_SERVER['REQUEST_URI'] == '/kupit-3d-printer/autoprom/') {?>

<?php } else {?>
  <? if(isset($manufacturers)): ?>

	<div class="manufacturers-list clearfix">
		<h3>Популярные производители</h3>
		<ul style="text-align:center;">
			<?
			foreach($manufacturers as $manufacturer){
				?>
				<li>
					<a href="<?php echo $manufacturer['link']; ?>"><?= $manufacturer['title'] ?></a>
				</li>
				<?
			}
			?>
		</ul>
	</div>
	<? endif; ?>
<?php } ?>

<!-- END TOP BLOCK-->


  <?php if ($thumb || $description) { ?>
  <div class="category-info clearfix">
    <?php if ($thumb) { ?>
    <div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
    <?php } ?>
    <?php if ($description) { ?>
    <?php echo $description; ?>
    <?php } ?>
  </div>
  <?php } ?>
  <?php if ($categories && $this->theme_options->get('refine_search_style') != '2') { ?>
  <? /*
  <h2 class="refine_search"><?php echo $text_refine; ?></h2> */ ?>
  <div class="refine_search"><?php echo $text_refine; ?></div>
  <div class="category-list<?php if ($this->theme_options->get('refine_search_style') == '1') { echo ' category-list-text-only'; } ?>">
  	<div class="row">
  	  <?php 
  	  $class = 3; 
  	  $row = 4; 
  	  
  	  if($this->theme_options->get( 'refine_search_number' ) == 2) { $class = 62; }
  	  if($this->theme_options->get( 'refine_search_number' ) == 5) { $class = 25; }
  	  if($this->theme_options->get( 'refine_search_number' ) == 3) { $class = 4; }
  	  if($this->theme_options->get( 'refine_search_number' ) == 6) { $class = 2; }
  	  
  	  if($this->theme_options->get( 'refine_search_number' ) > 1) { $row = $this->theme_options->get( 'refine_search_number' ); } 
  	  ?>
	  <?php $row_fluid = 0; foreach ($this->theme_options->refineSearch() as $category) { $row_fluid++; ?>
	  	<?php 
	  	if ($this->theme_options->get('refine_search_style') != '1') {
	  		$width = 250;
	  		$height = 250;
	  		if($this->theme_options->get( 'refine_image_width' ) > 20) { $width = $this->theme_options->get( 'refine_image_width' ); }
	  		if($this->theme_options->get( 'refine_image_height' ) > 20) { $height = $this->theme_options->get( 'refine_image_height' ); }
		  	if($category['thumb'] != '') { 
		  		$image = $this->model_tool_image->resize($category['thumb'], $width, $height); 
		  	} else { 
		  		$image = $this->model_tool_image->resize('no_image.jpg', $width, $height); 
		  	} 
	  	}
	  	?>
	  	<?php $r=$row_fluid-floor($row_fluid/$row)*$row; if($row_fluid>$row && $r == 1) { echo '</div><div class="row">'; } ?>
	  	<div class="col-sm-<?php echo $class; ?> col-xs-6">
	  		<?php if ($this->theme_options->get('refine_search_style') != '1') { ?>
		  	<a href="<?php echo $category['href']; ?>"><img src="<?php echo $image; ?>" alt="<?php echo $category['name']; ?>" /></a>
		  	<?php } ?>
		  	<a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
	  	</div>
	  <?php } ?>
	</div>
  </div>
  <?php } ?>
  <?php if ($products) { ?>
  <!-- Filter -->
  <div class="product-filter clearfix">
  	<div class="options">
  		 <!--<div class="product-compare"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div>-->
  		
  		<div class="button-group display" data-toggle="buttons-radio">
  			<button id="grid" <?php if($this->theme_options->get('default_list_grid') == '1') { echo 'class="active"'; } ?> rel="tooltip" title="Grid" onclick="display('grid');"><i class="icon-th-large"></i></button>
  			<button id="list" <?php if($this->theme_options->get('default_list_grid') != '1') { echo 'class="active"'; } ?> rel="tooltip" title="List" onclick="display('list');"><i class="icon-th-list"></i></button>
  		</div>
  	</div>
  	
  	<div class="list-options">
  		<div class="sort">
  			<?php echo $text_sort; ?>
  			<select onchange="location = this.value;">
  			  <?php foreach ($sorts as $sorts) { ?>
  			  <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
  			  <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
  			  <?php } else { ?>
  			  <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
  			  <?php } ?>
  			  <?php } ?>
  			</select>
  		</div>
  		
  		<div class="limit">
  			<?php echo $text_limit; ?>
  			<select onchange="location = this.value;">
  			  <?php foreach ($limits as $limits) { ?>
  			  <?php if ($limits['value'] == $limit) { ?>
  			  <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
  			  <?php } else { ?>
  			  <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
  			  <?php } ?>
  			  <?php } ?>
  			</select>
  		</div>
  	</div>
  </div>
  
  <!-- Products list -->
  <div class="product-list"<?php if($this->theme_options->get('default_list_grid') == '1') { echo ' style="display:none;"'; } ?>>
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
  				<div class="description"><?php echo $product['description']; ?></div>
  				<?php if ($product['rating']) { ?>
  				<div class="rating-reviews clearfix">
  					<div class="rating"><i class="icon-star<?php if($product['rating'] >= 1) { echo ' active'; } ?>"></i><i class="icon-star<?php if($product['rating'] >= 2) { echo ' active'; } ?>"></i><i class="icon-star<?php if($product['rating'] >= 3) { echo ' active'; } ?>"></i><i class="icon-star<?php if($product['rating'] >= 4) { echo ' active'; } ?>"></i><i class="icon-star<?php if($product['rating'] >= 5) { echo ' active'; } ?>"></i></div>
  				</div>
  				<?php } ?>
  			</div>
  			
  			<div class="actions col-sm-3">
  				<div style='text-align: center;'>
				<?php if ($product['price']>0) { ?>
  					<div class="price">
  						<?php if (!$product['special']) { ?>
  						<?php echo $product['price']; ?>
  						<?php } else { ?>
  						<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
  						<?php } ?>
  					</div>
					
					<div class="add-to-cart">
					<a onclick="addToCart('<?php echo $product['product_id']; ?>', 1, 'image_<?php echo $product['product_id']; ?>');" class="button" id="ay" style="margin-bottom: 5px"><?php echo $button_cart; ?></a>
					</div>
					<a class="button" id="ay" onclick="instockrequest('<?php echo $product['product_id']; ?>');" style="margin-left:2px;margin-top: 5px;">Запросить КП</a>

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
  						<!--li>+ <a onclick="addToWishList('<?php echo $product['product_id']; ?>');"><?php if($this->theme_options->get( 'add_to_wishlist_text', $this->config->get( 'config_language_id' ) ) != '') { echo $this->theme_options->get( 'add_to_wishlist_text', $this->config->get( 'config_language_id' ) ); } else { echo 'Add to wishlist'; } ?></a></li-->
					</ul>
										
					<?php } else { ?>
					    <a class="button" id="ay" onclick="instockrequest('<?php echo $product['product_id']; ?>');" style="margin-left: 0px;margin-top: 5px;">Запросить КП</a>
			<?php /* ADD OCDESIGN.RU VKREDIT PAYMENT */ ?>
					<div class="add-to-vkredit" style="padding-left: 0px; text-align: center;">
					<?php if (!$product['link_id'] == 0) { ?>
							<input type="button" class="button-vkredit" onclick="window.location.href = '<?php echo $product['link']; ?>';" value="Купить в лизинг" />
					<?php } ?>
					</div>
			<?php /* END OCDESIGN.RU VKREDIT PAYMENT */ ?>

					<ul>
  						<li>+ <a onclick="addToCompare('<?php echo $product['product_id']; ?>');">Сравнить</a></li>
  						<!--li>+ <a onclick="addToWishList('<?php echo $product['product_id']; ?>');"><?php if($this->theme_options->get( 'add_to_wishlist_text', $this->config->get( 'config_language_id' ) ) != '') { echo $this->theme_options->get( 'add_to_wishlist_text', $this->config->get( 'config_language_id' ) ); } else { echo 'Add to wishlist'; } ?></a></li-->
					</ul>
					<?php } ?>
  				</div>
  			</div>
  		</div>
  	</div>
  	<?php } ?>
	
  </div>
  
  <!-- Products grid -->
  <?php 
  $class = 3; 
  $row = 4; 
  
  if($this->theme_options->get( 'product_per_pow2' ) == 6) { $class = 2; }
  if($this->theme_options->get( 'product_per_pow2' ) == 5) { $class = 25; }
  if($this->theme_options->get( 'product_per_pow2' ) == 3) { $class = 4; }
  
  if($this->theme_options->get( 'product_per_pow2' ) > 1) { $row = $this->theme_options->get( 'product_per_pow2' ); } 
  ?>
  <div class="product-grid"<?php if(!($this->theme_options->get('default_list_grid') == '1')) { echo ' style="display:none;"'; } ?>>
  	<div class="row">
	  	<?php $row_fluid = 0; foreach ($products as $product) { $row_fluid++; ?>
		  	<?php $r=$row_fluid-floor($row_fluid/$row)*$row; if($row_fluid>$row && $r == 1) { echo '</div><div class="row">'; } ?>
		  	<div class="col-sm-<?php echo $class; ?> col-xs-6">
		  	    <?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/product.tpl'); ?>
		  	</div>
	    <?php } ?>
    </div>
  </div>
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } ?>
  <?php if (!$categories && !$products) { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php } ?>

<?php if ($_SERVER['REQUEST_URI'] == '/kupit-3d-printer/autoprom/') {?>

<!-- Video -->
<ul class="category-video-bottom">
  <li>  
    <iframe width="800" height="450" src="https://www.youtube.com/embed/CD7yB9gZDIk?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
  <li>  
    <iframe width="800" height="450" src="https://www.youtube.com/embed/CD7yB9gZDIk?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
  <li>  
    <iframe width="800" height="450" src="https://www.youtube.com/embed/CD7yB9gZDIk?rel=0&amp;showinfo=0" frameborder="0" allowfullscreen></iframe>
  </li>
</ul>

<?php } else if ($_SERVER['REQUEST_URI'] == '') {?>

<?php } ?>
  <?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/module/simple_form.tpl'); ?>



<script type="text/javascript"><!--
$('#button-vkredit').bind('click', function() {
	$('#vkredit_input')
	 addToCart();
});

function display(view) {

	if (view == 'list') {
		$('.product-grid').css("display", "none");
		$('.product-list').css("display", "block");

		$('.display').html('<button id="grid" rel="tooltip" title="Grid" onclick="display(\'grid\');"><i class="icon-th-large"></i></button> <button class="active" id="list" rel="tooltip" title="List" onclick="display(\'list\');"><i class="icon-th-list"></i></button>');
		
		$.cookie('display', 'list'); 
	} else {
	
		$('.product-grid').css("display", "block");
		$('.product-list').css("display", "none");
					
		$('.display').html('<button class="active" id="grid" rel="tooltip" title="Grid" onclick="display(\'grid\');"><i class="icon-th-large"></i></button> <button id="list" rel="tooltip" title="List" onclick="display(\'list\');"><i class="icon-th-list"></i></button>');
		
		$.cookie('display', 'grid');
	}
}

view = $.cookie('display');

if (view) {
display(view);
} else {
display('list');
}
//--></script> 
<?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/wrapper_bottom.tpl'); ?>
<?php echo $footer; ?>