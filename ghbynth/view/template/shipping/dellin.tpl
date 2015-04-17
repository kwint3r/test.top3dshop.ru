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
	<?php if ($success) { ?>
	<div class="success"><?php echo $success; ?></div>
	<?php } ?>
	<div class="box">
		<div class="heading">
			<h1><img src="view/image/shipping-delline.png" alt="" /> <?php echo $heading_title; ?></h1>
			<div class="buttons">
				<a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a>
				<a onclick="$('#form input[name=apply]').val(1); $('#form').submit();" class="button"><?php echo $button_apply; ?></a>
				<a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $button_cancel; ?></a>
			</div>
		</div>
		<div class="content">
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
				<div class="vtabs">
					<a href="#tab-general"><?php echo $tab_general; ?></a>
					<a href="#tab-data"><?php echo $tab_data; ?></a>
					<a href="#tab-additional"><?php echo $tab_additional; ?></a>
				</div>
				<div id="tab-general" class="vtabs-content">
					<table class="form">
						<tbody>
							<tr>
								<td><?php echo $entry_title; ?></td>
								<td>
									<?php foreach ($languages as $language) { ?>
									<input type="text" name="dellin_title[<?php echo $language['language_id']; ?>]" value="<?php echo isset($dellin_title[$language['language_id']]) ? $dellin_title[$language['language_id']] : ''; ?>" />
									<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
									<?php } ?>
								</td>
							</tr>
							<tr>
								<td><?php echo $entry_description; ?></td>
								<td>
									<?php foreach ($languages as $language) { ?>
									<input type="text" name="dellin_description[<?php echo $language['language_id']; ?>]" value="<?php echo isset($dellin_description[$language['language_id']]) ? $dellin_description[$language['language_id']] : ''; ?>" />
									<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
									<?php } ?>
								</td>
							</tr>
							<tr>
								<td><label for="dellin-tax-class-id"><?php echo $entry_tax_class; ?></label></td>
								<td><select id="dellin-tax-class-id" name="dellin_tax_class_id">
								<option value="0"><?php echo $text_none; ?></option>
								<?php foreach ($tax_classes as $tax_class) { ?>
								<?php if ($tax_class['tax_class_id'] == $dellin_tax_class_id) { ?>
								<option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
								<?php } else { ?>
								<option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
								<?php } ?>
								<?php } ?>
								</select></td>
							</tr>
							<tr>
								<td><label for="dellin-geo-zone-id"><?php echo $entry_geo_zone; ?></label></td>
								<td><select id="dellin-geo-zone-id" name="dellin_geo_zone_id">
								<option value="0"><?php echo $text_all_zones; ?></option>
								<?php foreach ($geo_zones as $geo_zone) { ?>
								<?php if ($geo_zone['geo_zone_id'] == $dellin_geo_zone_id) { ?>
								<option value="<?php echo $geo_zone['geo_zone_id']; ?>" selected="selected"><?php echo $geo_zone['name']; ?></option>
								<?php } else { ?>
								<option value="<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></option>
								<?php } ?>
								<?php } ?>
								</select></td>
							</tr>
							<tr>
								<td><label for="dellin-customer-group-id"><?php echo $entry_customer_group; ?></label></td>
								<td class="left">
									<select id="dellin-customer-group-id" name="dellin_customer_group_id">
										<option value="0"><?php echo $text_none; ?></option>
										<?php foreach ($customer_groups as $customer_group) { ?>
										<option <?php if ($customer_group['customer_group_id'] == $dellin_customer_group_id) echo 'selected="selected"'; ?> value="<?php echo $customer_group['customer_group_id']; ?>" ><?php echo $customer_group['name']; ?></option>
										<?php } ?>
									</select>
								</td>
							</tr>
							<tr>
								<td><label for="dellin-log"><?php echo $entry_log; ?></label></td>
								<td><input id="dellin-log" type="checkbox" name="dellin_log" <?php if ($dellin_log) echo 'checked="checked"'; ?> /></td>
							</tr>
							<tr>
								<td><?php echo $entry_store; ?></td>
								<td>
									<div class="scrollbox">
										<?php $class = 'even'; ?>
										<?php foreach ($stores as $store) { ?>
										<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
										<div class="<?php echo $class; ?>">
										<input type="checkbox" name="dellin_store[]" value="<?php echo $store['store_id']; ?>" <?php  if (isset($dellin_store) && in_array($store['store_id'], $dellin_store)) echo 'checked="checked"'; ?> />
										<?php echo $store['name']; ?>
										
										</div>
										<?php } ?>
									</div>
								</td>
							</tr>
							<tr>
								<td><label for="dellin-status"><?php echo $entry_status; ?></label></td>
								<td><select id="dellin-status" name="dellin_status">
								<?php if ($dellin_status) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
								</select></td>
							</tr>
							<tr>
								<td><label for="dellin-sort-order"><?php echo $entry_sort_order; ?></label></td>
								<td>
									<input id="dellin-sort-order" type="text" name="dellin_sort_order" value="<?php echo $dellin_sort_order; ?>" size="1" />									<?php if (isset($error_dellin_sort_order)) { ?>
									<span class="error"><?php echo $error_dellin_sort_order; ?></span>
									<?php } ?>
									</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="tab-data" class="vtabs-content">
					<table class="form">
						<tbody>
							<tr>
								<td><label for="dellin-volume"><?php echo $entry_volume; ?></label></td>
								<td>
									<input id="dellin-volume" type="text" name="dellin_volume" value="<?php echo $dellin_volume; ?>" />
									<?php if (isset($error_dellin_volume)) { ?>
									<span class="error"><?php echo $error_dellin_volume; ?></span>
									<?php } ?>
								</td>
							</tr>
							<tr>
								<td><label for="dellin-derival-door"><?php echo $entry_derival_door; ?></label></td>
								<td><input id="dellin-derival-door" type="checkbox" name="dellin_derival_door" <?php if ($dellin_derival_door) echo 'checked="checked"'; ?> /></td>
							</tr>
							<tr>
								<td><label for="dellin-arrival-door"><?php echo $entry_arrival_door; ?></label></td>
								<td><input id="dellin-arrival-door" type="checkbox" name="dellin_arrival_door" <?php if ($dellin_arrival_door) echo 'checked="checked"'; ?> /></td>
							</tr>
							<tr class="parent">
								<td><label for="dellin-package"><?php echo $entry_package; ?></label></td>
								<td><input id="dellin-package" class="slider" type="checkbox" name="dellin_package" <?php if ($dellin_package) echo 'checked="checked"'; ?> /></td>
							</tr>
							<tr>
								<td colspan="2" class="include">
									<div class="slider-content<?php if (!$dellin_package) echo " hidden"; ?>" >
										<table class="form">
											<tbody>
												<tr>
													<td><label for="dellin-package-type"><?php echo $entry_package_type; ?></label></td>
													<td><select id="dellin-package-type" name="dellin_package_type" class="load" rel="<?php echo $dellin_package_type; ?>"><option value="0"><?php echo $text_none; ?></option></select></td>
												</tr>
											</tbody>
										</table>
									</div>
								</td>
							</tr>
							<tr class="parent">
								<td><label for="dellin-insurance"><?php echo $entry_insurance; ?></label></td>
								<td><input id="dellin-insurance" class="slider" type="checkbox" name="dellin_insurance" <?php if ($dellin_insurance) echo 'checked="checked"'; ?> /></td>
							</tr>
							<tr>
								<td colspan="2" class="include">
									<div class="slider-content<?php if (!$dellin_insurance) echo " hidden"; ?>" >
									<table class="form">
										<tbody>
											<tr>
												<td><?php echo $entry_insurance_type; ?></td>
												<td>
													<label><input class="slider-radio" <?php if (!$dellin_insurance_type) echo 'checked="checked"'; ?> type="radio" name="dellin_insurance_type" value="0"/><?php echo $text_order_cost; ?> </label>
													<label><input class="slider-radio" <?php if ($dellin_insurance_type) echo 'checked="checked"'; ?> type="radio" name="dellin_insurance_type" value="1"/><?php echo $text_self_cost; ?> </label>
													<span class="slider-content insurance<?php if (!$dellin_insurance_type) echo " hidden"; ?>" >
													<input placeholder="<?php echo $text_insurance_cost; ?>" type="text" name="dellin_insurance_price" value="<?php echo $dellin_insurance_price; ?>" />
													</span>
													<?php if (isset($error_dellin_insurance_price)) { ?>
													<span class="error"><?php echo $error_dellin_insurance_price; ?></span>
													<?php } ?>
												</td>
											</tr>
										</tbody>
									</table>
									</div>
								</td>
							</tr>
							<tr>
								<td><label><span class="required">*</span> <?php echo $entry_city_from; ?></label></td>
								<td>
									<select name="dellin_city_from" class="load" rel="<?php echo $dellin_city_from; ?>"><option value="0"><?php echo $text_none; ?></option></select>
									<?php if (isset($error_dellin_city_from)) { ?>
									<span class="error"><?php echo $error_dellin_city_from; ?></span>
									<?php } ?>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div id="tab-additional" class="vtabs-content">
					<table class="form">
						<tbody>
							<tr>
								<td><label for="dellin-markup"><?php echo $entry_markup; ?></label></td>
								<td>
									<input id="dellin-markup" type="text" name="dellin_markup" value="<?php echo $dellin_markup; ?>" />
									<?php if (isset($error_dellin_markup)) { ?>
									<span class="error"><?php echo $error_dellin_markup; ?></span>
									<?php } ?>
								</td>
							</tr>
							<tr>
								<td><label for="dellin-additional-weight"><?php echo $entry_additional_weight; ?></label></td>
								<td>
									<input id="dellin-additional-weight" type="text" name="dellin_additional_weight" value="<?php echo $dellin_additional_weight; ?>" />
									<?php if (isset($error_dellin_markup_product)) { ?>
									<span class="error"><?php echo $error_dellin_markup_product; ?></span>
									<?php } ?>
								</td>
							</tr>
							<tr>
								<td><label for="dellin-description-additionally"><?php echo $entry_description_additionally; ?></label></td>
								<td><input id="dellin-description-additionally" type="checkbox" name="dellin_description_additionally" <?php if ($dellin_description_additionally) echo 'checked="checked"'; ?> /></td>
							</tr>
							<tr>
								<td><label for="dellin-min-weight"><?php echo $entry_min_weight; ?></label></td>
								<td>
									<input id="dellin-min-weight" type="text" name="dellin_min_weight" value="<?php echo $dellin_min_weight; ?>" />
									<?php if (isset($error_dellin_min_weight)) { ?>
									<span class="error"><?php echo $error_dellin_min_weight; ?></span>
									<?php } ?>
								</td>
							</tr>
							<tr>
								<td><label for="dellin-max-weight"><?php echo $entry_max_weight; ?></label></td>
								<td>
									<input id="dellin-max-weight" type="text" name="dellin_max_weight" value="<?php echo $dellin_max_weight; ?>" />
									<?php if (isset($error_dellin_max_weight)) { ?>
									<span class="error"><?php echo $error_dellin_max_weight; ?></span>
									<?php } ?>
								</td>
							</tr>
							<tr>
								<td><label for="dellin-min-total"><?php echo $entry_min_total; ?></label></td>
								<td>
									<input id="dellin-min-total" type="text" name="dellin_min_total" value="<?php echo $dellin_min_total; ?>" />
									<?php if (isset($error_dellin_min_total)) { ?>
									<span class="error"><?php echo $error_dellin_min_total; ?></span>
									<?php } ?>
								</td>
							</tr>
							<tr>
								<td><label for="dellin-max-total"><?php echo $entry_max_total; ?></label></td>
								<td>
									<input id="dellin-max-total" type="text" name="dellin_max_total" value="<?php echo $dellin_max_total; ?>" />
									<?php if (isset($error_dellin_max_total)) { ?>
									<span class="error"><?php echo $error_dellin_max_total; ?></span>
									<?php } ?>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<input type="hidden" name="apply" value="0" />
			</form>
		</div>
	</div>
