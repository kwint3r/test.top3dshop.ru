<?php
class ControllerCommonSeocms extends Controller {


	public function index() {

		$this->data['this'] = $this;
		$this->data['blog_version'] = '5.*';
		$this->load->model('setting/setting');
		$settings_admin = $this->model_setting_setting->getSetting('blogversion', 'blog_version');
		foreach ($settings_admin as $key => $value) {
			$this->data['blog_version'] = $value;
		}
		if (!class_exists('User')) {
			require_once(DIR_SYSTEM . 'library/user.php');
			$this->registry->set('user', new User($this->registry));
		}
		if ($this->user->isLogged()) {
			$userLogged = true;
		} else {
			$userLogged = false;
		}

		$html = $this->loadadminmenu();

			if (isset($this->request->get['route'])) {
				if ($this->request->get['route'] == 'catalog/review/update') {
					if (!$this->user->hasPermission('modify', 'catalog/review')) {
						$this->error['warning'] = $this->language->get('error_permission');
					} else {
						$html .= $this->reviewdate_load();
					}
				}
			}

		return $html;
	}

/***************************************/
	private function loadadminmenu()
	{
		$this->language->load('module/blog');
		if (isset($this->session->data['token'])) {
			$this->data['token'] = $this->session->data['token'];
		} else {
			$this->data['token'] = "";
		}
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$admin_url = HTTP_SERVER;
		} else {
			$admin_url = HTTPS_SERVER;
		}
		$this->data['url_module'] = $admin_url . 'index.php?route=module/blog' . '&token=' . $this->data['token'];
		$this->data['url_blog'] = $admin_url . 'index.php?route=catalog/blog' . '&token=' . $this->data['token'];
		$this->data['url_record'] = $admin_url . 'index.php?route=catalog/record' . '&token=' . $this->data['token'];
		$this->data['url_comment'] = $admin_url . 'index.php?route=catalog/comment' . '&token=' . $this->data['token'];
		$this->data['url_modules'] = $admin_url . 'index.php?route=extension/module' . '&token=' . $this->data['token'];
		$this->data['url_forum'] = $this->language->get('url_forum');
		$this->data['url_forum_buy'] = $this->language->get('url_forum_buy');
		$this->data['url_opencartadmin'] = $this->language->get('url_opencartadmin');
		$this->data['url_forum_text'] = $this->language->get('url_forum_text');
		$this->data['url_forum_site_text'] = $this->language->get('url_forum_site_text');
		$this->data['url_forum_buy_text'] = $this->language->get('url_forum_buy_text');
		$this->data['url_forum_update_text'] = $this->language->get('url_forum_update_text');
		$this->data['url_opencartadmin_text'] = $this->language->get('url_opencartadmin_text');
		$this->data['url_module_text'] = $this->language->get('url_module_text');
		$this->data['url_blog_text'] = $this->language->get('url_blog_text');
		$this->data['url_record_text'] = $this->language->get('url_record_text');
		$this->data['url_comment_text'] = $this->language->get('url_comment_text');
		$this->template = 'module/blogadmin.tpl';
		if (file_exists(DIR_TEMPLATE . $this->template)) {
			$this->template = $this->template;
		} else {
			$this->template = '';
		}
		$html = $this->render();
		return $html;
	}
