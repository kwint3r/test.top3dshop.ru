<div class="simplecheckout-block-heading"><?php echo $text_checkout_payment_method ?></div>
<?php if ($simple_show_errors && $error_warning) { ?>
    <div class="simplecheckout-warning-block"><?php echo $error_warning ?></div>
<?php } ?>  
<div class="simplecheckout-block-content">
    <?php if (!empty($disabled_methods)) { ?>
        <table class="simplecheckout-methods-table" style="margin-bottom:0px;">
            <?php foreach ($disabled_methods as $key => $value) { ?>
                <tr>
                    <td class="code">
                        <input type="radio" name="disabled_payment_method" disabled="disabled" value="<?php echo $key; ?>" id="<?php echo $key; ?>" />
                    </td>
                    <td class="title">
                        <label for="<?php echo $key; ?>">
                            <?php echo $value['title']; ?>
                        </label>
                    </td>
                </tr>
                <?php if (!empty($value['description'])) { ?>
                    <tr>
                        <td class="code">
                        </td>
                        <td class="title">
                            <label for="<?php echo $key; ?>"><?php echo $value['description']; ?></label>
                        </td>
                    </tr>
                <?php } ?>
            <?php } ?>
        </table>
    <?php } ?>
	
    <?php if (!empty($payment_methods)) { ?>
        <table class="simplecheckout-methods-table">
            <?php foreach ($payment_methods as $payment_method) { ?>
                <tr>
                    <td class="code">
                        <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" <?php if ($payment_method['code'] == $code) { ?>checked="checked"<?php } ?> onchange="simplecheckout_reload('payment_changed')" />
                    </td>
                    <td class="title">
						<?php if ($payment_method['code'] == 'bank_transfer') { ?>
						<label for="<?php echo $payment_method['code']; ?>"><?php echo $payment_method['title']; ?></label>
						 <?php } else { ?>
						<label for="<?php echo $payment_method['code']; ?>"><img src="/image/payment/<?php echo $payment_method['code']; ?>.png" title="<?php echo $payment_method['code']; ?>" alt="<?php echo $payment_method['code']; ?>"/></label>
						<script>$('img').error(function(){ $(this).attr('src', '/image/payment/placeholder.gif');});</script>
						 <?php } ?>
                    </td>
                </tr>
                <?php if (!empty($payment_method['description'])) { ?>
                    <tr>
                        <td class="code">
                        </td>
                        <td class="title">
                            <label for="<?php echo $payment_method['code']; ?>"><?php echo $payment_method['description']; ?></label>
                        </td>
                    </tr>
                <?php } ?>
            <?php } ?>
        </table>
        <input type="hidden" name="payment_method_current" value="<?php echo $code ?>" />
        <input type="hidden" name="payment_method_checked" value="<?php echo $checked_code ?>" />
    <?php } ?>
    <?php if (empty($payment_methods) && $address_empty && $simple_payment_view_address_empty) { ?>
        <div class="simplecheckout-warning-text"><?php echo $text_payment_address; ?></div>
    <?php } ?>
    <?php if (empty($payment_methods) && !$address_empty) { ?>
        <div class="simplecheckout-warning-text"><?php echo $error_no_payment; ?></div>
    <?php } ?>
	
	
<?php /* ADD OCDESIGN.RU */ ?>
<script>
	//$('#nopayonline, #nokupivkredit').attr('disabled', 'disabled');
	$('#nopayonline, #nokupivkredit').removeAttr('onchange');
	
	var $nopayonline = $('#nopayonline, label[for="nopayonline"]');
	var $kupivkredit = $('#nokupivkredit, label[for="nokupivkredit"]');
	
	//$nopayonline.click(function() {
		//$.colorbox({href:"#visa_message",  inline:true});
	//});
	
	$kupivkredit.click(function() {
		$.colorbox({href:"#kredit_message_2",  inline:true});
	});	
	
	function kupivkredit(){
		$.ajax({
			type: 'post',
			url: 'index.php?route=checkout/cart/add',
			data: {vkredit: 1}
		}).done(function(html){
			location.reload();
		})
	}
</script>
<?php /* END OCDESIGN.RU */ ?>
	
</div>
<?php if ($simple_debug) print_r($address); ?>