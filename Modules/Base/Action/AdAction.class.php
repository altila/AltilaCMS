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

class AdAction extends HBaseAction {

	/**
	+----------------------------------------------------------
	* 获取广告位
	+----------------------------------------------------------
	*/
	public function getAdPosList() {
		$condition['apCode'] = $_REQUEST['apCode'];
		$condition['isPublicAll'] = 1;
		$list = D( $this->getActionName() )->getAdPosList($condition);
		$list = "var adList = " . json_encode($list);
		exit($list);
	}

}
?>
