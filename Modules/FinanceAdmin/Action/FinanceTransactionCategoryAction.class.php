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

class FinanceTransactionCategoryAction extends FinanceTransactionTagAction {

	/**
	+----------------------------------------------------------
	* 字段过滤
	+----------------------------------------------------------
	*/
	public function _filter( &$map ) {
		$map['type'] = array('in','1,2');
		$map['fcid'] = array('in',findById('FinanceAdmin/FinanceCategory',array('parent_id'=>$_REQUEST['fcid']),'fcid','str'));
		parent::_filter($map);
	}
	

}
?>
