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

class BaseAction extends Action
{

	public  $userid;
	public  $user_info;
	public  $userKey;
	public  $mc_session;
	protected $sesskey;
    var $now;

  
    /**
    +----------------------------------------------------------
    * 项目初始化
    +----------------------------------------------------------
    */
    public function _initialize()
    { 
		if($_REQUEST['ticket']) return;

		$this->user_auth_set();
/* 
        if($_REQUEST['ticket'])
        {
            $cart_server = session_id();
            $old_session = $_SESSION;
            session_destroy();
            $session_id = preg_replace('/[^\w]/', '', $_REQUEST['ticket']);
            session_id($session_id);
            setcookie('bg_sid' ,session_id(),time()+36000, C('COOKIE_PATH'),C('COOKIE_DOMAIN'));
            session_start();
            $_SESSION = $old_session;
            changeCart($cart_server,session_id());
		}
 */
		
        Vendor('mc_session#class');
    	$this->mc_session = new mc_session();

        /*设定来源COOKIE*/
        if($_GET['source_code'] AND $_GET['source_code']<>'')
        {
            if($_COOKIE['source_code'])
            {
                setcookie ("source_code", "", time() - 3600);
            }
			setcookie("source_code",urldecode($_GET['source_code']),time() + 3600*24*30,C('COOKIE_PATH'),C('COOKIE_DOMAIN') );
		}

		if($_GET['come_from'] AND $_GET['come_from']<>'')
        {
		    if($_COOKIE['come_from'])
            {
			   setcookie ("come_from", "", time() - 3600);
			}
			setcookie("come_from",$_GET['come_from'],C('COOKIE_EXPIRE') + time(), C('COOKIE_PATH'),C('COOKIE_DOMAIN'));
		}
        if(isset($_GET['channel']))
        {
            if(is_numeric($_GET['channel']))
            {
                $this->cur_channel   =  (int)$_GET['channel'];
            }
            else
            {
                $this->cur_channel   = M('Cate')->where('status=1 AND name="'.strtolower($_GET['channel']).'"')->getField('id');
            }
            if($this->cur_channel)
            {
                // 设置头部信息
                $this->meta($this->cur_channel);
                if($_GET['cate'])
                {
                    $this->cur_cate =  (int)$_GET['cate'];
                    // 设置头部信息
                    $this->meta($this->cur_cate);
                }
            }
            else
            {
                redirect($this->base_url);
            }
        }
        elseif($_GET['cate'])
        {
            if(is_numeric($_GET['cate']))
            {
                $this->cur_cate   =  (int)$_GET['cate'];
            }
            else
            {
                $this->cur_cate   =  M('Cate')->where('status=1 AND name="'.strtolower($_GET['cate']).'"')->getField('id');
            }
            if($this->cur_cate)
            {
                // 获取频道信息
                $pids =  D('Cate')->getParentCateId($this->cur_cate,true);
                $this->cur_channel   =  $pids[1];
                // 设置头部信息
                $this->meta($this->cur_cate);
            }
        }
        else
        {
            $this->cur_channel = 88;
        }
        $this->site_mark  = !empty($_GET['store'])&&!is_numeric($_GET['store']) ? $_GET['store'] :'ibanggo';
        $sub_domain_list  = C('APP_SUB_DOMAIN_LIST');
        $this->css = $sub_domain_list[$this->site_mark];
 
       	$this->meta($this->site_mark);
        $this->now = time();
        $this->assign('userinfo',$_SESSION['loginUser']);
    }
	public   function user_auth_set(){ 
		$valids = $_SESSION['loginUser']; 
		$this->userid  = $_SESSION["loginUser"]["userid"];
		$this->sesskey = $_SESSION["loginUser"]["sesskey"];
		$this->user_info =array( 
			'userid'    => $valids['userid'] ,
			'username'  => $valids['user_name'],
			'userType'  => $valids['user_type'],
			'userLevel' => $valids['level_id'],
			'levelName' => $valids['level_name']
		);
		return $this->user_info;
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
    public function verify()
	{
		ob_clean();
        import("ORG.Util.Image");
        if(isset($_REQUEST['adv'])) {
        	Image::showAdvVerify();
        }else {
            $length  =  C('VERIFY_CODE_LENGTH');
            if(strpos($length,',')) {
                $rand = explode(',',$length);
                $length  =  floor(mt_rand((int)$rand[0],(int)$rand[1]));
            }
            Image::buildImageVerify($length?$length:4,$mode=5,$type='png',$width=50,$height=27);
        }
    }

    // 设置页面Meta name 表示栏目名称
    protected function meta($site_mark)
    {
        $where['site_mark'] = $site_mark;
        $article            = M()->table('mall_site')->where($where)->field('site_keywords,site_title,site_description')->find();
        $head['title']      = $article['site_title'].(empty($this->head['site_title'])?'':'_'.$this->head['site_title']);
        $head['keywords']   = $article['site_keywords'];
		$head['description']   = $article['site_description'];
        $this->head = $head;
    }

    // 设置页面Title
    protected function setTitle($title)
    {
        $head    = $this->head;
        $head['title']  =  $title.'-'.$head['title'];
        $this->head = $head;
    }
    // 设置页面keywords
    protected function setKeywords($keywords)
    {
        $head    = $this->head;
        $head['keywords']  =  $keywords.','.$head['keywords'];
        $this->head = $head;
    }
    // 设置页面description
    protected function setDescription($description)
    {
        $head    = $this->head;
        $head['description']  =  $description.'。'.$head['description'];
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
        $name   = Html::parseRule($rule,$data,$page);
        $this->setHtml($name);
    }

    public function display($template='',$charset='',$contentType='')
    {
        if(empty($template)) {
             //读取当前频道的相关规则
            $channel  =  M('Cate')->where('id='.$this->cur_channel)->field('tmpl_home,tmpl_list,tmpl_detail')->find();
            switch(strtolower(MODULE_NAME)) {
                case 'channel': // 频道首页
                    if(strtolower(ACTION_NAME)=='index') {// 频道首页
                        $template = (!$channel['tmpl_home'])?'Channel:index':'Customize:'.$channel['tmpl_home'];
                    }else{// 频道列表页
                        $template = (!$channel['tmpl_list'])?'Channel:list':'Customize:'.$channel['tmpl_list'];
                    }
                    break;
                case 'cate': // 频道栏目页
                    $cate  =  M('Cate')->where('id='.$this->cur_cate)->field('tmpl_list')->find();
                    if(!empty($cate['tmpl_list'])) {
                        $template   = 'Customize:'.$cate['tmpl_list'];
                    }elseif(!empty($channel['tmpl_list'])){
                        $template   = 'Customize:'.$channel['tmpl_list'];
                    }else{
                        $template   = 'Cate:index';
                    }
                    break;
                case 'article':// 内容页
                    $cate  =  M('Cate')->where('id='.$this->cur_cate)->field('tmpl_detail')->find();
                    if(!empty($cate['tmpl_detail'])) {
                        $template   = 'Customize:'.$cate['tmpl_detail'];
                    }elseif(!empty($channel['tmpl_detail'])){
                        $template   = 'Customize:'.$channel['tmpl_detail'];
                    }else{
                        $template   = 'Article:read';
                    }
                    break;
            }
        }
        parent::display($template,$charset,$contentType);
    }
    protected function _404()
    {
		redirect('http://www.'.C('DOMAIN').'/Index/error');
    }
}
?>
