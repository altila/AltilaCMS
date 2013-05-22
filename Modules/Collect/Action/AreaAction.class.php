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

	function _initialize() {
		//父类构造函数
		parent::_initialize();
		//设置脚本最大执行时间
		set_time_limit(0);
		//载入接口方法
		vendor('Snoopy#class');
		//实例化采集类
		$this->snoopy = new Snoopy;
	}

	/**
	+----------------------------------------------------------
	* 地区行政代码采集
	* www.altilacms.com/Collect/Area/administrative
	+----------------------------------------------------------
	*/
	public function administrative() {
		//获取地区行政代码URL总会
		$this->snoopy->fetchlinks( "http://www.stats.gov.cn/tjbz/xzqhdm/index.htm" );
		$uResult = $this->snoopy->results;
		//获取最新地区行政代码URL
		$this->snoopy->stripRepStr = "\n";
		$this->snoopy->fetchtext($uResult[3]);
		$result = explode("\n",$this->snoopy->results);
		$list = array( '710000'=>'台湾省', '810000'=>'香港特别行政区', '820000'=>'澳门特别行政区' );
		foreach( $result as $key=>$val ) {
			if( empty($val) || empty($result[$key+1]) || !is_numeric($val) || is_numeric($result[$key+1]) ) continue;
			$list[$val] = iconv('GB2312', 'UTF-8', $result[$key+1]);
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
		//$model->getSetCache( 'administrative', 'File', false, $str );
		print_r($str);
	}

	/**
	+----------------------------------------------------------
	* 区号邮编采集
	* www.altilacms.com/Collect/Area/call_zip
	* 百科验证：http://baike.baidu.com/search/word?word=%E7%9F%B3%E6%8B%90%E5%8C%BA&pic=1&sug=1&enc=utf8
	+----------------------------------------------------------
	*/
	public function call_zip() {
		$model = D( 'Admin/BaseArea' );
		//获取省级信息
		$area = findById( 'Admin/BaseArea',array('parent_id'=>'156'),"baid","arr" );
		//获取区号邮编 - http://www.hljboli.gov.cn/html/code.html
		$this->snoopy->stripRepStr = "\n";
		foreach( $area as $k=>$v ){
			$this->snoopy->fetchtext( "http://www.123cha.com/postal/html/" . substr($v,0,2) . ".html" );
			$result = explode("\n",$this->snoopy->results);
			foreach( $result as $key=>$val ) {
				if( empty($val) || is_numeric($val) || !is_numeric($result[$key+1]) || !is_numeric($result[$key+2]) ) continue;
				$callCode = substr($val,0,1) == 0 ? $result[$key+1] : "0{$result[$key+1]}";
				$list[$v][$key] = "{$val}-{$result[$key+2]}-{$callCode}";
				$info = $model->where( " name_full = '{$val}' AND crumb LIKE '%{$v}%' " )->select();
				if( empty($info[0]['name_full']) ) $str['wu'][$v][$key] = $list[$v][$key];
				elseif( count($info) > 1 ) $str['du'][$v][$key] = $list[$v][$key];
				elseif( empty($info[0]['zip_code']) || empty($info[0]['call_code']) )
					$model->where( " name_full = '{$val}' AND crumb LIKE '%{$v}%' " )->save( array('zip_code'=>$result[$key+2],'call_code'=>$callCode) );
			}
		}
		print_r($str);
	}




}
?>
