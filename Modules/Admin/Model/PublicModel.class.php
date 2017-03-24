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
class PublicModel extends ABaseModel {

	protected $connection = 'DB_ADMIN_CON';
	protected $trueTableName = 'admin_site_web';

	/**
	+----------------------------------------------------------
	* 获取导航数据
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	* @example <model model="Public" fun="getMenu" condition="menu_show=1&status=1" order="" limit="" key="i">
	+----------------------------------------------------------
	*/
	public function getMenu( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$nodeModel = D( "Admin/SiteNode" );
		if( C('ADMIN_AUTH_KEY') == $this->userInfo[C('USER_AUTH_KEY_ID')] )
			return $nodeModel->getTree( array('menu_show'=>1,'status'=>1) );
		$node = $nodeModel->getCacheData( C('SiteNode'), $condition, '*', 'nid' );
		$search = $nodeModel->getRoleNode();
		$_result = searchList( $search, $node );
		foreach( $_result as $key=>$value ){
			if( $value['menu_show'] == 1 && $value['nid'] != 30 ) $result[] = $value;
		}
		$result = list_to_tree( $result, $nodeModel->getPk() );
		return $result;
	}

}

?>
