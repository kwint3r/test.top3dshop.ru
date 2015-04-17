<?php
class ControllerRecordSigner extends Controller
{
	protected  $data;
	public function signer($product_id, $record_info, $settings, $mark_id)
	{

		$record_settings = $settings;
        $record_signers = array();
        $this->language->load('agoo/signer/signer');
        $this->load->model('agoo/signer/signer');
        $this->load->model('catalog/fields');

        if (isset($settings['langfile']) && $settings['langfile']!='') {
           $this->language->load($settings['langfile']);
        }
        if (!isset($record_info['name'])) $record_info['name'] = '';

        if (isset($record_info['comment_id'])) {
          $comment_info = $this->model_agoo_signer_signer->getComment($record_info['comment_id'], $mark_id);
        } else {
          $comment_info = Array();
        }


		if ($settings['signer'] || $settings['comments_email'] != '') {

			$this->data['product_id']  = $product_id;
			$this->data['record_info'] = $record_info;

			if ($mark_id == 'product_id')
				$route = 'product/product';
			if ($mark_id == 'record_id')
				$route = 'record/record';

            if ($this->registry->get('admin_work')) {
    			 if ($mark_id == 'record_id') {            		require_once(DIR_CATALOG . 'controller/common/seoblog.php');
					$seoUrl = new ControllerCommonSeoBlog ($this->registry);
                } else {
	                $seo_type = $this->config->get('config_seo_url_type');
					if (!$seo_type) {
					  $seo_type = 'seo_url';
				}

					require_once(DIR_CATALOG . 'controller/common/' . $seo_type . '.php');
	                $classSeo = 'ControllerCommon'.str_replace('_','',$seo_type);

					$seoUrl = new $classSeo($this->registry);
                }

                $urlToCatalog = new Url(HTTP_CATALOG, $this->config->get('config_secure') ? HTTPS_CATALOG : HTTP_CATALOG);
                $urlToCatalog->addRewrite($seoUrl);
				$correct_URL = $urlToCatalog->link($route, '&' . $mark_id . '=' . $this->data['product_id']);

				$pos = strpos($correct_URL, 'http');

				if ($pos === false) {
				    $correct_URL = ($this->config->get('config_secure') ? HTTPS_CATALOG : HTTP_CATALOG).$correct_URL;
                }

               $this->data['record_info']['link'] = $correct_URL;
               } else {               $this->getChild('common/seoblog');
			   $this->data['record_info']['link'] = $this->url->link($route, '&' . $mark_id . '=' . $this->data['product_id']);
               }

            if (!class_exists('Customer')) {
				require_once(DIR_SYSTEM . 'library/customer.php');
			}

			$obj = $this->registry->get('customer');
            if (!is_object($obj)) {
		        $this->registry->set('customer', new Customer($this->registry));
    		}
    		unset($obj);


			$this->data['login']       = $this->customer->getFirstName() . " " . $this->customer->getLastName();
			$this->data['customer_id'] = $this->customer->getId();

			if ($this->config->get('config_logo') && file_exists(DIR_IMAGE . $this->config->get('config_logo'))) {
				$this->data['logo'] = $this->getHttpImage().$this->config->get('config_logo');
			} else {
				$this->data['logo'] = false;
			}

					require_once(DIR_SYSTEM . 'library/bbcode.class.php');

					if (isset($this->request->post['text'])) {
					$this->request->post['text'] = strip_tags($this->request->post['text']);
					} else {
					$this->request->post['text'] ='';
					}



					$text                        = BBCode::parse($this->request->post['text']);
					if ($this->rdate($this->language->get('text_date')) == $this->rdate($this->language->get('text_date'), strtotime(date('Y-m-d H:i:s')))) {
						$date_str = $this->language->get('text_today');
					} else {
						$date_str = $this->language->get('text_date');
					}
					$date_added = $this->rdate($date_str . $this->language->get('text_hours'), strtotime(date('Y-m-d H:i:s')));





 					$fields =Array();
					if (isset($this->request->post['af'])) {


					$f_name ='';
							foreach ($this->request->post['af'] as $num => $value) {
								if ($value != '' && $value != 0) {
									if (isset($record_settings['addfields'])) {
										foreach ($record_settings['addfields'] as $nm => $vl) {
											if ($vl['field_name'] == $num) {
											  $f_name =	$vl['field_description'][$this->config->get('config_language_id')];
											}
										}
									} else {



                                      $field_info = $this->model_catalog_fields->getFieldByName($num);





                                      $f_name =	$field_info['field_description'];


									}
                                    $fields[$this->db->escape(strip_tags($num))]['field_name'] = $f_name;
									$fields[$this->db->escape(strip_tags($num))]['text'] = $this->db->escape(strip_tags($value));
								}

							}

		}




			$subject = sprintf($this->language->get('text_subject'), $this->config->get('config_name'));





           if (isset($record_settings['status_now']) && $record_settings['status_now']) {
			 $record_signers = $this->model_agoo_signer_signer->getStatusId($this->data['product_id'], $mark_id);
			} else {
			 $record_signers = array();
			}
            $admin_signers = array();




			if (isset($settings['comments_email']) && $settings['comments_email'] != '') {

				$comments_email = explode(";", $settings['comments_email']);

   		        foreach ($comments_email as $num =>$email) {
   		        	$email = trim($email);

     /*
					array_push($record_signers, Array(
						'id' => $this->data['product_id'],
						'pointer' => $mark_id,
						'customer_id' => $email,
						'admin'	=> true
					));
    */
					array_push($admin_signers, Array(
						'id' => $this->data['product_id'],
						'pointer' => $mark_id,
						'customer_id' => $email,
						'admin'	=> true
					));


				}
			}

                                    /*
                                    print_r("<PRE>");
									print_r($record_signers);
									print_r($admin_signers);
									print_r("</PRE>");
                                    */


            if (!empty($admin_signers)) {				foreach ($admin_signers as $par => $singers) {
					$template = '/template/agoodonut/module/blog_signer_mail.tpl';
					if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . $template)) {
						$this->template = $this->config->get('config_template') . $template;
					} else {
						$this->template = 'default' . $template;
					}
					$this->data['theme'] = $this->config->get('config_template');

					if (isset($singers['admin']) && $singers['admin']) {
						$customer['email']     = $singers['customer_id'];
						$customer['firstname'] = 'admin';
						$customer['lastname']  = '';
					} else {						$customer['email']     = '';
						$customer['firstname'] = '';
						$customer['lastname']  = '';
					}
						$this->data['data'] = array(
							'text' => $text,
							'settings' => $record_settings,
							'fields' => $fields,
							'comment' => $this->request->post,
							'comment_db' => $comment_info,
							'record' => $this->data['record_info'],
							'date' => $date_added,
							'shop' => $this->config->get('config_name'),
							'signers' => serialize($singers),
							'signer_customer' => $customer
						);

					$html    = $this->render();
					$message = $html;


					$data_mail['customer_email'] = $customer['email'];
                    $data_mail['message'] = $message;
                    $data_mail['subject'] = $subject;
                    $this->send_mail($data_mail);
                    unset($data_mail);
				}            }



