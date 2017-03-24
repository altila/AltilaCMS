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
class ProductDescriptionServiceModel extends SBaseModel {

	protected $connection = 'DB_PRODUCT_CON';
	protected $trueTableName = 'product_description';


	/**
	+----------------------------------------------------------
	* 根据商品piid获取描述
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
	public function getDescriptionByPiid( $condition = array(), $field = '', $order = '', $limit = '' ) {
		if( empty($condition['piid']) ) return '';
		$sql = "SELECT pdc.`name`,pdc.`code`,pd.content
			FROM product_description AS pd
			LEFT JOIN product_description_category AS pdc ON pdc.pdcid = pd.pdcid
			WHERE pd.piid = {$condition['piid']} AND pdc.status = 1
			ORDER BY pdc.sort";
		$_result = $this->getCacheData( '', $sql );
		foreach( $_result as $key=>$val )
			$result[$val['code']] = array( 'name'=>$val['name'], 'content'=>$val['content'] );
		//print_r($result);
		return $result;
	}

}

?>
