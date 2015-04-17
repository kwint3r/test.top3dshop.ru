<?php
class agooFrontLoader extends Controller {

	public function install() {

	    //$this->load->library('occms_layouts');
        // $this->load->library('agoo/image');
         $this->load->library('agoo/response');
         $this->load->model('tool/image');
	  	 $this->registry->set('config_generallist', $this->config->get('generallist'));
	}


}

$agooController = new agooFrontLoader($this->registry);
$agooController->install();

if (!$this->registry->get('loader_loading')) {

	$loader_old = $this->registry->get('load');
	$this->registry->set('load_old', $loader_old);

	$agooController->load->library('agoo/loader');
	$agooloader = new agooLoader($this->registry);
	$this->registry->set('load', $agooloader);

	$agooController->load->library('agoo/config');
	$Config = $this->registry->get('config');
	$this->registry->set('config_old', $Config);
	$agooConfig = new agooConfig($this->registry);
	$this->registry->set('config', $agooConfig);

	$agooController->load->library('agoo/response');
	$Response = $this->registry->get('response');
	$this->registry->set('response_old', $Response);
	$agooResponse = new agooResponse($this->registry);
	$this->registry->set('response', $agooResponse);

}

$this->registry->set('loader_loading', true);


?>