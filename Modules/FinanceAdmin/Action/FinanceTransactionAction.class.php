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

class FinanceTransactionAction extends ABaseAction {

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
		$model = D( $this->getActionName() );
		$facidValue = findById('FinanceAdmin/FinanceAccount',$_REQUEST['faid'],'facid');
	}

	/**
	+----------------------------------------------------------
	* 插入前置
	+----------------------------------------------------------
	*/
	public function _before_insert() {
		$model = D( $this->getActionName() );
		$this->_before_operat();
	}

	/**
	+----------------------------------------------------------
	* 更新前置
	+----------------------------------------------------------
	*/
	public function _before_update() {
		$model = D( $this->getActionName() );
		$this->_before_operat();
	}
	
	/**
	+----------------------------------------------------------
	* 更新操作
	+----------------------------------------------------------
	*/
	public function _before_operat() {
		$model = D( $this->getActionName() );
		$pk = $model->getPk();
		$map = array( 'faid'=>$_REQUEST['faid'], 'uid'=>$_REQUEST['uid'], 'transaction_time'=>array('elt',$_REQUEST['transaction_time']) );
		if( !empty($_REQUEST[$pk]) ) {
			$map[$pk] = array('neq',$_REQUEST[$pk]);
			$info = $model->find($_REQUEST[$pk]);
			$map['create_time'] = array('elt',$info['create_time']);
		}
		$facidValue = findById('FinanceAdmin/FinanceAccount',$_REQUEST['faid'],'facid');
		if( in_array($facidValue,array('8')) ) $map['fprid'] = $_REQUEST['fprid'];
		$last = $model->where($map)->order(" transaction_time DESC,create_time DESC ")->find();
		//价格
		if( $_REQUEST['type'] == 7 ) 
			$_POST['money'] = $_REQUEST['balance'] - $last['balance'];
		elseif( in_array($_REQUEST['type'],array('1','3','4','5','6','8','9','10','11')) )
			$_POST['money'] = $_REQUEST['money'] * (-1);
		elseif( in_array($_REQUEST['type'],array('13')) )
			$_POST['money'] = (-1) * ( $_REQUEST['relation_money'] * $_REQUEST['description']['price'] + $_REQUEST['description']['brokerage'] );
		elseif( in_array($_REQUEST['type'],array('14','16')) )
			$_POST['money'] = $_REQUEST['relation_money'] * $_REQUEST['description']['price'] - $_REQUEST['description']['brokerage'];
		//余额
		if( in_array($_REQUEST['type'],array('12')) )
			$_POST['balance'] = $last['balance'];
		elseif( in_array($_REQUEST['type'],array('9')) && in_array($facidValue,array('6')) ) 
			$_POST['balance'] = $last['balance'] + $_POST['money'] - $_REQUEST['relation_money'];
		elseif( !in_array($_REQUEST['type'],array('7')) ) 
			$_POST['balance'] = $last['balance'] + $_POST['money'];
		//描述
		if( !empty($_POST['description']) && in_array($_REQUEST['type'],array('13','14','15','16')) ) $_POST['description'] = json_encode($_POST['description']);
		//差额
		$_REQUEST['difference'] = $_POST['money'] - ( !empty($_REQUEST[$pk]) ? $info['money'] : 0 );
		//print_r($_POST);
	}

	/**
	+----------------------------------------------------------
	* 插入后置
	+----------------------------------------------------------
	*/
	public function _after_insert() {
		$model = D( $this->getActionName() );
		$pk = $model->getPk();
		$date = date("Y-m-d H:i:s");
		//转账
		$map = $_REQUEST;
		if( in_array($_REQUEST['type'],array('3','4','5','6','8','9','10','11','12')) ) {
			$_map = array( 'faid'=>$_REQUEST['fcid'], 'uid'=>$_REQUEST['uid'], 'transaction_time'=>array('elt',$_REQUEST['transaction_time']) );
			$facidValue = findById('FinanceAdmin/FinanceAccount',$_REQUEST['fcid'],'facid');
			if( in_array($facidValue,array('8')) ) $_map['fprid'] = $_REQUEST['fprid'];
			$last = $model->where($_map)->order(" transaction_time DESC,create_time DESC ")->find();
			$map['relation_ftaid'] = $model->getLastInsID();
			$map['faid'] = $_REQUEST['fcid'];
			$map['fcid'] = $_REQUEST['faid'];
			if( in_array($_REQUEST['type'],array('11')) ) {
				$map['money'] = $_REQUEST['relation_money'];
				$map['relation_money'] = $_REQUEST['money'];
			}
			$map['balance'] = $last['balance'] + $map['money'];
			if( in_array($_REQUEST['type'],array('9')) && in_array($facidValue,array('6')) )
				$map['balance'] -= $_REQUEST['relation_money'];
			$map['create_time'] = $map['update_time'] = $date;
			$model->add($map);
			$model->save( array($pk=>$map['relation_ftaid'], 'relation_ftaid'=>$model->getLastInsID(), 'update_time'=>$date) );
		}
		$this->_after_operat();
	}

	/**
	+----------------------------------------------------------
	* 更新后置
	+----------------------------------------------------------
	*/
	public function _after_update() {
		$model = D( $this->getActionName() );
		$pk = $model->getPk();
		$date = date("Y-m-d H:i:s");
		//转账
		$map = $_REQUEST;
		if( in_array($_REQUEST['type'],array('3','4','5','6','8','9','10','11','12')) ) {
			$_map = array( 'faid'=>$_REQUEST['fcid'], 'uid'=>$_REQUEST['uid'], 'transaction_time'=>array('elt',$_REQUEST['transaction_time']), $pk=>array('neq',$_REQUEST['relation_ftaid']) );
			$info = $model->find($_REQUEST['relation_ftaid']);
			$_map['create_time'] = array('elt',$info['create_time']);
			$facidValue = findById('FinanceAdmin/FinanceAccount',$_REQUEST['fcid'],'facid');
			if( in_array($facidValue,array('8')) ) $_map['fprid'] = $_REQUEST['fprid'];
			$last = $model->where($_map)->order(" transaction_time DESC,create_time DESC ")->find();
			$map[$pk] = $_REQUEST['relation_ftaid'];
			$map['relation_ftaid'] = $_REQUEST[$pk];
			$map['faid'] = $_REQUEST['fcid'];
			$map['fcid'] = $_REQUEST['faid'];
			if( in_array($_REQUEST['type'],array('11')) ) {
				$map['money'] = $_REQUEST['relation_money'];
				$map['relation_money'] = $_REQUEST['money'];
			}
			$map['balance'] = $last['balance'] + $map['money'];
			if( in_array($_REQUEST['type'],array('9')) && in_array($facidValue,array('6')) )
				$map['balance'] -= $_REQUEST['relation_money'];
			$map['update_time'] = $date;
			$model->save($map);
		}
		$this->_after_operat();
	}

	/**
	+----------------------------------------------------------
	* 删除后置
	+----------------------------------------------------------
	*/
	public function _after_delete() {
		$this->_after_operat();
	}

	/**
	+----------------------------------------------------------
	* 后置操作 - 不支持多账户更新
	+----------------------------------------------------------
	*/
	public function _after_operat() {
		$model = D( $this->getActionName() );
		$pk = $model->getPk();
		$date = date("Y-m-d H:i:s");
		$pkValue = !empty($_REQUEST[$pk]) ? $_REQUEST[$pk] : $model->getLastInsID();
		$map = array( 'faid'=>$_REQUEST['faid'], 'uid'=>$_REQUEST['uid'], 'transaction_time'=>array('egt',$_REQUEST['transaction_time']), 'create_time'=>array('egt',$date) );
		$map[$pk] = array('neq',$pkValue);
		$info = $model->find($pkValue);
		$map['create_time'] = array('egt',$info['create_time']);
		$list = $model->where($map)->order(" transaction_time ASC ")->select();
		foreach( $list as $key=>$value ) {
			$balance = $value['balance'] + $_REQUEST['difference'];
			$model->save( array($pk=>$value[$pk], 'balance'=>$balance, 'update_time'=>$date) );
		}
		//print_r($model->getLastsql());
	}



}
?>
