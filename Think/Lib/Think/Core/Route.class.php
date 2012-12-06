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

// 路由解析
class Route extends Think{

    static public function dispatch() {
        // 读取配置变量
        $varApp    = C('VAR_APP');
        $varGroup =  C('VAR_GROUP');
        $varModule   =  C('VAR_MODULE');
        $varAction  =  C('VAR_ACTION');
        $varPathinfo  =  C('VAR_PATHINFO');
        $urlMode  =  C('URL_MODEL');
        // 获取入口文件地址
        if($urlMode == URL_REWRITE ) { // REWRITE 模式
            $url    =   dirname(_PHP_FILE_);
            define('PHP_FILE',($url=='/' || $url=='\\')?'':$url);
        }elseif($urlMode == URL_COMPAT){ // 兼容模式
            define('PHP_FILE',dirname(_PHP_FILE_).'?'.$varPathinfo.'=');
            if(!empty($_GET[$varPathinfo])) {
                $_SERVER['PATH_INFO']   = $_GET[$varPathinfo];
                unset($_GET[$varPathinfo]);
            }
        }else { // 标准模式或者普通模式
            define('PHP_FILE',_PHP_FILE_);
        }
        // 开启子域名部署 支持二级和三级域名
        if(C('APP_SUB_DOMAIN_DEPLOY')) {
            $rules = C('APP_SUB_DOMAIN_RULES');
            $domain = array_slice(explode('.',$_SERVER['HTTP_HOST']),0,-2);
            $subDomain    = implode('.',$domain);
            $domain2 = array_pop($domain); // 二级域名
            if($domain) { // 存在三级域名
                $domain3   =  array_pop($domain);
            }
            //$_GET['SUB_DOMAIN'] = $subDomain; // 子域名
            if($subDomain && array_key_exists($subDomain,$rules)) { // 子域名配置
                $rule =  $rules[$subDomain];
            }elseif(isset($rules['*.'.$domain2]) && !empty($domain3)){ // 泛三级域名
                $rule =  $rules['*.'.$domain2];
                $panDomain = $domain3;
            }elseif(isset($rules['*']) && !empty($domain2)){ // 泛二级域名
                if('www' != $domain2 && !in_array($domain2,C('APP_SUB_DOMAIN_DENY'))) {
                    $rule =  $rules['*'];
                    $panDomain = $domain2;
                }
            }
            if(!empty($rule)) {
                // 子域名部署规则 '子域名'=>array('项目名[/分组名]','var1=a&var2=b&var3=*');
                $array   =  explode('/',$rule[0]);
                $_GET[$varApp]  = array_shift($array);
                $domainApp =  true;
                $group = array_shift($array);
                if(!empty($group)) {
                    $_GET[$varGroup] = $group;
                    $domainGroup   =  true;
                }
                if(isset($rule[1])) { // 传入参数
                    parse_str($rule[1],$parms);
                    if(isset($panDomain)) {
                        $pos =  array_search('*',$parms);
                        if(false !== $pos) {
                            // 泛域名作为参数
                            $parms[$pos] =  $panDomain;
                        }
                    }
                    $_GET   =  array_merge($_GET,$parms);
                }
            }
        }
        if(empty($_GET[$varApp]) && C('JUST_ONE_APP')) {
            // 单一项目部署 二级域名以及指定项目入口部署不受影响
            $_GET[$varApp]  = C('JUST_ONE_APP');
        }
        $depr = C('URL_PATHINFO_DEPR');
        // 分析PATHINFO信息
        if(!empty($_SERVER['PATH_INFO'])) {
            $_SERVER['PATH_INFO']   = trim($_SERVER['PATH_INFO'],'/');
            if(C('URL_HTML_SUFFIX')) // 伪静态后缀
                $_SERVER['PATH_INFO']   =   preg_replace('/\.'.C('URL_HTML_SUFFIX').'$/','',$_SERVER['PATH_INFO']);
            define('__INFO__',$_SERVER['PATH_INFO']);
            // 默认URL规则：项目/[分组/]模块/操作/变量/参数...
            $paths = explode($depr,$_SERVER['PATH_INFO']);
            // 检查项目是否允许子目录访问
            $list   =  explode(',',C('APP_SUB_DIR_DENY_LIST'));
            if(!isset($_GET[$varApp]) && (!in_array(strtolower($paths[0]),$list))) {
                $_GET[$varApp]  = array_shift($paths); // 获取项目
                $_SERVER['PATH_INFO']   = implode($depr,$paths);
            }
            if(empty($_GET[$varApp])) {
                halt('没有指定项目');
            }
        }
        // URL常量
        define('__SELF__',$_SERVER['REQUEST_URI']);
        // 获取项目名 全小写
        define('APP_NAME', strtolower(!empty($_GET[$varApp])?$_GET[$varApp]:C('DEFAULT_APP')));
        // 项目URL地址
        define('__APP__',(!empty($domainApp) || APP_NAME == strtolower(C('JUST_ONE_APP')) )?PHP_FILE : PHP_FILE.'/'.APP_NAME);
        // 加载项目
        load_app();
        if(isset($paths) && $depr != C('URL_PATHINFO_DEPR')) { // 项目单独定义URL_PATHINFO_DEPR
            $depr = C('URL_PATHINFO_DEPR');
            $_SERVER['PATH_INFO']   = $paths[0];
            $paths   =  explode($depr,$paths[0]);
        }
        // 检测项目路由
        if(!empty($_SERVER['PATH_INFO']) && !self::routerCheck()){
            // 解析PATH_INFO参数
            $var  =  array();
            if (C('APP_GROUP_LIST') && !isset($_GET[$varGroup])){
                $var[$varGroup] = in_array(strtolower($paths[0]),explode(',',strtolower(C('APP_GROUP_LIST'))))? array_shift($paths) : '';
            }
            $var[$varModule]  =   array_shift($paths);
            $var[$varAction]  =   array_shift($paths);
            // 解析剩余的URL参数
            $res = preg_replace('@(\w+)'.$depr.'([^\/]+)@e', '$var[\'\\1\']="\\2";', implode($depr,$paths));
            $_GET   =  array_merge($var,$_GET);
        }
        if (C('APP_GROUP_LIST')) {
            // 获取分组名
            define('GROUP_NAME', strtolower(!empty($_GET[$varGroup])?$_GET[$varGroup]:C('DEFAULT_GROUP')));
            unset($_GET[$varGroup]);
            // 分组URL地址
            define('__GROUP__',(!empty($domainGroup) || GROUP_NAME == strtolower(C('DEFAULT_GROUP')) )?__APP__ : __APP__.$depr.GROUP_NAME);
            // 加载分组
            load_group();
        }
        // 获取模块名
        $module = !empty($_GET[$varModule])? $_GET[$varModule]:C('DEFAULT_MODULE');
        if(C('URL_CASE_INSENSITIVE')) {
            // 模块名不区分大小写
            // 智能识别方式 user_type 识别到 UserTypeAction 模块
            $module = ucfirst(parse_name(strtolower($module),1));
        }
        define('MODULE_NAME',$module);
        // 安全检测
        if(!preg_match('/^[A-Z_.a-z0-9]+$/',MODULE_NAME)){
            throw_exception(L('_MODULE_NOT_EXIST_').MODULE_NAME);
        }
        // 模块URL地址
        define('__URL__',(defined('__GROUP__')?__GROUP__:__APP__).$depr.MODULE_NAME);
        // 获取操作名
        $action  =  !empty($_POST[$varAction])?$_POST[$varAction]:(!empty($_GET[$varAction])?$_GET[$varAction]:C('DEFAULT_ACTION'));
        define('ACTION_NAME',strtolower($action)); // 操作名始终小写
        // 操作URL地址
        define('__ACTION__',__URL__.$depr.ACTION_NAME);
        unset($_GET[$varApp],$_GET[$varModule],$_GET[$varAction]);
        //保证$_REQUEST正常取值
        $_REQUEST = array_merge($_POST,$_GET);
    }

