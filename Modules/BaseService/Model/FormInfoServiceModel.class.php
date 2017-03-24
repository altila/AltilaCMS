<?php
// +----------------------------------------------------------------------
// | ThinkPHP
// +----------------------------------------------------------------------
// | Copyright (c) 2011 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: dizzthxl <dizzt@topthink.com>
// +----------------------------------------------------------------------
// $Id$
class FormInfoServiceModel extends SInfoBaseModel {

	protected $trueTableName = 'base_form_info';

	/**
	+----------------------------------------------------------
	* 获取招聘【列表】
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件
	*          @param   int    smid           导航编码
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	* @example http://www.altila.com/BaseService/FormInfoService/getList?field=*&order=&limit=&smid=52&needCount=1&limit=0,100&sid=1
	+----------------------------------------------------------
	*/
	public function getList( $condition = array(), $field = '', $order = '', $limit = '' ) {
		if( !empty($condition['smid']) )
			$result = $this->getListBySmid( $condition, $field, $order, $limit );
		else
			return array( 'data'=>false, 'info'=>"获取失败", 'status'=>0 );
		//组合数据
		foreach( $result['data'] as $key=>$val ) {
			if( in_array($val['input_type'],array('2','3')) )
				$result['data'][$key]['value'] = explode("\n",$val['value']);
		}
		//print_r($result);
		return array( 'data'=>$result, 'info'=>"获取成功", 'status'=>1 );
	}

}

?>
