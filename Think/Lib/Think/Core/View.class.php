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
 * TOPThink 视图输出
 * 支持缓存和页面压缩
 +------------------------------------------------------------------------------
 * @category   Think
 * @package  Think
 * @subpackage  Core
 * @author liu21st <liu21st@gmail.com>
 * @version  $Id$
 +------------------------------------------------------------------------------
 */
class View extends Think
{
    protected $tVar        =  array(); // 模板输出变量
    protected $trace       = array();  // 页面trace变量
    protected $templateFile  = '';      // 模板文件名
    protected $layout  = false;

    /**
     +----------------------------------------------------------
     * 模板变量赋值
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @param mixed $name
     * @param mixed $value
     +----------------------------------------------------------
     */
    public function assign($name,$value=''){
        if(is_array($name)) {
            $this->tVar   =  array_merge($this->tVar,$name);
        }elseif(is_object($name)){
            foreach($name as $key =>$val)
                $this->tVar[$key] = $val;
        }else {
            $this->tVar[$name] = $value;
        }
    }

    /**
     +----------------------------------------------------------
     * Trace变量赋值
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @param mixed $name
     * @param mixed $value
     +----------------------------------------------------------
     */
    public function trace($title,$value='') {
        if(is_array($title))
            $this->trace   =  array_merge($this->trace,$title);
        else
            $this->trace[$title] = $value;
    }

    /**
     +----------------------------------------------------------
     * 取得模板变量的值
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @param string $name
     +----------------------------------------------------------
     * @return mixed
     +----------------------------------------------------------
     */
    public function get($name){
        if(isset($this->tVar[$name]))
            return $this->tVar[$name];
        else
            return false;
    }
    
    // 调试页面所有的模板变量
    public function traceVar(){
        foreach ($this->tVar as $name=>$val){
            dump($val,1,'['.$name.']<br/>');
        }
    }

    /**
     +----------------------------------------------------------
     * 加载模板和页面输出 可以返回输出内容
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @param string $templateFile 模板文件名 留空为自动获取
     * @param string $charset 模板输出字符集
     * @param string $contentType 输出类型
     +----------------------------------------------------------
     * @return mixed
     +----------------------------------------------------------
     */
    public function display($templateFile='',$charset='',$contentType='') {
        $this->fetch($templateFile,$charset,$contentType,true);
    }

    /**
     +----------------------------------------------------------
     * 加载模板和页面输出
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @param string $templateFile 模板文件名 留空为自动获取
     * @param string $charset 模板输出字符集
     * @param string $contentType 输出类型
     * @param string $display 是否直接显示
     +----------------------------------------------------------
     * @return mixed
     +----------------------------------------------------------
     */
    public function fetch($templateFile='',$charset='',$contentType='',$display=false) {
        G('_viewStartTime');
        if(empty($charset))  $charset = C('DEFAULT_CHARSET');
        if(empty($contentType)) $contentType = C('TMPL_CONTENT_TYPE');
        // 网页字符编码
        header("Content-Type:".$contentType."; charset=".$charset);
        header("Cache-control: private");  //支持页面回跳
        //header("X-Powered-By:TOPThink".THINK_VERSION);
        header("Cache-Control: no-cache, must-revalidate");
        header("Pragma: no-cache");
        //页面缓存
        ob_start();
        ob_implicit_flush(0);
        // 定位模板文件
        $templateFile   = $this->parseTemplateFile($templateFile);
        $this->templateFile   =  $templateFile;
        // 模板缓存文件
        $tmplCacheFile = C('CACHE_PATH').md5($templateFile).C('TMPL_CACHFILE_SUFFIX');
        // 判断模板缓存有效
        if(check_tmpl_cache($templateFile,$tmplCacheFile)) {
            // 分解模板阵列变量
            extract($this->tVar, EXTR_OVERWRITE);
            //载入模版缓存文件
            include $tmplCacheFile;
        }else{
            // 调用模板引擎解析和输出
            Think::instance('ThinkTemplate')->fetch($templateFile,$this->tVar);
        }
        // 获取并清空缓存
        $content = ob_get_clean();
        // 模板内容替换
        $content = template_content_replace($content);
        // 输出模板文件
        return $this->output($content,$display);
    }

