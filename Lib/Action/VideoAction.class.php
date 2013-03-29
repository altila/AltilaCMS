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

class VideoAction extends ABaseAction {

	/**
	+----------------------------------------------------------
	* 新增前置
	+----------------------------------------------------------
	*/
	public function getVideoSearchList() {
		$key = htmlspecialchars($_POST["searchKey"]);
		$type = htmlspecialchars($_POST["videoType"]);
		$result = file_get_contents( "http://api.tudou.com/v3/gw?method=item.search&appKey=myKey&format=json&kw={$key}&pageNo=1&pageSize=20&channelId={$type}&inDays=7&media=v&sort=s");
		die( $result );
	}


}
?>
