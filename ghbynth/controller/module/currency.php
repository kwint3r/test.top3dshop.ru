<?php
class ControllerModuleCurrency extends Controller {
	private $error = array(); 
	
	public function index() {
		$this->load->language('module/currency');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('currency', $this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			// $this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/currency', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/currency', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->data['modules'] = array();
		
		if (isset($this->request->post['currency_module'])) {
			$this->data['modules'] = $this->request->post['currency_module'];
		} elseif ($this->config->get('currency_module')) { 
			$this->data['modules'] = $this->config->get('currency_module');
		}	
		
		$this->data['setting'] = $this->model_setting_setting->getSetting('currency');	
		
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
						
		$this->template = 'module/currency.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/currency')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
	
	public function priceUpdate() {
	
		// Сохранить значения курса
		$this->load->model('setting/setting');
		$this->model_setting_setting->editSetting('currency', $this->request->post);
		
		// получить значения курса
		$currency = $this->model_setting_setting->getSetting('currency');	
		
		// пересчитать цены
		// выбрать все продукты с ценами в валюте
		$query = $this->db->query("SELECT * FROM ".DB_PREFIX."product_currency WHERE usd > 0 OR eur > 0");
		
		foreach($query->rows as $product){
			if($product['usd'])
				$price = $product['usd'] * $currency['usd'];
			if($product['eur'])
				$price = $product['eur'] * $currency['eur'];
				
			if($price){
				$this->db->query("UPDATE ".DB_PREFIX."product SET price = '".$price."' WHERE product_id = '".(int)$product['product_id']."'");
			}
		}
		
		// print_r($query->rows);
		
	}
}
?>