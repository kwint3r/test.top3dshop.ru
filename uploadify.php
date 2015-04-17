<?php
/*
Uploadify
Copyright (c) 2012 Reactive Apps, Ronnie Garcia
Released under the MIT License <http://www.opensource.org/licenses/mit-license.php> 
*/
// Define a destination
$targetFolder = '/mail_attach'; // Relative to the root

$verifyToken = md5('unique_salt' . $_POST['timestamp']);
$verifyToken1 = 'us' . $_POST['timestamp'];

$targetPath = $_SERVER['DOCUMENT_ROOT'] . $targetFolder;
if (!empty($_FILES) && ($_POST['token'] == $verifyToken || $_POST['token'] == $verifyToken1 )) {
	$tempFile = $_FILES['Filedata']['tmp_name'];
	$targetPath = $_SERVER['DOCUMENT_ROOT'] . $targetFolder;
	$targetFile = rtrim($targetPath,'/') . '/' . $_FILES['Filedata']['name'];
	
	// Validate the file type

	$fileTypes = array('jpg','jpeg','gif','png', 'stl', 'doc', 'docx', 'xls', 'xlsx', 'ppt',
        'pptx', 'txt', 'odf', 'xml', 'rtf', 'pdf', 'djvu', 'pdf', 'xps', 'obj', 'ply', 'wrl', 'stl', 'aop', 'ascii', 'ptx', 'e57', 'xyzrgb', 'csv', 'dxf'); // File extensions
	$fileParts = pathinfo($_FILES['Filedata']['name']);

	if (in_array(strtolower($fileParts['extension']),$fileTypes)) {
		move_uploaded_file($tempFile,$targetFile);
        echo $_FILES['Filedata']['name'];
	} else {
		echo '0';
	}
}