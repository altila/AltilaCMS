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

class ProductChannelGoodsAction extends ABaseAction {

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
	* 插入前置
	+----------------------------------------------------------
	*/
	public function _before_insert() {
		if( empty($_REQUEST['smid']) ) $this->ajaxReturn( '', "请选择分类!", 0 );
		if( empty($_REQUEST['pcid']) ) $this->ajaxReturn( '', "请选择渠道!", 0 );
		if( empty($_REQUEST['dwz_orgId_pgid']) ) $this->ajaxReturn( '', "请选择商品!", 0 );
		$_POST['pgid'] = $_REQUEST['dwz_orgId_pgid'];
	}

	/**
	+----------------------------------------------------------
	* 更新前置
	+----------------------------------------------------------
	*/
	public function _before_update() {
		if( empty($_REQUEST['smid']) ) $this->ajaxReturn( '', "请选择分类!", 0 );
		if( empty($_REQUEST['pcid']) ) $this->ajaxReturn( '', "请选择渠道!", 0 );
		if( empty($_REQUEST['dwz_orgId_pgid']) ) $this->ajaxReturn( '', "请选择商品!", 0 );
		$_POST['pgid'] = $_REQUEST['dwz_orgId_pgid'];
	}

	/**
	+----------------------------------------------------------
	* 插入前需要检验的字段
	+----------------------------------------------------------
	*/
	public function _filterInsertCheck() {
		$map['sid'] = $_REQUEST['sid'];
		$map['pcid'] = $_REQUEST['pcid'];
		$map['code'] = $_REQUEST['code'];
		return $map;
	}

	/**
	+----------------------------------------------------------
	* 更新前需要检验的字段
	+----------------------------------------------------------
	*/
	public function _filterUpdateCheck() {
		$map['sid'] = $_REQUEST['sid'];
		$map['pcid'] = $_REQUEST['pcid'];
		$map['code'] = $_REQUEST['code'];
		return $map;
	}

}
?>
