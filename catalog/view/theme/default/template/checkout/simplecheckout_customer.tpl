<div class="simplecheckout-block-heading" <?php echo $simple_customer_hide_if_logged ? 'style="display:none"' : '' ?>>
    <?php echo $text_checkout_customer ?>
    <?php if ($simple_customer_view_login) { ?>
    <span class="simplecheckout-block-heading-button">
        <a href="<?php echo $default_login_link ?>" <?php if (!$is_mobile) { ?>onclick="simple_login_open();return false;"<?php } ?> id="simplecheckout_customer_login"><?php echo $text_checkout_customer_login ?></a>
    </span>
    <?php } ?>
</div>  

<?php /* start loginza */  ?>

<?php
if( !empty($this->request->get['loginza2close']) )
{
	$this->session->data['loginza2_confirmdata_show'] = 0;
}

if( !$this->customer->isLogged() ) {
if( $this->config->get('loginza2_shop_folder') )
$loginza2_shop_folder = '/'.$this->config->get('loginza2_shop_folder');
else
$loginza2_shop_folder = '';

$this->session->data['loginza2_lastlink'] = $loginza2_shop_folder.'/index.php?route=checkout/simplecheckout';


/* start update: a1 */ 
if( !empty($this->session->data['loginza2_confirmdata']) && 
	!empty($this->session->data['loginza2_confirmdata_show'])
	)
{
	$data = unserialize( $this->session->data['loginza2_confirmdata'] );
	
	$loginza2_confirm_block = $this->config->get('loginza2_confirm_block');
	
	
	$loginza2_confirm_block = str_replace("#divframe_height#", (280-(32*(5-(count(unserialize($this->session->data['loginza2_confirmdata'])))))), $loginza2_confirm_block );
	
	$loginza2_confirm_block = str_replace("#frame_height#", (320-(32*(5-(count(unserialize($this->session->data['loginza2_confirmdata'])))))), $loginza2_confirm_block);
	
	$loginza2_confirm_block = str_replace("#lastlink#", $this->session->data['loginza2_lastlink'].'&loginza2close=1', $loginza2_confirm_block);
	
	$loginza2_confirm_block = str_replace("#frame_url#", $this->url->link( 'account/loginza2/frame' ), $loginza2_confirm_block);
	
	$this->session->data['loginza2_confirmdata_show'] = 0;
	
	echo $loginza2_confirm_block;
}
/* end update: a1 */ 

$loginza_code = $this->config->get('loginza_simple_code');
$lang_hash = array(
	"ru"=>"ru",
	"uk"=>"uk",
	"ua"=>"uk",
	"be"=>"be",
	"fr"=>"fr",
	"en"=>"en"
);

if( !empty($lang_hash[ strtolower($this->config->get('config_language')) ]) )
{
	$loginza_code = str_replace("#lang#", 
							$lang_hash[ strtolower($this->config->get('config_language')) ], 
							$loginza_code);
}
else
{
	$loginza_code = str_replace("&lang=#lang#", "", $loginza_code);
}

	$loginza_label = $this->config->get('loginza2_label');
	
	$loginza_code = str_replace("#loginza_label#", $loginza_label[ $this->config->get('config_language_id') ], $loginza_code );
	
			
	$loginza_code = str_replace("#domain#", 
								urlencode( preg_replace("/\/$/", "", 'http://'.$_SERVER['HTTP_HOST']) ), 
								$loginza_code 
								);
								
echo $loginza_code; 
} ?>
<?php /* end loginza */ ?>


