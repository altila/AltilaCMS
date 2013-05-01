<?php
return array(

	//'配置项'=>'配置值'

	'SHOW_PAGE_TRACE'       => true,    // 显示页面Trace信息

	'APP_FILE_CASE'         => true,    // 是否检查文件的大小写 对Windows平台有效
	'TMPL_CACHE_ON'         => false,   // 是否开启模板编译缓存,设为false则每次都会重新编译
	'TMPL_STRIP_SPACE'      => false,   // 是否去除模板文件里面的html空格与换行
	'SHOW_ERROR_MSG'        => true,    // 显示错误信息

	/* 默认数据库设置 */
	'DB_TYPE'               => 'mysql',     // 数据库类型
	'DB_HOST'               => '127.0.0.1', // 服务器地址
	'DB_NAME'               => 'altila_base', // 数据库名
	'DB_USER'               => 'root',      // 用户名
	'DB_PWD'                => '',          // 密码
	'DB_PORT'               => '3306',      // 端口
	'DB_PREFIX'             => '',          // 数据库表前缀
	'DB_FIELDTYPE_CHECK'    => false,       // 是否进行字段类型检查
	'DB_FIELDS_CACHE'       => false,       // 启用字段缓存

	/* admin数据库设置 */
	'DB_ADMIN_CON' => array(
		'DB_TYPE'               => 'mysql',     // 数据库类型
		'DB_HOST'               => '127.0.0.1', // 服务器地址
		'DB_NAME'               => 'altila_admin', // 数据库名
		'DB_USER'               => 'root',      // 用户名
		'DB_PWD'                => '',          // 密码
		'DB_PORT'               => '3306',      // 端口
		'DB_PREFIX'             => '',          // 数据库表前缀
		'DB_FIELDTYPE_CHECK'    => false,       // 是否进行字段类型检查
		'DB_FIELDS_CACHE'       => false,       // 启用字段缓存
	),

	/* blog数据库设置*/
	'DB_BLOG_CON' => array(
		'DB_TYPE'               => 'mysql',     // 数据库类型
		'DB_HOST'               => '127.0.0.1', // 服务器地址
		'DB_NAME'               => 'altila_blog', // 数据库名
		'DB_USER'               => 'root',      // 用户名
		'DB_PWD'                => '',          // 密码
		'DB_PORT'               => '3306',      // 端口
		'DB_PREFIX'             => '',          // 数据库表前缀
		'DB_FIELDTYPE_CHECK'    => false,       // 是否进行字段类型检查
		'DB_FIELDS_CACHE'       => false,       // 启用字段缓存
	), 
	//'DB_BLOG_CON' => 'mysql://root:@127.0.0.1:3306/altila_blog',

	/* product数据库设置 */
	'DB_PRODUCT_CON' => array(
		'DB_TYPE'               => 'mysql',     // 数据库类型
		'DB_HOST'               => '127.0.0.1', // 服务器地址
		'DB_NAME'               => 'altila_product', // 数据库名
		'DB_USER'               => 'root',      // 用户名
		'DB_PWD'                => '',          // 密码
		'DB_PORT'               => '3306',      // 端口
		'DB_PREFIX'             => '',          // 数据库表前缀
		'DB_FIELDTYPE_CHECK'    => false,       // 是否进行字段类型检查
		'DB_FIELDS_CACHE'       => false,       // 启用字段缓存
	),

	/* user数据库设置 */
	'DB_USER_CON' => array(
		'DB_TYPE'               => 'mysql',     // 数据库类型
		'DB_HOST'               => '127.0.0.1', // 服务器地址
		'DB_NAME'               => 'altila_user', // 数据库名
		'DB_USER'               => 'root',      // 用户名
		'DB_PWD'                => '',          // 密码
		'DB_PORT'               => '3306',      // 端口
		'DB_PREFIX'             => '',          // 数据库表前缀
		'DB_FIELDTYPE_CHECK'    => false,       // 是否进行字段类型检查
		'DB_FIELDS_CACHE'       => false,       // 启用字段缓存
	),

);
?>
