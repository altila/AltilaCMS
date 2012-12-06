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


class IndexAction extends Action {

    /**
    +----------------------------------------------------------
    * 
    +----------------------------------------------------------
    */
	public function index(){
		print_r(domain('admin')."/Login.html");
		//if( empty($this->userInfo) ){
			header(domain('admin')."/Login.html");
		//}
        $this->display();
    }

	public function aaa(){
		print_r(domain('admin')."/Login.html");
        $this->display();
    }


}
?>
