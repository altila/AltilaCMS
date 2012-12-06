<?php
define('STATIC_CSS_FOLDER', 'style/css');
define('STATIC_JS_FOLDER', 'style/js');

/**
+----------------------------------------------------------
* 获取静态文件
+----------------------------------------------------------
*/
function get_static_file($files, $customBaseFolder = NULL){
	/*静态文件版本号*/
	$static_vision =
		array(
			/*css*/
			'index.css'=>'20110427',
			/*js*/
			'jquery-1.4.2.min.js'=>'',
			'common.js'=>'',
		);
	$files = is_array($files) ? $files : (array) $files;

	if (empty($customBaseFolder)) {
		$cssFolder = STATIC_CSS_FOLDER;
		$jsFolder = STATIC_JS_FOLDER;
	}else{
		$customBaseFolder = trim($customBaseFolder, '/');
		$cssFolder = $customBaseFolder.'/css';
		$jsFolder = $customBaseFolder.'/js';
	}

	foreach ($files as $v) {
		$paras = explode('.', $v); //dump ( $paras );
		$filetype = $paras[count($paras) - 1]; //dump ( $filetype );
		array_pop($paras);

		$static_list = $static_vision;
		$file_full_name = $v;

		if(!empty($customBaseFolder)){
			//如果要给指定目录下的文件设定版本号，在文件列表中的形式为 '-folder->file.js' => 1999
			$v = $customBaseFolder.'-'.$v;
		}

		if (strtolower($filetype) === 'css') {
			$print_str[] = '<link rel="stylesheet" type="text/css" href="' . __PUBLIC__ . '/' . $cssFolder . '/' . $file_full_name . '?vsion=' . $static_list[$v] . '" />';
		} else if (strtolower($filetype) === 'js') {
			$print_str[] = '<script type="text/javascript" src="' . __PUBLIC__ . '/' . $jsFolder . '/' . $file_full_name . '?vsion=' . $static_list[$v] . '"></script>';
		}
	}
	return implode('', $print_str);
}




?>
