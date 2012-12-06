<?php
// +----------------------------------------------------------------------
// | TOPThink [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2010 http://topthink.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
// $Id$

/**
 +------------------------------------------------------------------------------
 * 系统定义文件
 +------------------------------------------------------------------------------
 * @category   Think
 * @package  Common
 * @author   liu21st <liu21st@gmail.com>
 * @version  $Id$
 +------------------------------------------------------------------------------
 */
//[RUNTIME]
if (!defined('THINK_PATH')) exit();
//   系统信息
if(version_compare(PHP_VERSION,'6.0.0','<') ) {
    @set_magic_quotes_runtime (0);
    define('MAGIC_QUOTES_GPC',get_magic_quotes_gpc()?True:False);
}
define('MEMORY_LIMIT_ON',function_exists('memory_get_usage'));
define('IS_CGI',substr(PHP_SAPI, 0,3)=='cgi' ? 1 : 0 );
define('IS_WIN',strstr(PHP_OS, 'WIN') ? 1 : 0 );
define('IS_CLI',PHP_SAPI=='cli'? 1   :   0);
define('NOW_TIME',$_SERVER['REQUEST_TIME']);
if(!IS_CLI) {
    // 当前文件名
    if(!defined('_PHP_FILE_')) {
        if(IS_CGI) {
            //CGI/FASTCGI模式下
            $_temp  = explode('.php',$_SERVER["PHP_SELF"]);
            define('_PHP_FILE_',  rtrim(str_replace($_SERVER["HTTP_HOST"],'',$_temp[0].'.php'),'/'));
        }else {
            define('_PHP_FILE_',    rtrim($_SERVER["SCRIPT_NAME"],'/'));
        }
    }
    if(!defined('__ROOT__')) {
        // 网站URL根目录
        $_root = dirname(_PHP_FILE_);
        define('__ROOT__',   (($_root=='/' || $_root=='\\')?'':$_root));
    }
    //支持的URL模式
    define('URL_COMMON',      0);   //普通模式
    define('URL_PATHINFO',    1);   //PATHINFO模式
    define('URL_REWRITE',     2);   //REWRITE模式
    define('URL_COMPAT',      3);   // 兼容模式
}
define('THINK_VERSION', '1.0'); //版本信息
define('APPS_PATH','Apps/');  //应用目录
define('VENDOR_PATH',THINK_PATH.'Vendor/'); //第三方目录
//[/RUNTIME]

// 记录内存初始使用
if(MEMORY_LIMIT_ON) $GLOBALS['_startUseMems'] = memory_get_usage();
// 为了方便导入第三方类库 设置Vendor目录到include_path
set_include_path(get_include_path() . PATH_SEPARATOR . VENDOR_PATH);

/*MALL定义常量*/
define('TIMEOFFSET',0);
define('ZONEOFFSET',0);//部署到外国服务器，改值为3600*8
define('ICONVCHARSET','gbk');
define('MDCODE','!@#$%^&*');
define('DELAYTIME',9000);
define('NOWTIME',time()+TIMEOFFSET);
define('THISTIME',NOWTIME-ZONEOFFSET);
define('SQLTIME',date('Y-m-d H:i:s',NOWTIME));
define("SESSION_OUTSET", 60);    /*session 过时时间   以分钟为单位*/

define('SERVER_NAME',$_SERVER['SERVER_NAME']);
define('SERVER_ADDR',$_SERVER['SERVER_ADDR']);
define('SERVER_PORT',$_SERVER['SERVER_PORT']);
define('REMOTE_ADDR',$_SERVER['REMOTE_ADDR']);
define('REQUEST_URI',$_SERVER['REQUEST_URI']);
define('QUERY_STRING',$_SERVER['QUERY_STRING']);
define('REQUEST_TIME',$_SERVER['REQUEST_TIME']);
define('PHP_SELF',$_SERVER['PHP_SELF']);
define('HTTP_USER_AGENT',$_SERVER['HTTP_USER_AGENT']);

/*秒杀参加促销配置*/
define("SECOND_IN_PROMOTION", 1);
/*套装参加促销配置*/
define("GROUP_IN_PROMOTION", 1);

/*可以使用自提的目标会员类型*/
define("CAC_TARGET_USER_TYPE",2);

/* 订单取消时间的限制  单位为小时*/
define("ORDER_NO_TIME", 1);
define('SYS_COK_EXPIRE', time()+3600*24*3);										//COOKIE默认过期的时间3天
define('SYS_COK_PATH', '/');													//COOKIE在服务器端的有效路径
define('SYS_COK_DOMAIN', '');
/* 默认单页列表条数 */
define('PAGE_LIMIT', '10');
$session_id=session_id();
$_SGLOBAL=array();
/*城市类型*/
define("CITY_REGION_TYPE",2);
/* 省市类型*/
define("PROVINCE_REGION_TYPE",1);
/* 用户默认国家*/
define("USER_DEFAULT_COUNTRY",1);
/* 国家类型*/
define("COUNTRY_REGION_TYPE",0);
/* 国家父ID*/
define("COUNTRY_PARENT_ID",0);
define("CHANNEL_CODE",'A02588S001');

/* 配送状态 */
define('SS_UNSHIPPED',              0); // 未发货
define('SS_SHIPPED',                1); // 已发货
define('SS_RECEIVED',               2); // 已收货
define('SS_PREPARING',              3); // 备货中
define('SS_SHIPPED_PART',           4); // 已发货(部分商品)
define('SS_SHIPPED_ING',            5); // 发货中(处理分单)
/* 支付状态 */
define('PS_UNPAYED',                0); // 未付款
define('PS_PAYING',                 1); // 付款中
define('PS_PAYED',                  2); // 已付款
/* 减库存时机 */
define('SDT_SHIP',                  0); // 发货时
define('SDT_PLACE',                 1); // 下订单时
?>