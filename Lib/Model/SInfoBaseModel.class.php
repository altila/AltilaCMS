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
class SInfoBaseModel extends SBaseModel {

	/*******************************************************  详情 - 接口  ***************************************************************/

	/**
	+----------------------------------------------------------
	* 获取文章/博文【详情】
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
	* @example http://www.altila.com/BaseService/ArticleInfoService/getInfo?aiid=1
	*          http://www.altila.com/BlogService/BlogInfoService/getInfo?biid=1
	*          http://www.altila.com/ProductService/ProductInfoService/getInfo?piid=1
	+----------------------------------------------------------
	*/
	public function getInfo( $condition = array(), $field = '', $order = '', $limit = '' ) {
		if( !empty($condition[getModelPk($this->getModelName())]) )
			$result = $this->getInfoById( $condition, $field, $order, $limit );
		else
			return array( 'data'=>false, 'info'=>"获取失败", 'status'=>0 );
		return array( 'data'=>$result, 'info'=>"获取成功", 'status'=>1 );
	}

	/**
	+----------------------------------------------------------
	* 获取文章/图片/博文/招聘【列表】
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
	* @example http://www.altila.com/BaseService/ArticleInfoService/getList?smid=1
	*          http://www.altila.com/BlogService/BlogInfoService/getList?smid=1
	*          http://www.altila.com/BaseService/JobInfoService/getList?field=*&order=&limit=&smid=50&needCount=1&limit=0,10&sid=1
	*          http://www.altila.com/BaseService/FormInfoService/getList?field=*&order=&limit=&smid=52&needCount=1&limit=0,100&sid=1
	+----------------------------------------------------------
	*/
	public function getList( $condition = array(), $field = '', $order = '', $limit = '' ) {
		if( !empty($condition[getModelPk($this->getModelName())]) )
			$result = $this->getListById( $condition, $field, $order, $limit );
		else if( !empty($condition['smid']) )
			$result = $this->getListBySmid( $condition, $field, $order, $limit );
		else
			return array( 'data'=>false, 'info'=>"获取失败", 'status'=>0 );
		return array( 'data'=>$result, 'info'=>"获取成功", 'status'=>1 );
	}

	/**
	+----------------------------------------------------------
	* 获取文章/博文【左侧列表】
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
	* @example http://www.altila.com/BaseService/ArticleInfoService/getLeftList?aiid=1
	*          http://www.altila.com/BlogService/BlogInfoService/getLeftList?biid=1
	+----------------------------------------------------------
	*/
	public function getLeftList( $condition = array(), $field = '', $order = '', $limit = '' ) {
		if( !empty($condition[getModelPk($this->getModelName())]) )
			$result = $this->getLeftListById( $condition, $field, $order, $limit );
		else
			return array( 'data'=>false, 'info'=>"获取失败", 'status'=>0 );
		return array( 'data'=>$result, 'info'=>"获取成功", 'status'=>1 );
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
		if( false === $this->create() )
			return array( 'data'=>false, 'info'=>"获取失败", 'status'=>0 );
		$action = empty($condition[$this->getPk()]) ? add : save;
		if( $action == 'add' ) $condition['create_time'] = $this->nowDate;
		$condition['update_time'] = $this->nowDate;
		//新增-更新失败
		if( false === $this->$action($condition) )
			return array( 'data'=>false, 'info'=>"获取失败", 'status'=>0 );
		return array( 'data'=>array( 'data'=>'', 'info'=>"提交成功", 'status'=>1 ), 'info'=>"获取成功", 'status'=>1 );
	}

	/*******************************************************  详情 - 方法  ***************************************************************/

