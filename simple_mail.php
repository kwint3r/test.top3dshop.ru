<?php
error_reporting(0);
ini_set('display_errors',0);
header('Content-Type: text/html; charset=utf-8');

require_once 'catalog/view/theme/vitalia/lib/recaptchalib.php';

// Register API keys at https://www.google.com/recaptcha/admin
$siteKey = "6LdOHAUTAAAAALDPU8O3nDLcSHKV6tnn5jVrPky6";
$secret = "6LdOHAUTAAAAABrQi-qvMNHA3CMTYiRcoxlV6g11";

//$secret = "6Lc3SgITAAAAADQjI8NPKbl0l7AaILNUvYnazaiJ"; // old
// reCAPTCHA supported 40+ languages listed here: https://developers.google.com/recaptcha/docs/language
$lang = "en";
// The response from reCAPTCHA
$resp = null;
// The error code from reCAPTCHA, if any
$error = null;
$output = "";


if(isset($_POST['g-recaptcha-response'])){
  $captcha=$_POST['g-recaptcha-response'];
}
if(!$captcha){
  echo '<h2>Please check the the captcha form.</h2>';
  exit;
}

$path = "https://www.google.com/recaptcha/api/siteverify?";
$postdata = http_build_query(
    array(
        'secret' => $secret,
        'response' => $captcha,
        'remoteip' => $_SERVER['REMOTE_ADDR']
    )
);
$options = array(
    'http' => array(
        'header'  => "Content-type: application/x-www-form-urlencoded\r\n",
        'method'  => 'POST',
        'content' => $postdata,
    ),
);
$context  = stream_context_create($options);


//$response = file_get_contents($path .$req);
$resp = file_get_contents($path, false, $context);

/*if($resp['success']==false)
{
  echo '<h2>You are spammer ! Get the @$%K out</h2>';
}else
{
  echo '<h2>Thanks for posting comment.</h2>';
}

var_dump($resp);
*/

