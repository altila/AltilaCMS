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
// $Id$  Elser 2011-3-8 17:51:28


class TagLibIbanggo extends ThinkTemplateCompiler
{
    protected $tags   =  array(
                                 'block'    =>array('attr'=>'model,fun,condition,tpl,order,field,limit,memcache,result,app','close'=>0),
                                 'model'    =>array('attr'=>'model,fun,condition,tpl,order,field,limit,memcache,result,app','level'=>3,'close'=>1),
                                 'require'  =>array('attr'=>'file,','close'=>0),
                                 'curpage'     =>array('attr'=>'total,listrow,','close'=>0),
                              );


    /**
    +----------------------------------------------------------
    * objects
    +----------------------------------------------------------
    * @access public
    +----------------------------------------------------------
    * @param string $tags
    +----------------------------------------------------------
    * @return string|void
    +----------------------------------------------------------
    */
    protected  function objects($tags,$attr,$content)
    {
        $tag       = $this->parseXmlAttr($attr,$tags);
        $result    = !empty($tag['result']) ? $tag['result'] : 'result';
        $key       = !empty($tag['key'])    ? $tag['key'] : 'k';
        $condition = !empty($tag['condition']) ? parse_string($tag['condition']) : '';
        $field     = !empty($tag['field']) ? $tag['field'] : '*';
        $order     = !empty($tag['order']) ? ltrim($tag['order']) : '';
        $limit     = !empty($tag['limit']) ? $tag['limit'] : '10';
        $app       = !empty($tag['app'])   ? $tag['app']   : C('JUST_ONE_APP');
        $memcache  = !empty($tag['memcache']) ? $tag['memcache'] : '0';
        $condition = $tag['condition'];
        $parseStr  = '<?php $_result = D("'.ucfirst($tag['model']).'","'.$app.'")->'.$tag['fun'].'(parse_string("'.$condition.'"),"'.$field.'","'.$order.'","'.$limit.'","'.$memcache.'"); ?>';

        /* 如是定义了模板则为close:0 反之为close:1 */
        if($tag['tpl'])
        {
            $tpl = switch_tpl($app,$tag['tpl']);
            return $parseStr.$this->parseInclude($tpl);
        }
        else
        {
            $parseStr = $parseStr.'<?php if($_result):$'.$key.'=0;foreach($_result AS $key=>$'.$result.'):++$'.$key.';?>'.$content.'<?php endforeach;endif;;unset($'.$result.') ?>';
            return $parseStr;
        }
    }
    /**
    +----------------------------------------------------------
    * data 闭合标签
    * 格式： <model model='' fun="" condition='' order='' field='' limit='' tpl='' result=''  /></model>
    +----------------------------------------------------------
    * @access public
    +----------------------------------------------------------
    * @param string $attr 标签属性
    +----------------------------------------------------------
    * @return string|void
    +----------------------------------------------------------
    */
    public function _model($attr,$content)
    {
        return $this->objects('model',$attr,$content);
    }

    /**
    +----------------------------------------------------------
    * block
    * 格式： <block model='' fun="" condition='' order='' field='' limit='' tpl='' result=''  />
    +----------------------------------------------------------
    * @access public
    +----------------------------------------------------------
    * @param string $attr 标签属性
    +----------------------------------------------------------
    * @return string|void
    +----------------------------------------------------------
    */
    public function _block($attr,$content)
    {
        return $this->objects('block',$attr,$content);
    }
    /**
    +----------------------------------------------------------
    * block
    * 格式： <block model='' fun="" condition='' order='' field='' limit='' tpl='' result=''  />
    +----------------------------------------------------------
    * @access public
    +----------------------------------------------------------
    * @param string $attr 标签属性
    +----------------------------------------------------------
    * @return string|void
    +----------------------------------------------------------
    */
    public function _require($attr,$content)
    {
        $tag   = $this->parseXmlAttr($attr,'require');
        $_temp = explode(',',$tag['file']);
        $tpl   = switch_tpl($_temp[0],$_temp[1]);
        return $this->parseInclude($tpl);
    }
    /**
    +----------------------------------------------------------
    * page
    * 格式： <page />
    +----------------------------------------------------------
    * @access public
    +----------------------------------------------------------
    * @param string $attr 标签属性
    +----------------------------------------------------------
    * @return string|void
    +----------------------------------------------------------
    */
    public function _curpage($attr,$content)
    {
        $tag   = $this->parseXmlAttr($attr,'curpage');
        $totalpage = ceil($tag['total']/$tag['listrow']);
        $parseStr = "<?php echo split_page(ceil($".$tag['total'].'/'.$tag['listrow'].'),page,4,1)?>';
        return $parseStr;
    }
}
?>