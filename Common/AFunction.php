<?php
// +----------------------------------------------------------------------
// | ThinkPHP
// +----------------------------------------------------------------------
// | Copyright (c) 2007 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
// $Id$

/**
+----------------------------------------------------------
* 树状
+----------------------------------------------------------
* @access  public
* @param   arr      $list      含有_child的多维数组
* @param   arr      $condition 条件:href,target,rel,class,field,callback,isShowStatus,isAll,isCheck,ids
* @param   int      $level     层级
+----------------------------------------------------------
* @return  str or arr
+----------------------------------------------------------
* @example {$vo['status']|drawTree=$condition,''}
+----------------------------------------------------------
*/
function drawTree( $list, $condition, $level = 0 ){
	if( empty($list) ) return;
	$res = "<ul class='" . ( $level == 0 ? ' tree ' : '' ) . " treeFolder {$condition['class']}'>";
	foreach( $list as $key=>$value ){
		if( $value['status'] != 1 && $condition['isAll'] != 1 ) continue;
		$check = ( !empty($condition['ids']) && in_array($value[$condition['field']],$condition['ids']) ) ? "true" : "false";
		$href = !empty($condition['href']) ? "{$condition['href']}{$value[$condition['field']]}" : "{$value['code']}/index". ( !in_array(GROUP_NAME,array('Admin')) && !in_array($value['code'],array('SiteWeb')) ? "?sid=".getLang() : '');
		$rel = !empty($condition['rel']) ? $condition['rel'] : $value['code'];
		//a标签
		if( $value['type'] == 1 && empty($condition['isShowStatus']) ) $a = "<a href='#'>";
		else $a = "<a href='__GROUP__/{$href}' target='{$condition['target']}' rel='{$rel}' callback='{$condition['callback']}' pkid='{$value[$condition['field']]}'>";
		if( !empty($condition['isCheck']) ) $a = "<a tname='{$condition['field']}' tvalue='{$value[$condition['field']]}' checked='{$check}'>";
		$res .= "<li>";
		$res .= $a;
		$res .= "{$value['sort']}.{$value['name']}";
		//状态显示
		$res .= ( !empty($condition['isShowStatus']) ) ? "<span status='{$value['status']}' style='float:right'>" . showStatus( $value['status'],'','','','',0 ) . "</span>" : '';
		$res .= "</a>";
		if( !empty($value['_child']) ) $res .= drawTree( $value['_child'], $condition, ++$level );
		$res .= "</li>";
	}
	$res .= "</ul>";
	return $res;
}

/**
+----------------------------------------------------------
* 树状 - 一维数组
+----------------------------------------------------------
* @access  public
* @param   arr      $list      含有_child的多维数组
* @param   int      $level     层级
* @param   int      $childStr  前置符
+----------------------------------------------------------
* @return  arr
+----------------------------------------------------------
* @example {$vo['status']|showTree=0,array('|&nbsp;&nbsp;','|--')}
+----------------------------------------------------------
*/
function showTree( $list, $level = 0, $childStr = array('|&nbsp;&nbsp;','|--'), $model = 'result' ){
	static $result = array();$_childStr = '';
	for( $i = 0; $i <= $level - 1; $i++ ) $_childStr .= $childStr[0];
	foreach( $list as $key=>$value ){
		if( $value['status'] != 1 ) continue;
		$_value = $value;
		$_value['childStr'] = "{$_childStr}{$childStr[1]}";
		unset($_value['_child']);
		$result[$model][] = $_value;
		if( !empty($value['_child']) ) showTree( $value['_child'], !empty($value['crumb']) ? count(explode('-',$value['crumb']))-1 : ++$level, $childStr, $model );
	}
	return $result[$model];
}

/**
+----------------------------------------------------------
* 寻找树状数据
+----------------------------------------------------------
* @access  public
* @param   arr      $search    需要检索的数据
* @param   arr      $list      数据源
+----------------------------------------------------------
* @return  arr
+----------------------------------------------------------
* @example searchList( $search, $list )
+----------------------------------------------------------
*/
function searchList( $search, $list ){
	static $result = array();
	foreach( $search as $key=>$value ){
		if( empty($result[$key]) )
			$result[$key] = $list[$key];
		if( $result[$key]['parent_id'] != 0  )
			searchList( array( $result[$key]['parent_id']=>$result[$result[$key]['parent_id']] ), $list );
	}
	return $result;
}

