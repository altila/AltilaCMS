<?php

/**
+----------------------------------------------------------
* 配置
+----------------------------------------------------------
* @param   sting   host    SMTP地址
* @param   int     port    SMTP端口：25、465、587
+----------------------------------------------------------
*/

$config = array(

	// 调试类型：0为关闭，1为客户端信息，2客户端和服务端信息
	'MAIL_DEBUG' => 0,

	//126配置
	'MAIL_SDK_126' => array(
		'host'    => 'smtp.126.com',
		'port'    => 25,
	),

	//163配置
	'MAIL_SDK_163' => array(
		'host'    => 'smtp.163.com',
		'port'    => 25,
	),

	//QQ配置
	'MAIL_SDK_QQ' => array(
		'host'    => 'smtp.qq.com',
		'port'    => 25,
	),

	//SINA配置
	'MAIL_SDK_SINA' => array(
		'host'    => 'smtp.sina.com',
		'port'    => 25,
	),



);
?>

