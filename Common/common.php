<?php
//+---------------------------------------
//|  系统公共函数库
//+---------------------------------------

/**
+----------------------------------------------------------
* 网站url地址
+----------------------------------------------------------
* @access  public
* @param   string      $type      类型：www,act,member,api等
+----------------------------------------------------------
* @return  string
+----------------------------------------------------------
* @example domain('www')  =>  "http://www.altilaphp.com";
+----------------------------------------------------------
*/
function domain($type){
	$url = "http://".strtolower($type).C('DOMAIN');
	return ( PREVIEW == true ) ? "{$url}/preview.php" : $url;
}

/**
+----------------------------------------------------------
* 主题模板切换
+----------------------------------------------------------
* @access  public
* @param   string      $app      子项目名
* @param   string      $tpl      模板名称
+----------------------------------------------------------
* @return  string
+----------------------------------------------------------
* @example switch_tpl('home','index')  =>  "home/Tpl/default/index.html";
+----------------------------------------------------------
*/
function switch_tpl($app,$tpl){
	return APPS_PATH.$app.'/Tpl/default/'.$tpl.C('TMPL_TEMPLATE_SUFFIX');
}

/**
+----------------------------------------------------------
* 配合标签完成参数传值
+----------------------------------------------------------
* @access  public
* @param   string      $string      参数
+----------------------------------------------------------
* @return  array
+----------------------------------------------------------
* @example a=b&c=d  => array('a'=>'b','c'=>'d')
+----------------------------------------------------------
*/
function parseArrToStr($string){
	if( empty($string) ) return ;
	$temp = explode('&',$string);
	foreach ($temp as $key => $val){
		$_tmp = explode('=',$val);
		$return[$_tmp[0]] = $_tmp[1];
	}
	return $return;
}

/**
+----------------------------------------------------------
* 配合标签完成参数传值
+----------------------------------------------------------
* @access  public
* @param   array       $data      参数
+----------------------------------------------------------
* @return  string
+----------------------------------------------------------
* @example array('a'=>'b','c'=>'d')  =>  a=b&c=d
+----------------------------------------------------------
*/
function parseStrToArr($data){
	foreach( $data as $key=>$val ) $string .= "{$key}={$val}&";
	return $string;
}

/**
+----------------------------------------------------------
* 全站获取商品url地址
* 返回带参数的图片服务的访问地址
+----------------------------------------------------------
*/
function image_url($thumb,$width,$height,$color_code){
	if(!$thumb) return ;
	if(!$width && !$height){
		return $thumb;
	}elseif(!$width || !$height){
		$_temp = $width == '' ? "--h_{$height}" : "--w_{$width}";
	}else{
		$_temp = "--w_{$width}_h_{$height}";
	}
	$suffix = end(explode('.',$thumb));
	$img_host = C('IMG_URL');
	$key = rand()%count($img_host);
	return $img_host[$key].str_replace(".{$suffix}","{$_temp}.{$suffix}", $thumb);
}

/**
+----------------------------------------------------------
* 验证是否为正常提交表单
+----------------------------------------------------------
* @access  public
+----------------------------------------------------------
* @return  boolen
+----------------------------------------------------------
*/
function isPost(){
	return ($_SERVER['REQUEST_METHOD'] == 'POST' && (empty($_SERVER['HTTP_REFERER']) || preg_replace("/https?:\/\/([^\:\/]+).*/i", "\\1", $_SERVER['HTTP_REFERER']) == preg_replace("/([^\:]+).*/", "\\1", $_SERVER['HTTP_HOST'])));
}

/**
+----------------------------------------------------------
* 验证输入的邮件地址是否合法
+----------------------------------------------------------
* @access  public
* @param   string      $email
+----------------------------------------------------------
* @return  boolen
+----------------------------------------------------------
*/
function isEmail($email){
	$chars = "/^([a-z0-9+_]|\\-|\\.)+@(([a-z0-9_]|\\-)+\\.)+[a-z]{2,6}\$/i";
	return ( strpos($user_email, '@') !== false && strpos($user_email, '.') !== false && preg_match($chars, $user_email) ) ? true : false;
}

/**
+----------------------------------------------------------
* 验证手机号码是否合法
+----------------------------------------------------------
* @access  public
* @param   string       $mobile
+----------------------------------------------------------
* @return  boolen
+----------------------------------------------------------
*/
function isMobile($mobile){
	return ( preg_match("/^1[3,4,5,8][0-9]{9}$/",$mobile) ) ? true : false;
}

/**
+----------------------------------------------------------
* 获取IP
+----------------------------------------------------------
* @access  public
+----------------------------------------------------------
* @return  string
+----------------------------------------------------------
*/
function ip(){
	if( getenv('HTTP_CLIENT_IP') && strcasecmp(getenv('HTTP_CLIENT_IP'), 'unknown') )
		$ip = getenv('HTTP_CLIENT_IP');
	elseif( getenv('HTTP_X_FORWARDED_FOR') && strcasecmp(getenv('HTTP_X_FORWARDED_FOR'), 'unknown') )
		$ip = getenv('HTTP_X_FORWARDED_FOR');
	elseif( getenv('REMOTE_ADDR') && strcasecmp(getenv('REMOTE_ADDR'), 'unknown') )
		$ip = getenv('REMOTE_ADDR');
	elseif( isset($_SERVER['REMOTE_ADDR']) && $_SERVER['REMOTE_ADDR'] && strcasecmp($_SERVER['REMOTE_ADDR'], 'unknown') )
		$ip = $_SERVER['REMOTE_ADDR'];
	return preg_match("/[\d\.]{7,15}/", $ip, $matches) ? $matches[0] : 'unknown';
}


