<?php
//+---------------------------------------
//|  系统公共函数库
//+---------------------------------------

/**
+----------------------------------------------------------
* 网站url地址
+----------------------------------------------------------
* @access  public
* @param   str      $type      类型：www,act,member,api等
+----------------------------------------------------------
* @return  str
+----------------------------------------------------------
* @example domain('www')  =>  "http://www.altilaphp.com";
+----------------------------------------------------------
*/
function domain($type){
	$url = C('APP_SUB_DOMAIN_DEPLOY') ? "http://" . strtolower($type) . "." . C('DOMAIN') : ( $type == 'www' ? "http://{$type}." . C('DOMAIN') : "http://www." . C('DOMAIN') . "/" . ucfirst($type) );
	return $url;
}

/**
+----------------------------------------------------------
* 主题模板切换
+----------------------------------------------------------
* @access  public
* @param   str      $app      子项目名
* @param   str      $tpl      模板名称
+----------------------------------------------------------
* @return  str
+----------------------------------------------------------
* @example switch_tpl('分组名','主题名@模块名/操作名')
+----------------------------------------------------------
*/
function switch_tpl($app,$tpl){
	$_tpl = ( strpos($tpl,'@') ) ? strtr($tpl,array('@'=>'/')) : "default/{$tpl}";
	return APP_PATH.C('APP_GROUP_PATH')."/{$app}/Tpl/{$_tpl}".C('TMPL_TEMPLATE_SUFFIX');
}

/**
+----------------------------------------------------------
* 配合标签完成参数传值
+----------------------------------------------------------
* @access  public
* @param   str      $string      参数
+----------------------------------------------------------
* @return  arr
+----------------------------------------------------------
* @example a=b&c=d  => array('a'=>'b','c'=>'d')
+----------------------------------------------------------
*/
function parse_string ( $string ) {
	if( empty($string) ) return ;
	$return = array();
	$temp = explode('&',$string);
	foreach ( $temp as $key => $val ) {
		$_tmp = explode('=',$val);
		if( $_tmp[0] != '' && $_tmp[1] != '' ) 
			$return[$_tmp[0]] = $_tmp[1];
	}
	return $return;
}

/**
+----------------------------------------------------------
* 配合标签完成参数传值
+----------------------------------------------------------
* @access  public
* @param   arr       $data      参数
+----------------------------------------------------------
* @return  str
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
* 获取url地址
+----------------------------------------------------------
*/
function getUrl( $type, $list = '' ){
	switch( $type ){
	case 'ArticleInfo' :
		$url = domain('www') . "/ArticleInfo/{$list[getModelPk("Home/{$type}")]}";
		break;
	case 'ArticleCategory' :
		$url = domain('www') . "/ArticleCategory/{$list[getModelPk("Home/{$type}")]}_1";
		break;
	case '1' :
		$url = domain('www') . "/ArticleCategory/{$list['smid']}_1";
		break;
	case 'SiteMap' :
		$url = domain('www') . "/SiteMap";
		break;
	case 'BlogInfo' :
		$url = domain('Blog') . "/BlogInfo/{$list[getModelPk("Blog/{$type}")]}";
		break;
	case 'BlogCategory' :
		$url = domain('Blog') . "/BlogCategory/{$list[getModelPk("Blog/{$type}")]}_1";
		break;
	case '4' :
		$url = domain('Blog') . "/BlogCategory/{$list['smid']}_1";
		break;
	case 'BlogTag' :
		$url = domain('Blog') . "/BlogTag/" . urlencode($list);
		break;
	case 'ProductInfo' :
		$url = domain('Product') . "/ProductInfo/{$list[getModelPk("Product/{$type}")]}";
		break;
	case 'ProductCategory' :
		$url = domain('Product') . "/ProductCategory/{$list[getModelPk("Product/{$type}")]}_1";
		break;
	case '3' :
		$url = domain('www') . "/Product/ProductCategory/{$list['smid']}_1";
		break;
	}
	return $url . C('TMPL_TEMPLATE_SUFFIX');
}

