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
 * TOPThink公共函数库
 +------------------------------------------------------------------------------
 * @category   Think
 * @package  Common
 * @author   liu21st <liu21st@gmail.com>
 * @version  $Id$
 +------------------------------------------------------------------------------
 */

// 设置和获取统计数据
function N($key,$step=0){
    static $_num = array();
    if(!isset($_num[$key])) {
        $_num[$key]  =  0;
    }
    if(empty($step))
        return $_num[$key];
    else
        $_num[$key]  =  $_num[$key]+(int)$step;
}

// URL组装 支持不同模式和路由
// 格式： U('/Admin/User/add/','aaa=1&bbb=2');
// U('__URL__/add/','aaa=1&bbb=2');
function U($url,$vars='',$redirect=false,$suffix=true) {
    $url = template_content_replace($url);
    $depr = C('URL_PATHINFO_DEPR');
    if('/' != $depr) {
        // 安全替换
        $url   =  str_replace('/',$depr,$url);
        if(0===strpos($url,$depr)) { // 恢复第一个 /
            $url   =  '/'.substr($url,strlen($depr));
        }
    }
    $url   =  rtrim($url,$depr);
    if(!empty($vars)) { // 添加参数
        $url .= $depr.str_replace(array('=','&'),$depr,$vars);
    }
    // URL伪静态后缀
    if($suffix && C('URL_HTML_SUFFIX'))  $url .= '.'.C('URL_HTML_SUFFIX');
    /*
    if(!empty($vars)) { // 添加参数
        $url   .= (strpos($url,'?')?'&':'?').$vars;
    }*/
    if($redirect) // 直接跳转URL
        redirect($url);
    else
        return $url;
}

/**
 +----------------------------------------------------------
 * 字符串命名风格转换
 * type
 * =0 将Java风格转换为C的风格
 * =1 将C风格转换为Java的风格
 +----------------------------------------------------------
 * @access protected
 +----------------------------------------------------------
 * @param string $name 字符串
 * @param integer $type 转换类型
 +----------------------------------------------------------
 * @return string
 +----------------------------------------------------------
 */
function parse_name($name,$type=0) {
    if($type) {
        return ucfirst(preg_replace("/_([a-zA-Z])/e", "strtoupper('\\1')", $name));
    }else{
        $name = preg_replace("/[A-Z]/", "_\\0", $name);
        return strtolower(trim($name, "_"));
    }
}

// 错误输出
function halt($error) {
    if(IS_CLI)   exit ($error);
    $e = array();
    if(C('APP_DEBUG')){
        //调试模式下输出错误信息
        if(!is_array($error)) {
            $trace = debug_backtrace();
            $e['message'] = $error;
            $e['file'] = $trace[0]['file'];
            $e['class'] = $trace[0]['class'];
            $e['function'] = $trace[0]['function'];
            $e['line'] = $trace[0]['line'];
            $traceInfo = '';
            $time = date("y-m-d H:i:m");
            foreach($trace as $t){
                $traceInfo .= '['.$time.'] '.$t['file'].' ('.$t['line'].') ';
                $traceInfo .= $t['class'].$t['type'].$t['function'].'(';
                $traceInfo .= implode(', ', $t['args']);
                $traceInfo .= ")<br/>";
            }
            $e['trace']  = $traceInfo;
        }else {
            $e = $error;
        }
        // 包含异常页面模板
        include C('TMPL_EXCEPTION_FILE');
    }
    else
    {
        //否则定向到错误页面
        $error_page =   C('ERROR_PAGE');
        if(!empty($error_page)){
            redirect($error_page);
        }else {
            if(C('SHOW_ERROR_MSG'))
                $e['message'] =  is_array($error)?$error['message']:$error;
            else
                $e['message'] = C('ERROR_MESSAGE');
            // 包含异常页面模板
            include C('TMPL_EXCEPTION_FILE');
        }
    }
    exit;
}

// URL重定向
function redirect($url,$time=0,$msg='')
{
    //多行URL地址支持
    $url = str_replace(array("\n", "\r"), '', $url);
    if(empty($msg))
        $msg    =   "系统将在{$time}秒之后自动跳转到{$url}！";
    if (!headers_sent()) {
        // redirect
        if(0===$time) {
            header("Location: ".$url);
        }else {
            header("refresh:{$time};url={$url}");
            echo($msg);
        }
        exit();
    }else {
        $str    = "<meta http-equiv='Refresh' content='{$time};URL={$url}'>";
        if($time!=0)
            $str   .=   $msg;
        exit($str);
    }
}

