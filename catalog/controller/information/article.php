<?php 
class ControllerInformationArticle extends Controller {  
	public function index() { 
		$this->language->load('information/article');
		
		$this->load->model('catalog/article');
		
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
			
		if (isset($this->request->get['id'])) {
			$id = '';
		
			$parts = explode('_', (string)$this->request->get['id']);
		
			foreach ($parts as $path_id) {
				if (!$id) {
					$id = $path_id;
				} else {
					$id .= '_' . $path_id;
				}
									
				$article_info = $this->model_catalog_article->getArticle($path_id);
				
				if ($article_info) {
	       			$this->data['breadcrumbs'][] = array(
   	    				'text'      => $article_info['name'],
						'href'      => $this->url->link('information/article', 'id=' . $id),
        				'separator' => $this->language->get('text_separator')
        			);
				}
			}		
		
			$article_id = array_pop($parts);
		} else {
			$article_id = 0;
		}
		
		$article_info = $this->model_catalog_article->getArticle($article_id);
	
		if ($article_info) {
			if ($article_info['seo_title']) {
		  		$this->document->setTitle($article_info['seo_title']);
			} else {
		  		$this->document->setTitle($article_info['name']);
			}

			$this->document->setDescription($article_info['meta_description']);
			$this->document->setKeywords($article_info['meta_keyword']);
			$this->document->addStyle('catalog/view/theme/default/stylesheet/articles.css');
			
			if ($article_info['seo_h1']) {
      				$this->data['heading_title'] = $article_info['seo_h1'];
   			} else {
      				$this->data['heading_title'] = $article_info['name'];
   			}
			
			$this->data['text_subcategories'] = $this->language->get('text_subcategories');
			$this->data['text_articles_list'] = $this->language->get('text_articles_list');
			$this->data['text_empty'] = $this->language->get('text_empty');			
			
					
			$this->data['button_continue'] = $this->language->get('button_continue');

			$results = $this->model_catalog_article->getArticles($article_id);
					
			if ($article_info['image']) {

				if ($results) {
				if ($this->config->get('article_thumb_category_width') && $this->config->get('article_thumb_category_height')) {
				$this->data['image'] = $this->model_tool_image->resize($article_info['image'], $this->config->get('article_thumb_category_width'), $this->config->get('article_thumb_category_height'));
				}

				}else{

				if ($this->config->get('article_image_width') && $this->config->get('article_image_height')) {
				$this->data['image'] = $this->model_tool_image->resize($article_info['image'], $this->config->get('article_image_width'), $this->config->get('article_image_height'));
				} else {
				$this->data['image'] = '';
				}
			}

                 	} else {
				$this->data['image'] = '';
			}
									
			$this->data['description'] = html_entity_decode($article_info['description'], ENT_QUOTES, 'UTF-8');
			
			$url = '';
					
			$this->data['articles'] = array();
			
			
			
			foreach ($results as $result) {
				$data = array(
					'filter_article_id'  => $result['article_id'],
					'filter_sub_article' => true	
				);

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
					'thumb'  => $thumb,
					'name'  => $result['name'],
					'children'    => $level_data,
					'description' => $desc,
					'href'  => $this->url->link('information/article', 'id=' . $this->request->get['id'] . '_' . $result['article_id'] . $url)
				);
			}
			

			$this->data['continue'] = $this->url->link('information/articles');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/article.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/information/article.tpl';
			} else {
				$this->template = 'default/template/information/article.tpl';
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
    	} else {
			$url = '';
			
			if (isset($this->request->get['id'])) {
				$url .= '&id=' . $this->request->get['id'];
			}
									
			
						
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('information/article', $url),
				'separator' => $this->language->get('text_separator')
			);
				
			$this->document->setTitle($this->language->get('text_error'));

      		$this->data['heading_title'] = $this->language->get('text_error');

      		$this->data['text_error'] = $this->language->get('text_error');

      		$this->data['button_continue'] = $this->language->get('button_continue');

      		$this->data['continue'] = $this->url->link('information/articles');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/not_found.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/error/not_found.tpl';
			} else {
				$this->template = 'default/template/error/not_found.tpl';
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
}
?>