/**
+----------------------------------------------------------
* 验证是否为正常提交表单
+----------------------------------------------------------
* @access  public
+----------------------------------------------------------
* @return  boo
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
* @param   str      $email
+----------------------------------------------------------
* @return  boo
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
* @param   str       $mobile
+----------------------------------------------------------
* @return  boo
+----------------------------------------------------------
*/
function isMobile($mobile){
	return ( preg_match("/^1[3,4,5,8][0-9]{9}$/",$mobile) ) ? true : false;
}

/**
+----------------------------------------------------------
* 判断数据值的字符编码是为utf8
+----------------------------------------------------------
* @access  public
* @param   str       $word
+----------------------------------------------------------
* @return  boo
+----------------------------------------------------------
*/
function isUtf8($word) {
	return ( preg_match("/^([".chr(228)."-".chr(233)."]{1}[".chr(128)."-".chr(191)."]{1}[".chr(128)."-".chr(191)."]{1}){1}/",$word) == true || preg_match("/([".chr(228)."-".chr(233)."]{1}[".chr(128)."-".chr(191)."]{1}[".chr(128)."-".chr(191)."]{1}){1}$/",$word) == true || preg_match("/([".chr(228)."-".chr(233)."]{1}[".chr(128)."-".chr(191)."]{1}[".chr(128)."-".chr(191)."]{1}){2,}/",$word) == true ) ? true : false;
}

/**
+----------------------------------------------------------
* 判断字符中是否包含繁体
+----------------------------------------------------------
* @access  public
* @param   str       $str
+----------------------------------------------------------
* @return  boo
+----------------------------------------------------------
*/
function isbig5str($str) {
	for( $i=0; $i<mb_strlen($str, 'UTF-8'); $i++ ) {
		$code = mb_substr($str, $i, 1, 'UTF-8');
		if( @iconv('utf-8', 'gb2312', $code) == '' ) {
			return true;
		}
	}
	return false;
}

