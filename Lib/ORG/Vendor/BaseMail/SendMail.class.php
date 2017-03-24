<?php
/**
* 业务 - 发送邮件类
* @package SendMail
* @version $Id$
* @example:
*   $params = array( 'userId'=>'altila', 'email'=>'1248759715@qq.com', 'title'=>'PHPMailer SMTP test 我们', 'content'=>'sdfdsf 你们' );
*   import("ORG.Vendor.BaseMail.SendMail",LIB_PATH);
*   SendMail::$sid = getLang(3);
*   SendMail::send($params,1);
*   SendMail::sendMailDelay();
*/

class SendMail {

	//邮箱库
	static private $mailDB = 'DB_SYSTEM_CON';
	//发件邮箱表
	static private $fromMailTable = 'system_mail_passage';
	//发件信息表
	static private $messageMailTable = 'system_mail_message';
	//日志库
	static private $logDB = 'DB_LOG_CON';
	//发件日志表
	static private $logMailTable = 'log_mail_message';

	//站点ID
	static public $sid;

	//发件人名
	static public $fromName;

	//轮循值的键名
	static public $keyName = 'mailPassageKey';

	/**
	+----------------------------------------------------------
	* Email发送【入口】
	+----------------------------------------------------------
	* @access  static
	* @param   string      $params['userId']         接收人姓名
	* @param   string      $params['email']          接收人邮件地址
	* @param   string      $params['title']          邮件标题
	* @param   string      $params['content']        邮件内容
	* @param   bool        $params['isReceipt']      是否要求回执：true为要， false为不要
	* @param   array       $type                     类型：1为即时，2为延时
	+----------------------------------------------------------
	*/
	static public function send( $params, $type = 1 ) {
		if( empty(self::$sid) || empty($params['email']) ) return;
		if( $type == 2 )
			self::setMessage( $params );
		else
			self::sendMailImmediate( $params );
	}

	/**
	+----------------------------------------------------------
	* Email发送【即时】
	+----------------------------------------------------------
	*/
	private function sendMailImmediate( $params ) {
		$fromEmail = self::getFromMail();
		if( empty($fromEmail) ) return;
		//$fromEmail['type'] = '126';
		$params['fromName'] = self::getFromName();
		//$params['fromEmail'] = "altila1@126.com";
		$params['fromEmail'] = "{$fromEmail['name']}@{$fromEmail['type']}.com";
		//$params['password'] = 'altila123456';
		$params['password'] = $fromEmail['password'];
		//发送邮件
		import("ORG.Vendor.BaseMail.BaseMail",LIB_PATH);
		$BaseMail = BaseMail::getInstance($fromEmail['type']);
		$result = $BaseMail->sendMail($params);
		//self::setLog( $params );
		return $result;
	}

	/**
	+----------------------------------------------------------
	* Email发送【延时】
	+----------------------------------------------------------
	* @access  static
	* @param   string      $params['date']           当前时间[date("Y-m-d H:i:s")]
	* @param   string      $params['usleep']         休眠时间[1秒为1000000微妙]
	* @param   bool        $params['isReceipt']      是否要求回执：true为要， false为不要
	+----------------------------------------------------------
	*/
	static public function sendMailDelay( $params ) {
		//设置脚本最大执行时间
		set_time_limit(0);
		$date = $params['date'] ? $params['date'] : date("Y-m-d H:i:s");
		$usleep = $params['usleep'] ? $params['usleep'] : 10000;
		$messageModel = M( self::$messageMailTable, '', C(self::$mailDB) );
		$map['create_time'] = array( 'elt', $date);
		$map['status'] = array( 'in', '1,4' );
		$result = $messageModel->where($map)->select();
		if( count($result) < 1 ) return;
		foreach( $result as $key=>$val ) {
			$val['userId'] = $val['user_id'];
			$_result = self::sendMailImmediate($val);
			if( $_result['status'] === true ) $tmap[] = $val['mmid'];
			else $fmap[] = $val['mmid'];
			usleep($usleep);
		}
		if( count($tmap) > 0 ) $messageModel->save( array('status'=>3, 'mmid'=>array('in',$tmap), 'update_time'=>date("Y-m-d H:i:s")) );
		if( count($fmap) > 0 ) $messageModel->save( array('status'=>4, 'mmid'=>array('in',$fmap), 'update_time'=>date("Y-m-d H:i:s")) );
	}

	/**
	+----------------------------------------------------------
	* 插入邮件信息
	+----------------------------------------------------------
	*/
	private function setMessage( $params ) {
		if( empty(self::$sid) ) return;
		$messageModel = M( self::$messageMailTable, '', C(self::$mailDB) );
		$params['sid'] = self::$sid;
		$params['user_id'] = $params['userId'];
		$params['create_time'] = $params['update_time'] = date("Y-m-d H:i:s");
		if( false === $messageModel->create($params) ) return;
		$messageModel->add();
	}

	/**
	+----------------------------------------------------------
	* 获取发件邮箱信息
	+----------------------------------------------------------
	*/
	private function getFromMail() {
		$mailList = self::getFromMailList();
		$length = count($mailList);
		if( empty($length) ) return;
		//轮循值
		$keyValue = S( self::$keyName );
		$keyValue = $keyValue ? $keyValue : 0;
		S( self::$keyName, ++$keyValue, array( 'type'=>'File', 'expire'=>'60' ) );
		return $mailList[$keyValue%$length];
	}

	/**
	+----------------------------------------------------------
	* 获取发件邮箱信息列表
	+----------------------------------------------------------
	*/
	private function getFromMailList() {
		if( empty(self::$sid) ) return;
		$passageModel = M( self::$fromMailTable, '', C(self::$mailDB) );
		$condition['status'] = 1;
		$condition['sid'] = self::$sid;
		$result = $passageModel->where($condition)->order("sort")->select();
		//print_r($result);
		return $result;
	}

	/**
	+----------------------------------------------------------
	* 获取发件人名
	+----------------------------------------------------------
	*/
	private function getFromName() {
		$domainArr = explode('.',$_SERVER['HTTP_HOST']);
		$result = self::$fromName ? self::$fromName : $domainArr[1];
		return $result;
	}

	/**
	+----------------------------------------------------------
	* 记录Email发送日志
	+----------------------------------------------------------
	*/
	private function setLog( $params ) {
		$configDB = C(self::$logDB);
		$logModel = M( "{$configDB['DB_NAME']}.".self::$logMailTable, '', $configDB );
		print_r($logModel);
		if( false === $logModel->create() ) return;
		$params['sid'] = self::$sid;
		$params['mmid'] = $params['mmid'] ? $params['mmid'] : 0;
		$params['from_email'] = $params['fromEmail'];
		$params['create_time'] = date("Y-m-d H:i:s");
		$logModel->add($params);
	}





}
?>
