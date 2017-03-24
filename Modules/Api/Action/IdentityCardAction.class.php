<?php
// +----------------------------------------------------------------------
// | TOPThink [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2010 http://topthink.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
// $Id$


class IdentityCardAction extends BaseAction {

	/**
	+----------------------------------------------------------
	* 获取身份证信息
	* www.altila.com/Api/IdentityCard?idCard=
	+----------------------------------------------------------
	*/
	public function index() {
		$idCard = $_REQUEST['idCard'];
		$result = D( $this->getActionName() )->juheIdCard($idCard);
		print_r($result);
	}


}
?>
