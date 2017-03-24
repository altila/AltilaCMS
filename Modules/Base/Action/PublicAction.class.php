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


class PublicAction extends HBaseAction {

	/**
	+----------------------------------------------------------
	* 获取登录验证码 默认为4位数字
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return string
	+----------------------------------------------------------
	*/
	public function verify() {
		ob_clean();
		import("ORG.Util.Image",LIB_PATH);
		$length = C('VERIFY_CODE_LENGTH');
		if( strpos($length,',') ){
			$rand = explode(',',$length);
			$length = floor(mt_rand((int)$rand[0],(int)$rand[1]));
		}
		Image::buildImageVerify($length?$length:4,$mode=5,$type='png',$width=50,$height=27);
	}



}
?>
