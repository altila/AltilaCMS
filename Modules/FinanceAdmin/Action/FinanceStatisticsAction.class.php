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

class FinanceStatisticsAction extends ABaseAction {

	/**
	+----------------------------------------------------------
	* 字段过滤
	+----------------------------------------------------------
	*/
	public function _filter( &$map ) {
		$dataSuffix = "-01-01 00:00:00";
		if( !empty($_REQUEST['start_time']) || !empty($_REQUEST['end_time']) ) {
			$map['transaction_time'][] = !empty($_REQUEST['start_time']) ? array( 'egt', substr($_REQUEST['start_time'],0,4).$dataSuffix ) : array( 'egt', "2000{$dataSuffix}" );
			$map['transaction_time'][] = !empty($_REQUEST['end_time']) ? array( 'lt', substr($_REQUEST['end_time'],0,4).$dataSuffix ) : array( 'lt', (date("Y",time())+1).$dataSuffix );
		}
	}

	/**
	+----------------------------------------------------------
	* 首页前置
	+----------------------------------------------------------
	*/
	public function _before_index() {
		$this->statistics();
		$model = D( $this->getActionName() );
		$income = $model->sum('income');
		$expenses = $model->sum('expenses');
		$this->investment = $model->sum('investment_stock');
		$this->debtSum = $model->sum('debt');
		$this->balanceSum = $income - $expenses;
	}
	
	/**
	+----------------------------------------------------------
	* 展示统计
	+----------------------------------------------------------
	*/
	public function showStatistics() {
		$this->statistics();
		$model = D( $this->getActionName() );
		$map['uid'] = $this->userInfo['Uid'];
		$map['transaction_time'] = array( 'egt', (date("Y")-5)."-01-01 00:00:00" );
		$list = $model->where($map)->order("transaction_time ASC")->select();
		$earliestYear = date("Y",strtotime($list[0]['transaction_time']));
		$latestYear = date("Y",time());
		$difference = $latestYear - $earliestYear;
		$data = array( 'balance'=>array(), 'expenses'=>array(), 'income'=>array(), 'debt'=>array() );
		for( $i=1; $i<date("m",strtotime($list[0]['transaction_time'])); $i++ ) { 
			array_push($data['balance'],0);array_push($data['expenses'],0);array_push($data['income'],0);array_push($data['debt'],0);
		}
		foreach( $list as $key=>$value ) {
			array_push($data['balance'],$value['income'] - $value['expenses']);
			array_push($data['expenses'],(int)$value['expenses']);
			array_push($data['income'],(int)$value['income']);
			array_push($data['debt'],(int)$value['debt']);
		}
		for( $i=0; $i<date("m",strtotime($list[count($list)-1]['transaction_time'])); $i++ ) { 
			array_push($data['balance'],0);array_push($data['expenses'],0);array_push($data['income'],0);array_push($data['debt'],0);
		}
		$data['balance'] = array_chunk($data['balance'],12);$data['expenses'] = array_chunk($data['expenses'],12);$data['income'] = array_chunk($data['income'],12);$data['debt'] = array_chunk($data['debt'],12);
		for( $i=0; $i<=$difference; $i++ ) {
			$result['balance'][] = array( 'name'=>($earliestYear+$i)."年", 'data'=>$data['balance'][$i] );
			$result['expenses'][] = array( 'name'=>($earliestYear+$i)."年", 'data'=>$data['expenses'][$i] );
			$result['income'][] = array( 'name'=>($earliestYear+$i)."年", 'data'=>$data['income'][$i] );
			$result['debt'][] = array( 'name'=>($earliestYear+$i)."年", 'data'=>$data['debt'][$i] );
		}
		//print_r($result['balance']);
		$this->assign ( "balance", json_encode($result['balance']) );
		$this->assign ( "expenses", json_encode($result['expenses']) );
		$this->assign ( "income", json_encode($result['income']) );
		$this->assign ( "debt", json_encode($result['debt']) );
		$this->display();
	}