<div class="simplecheckout-block-content" <?php echo $simple_customer_hide_if_logged ? 'style="display:none"' : '' ?>>
    <?php if ($simple_customer_registered) { ?>
        <div class="success" id="customer_registered" style="text-align:left;"><?php echo $simple_customer_registered ?></div>
    <?php } ?>
    <?php if ($text_you_will_be_registered) { ?>
        <div class="you-will-be-registered"><?php echo $text_you_will_be_registered ?></div>
    <?php } ?>
    <?php if ($simple_customer_view_address_select && !empty($addresses)) { ?>
        <div class="simplecheckout-customer-address">
        <span><?php echo $text_select_address ?>:</span>&nbsp;
        <select name='customer_address_id' id="customer_address_id" reload='address_changed'>
            <option value="0" <?php echo $customer_address_id == 0 ? 'selected="selected"' : '' ?>><?php echo $text_add_new ?></option>
            <?php foreach($addresses as $address) { ?>
                <option value="<?php echo $address['address_id'] ?>" <?php echo $customer_address_id == $address['address_id'] ? 'selected="selected"' : '' ?>><?php echo $address['firstname']; ?> <?php echo !empty($address['lastname']) ? ' '.$address['lastname'] : ''; ?><?php echo !empty($address['address_1']) ? ', '.$address['address_1'] : ''; ?><?php echo !empty($address['city']) ? ', '.$address['city'] : ''; ?></option>
            <?php } ?>
        </select>
        </div>
    <?php } ?>
    <input type="hidden" name="<?php echo Simple::SET_CHECKOUT_CUSTOMER ?>[address_id]" id="customer_address_id" value="<?php echo $customer_address_id ?>" />
    <?php $split_previous = false; ?>
    <?php $user_choice = false; ?>
    <div class="simplecheckout-customer-block">
    <table class="<?php echo $simple_customer_two_column ? 'simplecheckout-customer-two-column-left' : 'simplecheckout-customer-one-column' ?>">
        <?php $email_field_exists = false; ?>
        <?php $i = 0; ?>
        <?php $geo_selector_used = false; ?>
        <?php foreach ($checkout_customer_fields as $field) { ?>
            <?php if ($i == 0 && !$customer_logged && $simple_customer_action_register == Simple::REGISTER_USER_CHOICE) { ?>
                <tr>
                    <td class="simplecheckout-customer-left">
                       <?php echo $entry_register; ?>
                    </td>
                    <td class="simplecheckout-customer-right">
                      <label><input type="radio" name="register" value="1" <?php echo $register == 1 ? 'checked="checked"' : ''; ?> reload="customer_register" /><?php echo $text_yes ?></label>&nbsp;
                      <label><input type="radio" name="register" value="0" <?php echo $register == 0 ? 'checked="checked"' : ''; ?> reload="customer_not_register" /><?php echo $text_no ?></label>
                    </td>
                </tr>
                <?php $user_choice = true; ?>
            <?php $i++ ?>
            <?php } ?>
            <?php if ($field['type'] == 'hidden') { ?>
                <?php continue; ?>
            <?php } elseif ($field['type'] == 'header') { ?>
            <tr class="simple_table_row" <?php echo !empty($field['place']) ? 'place="'.$field['place'].'"' : '' ?>>
                <td colspan="2" <?php echo $user_choice && $split_previous ? 'class="simple-header-right"' : ''; ?>>
                    <?php echo $field['tag_open'] ?><?php echo $field['label'] ?><?php echo $field['tag_close'] ?>
                </td>
            </tr>
            <?php } elseif ($field['type'] == 'split') { ?>
                </table>
                <table class="<?php echo $simple_customer_two_column ? 'simplecheckout-customer-two-column-right' : 'simplecheckout-customer-one-column' ?>">
                <?php $split_previous = true; ?>
            <?php } else { ?>
                <?php if ((($user_choice && $i == 1) || (!$user_choice && $i == 0)) && $simple_customer_view_customer_type) { ?>
                    <tr>
                        <td class="simplecheckout-customer-left">
                            <span class="simplecheckout-required">*</span>
                            <?php echo $entry_customer_type ?>
                        </td>
                        <td class="simplecheckout-customer-right">
                            <?php if ($simple_type_of_selection_of_group == 'select') { ?>
                            <select name="customer_group_id" reload="group_changed">
                                <?php foreach ($customer_groups as $id => $name) { ?>
                                <option value="<?php echo $id ?>" <?php echo $id == $customer_group_id ? 'selected="selected"' : '' ?>><?php echo $name ?></option>
                                <?php } ?>
                            </select>
                            <?php } else { ?>
                                <?php foreach ($customer_groups as $id => $name) { ?>
                                <label><input type="radio" name="customer_group_id" reload="group_changed" value="<?php echo $id ?>" <?php echo $id == $customer_group_id ? 'checked="checked"' : '' ?>><?php echo $name ?></label><br>
                                <?php } ?>
                            <?php } ?>
                        </td>
                    </tr>
                    <?php $i++ ?>
                    <?php $split_previous = false; ?>
                <?php } ?>
                <?php if ($field['id'] == 'main_email') { ?>
                    <?php /*if (!$customer_logged) {*/ ?>
                        <?php if (!$simple_customer_action_register &&  !$simple_customer_view_email && !$simple_customer_view_customer_type) { continue; } ?>
                        <?php $split_previous = false; ?>
                        <?php if (!($simple_customer_view_email == Simple::EMAIL_NOT_SHOW && ($simple_customer_action_register == Simple::REGISTER_NO || ($simple_customer_action_register == Simple::REGISTER_USER_CHOICE && !$register)))) { ?>
                        <?php $email_field_exists = true; ?>
                        <tr>
                            <td class="simplecheckout-customer-left">
                                <?php if ($field['required']) { ?>
                                    <span class="simplecheckout-required" <?php echo ($simple_customer_view_email == Simple::EMAIL_SHOW_AND_NOT_REQUIRED && ($simple_customer_action_register == Simple::REGISTER_NO || ($simple_customer_action_register == Simple::REGISTER_USER_CHOICE && !$register))) ? ' style="display:none"' : '' ?>>*</span>
                                <?php } ?>
                                <?php echo $field['label'] ?>
                            </td>
                            <td class="simplecheckout-customer-right">
                                <?php echo $simple->html_field($field) ?>
                                <?php if (!empty($field['error']) && $simple_show_errors) { ?>
                                    <span class="simplecheckout-error-text"><?php echo $field['error']; ?></span>
                                <?php } ?>
                            </td>
                        </tr>
                        <?php if ($simple_customer_view_email_confirm) { ?>
                        <tr>
                            <td class="simplecheckout-customer-left">
                                <?php if ($field['required']) { ?>
                                    <span class="simplecheckout-required" <?php echo ($simple_customer_view_email == Simple::EMAIL_SHOW_AND_NOT_REQUIRED && ($simple_customer_action_register == Simple::REGISTER_NO || ($simple_customer_action_register == Simple::REGISTER_USER_CHOICE && !$register))) ? ' style="display:none"' : '' ?>>*</span>
                                <?php } ?>
                                <?php echo $entry_email_confirm ?>
                            </td>
                            <td class="simplecheckout-customer-right">
                                <input name="email_confirm" id="email_confirm" type="text" value="<?php echo $email_confirm ?>">
                                <span class="simplecheckout-error-text" id="email_confirm_error" <?php if (!($email_confirm_error && $simple_show_errors)) { ?>style="display:none;"<?php } ?>><?php echo $error_email_confirm; ?></span>
                            </td>
                        </tr>
                        <?php } ?>
                        <?php if ($simple_customer_action_register == Simple::REGISTER_YES || ($simple_customer_action_register == Simple::REGISTER_USER_CHOICE && $register)) { ?>
                            <tr id="password_row" <?php echo $simple_customer_generate_password ? ' style="display:none;"' : '' ?> <?php echo $simple_customer_generate_password ? 'autogenerate="1"' : '' ?>>
                                <td class="simplecheckout-customer-left">
                                    <span class="simplecheckout-required">*</span>
                                    <?php echo $entry_password ?>
                                </td>
                                <td class="simplecheckout-customer-right">
                                    <input <?php echo !empty($error_password) ? 'class="simplecheckout-red-border"' : '' ?> type="password" name="password" value="<?php echo $password ?>">
                                    <?php if (!empty($error_password) && $simple_show_errors) { ?>
                                        <span class="simplecheckout-error-text"><?php echo $error_password; ?></span>
                                    <?php } ?>
                                </td>
                            </tr>
                            <?php if ($simple_customer_view_password_confirm) { ?>
                            <tr id="confirm_password_row" <?php echo $simple_customer_generate_password ? ' style="display:none;"' : '' ?> <?php echo $simple_customer_generate_password ? 'autogenerate="1"' : '' ?>>
                                <td class="simplecheckout-customer-left">
                                    <span class="simplecheckout-required">*</span>
                                    <?php echo $entry_password_confirm ?>
                                </td>
                                <td class="simplecheckout-customer-right">
                                    <input <?php echo !empty($error_password_confirm) ? 'class="simplecheckout-red-border"' : '' ?> type="password" name="password_confirm" value="<?php echo $password_confirm ?>">
                                    <?php if (!empty($error_password_confirm) && $simple_show_errors) { ?>
                                        <span class="simplecheckout-error-text"><?php echo $error_password_confirm; ?></span>
                                    <?php } ?>
                                </td>
                            </tr>
                            <?php } ?>
                        <?php } ?>
                        <?php } ?>
                    <?php /*}*/ ?>
                    <?php if ($customer_logged) { continue; } ?>
                <?php } else { ?>
                    <tr class="simple_table_row <?php echo !empty($field['selector']) ? ' simple-geo-selector-customer' : '' ?>" <?php echo !empty($field['place']) ? 'place="'.$field['place'].'"' : '' ?><?php echo !empty($field['selector']) ? ' style="display:none;"' : '' ?>>
                        <td class="simplecheckout-customer-left">
                            <?php if ($field['required']) { ?>
                                <span class="simplecheckout-required">*</span>
                            <?php } ?>
                            <?php echo $field['label'] ?>
                        </td>
                        <td class="simplecheckout-customer-right">
                            <?php echo $simple->html_field($field) ?>
                            <?php if (!empty($field['error']) && $simple_show_errors) { ?>
                                <span class="simplecheckout-error-text"><?php echo $field['error']; ?></span>
                            <?php } ?>
                        </td>
                    </tr>
                    <?php $split_previous = false; ?>
                    <?php $geo_selector_used = $geo_selector_used || !empty($field['selector']); ?>
                <?php } ?>
                <?php $i++; ?>
            <?php } ?>
        <?php } ?>
        <?php if ($geo_selector_used) { ?>
            <tr id="simple_geo_selector_customer">
                <td colspan="2" style="text-align:center;">
                    <a onclick="simplecheckout_show_selector('customer');"><?php echo $text_show_selector ?></a>
                </td>
            </tr>
        <?php } ?>
        <?php if ($simple_customer_action_subscribe == Simple::SUBSCRIBE_USER_CHOICE && $email_field_exists) { ?>
            <tr id="subscribe_row"<?php echo $simple_customer_action_register == Simple::REGISTER_USER_CHOICE && !$register && !$simple_customer_view_email ? ' style="display:none;"' : '' ?>>
                <td class="simplecheckout-customer-left">
                   <?php echo $entry_newsletter; ?>
                </td>
                <td class="simplecheckout-customer-right">
                  <label><input type="radio" name="subscribe" value="1" <?php echo $subscribe == 1 ? 'checked="checked"' : ''; ?> /><?php echo $text_yes ?></label>&nbsp;
                  <label><input type="radio" name="subscribe" value="0" <?php echo $subscribe == 0 ? 'checked="checked"' : ''; ?> /><?php echo $text_no ?></label>
                </td>
            </tr>
        <?php } ?>
    </table>
    <?php foreach ($checkout_customer_fields as $field) { ?>
        <?php if ($field['type'] == 'hidden') { ?>
        <?php echo $simple->html_field($field) ?>
        <?php } ?>
    <?php } ?>
    </div>
