<?php
return array(

	//'配置项'=>'配置值'

	'SHOW_PAGE_TRACE'       => true,    // 显示页面Trace信息

	'APP_FILE_CASE'         => true,    // 是否检查文件的大小写 对Windows平台有效
	'TMPL_CACHE_ON'         => false,   // 是否开启模板编译缓存,设为false则每次都会重新编译
	'TMPL_STRIP_SPACE'      => false,   // 是否去除模板文件里面的html空格与换行
	'SHOW_ERROR_MSG'        => true,    // 显示错误信息

	/* 默认数据库设置*/
	'DB_TYPE'               => 'pdo',     // 数据库类型
	'DB_HOST'               => 'localhost', // 服务器地址
	'DB_NAME'               => 'altilacms', // 数据库名
	'DB_USER'               => 'root',      // 用户名
	'DB_PWD'                => '',          // 密码
	'DB_PORT'               => '3306',      // 端口
	'DB_PREFIX'             => '',          // 数据库表前缀
	'DB_FIELDTYPE_CHECK'    => false,       // 是否进行字段类型检查
	'DB_FIELDS_CACHE'       => false,       // 启用字段缓存
	'DB_CHARSET'            => 'utf8',
	'DB_DSN'                => 'mysql:host=127.0.0.1;dbname=altilacms;charset=utf8',

	/* admin数据库设置 */
	'DB_ADMIN_CON' => array(
		'DB_TYPE'               => 'pdo',     // 数据库类型
		'DB_HOST'               => 'localhost', // 服务器地址
		'DB_NAME'               => 'altilacms', // 数据库名
		'DB_USER'               => 'root',      // 用户名
		'DB_PWD'                => '',          // 密码
		'DB_PORT'               => '3306',      // 端口
		'DB_PREFIX'             => '',          // 数据库表前缀
		'DB_FIELDTYPE_CHECK'    => false,       // 是否进行字段类型检查
		'DB_FIELDS_CACHE'       => false,       // 启用字段缓存
		'DB_CHARSET'            => 'utf8',
		'DB_DSN'                => 'mysql:host=127.0.0.1;dbname=altilacms;charset=utf8',
	),

	/* blog数据库设置*/
	'DB_BLOG_CON' => array(
		'DB_TYPE'               => 'pdo',     // 数据库类型
		'DB_HOST'               => 'localhost', // 服务器地址
		'DB_NAME'               => 'altilacms', // 数据库名
		'DB_USER'               => 'root',      // 用户名
		'DB_PWD'                => '',          // 密码
		'DB_PORT'               => '3306',      // 端口
		'DB_PREFIX'             => '',          // 数据库表前缀
		'DB_FIELDTYPE_CHECK'    => false,       // 是否进行字段类型检查
		'DB_FIELDS_CACHE'       => false,       // 启用字段缓存
		'DB_CHARSET'            => 'utf8',
		'DB_DSN'                => 'mysql:host=127.0.0.1;dbname=altilacms;charset=utf8',
	), 

	/* product数据库设置 */
	'DB_PRODUCT_CON' => array(
		'DB_TYPE'               => 'pdo',     // 数据库类型
		'DB_HOST'               => 'localhost', // 服务器地址
		'DB_NAME'               => 'altilacms', // 数据库名
		'DB_USER'               => 'root',      // 用户名
		'DB_PWD'                => '',          // 密码
		'DB_PORT'               => '3306',      // 端口
		'DB_PREFIX'             => '',          // 数据库表前缀
		'DB_FIELDTYPE_CHECK'    => false,       // 是否进行字段类型检查
		'DB_FIELDS_CACHE'       => false,       // 启用字段缓存
		'DB_CHARSET'            => 'utf8',
		'DB_DSN'                => 'mysql:host=127.0.0.1;dbname=altilacms;charset=utf8',
	),

	/* user数据库设置 */
	'DB_USER_CON' => array(
		'DB_TYPE'               => 'pdo',     // 数据库类型
		'DB_HOST'               => 'localhost', // 服务器地址
		'DB_NAME'               => 'altilacms', // 数据库名
		'DB_USER'               => 'root',      // 用户名
		'DB_PWD'                => '',          // 密码
		'DB_PORT'               => '3306',      // 端口
		'DB_PREFIX'             => '',          // 数据库表前缀
		'DB_FIELDTYPE_CHECK'    => false,       // 是否进行字段类型检查
		'DB_FIELDS_CACHE'       => false,       // 启用字段缓存
		'DB_CHARSET'            => 'utf8',
		'DB_DSN'                => 'mysql:host=127.0.0.1;dbname=altilacms;charset=utf8',
	),

	/* system数据库设置 */
	'DB_SYSTEM_CON' => array(
		'DB_TYPE'               => 'pdo',     // 数据库类型
		'DB_HOST'               => 'localhost', // 服务器地址
		'DB_NAME'               => 'altilacms', // 数据库名
		'DB_USER'               => 'root',      // 用户名
		'DB_PWD'                => '',          // 密码
		'DB_PORT'               => '3306',      // 端口
		'DB_PREFIX'             => '',          // 数据库表前缀
		'DB_FIELDTYPE_CHECK'    => false,       // 是否进行字段类型检查
		'DB_FIELDS_CACHE'       => false,       // 启用字段缓存
		'DB_CHARSET'            => 'utf8',
		'DB_DSN'                => 'mysql:host=127.0.0.1;dbname=altilacms;charset=utf8',
	),

	/* finance数据库设置 */
	'DB_FINANCE_CON' => array(
		'DB_TYPE'               => 'pdo',     // 数据库类型
		'DB_HOST'               => 'localhost', // 服务器地址
		'DB_NAME'               => 'altilacms_finance', // 数据库名
		'DB_USER'               => 'root',      // 用户名
		'DB_PWD'                => '',          // 密码
		'DB_PORT'               => '3306',      // 端口
		'DB_PREFIX'             => '',          // 数据库表前缀
		'DB_FIELDTYPE_CHECK'    => false,       // 是否进行字段类型检查
		'DB_FIELDS_CACHE'       => false,       // 启用字段缓存
		'DB_CHARSET'            => 'utf8',
		'DB_DSN'                => 'mysql:host=127.0.0.1;dbname=altilacms_finance;charset=utf8',
	),

	/* log数据库设置 */
	'DB_LOG_CON' => array(
		'DB_TYPE'               => 'pdo',     // 数据库类型
		'DB_HOST'               => 'localhost', // 服务器地址
		'DB_NAME'               => 'altilacms_log', // 数据库名
		'DB_USER'               => 'root',      // 用户名
		'DB_PWD'                => '',          // 密码
		'DB_PORT'               => '3306',      // 端口
		'DB_PREFIX'             => '',          // 数据库表前缀
		'DB_FIELDTYPE_CHECK'    => false,       // 是否进行字段类型检查
		'DB_FIELDS_CACHE'       => false,       // 启用字段缓存
		'DB_CHARSET'            => 'utf8',
		'DB_DSN'                => 'mysql:host=127.0.0.1;dbname=altilacms_log;charset=utf8',
	),

	/* backup数据库设置 */
	'DB_BACKUP_CON' => array(
		'DB_TYPE'               => 'pdo',     // 数据库类型
		'DB_HOST'               => 'localhost', // 服务器地址
		'DB_NAME'               => 'altilacms_bak', // 数据库名
		'DB_USER'               => 'root',      // 用户名
		'DB_PWD'                => '',          // 密码
		'DB_PORT'               => '3306',      // 端口
		'DB_PREFIX'             => '',          // 数据库表前缀
		'DB_FIELDTYPE_CHECK'    => false,       // 是否进行字段类型检查
		'DB_FIELDS_CACHE'       => false,       // 启用字段缓存
		'DB_CHARSET'            => 'utf8',
		'DB_DSN'                => 'mysql:host=127.0.0.1;dbname=altilacms_bak;charset=utf8',
	),
);
?>
