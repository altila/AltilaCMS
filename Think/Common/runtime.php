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

// 生成核心编译缓存
function build_runtime() {
    // 读取核心编译文件列表
    if(defined('THINK_MODE')) {
        // 根据设置的运行模式加载不同的核心编译文件
        $list   =  include THINK_PATH.'Mode/'.strtolower(THINK_MODE).'.php';
    }else{
        // 默认核心
        $list   =  include THINK_PATH.'Common/core.php';
    }
    // 加载核心编译文件列表
    foreach ($list as $key=>$file){
        if(is_file($file))  require $file;
    }
    // 检查运行缓存目录 如果不存在则自动创建
    if(!is_dir(RUNTIME_PATH)) {
        if(is_writeable(ROOT_PATH)) {
            mkdir(RUNTIME_PATH,0777,true);
        }else{
            header("Content-Type:text/html; charset=utf-8");
            exit('<div style=\'font-weight:bold;float:left;width:345px;text-align:center;border:1px solid silver;background:#E8EFFF;padding:8px;color:red;font-size:14px;font-family:Tahoma\'>目录 [ '.ROOT_PATH.' ] 不可写,无法自动创建Runtime目录！</div>');
        }
    }
    // 生成核心编译缓存 去掉文件空白以减少大小
    if(!defined('NO_CACHE_RUNTIME')) {
        $content  = '';
        foreach ($list as $file){
            $content .= compile($file);
        }
        $runtime = '~'.(defined('THINK_MODE')?strtolower(THINK_MODE).'_':'').'runtime.php';
        if(defined('STRIP_RUNTIME_SPACE') && STRIP_RUNTIME_SPACE == false ) {
            file_put_contents(RUNTIME_PATH.$runtime,'<?php'.$content);
        }else{
            file_put_contents(RUNTIME_PATH.$runtime,strip_whitespace('<?php'.$content));
        }
    }
}
build_runtime();
?>