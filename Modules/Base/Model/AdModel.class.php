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
class AdModel extends HBaseModel {

	protected $trueTableName = 'base_ad_info';

	/**
	+----------------------------------------------------------
	* 获取广告
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
	public function getAdPosList( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$condition['sid'] = $condition['sid'] ? $condition['sid'] : getLang();
		$key = C("AdPosition") . "{$condition['apCode']}_{$condition['sid']}";
		$result = $this->getInterfaceData( 'BaseService/AdService/getAdPosList', $key, $condition, $field, $order, $limit, $extra );
		return $result['data'];
	}

}

?>