			if (!empty($record_signers)) {

				foreach ($record_signers as $par => $singers) {
					$template = '/template/agoodonut/module/blog_signer_mail.tpl';

					if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . $template)) {
						$this->template = $this->config->get('config_template') . $template;
					} else {
						$this->template = 'default' . $template;
					}


					$this->data['theme'] = $this->config->get('config_template');


					if ($singers['customer_id']=="0") {							$customer['email']     = $singers['email'];
							$customer['firstname'] = $this->language->get('text_ghost');
							$customer['lastname']  = '';
					} else {
						   $customer = $this->model_agoo_signer_signer->getCustomer($singers['customer_id']);
					}




						$this->data['data'] = array(
							'text' => $text,
							'settings' => $record_settings,
							'fields' => $fields,
							'comment' => $this->request->post,
							'comment_db' => $comment_info,
							'record' => $this->data['record_info'],
							'date' => $date_added,
							'shop' => $this->config->get('config_name'),
							'signers' => serialize($singers),
							'signer_customer' => $customer
						);

					$html    = $this->render();
					$message = $html;
					$subject = sprintf($this->language->get('text_subject'), $this->config->get('config_name'));






					if (((isset($comment_info['status']) && $comment_info['status']) &&
					(isset($record_settings['comment_signer']) && $record_settings['comment_signer']) ) && ($singers['customer_id'] != $this->data['customer_id']) && isset($customer['email'])) {

					$data_mail['customer_email'] = $customer['email'];
                    $data_mail['message'] = $message;
                    $data_mail['subject'] = $subject;
                    $this->send_mail($data_mail);
                    unset($data_mail);

					}
				}
  			}
		}
	}

	public function send_mail($data) {
						$mail            = new Mail();
						$mail->protocol  = $this->config->get('config_mail_protocol');
						$mail->parameter = $this->config->get('config_mail_parameter');
						$mail->hostname  = $this->config->get('config_smtp_host');
						$mail->username  = $this->config->get('config_smtp_username');
						$mail->password  = $this->config->get('config_smtp_password');
						$mail->port      = $this->config->get('config_smtp_port');
						$mail->timeout   = $this->config->get('config_smtp_timeout');
						$mail->setFrom($this->config->get('config_email'));
						$mail->setSender($this->config->get('config_name'));

						$mail->setTo($data['customer_email']);
						$mail->setSubject(html_entity_decode($data['subject'], ENT_QUOTES, 'UTF-8'));
						$mail->setHtml(html_entity_decode($data['message'] , ENT_QUOTES, 'UTF-8'));

						$mail->send();

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
	public function subscribe()
	{

		$this->language->load('agoo/signer/signer');
		$this->getChild('common/seoblog');
        $signer_status = false;

		$html   = "<script>var sdata = new Array();
					sdata['code'] 	 = 'error';
					sdata['error'] 	 = 'customer_id';
				 </script>";
		$this->data['signer_code'] = false;
		$this->data['href']        = "#";
        $this->data['email_error'] ='';

		if (isset($this->request->post['email_ghost']) && $this->request->post['email_ghost']!='') {
			$this->data['email_ghost'] = $this->request->post['email_ghost'];


           if(preg_match("|^[-0-9a-z_\.]+@[-0-9a-z_^\.]+\.[a-z]{2,6}$|i", $this->data['email_ghost']))
           {

           } else  {
              $email_subscribe = $this->data['email_ghost'];
              $this->data['email_ghost'] = false;
              $this->data['email_error'] = 'email';

			  $html = "<script>var sdata = new Array();
					sdata['code'] 	 = 'error';
					sdata['error'] 	 = 'email';
				 </script>";
           }

		} else {
			$this->data['email_ghost'] = false;
			if (isset($this->request->post['email_ghost'])) {
				$this->data['email_error'] = 'noemail';
			}
		}

		if (isset($this->request->get['id'])) {
			$this->data['id'] = $this->request->get['id'];
		} else {
			$this->data['id'] = false;
		}


		if (isset($this->request->get['pointer'])) {
			$this->data['pointer'] = $this->request->get['pointer'];
		} else {
			$this->data['pointer'] = false;
		}
		$allow_pointers = array(
			'record_id',
			'product_id',
			'blog_id'
		);
		if (!in_array($this->data['pointer'], $allow_pointers)) {
			$this->data['pointer'] = false;
		}
		if ($this->data['pointer'] == 'product_id') {
			$this->data['href'] = $this->url->link('product/product', 'product_id=' . $this->data['id']);
		}
		if ($this->data['pointer'] == 'record_id') {
			$this->data['href'] = $this->url->link('record/record', 'record_id=' . $this->data['id']);
		}
		if ($this->data['pointer'] == 'blog_id') {
			$this->data['href'] = $this->url->link('record/blog', 'blog_id=' . $this->data['id']);
		}
		if (($this->customer->isLogged() || $this->data['email_ghost']) && $this->data['id'] && $this->data['pointer']) {

			if ($this->data['pointer'] == 'record_id') {
				$this->load->model('catalog/record');
				$record_info        = $this->model_catalog_record->getRecord($this->data['id']);
				$this->data['href'] = $this->url->link('record/record', 'record_id=' . $this->data['id']);
				if (isset($record_info['comment'])) {
					$record_comment = unserialize($record_info['comment']);
				} else {
					$record_comment = false;
				}
			}


			if ($this->data['pointer'] == 'product_id') {
				$record_info              = true;
				$record_comment['signer'] = true;
				$this->data['href']       = $this->url->link('product/product', 'product_id=' . $this->data['id']);
			}

			if ($record_info) {
				if (isset($record_comment['signer']) && $record_comment['signer']) {
					if ($this->customer->isLogged()) {
					 $this->data['customer_id'] = $this->customer->getId();
					} else {					 $this->data['customer_id'] = 0;
					}

					if ($this->data['id']) {
						$this->load->model('agoo/signer/signer');
						$signer_status = $this->model_agoo_signer_signer->getStatus($this->data['id'], $this->data['customer_id'], $this->data['pointer'], $this->data['email_ghost']);

						if (!$signer_status) {
							$this->model_agoo_signer_signer->setStatus($this->data['id'], $this->data['customer_id'], $this->data['pointer'], $this->data['email_ghost']);
                            if ($this->data['email_ghost']) {
                            	if (isset($_COOKIE['email_subscribe_'.$this->data['pointer']])) {
				                 $email_subscribe = unserialize(base64_decode($_COOKIE['email_subscribe_'.$this->data['pointer']]));
								} else {
				                 $email_subscribe = Array();
                				}
                                 $email_subscribe[$this->data['id']] = $this->data['email_ghost'];

                            	setcookie("email_subscribe_".$this->data['pointer'], base64_encode(serialize($email_subscribe)), time() + 60 * 60 * 24 * 555, '/', $this->request->server['HTTP_HOST']);
                            }

							$html  = "<script>var sdata = new Array();
									sdata['code'] 	 = 'success';
									sdata['success'] = 'set';
						  		</script>";
							$this->data['signer_code'] = 'set';
						} else {
							$this->model_agoo_signer_signer->removeStatus($this->data['id'], $this->data['customer_id'], $this->data['pointer'], $this->data['email_ghost']);

                            	if (isset($_COOKIE['email_subscribe_'.$this->data['pointer']])) {
				                 $email_subscribe = unserialize(base64_decode($_COOKIE['email_subscribe_'.$this->data['pointer']]));
								} else {
				                 $email_subscribe = Array();
                				}
                                 if (isset($email_subscribe[$this->data['id']])) {                                  unset($email_subscribe[$this->data['id']]);
                                 }
                             if (empty($email_subscribe)) {                              $email_subscribe ='';
                             } else {                              $email_subscribe = base64_encode(serialize($email_subscribe));
                             }
                            setcookie("email_subscribe_".$this->data['pointer'], $email_subscribe, time() + 60 * 60 * 24 * 555, '/', $this->request->server['HTTP_HOST']);
							$html                      = "<script>var sdata = new Array();
									sdata['code'] 	 = 'success';
									sdata['success'] 	 = 'remove';
						  		</script>";
							    $this->data['signer_code'] = 'remove';
						}
					} else {
						$html   = "<script>var sdata = new Array();
								sdata['code'] 	 = 'error';
								sdata['error'] 	 = 'record_id';
						  </script>";
						$this->data['signer_code'] = 'record_id';
					}
				} else {
					$html                      = "<script>var sdata = new Array();
								sdata['code'] 	 = 'error';
								sdata['error'] 	 = 'no_signer';
						  </script>";
					$this->data['signer_code'] = 'no_signer';
				}
			}
		} else {
			$html   = "<script>var sdata = new Array();
							sdata['code'] 	 = 'error';
							sdata['error'] 	 = 'customer_id';
					  </script>";

			$this->data['signer_code'] = 'customer_id';
			$this->language->load('account/login');
             $this->data['text_subscribe']            = $this->language->get('text_subscribe');

                if (isset($_COOKIE['email_subscribe_'.$this->data['pointer']])) {
                 $email_subscribe = unserialize(base64_decode($_COOKIE['email_subscribe_'.$this->data['pointer']]));

				 if (isset($email_subscribe[$this->data['id']])) {
				 $email_subscribe =  $email_subscribe[$this->data['id']];
				 } else {				 $email_subscribe = '';
				 }

				} else {					if (isset($email_subscribe) && $email_subscribe!='') {

                 	} else {                 		$email_subscribe = '';
                 	}
                }

			if((isset($email_subscribe) &&  $email_subscribe!='') &&  $this->data['email_error'] != 'email' || $signer_status) {				 $this->data['text_subscribe']           = $this->language->get('text_unsubscribe');
				 $this->data['text_or_email']            = $this->language->get('text_un_email');
				 $this->data['signer_status']            = true;
				 $this->data['email_ghost']				 = $email_subscribe;
			} else {				$this->data['signer_status']             = false;				$this->data['text_subscribe']            = $this->language->get('text_subscribe');
				$this->data['text_or_email']             = $this->language->get('text_or_email');
				$this->data['email_ghost']				 = $email_subscribe;
			}

			$this->data['text_new_customer']            = $this->language->get('text_new_customer');
			$this->data['text_register']                = $this->language->get('text_register');
			$this->data['text_register_account']        = $this->language->get('text_register_account');
			$this->data['text_returning_customer']      = $this->language->get('text_returning_customer');
			$this->data['text_i_am_returning_customer'] = $this->language->get('text_i_am_returning_customer');
			$this->data['text_forgotten']               = $this->language->get('text_forgotten');
			$this->data['entry_email']                  = $this->language->get('entry_email');
			$this->data['entry_password']               = $this->language->get('entry_password');
			$this->data['button_continue']              = $this->language->get('button_continue');
			$this->data['button_login']                 = $this->language->get('button_login');

			if (isset($this->error['warning'])) {
				$this->data['error_warning'] = $this->error['warning'];
			} else {
				$this->data['error_warning'] = '';
			}
			if (isset($this->session->data['success'])) {
				$this->data['success'] = $this->session->data['success'];
				unset($this->session->data['success']);
			} else {
				$this->data['success'] = '';
			}
			if (isset($this->request->post['email'])) {
				$this->data['email'] = $this->request->post['email'];
			} else {
				$this->data['email'] = '';
			}
			if (isset($this->request->post['password'])) {
				$this->data['password'] = $this->request->post['password'];
			} else {
				$this->data['password'] = '';
			}
			$this->data['action']    = $this->url->link('account/login', '', 'SSL');
			$this->data['register']  = $this->url->link('account/register', '', 'SSL');
			$this->data['forgotten'] = $this->url->link('account/forgotten', '', 'SSL');

			if (isset($this->request->post['redirect']) && (strpos($this->request->post['redirect'], $this->config->get('config_url')) !== false || strpos($this->request->post['redirect'], $this->config->get('config_ssl')) !== false)) {
				$this->data['redirect'] = $this->request->post['redirect'];
			} elseif (isset($this->session->data['redirect'])) {
				$this->data['redirect'] = $this->session->data['redirect'];
				unset($this->session->data['redirect']);
			} else {
				$this->data['redirect'] = $this->data['href'];
			}
		}

		$template = '/template/agoodonut/module/blog_signer.tpl';
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . $template)) {
			$this->template = $this->config->get('config_template') . $template;
		} else {
			$this->template = 'default' . $template;
		}
		$this->data['theme'] = $this->config->get('config_template');
		$html .= $this->render();
		return $this->response->setOutput($html);
	}



	public function rdate($param, $time = 0)
	{
		$this->language->load('record/blog');
		if (intval($time) == 0)
			$time = time();
		$MonthNames = array(
			$this->language->get('text_january'),
			$this->language->get('text_february'),
			$this->language->get('text_march'),
			$this->language->get('text_april'),
			$this->language->get('text_may'),
			$this->language->get('text_june'),
			$this->language->get('text_july'),
			$this->language->get('text_august'),
			$this->language->get('text_september'),
			$this->language->get('text_october'),
			$this->language->get('text_november'),
			$this->language->get('text_december')
		);
		if (strpos($param, ' M ') === false)
			return date($param, $time);
		else {
			$str_begin  = date(utf8_substr($param, 0, utf8_strpos($param, 'M')), $time);
			$str_middle = $MonthNames[date('n', $time) - 1];
			$str_end    = date(utf8_substr($param, utf8_strpos($param, 'M') + 1, utf8_strlen($param)), $time);
			$str_date   = $str_begin . $str_middle . $str_end;
			return $str_date;
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