    /**
     +----------------------------------------------------------
     * 输出内容文本可以包括Html
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @param string $charset 模板输出字符集
     * @param string $contentType 输出类型
     +----------------------------------------------------------
     * @return mixed
     +----------------------------------------------------------
     */
    public function show($content,$charset='',$contentType=''){
        if(empty($charset))  $charset = C('DEFAULT_CHARSET');
        if(empty($contentType)) $contentType = C('TMPL_CONTENT_TYPE');
        // 网页字符编码
        header("Content-Type:".$contentType."; charset=".$charset);
        header("Cache-control: private");  //支持页面回跳
        // 输出模板文件
        return $this->output($content,true);
    }

    /**
     +----------------------------------------------------------
     * 输出模板
     +----------------------------------------------------------
     * @access protected
     +----------------------------------------------------------
     * @param string $content 模板内容
     * @param boolean $display 是否直接显示
     +----------------------------------------------------------
     * @return mixed
     +----------------------------------------------------------
     */
    protected function output($content,$display) {
        if(C('HTML_CACHE_ON') && defined('HTML_FILE_NAME')) {
            // 生成静态文件
            $path = dirname(HTML_FILE_NAME);
            if(!is_dir($path))   mk_dir($path);
            if( false === file_put_contents( HTML_FILE_NAME , $content ))
                throw_exception(L('_CACHE_WRITE_ERROR_').':'.HTML_FILE_NAME);
        }
        if($display) {
            if(C('SHOW_RUN_TIME')){
                $runtime = '<div  id="think_run_time" class="think_run_time">'.get_runtime_info().'</div>';
                 if(strpos($content,'{__RUNTIME__}'))
                     $content   =  str_replace('{__RUNTIME__}',$runtime,$content);
                 else
                     $content   .=  $runtime;
            }
            echo $content;
            if(C('SHOW_PAGE_TRACE'))   $this->showTrace();
            return null;
        }else { // 返回内容
            return $content;
        }
    }

    /**
     +----------------------------------------------------------
     * 自动定位模板文件
     +----------------------------------------------------------
     * @access private
     +----------------------------------------------------------
     * @param string $templateFile 文件名
     +----------------------------------------------------------
     * @return string
     +----------------------------------------------------------
     * @throws ThinkExecption
     +----------------------------------------------------------
     */
    private function parseTemplateFile($templateFile) {
        if(''==$templateFile) {
            // 如果模板文件名为空 按照默认规则定位
            $templateFile = C('TMPL_FILE_NAME');
        }elseif(false === strpos($templateFile,'.')){
            $templateFile  = str_replace(array('@',':'),'/',$templateFile);
            $count   =  substr_count($templateFile,'/');
            $path   = dirname(C('TMPL_FILE_NAME'));
            for($i=0;$i<$count;$i++)
                $path   = dirname($path);
            $templateFile =  $path.'/'.$templateFile.C('TMPL_TEMPLATE_SUFFIX');
        }
        if(!file_iexists($templateFile))    // 区分大小写
            throw_exception(L('_TEMPLATE_NOT_EXIST_').'['.$templateFile.']');

        return $templateFile;
    }

    /**
     +----------------------------------------------------------
     * 显示页面Trace信息
     +----------------------------------------------------------
     * @access private
     +----------------------------------------------------------
     */
    private function showTrace(){
        // 显示页面Trace信息 读取Trace定义文件
        // 定义格式 return array('当前页面'=>$_SERVER['PHP_SELF'],'通信协议'=>$_SERVER['SERVER_PROTOCOL'],...);
        $traceFile  =   C('CONFIG_PATH').'trace.php';
        $_trace =   is_file($traceFile)? include $traceFile : array();
         // 系统默认显示信息
        $this->trace('当前页面',    $_SERVER['REQUEST_URI']);
        $this->trace('模板缓存',    C('CACHE_PATH').md5($this->templateFile).C('TMPL_CACHFILE_SUFFIX'));
        $this->trace('请求方法',    $_SERVER['REQUEST_METHOD']);
        $this->trace('通信协议',    $_SERVER['SERVER_PROTOCOL']);
        $this->trace('请求时间',    date('Y-m-d H:i:s',$_SERVER['REQUEST_TIME']));
        $this->trace('会话ID'  ,    session_id());
        $log    =   Log::$log;
        $this->trace('日志记录',count($log)?count($log).'条日志<br/>'.implode('<br/>',$log):'无日志记录');
        $files =  get_included_files();
        $this->trace('加载文件',    count($files).str_replace("\n",'<br/>',substr(substr(print_r($files,true),7),0,-2)));
        $_trace =   array_merge($_trace,$this->trace);
        // 调用Trace页面模板
        include C('TMPL_TRACE_FILE');
    }

}//
?>
