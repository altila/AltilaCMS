<?php
// +----------------------------------------------------------------------
// | TOPThink [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2010 http://topthink.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
// $Id$


class IndexAction extends HBaseAction {
	/**
	+----------------------------------------------------------
	* 后台登录主页
	+----------------------------------------------------------
	*/
	public function index() {
		//跳转首页
		redirect( domain("www") );
	}

}
?>
