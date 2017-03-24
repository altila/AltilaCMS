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
class AdServiceModel extends SBaseModel {

	protected $trueTableName = 'base_ad_info';

	/**
	+----------------------------------------------------------
	* 获取广告
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件
	*          @param   int    sid           站点编码
	*          @param   int    appdcode      设备编码
	*          @param   str    apCode        广告位编码
	*          @param   str    isOne         是否一条数据
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	* @example http://www.altila.com/BaseService/AdService/getAdPosList?apCode=Base_Index_index&appdcode=1&sid=1
	+----------------------------------------------------------
	*/
	public function getAdPosList( $condition = array(), $field = '', $order = '', $limit = '' ) {
		if( empty($condition['apCode']) || empty($condition['sid']) )
			return array( 'data'=>false, 'info'=>"获取失败", 'status'=>0 );
		$result = $this->getAdPosListByCode( $condition, $field, $order, $limit );
		//print_r($result);
		return array( 'data'=>$result, 'info'=>"获取成功", 'status'=>1 );
	}

	/**
	+----------------------------------------------------------
	* 根据广告位code获取广告列表信息
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件
	*          @param   int    sid           站点编码
	*          @param   int    appdcode      设备编码
	*          @param   str    apCode        广告位编码
	*          @param   str    isOne         是否一条数据
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	*/
	public function getAdPosListByCode( $condition = array(), $field = '', $order = '', $limit = '' ) {
		if( empty($condition['apCode']) || empty($condition['sid']) ) return;
		//查询数据
		$date = date('Y-m-d H:i');
		$timeCondition = " ( ai.start_time < '{$date}' AND  ai.end_time > '{$date}' ) OR ( ai.start_time = '1970-01-01 08:00:00' AND ai.end_time > '{$date}' ) OR ( ai.start_time < '{$date}' AND ai.end_time = '1970-01-01 08:00:00' ) OR ( ai.start_time = '1970-01-01 08:00:00' AND ai.end_time = '1970-01-01 08:00:00' ) ";
		$appdcodeCondition = !empty($condition['appdcode']) ? " AND appdcode&{$condition['appdcode']} = {$condition['appdcode']} " : "";
		$sql = "SELECT ai.adid,ai.name,ai.type,ai.link,ai.content,ai.sort,ai.style AS aiStyle
			,ap.apid,ap.width,ap.height,ap.sum,ap.row,ap.code AS apCode,ap.style AS apStyle
			,af.code AS afCode
			FROM base_ad_info AS ai
			LEFT JOIN base_ad_position AS ap ON ap.apid = ai.apid
			LEFT JOIN base_ad_function AS af ON af.afid = ap.afid
			WHERE ai.status = 1 AND ap.status = 1 AND ( {$timeCondition} ) AND ap.sid = {$condition['sid']}
			AND ( ap.position = 0 OR ap.code LIKE '{$condition['apCode']}%' ) {$appdcodeCondition}
			ORDER BY ap.apid,ai.sort,ai.create_time DESC ";
		$list = $this->getCacheData( '', $sql );
		if( empty($list) )
			return array( 'data'=>false, 'info'=>"获取失败", 'status'=>0 );
		//拼接数据
		foreach( $list as $key => $val ){
			$apCode = $val['apCode'];
			$result[$apCode]['apid'] = $val['apid'];
			$result[$apCode]['apCode'] = $val['apCode'];
			$result[$apCode]['afCode'] = $val['afCode'];
			$result[$apCode]['apStyle'] = $val['apStyle'];
			$result[$apCode]['sum'] = $val['sum'];
			$result[$apCode]['row'] = $val['row'];
			if( empty($result[$apCode]['schedule']) ) 
				$result[$apCode]['schedule'] = $this->adScheduleList($val['apid']);
			unset($val['apid'],$val['apCode'],$val['afCode'],$val['apStyle'],$val['sum'],$val['row']);
			$result[$apCode]['list'][] = $val;
		}
		if( !empty($condition['apCode']) ) $result = $this->adScheduleHandle( $result );
		$result = $condition['isOne'] != 1 ? $result : $result[$condition['apCode']];
		//print_r($result);
		return $result;
	}

	/**
	+----------------------------------------------------------
	* 根据广告排期组合广告数据
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $adList      广告数据
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	* @example adScheduleHandle( $adList )
	+----------------------------------------------------------
	*/
	public function adScheduleHandle( $adList ) {
		if( empty($adList) ) return;
		$date = date('Y-m-d H:i');
		foreach( $adList as $k=>$list ){
			foreach( $list['list'] as $key=>$val )
				$result[$val['adid']] = $val;
			foreach( $list['schedule'] as $_key=>$v ){
				if( $date >= $v['start_time'] && $date <= $v['end_time'] )
					if( $v['sort'] <= $list['sum'] && !empty($result[$v['adid']]) )
						$adList[$k]['list'][$v['sort']-1] = $result[$v['adid']];
			}
			$adList[$k]['schedule'] = '';
			foreach( $list['list'] as $_k=>$_v )
				if( $_k >= $list['sum'] ) unset($adList[$k]['list'][$_k]);
		}
		return $adList;
	}

	/**
	+----------------------------------------------------------
	* 根据广告位id获取相应广告排期信息
	+----------------------------------------------------------
	* @access  public
	* @param   int      $apid      广告位id
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	* @example adScheduleList( $apid )
	+----------------------------------------------------------
	*/
	public function adScheduleList( $apid ) {
		if( empty($apid) ) return;
		$endTime = date('Y-m-d H:i');
		$startTime = date('Y-m-d H:i',strtotime("+1 day"));
		//查询数据
		$sql = "SELECT apid,adid,sort,start_time,end_time 
			FROM base_ad_schedule 
			WHERE status = 1 AND apid = '{$apid}' AND end_time >= '{$endTime}' AND start_time <= '{$startTime}' ";
		$result = $this->query( $sql );//print_r($sql);
		return $result;
	}

}

?>
