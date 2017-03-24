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
class ProductAttrKeyModel extends ABaseModel {

	protected $connection = 'DB_PRODUCT_CON';
	protected $trueTableName = 'product_attr_key';

	/**
	+----------------------------------------------------------
	* 获取属性列表
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	* @example <model model="" fun="getAttrList" condition="" order="" limit="" key="i">
	+----------------------------------------------------------
	*/
	public function getAttrList( $condition = array(), $field = '', $order = '', $limit = '' ) {
		if( empty($condition['sid']) || empty($condition['smid']) ) return;
		$order = $order ? $order : "pak.sort";
		$sql = "SELECT pak.pakid,pak.key,pak.code,pak.input_type,pak.is_required,pak.is_retrieval 
			FROM product_attr_key_cat AS pakc 
			LEFT JOIN product_attr_key AS pak ON pakc.pakid = pak.pakid 
			WHERE pak.`status` = 1 AND pakc.`status` = 1 AND pakc.smid = {$condition['smid']} AND pak.sid = {$condition['sid']}
			ORDER BY {$order}";
		$result = $this->query($sql);
		//print_r($sql);
		return $result;
	}


}

?>
