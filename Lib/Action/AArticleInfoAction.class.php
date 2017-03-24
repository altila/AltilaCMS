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

class AArticleInfoAction extends ABaseAction {

	/**
	+----------------------------------------------------------
	* 字段过滤
	+----------------------------------------------------------
	*/
	public function _filter( &$map ) {
		if( !empty($_REQUEST['start_time']) ) $map['start_time'] = array( 'lt',$_REQUEST['start_time'] );
		if( !empty($_REQUEST['end_time']) ) $map['end_time'] = array( 'gt',$_REQUEST['start_time'] );
		if( !empty($_REQUEST['appdcode']) ) $map['_string'] = "appdcode&{$_REQUEST['appdcode']}={$_REQUEST['appdcode']}";
		unset($map['appdcode']);
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
	* 更新前置
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
		if( !empty($_POST['appdcode']) ) $_POST['appdcode'] = array_sum($_POST['appdcode']);
		$description = htmlspecialchars_decode( $_POST['description'] );
		$content = htmlspecialchars_decode( $_POST['content'] );
		//文章标签
		if( !empty($_POST['tags_name']) ) $_POST['tags_name'] = str_replace( '，', ',', $_POST['tags_name'] );
		if( !empty($_POST['source_url']) ) $_POST['source_url'] = str_replace( '，', ',', $_POST['source_url'] );
		//文章简述
		$_POST['description'] = !empty($description) ? msubstr( strip_tags($description), 0, 100 ) : msubstr( strip_tags($content), 0, 100 );
		//替换图片路径
		$uploadPath = C('TMPL_PARSE_STRING');
		$_POST['content'] = htmlspecialchars( str_replace( $uploadPath['__UPLOAD__'], '__UPLOAD__', html2txt( stripslashes($content),array('script','style') ) ) );
		//文章内图片
		preg_match_all('/<\s*img\s+[^>]*?src\s*=\s*(\'|\")(.*?)\\1[^>]*?\/?\s*>/i',stripslashes($content),$match);
		foreach( $match[2] as $key=>$val ){
			if( strlen($url) <= 710 ) $url .= "{$val},";
		}
		$_POST['img_url'] = str_replace( $uploadPath['__UPLOAD__'], '__UPLOAD__', $url );
		if( empty($_POST['thumbnail']) ) $_POST['thumbnail'] = str_replace( $uploadPath['__UPLOAD__'], '__UPLOAD__', $match[2][0] );
	}

}
?>