</div>
<script type="text/javascript"><!--

$('.slider').change(function(event){
	$(this).closest('tr').next('tr').find('.slider-content:first').slideToggle('fast');
});

$('.slider-radio').change(function(event){
	$(this).closest('tr').find('.slider-content:first').slideToggle('fast');
});

$('select.load').each(function(){
	
	var active = $(this).attr('rel');
	var self = this;
	
	$.ajax({
		url: "index.php?route=shipping/dellin/load&type=" + $(this).attr('name') + "&token=<?php echo $token;?>",
		dataType: "json",
		beforeSend: function() {
			$(self).attr('disabled', 'disabled').after('<img src="/admin/view/image/loading.gif" alt="" title="<?php echo $text_loading; ?>" class="throbber" />');
		},
		success: function(json) {
			
			$(self).removeAttr('disabled').next('.throbber').remove();
			
			if (json) {
				var html = '';
				
				for (var prop in json) {
					html += '<option value="' + json[prop]['id'] + '">' + json[prop]['name'] + '</option>';
				}
				
				$(self).html(html);
				
				$("option[value='" + active + "']", self).attr('selected', 'selected');
			} else {
				alert('Не удалось загрузить данные! Попробуйте обновить страницу.');
			}
		}
	});

	
});

$('.vtabs a').tabs(); 
//--></script> 
<?php echo $footer; ?> 