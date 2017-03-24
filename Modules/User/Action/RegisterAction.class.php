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


class RegisterAction extends HBaseAction {

	/**
	+----------------------------------------------------------
	* 注册主页
	+----------------------------------------------------------
	*/
	public function index() {
		//若已登录则跳转首页
		if( !empty($this->userInfo) ) redirect( domain("www") );
		$this->display();
	}

	/**
	+----------------------------------------------------------
	* ajax获取注册主页
	+----------------------------------------------------------
	*/
	public function ajaxIndex() {
		//若已登录则跳转首页
		if( !empty($this->userInfo) ) $this->ajaxReturn( '', "已经登陆", 0 );
		$display = $this->fetch('Block:register');
		if( !empty($display) ) $this->ajaxReturn( $display, "获取成功", 1 );
	}

	/**
	+----------------------------------------------------------
	* 用户注册
	+----------------------------------------------------------
	*/
	public function register() {
		$result = D( $this->getActionName() )->register( $_REQUEST );
		$this->ajaxReturn( $result['data'], $result['info'], $result['status'], 'JSON_CALLBACK', $result['extra'] );
	}

}
?>
