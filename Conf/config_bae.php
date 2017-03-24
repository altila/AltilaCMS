<?php
//BAE下固定mysql配置
return array(

	/* 路径自定义变量 */
	'TMPL_PARSE_STRING'     => array(
		'__UPLOAD__'        => file_domain('altila-uploads'), // 文件上传路径
	),
	'__UPLOAD__'            => file_domain('altila-uploads'), // 文件上传路径

	/* 默认数据库设置 */
	'DB_TYPE'               => 'mysql',     // 数据库类型
	'DB_HOST'               => HTTP_BAE_ENV_ADDR_SQL_IP,    // 服务器地址
	'DB_NAME'               => 'lTSFQcmffodWAfccYXfD',      // 数据库名
	'DB_USER'               => HTTP_BAE_ENV_AK,             // 用户名
	'DB_PWD'                => HTTP_BAE_ENV_SK,             // 密码
	'DB_PORT'               => HTTP_BAE_ENV_ADDR_SQL_PORT,  // 端口
	'DB_PREFIX'             => '',          // 数据库表前缀
	'DB_FIELDTYPE_CHECK'    => false,       // 是否进行字段类型检查
	'DB_FIELDS_CACHE'       => false,       // 启用字段缓存

	/* admin数据库设置 */
	'DB_ADMIN_CON' => array(
		'DB_TYPE'               => 'mysql',     // 数据库类型
		'DB_HOST'               => HTTP_BAE_ENV_ADDR_SQL_IP,    // 服务器地址
		'DB_NAME'               => 'lTSFQcmffodWAfccYXfD',      // 数据库名
		'DB_USER'               => HTTP_BAE_ENV_AK,             // 用户名
		'DB_PWD'                => HTTP_BAE_ENV_SK,             // 密码
		'DB_PORT'               => HTTP_BAE_ENV_ADDR_SQL_PORT,  // 端口
		'DB_PREFIX'             => '',          // 数据库表前缀
		'DB_FIELDTYPE_CHECK'    => false,       // 是否进行字段类型检查
		'DB_FIELDS_CACHE'       => false,       // 启用字段缓存
	),

	/* blog数据库设置*/
	'DB_BLOG_CON' => array(
		'DB_TYPE'               => 'mysql',     // 数据库类型
		'DB_HOST'               => HTTP_BAE_ENV_ADDR_SQL_IP,    // 服务器地址
		'DB_NAME'               => 'lTSFQcmffodWAfccYXfD',      // 数据库名
		'DB_USER'               => HTTP_BAE_ENV_AK,             // 用户名
		'DB_PWD'                => HTTP_BAE_ENV_SK,             // 密码
		'DB_PORT'               => HTTP_BAE_ENV_ADDR_SQL_PORT,  // 端口
		'DB_PREFIX'             => '',          // 数据库表前缀
		'DB_FIELDTYPE_CHECK'    => false,       // 是否进行字段类型检查
		'DB_FIELDS_CACHE'       => false,       // 启用字段缓存
	), 
	//'DB_BLOG_CON' => 'mysql://root:@127.0.0.1:3306/altila_blog',

	/* product数据库设置 */
	'DB_PRODUCT_CON' => array(
		'DB_TYPE'               => 'mysql',     // 数据库类型
		'DB_HOST'               => HTTP_BAE_ENV_ADDR_SQL_IP,    // 服务器地址
		'DB_NAME'               => 'lTSFQcmffodWAfccYXfD',      // 数据库名
		'DB_USER'               => HTTP_BAE_ENV_AK,             // 用户名
		'DB_PWD'                => HTTP_BAE_ENV_SK,             // 密码
		'DB_PORT'               => HTTP_BAE_ENV_ADDR_SQL_PORT,  // 端口
		'DB_PREFIX'             => '',          // 数据库表前缀
		'DB_FIELDTYPE_CHECK'    => false,       // 是否进行字段类型检查
		'DB_FIELDS_CACHE'       => false,       // 启用字段缓存
	),

	/* user数据库设置 */
	'DB_USER_CON' => array(
		'DB_TYPE'               => 'mysql',     // 数据库类型
		'DB_HOST'               => HTTP_BAE_ENV_ADDR_SQL_IP,    // 服务器地址
		'DB_NAME'               => 'lTSFQcmffodWAfccYXfD',      // 数据库名
		'DB_USER'               => HTTP_BAE_ENV_AK,             // 用户名
		'DB_PWD'                => HTTP_BAE_ENV_SK,             // 密码
		'DB_PORT'               => HTTP_BAE_ENV_ADDR_SQL_PORT,  // 端口
		'DB_PREFIX'             => '',          // 数据库表前缀
		'DB_FIELDTYPE_CHECK'    => false,       // 是否进行字段类型检查
		'DB_FIELDS_CACHE'       => false,       // 启用字段缓存
	),

);
