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

class CheckAction extends HBaseAction {

	/**
	+----------------------------------------------------------
	* 验证用户名是否重复
	+----------------------------------------------------------
	* @access  public
	* @param   string    user_id     用户名
	+----------------------------------------------------------
	* @return  bool
	+----------------------------------------------------------
	* @example user_id()
	+----------------------------------------------------------
	*/
	public function user_id() {
		$map['user_id'] = trim($_REQUEST['user_id']);
		$map['interfaceType'] = 'user_id';
		$result = D('Check')->check( $map );
		exit ( $_REQUEST ['callback'] . '(' . json_encode ( $result ) . ')' );
	}

	/**
	+----------------------------------------------------------
	* 验证手机号是否重复
	+----------------------------------------------------------
	* @access  public
	* @param   string    mobile     手机号
	+----------------------------------------------------------
	* @return  bool
	+----------------------------------------------------------
	* @example mobile()
	+----------------------------------------------------------
	*/
	public function mobile() {
		$map['mobile'] = trim($_REQUEST['mobile']);
		$map['interfaceType'] = 'mobile';
		$result = D('Check')->check( $map );
		exit ( $_REQUEST ['callback'] . '(' . json_encode ( $result ) . ')' );
	}

	/**
	+----------------------------------------------------------
	* 验证邮箱是否重复
	+----------------------------------------------------------
	* @access  public
	* @param   string    email     邮箱
	+----------------------------------------------------------
	* @return  bool
	+----------------------------------------------------------
	* @example email()
	+----------------------------------------------------------
	*/
	public function email() {
		$map['email'] = trim($_REQUEST['email']);
		$map['interfaceType'] = 'email';
		$result = D('Check')->check( $map );
		exit ( $_REQUEST ['callback'] . '(' . json_encode ( $result ) . ')' );
	}

	/**
	+----------------------------------------------------------
	* 验证是否已登录
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  html
	+----------------------------------------------------------
	* @example checkLogin()
	+----------------------------------------------------------
	*/
	public function checkLogin() {
		if( empty($this->userInfo) )
			$this->ajaxReturn( '', "未登陆", 0, 'JSON_CALLBACK' );
		$this->isCheckLogin = 1;
		$display = $this->fetch('Block:login_register');
		$this->ajaxReturn( $display, "登陆成功", 1, 'JSON_CALLBACK' );
	}

}
?>