/**
+----------------------------------------------------------
* 资讯所用
+----------------------------------------------------------
*/
function url($id,$type,$page=1,$data='')
{
    if(empty($id)) return '';
    switch($type) {
    case 0:// 资讯首页
        return Html::getIndexUrl($id,$data);
    case 1:// 频道页
        return Html::getChannelUrl($id,$data);
    case 2:// 栏目列表页
        return Html::getCateListUrl($id,$page,$data);
    case 3:// 内容页
        return Html::getArticleUrl($id,$page,$data);
    case 4:// 栏目首页 暂时不用
        return Html::getCateIndexUrl($id,$data);
    case 5:// 公共页面
        return Html::getPublicPageUrl($id,$data);
    case 6:// 图库页面
        return Html::getPicUrl($id,$data,5279);
    case 7:// 子文档页面
        return Html::getRecordUrl($id,$data);
    case 8:// 频道列表页
        return Html::getChannelListUrl($id,$page,$data);
    case 9:
        return __APP__.'/';
    }
}

/**
+----------------------------------------------------------
* 判断数据值的字符编码是为utf8
+----------------------------------------------------------
* @access  public
* @param   string       $word
+----------------------------------------------------------
* @return  boolen
+----------------------------------------------------------
*/
function isUtf8($word) {
	return ( preg_match("/^([".chr(228)."-".chr(233)."]{1}[".chr(128)."-".chr(191)."]{1}[".chr(128)."-".chr(191)."]{1}){1}/",$word) == true || preg_match("/([".chr(228)."-".chr(233)."]{1}[".chr(128)."-".chr(191)."]{1}[".chr(128)."-".chr(191)."]{1}){1}$/",$word) == true || preg_match("/([".chr(228)."-".chr(233)."]{1}[".chr(128)."-".chr(191)."]{1}[".chr(128)."-".chr(191)."]{1}){2,}/",$word) == true ) ? true : false;
}


/*
 * 生成6位的随机数
 */
function rand_six(){
	return substr(mt_rand(pow(10,7),pow(10,8)-1),0,6);
}
/**
+----------------------------------------------------------
*  字符长度截取
+----------------------------------------------------------
*/
function utf8_substr($str, $width = 0, $end = '', $x3 = 0) {
	//global $CFG; // 全局变量保存 x3 的值
	if ($width <= 0 || $width >= strlen($str)) {
		return $str;
	}
	$arr = str_split($str);
	$len = count($arr);
	$w = 0;
	$width *= 10;
	// 不同字节编码字符宽度系数
	$x1 = 11;	// ASCII
	$x2 = 16;
	$x3 = $x3===0 ? ( $CFG['cf3']  > 0 ? $CFG['cf3']*10 : $x3 = 21 ) : $x3*10;
	$x4 = $x3;
	// http://zh.wikipedia.org/zh-cn/UTF8
	for ($i = 0; $i < $len; $i++) {
		if ($w >= $width) {
			$e = $end;
			break;
		}
		$c = ord($arr[$i]);
		if ($c <= 127) {
			$w += $x1;
		}elseif ($c >= 192 && $c <= 223) {	// 2字节头
			$w += $x2;
			$i += 1;
		}elseif ($c >= 224 && $c <= 239) {	// 3字节头
			$w += $x3;
			$i += 2;
		}elseif ($c >= 240 && $c <= 247) {	// 4字节头
			$w += $x4;
			$i += 3;
		}
	}
	return implode('', array_slice($arr, 0, $i) ). $e;
}


/**
 * 邮件发送

 *
 * @param: $name[string]        接收人姓名

 * @param: $email[string]       接收人邮件地址
 * @param: $subject[string]     邮件标题
 * @param: $content[string]     邮件内容
 * @param: $type[int]           0 普通邮件， 1 HTML邮件
 * @param: $notification[bool]  true 要求回执， false 不用回执
 *
 * @return boolean
 */
