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
		vendor('InterfaceBase#class');
		//实例化采集类
		$this->Interface = new InterfaceBase();
	}

	/**
	+----------------------------------------------------------
	* 淘宝分类采集
	* www.altilacms.com/Collect/Category/getCateTaobao
	* leaf：0为有子分类，1为无子分类，2为有品牌
	+----------------------------------------------------------
	*/
	public function getCateTaobao() {
		$model = D( 'Admin/BaseProductCategory' );
		$date = date("Y-m-d");
		$this->Interface->cookie = "t=f960bbd4accd65b03e83b7cb2094e47b; cna=UeG/COW5GUkCASxTQt4hFKRg; tg=0; _cc_=UtASsssmfA%3D%3D; tracknick=touch0622; l=touch0622::1369019876025::11; lzstat_uv=2175932053830957644|3004595@2427753@2945527@2948565@2043323@3045821; x=e%3D1%26p%3D*%26s%3D0%26c%3D0%26f%3D0%26g%3D0%26t%3D0; cookie2=fa87c418b1a5c50bb52e1916a81e14de; uc1=lltime=1369125281&cookie14=UoLa9eG%2BQuEUow%3D%3D&existShop=true&cookie16=UIHiLt3xCS3yM2h4eKHS9lpEOw%3D%3D&cookie21=VT5L2FSpdet0IDFLPjhh6g%3D%3D&tag=2&cookie15=WqG3DMC9VAQiUQ%3D%3D; v=0; unb=49418406; _nk_=touch0622; _l_g_=Ug%3D%3D; sg=261; lastgetwwmsg=MTM2OTIxMTY3OA%3D%3D; cookie1=AC%2FJ2NiRC44Rfh4kbvZ1pgApLXZEk7AillR7VEpum9M%3D; cookie17=VyUIW%2FlvJos%3D";
		$this->Interface->url = "http://upload.taobao.com/auction/json/reload_cats.htm";
		$allResult = json_decode( iconv( 'GBK', 'UTF-8', $this->Interface->curlFuncGet() ), true );
		if( empty($allResult) ) die( "请登录" );
		foreach( $allResult[0]['data'] as $key=>$val ) {
			$lastId = $this->getCateTaobaoAddInfo( $val, 0 );
			foreach( $val['data'] as $k=>$v ) {
				$_lastId = $this->getCateTaobaoAddInfo( $v, $lastId );
				if( $v['leaf'] == 0 ){
					$_result = json_decode( iconv( 'GBK', 'UTF-8', $this->Interface->curlFuncPost(array('path'=>'next','sid'=>$v['sid'])) ), true );
					foreach( $_result[0]['data'] as $_key=>$_val )
						foreach( $_val['data'] as $_k=>$_v )
							$__lastId = $this->getCateTaobaoAddInfo( $_v, $_lastId );
				}
				//if( iconv_strrpos($_result[0]['pName'],'品牌',0,'UTF-8') ) 
				//$result[$key]['data'][$v]['data'] = $_result[0]['data'];
				//print_r($_result);
			}
		}
		//print_r($allResult);
	
	}

	/**
	+----------------------------------------------------------
	* 分类数据添加
	+----------------------------------------------------------
	*/
	public function getCateTaobaoAddInfo( $val, $parent_id ) {
		$model = D( 'Admin/BaseProductCategory' );
		$pk = $model->getPk();
		$date = date("Y-m-d");
		$parent_id = $parent_id ? $parent_id : 0;
		$tsid = $val['sid'] ? $val['sid'] : $val['id'];
		$tleaf = $val['leaf'] ? $val['leaf'] : 0;
		$code = $val['spell'] ? $val['spell'] : '';
		$info = $model->where( "{$pk} = {$parent_id}" )->find();
		$_info = $model->where( "tsid = {$tsid}" )->find();
		if( empty($_info[$pk]) ) {
			$model->data( array( 'parent_id'=>$parent_id, 'name'=>$val['name'], 'code'=>$code, 'tsid'=>$tsid, 'tleaf'=>$tleaf, 'status'=>1, 'add_time'=>$date, 'update_time'=>$date ) )->add();
			$_lastId = $model->getLastInsID();
			$model->where( "{$pk} = {$_lastId}" )->save( array('crumb'=>"{$info['crumb']}{$_lastId}-") );
		}
		$result = $_lastId ? $_lastId : $_info[$pk];
		return $result;
	}

}
?>
