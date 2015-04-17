<?php
class ControllerShippingDellin extends Controller {
	private $error = array(); 
	
	public function index() {   
	
		$this->load->language('shipping/dellin');
		
		$this->document->setTitle($this->language->get('heading_title'));
		
		if (!extension_loaded('curl')) {
			$this->error['warning'] = $this->language->get('error_curl');
		}
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate() && !isset($this->error['warning'])) {
			
			if ($this->request->post['apply']) {
				$url = $this->url->link('shipping/dellin', 'token=' . $this->session->data['token'], 'SSL');
			} else {
				$url = $this->url->link('extension/shipping', 'token=' . $this->session->data['token'], 'SSL');
			}
			
			unset($this->request->post['apply']);
			
			$this->request->post['dellin_city_from_name'] = '';
			
			if (isset($this->request->post['dellin_description_additionally'])) {
				
				$data = $this->getData();
				
				foreach ($data['cities']['city'] as $city) {
					
					if ($city['id'] === $this->request->post['dellin_city_from']) {
						$this->request->post['dellin_city_from_name'] = $city['name'];
						break;
					}
					
				}
				
			}
			
			$this->model_setting_setting->editSetting('dellin', $this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($url);
		}
		
		$this->load->model('sale/customer_group');
		$this->load->model('localisation/geo_zone');
		$this->load->model('localisation/tax_class');
		$this->load->model('localisation/language');
		
		$this->document->addStyle('view/stylesheet/dellin.css');
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_all_zones'] = $this->language->get('text_all_zones');
		$this->data['text_none'] = $this->language->get('text_none');
		$this->data['text_select'] = $this->language->get('text_select');
		$this->data['text_order_cost'] = $this->language->get('text_order_cost');
		$this->data['text_self_cost'] = $this->language->get('text_self_cost');
		$this->data['text_insurance_cost'] = $this->language->get('text_insurance_cost');
		$this->data['text_loading'] = $this->language->get('text_loading');
		
		$this->data['entry_title'] = $this->language->get('entry_title');
		$this->data['entry_description'] = $this->language->get('entry_description');
		$this->data['entry_log'] = $this->language->get('entry_log');
		$this->data['entry_max_weight'] = $this->language->get('entry_max_weight');
		$this->data['entry_description_additionally'] = $this->language->get('entry_description_additionally');
		$this->data['entry_derival_door'] = $this->language->get('entry_derival_door');
		$this->data['entry_arrival_door'] = $this->language->get('entry_arrival_door');
		$this->data['entry_package'] = $this->language->get('entry_package');
		$this->data['entry_package_type'] = $this->language->get('entry_package_type');
		$this->data['entry_insurance'] = $this->language->get('entry_insurance');
		$this->data['entry_insurance_type'] = $this->language->get('entry_insurance_type');
		$this->data['entry_city_from'] = $this->language->get('entry_city_from');
		$this->data['entry_volume'] = $this->language->get('entry_volume');
		$this->data['entry_cost'] = $this->language->get('entry_cost');
		$this->data['entry_tax_class'] = $this->language->get('entry_tax_class');
		$this->data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_markup'] = $this->language->get('entry_markup');
		$this->data['entry_additional_weight'] = $this->language->get('entry_additional_weight');
		$this->data['entry_min_weight'] = $this->language->get('entry_min_weight');
		$this->data['entry_max_weight'] = $this->language->get('entry_max_weight');
		$this->data['entry_min_total'] = $this->language->get('entry_min_total');
		$this->data['entry_max_total'] = $this->language->get('entry_max_total');
		$this->data['entry_customer_group'] = $this->language->get('entry_customer_group');
		$this->data['entry_store'] = $this->language->get('entry_store');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_apply'] = $this->language->get('button_apply');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		
		$this->data['tab_general'] = $this->language->get('tab_general');
		$this->data['tab_data'] = $this->language->get('tab_data');
		$this->data['tab_additional'] = $this->language->get('tab_additional');
		
		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		foreach ($this->error as $name => $message) {
			$this->data['error_' . $name] = $message;
		}
		
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_shipping'),
			'href'      => $this->url->link('extension/shipping', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('shipping/dellin', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('shipping/dellin', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['cancel'] = $this->url->link('extension/shipping', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['token'] = $this->session->data['token'];
		
		if (isset($this->request->post['dellin_title'])) {
			$this->data['dellin_title'] = $this->request->post['dellin_title'];
		} else {
			$this->data['dellin_title'] = $this->config->get('dellin_title');
		}
		
		if (isset($this->request->post['dellin_description'])) {
			$this->data['dellin_description'] = $this->request->post['dellin_description'];
		} else {
			$this->data['dellin_description'] = $this->config->get('dellin_description');
		}
		
		if (isset($this->request->post['dellin_markup'])) {
			$this->data['dellin_markup'] = $this->request->post['dellin_markup'];
		} else {
			$this->data['dellin_markup'] = $this->config->get('dellin_markup');
		}
		
		if (isset($this->request->post['dellin_additional_weight'])) {
			$this->data['dellin_additional_weight'] = $this->request->post['dellin_additional_weight'];
		} else {
			$this->data['dellin_additional_weight'] = $this->config->get('dellin_additional_weight');
		}
		
		if (isset($this->request->post['dellin_volume'])) {
			$this->data['dellin_volume'] = $this->request->post['dellin_volume'];
		} else {
			$this->data['dellin_volume'] = $this->config->get('dellin_volume');
		}
		
		if (isset($this->request->post['dellin_tax_class_id'])) {
			$this->data['dellin_tax_class_id'] = $this->request->post['dellin_tax_class_id'];
		} else {
			$this->data['dellin_tax_class_id'] = $this->config->get('dellin_tax_class_id');
		}
		
		if (isset($this->request->post['dellin_geo_zone_id'])) {
			$this->data['dellin_geo_zone_id'] = $this->request->post['dellin_geo_zone_id'];
		} else {
			$this->data['dellin_geo_zone_id'] = $this->config->get('dellin_geo_zone_id');
		}
		
		if (isset($this->request->post['dellin_customer_group_id'])) {
			$this->data['dellin_customer_group_id'] = $this->request->post['dellin_customer_group_id'];
		} else {
			$this->data['dellin_customer_group_id'] = $this->config->get('dellin_customer_group_id');
		}
		
		if (isset($this->request->post['dellin_status'])) {
			$this->data['dellin_status'] = $this->request->post['dellin_status'];
		} else {
			$this->data['dellin_status'] = $this->config->get('dellin_status');
		}
		
		if (isset($this->request->post['dellin_min_weight'])) {
			$this->data['dellin_min_weight'] = $this->request->post['dellin_min_weight'];
		} else {
			$this->data['dellin_min_weight'] = $this->config->get('dellin_min_weight');
		}
		
		if (isset($this->request->post['dellin_max_weight'])) {
			$this->data['dellin_max_weight'] = $this->request->post['dellin_max_weight'];
		} else {
			$this->data['dellin_max_weight'] = $this->config->get('dellin_max_weight');
		}
		
		if (isset($this->request->post['dellin_derival_door'])) {
			$this->data['dellin_derival_door'] = $this->request->post['dellin_derival_door'];
		} else {
			$this->data['dellin_derival_door'] = $this->config->get('dellin_derival_door');
		}
		
		if (isset($this->request->post['dellin_min_total'])) {
			$this->data['dellin_min_total'] = $this->request->post['dellin_min_total'];
		} else {
			$this->data['dellin_min_total'] = $this->config->get('dellin_min_total');
		}
		
		if (isset($this->request->post['dellin_max_total'])) {
			$this->data['dellin_max_total'] = $this->request->post['dellin_max_total'];
		} else {
			$this->data['dellin_max_total'] = $this->config->get('dellin_max_total');
		}
		
		if (isset($this->request->post['dellin_arrival_door'])) {
			$this->data['dellin_arrival_door'] = $this->request->post['dellin_arrival_door'];
		} else {
			$this->data['dellin_arrival_door'] = $this->config->get('dellin_arrival_door');
		}
		
		if (isset($this->request->post['dellin_package'])) {
			$this->data['dellin_package'] = $this->request->post['dellin_package'];
		} else {
			$this->data['dellin_package'] = $this->config->get('dellin_package');
		}
		
		if (isset($this->request->post['dellin_package_type'])) {
			$this->data['dellin_package_type'] = $this->request->post['dellin_package_type'];
		} else {
			$this->data['dellin_package_type'] = $this->config->get('dellin_package_type');
		}

		if (isset($this->request->post['dellin_insurance'])) {
			$this->data['dellin_insurance'] = $this->request->post['dellin_insurance'];
		} else {
			$this->data['dellin_insurance'] = $this->config->get('dellin_insurance');
		}
		
		if (isset($this->request->post['dellin_insurance_type'])) {
			$this->data['dellin_insurance_type'] = (int)$this->request->post['dellin_insurance_type'];
		} else {
			$this->data['dellin_insurance_type'] = (int)$this->config->get('dellin_insurance_type');
		}
		
		if (isset($this->request->post['dellin_insurance_price'])) {
			$this->data['dellin_insurance_price'] = $this->request->post['dellin_insurance_price'];
		} else {
			$this->data['dellin_insurance_price'] = $this->config->get('dellin_insurance_price');
		}
		
		if (isset($this->request->post['dellin_city_from'])) {
			$this->data['dellin_city_from'] = $this->request->post['dellin_city_from'];
		} else {
			$this->data['dellin_city_from'] = $this->config->get('dellin_city_from');
		}
		
		if (isset($this->request->post['dellin_store'])) {
			$this->data['dellin_store'] = $this->request->post['dellin_store'];
		} elseif($this->config->get('dellin_store')) {
			$this->data['dellin_store'] = $this->config->get('dellin_store');
		}
		
		if (isset($this->request->post['dellin_sort_order'])) {
			$this->data['dellin_sort_order'] = $this->request->post['dellin_sort_order'];
		} else {
			$this->data['dellin_sort_order'] = $this->config->get('dellin_sort_order');
		}
		
		if (isset($this->request->post['dellin_description_additionally'])) {
			$this->data['dellin_description_additionally'] = $this->request->post['dellin_description_additionally'];
		} else {
			$this->data['dellin_description_additionally'] = $this->config->get('dellin_description_additionally');
		}
		
		if (isset($this->request->post['dellin_log'])) {
			$this->data['dellin_log'] = $this->request->post['dellin_log'];
		} else {
			$this->data['dellin_log'] = $this->config->get('dellin_log');
		}
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		
		$this->data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();
				
		$this->data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();
		
		$this->data['customer_groups'] = $this->model_sale_customer_group->getCustomerGroups();
		
		$this->load->model('setting/store');
		
		$this->data['stores'] = array();
		$this->data['stores'][] = array(
			'store_id' => 0,
			'name'	   => $this->language->get('text_store_default')
		);
		
		$this->data['stores'] = array_merge($this->data['stores'], $this->model_setting_store->getStores());
		
		$this->template = 'shipping/dellin.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		
		if (!$this->user->hasPermission('modify', 'shipping/dellin')) {
			$this->error['warning'] = $this->language->get('error_permission');
		} else {
			
			if ($this->request->post['dellin_city_from'] == 0) {
				$this->error['dellin_city_from'] = $this->language->get('error_dellin_city_from');
			}
			
			foreach (array('dellin_insurance_price', 'dellin_max_weight', 'dellin_min_weight', 'dellin_min_total', 'dellin_max_total', 'dellin_markup', 'dellin_sort_order', 'dellin_volume') as $item) {
				if ($this->request->post[$item] != "" && !is_numeric($this->request->post[$item])) {
					$this->error[$item] = $this->language->get('error_numeric');
				}
			}
			
			if ($this->error && !isset($this->error['warning'])) {
				$this->error['warning'] = $this->language->get('error_warning');
			}
			
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
	
	private function getData() {
		
		if (!$data = $this->cache->get('dellin.info')) {
			
			$url = 'http://public.services.dellin.ru/calculatorService2/index.html?request=xmlForm';
			
			$ch = curl_init();
			curl_setopt($ch, CURLOPT_URL, $url);
			curl_setopt($ch, CURLOPT_HEADER, FALSE);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			curl_setopt($ch, CURLOPT_TIMEOUT, 10);
			$response = curl_exec($ch);
			
			$data = json_decode(json_encode(simplexml_load_string($response)), TRUE);
			
			if ($data && is_array($data)) {
				$this->cache->set('dellin.info', $data);
			}
		}
		
		return $data;
	}
	
	public function load() {
		
		$json = array();
		
		if (isset($this->request->get['type'])) {
			
			$data = $this->getData();
			
			switch($this->request->get['type']) {
				case 'dellin_package_type':
					$json = $data['packageTypes']['packageType'];
					break;
				case 'dellin_city_from':
					$json = $data['cities']['city'];
					break;
			}
			
		}
		
		$this->response->setOutput(json_encode($json));
	}
}
?>