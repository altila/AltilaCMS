<?php
// +----------------------------------------------------------------------
// | ThinkPHP
// +----------------------------------------------------------------------
// | Copyright (c) 2007 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
// $Id$

class SBaseAction extends BaseAction {

	/**
	+----------------------------------------------------------
	* 空操作实现方法调用
	+----------------------------------------------------------
	* @access  public
	* @param   str      $action         方法名
	+----------------------------------------------------------
	* @return  json
	+----------------------------------------------------------
	*/
	public function _empty( $action ) {
		$request = ( strpos($action,'set') !== false ) ? $_POST : $_REQUEST;
		$result = D( $this->getActionName() )->$action( $request );
		$this->ajaxReturn( $result['data'], $result['info'], $result['status'], 'JSON', $result['extra'] );
	}

}
?>
