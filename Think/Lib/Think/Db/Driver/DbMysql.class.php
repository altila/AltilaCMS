<?php
// +----------------------------------------------------------------------
// | TOPThink [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2010 http://topthink.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
// $Id$

// mysql 驱动类
define('CLIENT_MULTI_RESULTS', 131072);
class DbMysql extends Db
{

	var $config;


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
        if ( !extension_loaded('mysql') ) {
            throw_exception(L('_NOT_SUPPERT_').':mysql');
        }
        if(!empty($config)) {
            $this->config   =  $config;
        }
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

         if ( !isset($this->linkID[$linkNum]) ) {
            
            if(empty($config))  $config =   $this->config;

            // 处理不带端口号的socket连接情况
              $host = $config['hostname'].($config['hostport']?":{$config['hostport']}":'');
            if($this->pconnect) {
                $linkID = mysql_pconnect( $host, $config['username'], $config['password'],CLIENT_MULTI_RESULTS);
            }else{
                $linkID = mysql_connect( $host, $config['username'], $config['password'],true,CLIENT_MULTI_RESULTS);
            }
            if ( !$linkID || (!empty($config['database']) && !mysql_select_db($config['database'], $linkID)) ) {
                throw_exception(mysql_error());
            }
            $dbVersion = mysql_get_server_info($linkID);
           
            if ($dbVersion >= "4.1") {
                //使用UTF8存取数据库 需要mysql 4.1.0以上支持
                mysql_query("SET NAMES '".$config['charset']."'", $linkID);
            }
            //设置 sql_model
            if($dbVersion >'5.0.1'){
                mysql_query("SET sql_mode=''",$linkID);
            }
           
            // 标记连接成功
            $this->connected    =   true;
            // 注销数据库连接配置信息
        	 //   if(1 != C('DB_DEPLOY_TYPE')) unset($this->config);
            $this->linkID[$linkNum] =  $linkID;
         }
        return $this->linkID[$linkNum];
    }


    /**
     +----------------------------------------------------------
     * 从主库查询
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * */

       function master_query($str='',$type='all'){

	       //$this->switchMasterConnect($this->config['dbmaster'],true);
	       	if($type=='one'){
	       		$this->queryID=$this->query($str,1,true);
				$result=mysql_fetch_array($this->queryID);
	 			$this->free();
		    }else{
		    	$result=$this->query($str,$statment=0,true);
	       	}
	       //	$this->switchMasterConnect();
	       	return $result;
       }

    /**
     +----------------------------------------------------------
     * 切换数据库
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     */

    function switchdb(){
       static $_pdb ;
      
     if ($_pdb!=$this->config['database']){ 
    		@mysql_select_db($this->config['database'],$this->_linkID);
    		 $_pdb=$this->config['database'];
    		return $_pdb;
    	}
    	return $_pdb;
    }
    
    
    /**
     +----------------------------------------------------------
     * 释放查询结果
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     */
    public function free() {
        mysql_free_result($this->queryID);
        $this->queryID = 0;
    }

    /**
     +----------------------------------------------------------
     * 执行查询 主要针对 SELECT, SHOW 等指令
     * 返回数据集
     +----------------------------------------------------------
     * @access protected
     +----------------------------------------------------------
     * @param string $str  sql指令
     +----------------------------------------------------------
     * @return mixed
     +----------------------------------------------------------
     * @throws ThinkExecption
     +----------------------------------------------------------
     */
    public function query($str='',$statment=0,$master=false) {
       $_sql_master=false;
    	if(!preg_match ("/^(\s*)select/i", $str)){
			$_sql_master = true;
		}  
		 $master=($master||$_sql_master)?true:false; 
        $this->initConnect($master); 
        if ( !$this->_linkID ) return false;  
        if ( $str != '' ) $this->queryStr = $str;

        //释放前次的查询结果

        if ( $this->queryID ) {    $this->free();  }
        N('db_query',1);
        // 记录开始执行时间
        G('queryStartTime');
          
        
        $this->queryID = mysql_query($this->queryStr, $this->_linkID);
        if($master===true) $this->lastInsID = mysql_insert_id($this->_linkID);
        $this->debug();
        if ( !$this->queryID ) {

            if ( $this->debug )
                throw_exception($this->error());
            else
                return false;
        } else {
        	if($statment){
        		 return $this->queryID;
			}else{
	            $this->numRows = mysql_num_rows($this->queryID);
	            return $this->getAll();
			}
        }
    }

    /**
     +----------------------------------------------------------
     * 执行语句 针对 INSERT, UPDATE 以及DELETE
     +----------------------------------------------------------
     * @access protected
     +----------------------------------------------------------
     * @param string $str  sql指令
     +----------------------------------------------------------
     * @return integer
     +----------------------------------------------------------
     * @throws ThinkExecption
     +----------------------------------------------------------
     */
    public function execute($str='') {
    	
        $this->initConnect(true);
       
        if ( !$this->_linkID ) return false;
        if ( $str != '' ) $this->queryStr = $str;
        //释放前次的查询结果
        if ( $this->queryID ) {    $this->free();    }
        $this->switchdb();
        try {
         	N('db_write',1);
        // 记录开始执行时间
        G('queryStartTime');
        $result =   mysql_query($this->queryStr, $this->_linkID) ;
        $this->debug();
        if ( false === $result) {
            if ( $this->debug )
                throw_exception($this->error());
            else
                return false;
        } else {
            $this->numRows = mysql_affected_rows($this->_linkID);
            $this->lastInsID = mysql_insert_id($this->_linkID);
            return $this->numRows;
        }
        }catch (Exception $e){
        	
        }
    }


    	/**
	 +----------------------------------------------------------
	 * 获取所有记录
	 +----------------------------------------------------------
	 */
	public function mysqlFetchArray($sql)
	{   
		$result = $this->query($sql);
		return $result;
	}


