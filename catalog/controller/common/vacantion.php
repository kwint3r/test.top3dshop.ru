<?php
class ControllerCommonVacantion extends Controller {
	public function index() {
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/vacantion.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/vacantion.tpl';
		} else {
			$this->template = 'default/template/common/vacantion.tpl';
		}

        $this->response->setOutput($this->render());
	} 	
}
?>
