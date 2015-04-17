<?php
class ControllerModuleOpencatmenu extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/opencatmenu');

		$this->document->setTitle($this->language->get('heading_title_fake'));
		
		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('opencatmenu', $this->request->post);						
			$this->session->data['success'] = $this->language->get('text_success');						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
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
		$this->data['entry_count'] = $this->language->get('entry_count');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_config_image_opencatmenu_width'] = $this->language->get('entry_config_image_opencatmenu_width');
		$this->data['entry_config_image_opencatmenu_height'] = $this->language->get('entry_config_image_opencatmenu_height');
		$this->data['entry_title'] = $this->language->get('entry_title');
		$this->data['entry_image'] = $this->language->get('entry_image');
		$this->data['entry_image_sub'] = $this->language->get('entry_image_sub');
		$this->data['entry_config_subimage_opencatmenu_width'] = $this->language->get('entry_config_subimage_opencatmenu_width');
		$this->data['entry_config_subimage_opencatmenu_height'] = $this->language->get('entry_config_subimage_opencatmenu_height');
		$this->data['entry_description'] = $this->language->get('entry_description');
		$this->data['entry_description_sub'] = $this->language->get('entry_description_sub');
		$this->data['entry_description_title'] = $this->language->get('entry_description_title');
		$this->data['entry_description_sub_title'] = $this->language->get('entry_description_sub_title');		
		$this->data['entry_background'] = $this->language->get('entry_background');
	    $this->data['entry_background_hover'] = $this->language->get('entry_background_hover');
		$this->data['entry_color'] = $this->language->get('entry_color');		
		$this->data['entry_size'] = $this->language->get('entry_size');
		$this->data['entry_desc_color'] = $this->language->get('entry_desc_color');
		$this->data['entry_desc_size'] = $this->language->get('entry_desc_size');
		$this->data['entry_title_background'] = $this->language->get('entry_title_background');
		$this->data['entry_title_color'] = $this->language->get('entry_title_color');
		$this->data['entry_title_size'] = $this->language->get('entry_title_size');		
		$this->data['entry_border_color'] = $this->language->get('entry_border_color');
		$this->data['entry_sister_category'] = $this->language->get('entry_sister_category');
		$this->data['entry_sister_size'] = $this->language->get('entry_sister_size');
		$this->data['entry_size_delay_category'] = $this->language->get('entry_size_delay_category');
		$this->data['entry_delay_category'] = $this->language->get('entry_delay_category');
		$this->data['entry_popup_background_hover'] = $this->language->get('entry_popup_background_hover');
		$this->data['entry_link_color_hover'] = $this->language->get('entry_link_color_hover');
		$this->data['entry_popup_level'] = $this->language->get('entry_popup_level');
		$this->data['entry_popup_level_speed'] = $this->language->get('entry_popup_level_speed');
		$this->data['button_add_menu'] = $this->language->get('button_add_menu');		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_remove'] = $this->language->get('button_remove');
		$this->data['tab_module'] = $this->language->get('tab_module');

		$this->data['modules'] = array ();

		if (isset ($this->request->post['opencatmenu_module'])) {
			$this->data['modules'] = $this->request->post['opencatmenu_module'];
		} else if ($this->config->get('opencatmenu_module')) { 
			$this->data['modules'] = $this->config->get('opencatmenu_module');			
		}	
		
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
			'href'      => $this->url->link('module/opencatmenu', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/opencatmenu', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
			
		$this->data['modules'] = array();
		
		if (isset($this->request->post['opencatmenu_module'])) {
			$this->data['modules'] = $this->request->post['opencatmenu_module'];
		} elseif ($this->config->get('opencatmenu_module')) { 
			$this->data['modules'] = $this->config->get('opencatmenu_module');
		}		

		$this->load->model('design/layout');
		
		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->template = 'module/opencatmenu.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/opencatmenu')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>