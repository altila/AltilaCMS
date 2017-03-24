<?php
/**
* 基础接口类
* @package BaseInterface
* @version $Id$
*/

class BaseInterface extends SingletonFactory {

	//访问地址
	public  $url;
	//CUTL类型：0为GET,1为POST
	public  $curlType = 0;
	//允许执行的最长秒数
	public  $timeOut = 6;
	//COOKIE
	public  $cookie;
	//头信息
	public  $httpHeader;
	//访问该页的用户使用的浏览器（代理）信息
	public  $isUserAgent;
	//执行时间
	private $_exec_time = 0;

	/**
	+----------------------------------------------------------
	* 提交【GET\POST】
	+----------------------------------------------------------
	* @access public
	* @param  $params    参数
	+----------------------------------------------------------
	* @return array
	+----------------------------------------------------------
	*/
	public function curlFunc( $params ) {
		$this->curlType = $this->curlType ? 1 : 0;
		//cURL传输
		$ch = curl_init();//print_r("{$this->url}\n\r");
		curl_setopt ($ch, CURLOPT_TIMEOUT, $this->timeOut);//允许执行的最长秒数
		curl_setopt ($ch, CURLOPT_URL, $this->url);//访问地址
		curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);//获取的信息以文件流的形式返回
		curl_setopt ($ch, CURLOPT_POST, $this->curlType);//请求类型,0:GET,1:POST
		if( $this->curlType === 0 ) {
			curl_setopt ($ch, CURLOPT_BINARYTRANSFER, true) ;//返回原生的（Raw）输出
		} else {
			curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);//对认证证书来源的检查，0表示阻止对证书的合法性的检查
			curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($params));//添加变量
		}
		//扩展参数
		if( !empty($this->cookie) ) curl_setopt($ch, CURLOPT_COOKIE, $this->cookie);
		if( !empty($this->httpHeader) ) curl_setopt($ch, CURLOPT_HTTPHEADER, $this->httpHeader);
		if( !empty($this->isUserAgent) ) curl_setopt($ch, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']);
		//统计获取时间
		$info = curl_getinfo($ch);
		$start = $this->_mkMictime();
		$rs = curl_exec ($ch);
		$end = $this->_mkMictime();
		$this->_exec_time = $this->_calcMictime($start, $end);
		//关闭
		curl_close ($ch);
		//返回
		$result = json_decode( $this->removeBom($rs), true );
		return $result;
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
	* @return float $mictime ,
	+----------------------------------------------------------
	*/
	private function _mkMictime(){
		list( $usec , $sec ) = explode(' ' , microtime());
		return (float)(string)$sec + (float)(string)$usec;
	}

	/**
	+----------------------------------------------------------
	* 计算两微妙值间的毫秒值
	+----------------------------------------------------------
	* @access private
	* @param  $start
	* @param  $end
	+----------------------------------------------------------
	* @return int
	+----------------------------------------------------------
	*/
	private function _calcMictime( $start , $end ){
		$sep = 1000;
		$tmp = (float)(string)$end - (float)(string)$start;
		return (int)( (float)(string)$tmp * (float)(string)$sep );
	}

	/**
	+----------------------------------------------------------
	* 去除UTR-8的BOM
	+----------------------------------------------------------
	* @access private
	* @param  $result
	+----------------------------------------------------------
	* @return string
	+----------------------------------------------------------
	*/
	private function removeBom($result){
		if ( ord( $result[0] ) == 239 && ord( $result[1] ) == 187 && ord( $result[2] ) == 191 )
			return substr( $result, 3 );
		return $result;
	}

}
?>
