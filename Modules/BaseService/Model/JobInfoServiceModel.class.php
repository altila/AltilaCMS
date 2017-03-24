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
class JobInfoServiceModel extends SInfoBaseModel {

	protected $trueTableName = 'base_job_info';

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
	* @example http://www.altila.com/BaseService/JobInfoService/getList?field=*&order=&limit=&smid=50&needCount=1&limit=0,10&sid=1
	+----------------------------------------------------------
	*/
	public function getList( $condition = array(), $field = '', $order = '', $limit = '' ) {
		if( !empty($condition['smid']) )
			$result = $this->getListBySmid( $condition, $field, $order, $limit );
		else
			return array( 'data'=>false, 'info'=>"获取失败", 'status'=>0 );
		//组合数据
		$workYear = L('WorkYear');
		$provideSalary = L('PeovideSalary');
		$degreeFrom = L('DegreeFrom');
		foreach( $result['data'] as $key=>$val ) {
			$result['data'][$key]['province'] = findById('Admin/BaseArea',$val['province'],'name');
			$result['data'][$key]['city'] = findById('Admin/BaseArea',$val['city'],'name');
			$result['data'][$key]['area'] = findById('Admin/BaseArea',$val['area'],'name');
			$result['data'][$key]['work_year'] = $workYear[$val['work_year']];
			$result['data'][$key]['provide_salary'] = $provideSalary[$val['provide_salary']];
			$result['data'][$key]['degree_from'] = $degreeFrom[$val['degree_from']];
		}
		//print_r($result);
		return array( 'data'=>$result, 'info'=>"获取成功", 'status'=>1 );
	}

}

?>
