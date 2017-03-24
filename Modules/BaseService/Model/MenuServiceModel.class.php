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
class MenuServiceModel extends SBaseModel {

	protected $trueTableName = 'base_site_menu';

	/**
	+----------------------------------------------------------
	* 获取导航
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件:sid
	*          @param   int    sid           站点编码
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	* @example http://www.altila.com/BaseService/MenuService/getMenu?sid=1
	+----------------------------------------------------------
	*/
	public function getMenu( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$pk = $this->getPk();
		if( empty($condition['sid']) ) return array( 'data'=>false, 'info'=>"获取失败", 'status'=>0 );
		$result = $this->getMenuBySid( $condition, $field, $order, $limit );
		foreach( $result as $key=>$value ) {
			if( empty($value['_child']) && $value['type'] == 0 && $value['is_show_child'] == 1 && $value['model'] == 1 )
				$result[$key]['_child'] = D('BaseService/ArticleInfoService')->getListBySmid( array($pk=>$value[$pk]), 'aiid,name,sort' );
		}
		//print_r($result);
		return array( 'data'=>$result, 'info'=>"获取成功", 'status'=>1 );
	}

	/**
	+----------------------------------------------------------
	* 根据站点sid获取导航
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件:sid,status,is_hide
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	*/
	public function getMenuBySid( $condition = array(), $field = '', $order = '', $limit = '' ) {
		if( empty($condition['sid']) ) return '';
		$order = $order ? $order : 'sort';
		$condition['status'] = $condition['status'] ? $condition['status'] : 1;
		$condition['is_hide'] = $condition['is_hide'] ? $condition['is_hide'] : 0;
		$result = $this->getCacheData( '', $condition, $field, $order, $limit );
		$result = list_to_tree( $result, $this->getPk() );
		foreach( $result as $key=>$val )
			$_result[$val['code']] = $val;
		return $_result;
	}

}

?>
