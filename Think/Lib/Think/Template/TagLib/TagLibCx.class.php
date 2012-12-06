<?php
// +----------------------------------------------------------------------
// | TOPThink [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2009 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
// $Id$

class TagLibCx extends ThinkTemplateCompiler{
    // 标签定义
    protected $tags   =  array(
        // 标签定义： attr 属性列表 close 是否闭合（0 或者1 默认1） alias 标签别名 level 嵌套层次
        'php'=>array(),
        'unique'=>array(),
        'volist'=>array('attr'=>'name,id,offset,length,key,mod','level'=>6,'alias'=>'iterate'),
        'foreach'=>array('attr'=>'name,item','level'=>6),
        'include'=>array('attr'=>'file','close'=>0),
        'if'=>array('attr'=>'condition'),
        'elseif'=>array('attr'=>'condition','close'=>0),
        'else'=>array('attr'=>'','close'=>0),
        'switch'=>array('attr'=>'name','level'=>3),
        'case'=>array('attr'=>'value,break'),
        'default'=>array('attr'=>'','close'=>0),
        'compare'=>array('attr'=>'name,value,type','level'=>3,'alias'=>'eq,equal,notequal,neq,gt,lt,egt,elt,heq,nheq'),
        'range'=>array('attr'=>'name,value,type','level'=>3,'alias'=>'in,notin'),
        'empty'=>array('attr'=>'name','level'=>3),
        'notempty'=>array('attr'=>'name','level'=>3),
        'present'=>array('attr'=>'name','level'=>3),
        'notpresent'=>array('attr'=>'name','level'=>3),
        'defined'=>array('attr'=>'name','level'=>3),
        'notdefined'=>array('attr'=>'name','level'=>3),
        'import'=>array('attr'=>'file,href,type,value,basepath','close'=>0,'alias'=>'load,css,js'),
        'assign'=>array('attr'=>'name,value','close'=>0),
        'define'=>array('attr'=>'name,value','close'=>0),
        );

