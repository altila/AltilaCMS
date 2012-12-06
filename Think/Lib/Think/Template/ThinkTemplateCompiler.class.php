<?php
// +----------------------------------------------------------------------
// | TOPThink
// +----------------------------------------------------------------------
// | Copyright (c) 2009 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
// $Id$

class ThinkTemplateCompiler {
    protected $literal  =  array();  //Literal缓存
    public $templateFile = '';   // 模板文件名
    protected $tpl = null; // 模板引擎实例
    protected $comparison = array(' nheq '=>' !== ',' heq '=>' === ',' neq '=>' != ',' eq '=>' == ',' egt '=>' >= ',' gt '=>' > ',' elt '=>' <= ',' lt '=>' < ');
    // 构造方法
    public function __construct()
    {
        $this->tpl       = Think::instance('ThinkTemplate');
    }
    // 模板编译
    public function parse($tmplContent,$templateFile=''){
        $this->templateFile = $templateFile;
        //模板标签解析
        $tmplContent = $this->parseTag($tmplContent);
        if(ini_get('short_open_tag'))
            // 开启短标签的情况要将<?标签用echo方式输出 否则无法正常输出xml标识
            $tmplContent = preg_replace('/(<\?(?!php|=|$))/i', '<?php echo \'\\1\'; ?>'."\n", $tmplContent );
        // 还原被替换的Literal标签
        $tmplContent = preg_replace('/<!--###literal(\d)###-->/eis',"\$this->restoreLiteral('\\1')",$tmplContent);
        // 添加安全代码
        $tmplContent  =  '<?php if (!defined(\'THINK_PATH\')) exit();?>'.trim($tmplContent);
        if(C('TMPL_STRIP_SPACE')) {
            /* 去除html空格与换行 */
            $find     = array("~>\s+<~","~>(\s+\n|\r)~");
            $replace  = array("><",">");
            $tmplContent = preg_replace($find, $replace, $tmplContent);
        }
        return trim($tmplContent);
    }

    // 解析模板标签
    public function parseTag($content) {
        // 获取导入的标签库
        $tagLibs =  $this->getIncludeTagLib($content);
        // 首先替换literal标签内容
        $tagLibBegin   =  $this->tpl->taglib_begin;
        $tagLibEnd      = $this->tpl->taglib_end;
        $content = preg_replace('/'.$tagLibBegin.'literal'.$tagLibEnd.'(.*?)'.$tagLibBegin.'\/literal'.$tagLibEnd.'/eis',"\$this->parseLiteral('\\1')",$content);
        foreach ($tagLibs as $tagLib){
            // 解析标签库的XML标签
            $this->parseXmlTag($content,$tagLib);
        }
        // 预先加载的标签库 无需在每个模板中使用taglib标签加载
        if(C('TAGLIB_PRE_LOAD')) {
            $tagLibs =  explode(',',C('TAGLIB_PRE_LOAD'));
            foreach ($taglibs as $tag){
                $this->parseXmlTag($content,$tag);
            }
        }
        // 内置标签库 无需使用taglib标签导入就可以使用
        $tagLibs =  explode(',',C('TAGLIB_BUILD_IN'));
        foreach ($tagLibs as $tag){
            $this->parseXmlTag($content,$tag,true);
        }
        // 解析普通标签 {tagName:}
        $begin = $this->tpl->tmpl_begin;
        $end   = $this->tpl->tmpl_end;
        $content = preg_replace('/('.$begin.')(\S.+?)('.$end.')/eis',"\$this->parseCommonTag('\\2')",$content);
        return $content;
    }

    // 解析XML标签
    protected function parseXmlTag(&$content,$tagLib='Cx',$hide=false) {
        // 载入标签库解析类
        require_cache(dirname(__FILE__).'/TagLib/TagLib'.ucwords($tagLib).'.class.php');
        $class  =  Think::instance('TagLib'.ucwords($tagLib));
        $class->templateFile = $this->templateFile;
        $class->parseTagLib($content,$tagLib,$hide);
    }