/***************************************/
	public function reviewdate_load()
	{
		$this->data['this'] = $this;
		$generallist = $this->config->get('generallist');
		if (isset($generallist['review_visual']) && $generallist['review_visual']) {
			$this->language->load('module/blog');
			if (isset($this->request->get['review_id'])) {
				if (isset($this->session->data['token'])) {
					$this->data['token'] = $this->session->data['token'];
				} else {
					$this->data['token'] = "";
				}
				$url = '';
				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}
				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}
				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}
				$this->data['config_language'] = $this->config->get('config_language');
				$this->data['action'] = $this->url->link('common/seocms/reviewdate_save', 'token=' . $this->session->data['token'] . '&review_id=' . $this->request->get['review_id'] . $url, 'SSL');
				$this->load->model('catalog/review');
				$this->language->load('module/blog');
				$this->data['entry_date_added'] = $this->language->get('entry_date_added');
				$review_info = $this->model_catalog_review->getReview($this->request->get['review_id']);
				if (!empty($review_info)) {
					$this->data['date_added'] = $review_info['date_added'];
					$this->data['product_id'] = $review_info['product_id'];
				} else {
					$this->data['date_added'] = '';
					$this->data['product_id'] = false;
				}
				$this->data['review_id'] = $this->request->get['review_id'];
				$this->load->model('catalog/blogcomment');

				if (isset($this->request->post['af'])) {
					$this->data['af'] = $this->request->post['af'];
				} else {
					if (isset($this->request->get['review_id'])) {
						$review_id = $this->request->get['review_id'];
						$data = array(
							'review_id' => $this->request->get['review_id'],
							'mark' => 'product_id'
						);
						$af = $this->model_catalog_blogcomment->getFields($data);
						foreach ($af as $val) {
							$this->data['af'] = $val;
						}
					} else {
						$review_id = false;
					}
				}
				$this->load->model('seocms/design/layout');
				$this->data['record_id'] = $this->request->get['review_id'];
				$layout_id = $this->model_seocms_design_layout->getRecordLayoutId($this->data['product_id'], 'product');
				if (isset($this->request->post['mylist'])) {
					$mylist = $this->request->post['mylist'];
				} else {
					$mylist = $this->config->get('mylist');
				}
				if (!isset($record_settings['addfields'])) {
					$record_settings['addfields'] = array();
				}
				$this->data['thislist'] = array();
				$this->data['thislist']['addfields'] = array();
				foreach ($this->config->get('blog_module') as $num => $val) {
					if (isset($mylist[$val['what']]['addfields'])) {
						$this->data['thislist'] = $mylist[$val['what']];
						if (isset($mylist[$val['what']]['addfields'])) {
							$record_settings['addfields'] = array_merge($record_settings['addfields'], $mylist[$val['what']]['addfields']);
						}
					}
				}
				if (!function_exists('comp_field')) {
					function comp_field($a, $b)
					{
						if (!isset($a['field_order']) || $a['field_order'] == '')
							$a['field_order'] = '9999999';
						if (!isset($b['field_order']) || $b['field_order'] == '')
							$b['field_order'] = '9999999';
						$a['field_order'] = (int) $a['field_order'];
						$b['field_order'] = (int) $b['field_order'];
						if ($a['field_order'] > $b['field_order'])
							return 1;
						if ($b['field_order'] > $a['field_order'])
							return -1;
						return 0;
					}
				}
				if (!function_exists('group_by_key')) {
					function group_by_key($array)
					{
						$result = array();
						foreach ($array as $row) {
							if (!isset($result[$row['field_name']])) {
								$result[$row['field_name']] = $row;
							} else {
								$result[$row['field_name']] = $row;
							}
						}
						return array_values($result);
					}
				}
				$addfields = array();
				foreach ($mylist as $num => $val) {
					if (isset($val['addfields'])) {
						$addfields = array_merge($addfields, $val['addfields']);
					}
				}
				$addfields = group_by_key($addfields);
				usort($addfields, 'comp_field');
				$this->data['fields'] = $addfields;
				if (isset($this->data['af'])) {
					foreach ($this->data['fields'] as $num => $field) {
						foreach ($this->data['af'] as $anum => $af) {
							if ($field['field_name'] == $anum) {
								$this->data['fields'][$num]['value'] = $af;
							}
						}
					}
				}
				$loader_old = $this->registry->get('load');
				$this->load->library('agoo/loader');
				$agooloader = new agooLoader($this->registry);
				$this->registry->set('load', $agooloader);
				$this->load->model('catalog/treecomments', DIR_CATALOG);
				$this->data['karma'] = $this->model_catalog_treecomments->getRatesByCommentId($this->request->get['review_id'], 'product_id', true);
				$this->data['karma_all'] = $this->model_catalog_treecomments->getRatesByCommentId($this->request->get['review_id'], 'product_id');
				$this->registry->set('load', $loader_old);
				$this->language->load('catalog/comment');
				$this->document->addScript('view/javascript/wysibb/jquery.wysibb.min.js');
				$this->document->addStyle('view/javascript/wysibb/theme/default/wbbtheme.css');
				$this->template = 'catalog/seocms_review_date.tpl';
				if (file_exists(DIR_TEMPLATE . $this->template)) {
					$this->template = $this->template;
				} else {
					$this->template = '';
				}
				$html = $this->render();
				if (isset($this->request->get['ajax'])) {
					$this->response->setOutput($html);
				} else {
					return $html;
				}
			}
		}
	}
