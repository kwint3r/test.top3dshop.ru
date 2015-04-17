<?php
// Heading
$_['heading_title']       = '<b style="color: #38B0E3">SeoPro</b>';

// Text
$_['text_module']			= 'Модули';
$_['button_add']			= 'Добавить';

$_['column_query']			= 'Часть запроса';
$_['column_keyword']		= 'ЧПУ';
$_['column_action']			= 'Действия';
$_['text_edit']				= 'Редактировать';
$_['text_delete']			= 'Удалить';
$_['text_save']				= 'Сохранить';
$_['text_cancel']			= 'Отмена';

// Error
$_['error_permission']		= 'У Вас нет прав для изменения модуля SeoPro!';
$_['error_htaccess']			= 'Файл .htaccess.txt не переименован в .htaccess';
$_['error_seo_url']			= 'ЧПУ не включен!';
$_['error_seopro']			= 'Замените в файле index.php строку<br/>
$controller->addPreAction(new Action(\'common/seo_url\'));<br/>
на следующее<br/>
if (!$seo_type = $config->get(\'config_seo_url_type\')) {<br/>
	$seo_type = \'seo_url\';<br/>
}<br/>
$controller->addPreAction(new Action(\'common/\' . $seo_type));';
$_['error_seo_url_type']	= 'Не выбран Тип ЧПУ SeoPro!';
?>