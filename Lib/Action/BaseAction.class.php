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
	public function _initialize() {
		//_REQUEST参数过滤
		filter_param();
		//设定来源COOKIE
		$this->sourceCode = !empty($_GET['source_code']) ? trim($_GET['source_code']) : ( !empty($_COOKIE['source_code']) ? $_COOKIE['source_code'] : '' );
		if( !empty($_GET['source_code']) ){
			if( $_COOKIE['source_code'] ) cookie("source_code",null);
			cookie("source_code",urldecode($_GET['source_code']));
		}
		//域名解析
		$domainArr = explode('.',$_SERVER['HTTP_HOST']);
		//二级域名
		$this->secondDomain = $domainArr[0];
		//站点标示
		$this->siteMark = $domainArr[1];
		$model = D( 'Base' );
		//用户身份验证设置
		$this->userInfo = $model->userAuthSet();
		//站点信息
		$this->siteInfo = $model->siteInfo();
		//设置页面Meta
		$this->head = $this->setMeta();
		//返回地址
		$this->returnUrl = !empty($_REQUEST['return_url']) ? trim($_REQUEST['return_url']) : ( !empty($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : '' );
		//css样式
		$this->css = strtolower( $this->getActionName() );
		//设定当前时间
		$this->nowTime = array('time'=>time(),'date'=>date("Y-m-d H:i:s"));
	}

	/**
	+----------------------------------------------------------
	* 设置页面头部信息
	+----------------------------------------------------------
	* @access  protected
	+----------------------------------------------------------
	* @return void
	+----------------------------------------------------------
	*/
	protected function setMeta() {
		$lang = getLang( 2 );
		$head['name']  = $this->siteInfo[$lang]['name'];
		$head['title']  = $this->siteInfo[$lang]['name'];
		$head['keywords']  =  $this->siteInfo[$lang]['keywords'];
		$head['description']  =  $this->siteInfo[$lang]['description'];
		$head['record_no']  =  $this->siteInfo[$lang]['record_no'];
		return $head;
	}

	/**
	+----------------------------------------------------------
	* Ajax方式返回数据到客户端 - 【重写底层方法Think/Lib/Think/Core】
	+----------------------------------------------------------
	* @access  protected
	+----------------------------------------------------------
	* @param mixed   $data   要返回的数据
	* @param String  $info   提示信息
	* @param boolean $status 返回状态
	* @param String  $type   ajax返回类型 JSON XML
	* @param array   $extra  额外需要返回的数组
	+----------------------------------------------------------
	* @return void
	+----------------------------------------------------------
	*/
	protected function ajaxReturn( $data, $info = '', $status = 1, $type = '', $extra = array() ) {
		// 保证AJAX返回后也能保存日志
		if( C('LOG_RECORD') ) Log::save();
		$result = array();
		$result['statusCode'] = ( $status == 1 ) ? 200 : 300;
		$result['status'] = $status;
		$result['message'] = $result['info'] =  $info;
		$result['data'] = $data;
		$result['navTabId'] = !empty($_REQUEST['navTabId']) ? $_REQUEST['navTabId'] : '';
		//$result['callbackType'] = !empty($_REQUEST['callbackType']) ? $_REQUEST['callbackType'] : '';
		//$result['forwardUrl'] = !empty($_REQUEST['callbackType']) ? $_REQUEST['forwardUrl'] : '';
		foreach( $extra as $key=>$val )
			if( !empty($key) && !empty($val) ) $result[$key] = $val;
		if( empty($type) ) $type = C ( 'DEFAULT_AJAX_RETURN' );
		if( strtoupper($type) == 'JSON' ) {
			// 返回JSON数据格式到客户端 包含状态信息
			header("Content-Type:text/html; charset=utf-8");
			exit( json_encode($result) );
		}elseif( strtoupper($type) == 'JSON_CALLBACK' ){
			// 返回JSON数据格式到客户端 包含状态信息
			header("Content-Type:text/html; charset=utf-8");
			exit( $_REQUEST["callback"] . "(" . json_encode($result). ")" );
		}elseif( strtoupper($type) == 'XML' ){
			// 返回xml格式数据
			header("Content-Type:text/xml; charset=utf-8");
			exit( xml_encode($result) );
		}elseif( strtoupper($type) == 'EVAL' ){
			// 返回可执行的js脚本
			header("Content-Type:text/html; charset=utf-8");
			exit( $data );
		}else{
			// TODO 增加其它格式
		}
	}

	/**
	+----------------------------------------------------------
	* 模板显示  - 【重写底层方法Think/Lib/Core/Action.class.php】
	+----------------------------------------------------------
	* @access  public
	* @param string $templateFile 指定要调用的模板文件
	* 默认为空 由系统自动定位模板文件
	* @param string $charset 输出编码
	* @param string $contentType 输出类型
	* @param string $content 输出内容
	* @param string $prefix 模板缓存前缀
	+----------------------------------------------------------
	* @return  void
	+----------------------------------------------------------
	* @example display( '分组名@主题名:模块名:操作名' )
	+----------------------------------------------------------
	*/
	protected function display($templateFile='',$charset='',$contentType='',$content='',$prefix='') {
		if( strpos( $templateFile, "@" ) !== false ) {
			$tpl = explode("@",$templateFile);
			$templateFile = switch_tpl( $tpl[0], str_replace(":", "/", $tpl[1]) );
		}
		parent::display($templateFile,$charset,$contentType,$content,$prefix);
	}


}
?>
