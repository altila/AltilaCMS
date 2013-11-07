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
class PlateModel extends HBaseModel {

	protected $trueTableName = 'site_plate_content';

	/**
	+----------------------------------------------------------
	* 获取面板
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件:spgCode
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	* @example <model model="Plate" app="Home" fun="getPlate" condition="$condition" order="" limit="" key="i">
	+----------------------------------------------------------
	*/
	public function getPlate( $condition = array(), $field = '', $order = '', $limit = '' ) {
		if( !empty($condition['spgCode']) ) $where .= " AND spg.code = '{$condition['spgCode']}' ";
		//查询数据
		$date = date('Y-m-d H:i');
		$timeCondition = "( spc.start_time < '{$date}' AND  spc.end_time > '{$date}' ) OR ( spc.start_time = '1970-01-01 08:00:00' AND spc.end_time > '{$date}' ) OR ( spc.start_time < '{$date}' AND spc.end_time = '1970-01-01 08:00:00' ) OR ( spc.start_time = '1970-01-01 08:00:00' AND spc.end_time = '1970-01-01 08:00:00' )";
		$sql = "SELECT spc.name AS spcName,spc.row_position,spc.type,spc.model,spc.model_value,spc.class AS spcClass,spc.sort AS spcSort,spc.list_opt,spc.list_num
			,sp.spid,sp.name AS spName,sp.row,sp.class AS spClass,sp.sort AS spSort
			,spg.spgid,spg.name AS spgName,spg.code 
			FROM site_plate_content AS spc
			LEFT JOIN site_plate AS sp ON sp.spid = spc.spid
			LEFT JOIN site_plate_group AS spg ON spg.spgid = sp.spgid
			WHERE spc.status = 1 AND sp.status = 1 AND spg.status = 1 AND ( {$timeCondition} ) AND spg.sid = " . getLang() . " {$where}
			ORDER BY sp.sort,spc.row_position,spc.sort,spc.add_time DESC";
		$list = $this->getCacheData( C("SitePlateGroup") . "{$condition['spgCode']}_" . getLang(), $sql );
		if( empty($list) ) return;
		//拼接数据
		foreach( $list as $key => $val ){
			if( $val['row_position'] <= $val['row'] ){
				$result[$val['spgCode']][$val['spSort']][$val['row_position']]['data'][$val['spcSort']] = $val;
				$result[$val['spgCode']][$val['spSort']][$val['row_position']]['conf'] = array( 'spName'=>$val['spName'], 'spClass'=>$val['spClass'] );
			}
		}
		//print_r($result);
		return array($result);
	}

}

?>
