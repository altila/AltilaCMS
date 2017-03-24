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


class LoginAdminAction extends ABaseAction {

	/**
	+----------------------------------------------------------
	* 后台登录主页
	+----------------------------------------------------------
	*/
	public function index() {
		//若已登录则跳转首页
		if( !empty($this->userInfo) ) redirect( domain("www") );
		$this->display();
	}

	/**
	+----------------------------------------------------------
	* 用户登入
	+----------------------------------------------------------
	*/
	public function login() {
		$result = D('User/Login')->login( $_REQUEST );
		$this->ajaxReturn( $result['data'], $result['info'], $result['status'], 'JSON_CALLBACK', $result['extra'] );
	}

}
?>
