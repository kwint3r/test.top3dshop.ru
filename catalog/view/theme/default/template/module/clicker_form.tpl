<div id="ajaxorder">
  <div id="ajaxordermainbody">
  <div id="ocjoyajaxcheckout"><?php echo $heading_title?></div>
      <form method="post" id="form_instockrequest"
			enctype="multipart/form-data" style="clear:both;width:100%;float:left;">
    <table id="aboutproduct">
      <thead>
        <tr>
          <td style="width:25%;"><span class="aboutproductspan"><?php echo $text_product?></span></td>
          <td style="width:17%;"><span class="aboutproductspan"><?php echo $text_price?></span></td>
          <td style="width:17%;text-align:center;"><?php echo $text_qty?></td>
          <td style="width:21%;text-align:center;">Опции</td>
        </tr>
      </thead>
      <tbody>
        <input type="hidden" value="1" name="products_count">
        <input type="hidden" value="<?php echo $product['real_price']?>" id="real_price_1">
        <input type="hidden" value="<?php echo $product['name']?>" name="product_name_1">
        <input type="hidden" value="<?php echo $options?>" name="product_option_1">
        <tr>
          <td><span class="aboutproductspan"><?php echo $product['name']?></span></td>
			<td>
				<span class="aboutproductspan">
					<span id="oldprice"><?php echo $price?></span>
				</span>
			</td>
			<td style="text-align:center;">
            <table style="width:100%;text-align:center;">
              <tbody><tr>
                <td style="border:0px;">
                    <a id="minuss" onclick="minuscon();">-</a>
                    <input id="product_qty" type="text" style="text-align:center;" value="1" onkeyup="upd_state();" maxlength="3" size="3" onchange="upd_state();" name="quantity_1">
                    <a id="pluss" onclick="pluscon();">+</a>
                </td>
              </tr>
            </tbody></table>
          </td>
      <td>
        <span class="aboutproductspan">
          <span id="options"><?php echo $options;?></span>
        </span>
      </td>
        </tr>
      </tbody>
    </table>
    <br>
                      <div class="sections_block_rquaired">
          <i class="icon-append_1 icon-user"></i>
          <input type="text" placeholder="<?php echo $text_name?>" class="ajaxorderinputsnorequired" name="firstname">
          <div class="ocjoyajaxcheckout_errorfields" id="error_firstname">&nbsp;</div>
        </div>
                                    <div class="sections_block_rquaired">
          <i class="icon-append_1 icon-envelope-alt"></i>
          <input type="text" placeholder="<?php echo $text_email?>" class="ajaxorderinputsnorequired" name="email">
          <div class="ocjoyajaxcheckout_errorfields" id="error_email">&nbsp;</div>
        </div>
                                    <div class="sections_block_rquaired">
          <i class="icon-append_1 icon-phone"></i>
          <input type="text" placeholder="<?php echo $text_phone?>" id="fortelephonemask" class="ajaxorderinputsnorequired" name="telephone">
          <div class="ocjoyajaxcheckout_errorfields" id="error_telephone">&nbsp;</div>
        </div>
                                    <div class="sections_block_rquaired">
          <i class="icon-append_1 icon-appointment"></i>
          <input type="text" placeholder="<?php echo $text_appointment?>" id="forteleappointment" class="ajaxorderinputsnorequired" name="appointment">
          <div class="ocjoyajaxcheckout_errorfields" id="error_appointment">&nbsp;</div>
        </div>
                              <textarea placeholder="<?php echo $text_comment?>" class="ajaxorderinputs" name="description"></textarea>

		  <div id="upload_div">
			  Загрузить реквизиты организации
		  </div>
		  <span id="file_description"></span>
		  <input type="file" name="file" style="display: none;" id="upload_file">
		  <input id="filename" type="hidden" name="filename">
		  <input type="hidden" value="<?php echo $heading_title?>" name="title">
</form>

    <input type="button" value="<?php echo $text_send?>" id="gotoorderajax" onclick="post_instockrequest();">
  </div>
</div>
<script type="text/javascript">
	var realprice = <?php echo $real_price; ?>;
  if (!realprice) realprice = 0;
</script>