function send_mail($name, $email, $subject, $content, $type = 0, $notification=false){
	Vendor('smtp#class');
    $arr_data=D('System','home')->getMailApi();
	$smtp_cfg=array();
	foreach ($arr_data as $key=>$val){
		$smtp_cfg[$val['code']]=$val['value'];
	}
    /* 如果邮件编码不是OS_CHARSET，创建字符集转换对象，转换编码 */
    if ($smtp_cfg['mail_charset'] != 'utf8'){
        $name      = iconv('utf-8', $smtp_cfg['mail_charset'], $name);
        $subject   = iconv('utf-8', $smtp_cfg['mail_charset'], $subject);
        $content   = iconv('utf-8', $smtp_cfg['mail_charset'], $content);
        $smtp_cfg['shop_name'] = iconv('utf-8', $smtp_cfg['mail_charset'], $smtp_cfg['shop_name']);
    }
    $charset   = $smtp_cfg['mail_charset'];
    /**
     * 使用mail函数发送邮件
     */
    if ($smtp_cfg['mail_service'] == 0 && function_exists('mail')){
        /* 邮件的头部信息 */
        $content_type = ($type == 0) ? 'Content-Type: text/plain; charset=' . $charset : 'Content-Type: text/html; charset=' . $charset;
        $headers = array();
        $headers[] = 'From: "' . '=?' . $charset . '?B?' . base64_encode($smtp_cfg['shop_name']) . '?='.'" <' . $smtp_cfg['smtp_mail'] . '>';
        $headers[] = $content_type . '; format=flowed';
        if ($notification){
            $headers[] = 'Disposition-Notification-To: ' . '=?' . $charset . '?B?' . base64_encode($smtp_cfg['shop_name']) . '?='.'" <' . $smtp_cfg['smtp_mail'] . '>';
        }
        $res = @mail($email, '=?' . $charset . '?B?' . base64_encode($subject) . '?=', $content, implode("\r\n", $headers));
        if (!$res){
            $GLOBALS['err'] ->add("邮件发送失败，请与网站管理员联系！");

            return false;
        }else{
            return true;
        }
    }
    /**
     * 使用smtp服务发送邮件
     */
    else{
        /* 邮件的头部信息 */
        $content_type = ($type == 0) ?
            'Content-Type: text/plain; charset=' . $charset : 'Content-Type: text/html; charset=' . $charset;
        $content   =  base64_encode($content);
        $headers = array();
        $headers[] = 'Date: ' . gmdate('D, j M Y H:i:s') . ' +0000';
        $headers[] = 'To: "' . '=?' . $charset . '?B?' . base64_encode($name) . '?=' . '" <' . $email. '>';
        $headers[] = 'From: "' . '=?' . $charset . '?B?' . base64_encode($smtp_cfg['shop_name']) . '?='.'" <' . $smtp_cfg['smtp_mail'] . '>';
        $headers[] = 'Subject: ' . '=?' . $charset . '?B?' . base64_encode($subject) . '?=';
        list($msec,$sec)=explode(" ",microtime());
        $headers[] ="Message-ID: <".date("YmdHis", $sec).".".($msec*1000000).".".$mail_from.">";
        $headers[] = $content_type . '; format=flowed';
        $headers[] = 'Content-Transfer-Encoding: base64';
        $headers[] = 'Content-Disposition: inline';
        if ($notification){
            $headers[] = 'Disposition-Notification-To: ' . '=?' . $charset . '?B?' . base64_encode($smtp_cfg['shop_name']) . '?='.'" <' . $smtp_cfg['smtp_mail'] . '>';
        }
        /* 获得邮件服务器的参数设置 */
        $params['host'] = $smtp_cfg['smtp_host'];
        $params['port'] = $smtp_cfg['smtp_port'];
        $params['user'] = $smtp_cfg['smtp_user'];
        $params['pass'] = $smtp_cfg['smtp_pass'];

        if (empty($params['host']) || empty($params['port'])){
            // 如果没有设置主机和端口直接返回 false
            //$GLOBALS['err'] ->add('邮件服务器设置信息不完整');
			$serr_msg='邮件服务器设置信息不完整';
            return $serr_msg;
        }else{
            // 发送邮件
            if (!function_exists('fsockopen')){
                //如果fsockopen被禁用，直接返回
                //$GLOBALS['err']->add('fsockopen函数被禁用');
				$serr_msg='fsockopen函数被禁用';
 				return $serr_msg;
            }
           // include_once(ROOT_PATH . 'includes/cls_smtp.php');
            static $smtp;
            $send_params['recipients'] = $email;
            $send_params['headers']    = $headers;
            $send_params['from']       = $smtp_cfg['smtp_mail'];
            $send_params['body']       = $content;
            if (!isset($smtp)){
                $smtp = new smtp($params);
            }
            if ($smtp->connect() && $smtp->send($send_params)){
                return true;
            }else{
                $err_msg = $smtp->error_msg();
                if (empty($err_msg)){
                   // $GLOBALS['err']->add('Unknown Error');
                   return 'Unknown Error';
                }else{
                    if (strpos($err_msg, 'Failed to connect to server') !== false){
                     $serr_msg= sprintf('无法连接到邮件服务器 %s', $params['host'] . ':' . $params['port']);
                    }else if (strpos($err_msg, 'AUTH command failed') !== false){
                      $serr_msg= '邮件服务器验证帐号或密码不正确';
                    }elseif (strpos($err_msg, 'bad sequence of commands') !== false){
                       $serr_msg='服务器拒绝发送该邮件' ;
                    }else{
                       $serr_msg =$err_msg;
                    }
                }
                return false;
            }
        }
    }
}




