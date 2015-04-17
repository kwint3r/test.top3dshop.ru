<?
$server_db='localhost';
$user_db='top';
$password_db='to6FrZ2M';
$db=mysql_connect($server_db, $user_db, $password_db) or die ('Could not connect: ' . mysql_error());
mysql_query('SET NAMES utf8');
mysql_select_db('u5822246_magazin',$db) or die ('Cant use u5822246_magazin : ' . mysql_error());
$query=('SELECT mac_product_to_category.category_id, mac_product.product_id, mac_product.model, mac_product.date_added, mac_product.price FROM mac_product INNER JOIN 
mac_product_to_category ON mac_product.product_id=mac_product_to_category.product_id WHERE mac_product_to_category.main_category="1" ORDER BY  mac_product.model 
');
  $result=mysql_query($query) or die ('Invalid query: ' . mysql_error());
while ( $row=mysql_fetch_row($result) ) {
	$category_id = $row[0];
	$product_id = $row[1];
	$product_model = $row[2];
	$date_added = $row[3];
	$price = $row[4];
$qhrefcat=('SELECT keyword FROM mac_url_alias WHERE  query LIKE "category_id='.$category_id.'"  ');	
$result_qhrefcat=mysql_query($qhrefcat) or die ('Invalid query: ' . mysql_error());
$row_qhrefcat=mysql_fetch_row($result_qhrefcat);
$category=$row_qhrefcat[0];

$qhrefprod=('SELECT keyword FROM mac_url_alias WHERE  query LIKE "product_id='.$product_id.'"  ');	
$result_qhrefprod=mysql_query($qhrefprod) or die ('Invalid query: ' . mysql_error());
$row_qhrefprod=mysql_fetch_row($result_qhrefprod);
$product=$row_qhrefprod[0];
$href= "http://top3dshop.ru/" .$category ."/" .$product . ".html"; 
if ($category =="kupit-3d-printer") {$category = "3D принтеры";}
elseif ($category =="kupit-3d-gadjet") {$category = "3D гаджеты";}
elseif ($category =="materiali") {$category = "Материалы";}
elseif ($category =="prof-oborudovanie") {$category = "Проф. оборудование";}
elseif ($category =="vlm") {$category = "VLM";}
elseif ($category =="kupit-3d-skaner") {$category = "3D сканеры";}
elseif ($category =="soft") {$category = "Программы";}
echo $product_model . " | " . $price . " <br/>";
}
?>