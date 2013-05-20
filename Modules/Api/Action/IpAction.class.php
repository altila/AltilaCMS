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


class IpAction extends HBaseAction {

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
	* www.altilacms.com/Api/Ip?ip=
	+----------------------------------------------------------
	*/
	public function index() {
		$url = "http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json";
		$ip = $_REQUEST['ip'] ? $_REQUEST['ip'] : get_client_ip();
		$this->Interface->url = "{$url}&ip={$ip}";
		$result = json_decode( $this->Interface->curlFuncGet(), true );
		if( $result['ret'] == -1 ) {
			$this->Interface->url = $url;
			$result = json_decode( $this->Interface->curlFuncGet(), true );
		}
		print_r($result);
	}


}
?>
