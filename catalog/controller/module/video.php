<?php  
class ControllerModuleVideo extends Controller {
	protected function index($setting) {
	
		static $module = 0;
		
		$this->load->model('design/video');
		$this->load->model('tool/image');
		
		$this->document->addScript('catalog/view/javascript/jquery/video/scripts/jq.carousel.min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/video/styles/style.css');
		
				
		$this->data['videos'] = array();

		$results = $this->model_design_video->getVideo($setting['video_id']);
		
		$this->data['width'] = $setting['width'];
		$this->data['height'] = $setting['height'];
		
		foreach ($results as $result) {
			$this->data['videos'][] = array(
					'title' => $result['title'],
					'link'  => $result['link']
			);
		}
		
		$this->data['module'] = $module++;
				
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/video.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/video.tpl';
		} else {
			$this->template = 'default/template/module/video.tpl';
		}
		
		$this->render();
	}
}
?>