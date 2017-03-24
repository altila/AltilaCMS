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
class BaseProductCategoryBrandModel extends ABaseModel {

	protected $connection = 'DB_ADMIN_CON';
	protected $trueTableName = 'admin_base_product_category_brand';

	/**
	+----------------------------------------------------------
	* 根据分类获取品牌
	+----------------------------------------------------------
	* @access public
	+----------------------------------------------------------
	* @param   int      $bpcid           键名
	+----------------------------------------------------------
	* @return arr
	+----------------------------------------------------------
	*/
	public function getBrandByCategory( $bpcid ) {
		$sql = "SELECT abb.bbid,abb.code,abb.name 
			FROM admin_base_product_category_brand AS abpcb
			LEFT JOIN admin_base_brand AS abb ON abpcb.bbid = abb.bbid
			WHERE abpcb.bpcid = '{$bpcid}'";
		$result = $this->query($sql);
		return $result;
	}

}

?>
