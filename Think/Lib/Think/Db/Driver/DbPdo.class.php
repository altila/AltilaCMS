<?php
/**
 * PDO 链接驱动
 * @author Administrator
 *
 */
class DbPdo extends Db
{
	 
	
    var $obj_db =array();

	var $search      = array('/union(\s*(\/\*.*\*\/)?\s*)+select/i', '/load_file(\s*(\/\*.*\*\/)?\s*)+\(/i', '/into(\s*(\/\*.*\*\/)?\s*)+outfile/i');
	var $replace     = array('union &nbsp; select', 'load_file &nbsp; (', 'into &nbsp; outfile');
	 
	 /**
     +----------------------------------------------------------
     * 架构函数
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @param array $config 数据库配置数组
     +----------------------------------------------------------
     */
    public function __construct($config=''){
        if ( !extension_loaded('PDO') ) {
            throw_exception(L('_NOT_SUPPERT_').':PDO');
        }
        if(!empty($config)) {
            $this->config   =  $config;
        }
    }
    /*
	public  function selectConnect($master=false,$query_string=''){
		if($master==false){  
				$query_string = preg_replace('/\/\*(\s|.)*?\*\//', '', $query_string);
				$query_string=trim($query_string);
				$optType="";
				if(preg_match ("/^(\s*)select/i", $query_string)){
					$optType = "read";
				}else{
					$optType="write";
				}
				$master_table = explode(',',C('DB_RW_TABLE'));
 
				if($optType=='read'&&$master_table){
		          foreach ($master_table as $k=>$v){
		          	if(eregi($v,$query_string)) {   $master=true ; break;}
		          }
				}else{ 
					$master=true;
				}
		}  
 		 
		return $this->initConnect($master);  
	}
	*/
	
	/**
	 +----------------------------------------------------------
	 * 将查询结果保存为数组
	 +----------------------------------------------------------
	 */
	public function fetch_array($result='')
	{
		if(!empty($result) && is_object($result))
		{
			$this->queryID = $result;
		}
		if($this->queryID->queryString=='')
		{
			return false;
		}
		$this->record = array();
		return $this->queryID->fetch();
	}
	
     /**
     +----------------------------------------------------------
     * 连接数据库方法
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @param mixed $config 数据库配置数组
     * @param number $linkNum 连接序号
     +----------------------------------------------------------
     * @throws ThinkExecption
     +----------------------------------------------------------
     */
    public function connect($config='',$linkNum=0) {
     static $arr_dsn =array(); 
     $identify =  to_guid_string($config); 
     if ( !isset($this->_linkID[$linkNum])|| !$arr_dsn[$identify]) {
            if(empty($config))  $config =   $this->config;
            // 处理不带端口号的socket连接情况  
    	            	 $dsn  = "mysql:host=".$config['hostname'].";port=".$config['hostport'].";dbname=".$config['database'];
                     
    	    try
		{
			 if (C('DB_CHARSET'))
			 {
					$charset   = C('DB_CHARSET');
					$dbcharset = C('DB_CHARSET');
					$dbcharset = !$dbcharset&&in_array(strtolower($charset),array('gbk','big5','utf8'))?str_replace('-','',$charset)
					:$dbcharset;
			 } 
			 
			$LINK_ID = new PDO($dsn,$config['username'],$config['password'],array(PDO::MYSQL_ATTR_USE_BUFFERED_QUERY=>true));
			//$LINK_ID=PDO::__construct( $dsn, $$config['username'],$config['password'], array(PDO::MYSQL_ATTR_USE_BUFFERED_QUERY => true));
		    $LINK_ID->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			$LINK_ID->setAttribute(PDO::ATTR_AUTOCOMMIT, true);
			$LINK_ID->setAttribute(PDO::ATTR_CASE, PDO::CASE_NATURAL);
			$LINK_ID->setAttribute(PDO::ATTR_PERSISTENT, true);
 			parse_str(str_replace(';','&',$dsn), $out);
			$LINK_ID->exec(sprintf('SET CHARACTER SET  %s', $charset));
		    $LINK_ID->exec('SET sql_mode=\'\''); 
			//$LINK_ID->exec('SET SESSION wait_timeout=65535'); 
             
		} 
		
		catch(PDOException $e)
		{   var_dump($e);
			throw_exception("Contect Error on ".$config['hostname']);
			//$this->error("Contect Error on ".$conf['host']);
			return false;
		} 
		 // 标记连接成功
            $this->connected    =   true;
                 
		 if(1 != C('DB_DEPLOY_TYPE')) unset($this->config);
			  $this->_linkID[$linkNum]=$LINK_ID;
			  return  $this->_linkID[$linkNum]; 
    	} 
    	return $this->_linkID[$linkNum];     
    	   
    }
	 
	
 
