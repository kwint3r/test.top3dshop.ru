<?php echo $header; ?>
<?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/wrapper_top.tpl'); ?>
  <div class="login-content">
    <div class="left">
      <h2><?php echo $text_new_customer; ?></h2>
      <div class="content">
        <p><b><?php echo $text_register; ?></b></p>
        <p><?php echo $text_register_account; ?></p>
        <a href="<?php echo $register; ?>" class="button"><?php echo $button_continue; ?></a></div>
    </div>
    <div class="right">
      <h2><?php echo $text_returning_customer; ?></h2>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="content">
          <p><?php echo $text_i_am_returning_customer; ?></p>
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
          <?php if ($redirect) { ?>
          <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
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
		$this->session->data['loginza2_lastlink'] = '/'.$this->config->get('loginza2_shop_folder').'/index.php?route=checkout/simplecheckout';
	else
		$this->session->data['loginza2_lastlink'] = '/index.php?route=checkout/simplecheckout';


/* start update: a1 */ 
if( !empty($this->session->data['loginza2_confirmdata']) && 
	!empty($this->session->data['loginza2_confirmdata_show']) )
{
	$data = unserialize( $this->session->data['loginza2_confirmdata'] );
	
	$loginza2_confirm_block = $this->config->get('loginza2_confirm_block');
	
	
	$loginza2_confirm_block = str_replace("#divframe_height#", (300-(35*(5-(count(unserialize($this->session->data['loginza2_confirmdata'])))))), $loginza2_confirm_block );
	
	$loginza2_confirm_block = str_replace("#frame_height#", (320-(35*(5-(count(unserialize($this->session->data['loginza2_confirmdata'])))))), $loginza2_confirm_block);
	
	$loginza2_confirm_block = str_replace("#lastlink#", $this->session->data['loginza2_lastlink'].'&loginza2close=1', $loginza2_confirm_block);
	
	$loginza2_confirm_block = str_replace("#frame_url#", $this->url->link( 'account/loginza2/frame' ), $loginza2_confirm_block);
	
	echo $loginza2_confirm_block;
}

/* end update: a1 */ 


$loginza_code = $this->config->get('loginza_account_code');
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
	
	
	if( !empty($loginza_label[ $this->config->get('config_language_id') ]) )
		$loginza_code = str_replace("#loginza_label#", 
								'<div class="account_loginza_'.$this->config->get('loginza2_format').'_header">'.$loginza_label[ $this->config->get('config_language_id') ]."</div>", 
								$loginza_code );
	else
		$loginza_code = str_replace("#loginza_label#", "", $loginza_code );
		
	$loginza_code = str_replace("#domain#", 
								urlencode( preg_replace("/\/$/", "", 'http://'.$_SERVER['HTTP_HOST']) ), 
								$loginza_code 
								);
								
echo $loginza_code; } ?>
<?php /* end loginza */ ?>
    </div>
  </div>
<script type="text/javascript"><!--
$('#login input').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#login').submit();
	}
});
//--></script> 
<?php include('catalog/view/theme/'.$this->config->get('config_template').'/template/new_elements/wrapper_bottom.tpl'); ?>
<?php echo $footer; ?>