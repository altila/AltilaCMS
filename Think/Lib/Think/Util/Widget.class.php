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
 * TOPThink Widget类 抽象类
 +------------------------------------------------------------------------------
 * @category   Think
 * @package  Think
 * @subpackage  Util
 * @author liu21st <liu21st@gmail.com>
 * @version  $Id$
 +------------------------------------------------------------------------------
 */
abstract class Widget extends Think {

    // 使用的模板引擎 每个Widget可以单独配置不受系统影响
    protected $template =  '';

    /**
     +----------------------------------------------------------
     * 渲染输出 render方法是Widget唯一的接口
     * 使用字符串返回 不能有任何输出
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @param mixed $data  要渲染的数据
     +----------------------------------------------------------
     * @return string
     +----------------------------------------------------------
     */
    abstract public function render($data);

    /**
     +----------------------------------------------------------
     * 渲染模板输出 供render方法内部调用
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @param string $templateFile  模板文件
     * @param mixed $var  模板变量
     * @param string $charset  模板编码
     +----------------------------------------------------------
     * @return string
     +----------------------------------------------------------
     */
    protected function renderFile($templateFile='',$var='',$charset='utf-8') {
        ob_start();
        ob_implicit_flush(0);
        
        if(!file_iexists($templateFile)){
            // 自动定位模板文件
            $name   = substr(get_class($this),0,-6);
            $filename   =  empty($templateFile)?$name:$templateFile;
            $templateFile = C('LIB_PATH').'Widget/'.$name.'/'.$filename.C('TMPL_TEMPLATE_SUFFIX');
            if(!file_iexists($templateFile))
                throw_exception(L('_TEMPLATE_NOT_EXIST_').'['.$templateFile.']');
        }
        $template   =  $this->template?$this->template:strtolower(C('TMPL_ENGINE_TYPE')?C('TMPL_ENGINE_TYPE'):'php');
        if('php' == $template) {
            // 使用PHP模板
            if(!empty($var)) extract($var, EXTR_OVERWRITE);
            // 直接载入PHP模板
            include $templateFile;
        }else{
            // 模板文件需要重新编译 支持第三方模板引擎
            // 调用模板引擎解析和输出
            Think::instance('ThinkTemplate')->fetch($templateFile,$var,$charset);
        }
        $content = ob_get_clean();
        return $content;
    }
}
?>