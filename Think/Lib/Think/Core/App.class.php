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
 * TOPThink 应用程序类 执行应用过程管理
 +------------------------------------------------------------------------------
 * @category   Think
 * @package  Think
 * @subpackage  Core
 * @author    liu21st <liu21st@gmail.com>
 * @version   $Id$
 +------------------------------------------------------------------------------
 */
class App
{//类定义开始

    /**
     +----------------------------------------------------------
     * 应用程序初始化
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @return void
     +----------------------------------------------------------
     */
    static public function init() {
        // 设定错误和异常处理
        set_error_handler(array('App','appError'));
        set_exception_handler(array('App','appException'));
        // 加载全局编译缓存
        if(is_file(RUNTIME_PATH.'~app.php') && filemtime(RUNTIME_PATH.'~app.php')>filemtime(ROOT_PATH.'Conf/config.php')) {
            // 直接读取编译缓存文件
            C(include RUNTIME_PATH.'~app.php');
        }else{
            // 预编译项目
            App::build();
        }

        // 加载站点扩展配置文件 不纳入编译缓存 便于动态加载
        load_ext_config();
        // 设置系统时区
        date_default_timezone_set(C('DEFAULT_TIMEZONE'));
        // 注册AUTOLOAD方法
        spl_autoload_register(array('Think', 'autoload'));
        // URL调度及路由检测
        Route::dispatch();
        // 加载语言包
        load_lang_pack();
        return ;
    }

    /**
     +----------------------------------------------------------
     * 读取全局配置信息和公共文件 编译
     +----------------------------------------------------------
     * @access private
     +----------------------------------------------------------
     * @return string
     +----------------------------------------------------------
     */
    static private function build()
    {
        // 加载惯例配置文件
        C(include THINK_PATH.'Common/convention.php');
        // 加载站点配置文件
        if(is_file(ROOT_PATH.'Conf/config.php'))
            C(include ROOT_PATH.'Conf/config.php');
        $common   = '';
         //是否调试模式
        $debug  =  C('APP_DEBUG');
        // 加载全局公共文件
        if(is_file(ROOT_PATH.'Common/common.php')) {
            include ROOT_PATH.'Common/common.php';
            if(!$debug) // 编译文件
                $common   .= compile(ROOT_PATH.'Common/common.php');
        }
        // 加载全局编译文件列表
        if(is_file(ROOT_PATH.'Conf/app.php')) {
            $list   =  include ROOT_PATH.'Conf/app.php';
            foreach ($list as $file){
                // 加载并编译文件
                require $file;
                if(!$debug) $common   .= compile($file);
            }
        }
        // 如果是调试模式加载调试模式配置文件
        if($debug) {
            // 加载系统默认的开发模式配置文件
            C(include THINK_PATH.'Common/debug.php');
            if(is_file(ROOT_PATH.'Conf/debug.php'))
                // 允许项目增加开发模式配置定义
                C(include ROOT_PATH.'Conf/debug.php');
        }else{
            // 部署模式下面生成编译文件
            $content  = "<?php ".$common."\nreturn ".var_export(C(),true).";\n?>";
            file_put_contents(RUNTIME_PATH.'~app.php',strip_whitespace($content));
        }
        return ;
    }

    /**
     +----------------------------------------------------------
     * 执行应用程序
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @return void
     +----------------------------------------------------------
     * @throws ThinkExecption
     +----------------------------------------------------------
     */
    static public function exec()
    {
        //创建Action控制器实例
        $group =  defined('GROUP_NAME') ? GROUP_NAME.'.' : '';
        $module  =  A($group.MODULE_NAME);
        if(!$module) {
            // 是否定义Empty模块
            $module = A($group."Empty");
            if(!$module)
                // 模块不存在 抛出异常
                throw_exception(L('_MODULE_NOT_EXIST_').MODULE_NAME);
        }
        if (method_exists($module,'_before_'.ACTION_NAME))
            // 执行前置操作
            call_user_func(array(&$module,'_before_'.ACTION_NAME));
        //执行当前操作
        call_user_func(array(&$module,ACTION_NAME));
        if (method_exists($module,'_after_'.ACTION_NAME))
            //  执行后缀操作
            call_user_func(array(&$module,'_after_'.ACTION_NAME));
        return ;
    }

    /**
     +----------------------------------------------------------
     * 运行应用实例 入口文件使用的快捷方法
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @return void
     +----------------------------------------------------------
     */
    static public function run() {
        App::init();
        $plugin   =  C('APP_PLUGIN_ON');
        // 项目初始化标签
        if($plugin)   tag('app_init');
        if(C('SESSION_AUTO_START')) {
            if(C('MUCH_DOMAIN')) ini_set("session.cookie_domain", C('COOKIE_DOMAIN'));
            session_start(); // Session初始化
        }
        // 项目运行标签
        if($plugin)   tag('app_begin');
        // 记录应用初始化时间
        if(C('SHOW_RUN_TIME'))  G('initTime');
        App::exec();
        // 保存日志记录
        if(C('LOG_RECORD')) Log::save();
        // 项目结束标签
        if($plugin) tag('app_end');
        // 记录应用初始化时间
        if(C('SHOW_RUN_TIME'))  G('endTime');
        return ;
    }

    /**
     +----------------------------------------------------------
     * 自定义异常处理
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @param mixed $e 异常对象
     +----------------------------------------------------------
     */
    static public function appException($e)
    {
        halt($e->__toString());
    }

    /**
     +----------------------------------------------------------
     * 自定义错误处理
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @param int $errno 错误类型
     * @param string $errstr 错误信息
     * @param string $errfile 错误文件
     * @param int $errline 错误行数
     +----------------------------------------------------------
     * @return void
     +----------------------------------------------------------
     */
    static public function appError($errno, $errstr, $errfile, $errline)
    {
      switch ($errno) {
          case E_ERROR:
          case E_USER_ERROR:
            $errorStr = "[$errno] $errstr ".basename($errfile)." 第 $errline 行.";
            if(C('LOG_RECORD')) Log::write($errorStr,Log::ERR);
            halt($errorStr);
            break;
          case E_STRICT:
          case E_USER_WARNING:
          case E_USER_NOTICE:
          default:
            $errorStr = "[$errno] $errstr ".basename($errfile)." 第 $errline 行.";
            Log::record($errorStr,Log::NOTICE);
            break;
      }
    }

};//类定义结束
?>