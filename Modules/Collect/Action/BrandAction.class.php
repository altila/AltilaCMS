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


class BrandAction extends HBaseAction {

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
	* 淘宝品牌采集
	* http://www.altila.com/Collect/Brand/getBrandTaobao
	*     http://upload.taobao.com/auction/json/reload_cats.htm?sid=50026951
	* leaf：0为有子分类，1为无子分类，2为有品牌
	+----------------------------------------------------------
	*/
	public function getBrandTaobao( $condition = array() ) {
		$this->Interface->cookie = "t=4c96e9a7042dd372d3c0394b2cf3d180; cna=SqZzC0Iz1VoCAd5DHt7fclQn; uc3=nk2=An0YXxDNvscWkg%3D%3D&id2=Vvl%2B%2BxOmVLhl&vt3=F8dHqRVSKgtPIivn24w%3D&lg2=VT5L2FSpMGV7TQ%3D%3D; lgc=altila7258; tracknick=altila7258; mt=np=&ci=0_1; _cc_=V32FPkk%2Fhw%3D%3D; tg=0; ali_ab=222.67.30.222.1391245419701.5; cookie2=1e80eb95f8637aa3de7b70ac3acb5e5e; uc1=lltime=1391272234&cookie14=UoLVZMJ7yN1j2A%3D%3D&existShop=true&cookie16=W5iHLLyFPlMGbLDwA%2BdvAGZqLg%3D%3D&cookie21=WqG3DMC9FxUx&tag=2&cookie15=VT5L2FSpMGV7TQ%3D%3D; v=0; _tb_token_=Xao7QoDRCym; _nk_=altila7258; existShop=MTM5MTI3NjIzOQ%3D%3D; sg=85b; cookie1=UNjWYYjP8asBgUqz0v3gJcntUiSSAtxh2yfKhlsZx7Q%3D; unb=579214525; publishItemObj=Ng%3D%3D; _l_g_=Ug%3D%3D; cookie17=Vvl%2B%2BxOmVLhl";
		$this->Interface->httpHeader = array('Host: upload.taobao.com');
		$this->isUserAgent = 1;
		//获取下级是品牌数据的分类
		$list = D( 'BackupBaseProductCategory' )->field( 'bpcid' )->where( 'status = 1 AND tleaf = 2' )->limit( '6700,1300' )->select();
		//print_r($list);
		foreach( $list as $key=>$value ) {
			$this->Interface->url = "http://upload.taobao.com/auction/json/reload_cats.htm?sid={$value['bpcid']}";
			print_r("{$this->Interface->url}\n\r");
			$result = iconv( 'GBK', 'UTF-8', $this->Interface->curlFunc() );
			if( empty($result) || empty($result[0]) ) print_r( "请登录" );
			if( empty($result[0]['pName']) || $result[0]['pName'] != '品牌' ) continue;
			//print_r($result[0]);
			foreach( $result[0]['data'] as $ke=>$val ) {
				foreach( $val['data'] as $k=>$v ){
					$lastId = $this->addBrandTaobao( $v );
					$this->addCategoryBrandTaobao( array('bpcid'=>$value['bpcid'],'bbid'=>$lastId) );
				}
			}
			//break;
		}
	}

	/**
	+----------------------------------------------------------
	* 品牌数据添加
	+----------------------------------------------------------
	*/
	public function addBrandTaobao( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$model = D( 'BackupBaseBrand' );
		$pk = $model->getPk();
		$date = date("Y-m-d H:i:s");
		$tsid = ltrim(strchr($condition['sid'],":"),":");
		$tleaf = $condition['leaf'] ? $condition['leaf'] : 0;
		$code = $condition['spell'] ? $condition['spell'] : '';
		$info = $model->where( "{$pk} = {$tsid}" )->find();
		if( empty($info[$pk]) ) {
			$model->data( array( $pk=>$tsid, 'name'=>$condition['name'], 'code'=>$code, 'tleaf'=>$tleaf, 'status'=>1, 'create_time'=>$date, 'update_time'=>$date ) )->add();
			$_lastId = $model->getLastInsID();
		}
		$result = $_lastId ? $_lastId : $info[$pk];
		return $result;
	}

	/**
	+----------------------------------------------------------
	* 商品分类品牌关联数据添加
	+----------------------------------------------------------
	*/
	public function addCategoryBrandTaobao( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$model = D( 'BackupBaseProductCategoryBrand' );
		$date = date("Y-m-d H:i:s");
		$info = $model->where( " bpcid = {$condition['bpcid']} AND bbid = {$condition['bbid']}" )->find();
		if( empty($info[$pk]) ) {
			$model->data( array( 'bpcid'=>$condition['bpcid'], 'bbid'=>$condition['bbid'], 'status'=>1, 'create_time'=>$date, 'update_time'=>$date ) )->add();
			$_lastId = $model->getLastInsID();
		}
		$result = $_lastId ? $_lastId : $info[$pk];
		return $result;
	}

}
?>