// 自定义异常处理
function throw_exception($msg,$type='ThinkException',$code=0)
{
    if(class_exists($type,false))
        throw new $type($msg,$code,true);
    else
        halt($msg);        // 异常类型不存在则输出错误信息字串
}

// 浏览器友好的变量输出
function dump($var, $echo=true,$label=null, $strict=true)
{
    $label = ($label===null) ? '' : rtrim($label) . ' ';
    if(!$strict) {
        if (ini_get('html_errors')) {
            $output = print_r($var, true);
            $output = "<pre>".$label.htmlspecialchars($output,ENT_QUOTES)."</pre>";
        } else {
            $output = $label . print_r($var, true);
        }
    }else {
        ob_start();
        var_dump($var);
        $output = ob_get_clean();
        if(!extension_loaded('xdebug')) {
            $output = preg_replace("/\]\=\>\n(\s+)/m", "] => ", $output);
            $output = '<pre>'. $label. htmlspecialchars($output, ENT_QUOTES). '</pre>';
        }
    }
    if ($echo) {
        echo($output);
        return null;
    }else
        return $output;
}

// 优化的require_once
function require_cache($filename)
{
    static $_import = array();
    //$filename   =  realpath($filename);
    if (!isset($_import[$filename])) {
        if(file_iexists($filename)){
            require $filename;
            $_import[$filename] = true;
        }
        else
        {
            $_import[$filename] = false;
        }
    }
    return $_import[$filename];
}

// 区分大小写的文件存在判断
function file_iexists($filename) {
    if(is_file($filename)) {
        if(IS_WIN && C('APP_FILE_CASE')) {
            if(basename(realpath($filename)) != basename($filename))
                return false;
        }
        return true;
    }
    return false;
}

/**
 +----------------------------------------------------------
 * 导入所需的类库 同java的Import
 * 本函数有缓存功能
 +----------------------------------------------------------
 * @param string $class 类库命名空间字符串
 * @param string $baseUrl 起始路径
 * @param string $ext 导入的文件扩展名
 +----------------------------------------------------------
 * @return boolen
 +----------------------------------------------------------
 */
function import($class,$baseUrl = '',$ext='.class.php')
{
    static $_file = array();
    static $_class = array();
    $class    =   str_replace(array('.','#'), array('/','.'), $class);
    if('' === $baseUrl && false === strpos($class,'/')) {
        // 检查别名导入
        return alias_import($class);
    }    //echo('<br>'.$class.$baseUrl);
    if(isset($_file[$class.$baseUrl]))
        return true;
    else
        $_file[$class.$baseUrl] = true;
    $class_strut = explode("/",$class);
    if(empty($baseUrl)) {
        if('@'==$class_strut[0] || APP_NAME == $class_strut[0] ) {
            //加载当前项目应用类库
            $baseUrl   =  dirname(C('LIB_PATH'));
            $class    =   substr_replace($class, 'Lib/', 0,strlen($class_strut[0])+1);
        }elseif(in_array(strtolower($class_strut[0]),array('think','org','com'))) {
            // think 官方基类库 org 第三方公共类库 com 企业公共类库
            $baseUrl =  THINK_PATH.'Lib/';
        }else {
            // 加载其他项目应用类库
            $class    =   substr_replace($class, '', 0,strlen($class_strut[0])+1);
            $baseUrl =  ROOT_PATH.APPS_PATH.$class_strut[0].'/Lib/';
        }
    }
    if(substr($baseUrl, -1) != "/")    $baseUrl .= "/";
    $classfile = $baseUrl . $class . $ext;
    $_class[$class] = $classfile;
    /*
    if($ext == '.class.php' && is_file($classfile)) {
        // 冲突检测
        $class = basename($classfile,$ext);
        if(isset($_class[$class]))
            throw_exception(L('_CLASS_CONFLICT_').':'.$_class[$class].' '.$classfile);
        $_class[$class] = $classfile;
    }*/
    //导入目录下的指定类库文件
    return require_cache($classfile);
}

