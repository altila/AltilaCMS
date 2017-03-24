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

class FormContentAction extends HBaseAction {

	/**
	+----------------------------------------------------------
	* 保存数据
	+----------------------------------------------------------
	*/
	public function setValue() {
		if( $_SESSION['verify'] != md5($_REQUEST['verify']) )
			$this->ajaxReturn( '', "提交失败", 0, 'JSON_CALLBACK', array('field'=>'verify','msg'=>'验证码错误') );
		$model = D( $this->getActionName() );
		$condition = $_REQUEST;
		$condition['ip'] = get_client_ip();
		$condition['status'] = 1;
		$condition['curlType'] = 1;
		$result = $model->setValue( $condition, $field, $order, $limit );
		$this->ajaxReturn( $result['data'], $result['info'], $result['status'], 'JSON_CALLBACK', $result['extra'] );
	}

}
?>

