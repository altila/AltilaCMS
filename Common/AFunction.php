<?php
//+---------------------------------------
//|  项目公共函数库【后台管理】
//+---------------------------------------

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
	$res = ( $level == 0 ) ? "<ul class='" . ( $level == 0 ? ' tree ' : '' ) . " treeFolder {$condition['class']}'>\n" : "<ul>\n";
	foreach( $list as $key=>$value ){
		if( $value['status'] != 1 && $condition['isAll'] != 1 ) continue;
		$check = ( !empty($condition['ids']) && in_array($value[$condition['field']],$condition['ids']) ) ? "true" : "false";
		$href = !empty($condition['href']) ? "{$condition['href']}{$value[$condition['field']]}" : "{$value['code']}/index". ( !in_array(GROUP_NAME,array('Admin')) && !in_array($value['code'],array('SiteWeb')) ? "?sid=".getLang() : '');
		$rel = !empty($condition['rel']) ? $condition['rel'] : $value['code'];
		//a标签
		if( $value['type'] == 1 && empty($condition['isShowStatus']) ) $a = "<a href='#'>\n";
		else $a = "<a href='__GROUP__/{$href}' target='{$condition['target']}' rel='{$rel}' callback='{$condition['callback']}' pkid='{$value[$condition['field']]}'>\n";
		if( !empty($condition['isCheck']) ) $a = "<a tname='{$condition['field']}' tvalue='{$value[$condition['field']]}' " . ( $check == "true" ? " checked='{$check}' " : "" ) . ">";
		$res .= "<li>\n";
		$res .= $a;
		$res .= "{$value['sort']}.{$value['name']}";
		//状态显示
		$res .= ( !empty($condition['isShowStatus']) ) ? "<span status='{$value['status']}' style='float:right'>" . showStatus( $value['status'],'','','','',0 ) . "</span>\n" : '';
		$res .= "</a>\n";
		if( !empty($value['_child']) ) $res .= drawTree( $value['_child'], $condition, ++$level );
		$res .= "</li>\n";
	}
	$res .= "</ul>\n";
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
function showStatus( $status, $id, $callback = '', $field = 'id', $condition = '', $isA = 1, $onclick = "" ) {
	switch ( $status ) {
		case 0 :
			$img = "<img src='__PUBLIC__/dwz/images/statusImg/locked.gif' alt='禁用'>";
			$info = ( $isA == 1 ) ? "<a href='__URL__/resume?{$field}={$id}&navTabId=".MODULE_NAME."&{$condition}' target='ajaxTodo' onclick='{$onclick}' callback='{$callback}'>{$img}</a>" : $img;
			break;
		case 2 :
			$img = "<img src='__PUBLIC__/dwz/images/statusImg/prected.gif' alt='待审'>";
			$info = ( $isA == 1 ) ? "<a href='__URL__/checkPass?{$field}={$id}&navTabId=".MODULE_NAME."&{$condition}' target='ajaxTodo' onclick='{$onclick}' callback='{$callback}'>{$img}</a>" : $img;
			break;
		case 1 :
			$img = "<img src='__PUBLIC__/dwz/images/statusImg/ok.gif' alt='正常'>";
			$info = ( $isA == 1 ) ? "<a href='__URL__/forbid?{$field}={$id}&navTabId=".MODULE_NAME."&{$condition}' target='ajaxTodo' onclick='{$onclick}' callback='{$callback}'>{$img}</a>" : $img;
			break;
		case -1 :
			$img = "<img src='__PUBLIC__/dwz/images/statusImg/del.gif' alt='删除'>";
			$info = ( $isA == 1 ) ? "<a href='__URL__/recycle?{$field}={$id}&navTabId=".MODULE_NAME."&{$condition}' target='ajaxTodo' onclick='{$onclick}' callback='{$callback}'>{$img}</a>" : $img;
			break;
	}
	return $info;
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
	$result = D( $name )->where( $map )->count();
	return $result;
}

/**
+----------------------------------------------------------
* 根据条件,统计总和
+----------------------------------------------------------
* @access  public
* @param   str             $name      模块名称
* @param   arr             $map       查询条件
* @param   str             $field     字段名称
+----------------------------------------------------------
* @return  str
+----------------------------------------------------------
* @example {:getCount(MODULE_NAME)}
+----------------------------------------------------------
*/
function getSum ( $name, $map, $field ) {
	if( empty($name) ) return;
	$result = D( $name )->where( $map )->sum($field);
	return $result;
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
* @param   str             $order     排序方式
+----------------------------------------------------------
* @return  str or arr
+----------------------------------------------------------
* @example {:findById(MODULE_NAME)}
+----------------------------------------------------------
*/
function findById ( $name, $map, $attr = "", $type = "one", $sper = ",", $order = '' ) {
	if( empty($name) || empty($map) ) return;
	$_attr = explode(',',$attr);
	$model = D( $name );
	$where = ( !is_array($map) ) ? "{$model->getPk()}={$map}" : $map;
	if( $type == 'one' ){
		$_result = $model->where( $where )->order( $order )->getField( $attr );
	} else {
		$result = $model->where( $where )->field( $attr )->order( $order )->select();
		foreach( $result as $key=>$value ){
			( !empty($_attr[1]) ) ? $_result[$value[$_attr[1]]] = $value[$_attr[0]] : $_result[] = $value[$_attr[0]];
		}
	}
	//print_r($model->getLastsql());
	return ( $type == 'str' ) ? implode($sper,$_result) : $_result ;
}

/*      //////////////////////////////////////////////模板 - 数据获取 - 结束//////////////////////////////////////////////      */


?>
