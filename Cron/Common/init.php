<?php
//定义常量
define('THINK_PATH', true);
defined('APP_PATH')     or define('APP_PATH', rtrim(dirname($_SERVER['SCRIPT_FILENAME']),'Cron/Common').'/');
defined('RUNTIME_PATH') or define('RUNTIME_PATH',   APP_PATH.'Runtime/');

defined('COMMON_PATH')  or define('COMMON_PATH',    APP_PATH.'Common/'); // 项目公共目录
defined('CONF_PATH')    or define('CONF_PATH',      APP_PATH.'Conf/'); // 项目配置目录
defined('LOG_PATH')     or define('LOG_PATH',       RUNTIME_PATH.'Logs/'); // 项目日志目录
defined('TEMP_PATH')    or define('TEMP_PATH',      RUNTIME_PATH.'Temp/'); // 项目缓存目录
defined('DATA_PATH')    or define('DATA_PATH',      RUNTIME_PATH.'Data/'); // 项目数据目录
defined('CACHE_PATH')   or define('CACHE_PATH',     RUNTIME_PATH.'Cache/'); // 项目模板缓存目录

//载入配置
$config = require_once(CONF_PATH . 'config.php');
$debug  = require_once(CONF_PATH . 'debug.php');
$deploy = require_once(CONF_PATH . 'deploy.php');

$config = array_merge($config,$debug,$deploy);print_r($debug);

//脚本设置
date_default_timezone_set('PRC');//设置时区
ini_set('display_errors','on');//显示错误
error_reporting(2047);//设置应该报告何种 PHP 错误
set_time_limit(0);//设置脚本最大执行时间

/*
//执行计划任务
ignore_user_abort(true);//设置客户端断开连接时是否中断脚本的执行
while(1) {
　　sleep(5); //半小时执行一次
}
*/




//实例化数据库
/*
require_once(ROOT_PATH . 'cron/entity/cls_ent_base.php');
require_once(ROOT_PATH . '/cron/includes/cls_mysql.php');
require_once(ROOT_PATH . '/cron/includes/cls_mongo.php');
$mongo_db=$config['MONGODB'];
$mongo_table=$config['MONGOTBLE'];
$db = new cls_mysql($config['DB_HOST'].':'.$config['DB_PORT'], $config['DB_USER'] , $config['DB_PWD']  , $config['DB_NAME'] , 'utf8');
 */

?>
