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
class PlateServiceModel extends SBaseModel {

	protected $trueTableName = 'base_site_plate_content';

	/**
	+----------------------------------------------------------
	* 获取面板
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件
	*          @param   arr      sid          站点编码
	*          @param   arr      spgCode      面板分组编码
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	* @example http://www.altila.com/BaseService/PlateService/getPlate?spgCode=Base_Index_index&sid=1
	+----------------------------------------------------------
	*/
	public function getPlate( $condition = array(), $field = '', $order = '', $limit = '' ) {
		if( empty($condition['spgCode']) || empty($condition['sid']) )
			return array( 'data'=>false, 'info'=>"获取失败", 'status'=>0 );
		//查询数据
		$date = date('Y-m-d H:i');
		$timeCondition = "( spc.start_time < '{$date}' AND  spc.end_time > '{$date}' ) OR ( spc.start_time = '1970-01-01 08:00:00' AND spc.end_time > '{$date}' ) OR ( spc.start_time < '{$date}' AND spc.end_time = '1970-01-01 08:00:00' ) OR ( spc.start_time = '1970-01-01 08:00:00' AND spc.end_time = '1970-01-01 08:00:00' )";
		$sql = "SELECT spc.id,spc.name AS spcName,spc.row_position,spc.type,spc.model,spc.model_value,spc.class AS spcClass,spc.sort AS spcSort,spc.list_opt,spc.list_num
			,sp.spid,sp.name AS spName,sp.row,sp.class AS spClass,sp.sort AS spSort
			,spg.spgid,spg.name AS spgName,spg.code 
			FROM base_site_plate_content AS spc
			LEFT JOIN base_site_plate AS sp ON sp.spid = spc.spid
			LEFT JOIN base_site_plate_group AS spg ON spg.spgid = sp.spgid
			WHERE spc.status = 1 AND sp.status = 1 AND spg.status = 1 AND ( {$timeCondition} )
			AND spg.sid = {$condition['sid']} AND spg.code = '{$condition['spgCode']}'
			ORDER BY sp.sort,spc.row_position,spc.sort,spc.create_time DESC";
		$list = $this->getCacheData( '', $sql );
		if( empty($list) ) return;
		//拼接数据
		foreach( $list as $key => $val ){
			if( $val['row_position'] <= $val['row'] ){
				$value = $val;
				unset($value['spName'],$value['spClass'],$value['spSort'],$value['row_position'],$value['spcSort'],$value['spgName'],$value['code'],$value['spgid'],$value['spid'],$value['spcName'],$value['spcClass']);
				$result['id'] = $val['spgid'];
				$result['name'] = $val['spgName'];
				$result['code'] = $val['code'];
				$result['data'][$val['spSort']]['id'] = $val['spid'];
				$result['data'][$val['spSort']]['name'] = $val['spName'];
				$result['data'][$val['spSort']]['class'] = $val['spClass'];
				$result['data'][$val['spSort']]['data'][$val['row_position']]['data'][$val['spcSort']] = $value;
				$result['data'][$val['spSort']]['data'][$val['row_position']]['data'][$val['spcSort']]['name'] = $val['spcName'];
				$result['data'][$val['spSort']]['data'][$val['row_position']]['data'][$val['spcSort']]['class'] = $val['spcClass'];
			}
		}
		//print_r($result);
		return array( 'data'=>$result, 'info'=>"获取成功", 'status'=>1 );
	}

}

?>
