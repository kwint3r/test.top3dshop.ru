<?php
class ControllerModuleOpencatmenu extends Controller {
	protected function index($setting) {
	
		$this->data['setting'] = $setting;
		
		$this->data['opencatmenu_title'] = html_entity_decode($setting['opencatmenu_title'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
		
		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}
		
		if (isset($parts[0])) {
			$this->data['category_id'] = $parts[0];
		} else {
			$this->data['category_id'] = 0;
		}
		
		if (isset($parts[1])) {
			$this->data['child_id'] = $parts[1];
		} else {
			$this->data['child_id'] = 0;
		}
		
        if (isset($parts[2])) { 
		    $this->data['sisters_id'] = $parts[2]; 
	    } else {
		    $this->data['sisters_id'] = 0; 
		}

		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		
		$this->data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);
		
		foreach ($categories as $category) {		
			$children_data = array();			
			$children = $this->model_catalog_category->getCategories($category['category_id']);
			
			foreach ($children as $child) {
				$data = array(
					'filter_category_id'  => $child['category_id'],
					'filter_sub_category' => true
				);		
				
				$sister_data = array();				
                $sisters = $this->model_catalog_category->getCategories($child['category_id']);
					
				if ($setting['count']) {
					$product_total = $this->model_catalog_product->getTotalProducts($data);
					
					foreach ($sisters as $sisterMember) {
						$sister_data[] = array(
						'category_id'  =>$sisterMember['category_id'],
						'name'         => $sisterMember['name'],
						'href'         => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']. '_' . $sisterMember['category_id'])   
						);                   
                    }
					
					$children_data[] = array(
						'category_id' => $child['category_id'],
						'sister_id'   => $sister_data,
						'name'        => $child['name'] . ' (' . $product_total . ')',
						'href'        => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']),
						'thumb'       => $this->model_tool_image->resize($child['image'], $setting['config_subimage_opencatmenu_width'], $setting['config_subimage_opencatmenu_height']),
						'description' => ltrim(utf8_substr(strip_tags(html_entity_decode($child['description'], ENT_QUOTES, 'UTF-8')), 0, $setting['entry_description_sub_count']))
					);	
					
				} else {			
				
					foreach ($sisters as $sisterMember) {
						$sister_data[] = array(
						'category_id'  =>$sisterMember['category_id'],
						'name'         => $sisterMember['name'],
						'href'         => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']. '_' . $sisterMember['category_id'])   
						);                   
                    }
					
					$children_data[] = array(
						'category_id' => $child['category_id'],
						'sister_id'   => $sister_data,
						'name'        => $child['name'],
						'href'        => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id']),
				    	'thumb'       => $this->model_tool_image->resize($child['image'], $setting['config_subimage_opencatmenu_width'], $setting['config_subimage_opencatmenu_height']),
						'description' => ltrim(utf8_substr(strip_tags(html_entity_decode($child['description'], ENT_QUOTES, 'UTF-8')), 0, $setting['entry_description_sub_count']))
					);						
				}			
			}
			
			$data = array(
				'filter_category_id'  => $category['category_id'],
				'filter_sub_category' => true	
			);		

			if ($setting['count']) {
				$product_total = $this->model_catalog_product->getTotalProducts($data);
				
					$this->data['categories'][] = array(
						'category_id' => $category['category_id'],
						'name'        => $category['name'] . ' (' . $product_total . ')',
						'children'    => $children_data,
						'href'        => $this->url->link('product/category', 'path=' . $category['category_id']),
						'column'      => $category['column'] ? $category['column'] : 1,
						'thumb'       => $this->model_tool_image->resize($category['image'], $setting['config_image_opencatmenu_width'], $setting['config_image_opencatmenu_height']),
						'description' => ltrim(utf8_substr(strip_tags(html_entity_decode($category['description'], ENT_QUOTES, 'UTF-8')), 0, $setting['entry_description_count']))
					);
				
			} else {			    
     				$this->data['categories'][] = array(
						'category_id' => $category['category_id'],
						'name'        => $category['name'],
						'children'    => $children_data,
						'column'      => $category['column'] ? $category['column'] : 1,
						'href'        => $this->url->link('product/category', 'path=' . $category['category_id']),
						'thumb'       => $this->model_tool_image->resize($category['image'], $setting['config_image_opencatmenu_width'], $setting['config_image_opencatmenu_height']),
						'description' => ltrim(utf8_substr(strip_tags(html_entity_decode($category['description'], ENT_QUOTES, 'UTF-8')), 0, $setting['entry_description_count']))
				);
		
			}
		}
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/opencatmenu.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/opencatmenu.tpl';
		} else {
			$this->template = 'default/template/module/opencatmenu.tpl';
		}
		
		$this->render();
  	}
}
?>