if (isset ($_POST['contactFF'])) {
    if(isset($resp) && $resp['success']){
    //$output = 'Ваше сообщение получено, спасибо!';
    //$output = '<p style="color: green">Ваше сообщение получено, спасибо!</p>';

    if($_SERVER['HTTP_REFERER'] == 'http://top3dshop.ru/3d-pechat-ob-ektov.html' 
        || $_SERVER['HTTP_REFERER'] == 'http://top3dshop.ru/3d-skanirovanie.html'
		|| $_SERVER['HTTP_REFERER'] == 'http://top3dshop.ru/3d-modeling.html'
		|| $_SERVER['HTTP_REFERER'] == 'http://top3dshop.ru/silicon-molding.html'
		|| $_SERVER['HTTP_REFERER'] == 'http://top3dshop.ru/arenda.html'
		|| $_SERVER['HTTP_REFERER'] == 'http://top3dshop.ru/leasing.html'
		|| $_SERVER['HTTP_REFERER'] == 'http://top3dshop.ru/master-klass.html'
		|| $_SERVER['HTTP_REFERER'] == 'http://top3dshop.ru/obuchenie.html'
		|| $_SERVER['HTTP_REFERER'] == 'http://top3dshop.ru/servisnoe-obsluzhivanie-i-remont.html'
        || $_SERVER['HTTP_REFERER'] == 'http://test.top3dshop.ru/3d-pechat-ob-ektov.html'
        || $_SERVER['HTTP_REFERER'] == 'http://test.top3dshop.ru/3d-skanirovanie.html')
        $to = "stl@top3dshop.ru";
    else
        $to = "3d@top3dshop.ru";

    //$to = "iozjymrdclg4o5@dkimvalidator.com";
    //$to = "appigram@gmail.com";
    //$to = "hello@artzoomi.com";

    //$to = "simbiryatin@gmail.com";
    $from = $_POST['contactFF'];
    $sender = "Top3dShop.ru";
    $subject = "Заполнена контактная форма с " . $_SERVER['HTTP_REFERER'];
    $message = "Имя: " . $_POST['nameFF'] . "\nEmail: " . $from . "\nСообщение: " . $_POST['messageFF'] . "\nТелефон: ". $_POST['phoneFF'];

    $targetFolder = '/mail_attach';
    $targetPath = $_SERVER['DOCUMENT_ROOT'] . $targetFolder;
    $file_up = $_SERVER['DOCUMENT_ROOT'] . $targetFolder . '/' . $_POST['file_up'];

    $from = "noreply@top3dshop.ru";

    if (file_exists($file_up)) {


        $attachment = chunk_split(base64_encode(file_get_contents($file_up)));

        $info = new SplFileInfo($file_up);

        $filename = $info->getFilename();

        $info = new finfo(FILEINFO_MIME_TYPE);
        $filetype = $info->file($file_up);


        $boundary = md5(date('r', time()));

        $headers = "";
        
        $headers .= "MIME-Version: 1.0\n";
        $headers .= "Date: " . date('D, d M Y H:i:s O') . "\n";
        $headers .= "Message-ID: <" . sha1(microtime(true)) . "." . $from . ">\n";
        $headers .= "From: " . "" . $sender . "" . " <" . $from . ">\n";
        $headers .= "Reply-To: " . "" . $sender . "" . " <" . $from . ">\n";
        $headers .= "Return-Path: " . $from . "\n";
        $headers .= "X-Spam:  Not detected\n";
        $headers .= "X-Mailer: PHP/" . phpversion() . "\n";
        $headers .= "Content-Type: multipart/mixed; boundary=\"PHP-mixed-".$boundary."\"\n";
    ob_start();
 echo "
--PHP-mixed-$boundary
Content-Type: multipart/alternative; boundary=\"PHP-alt-$boundary\"

--PHP-alt-$boundary
Content-Type: text/plain; charset=\"utf-8\"
Content-Transfer-Encoding: 7bit

$message

--PHP-alt-$boundary--

--PHP-mixed-$boundary
Content-Type: $filetype; name=\"$filename\" 
Content-Transfer-Encoding: base64 
Content-Disposition: attachment 

$attachment
--PHP-mixed-$boundary--
";
$message = ob_get_clean();
/*
        $message = "
--_1_$boundary
Content-Type: multipart/alternative; boundary=\"_2_$boundary\"

--_2_$boundary
Content-Type: text/plain; charset=\"utf-8\"
Content-Transfer-Encoding: 7bit

$message

--_2_$boundary--

--_1_$boundary
Content-Type: \"$filetype\"; name=\"$filename\"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename=\"$filename\"

$attachment
--_1_$boundary--";
*/

    // DKIM signing section
//    $message = preg_replace('/(?<!\r)\n/', "\r\n", $message);
    $headers = preg_replace('/(?<!\r)\n/', "\r\n", $headers);
    /*require_once './scripts/mail-signature.class.php';
    require_once './scripts/mail-signature.config.php';
    $signature = new mail_signature(
        MAIL_RSA_PRIV,
        MAIL_RSA_PASSPHRASE,
        MAIL_DOMAIN,
        MAIL_SELECTOR
    );
    $signed_headers = $signature -> get_signed_headers($to, $subject, $message, $headers);
*/
    // пример использования
    require_once "./scripts/SendMailSmtpClass.php"; // подключаем класс
      
    $mailSMTP = new SendMailSmtpClass('noreply@top3dshop.ru', 'no2015', 'ssl://smtp.yandex.ru', 'Top3dShop', 465);
    // $mailSMTP = new SendMailSmtpClass('логин', 'пароль', 'хост', 'имя отправителя');
      
    $result =  $mailSMTP->send($to, $subject, $message, $headers); // отправляем письмо
    // $result =  $mailSMTP->send('Кому письмо', 'Тема письма', 'Текст письма', 'Заголовки письма');
    if($result === true){
        $output = "Ваше сообщение получено, спасибо!";
    }else{
        $output = "Письмо не отправлено. Ошибка: " . $result;
    }


    } else {
        $boundary = "----=_NextPart_" . md5(time());

        $headers = "";
        
        $headers .= "MIME-Version: 1.0\n";
        $headers .= "Date: " . date('D, d M Y H:i:s O') . "\n";
        $headers .= "Message-ID: <" . sha1(microtime(true)) . "." . $from . ">\n";
        $headers .= "From: " . "" . $sender . "" . " <" . $from . ">\n";
        $headers .= "Reply-To: " . "" . $sender . "" . " <" . $from . ">\n";
        $headers .= "Return-Path: " . $from . "\n";
        $headers .= "X-Spam:  Not detected\n";
        $headers .= "X-Mailer: PHP/" . phpversion() . "\n";
        $headers .= "Content-Type: text/plain; boundary=\"" . $boundary . "\"\n\n";

//        $message = "Content-Type: text/plain; charset=\"utf-8\"\nContent-Transfer-Encoding: 8bit\n$message";
        // DKIM signing section
        $message = preg_replace('/(?<!\r)\n/', "\r\n", $message);
        $headers = preg_replace('/(?<!\r)\n/', "\r\n", $headers);
        /*require_once './scripts/mail-signature.class.php';
        require_once './scripts/mail-signature.config.php';
        $signature = new mail_signature(
            MAIL_RSA_PRIV,
            MAIL_RSA_PASSPHRASE,
            MAIL_DOMAIN,
            MAIL_SELECTOR
        );
        $signed_headers = $signature -> get_signed_headers($to, $subject, $message, $headers);
    */
        // пример использования
        require_once "./scripts/SendMailSmtpClass.php"; // подключаем класс
          
        $mailSMTP = new SendMailSmtpClass('noreply@top3dshop.ru', 'no2015', 'ssl://smtp.yandex.ru', 'Top3dShop', 465);
        // $mailSMTP = new SendMailSmtpClass('логин', 'пароль', 'хост', 'имя отправителя');
          
        $result =  $mailSMTP->send($to, $subject, $message, $headers); // отправляем письмо
        // $result =  $mailSMTP->send('Кому письмо', 'Тема письма', 'Текст письма', 'Заголовки письма');
        if($result === true){
            $output = "Ваше сообщение получено, спасибо!";
        }else{
            $output = "Письмо не отправлено. Ошибка: " . $result;
        }
    }	
    }   
    //mail($to, '=?UTF-8?B?'.base64_encode($subject).'?=', $message, $signed_headers.$headers, "-fnoreply@top3dshop.ru");    
//    require_once './scripts/smtpmail.php';
//    smtpmail($to, '=?UTF-8?B?'.base64_encode($subject).'?=', $message, $signed_headers.$headers);    

    //mail($to, $subject, $message, $headers);

    //echo $output;
    //echo '<meta http-equiv="refresh" content="4;URL=http://top3dshop.ru">';
    echo json_encode(array("success"=>1, "output"=>$output));

    } else{
        $output = '<p style="color: red">Произошла ошибка</p>';
        echo json_encode(array("success"=>0, "output"=>$output));
        //echo $output;
        //echo '<meta http-equiv="refresh" content="4;URL='.$_SERVER['HTTP_REFERER'].'">';
    //}
    }
