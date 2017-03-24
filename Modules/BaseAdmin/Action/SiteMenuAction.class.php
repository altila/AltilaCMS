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

class SiteMenuAction extends ACategoryAction {

	/**
	+----------------------------------------------------------
	* 默认删除前置操作
	+----------------------------------------------------------
	*/
	public function _before_delete() {
		$modelName = $this->getActionName();
		$model = D( $modelName );
		$pk = $model->getPk();
		$id = $_REQUEST[$pk];
		if( $_REQUEST['isForever'] == 1 ) {
			$crumb = findById ( $modelName, $_REQUEST[$pk], 'crumb' );
			$list = $model->where( "crumb like '{$crumb}%'" )->select();
			foreach( $list as $key=>$val ) {
				$ids[] = $val[$pk];
				$array[$val['model']][] = $val[$pk];
			}
			$model->foreverDelete( array( $pk => array('in',$ids) ) );
			foreach( $array as $key=>$val ) {
				//菜单模型：0为单篇，1为文章，2为图片，3为产品，4为博文，5为小说，6为招聘，7为表单，8为理财
				if( in_array($key,array(0,1)) ) $_model = D( 'ArticleInfo' );
				else if( $key == 2 ) $_model = D( 'ArticleInfo' );
				else if( $key == 3 ) $_model = D( 'ProductAdmin/ProductInfo' );
				else if( $key == 4 ) $_model = D( 'BlogAdmin/BlogInfo' );
				else if( $key == 5 ) $_model = D( 'NovelAdmin/NovelInfo' );
				else if( $key == 6 ) $_model = D( 'JobInfo' );
				else if( $key == 7 ) $_model = D( 'FormInfo' );
				$_model->foreverDelete( array( $pk => array('in',$val) ) );
			}
			
		}
		parent::_before_delete();
	}

}
?>
