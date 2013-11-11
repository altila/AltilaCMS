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

class ABaseAction extends BaseAction {
    // 初始化
	function _initialize() {
		//设置默认语言
		cookie('think_language',C('DEFAULT_LANG'),3600);
		//父类构造函数
		parent::_initialize();
		import("ORG.Util.RBAC",LIB_PATH);
		if ( !RBAC::AccessDecision() ) {
			// 没有权限 抛出错误
			if ( C('RBAC_ERROR_PAGE') ) {
				// 定义权限错误页面
				redirect( C('RBAC_ERROR_PAGE') );
			} else {
				// 提示错误信息
				$this->error(L('_VALID_ACCESS_'));
			}
		}
	}

	/**
	+----------------------------------------------------------
	* 操作成功后要返回的URL地址 - 默认为当前模块
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  str
	+----------------------------------------------------------
	*/
	public function getReturnUrl() {
		return "http://{$_SERVER[HTTP_HOST]}" . daddslashes(__SELF__);
	}

	/**
	+----------------------------------------------------------
	* 默认首页
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  str
	+----------------------------------------------------------
	*/
	public function index() {
		//列表过滤器，生成查询Map对象
		$map = $this->_search();
		if( method_exists( $this, '_filter' ) )
			$this->_filter( $map );
		$model = D( $this->getActionName() );
		if( !empty( $model ) )
			$this->_list( $model, $map );
		$this->display();
	}

	/**
	+----------------------------------------------------------
	* 默认字段过滤
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	*/
	public function _filter( &$map ) {}

	/**
	+----------------------------------------------------------
	* 根据表单生成查询条件和过滤
	+----------------------------------------------------------
	* @access  protected
	+----------------------------------------------------------
	* @param string $name 数据对象名称
	+----------------------------------------------------------
	* @return array
	+----------------------------------------------------------
	*/
	protected function _search( $name = '' ) {
		//生成查询条件
		$name = $name ? $name : $this->getActionName();
		$model = D( $name );
		$map = array ();
		foreach ( $model->getDbFields() as $key => $val ) {
			if ( isset($_REQUEST[$val]) && $_REQUEST[$val] !== null && $_REQUEST[$val] !== '' )
				$map[$val] = ( in_array($val,array('name','title','code')) ) ? array( 'like', "%{$_REQUEST[$val]}%" ) : $_REQUEST[$val];
		}
		return $map;
	}

