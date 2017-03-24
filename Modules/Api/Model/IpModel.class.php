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


class IpModel extends ApiBaseModel {

	/**
	+----------------------------------------------------------
	* 获取ip信息 - 新浪接口
	* www.altila.com/Api/Ip?ip=222.66.83.44
	+----------------------------------------------------------
	*/
	public function sinaIp( $ip ) {
		if( empty($ip) ) return;
		$url = "http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json";
		$this->Interface->url = "{$url}&ip={$ip}";
		$result = $this->Interface->curlFunc();
		if( $result['ret'] == -1 ) {
			$this->Interface->url = $url;
			$result = $this->Interface->curlFunc();
		}
		return $result;
	}


}
?>
