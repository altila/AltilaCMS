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

class ACategoryAction extends ABaseAction {

	/**
	+----------------------------------------------------------
	* 首页前置
	+----------------------------------------------------------
	*/
	public function _before_index() {
		$_REQUEST['listRows'] = 50000;
	}

	/**
	+----------------------------------------------------------
	* 新增前置
	+----------------------------------------------------------
	*/
	public function _before_add() {
		if( empty($_REQUEST['sid']) ) $this->ajaxReturn( '', "请选择语言!", 0 );
	}

	/**
	+----------------------------------------------------------
	* 排序前置
	+----------------------------------------------------------
	*/
	public function _before_sort() {
		if( empty($_REQUEST['sid']) ) $this->ajaxReturn( '', "请选择语言!", 0 );
		$_REQUEST['parent_id'] = !empty($_REQUEST['parent_id']) ? $_REQUEST['parent_id'] : 0;
	}

	/**
	+----------------------------------------------------------
	* 默认插入前需要检验的字段
	+----------------------------------------------------------
	*/
	public function _filterInsertCheck() {
		$map['sid'] = $_REQUEST['sid'];
		$map['code'] = $_REQUEST['code'];
		return $map;
	}

	/**
	+----------------------------------------------------------
	* 默认更新前需要检验的字段
	+----------------------------------------------------------
	*/
	public function _filterUpdateCheck() {
		$map['sid'] = $_REQUEST['sid'];
		$map['code'] = $_REQUEST['code'];
		return $map;
	}

	/**
	+----------------------------------------------------------
	* 插入前置
	+----------------------------------------------------------
	*/
	public function _before_insert() {
		if( !empty($_POST['show_position']) ) $_POST['show_position'] = array_sum($_POST['show_position']);
		if( !empty($_POST['list_opt']) ) $_POST['list_opt'] = ( $modelName == 'SiteBatabase' ) ? implode(',',$_POST['list_opt']) : array_sum($_POST['list_opt']);
	}

	/**
	+----------------------------------------------------------
	* 插入前置
	+----------------------------------------------------------
	*/
	public function _after_insert() {
		$modelName = $this->getActionName();
		$model = D( $modelName );
		$map[getModelPk($modelName)] = $model->getLastInsID();
		$crumb = findById ( $modelName, $_POST['parent_id'], 'crumb' );
		$date['crumb'] = ( !empty($crumb) ? "{$crumb}" : "" ) . "{$map[getModelPk($modelName)]}-";
		$model->where($map)->save($date);
	}

	/**
	+----------------------------------------------------------
	* 更新前置
	+----------------------------------------------------------
	*/
	public function _before_update() {
		$modelName = $this->getActionName();
		$crumb = findById ( $modelName, $_POST['parent_id'], 'crumb' );
		$_POST['crumb'] = ( !empty($crumb) ? "{$crumb}" : "" ) . "{$_POST[getModelPk($modelName)]}-";
		if( !empty($_POST['show_position']) ) $_POST['show_position'] = array_sum($_POST['show_position']);
		if( !empty($_POST['list_opt']) ) $_POST['list_opt'] = ( $modelName == 'SiteDatabase' ) ? implode(',',$_POST['list_opt']) : array_sum($_POST['list_opt']);
	}

}
?>
