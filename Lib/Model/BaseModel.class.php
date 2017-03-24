<?php
// +----------------------------------------------------------------------
// | ThinkPHP
// +----------------------------------------------------------------------
// | Copyright (c) 2009 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
// $Id$

class BaseModel extends Model {

	protected $connection = 'DB_ADMIN_CON';
	protected $trueTableName = 'admin_site_web';

	protected $groupName = '';
	public $mc_session;
	public $vdeport;
	public $sessionid;
	public $userInfo;
	public $siteInfo;
	public $nowTime;
	public $nowDate;

	static private $siteInfoInstance;

	public function getNowDate() {
		return $this->nowDate;
	}

 	/**
	+----------------------------------------------------------
	* 项目初始化
	+----------------------------------------------------------
	*/
	public function __construct() {
		parent::__construct();
		$this->groupName = GROUP_NAME;
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
		//$this->siteInfo = $this->siteInfo();
		//设定当前时间
		$this->nowTime = time();
		$this->nowDate = date("Y-m-d H:i:s");
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
		if( empty(self::$siteInfoInstance) ) {
			$key = C("SiteWeb");
			$sql = " SELECT * FROM admin_site_web WHERE domain = '{$this->siteMark}' ORDER BY sort ";
			$siteInfo = self::$siteInfoInstance = $this->getCacheData( $key, $sql, '', 'blcode' );
		} else 
			$siteInfo = self::$siteInfoInstance;
		return $siteInfo;
	}

	/**
	+----------------------------------------------------------
	* 是否表结构中存在该字段
	+----------------------------------------------------------
	* @access  public
	* @param   str      $field          字段
	+----------------------------------------------------------
	* @return  bool
	+----------------------------------------------------------
	* @example $model->isExistField('sort')
	+----------------------------------------------------------
	*/
	public function isExistField( $field ) {
		$dbFields = $this->getDbFields();
		if( in_array($field,$dbFields) ) return true;
		return false;
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
	+----------------------------------------------------------
	* 获取缓存数据
	+----------------------------------------------------------
	* @access  public
	* @param   arr or str      $key           键名
	* @param   str             $type          cache类型
	* @param   boo             $isGet         get:true,set:false
	* @param   arr or str      $value         键值
	* @param   int             $time          存储时间
	+----------------------------------------------------------
	* @return  array
	+----------------------------------------------------------
	* @example getSetCache( $key, $type = 'File', $isGet = true, $value, $time = '900' )
	+----------------------------------------------------------
	*/
	public function getSetCache( $key, $type = 'File', $isGet = true, $value = '', $time = '900' ) {
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
	* 获取基础数据缓存
	+----------------------------------------------------------
	* @access  public
	* @param   str             $key           键名
	* @param   arr or str      $condition     查询条件 or SQL
	* @param   str             $field         字段
	* @param   str             $order         排序
	* @param   str             $limit         条数
	* @param   int             $time          存储时间
	+----------------------------------------------------------
	* @return  array
	+----------------------------------------------------------
	* @example getCacheData( $key, $condition, $field, $order, $limit, 900 )
	+----------------------------------------------------------
	*/
	public function getCacheData( $key = '', $condition = '', $field = '*', $order = '', $limit = '', $time = '900' ) {
		if( !empty($key) ) $result = $this->getSetCache( $key );
		//返回缓存
		if( !empty($result) && !APP_DEBUG ) return $result;
		//if( !empty($result) ) return $result;
		if( !empty($condition['needCount']) ) $needCount = $condition['needCount'];
		$limitArr = explode(',',$condition['limit']);
		if( is_array($condition) )
			unset($condition['_URL_'],$condition['_'],$condition['field'],$condition['order'],$condition['limit'],$condition['needCount']);
		$result = is_array($condition) ? $this->where($condition)->order($order)->field($field)->limit($limit)->select() : $this->query($condition);
		if( empty($result) ) return;
		//按单个字段排序
		if( !empty($order) && strpos($order,'sort') === false && strpos($order,' ') === false ){
			foreach( $result as $k=>$value ) $_result[$value[$order]] = $value;
			$result = $_result;
		}
		//获取总记录数
		if( !empty($result) && $needCount == 1 ) {
			$_result = $result; $result = ''; $result['data'] = $_result;
			$result['numPerPage'] = !empty($limitArr[1]) ? $limitArr[1] : ( !empty($limitArr[0]) ? $limitArr[0] : 10 );
			$result['currentPage'] = ( strpos($condition['limit'],',') != false ) ? ceil( $limitArr[0] / $result['numPerPage'] ) : 1;
			$result['totalCount'] = $this->where($condition)->count();
			$result['totalPage'] = ceil( $result['totalCount'] / $result['numPerPage'] );
		}
		if( !empty($key) ) $this->getSetCache( $key, 'File', false, $result, $time );
		return $result;
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
	* @return bool
	+----------------------------------------------------------
	*/
	public function clearCache( $key, $type = 'File' ) {
		$type = in_array($type,explode(',',C('DATA_CACHE_TYPE_ARRAY'))) ? $type : 'File';
		S( $key, null, array( 'type'=>$type ) );
		return true;
	}

	/**
	+----------------------------------------------------------
	* 通过接口获取数据
	+----------------------------------------------------------
	* @access public
	+----------------------------------------------------------
	* @param   arr      $model          模型：分组名/模型名/方法名
	*          @param   int    curlType       curl类型：1为GET，2为POST
	* @param   arr      $key            键名
	* @param   arr      $condition      条件
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return array
	+----------------------------------------------------------
	* @example getInterfaceData()
	+----------------------------------------------------------
	*/
	public function getInterfaceData( $model = '', $key = '',  $condition = array(), $field = '', $order = '', $limit = '', $extra = array() ) {
		$curlType = $condition['curlType'] ? $condition['curlType'] : 0;
		unset($condition['_URL_'],$condition['_'],$condition['submit'],$condition['curlType']);
		//if( $this->isExistField( 'appdcode' ) ) $condition['appdcode'] = C('APPDCODE');
		$condition['sid'] = $condition['sid'] ? $condition['sid'] : getLang();
		if( !empty($key) ) $result = $this->getSetCache( $key );
		//返回缓存
		if( !empty($result) && !APP_DEBUG ) return $result;
		//if( !empty($result) ) return $result;
		//获取数据
		$modelName = explode('/',$model);
		$enableInterface = explode(',',$this->siteInfo[$_COOKIE['think_language']]['enable_interface']);
		if( in_array($modelName[0],$enableInterface) ) {
			//载入接口方法
			import("ORG.Vendor.DPSingletonFactory.SingletonFactory",LIB_PATH);
			//实例化采集类
			$Interface = SingletonFactory::getInstance("BaseInterface");
			$Interface->url = domain($modelName[0]) . "/{$modelName[1]}/{$modelName[2]}?field={$field}&order={$order}&limit={$limit}";
			$Interface->curlType = $curlType;
			if( $curlType == 1 ) {
				$result = $Interface->curlFunc($condition);
			} else {
				foreach( $condition as $key=>$value )
					if( !empty($key) && !empty($value) && !is_numeric($key) ) $Interface->url .= "&{$key}=$value";
				$result = $Interface->curlFunc();
			}
		} else {
			$result = D( "{$modelName[0]}/{$modelName[1]}" )->$modelName[2]( $condition, $field, $order, $limit );
		}
		if( !empty($key) ) $this->getSetCache( $key, 'File', false, $result );
		//print_r($_result);
		return $result;
	}

}
?>
