<?php
class ControllerModuleDemonstration extends Controller {
	public function send() {
        $output = '<div class="warning">Произошла ошибка, попробуйте позже</div>';


		$this->load->model('setting/extension');

        if (isset($this->request->post['demonstration_address']) && isset($this->request->post['demonstration_name']) && isset($this->request->post['demonstration_phone']))
        {
            $output = '<div class="success"><h3>Ваша заявка принята!</h3></div><p>Скоро наш менеджер свяжется с нами</p>';

            $address = trim($this->request->post['demonstration_address']);
            $name = trim($this->request->post['demonstration_name']);
            $phone = '+'.preg_replace("/\D/","",$this->request->post['demonstration_phone']);

            $replace = array('http',':','/');
            $site = str_replace($replace,'',HTTP_SERVER);


            $to = '3d@top3dshop.ru';
            //$to = $this->config->get('config_email');
            $from = 'noreply@'.$site;
            $subject = "[ЗАЯВКА НА ДЕМОНСТРАЦИЮ] с сайта " . $site;
            $message = "Сделана заявка на демонстрацию\nАдрес демо зала: " . $address . "\nИмя: " . $name . "\nТелефон: ". $phone;


            $headers = "From: " . $from . "\r\n";
            $headers .= "Reply-To: " . $from . "\r\n";
            $headers .= "MIME-Version: 1.0\r\n";
            $headers .= "Content-Type: text/plain; charset=\"utf-8\"";

            mail($to, $subject, $message, $headers);
        }



		$this->response->setOutput($output);
	}

}
