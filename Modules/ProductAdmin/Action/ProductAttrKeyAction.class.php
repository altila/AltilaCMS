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

class ProductAttrKeyAction extends ABaseAction {

	/**
	+----------------------------------------------------------
	* 字段过滤
	+----------------------------------------------------------
	*/
	public function _filter( &$map ) {
		if( !empty($_REQUEST['key']) ) $map['key'] = array( 'like', "%{$_REQUEST['key']}%" );
		$map['status'] = array( 'neq', '-1' );
	}

	/**
	+----------------------------------------------------------
	* 新增前置
	+----------------------------------------------------------
	*/
	public function _before_edit() {
		$attrKeyModel = D( "ProductAttrKey" );
		$attrValueModel = D( "ProductAttrValue" );
		$attrKeyPk = $attrKeyModel->getPk();
		$this->attrValueList = $attrValueModel->where( "sid={$_REQUEST['sid']}&{$attrKeyPk}={$_REQUEST[$attrKeyPk]}" )->order( "create_time DESC" )->select();
		$this->attrValueCatList = D( "ProductAttrKeyCat" )->where( "{$attrKeyPk}={$_REQUEST[$attrKeyPk]}" )->select();
	}

	/**
	+----------------------------------------------------------
	* 插入后置
	+----------------------------------------------------------
	*/
	public function _after_insert() {
		$model = D( $this->getActionName() );
		$attrValueModel = D( 'ProductAttrValue' );
		$pk = $model->getPk();
		$_POST[$pk] = $model->getLastInsID();
		foreach( $_POST["_{$_POST['field']}"] as $key=>$val ){
			$_POST[$_POST['field']] = $val;
			$_POST[$_POST['pkField']] = $_POST["_{$_POST['pkField']}"][$key];
			$_POST['condition'] = array( $pk=>$_POST[$pk], $_POST['pkField']=>$_POST[$_POST['pkField']] );
			$_POST['status'] = 1;
			$attrValueModel->editForeach( $_POST );
		}
	}

	/**
	+----------------------------------------------------------
	* 更新后置
	+----------------------------------------------------------
	*/
	public function _after_update() {
		$model = D( $this->getActionName() );
		$attrValueModel = D( 'ProductAttrValue' );
		$pk = $model->getPk();
		foreach( $_POST["_{$_POST['field']}"] as $key=>$val ){
			$_POST[$_POST['field']] = $val;
			$_POST[$_POST['pkField']] = $_POST["_{$_POST['pkField']}"][$key];
			$_POST['condition'] = array( $pk=>$_POST[$pk], $_POST['pkField']=>$_POST[$_POST['pkField']] );
			$_POST['status'] = 1;
			$attrValueModel->editForeach( $_POST );
		}
	}

	/**
	+----------------------------------------------------------
	* 插入前需要检验的字段
	+----------------------------------------------------------
	*/
	public function _filterInsertCheck() {
		$map['sid'] = $_REQUEST['sid'];
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
		$map['code'] = $_REQUEST['code'];
		return $map;
	}

}
?>
