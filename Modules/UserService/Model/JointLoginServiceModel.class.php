<?php
// +----------------------------------------------------------------------
// | ThinkPHP
// +----------------------------------------------------------------------
// | Copyright (c) 2011 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: dizzthxl <dizzt@topthink.com>
// +----------------------------------------------------------------------
// $Id$
class JointLoginServiceModel extends HBaseModel {

	protected $connection = 'DB_USER_CON';
	protected $trueTableName = 'user_joint_login';

	/**
	+----------------------------------------------------------
	* 获取联合登陆绑定信息
	+----------------------------------------------------------
	* @access  public
	* @param   string   $type       登陆类型
	* @param   array    $token      验证信息
	+----------------------------------------------------------
	* @return  array
	+----------------------------------------------------------
	* @example getInfo()
	+----------------------------------------------------------
	*/
	public function getInfo( $condition = array(), $field = '', $order = '', $limit = '' ) {
		if( empty($condition['type']) ) 
			return array( 'data'=>false, 'info'=>"获取失败", 'status'=>0, 'extra'=>array('field'=>'type','msg'=>'登陆类型不能为空') );
		if( empty($condition['token']) ) 
			return array( 'data'=>false, 'info'=>"获取失败", 'status'=>0, 'extra'=>array('field'=>'token','msg'=>'验证信息不能为空') );
		$token = json_decode($condition['token'],true);
		//获取联合登陆绑定信息
		$map['sid'] = ( $this->siteInfo[C('DEFAULT_LANG')]['enable_alone_user'] == 0 ) ? 0 : getLang(3);
		$map['joint_login_type'] = $condition['type'];
		$map['openid'] = $token['openid'];
		$jointLogin = $this->where($map)->find();
		if( empty($jointLogin) ) return;
		//获取用户信息
		$_map['sid'] = $map['sid'];
		$_map['uid'] = $jointLogin['uid'];
		$userInfo = D('Login')->where($_map)->find();
		//获取第三方信息
		//加载ThinkOauth类并实例化一个对象
		import("ORG.Vendor.ThinkSDK.ThinkOauth",LIB_PATH);
		//获取当前登录用户信息
		$otherInfo = A('JointLoginInfo', 'Event')->$condition['type']($token);
		$result = array_merge($jointLogin,$userInfo,$otherInfo);
		return array( 'data'=>$result, 'info'=>"获取成功", 'status'=>1 );
	}

	/**
	+----------------------------------------------------------
	* 保存联合登陆绑定信息
	+----------------------------------------------------------
	* @access  public
	* @param   array    $token      验证信息
	* @param   array    $condition  参数
	+----------------------------------------------------------
	* @return  array
	+----------------------------------------------------------
	* @example setInfo( $condition )
	+----------------------------------------------------------
	*/
	public function setInfo( $token, $condition ) {
		//查询是否存在
		$userInfo = $this->getInfo( array('type'=>$token['joint_login_type'], 'token'=>$token) );
		if( !empty($userInfo['data']) ) return;
		//插入数据
		$map['sid'] = $condition['sid'];
		$map['uid'] = $condition['uid'];
		$map['joint_login_type'] = $token['joint_login_type'];
		$map['openid'] = $token['openid'];
		$map['access_token'] = $token['access_token'];
		$map['expires_in'] = $token['expires_in'];
		$map['refresh_token'] = $token['refresh_token'];
		$map['create_time'] = date("Y-m-d H:i:s");
		$map['update_time'] = date("Y-m-d H:i:s");
		$this->add($map);
	}



}

?>
