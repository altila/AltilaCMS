<?php
return array(

	//'配置项'=>'配置值'

	/* 模式切换 */
	//'APP_STATUS'            => 'debug',           // 应用调试模式状态,将自动加载对应的配置文件,如:debug、test、deploy,默认为debug

	/* 分组设置 */
	// 项目分组设定,多个组之间用逗号分隔,例如'Home,Admin'
	'APP_GROUP_LIST'        => 'Passport,Admin,Home,AdminBase,AdminBlog,Blog,AdminUser,AdminAd,AdminProduct',
	'APP_GROUP_MODE'        => 1,                 // 分组模式 0 普通分组 1 独立分组

	/* 语言设置 */
	'LANG_SWITCH_ON'        => true,        // 默认关闭语言包功能
	'LANG_LIST'             => 'zh-cn,en-us,zh-tw', // 允许切换的语言列表 用逗号分隔

	/* 日志设置 */
	'LOG_RECORD'            => true,        // 默认不记录日志
	'LOG_TYPE'              => 3,           // 日志记录类型 0 系统 1 邮件 3 文件 4 SAPI 默认为文件方式
	'LOG_LEVEL'             => 'EMERG,ALERT,CRIT,ERR,WARN,INFO,DEBUG,SQL', // 允许记录的日志级别:EMERG,ALERT,CRIT,ERR,WARN,NOTIC,INFO,DEBUG,SQL
	'LOG_EXCEPTION_RECORD'  => true,        // 是否记录异常信息日志

	/* 数据缓存设置 */
	'DATA_CACHE_TIME'       => 0,           // 数据缓存有效期 0表示永久缓存
	'DATA_CACHE_COMPRESS'   => false,       // 数据缓存是否压缩缓存
	'DATA_CACHE_CHECK'      => false,       // 数据缓存是否校验缓存
	'DATA_CACHE_PATH'       => TEMP_PATH.ltrim( strchr($_SERVER['HTTP_HOST'],'.'), '.' ),   // 缓存路径设置 (仅对File方式缓存有效)

	/* Cookie设置 */
	'COOKIE_EXPIRE'         => 86400,       // Coodie有效期
	'COOKIE_DOMAIN'         => strchr($_SERVER['HTTP_HOST'],'.'),      // Cookie有效域名
	//'COOKIE_PATH'           => '/',         // Cookie路径
	//'COOKIE_PREFIX'         => '',          // Cookie前缀 避免冲突

	/* 数据库 配置 */
	// 若使用原生SQL,写操作需用execute方法,读操作需用query方法，否则会发生主从读写错乱的情况。
	'DB_DEPLOY_TYPE'        => 1,           // 数据库部署方式:0 集中式(单一服务器),1 分布式(主从服务器)
	'DB_RW_SEPARATE'        => true,        // 数据库读写是否分离 主从式有效
	'DB_MASTER_NUM'         => 1,           // 读写分离后 主服务器数量
	'DB_SLAVE_NO'           => '',          // 指定从服务器序号
	'DB_SQL_BUILD_CACHE'    => false,       // 数据库查询的SQL创建缓存
	'DB_SQL_BUILD_QUEUE'    => 'file',      // SQL缓存队列的缓存方式 支持 file xcache和apc
	'DB_SQL_BUILD_LENGTH'   => 20,          // SQL缓存的队列长度
	'DB_SQL_LOG'            => true,        // SQL执行日志记录

	/* 模板配置 */
	'DEFAULT_THEME'         => 'default',   // 默认模板主题名称
	'TMPL_DETECT_THEME'     => false,       // 自动侦测模板主题
	'TAGLIB_BUILD_IN'       => 'cx,model',  // 内置标签库名称(标签使用不必指定标签库名称),以逗号分隔 注意解析顺序
	//'TAGLIB_PRE_LOAD'       =>  'model',   // 需要额外加载的标签库(须指定标签库名称)，多个以逗号分隔

	/* 路由配置 */
	'URL_ROUTER_ON'         => true,   // 是否开启URL路由
	'URL_ROUTE_RULES'       => array(  // 默认路由规则，注：分组配置无法替代
		'/^ArticleInfo\/(\d+)$/' => 'Home/ArticleInfo/index?aiid=:1',
		'/^ArticleCategory\/(\d+)_(\d*)$/' => 'Home/ArticleCategory/index?smid=:1&cp=:2',
		'/^Blog\/BlogInfo\/(\d+)$/' => 'Blog/BlogInfo/index?biid=:1',
		'/^Blog\/BlogCategory\/(\d+)_(\d*)$/' => 'Blog/BlogCategory/index?smid=:1&cp=:2',
	),

	/* 其他配置 */
	'OUTPUT_ENCODE'         => false,       // 页面压缩输出
	'LOAD_EXT_CONFIG'       => 'staticFile,AConfig,cacheKey,debug',// 加载自定义的动态配置文件,多个文件之间用逗号分隔
	'LOAD_EXT_FILE'         => 'AFunction',  // 加载自定义的动态配置文件,多个文件之间用逗号分隔
	//'APP_AUTOLOAD_PATH'     => '',     // 自动加载机制的自动搜索路径,注意搜索顺序

	/* 自定义变量 */
	'TMPL_PARSE_STRING'     => array(
		'__UPLOAD__'            => '/Uploads',     // 文件上传路径
		'__BRANDLOGO__'         => '/Public/brandLogo', // 品牌图片路径
	),
	'__UPLOAD__'            => APP_PATH.'Uploads', // 文件上传路径
	'__BRANDLOGO__'         => APP_PATH.'Public/brandLogo', // 品牌图片路径
	'USER_AUTH_KEY'         => 'loginUser',    // 存储在SESSION中的用户登陆信息
	'DOMAIN'                => ltrim( strchr($_SERVER['HTTP_HOST'],'.'), '.' ), // 域名,前不带'.'
	'DEFAULT_IMG'           => '__PUBLIC__/public/images/grey.gif', // 默认图片
	'DATA_CACHE_TYPE_ARRAY' => 'File,Apachenote,Apc,Eaccelerator,Memcache,Shmop,Sqlite,Db,Redis,Xcache',// 数据缓存类型
	// 导航类型
	'MENU_TYPE'             => array(
		'1' => array( 'appName'=>'Home', 'name'=>'Article', 'cateModel'=>'Category', 'infoModel'=>'Info' ),
		'3' => array( 'appName'=>'Product', 'name'=>'Product', 'cateModel'=>'Category', 'infoModel'=>'Info' ),
		'4' => array( 'appName'=>'Blog', 'name'=>'Blog', 'cateModel'=>'Category', 'infoModel'=>'Info' ),
	),


);
?>