	/**
	+----------------------------------------------------------
	* 根据表单生成查询条件和过滤
	+----------------------------------------------------------
	* @access  protected
	+----------------------------------------------------------
	* @param Model $model 数据对象
	* @param HashMap $map 过滤条件
	* @param string $sortBy 排序
	* @param boolean $asc 是否正序
	+----------------------------------------------------------
	* @return void
	+----------------------------------------------------------
	*/
	protected function _list( $model, $map, $sortBy = '', $asc = false ) {
		//排序字段 默认为主键名
		$order = !empty( $_REQUEST['orderField'] ) ? $_REQUEST['orderField'] : ( !empty( $sortBy ) ? $sortBy : ( $model->isExistField( 'sort' ) ? 'sort' : $model->getPk() ) );
		//排序方式默认按照倒序排列, 接受 sost参数 0 表示倒序 非0都 表示正序
		$sort = !empty( $_REQUEST['orderDirection'] ) ? ( ( $_REQUEST['orderDirection'] == 'asc' ) ? 'asc' : 'desc' ) : ( $asc || $order == 'sort' ? 'asc' : 'desc' );
		$orderSort = ( $order == $model->getPk() ) ? "`{$order}` {$sort}" : "`{$order}` {$sort}, {$model->getPk()} desc";
		//归组
		$group = !empty( $_REQUEST['_group'] ) ? $_REQUEST['_group'] : '';
		//字段
		$field = !empty($group) ? '*,count(1) AS total' : '*';
		//取得满足条件的记录数
		$count = $model->where ( $map )->group ( $group )->count ( '1' );
		//归组查询时的总数查询
		if( !empty($group) ) {
			$countSql = $model->getLastsql();
			$countGroup = $model->query( " SELECT COUNT(1) AS tp_count FROM ( " . substr( $countSql, 0, strpos($countSql,'LIMIT') ) . " ) AS table1 " );
			$count = $countGroup[0]['tp_count'];
		}
		if( $count > 0 ) {
			//创建分页对象
			import("ORG.Util.Page",LIB_PATH);
			$listRows = !empty( $_REQUEST['listRows'] ) ? $_REQUEST['listRows'] : '';
			$p = new Page ( $count, $listRows );
			//分页查询数据
			$voList = $model->where ( $map )->field ( $field )->order ( $orderSort )->limit ( "{$p->firstRow},{$p->listRows}" )->group ( $group )->select ();
			//分页跳转的时候保证查询条件
			foreach ( $map as $key => $val ) {
				if ( !is_array($val) ) $p->parameter .= "$key=" . urlencode ( $val ) . "&";
			}
			//模板赋值显示
			$this->assign ( 'list', $voList );
			$this->assign ( 'sort', $sort == 'desc' ? 1 : 0 ); //排序方式
			$this->assign ( 'order', $order );
			$this->assign ( 'sortImg', $sort ); //排序图标
			$this->assign ( 'sortType', $sort == 'desc' ? '升序排列' : '倒序排列' ); //排序提示
			$this->assign ( "page", $p->show() ); //分页显示
			$this->assign ( "id", $model->getpk() );
		}
		$this->assign ( 'totalCount', $p->totalRows );
		$this->assign ( 'numPerPage', $p->totalPages );
		$this->assign ( 'currentPage', $p->nowPage );
		return;
	}

	/**
	+----------------------------------------------------------
	* 默认增加页
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  str
	+----------------------------------------------------------
	*/
	public function add() {
		$model = D( $this->getActionName() );
		$this->fieldOpt = findById('Admin/SiteDatabase',array('parent_id'=>findById('Admin/SiteDatabase',array('code'=>$model->getTableName()),'sdid')),'sids,code','arr');
		$this->display('add_edit');
	}

	/**
	+----------------------------------------------------------
	* 默认循环增加页
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  str
	+----------------------------------------------------------
	*/
	public function editForeach() {
		$this->display();
	}

	/**
	+----------------------------------------------------------
	* 默认修改页
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  void
	+----------------------------------------------------------
	*/
	public function edit() {
		$model = D( $this->getActionName() );
		$id = $_REQUEST[$model->getPk()];
		$this->vo = $model->where("{$model->getPk()}={$id}")->find();
		$this->fieldOpt = findById('Admin/SiteDatabase',array('parent_id'=>findById('Admin/SiteDatabase',array('code'=>$model->getTableName()),'sdid')),'sids,code','arr');
		$this->display('add_edit');
	}

	/**
	+----------------------------------------------------------
	* 默认值过滤
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	*/
	public function _filterValue( &$request ) {
		foreach( $request as $key=>$val ){
			if( strpos($key,'name') !== false ) $request[$key] = str_replace( array('<','&lt;','>','&gt;'), '', $request[$key] );
			if( strpos($key,'name') !== false ) $request[$key] = str_replace( '，', ',', $request[$key] );
			if( strpos($key,'title') !== false ) $request[$key] = str_replace( array('<','&lt;','>','&gt;'), '', $request[$key] );
			if( strpos($key,'code') !== false ) $request[$key] = str_replace( array('<','&lt;','>','&gt;'), '', $request[$key] );
			if( strpos($key,'link') !== false ) $request[$key] = strtr( $request[$key], array(' '=>'',"\t"=>'',"\n"=>'') );
			if( strpos($key,'url') !== false ) $request[$key] = strtr( $request[$key], array(' '=>'',"\t"=>'',"\n"=>'') );
			if( strpos($key,'content') !== false ) $request[$key] = $request[$key];
		}
	}