</div>

<?php if ($simple_show_shipping_address) { ?>
<div class="simplecheckout-customer-same-address">
<?php if ($simple_show_shipping_address_same_show) { ?>
    <label><input type="checkbox" name="shipping_address_same" id="shipping_address_same" value="1" <?php if ($shipping_address_same) { ?>checked="checked"<?php } ?> reload="address_same">&nbsp;<?php echo $entry_address_same ?></label>
<?php } ?>
</div>
<?php if (!$shipping_address_same) { ?>
<div class="simplecheckout-block-heading simplecheckout-shipping-address" <?php echo $simple_address_hide_if_logged ? 'style="display:none"' : '' ?>>
    <?php echo $text_checkout_shipping_address ?>
</div>  
<div class="simplecheckout-block-content simplecheckout-shipping-address" <?php echo $simple_address_hide_if_logged ? 'style="display:none"' : '' ?>>
    <?php if ($simple_shipping_view_address_select && !empty($addresses)) { ?>
        <div class="simplecheckout-customer-address">
        <span><?php echo $text_select_address ?>:</span>&nbsp;
        <select name='shipping_address_id' id="shipping_address_id" reload='address_changed'>
            <option value="0" <?php echo $shipping_address_id == 0 ? 'selected="selected"' : '' ?>><?php echo $text_add_new ?></option>
            <?php foreach($addresses as $address) { ?>
                <option value="<?php echo $address['address_id'] ?>" <?php echo $shipping_address_id == $address['address_id'] ? 'selected="selected"' : '' ?>><?php echo $address['firstname']; ?> <?php echo !empty($address['lastname']) ? ' '.$address['lastname'] : ''; ?><?php echo !empty($address['address_1']) ? ', '.$address['address_1'] : ''; ?><?php echo !empty($address['city']) ? ', '.$address['city'] : ''; ?></option>
            <?php } ?>
        </select>
        </div>
    <?php } ?>
    <input type="hidden" name="<?php echo Simple::SET_CHECKOUT_ADDRESS ?>[address_id]" id="shipping_address_id" value="<?php echo $shipping_address_id ?>" />
    <div class="simplecheckout-customer-block">
    <table class="<?php echo $simple_customer_two_column ? 'simplecheckout-customer-two-column-left' : 'simplecheckout-customer-one-column' ?>">
        <?php $geo_selector_used = false; ?>
        <?php foreach ($checkout_address_fields as $field) { ?>
            <?php if ($field['type'] == 'hidden') { ?>
                <?php continue; ?>
            <?php } elseif ($field['type'] == 'header') { ?>
            <tr class="simple_table_row" <?php echo !empty($field['place']) ? 'place="'.$field['place'].'"' : '' ?>>
                <td colspan="2">
                    <?php echo $field['tag_open'] ?><?php echo $field['label'] ?><?php echo $field['tag_close'] ?>
                </td>
            </tr>
            <?php } elseif ($field['type'] == 'split') { ?>
                </table>
                <table class="<?php echo $simple_customer_two_column ? 'simplecheckout-customer-two-column-right' : 'simplecheckout-customer-one-column' ?>">
            <?php } else { ?>
            <tr class="simple_table_row <?php echo !empty($field['selector']) ? ' simple-geo-selector-address' : '' ?>" <?php echo !empty($field['place']) ? 'place="'.$field['place'].'"' : '' ?><?php echo !empty($field['selector']) ? ' style="display:none;"' : '' ?>>
                <td class="simplecheckout-customer-left">
                    <?php if ($field['required']) { ?>
                        <span class="simplecheckout-required">*</span>
                    <?php } ?>
                    <?php echo $field['label'] ?>
                </td>
                <td class="simplecheckout-customer-right">
                    <?php echo $simple->html_field($field) ?>
                    <?php if (!empty($field['error']) && $simple_show_errors) { ?>
                        <span class="simplecheckout-error-text"><?php echo $field['error']; ?></span>
                    <?php } ?>
                </td>
            </tr>
            <?php $geo_selector_used = $geo_selector_used || !empty($field['selector']); ?>
            <?php } ?>
        <?php } ?>
        <?php if ($geo_selector_used) { ?>
            <tr id="simple_geo_selector_address">
                <td colspan="2" style="text-align:center;">
                    <a onclick="simplecheckout_show_selector('address');"><?php echo $text_show_selector ?></a>
                </td>
            </tr>
        <?php } ?>
    </table>
    <?php foreach ($checkout_address_fields as $field) { ?>
        <?php if ($field['type'] == 'hidden') { ?>
        <?php echo $simple->html_field($field) ?>
        <?php } ?>
    <?php } ?>
    </div>
</div>
<?php } ?>
<?php } ?>
<?php if ($simple_debug) print_r($customer); ?>
<?php if ($simple_debug) print_r($comment); ?>
<?php /* ADD OCDESIG.RU KLADR */ ?>

