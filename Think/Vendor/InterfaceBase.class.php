<?php
/*
 * Created on 2011-3-9
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */

class InterfaceBase{

	private $params=null;

	public function __construct($url){
		$this->url=$url;
	}

	/**
     +----------------------------------------------------------
     * @GET提交
     +----------------------------------------------------------
     */
	public function curl_Func($data){
		//cURL传输
		$ch = curl_init();//print_r($this->url);
        curl_setopt($ch,CURLOPT_TIMEOUT,3);//允许执行的最长秒数
		curl_setopt ($ch, CURLOPT_URL, $this->url);
		curl_setopt ($ch, CURLOPT_RETURNTRANSFER, 1);//获取的信息以文件流的形式返回
		curl_setopt ($ch , CURLOPT_BINARYTRANSFER, true) ;//返回原生的（Raw）输出
		//指定post数据
		curl_setopt ($ch, CURLOPT_POST, 0);//启用时会发送一个常规的POST请求,0:GET,1:POST
		//统计获取时间
        $info = curl_getinfo($ch);
		$start = $this->_mkMictime();
		$rs = curl_exec ($ch);
		$end = $this->_mkMictime();
		$this->_exec_time = $this->_calcMictime($start, $end);
		//关闭
		curl_close ($ch);
		//返回
		return $rs;
    }

	/**
     +----------------------------------------------------------
     * @POST提交
     +----------------------------------------------------------
     */
	public function curl_Func_Post($data){
		//cURL传输
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
		curl_setopt($ch,CURLOPT_URL,$this->url);
		curl_setopt($ch,CURLOPT_RETURNTRANSFER, 1);
		//指定post数据
		curl_setopt($ch,CURLOPT_POST, 1);
		//添加变量
		curl_setopt($ch,CURLOPT_POSTFIELDS,http_build_query($data));
		//统计获取时间
        $info = curl_getinfo($ch);
		$start = $this->_mkMictime();
		$rs = curl_exec ($ch);
		$end   = $this->_mkMictime();
		$this->_exec_time = $this->_calcMictime($start, $end);
		curl_close($ch);
		//返回
		return $rs;
	}
	
    private $_exec_time = 0;

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
     * @param $start
     * @param $end
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
     * 取得相关接口的值
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @param array $data
     +----------------------------------------------------------
 	 * @param string $paramStr
     +----------------------------------------------------------
     * @return array $returnArr
     +----------------------------------------------------------
     */

	public function InterfaceFunc($data,$paramStr){
		switch ($paramStr) {
			//关键字搜索接口
			case 'search':
				$searchArr = array('word','st','cp','pp','c','so','ord','pin','bc','cid','sx','sc','ccn','attr_code');
				break;
			//关键字提示接口
			case 'suggest':
				$searchArr = array('keyword','num');
				break;
			//提取关键字接口
			case 'getHotKeywords':
				$searchArr=array('cd','rn');
				break;
			//浏览该商品的用户还浏览接口
			case 'getUserGoods':
				$searchArr=array('goods_sn','rn');
				break;
			//用户搜索行为接口
			case 'searchStart':
				$searchArr=array('log_name','beh_id','page_url','keyword','start_time','user_id','ip','browse_name','juid');
				break;
			//用户搜索后行为接口
			case 'searchAfter':
				$searchArr=array('log_name','beh_id','after_time','goods_sn','after_code','user_id','ip','browse_name','juid');
				break;
			//用户浏览接口
			case 'view':
				$searchArr=array('log_name','goods_color_sn','view_time','user_id','ip','browse_name');
				break;
			//招行支付接口
			case 'cmbchina':
				$searchArr=array('strKey','strDate','strBranchID','strCono','strBillNo','strAmount','strMerchantPara','strMerchantUrl','strPayerID','strPayeeID','strClientIP','strGoodsType','strReserved');
				break;				
			default:
				$this->paramError();
				break;
		}
		$returnArr='';
		foreach($data as $key=>$value){
			if(in_array($key,$searchArr)){
				$returnArr[$key]=$value;
			}else{
				$this->paramError();
			}
		}
		$this->params=$returnArr;
		return $this;
	}

	public function paramError(){
		exit('参数名称不正确！');
	}
	//public function typeError(){
		//echo '字符串类型不匹配！';
		//exit();
	//}

}
?>
