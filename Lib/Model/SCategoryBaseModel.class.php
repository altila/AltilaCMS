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
class SCategoryBaseModel extends SBaseModel {

	/*******************************************************  分类 - 接口  ***************************************************************/

	/**
	+----------------------------------------------------------
	* 获取文章/博文【分类】
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件:
	*          @param   int    parent_id      导航父级编码
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	* @example http://www.altila.com/BaseService/ArticleCategoryService/getCategory?parent_id=1
	*          http://www.altila.com/BlogService/BlogCategoryService/getCategory?parent_id=1
	+----------------------------------------------------------
	*/
	public function getCategory( $condition = array(), $field = '', $order = '', $limit = '' ) {
		if( !empty($condition['parent_id']) )
			$result = $this->getCategoryByParent( $condition, $field, $order, $limit );
		else
			return array( 'data'=>false, 'info'=>"获取失败", 'status'=>0 );
		return array( 'data'=>$result, 'info'=>"获取成功", 'status'=>1 );
	}

	/**
	+----------------------------------------------------------
	* 获取文章/博文【分类详情】
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件
	*          @param   int    smid           导航编码
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	* @example http://www.altila.com/BaseService/ArticleCategoryService/getCategoryInfo?smid=1
	*          http://www.altila.com/BlogService/BlogCategoryService/getCategoryInfo?smid=1
	+----------------------------------------------------------
	*/
	public function getCategoryInfo( $condition = array(), $field = '', $order = '', $limit = '' ) {
		if( !empty($condition['smid']) )
			$result = $this->getCategoryInfoBySmid( $condition, $field, $order, $limit );
		else
			return array( 'data'=>false, 'info'=>"获取失败", 'status'=>0 );
		return array( 'data'=>$result, 'info'=>"获取成功", 'status'=>1 );
	}

	/**
	+----------------------------------------------------------
	* 获取文章/图片/博文/招聘【面包屑】
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件:
	*          @param   int    id             文章/博文编码（aiid/biid）
	*          @param   int    smid           导航编码
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	* @example http://www.altila.com/BaseService/ArticleCategoryService/getBreadCrumbs?smid=1
	*          http://www.altila.com/BlogService/BlogCategoryService/getBreadCrumbs?parent_id=1
	+----------------------------------------------------------
	*/
	public function getBreadCrumbs( $condition = array(), $field = '', $order = '', $limit = '' ) {
		if( !empty($condition['id']) )
			$result = $this->getBreadCrumbsById( $condition, $field, $order, $limit );
		else if( !empty($condition['smid']) )
			$result = $this->getBreadCrumbsBySmid( $condition, $field, $order, $limit );
		else
			return array( 'data'=>false, 'info'=>"获取失败", 'status'=>0 );
		return array( 'data'=>$result, 'info'=>"获取成功", 'status'=>1 );
	}

	/**
	+----------------------------------------------------------
	* 获取文章/图片/博文/招聘【左侧分类】
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件
	*          @param   int    smid           导航编码
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	* @example http://www.altila.com/BaseService/ArticleCategoryService/getLeftCategory?smid=1
	*          http://www.altila.com/BlogService/BlogCategoryService/getLeftCategory?smid=1
	+----------------------------------------------------------
	*/
	public function getLeftCategory( $condition = array(), $field = '', $order = '', $limit = '' ) {
		if( !empty($condition['smid']) && $condition['model_value'] == 1 )
			$result = $this->getLeftCategoryAllBySmid( $condition, $field, $order, $limit );
		else if( !empty($condition['smid']) && $condition['model_value'] == 2 )
			$result = $this->getLeftCategoryLadderBySmid( $condition, $field, $order, $limit );
		else
			return array( 'data'=>false, 'info'=>"获取失败", 'status'=>0 );
		return array( 'data'=>$result, 'info'=>"获取成功", 'status'=>1 );
	}