	/**
	+----------------------------------------------------------
	* 默认插入操作
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  void
	+----------------------------------------------------------
	*/
	public function insert() {
		$this->insertCheck();
		$this->_filterValue( $_POST );
		$model = D( $this->getActionName() );
		if( empty($model) ) $this->ajaxReturn( '', "非法操作!", 0 );
		if( false === $model->create() )
			$this->error( $model->getError() );
		//新增失败
		if( false === $model->add() )
			$this->ajaxReturn( '', "新增失败!", 0 );
		//后置操作
		$this->_after_insert();
		//新增成功
		$this->assign ( 'jumpUrl', $this->getReturnUrl() );
		$this->ajaxReturn( '', "新增成功!", 1 );
	}

	/**
	+----------------------------------------------------------
	* 默认插入前置和后置操作
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  str
	+----------------------------------------------------------
	*/
	public function _before_insert() {}
	public function _after_insert() {}

	/**
	+----------------------------------------------------------
	* 默认插入前检验此记录是否已存在
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  str
	+----------------------------------------------------------
	*/
	public function insertCheck() {
		$map = $this->_filterInsertCheck();
		if( empty($map) ) return;
		$model = D( $this->getActionName() );
		$result = $model->where( $map )->find();
		if( !empty($result) )
			$this->ajaxReturn( '', "已有此条记录!", 0 );
	}

	/**
	+----------------------------------------------------------
	* 默认插入前需要检验的字段
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	*/
	public function _filterInsertCheck() {
		return array();
	}

	/**
	+----------------------------------------------------------
	* 默认循环插入操作
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  void
	+----------------------------------------------------------
	*/
	public function updateForeach() {
		$this->updateCheck();
		$this->_filterValue( $_POST );
		$model = D( $this->getActionName() );
		if( empty($model) ) $this->ajaxReturn( '', "非法操作!", 0 );
		if( false === $model->create() )
			$this->error( $model->getError() );
		//新增失败
		if( false === $model->editForeach() )
			$this->ajaxReturn( '', "修改失败!", 0 );
		//新增成功
		$this->assign ( 'jumpUrl', $this->getReturnUrl() );
		$this->ajaxReturn( '', "修改成功!", 1 );
	}

	/**
	+----------------------------------------------------------
	* 默认更新操作
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  str
	+----------------------------------------------------------
	*/
	public function update() {
		$this->updateCheck();
		$this->_filterValue( $_POST );
		$model = D( $this->getActionName() );
		if( empty($model) ) $this->ajaxReturn( '', "非法操作!", 0 );
		if( false === $model->create() )
			$this->error( $model->getError() );
		//编辑失败
		if( false === $model->save() )
			$this->ajaxReturn( '', "编辑失败!", 0 );
		//后置操作
		$this->_after_update();
		//编辑成功
		$this->assign( 'jumpUrl', $this->getReturnUrl() );
		$this->ajaxReturn( '', "编辑成功!", 1 );
	}

	/**
	+----------------------------------------------------------
	* 默认更新前置和后置操作
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  str
	+----------------------------------------------------------
	*/
	public function _before_update() {}
	public function _after_update() {}

	/**
	+----------------------------------------------------------
	* 默认更新前检验此记录是否已存在
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  str
	+----------------------------------------------------------
	*/
	public function updateCheck() {
		$map = $this->_filterUpdateCheck();
		if( empty($map) ) return;
		$model = D( $this->getActionName() );
		$pk = $model->getPk();
		$result = $model->where( $map )->select();
		if( !empty($result[1][$pk]) )
			$this->ajaxReturn( '', "已有多条此记录!", 0 );
		if( !empty($result[0][$pk]) && $result[0][$pk] != $_REQUEST[$pk] )
			$this->ajaxReturn( '', "已有此条记录!", 0 );
	}