/**
+----------------------------------------------------------
* 显示状态信息
+----------------------------------------------------------
* @access  public
* @param   str      $status      状态
* @param   int      $id          ID
* @param   int      $callback    回调刷新页
* @param   str      $field       索引字段名
* @param   str      $condition   回调页附带参数，如：字段名/值/字段名/值
* @param   str      $isA         是否需要A标签
+----------------------------------------------------------
* @return  str
+----------------------------------------------------------
* @example {$vo['status']|showStatus=$vo['id'],''}
+----------------------------------------------------------
*/
function showStatus( $status, $id, $callback = '', $field = 'id', $condition = '', $isA = 1 ) {
	switch ( $status ) {
		case 0 :
			$img = "<img src='__PUBLIC__/dwz/images/statusImg/locked.gif' alt='禁用'>";
			$info = ( $isA == 1 ) ? "<a href='__URL__/resume?{$field}={$id}&navTabId=".MODULE_NAME."&{$condition}' target='ajaxTodo' callback='{$callback}'>{$img}</a>" : $img;
			break;
		case 2 :
			$img = "<img src='__PUBLIC__/dwz/images/statusImg/prected.gif' alt='待审'>";
			$info = ( $isA == 1 ) ? "<a href='__URL__/checkPass?{$field}={$id}&navTabId=".MODULE_NAME."&{$condition}' target='ajaxTodo' callback='{$callback}'>{$img}</a>" : $img;
			break;
		case 1 :
			$img = "<img src='__PUBLIC__/dwz/images/statusImg/ok.gif' alt='正常'>";
			$info = ( $isA == 1 ) ? "<a href='__URL__/forbid?{$field}={$id}&navTabId=".MODULE_NAME."&{$condition}' target='ajaxTodo' callback='{$callback}'>{$img}</a>" : $img;
			break;
		case -1 :
			$img = "<img src='__PUBLIC__/dwz/images/statusImg/del.gif' alt='删除'>";
			$info = ( $isA == 1 ) ? "<a href='__URL__/recycle?{$field}={$id}&navTabId=".MODULE_NAME."&{$condition}' target='ajaxTodo' callback='{$callback}'>{$img}</a>" : $img;
			break;
	}
	return $info;
}

/**
 +----------------------------------------------------------
 * 产生随机字串，可用来自动生成密码
 * 默认长度6位 字母和数字混合 支持中文
 +----------------------------------------------------------
 * @param string $len 长度
 * @param string $type 字串类型
 * 0 字母 1 数字 其它 混合
 * @param string $addChars 额外字符
 +----------------------------------------------------------
 * @return string
 +----------------------------------------------------------
 */
function rand_string($len = 6, $type = '', $addChars = '') {
	$str = '';
	switch ($type) {
		case 0 :
			$chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz' . $addChars;
			break;
		case 1 :
			$chars = str_repeat ( '0123456789', 3 );
			break;
		case 2 :
			$chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' . $addChars;
			break;
		case 3 :
			$chars = 'abcdefghijklmnopqrstuvwxyz' . $addChars;
			break;
		default :
			// 默认去掉了容易混淆的字符oOLl和数字01，要添加请使用addChars参数
			$chars = 'ABCDEFGHIJKMNPQRSTUVWXYZabcdefghijkmnpqrstuvwxyz23456789' . $addChars;
			break;
	}
	if ($len > 10) { //位数过长重复字符串一定次数
		$chars = $type == 1 ? str_repeat ( $chars, $len ) : str_repeat ( $chars, 5 );
	}
	if ($type != 4) {
		$chars = str_shuffle ( $chars );
		$str = substr ( $chars, 0, $len );
	} else {
		// 中文随机字
		for($i = 0; $i < $len; $i ++) {
			$str .= msubstr ( $chars, floor ( mt_rand ( 0, mb_strlen ( $chars, 'utf-8' ) - 1 ) ), 1 );
		}
	}
	return $str;
}

/* zhanghuihua */
function percent_format($number, $decimals=0) {
	return number_format($number*100, $decimals).'%';
}

/**
+----------------------------------------------------------
* 在数据列表中搜索
+----------------------------------------------------------
* @access public
+----------------------------------------------------------
* @param mixed $condition 查询条件
* 支持 array('name'=>$value) 或者 name=$value
* @param array $list 数据列表
+----------------------------------------------------------
* @return array
+----------------------------------------------------------
*/
function search($list,$condition) {
	if(is_string($condition))
	parse_str($condition,$condition);
	// 返回的结果集合
	$resultSet = array();
	foreach ($list as $key=>$data){
		$find   =   false;
		foreach ($condition as $field=>$value){
			if(isset($data[$field])) {
				if(is_array($value)) {
					switch($value[0]) {
						case '>':if($data[$field]>$value[1]) $find = true;break;
						case '<':if($data[$field]<$value[1]) $find = true;break;
						case '>=':if($data[$field]>=$value[1]) $find = true;break;
						case '<=':if($data[$field]<=$value[1]) $find = true;break;
						case 'in':if($data[$field]>=$value[1] && $data[$field]<=$value[2]) $find = true;break;
					}
				}else{
					if(0 === strpos($value,'/')) {
						$find   =   preg_match($value,$data[$field]);
					}elseif($data[$field]==$value){
						$find = true;
					}
				}
			}
		}
		if( $find ) $resultSet[$key] = &$list[$key];
	}
	return $resultSet;
}

