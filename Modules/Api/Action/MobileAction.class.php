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


class MobileAction extends HBaseAction {

	function _initialize() {
		//父类构造函数
		parent::_initialize();
		//设置脚本最大执行时间
		set_time_limit(0);
		//载入接口方法
		vendor('InterfaceBase#class');
		//实例化采集类
		$this->Interface = new InterfaceBase();
	}

	/**
	+----------------------------------------------------------
	* 获取ip信息 - 新浪接口
	* www.altilacms.com/Api/Mobile?mobile=
	+----------------------------------------------------------
	*/
	public function index() {
		$this->Interface->url = "http://www.youdao.com/smartresult-xml/search.s?jsFlag=true&type=mobile&q={$_REQUEST['mobile']}";
		$_result = strtr( iconv( 'GBK', 'UTF-8', $this->Interface->curlFuncGet() ), array("'"=>'"') );
		$result = json_decode( substr( $_result, strpos($_result,'{'), strpos($_result,'}')-strpos($_result,'{')+1 ), true );
		print_r($result);
	}

}
?>
