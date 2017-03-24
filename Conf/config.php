<?php
return array(

	//'配置项'=>'配置值'

	/* 模式切换 */
    'APP_STATUS'            => 'deploy',           // 应用调试模式状态,将自动加载对应的配置文件,如:debug、test、deploy,默认为debug

	/* 分组设置 */
    'DEFAULT_GROUP'         => 'Base',  // 默认分组
	'APP_GROUP_LIST'        => 'Admin,Base,BaseAdmin,BaseService,Blog,BlogAdmin,BlogService,User,UserAdmin,UserService,Product,ProductAdmin,ProductService,System,SystemAdmin,SystemService,Finance,FinanceAdmin,FinanceService,Collect,Api',          // 项目分组设定,多个组之间用逗号分隔,例如'Home,Admin'
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
	'TMPL_DETECT_THEME'     => true,        // 自动侦测模板主题
	'THEME_LIST'            => 'default,' . substr( strchr($_SERVER['HTTP_HOST'],'.'), 1, strpos(strchr($_SERVER['HTTP_HOST'],'.'),'.',1)-1 ), 
	'TAGLIB_BUILD_IN'       => 'cx,model',  // 内置标签库名称(标签使用不必指定标签库名称),以逗号分隔 注意解析顺序
	//'TAGLIB_PRE_LOAD'       =>  'model',   // 需要额外加载的标签库(须指定标签库名称)，多个以逗号分隔

	/* 数据库设置备份
	'DB_HOST'               => 'mysql.sql108.cdncenter.net', // 服务器地址
	'DB_NAME'               => 'sq_altilacms',      // 数据库名
	'DB_USER'               => 'sq_altilacms',      // 用户名
	'DB_PWD'                => 'a1l9t8i8l7a25',     // 密码

	'DB_HOST'               => 'localhost', // 服务器地址
	'DB_NAME'               => 'altilacms', // 数据库名
	'DB_USER'               => 'root',      // 用户名
	'DB_PWD'                => '',          // 密码
	 */



	/* 路由配置 */
	'URL_ROUTER_ON'         => true,   // 是否开启URL路由
	'URL_ROUTE_RULES'       => array(  // 默认路由规则，注：分组配置无法替代
		'/^ArticleInfo\/(\d+)$/'                    => 'Base/ArticleInfo/index?aiid=:1&iid=:1',
		'/^ArticleCategory\/(\d+)_(\d*)$/'          => 'Base/ArticleCategory/index?smid=:1&currentPage=:2',
		'/^PictureCategory\/(\d+)_(\d*)$/'          => 'Base/PictureCategory/index?smid=:1&currentPage=:2',
		'/^Blog\/BlogInfo\/(\d+)$/'                 => 'Blog/BlogInfo/index?biid=:1&iid=:1',
		'/^Blog\/BlogCategory\/(\d+)_(\d*)$/'       => 'Blog/BlogCategory/index?smid=:1&currentPage=:2',
		'/^Product\/ProductInfo\/(\d+)$/'           => 'Product/ProductInfo/index?piid=:1&iid=:1',
		'/^Product\/ProductCategory\/(\d+)_(\d*)$/' => 'Product/ProductCategory/index?smid=:1&currentPage=:2',
		'/^JobCategory\/(\d+)_(\d*)$/'              => 'Base/JobCategory/index?smid=:1&currentPage=:2',
		'/^FormCategory\/(\d+)_(\d*)$/'             => 'Base/FormCategory/index?smid=:1&currentPage=:2',
	),

	/* 其他配置 */
	'OUTPUT_ENCODE'         => false,       // 页面压缩输出
	'LOAD_EXT_CONFIG'       => 'staticFile,AConfig,cacheKey',// 加载自定义的动态配置文件,多个文件之间用逗号分隔
	'LOAD_EXT_FILE'         => 'AFunction',  // 加载自定义的动态配置文件,多个文件之间用逗号分隔
	//'APP_AUTOLOAD_PATH'     => '',     // 自动加载机制的自动搜索路径,注意搜索顺序

	/* 路径自定义变量 */
	'TMPL_PARSE_STRING'     => array(
		'__UPLOAD__'            => '/Uploads',     // 文件上传路径
		'__BRANDLOGO__'         => '/Public/brandLogo', // 品牌图片路径
		'__CSS_IMG__'           => '/Public/' . substr( strchr($_SERVER['HTTP_HOST'],'.'), 1, strpos(strchr($_SERVER['HTTP_HOST'],'.'),'.',1)-1 ) . '/images', // 样式图片路径
	),
	'__UPLOAD__'            => APP_PATH.'Uploads', // 文件上传路径
	'__BRANDLOGO__'         => APP_PATH.'Public/brandLogo', // 品牌图片路径
	'__CSS_IMG__'           => '/Public/' . substr( strchr($_SERVER['HTTP_HOST'],'.'), 1, strpos(strchr($_SERVER['HTTP_HOST'],'.'),'.',1)-1 ) . '/images', // 样式图片路径

	/* 自定义变量 */
	'USER_AUTH_KEY'         => 'loginUser',    // 存储在SESSION中的用户登陆信息
	'DOMAIN'                => ltrim( strchr($_SERVER['HTTP_HOST'],'.'), '.' ), // 域名,前不带'.'
	'DATA_CACHE_TYPE_ARRAY' => 'File,Apachenote,Apc,Eaccelerator,Memcache,Shmop,Sqlite,Db,Redis,Xcache',// 数据缓存类型
	'DEFAULT_IMG'           => '__PUBLIC__/public/images/grey.gif', // 默认图片
	'APPDCODE'              => 1,// 设备编码
	// 模块名称
	'MODULE_LIST'           => array(
		'0'         => array( 'name'=>'广告', 'code'=>'Ad' ),
		'1'         => array( 'name'=>'文章', 'code'=>'Article' ),
		'2'         => array( 'name'=>'图片', 'code'=>'Picture' ),
		'3'         => array( 'name'=>'产品', 'code'=>'Product' ),
		'4'         => array( 'name'=>'博文', 'code'=>'Blog' ),
		'5'         => array( 'name'=>'小说', 'code'=>'Novel' ),
		'6'         => array( 'name'=>'招聘', 'code'=>'Job' ),
		'7'         => array( 'name'=>'表单', 'code'=>'Form' ),
		'8'         => array( 'name'=>'理财', 'code'=>'Finance' ),
	),

	'UEDITOR_CONFIG'                     => array(
		/* 上传图片配置项 */
		"imageActionName"        => "uploadimage", /* 执行上传图片的action名称 */
		"imageFieldName"         => "upfile", /* 提交的图片表单名称 */
		"imageMaxSize"           => 2048000, /* 上传大小限制，单位B */
		"imageAllowFiles"        => array( ".png", ".jpg", ".jpeg", ".gif", ".bmp" ), /* 上传图片格式显示 */
		"imageCompressEnable"    => true, /* 是否压缩图片,默认是true */
		"imageCompressBorder"    => 1600, /* 图片压缩最长边限制 */
		"imageInsertAlign"       => "none", /* 插入的图片浮动方式 */
		"imageUrlPrefix"         => "", /* 图片访问路径前缀 */
		"imagePathFormat"        => "/ueditor/php/upload/image/{yyyy}{mm}{dd}/{time}{rand:6}", /* 上传保存路径,可以自定义保存路径和文件名格式 */
		/* 涂鸦图片上传配置项 */
		"scrawlActionName"       => "uploadscrawl", /* 执行上传涂鸦的action名称 */
		"scrawlFieldName"        => "upfile", /* 提交的图片表单名称 */
		"scrawlPathFormat"       => "/ueditor/php/upload/image/{yyyy}{mm}{dd}/{time}{rand:6}", /* 上传保存路径,可以自定义保存路径和文件名格式 */
		"scrawlMaxSize"          => 2048000, /* 上传大小限制，单位B */
		"scrawlUrlPrefix"        => "", /* 图片访问路径前缀 */
		"scrawlInsertAlign"      => "none",
		/* 截图工具上传 */
		"snapscreenActionName"   => "uploadimage", /* 执行上传截图的action名称 */
		"snapscreenPathFormat"   => "/ueditor/php/upload/image/{yyyy}{mm}{dd}/{time}{rand:6}", /* 上传保存路径,可以自定义保存路径和文件名格式 */
		"snapscreenUrlPrefix"    => "", /* 图片访问路径前缀 */
		"snapscreenInsertAlign"  => "none", /* 插入的图片浮动方式 */
		/* 抓取远程图片配置 */
		"catcherLocalDomain"     => array( "127.0.0.1", "localhost", "img.baidu.com" ),
		"catcherActionName"      => "catchimage", /* 执行抓取远程图片的action名称 */
		"catcherFieldName"       => "source", /* 提交的图片列表表单名称 */
		"catcherPathFormat"      => "/ueditor/php/upload/image/{yyyy}{mm}{dd}/{time}{rand:6}", /* 上传保存路径,可以自定义保存路径和文件名格式 */
		"catcherUrlPrefix"       => "", /* 图片访问路径前缀 */
		"catcherMaxSize"         => 2048000, /* 上传大小限制，单位B */
		"catcherAllowFiles"      => array( ".png", ".jpg", ".jpeg", ".gif", ".bmp" ), /* 抓取图片格式显示 */
		/* 上传视频配置 */
		"videoActionName"        => "uploadvideo", /* 执行上传视频的action名称 */
		"videoFieldName"         => "upfile", /* 提交的视频表单名称 */
		"videoPathFormat"        => "/ueditor/php/upload/video/{yyyy}{mm}{dd}/{time}{rand:6}", /* 上传保存路径,可以自定义保存路径和文件名格式 */
		"videoUrlPrefix"         => "", /* 视频访问路径前缀 */
		"videoMaxSize"           => 102400000, /* 上传大小限制，单位B，默认100MB */
		"videoAllowFiles"        => array( ".flv", ".swf", ".mkv", ".avi", ".rm", ".rmvb", ".mpeg", ".mpg", ".ogg", ".ogv", ".mov", ".wmv", ".mp4", ".webm", ".mp3", ".wav", ".mid" ), /* 上传视频格式显示 */
		/* 上传文件配置 */
		"fileActionName"         => "uploadfile", /* controller里,执行上传视频的action名称 */
		"fileFieldName"          => "upfile", /* 提交的文件表单名称 */
		"filePathFormat"         => "/ueditor/php/upload/file/{yyyy}{mm}{dd}/{time}{rand:6}", /* 上传保存路径,可以自定义保存路径和文件名格式 */
		"fileUrlPrefix"          => "", /* 文件访问路径前缀 */
		"fileMaxSize"            => 51200000, /* 上传大小限制，单位B，默认50MB */
		"fileAllowFiles"         => array(
			".png", ".jpg", ".jpeg", ".gif", ".bmp",
			".flv", ".swf", ".mkv", ".avi", ".rm", ".rmvb", ".mpeg", ".mpg",
			".ogg", ".ogv", ".mov", ".wmv", ".mp4", ".webm", ".mp3", ".wav", ".mid",
			".rar", ".zip", ".tar", ".gz", ".7z", ".bz2", ".cab", ".iso",
			".doc", ".docx", ".xls", ".xlsx", ".ppt", ".pptx", ".pdf", ".txt", ".md", ".xml"
		), /* 上传文件格式显示 */
		/* 列出指定目录下的图片 */
		"imageManagerActionName" => "listimage", /* 执行图片管理的action名称 */
		"imageManagerListPath"   => "/ueditor/php/upload/image/", /* 指定要列出图片的目录 */
		"imageManagerListSize"   => 20, /* 每次列出文件数量 */
		"imageManagerUrlPrefix"  => "", /* 图片访问路径前缀 */
		"imageManagerInsertAlign"=> "none", /* 插入的图片浮动方式 */
		"imageManagerAllowFiles" => array( ".png", ".jpg", ".jpeg", ".gif", ".bmp" ), /* 列出的文件类型 */
		/* 列出指定目录下的文件 */
		"fileManagerActionName"  => "listfile", /* 执行文件管理的action名称 */
		"fileManagerListPath"    => "/ueditor/php/upload/file/", /* 指定要列出文件的目录 */
		"fileManagerUrlPrefix"   => "", /* 文件访问路径前缀 */
		"fileManagerListSize"    => 20, /* 每次列出文件数量 */
		"fileManagerAllowFiles"  => array(
			".png", ".jpg", ".jpeg", ".gif", ".bmp",
			".flv", ".swf", ".mkv", ".avi", ".rm", ".rmvb", ".mpeg", ".mpg",
			".ogg", ".ogv", ".mov", ".wmv", ".mp4", ".webm", ".mp3", ".wav", ".mid",
			".rar", ".zip", ".tar", ".gz", ".7z", ".bz2", ".cab", ".iso",
			".doc", ".docx", ".xls", ".xlsx", ".ppt", ".pptx", ".pdf", ".txt", ".md", ".xml"
		) /* 列出的文件类型 */
	),

);
?>