	/**
	+----------------------------------------------------------
	* 默认更新前需要检验的字段
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	*/
	public function _filterUpdateCheck() {
		return array();
	}

	/**
	+----------------------------------------------------------
	* 默认删除操作
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  str
	+----------------------------------------------------------
	*/
	public function delete() {
		$model = D( $this->getActionName() );
		if( empty($model) ) $this->ajaxReturn( '', "非法操作!", 0 );
		$pk = $model->getPk();
		$id = $_REQUEST[$pk];
		if( empty($id) ) $this->ajaxReturn( '', "非法操作!", 0 );
		$condition = array( $pk => array('in',explode(',',$id) ) );
		//删除失败
		if( false === $model->logicDelete( $condition ) )
			$this->ajaxReturn( '', "删除失败!", 0 );
		//后置操作
		$this->_after_delete();
		//删除成功
		$this->assign( "jumpUrl", $this->getReturnUrl() );
		$this->ajaxReturn( '', "删除成功!", 1 );
	}

	/**
	+----------------------------------------------------------
	* 默认删除前置和后置操作
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  str
	+----------------------------------------------------------
	*/
	public function _before_delete() {}
	public function _after_delete() {}

	/**
	+----------------------------------------------------------
	* 默认禁用操作
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  str
	+----------------------------------------------------------
	*/
	public function forbid() {
		$model = D( $this->getActionName() );
		if( empty($model) ) $this->ajaxReturn( '', "非法操作!", 0 );
		$pk = $model->getPk();
		$id = $_REQUEST[$pk];
		if( empty($id) ) $this->ajaxReturn( '', "非法操作!", 0 );
		$condition = array( $pk => array('in',explode(',',$id) ) );
		//禁用失败
		if( false === $model->forbid( $condition ) )
			$this->ajaxReturn( '', "禁用失败!", 0 );
		//后置操作
		$this->_after_forbid();
		//禁用成功
		$this->assign( "jumpUrl", $this->getReturnUrl() );
		$this->ajaxReturn( '', "禁用成功!", 1 );
	}

	/**
	+----------------------------------------------------------
	* 默认禁用前置和后置操作
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  str
	+----------------------------------------------------------
	*/
	public function _before_forbid() {}
	public function _after_forbid() {}

	/**
	+----------------------------------------------------------
	* 默认批准操作
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  str
	+----------------------------------------------------------
	*/
	public function checkPass() {
		$model = D( $this->getActionName() );
		if( empty($model) ) $this->ajaxReturn( '', "非法操作!", 0 );
		$pk = $model->getPk();
		$id = $_REQUEST[$pk];
		if( empty($id) ) $this->ajaxReturn( '', "非法操作!", 0 );
		$condition = array( $pk => array('in', explode(',',$id) ) );
		//批准失败
		if( false === $model->checkPass( $condition ) )
			$this->ajaxReturn( '', "批准失败!", 0 );
		//后置操作
		$this->_after_checkPass();
		//批准成功
		$this->assign( "jumpUrl", $this->getReturnUrl() );
		$this->ajaxReturn( '', "批准成功!", 1 );
	}

	/**
	+----------------------------------------------------------
	* 默认批准前置和后置操作
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  str
	+----------------------------------------------------------
	*/
	public function _before_checkPass() {}
	public function _after_checkPass() {}

	/**
	+----------------------------------------------------------
	* 默认恢复操作
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  str
	+----------------------------------------------------------
	*/
	public function resume() {
		$model = D( $this->getActionName() );
		if( empty($model) ) $this->ajaxReturn( '', "非法操作!", 0 );
		$pk = $model->getPk();
		$id = $_REQUEST[$pk];
		if( empty($id) ) $this->ajaxReturn( '', "非法操作!", 0 );
		$condition = array( $pk => array('in', explode(',',$id) ) );
		//恢复失败
		if( false === $model->resume( $condition ) )
			$this->ajaxReturn( '', "恢复失败!", 0 );
		//后置操作
		$this->_after_resume();
		//恢复成功
		$this->assign( "jumpUrl", $this->getReturnUrl() );
		$this->ajaxReturn( '', "恢复成功!", 1 );
	}

