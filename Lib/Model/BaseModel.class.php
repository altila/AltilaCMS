<?php
class BaseModel extends Model {

	protected $trueTableName = 'site_web';

	public $mc_session;
	public $vdeport;
	public $sessionid;
	public $userInfo;
	public $siteInfo;
	public $nowTime;

	/**
	+----------------------------------------------------------
	* 项目初始化
	+----------------------------------------------------------
	*/
	public function __construct() {
		parent::__construct();
		//$this->mc_session = new mc_session();
		$this->sessionid = session_id();
		//域名解析
		$domainArr = explode('.',$_SERVER['HTTP_HOST']);
		//二级域名
		$this->secondDomain = $domainArr[0];
		//站点标示
		$this->siteMark = $domainArr[1];
		//用户身份验证设置
		$this->userInfo = $this->userAuthSet();
		//设置页面Meta
		$this->siteInfo = $this->siteInfo();
		//设定当前时间
		$this->nowTime = array('time'=>time(),'date'=>date("Y-m-d H:i:s"));
	}

	/**
	+----------------------------------------------------------
	* 获取用户身份验证设置
	+----------------------------------------------------------
	* @param array $_SESSION 
	+----------------------------------------------------------
	* @return string
	+----------------------------------------------------------
	*/
	public function userAuthSet() {
		$key = C('USER_AUTH_KEY');
		if( empty($_SESSION[$key]) ) return;
		return array(
			'Uid'       => $_SESSION[$key]['Uid'] ,
			'UserId'    => $_SESSION[$key]['UserId'] ,
			'UserType'  => $_SESSION[$key]['UserType'],
			'LevelId'   => $_SESSION[$key]['LevelId'],
		);
	}

	/**
	+----------------------------------------------------------
	* 获取站点信息
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  array
	+----------------------------------------------------------
	* @example $this->siteInfo()
	+----------------------------------------------------------
	*/
	public function siteInfo() {
		$key = C("SiteWeb");
		$sql = " SELECT * FROM site_web WHERE domain = '{$this->siteMark}' ";
		$siteInfo = $this->getCacheData( $key, $sql, 'blcode' );
		return $siteInfo;
	}

	/**
	+----------------------------------------------------------
	* 是否表结构中存在该字段
	+----------------------------------------------------------
	* @access  public
	* @param   str      $field          字段
	+----------------------------------------------------------
	* @return  boo
	+----------------------------------------------------------
	* @example $model->isExistField('sort')
	+----------------------------------------------------------
	*/
	public function isExistField( $field ) {
		$fieldArr = $this->getDbFields();
		foreach( $fieldArr as $key=>$val )
			if( $val == $field ) return true;
		return false;
	}

	/**
     +----------------------------------------------------------
	 * 执行insert语句 可执行多条
     +----------------------------------------------------------
	 * @access public
     +----------------------------------------------------------
	 * @param array		$data	参数数组
	 * @param string	$table	数据库表名
	 * @param int		$cmd	是否返回SQL语句（1=>返回sql 0=>执行sql）
     +----------------------------------------------------------
	 * @return string	$sql
	 * @return array	$fp
     +----------------------------------------------------------
	 */
	public function sql_into($data, $table, $cmd = 0) {
		$data = $this->saddslashes ( $data );
		$keys = $vals = "";
		while ( list ( $k, $v ) = each ( $data ) ) {
			$keys .= $k . ",";
			$vals .= "'" . $v . "',";
		}
		if ($keys && $vals) {
			$keys = substr ( $keys, 0, - 1 );
			$vals = substr ( $vals, 0, - 1 );
		}
		$sql = " INSERT INTO {$table} ({$keys}) VALUES ({$vals}) ";
		//根据参数判断返回SQL语句或者查询结果
		if ($cmd > 0) {
			return $sql;
		} else {
			$this->execute ($sql);
			return $this->getLastInsID();
		}
	}