    // 路由检测
    static public function routerCheck() {
        if(C('URL_ROUTER_ON') && $routes = C('URL_ROUTE_RULES')){
            $regx = $_SERVER['PATH_INFO'];
            $depr = C('URL_PATHINFO_DEPR');
            foreach ($routes as $key=>$route){
                if(0 === strpos($regx.$depr,$route[0].$depr)) {
                    // 简单路由定义：array('路由定义','分组/模块/操作名', '路由对应变量','额外参数'),
                    $var  =  self::parseUri($route[1]);
                    //  获取当前路由参数对应的变量
                    $paths = explode($depr,trim(str_replace($key,'',$regx),$depr));
                    $vars    =   explode(',',$route[2]);
                    for($i=0;$i<count($vars);$i++)
                        $var[$vars[$i]]     =   array_shift($paths);
                    // 解析剩余的URL参数
                    $res = preg_replace('@(\w+)\/([^,\/]+)@e', '$var[\'\\1\']="\\2";', implode('/',$paths));
                    $_GET   =  array_merge($var,$_GET);
                    if(isset($route[3])) {
                        parse_str($route[3],$params);
                        $_GET   =   array_merge($_GET,$params);
                    }
                    return true;
                }elseif(strstr($route[0],'/') && preg_match($route[0],$regx,$matches)) {
                    // 路由定义规则：array('正则定义','分组/模块/操作名', '路由对应变量','额外参数'),
                    $var  =  self::parseUri($route[1]);
                    //  获取当前路由参数对应的变量
                    $vars    =   explode(',',$route[2]);
                    for($i=0;$i<count($vars);$i++)
                        $var[$vars[$i]]     =   $matches[$i+1];
                    // 解析剩余的URL参数
                    //$res = preg_replace('@(\w+)\/([^,\/]+)@e', '$var[\'\\1\']="\\2";', str_replace($matches[0],'',$regx));
                    $res = preg_replace('@(\w+)'.$depr.'([^'.$depr.'\/]+)@e', '$var[\'\\1\']=\'\\2\';', implode($depr,$paths));
                    //dump ( $res );
                    $_GET   =  array_merge($var,$_GET);
                    if(isset($route[3])) {
                        parse_str($route[3],$params);
                        $_GET   =   array_merge($_GET,$params);
                    }
                    return true;
                }
            }
        }
        return false;
    }

    static private function parseUri($route,$includeApp=true) {
        $array   =  explode('/',$route);
        $var  =  array();
        $var[C('VAR_ACTION')] = array_pop($array);
        $var[C('VAR_MODULE')] = array_pop($array);
        if(!empty($array)) {
            $var[C('VAR_GROUP')]  = array_pop($array);
        }
        return $var;
    }

}
?>