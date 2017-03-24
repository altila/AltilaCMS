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
class HCategoryBaseModel extends HBaseModel {

	/**
	+----------------------------------------------------------
	* 获取文章/博文分类
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
	public function getCategory( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$modelName = $this->getModelName();
		$field = $field ? $field : 'smid,parent_id,code,name,crumb,model,type,link,class';
		if( !empty($condition['parent_id']) )
			$key = C($modelName) . "{$condition['parent_id']}";
		else
			return '缺失必填参数';
		$result = $this->getInterfaceData( "{$this->groupName}Service/{$modelName}Service/getCategory", $key, $condition, $field, $order, $limit, $extra );
		return $result['data'];
	}

	/**
	+----------------------------------------------------------
	* 获取文章/博文分类详情
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
	public function getCategoryInfo( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$modelName = $this->getModelName();
		if( !empty($condition['smid']) )
			$key = C($modelName) . "Info_smid_{$condition['smid']}";
		else
			return '缺失必填参数';
		$result = $this->getInterfaceData( "{$this->groupName}Service/{$modelName}Service/getCategoryInfo", $key, $condition, $field, $order, $limit, $extra );
		return $result['data'];
	}

	/**
	+----------------------------------------------------------
	* 获取文章/博文面包屑
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
	public function getBreadCrumbs( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$groupName = 'Base';
		$modelName = $this->getModelName();
		$field = $field ? $field : 'smid,parent_id,code,name,crumb,model,type,link';
		if( !empty($condition['id']) )
			$key = C($modelName) . "BreadCrumbs_id_{$condition['id']}";
		else if( !empty($condition['smid']) )
			$key = C($modelName) . "BreadCrumbs_smid_{$condition['smid']}";
		else
			return '缺失必填参数';
		$result = $this->getInterfaceData( "{$groupName}Service/{$modelName}Service/getBreadCrumbs", $key, $condition, $field, $order, $limit, $extra );
		return $result['data'];
	}

	/**
	+----------------------------------------------------------
	* 获取文章/博文左侧分类
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
	public function getLeftCategory( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$modelName = $this->getModelName();
		$field = $field ? $field : 'smid,parent_id,code,name,crumb,model,type,link,class';
		if( !empty($condition['smid']) )
			$key = C($modelName) . "LeftCategory_smid_{$condition['smid']}";
		else
			return '缺失必填参数';
		$result = $this->getInterfaceData( "{$this->groupName}Service/{$modelName}Service/getLeftCategory", $key, $condition, $field, $order, $limit, $extra );
		return $result['data'];
	}

}
?>