//		/**
//	 +----------------------------------------------------------
//	 * 将查询结果保存为数组
//	 +----------------------------------------------------------
//	 */
//	public function fetch_array($result='')
//	{
//
//	    $this->record=mysql_fetch_array($result,MYSQL_ASSOC);
//
//		return  $this->record;
//	}
//

	 /**
	 +----------------------------------------------------------
	 * 查询第一个值
	 +----------------------------------------------------------
	 */
	public function query_first($query_string)
	{
		$this->queryID=$this->query($query_string,1);
		$returnarray=mysql_fetch_array($this->queryID);
 
 		$this->free();
		return $returnarray;
	}
    /**
     +----------------------------------------------------------
     * 启动事务
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @return void
     +----------------------------------------------------------
     * @throws ThinkExecption
     +----------------------------------------------------------
     */
    public function startTrans() {
        $this->initConnect(true);
        if ( !$this->_linkID ) return false;
        //数据rollback 支持
        if ($this->transTimes == 0) {
            mysql_query('START TRANSACTION', $this->_linkID);
        }
        $this->transTimes++;
        return ;
    }

    /**
     +----------------------------------------------------------
     * 用于非自动提交状态下面的查询提交
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @return boolen
     +----------------------------------------------------------
     * @throws ThinkExecption
     +----------------------------------------------------------
     */
    public function commit()
    {
        if ($this->transTimes > 0) {
            $result = mysql_query('COMMIT', $this->_linkID);
            $this->transTimes = 0;
            if(!$result){
                throw_exception($this->error());
                return false;
            }
        }
        return true;
    }

    /**
     +----------------------------------------------------------
     * 事务回滚
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @return boolen
     +----------------------------------------------------------
     * @throws ThinkExecption
     +----------------------------------------------------------
     */
    public function rollback()
    {
        if ($this->transTimes > 0) {
            $result = mysql_query('ROLLBACK', $this->_linkID);
            $this->transTimes = 0;
            if(!$result){
                throw_exception($this->error());
                return false;
            }
        }
        return true;
    }

    /**
     +----------------------------------------------------------
     * 获得所有的查询数据
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @return array
     +----------------------------------------------------------
     * @throws ThinkExecption
     +----------------------------------------------------------
     */
    public function getAll() {
        if ( !$this->queryID ) {
            throw_exception($this->error());
            return false;
        }
        //返回数据集
        $result = array();
        if($this->numRows >0) {
            while($row = mysql_fetch_assoc($this->queryID)){
                $result[]   =   $row;
            }
            mysql_data_seek($this->queryID,0);
        }
        $this->free();
        return $result;
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
				$this->startTrans();
				if(is_array($sql_arr))
				{
					foreach ($sql_arr as $sql){
						$this->execute($sql);
					}
				}else{
					$this->execute($sql_arr);
				}
				$this->commit();
			}catch (Exception $e){
				$this->rollBack();
				throw_exception($this->error($this->_linkID));
				//print_r($e->getMessage());
				return false;
			}
		}
		return true;
	}

    /**
     +----------------------------------------------------------
     * 取得数据表的字段信息
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     */
    public function getFields($tableName) {
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

    /**
     +----------------------------------------------------------
     * 取得数据库的表信息
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     */
    public function getTables($dbName='') {
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

        /**
     +----------------------------------------------------------
     * 插入或者更新指定的表表
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @throws ThinkExecption
     +----------------------------------------------------------
     */
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
				return $this->execute($sql);
			}
			else
			{
				return false;
			}
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
            mysql_free_result($this->queryID);
        if ($this->_linkID && !mysql_close($this->_linkID)){
            throw_exception($this->error());
        }
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
    public function error() {
        $this->error = mysql_error($this->_linkID);
        if($this->queryStr!=''){
            $this->error .= "\n [ SQL语句 ] : ".$this->queryStr;
        }
        return $this->error;
    }

    /**
     +----------------------------------------------------------
     * SQL指令安全过滤
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @param string $str  SQL字符串
     +----------------------------------------------------------
     * @return string
     +----------------------------------------------------------
     */
    public function escape_string($str) {
        return mysql_escape_string($str);
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

}//类定义结束
?>