/** 获取当前时间戳，精度可维护 */
function microtime_str($intfal='0'){
   list($usec, $sec) = explode(" ", microtime());
   $rtstr = $sec.intval($usec*$intfal);
   if(strlen($rtstr)<16){
		$rtstr=str_pad($rtstr,16,0,STR_PAD_RIGHT);
   }
   return $rtstr;
}

/**
+----------------------------------------------------------
* 直接导入
+----------------------------------------------------------
*/
alias_import(
            array
            (
                     'mc_session'  =>  VENDOR_PATH.'/mc_session.class.php',
                     'BaseAction'  =>  VENDOR_PATH.'/BaseAction.class.php',
                     'BaseModel'   =>  VENDOR_PATH.'/BaseModel.class.php',
                     'Build'       =>  VENDOR_PATH.'/Build.class.php',
                     'Html'        =>  VENDOR_PATH.'/Html.class.php',
                     /*添加支付配置*/
                     'alipay'      =>  VENDOR_PATH.'/class.alipay.php',
                     'kuaiqian'    =>  VENDOR_PATH.'/class.kuaiqian.php',
                     'chinapnr'    =>  VENDOR_PATH.'/class.chinapnr.php',
                     'tenpay'      =>  VENDOR_PATH.'/class.tenpay.php',
                     'chinapay'    =>  VENDOR_PATH.'/class.chinapay.php',
                     'cmbchina'    =>  VENDOR_PATH.'/class.cmbchina.php',
                     'paypal'      =>  VENDOR_PATH.'/class.paypal.php',
                     'Flexihash'   =>  VENDOR_PATH.'/class.Flexihash.php',
                     /*SQL解析器*/
                     'pay'         =>  VENDOR_PATH.'/class.pay.php',
                     'CreateOrder' =>  VENDOR_PATH.'/CreateOrder.class.php'
            )
);



/**
+----------------------------------------------------------
* 加载缓存配置
+----------------------------------------------------------
*/
function loadCache($name){
    define('_AppsCache',RUNTIME_PATH.'_AppsCache/');
    switch(strtoupper(C('CACHE_TYPE'))){
        case 'DB':// 数据库缓存
            $cache   =  dbCache($name);
            break;
        case 'XCACHE':// Xcache缓存
            $cache  =  xcache($name);
            break;
        case 'FILE':// 文件缓存
        default:
            if(!is_dir(_AppsCache)){
                mkdir(_AppsCache,0777,true);
            }
            $cache	=	include _AppsCache.'~'.$name.'.php';
            break;
    }
    return $cache;
}
/**
+----------------------------------------------------------
* 文档状态过滤 自动判断当前是否预览模式
+----------------------------------------------------------
*/
function filterStatus(){
    return PREVIEW ? array(1,2,'or'):1;
}


