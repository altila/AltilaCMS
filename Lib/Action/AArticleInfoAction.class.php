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
	* 插入前置
	+----------------------------------------------------------
	*/
	public function _before_insert() {
		$description = htmlspecialchars_decode( $_POST['description'] );
		$content = htmlspecialchars_decode( $_POST['content'] );
		//文章标签
		if( !empty($_POST['tags_name']) ) $_POST['tags_name'] = str_replace( '，', ',', $_POST['tags_name'] );
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
	}

	/**
	+----------------------------------------------------------
	* 更新前置
	+----------------------------------------------------------
	*/
	public function _before_update() {
		$description = htmlspecialchars_decode( $_POST['description'] );
		$content = htmlspecialchars_decode( $_POST['content'] );
		//文章标签
		if( !empty($_POST['tags_name']) ) $_POST['tags_name'] = str_replace( '，', ',', $_POST['tags_name'] );
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
	}

}
?>