<script>
$(function () {
	var $region = $('[name="region"]'),
		$city = $('[name="checkout_customer[main_city]"]'),
		$street = $('[name="checkout_customer[main_address_1]"]');

	// $city.attr("onchange", "simplecheckout_reload('cart_value_changed');");
		
	$.kladr.setDefault({
		parentInput: '.simplecheckout-customer-block',
		select: function (obj) {
			setLabel($(this), obj.type);
		},
		check: function (obj) {
			setLabel($(this), obj.type);
		}
	});

	$region.kladr('type', $.kladr.type.region);
	$city.kladr('type', $.kladr.type.city);
	$city.kladr({close: function(){simplecheckout_reload('cart_value_changed')}});
	$street.kladr('type', $.kladr.type.street);

	function setLabel ($input, text) {
		text = text.charAt(0).toUpperCase() + text.substr(1).toLowerCase();
		$input.parent().find('label').text(text);
	}
});
</script>

<div style='display:none'>
<div id="visa_message" style='padding:30px; background:#fff;text-align: center'>
<h2>Для оплаты картами авторизуйтесь через соц. сеть</h2>
<?php if(!empty($this->request->get['loginza2close'])){ ?>
<?php $this->session->data['loginza2_confirmdata_show'] = 0; ?>
<?php } ?>