/**
+----------------------------------------------------------
* 分页封装
* $pages 页码总数
* $spaer  分页参数 默认page
* $showpage 当前显示 1,2,3，4数字
* $showdetail 分页形式
* $currpage 默认当前页
* $post post 查询条件
* $pseudoStatic 是否启用伪静态,1:启用,0:不启用
*
+----------------------------------------------------------
*/
function split_page($pages,$sper,$showpage=8,$showdetail=0,$currpage=1,$post=array(),$pseudoStatic=0){
	if( $pages <= 1 ) return '';
	$p = !empty($sper) ? $sper : 'page';
	$currpage = empty($_GET[$p]) ? $currpage : ( intval($_GET[$p]) <= 0 || intval($_GET[$p]) > $pages ) ? $currpage : intval($_GET[$p]);
	$currpage = $currpage > $pages ? $pages : $currpage;
	$url =  $_SERVER['REQUEST_URI'].( substr(strstr($_SERVER['REQUEST_URI'],'?'),1) ? '' : "?{$p}=" );
	$parse =  parse_url($url);
	if( isset($parse['query']) ){
		parse_str(ltrim($parse['query'],'?'),$params); unset($params[$p]);
		//$_POST查询条件跟url中的条件是否有交集
		if( !array_intersect_key($params,$post) ) $params = array_merge($params,$post);
		$pg = ( empty($params) ? '' : '&' ) . "{$p}=\$i";
		$url = $parse['path'] . '?' . http_build_query($params) . $pg;
	}
	//启用伪静态时改变url
	if( $pseudoStatic == '1' ){
		$pathArr = explode('.',$parse['path']);
		$path = ( ( strpos( $pathArr[0],"{$p}_" ) ) ? preg_replace("/{$p}_([\s\S]+)/","{$p}_\$i",$pathArr[0]) : "{$pathArr[0]}_cp_\$i" ) . ".{$pathArr[1]}";
		$url = strtr($url,array($parse['path']=>$path,'?'.$pg=>'','&'.$pg=>'',$pg=>''));
	}
	$upRow = $currpage - 1;$downRow = $currpage + 1;$page_str = ''; $upPage = ''; $downPage = '';$pagestr = '';
	//上一页,下一页
	if(  $upRow > 0 ){
		$upClass = ( $showdetail == 1 ) ? 'btn-prev' : ( ( $showdetail == 2 ) ? 'prevPage' : '' );
		$upPage = "<a href='".( ( $upRow > 0 ) ? strtr($url,array('$i'=>$upRow)) : '#' )."' class='{$upClass}' >".( $showdetail == 1 ? '上一页' : '' )."</a>";
	}
	if( $upRow < 1 && $showdetail == 2 ) $upPage = "<span class='noprevPage'>".( $showdetail == 1 ? '上一页' : '' )."</span>";
	if(  $downRow <= $pages ){
		$downClass = ( $showdetail == 1 ) ? 'btn-next' : ( ( $showdetail == 2 ) ? 'nextPage' : '' );
		$downPage = "<a href='".( ( $downRow <= $pages ) ? strtr($url,array('$i'=>$downRow)) : '#' )."'  class='{$downClass}' >下一页</a>";
	}
	if( $downRow > $pages  && $showdetail == 2 ) $downPage = "<span class='nonextPage'>下一页</span>";
	//取得分页的起始位置
	$start_page = ( $currpage < $showpage ) ? 1 : ( ( $currpage > $pages - $showpage ) ? ( $pages - $showpage + 1 ) : $currpage );
	$end_page = ( $start_page + $showpage) > $pages ? $pages: ( $currpage < $showpage ? $showpage : ( $start_page + $showpage - 1 ) );
	//生成1,2,3,4....
	for( $i = $start_page;$i <= $end_page;$i++ ){
		$is_curr = ( $i == $currpage ) ? 'class="currentPage"' : 'class="pageNum"';
		$pagestr .= "<a href='".strtr($url,array('$i'=>$i))."' {$is_curr} >{$i}</a>";
	}
	//第一页，最后一页
	$first_page = ( $start_page > 1 ) ? "<a href='".strtr($url,array('$i'=>1))."' class='pageNum'>1</a><em>...</em>" : '';
	$end_page = ( $end_page + 1 ) <= $pages ? "<em>...</em><a href='".strtr($url,array('$i'=>$pages))."' page='{$pages}' class='pageNum'>{$pages}</a>" : '';
	if( $showdetail == 1 ){
		$page_str = ( $pages > $showpage ) ? "<form action='".strtr($url,array("_{$p}_\$i"=>''))."' method='get' name='gofind' style='display:inline' onSubmit='return isValid(this);' >" : '';
		$page_str .= $upPage.$first_page.$pagestr.$end_page.$downPage;
		$page_str .= "<span>共 {$pages} 页</span>";
		if( $pages > $showpage ){
			$page_str .= "  到第<input name='{$p}' type='text' class='spage_input' />页";
			foreach ($params as $key => $val){
				$page_str .= "<input name='{$key}' type='hidden' value='{$val}' />";
			}
			$page_str .= "<input type='submit' value='Go' class='input-num'></form>";
		}
	}elseif( $showdetail == 2 ){
		$page_str = "{$upPage}<span>{$currpage}/{$pages}</span>{$downPage}";
	}else{
		$page_str = $upPage.$first_page.$pagestr.$end_page.$downPage;
	}
	return $page_str;
}



function split_page_ajax($pages, $type, $id, $showpage=8, $currpage=1) {
	if($pages<=1) return "　";
	$currpage = $currpage>$pages ? $pages : $currpage;
    $upRow   = $currpage-1;
    $downRow = $currpage+1;
    $page_str= '';
    $upPage ='';
    $downPage = '';
    if ($upRow>0){
        $upPage = "<a onclick='ajaxGetList(\"" . $type ."\", \"" . $id . "\", \"" . $upRow . "\", \"" . $pages . "\")' class='btn-prev'>上一页</a>";
    }
    if ($downRow <= $pages){
        $downPage = "<a onclick='ajaxGetList(\"" . $type ."\", \"" . $id . "\", \"" . $downRow . "\", \"" . $pages . "\")' class='btn-next'>下一页</a>";
    }
    //取得分页的起始位置
    $start_page = ($currpage<$showpage) ? 1 : (($currpage>$pages-$showpage) ? ($pages-$showpage+1) : $currpage);
    $end_page   = ($start_page+$showpage)>$pages ? $pages : ($currpage<$showpage ? $showpage : ($start_page+$showpage-1));
    //生成1,2,3,4....
    $pagestr = '';
    for($i=$start_page;$i<=$end_page;$i++){
        $is_curr  = ($i==$currpage) ? "class='currentPage'" : "class='pageNum'";
        $pagestr .= "<a onclick='ajaxGetList(\"" . $type ."\", \"" . $id . "\", \"" . $i . "\", \"" . $pages . "\")'" . $is_curr . ">{$i}</a>";
    }
    //第一页，最后一页
    $first_page = ($start_page>1) ? "<a onclick='ajaxGetList(\"" . $type ."\", \"" . $id . "\", \"1\", \"" . $pages . "\")' class='pageNum'>1</a><em>...</em>" : '';
    $end_page = ($end_page+1)<=$pages ? "<em>...</em><a onclick='ajaxGetList(\"" . $type ."\", \"" . $id . "\", \"" . $pages . "\", \"" . $pages . "\")' class='pageNum'>{$pages}</a>":'';

    $page_str .=$upPage.$first_page.$pagestr.$end_page.$downPage;
    //$page_str .= '<span>共 '.$pages.'</span> 页  / 当前第 <b>'.$currpage.'</b> 页';
	$page_str .= '<span>共 '.$pages.' 页</span>';
    return $page_str;
}

