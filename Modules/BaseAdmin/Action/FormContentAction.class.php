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

class FormContentAction extends ABaseAction {

	/**
	+----------------------------------------------------------
	* 字段过滤
	+----------------------------------------------------------
	*/
	public function _filter( &$map ) {
		if( !empty($_REQUEST['s_create_time']) ) $map['create_time'] = array( 'gt',$_REQUEST['s_create_time'] );
		if( !empty($_REQUEST['e_create_time']) ) $map['create_time'] = array( 'lt',$_REQUEST['e_create_time'] );
		if( !empty($_REQUEST['s_create_time']) && !empty($_REQUEST['e_create_time']) )
			$map['create_time'] = array( array( 'gt',$_REQUEST['s_create_time'] ), array( 'lt',$_REQUEST['e_create_time'] ), 'OR' );
	}

	/**
	+----------------------------------------------------------
	* 导出Excel
	+----------------------------------------------------------
	*/
	public function exportExcel() {
		$formInfo = D( 'BaseAdmin/FormInfo' )->field('fiid,name,value,input_type')->where( "smid={$_REQUEST['smid']}" )->order('sort')->select();
		$formContent = D( $this->getActionName() )->where( "smid={$_REQUEST['smid']}" )->select();
		$condition['filename'] = findById('BaseAdmin/SiteMenu',$_REQUEST['smid'],'name');
		$condition['content']['sheet'] = 'Sheet1';
		$condition['content']['data'][] = array('编号', 'IP', '提交时间');
		foreach( $formInfo as $key=>$val ) {
			$condition['content']['data'][0][] = $val['name'];
			if( $val['input_type'] == 2 ) $condition['content']['selectBox'][$key+3] = explode("\n", $val['value']);
		}
		foreach( $formContent as $key=>$val ) {
			$i = $key + 1;
			$condition['content']['data'][$i] = array( $val['id'], $val['ip'], $val['create_time'] );
			$contentArr = json_decode($val['content'],true);
			foreach( $formInfo as $k=>$v ) {
				$value = $contentArr[$v['fiid']];
				$condition['content']['data'][$i][] = is_array($value) ? implode(',',$value) : $value;
			}
		}
		$condition['content'] = array($condition['content']);
		//print_r($condition);exit;
		parent::exportExcel( $condition );
	}

}
?>
