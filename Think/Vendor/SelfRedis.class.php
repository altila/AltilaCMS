<?php
/**
* Redis 操作类 Verison 0.1
* ============================================================================
* $Author: topThink.com     Elser$
* 2011-7-8 9:48:44
*/
class selfRedis extends Think
{
    static private   $_instance = NULL;
    static private   $redis     = NULL ;
    /**
    +----------------------------------------------------------
    | 实例化连接
    +----------------------------------------------------------
    */
    public function __construct($mString)
    {
        $_ip        = chooseServer($mString);
        $redis    = new Redis();
        $conn     = $redis->connect($_ip[0],$_ip[1]);
        if($conn)
        {
            self::$redis     = $redis;
        }
        else
        {
            throw_exception('无法正常连接到缓存服务器');
        }
    }

    /**
    +----------------------------------------------------------
    | 运行
    +----------------------------------------------------------
    */
    public static function run ()
    {
        $mString = func_get_args();
        if(is_null(self::$_instance) || !isset(self::$_instance))
        {
            self::$_instance = new self($mString);
        }
        return self::$_instance;
    }
    /**
    +----------------------------------------------------------
    | 存储数据
    | 成功返回 true
    +----------------------------------------------------------
    */
    public  function add($_key,$_value)
    {
        if(is_array($_value))
        {
            foreach ($_value as $key => $val)
            {
                if(!is_array($val) || !isset($val['extension_code']))
                {
                    unset($_value[$key]);
                }
            }
        }
        self::$redis->set('bgcart_'.md5(trim($_key)),json_encode($_value));
        self::$redis->expireAt('bgcart_'.md5(trim($_key)),time()+604800);
        return true;
    }

    /**
    +----------------------------------------------------------
    | 获取数据
    | 返回键值
    +----------------------------------------------------------
    */
    static public  function get($_key)
    {
        //echo $_key,'|bgcart_'.md5(trim($_key)),'<hr>';
        return  json_decode(self::$redis->get('bgcart_'.md5(trim($_key))),true);
        //return  json_decode('"[]"',true);
    }
    /**
    +----------------------------------------------------------
    | 登录用户/未登录 购物车更新
    +----------------------------------------------------------
    */
    public function refresh_cart($session,$userid)
    {
        if(!$session AND !$userid)
        {
            return ;
        }
        //寄存商品更新
        $this->refresh_old_data($session,$userid);
        $_s_data = self::_get_real_value($session,$session);
        $_u_data = $this->get($userid);
        if(empty($_s_data) AND empty($_u_data))
        {
            return ;
        }
        else
        {
            /* 将记录里面的user_id session_id 更新统一下 */
            if(!empty($_s_data))
            {
                foreach ($_s_data as $key => $val)
                {
                    $_s_data[$key]['user_id']    = $userid;
                    $_s_data[$key]['session_id'] = $session;
                }
            }
            if(!empty($_u_data))
            {
                foreach ($_u_data as $key => $val)
                {
                    $_u_data[$key]['user_id']    = $userid;
                    $_u_data[$key]['session_id'] = $session;
                }
            }

            $_add_mark = $userid ? $userid  : $session ;
            $_del_mark = $userid ? $session : $userid  ;
            if(empty($_s_data) || empty($_u_data))
            {
                $this->add($_add_mark,empty($_s_data)?$_u_data:$_s_data);
                $this->add($_del_mark,'');
                return ;
            }
            else
            {
                $_s_tmp = $this->update_cart($_s_data);
                $_u_tmp = $this->update_cart($_u_data);
                $tmp = array();
                foreach ($_s_tmp as $key => $val)
                {
                    if(array_key_exists($key,$tmp) AND $val['extension_code']=='common')
                    {
                        $tmp[$key]['goods_number']+=$val['goods_number'];
                    }
                    else
                    {
                        $tmp[$key] = $val;
                    }
                }

                foreach ($_u_tmp as $key => $val)
                {
                    if(array_key_exists($key,$tmp) AND $val['extension_code']=='common')
                    {
                        $tmp[$key]['goods_number']+=$val['goods_number'];
                    }
                    else
                    {
                        $tmp[$key] = $val;
                    }
                }
                foreach ($tmp as $key => $val)
                {
                    $_last[] = $val;
                }
                $this->_get_real_value($session,$session,TRUE);
                $this->add($_add_mark,$_last);
            }
        }
    }
    /**
    +----------------------------------------------------------
    | 数据更新
    +----------------------------------------------------------
    */
    protected function update_cart($data)
    {
        if(empty($data))
        {
            return ;
        }
        $tmp = array();
        foreach ($data as $key => $val)
        {
            if(isset($tmp[$val['sku_sn'].'_'.$val['extension_id'].'_'.$val['extension_code']]))
            {
                $tmp[$val['sku_sn'].'_'.$val['extension_id'].'_'.$val['extension_code']]['goods_number']+=$val['goods_number'];
            }
            else
            {
                $tmp[$val['sku_sn'].'_'.$val['extension_id'].'_'.$val['extension_code']] = $val;
            }
        }
        return $tmp;
    }

    /**
    +----------------------------------------------------------
    | 寄存商品更新 key_delete
    +----------------------------------------------------------
    */
    protected function refresh_old_data($session,$userid)
    {
        //获取节点
        $_s_data = self::_get_real_value($session,$session.'_delete');

        $_u_data = empty($userid) ? '' : $this->get($userid.'_delete');

        if(empty($_s_data) AND empty($_u_data))
        {
            return ;
        }

        $_add_mark = $userid ? $userid  : $session ;
        $_del_mark = $userid ? $session : $userid  ;
        if(!$_s_data ||!$_u_data)
        {
            $this->add($_add_mark.'_delete',empty($_s_data)?$_u_data:$_s_data);
        }
        else
        {
            foreach ($_s_data as $key => $val)
            {
                $_s_tmp[$val['sku_sn']] = $val;
            }
            foreach ($_u_data as $key => $val)
            {
                $_u_tmp[$val['sku_sn']] = $val;
            }
            $tmp = array();
            foreach ($_s_tmp as $key => $val)
            {
                if(array_key_exists($key,$tmp) AND $val['extension_code']=='common')
                {
                    $tmp[$key]['goods_number']+=$val['goods_number'];
                }
                else
                {
                    $tmp[$key] = $val;
                }
            }
            foreach ($_u_tmp as $key => $val)
            {
                if(array_key_exists($key,$tmp) AND $val['extension_code']=='common')
                {
                    $tmp[$key]['goods_number']+=$val['goods_number'];
                }
                else
                {
                    $tmp[$key] = $val;
                }
            }
            foreach ($tmp as $key => $val)
            {
                $_last[] = $val;
            }
            self::_get_real_value($session,$session.'_delete',TRUE);
            $this->add($_add_mark.'_delete',$_last);
        }
    }
    /**
    |+----------------------------------------------------------
    |*  获取指定键值的值 session_id 和 user_id 的不再同一天服务器上
    |+----------------------------------------------------------
    */
    public function _get_real_value($mString,$key,$type=FALSE)
    {
        $_ip        = chooseServer($mString);
        $_redis     = new Redis();
        $_redis->connect($_ip[0],$_ip[1]);
        if(!$type)
        {
            $result = json_decode($_redis->get('bgcart_'.md5(trim($key))),true);
            $_redis->delete('bgcart_'.md5(trim($key)));
            return $result;
        }
        else
        {
            $_value = '[]';
            $_redis->set('bgcart_'.md5(trim($_key)),json_encode($_value));
            $_redis->expireAt('bgcart_'.md5(trim($_key)),time()+604800);
        }
    }
}
?>