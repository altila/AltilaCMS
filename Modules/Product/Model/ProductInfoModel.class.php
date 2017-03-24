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
class ProductInfoModel extends HInfoBaseModel {

	protected $connection = 'DB_PRODUCT_CON';
	protected $trueTableName = 'product_info';
	
	/**
	+----------------------------------------------------------
	* 项目初始化
	+----------------------------------------------------------
	*/
	public function __construct() {
		parent::__construct();
		$this->groupName = 'Product';
	}

	/**
	+----------------------------------------------------------
	* 获取商品列表
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
	public function getList( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$field = 'piid,name,code,market_price,thumbnail';
		$result = parent::getList( $condition, $field, $order, $limit );
		if( $result['totalCount'] > 0 ) {
			foreach( $result['data'] as $key=>$val ) {
				$_val = $this->getInfo( array('sid'=>$val['sid'], 'piid'=>$val['piid']), $field );
				$_val = $_val ? $_val : array();
				$v = array_merge($val,$_val);
				$result['data'][$key] = $v;
			}
		}
		//print_r($result);
		return $result;
	}

}

?>
