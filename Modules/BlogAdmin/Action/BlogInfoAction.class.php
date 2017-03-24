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

class BlogInfoAction extends AArticleInfoAction {

	/**
	+----------------------------------------------------------
	* 新增前置
	+----------------------------------------------------------
	*/
	public function _before_add() {
		if( empty($_REQUEST['smid']) ) $this->ajaxReturn( '', "请选择!", 0 );
	}

	/**
	+----------------------------------------------------------
	* 排序前置
	+----------------------------------------------------------
	*/
	public function _before_sort() {
		if( empty($_REQUEST['smid']) ) $this->ajaxReturn( '', "请选择!", 0 );
	}

	/**
	+----------------------------------------------------------
	* 插入后置
	+----------------------------------------------------------
	*/
	public function _after_insert() {
		$_POST[$_POST['pkField']] = D( $this->getActionName() )->getLastInsID();
		$_POST[$_POST['field']] = $_POST['tags_name'];
		$_POST['condition'] = array( $_POST['pkField']=>$_POST[$_POST['pkField']] );
		D( 'BlogTag' )->editForeach( $_POST );
	}

	/**
	+----------------------------------------------------------
	* 更新后置
	+----------------------------------------------------------
	*/
	public function _after_update() {
		$_POST[$_POST['field']] = $_POST['tags_name'];
		$_POST['condition'] = array( $_POST['pkField']=>$_POST[$_POST['pkField']] );
		D( 'BlogTag' )->editForeach( $_POST );
	}

}
?>
