<?php
// +----------------------------------------------------------------------
// | ThinkPHP
// +----------------------------------------------------------------------
// | Copyright (c) 2009 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
// $Id$

class BaseAction extends Action {

	/**
	+----------------------------------------------------------
	* 项目初始化
	+----------------------------------------------------------
	*/
	public function _initialize(){
		//设定来源COOKIE
		if($_GET['source_code'] AND $_GET['source_code']<>''){
			if( $_COOKIE['source_code'] ) setcookie ("source_code", "", time() - 3600);
			setcookie("source_code",urldecode($_GET['source_code']),time() + C('COOKIE_EXPIRE')*30,C('COOKIE_PATH'),C('COOKIE_DOMAIN') );
		}
		//设置页面Meta
		$this->meta($this->site_mark);
		//设定当前时间
		$this->now = array('time'=>time(),'date'=>date("Y-m-d H:i:s"));
	}

	/**
	+----------------------------------------------------------
	* 获取登录验证码 默认为4位数字
	+----------------------------------------------------------
	* @param string $fmode 文件名
	+----------------------------------------------------------
	* @return string
	+----------------------------------------------------------
	*/
	public function verify(){
		ob_clean();
		import("ORG.Util.Image");
		if( isset($_REQUEST['adv']) ){
			Image::showAdvVerify();
		}else{
			$length = C('VERIFY_CODE_LENGTH');
			if( strpos($length,',') ){
				$rand = explode(',',$length);
				$length = floor(mt_rand((int)$rand[0],(int)$rand[1]));
			}
			Image::buildImageVerify($length?$length:4,$mode=5,$type='png',$width=50,$height=27);
		}
	}

    // 设置页面Meta name 表示栏目名称
    protected function meta($site_mark)
    {
        $where['site_mark'] = $site_mark;
        //$article            = M()->table('mall_site')->where($where)->field('site_keywords,site_title,site_description')->find();
        $head['title']      = $article['site_title'].(empty($this->head['site_title'])?'':'_'.$this->head['site_title']);
        $head['keywords']   = $article['site_keywords'];
		$head['description']   = $article['site_description'];
        $this->head = $head;
    }

    // 设置页面Title
    protected function setTitle($title)
    {
        $head    = $this->head;
        $head['title']  =  $title ? $title : $head['title'];
        $this->head = $head;
    }
    // 设置页面keywords
    protected function setKeywords($keywords)
    {
        $head    = $this->head;
        $head['keywords']  =  $keywords ? $keywords : $head['keywords'];
        $this->head = $head;
    }
    // 设置页面description
    protected function setDescription($description)
    {
        $head    = $this->head;
        $head['description']  =  $description ? $description : $head['description'];
        $this->head = $head;
    }

    protected function setHtml($rule)
    {
        define('HTML_FILE_NAME',C('HTML_PATH').$rule.C('HTML_FILE_SUFFIX'));
    }
        /**
    +----------------------------------------------------------
    * 静态页规则设置以及读取静态文件
    * 如是预览模式 或者生成静态规则关闭则直接返回
    +----------------------------------------------------------
    * @param string  $
    * @param integer $
    +----------------------------------------------------------
    */
    protected function getSetHtml($rule)
    {
        if(PREVIEW) return ;
        if(!C('HTML_CACHE_ON')) return ;
        else
        {
            $content = get_rule_html($rule);
            if($content===false)
            {
                define('HTML_FILE_NAME',C('HTML_PATH').$rule.'.'.C('HTML_FILE_SUFFIX'));
                return ;
            }
            else
            {
                exit($content);
            }
        }
    }
    protected function autoHtml($data,$type,$page='')
    {
        switch($type)
        {
            case 0:// 首页
                $rule =  'index';
            case 1:// 频道页
                $rule =  C('CHANNEL_URL_RULE');
                break;
            case 2:// 栏目首页
                $rule =  C('CATE_HOME_RULE');
                break;
            case 3:// 栏目列表页
                $rule =  C('CATE_LIST_RULE');
                break;
            case 4:// 内容页
                $rule  = C('PAGE_URL_RULE');
                break;
            case 5:// 子记录页
                $rule  = C('RECORD_URL_RULE');
                break;
            case 6://  频道列表页
                $rule  = C('CHANNEL_LIST_RULE');
                break;
        }
        $name = Html::parseRule($rule,$data,$page);
        $this->setHtml($name);
    }


}
?>
