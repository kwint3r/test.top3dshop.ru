<? echo '<?xml version="1.0" encoding="utf-8"?>' . "\n";
echo '<rss xmlns:g="http://base.google.com/ns/1.0" version="2.0">' . "\n";
echo '<channel>' . "\n";
echo	"\t".'<title>Магазин 3D техники № 1 в России. 3D принтеры и 3D сканеры с доставкой по РФ и СНГ!</title>' . "\n";
echo	"\t".'<link>http://top3dshop.ru/</link>' . "\n";
echo	"\t".'<description>Крупнейший интернет магазин 3D техники в России. 3D принтеры, 3D сканеры, расходные материалы с доставкой в любой регион. Консультации. Гарантии. Сервис. Платежи онлайн. Звоните! Тел.: 8 (800) 555-11-59</description>' . "\n";	

$server_db='localhost';
$user_db='top';
$password_db='to6FrZ2M';
$db_name = 'u5822246_magazin';
$db=mysqli_connect($server_db, $user_db, $password_db, $db_name) or die ('Could not connect: ' . mysqli_error($db));
mysqli_query($db,'SET NAMES utf8');
$query=('SELECT mac_product_to_category.category_id, mac_product.product_id, mac_product.model, mac_product.image, mac_product.manufacturer_id, mac_product.price, mac_product.stock_status_id FROM mac_product INNER JOIN 
mac_product_to_category ON mac_product.product_id=mac_product_to_category.product_id WHERE mac_product_to_category.main_category="1" and mac_product.price > 0');
$result=mysqli_query($db,$query) or die ('Invalid query: ' . mysqli_error($db));
//echo mysqli_num_rows($result);
while ( $row=mysqli_fetch_array($result) ) {
	$category_id = $row[0];
	$product_id = $row[1];
	$product_model = $row[2];
	$image = "http://top3dshop.ru/image/" .$row[3];
	$manufacturer_id = $row[4];
	$price = number_format($row[5], 2,'.', '') . ' RUB';
	$stock_status_id = $row[6];
		$query_man_id = "SELECT name from mac_manufacturer where manufacturer_id=$manufacturer_id";
		$result_man_id = mysqli_query($db,$query_man_id) or die ('Invalid query: ' . mysqli_error($db));
		$row_man_id = mysqli_fetch_array($result_man_id);
	$manufacture = $row_man_id['name'];
		
		$qhrefcat=('SELECT keyword FROM mac_url_alias WHERE  query LIKE "category_id='.$category_id.'"  ');	
		$result_qhrefcat=mysqli_query($db,$qhrefcat) or die ('Invalid query: ' . mysqli_error($db));
		$row_qhrefcat=mysqli_fetch_row($result_qhrefcat);
	$category=$row_qhrefcat[0];
		
		$qhrefprod=('SELECT keyword FROM mac_url_alias WHERE  query LIKE "product_id='.$product_id.'"  ');	
		$result_qhrefprod=mysqli_query($db,$qhrefprod) or die ('Invalid query: ' . mysqli_error($db));
		$row_qhrefprod=mysqli_fetch_row($result_qhrefprod);
	$product=$row_qhrefprod[0];
		
	$link= "http://top3dshop.ru/" .$category ."/" .$product . ".html"; 
	
		$query_title="SELECT name from mac_product_description where product_id=$product_id";
		$result_title=mysqli_query($db,$query_title) or die ('Invalid query: ' . mysqli_error($db));
		$row_title = mysqli_fetch_array($result_title);
	$title = $row_title[0];
	$condition = 'new';
	
		$query_desc = "SELECT description from mac_product_description where product_id=$product_id";
		$result_desc = mysqli_query($db,$query_desc);
		$row_desc = mysqli_fetch_array($result_desc);
		$patterns = array();
		$patterns[0] = '(&lt;*.*?&gt;)';
		$patterns[1] = '(&amp;)';
		$patterns[2] = '(quot;)';
		$patterns[3] = '(\\s+)';
		$patterns[4] = '(nbsp;)';
		$patterns[5] = '(ndash;)';
		$patterns[6] = '(laquo;)';
		$patterns[7] = '(raquo;)';
		$patterns[8] = '(reg;)';
		$patterns[9] = '(mdash;)';
		$patterns[10] = '(ldquo;)';
		$patterns[11] = '(rdquo;)';
		$patterns[12] = '(deg;)';
		$patterns[13] = '(Oslash;)';
		$patterns[14] = '(trade;)';
		$patterns[15] = '(#39;)';
		$replacements = array();
		$replacements[15] ='\'';
		$replacements[14] = '™';
		$replacements[13] = 'Ø';
		$replacements[12] = '°';
		$replacements[11] = '”';
		$replacements[10] = '“';
		$replacements[9] = '—';
		$replacements[8] = '®';
		$replacements[7] = '»';
		$replacements[6] = '«';
		$replacements[5] = '-';
		$replacements[4] = ' ';
		$replacements[3] = ' ';
		$replacements[2] = '"';
		$replacements[1] = '';
		$replacements[0] = '';
		ksort($patterns);
		ksort($replacements);
		$qq1 = preg_replace($patterns, $replacements, $row_desc[0]);
		$ff = preg_match('((*UTF8).{1,300}.*?\.)',$qq1,$desc_final);
		//$rc = mb_substr($qq1,0,299,'utf-8');
		//$rc1 = mb_substr($qq1,299,500,'utf-8');
		//preg_match('(^.*?\.)',$rc1,$output);
		$description = $desc_final[0];
	
	switch ($stock_status_id) {
    case 6:
	case 8:
        $stock='preorder';
        break;
    case 5:
        $stock='out of stock';
        break;
    case 7:
        $stock='in stock';
        break;
	}
	switch ($category) {
	case 'kupit-3d-printer':
        $category='3D принтеры';
        break;
	case 'kupit-3d-gadjet':
        $category='3D гаджеты';
        break;
	case 'materiali':
        $category='Материалы';
        break;
	case 'prof-oborudovanie':
        $category='Проф. оборудование';
        break;
	case 'vlm':
        $category='VLM';
        break;
	case 'kupit-3d-skaner':
        $category='3D сканеры';
        break;
	case 'soft':
        $category='Программы';
        break;
	}
	
	echo "\t\t<item>\n";
	echo "\t\t\t<title>$title</title>\n";
	echo "\t\t\t<link>$link</link>\n";
	echo "\t\t\t<description>$description</description>\n";
	echo "\t\t\t<g:id>$product_id</g:id>\n";
	echo "\t\t\t<g:condition>$condition</g:condition>\n";
	echo "\t\t\t<g:price>$price</g:price>\n";
	echo "\t\t\t<g:availability>$stock</g:availability>\n";
	echo "\t\t\t<g:image_link>$image</g:image_link>\n";
	echo "\t\t\t<g:product_type>$category</g:product_type>\n";
	echo "\t\t\t<g:google_product_category>Трехмерные принтеры</g:google_product_category>\n";
	echo "\t\t\t<g:brand>$manufacture</g:brand>\n";
	//echo "\t\t\t<g:mpn>$manufacturer_id</g:mpn>\n";
	echo "\t\t</item>\n";
	

}
mysqli_close($db);
echo '</channel>' . "\n" . 
'</rss>';
?>