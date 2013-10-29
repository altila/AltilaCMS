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
	}

	/**
	+----------------------------------------------------------
	* 获取ip信息 - 新浪接口
	* www.altilacms.com/Api/Ip?ip=222.66.83.44
	+----------------------------------------------------------
	*/
	public function index() {
		$ip = $_REQUEST['ip'] ? $_REQUEST['ip'] : get_client_ip();
		$result = D( $this->getActionName() )->sinaIp($ip);
		print_r($result);
	}


}
?>
