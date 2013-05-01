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
class LoginModel extends ABaseModel {

	protected $trueTableName = 'site_web';

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
		$_SESSION[$key]['UserId'] = $userBase['user_id'];
		$_SESSION[$key]['UserType'] = $userBase['user_type'];
		$_SESSION[$key]['LevelId'] = $userBase['level_id'];
		//记录用户登录日志
		if( findById( 'Admin/SiteConfig', array('key'=>'adminIsRecordUserLog','sid'=>A('Base')->siteInfo[C('DEFAULT_LANG')]['sid'],'status'=>1), 'value' ) )
			D( 'Log/UserLogStat' )->setUserLog();
	}
}

?>
