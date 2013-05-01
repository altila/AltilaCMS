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

class SiteAccessAction extends ABaseAction {

	/**
	+----------------------------------------------------------
	* 新增前置
	+----------------------------------------------------------
	*/
	public function _before_editForeach() {
		if( empty($_REQUEST['sid']) || empty($_REQUEST['rid']) ) $this->ajaxReturn( '', "请选择站点或角色!", 0 );
	}

	/**
	+----------------------------------------------------------
	* 更新前置
	+----------------------------------------------------------
	*/
	public function _before_updateForeach() {
		$_POST['condition'] = array( 'sid'=>$_REQUEST['sid'], 'rid'=>$_REQUEST['rid'] );
	}

}
?>
