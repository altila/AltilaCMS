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


class AreaAction extends HBaseAction {

	/**
	+----------------------------------------------------------
	* 地区行政代码采集
	* www.altilacms.com/Collect/Area/administrative
	+----------------------------------------------------------
	*/
	public function administrative() {
		//设置脚本最大执行时间
		set_time_limit(0);
		//载入接口方法
		vendor('Snoopy#class');
		$snoopy = new Snoopy;
		//获取地区行政代码URL总会
		$url = "http://www.stats.gov.cn/tjbz/xzqhdm/index.htm";
		$snoopy->fetchlinks($url);
		$uResult = $snoopy->results;
		//获取最新地区行政代码URL
		$aSnoopy = new Snoopy;
		$aSnoopy->fetchtext($uResult[3]);
		$aResult = explode("\n",$aSnoopy->results);
		foreach( $aResult as $key=>$val )
			if( strlen($val) > 1000 ) $result = explode("\r",$val);
		$count = count($result) - 4;
		$list = array( '710000'=>'台湾省', '810000'=>'香港特别行政区', '820000'=>'澳门特别行政区' );
		foreach( $result as $key=>$val ) {
			if( $key%2 == 1 ) continue;
			if( $key < $count ) $list[$val] = iconv('GB2312', 'UTF-8', $result[$key+1]);
		}
		//校验数据
		$model = D( 'Admin/BaseArea' );
		foreach( $list as $key=>$val ){
			if( $info = $model->where( " administrative_code = {$key} " )->find() ) {
				//名称全名不同
				if( $info['name_full'] != $val ) {
					$str['edit']['id'] .= "{$key},";
					$str['edit'][$key] = $val;
				}
			} else {
				$str['add'][$key]['name'] = $val;
				$str['add'][$key]['old'] = findById('Admin/BaseArea',array('name_full'=>array('like',mb_substr($val,0,2,'UTF-8').'%')),"baid","str" );
			}
			$keyIds .= "{$key},";
		}
		$str['delInfo'] = findById( 'Admin/BaseArea',array('baid'=>array('not in',rtrim($keyIds,',')),'parent_id'=>array('neq',0)),"baid","str" );
		$model->getSetCache( 'administrative', 'File', false, $str );
		print_r($str);
	}

}
?>