    // 解析标签库 用于具体的标签库类 公共使用
    public function parseTagLib(&$content,$tagLib='Cx',$hide=false) {
        $begin = $this->tpl->taglib_begin;
        $end   = $this->tpl->taglib_end;
        foreach ($this->tags as $name=>$val){
            $tags = array();
            if(isset($val['alias'])) {// 别名设置
                $tags = explode(',',$val['alias']);
                $tags[]  =  $name;
            }else{
                $tags[] = $name;
            }
            $level = isset($val['level'])?$val['level']:1;
            $closeTag = isset($val['close'])?$val['close']:true;
            foreach ($tags as $tag){
                // 实际要解析的标签名称
                $parseTag = !$hide?$tagLib.':'.$tag:$tag;
                if(empty($val['attr'])){
                    // 无属性标签
                    if(!$closeTag) {
                        $content = preg_replace('/'.$begin.$parseTag.'(\s*?)\/(\s*?)'.$end.'/eis',"\$this->parseXmlItem('$tag','\\1','')",$content);
                    }else{
                        for($i=0;$i<$level;$i++)
                            $content = preg_replace('/'.$begin.$parseTag.'(\s*?)'.$end.'(.*?)'.$begin.'\/'.$parseTag.'(\s*?)'.$end.'/eis',"\$this->parseXmlItem('$tag','\\1','\\2')",$content);
                    }
                }else{
                    if(!$closeTag) {
                        $content = preg_replace('/'.$begin.$parseTag.'\s(.*?)\/(\s*?)'.$end.'/eis',"\$this->parseXmlItem('$tag','\\1','')",$content);
                    }else{
                        for($i=0;$i<$level;$i++)
                            $content = preg_replace('/'.$begin.$parseTag.'\s(.*?)'.$end.'(.*?)'.$begin.'\/'.$parseTag.'(\s*?)'.$end.'/eis',"\$this->parseXmlItem('$tag','\\1','\\2')",$content);
                    }
                }
            }
        }
    }
    // 解析标签属性
    public function parseXmlAttr($attr,$tag)
    {
        //XML解析安全过滤
        $attr = str_replace('&','___', $attr);
        $xml =  '<tpl><tag '.$attr.' /></tpl>';
        $xml = simplexml_load_string($xml);
        if(!$xml) {
            throw_exception(L('_XML_TAG_ERROR_').' : '.$attr);
        }
        $xml = (array)($xml->tag->attributes());
        $array = array_change_key_case($xml['@attributes']);
        if($array) {
            foreach ($array as $key=>$val){
                $array[$key] = str_replace('___','&',$val);
            }/*
            $attrs  = explode(',',$this->tags[strtolower($tag)]['attr']);
            foreach($attrs as $name) {
                if( isset($array[$name])) {
                    $array[$name] = str_replace('___','&',$array[$name]);
                }
            }*/
            return $array;
        }
    }

    // 解析某个标签
    protected function parseXmlItem($tag,$attr,$content) {
        $attr = stripslashes($attr);
        $content = stripslashes(trim($content));
        $fun  =  '_'.$tag;
        return $this->$fun($attr,$this->parseTag($content));
    }

    // 条件解析
    public function parseCondition($condition) {
        $condition = str_ireplace(array_keys($this->comparison),array_values($this->comparison),$condition);
        $condition = preg_replace('/\$(\w+):(\w+)\s/is','$\\1->\\2 ',$condition);
        switch(strtolower(C('TMPL_VAR_IDENTIFY'))) {
            case 'array': // 识别为数组
                $condition = preg_replace('/\$(\w+)\.(\w+)\s/is','$\\1["\\2"] ',$condition);
                break;
            case 'obj':  // 识别为对象
                $condition = preg_replace('/\$(\w+)\.(\w+)\s/is','$\\1->\\2 ',$condition);
                break;
            default:  // 自动判断数组或对象 只支持二维
                $condition = preg_replace('/\$(\w+)\.(\w+)\s/is','(is_array($\\1)?$\\1["\\2"]:$\\1->\\2) ',$condition);
        }
        return $condition;
    }

