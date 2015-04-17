<?php 
class ControllerFeedGoogleBase extends Controller {
	public function index() {
		if ($this->config->get('google_base_status')) { 
			$output  = '<?xml version="1.0" encoding="UTF-8" ?>';
			$output .= '<rss version="2.0" xmlns:g="http://base.google.com/ns/1.0">' . "\n";
			$output .= '<channel>' . "\n";
			$output .= "\t".'<title>' . $this->config->get('config_name') . '</title>' . "\n"; 
			$output .= "\t".'<description>' . $this->config->get('config_meta_description') . '</description>' . "\n";
			$output .= "\t".'<link>' . HTTP_SERVER . '</link>' . "\n";

			$this->load->model('catalog/category');

			$this->load->model('catalog/product');

			$this->load->model('tool/image');

			$products = $this->model_catalog_product->getProducts(array('price'=>0,'description'=>300));

			foreach ($products as $product) {
				if ($product['description']) {
					$output .= "\t\t" . '<item>' . "\n";
					$output .= "\t\t\t" . '<title>' . $product['name'] . '</title>' . "\n";
					$output .= "\t\t\t" . '<link>' . $this->url->link('product/product', 'product_id=' . $product['product_id']) . '</link>' . "\n";
					
					$description = explode('.', $product['description']);
					$description = $description[0] . '.' .$description[1] . '.' .$description[2] . '.' .$description[3] . '.' .$description[4] . '.' . $description[5];
                    $description = htmlentities( str_replace("&nbsp;", "", strip_tags(html_entity_decode($description))));
					$output .= "\t\t\t" . '<description>' . $description . '</description>' . "\n";
					$output .= "\t\t\t" . '<g:brand>' . html_entity_decode($product['manufacturer'], ENT_QUOTES, 'UTF-8') . '</g:brand>' . "\n";
					$output .= "\t\t\t" . '<g:condition>new</g:condition>' . "\n";
					$output .= "\t\t\t" . '<g:id>' . $product['product_id'] . '</g:id>' . "\n";

					if ($product['image']) {
						$output .= "\t\t\t" . '<g:image_link>' . $this->model_tool_image->resize($product['image'], 500, 500) . '</g:image_link>' . "\n";
					} else {
						$output .= "\t\t\t" . '<g:image_link>' . $this->model_tool_image->resize('no_image.jpg', 500, 500) . '</g:image_link>' . "\n";
					}

					$output .= "\t\t\t" . '<g:mpn>' . $product['model'] . '</g:mpn>' . "\n";

					$currencies = array(
						'USD', 
						'EUR', 
						'GBP'
					);

					if (in_array($this->currency->getCode(), $currencies)) {
						$currency_code = $this->currency->getCode();
						$currency_value = $this->currency->getValue();
					} else {
						$currency_code = 'USD';
						$currency_value = $this->currency->getValue('USD');
					}

					if ((float)$product['special']) {
						$output .= "\t\t\t" . '<g:price>' .  $this->currency->format($this->tax->calculate($product['special'], $product['tax_class_id']), $currency_code, $currency_value, false) . '</g:price>' . "\n";
					} else {
						$output .= "\t\t\t" . '<g:price>' . $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id']), $currency_code, $currency_value, false) . '</g:price>' . "\n";
					}

					$categories = $this->model_catalog_product->getCategories($product['product_id']);

					foreach ($categories as $category) {
						$path = $this->getPath($category['category_id']);

						if ($path) {
							$string = '';

							foreach (explode('_', $path) as $path_id) {
								$category_info = $this->model_catalog_category->getCategory($path_id);

								if ($category_info) {
									if (!$string) {
										$string = $category_info['name'];
									} else {
										$string .= ' &gt; ' . $category_info['name'];
									}
								}
							}

							$output .= "\t\t\t" . '<g:product_type>' . $string . '</g:product_type>' . "\n";
						}
					}					
					$output .= "\t\t\t" . '<g:google_product_category>Электроника &gt; Трехмерные принтеры</g:google_product_category>' . "\n";	

					if($product['stock_status'] == 'Предзаказ')
						$availability = 'preorder';
					else if($product['stock_status'] == 'Нет в наличии')
						$availability = 'out of stock';
					else
						$availability = 'in stock';
					
					$output .= "\t\t\t" . '<g:availability>' . $availability . '</g:availability>' . "\n";
					$output .= "\t\t" . '</item>' . "\n";
				}
			}

			$output .= '</channel>' . "\n"; 
			$output .= '</rss>';	

			$this->response->addHeader('Content-Type: application/xml');
			$this->response->setOutput($output);
		}
	}

	protected function getPath($parent_id, $current_path = '') {
		$category_info = $this->model_catalog_category->getCategory($parent_id);

		if ($category_info) {
			if (!$current_path) {
				$new_path = $category_info['category_id'];
			} else {
				$new_path = $category_info['category_id'] . '_' . $current_path;
			}	

			$path = $this->getPath($category_info['parent_id'], $new_path);

			if ($path) {
				return $path;
			} else {
				return $new_path;
			}
		}
	}		
}
?>