	/**
	+----------------------------------------------------------
	* 根据指定id获取文章/博文【列表】
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
	public function getListById( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$pk = getModelPk($this->getModelName());
		if( empty($condition[$pk]) ) return '';
		$condition[$pk] = array( 'in', explode(',',$condition[$pk]) );
		$condition['status'] = $condition['status'] ? $condition['status'] : 1;
		$condition['needCount'] = $condition['needCount'] ? $condition['needCount'] : 0;
		$field = $field ? $field : ( $condition['field'] ? $condition['field'] : '*' );
		$order = $order ? $order : ( $condition['order'] ? $condition['order'] : 'sort,create_time DESC' );
		$limit = $limit ? $limit : ( $condition['limit'] ? $condition['limit'] : "0,10" );
		$appdcode = $condition['appdcode'] ? $condition['appdcode'] : C('APPDCODE');
		if( $this->isExistField( 'appdcode' ) )$condition['_string'] = "appdcode&{$appdcode}={$appdcode}";
		unset($condition['appdcode'],$condition['smid']);
		$result = $this->getCacheData( '', $condition, $field, $order, $limit );
		//print_r($this->getLastsql());
		return $result;
	}

	/**
	+----------------------------------------------------------
	* 根据菜单smid获取文章/博文/商品【列表】
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
	public function getListBySmid( $condition = array(), $field = '', $order = '', $limit = '' ) {
		if( empty($condition['smid']) ) return '';
		$condition['status'] = $condition['status'] ? $condition['status'] : 1;
		$condition['needCount'] = $condition['needCount'] ? $condition['needCount'] : 0;
		$field = $field ? $field : ( $condition['field'] ? $condition['field'] : '*' );
		$order = $order ? $order : ( $condition['order'] ? $condition['order'] : 'sort,create_time DESC' );
		$limit = $limit ? $limit : ( $condition['limit'] ? $condition['limit'] : "0,10" );
		$appdcode = $condition['appdcode'] ? $condition['appdcode'] : C('APPDCODE');
		if( $this->isExistField( 'appdcode' ) )$condition['_string'] = "appdcode&{$appdcode}={$appdcode}";
		unset($condition['appdcode']);
		$categoryList = D('BaseService/ArticleCategoryService')->getCategoryByParent( array('parent_id'=>$condition['smid'], 'isTree'=>0, 'isAll'=>1), 'smid' );
		foreach( $categoryList as $key=>$val ) $category[] = $val['smid'];
		$condition['smid'] = !empty($category) ? array('in', $category ) : $condition['smid'];
		$result = $this->getCacheData( '', $condition, $field, $order, $limit );
		//print_r($this->getLastsql());
		return $result;
	}

	/**
	+----------------------------------------------------------
	* 根据文章/博文（aiid/biid）获取文章/博文【详情】
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
	public function getInfoById( $condition = array(), $field = '', $order = '', $limit = '' ) {
		if( empty($condition[getModelPk($this->getModelName())]) ) return '';
		$condition['status'] = $condition['status'] ? $condition['status'] : 1;
		$result = $this->getCacheData( '', $condition, $field, $order, $limit );
		return $result['0'];
	}

	/**
	+----------------------------------------------------------
	* 根据文章/博文（aiid/biid）获取文章/博文【左侧列表】
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
	public function getLeftListById( $condition = array(), $field = '', $order = '', $limit = '' ) {
		if( empty($condition[getModelPk($this->getModelName())]) ) return '';
		//文章信息
		$info = $this->getInfoById( $condition, '*', $order, $limit );
		unset($condition[getModelPk($this->getModelName())]);
		//查询条件
		$condition['smid'] = $info['smid'];
		$condition['field'] = $condition['field'] ? $condition['field'] : getModelPk($this->getModelName()).',smid,name,class';
		$limitArr = explode(',',$condition['limit']);
		$numPerPage = !empty($limitArr[1]) ? $limitArr[1] : ( !empty($limitArr[0]) ? $limitArr[0] : 10 );
		//前几条文章信息
		$condition['update_time'] = array('gt',$info['update_time']);
		$condition['order'] = 'sort,update_time';
		$condition['limit'] = round($numPerPage/2);
		$infoBefore = $this->getListBySmid( $condition, $field, $order, $limit );
		//后几条文章信息
		$condition['update_time'] = array('lt',$info['update_time']);
		$condition['order'] = 'sort,update_time DESC';
		$condition['limit'] = $numPerPage - 1 - count($infoBefore);
		$infoAfter = $this->getListBySmid( $condition, $field, $order, $limit );
		//组合数据
		if( !empty($infoBefore) ) foreach( $infoBefore as $key=>$val ) $result[] = $val;
		if( !empty($infoBefore) || !empty($infoAfter) ) $result[] = array( getModelPk($this->getModelName())=>$info[getModelPk($this->getModelName())], 'smid'=>$info['smid'], 'name'=>$info['name'], );
		if( !empty($infoAfter) ) foreach( $infoAfter as $key=>$val ) $result[] = $val;
		//print_r($result);
		return $result;
	}


}
?>
