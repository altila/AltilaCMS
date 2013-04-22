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
class ABaseModel extends BaseModel {

	/**
	+----------------------------------------------------------
	* 根据条件逻辑删除表数据
	+----------------------------------------------------------
	* @access public
	+----------------------------------------------------------
	* @param  arr   $where   条件
	* @param  arr   $field   字段:默认为status
	+----------------------------------------------------------
	* @return boo
	+----------------------------------------------------------
	*/
	public function logicDelete( $where, $field = 'status' ) {
		if( FALSE !== $this->where($where)->setField($field,-1) )
			return true;
		$this->error = L('_OPERATION_WRONG_');
		return false;
	}

	/**
	+----------------------------------------------------------
	* 根据条件禁用表数据
	+----------------------------------------------------------
	* @access public
	+----------------------------------------------------------
	* @param  arr   $where   条件
	* @param  arr   $field   字段:默认为status
	+----------------------------------------------------------
	* @return boo
	+----------------------------------------------------------
	*/
	public function forbid( $where, $field = 'status' ) {
		if( FALSE !== $this->where($where)->setField($field,0) )
			return true;
		$this->error = L('_OPERATION_WRONG_');
		return false;
	}

	/**
	+----------------------------------------------------------
	* 根据条件批准表数据
	+----------------------------------------------------------
	* @access public
	+----------------------------------------------------------
	* @param  arr   $where   条件
	* @param  arr   $field   字段:默认为status
	+----------------------------------------------------------
	* @return boo
	+----------------------------------------------------------
	*/
	public function checkPass( $where, $field = 'status' ) {
		if( FALSE !== $this->where($where)->setField($field,1) )
			return true;
		$this->error = L('_OPERATION_WRONG_');
		return false;
	}

	/**
	+----------------------------------------------------------
	* 根据条件恢复表数据
	+----------------------------------------------------------
	* @access public
	+----------------------------------------------------------
	* @param  arr   $where   条件
	* @param  arr   $field   字段:默认为status
	+----------------------------------------------------------
	* @return boo
	+----------------------------------------------------------
	*/
	public function resume( $where, $field = 'status' ) {
		if( FALSE !== $this->where($where)->setField($field,1) )
			return true;
		$this->error = L('_OPERATION_WRONG_');
		return false;
	}

	/**
	+----------------------------------------------------------
	* 循环插入操作 - 增加隐藏域pkField,field
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件
	+----------------------------------------------------------
	* @return  void
	+----------------------------------------------------------
	* @example editForeach( $condition )
	+----------------------------------------------------------
	*/
	public function editForeach( $condition ) {
		$condition = empty($condition) ? $_POST : $condition;
		$_arr = findById( $this->getTableName(), $condition['condition'], "{$condition['field']},".$this->getPk(), 'arr' );
		$arr = explode( ',', str_replace( '，', ',', $condition["{$condition['field']}"] ) );
		foreach ( $_arr as $key=>$val )
			if( in_array($val,$arr) ) unset($_arr[$key],$arr[array_search($val,$arr)]);
		//更新
		if( count($_arr) == 1 && count($arr) == 1 ){
			$this->save( $condition );
			return;
		}
		//删除
		if( !empty($_arr) )
			$this->query( " DELETE FROM {$this->getTableName()} WHERE {$this->getPk()} IN ( '" . implode("','",array_keys($_arr)) . "' ) " );
		//添加
		if( !empty($arr) )
			foreach ( $arr as $key=>$value ) {
				if( !empty($value) ) {
					$condition[$condition['field']] = $value;
					$this->add( $condition );
				}
			}
		return;
	}

	/**
	+----------------------------------------------------------
	* 信息树 - 多维数组
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件:isHtmlModelUser[1,0]
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	* @example <model model="SiteNode" fun="getTree" condition="menu_show=1" order="" limit="" key="i">
	+----------------------------------------------------------
	*/
	public function getTree( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$isHtmlModelUser = !empty($condition['isHtmlModelUser']) ? $condition['isHtmlModelUser'] : 0;
		$isListTree = !empty($condition['isListTree']) ? $condition['isListTree'] : 0;
		unset($condition['isHtmlModelUser'],$condition['isListTree']);
		$order = !empty($order) ? $order : "sort";
		$list = $this->where( $condition )->order( $order )->select();
		$_list = ( $isListTree == 1 ) ? $list : list_to_tree( $list, $this->getPk() );
		$result = ( $isHtmlModelUser == 1 ) ? array($_list) : $_list;
		return $result;
	}

	/**
	+----------------------------------------------------------
	* 信息树 - 一维数组
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件:childStr前置符;isHtmlModelUser
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	* @example <model model="" fun="getTreeLine" condition="menu_show=1" order="" limit="" key="i">
	+----------------------------------------------------------
	*/
	public function getTreeLine( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$childStr = ( !empty($condition['childStr']) ) ? explode(',',$condition['childStr']) : array('|&nbsp;&nbsp;','|--');
		unset( $condition['childStr'] );
		$list = $this->getTree( $condition, $field, $order, $limit );
		$result = showTree( $list, 0, $childStr, $this->getModelName().rand(1,100) );
		return $result;
	}

	/**
	+----------------------------------------------------------
	* 获取数据
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件:isHtmlModelUser
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	* @example <model model="" fun="getData" condition="menu_show=1" order="" limit="" key="i">
	+----------------------------------------------------------
	*/
	public function getData( $condition, $field, $order, $limit ) {
		$isHtmlModelUser = !empty($condition['isHtmlModelUser']) ? $condition['isHtmlModelUser'] : 0;
		unset($condition['isHtmlModelUser']);
		$order = !empty($order) ? $order : "sort";
		$list = $this->where( $condition )->order( $order )->select();
		$result = ( $isHtmlModelUser == 1 ) ? array($list) : $list;
		return $result;
	}


}
?>
