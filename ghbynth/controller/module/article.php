<?php
class ControllerModuleArticle extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/article');

		$this->load->model('catalog/article');

		$this->model_catalog_article->checkArticles();

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('article', $this->request->post);		
					
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

		$this->data['entry_heading'] = $this->language->get('entry_heading');
		$this->data['entry_article_thumb_category'] = $this->language->get('entry_article_thumb_category');	
		$this->data['entry_article_thumb'] = $this->language->get('entry_article_thumb');
		$this->data['entry_article_image'] = $this->language->get('entry_article_image');	
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
			'href'      => $this->url->link('module/article', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/article', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['modules'] = array();
		
		if (isset($this->request->post['article_module'])) {
			$this->data['modules'] = $this->request->post['article_module'];
		} elseif ($this->config->get('article_module')) { 
			$this->data['modules'] = $this->config->get('article_module');
		}

		if (isset($this->request->post['article_module_heading'])) {
			$this->data['article_module_heading'] = $this->request->post['article_module_heading'];
		} elseif ($this->config->get('article_module_heading')) { 
			$this->data['article_module_heading'] = $this->config->get('article_module_heading');
		} else {
			$this->data['article_module_heading'] = '';
		}

		if (isset($this->request->post['article_thumb_category_width'])) {
			$this->data['article_thumb_category_width'] = $this->request->post['article_thumb_category_width'];
		} elseif ($this->config->get('article_thumb_category_width')) { 
			$this->data['article_thumb_category_width'] = $this->config->get('article_thumb_category_width');
		} else {
			$this->data['article_thumb_category_width'] = '';
		}

		if (isset($this->request->post['article_thumb_category_height'])) {
			$this->data['article_thumb_category_height'] = $this->request->post['article_thumb_category_height'];
		} elseif ($this->config->get('article_thumb_category_height')) { 
			$this->data['article_thumb_category_height'] = $this->config->get('article_thumb_category_height');
		} else {
			$this->data['article_thumb_category_height'] = '';
		}

		if (isset($this->request->post['article_thumb_width'])) {
			$this->data['article_thumb_width'] = $this->request->post['article_thumb_width'];
		} elseif ($this->config->get('article_thumb_width')) { 
			$this->data['article_thumb_width'] = $this->config->get('article_thumb_width');
		} else {
			$this->data['article_thumb_width'] = '';
		}

		if (isset($this->request->post['article_thumb_height'])) {
			$this->data['article_thumb_height'] = $this->request->post['article_thumb_height'];
		} elseif ($this->config->get('article_thumb_height')) { 
			$this->data['article_thumb_height'] = $this->config->get('article_thumb_height');
		} else {
			$this->data['article_thumb_height'] = '';
		}

		if (isset($this->request->post['article_image_width'])) {
			$this->data['article_image_width'] = $this->request->post['article_image_width'];
		} elseif ($this->config->get('article_image_width')) { 
			$this->data['article_image_width'] = $this->config->get('article_image_width');
		} else {
			$this->data['article_image_width'] = '';
		}

		if (isset($this->request->post['article_image_height'])) {
			$this->data['article_image_height'] = $this->request->post['article_image_height'];
		} elseif ($this->config->get('article_image_height')) { 
			$this->data['article_image_height'] = $this->config->get('article_image_height');
		} else {
			$this->data['article_image_height'] = '';
		}	
				
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->template = 'module/article.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/article')) {
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