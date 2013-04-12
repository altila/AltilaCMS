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

class ProductGoodsAction extends ABaseAction {

	/**
	+----------------------------------------------------------
	* 新增前置
	+----------------------------------------------------------
	*/
	public function _before_add() {
		if( empty($_REQUEST['sid']) ) $this->ajaxReturn( '', "请选择语言!", 0 );
		$this->descList = D( "ProductDescriptionCategory" )->where( "sid={$_REQUEST['sid']}" )->order( "sort,add_time DESC" )->select();
	}

	/**
	+----------------------------------------------------------
	* 新增前置
	+----------------------------------------------------------
	*/
	public function _before_edit() {
		$this->descList = D( "ProductDescriptionCategory" )->where( "sid={$_REQUEST['sid']}" )->order( "sort,add_time DESC" )->select();
		$productGoodsModle = D( 'ProductGoods' );
		$_descContent = D( "ProductDescription" )->where( "{$productGoodsModle->getPk()}={$_REQUEST[$productGoodsModle->getPk()]}" )->select();
		foreach( $_descContent as $key=>$val )
			$descContent[$val['pdcid']] = $val;
		$this->descContent = $descContent;
	}

	/**
	+----------------------------------------------------------
	* 插入后置
	+----------------------------------------------------------
	*/
	public function _after_insert() {
		$_POST['pgid'] = D( $this->getActionName() )->getLastInsID();
		$model = D( 'ProductDescription' );
		foreach( $_POST['descList'] as $key=>$val ){
			$_POST[$_POST['field']] = $val[$_POST['field']];
			$_POST[$_POST['pkField']] = $key;
			$_POST[$model->getPk()] = ( !empty($val[$model->getPk()]) ) ? $val[$model->getPk()] : '';
			$_POST['condition'] = array( 'pgid'=>$_POST['pgid'], $_POST['pkField']=>$key );
			$model->editForeach( $_POST );
		}
	}

	/**
	+----------------------------------------------------------
	* 更新后置
	+----------------------------------------------------------
	*/
	public function _after_update() {
		$model = D( 'ProductDescription' );
		foreach( $_POST['descList'] as $key=>$val ){
			$_POST[$_POST['field']] = $val[$_POST['field']];
			$_POST[$_POST['pkField']] = $key;
			$_POST[$model->getPk()] = ( !empty($val[$model->getPk()]) ) ? $val[$model->getPk()] : '';
			$_POST['condition'] = array( 'pgid'=>$_POST['pgid'], $_POST['pkField']=>$key );
			$model->editForeach( $_POST );
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
