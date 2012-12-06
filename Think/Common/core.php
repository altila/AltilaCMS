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

// 系统默认的核心列表文件
return array(
    THINK_PATH.'Common/defines.php',    // 常量定义
    THINK_PATH.'Common/functions.php',    // 系统函数库
    THINK_PATH.'Lib/Think/Core/Think.class.php',    // 基类
    THINK_PATH.'Lib/Think/Exception/ThinkException.class.php',  // 异常处理类
    THINK_PATH.'Lib/Think/Core/Log.class.php',    // 日志处理类
    THINK_PATH.'Lib/Think/Core/Route.class.php',  // 路由类
    THINK_PATH.'Lib/Think/Core/App.class.php',   // 应用类
    THINK_PATH.'Lib/Think/Core/Action.class.php', // 控制器类
    THINK_PATH.'Lib/Think/Core/Model.class.php', // 模型类
    THINK_PATH.'Lib/Think/Core/View.class.php',  // 视图类
    THINK_PATH.'Common/alias.php',  // 加载别名
);
?>