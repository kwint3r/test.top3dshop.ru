<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/1999/REC-html401-19991224/strict.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title><?php echo $store_name; ?> - забытые товары</title>
</head>
<body style="font-family: Arial, Helvetica, sans-serif; font-size: 12px; color: #000000;">
<div style="width: 680px;">
    <?php
    $logo = HTTP_SERVER.'image/data/main/top3dshop_banner_mail2.png';
    ?>
    <a href="<?php echo HTTP_SERVER; ?>" title="<?php echo $store_name; ?>">
        <img src="<?php echo $logo; ?>" alt="<?php echo $store_name; ?>" style="margin-bottom: 20px; border: none;"/>
    </a>

    <p style="font-size: 22px; font-weight: bold">Уважаемый покупатель!</p>

    <p>Мы обнаружили в вашей корзине забытые товары. Если вы еще не
        передумали, и хотите приобрести их именно в магазине <?php echo $store_name; ?>, <a
                href="<?php echo HTTP_SERVER; ?>shopping-cart/" target="_blank">продолжить оформление</a> можно прямо сейчас!</p>

    <p style="font-size: 20px; font-weight: bold">Ваша корзина</p>
    <table style="border-collapse: collapse; width: 100%;  margin-bottom: 20px;">
        <tbody>
        <?php foreach ($products as $product) { ?>
        <tr style="border: 0">
            <td style="border: 0;font-size: 16px; text-align: left; padding: 7px; font-weight: bold;">
                <a href="<?php echo $product['href'] ?>" target="_blank"><?php echo $product['name']; ?></a>
                <?php foreach ($product['option'] as $option) { ?>
                <br/>
                &nbsp;
                <small> - <?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                <?php } ?>
            </td>
            <td style="border: 0; font-size: 12px;	 text-align: right; padding: 7px;">
                <a href="<?php echo $product['href'] ?>" target="_blank"> <img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>"></a>
            </td>
            <td style="border: 0;font-size: 12px;	 text-align: right; padding: 7px;"><b><?php echo $product['quantity']; ?> шт.</b></td>
            <td style="border: 0;font-size: 12px;	 text-align: right; padding: 7px;"><b><?php echo $product['total']; ?> руб.</b></td>
        </tr>
        <?php } ?>





        <tr>
            <td style="font-size: 12px;	 text-align: right; padding: 7px;"
                colspan="2"><b>Итого:</b></td>
            <td style="font-size: 12px;	 text-align: right; padding: 7px;"
                ><b><?php echo $totals_count; ?> шт.</b></td>
            <td style="font-size: 12px;	 text-align: right; padding: 7px;"><b><?php echo $totals; ?> руб.</b></td>
        </tr>

        <tr>
            <td colspan="4" style="text-align: right;padding-top: 15px; border: 0">
                <a  target="_blank" style="font-size: 14px; text-decoration: none;
font-weight: 400;background: #ff8c00;
background: -moz-linear-gradient(top, #ff8c00 0%, #ffcc00 0%, #ff8c00 99%);
background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#ff8c00), color-stop(0%,#ffcc00), color-stop(99%,#ff8c00));
background: -webkit-linear-gradient(top, #ff8c00 0%,#ffcc00 0%,#ff8c00 99%);
background: -o-linear-gradient(top, #ff8c00 0%,#ffcc00 0%,#ff8c00 99%);
background: -ms-linear-gradient(top, #ff8c00 0%,#ffcc00 0%,#ff8c00 99%);
background: linear-gradient(to bottom, #ff8c00 0%,#ffcc00 0%,#ff8c00 99%);border-radius: 3px;display: inline-block;
cursor: pointer;
border: none;
color: #fff !important;text-transform: uppercase;
text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.15);
padding: 7px 18px 4px 18px;border-radius: 2px;
-moz-border-radius: 2px;
-webkit-border-radius: 2px;
transition: box-shadow 0.2s;
-moz-transition: box-shadow 0.2s;
-webkit-transition: box-shadow 0.2s;

margin-bottom: 10px;display: inline-block;
padding: 6px 12px;
margin-bottom: 0;
font-size: 14px;
font-weight: normal;
line-height: 1.428571429;
text-align: center;
white-space: nowrap;
vertical-align: middle;
cursor: pointer;
border: 1px solid transparent;
border-radius: 4px;
" href="<?php echo HTTP_SERVER; ?>shopping-cart/" ><span>Перейти в корзину</span></a>
            </td>
        </tr>

        </tbody>
    </table>
	
	<div style="color: rgb(0, 0, 0); font-family: Helvetica, Arial, sans-serif; font-size: 14px; line-height: 18px;"><strong>&nbsp;</strong></div>

	<div style="color: rgb(0, 0, 0); font-family: Helvetica, Arial, sans-serif; font-size: 14px; line-height: 18px;">
		<a href="http://vk.com/top3dshop" style="color: rgb(30, 90, 142); margin: 0 8px;">
			<img alt="" src="http://top3dshop.ru/image/data/main/social/vk.png" style="padding: 1px; margin: 1px; border: none; outline: rgb(30, 90, 142) solid 1px;" />
		</a>
		<a href="http://instagram.com/top3dshop" style="color: rgb(30, 90, 142); margin: 0 8px;">
			<img alt="" src="http://top3dshop.ru/image/data/main/social/instagram.png" style="padding: 1px; margin: 1px; border: none; outline: rgb(30, 90, 142) solid 1px;" />
		</a>
		<a href="https://www.facebook.com/top3dshop?fref=ts" style="color: rgb(30, 90, 142); margin: 0 8px;">
			<img alt="" src="http://top3dshop.ru/image/data/main/social/facebook.png" style="padding: 1px; margin: 1px; border: none; outline: rgb(30, 90, 142) solid 1px;" />
		</a>
		<a href="http://www.youtube.com/channel/UC9VmL-dihNog3GoapRNd42g" style="color: rgb(30, 90, 142); margin: 0 8px;">
			<img alt="" src="http://top3dshop.ru/image/data/main/social/youtube.png" style="padding: 1px; margin: 1px; border: none; outline: rgb(30, 90, 142) solid 1px;" />
		</a>
	</div>

	
</div>
</body>
</html>
