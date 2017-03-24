<?php
/**
* 单例工厂类入口
* @package SingletonFactory
* @version $Id$
*/

class SingletonFactory {

	static private $_instance = NULL;

	/**
	+----------------------------------------------------------
	* 单例方法 【访问实例的公共静态方法，返回唯一实例】
	+----------------------------------------------------------
	* @access static
	* @param  $name      文件名
	+----------------------------------------------------------
	* @return string
	+----------------------------------------------------------
	* @example  SingletonFactory::getInstance("BaseInterface");
	+----------------------------------------------------------
	* 原单例模式写法：
	static public function getInstance( $action ) {
		if ( !(self::$_instance instanceof self) )
			self::$_instance = new self();
		return self::$_instance;
	}
	+----------------------------------------------------------
	*/
	static public function getInstance( $name ) {
		if( !empty($name) )
			require_once "{$name}.class.php";
		if( !class_exists($name) )
			return "{$name}.class.php文件不存在！";
		if ( !(self::$_instance[$name] instanceof $name) )
			self::$_instance[$name] = new $name();
		return self::$_instance[$name];
	}

	/**
	+----------------------------------------------------------
	* 构造函数 【防止外部代码使用new操作符创建对象】
	+----------------------------------------------------------
	* 原单例模式写法：
	* private function __construct(){}
	+----------------------------------------------------------
	*/
	protected function __construct(){}

	/**
	+----------------------------------------------------------
	* 克隆函数 【防止对象被克隆】
	+----------------------------------------------------------
	* 原单例模式写法：
	* private function __clone() {}
	+----------------------------------------------------------
	*/
	protected function __clone() {}

}
?>
