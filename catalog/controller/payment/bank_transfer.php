<?php
class ControllerPaymentBankTransfer extends Controller {
	protected function index() {
		$this->language->load('payment/bank_transfer');

		$this->data['text_instruction'] = $this->language->get('text_instruction');
		$this->data['text_description'] = $this->language->get('text_description');
		$this->data['text_payment'] = $this->language->get('text_payment');

		$this->data['button_confirm'] = $this->language->get('button_confirm');

		$this->data['bank'] = nl2br($this->config->get('bank_transfer_bank_' . $this->config->get('config_language_id')));

		$this->data['continue'] = $this->url->link('checkout/success');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/bank_transfer.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/payment/bank_transfer.tpl';
		} else {
			$this->template = 'default/template/payment/bank_transfer.tpl';
		}	

		$this->render(); 
	}

	public function confirm() {
		$this->language->load('payment/bank_transfer');

		$this->load->model('checkout/order');
		
		if (isset($this->request->get['bank_comment']) && $this->request->get['bank_comment']) {
			$comment  = $this->request->get['bank_comment'];
		} else {
			$comment  = '';
		}
		
		$this->log->write('Product_image:'. print_r($comment,true));
			
		if (isset($this->request->get['filename']) && $this->request->get['filename']) {
			$filename = $this->encryption->decrypt($this->request->get['filename']);
			$name = $this->request->get['name'];
		} else {
			$filename = '';
			$name = '';
		}
			$this->model_checkout_order->confirm($this->session->data['order_id'], $this->config->get('bank_transfer_order_status_id'), $comment, $name, $filename, true);
	}
	
	public function upload() {
		$this->language->load('product/product');
		
		$json = array();
		if (!empty($this->request->files['file']['name'])) {
//			$filename = basename(preg_replace('/[^a-zA-Z0-9А-Яа-я\.\-\s+]/u', '', html_entity_decode($this->request->files['file']['name'], ENT_QUOTES, 'UTF-8')));
			$filename = preg_replace('/[^a-zA-Z0-9А-Яа-я\.\-\s+]/u', '', html_entity_decode($this->request->files['file']['name'], ENT_QUOTES, 'UTF-8'));
			
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
			$file = $filename . '.' . md5(mt_rand());
			
			// Hide the uploaded file name so people can not link to it directly.
			$json['file'] = $this->encryption->encrypt($file);
			$json['mask'] = $filename;
			
			move_uploaded_file($this->request->files['file']['tmp_name'], DIR_DOWNLOAD . $file);
						
			$json['success'] = $this->language->get('text_upload');
		}	
		
		$this->response->setOutput(json_encode($json));		
	}
}
?>