    public function query($query_string='',$statment=0) {
    	if(trim($query_string) == "")
		{
			throw_exception("SQL Query Is Empty.");
			return false;
		} else  
		$this->queryStr = $query_string;
		 $this->initConnect(false);
	 
		 if ( !$this->_linkID ) return false ;
 
		//$obj_db=$this->selectConnect(false,$query_string);
		$this->queryID = null;  
		try {
			
		$this->queryID = $this->_linkID->query($query_string);  
		}catch (Exception $e)
		{
			echo $query_string;
			echo '<br>';
			var_dump($e);
		}
		
		$this->lastInsID = $this->_linkID->lastInsertId();
		if($this->queryID === false)
		{
			throw_exception("无效的查询语句<br />".$query_string);
            return false;
		}
		if($statment){
			return $this->queryID;
		}else{ 
			$list = $this->queryID->fetchall();
			$this->numRows=count($list);
			return $list;
		}
    }
    
    
	/**
	 +----------------------------------------------------------
	 * 获取所有记录
	 +----------------------------------------------------------
	 */
	public function mysqlFetchArray($sql)
	{
		$this->queryID = $this->query($sql,1);
		
		if(empty($this->queryID)) return array();
		$sqldata = $this->queryID->fetchall();
		return $sqldata;
	}
	
    public function free($query_id) {
       	if(empty($query_id))
		{
			$this->queryID = $query_id;
		}
		$this->queryID->closeCursor();
		$this->queryID = null;
		return true;
    }
    
    
    public function execute($str='') {
    	$this->initConnect(true);
        if ( !$this->_linkID) return false;
        if ( $str != '' ) $this->queryStr = $str;
        //释放前次的查询结果
        if ( $this->queryID ) {    $this->free($this->queryID);    }
        N('db_write',1);
        // 记录开始执行时间
        G('queryStartTime');
 
        $result =  $this->_linkID->exec($this->queryStr);
       // mysql_query($this->queryStr, $this->_linkID) ;
 
        $this->debug();
        if ( false === $result) {
            if ( $this->debug )
                throw_exception($this->error($link));
            else
                return false;
        } else {
            $this->numRows = $result;
            //mysql_affected_rows($this->_linkID);
            $this->lastInsID = $this->_linkID->lastInsertId();
            return $this->numRows;
        } 
    }
    
    public function startTrans() {
    	 $this->initConnect(true);
    	
    	//$this->initConnect(true);
        if ( !$this->_linkID ) return false;
        //数据rollback 支持
        if ($this->transTimes == 0) {
           $this->_linkID->beginTransaction();
        }
        $this->transTimes++;
        return ; 
    }
    
    public function commit(){
    	 $this->initConnect(true);
    	
    	 if ($this->transTimes > 0) {
    	 	$result=$this->_linkID->commit();
            $this->transTimes = 0;
            if(!$result){
                throw_exception($this->error($o_db));
                return false;
            }
        }
        return true; 
    }
    
    public function rollback(){
    	 $this->initConnect(true);  
    	  if ($this->transTimes > 0) {
            $result = $this->_linkID->rollBack();
            $this->transTimes = 0;
            if(!$result){
                throw_exception($this->error($o_db));
                return false;
            }
        }
        return true; 
    }
    
     /**
	 * 事务处理
	 * @param array $sql_arr
	 */
	public function trans_sql($sql_arr){
		 $this->initConnect(true);
		if(!empty($sql_arr)){
			try{ 
			   //$this->_linkID->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
				// $this->_linkID->setAttribute(PDO::ATTR_AUTOCOMMIT, true);
				$this->_linkID->beginTransaction();
				if(is_array($sql_arr))
				{
					foreach ($sql_arr as $sql){
						$this->_linkID->exec($sql);
					}
				}else{
					$this->_linkID->exec($sql_arr);
				}
				$this->_linkID->commit();
			}catch (Exception $e){
				$this->_linkID->rollBack();
				throw_exception($this->error($this->_linkID));
				//print_r($e->getMessage()); 
				return false;
			}
		}
		return true;
	}
	
    
    public function getAll($sql){
    	if(!$this->queryID){
    		  throw_exception('未知错误');
    		return false;
    	}
    	$result = $this->queryID->fetchall();
		return $result;
    }
    
    public function getFields($tableName){
 
 
    	//$sql = "SHOW COLUMNS FROM {$tableName}";
    	$result =   $this->query('SHOW COLUMNS FROM '.$tableName);
        $info   =   array();
        foreach ($result as $key => $val) {
            $info[$val['Field']] = array(
                'name'    => $val['Field'],
                'type'    => $val['Type'],
                'notnull' => (bool) ($val['Null'] === ''), // not null is empty, null is yes
                'default' => $val['Default'],
                'primary' => (strtolower($val['Key']) == 'pri'),
                'autoinc' => (strtolower($val['Extra']) == 'auto_increment'),
            );
        }
        return $info; 
    }
    