	/**
	+----------------------------------------------------------
	* 默认恢复前置和后置操作
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  str
	+----------------------------------------------------------
	*/
	public function _before_resume() {}
	public function _after_resume() {}

	/**
	+----------------------------------------------------------
	* 默认还原操作
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  str
	+----------------------------------------------------------
	*/
	public function recycle() {
		$model = D( $this->getActionName() );
		if( empty($model) ) $this->ajaxReturn( '', "非法操作!", 0 );
		$pk = $model->getPk();
		$id = $_REQUEST[$pk];
		if( empty($id) ) $this->ajaxReturn( '', "非法操作!", 0 );
		$condition = array( $pk => array('in', explode(',',$id) ) );
		//恢复失败
		if( false === $model->resume( $condition ) )
			$this->ajaxReturn( '', "还原失败!", 0 );
		//后置操作
		$this->_after_recycle();
		//恢复成功
		$this->assign( "jumpUrl", $this->getReturnUrl() );
		$this->ajaxReturn( '', "还原成功!", 1 );
	}

	/**
	+----------------------------------------------------------
	* 默认还原前置和后置操作
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  str
	+----------------------------------------------------------
	*/
	public function _before_recycle() {}
	public function _after_recycle() {}

	/**
	+----------------------------------------------------------
	* 默认排序页
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  void
	+----------------------------------------------------------
	*/
	public function sort() {
		$_REQUEST['orderField'] = 'sort';
		$_REQUEST['orderDirection'] = 'asc';
		$_REQUEST['status'] = 1;
		//列表过滤器，生成查询Map对象
		$map = $this->_search();
		if( method_exists( $this, '_filter' ) )
			$this->_filter( $map );
		$model = D( $this->getActionName() );
		if( !empty( $model ) )
			$this->_list( $model, $map );
		$this->display('Admin@Public:sort');
	}

	/**
	+----------------------------------------------------------
	* 默认排序操作
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  void
	+----------------------------------------------------------
	*/
	public function saveSort() {
		$seqNoList = $_POST['seqNoList'];
		if ( empty($seqNoList) ) return;
		//更新数据对象
		$model = D( $this->getActionName() );
		$col = explode( ',', $seqNoList );
		//启动事务
		$model->startTrans();
		foreach ( $col as $val ) {
			$val = explode( ':', $val );
			$model->sort = $val[1];
			$result = $model->where( "{$model->getPk()}={$val[0]}" )->save();
			if( false === $result ) break;
		}
		//提交事务
		$model->commit();
		//更新失败
		if( $result === false )
			$this->ajaxReturn( '', $model->getError(), 0 );
		//更新成功
		$this->ajaxReturn( '', "更新成功!", 1 );
	}

	/**
	+----------------------------------------------------------
	* 默认清楚缓存操作
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  str
	+----------------------------------------------------------
	*/
	public function clearCache() {
		$model = D( $this->getActionName() );
		if( empty($model) ) $this->ajaxReturn( '', "非法操作!", 0 );
		$key = !empty($_REQUEST['cacheKey']) ? $_REQUEST['cacheKey'] : C( $this->getActionName() );
		if( empty($key) ) $this->ajaxReturn( '', "非法操作!", 0 );
		$model->clearCache( $key, $_REQUEST['type'] );
		//清楚成功
		$this->assign( "jumpUrl", $this->getReturnUrl() );
		$this->ajaxReturn( '', "清楚成功!", 1 );
	}

	/**
	+----------------------------------------------------------
	* 获取节点树
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	*/
	public function getTree( $condition ) {
		$model = D( $this->getActionName() );
		return $model->getTree( $condition );
	}

}
?>