function checkstrlength($str,$length){
	if(strlen($str)<=$length*2)return $str;
	$restr = '';
	for($i=0;$i< $length*3;$i++) {
	$restr .= ord($str[$i])>127 ? $str[$i].$str[++$i].$str[++$i] : $str[$i];
	}
    return $restr;
}

/**
+----------------------------------------------------------
* 简单XML输出
+----------------------------------------------------------
* @access  public
* @param   array        $params      参数
+----------------------------------------------------------
* @return  string
+----------------------------------------------------------
* @example 
+----------------------------------------------------------
*/
function simpleXmlWrite($params){
	if( empty($params) || !is_array($params) ) return;
	@header("Expires: -1");
	@header("Cache-Control: no-store, private, post-check=0, pre-check=0, max-age=0", FALSE);
	@header("Pragma: no-cache");
	@header("Content-type: application/xml; charset=utf-8");
	$outXml .= "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n";
	$outXml .= "<root>\n";
	foreach( $params as $k=>$v ) $outXml .= "<{$k}>{$v}</{$k}>\n";
	$outXml .= "</root>\n";
	die($outXml);
}

/**
+----------------------------------------------------------
*  分类树
+----------------------------------------------------------
*/
function list_to_tree($list, $pk='id',$pid = 'pid',$child = '_child',$root=0){
	// 创建Tree
	$tree = array();
	if( is_array($list) ) {
		// 创建基于主键的数组引用
		$refer = array();
		foreach ($list as $key => $data) {
			$refer[$data[$pk]] =& $list[$key];
		}
		foreach ($list as $key => $data) {
			// 判断是否存在parent
			$parentId = $data[$pid];
			if ($root == $parentId) {
				$tree[] =& $list[$key];
			}else{
				if (isset($refer[$parentId])) {
					$parent =& $refer[$parentId];
					$parent[$child][] =& $list[$key];
				}
			}
		}
	}
	return $tree;
}

/**
+----------------------------------------------------------
* 字符串转字符串
+----------------------------------------------------------
* @access  public
* @param   string       $string      参数
* @param   string       $sper        连接符
* @param   string       $tper        分割符
+----------------------------------------------------------
* @return  string
+----------------------------------------------------------
* @example a,b,c,d => a','b','c','d
+----------------------------------------------------------
*/
function strToStr($string,$sper="'",$tper=","){
    return implode("{$sper},{$sper}",explode($tper,$string));
}

/**
+----------------------------------------------------------
* 加密解密
+----------------------------------------------------------
*/
function authcode($string, $operation = 'DECODE', $key = '', $expiry = 0){

	$ckey_length = 4;
	$key  = md5($key ? $key : C('AUTH_KEY'));
	$keya = md5(substr($key, 0, 16));
	$keyb = md5(substr($key, 16, 16));
	$keyc = $ckey_length ? ($operation == 'DECODE' ? substr($string, 0, $ckey_length): substr(md5(microtime()), -$ckey_length)) : '';

	$cryptkey = $keya.md5($keya.$keyc);
	$key_length = strlen($cryptkey);

	$string = $operation == 'DECODE' ? base64_decode(substr($string, $ckey_length)) : sprintf('%010d', $expiry ? $expiry + time() : 0).substr(md5($string.$keyb), 0, 16).$string;
	$string_length = strlen($string);

	$result = '';
	$box = range(0, 255);

	$rndkey = array();
	for($i = 0; $i <= 255; $i++) {
		$rndkey[$i] = ord($cryptkey[$i % $key_length]);
	}

	for($j = $i = 0; $i < 256; $i++) {
		$j = ($j + $box[$i] + $rndkey[$i]) % 256;
		$tmp = $box[$i];
		$box[$i] = $box[$j];
		$box[$j] = $tmp;
	}

	for($a = $j = $i = 0; $i < $string_length; $i++) {
		$a = ($a + 1) % 256;
		$j = ($j + $box[$a]) % 256;
		$tmp = $box[$a];
		$box[$a] = $box[$j];
		$box[$j] = $tmp;
		$result .= chr(ord($string[$i]) ^ ($box[($box[$a] + $box[$j]) % 256]));
	}

	if($operation == 'DECODE') {
		if((substr($result, 0, 10) == 0 || substr($result, 0, 10) - time() > 0) && substr($result, 10, 16) == substr(md5(substr($result, 26).$keyb), 0, 16)) {
			return substr($result, 26);
		} else {
			return '';
		}
	} else {
		return $keyc.str_replace('=', '', base64_encode($result));
	}
}


	//取得当前时间
	function gmtime(){
		return (time() - date('Z'));
	}


	/*
	 * 设定出生年，月，日列表值
	 */
	function getBirthdayYearList(){
		$start_year=1910;
		$end_year=mydate('Y');
		$index=$start_year;
		$year_list=array();
		for($index=$start_year;$index<=$end_year;$index++){
			$year_list[$index]=$index;
		}
		return $year_list;
	}
	function getBirthdayMonthList(){
		$start_month=1;
		$end_month=12;
		$month_list=array();
		for($i=$start_month;$i<=$end_month;$i++){
			$i=sprintf("%02d",$i);
			$month_list[$i]=$i;
		}
		return $month_list;
	}
	function getBirthdayDayList(){
		$start_day=1;
		$end_day=31;
		$day_list=array();
		for($i=$start_day;$i<=$end_day;$i++){
			$i=sprintf("%02d",$i);
			$day_list[$i]=sprintf("%02d",$i);
		}
		return $day_list;
	}
	function unique_arr($array2D,$stkeep=false,$ndformat=true){
        if($stkeep) $stArr = array_keys($array2D);
        if($ndformat) $ndArr = array_keys(end($array2D));
        foreach ($array2D as $v){
            $v = join(",",$v);
            $temp[] = $v;
        }
        $temp = array_unique($temp);
        foreach ($temp as $k => $v){
            if($stkeep) $k = $stArr[$k];
            if($ndformat){
                $tempArr = explode(",",$v);
                foreach($tempArr as $ndkey => $ndval) $output[$k][$ndArr[$ndkey]] = $ndval;
            }
            else $output[$k] = explode(",",$v);
        }
        return $output;
    }

