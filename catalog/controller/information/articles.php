<?php  
class ControllerInformationArticles extends Controller {
	public function index() {
	
		$this->language->load('information/articles');
		$this->load->model('tool/image');

		if ($this->config->get('article_module_heading')) {
			$text_articles = $this->config->get('article_module_heading');
		}else{
    			$text_articles = $this->language->get('text_articles');
		}
		
		$this->data['breadcrumbs'] = array();
		
      		$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
		'href'      => $this->url->link('common/home'),
        	'separator' => false
      		);
      		
      		$this->data['breadcrumbs'][] = array(
        	'text'      => $text_articles,
		'href'      => $this->url->link('information/articles'),
        	'separator' => $this->language->get('text_separator')
      		);
		
		$this->document->setTitle($this->config->get('config_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));

		$this->data['heading_title'] = $text_articles;
		$this->data['text_subcategories'] = $this->language->get('text_subcategories');
		$this->data['text_articles_list'] = $this->language->get('text_articles_list');
		$this->data['text_empty'] = $this->language->get('text_empty');

		$this->document->addStyle('catalog/view/theme/default/stylesheet/articles.css');
		
		if (isset($this->request->get['id'])) {
			$parts = explode('_', (string)$this->request->get['id']);
		} else {
			$parts = array();
		}
		
		if (isset($parts[0])) {
			$this->data['article_id'] = $parts[0];
		} else {
			$this->data['article_id'] = 0;
		}
		
		if (isset($parts[1])) {
			$this->data['child_id'] = $parts[1];
		} else {
			$this->data['child_id'] = 0;
		}
							
		$this->load->model('catalog/article');
		
		$this->data['articles'] = array();
					
		$articles = $this->model_catalog_article->getArticles(0);
		
		foreach ($articles as $result) {

			if ($this->config->get('article_thumb_category_width') && $this->config->get('article_thumb_category_height')) {
				if ($result['image']) {
				$thumb_category = $this->model_tool_image->resize($result['image'], $this->config->get('article_thumb_category_width'), $this->config->get('article_thumb_category_height'));
				} else {
				$thumb_category = $this->model_tool_image->resize('no_image.jpg', $this->config->get('article_thumb_category_width'), $this->config->get('article_thumb_category_height'));
				}
                 	} else {
				$thumb_category = '';
			}

			if ($this->config->get('article_thumb_width') && $this->config->get('article_thumb_height')) {
				if ($result['image']) {
				$thumb = $this->model_tool_image->resize($result['image'], $this->config->get('article_thumb_width'), $this->config->get('article_thumb_height'));
				} else {
				$thumb = $this->model_tool_image->resize('no_image.jpg', $this->config->get('article_thumb_width'), $this->config->get('article_thumb_height'));
				}
                 	} else {
				$thumb = '';
			}

			$description = strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'));

			if (strlen($description) > 10) {
				$desc = utf8_substr($description, 0, 400) . '...';
			}else{
				$desc = false;
			}

			$level_data = $this->model_catalog_article->getArticles($result['article_id']);
			
					$this->data['articles'][] = array(
					'thumb_category'  => $thumb_category,
					'thumb'        => $thumb,
					'name'        => $result['name'],
					'children'    => $level_data,
					'description' => $desc,
					'href'        => $this->url->link('information/article', 'id=' . $result['article_id'])
					);
		}

		$this->data['button_continue'] = $this->language->get('button_continue');
		$this->data['continue'] = $this->url->link('common/home');
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/articles.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/information/articles.tpl';
		} else {
			$this->template = 'default/template/information/articles.tpl';
		}
		
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'
		);
										
		$this->response->setOutput($this->render());
	}
}
?>