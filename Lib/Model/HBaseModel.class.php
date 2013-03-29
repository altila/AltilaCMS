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
class HBaseModel extends ABaseModel {

	/**
	+----------------------------------------------------------
	* 面包屑
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件:smid,onlyName只返回名称
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	* @example <model model="" fun="breadCrumbs" condition="" order="" limit="" key="i">
	+----------------------------------------------------------
	*/
	public function breadCrumbs( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$categoryWhere = getModelPk($this->getModelName()) . " = {$condition[getModelPk($this->getModelName())]}";
		//分类信息
		$category = $this->where( $categoryWhere )->find();
		$result = $this->where( getModelPk($this->getModelName()) . " IN ( '" . strToStr($category['crumb'],"'","-") . "' ) " )->select();
		//若分类页,删除当前分类
		if( strpos(MODULE_NAME,'Category') != false ) array_pop($result);
		if( $condition['onlyName'] == 1 ){
			foreach( $result as $key=>$val ) $_result[] = $val['name'];
			$result = $_result;
		}
		return $result;
	}

	/**
	+----------------------------------------------------------
	* 内容页 - 左侧导航
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件:smid,aiid
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	* @example <model model="ArticleInfo" fun="leftMenu" condition="acid=1&aiid=1" order="" limit="" key="i">
	+----------------------------------------------------------
	*/
	public function leftMenuInfo( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$order = !empty($order) ? $order : "sort,update_time DESC";
		$limit = !empty($limit) ? $limit : 20;
		$categoryWhere = getModelPk($condition['categoryName']) . " = {$condition[getModelPk($condition['categoryName'])]}";
		$infoWhere = getModelPk($this->getModelName()) . " = {$condition[getModelPk($this->getModelName())]}";
		$where = " {$categoryWhere} and status = 1 ";
		//文章分类信息
		$result = D( $condition['categoryName'] )->where( $categoryWhere )->select();
		if( empty($condition[getModelPk($this->getModelName())]) ){
			$result[0]['_child'] = $this->where( $where )->order( $order )->limit( $result[0]['list_num'] )->select();
		}else{
			//文章信息
			$info = $this->where( $infoWhere )->find();
			//前几条文章信息
			if( $info['sort'] > 1 ) $infoBefore = $this->where( "{$where} and sort < {$info['sort']}" )->order( $order )->limit( $info['sort']-1 )->select();
			//后几条文章信息
			$infoAfter = $this->where( "{$where} and sort > {$info['sort']} " )->order( $order )->limit( $limit-$info['sort'] )->select();
			//组合数据
			if( !empty($infoBefore) ) foreach( $infoBefore as $key=>$val ) $result[0]['_child'][] = $val;
			$result[0]['_child'][] = $info;
			if( !empty($infoAfter) ) foreach( $infoAfter as $key=>$val ) $result[0]['_child'][] = $val;
		}
		$result = array( array( 'list'=>$result ) );
		//返回数据
		return $result;
	}

	/**
	+----------------------------------------------------------
	* 分类页 - 左侧导航
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件:smid,parent_id
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	* @example <model model="" fun="leftMenu" condition="" order="" limit="" key="i">
	+----------------------------------------------------------
	*/
	public function leftMenuCategory( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$order = !empty($order) ? $order : "sort,update_time DESC";
		$where = " AND status = 1 AND sid = " . getLang();
		$condition['categoryName'] = MODULE_NAME;
		//获取子分类数据
		$child = $this->where( " parent_id = {$condition[getModelPk($this->getModelName())]} {$where}" )->order( $order )->select();
		//顶级且无子分类
		if( empty($child) && empty($condition['parent_id']) )
			return D( strtr(MODULE_NAME,array('Category'=>'Info')) )->leftMenuInfo( $condition, $field, $order, $limit );
		//获取父级分类信息
		$result = $this->where( getModelPk($this->getModelName()) . " = {$condition[getModelPk($this->getModelName())]}" )->select();
		//若父级的父级不为0时,获取父级同级数据
		if( $result[0]['parent_id'] != 0 )
			$result = $this->where( " parent_id = {$result[0]['parent_id']}" )->select();
		//组合数据
		foreach( $result as $key=>$val ){
			if( $val[getModelPk($this->getModelName())] == $condition[getModelPk($this->getModelName())] )
				$result[$key]['_child'] = $child;
		}
		//非顶级且无子分类
		if( empty($child) && $result[0]['parent_id'] != 0 ){
			$child = $result;
			$result = $this->where( getModelPk($this->getModelName()) . " = {$result[0]['parent_id']}" )->select();
			if( $result[0]['parent_id'] != 0 )
				$result = $this->where( " parent_id = {$result[0]['parent_id']}" )->select();
			foreach( $result as $key=>$val ){
				if( $val[getModelPk($this->getModelName())] == $child[0]['parent_id'] )
					$result[$key]['_child'] = $child;
			}
		}
		//获取面包屑
		$crumbs = $this->breadCrumbs( $result[0] );
		$result = array( array( 'crumbs'=>$crumbs, 'list'=>$result ) );
		//返回数据
		return $result;
	}

	/**
	+----------------------------------------------------------
	* 获取列表
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件:acid,parent_id
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	* @example <model model="" fun="getLast" condition="" order="" limit="" key="i">
	+----------------------------------------------------------
	*/
	public function getList( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$field = getModelPk($this->getModelName()) . ",uid,name,tags_name,description,thumbnail,img_url,add_time";
		$order = !empty($order) ? $order : "sort,add_time DESC";
		$limit = !empty($limit) ? $limit : 20;
		$page = $condition['cp'];
		unset($condition['cp']);
		//组合二维数组
		foreach( $condition as $key=>$val ) if( strpos($val,'#') != false ) $condition[$key] = explode('#',$val);
		//获取总数
		$result['totalNum'] = $this->where( $condition )->count();
		if ( $result['totalNum'] > 0 ) {
			$result['totalPages'] = ceil( intval($result['totalNum']) / $limit ); //总页数
			//处理当前页码
			$page = ( intval($page) < 1 ) ? 1 : intval($page);
			if ( $page > $result['totalPages'] ) $page = $result['totalPages'];
			$limit = ($page - 1) * $limit . ", $limit";
			//查询商品记录SQL获取列表之后，再进行折扣计算操作，然后返回最终结果集
			$result['list'] = $this->where( $condition )->field( $field )->order( $order )->limit( $limit )->select();
		}
		$result['page'] = split_page( $result['totalPages'] );
		$result['pageTop'] = split_page( $result['totalPages'],2 );
		return array($result);
	}

	/**
	+----------------------------------------------------------
	* 获取信息
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	* @example <model model="" fun="getInfo" condition="" order="" limit="" key="i">
	+----------------------------------------------------------
	*/
	public function getInfo( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$result = $this->where( $condition )->field( $field )->select();
		return $result;
	}

}
?>