/***************************************/
 	public function reviewdate_save()
	{
		/*
		$this->data['this'] = $this;
		$generallist = $this->config->get('generallist');
		if (isset($generallist['review_visual']) && $generallist['review_visual']) {
			$this->load->language('catalog/review');
			$this->document->setTitle($this->language->get('heading_title'));
			$url = '';
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateFormReview()) {
				$this->load->model('catalog/review');
				$this->load->model('catalog/blogreview');
				$this->model_catalog_review->editReview($this->request->get['review_id'], $this->request->post);
				$this->request->post['name'] = strip_tags($this->db->escape($this->request->post['author']));
				$this->request->post['mark'] = 'product_id';
				$this->model_catalog_blogreview->editReview($this->request->get['review_id'], $this->request->post);
				$this->load->model('catalog/blogcomment');
				$record_info = $this->model_catalog_blogcomment->getProductbyReviewId($this->request->get['review_id']);
				$record_id = $record_info['product_id'];
				$this->cont('record/treecomments');
				$this->data['mark'] = 'product_id';
				if (isset($this->request->post['thislist'])) {
					$str = base64_decode($this->request->post['thislist']);
					$this->data['thislist'] = unserialize($str);
				} else {
					$this->data['thislist'] = Array();
				}
				$this->data['thislist']['signer'] = true;
				$this->session->data['success'] = $this->language->get('text_success');
				$link = $this->url->link('catalog/review', 'token=' . $this->session->data['token'] . $url, 'SSL');
				$this->redirect($link);
			} else {



				$this->data['link'] = $this->url->link('catalog/review/update', 'token=' . $this->session->data['token'] . '&review_id=' . $this->request->get['review_id'] . $url, 'SSL');
				$this->data['post'] = $_POST;
				$this->template = 'module/blogredirect.tpl';
				if (file_exists(DIR_TEMPLATE . $this->template)) {
					$this->template = $this->template;
				} else {
					$this->template = '';
				}
				$html = $this->render();
				$this->response->setOutput($html);
			}
		}
		*/
	}
/***************************************/
	private function validateFormReview()
	{
		if (!$this->user->hasPermission('modify', 'catalog/review')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		if (!$this->request->post['product_id']) {
			$this->error['product'] = $this->language->get('error_product');
		}
		if ((utf8_strlen($this->request->post['author']) < 3) || (utf8_strlen($this->request->post['author']) > 64)) {
			$this->error['author'] = $this->language->get('error_author');
		}
		if (utf8_strlen($this->request->post['text']) < 1) {
			$this->error['text'] = $this->language->get('error_text');
		}
		if (!isset($this->request->post['rating'])) {
			$this->error['rating'] = $this->language->get('error_rating');
		}
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
/***************************************/
	public function cont($cont)
	{
		$file = DIR_CATALOG . 'controller/' . $cont . '.php';
		$class = 'Controller' . preg_replace('/[^a-zA-Z0-9]/', '', $cont);
		if (file_exists($file)) {
			include_once($file);
			$this->registry->set('controller_' . str_replace('/', '_', $cont), new $class($this->registry));
		} else {
			trigger_error('Error: Could not load controller ' . $cont . '!');
			exit();
		}
	}
/***************************************/
}
?>