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
class SiteNodeModel extends ABaseModel {

	protected $connection = 'DB_ADMIN_CON';
	protected $trueTableName = 'site_node';

	/**
	+----------------------------------------------------------
	* 获取用户对应权限下导航数据
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	* @example getRoleNode()
	+----------------------------------------------------------
	*/
	public function getRoleNode() {
		$key = "getUserNode".findById('Admin/SiteRoleUser',$this->userInfo['Uid'],'rid');
		$sql = "SELECT sn.nid,sn.name
			FROM site_role_user AS sru
			INNER JOIN site_role AS sr ON sr.rid = sru.rid
			INNER JOIN site_access AS sa ON sa.rid = sr.rid OR ( sa.rid = sr.parent_id AND sr.parent_id != 0 )
			INNER JOIN site_node AS sn ON sn.nid = sa.nid
			WHERE sru.uid = '{$this->userInfo['Uid']}' AND sru.status = 1 AND sr.status = 1 AND sn.status = 1
			";
		$result = $this->getCacheData( $key, $sql, 'nid' );
		return $result;
	}

}

?>
