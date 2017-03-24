<?php
/**
* 基础邮件类
* @package BaseMail
* @version $Id$
*/

class BaseMail {

	//发送类型
	public  $type = '';

	//邮件配置
	static private $config;

	static private $_instance = '';
	static private $_mail = '';

	/**
	+----------------------------------------------------------
	* 单例方法 【访问实例的公共静态方法，返回唯一实例】
	+----------------------------------------------------------
	* @access static
	* @param  $type      邮件类型
	+----------------------------------------------------------
	*/
	static public function getInstance( $type ) {
		$name = "Mail{$type}";
		if( !empty($name) )
			require_once "sdk/{$name}.class.php";
		if( !class_exists($name) )
			return "sdk/{$name}.class.php文件不存在！";
		if ( !(self::$_instance[$name] instanceof $name) )
			self::$_instance[$name] = new $name();
		return self::$_instance[$name];
	}

	/**
	+----------------------------------------------------------
	* 获取邮件对象
	+----------------------------------------------------------
	* @access static
	* @param  $type      邮件类型
	+----------------------------------------------------------
	*/
	static public function getMailObject( $type ) {
		$type = $type ? $type : 'mail';
		if( empty(self::$_mail[$type]) ) {
			import("ORG.Vendor.PHPMailer.PHPMailerAutoload",LIB_PATH,'.php');
			self::$_mail[$type] = new PHPMailer();
		}
		return self::$_mail[$type];
	}

	/**
	+----------------------------------------------------------
	* 构造函数 【防止外部代码使用new操作符创建对象】
	+----------------------------------------------------------
	*/
	protected function __construct() {
		//设置SDK类型
		$class = get_class($this);
		$this->type = strtoupper(substr($class, 4, strlen($class)));
		//实例化对象
		self::getMailObject($this->type);
		//设置邮箱配置
		$this->mailConfig();
	}

	/**
	+----------------------------------------------------------
	* 克隆函数 【防止对象被克隆】
	+----------------------------------------------------------
	*/
	protected function __clone() {}
	
	/**
	+----------------------------------------------------------
	* 初始化配置
	+----------------------------------------------------------
	*/
	private function config() {
		if( empty(self::$config) ) {
			require_once "config.php";
			self::$config = $config;
		}
		return self::$config;
	}

	/**
	+----------------------------------------------------------
	* 设置通用邮箱配置
	+----------------------------------------------------------
	*/
	private function mailConfig() {
		$config = $this->config();
		$typeConfig = $config["MAIL_SDK_{$this->type}"];
		$mail = self::getMailObject($this->type);
		//Enable SMTP debugging
		// 0 = off (for production use)
		// 1 = client messages
		// 2 = client and server messages
		$mail->SMTPDebug = $config['MAIL_DEBUG'];
		//Set the hostname of the mail server
		$mail->Host = $typeConfig['host'];
		//Set the SMTP port number - likely to be 25, 465 or 587
		$mail->Port = $typeConfig['post'];
		//Ask for HTML-friendly debug output
		$mail->Debugoutput = 'html';
		//The character set of the message
		$mail->CharSet="utf-8";
		//The message encoding ["8bit", "7bit", "binary", "base64", "quoted-printable"]
		$mail->Encoding = "base64";
	}

	/**
	+----------------------------------------------------------
	* Email发送【入口】
	+----------------------------------------------------------
	* @access  public
	* @param   string      $params['userId']         接收人姓名
	* @param   string      $params['email']          接收人邮件地址
	* @param   string      $params['fromName']       发件人姓名
	* @param   string      $params['fromEmail']      发件人邮件地址
	* @param   string      $params['password']       发件人邮件密码
	* @param   string      $params['title']          邮件标题
	* @param   string      $params['content']        邮件内容
	* @param   bool        $params['isReceipt']      是否要求回执：true为要， false为不要
	+----------------------------------------------------------
	*/
	public function sendMail( $params ) {
		if( empty($params['fromEmail']) || empty($params['email']) ) return;
		$result = $this->sendMailMailer( $params );
		return $result;
	}

	/**
	+----------------------------------------------------------
	* Email发送【PHPMailer】
	+----------------------------------------------------------
	*/
	private function sendMailMailer( $params ) {
		//Create a new PHPMailer instance
		$mail = self::getMailObject($this->type);
		//Tell PHPMailer to use SMTP
		$mail->isSMTP();
		//Whether to use SMTP authentication
		$mail->SMTPAuth = true;
		//Username to use for SMTP authentication
		$mail->Username = $params['fromEmail'];
		//Password to use for SMTP authentication
		$mail->Password = $params['password'];
		//Set who the message is to be sent from
		$mail->setFrom($params['fromEmail'], $params['fromName']);
		//Set an alternative reply-to address
		$mail->addReplyTo($params['fromEmail'], $params['fromName']);
		//Clear all To recipients.
		$mail->clearAddresses();
		//Set who the message is to be sent to
		$mail->addAddress($params['email'], $params['userId']);
		//Set the subject line
		$mail->Subject = $params['title'];
		//Read an HTML message body from an external file, convert referenced images to embedded,
		//convert HTML into a basic plain-text alternative body
		$mail->msgHTML($params['content']);
		//Replace the plain text body with one created manually
		$mail->AltBody = 'This is a plain-text message body';
		//Attach an image file
		//$mail->addAttachment('images/phpmailer_mini.gif');
		$result['status'] = $mail->Send();
		$result['message'] = $result['status'] === false ? $mail->ErrorInfo : '发送成功';
		return $result;
	}

}
?>
