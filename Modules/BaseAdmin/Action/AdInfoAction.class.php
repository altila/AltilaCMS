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

class AdInfoAction extends AArticleInfoAction {

	/**
	+----------------------------------------------------------
	* 字段过滤
	+----------------------------------------------------------
	*/
	public function _filter( &$map ) {
		if(!empty($_REQUEST['appdcode'])) $map['_string'] = "appdcode&{$_REQUEST['appdcode']}={$_REQUEST['appdcode']}";
		unset($map['appdcode']);
	}

	/**
	+----------------------------------------------------------
	* 插入前置
	+----------------------------------------------------------
	*/
	public function _before_insert() {
		parent::_before_insert();
		$uploadPath = C('TMPL_PARSE_STRING');
		if( in_array( $_POST['type'],array(0,1) ) ) $_POST['content'] = str_replace( $uploadPath['__UPLOAD__'], '__UPLOAD__' , $_POST['imgUrl'] );
		else if( $_POST['type'] == 3 ) $_POST['content'] = str_replace( $uploadPath['__UPLOAD__'], '__UPLOAD__' , $_POST['rubikCube'] );
	}

	/**
	+----------------------------------------------------------
	* 更新前置
	+----------------------------------------------------------
	*/
	public function _before_update() {
		parent::_before_update();
		$uploadPath = C('TMPL_PARSE_STRING');
		if( in_array( $_POST['type'],array(0,1) ) ) $_POST['content'] = str_replace( $uploadPath['__UPLOAD__'], '__UPLOAD__' , $_POST['imgUrl'] );
		else if( $_POST['type'] == 3 ) $_POST['content'] = str_replace( $uploadPath['__UPLOAD__'], '__UPLOAD__' , $_POST['rubikCube'] );
	}

	/**
	+----------------------------------------------------------
	* 广告魔方
	+----------------------------------------------------------
	*/
	public function rubikCube() {
		$this->vo = findById( $this->getActionName(), $_REQUEST[getModelPk(MODULE_NAME)], 'content' );
		$this->display();
	}

}
?>