    // 创建变量
    public function autoBuildVar($name) {
        if('Think.' == substr($name,0,6)){
            // 特殊变量
            return $this->parseThink($name);
        }elseif(strpos($name,'.')) {
            $vars = explode('.',$name);
            $var  =  array_shift($vars);
            switch(strtolower(C('TMPL_VAR_IDENTIFY'))) {
                case 'array': // 识别为数组
                    $name = '$'.$var;
                    foreach ($vars as $key=>$val)
                        $name .= '[\''.$val.'\']';
                    break;
                case 'obj':  // 识别为对象
                    $name = '$'.$var;
                    foreach ($vars as $key=>$val)
                        $name .= '->'.$val;
                    break;
                default:  // 自动判断数组或对象 只支持二维
                    $name = 'is_array($'.$var.')?$'.$var.'[\''.$vars[0].'\']:$'.$var.'->'.$vars[0];
            }
        }elseif(strpos($name,':')){
            // 额外的对象方式支持
            $name   =   '$'.str_replace(':','->',$name);
        }elseif(!defined($name)) {
            $name = '$'.$name;
        }
        return $name;
    }

    // 解析变量
    protected function parseVar($varStr) {
        $varStr = trim($varStr);
        static $_varParseList = array();
        //如果已经解析过该变量字串，则直接返回变量值
        if(isset($_varParseList[$varStr])) return $_varParseList[$varStr];
        $parseStr ='';
        $varExists = true;
        if(!empty($varStr)){
            $varArray = explode('|',$varStr);
            //取得变量名称
            $var = array_shift($varArray);
            //非法变量过滤 不允许在变量里面使用 ->
            //TODO：还需要继续完善
            if(preg_match('/->/is',$var))  return '';
            if('Think.' == substr($var,0,6)){
                // 所有以Think.打头的以特殊变量对待 无需模板赋值就可以输出
                $name = $this->parseThink($var);
            }elseif( false !== strpos($var,'.')) {
                //支持 {$var.property}
                $vars = explode('.',$var);
                $var  =  array_shift($vars);
                switch(strtolower(C('TMPL_VAR_IDENTIFY'))) {
                    case 'array': // 识别为数组
                        $name = '$'.$var;
                        foreach ($vars as $key=>$val)
                            $name .= '["'.$val.'"]';
                        break;
                    case 'obj':  // 识别为对象
                        $name = '$'.$var;
                        foreach ($vars as $key=>$val)
                            $name .= '->'.$val;
                        break;
                    default:  // 自动判断数组或对象 只支持二维
                        $name = 'is_array($'.$var.')?$'.$var.'["'.$vars[0].'"]:$'.$var.'->'.$vars[0];
                }
            }elseif(false !==strpos($var,'::')){
                //支持 {$var:property} 方式输出对象的属性
                $vars = explode('::',$var);
                $var  =  str_replace('::','->',$var);
                $name = "$".$var;
                $var  = $vars[0];
            }elseif(false !== strpos($var,'[')) {
                //支持 {$var['key']} 方式输出数组
                $name = "$".$var;
                preg_match('/(.+?)\[(.+?)\]/is',$var,$match);
                $var = $match[1];
            }else {
                $name = "$$var";
            }
            //对变量使用函数
            if(count($varArray)>0)
                $name = $this->parseFun($name,$varArray);
            $parseStr = '<?php echo ('.$name.'); ?>';
        }
        $_varParseList[$varStr] = $parseStr;
        return $parseStr;
    }

    // 解析变量函数
    protected function parseFun($name,$varArray) {
        //对变量使用函数
        $length = count($varArray);
        //取得模板禁止使用函数列表
        $template_deny_funs = explode(',',C('TMPL_DENY_FUNC_LIST'));
        for($i=0;$i<$length ;$i++ ){
            if (0===stripos($varArray[$i],'default='))
                $args = explode('=',$varArray[$i],2);
            else
                $args = explode('=',$varArray[$i]);
            //模板函数过滤
            $args[0] = trim($args[0]);
            switch(strtolower($args[0])) {
            case 'default':  // 特殊模板函数
                $name   = '('.$name.')?('.$name.'):'.$args[1];
                break;
            default:  // 通用模板函数
                if(!in_array($args[0],$template_deny_funs)){
                    if(isset($args[1])){
                        if(strstr($args[1],'###')){
                            $args[1] = str_replace('###',$name,$args[1]);
                            $name = "$args[0]($args[1])";
                        }else{
                            $name = "$args[0]($name,$args[1])";
                        }
                    }else if(!empty($args[0])){
                        $name = "$args[0]($name)";
                    }
                }
            }
        }
        return $name;
    }

