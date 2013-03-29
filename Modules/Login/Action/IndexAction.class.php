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


class IndexAction extends ABaseAction {
	/**
	+----------------------------------------------------------
	* 后台登录主页
	+----------------------------------------------------------
	*/
	public function index() {
		//若已登录则跳转首页
		if( !empty($_SESSION[C('USER_AUTH_KEY')]) ) redirect( domain("AdminBase") );
		$this->display();
	}

	/**
	+----------------------------------------------------------
	* 用户登入
	+----------------------------------------------------------
	*/
	public function login() {
		if( empty($_REQUEST['user_id']) ) 
			$this->ajaxReturn( '', "提交失败！", 0, '', array('field'=>'user_id','msg'=>'请填写帐号！') );
		if( empty($_REQUEST['password']) ) 
			$this->ajaxReturn( '', "提交失败！", 0, '', array('field'=>'password','msg'=>'请填写密码！') );
		if( empty($_REQUEST['verify']) ) 
			$this->ajaxReturn( '', "提交失败！", 0, '', array('field'=>'verify','msg'=>'请填写验证码！') );
		if( $_SESSION['verify'] != md5($_REQUEST['verify']) ) 
			$this->ajaxReturn( '', "提交失败！", 0, '', array('field'=>'verify','msg'=>'验证码错误！') );
		//使用用户名、密码和状态的方式进行认证
		$map = array();
		$map['user_id'] = trim($_REQUEST['user_id']);
		$map["status"] = array('gt',0);
		$userBase = D('UserBase')->where($map)->find();
		if( $userBase === false ) 
			$this->ajaxReturn( '', "提交失败！", 0, '', array('field'=>'user_id','msg'=>'帐号不存在或已禁用！') );
		if( $userBase['password'] != md5($_REQUEST['password']) ) 
			$this->ajaxReturn( '', "提交失败！", 0, '', array('field'=>'password','msg'=>'密码错误！') );
		//在$_SESSION中保存用户信息
		D( 'Login' )->setUserInfo( $userBase );
		$this->ajaxReturn( '', "提交成功！", 1, '' );
	}

}
?>
