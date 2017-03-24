<?php
// +----------------------------------------------------------------------
// | ThinkPHP
// +----------------------------------------------------------------------
// | Copyright (c) 2007 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
// $Id$

class FinanceTransactionTagAction extends ABaseAction {

	/**
	+----------------------------------------------------------
	* 字段过滤
	+----------------------------------------------------------
	*/
	public function _filter( &$map ) {
		$map['uid'] = $this->userInfo['Uid'];
		//$dataSuffix = "-1 00:00:00";
		//$time = $_REQUEST['transaction_time'] ? strtotime($_REQUEST['transaction_time']) : time();
		//$map['transaction_time'] = array( array('gt',date("Y-m",$time).$dataSuffix), array('lt',date("Y",$time)."-".(date("m",$time)+1).$dataSuffix) );
		$dataSuffix = " 00:00:00";
		if( !empty($_REQUEST['start_time']) || !empty($_REQUEST['end_time']) ) {
			$map['transaction_time'][] = !empty($_REQUEST['start_time']) ? array( 'egt', substr($_REQUEST['start_time'],0,11).$dataSuffix ) : array( 'egt', "2000{$dataSuffix}" );
			$map['transaction_time'][] = !empty($_REQUEST['end_time']) ? array( 'lt', substr($_REQUEST['end_time'],0,11).$dataSuffix ) : array( 'lt', date("Y-m-d H:i:s") );
		}
	}
	
	/**
	+----------------------------------------------------------
	* 首页前置
	+----------------------------------------------------------
	*/
	public function _before_index() {
		$_REQUEST['orderField'] = 'transaction_time';
	}

	/**
	+----------------------------------------------------------
	* 列表后置
	+----------------------------------------------------------
	*/
	public function _after_list($map) {
		$model = D( $this->getActionName() );
		$TranModelName = $this->getActionName();
		$map['money'] = array('gt','0');
		$this->income = getSum( $TranModelName, $map, 'money' );
		$map['money'] = array('lt','0');
		$this->expenses = getSum( $TranModelName, $map, 'money' );
	}

	/**
	+----------------------------------------------------------
	* 展示统计
	+----------------------------------------------------------
	*/
	public function showStatistics() {
		$yearSum = 5;
		$earliestYear = date("Y")-$yearSum;
		$model = D( $this->getActionName() );
		$map = $this->_search();
		if( method_exists( $this, '_filter' ) ) $this->_filter( $map );
		if( $_REQUEST['keypk'] != 'fcid' ) $map[$_REQUEST['keypk']] = $_REQUEST[$_REQUEST['keypk']];
		$map['uid'] = $this->userInfo['Uid'];
		$map['transaction_time'] = array( 'gt', "{$earliestYear}-01-01 00:00:00" );
		$list = $model->where($map)->order("transaction_time ASC")->select();
		$difference = array_chunk(array_fill(0,12*$yearSum,0),12);
		foreach( $list as $key=>$value ){
			list($year,$month) = explode('-', $value['transaction_time'] );
			$difference[$year-$earliestYear-1][$month-1] += $value['money'];
		}
		for( $i=0; $i<$yearSum; $i++ ) {
			$result[] = array( 'name'=>($earliestYear+$i+1)."年", 'data'=>$difference[$i] );
		}
		//print_r($result);
		$this->assign ( "difference", json_encode($result) );
		$this->display("FinanceTransactionTag:showStatistics");
	}

}
?>
