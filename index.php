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

// 主入口文件

//phpinfo();
//print_r($_SERVER);

//定义项目名称和路径
//define('APP_NAME', 'App');
//define('APP_PATH', './App/');
define('THINK_PATH','./ThinkPHP/');
define('ENGINE_NAME','cluster');

//定义项目DEBUG状态
define('APP_DEBUG',true);
define('PREVIEW',false);
// 加载框架入口文件
require(THINK_PATH.'ThinkPHP.php');


?>

