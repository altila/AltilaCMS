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

class FinanceOrganizationAction extends ABaseAction {

	//中国银行列表：http://zh.wikipedia.org/wiki/%E4%B8%AD%E5%9B%BD%E9%93%B6%E8%A1%8C%E5%88%97%E8%A1%A8

	/**
	+----------------------------------------------------------
	* 选择机构
	+----------------------------------------------------------
	*/
	public function selectOrganization() {
		$_result[] = array('0','请选择');
		$model = D( $this->getActionName() );
		$pk = $model->getPk();
		if( !empty($_REQUEST['type']) && $_REQUEST['type'] != '请选择' ) {
			$result = $model->where( array('status'=>'1','type'=>$_REQUEST['type']) )->order( "{$pk}" )->select();
			foreach( $result as $key=>$val )
				$_result[] = array( $val[$pk], $val['name'] );
		}
		$this->ajaxReturn( json_encode($_result), '', '', 'EVAL' );
	}

}
?>