    //取得表字段
    public function getTables($dbName=''){  
		 if(!empty($dbName)) {
           $sql    = 'SHOW TABLES FROM '.$dbName;
        }else{
           $sql    = 'SHOW TABLES ';
        }
        $result =   $this->query($sql);
        $info   =   array();
        foreach ($result as $key => $val) {
            $info[$key] = current($val);
        }
        return $info;
        
    }
 
      
		//插入或者更新指定的表表
 function autoExecute($table, $field_values, $mode = 'INSERT', $where = '', $querymode = '')
		{   
			$field_names = $this->getTables('DESC ' . $table);
			$sql = '';
			if(!empty($field_values)){
				if ($mode == 'INSERT') 
				{
					$fields = $values = array();
					foreach ($field_names AS $value)
					{
						if (array_key_exists($value, $field_values) == true)
						{
							$fields[] = "`".$value."`";
							$values[] = "'" . $field_values[$value] . "'";
						}
					}
		
					if (!empty($fields))
					{
						$sql = 'INSERT INTO ' . $table . ' (' . implode(', ', $fields) . ') VALUES (' . implode(', ', $values) . ')';
					}
				}
				else
				{
					$sets = array();
					foreach ($field_names AS $value)
					{
						if (array_key_exists($value, $field_values) == true)
						{
							$sets[] = "`".$value . "` = '" . $field_values[$value] . "'";
						}
					}
		
					if (!empty($sets))
					{
						$sql = 'UPDATE ' . $table . ' SET ' . implode(', ', $sets) . ' WHERE ' . $where;
					}
				}
			}
			if ($sql)
			{
				return $this->query($sql);
			}
			else
			{
				return false;
			}
		}
     /**
	 +----------------------------------------------------------
	 * 查询第一个值
	 +----------------------------------------------------------
	 */
	public function query_first($query_string)
	{
		$this->queryID=$this->query($query_string,1);
		$this->queryID->setFetchMode(PDO::FETCH_BOTH);
		$returnarray = $this->queryID->fetch();
		$this->free($this->queryID);
		return $returnarray;
	}
	
	/**
	 +----------------------------------------------------------
	 * 数据指针检索
	 +----------------------------------------------------------
	 */
	public function data_seek($pos,$query_id='')
	{
		if(empty($query_id))
		{
			$this->queryID = $query_id;
		}
		if(!$this->queryID) return false;

		$status = $this->queryID->fetch(PDO::FETCH_ASSOC, PDO::FETCH_ORI_ABS, $pos);
		return $status;
	}
   /**
     +----------------------------------------------------------
     * 关闭数据库
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @throws ThinkExecption
     +----------------------------------------------------------
     */
    public function close() {
        if (!empty($this->queryID))
           $this->queryID->closeCursor()   ; 
        $this->_linkID = 0;
    }

    /**
     +----------------------------------------------------------
     * 数据库错误信息
     * 并显示当前的SQL语句
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @return string
     +----------------------------------------------------------
     */
    public function error($obj) {
 
        $this->error = $obj->errorInfo();
        if($this->queryStr!=''){
            $this->error .= "\n [ SQL语句 ] : ".$this->queryStr;
        }
        return $this->error;
    }
    
    /**
	 +----------------------------------------------------------
	 * 过滤 单一好
	 +----------------------------------------------------------
 	*/
	public function escape_string($string)
	{
		 $this->initConnect(false);
		if(!is_array($string))
		{
			return str_replace(array('\n', '\r'), array(chr(10), chr(13)),  preg_replace($this->search, $this->replace, $string) );
		}
	
		foreach($string as $key=>$val)
		{
			$string[$key] = $this->_linkID->escape_string($val);
		}
		return $string;
	}

  /**
     +----------------------------------------------------------
     * 字段和表名添加`
     * 保证指令中使用关键字不出错 针对mysql
     +----------------------------------------------------------
     * @access protected
     +----------------------------------------------------------
     * @param mixed $value
     +----------------------------------------------------------
     * @return mixed
     +----------------------------------------------------------
     */
    protected function addSpecialChar(&$value) {
        $value   =  trim($value);
        if( false !== strpos($value,' ') || false !== strpos($value,',') || false !== strpos($value,'*') ||  false !== strpos($value,'(') || false !== strpos($value,'.') || false !== strpos($value,'`')) {
            //如果包含* 或者 使用了sql方法 则不作处理
        }else{
            $value = '`'.$value.'`';
        }
        return $value;
    }
    

    
}