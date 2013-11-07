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

class SitePlateContentAction extends ABaseAction {

	/**
	+----------------------------------------------------------
	* 新增前置
	+----------------------------------------------------------
	*/
	public function _before_add() {
		if( empty($_REQUEST['spid']) || empty($_REQUEST['row_position']) ) $this->ajaxReturn( '', "请选择!", 0 );
	}

	/**
	+----------------------------------------------------------
	* 排序前置
	+----------------------------------------------------------
	*/
	public function _before_sort() {
		if( empty($_REQUEST['spid']) || empty($_REQUEST['row_position']) ) $this->ajaxReturn( '', "请选择!", 0 );
	}

	/**
	+----------------------------------------------------------
	* 插入前置
	+----------------------------------------------------------
	*/
	public function _before_insert() {
		if( $_REQUEST['model'] == 0 && in_array($_REQUEST['type'],array(3)) ) $_POST['model_value'] = $_REQUEST['model0'];
		else if( $_REQUEST['model'] == 1 && in_array($_REQUEST['type'],array(3)) ) $_POST['model_value'] = $_REQUEST['dwz_orgId_aiid'];
		else if( $_REQUEST['model'] == 1 && in_array($_REQUEST['type'],array(1,2)) ) $_POST['model_value'] = $_REQUEST['model1'];
		else if( $_REQUEST['model'] == 4 && in_array($_REQUEST['type'],array(1,2)) ) $_POST['model_value'] = $_REQUEST['model4'];
		else $_POST['model_value'] = '';
		if( !empty($_POST['list_opt']) ) $_POST['list_opt'] = array_sum($_POST['list_opt']);
	}

	/**
	+----------------------------------------------------------
	* 插入前置
	+----------------------------------------------------------
	*/
	public function _before_update() {
		if( $_REQUEST['model'] == 0 && in_array($_REQUEST['type'],array(3)) ) $_POST['model_value'] = $_REQUEST['model0'];
		else if( $_REQUEST['model'] == 1 && in_array($_REQUEST['type'],array(3)) ) $_POST['model_value'] = $_REQUEST['dwz_orgId_aiid'];
		else if( $_REQUEST['model'] == 1 && in_array($_REQUEST['type'],array(1,2)) ) $_POST['model_value'] = $_REQUEST['model1'];
		else if( $_REQUEST['model'] == 4 && in_array($_REQUEST['type'],array(1,2)) ) $_POST['model_value'] = $_REQUEST['model4'];
		else $_POST['model_value'] = '';
		if( !empty($_POST['list_opt']) ) $_POST['list_opt'] = array_sum($_POST['list_opt']);
	}

}
?>
