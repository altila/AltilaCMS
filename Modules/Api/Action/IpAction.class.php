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


class IpAction extends BaseAction {

	/**
	+----------------------------------------------------------
	* 获取ip信息 - 新浪接口
	* www.altila.com/Api/Ip?ip=222.66.83.44
	+----------------------------------------------------------
	*/
	public function index() {
		$ip = $_REQUEST['ip'] ? $_REQUEST['ip'] : get_client_ip();
		$result = D( $this->getActionName() )->sinaIp($ip);
		print_r($result);
	}


}
?>
