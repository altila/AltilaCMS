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
class LoginServiceModel extends HBaseModel {

	protected $connection = 'DB_USER_CON';
	protected $trueTableName = 'user_base';

	/**
	+----------------------------------------------------------
	* 用户登入
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  array
	+----------------------------------------------------------
	* @example login()
	+----------------------------------------------------------
	*/
	public function login( $condition = array(), $field = '', $order = '', $limit = '' ) {
		if( empty($condition['user_id']) ) 
			return array( 'data'=>false, 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>'user_id','msg'=>'帐号不能为空') );
		if( empty($condition['password']) ) 
			return array( 'data'=>false, 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>'password','msg'=>'密码不能为空') );
		if( empty($condition['verify']) ) 
			return array( 'data'=>false, 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>'verify','msg'=>'验证码不能为空') );
		//使用用户名、密码和状态的方式进行认证
		if( is_numeric($condition['user_id']) && strlen($condition['user_id']) == 11 ) {
			$map['mobile'] = trim($condition['user_id']);
			$map['check_mobile'] = 1;
		} elseif( strpos($condition['user_id'],'@') != false ) {
			$map['email'] = trim($condition['user_id']);
			$map['check_email'] = 1;
		} else
			$map['user_id'] = trim($condition['user_id']);
		$map["status"] = 1;
		$map["sid"] = ( $this->siteInfo[C('DEFAULT_LANG')]['enable_alone_user'] == 0 ) ? 0 : $condition['sid'];
		$userBase = $this->where($map)->field('uid,user_id,password')->find();
		if( $userBase === false )
			return array( 'data'=>false, 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>'user_id','msg'=>'帐号不存在或已禁用') );
		if( $userBase['password'] != md5($condition['password']) ) 
			return array( 'data'=>false, 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>'password','msg'=>'密码错误') );
		unset($userBase['password']);
		$userBase['sid'] = $map['sid'];
		//联合登陆绑定
		if( !empty($condition['joint_login_type']) && !empty($condition['openid']) ) {
			D( 'UserService/JointLoginService' )->setInfo( $condition, $userBase );
			$userInfo = D( 'UserService/JointLoginService' )->getInfo( array('type'=>$condition['joint_login_type'],'token'=>json_encode($condition)) );
			$userBase = array_merge($userBase,$userInfo['data']);
		}
		return array( 'data'=>$userBase, 'info'=>"提交成功", 'status'=>1 );
	}




}
?>