/**
 +----------------------------------------------------------
 * 基于命名空间方式导入函数库
 * load('@.Util.Array')
 +----------------------------------------------------------
 * @param string $name 函数库命名空间字符串
 * @param string $baseUrl 起始路径
 * @param string $ext 导入的文件扩展名
 +----------------------------------------------------------
 * @return void
 +----------------------------------------------------------
 */
function load($name,$baseUrl='',$ext='.php') {
    $name    =   str_replace(array('.','#'), array('/','.'), $name);
    if(empty($baseUrl)) {
        if(0 === strpos($name,'@/')) {
            //加载当前项目函数库
            $baseUrl   =  C('COMMON_PATH');
            $name =  substr($name,2);
        }else{
            //加载系统函数库
            $baseUrl   =  ROOT_PATH.'Common/Funtions/';
        }
    }
    if(substr($baseUrl, -1) != "/")    $baseUrl .= "/";
    include $baseUrl . $name . $ext;
}

// 快速导入第三方框架类库
// 所有第三方框架的类库文件统一放到 系统的Vendor目录下面
// 并且默认都是以.php后缀导入
function vendor($class,$baseUrl = '',$ext='.php')
{
    if(empty($baseUrl))  $baseUrl    =   VENDOR_PATH;
    return import($class,$baseUrl,$ext);
}

// 快速定义和导入别名
function alias_import($alias,$classfile='') {
    static $_alias   =  array();
    if('' !== $classfile) {
        // 定义别名导入
        $_alias[$alias]  = $classfile;
        return ;
    }
    if(is_string($alias)) {
        if(isset($_alias[$alias]))
            return require_cache($_alias[$alias]);
    }elseif(is_array($alias)){
        foreach ($alias as $key=>$val)
            $_alias[$key]  =  $val;
        return ;
    }
    return false;
}

/**
 +----------------------------------------------------------
 * D函数用于实例化Model
 +----------------------------------------------------------
 * @param string name Model名称
 * @param string app Model所在项目
 +----------------------------------------------------------
 * @return Model
 +----------------------------------------------------------
 */
function D($name='',$app='@')
{
    static $_model = array();
    if(empty($name)) return new Model;
    if(isset($_model[$app.$name]))
        return $_model[$app.$name];
    $OriClassName = $name;
    if(strpos($name,'.')) {
        $array   =  explode('.',$name);
        $name = array_pop($array);
        $className =  $name.'Model';
        import($app.'.Model.'.implode('.',$array).'.'.$className);
    }else{
        $className =  $name.'Model';
        import($app.'.Model.'.$className);
    }
    if(class_exists($className)) {
        $model = new $className();
    }else {
        $model  = new Model($name);
    }
    $_model[$app.$OriClassName] =  $model;
    return $model;
}

/**
 +----------------------------------------------------------
 * M函数用于实例化一个没有模型文件的Model
 +----------------------------------------------------------
 * @param string name Model名称
 * @param string tablePrefix 表前缀
 * @param string class 要实例化的模型类名
 +----------------------------------------------------------
 * @return Model
 +----------------------------------------------------------
 */
function M($name='',$tablePrefix='',$class='Model') {
    static $_model = array();
    if(!isset($_model[$name.'_'.$class])){
        $_model[$name.'_'.$class]   = new $class($name,$tablePrefix);
    }
    return $_model[$name.'_'.$class];
}


/**
 +----------------------------------------------------------
 * O函数用于实例化一个没有模型文件的Model,用于做指定数据库的查询
 +----------------------------------------------------------
 * @param string dbtag 数据库名称
 * @param string name  实例名称
 +----------------------------------------------------------
 * @return Model
 +----------------------------------------------------------
 */
function O($dbtag='default',$name='') {
    static $_o_model = array();
    if(!isset($_o_model[$name.'_Model'])){
        $_o_model[$name.'_Model']   = new Model($name,$dbtag);
    }
    return $_o_model[$name.'_Model'];
}

/**
 +----------------------------------------------------------
 * A函数用于实例化Action
 +----------------------------------------------------------
 * @param string name Action名称
 * @param string app 所在项目
 +----------------------------------------------------------
 * @return Action
 +----------------------------------------------------------
 */
