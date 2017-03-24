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
class LoginModel extends HBaseModel {

	protected $connection = 'DB_USER_CON';
	protected $trueTableName = 'user_base';

	/**
	+----------------------------------------------------------
	* 在$_SESSION中保存用户信息
	+----------------------------------------------------------
	* @access  public
	* @param   array    $userBase     用户数据
	+----------------------------------------------------------
	* @return  array
	+----------------------------------------------------------
	* @example setUserInfo()
	+----------------------------------------------------------
	*/
	public function setUserInfo( $userBase ) {
		$key = C('USER_AUTH_KEY');
		$_SESSION[$key]['Uid'] = $userBase['uid'];
		$_SESSION[$key]['UserId'] = $userBase['name'] ? $userBase['name'] : $userBase['user_id'];
		$_SESSION[$key]['UserType'] = $userBase['user_type'];
		$_SESSION[$key]['LevelId'] = $userBase['level_id'];
		//记录用户登录日志
		if( $this->siteInfo[C('DEFAULT_LANG')]['enable_login_log'] == 1 )
			D( 'Log/UserLogStat' )->setUserLog();
	}

	/**
	+----------------------------------------------------------
	* 用户登入
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  json
	+----------------------------------------------------------
	* @example login()
	+----------------------------------------------------------
	*/
	public function login( $condition = array(), $field = '', $order = '', $limit = '' ) {
		if( $_SESSION['verify'] != md5($condition['verify']) ) 
			return array( 'data'=>'', 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>'verify','msg'=>'验证码错误') );
		$condition['sid'] = getLang(3);
		$result = $this->getInterfaceData( 'UserService/LoginService/login', '',  $condition );
		//print_r($result);
		//在$_SESSION中保存用户信息
		if( $result['status'] == 1 && !empty($result['data']) ) $this->setUserInfo( $result['data'] );
		return $result;
	}




}

?>