/**
+----------------------------------------------------------
* 全角转半角
+----------------------------------------------------------
* @access  public
* @param   string       $str      参数
+----------------------------------------------------------
* @return  string
+----------------------------------------------------------
* @example make_semiangle('０')  =>  0
+----------------------------------------------------------
*/
function make_semiangle($str){
	$arr = array(
		'０' => '0', '１' => '1', '２' => '2', '３' => '3', '４' => '4',
		'５' => '5', '６' => '6', '７' => '7', '８' => '8', '９' => '9',
		'Ａ' => 'A', 'Ｂ' => 'B', 'Ｃ' => 'C', 'Ｄ' => 'D', 'Ｅ' => 'E',
		'Ｆ' => 'F', 'Ｇ' => 'G', 'Ｈ' => 'H', 'Ｉ' => 'I', 'Ｊ' => 'J',
		'Ｋ' => 'K', 'Ｌ' => 'L', 'Ｍ' => 'M', 'Ｎ' => 'N', 'Ｏ' => 'O',
		'Ｐ' => 'P', 'Ｑ' => 'Q', 'Ｒ' => 'R', 'Ｓ' => 'S', 'Ｔ' => 'T',
		'Ｕ' => 'U', 'Ｖ' => 'V', 'Ｗ' => 'W', 'Ｘ' => 'X', 'Ｙ' => 'Y',
		'Ｚ' => 'Z', 'ａ' => 'a', 'ｂ' => 'b', 'ｃ' => 'c', 'ｄ' => 'd',
		'ｅ' => 'e', 'ｆ' => 'f', 'ｇ' => 'g', 'ｈ' => 'h', 'ｉ' => 'i',
		'ｊ' => 'j', 'ｋ' => 'k', 'ｌ' => 'l', 'ｍ' => 'm', 'ｎ' => 'n',
		'ｏ' => 'o', 'ｐ' => 'p', 'ｑ' => 'q', 'ｒ' => 'r', 'ｓ' => 's',
		'ｔ' => 't', 'ｕ' => 'u', 'ｖ' => 'v', 'ｗ' => 'w', 'ｘ' => 'x',
		'ｙ' => 'y', 'ｚ' => 'z',
		'（' => '(', '）' => ')', '〔' => '[', '〕' => ']', '【' => '[',
		'】' => ']', '〖' => '[', '〗' => ']', '“' => '"', '”' => '"',
		'‘' => '\'', '’' => '\'', '｛' => '{', '｝' => '}', '《' => '<',
		'》' => '>',
		'％' => '%', '＋' => '+', '—' => '-', '－' => '-',
		'：' => ':', '。' => '.', '、' => '\\', '，' => ',',
		'；' => ';', '？' => '?', '！' => '!', '……' => '^', '‖' => '|',
		'｜' => '|', '〃' => '"', '·'=>'`','～'=>'~',
		'　' => ' ','＄'=>'$','＠'=>'@','＃'=>'#','＾'=>'^','＆'=>'&','＊'=>'*',
		'＂'=>'"');
	return strtr($str, $arr);
}


