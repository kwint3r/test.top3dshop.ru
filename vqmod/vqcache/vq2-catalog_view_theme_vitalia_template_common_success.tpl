<?php echo $header; ?>
<?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/wrapper_top.tpl'); ?>
  <?php echo $text_message; ?>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
<?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/wrapper_bottom.tpl'); ?>

<?php /* ADD YA */ ?>
<?php if(isset($order_id) && $order_id) { ?>
<script type="text/javascript">

var yaParams = {
order_id: "<?php echo $order_id; ?>",
order_price: <?php echo  round($order_info["total"]); ?>, 
currency: "<?php echo $order_info["currency_code"]; ?>",
exchange_rate: 1,
goods: []
};

<?php foreach ($order_products as $i=>$row) { ?>
yaParams.goods[<?php echo $i; ?>] = {
id: "<?php echo $row["order_product_id"]; ?>", 
name: "<?php echo htmlentities($row['name'],ENT_COMPAT,'UTF-8'); ?>", 
price: "<?php echo  round($row["price"]); ?>",
quantity: "<?php echo $row["quantity"]; ?>"
} 
<?php } ?>                     

</script>
<?php } ?>
<?php /* END YA */ ?>
			

        
<?php if (isset($order_id) && $order_id) { ?>
<!-- Google Analytics - Ecommerce Tracking (Universal Analytics) -->
<script type="text/javascript">
ga('require', 'ecommerce', 'ecommerce.js');

ga('ecommerce:addTransaction', {
   'id':          '<?php echo $order_id; ?>',
   'affiliation': '<?php echo $order_info["store_name"]; ?>',
   'revenue':     '<?php echo $order_info["total"]; ?>',
   'shipping':    '<?php echo $shipping; ?>',
   'tax':         '<?php echo $tax; ?>',
   'currency':    '<?php echo $order_info["currency_code"]; ?>'
});

<?php foreach ($order_products as $row) { ?>
ga('ecommerce:addItem', {
   'id':       '<?php echo $order_id; ?>',
   'name':     '<?php echo $row["name"]; ?>',
   'sku':      '<?php echo $row["model"]; ?>',
   'price':    '<?php echo $row["price"]; ?>',
   'quantity': '<?php echo $row["quantity"]; ?>'
});
<?php } ?>

ga('ecommerce:send');
</script>
<!-- End Google Analytics - Ecommerce Tracking (Universal Analytics) -->
<?php } ?>
        
      
<?php echo $footer; ?>