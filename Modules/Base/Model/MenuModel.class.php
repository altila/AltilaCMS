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
class MenuModel extends HBaseModel {

	protected $trueTableName = 'base_site_menu';

	/**
	+----------------------------------------------------------
	* 获取导航
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	*/
	public function getMenu( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$condition['sid'] = $condition['sid'] ? $condition['sid'] : getLang();
		$key = C("SiteMenu") . $condition['sid'];
		$result = $this->getInterfaceData( 'BaseService/MenuService/getMenu', $key, $condition, $field, $order, $limit, $extra );
		return $result['data'];
	}

	/**
	+----------------------------------------------------------
	* 获取左侧通用导航
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	*/
	public function getLeftCategory( $condition = array(), $field = '', $order = '', $limit = '' ) {
		unset($condition);
		$result = $this->getMenu( $condition, $field, $order, $limit );
		foreach( $result as $key=>$val ){
			if( !empty($val['_child']) ) unset($result[$key]);
		}
		return $result;
	}

}


?>
