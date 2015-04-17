<?php echo $header; ?>
<div id="content">
<div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
</div>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="heading">
    <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
    <div class="buttons">
		<a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a>
		<a onclick="priceUpdate();" class="button">Пересчитать</a>
		<a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a>
	</div>
  </div>
  <div class="content">
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      <label for="usd">USD<label>
	  <input type="text" name="usd" id="usd" value="<?= isset($setting['usd']) ? $setting['usd'] : '' ?>"><br><br>
      <label for="eur">EUR<label>
	  <input type="text" name="eur" id="eur" value="<?= isset($setting['eur']) ? $setting['eur'] : '' ?>">
    </form>
  </div>
</div>
<script>
	function priceUpdate(){
		// alert('<?= $this->session->data['token'] ?>');
		// $(document).location('http://google.com');
		
		$.ajax({
			type: 'post',
			url: 'index.php?route=module/currency/priceUpdate&token=<?= $this->session->data['token'] ?>',
			data: {usd: $('#usd').val(), eur: $('#eur').val()}
		}).done(function(html){
			alert('Готово ' + html);
		})
		
			
	}
</script>
<?php echo $footer; ?>