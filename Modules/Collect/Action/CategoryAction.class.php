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


class CategoryAction extends HBaseAction {

	function _initialize() {
		//父类构造函数
		parent::_initialize();
		//设置脚本最大执行时间
		set_time_limit(0);
		//载入接口方法
		import("ORG.Vendor.DPSingletonFactory.SingletonFactory",LIB_PATH);
		//实例化采集类
		$this->Interface = SingletonFactory::getInstance("BaseInterface");
	}

	/**
	+----------------------------------------------------------
	* 淘宝分类采集
	* http://www.altila.com/Collect/Category/getCateTaobao
	*     http://upload.taobao.com/auction/json/reload_cats.htm?sid=
	* leaf：0为有子分类，1为无子分类，2为有品牌
	+----------------------------------------------------------
	*/
	public function getCateTaobao( $condition = array() ) {
		$this->Interface->cookie = "t=de8a94d36ae446fb8015bbd16a7afdea; cna=CL1fCxWYnV8CAd5CUyxFQNcP; uc3=nk2=An0YXxDNvscWkg%3D%3D&id2=Vvl%2B%2BxOmVLhl&vt3=F8dHqRVZD%2FJ0A8sRGZY%3D&lg2=WqG3DMC9VAQiUQ%3D%3D; lgc=altila7258; tracknick=altila7258; mt=np=&ci=0_1&cyk=0_0; _cc_=V32FPkk%2Fhw%3D%3D; tg=0; ali_ab=222.66.83.44.1390705598831.7; l=altila7258::1390729911005::11; cookie2=25b24ad11ae92b57a4818b192bc0ff31; uc1=lltime=1390786341&cookie14=UoLVZTSlzJYWYg%3D%3D&existShop=true&cookie16=Vq8l%2BKCLySLZMFWHxqs8fwqnEw%3D%3D&cookie21=UtASsssme%2BBq&tag=2&cookie15=UtASsssmOIJ0bQ%3D%3D; v=0; existShop=MTM5MDc5MDc1Mg%3D%3D; sg=85b; cookie1=UNjWYYjP8asBgUqz0v3gJcntUiSSAtxh2yfKhlsZx7Q%3D; unb=579214525; publishItemObj=Ng%3D%3D; _l_g_=Ug%3D%3D; _nk_=altila7258; cookie17=Vvl%2B%2BxOmVLhl; _tb_token_=53b65e9ed5575";
		$this->Interface->httpHeader = array('Host: upload.taobao.com');
		$this->isUserAgent = 1;
		$this->Interface->url = "http://upload.taobao.com/auction/json/reload_cats.htm?sid={$condition['sid']}";
		$result = iconv( 'GBK', 'UTF-8', $this->Interface->curlFunc() );
		if( empty($result[0]) ) print_r( "请登录" );
		print_r($result);
		foreach( $result[0]['data'] as $key=>$val ) {
			if( $val['id'] === 0 ) continue;
			if( !empty($val['id']) ) $lastId = $this->addCateTaobao( $val, 0 );
			foreach( $val['data'] as $k=>$v ) {
				if( $result[0]['pName'] != '类目' ) continue;
				$lastId = !empty($condition['sid']) ? $condition['lastId'] : $lastId;
				$_lastId = $this->addCateTaobao( $v, $lastId );
				if( $v['leaf'] == 0 ) $this->getCateTaobao( array('path'=>'next', 'sid'=>$v['sid'], 'lastId'=>$_lastId) );
			}
		}
	}

	/**
	+----------------------------------------------------------
	* 商品分类数据添加
	+----------------------------------------------------------
	*/
	public function addCateTaobao( $val, $parent_id ) {
		$model = D( 'BackupBaseProductCategory' );
		$pk = $model->getPk();
		$date = date("Y-m-d H:i:s");
		$parent_id = $parent_id ? $parent_id : 0;
		$tsid = $val['sid'] ? $val['sid'] : $val['id'];
		$tleaf = $val['leaf'] ? $val['leaf'] : 0;
		$code = $val['spell'] ? $val['spell'] : '';
		$info = $model->where( "{$pk} = {$parent_id}" )->find();
		$_info = $model->where( "{$pk} = {$tsid}" )->find();
		if( empty($_info[$pk]) ) {
			$model->data( array( $pk=>$tsid, 'parent_id'=>$parent_id, 'name'=>$val['name'], 'code'=>$code, 'tleaf'=>$tleaf, 'status'=>1, 'create_time'=>$date, 'update_time'=>$date ) )->add();
			$_lastId = $model->getLastInsID();
			$model->where( "{$pk} = {$_lastId}" )->save( array('crumb'=>"{$info['crumb']}{$_lastId}-") );
		}
		$result = $_lastId ? $_lastId : $_info[$pk];
		return $result;
	}

}
?>
