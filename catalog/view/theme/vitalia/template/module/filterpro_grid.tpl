<script type="text/javascript" src="catalog/view/theme/vitalia/js/products.js"></script>
  <!-- Products grid -->
  <?php 
  $class = 3; 
  $row = 4; 
  
  if($this->theme_options->get( 'product_per_pow2' ) == 6) { $class = 2; }
  if($this->theme_options->get( 'product_per_pow2' ) == 5) { $class = 25; }
  if($this->theme_options->get( 'product_per_pow2' ) == 3) { $class = 4; }
  
  if($this->theme_options->get( 'product_per_pow2' ) > 1) { $row = $this->theme_options->get( 'product_per_pow2' ); } 
  ?>
  <div class="row">
	  	<?php $row_fluid = 0; foreach ($products as $product) { $row_fluid++; ?>
		  	<?php $r=$row_fluid-floor($row_fluid/$row)*$row; if($row_fluid>$row && $r == 1) { echo '</div><div class="row">'; } ?>
		  	<div class="col-sm-<?php echo $class; ?> col-xs-6">
		  	    <?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/product.tpl'); ?>
		  	</div>
	    <?php } ?>
    </div>
