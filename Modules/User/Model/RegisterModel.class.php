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
class RegisterModel extends HBaseModel {

	protected $connection = 'DB_USER_CON';
	protected $trueTableName = 'user_base';

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
	public function register( $condition = array(), $field = '', $order = '', $limit = '' ) {
		if( $_SESSION['verify'] != md5($condition['verify']) ) 
			return array( 'data'=>'', 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>'verify','msg'=>'验证码错误') );
		$condition['sid'] = getLang(3);
		$result = $this->getInterfaceData( 'UserService/RegisterService/register', '',  $condition );
		//print_r($result);
		//在$_SESSION中保存用户信息
		if( $result['status'] == 1 && !empty($result['data']) ) D( 'Login' )->setUserInfo( $result['data'] );
		return $result;
	}




}

?>