function A($name,$app='@')
{
    static $_action = array();
    if(isset($_action[$app.$name]))
        return $_action[$app.$name];
    $OriClassName = $name;
    if(strpos($name,'.')) {
        $array   =  explode('.',$name);
        $name = array_pop($array);
        $className =  $name.'Action';
        import($app.'.Action.'.implode('.',$array).'.'.$className);
    }else{
        $className =  $name.'Action';
        import($app.'.Action.'.$className);
    }
    if(class_exists($className)) {
        $action = new $className();
        $_action[$app.$OriClassName] = $action;
        return $action;
    }else {
        return false;
    }
}

// 远程调用模块的操作方法
function R($module,$action,$app='@') {
    $class = A($module,$app);
    if($class)
        return call_user_func(array(&$class,$action));
    else
        return false;
}

// 获取和设置语言定义(不区分大小写)
function L($name=null,$value=null) {
    static $_lang = array();
    // 空参数返回所有定义
    if(empty($name)) return $_lang;
    // 判断语言获取(或设置)
    // 若不存在,直接返回全大写$name
    if (is_string($name) )
    {
        $name = strtoupper($name);
        if (is_null($value))
            return isset($_lang[$name]) ? $_lang[$name] : $name;
        $_lang[$name] = $value;// 语言定义
        return;
    }
    // 批量定义
    if (is_array($name))
        $_lang = array_merge($_lang,array_change_key_case($name,CASE_UPPER));
    return;
}

// 获取配置值
function C($name=null,$value='')
{
    static $_config = array();
    // 无参数时获取所有
    if(empty($name)) return $_config;
    // 优先执行设置获取或赋值
    if (is_string($name))
    {
        if (!strpos($name,'.')) {
            $name = strtolower($name);
            if(''===$value){
                return isset($_config[$name])? $_config[$name] : null;
            }else{
                return $_config[$name] = $value;
            }
        }
        // 二维数组设置和获取支持
        $name = explode('.',$name);
        $name[0]   = strtolower($name[0]);
        if(''===$value){
            return isset($_config[$name[0]][$name[1]]) ? $_config[$name[0]][$name[1]] : null;
        }else{
            return $_config[$name[0]][$name[1]] = $value;
        }
    }
    // 批量设置
    if(is_array($name))
        return $_config = array_merge($_config,array_change_key_case($name));
    return null;// 避免非法参数
}

// 处理标签
function tag($name,$params=array()) {
    $tags   =  C('TAGS_FILTER_LIST.'.$name);
    if(!empty($tags)) {
        foreach ($tags   as $key=>$call){
            $result   =  B($call,$params);
        }
    }
}

// 过滤器方法
function filter($name,&$content) {
    $class = $name.'Filter';
    require_cache(C('LIB_PATH').'Filter/'.$class.'.class.php');
    $filter   =  new $class();
    $content = $filter->run($content);
}

// 执行行为
function B($name,$params=array(),$isSys=false) {
    $class = $name.'Behavior';
    if($isSys) { // 系统行为
        require_cache(ROOT_PATH.'Common/Behavior/'.$class.'.class.php');
    }else{    // 项目行为
        require_cache(C('LIB_PATH').'Behavior/'.$class.'.class.php');
    }
    $behavior   =  new $class();
    return $behavior->run($params);
}

// 渲染输出Widget
function W($name,$data=array(),$return=false) {
    $class = $name.'Widget';
    require_cache(C('LIB_PATH').'Widget/'.$class.'.class.php');
    if(!class_exists($class))
        throw_exception(L('_CLASS_NOT_EXIST_').':'.$class);
    $widget  =  Think::instance($class);
    $content = $widget->render($data);
    if($return)
        return $content;
    else
        echo $content;
}

// 全局缓存设置和读取
function S($name,$value='',$expire='',$type='') {
    static $_cache = array();
    alias_import('Cache');
    //取得缓存对象实例
    $cache  = Think::instance('Cache','connect',array('type'=>$type));
    if('' !== $value) {
        if(is_null($value)) {
            // 删除缓存
            $result =   $cache->rm($name);
            if($result)   unset($_cache[$type.'_'.$name]);
            return $result;
        }else{
            // 缓存数据
            $cache->set($name,$value,$expire);
            $_cache[$type.'_'.$name]     =   $value;
        }
        return ;
    }
    if(isset($_cache[$type.'_'.$name]))
        return $_cache[$type.'_'.$name];
    // 获取缓存数据
    $value      =  $cache->get($name);
    $_cache[$type.'_'.$name]     =   $value;
    return $value;
}

