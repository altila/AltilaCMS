<?php
return array(
	'APP_DEBUG'    =>	1,
	'SHOW_ERROR_MSG'        => true,
    'URL_MODEL'=>2,
    'JUST_ONE_APP'=>'home', // 单一部署应用默认门户应用
	'APP_SUB_DOMAIN_DEPLOY'=>true, // 开启子域名部署
	'APP_SUB_DOMAIN_RULES'=>array(
		'prviews'=>array('prview'), // 预览模式
		'*'=>array('store','store=*'), // 门店应用公用一个App
	),
	'APP_FILE_CASE'   => true,
    'VDEPOT_CODE'     => '01',
    'URL_HTML_SUFFIX' => 'shtml',
    'URL_PATHINFO_DEPR'=>'/',
    'TMPL_CACHE_ON'=>false,
    'STRIP_RUNTIME_SPACE'=>false,
    
	
	'DB_CONFIGS'=>array(
		/*openshop*/
		'default'=>array(
			'dbms'=>'mysql',
			'username'=>'openmall',
			'password'=>'123',
			'hostname'=>'10.100.200.22:3307',
			//'username'=>'admin',
			//'password'=>'admin52',
			//'hostname'=>'192.168.149.52',
			'hostport'=>'3306',
			'database'=>'openshop',
			//'database'=>'bgcmsdb',
			'charset'=>'utf8',
			'prefix'=>'think_',
			'suffix'=>'',
			'deploy'=>1,
			'rw_separate'=>true
		), 


	),


 	'TAGLIB_BUILD_IN'       =>'think,cx,Ibanggo',
	
	'USER_ID_COOKIETIME'=>3600,//用户ID保存cookie过期时间
	'AUTOLOGINUSER_COOKIETIME'=>3600,//自动登录cookie过期时间
	
    

	/* Cookie设置 */
    'COOKIE_EXPIRE'         => 86400,    // Coodie有效期
    'COOKIE_DOMAIN'         => '.chenqiang.com',      // Cookie有效域名
    'COOKIE_PATH'           => '/',     // Cookie路径
    'COOKIE_PREFIX'         => 'banggo_',      // Cookie前缀 避免冲突
    'MUCH_DOMAIN'           =>true,
 
	'DOMAIN' => 'chenqiang.com', 
    'URL_ROUTER_ON'=>true,
   'HTML_CACHE_ON'=>false,
   'CACHE_TYPE'=>'file',
   'HTML_PATH'=>'./b/',
   'LOAD_EXT_CONFIG' =>'ext.php',
   'SEARCH_URL' =>'http://meterbonwer.chenqiang.com',
    


);
?>