    // 搜索模板页面中包含的TagLib库
    public function getIncludeTagLib(& $content)
    {
        //搜索是否有TagLib标签
        $find = preg_match('/'.$this->tpl->taglib_begin.'taglib\s(.+?)(\s*?)\/'.$this->tpl->taglib_end.'\W/is',$content,$matches);
        $tagLib  =  array();
        if($find) {
            //替换TagLib标签
            $content = str_replace($matches[0],'',$content);
            //解析TagLib标签
            $tagLibs = $matches[1];
            $xml =  '<tpl><tag '.$tagLibs.' /></tpl>';
            $xml = simplexml_load_string($xml);
            if(!$xml)
                throw_exception(L('_XML_TAG_ERROR_'));
            $xml = (array)($xml->tag->attributes());
            $array = array_change_key_case($xml['@attributes']);
            $tagLib = explode(',',$array['name']);
        }
        return $tagLib;
    }

    // load普通标签
    public function parseLoad($str) {
        $type       = strtolower(substr(strrchr($str, '.'),1));
        $parseStr = '';
        if($type=='js') {
            $parseStr .= '<script type="text/javascript" src="'.$str.'"></script>';
        }elseif($type=='css') {
            $parseStr .= '<link rel="stylesheet" type="text/css" href="'.$str.'" />';
        }
        return $parseStr;
    }

    // 解析包含标签
    public function parseInclude($tmplPublicName) {
        if(substr($tmplPublicName,0,1)=='$')
            //支持加载变量文件名
            $tmplPublicName = $this->tpl->get(substr($tmplPublicName,1));

        if(is_file($tmplPublicName)) {
            // 直接包含文件
            $parseStr = file_get_contents($tmplPublicName);
        }else {
            $tmplPublicName  = str_replace(array('@',':'),'/',$tmplPublicName);
            $count   =  substr_count($tmplPublicName,'/'); 
            $path   = dirname(C('TMPL_FILE_NAME'));
            for($i=0;$i<$count;$i++)
                $path   = dirname($path);
            $templateFile =  $path.'/'.$tmplPublicName.$this->tpl->template_suffix;
            $parseStr = file_get_contents($templateFile);
        }
        //再次对包含文件进行模板分析
        return $this->parseTag($parseStr);
    }

    // 解析特殊变量
    public function parseThink($varStr) {
        $vars = explode('.',$varStr);
        $vars[1] = strtoupper(trim($vars[1]));
        $parseStr = '';
        if(count($vars)>=3){
            $vars[2] = trim($vars[2]);
            switch($vars[1]){
                case 'SERVER':
                    $parseStr = '$_SERVER[\''.strtoupper($vars[2]).'\']';break;
                case 'GET':
                    $parseStr = '$_GET[\''.$vars[2].'\']';break;
                case 'POST':
                    $parseStr = '$_POST[\''.$vars[2].'\']';break;
                case 'COOKIE':
                    if(isset($vars[3])) {
                        $parseStr = '$_COOKIE[\''.$vars[2].'\'][\''.$vars[3].'\']';
                    }else{
                        $parseStr = '$_COOKIE[\''.$vars[2].'\']';
                    }break;
                case 'SESSION':
                    if(isset($vars[3])) {
                        $parseStr = '$_SESSION[\''.$vars[2].'\'][\''.$vars[3].'\']';
                    }else{
                        $parseStr = '$_SESSION[\''.$vars[2].'\']';
                    }
                    break;
                case 'ENV':
                    $parseStr = '$_ENV[\''.$vars[2].'\']';break;
                case 'REQUEST':
                    $parseStr = '$_REQUEST[\''.$vars[2].'\']';break;
                case 'CONST':
                    $parseStr = strtoupper($vars[2]);break;
                case 'LANG':
                    $parseStr = 'L("'.$vars[2].'")';break;
				case 'CONFIG':
                    if(isset($vars[3])) {
                        $vars[2] .= '.'.$vars[3];
                    }
                    $parseStr = 'C("'.$vars[2].'")';break;
                default:break;
            }
        }else if(count($vars)==2){
            switch($vars[1]){
                case 'NOW':
                    $parseStr = "NOW_TIME";
                    break;
                case 'VERSION':
                    $parseStr = 'THINK_VERSION';
                    break;
                case 'TEMPLATE':
                    $parseStr = 'C("TMPL_FILE_NAME")';
                    break;
                case 'LDELIM':
                    $parseStr = 'C("TMPL_L_DELIM")';
                    break;
                case 'RDELIM':
                    $parseStr = 'C("TMPL_R_DELIM")';
                    break;
                default:
                    if(defined($vars[1]))
                        $parseStr = $vars[1];
            }
        }
        return $parseStr;
    }

