<?php if (isset($signer_code) && $signer_code=='customer_id') { ?>
<div class="form_customer_signer">
	<form action="<?php echo $action; ?>" name="customer_subscribe" id="customer_subscribe" method="post" enctype="multipart/form-data">
		<div style="float: right; text-align: right; margin-top: 5px; margin-right: 5px;">
			<a href="#" style="" class="hrefajax" onclick="$('.form_customer_signer').hide('slide', {direction: 'up' }, 'slow'); return false;"><?php echo $this->language->get('hide_block'); ?></a>
		</div>
		<div class="form_customer_content">
			<b><?php echo $entry_email; ?></b><br />
			<input type="text" name="email" value="<?php echo $email; ?>" />
			<br />
			<br />
			<b><?php echo $entry_password; ?></b><br />
			<input type="password" name="password" value="<?php echo $password; ?>" />
			<br />
			<a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a><br />
			<br />
			<input type="submit" value="<?php echo $button_login; ?>" class="button" />
			<a href="<?php echo $register; ?>" class="marginleft10"><?php echo $this->language->get('error_register'); ?></a>
			<?php if ($redirect) { ?>
			<input type="hidden" name="redirect" value="<?php echo $redirect; ?>#comments_signer" />
			<?php }  ?>
		</div>
		<div class="form_customer_content" style="margin-top:5px;">
			<?php echo $text_or_email; ?>
			<br>
			<input type="text" name="email_ghost" value="<?php if (isset($email_ghost) && $email_ghost!='') echo $email_ghost; ?>" />
			<?php if (isset($email_error) && $email_error=='email') { ?>
			<div class="error">
				<?php echo $this->language->get('text_email_error'); ?>
			</div>
			<?php }  ?>
			<?php if (isset($email_error) && $email_error=='noemail') { ?>
			<div class="error">
				<?php echo $this->language->get('text_noemail_error'); ?>
			</div>
			<?php }  ?>
			<div class="margintop5">
				<a class="button textdecoration_none comments_signer"> <?php echo $text_subscribe; ?></a>
			</div>
		</div>
	</form>
</div>
<?php } ?>
<?php if (isset($signer_code) && $signer_code=='record_id') { ?>
<div class="warning">
	<?php echo $this->language->get('error_record_id'); ?>
</div>
<?php } ?>
<?php if (isset($signer_code) && $signer_code=='no_signer') { ?>
<div class="warning">
	<?php echo $this->language->get('error_no_signer'); ?>
</div>
<?php } ?>
<?php if (isset($signer_code) && $signer_code=='set') { ?>
<div class="success">
	<?php echo $this->language->get('success_set'); ?>
</div>
<?php } ?>
<?php if (isset($signer_code) && $signer_code=='remove') { ?>
<div class="success">
	<?php echo $this->language->get('success_remove'); ?>
</div>
<?php } ?>