// 快速文件数据读取和保存 针对简单类型数据 字符串、数组
function F($name,$value='',$path='') {
    static $_cache = array();
    if(empty($path)) $path =  C('DATA_PATH');
    $filename   =   $path.$name.'.php';
    if('' !== $value) {
        if(is_null($value)) {
            // 删除缓存
            return unlink($filename);
        }else{
            // 缓存数据
            $dir   =  dirname($filename);
            // 目录不存在则创建
            if(!is_dir($dir))  mk_dir($dir);
            return file_put_contents($filename,"<?php\n return ".var_export($value,true).";\n?>");
        }
    }
    if(isset($_cache[$name])) return $_cache[$name];
    // 获取缓存数据
    if(is_file($filename)) {
        $value   =  include $filename;
        $_cache[$name]   =   $value;
    }else{
        $value  =   false;
    }
    return $value;
}

// 根据PHP各种类型变量生成唯一标识号
function to_guid_string($mix)
{
    if(is_object($mix) && function_exists('spl_object_hash')) {
        return spl_object_hash($mix);
    }elseif(is_resource($mix)){
        $mix = get_resource_type($mix).strval($mix);
    }else{
        $mix = serialize($mix);
    }
    return md5($mix);
}

// 编译文件
function compile($filename) {
    $content = file_get_contents($filename);
    $content = substr(trim($content),5);
    if('?>' == substr($content,-2))
        $content = substr($content,0,-2);
    return $content;
}

// 去除代码中的空白和注释
function strip_whitespace($content) {
    $stripStr = '';
    //分析php源码
    $tokens =   token_get_all ($content);
    $last_space = false;
    for ($i = 0, $j = count ($tokens); $i < $j; $i++)
    {
        if (is_string ($tokens[$i]))
        {
            $last_space = false;
            $stripStr .= $tokens[$i];
        }
        else
        {
            switch ($tokens[$i][0])
            {
                //过滤各种PHP注释
                case T_COMMENT:
                case T_DOC_COMMENT:
                    break;
                //过滤空格
                case T_WHITESPACE:
                    if (!$last_space)
                    {
                        $stripStr .= ' ';
                        $last_space = true;
                    }
                    break;
                default:
                    $last_space = false;
                    $stripStr .= $tokens[$i][1];
            }
        }
    }
    return $stripStr;
}

// 循环创建目录
function mk_dir($dir, $mode = 0777)
{
  if (is_dir($dir)) return true;
  if (!mk_dir(dirname($dir),$mode)) return false;
  return mkdir($dir,$mode,true);
}

// xml编码
function xml_encode($data,$encoding='utf-8',$root="think") {
    $xml = '<?xml version="1.0" encoding="'.$encoding.'"?>';
    $xml.= '<'.$root.'>';
    $xml.= data_to_xml($data);
    $xml.= '</'.$root.'>';
    return $xml;
}

function data_to_xml($data) {
    if(is_object($data)) {
        $data = get_object_vars($data);
    }
    $xml = '';
    foreach($data as $key=>$val) {
        is_numeric($key) && $key="item id=\"$key\"";
        $xml.="<$key>";
        $xml.=(is_array($val)||is_object($val))?data_to_xml($val):$val;
        list($key,)=explode(' ',$key);
        $xml.="</$key>";
    }
    return $xml;
}

/**
 +----------------------------------------------------------
 * Cookie 设置、获取、清除
 +----------------------------------------------------------
 * 1 获取cookie: cookie('name')
 * 2 清空当前设置前缀的所有cookie: cookie(null)
 * 3 删除指定前缀所有cookie: cookie(null,'think_') | 注：前缀将不区分大小写
 * 4 设置cookie: cookie('name','value') | 指定保存时间: cookie('name','value',3600)
 * 5 删除cookie: cookie('name',null)
 +----------------------------------------------------------
 * $option 可用设置prefix,expire,path,domain
 * 支持数组形式对参数设置:cookie('name','value',array('expire'=>1,'prefix'=>'think_'))
 * 支持query形式字符串对参数设置:cookie('name','value','prefix=tp_&expire=10000')
 */
