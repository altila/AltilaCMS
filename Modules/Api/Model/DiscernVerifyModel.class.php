<?php
// +----------------------------------------------------------------------
// | TOPThink [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2010 http://topthink.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
// $Id$


class DiscernVerifyModel extends HBaseModel {

	protected $connection = 'DB_ADMIN_CON';
	protected $trueTableName = 'admin_base_area';

	/**
	+----------------------------------------------------------
	* 获取地区数据
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $parent_id      父级ID
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	*/
	public function getRegion( $parent_id ) {
		$map["parent_id"] = $parent_id ? $parent_id : 0;
		$result = $this->where($map)->select();
		return $result;
	}


}
?>
