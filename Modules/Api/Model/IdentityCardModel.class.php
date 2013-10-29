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


class IdentityCardModel extends HBaseModel {

	function _initialize() {
		//父类构造函数
		parent::_initialize();
		//设置脚本最大执行时间
		set_time_limit(0);
		//载入接口方法
		vendor('InterfaceBase#class');
		//实例化采集类
		$this->Interface = new InterfaceBase();
	}

	/**
	+----------------------------------------------------------
	* 获取身份证信息 - 聚合接口
	* www.altilacms.com/Api/IdentityCard?id=
	+----------------------------------------------------------
	*/
	public function juheIdCard( $idCard ) {
		if( empty($idCard) ) return;
		$this->Interface->url = "http://apis.juhe.cn/idcard/index?key=46961ca1bb8a7181afb3a55a5f966659&cardno={$idCard}";
		$result = json_decode( $this->Interface->curlFuncGet(), true );
		return $result;
	}

	/**
	+----------------------------------------------------------
	* 获取身份证信息 - 有道接口 - 已废
	* www.altilacms.com/Api/IdentityCard?id=
	+----------------------------------------------------------
	*/
	public function youdaoIdCard() {
		$this->Interface->url = "http://www.youdao.com/smartresult-xml/search.s?jsFlag=true&type=id&q={$_REQUEST['id']}";
		$_result = strtr( iconv( 'GBK', 'UTF-8', $this->Interface->curlFuncGet() ), array("'"=>'"') );
		$result = json_decode( substr( $_result, strpos($_result,'{'), strpos($_result,'}')-strpos($_result,'{')+1 ), true );
		return $result;
	}


}
?>
