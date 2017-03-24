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


class MobileModel extends ApiBaseModel {

	/**
	+----------------------------------------------------------
	* 获取手机号信息 - 聚合接口
	* www.altila.com/Api/Mobile?mobile=
	+----------------------------------------------------------
	*/
	public function juheMobile( $mobile ) {
		if( empty($mobile) ) return;
		$this->Interface->url = "http://apis.juhe.cn/mobile/get?phone={$mobile}&key=11f16187d32a3a6a6ee22a2c3cbf3a93";
		$result = $this->Interface->curlFunc();
		return $result;
	}

	/**
	+----------------------------------------------------------
	* 获取手机号信息 - 有道接口 - 已废
	* www.altila.com/Api/Mobile?mobile=
	+----------------------------------------------------------
	*/
	public function youdaoMobile() {
		$this->Interface->url = "http://www.youdao.com/smartresult-xml/search.s?jsFlag=true&type=mobile&q={$_REQUEST['mobile']}";
		$_result = strtr( iconv( 'GBK', 'UTF-8', $this->Interface->curlFunc() ), array("'"=>'"') );
		$result = json_decode( substr( $_result, strpos($_result,'{'), strpos($_result,'}')-strpos($_result,'{')+1 ), true );
		return $result;
	}

}
?>
