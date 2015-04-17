<?php
class agooResponse extends Controller
{
	protected $Response;
	public function __call($name, array $params)
	{
      	$modules = false;
      	$code_array  = $this->config->get('general_set');
        if (isset($code_array['pagination_prefix'])) {
        $pagination_prefix = $code_array['pagination_prefix'];
        } else {
        $pagination_prefix = 'page';
        }

        if (isset($params[0])) {
	      	if (strpos($params[0] , "/".$pagination_prefix."-{page}")===false) {
	        } else {

	          if ($this->config->get('config_seo_url_type')=='seo_url') {
	          	$params[0] = str_replace("/".$pagination_prefix."-{page}", "", $params[0]);
	          } else {
	            $params[0] = str_replace("/".$pagination_prefix."-{page}", "/", $params[0]);
	          }
	        }

          $params[0] = str_replace("_wpage-{page}", "", $params[0]);
          $params[0] = str_replace("//?", "/?", $params[0]);
        }

        if ($this->registry->get('admin_work')) {
	         $this->cont('common/seocms');
	         $admin_html    = $this->controller_common_seocms->index();

	         $find = array("</body>", "</html>");
			 $replace = array($admin_html."</body>","</html>");
			 $params[0] = str_replace($find, $replace, $params[0]);
        }


		$this->registry->set('response_work', true);


		$this->Response = $this->registry->get('response_old');
		$modules   = call_user_func_array(array(
			$this->Response,
			$name
		), $params);
		unset($this->Response);



        $this->registry->set('response_work', false);

		return $modules;
	}

	public function cont($cont)
	{
		$file  = DIR_APPLICATION . 'controller/' . $cont . '.php';
		$class = 'Controller' . preg_replace('/[^a-zA-Z0-9]/', '', $cont);
		if (file_exists($file)) {
			include_once($file);
			$this->registry->set('controller_' . str_replace('/', '_', $cont), new $class($this->registry));
		} else {
			trigger_error('Error: Could not load controller ' . $cont . '!');
			exit();
		}
	}


}
?>