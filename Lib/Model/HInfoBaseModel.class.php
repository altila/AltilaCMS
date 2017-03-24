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
class HInfoBaseModel extends HBaseModel {

	/**
	+----------------------------------------------------------
	* 获取文章详情
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	*/
	public function getInfo( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$pk = $this->getPk();
		$modelName = $this->getModelName();
		if( !empty($condition[$pk]) )
			$key = C($modelName) . "{$condition[$pk]}";
		else
			return '缺失必填参数';
		$result = $this->getInterfaceData( "{$this->groupName}Service/{$modelName}Service/getInfo", $key, $condition, $field, $order, $limit, $extra );
		return $result['data'];
	}

	/**
	+----------------------------------------------------------
	* 获取文章列表
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	*/
	public function getList( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$pk = $this->getPk();
		$modelName = $this->getModelName();
		$field = $field ? $field : "{$pk},uid,name,tags_name,description,thumbnail,img_url,create_time";
		if( !empty($condition['smid']) )
			$key = C($modelName) . "List_{$condition['smid']}_{$limit}";
		else
			return '缺失必填参数';
		$result = $this->getInterfaceData( "{$this->groupName}Service/{$modelName}Service/getList", $key, $condition, $field, $order, $limit, $extra );
		return $result['data'];
	}

	/**
	+----------------------------------------------------------
	* 获取文章左侧列表
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	*/
	public function getLeftList( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$pk = $this->getPk();
		$modelName = $this->getModelName();
		if( !empty($condition[$pk]) )
			$key = C($modelName) . "LeftList_{$condition[$pk]}";
		else
			return '缺失必填参数';
		$result = $this->getInterfaceData( "{$this->groupName}Service/{$modelName}Service/getLeftList", $key, $condition, $field, $order, $limit, $extra );
		return $result['data'];
	}

	/**
	+----------------------------------------------------------
	* 保存数据
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	*/
	public function setValue( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$pk = $this->getPk();
		$modelName = $this->getModelName();
		$result = $this->getInterfaceData( "{$this->groupName}Service/{$modelName}Service/setValue", $key, $condition, $field, $order, $limit, $extra );
		return $result['data'];
	}

}
?>
