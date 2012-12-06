<?php
class BaseModel extends Model
{
	public $mc_session;
	public $vdeport;
	public $sessionid;
	public $userid;
	public $now_time;
	public function __construct()
	{
		parent::__construct();
		$this->mc_session = new mc_session();
      	$this->vdeport    = $this->query_first("select * from channel_info where channel_code = '".C("CHANNEL_CODE")."'");
		  $this->sessionid  = session_id();
		$this->userid     = $_SESSION["loginUser"]["userid"];
		$this->now_time= time();
	}

	// 获取当前会员的ID
    public function getMemberId() {
        return isset($_SESSION[C('MEMBER_AUTH_KEY')])?$_SESSION[C('MEMBER_AUTH_KEY')]:0;
    }

    // 获取后台用户的ID
    protected function getUserId() {
        return $_SESSION[C('USER_AUTH_KEY')];
    }


     /**
     +----------------------------------------------------------
     * 事务处理
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @param	array		$sqls 	sql语句
     +----------------------------------------------------------
     * @return	boolean
     +----------------------------------------------------------
     */
    public function sql_transaction($sqls)
    {
    	return $this->trans_sql($sqls);
    }

    /**
     +----------------------------------------------------------
     * 过滤数字主键
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @param array 	$arr 要过滤的数字
     +----------------------------------------------------------
     * @return array	$arr
     +----------------------------------------------------------
     */
	public function filterNumIndex($arr){
		if(is_array($arr)){
			foreach ($arr as $k=>$v){
				if(is_int($k)) unset($arr[$k]);
			}
		}
		return $arr;
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
		$sql = "INSERT INTO " . $table . " ($keys) VALUES($vals)";
		//根据参数判断返回SQL语句或者查询结果
		if ($cmd > 0) {
			return $sql;
		} else {
			$this->execute ($sql);
			$fp = $this->getLastInsID();
			return $fp;
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
		$keys="";
		while(list($k,$v)=each($data)){
			$keys.=$k."='".$v."',";
		}
		if($keys){
			$keys=substr($keys,0,-1);
		}
		$sql="update ".$table." set ".$keys." where ".$key."='".$val."'";
		//根据参数判断返回SQL语句或者查询结果
		if($cmd>0){
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
	 * @param string	$string	SQL语句
     +----------------------------------------------------------
	 * @return string	$string
     +----------------------------------------------------------
	 */
	public function saddslashes($string) {
		if(is_array($string)) {
			foreach($string as $key => $val) {
				$string[$key] = $this->saddslashes($val);
			}
		} else {
			$string = addslashes($string);
		}
		return $string;
	}
	/**
     +----------------------------------------------------------
	 * 转义预定义字符
     +----------------------------------------------------------
	 * @access public
     +----------------------------------------------------------
	 * @param string	$string	SQL语句
     +----------------------------------------------------------
	 * @return string	$string
     +----------------------------------------------------------
	 */
     public function readWriteData($marked,$type=true,$data,$time='900')
     {
         if(C("APP_DEBUG")) return ;
         if(PREVIEW && $type) return ;
         if(is_array($marked))
         {
             foreach($marked as $k=>$v) $_t.= $k.'='.$v.'&';
             $marked = $_t;
         }
         $string = $marked;
         if($type)
             return unserialize($this->mc_session->read($string));
         else
         {
             /* 如果数据为空 */
             if(!$data) return ;

             $this->mc_session->sess_life = $time;
             $this->mc_session->write($string,serialize($data));
         }
     }
}
?>