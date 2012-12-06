<?php
return array(
	'APP_DEBUG'             => 1,
	'SHOW_ERROR_MSG'        => true,
    'URL_MODEL'             => 2,
    'JUST_ONE_APP'          => 'home', // 单一部署应用默认门户应用
	'APP_SUB_DOMAIN_DEPLOY' => true,   // 开启子域名部署
	'APP_SUB_DOMAIN_RULES'  => array(
		'prviews'=> array('prview'),   // 预览模式
		'admin'  => array('admin'),    // 后台管理
		//'*'      => array('store','store=*'), // 门店应用公用一个App
	),
	'APP_FILE_CASE'    => true,
    'URL_HTML_SUFFIX'  => 'html',
    'TMPL_CACHE_ON'    => false,
    'STRIP_RUNTIME_SPACE'=> false,
    
	
	'DB_CONFIGS'=>array(
		/*默认主库*/
		'default' => array(
			'dbms'        => 'mysql',
			'username'    => 'root',
			'password'    => '',
			'hostname'    => '127.0.0.1',
			'hostport'    => '3306',
			'database'    => 'altilaphp',
			'charset'     => 'utf8',
			'prefix'      => 'think_',
			'suffix'      => '',
			'deploy'      => 1,
			'rw_separate' => true
		), 


	),


	'TAGLIB_BUILD_IN'       =>'think,cx,Ibanggo',
	/* Cookie设置 */
	'COOKIE_EXPIRE'         => 86400,    // Coodie有效期
	'COOKIE_DOMAIN'         => strchr($_SERVER['HTTP_HOST'],'.'),      // Cookie有效域名
	'MUCH_DOMAIN'           => true,

	'DOMAIN' => strchr($_SERVER['HTTP_HOST'],'.'), //域名
	'URL_ROUTER_ON' => true,
	'HTML_CACHE_ON' => false,
	'CACHE_TYPE' => 'file',
	'HTML_PATH' => './b/',
	'LOAD_EXT_CONFIG' => 'staticFile.php',
    

	//自定义变量
	'USER_AUTH_KEY'  =>  'loginUser',//存储在SESSION中的用户登陆信息

);
?>

