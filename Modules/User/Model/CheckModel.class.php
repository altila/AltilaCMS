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
class CheckModel extends HBaseModel {

	protected $connection = 'DB_USER_CON';
	protected $trueTableName = 'user_base';

	/**
	+----------------------------------------------------------
	* 查询数据，并返回验证结果
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  bool
	+----------------------------------------------------------
	*/
	public function check( $condition = array(), $field = '', $order = '', $limit = '' ) {
		if( empty($condition[$condition['interfaceType']]) ) return false;
		$condition['sid'] = getLang(3);
		$modelName = "UserService/CheckService/{$condition['interfaceType']}";
		unset($condition['interfaceType']);
		$result = $this->getInterfaceData( $modelName, '',  $condition );
		return $result['data'];
	}



}

?>