function cookie($name,$value='',$option=null)
{
    // 默认设置
    $config = array(
        'prefix' => C('COOKIE_PREFIX'), // cookie 名称前缀
        'expire' => C('COOKIE_EXPIRE'), // cookie 保存时间
        'path'   => C('COOKIE_PATH'),   // cookie 保存路径
        'domain' => C('COOKIE_DOMAIN'), // cookie 有效域名
    );
    // 参数设置(会覆盖黙认设置)
    if (!empty($option)) {
        if (is_numeric($option))
            $option = array('expire'=>$option);
        elseif( is_string($option) )
            parse_str($option,$option);
        $config  =  array_merge($config,array_change_key_case($option));
    }
    // 清除指定前缀的所有cookie
    if (is_null($name)) {
       if (empty($_COOKIE)) return;
       // 要删除的cookie前缀，不指定则删除config设置的指定前缀
       $prefix = empty($value)? $config['prefix'] : $value;
       if (!empty($prefix))// 如果前缀为空字符串将不作处理直接返回
       {
           foreach($_COOKIE as $key=>$val) {
               if (0 === stripos($key,$prefix)){
                    setcookie($key,'',time()-3600,$config['path'],$config['domain']);
                    unset($_COOKIE[$key]);
               }
           }
       }
       return;
    }
    $name = $config['prefix'].$name;
    if (''===$value){
        return isset($_COOKIE[$name]) ? $_COOKIE[$name] : null;// 获取指定Cookie
    }else {
        if (is_null($value)) {
            setcookie($name,'',time()-3600,$config['path'],$config['domain']);
            unset($_COOKIE[$name]);// 删除指定cookie
        }else {
            // 设置cookie
            $expire = !empty($config['expire'])? time()+ intval($config['expire']):0;
            setcookie($name,$value,$expire,$config['path'],$config['domain']);
            $_COOKIE[$name] = $value;
        }
    }
}

// 显示运行时间、数据库操作、缓存次数、内存使用信息
function get_runtime_info() {
    // 显示运行时间
    G('viewStartTime');
    $showTime   =   'Process: '.G('beginTime','viewEndTime').'s ';
    if(C('SHOW_ADV_TIME')) {
        // 显示详细运行时间
        $showTime .= '( Load:'.G('beginTime','loadTime').'s Init:'.G('loadTime','initTime').'s Exec:'.G('initTime','viewStartTime').'s Template:'.G('viewStartTime','viewEndTime').'s )';
    }
    if(C('SHOW_DB_TIMES') && class_exists('Db',false) ) {
        // 显示数据库操作次数
        $showTime .= ' | DB :'.N('db_query').' queries '.N('db_write').' writes ';
    }
    if(C('SHOW_CACHE_TIMES') && class_exists('Cache',false)) {
        // 显示缓存读写次数
        $showTime .= ' | Cache :'.N('cache_read').' gets '.N('cache_write').' writes ';
    }
    if(MEMORY_LIMIT_ON && C('SHOW_USE_MEM')) {
        // 显示内存开销
        $showTime .= ' | UseMem:'. number_format((memory_get_usage() - $GLOBALS['_startUseMems'])/1024).' kb';
    }
    if(C('SHOW_LOAD_FILE')) {
        $showTime .= ' | LoadFile:'.count(get_included_files());
    }
    return $showTime;
}

// 检查模板缓存是否有效
function check_tmpl_cache($templateFile,$cacheFile) {
    if (!C('TMPL_CACHE_ON')) // 优先对配置检测
        return false;
    if(!is_file($cacheFile)){
        return false;
    }elseif (filemtime($templateFile) > filemtime($cacheFile)) {
        // 模板文件如果有更新则缓存需要更新
        return false;
    }elseif (C('TMPL_CACHE_TIME') != -1 && time() > filemtime($cacheFile)+C('TMPL_CACHE_TIME')) {
        // 缓存是否在有效期
        return false;
    }
    //缓存有效
    return true;
}

