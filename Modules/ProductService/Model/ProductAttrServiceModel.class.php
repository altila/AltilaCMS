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
class ProductAttrServiceModel extends SInfoBaseModel {

	protected $connection = 'DB_PRODUCT_CON';
	protected $trueTableName = 'product_attr_key_value';

	/**
	+----------------------------------------------------------
	* 根据商品piid获取属性
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件
	*          @param   int    piid           商品编码
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	*/
	public function getProductAttrByPiid( $condition = array(), $field = '', $order = '', $limit = '' ) {
		if( empty($condition['piid']) ) return '';
		$condition['status'] = 1;
		$key = C($modelName) . "ProductAttr_{$condition['piid']}";
		$_result = $this->getCacheData( $key, $condition, '*', 'sort' );
		foreach( $_result as $key=>$val )
			$result[$val['key']] = $val['value'];
		//print_r($result);
		return $result;
	}

}

?>