<?php if( !$this->customer->isLogged() ) { ?>
<?php if( $this->config->get('loginza2_shop_folder') ) { ?>
<?php $loginza2_shop_folder = '/'.$this->config->get('loginza2_shop_folder'); ?>
<?php } else { ?>
<?php $loginza2_shop_folder = ''; ?>
<?php } ?>
<?php $this->session->data['loginza2_lastlink'] = $loginza2_shop_folder.'/index.php?route=checkout/simplecheckout'; ?>
<?php if(!empty($this->session->data['loginza2_confirmdata']) && !empty($this->session->data['loginza2_confirmdata_show'])){ ?>
<?php $data = unserialize($this->session->data['loginza2_confirmdata']); ?>
<?php $loginza2_confirm_block = $this->config->get('loginza2_confirm_block'); ?>
<?php $loginza2_confirm_block = str_replace("#divframe_height#", (280-(32*(5-(count(unserialize($this->session->data['loginza2_confirmdata'])))))), $loginza2_confirm_block ); ?>
<?php $loginza2_confirm_block = str_replace("#frame_height#", (320-(32*(5-(count(unserialize($this->session->data['loginza2_confirmdata'])))))), $loginza2_confirm_block); ?>
<?php $loginza2_confirm_block = str_replace("#lastlink#", $this->session->data['loginza2_lastlink'].'&loginza2close=1', $loginza2_confirm_block); ?>
<?php $loginza2_confirm_block = str_replace("#frame_url#", $this->url->link( 'account/loginza2/frame' ), $loginza2_confirm_block); ?>
<?php $this->session->data['loginza2_confirmdata_show'] = 0; ?>
<?php echo $loginza2_confirm_block; ?>
<?php } ?>
<?php $loginza_code = $this->config->get('loginza_simple_code'); ?>
<?php $lang_hash = array( "ru" => "ru", "uk" => "uk", "ua" => "uk", "en" => "en" ); ?>
<?php if(!empty($lang_hash[ strtolower($this->config->get('config_language')) ])) { ?>
<?php	$loginza_code = str_replace("#lang#", $lang_hash[ strtolower($this->config->get('config_language')) ], $loginza_code); ?>
<?php } else { ?>
<?php $loginza_code = str_replace("&lang=#lang#", "", $loginza_code); ?>
<?php } ?>
<?php $loginza_label = $this->config->get('loginza2_label'); ?>
<?php $loginza_code = str_replace("#loginza_label#", $loginza_label[ $this->config->get('config_language_id') ], $loginza_code ); ?>
<?php $loginza_code = str_replace("#domain#", urlencode( preg_replace("/\/$/", "", 'http://'.$_SERVER['HTTP_HOST']) ), $loginza_code ); ?>		
<?php echo $loginza_code; ?>
<?php } ?>
<h2>Либо пройдите быструю <a href="<?php echo $default_login_link ?>">регистрацию</a></h2>
<button class="button btn" onclick="$.colorbox.close();">Продолжить покупки без авторизации</button>
</div>
</div>
<div style='display:none'>
		<div id="kredit_message" style='padding:30px; background:#fff;text-align: center'>
			<p>Выбранные Вами товары Вы можете приобрести в кредит,</p>
			<p>воспользовавшись соответствующей опцией в каталоге или карточке товара.</p>
			<button class="button btn" onclick="$.colorbox.close();">Продолжить покупки без авторизации</button>
		</div>
</div>


<div style='display:none'>
		<div id="kredit_message_2" style='padding:30px; background:#fff;text-align: center'>
			<p>Выбранные Вами товары Вы можете приобрести в кредит,</p>
			<a href="javascript: kupivkredit()" class="button-vkredit">Оформить кредит</a>
			<p>либо продолжить оформление заказа другими способами оплаты</p>
			<button class="button btn" onclick="$.colorbox.close();">Продолжить покупки</button>
		</div>
</div>
<?php /* END OCDESIG.RU KLADR */ ?>