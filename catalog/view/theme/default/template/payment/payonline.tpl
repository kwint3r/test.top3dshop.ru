<form action="<?php echo $action ?>" method="POST" id="payment">
	<?php foreach($this->data['fields'] as $k => $v) {?>
		<input type="hidden" name="<?php echo $k?>" value="<?php echo $v?>"/>
	<?php }?>
</form>

<div class="buttons">
	<div class="right">
      <a onclick="$('#payment').submit();" class="button"><span><?php echo $button_confirm; ?></span></a>
	</div>
</div>
