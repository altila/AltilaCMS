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
class UserLogStatModel extends ABaseModel {

	protected $connection = 'DB_USER_CON';
	protected $trueTableName = 'user_log_stat';

	/**
	+----------------------------------------------------------
	* 记录用户登录日志
	+----------------------------------------------------------
	* @access  public
	* @param   array    $isAdmin     是否是后台登陆：0为否、1为是(默认)
	+----------------------------------------------------------
	* @return  array
	+----------------------------------------------------------
	* @example setUserLog()
	+----------------------------------------------------------
	*/
	public function setUserLog( $isAdmin = '1' ) {
		$map = array();
		$map['uid'] = $this->userInfo['Uid'];
		$map['sid'] = A('Base')->siteInfo[C('DEFAULT_LANG')]['sid'];
		$map['log_ip'] = get_client_ip();
		$map['add_time'] = date("Y-m-d H:i:s");
		$map['update_time'] = date("Y-m-d H:i:s");
		$this->add($map);
	}

}

?>
