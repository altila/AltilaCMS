<?php

/**
+----------------------------------------------------------
* 获取静态文件
+----------------------------------------------------------
* @access  public
* @param   string      $files
* @param   string      $folder
+----------------------------------------------------------
* @return  string
+----------------------------------------------------------
* @example get_static_file(array('jquery-1.4.3.min.js','jquery_cookie.js'),'public')
+----------------------------------------------------------
*/
function get_static_file( $files, $folder ){
	/*静态文件版本号*/
	$staticVision =
		array(
			/*public*/
			'public-jquery-1.4.3.min.js'=>'',
			'public-jquery_cookie.js'=>'',
			'public-common.js'=>'',
			/*admin*/
			'admin-login.css'=>'',
		);
	$folder = !empty($folder) ? trim($folder,'/') : 'default';
	$files = is_array($files) ? $files : (array)$files;
	foreach ( $files as $key => $value ) {
		$paras = explode('.', $value);
		$filetype = strtolower( $paras[count($paras) - 1] );
		//若指定目录,则文件前加目录前缀
		$keyValue = !empty($folder) ? "{$folder}-{$value}" : $value;
		switch( $filetype ){
			case 'css' :
				$result[] = "<link rel=\"stylesheet\" type=\"text/css\" href=\"__PUBLIC__/{$folder}/{$filetype}/{$value}" . ( !empty($staticVision[$keyValue]) ? "?vsion={$staticVision[$keyValue]}" : '' ) . "\"/>";
			break;
			case 'js' :
				$result[] = "<script type=\"text/javascript\" src=\"__PUBLIC__/{$folder}/{$filetype}/{$value}" . ( !empty($staticVision[$keyValue]) ? "?vsion={$staticVision[$keyValue]}" : '' ) . "\"></script>";
			break;
		}
	}
	return implode('',$result);
}




?>