// 加载扩展配置文件
function load_ext_config() {
    // 加载动态配置文件
    if(C('LOAD_EXT_CONFIG')) {
        $configs =  C('LOAD_EXT_CONFIG');
        if(is_string($configs)) 
            $configs =  explode(',',$configs);
        foreach ($configs as $key=>$config){
            $file   = (strpos($config,'/') !== false)?$config:C('CONFIG_PATH').$config;
            if(is_file($file)) {
                is_numeric($key)?C(include $file):C($key,include $file);
            }
        }
        C('LOAD_EXT_CONFIG',NULL);
    }
}

// 加载项目
function load_app($appName=APP_NAME) {
    // 项目路径
    $appPath   =  ROOT_PATH.APPS_PATH.$appName.'/';
    // 检测项目
    if(!is_dir($appPath))  halt($appName.'项目不存在');
    // 项目的运行缓存目录
    $runtimePath =  RUNTIME_PATH.$appName.'/';
    // 动态解析项目相关路径
    $config  =  array(
        'CONFIG_PATH'=>$appPath.'Conf/',
        'COMMON_PATH'=>$appPath.'Common/',
        'LIB_PATH'=>$appPath.'Lib/',
        'LANG_PATH'=>$appPath.'Lang/',
        'TMPL_PATH'=>$appPath.'Tpl/',
        'TEMP_PATH'=>$runtimePath.'Temp/',
        'CACHE_PATH'=>$runtimePath.'Cache/',
        'LOG_PATH'=>$runtimePath.'Log/',
        'DATA_PATH'=>$runtimePath.'Data/',
        );
    C($config);

    // 加载项目缓存
    if(is_file($runtimePath.'~'.$appName.'.php') && filemtime($runtimePath.'~'.$appName.'.php')>filemtime(C('CONFIG_PATH').'config.php')) {
        // 直接读取编译后的项目文件
        C(include $runtimePath.'~'.$appName.'.php');
    }else{// 预编译项目
        // 加载项目配置文件
        if(is_file(C('CONFIG_PATH').'config.php'))
            C(include C('CONFIG_PATH').'config.php');
        $common   = '';
        $debug  =  C('APP_DEBUG');
        // 加载项目公共文件
        if(is_file(C('COMMON_PATH').'common.php')) {
            include C('COMMON_PATH').'common.php';
            if(!$debug) // 编译文件
                $common   .= compile(C('COMMON_PATH').'common.php');
        }
        // 加载项目公共文件 (胡晓磊修改)
        if(C('COMMON_FILE_LIST')!=''){
			$common_file_list=explode(',',C('COMMON_FILE_LIST'));
			foreach($common_file_list as $key=>$value){
				include C('COMMON_PATH').$value.'.php';
	            if(!$debug) // 编译文件
	                $common   .= compile(C('COMMON_PATH').$value.'.php');				
			}
        }
        
        // 加载项目编译文件列表
        if(is_file(C('CONFIG_PATH').'app.php')) {
            $list   =  include C('CONFIG_PATH').'app.php';
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
            if(is_file(C('CONFIG_PATH').'debug.php'))
                // 允许项目增加开发模式配置定义
                C(include C('CONFIG_PATH').'debug.php');
        }else{
            $content  = "<?php ".$common."\nreturn ".var_export(C(),true).";\n?>";
            file_put_contents($runtimePath.'~'.$appName.'.php',strip_whitespace($content));
        }
    }
    // 加载项目扩展配置文件
    load_ext_config();
}

// 加载分组
function load_group($group=GROUP_NAME) {
    // 分组配置文件
    if(is_file(C('CONFIG_PATH').$group.'/config.php'))
        C(include C('CONFIG_PATH').$group.'/config.php');
    // 分组函数文件
    if(is_file(C('COMMON_PATH').$group.'/function.php'))
        include C('COMMON_PATH').$group.'/function.php';
    // 日志和缓存按照分组存放
    C(array(
        'TEMP_PATH'=>C('TEMP_PATH').$group.'/',
        'CACHE_PATH'=>C('CACHE_PATH').$group.'/',
        'LOG_PATH'=>C('LOG_PATH').$group.'/',
        ));
}

