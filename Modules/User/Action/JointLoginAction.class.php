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


class JointLoginAction extends HBaseAction {

	/**
	+----------------------------------------------------------
	* 联合登录地址
	+----------------------------------------------------------
	* @access  public
	* @param   array    $type     联合登陆类型
	+----------------------------------------------------------
	* @return  array
	+----------------------------------------------------------
	* @example http://www.altila.com//JointLogin?type=
	+----------------------------------------------------------
	*/
	public function index($type) {
		//若类型为空则跳转首页
		if( empty($type) ) redirect( domain("www") );
		//加载ThinkOauth类并实例化一个对象
		import("ORG.Vendor.ThinkSDK.ThinkOauth",LIB_PATH);
		$sns = ThinkOauth::getInstance($type);
		//跳转到授权页面
		redirect($sns->getRequestCodeURL());
	}

	/**
	+----------------------------------------------------------
	* 授权回调地址
	+----------------------------------------------------------
	* @access  public
	* @param   array    $type     联合登陆类型
	* @param   array    $code     返回值
	+----------------------------------------------------------
	* @return  array
	+----------------------------------------------------------
	* @example http://www.altila.com/User/JointLogin/callback?type=
	+----------------------------------------------------------
	*/
	public function callback($type = null, $code = null){
		if (empty($type) || empty($code)) redirect( domain("www") );
		//加载ThinkOauth类并实例化一个对象
		import("ORG.Vendor.ThinkSDK.ThinkOauth",LIB_PATH);
		$sns  = ThinkOauth::getInstance($type);
		//腾讯微博需传递的额外参数
		if($type == 'tencent') $extend = array('openid' => $_REQUEST['openid'], 'openkey' => $_REQUEST['openkey']);
		//获取Token信息，【access token,openid】
		//有Token信息后，实例化SDK对象时，可直接作为构造函数的第二个参数传入，如： $qq = ThinkOauth::getInstance('qq', $token);
		$this->token = $sns->getAccessToken($code , $extend);
		//查询是否已经绑定
		$userInfo = D( 'JointLogin' )->getInfo( array('type'=>$type,'token'=>json_encode($this->token)) );
		if( !empty($userInfo) ) {
			//在$_SESSION中保存用户信息
			D('Login')->setUserInfo( $userInfo );
			redirect( domain("www") );
		}
		$this->display('index');
	}

}
?>
