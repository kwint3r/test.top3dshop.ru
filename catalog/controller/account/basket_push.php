<?php
class ControllerAccountBasketPush extends Controller {
    public function update() {
        $this->load->model('account/customer');

        if ($this->customer->getId())
        {
            $this->model_account_customer->updateTime($this->customer->getId());
        }
    }


    public function send() {

        $this->load->model('account/customer');
        $this->load->model('tool/image');


        $customers = $this->model_account_customer->getCustomersLastVisit(86400);
		

        foreach ($customers as $customer)
        {
            $cart = unserialize($customer['cart']);

            $this->session->data['cart'] = $cart;
            $products = array();
            $products = $this->cart->getProducts();
			// echo '<pre>';
			// print_r($customer);
			// echo '</pre>';

            if ($this->cart->hasProducts()){
				// echo '<pre>1111';
				// print_r($customer);
				// echo '</pre>';
				
                $template = new Template();

                $template->data['products'] = array();

                foreach ($products as $product)
                {
                    if ($product['image']) {
                        $image = $this->model_tool_image->resize($product['image'], 150, 150);
                    } else {
                        $image = $this->model_tool_image->resize('no_image.jpg', 150, 150);
                    }

                    $template->data['products'][] = array(
                        'name' => $product['name'],
                        'image' => $image,
                        'href' => $this->url->link('product/product', '&product_id=' . $product['product_id']),
                        'option' => $product['option'],
                        'quantity' => $product['quantity'],
                        'price' => $product['price'],
                        'total' => $product['total']
                    );
                }


                //mail
                $template->data['store_name'] = $this->config->get('config_name');

                $template->data['totals'] = $this->cart->getTotal();
                $template->data['totals_count'] = $this->cart->countProducts();

                if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/mail/basket_push.tpl')) {
                    $html = $template->fetch($this->config->get('config_template') . '/template/mail/basket_push.tpl');
                } else {
                    $html = $template->fetch('default/template/mail/basket_push.tpl');
                }
				
				echo $customer['customer_id'].'<br>';

                $subject =  $this->config->get('config_name') .' - забытые товары';

                $mail = new Mail();
                $mail->protocol = $this->config->get('config_mail_protocol');
                $mail->parameter = $this->config->get('config_mail_parameter');
                $mail->hostname = $this->config->get('config_smtp_host');
                $mail->username = $this->config->get('config_smtp_username');
                $mail->password = $this->config->get('config_smtp_password');
                $mail->port = $this->config->get('config_smtp_port');
                $mail->timeout = $this->config->get('config_smtp_timeout');
                $mail->setTo($customer['email']);
                $mail->setFrom($this->config->get('config_email'));
                $mail->setSender($this->config->get('config_name'));
                $mail->setSubject(html_entity_decode($subject, ENT_QUOTES, 'UTF-8'));
                $mail->setHtml($html);
                //$mail->setText(html_entity_decode($text, ENT_QUOTES, 'UTF-8'));
                $mail->send();

                $this->model_account_customer->updateTimeLastNotify($customer['customer_id']);
            }
        }
    }
}