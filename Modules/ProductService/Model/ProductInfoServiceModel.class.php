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
class ProductInfoServiceModel extends SInfoBaseModel {

	protected $connection = 'DB_PRODUCT_CON';
	protected $trueTableName = 'product_info';

	/**
	+----------------------------------------------------------
	* 根据商品（piid）获取商品【详情】
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件
	*          @param   int    id             文章/博文/商品编码（aiid/biid/piid）
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	*/
	public function getInfoById( $condition = array(), $field = '', $order = '', $limit = '' ) {
		if( empty($condition[getModelPk($this->getModelName())]) ) return '';
		$result = parent::getInfoById( $condition, $field, $order, $limit );
		$val = D('ProductService/ProductDescriptionService')->getDescriptionByPiid( array('sid'=>$result['sid'], 'piid'=>$result['piid']) );
		$val = $val ? $val : array();
		$result = array_merge($result,$val);
		$result['attr'] = D('ProductService/ProductAttrService')->getProductAttrByPiid( array('piid'=>$result['piid']) );
		$result['group'] = $this->getListByPgid( array('pgid'=>$result['pgid']), '', ' piid DESC ' );
		$result['groupInfo'] = D('ProductService/ProductGroupService')->where( array('pgid'=>$result['pgid']) )->find();
		//print_r($result);
		return $result;
	}

	/**
	+----------------------------------------------------------
	* 根据指定id获取商品【列表】
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件
	*          @param   int    pgid           商品群组ID
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	*/
	public function getListByPgid( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$pk = getModelPk($this->getModelName());
		if( empty($condition['pgid']) ) return '';
		$condition['status'] = $condition['status'] ? $condition['status'] : 1;
		$field = $field ? $field : ( $condition['field'] ? $condition['field'] : '*' );
		$appdcode = $condition['appdcode'] ? $condition['appdcode'] : C('APPDCODE');
		if( $this->isExistField( 'appdcode' ) )$condition['_string'] = "appdcode&{$appdcode}={$appdcode}";
		unset($condition['appdcode']);
		$result = $this->getCacheData( '', $condition, $field, $order, $limit );
		//print_r($this->getLastsql());
		return $result;
	}

}

?>
