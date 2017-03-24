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

class AUplodeAction extends ABaseAction {

	/**
	+----------------------------------------------------------
	* 首页
	+----------------------------------------------------------
	*/
	public function index() {
		if( $_REQUEST['action'] == 'config' ) {
			$config = array_merge( C('UEDITOR_CONFIG'),C('UEDITOR_EXTEND_CONFIG') );
			print_r(json_encode($config));
		} else if( strpos($_REQUEST['action'],'imgUplode') !== false ) {
			$action = explode('/',$_REQUEST['action']);
			A( "{$action[0]}/{$action[1]}" )->imgUplode();
		} else if( strpos($_REQUEST['action'],'listimage') !== false ) {
			$action = explode('/',$_REQUEST['action']);
			A( "{$action[0]}/{$action[1]}" )->imgManagerIndex();
		}
	}

}
?>
