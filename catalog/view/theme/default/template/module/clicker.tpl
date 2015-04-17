<script type="text/javascript"><!--



function formatMoney(n) {
	var c = '<?php echo $currency_data['decimal_place']; ?>';
	var d = '<?php echo $currency_data['decimal_point']; ?>';
	var t = '<?php echo $currency_data['thousand_point']; ?>';
	var l = '<?php echo $currency_data['symbol_left']; ?>';
	var r = '<?php echo $currency_data['symbol_right']; ?>';

	c = isNaN(c = Math.abs(c)) ? 2 : c, d = d == undefined ? "," : d, t = t == undefined ? "." : t, s = n < 0 ? "-" : "", i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "", j = (j = i.length) > 3 ? j % 3 : 0;
	return l + s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "") + r;
}

function upd_state() {
	var qty = parseInt($('#product_qty').val());
	$('#oldprice').html(formatMoney(realprice * qty));
}

function pluscon() {
	var qty = parseInt($('#product_qty').val());
	$('#product_qty').val(++qty);
	upd_state();
}
function minuscon() {
	var qty = parseInt($('#product_qty').val());
	if (qty > 1) {
		$('#product_qty').val(--qty);
		upd_state();
	}

}
//--></script>