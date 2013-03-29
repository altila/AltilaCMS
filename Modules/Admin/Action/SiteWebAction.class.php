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

class SiteWebAction extends ABaseAction {

	/**
	+----------------------------------------------------------
	* 新增前置
	+----------------------------------------------------------
	*/
	public function _before_add() {
		if( empty($_REQUEST['domain']) && $_REQUEST['addType'] == 1 ) $this->ajaxReturn( '', "请选择域名!", 0 );
	}

	/**
	+----------------------------------------------------------
	* 排序前置
	+----------------------------------------------------------
	*/
	public function _before_sort() {
		if( empty($_REQUEST['domain']) ) $this->ajaxReturn( '', "请选择域名!", 0 );
	}

	/**
	+----------------------------------------------------------
	* 默认插入前需要检验的字段
	+----------------------------------------------------------
	*/
	public function _filterInsertCheck() {
		$map['domain'] = $_REQUEST['domain'];
		$map['blcode'] = !empty($_REQUEST['blcode']) ? $_REQUEST['blcode'] : C('DEFAULT_LANG');
		return $map;
	}

	/**
	+----------------------------------------------------------
	* 默认更新前需要检验的字段
	+----------------------------------------------------------
	*/
	public function _filterUpdateCheck() {
		$map['domain'] = $_REQUEST['domain'];
		$map['blcode'] = !empty($_REQUEST['blcode']) ? $_REQUEST['blcode'] : C('DEFAULT_LANG');
		return $map;
	}

}
?>
