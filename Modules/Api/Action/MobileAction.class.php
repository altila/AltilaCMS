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
	* www.altilacms.com/Api/Mobile?mobile=13917440725
	+----------------------------------------------------------
	*/
	public function index() {
		$mobile = $_REQUEST['mobile'];
		$result = D( $this->getActionName() )->juheMobile($mobile);
		print_r($result);
	}

}
?>
