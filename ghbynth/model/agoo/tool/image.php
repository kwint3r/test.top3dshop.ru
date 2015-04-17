<?php
class agooModelToolImage extends Controller
{
	protected  $Layout_;

   public function __call($name, array $params)
   {
       $object = 'ModelToolImage';
       $data = false;


       $loader_new = $this->registry->get('load');
       $loader_old = $this->registry->get('load_old');
       $this->registry->set('load', $loader_old);
       $this->load->model('tool/image');
       $this->registry->set('load', $loader_new);

		$this->Layout_ =  new $object($this->registry);

       if ($this->config->get('blog_resize') && $name == 'resize' && ($this->registry->get("fseoblog") == 1 ||  $this->registry->get("blog_work"))) {
      // if ($this->config->get('blog_resize') && $name == 'resize') {
        if (isset($params[3])) {
        		$data = $this->resizeme($params[0], $params[1], $params[2], $params[3]);
        	} else {
        	    $data = $this->resizeme($params[0], $params[1], $params[2]);
        	}


        } else {
        	$data = call_user_func_array(array($this->Layout_ , $name), $params);

        }
        return $data;

   }


	public function resizeme($filename, $width, $height, $type = "")
	{
        //$this->registry->set("blog_work",false);
         $this->load->library('aimage');
		if (!file_exists(DIR_IMAGE . $filename) || !is_file(DIR_IMAGE . $filename)) {
			return;
		}

		$info      = pathinfo($filename);
		$extension = $info['extension'];
		$old_image = $filename;
		$new_image = 'cache/' . utf8_substr($filename, 0, utf8_strrpos($filename, '.')) . '-' . $width . 'x' . $height . $type . '.' . $extension;
		if (!file_exists(DIR_IMAGE . $new_image) || (filemtime(DIR_IMAGE . $old_image) > filemtime(DIR_IMAGE . $new_image))) {
			$path        = '';
			$directories = explode('/', dirname(str_replace('../', '', $new_image)));
			foreach ($directories as $directory) {
				$path = $path . '/' . $directory;
				if (!file_exists(DIR_IMAGE . $path)) {
					@mkdir(DIR_IMAGE . $path, 0777);
				}
			}
			list($width_orig, $height_orig) = getimagesize(DIR_IMAGE . $old_image);
			if ($width_orig != $width || $height_orig != $height) {
				if ($type == 1 || $type == '')
					$type = 'i';

				$image_ = new aImage(DIR_IMAGE . $old_image);
				$image_->resize($width, $height, $type);
				$image_->save(DIR_IMAGE . $new_image);
			}
			else {
				copy(DIR_IMAGE . $old_image, DIR_IMAGE . $new_image);
			}
		}

        /*
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			return $this->config->get('config_ssl') . 'image/' . $new_image;
		}
		else {
			return $this->config->get('config_url') . 'image/' . $new_image;
		}
		*/

		 return $this->getHttpImage().$new_image;
	}

	public function getHttpImage()
	{
		$array_dir_image = str_split(DIR_IMAGE);
		$array_dir_app   = str_split(DIR_APPLICATION);
		$i               = 0;
		$dir_root        = '';
		while ($array_dir_image[$i] == $array_dir_app[$i]) {
			$dir_root .= $array_dir_image[$i];
			$i++;
		}
		$dir_image = str_replace($dir_root, '', DIR_IMAGE);
		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$http_image = HTTPS_SERVER . $dir_image;
		} else {
			$http_image = HTTP_SERVER . $dir_image;
		}
		return $http_image;
	}



}
?>