	/**
	+----------------------------------------------------------
	* 统计
	* 【未包含股市数据】
	+----------------------------------------------------------
	*/
	public function statistics() {
		set_time_limit(0);
		$model = D( $this->getActionName() );
		$transactionModel = D( 'FinanceTransaction' );
		$accountModel = D( 'FinanceAccount' );
		$stockModel = D( 'FinanceProductsStock' );
		$date = date("Y-m-d H:i:s");
		$map['uid'] = $this->userInfo['Uid'];
		$earliestDate = $transactionModel->where($map)->order("transaction_time ASC, create_time ASC")->getField('transaction_time');
		$latestDate = $transactionModel->where($map)->order("transaction_time DESC, create_time DESC")->getField('transaction_time');
		$difference = ( date("Y",strtotime($latestDate)) - date("Y",strtotime($earliestDate)) ) * 12 + date("m",strtotime($latestDate)) - date("m",strtotime($earliestDate));
		$dataSuffix = "-1 00:00:00";
		for( $i=0; $i<=$difference; $i++ ){
			$earliestDate1 = date("Y-m",strtotime("$earliestDate   +$i   month")).$dataSuffix;
			$earliestDate2 = date("Y-m",strtotime("$earliestDate   +".($i+1)."   month")).$dataSuffix;
			$data = array( 'uid'=>$map['uid'], 'transaction_time'=>$earliestDate1 );
			$result = $model->where($data)->find();
			$map['transaction_time'] = array( array('egt',$earliestDate1), array('lt',$earliestDate2) );
			if( !empty($result) ) {
				$map['update_time'] = array( 'egt', $result['update_time'] );
				$list = $transactionModel->where($map)->select();
				if( empty($list) ) continue;
			} else {
				$data['create_time'] = $date;
			}
			unset($map['update_time']);
			$list = $transactionModel->where($map)->order("transaction_time ASC, create_time ASC")->select();
			//print_r($transactionModel->getLastsql());
			foreach( $list as $key=>$value ) {
				if( in_array($value['type'],array('8','10')) ) continue;
				$facid = $accountModel->where(" faid = {$value['faid']} ")->getField('facid');
				if( in_array($value['type'],array('1')) ) $data['expenses'] += $value['money'];
				if( in_array($value['type'],array('2','7')) ) $data['income'] += $value['money'];
				if( in_array($value['type'],array('12')) && !in_array($facid,array('8','9')) ) $data['income'] += $value['money'];
				if( in_array($value['type'],array('3','4','5','6')) && in_array($facid,array('20')) ) $data['debt'] += $value['money'];
				if( in_array($value['type'],array('9')) ) $data['expenses'] -= $value['relation_money'];
				if( in_array($value['type'],array('11')) && in_array($facid,array('8')) ) {
					$diff = round($value['relation_money'] + $value['money'],2);
					if( $diff < 0 ) $data['expenses'] -= $diff;
					else $data['income'] += $diff;
				}
			}
			$data['update_time'] = $date;
			$data['expenses'] *= -1;
			//统计证券
			if( empty($result) || date("Y-m",strtotime($result['transaction_time'])) ==  date("Y-m") ) {
				$field = "fprid,SUM(money) AS tp_sum";
				$where = " uid = {$map['uid']} AND transaction_time < '{$earliestDate2}' ";
				$buySum = $transactionModel->field("fprid,SUM(money) AS tp_sum")->where( " {$where} AND type = 13 " )->group('fprid')->select();
				foreach( $buySum as $key=>$val ) {
					$sellSum = $transactionModel->where( " {$where} AND fprid = {$val['fprid']} AND type IN (14,16) " )->sum('money');
					$sum = ( $val['tp_sum'] + $sellSum ) * (-1);
					$buyAmountSum = $transactionModel->where( " {$where} AND fprid = {$val['fprid']} AND type IN (13,15) " )->sum('relation_money');
					$sellAmountSum = $transactionModel->where( " {$where} AND fprid = {$val['fprid']} AND type = 14 " )->sum('relation_money');
					$amountSum = $buyAmountSum - $sellAmountSum;
					$stockPrice = $stockModel->where("fprsid = {$val['fprid']}")->getField('price');
					$gainslosses += $stockPrice * $amountSum - $sum;
				}
				$_data = array( 'uid'=>$map['uid'], 'transaction_time'=>date("Y-m",strtotime("$earliestDate   +".($i-1)."   month")).$dataSuffix );
				$_result = $model->where($_data)->find();
				$data['investment_stock'] = $gainslosses - $_result['investment_stock'];
			}
			if( empty($result) ) {
				$model->add($data);
			} else {
				$data['id'] = $result['id'];
				$model->save($data);
			}
			if( $_REQUEST['type'] == 1 ) $this->ajaxReturn( '', "更新成功!", 1 );
		}
	}


}
?>
