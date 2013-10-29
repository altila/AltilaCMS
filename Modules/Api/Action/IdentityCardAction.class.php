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


class IdentityCardAction extends HBaseAction {

	function _initialize() {
		//父类构造函数
		parent::_initialize();
		//设置脚本最大执行时间
		set_time_limit(0);
	}

	/**
	+----------------------------------------------------------
	* 获取身份证信息 - 有道接口
	* www.altilacms.com/Api/IdentityCard?idCard=
	+----------------------------------------------------------
	*/
	public function index() {
		$idCard = $_REQUEST['idCard'];
		$result = D( $this->getActionName() )->juheIdCard($idCard);
		print_r($result);
	}


}
?>
