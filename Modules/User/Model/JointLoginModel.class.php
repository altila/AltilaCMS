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
class JointLoginModel extends HBaseModel {

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
		$condition['sid'] = ( $this->siteInfo[C('DEFAULT_LANG')]['enable_alone_user'] == 0 ) ? 0 : getLang(3);
		$result = $this->getInterfaceData( 'UserService/JointLoginService/getInfo', '',  $condition );
		return $result['data'];
	}


}

?>