/**
+----------------------------------------------------------
* 判断一个字符是否包含繁体
+----------------------------------------------------------
*/
function isbig5str($str) {
	for($i=0; $i<mb_strlen($str, 'UTF-8'); $i++) {
		$code = mb_substr($str, $i, 1, 'UTF-8');
		if(@iconv('utf-8', 'gb2312', $code) == '') {
			return true;
		}
	}
	return false;
}

    /**
    +----------------------------------------------------------
    | xss
    +----------------------------------------------------------
    */
    function remove_xss($val){
       $val    = preg_replace('/([\x00-\x08,\x0b-\x0c,\x0e-\x19])/', '', $val);
       $search = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&*()~`";:?+/={}[]-_|\'\\';

       for($i = 0; $i < strlen($search); $i++){
          $val = preg_replace('/(&#[xX]0{0,8}'.dechex(ord($search[$i])).';?)/i', $search[$i], $val); // with a ;
          $val = preg_replace('/(&#0{0,8}'.ord($search[$i]).';?)/', $search[$i], $val);
       }

       // now the only remaining whitespace attacks are \t, \n, and \r
       $ra1 = array
             (
                'javascript', 'vbscript', 'expression', 'applet', 'meta', 'xml', 'blink', 'link', 'style', 'script',
                'embed', 'object', 'iframe', 'frame', 'frameset', 'ilayer', 'layer', 'bgsound', 'title', 'base'
             );
       $ra2 = array
             (
                'onabort', 'onactivate', 'onafterprint', 'onafterupdate', 'onbeforeactivate', 'onbeforecopy', 'onbeforecut',
                'onbeforedeactivate', 'onbeforeeditfocus', 'onbeforepaste', 'onbeforeprint', 'onbeforeunload', 'onbeforeupdate',
                'onblur', 'onbounce', 'oncellchange', 'onchange', 'onclick', 'oncontextmenu', 'oncontrolselect', 'oncopy', 'oncut',
                'ondataavailable', 'ondatasetchanged', 'ondatasetcomplete', 'ondblclick', 'ondeactivate', 'ondrag', 'ondragend', 'ondragenter', 'ondragleave', 'ondragover', 'ondragstart', 'ondrop', 'onerror', 'onerrorupdate', 'onfilterchange', 'onfinish', 'onfocus',
                'onfocusin', 'onfocusout', 'onhelp', 'onkeydown', 'onkeypress', 'onkeyup', 'onlayoutcomplete', 'onload', 'onlosecapture',
                'onmousedown', 'onmouseenter', 'onmouseleave', 'onmousemove', 'onmouseout', 'onmouseover', 'onmouseup', 'onmousewheel', 'onmove', 'onmoveend', 'onmovestart', 'onpaste', 'onpropertychange', 'onreadystatechange', 'onreset', 'onresize', 'onresizeend', 'onresizestart', 'onrowenter', 'onrowexit', 'onrowsdelete', 'onrowsinserted', 'onscroll', 'onselect', 'onselectionchange', 'onselectstart', 'onstart', 'onstop', 'onsubmit', 'onunload'
             );
       $ra = array_merge($ra1, $ra2);

       $found = true;
       while($found == true){
          $val_before = $val;
          for($i = 0; $i < sizeof($ra); $i++){
             $pattern = '/';
             for($j = 0; $j < strlen($ra[$i]); $j++){
                if ($j > 0){
                   $pattern .= '(';
                   $pattern .= '(&#[xX]0{0,8}([9ab]);)';
                   $pattern .= '|';
                   $pattern .= '|(&#0{0,8}([9|10|13]);)';
                   $pattern .= ')*';
                }
                $pattern .= $ra[$i][$j];
             }
             $pattern .= '/i';
             $replacement = substr($ra[$i], 0, 2).'<x>'.substr($ra[$i], 2); // add in <> to nerf the tag
             $val = preg_replace($pattern, $replacement, $val); // filter out the hex tags
             if ($val_before == $val){
                $found = false;
             }
          }
       }
       return $val;
    }

    /**
    +----------------------------------------------------------
    |  filter_param
    +----------------------------------------------------------
    */
    function filter_param(){
       foreach($_REQUEST as $_k => $_v){
            $rs = daddslashes(urldecode($_v));
            $_REQUEST[$_k] = $rs;
            if(array_key_exists($_k,$_POST)){
                $_POST[$_k] = $rs;
            }
            if(array_key_exists($_k,$_GET)){
                $_GET[$_k] = $rs;
            }
       }
    }
    /**
    +----------------------------------------------------------
    | 字符转义
    +----------------------------------------------------------
    */
    function daddslashes($string){
        if(is_array($string)){
    		$keys = array_keys($string);
    		foreach($keys as $key){
    			$val = $string[$key];
    			unset($string[$key]);
    			$string[$key] = daddslashes($val);
    		}
    	}else{
    		$string = sql_replace($string);
    	}
        $domain = array_slice(explode('.',$_SERVER['HTTP_HOST']),0,-2);
        $domain = $domain[0];
        return (MODULE_NAME=='Search' || $domain=='search') ? str_ireplace('   ','',$string) : $string;
    }
    /**
    +----------------------------------------------------------
    | sql 关键字过滤 '\t','\n','\r',  ' ""  '>','<',
    +----------------------------------------------------------
    */
    function sql_replace($value){
        $value= MAGIC_QUOTES_GPC == true ? stripslashes($value): addslashes($value);
        $str  = array(
                      'insert','delete','update','select','drop','create','modify','rename','alter','sleep','where','union','join','like',
                      'execute','count' ,'and','load_file','outfile','from','case','then','else','1=1','when','%20','"',"'",'>','<',
                      '--','*/','/*','*','script'
                     );
        $show  = array();
        $value = strip_tags($value);
        $callback = (trim(str_ireplace($str,$show, $value)));
        return $callback;
    }


?>