    //---------------标签解析方法----------------------
    // php
    public function _php($attr,$content) {
        $parseStr = '<?php '.$content.' ?>';
        return $parseStr;
    }
    // include
    public function _include($attr,$content)
    {
        $tag    = $this->parseXmlAttr($attr,'include');
        $file   =   $tag['file'];
        return $this->parseInclude($file);
    }
    // volist
    public function _volist($attr,$content)
    {
        static $_iterateParseCache = array();
        //如果已经解析过，则直接返回变量值
        $cacheIterateId = md5($attr.$content);
        if(isset($_iterateParseCache[$cacheIterateId]))
            return $_iterateParseCache[$cacheIterateId];
        $tag      = $this->parseXmlAttr($attr,'volist');
        $name   = $tag['name'];
        $id        = $tag['id'];
        $empty  = isset($tag['empty'])?$tag['empty']:'';
        $key     =   !empty($tag['key'])?$tag['key']:'i';
        $mod    =   isset($tag['mod'])?$tag['mod']:'2';
        $parseStr   =  '<?php ';
        if(0===strpos($name,':')) {
            $parseStr   .= '$_result='.substr($name,1).';';
            $name   = '$_result';
        }else{
            $name   = $this->autoBuildVar($name);
        }
        $parseStr  .=  'if(is_array('.$name.')): $'.$key.' = 0;';
        if(isset($tag['length']) && '' !=$tag['length'] ) {
            $parseStr  .= ' $__LIST__ = array_slice('.$name.','.$tag['offset'].','.$tag['length'].',true);';
        }elseif(isset($tag['offset'])  && '' !=$tag['offset']){
            $parseStr  .= ' $__LIST__ = array_slice('.$name.','.$tag['offset'].',count($__LIST__),true);';
        }else{
            $parseStr .= ' $__LIST__ = '.$name.';';
        }
        $parseStr .= 'if( count($__LIST__)==0 ) : echo "'.$empty.'" ;';
        $parseStr .= 'else: ';
        $parseStr .= 'foreach($__LIST__ as $key=>$'.$id.'): ';
        $parseStr .= '++$'.$key.';';
        $parseStr .= '$mod = ($'.$key.' % '.$mod.' )?>';
        $parseStr .= $content;
        $parseStr .= '<?php endforeach; endif; else: echo "'.$empty.'" ;endif; ?>';
        $_iterateParseCache[$cacheIterateId] = $parseStr;

        if(!empty($parseStr)) {
            return $parseStr;
        }
        return ;
    }
    // foreach
    public function _foreach($attr,$content)
    {
        static $_iterateParseCache = array();
        //如果已经解析过，则直接返回变量值
        $cacheIterateId = md5($attr.$content);
        if(isset($_iterateParseCache[$cacheIterateId]))
            return $_iterateParseCache[$cacheIterateId];
        $tag   = $this->parseXmlAttr($attr,'foreach');
        $name= $tag['name'];
        $item  = $tag['item'];
        $key   =   !empty($tag['key'])?$tag['key']:'key';
        $parseStr   =  '<?php ';
        if(0===strpos($name,':')) {
            $parseStr   .= '$_result='.substr($name,1).';';
            $name   = '$_result';
        }else{
            $name   = $this->autoBuildVar($name);
        }
        $parseStr .=  ' if(is_array('.$name.')): foreach('.$name.' as $'.$key.'=>$'.$item.'): ?>';
        $parseStr .= $content;
        $parseStr .= '<?php endforeach; endif; ?>';
        $_iterateParseCache[$cacheIterateId] = $parseStr;
        if(!empty($parseStr)) {
            return $parseStr;
        }
        return ;
    }
    // if
    public function _if($attr,$content) {
        $tag          = $this->parseXmlAttr($attr,'if');
        $condition   = $this->parseCondition($tag['condition']);
        $parseStr  = '<?php if('.$condition.'): ?>'.$content.'<?php endif; ?>';
        return $parseStr;
    }
    public function _elseif($attr,$content) {
        $tag          = $this->parseXmlAttr($attr,'elseif');
        $condition   = $this->parseCondition($tag['condition']);
        $parseStr   = '<?php elseif('.$condition.'): ?>';
        return $parseStr;
    }
    public function _else($attr) {
        $parseStr = '<?php else: ?>';
        return $parseStr;
    }
    // switch
    public function _switch($attr,$content) {
        $tag = $this->parseXmlAttr($attr,'switch');
        $name = $tag['name'];
        $varArray = explode('|',$name);
        $name   =   array_shift($varArray);
        $name = $this->autoBuildVar($name);
        if(count($varArray)>0)
            $name = $this->parseFun($name,$varArray);
        $parseStr = '<?php switch('.$name.'): ?>'.$content.'<?php endswitch;?>';
        return $parseStr;
    }
    // case
    public function _case($attr,$content) {
        $tag = $this->parseXmlAttr($attr,'case');
        $value = $tag['value'];
        if('$' == substr($value,0,1)) {
            $varArray = explode('|',$value);
            $value	=	array_shift($varArray);
            $value  =  $this->autoBuildVar(substr($value,1));
            if(count($varArray)>0)
                $value = $this->parseFun($value,$varArray);
            $value   =  'case '.$value.': ';
        }elseif(strpos($value,'|')){
            $values  =  explode('|',$value);
            $value   =  '';
            foreach ($values as $val){
                $value   .=  'case "'.addslashes($val).'": ';
            }
        }else{
            $value	=	'case "'.$value.'": ';
        }
        $parseStr = '<?php '.$value.' ?>'.$content;
        if(empty($tag['break']) || 'true' == $tag['break']) {
            $parseStr .= '<?php break;?>';
        }
        return $parseStr;
    }
    // default
    public function _default($attr) {
        $parseStr = '<?php default: ?>';
        return $parseStr;
    }
    // compare
    public function _compare($attr,$content,$type='eq')
    {
        $tag      = $this->parseXmlAttr($attr,'compare');
        $name   = $tag['name'];
        $value   = $tag['value'];
        $type    =   isset($tag['type'])?$tag['type']:$type;
        $type    =   $this->parseCondition(' '.$type.' ');
        $varArray = explode('|',$name);
        $name   =   array_shift($varArray);
        $name = $this->autoBuildVar($name);
        if(count($varArray)>0)
            $name = $this->parseFun($name,$varArray);
        if('$' == substr($value,0,1)) {
            $value  =  $this->autoBuildVar(substr($value,1));
        }else {
            $value  =   '"'.$value.'"';
        }
        $parseStr = '<?php if(('.$name.') '.$type.' '.$value.'): ?>'.$content.'<?php endif; ?>';
        return $parseStr;
    }
    // range
    public function _range($attr,$content,$type='in') {
        $tag      = $this->parseXmlAttr($attr,'range');
        $name   = $tag['name'];
        $value   = $tag['value'];
        $varArray = explode('|',$name);
        $name   =   array_shift($varArray);
        $name = $this->autoBuildVar($name);
        $type    =   isset($tag['type'])?$tag['type']:$type;
        $fun  =  ($type == 'in')? 'in_array'    :   '!in_array';
        if(count($varArray)>0)
            $name = $this->parseFun($name,$varArray);
        if('$' == substr($value,0,1)) {
            $value  =  $this->autoBuildVar(substr($value,1));
            $parseStr = '<?php if('.$fun.'(('.$name.'), is_array('.$value.')?'.$value.':explode(\',\','.$value.'))): ?>'.$content.'<?php endif; ?>';
        }else{
            $value  =   '"'.$value.'"';
            $parseStr = '<?php if('.$fun.'(('.$name.'), explode(\',\','.$value.'))): ?>'.$content.'<?php endif; ?>';
        }
        return $parseStr;
    }
    public function _in($attr,$content) {
        return $this->_range($attr,$content,'in');
    }
    // range标签的别名 用于notin判断
    public function _notin($attr,$content) {
        return $this->_range($attr,$content,'notin');
    }
    // present
    public function _present($attr,$content)
    {
        $tag      = $this->parseXmlAttr($attr,'present');
        $name   = $tag['name'];
        $name   = $this->autoBuildVar($name);
        $parseStr  = '<?php if(isset('.$name.')): ?>'.$content.'<?php endif; ?>';
        return $parseStr;
    }
    public function _notpresent($attr,$content)
    {
        $tag      = $this->parseXmlAttr($attr,'present');
        $name   = $tag['name'];
        $name   = $this->autoBuildVar($name);
        $parseStr  = '<?php if(!isset('.$name.')): ?>'.$content.'<?php endif; ?>';
        return $parseStr;
    }
    // empty
    public function _empty($attr,$content)
    {
        $tag      = $this->parseXmlAttr($attr,'empty');
        $name   = $tag['name'];
        $name   = $this->autoBuildVar($name);
        $parseStr  = '<?php if(empty('.$name.')): ?>'.$content.'<?php endif; ?>';
        return $parseStr;
    }
    public function _notempty($attr,$content)
    {
        $tag      = $this->parseXmlAttr($attr,'empty');
        $name   = $tag['name'];
        $name   = $this->autoBuildVar($name);
        $parseStr  = '<?php if(!empty('.$name.')): ?>'.$content.'<?php endif; ?>';
        return $parseStr;
    }
    // define
    public function _defined($attr,$content)
    {
        $tag        = $this->parseXmlAttr($attr,'defined');
        $name     = $tag['name'];
        $parseStr = '<?php if(defined("'.$name.'")): ?>'.$content.'<?php endif; ?>';
        return $parseStr;
    }
    public function _notdefined($attr,$content)
    {
        $tag        = $this->parseXmlAttr($attr,'defined');
        $name     = $tag['name'];
        $parseStr = '<?php if(!defined("'.$name.'")): ?>'.$content.'<?php endif; ?>';
        return $parseStr;
    }
    // import
    public function _import($attr,$content,$isFile=false,$type='')
    {
        $tag  = $this->parseXmlAttr($attr,'import');
        $file   = !empty($tag['file'])?$tag['file']:$tag['href'];
        $parseStr = '';
        $endStr   = '';
        // 判断是否存在加载条件 允许使用函数判断(默认为isset)
        if (!empty($tag['value']))
        {
            $varArray  = explode('|',$tag['value']);
            $name      = array_shift($varArray);
            $name      = $this->autoBuildVar($name);
            if (!empty($varArray))
                $name  = $this->tpl->parseVarFunction($name,$varArray);
            else
                $name  = 'isset('.$name.')';
            $parseStr .= '<?php if('.$name.'): ?>';
            $endStr    = '<?php endif; ?>';
        }
        if($isFile) {
            // 根据文件名后缀自动识别
            $type = $type?$type:(!empty($tag['type'])?strtolower($tag['type']):null);
            // 文件方式导入
            $array =  explode(',',$file);
            foreach ($array as $val){
                if (!$type || isset($reset))
                {
                    $type = $reset = strtolower(substr(strrchr($val, '.'),1));
                }
                switch($type) {
                case 'js':
                    $parseStr .= '<script type="text/javascript" src="'.$val.'"></script>';
                    break;
                case 'css':
                    $parseStr .= '<link rel="stylesheet" type="text/css" href="'.$val.'" />';
                    break;
                case 'php':
                    $parseStr .= '<?php require_cache("'.$val.'"); ?>';
                    break;
                }
            }
        }else{
            // 命名空间导入模式 默认是js
            $type       = $type?$type:(!empty($tag['type'])?strtolower($tag['type']):'js');
            //$basepath   = !empty($tag['basepath'])?$tag['basepath']:__ROOT__.'/Public';
            // 命名空间方式导入外部文件
            $array =  explode(',',$file);
            foreach ($array as $val){
                switch($type) {
                case 'js':
                    $parseStr .= "<script type='text/javascript' src='__PUBLIC__/".str_replace(array('.','#'), array('/','.'),$val).'.js'."'></script> ";
                    break;
                case 'css':
                    $parseStr .= "<link rel='stylesheet' type='text/css' href='__PUBLIC__/".str_replace(array('.','#'), array('/','.'),$val).'.css'."' />";
                    break;
                case 'php':
                    $parseStr .= '<?php import("'.$val.'"); ?>';
                    break;
                }
            }
        }
        return $parseStr.$endStr;
    }
    public function _iterate($attr,$content) {
        return $this->_volist($attr,$content);
    }
    public function _eq($attr,$content) {
        return $this->_compare($attr,$content,'eq');
    }
    public function _equal($attr,$content) {
        return $this->_eq($attr,$content);
    }
    public function _neq($attr,$content) {
        return $this->_compare($attr,$content,'neq');
    }
    public function _notequal($attr,$content) {
        return $this->_neq($attr,$content);
    }
    public function _gt($attr,$content) {
        return $this->_compare($attr,$content,'gt');
    }
    public function _lt($attr,$content) {
        return $this->_compare($attr,$content,'lt');
    }
    public function _egt($attr,$content) {
        return $this->_compare($attr,$content,'egt');
    }
    public function _elt($attr,$content) {
        return $this->_compare($attr,$content,'elt');
    }
    public function _heq($attr,$content) {
        return $this->_compare($attr,$content,'heq');
    }
    public function _nheq($attr,$content) {
        return $this->_compare($attr,$content,'nheq');
    }
    public function _load($attr,$content)
    {
        return $this->_import($attr,$content,true);
    }
    // import别名使用 导入css文件 <css file="__PUBLIC__/Css/Base.css" />
    public function _css($attr,$content)
    {
        return $this->_import($attr,$content,true,'css');
    }
    // import别名使用 导入js文件 <js file="__PUBLIC__/Js/Base.js" />
    public function _js($attr,$content)
    {
        return $this->_import($attr,$content,true,'js');
    }
    /**
     +----------------------------------------------------------
     * assign标签解析
     * 在模板中给某个变量赋值 支持变量赋值
     * 格式： <assign name="" value="" />
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @param string $attr 标签属性
     * @param string $content  标签内容
     +----------------------------------------------------------
     * @return string
     +----------------------------------------------------------
     */
    public function _assign($attr,$content)
    {
        $tag      = $this->parseXmlAttr($attr,'assign');
        $name   = $this->autoBuildVar($tag['name']);
        if('$'==substr($tag['value'],0,1)) {
            $value   =  $this->autoBuildVar(substr($tag['value'],1));
        }else{
            $value   =   '\''.$tag['value']. '\'';
        }
        $parseStr  = '<?php '.$name.' = '.$value.'; ?>';
        return $parseStr;
    }

    /**
     +----------------------------------------------------------
     * define标签解析
     * 在模板中定义常量 支持变量赋值
     * 格式： <define name="" value="" />
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @param string $attr 标签属性
     * @param string $content  标签内容
     +----------------------------------------------------------
     * @return string
     +----------------------------------------------------------
     */
    public function _define($attr,$content)
    {
        $tag      = $this->parseXmlAttr($attr,'define');
        $name   =  '\''.$tag['name']. '\'';
        if('$'==substr($tag['value'],0,1)) {
            $value   =  $this->autoBuildVar(substr($tag['value'],1));
        }else{
            $value   =   '\''.$tag['value']. '\'';
        }
        $parseStr  = '<?php define('.$name.', '.$value.'); ?>';
        return $parseStr;
    }

    /**
     +----------------------------------------------------------
     * unique标签解析
     * 确保只解析一次
     * 格式： <unique></unique>
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @param string $attr 标签属性
     * @param string $content  标签内容
     +----------------------------------------------------------
     * @return string
     +----------------------------------------------------------
     */
    public function _unique($attr,$content)
    {
        static $_unique = '';
        if(!empty($_unique)) {
            return '';
        }
        $_unique  = true;
        return $content;
    }

}
?>