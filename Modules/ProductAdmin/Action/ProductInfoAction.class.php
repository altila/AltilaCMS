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

class ProductInfoAction extends ABaseAction {

	/**
	+----------------------------------------------------------
	* 字段过滤
	+----------------------------------------------------------
	*/
	public function _filter( &$map ) {
		if(!empty($_REQUEST['pcid'])) $map['_string'] = "pcid&{$_REQUEST['pcid']}={$_REQUEST['pcid']}";
		if(!empty($_REQUEST['appdcode'])) $map['_string'] .= ( !empty($map['_string']) ? " AND " : "" ) . "appdcode&{$_REQUEST['appdcode']}={$_REQUEST['appdcode']}";
		unset($map['pcid'],$map['appdcode']);
	}

	/**
	+----------------------------------------------------------
	* 新增前置
	+----------------------------------------------------------
	*/
	public function _before_add() {
		if( empty($_REQUEST['sid']) ) $this->ajaxReturn( '', "请选择语言!", 0 );
		$this->descList = D( "ProductDescriptionCategory" )->where( "sid={$_REQUEST['sid']}" )->order( "sort,create_time DESC" )->select();
	}

	/**
	+----------------------------------------------------------
	* 新增前置
	+----------------------------------------------------------
	*/
	public function _before_edit() {
		$this->descList = D( "ProductDescriptionCategory" )->where( "sid={$_REQUEST['sid']}" )->order( "sort,create_time DESC" )->select();
		$productGoodsModle = D( $this->getActionName() );
		$_descContent = D( "ProductDescription" )->where( "{$productGoodsModle->getPk()}={$_REQUEST[$productGoodsModle->getPk()]}" )->select();
		foreach( $_descContent as $key=>$val )
			$descContent[$val['pdcid']] = $val;
		$this->descContent = $descContent;
	}

	/**
	+----------------------------------------------------------
	* 插入前置
	+----------------------------------------------------------
	*/
	public function _before_insert() {
		if( !empty($_POST['pcid']) ) $_POST['pcid'] = array_sum($_POST['pcid']);
		if( !empty($_POST['appdcode']) ) $_POST['appdcode'] = array_sum($_POST['appdcode']);
	}

	/**
	+----------------------------------------------------------
	* 更新前置
	+----------------------------------------------------------
	*/
	public function _before_update() {
		if( !empty($_POST['pcid']) ) $_POST['pcid'] = array_sum($_POST['pcid']);
		if( !empty($_POST['appdcode']) ) $_POST['appdcode'] = array_sum($_POST['appdcode']);
		$_POST['gallery'] = json_encode( array( $_POST['dwz_org1_thumbnail'], $_POST['dwz_org2_thumbnail'], $_POST['dwz_org3_thumbnail'], $_POST['dwz_org4_thumbnail'] ) );
	}

	/**
	+----------------------------------------------------------
	* 插入后置
	+----------------------------------------------------------
	*/
	public function _after_insert() {
		$_POST['piid'] = D( $this->getActionName() )->getLastInsID();
		//商品属性
		D( 'ProductAttrKeyValue' )->setAttrList( $_POST );
		//商品描述
		D( 'ProductDescription' )->setDescList( $_POST );
	}

	/**
	+----------------------------------------------------------
	* 更新后置
	+----------------------------------------------------------
	*/
	public function _after_update() {
		//商品属性
		D( 'ProductAttrKeyValue' )->setAttrList( $_POST );
		//商品描述
		D( 'ProductDescription' )->setDescList( $_POST );
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
