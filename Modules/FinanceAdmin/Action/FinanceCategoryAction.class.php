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

class FinanceCategoryAction extends ACategoryAction {

	/**
	+----------------------------------------------------------
	* 新增前置
	+----------------------------------------------------------
	*/
	public function _before_add() {
	}

	/**
	+----------------------------------------------------------
	* 字段过滤
	+----------------------------------------------------------
	*/
	public function _filter( &$map ) {
		$map['uid'] = $this->userInfo['Uid'];
	}

	/**
	+----------------------------------------------------------
	* 排序前置
	+----------------------------------------------------------
	*/
	public function _before_sort() {
		$_REQUEST['listRows'] = 100;
		$_REQUEST['parent_id'] = !empty($_REQUEST['parent_id']) ? $_REQUEST['parent_id'] : 0;
		if( $_REQUEST['type'] == null ) $this->ajaxReturn( '', "非法操作!", 0 );
	}

	/**
	+----------------------------------------------------------
	* 默认插入前需要检验的字段
	+----------------------------------------------------------
	*/
	public function _filterInsertCheck() {
		$map['name'] = $_REQUEST['name'];
		$map['parent_id'] = $_REQUEST['parent_id'];
		return $map;
	}

	/**
	+----------------------------------------------------------
	* 默认更新前需要检验的字段
	+----------------------------------------------------------
	*/
	public function _filterUpdateCheck() {
		$map['name'] = $_REQUEST['name'];
		$map['parent_id'] = $_REQUEST['parent_id'];
		return $map;
	}

	/**
	+----------------------------------------------------------
	* 插入前置
	+----------------------------------------------------------
	*/
	public function _before_insert() {
		if( $_REQUEST['uid'] == null ) $this->ajaxReturn( '', "非法操作!", 0 );
		if( $_REQUEST['type'] == null ) $this->ajaxReturn( '', "非法操作!", 0 );
		parent::_before_insert();
	}

	/**
	+----------------------------------------------------------
	* 选择机构
	+----------------------------------------------------------
	*/
	public function selectCategory() {
		$_result[] = array('0','请选择');
		$model = D( $this->getActionName() );
		$pk = $model->getPk();
		if( !empty($_REQUEST['parent_id']) && $_REQUEST['parent_id'] != '请选择' ) {
			$result = $model->where( array('status'=>'1','parent_id'=>$_REQUEST['parent_id']) )->order( "sort,{$pk}" )->select();
			foreach( $result as $key=>$val )
				$_result[] = array( $val[$pk], $val['name'] );
		}
		$this->ajaxReturn( json_encode($_result), '', '', 'EVAL' );
	}

}
?>
