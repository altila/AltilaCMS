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
class ProductAttrKeyValueModel extends ABaseModel {

	protected $connection = 'DB_PRODUCT_CON';
	protected $trueTableName = 'product_attr_key_value';

	/**
	+----------------------------------------------------------
	* 保存属性列表
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	* @example <model model="" fun="setAttrList" condition="" order="" limit="" key="i">
	+----------------------------------------------------------
	*/
	public function setAttrList( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$pk = $this->getPk();
		foreach( $condition['attrList'] as $key=>$val ) {
			if( empty($key) ) continue;
			$_val = is_array($val['value']) ? implode(',',$val['value']) : $val['value'];
			$_condition = array( $pk=>$val[$pk], 'pakid'=>$key, 'piid'=>$condition['piid'], 'key'=>$val['key'], 'value'=>$_val, 'status'=>1 );
			$this->addSave( $_condition );
		}
	}

}

?>
