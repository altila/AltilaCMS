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


class RegionAction extends BaseAction {

	/**
	+----------------------------------------------------------
	* 获取地区数据
	* www.altila.com/Api/Region?parent_id=0&getType=JSON
	+----------------------------------------------------------
	*/
	public function index() {
		$result = D( $this->getActionName() )->getRegion($_REQUEST['parent_id']);
		$this->ajaxReturn( $result, "获取成功！", 1, $_REQUEST['getType'] );
	}


}
?>