	/*******************************************************  分类 - 方法  ***************************************************************/

	/**
	+----------------------------------------------------------
	* 根据父级smid获取文章/博文【分类】
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件:
	*          @param   int    parent_id      导航父级编码
	*          @param   int    isAll          显示所有子分类 或 一级子分类
	*          @param   int    isTree         是否为树结构
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	*/
	public function getCategoryByParent( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$isAll = $condition['isAll'] ? $condition['isAll'] : '';
		$isTree = $condition['isTree'] != 1 ? $condition['isTree'] : 1;
		$order = $order ? $order : 'sort';
		$condition['parent_id'] = $condition['parent_id'] ? $condition['parent_id'] : 0;
		$condition['status'] = $condition['status'] ? $condition['status'] : 1;
		$field = $field ? $field : ( $condition['field'] ? $condition['field'] : '*' );
		$order = $order ? $order : ( $condition['order'] ? $condition['order'] : 'sort' );
		unset($condition['isAll'],$condition['isTree']);
		if( $isAll == 1 ) {
			$categoryInfo =  $this->getCategoryInfoBySmid( array('smid'=>$condition['parent_id']) );
			$condition['crumb'] = array('like',"{$categoryInfo['crumb']}%");
			unset($condition['parent_id']);
		}
		$result = $this->getCacheData( '', $condition, $field, $order, $limit );
		if( $isTree == 1 ) $result = list_to_tree( $result, $this->getPk(), '_child', $condition['parent_id'] );
		$result = ( $isAll == 1 && $isTree == 1 ) ? $result[0]['_child'] : $result;
		return $result;
	}

	/**
	+----------------------------------------------------------
	* 根据父级smid获取文章/博文【分类详情】
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件
	*          @param   int    smid           菜单编码
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	*/
	public function getCategoryInfoBySmid( $condition = array(), $field = '', $order = '', $limit = '' ) {
		if( empty($condition['smid']) ) return;
		$condition['status'] = $condition['status'] ? $condition['status'] : 1;
		$field = $field ? $field : ( $condition['field'] ? $condition['field'] : '*' );
		$result = $this->getCacheData( '', $condition, $field, $order, $limit );
		return $result['0'];
	}

	/**
	+----------------------------------------------------------
	* 根据父级smid获取文章/图片/博文/招聘【面包屑】
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件
	*          @param   int    smid           菜单编码
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	*/
	public function getBreadCrumbsBySmid( $condition = array(), $field = '', $order = '', $limit = '' ) {
		if( empty($condition['smid']) ) return;
		$_result =  $this->getCategoryInfoBySmid( array('smid'=>$condition['smid']) );
		$condition['smid'] = array(' in', strtr($_result['crumb'],array('-'=>',')) );
		$field = $field ? $field : ( $condition['field'] ? $condition['field'] : '*' );
		$order = $order ? $order : ( $condition['order'] ? $condition['order'] : '' );
		$result = $this->getCacheData( '', $condition, $field, $order, $limit );
		//array_pop($result);
		return $result;
	}

	/**
	+----------------------------------------------------------
	* 根据文章/图片/博文/招聘（aiid/id/biid/id）获取文章/图片/博文/招聘【面包屑】
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件
	*          @param   int    id             文章/博文编码（aiid/biid）
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	*/
	public function getBreadCrumbsById( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$modelName = $this->getModelName();
		if( empty($condition['id']) ) return;
		if( strpos($modelName,'Article') !== false ) {
			$idKey = 'aiid';
			$tableName = " base_article_info ";
		} else if( strpos($modelName,'Blog') !== false ) {
			$idKey = 'biid';
			$tableName = " blog_info ";
		}
		$sql = "SELECT info.{$idKey},bsm.crumb 
			FROM {$tableName} AS info
			LEFT JOIN base_site_menu AS bsm ON info.smid = bsm.smid
			WHERE info.{$idKey} = {$condition['id']}";
		$_result = $this->getCacheData( '', $sql );
		unset($condition['id']);
		$condition['smid'] = array('in',strtr($_result[0]['crumb'],array('-'=>',')));
		$field = $field ? $field : ( $condition['field'] ? $condition['field'] : '*' );
		$order = $order ? $order : ( $condition['order'] ? $condition['order'] : '' );
		$result = $this->getCacheData( '', $condition, $field, $order, $limit );
		return $result;
	}

