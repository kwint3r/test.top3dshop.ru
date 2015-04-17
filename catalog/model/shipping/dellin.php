<?php
class ModelShippingDellin extends Model {
	
	private $length_class_id = 1; // cm
	private $weight_class_id = 1; // kg
	
	function getQuote($address) {
		
		$quote_data = array();
		
		if (!$this->config->get('dellin_status')) {
			
			if ($this->config->get('dellin_log')) {
				$this->log->write('ДеловыеЛинии: модуль отключен!');
			}
			
			return;
		}
		
		if (!is_array($this->config->get('dellin_store')) || !in_array($this->config->get('config_store_id'), $this->config->get('dellin_store'))) {
			
			if ($this->config->get('dellin_log')) {
				$this->log->write('ДеловыеЛинии: не выбран магазин!');
			}
			
			return;
		}
		
		if ($this->customer->isLogged()) {
			$customer_group_id = $this->customer->getCustomerGroupId();
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}
		
		if ($this->config->get('dellin_customer_group_id') && $this->config->get('dellin_customer_group_id') != $customer_group_id) {
			
			if ($this->config->get('dellin_log')) {
				$this->log->write('ДеловыеЛинии: не та группа пользователя!');
			}
			
			return;
		}
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('dellin_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");
		
		if ($this->config->get('dellin_geo_zone_id') && !$query->num_rows) {
			
			if ($this->config->get('dellin_log')) {
				$this->log->write('ДеловыеЛинии: другая географическая зона!');
			}
			
			return;
		}
		
		if ($this->config->get('config_weight_class_id') == $this->weight_class_id) {
			$weight = $this->cart->getWeight();
		} else {
			$weight = $this->cart->getWeight();
			$weight = $this->weight->convert($weight, $this->config->get('config_weight_class_id'), 1);
		}
		
		if ((float)$this->config->get('dellin_additional_weight')) {
			$weight += (float)$this->config->get('dellin_additional_weight');
		}
		
		$min_weight = (float)$this->config->get('dellin_min_weight');
		$max_weight = (float)$this->config->get('dellin_max_weight');
		
		if (($min_weight > 0 && $weight < $min_weight) || ($max_weight > 0 && $weight > $max_weight)) {
			
			if ($this->config->get('dellin_log')) {
				$this->log->write('ДеловыеЛинии: ограничения по весу!');
			}
			
			return;
		}
		
		$city_from = $this->config->get('dellin_city_from');
		
		if (!$city_from) {
			
			if ($this->config->get('dellin_log')) {
				$this->log->write('ДеловыеЛинии: не выбран город отправки!');
			}
			
			return;
		}
		
		$total = $this->cart->getTotal();
		
		$min_total = (float)$this->config->get('dellin_min_total');
		$max_total = (float)$this->config->get('dellin_max_total');
		
		if (($min_total > 0 && $total < $min_total) || ($max_total > 0 && $total > $max_total)) {
			
			if ($this->config->get('dellin_log')) {
				$this->log->write('ДеловыеЛинии: ограничения по сумме заказа!');
			}
			
			return;
		}
		
		$empty_zone = FALSE;
		
		if ($address['zone_id'] == '') {
			$to_data = $empty_zone = TRUE;
		} else {
			$to_data = $this->db->query("SELECT name, country_id FROM " . DB_PREFIX . "zone WHERE zone_id = '" . (int)$address['zone_id'] . "' LIMIT 1")->row;
		}
		
		if ($to_data && $address['city']) {
			
			if (!$empty_zone) {
				
				$regions = array();
				
				$region_rarts = explode(' ', $to_data['name']);
				
				if (mb_strpos($this->_clear($region_rarts[0]), 'респ') === 0) {
					$regions[] = $this->_clear($region_rarts[1]);
				} else {
					$regions[] = $this->_clear($region_rarts[0]);
				}
				
			}
			
			$param = array(
				'answerType' =>	'json',
				'mode'		 => 'getPlaces',
				'q'			 => $address['city']
			);
			
			$get_dellin_cities = $this->getURL('http://public.services.dellin.ru/calculatorTool2/js/index.html', $param);
			
			if (is_array($get_dellin_cities) && count($get_dellin_cities)) {
				
				$address['city'] = $this->_clear($address['city']);
				
				$available = array();
				
				foreach ($get_dellin_cities as $dellin_city) {
					
					$full_name = preg_replace('|^г.?\s?|isu', '', $dellin_city['fullName']);
					preg_match('|(.+?)\((.+?)\)|isu', $full_name, $match);
					
					if ($this->_clear($dellin_city['city']) == $address['city']) {
						
						if (isset($match[2]) && !$empty_zone) {
						
							$dellin_region_parts = explode(' ', $match[2]);
							
							if (mb_strpos($this->_clear($dellin_region_parts[0]), 'респ') === 0) {
								$dellin_region = $this->_clear($dellin_region_parts[1]);
							} else {
								$dellin_region = $this->_clear($dellin_region_parts[0]);
							}
							
							if (!in_array($this->_clear($dellin_region), $regions)) {
								continue;
							}
							
						}
						
						$available[] = $dellin_city;
					}
					
				}
				
				if ($count = count($available)) {
					
					if ($count > 1) {
						
						$sort_terminal = array();
						$sort_price = array();
						$sort_autocity = array();
						
						foreach ($available as $key => $value) {
							$sort_terminal[$key] = $value['isTerminal'];
							$sort_price[$key] = $value['inPrice'];
							$sort_autocity[$key] = $value['isAutoCity'];
						}
						
						array_multisort($sort_terminal, SORT_DESC, $sort_price, SORT_DESC, $sort_autocity, SORT_DESC, $available);
						
						$available = array($available[0]);
					}
					
					$available_city = reset($available);
					$city_to = $available_city['code'];
					
					$dellin_volume = (float)$this->config->get('dellin_volume');
					$volume = 0;
					
					$products = $this->cart->getProducts();
					
					foreach ($products as $product) {
						
						$product_volume = ($dellin_volume > 0) ? $dellin_volume : $this->_getVolume(array($product['length'], $product['width'], $product['height']), $product['length_class_id']);
						$volume += $product['quantity'] * $product_volume;
					}
					
					$param = array(
						'derivalPoint' => $city_from,
						'arrivalPoint' => $city_to,
						'sizedWeight' => $weight,
						'sizedVolume' => (float)$volume,
						'oversizedWeight' => 0,
						'oversizedVolume' => 0
					);
					
					if ($this->config->get('dellin_derival_door')) {
						$param['derivalDoor'] = 1;
					}
					
					if ($this->config->get('dellin_arrival_door')) {
						$param['arrivalDoor'] = 1;
					}
					
					if ($this->config->get('dellin_insurance')) {
						$param['insuranceNeeded'] = 1;
						
						if ($this->config->get('dellin_insurance_type')) {
							$param['statedValue'] = (float)$this->config->get('dellin_insurance_price');
						} else {
							$param['statedValue'] = (float)$total;
						}
					}
					
					$package_type = $this->config->get('dellin_package_type');
					
					if ($this->config->get('dellin_package') && !empty($package_type)) {
						$param['packageNeeded'] = 1;
						$param['packages'] = $package_type;
					}
					
					$url = 'http://public.services.dellin.ru/calculatorTool2/index.html?mode=calc&answerType=json';
					
					$response = $this->getURL($url, $param);
					
					if (is_array($response) && isset($response['result'])) {
						
						$this->load->language('shipping/dellin');
						
						$cost = ($this->config->get('config_currency') == 'RUB') ? $response['result'] : $this->currency->convert($response['result'], 'RUB', $this->config->get('config_currency'));
						
						if ($this->config->get('dellin_markup')) {
							$cost += (float)$this->config->get('dellin_markup');
						}
						
						$description_info = $this->config->get('dellin_description');
						
						/*
						if (!empty($description_info[$this->config->get('config_language_id')])) {
							$description = $description_info[$this->config->get('config_language_id')];
						} else {
							$description = $this->language->get('text_description');
						}
						*/
						
						if ($this->config->get('dellin_description_additionally') && $this->config->get('dellin_city_from_name')) {
							$description = ' [' . $this->config->get('dellin_city_from_name') . ' - ' . $available_city['city'] . ']';
						}
						
						$quote_data['dellin'] = array(
							'code'         => 'dellin.dellin',
							'title'        => $description,
							'name'         => 'Деловые линии',
							'cost'         => $cost,
							'tax_class_id' => $this->config->get('dellin_tax_class_id'),
							'text'         => $this->currency->format($this->tax->calculate($cost, $this->config->get('dellin_tax_class_id'), $this->config->get('config_tax')))
						);
					}
					else{
						$quote_data['dellin'] = array(
							'code'         => 'dellin.dellin',
							'title'        => 'Стоимость доставки рассчитывается индивидуально.',
							'name'         => 'Деловые линии',
							'cost'         => '',
							'tax_class_id' => $this->config->get('dellin_tax_class_id'),
							'text'         => ''
						);
					}
				} else {
					
					if ($this->config->get('dellin_log')) {
						$this->log->write('ДеловыеЛинии: Стоимость доставки рассчитывается индивидуально!');
					}
					
				$quote_data['dellin'] = array(
					'code'         => 'dellin.dellin',
					'title'        => 'Стоимость доставки рассчитывается индивидуально.',
					'name'         => 'Деловые линии',
					'cost'         => '',
					'tax_class_id' => $this->config->get('dellin_tax_class_id'),
					'text'         => ''
				);
					
				}
				
			} else {
				
				if ($this->config->get('dellin_log')) {
					$this->log->write('ДеловыеЛинии: Стоимость доставки рассчитывается индивидуально!');
				}
				
				$quote_data['dellin'] = array(
					'code'         => 'dellin.dellin',
					'title'        => 'Стоимость доставки рассчитывается индивидуально.',
					'name'         => 'Деловые линии',
					'cost'         => '',
					'tax_class_id' => $this->config->get('dellin_tax_class_id'),
					'text'         => ''
				);
				
			}
			
		} else {
			
				$quote_data['dellin'] = array(
					'code'         => 'dellin.dellin',
					'title'        => 'Введите название Вашего города',
					'name'         => 'Деловые линии',
					'cost'         => '',
					'tax_class_id' => $this->config->get('dellin_tax_class_id'),
					'text'         => ''
				);
			
		}
	
		
		$method_data = array();
		
		if ($quote_data) {
			
			$title_info = $this->config->get('dellin_title');
								
			if (!empty($title_info[$this->config->get('config_language_id')])) {
				$title = $title_info[$this->config->get('config_language_id')];
			} else {
				$title = $this->language->get('text_title');
			}
			
      		$method_data = array(
        		'code'       => 'dellin',
        		'title'      => $title,
				'name'         => 'Деловые линии',
        		'quote'      => $quote_data,
				'sort_order' => (int)$this->config->get('dellin_sort_order'),
        		'error'      => false
      		);
		}
	
		return $method_data;
	}
	
	private function _clear($value) {
		$value = mb_convert_case($value, MB_CASE_LOWER, "UTF-8");
		return trim($value);
	}
	
	private function _getVolume($data, $length_class_id) {
		
		if ($length_class_id != $this->length_class_id) {
			array_walk($data, array($this, '_convertItem'), $length_class_id);
		}
		
		$p = 1;
		
		foreach ($data as $value) {
			$p *= (float)$value;
		}
		
		return $p / 1000000;
	}
	
	private function _convertItem(&$value, $key, $length_class_id) {
		$value = $this->length->convert($value, $length_class_id, $this->length_class_id);
	}
	
	private function getURL($url, $data = array()) {
		
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($ch, CURLOPT_HEADER, FALSE);
		curl_setopt($ch, CURLOPT_TIMEOUT, 6);
		
		if (!empty($data)) {
			curl_setopt($ch, CURLOPT_POST, 1);
			curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
		}
		
		$out = curl_exec($ch);
		
		return json_decode($out, TRUE);
	}
}
?>