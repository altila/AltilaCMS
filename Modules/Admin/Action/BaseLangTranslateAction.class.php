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

class BaseLangTranslateAction extends ABaseAction {

	/**
	+----------------------------------------------------------
	* 插入前需要检验的字段
	+----------------------------------------------------------
	*/
	public function _filterInsertCheck() {
		$map['code'] = $_REQUEST['code'];
		return $map;
	}

	/**
	+----------------------------------------------------------
	* 更新前需要检验的字段
	+----------------------------------------------------------
	*/
	public function _filterUpdateCheck() {
		$map['code'] = $_REQUEST['code'];
		return $map;
	}

	/**
	+----------------------------------------------------------
	* 清楚缓存操作 - 【云环境下无效】
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  str
	+----------------------------------------------------------
	*/
	public function clearCache() {
		$model = D( $this->getActionName() );
		if( empty($model) ) $this->ajaxReturn( '', "非法操作!", 0 );
		$list = $model->where( "status=1" )->select();
		$lang = findById ( "Admin/BaseLang", array('status'=>1), "code", "arr" );
		foreach( $list as $key=>$val )
			foreach( $lang as $k=>$v )
				if( $val[$v] != '' ) $result[$v][$val['code']] = $val['type'] == 1 ? json_decode(strtr($val[$v],array('&quot;'=>'"')),true) : $val[$v];
		foreach( $lang as $key=>$val ){
			$fopen = fopen(LANG_PATH."{$val}/common.php",'w');
			fwrite($fopen,"<?php\nreturn ".var_export($result[$val],true).";\n?>");
			fclose($fopen);
		}
		//清楚成功
		$this->assign( "jumpUrl", getReturnUrl() );
		$this->ajaxReturn( '', "清楚成功!", 1 );
	}

}
?>
