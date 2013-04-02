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


class AIndexAction extends ABaseAction {

	/**
	+----------------------------------------------------------
	* 后台主页
	+----------------------------------------------------------
	*/
	public function index(){
		$this->display ('Admin@Index:index');
	}

	/**
	+----------------------------------------------------------
	* 后台主页 - 左侧导航
	+----------------------------------------------------------
	*/
	public function leftMenu(){
		$this->display ('Admin@Index:leftMenu');
	}

}
?>