/**
+----------------------------------------------------------
* 邮件发送
+----------------------------------------------------------
* @access  public
* @param: $name[string]        接收人姓名
* @param: $email[string]       接收人邮件地址
* @param: $subject[string]     邮件标题
* @param: $content[string]     邮件内容
* @param: $type[int]           0 普通邮件， 1 HTML邮件
* @param: $notification[bool]  true 要求回执， false 不用回执
+----------------------------------------------------------
* @return  boolen
+----------------------------------------------------------
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
* 分页封装
+----------------------------------------------------------
* @access  public
* @param   int      $pages 页码总数
* @param   int      $showdetail 分页形式
* @param   int      $pseudoStatic 是否启用伪静态,1:启用,0:不启用
* @param   str      $spaer  分页参数 默认cp
* @param   int      $showpage 当前显示 1,2,3，4数字
* @param   int      $currpage 默认当前页
* @param   arr      $post post 查询条件
+----------------------------------------------------------
* @return  boo
+----------------------------------------------------------
*/
function split_page ( $pages, $showdetail = 0, $pseudoStatic = 1, $sper = 'cp', $showpage = 8, $currpage = 1, $post = array() ) {
	if( $pages <= 1 ) return '';
	$currpage = ( empty($_GET[$sper]) || intval($_GET[$sper]) <= 0 ) ? $currpage : (  intval($_GET[$sper]) > $pages ? $pages : intval($_GET[$sper]) );
	$parse =  parse_url($_SERVER['REQUEST_URI']);
	if( isset($parse['query']) ){
		parse_str(ltrim($parse['query'],'?'),$params); unset($params[$sper]);
		//$_POST查询条件跟url中的条件是否有交集
		if( !array_intersect_key($params,$post) ) $params = array_merge($params,$post);
	}
	$url = preg_replace("/_([\s\S]+)".C('TMPL_TEMPLATE_SUFFIX')."/","_\$i".C('TMPL_TEMPLATE_SUFFIX'),$parse['path']) . ( !empty($params) ? "?".http_build_query($params) : "" );
	if( $pseudoStatic != 1 ) $url = "{$parse['path']}?{$sper}=\$i" . ( !empty($params) ? "&".http_build_query($params) : "" );
	$upRow = $currpage - 1;$downRow = $currpage + 1;$page_str = ''; $upPage = ''; $downPage = '';$pagestr = '';
	//上一页,下一页
	$upPage = ( $upRow > 0 ) ? "<a href='".strtr($url,array('$i'=>$upRow))."' class='prevPage' >上一页</a>" : "<span class='noprevPage'>上一页</span>";
	$downPage = ( $downRow <= $pages ) ? "<a href='".strtr($url,array('$i'=>$downRow))."' class='nextPage' >下一页</a>" : "<span class='nonextPage'>下一页</span>";
	//取得分页的起始位置
	$start_page = ( $currpage < $showpage ) ? 1 : ( ( $currpage > $pages - $showpage ) ? ( $pages - $showpage + 1 ) : $currpage );
	$end_page = ( $start_page + $showpage) > $pages ? $pages: ( $currpage < $showpage ? $showpage : ( $start_page + $showpage - 1 ) );
	//生成1,2,3,4....
	for( $i = $start_page;$i <= $end_page;$i++ ){
		$is_curr = ( $i == $currpage ) ? 'currentPage' : 'pageNum';
		$pagestr .= "<a href='".strtr($url,array('$i'=>$i))."' class='{$is_curr}' >{$i}</a>";
	}
	//首页,尾页
	$first_page = ( $start_page > 1 ) ? "<a href='".strtr($url,array('$i'=>1))."' class='pageNum'>1</a><em>...</em>" : "";
	$end_page = ( $end_page + 1 ) <= $pages ? "<em>...</em><a href='".strtr($url,array('$i'=>$pages))."' page='{$pages}' class='pageNum'>{$pages}</a>" : "";
	//组合样式
	if( $showdetail == 1 ){
		$page_str = ( $pages > $showpage ) ? "<form action='".strtr($url,array("_\$i".C('TMPL_TEMPLATE_SUFFIX')=>C('TMPL_TEMPLATE_SUFFIX')))."' method='get' name='gofind' style='display:inline' onSubmit='return isValid(this);' >" : '';
		$page_str .= "{$first_page}{$upPage}{$pagestr}{$downPage}{$end_page}<span>共 {$pages} 页</span>";
		if( $pages > $showpage ){
			$page_str .= "  到第<input name='{$sper}' type='text' class='spage_input' />页";
			foreach ($params as $key => $val){
				$page_str .= "<input name='{$key}' type='hidden' value='{$val}' />";
			}
			$page_str .= "<input type='submit' value='Go' class='input-num'></form>";
		}
	}elseif( $showdetail == 2 )
		$page_str = "{$upPage}<span>{$currpage}/{$pages}</span>{$downPage}";
	else
		$page_str = "{$first_page}{$upPage}{$pagestr}{$downPage}{$end_page}<span>共 {$pages} 页</span>";
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
* @param   arr        $params      参数
+----------------------------------------------------------
* @return  str
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
* 分类树
+----------------------------------------------------------
* @access  public
* @param   arr      $list      数据
* @param   str      $pk        主键名
* @param   str      $pid       子集ID
* @param   str      $child     子项目名
* @param   int      $root      层级
+----------------------------------------------------------
* @return  arr
+----------------------------------------------------------
*/
function list_to_tree( $list, $pk='id', $pid='parent_id', $child='_child', $root=0 ){
	// 创建Tree
	$tree = array();
	if( !is_array($list) )
		return $tree;
	// 创建基于主键的数组引用
	$refer = array();
	foreach ( $list as $key => $data ) {
		$refer[$data[$pk]] =& $list[$key];
	}
	foreach ( $list as $key => $data ) {
		// 判断是否存在parent
		$parentId = $data[$pid];
		if ( $root == $parentId ) {
			$tree[] =& $list[$key];
		}else{
			if ( isset($refer[$parentId]) ) {
				$parent =& $refer[$parentId];
				$parent[$child][] =& $list[$key];
			}
		}
	}
	return $tree;
}

/**
+----------------------------------------------------------
* 自动转换字符集 支持数组转换
+----------------------------------------------------------
* @access  public
* @param   str      $fContents  字符串
* @param   str      $from       源
* @param   str      $to         终
+----------------------------------------------------------
* @return  arr
+----------------------------------------------------------
*/
function auto_charset( $fContents, $from, $to ) {
	$from = strtoupper($from)=='UTF8' ? 'utf-8' : $from;
	$to = strtoupper($to)=='UTF8' ? 'utf-8' : $to;
	//如果编码相同或者非字符串标量则不转换
	if( strtoupper($from) === strtoupper($to) || empty($fContents) || (is_scalar($fContents) && !is_string($fContents)) ){
		return $fContents;
	}
	if( is_string($fContents) ) {
		if(function_exists('mb_convert_encoding')){
			return mb_convert_encoding ($fContents, $to, $from);
		}elseif(function_exists('iconv')){
			return iconv($from,$to,$fContents);
		}else{
			return $fContents;
		}
	} elseif( is_array($fContents) ) {
		foreach ( $fContents as $key => $val ) {
			$_key = auto_charset($key,$from,$to);
			$fContents[$_key] = auto_charset($val,$from,$to);
			if( $key != $_key )
				unset($fContents[$key]);
		}
		return $fContents;
	}else{
		return $fContents;
	}
}

/**
+----------------------------------------------------------
* 字符串转字符串
+----------------------------------------------------------
* @access  public
* @param   str       $string      参数
* @param   str       $sper        连接符
* @param   str       $tper        分割符
+----------------------------------------------------------
* @return  str
+----------------------------------------------------------
* @example a,b,c,d => a','b','c','d
+----------------------------------------------------------
*/
function strToStr($string,$sper="'",$tper=","){
    return implode("{$sper},{$sper}",explode($tper,$string));
}

/**
+----------------------------------------------------------
* 中文字符串截取
+----------------------------------------------------------
* @access  public
* @param   str       $str        字符串
* @param   str       $start      起始位置
* @param   str       $length     字符串长度
* @param   str       $charset    中文字符格式
* @param   str       $suffix     字符串后缀
+----------------------------------------------------------
* @return  str
+----------------------------------------------------------
* @example msubstr( strip_tags($description), 0, 100 )
+----------------------------------------------------------
*/
function msubstr ( $str, $start = 0, $length, $charset = "utf-8", $suffix = '...' ) {
	$str = rtrim( $str, $suffix );
	if( strlen($str) <= 3*$length )
		return $str;
	if( function_exists("mb_substr") )
		return mb_substr( $str, $start, $length, $charset ) . $suffix;
	elseif( function_exists('iconv_substr') )
		return iconv_substr( $str, $start, $length, $charset ) . $suffix;
	$re['utf-8']  = "/[\x01-\x7f]|[\xc2-\xdf][\x80-\xbf]|[\xe0-\xef][\x80-\xbf]{2}|[\xf0-\xff][\x80-\xbf]{3}/";
	$re['gb2312'] = "/[\x01-\x7f]|[\xb0-\xf7][\xa0-\xfe]/";
	$re['gbk']    = "/[\x01-\x7f]|[\x81-\xfe][\x40-\xfe]/";
	$re['big5']   = "/[\x01-\x7f]|[\x81-\xfe]([\x40-\x7e]|\xa1-\xfe])/";
	preg_match_all( $re[$charset], $str, $match );
	$slice = join( "", array_slice($match[0], $start, $length) );
	return $slice.$suffix;
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

/*      //////////////////////////////////////////////模板 - 数据获取 - 开始//////////////////////////////////////////////      */

/**
+----------------------------------------------------------
* 获取当前语言
+----------------------------------------------------------
* @access  public
* @param   int       $type      类型：1为获取sid,2为获取blcode
+----------------------------------------------------------
* @return  str
+----------------------------------------------------------
* @example getLang()
+----------------------------------------------------------
*/
function getLang ( $type = 1 ) {
	$lang = C('DEFAULT_LANG');
	if( in_array( $_REQUEST['l'],explode(',',C('LANG_LIST')) ))
		$lang = $_REQUEST['l'];
	else if( in_array( $_COOKIE['l'],explode(',',C('LANG_LIST')) ))
		$lang = $_COOKIE['l'];
	if( $type == 2 ) return $lang;
	if( $type == 1 ){
		$siteInfo = A( 'Base' )->siteInfo;
		return $siteInfo[$lang]['sid'];
	}
}

/*      //////////////////////////////////////////////模板 - 数据获取 - 结束//////////////////////////////////////////////      */

/*      //////////////////////////////////////////////$_REQUEST数据过滤 - 开始//////////////////////////////////////////////      */

/**
+----------------------------------------------------------
* _REQUEST参数过滤
+----------------------------------------------------------
* @access  public
+----------------------------------------------------------
* @return  void
+----------------------------------------------------------
*/
function filter_param() {
	foreach ( $_REQUEST as $_k => $_v ) {
		$value = is_array($_v) ? $_v : daddslashes(urldecode($_v));
		$_REQUEST[$_k] = $value;
		if( array_key_exists($_k,$_POST) ) $_POST[$_k] = $value;
		if( array_key_exists($_k,$_GET) ) $_GET[$_k] = $value;
	}
}

/**
+----------------------------------------------------------
* 字符转义
+----------------------------------------------------------
* @access  public
* @param   arr or str      $string      字符串
+----------------------------------------------------------
* @return  str
+----------------------------------------------------------
 */
function daddslashes( $string ) {
	if( !is_array($string) )
		return sql_replace($string);
	$keys = array_keys($string);
	foreach( $keys as $key ){
		$string[$key] = daddslashes($string[$key]);
	}
	return $string;
}

/**
+----------------------------------------------------------
* sql 关键字过滤
+----------------------------------------------------------
* @access  public
* @param   str      $value      字符串
+----------------------------------------------------------
* @return  str
+----------------------------------------------------------
 */
function sql_replace( $value ) {
	$value = html2txt( $value,array('script','comment') );
	$str  = array( 
		'--', '*/', '/*', '*', '#' 
		,'%20insert','%20delete','%20update','%20select','%20drop','%20create','%20modify','%20rename','%20alter','%20sleep','%20where','%20union','%20join','%20like','%20execute','%20count' ,'%20and','%20load_file','%20outfile','%20from','%20case','%20then','%20else','%201=1','%20when'
	);
	$callback = htmlspecialchars( trim( str_ireplace($str,'', $value) ) );
	return $callback;
}

/**
+----------------------------------------------------------
* HTML代码过滤成纯文本
+----------------------------------------------------------
* @access  public
* @param   str      $str      字符串
* @param   arr      $type     过滤类型
+----------------------------------------------------------
* @return  str
+----------------------------------------------------------
*/
function html2txt( $str, $type ) {
	$_search = array(
		'script'  => '/<(script.*?)>(.*?)<(\/script.*?)>/si',   // Strip out javascript 
		'style'   => '/<(style.*?)>(.*?)<(\/style.*?)>/si',    // Strip style tags properly
		'comment' => '@<![\s\S]*?--[ \t\n\r]*>@'         // Strip multi-line comments including CDATA 
	);
	$search = array(
		'/<\!--.*?-->/si',    //过滤注释标签
		'/<(\/?html.*?)>/si', //过滤html标签
		'/<(\/?meta.*?)>/si', //过滤meta标签
		'/<(\/?link.*?)>/si', //过滤link标签
		'/<(title.*?)>(.*?)<(\/title.*?)>/si',//过滤title标签
	);
	if( !empty($type) && is_array($type) )
		foreach( $type as $key=>$val )
			if( !empty($_search[$val]) ) $search[] = $_search[$val];
	$search = !empty($search) ? $search : $_search;
	return preg_replace( $search, '', $str );
}

/*      //////////////////////////////////////////////$_REQUEST数据过滤 - 结束//////////////////////////////////////////////      */


?>
