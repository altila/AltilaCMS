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
class ApiBaseModel extends BaseModel {

	/**
	+----------------------------------------------------------
	* 项目初始化
	+----------------------------------------------------------
	*/
	public function __construct() {
		parent::__construct();
		//设置脚本最大执行时间
		set_time_limit(0);
		//载入接口方法
		import("ORG.Vendor.DPSingletonFactory.SingletonFactory",LIB_PATH);
		//实例化采集类
		$this->Interface = SingletonFactory::getInstance("BaseInterface");
	}

}
?>
