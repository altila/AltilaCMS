<?php
// +----------------------------------------------------------------------
// | ThinkPHP
// +----------------------------------------------------------------------
// | Copyright (c) 2011 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: dizzthxl <dizzt@topthink.com>
// +----------------------------------------------------------------------
// $Id$
class PlateModel extends HBaseModel {

	protected $trueTableName = 'base_site_plate_content';

	/**
	+----------------------------------------------------------
	* 获取面板
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件:spgCode
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	*/
	public function getPlate( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$condition['sid'] = $condition['sid'] ? $condition['sid'] : getLang();
		$key = C("SitePlateGroup") . "{$condition['spgCode']}_{$condition['sid']}";
		$result = $this->getInterfaceData( 'BaseService/PlateService/getPlate', $key, $condition, $field, $order, $limit, $extra );
		$result = $result['data'];
		//print_r($result);
		foreach( $result['data'] as $keys=>$value ) {
			foreach( $value['data'] as $key=>$val ) {
				foreach( $val['data'] as $k=>$v ) {
					$_result = '';$condition = array();
					if( $v['model'] == 1 ) { $infoModel = D('ArticleInfo'); $categoryModel = D('ArticleCategory'); }
					else if( $v['model'] == 2 ) { $infoModel = D('PictureInfo'); $categoryModel = D('PictureCategory'); }
					else if( $v['model'] == 3 ) { $infoModel = D('Product/ProductInfo'); $categoryModel = D('Product/ProductCategory'); }
					else if( $v['model'] == 4 ) { $infoModel = D('Blog/BlogInfo'); $categoryModel = D('Blog/BlogCategory'); }
					else if( $v['model'] == 6 ) { $infoModel = D('JobInfo'); $categoryModel = D('JobCategory'); }
					else if( $v['model'] == 7 ) { $infoModel = D('FormInfo'); $categoryModel = D('FormCategory'); }
					if( $v['model'] == -1 ) $categoryModel = D('Menu');
					if( $v['model'] != -1 ) $idKey = $infoModel->getPk();
					if( $v['model'] == 0 ) {
						//广告
						$_result = D('Ad')->getAdPosList( array('apCode'=>$v['model_value'], 'sid'=>$condition['sid'], 'isOne'=>1) );
					} else if( in_array($v['type'], array(1,7)) ) {
						//文章/图片/商品/博文/招聘列表
						if( in_array($v['model'],array('2','6','7')) ) $field = '*';
						$currentPage = ( !empty($_REQUEST['currentPage']) && $_REQUEST['currentPage'] > 0 ) ? ( $_REQUEST['currentPage'] - 1 ) * $v['list_num'] : 0;
						$condition['limit'] = "{$currentPage},{$v['list_num']}";
						$condition['needCount'] = 1;
						$condition['smid'] = !empty($_REQUEST['smid']) ? $_REQUEST['smid'] : $v['model_value'];
						if( $v['type'] == 7 ) $condition[$infoModel->getPk()] = $v['model_value'];
						$_result = $infoModel->getList( $condition, $field );
						$_result['page'] = split_page( $_result['totalPage'] );
						$_result['pageTop'] = split_page( $_result['totalPage'],2 );
					} else if( $v['type'] == 2 ) {
						//文章/图片/商品/博文/招聘分类
						$_result = $categoryModel->getCategory( array('parent_id'=>$v['model_value']) );
					} else if( in_array($v['model'],array('1','3','4')) && $v['type'] == 3 ) {
						//文章/商品/博文详情
						$id = !empty($_REQUEST[$idKey]) ? $_REQUEST[$idKey] : $v['model_value'];
						$_result = $infoModel->getInfo( array($idKey=>$id) );
					} else if( $v['type'] == 4 ) {
						//文章/图片/商品/博文/招聘/表单面包屑
						if( !empty($_REQUEST[$idKey]) ) $condition['id'] = $_REQUEST[$idKey];
						else if( !empty($_REQUEST['smid']) ) $condition['smid'] = $_REQUEST['smid'];
						$_result = $categoryModel->getBreadCrumbs( $condition );
					} else if( $v['type'] == 5 ) {
						//文章/图片/商品/博文/招聘侧栏分类
						if( !empty($_REQUEST['smid']) ) $condition['smid'] = $_REQUEST['smid'];
						$condition['model_value'] = $v['model_value'];
						$_result = $categoryModel->getLeftCategory( $condition );
					} else if( in_array($v['model'],array('1','4')) && $v['type'] == 6 ) {
						//文章/博文侧栏列表
						if( !empty($_REQUEST[$idKey]) ) $condition[$idKey] = $_REQUEST[$idKey];
						$_result = $infoModel->getLeftList( $condition );
					}
					$result['data'][$keys]['data'][$key]['data'][$k]['data'] = $_result;
				}
			}
		}
		//print_r($result);
		return $result;
	}

}

?>
