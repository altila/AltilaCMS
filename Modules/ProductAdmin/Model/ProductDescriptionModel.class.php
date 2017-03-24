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
class ProductDescriptionModel extends ABaseModel {

	protected $connection = 'DB_PRODUCT_CON';
	protected $trueTableName = 'product_description';

	/**
	+----------------------------------------------------------
	* 保存描述列表
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	* @example <model model="" fun="setDescList" condition="" order="" limit="" key="i">
	+----------------------------------------------------------
	*/
	public function setDescList( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$pk = $this->getPk();
		foreach( $condition['descList'] as $key=>$val ){
			$_condition = array( $pk=>$val[$pk], 'piid'=>$condition['piid'], 'sid'=>$condition['sid'], 'pdcid'=>$key, 'content'=>$val['content'] );
			$this->addSave( $_condition );
		}
	}

}

?>