/**
 +----------------------------------------------------------
 * 检测位运算方法
 +----------------------------------------------------------
 * @access public
 +----------------------------------------------------------
 * @param int	$num 要检查的值
 * @param Array $arr 要检查包含的值列表
 * checkBitwise(7,array('1'=>'全站','2'=>'品牌','4'=>'分类'))
 +----------------------------------------------------------
 * @return array
 +----------------------------------------------------------
 */
function checkBitwise( $num,$arr ){
	if(!$num || EMPTY($arr)) return array();
	$result = array();
	foreach($arr as $k => $v)
	if($num & $k) $result[$k] = $v;
	return $result;
}

//两个时间相差
function dtime($t1, $t2) {
	if($t1>$t2){
		return '<b style=" color: #999999">已过期</b>';
	}
	$t1 = strtotime($t1);
	$t2 = strtotime($t2);
	$t12 = abs($t1-$t2);
	$start = 0;
	//$string = "两个时间相差：";
	$y = floor($t12/(3600*24*360));
	if($start || $y ){
		$start = 1;
		$t12 -= $y*3600*24*360;
		$string .= $y."年";
	}
	$m = floor($t12/(3600*24*31));
	if($start || $m){
		$start = 1;
		$t12 -= $m*3600*24*31;
		$string .= $m."月";
	}
	$d = floor($t12/(3600*24));
	if($start || $d){
		$start = 1;
		$t12 -= $d*3600*24;
		$string .= $d."天";
	}
	$h = floor($t12/(3600));
	if($start || $h){
		$start = 1;
		$t12 -= $h*3600;
		$string .= $h."小时";
	}
	$s = floor($t12/(60));
	if($start || $s){
		$start = 1;
		$t12 -= $s*60;
		$string .= $s."分钟";
	}
	$string .= "{$t12}秒";

	if($t2-$t1<2*3600*24){
		return '<b style=" color: #FF0000">'.$string.'</b>';
	}else{
		//return $string;
	}
}

/*      //////////////////////////////////////////////公告方法 - 开始//////////////////////////////////////////////      */

/**
+----------------------------------------------------------
* 删除文件夹
+----------------------------------------------------------
* @access  public
* @param   str      $dir      文件路径
+----------------------------------------------------------
* @return  str
+----------------------------------------------------------
* @example delFile($dir)
+----------------------------------------------------------
*/
function delFile($dir) {
	$dh = opendir($dir);
	while ( $file = readdir($dh) ) {
		if ( $file != "." && $file != ".." ) {
			$fullpath = $dir . "/" . $file;
			if ( !is_dir($fullpath) ) {
				unlink($fullpath);
			} else {
				delFile($fullpath);
			}
		}
	}
	closedir($dh);
}


/*      //////////////////////////////////////////////公告方法 - 结束//////////////////////////////////////////////      */



/*      //////////////////////////////////////////////模板 - 数据获取 - 开始//////////////////////////////////////////////      */

/**
+----------------------------------------------------------
* 获取表的主键
+----------------------------------------------------------
* @access  public
* @param   str      $name      模块名称
+----------------------------------------------------------
* @return  str
+----------------------------------------------------------
* @example {:getModelPk(MODULE_NAME)}
+----------------------------------------------------------
*/
function getModelPk ( $name = '' ) {
	if( empty($name) ) return;
	return D( $name )->getPk();
}

/**
+----------------------------------------------------------
* 根据条件,统计总数
+----------------------------------------------------------
* @access  public
* @param   str             $name      模块名称
* @param   arr             $map       查询条件
+----------------------------------------------------------
* @return  str
+----------------------------------------------------------
* @example {:getCount(MODULE_NAME)}
+----------------------------------------------------------
*/
function getCount ( $name, $map ) {
	if( empty($name) ) return;
	return D( $name )->where( $map )->count();
}

/**
+----------------------------------------------------------
* 根据条件,获取数据
+----------------------------------------------------------
* @access  public
* @param   str             $name      模块名称
* @param   str or arr      $map       主键ID号 或 查询条件
* @param   str             $attr      字段名称
* @param   str             $type      返回类型:one[默认]\arr\str
* @param   str             $sper      连接符
+----------------------------------------------------------
* @return  str or arr
+----------------------------------------------------------
* @example {:findById(MODULE_NAME)}
+----------------------------------------------------------
*/
function findById ( $name, $map, $attr = "", $type = "one", $sper = "," ) {
	if( empty($name) || empty($map) ) return;
	$_attr = explode(',',$attr);
	$model = D( $name );
	$where = ( !is_array($map) ) ? "{$model->getPk()}={$map}" : $map;
	if( $type == 'one' ) return $model->where( $where )->getField( $attr );
	$result = $model->where( $where )->field( $attr )->select();
	foreach( $result as $key=>$value ){
		( !empty($_attr[1]) ) ? $_result[$value[$_attr[1]]] = $value[$_attr[0]] : $_result[] = $value[$_attr[0]];
	}
	return ( $type == 'str' ) ? implode($sper,$_result) : $_result ;
}

/*      //////////////////////////////////////////////模板 - 数据获取 - 结束//////////////////////////////////////////////      */


?>
