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
class AdModel extends HBaseModel {

	protected $trueTableName = 'ad_info';

	/**
	+----------------------------------------------------------
	* 获取广告
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件:apCode
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	* @example <model model="Ad" fun="adPostList" condition="$condition" order="" limit="" key="i">
	+----------------------------------------------------------
	*/
	public function adPostList( $condition = array(), $field = '', $order = '', $limit = '' ) {
		if( !empty($condition['apCode']) ) $where .= " AND ap.code = '{$condition['apCode']}' ";
		//查询数据
		$date = date('Y-m-d H:i');
		$timeCondition = "( ai.start_time < '{$date}' AND  ai.end_time > '{$date}' ) OR ( ai.start_time = '1970-01-01 08:00:00' AND ai.end_time > '{$date}' ) OR ( ai.start_time < '{$date}' AND ai.end_time = '1970-01-01 08:00:00' ) OR ( ai.start_time = '1970-01-01 08:00:00' AND ai.end_time = '1970-01-01 08:00:00' )";
		$sql = "SELECT ai.adid,ai.name,ai.type,ai.link,ai.content,ai.sort,ai.style AS aiStyle
			,ap.apid,ap.width,ap.height,ap.sum,ap.row,ap.code AS apCode,ap.style AS apStyle
			,af.code AS afCode
			FROM ad_info AS ai
			LEFT JOIN ad_position AS ap ON ap.apid = ai.apid
			LEFT JOIN ad_function AS af ON af.afid = ap.afid
			WHERE ai.status = 1 AND ap.status = 1 AND ( {$timeCondition} ) AND ap.sid = " . getLang() . " {$where}
			ORDER BY ap.apid,ai.sort,ai.add_time DESC ";
		$list = $this->getCacheData( C("AdPosition") . "{$condition['apCode']}_" . getLang(), $sql );
		if( empty($list) ) return;
		//拼接数据
		foreach( $list as $key => $val ){
			$adList[$val['apCode']]['list'][] = $val;
			if( empty($adList[$val['apCode']]['schedule']) ) 
				$adList[$val['apCode']]['schedule'] = $this->adScheduleList($val['apid']);
			if( empty($adList[$val['apCode']]['conf']) ) 
				$adList[$val['apCode']]['conf'] = array( 'type'=>$val['type'],'afCode'=>$val['afCode'],'apStyle'=>$val['apStyle'],'sum'=>$val['sum'],'row'=>$val['row'] );
		}
		if( !empty($condition['apCode']) ) $adList = $this->adScheduleHandle( $adList );
		//print_r($adList);
		return $adList;
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
			foreach( $list['schedule'] as $key=>$val ){
				if( $date >= $val['start_time'] && $date <= $val['end_time'] )
					$i = $val['sort'] - $list['conf']['sum'];
					if( !empty($result[$val['adid']]) )
						$_result[$i] = $result[$val['adid']];
			}
			if( !empty($_result) ) $adList[$k]['list'] = $_result;
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
		$sql = "SELECT adid,apid,sort,start_time,end_time 
			FROM ad_schedule 
			WHERE status = 1 AND apid = '{$apid}' AND end_time >= '{$endTime}' AND start_time <= '{$startTime}' ";
		$result = $this->query( $sql );//print_r($sql);
		return $result;
	}

}

?>