	/**
     +----------------------------------------------------------
	 * 执行update语句 可执行多条
     +----------------------------------------------------------
	 * @access public
     +----------------------------------------------------------
	 * @param array		$data	参数数组
	 * @param string	$table	数据库表名
	 * @param int		$cmd	是否返回SQL语句（1=>返回sql 0=>执行sql）
     +----------------------------------------------------------
	 * @return array	$val
     +----------------------------------------------------------
	 */
	public function sql_update($data,$table,$key,$val,$cmd=0){
		$keys = "";
		while( list($k,$v)=each($data) ){
			$keys .= "{$k}='{$v}',";
		}
		if($keys){
			$keys = substr($keys,0,-1);
		}
		$sql = " update {$table} set {$keys} where {$key}='{$val}' ";
		//根据参数判断返回SQL语句或者查询结果
		if( $cmd > 0 ){
			return $sql;
		}else{
			return $this->execute ($sql);
		}
	}

	/**
	+----------------------------------------------------------
	* 转义预定义字符
	+----------------------------------------------------------
	* @access public
	+----------------------------------------------------------
	* @param  string    $string   SQL语句
	+----------------------------------------------------------
	* @return string    $string
	+----------------------------------------------------------
	*/
	public function saddslashes($string) {
		if( is_array($string) ) {
			foreach( $string as $key => $val ) {
				$string[$key] = $this->saddslashes($val);
			}
		} else {
			$string = addslashes($string);
		}
		return $string;
	}

	/**
	+----------------------------------------------------------$this->siteMark
	* 获取缓存数据
	+----------------------------------------------------------
	* @access  public
	* @param   arr or str      $key           键名
	* @param   str             $type          cache类型
	* @param   boo             $isGet         get:true,set:false
	* @param   arr or str      $value         键值
	* @param   int             $time          存储时间
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	* @example getSetCache( $key, $type = 'File', $isGet = true, $value, $time = '900' )
	+----------------------------------------------------------
	*/
	public function getSetCache( $key, $type = 'File', $isGet = true, $value = '', $time = '900' ) {
		if( C("APP_DEBUG") ) return;
		$type = in_array($type,explode(',',C('DATA_CACHE_TYPE_ARRAY'))) ? $type : 'File';
		if( is_array($key) ){
			foreach( $key as $k=>$v ) $_t.= $k.'='.$v.'&';
			$key = $_t;
		}
		if( $isGet ) return S( $key );
		else S( $key, $value, array( 'type'=>$type, 'expire'=>$time ) );
	}

	/**
	+----------------------------------------------------------
	* 清楚缓存
	+----------------------------------------------------------
	* @access public
	+----------------------------------------------------------
	* @param   arr or str      $key           键名
	* @param   str             $type          cache类型
	+----------------------------------------------------------
	* @return boo
	+----------------------------------------------------------
	*/
	public function clearCache( $key, $type = 'File' ) {
		$type = in_array($type,explode(',',C('DATA_CACHE_TYPE_ARRAY'))) ? $type : 'File';
		S( $key, null, array( 'type'=>$type ) );
		return true;
	}

	/**
	+----------------------------------------------------------
	* 获取基础数据缓存
	+----------------------------------------------------------
	* @access  public
	* @param   str             $key           键名
	* @param   arr or str      $condition     查询条件 or SQL
	* @param   srt             $sort          排序字段
	* @param   int             $time          存储时间
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	* @example getCacheData( $key, $condition, $sort, 900 )
	+----------------------------------------------------------
	*/
	public function getCacheData( $key = '', $condition = '', $sort = '', $time = '900' ) {
		if( empty($key) ) return;
		$result = $this->getSetCache( $key );
		//返回缓存
		if( !empty($result) ) return $result;
		$result = is_array($condition) ? $this->where($condition)->select() : $this->query($condition);
		if( empty($result) ) return;
		if( !empty($sort) ){
			foreach( $result as $k=>$value ) $_result[$value[$sort]] = $value;
			$result = $_result;
		}
		$this->getSetCache( $key, 'File', false, $result, $time );
		return $result;
	}


}
?>
