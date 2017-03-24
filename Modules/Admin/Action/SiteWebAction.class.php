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

	/**
	+----------------------------------------------------------
	* 插入前置
	+----------------------------------------------------------
	*/
	public function _before_insert() {
		$this->beforeOperate();
	}

	/**
	+----------------------------------------------------------
	* 插入前置
	+----------------------------------------------------------
	*/
	public function _before_update() {
		$this->beforeOperate();
	}
	
	/**
	+----------------------------------------------------------
	* 操作
	+----------------------------------------------------------
	*/
	public function beforeOperate() {
		if( !empty($_POST['reg_info']) ) $_POST['reg_info'] = implode(',',$_POST['reg_info']);
		if( !empty($_POST['login_type']) ) $_POST['login_type'] = implode(',',$_POST['login_type']);
		if( !empty($_POST['enable_module']) ) $_POST['enable_module'] = implode(',',$_POST['enable_module']);
		if( !empty($_POST['enable_alone_menu']) ) $_POST['enable_alone_menu'] = implode(',',$_POST['enable_alone_menu']);
		if( !empty($_POST['enable_area']) ) $_POST['enable_area'] = implode(',',$_POST['enable_area']);
		$_POST['joint_login_show'] = !empty($_POST['joint_login_show']) ? implode(',',$_POST['joint_login_show']) : '';
		$_POST['joint_login_type'] = !empty($_POST['joint_login_type']) ? implode(',',$_POST['joint_login_type']) : '';
		$_POST['enable_interface'] = !empty($_POST['enable_interface']) ? implode(',',$_POST['enable_interface']) : '';
		$_POST['enable_two_domain'] = !empty($_POST['enable_two_domain']) ? implode(',',$_POST['enable_two_domain']) : '';
	}

}
?>