	/**
	+----------------------------------------------------------
	* 根据面包屑获取分类
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件
	*          @param   str    crumb            面包屑
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	*/
	public function getCategoryByBreadCrumbs( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$condition['crumb'] = array('like', "{$condition['crumb']}%" );
		$field = $field ? $field : ( $condition['field'] ? $condition['field'] : '*' );
		$order = $order ? $order : ( $condition['order'] ? $condition['order'] : '' );
		$result = $this->getCacheData( '', $condition, $field, $order, $limit );
		return $result;
	}

	/**
	+----------------------------------------------------------
	* 获取文章/图片/博文/招聘【左侧分类 - 全部】
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件
	*          @param   int    smid           导航编码
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	*/
	public function getLeftCategoryAllBySmid( $condition = array(), $field = '', $order = '', $limit = '' ) {
		if( empty($condition['smid']) || empty($condition['smid']) ) return;
		$field = $field ? $field : ( $condition['field'] ? $condition['field'] : '*' );
		$order = $order ? $order : ( $condition['order'] ? $condition['order'] : 'sort' );
		//获取当前分类数据
		$info = $this->getCategoryInfoBySmid( $condition, $field, $order, $limit );
		//获取当前分类下子分类
		$map['crumb'] = $info['crumb'];
		$map['status'] = 1;
		$result = $this->getCategoryByBreadCrumbs( $map, $field, $order, $limit );
		$result = list_to_tree( $result, $this->getPk(), 'parent_id', '_child', $info['parent_id'] );
		//print_r($result);
		return $result;
	}

	/**
	+----------------------------------------------------------
	* 获取文章/图片/博文/招聘【左侧分类 - 阶梯】
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件
	*          @param   int    smid           导航编码
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	*/
	public function getLeftCategoryLadderBySmid( $condition = array(), $field = '', $order = '', $limit = '' ) {
		if( empty($condition['smid']) ) return;
		$field = $field ? $field : ( $condition['field'] ? $condition['field'] : '*' );
		$order = $order ? $order : ( $condition['order'] ? $condition['order'] : 'sort' );
		//获取当前分类数据
		$result = array( $this->getCategoryInfoBySmid( $condition, $field, $order, $limit ) );
		//获取子分类数据
		$child = $this->getCategoryByParent( array( 'parent_id'=>$condition['smid'] ), $field, $order, $limit );
		//获取当前同级数据
		if( $result[0]['parent_id'] != 0 )
			$result = $this->getCategoryByParent( array( 'parent_id'=>$result[0]['parent_id'] ), $field, $order, $limit );
		//组合数据
		foreach( $result as $key=>$val ){
			if( $val['smid'] == $condition['smid'] ) $result[$key]['_child'] = $child;
		}
		//非顶级且无子分类
		if( empty($child) && $result[0]['parent_id'] != 0 ){
			$child = $result;
			$result = array( $this->getCategoryInfoBySmid( array( 'smid'=>$result[0]['parent_id'] ), $field, $order, $limit ) );
			if( $result[0]['parent_id'] != 0 )
				$result = $this->getCategoryByParent( array( 'parent_id'=>$result[0]['parent_id'] ), $field, $order, $limit );
			foreach( $result as $key=>$val ){
				if( $val['smid'] == $child[0]['parent_id'] ) $result[$key]['_child'] = $child;
			}
		}
		//print_r($result);
		return $result;
	}

}
?>