// 模板内容替换 输出前自动替换 不影响模板编译
function template_content_replace($content) {
    // 系统默认的特殊变量替换
    $replace =  array(
        '../Public'   => APP_TMPL_PATH.'/Public',// 项目公共模板目录
        '__PUBLIC__'  => __ROOT__.'/Public',// 站点公共目录
        '__TMPL__'    =>  APP_TMPL_PATH,  // 项目模板目录
        '__ROOT__'    => __ROOT__,       // 当前网站地址
        '__APP__'     => __APP__,        // 当前项目地址
        '__GROUP__'=> defined('__GROUP__')?__GROUP__:'',
        '__UPLOAD__' =>    __ROOT__.'/Uploads',
        '__URL__'        => __URL__, // 当前模块地址
        '__ACTION__'  => __ACTION__,     // 当前操作地址
        '__SELF__'    => __SELF__,       // 当前页面地址
        /*  如果需要输出以上的特殊字串 可以在项目里面定义如下替换规则即可 
        '--PUBLIC--'  => '__PUBLIC__',
        '--TMPL--'    =>  '__TMPL__',
        '--ROOT--'    => '__ROOT__',
        '--APP--'     => '__APP__',
        '--GROUP--'=> '__GROUP__',
        '--UPLOAD--' =>    '__UPLOAD__',
        '--URL--'        => '__URL__',
        '--ACTION--'  => '__ACTION__',
        '--SELF--'    => '__SELF__',
        */
    );
    // 允许用户自定义模板的字符串替换
    if(is_array(C('TMPL_PARSE_STRING')) )
        $replace =  array_merge($replace,C('TMPL_PARSE_STRING'));
    $content = str_replace(array_keys($replace),array_values($replace),$content);
    return $content;
}

// 获取当前语言 并记录
function get_cur_lang() {
    $lang = C('DEFAULT_LANG');
    // 启用了语言包功能
    // 根据是否启用自动侦测设置获取语言选择
    if (C('LANG_AUTO_DETECT')){
        if(isset($_GET[C('VAR_LANGUAGE')])){// 检测浏览器支持语言
            $lang = $_GET[C('VAR_LANGUAGE')];// url中设置了语言变量
            cookie('think_language',$lang,3600);
        }elseif(cookie('think_language'))// 获取上次用户的选择
            $lang = cookie('think_language');
        elseif(isset($_SERVER['HTTP_ACCEPT_LANGUAGE'])){// 自动侦测浏览器语言
            preg_match('/^([a-z\-]+)/i', $_SERVER['HTTP_ACCEPT_LANGUAGE'], $matches);
            $lang = $matches[1];
            cookie('think_language',$lang,3600);
        }
    }
    return strtolower($lang);
}

// 加载语言包
function load_lang_pack($lang='')
{
    if(''==$lang)   // 自动检测语言
        $lang =  get_cur_lang(); 
    // 不开启语言包功能，仅仅加载框架语言文件直接返回
    if (!C('LANG_SWITCH_ON')){
        L(include THINK_PATH.'Lang/'.$lang.'.php');
        return;
    }
    // 加载框架语言包
    if(is_file(THINK_PATH.'Lang/'.$lang.'.php'))
        L(include THINK_PATH.'Lang/'.$lang.'.php');
    // 读取项目公共语言包
    if (is_file(C('LANG_PATH').$lang.'/common.php'))
        L(include C('LANG_PATH').$lang.'/common.php');
    $group = '';
    // 读取当前分组公共语言包
    if (defined('GROUP_NAME')){
        $group = GROUP_NAME.'/';
        if (is_file(C('LANG_PATH').$lang.'/'.$group.'lang.php'))
            L(include C('LANG_PATH').$lang.'/'.$group.'lang.php');
    }
    // 读取当前模块语言包
    if (is_file(C('LANG_PATH').$lang.'/'.$group.strtolower(MODULE_NAME).'.php'))
        L(include C('LANG_PATH').$lang.'/'.$group.strtolower(MODULE_NAME).'.php');
}

/* 获取模板主题名称 */
function get_template_theme() {
    $theme =  C('DEFAULT_THEME');
    if(C('TMPL_DETECT_THEME')) {// 自动侦测模板主题
        $t = C('VAR_TEMPLATE');
        if (isset($_GET[$t])){
            $theme = $_GET[$t];
            cookie('think_template',$theme);
        }elseif(cookie('think_template')){
            $theme = cookie('think_template');
        }
        // 主题不存在时仍改回使用默认主题
        if(!is_dir(C('TMPL_PATH').$theme))   $theme = C('DEFAULT_THEME');
    }
    return $theme;
}
?>
