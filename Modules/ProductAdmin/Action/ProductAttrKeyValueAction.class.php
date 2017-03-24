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

class ProductAttrKeyValueAction extends ABaseAction {

	/**
	+----------------------------------------------------------
	* 默认排序页
	+----------------------------------------------------------
	*/
	public function sort() {
		$_REQUEST['orderField'] = $_REQUEST['orderField'] ? $_REQUEST['orderField'] : 'sort';
		$_REQUEST['orderDirection'] = $_REQUEST['orderDirection'] ? $_REQUEST['orderDirection'] : 'asc';
		//列表过滤器，生成查询Map对象
		$map = $this->_search();
		$map['status'] = 1;
		$map['value'] = array( 'neq', '' );
		if( method_exists( $this, '_filter' ) )
			$this->_filter( $map );
		$model = D( $this->getActionName() );
		if( !empty( $model ) )
			$this->_list( $model, $map );
		$this->display();
	}

}
?>
