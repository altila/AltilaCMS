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
	* 字段过滤
	+----------------------------------------------------------
	*/
	public function _filter( &$map ) {
		$map['domain'] = $this->siteMark;
	}

	/**
	+----------------------------------------------------------
	* 更新前置
	+----------------------------------------------------------
	*/
	public function _before_update() {
		$_POST['name'] = strip_tags( htmlspecialchars_decode($_POST['name']) );
		$_POST['keywords'] = strip_tags( htmlspecialchars_decode($_POST['keywords']) );
		$_POST['description'] = strip_tags( htmlspecialchars_decode($_POST['description']) );
		$_POST['record_no'] = strip_tags( htmlspecialchars_decode($_POST['record_no']) );
	}

}
?>
