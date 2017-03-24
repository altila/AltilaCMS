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


class MobileAction extends BaseAction {

	/**
	+----------------------------------------------------------
	* 获取手机号信息
	* www.altila.com/Api/Mobile?mobile=
	+----------------------------------------------------------
	*/
	public function index() {
		$mobile = $_REQUEST['mobile'];
		$result = D( $this->getActionName() )->juheMobile($mobile);
		print_r($result);
	}

	/**
	+----------------------------------------------------------
	* 获取手机号信息
	* www.altila.com/Api/Mobile/test
	+----------------------------------------------------------
	*/
	public function test() {
		for( $i = 1; $i < 100; $i++ ){
			if( $i < 10 ) $mobile = "135640{$i}2347";
			else $mobile = "13564{$i}2347";
			$result = D( $this->getActionName() )->juheMobile($mobile);
			print_r( "{$mobile}:".implode('-',$result['result'])."\n\r" );
		}
	}

}
?>
