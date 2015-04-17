<?php 

/*
 * OpenCart queries
 */

// Configuration
require_once('./config.php');
require_once('./system/library/db.php');
require_once('./system/database/mysql.php');

	$db = new DB('mysql', DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);

	$cat_to_select = array(67);
	$products = array();

	// Select all product by category
	foreach ($cat_to_select as $cat) {
    	$sql = "SELECT * FROM mac_product p  INNER JOIN mac_product_to_category p2c1 ON (p.product_id = p2c1.product_id AND p2c1.category_id = ".$cat.")";
    	$prod_query = $db->query($sql);
    	$prod = $prod_query->rows;
    	$products += $prod;
	}

	// Update model
	// WARNING! Use only one time
	foreach ($products as $product) {
		$product_model = "3D сканер ".$product['model'];
        $sql = "UPDATE mac_product SET model = '" . $product_model. "' WHERE product_id = '" . (int)$product['product_id'] . "'";
		if ($db->query($sql)){
            echo "updated successfully with ". $product_model;
        }
        else{
            echo "updated error with ". $product_model;
        }
	}

	// Update name
	// WARNING! Use only one time
	foreach ($products as $product) {

		// Select names
    	$sql = "SELECT * FROM mac_product_description WHERE product_id = ".(int)$product['product_id']."";
    	$prod_query = $db->query($sql);
    	$prod_desc = $prod_query->rows;

		$product_name = "3D сканер ".$prod_desc[0]['name'];

        $sql = "UPDATE mac_product_description SET name = '" . $product_name. "' WHERE product_id = '" . (int)$prod_desc[0]['product_id'] . "'";
		if ($db->query($sql)){
            echo "updated successfully with ". $product_model;
        }
        else{
            echo "updated error with ". $product_model;
        }
		echo "<br/>";
	}

        
    exit;


//phpinfo();
?>
