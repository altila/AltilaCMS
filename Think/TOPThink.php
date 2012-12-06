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

//-------------------------------------------------
// TOPThink公共入口文件 
// 需要PHP 5.2.0以上版本
//-------------------------------------------------

//记录开始运行时间
G('beginTime');
 
define('THINK_PATH', dirname(__FILE__).'/');
define('ROOT_PATH',getcwd().'/');
define('RUNTIME_PATH',ROOT_PATH.'Runtime/');
// 当前运行模式编译缓存文件
$runtime = '~'.(defined('THINK_MODE')?strtolower(THINK_MODE).'_':'').'runtime.php';
if(is_file(RUNTIME_PATH.$runtime)) {
    // 加载框架核心编译缓存
    require RUNTIME_PATH.$runtime;
}else{
    // 生成核心编译缓存
    require THINK_PATH."Common/runtime.php";
}
 
// 记录加载文件时间
G('loadTime');
// 执行应用
App::run();
 
// 记录和统计时间（微秒）
function G($start,$end='',$dec=3) {
    static $_info = array();
    if(!empty($end)) { // 统计时间
        if(!isset($_info[$end]))
            $_info[$end]   =  microtime(TRUE);
        return number_format(($_info[$end]-$_info[$start]),$dec);
    }else{ // 记录时间
        $_info[$start]  =  microtime(TRUE);
    }
}
?>