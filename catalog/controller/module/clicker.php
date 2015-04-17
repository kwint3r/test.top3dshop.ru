<?php
class ControllerModuleClicker extends Controller {
	protected function index() {

		$this->document->addScript('catalog/view/javascript/clicker.js');
		$this->document->addScript('catalog/view/javascript/jquery/colorbox/jquery.colorbox-min.js');
		$this->document->addScript('catalog/view/javascript/jquery/jquery.ajaxfileupload.js');
		$this->document->addStyle('catalog/view/theme/default/stylesheet/clicker.css');
		$this->document->addStyle('catalog/view/javascript/jquery/colorbox/colorbox.css');

		$this->data['currency_data'] = array(
			'symbol_left' => $this->currency->getSymbolLeft(),
			'symbol_right' => $this->currency->getSymbolRight(),
			'decimal_place' => $this->currency->getDecimalPlace(),
			'thousand_point' => $this->language->get('thousand_point'),
			'decimal_point' => $this->language->get('decimal_point')
		);


		if(file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/clicker.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/clicker.tpl';
		} else {
			$this->template = 'default/template/module/clicker.tpl';
		}

		$this->render();
	}

	public function instockrequest() {
		if($this->request->server['REQUEST_METHOD'] == 'POST' && isset($this->request->post['product_id'])) {
			$this->data += $this->language->load('module/clicker');

			$product_id = $this->request->post['product_id'];

			$this->load->model('catalog/product');
			$product = $this->model_catalog_product->getProduct($product_id);

			if($product) {
				$this->data['product'] = $product;
				$this->data['real_price'] = $this->currency->getValue() * $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'));
			}

			if(($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$this->data['price'] = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$this->data['price'] = false;
			}

			if(file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/clicker_form.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/module/clicker_form.tpl';
			} else {
				$this->template = 'default/template/module/clicker_form.tpl';
			}
			$this->response->setOutput($this->render());
		}
	}

	public function instockrequestmass() {
		if($this->request->server['REQUEST_METHOD'] == 'POST' && isset($this->request->post['data'])) {
			$this->data += $this->language->load('module/clicker');

			$products = json_decode($this->request->post['data']);
			$this->load->model('catalog/product');
			$i = 0;
			$product_arr = array();
			foreach ($products as $prod) {
				$product = $this->model_catalog_product->getProduct($prod);
				if($product) {
					$product_arr[$i] = array('product'=>$product, 'real_price' => $this->currency->getValue() * $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')));
				}

				if(($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$product_arr[$i] += array('price'=>$this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'))));
				} else {
					$product_arr[$i] += array('price'=> false);
				}
				$i++;
			}
			$this->data['products'] = $product_arr;

			if(file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/clicker_form_mass.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/module/clicker_form_mass.tpl';
			} else {
				$this->template = 'default/template/module/clicker_form_mass.tpl';
			}
			$this->response->setOutput($this->render());
		}
	}

	public function email() {
		$json = array();
//		$json['errors1'] = $this->request->post;
		if($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validate()) {
			$mail = new Mail();
			//var_dump($mail);
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->hostname = $this->config->get('config_smtp_host');
			$mail->username = $this->config->get('config_smtp_username');
			$mail->password = $this->config->get('config_smtp_password');
			$mail->port = $this->config->get('config_smtp_port');
			$mail->timeout = $this->config->get('config_smtp_timeout');
			$mail->setTo($this->config->get('config_email'));
			$mail->setFrom($this->request->post['email']);
			$mail->setSender($this->request->post['firstname']);
			$mail->setSubject(html_entity_decode($this->request->post['title'], ENT_QUOTES, 'UTF-8'));
			$product_names = "";
			$product_counts = $this->request->post['products_count'];
			if ($this->request->post['products_count'] > 1) {
				for($i=1; $i < $product_counts+1; $i++){
					if ($i == $product_counts) {
						$product_names .= $this->request->post["product_name_{$i}"]."(".$this->request->post["quantity_{$i}"].")";
					} else {
						$product_names .= $this->request->post["product_name_{$i}"]."(".$this->request->post["quantity_{$i}"]."), ";
					}
				}
			} else {
				$product_names = $this->request->post["product_name_1"]."(".$this->request->post["quantity_1"].")";
			}
			$text = 'Товар: ' . $product_names . "\n\n".
			'Имя:' . $this->request->post['firstname'] . "\n\n".
			'Телефон:' . $this->request->post['telephone'] . "\n\n".
			'Должность:' . $this->request->post['appointment'] . "\n\n".
			'Коментарий:' . $this->request->post['description'];
			$mail->setText(html_entity_decode($text, ENT_QUOTES, 'UTF-8'));
			if ($this->request->post['filename']) {
				$mail->addAttachment(DIR_DOWNLOAD . $this->encryption->decrypt($this->request->post['filename']));
			}
			$mail->send();
			//$json['errors'] = $product_names;
			$json['response'] = '<br/><br/>&nbsp;&nbsp;Спасибо за Ваше обращение<br/><br/>Мы вышлем коммерческое предложение в самое ближайшее время';
		} else {
			$json['errors'] = $this->data['errors'];
		}
		$this->response->setOutput(json_encode($json));
	}

	private function validate() {
		$this->language->load('checkout/checkout');

		if ((utf8_strlen($this->request->post['firstname']) < 1) || (utf8_strlen($this->request->post['firstname']) > 32)) {
			$this->data['errors']['firstname'] = $this->language->get('error_firstname');
		}

		if(!isset($this->request->post['email']) || (utf8_strlen($this->request->post['email']) < 3) || (utf8_strlen($this->request->post['email']) > 32)) {
			$this->data['errors']['email'] = $this->language->get('error_email');
		}

		if(!isset($this->request->post['telephone']) || (utf8_strlen($this->request->post['telephone']) < 3) || (utf8_strlen($this->request->post['telephone']) > 32)) {
			$this->data['errors']['telephone'] = $this->language->get('error_telephone');
		}
		return !isset($this->data['errors']);
	}

	public function upload() {
		$this->language->load('product/product');

		$json = array();

		if (!empty($this->request->files['file']['name'])) {
			setlocale(LC_ALL, 'ru_RU.utf8', 'en_US.utf8');
			$filename = basename(preg_replace('/[^a-zA-Z0-9\x{0400}-\x{04FF}\.\-\s+]/u', '', html_entity_decode($this->request->files['file']['name'], ENT_QUOTES, 'UTF-8')));

			if ((utf8_strlen($filename) < 3) || (utf8_strlen($filename) > 64)) {
        		$json['error'] = $this->language->get('error_filename');
	  		}
			// Allowed file extension types
			$allowed = array();

			$filetypes = explode("\n", $this->config->get('config_file_extension_allowed'));

			foreach ($filetypes as $filetype) {
				$allowed[] = trim($filetype);
			}

			if (!in_array(substr(strrchr($filename, '.'), 1), $allowed)) {
				$json['error'] = $this->language->get('error_filetype');
       		}

			// Allowed file mime types
		    $allowed = array();

			$filetypes = explode("\n", $this->config->get('config_file_mime_allowed'));

			foreach ($filetypes as $filetype) {
				$allowed[] = trim($filetype);
			}
			if (!in_array($this->request->files['file']['type'], $allowed)) {
				$json['error'] = $this->language->get('error_filetype');
			}

			if ($this->request->files['file']['error'] != UPLOAD_ERR_OK) {
				$json['error'] = $this->language->get('error_upload_' . $this->request->files['file']['error']);
			}
		} else {
			$json['error'] = $this->language->get('error_upload');
		}

		if (!$json && is_uploaded_file($this->request->files['file']['tmp_name']) && file_exists($this->request->files['file']['tmp_name'])) {
			$file = basename($filename) . '.' . md5(mt_rand());
			// Hide the uploaded file name so people can not link to it directly.
			$json['file'] = $this->encryption->encrypt($file);
			move_uploaded_file($this->request->files['file']['tmp_name'], DIR_DOWNLOAD . $file);

			$json['success'] = $this->language->get('text_upload');
		}

		$this->response->setOutput(json_encode($json));
	}
}

?>