    protected function parseCommonTag($tagStr) {
        //if (MAGIC_QUOTES_GPC) {
            $tagStr = stripslashes($tagStr);
        //}
        //还原非模板标签
        if(preg_match('/^[\s|\d]/is',$tagStr))
            //过滤空格和数字打头的标签
            return C('TMPL_L_DELIM') . $tagStr .C('TMPL_R_DELIM');
        $flag =  substr($tagStr,0,1);
        $name   = substr($tagStr,1);
        if('$' == $flag){
            //解析模板变量 格式 {$varName}
            return $this->parseVar($name);
        }elseif(':' == $flag){
            // 输出某个函数的结果
            return  '<?php echo '.$name.';?>';
        }elseif('~' == $flag){
            // 执行某个函数
            return  '<?php '.$name.';?>';
        }elseif('&' == $flag){
            // 输出配置参数
            return '<?php echo C("'.$name.'");?>';
        }elseif('%' == $flag){
            // 输出语言变量
            return '<?php echo L("'.$name.'");?>';
		}elseif('@' == $flag){
			// 输出SESSION变量
            if(strpos($name,'.')) {
                $array   =  explode('.',$name);
	    		return '<?php echo $_SESSION["'.$array[0].'"]["'.$array[1].'"];?>';
            }else{
    			return '<?php echo $_SESSION["'.$name.'"];?>';
            }
		}elseif('#' == $flag){
			// 输出COOKIE变量
            if(strpos($name,'.')) {
                $array   =  explode('.',$name);
	    		return '<?php echo $_COOKIE["'.$array[0].'"]["'.$array[1].'"];?>';
            }else{
    			return '<?php echo $_COOKIE["'.$name.'"];?>';
            }
		}elseif('.' == $flag){
            // 输出GET变量
            return '<?php echo $_GET["'.$name.'"];?>';
        }elseif('^' == $flag){
            // 输出POST变量
            return '<?php echo $_POST["'.$name.'"];?>';
        }elseif('*' == $flag){
            // 输出常量
            return '<?php echo constant("'.$name.'");?>';
        }
        $tagStr = trim($tagStr);
        if(substr($tagStr,0,2)=='//' || (substr($tagStr,0,2)=='/*' && substr($tagStr,-2)=='*/'))
            //注释标签
            return '';
        //解析其它标签
        //统一标签格式 {TagName:args [|content]}
        $pos =  strpos($tagStr,':');
        $tag  =  substr($tagStr,0,$pos);
        $args = trim(substr($tagStr,$pos+1));
        //解析标签内容
        if(!empty($args)) {
            $tag  =  strtolower($tag);
            switch($tag){
                case 'include':
                    return $this->parseInclude($args);
                    break;
                case 'load':
                    return $this->parseLoad($args);
                    break;
                //这里扩展其它标签
                //…………
                default:
                    if(C('TAG_EXTEND_PARSE')) {
                        $method = C('TAG_EXTEND_PARSE');
                        if(array_key_exists($tag,$method))
                            return $method[$tag]($args);
                    }
            }
        }
        return C('TMPL_L_DELIM') . $tagStr .C('TMPL_R_DELIM');
    }

    // literal标签
    protected function parseLiteral($content) {
        if(trim($content)=='')
            return '';
        $content = stripslashes($content);
        $i  =   count($this->literal);
        $parseStr   =   "<!--###literal{$i}###-->";
        $this->literal[$i]  = $content;
        return $parseStr;
    }    
    protected function restoreLiteral($tag) {
        // 还原literal标签
        $parseStr   =  $this->literal[$tag];
        // 销毁literal记录
        unset($this->literal[$tag]);
        return $parseStr;
    }

}
?>