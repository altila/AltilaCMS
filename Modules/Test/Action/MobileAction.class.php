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
	}

	/**
	+----------------------------------------------------------
	* 获取手机号信息
	* www.altilacms.com/Demo/Mobile
	+----------------------------------------------------------
	*/
	public function index() {
		$mobileAction = D('Api/Mobile');
		for( $i = 1; $i < 100; $i++ ){
			if( $i < 10 ) $num = "00{$i}";
			else if( $i < 100 ) $num = "00{$i}";
			else $num = $i;
			$mobile = "13564{$i}2347";
			$result = $mobileAction->juheMobile($mobile);
			print_r( "{$mobile}:".implode('-',$result['result'])."\n\r" );
		}
	}


}
?>
