<?php

class mc_session
{
	public $sess_mc;
	public $sess_life = 14400; //可自定义

	function mc_session()
	{    
		
		session_set_save_handler(
			array(&$this, "open"),
			array(&$this, "close"),
			array(&$this, "read"),
			array(&$this, "write"),
			array(&$this, "destroy"),
			array(&$this, "gc")
		);
		session_name("MB");
		session_cache_expire(60);  
		$this->open($save_path, $session_name);
	}

	function __destruct()
	{
		;
	}

	function open($save_path, $session_name)
	{   
		$this->sess_mc = connectMemcacheCluster();
	    return true;
	}

	function close()
	{
		$this->sess_mc->close();
	    return true;
	}

	function read($key)
	{
	//	return false;
	     $v = $this->sess_mc->get($key);
	     
	    return $v;
	}

	function write($key, $val)
	{   
	    $v = $this->sess_mc->set($key, $val, 0, $this->sess_life);
	    return $v;
	}

	function destroy($key)
	{
	    $v = $this->sess_mc->delete($key);
	    return $v;
	}

	function gc($maxlifetime)
	{
	    return TRUE;
	}
}


function connectMemcacheCluster(){
	return;
	$cluster = explode(',', C('MEMCACHE_CLUSTER'));
	if(is_array($cluster)){
		$obj = new Memcache;
		foreach($cluster as $cl){
			$c = parse_url($cl);
			$query = $c['query'];
			parse_str($query);
			$persistent = ($persistent === '1') ? true : false;//默认是短连接
			$weight = isset($weight) ? (int) $weight : 1;//定义权重，默认都是1
			$obj->addServer($c['host'], $c['port'],$persistent,$weight);
		}
		return $obj;
	}else{
		return false;
	}
}

?>
