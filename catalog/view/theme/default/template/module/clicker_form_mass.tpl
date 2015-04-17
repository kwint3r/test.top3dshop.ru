<div id="ajaxorder">
  <div id="ajaxordermainbody">
  <div id="ocjoyajaxcheckout"><?php echo $heading_title?></div>
      <form method="post" id="form_instockrequest"
			enctype="multipart/form-data" style="clear:both;width:100%;float:left;">
      <?php //var_dump($products)?>
    <table id="aboutproduct">
      <thead>
        <tr>
          <td style="width:40%;"><span class="aboutproductspan"><?php echo $text_product?></span></td>
          <td style="width:20%;"><span class="aboutproductspan"><?php echo $text_price?></span></td>
          <td style="width:20%;text-align:center;"><?php echo $text_qty?></td>
        </tr>
      </thead>
      <tbody>
      <?php $i=1; foreach ($products as $product) { ?>
        <tr class="popover_prod">
          <input type="hidden" value="<?php echo $i?>" name="products_count">
          <input type="hidden" value="<?php echo $product['real_price']?>" id="real_price_<?php echo $i?>">
          <input type="hidden" value="<?php echo $product['product']['name']?>" name="product_name_<?php echo $i?>">
          <td><span class="aboutproductspan"><?php echo $product['product']['name']?></span></td>
    			<td>
    				<span class="aboutproductspan">
    					<span id="oldprice_<?php echo $i?>"><?php echo $product['price']?></span>
    				</span>
    			</td>
    			<td style="text-align:center;">
            <table style="width:100%;text-align:center;">
              <tbody><tr>
                <td style="border:0px;">
                    <a id="minuss" onclick="minuscon2('<?php echo $i?>');" style="cursor: pointer;">-</a>
                    <input id="product_qty_<?php echo $i?>" type="text" style="text-align:center;" value="1" onkeyup="upd_state2('<?php echo $i?>');" maxlength="3" size="3" onchange="upd_state2('<?php echo $i?>');" name="quantity_<?php echo $i?>">
                    <a id="pluss" onclick="pluscon2('<?php echo $i?>');" style="cursor: pointer;">+</a>
                </td>
              </tr>
            </tbody></table>
          </td>
        </tr>
        <?php $i++;} ?>
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
