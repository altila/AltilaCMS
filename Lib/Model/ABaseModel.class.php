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

	public $_auto = array(
		array('create_time','getNowDate',self::MODEL_INSERT,'callback'),
		array('update_time','getNowDate',self::MODEL_BOTH,'callback'),
	);

	/**
	+----------------------------------------------------------
	* 根据条件永久删除表数据
	+----------------------------------------------------------
	* @access public
	+----------------------------------------------------------
	* @param  arr   $where   条件
	+----------------------------------------------------------
	* @return boo
	+----------------------------------------------------------
	*/
	public function foreverDelete( $where ) {
		if( FALSE !== $this->where($where)->delete() )
			return true;
		$this->error = L('_OPERATION_WRONG_');
		return false;
	}

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
	* 插入 或者 更新
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件
	+----------------------------------------------------------
	* @return  void
	+----------------------------------------------------------
	* @example addSave( $condition )
	+----------------------------------------------------------
	*/
	public function addSave( $condition ) {
		$condition['update_time'] = date("Y-m-d H:i:s");
		$pk = $this->getPk();
		$this->create();
		if( empty($condition[$pk]) ) {
			$condition['create_time'] = date("Y-m-d H:i:s");
			$this->add($condition);
		} else
			$this->save($condition);
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
		$pk = $this->getPk();
		$condition = empty($condition) ? $_POST : $condition;
		$_arr = findById( ( $condition['appName'] ? "{$condition['appName']}/" : '' ) . $this->getModelName(), $condition['condition'], "{$condition['field']},{$pk}", 'arr' );
		$arr = explode( ',', str_replace( '，', ',', $condition["{$condition['field']}"] ) );
		foreach ( $_arr as $key=>$val )
			if( in_array($val,$arr) ) unset($_arr[$key],$arr[array_search($val,$arr)]);
		//更新
		if( count($_arr) == 1 && count($arr) == 1 ) {
			$keys = array_keys($_arr);
			$this->save( array( $pk=>$keys[0], $condition['field']=>$arr[0] ) );
			return;
		}
		//删除
		if( !empty($_arr) )
			$this->query( " DELETE FROM {$this->getTableName()} WHERE {$pk} IN ( '" . implode("','",array_keys($_arr)) . "' ) " );
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
		$isShowChild = !empty($condition['isShowChild']) ? $condition['isShowChild'] : 0;
		unset($condition['isHtmlModelUser'],$condition['isListTree'],$condition['isShowChild']);
		foreach( $condition as $key=>$val ) {
			$condition[$key] = ( strpos($val,'[') !== false && strpos($val,']') !== false ) ? json_decode($val,true) : $val;
		}
		$order = !empty($order) ? $order : "sort";
		$field = !empty($field) ? $field : "*";
		$list = $this->where( $condition )->field($field)->order( $order )->select();
		$_list = ( $isListTree == 1 ) ? $list : list_to_tree( $list, $this->getPk() );
		$result = ( $isHtmlModelUser == 1 ) ? array($_list) : $_list;
		$result = ( $isShowChild == 1 ) ? $result[0]['_child'] : $result;
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
