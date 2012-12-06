<?php
/**
+----------------------------------------------------------------------
| TOPThink
+----------------------------------------------------------------------
| Copyright (c) 2009 http://thinkphp.cn All rights reserved.
+----------------------------------------------------------------------
| Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
+----------------------------------------------------------------------
| Author: altila <281012472@qq.com>
+----------------------------------------------------------------------
| Create: 2012/11/17
+----------------------------------------------------------------------
$Id$  Elser 2011-3-8 17:51:28
*/

class InterfaceBase{

	private $_exec_time = 0;

	/**
	+----------------------------------------------------------
	* curl调用接口 - Get模式
	+----------------------------------------------------------
	* @access public
	+----------------------------------------------------------
	* @params string  $url     请求的url
	* @params array   $params  参数条件
	* @params int     $type    curl请求类型：0为GET;1为POST
	+----------------------------------------------------------
	* @return object
	+----------------------------------------------------------
	*/
	public function __construct( $url, $params, $type ){
		$this->url = $url;
		$this->params = $params;
		$this->type = ( in_array($type,array(0,1)) ) ? $type : 0;
		if( $type == 0 ){
			//拼接url
			foreach( $this->params as $key=>$value )
				if( !empty($key) && !empty($value) ) $paramStr .= "{$key}=".urlencode($v)."&";
			$this->url .= "?{$paramStr}";
		}
	}

	/**
	+----------------------------------------------------------
	* curl调用接
	+----------------------------------------------------------
	* @access public
	+----------------------------------------------------------
	* @return string
	+----------------------------------------------------------
	*/
	public function curlFunc(){
		if( empty($this->url) ) return;
		//cURL传输
		$ch = curl_init();//print_r($this->url);
		//允许执行的最长秒数
		curl_setopt( $ch, CURLOPT_TIMEOUT,3 );
		//curl请求地址
		curl_setopt( $ch, CURLOPT_URL, $this->url );
		//获取的信息以文件流的形式返回
		curl_setopt( $ch, CURLOPT_RETURNTRANSFER, 1 );
		//返回原生的（Raw）输出
		curl_setopt( $ch, CURLOPT_BINARYTRANSFER, true ) ;
		//curl请求类型：0为GET;1为POST
		curl_setopt( $ch, CURLOPT_POST, $this->type );
		//POST情况下,传递的参数条件
		if( $type == 1 ) curl_setopt( $ch, CURLOPT_POSTFIELDS, http_build_query($this->params) );
		$info = curl_getinfo($ch);
		$start = $this->_mkMictime();
		$rs = curl_exec ($ch);
		$end = $this->_mkMictime();
		//统计获取时间
		$this->_exec_time = $this->_calcMictime($start, $end);
		//关闭
		curl_close ($ch);
		//返回
		return $rs;
	}

	/**
	+----------------------------------------------------------
	* 返回请求接口的执行耗时毫妙值
	+----------------------------------------------------------
	* @access public
	+----------------------------------------------------------
	* @return int
	+----------------------------------------------------------
	*/
	public function getExecTime(){
		return $this->_exec_time;
	}

	/**
	+----------------------------------------------------------
	* 返回时间值，整数位为秒值，小数位为微妙值
	+----------------------------------------------------------
	* @access private
	+----------------------------------------------------------
	* @return float
	+----------------------------------------------------------
	*/
	private function _mkMictime(){
		list( $usec, $sec ) = explode(' ' , microtime());
		return (float)(string)$sec + (float)(string)$usec;
	}

	/**
	+----------------------------------------------------------
	* 计算两微妙值间的毫秒值
	+----------------------------------------------------------
	* @access private
	+----------------------------------------------------------
	* @param  float  $start
	* @param  float  $end
	+----------------------------------------------------------
	* @return int
	+----------------------------------------------------------
	*/
	private function _calcMictime( $start, $end ){
		$sep = 1000;
		$tmp = (float)(string)$end - (float)(string)$start;
		return (int)( (float)(string)$tmp * (float)(string)$sep );
	}

}
?>
