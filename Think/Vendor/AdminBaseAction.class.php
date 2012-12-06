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

class AdminBaseAction extends Action {
    // 初始化
	function _initialize() {
		// 用户权限检查
		if (C ( 'USER_AUTH_ON' ) && ! in_array ( MODULE_NAME, explode ( ',', C ( 'NOT_AUTH_MODULE' ) ) )) {
			import ( '@.ORG.RBAC' );
			if (! RBAC::AccessDecision ()) {
				//检查认证识别号
				if (! $_SESSION [C ( 'USER_AUTH_KEY' )]) {
					if ($this->isAjax ()) { 
					//暂时屏蔽权限
						$this->ajaxReturn ( true, "", 301 );
					} else {
						//跳转到认证网关
						redirect ( PHP_FILE . C ( 'USER_AUTH_GATEWAY' ) );
					}
				}
				// 没有权限 抛出错误
				if (C ( 'RBAC_ERROR_PAGE' )) {
					// 定义权限错误页面
					redirect ( C ( 'RBAC_ERROR_PAGE' ) );
				} else {
					if (C ( 'GUEST_AUTH_ON' )) {
						$this->assign ( 'jumpUrl', PHP_FILE . C ( 'USER_AUTH_GATEWAY' ) );
					}
                    // 提示错误信息
					$this->error ( L ( '_VALID_ACCESS_' ) );
				}
			}
		}
	}
	public function index() {
		//列表过滤器，生成查询Map对象
		$map = $this->_search ();
		if (method_exists ( $this, '_filter' )) {
			$this->_filter ( $map );
		}
		$model = D( $this->getActionName() );
		if ( !empty( $model ) ) {
			$res = $this->_list( $model, $map );
			if( $res ) die(json_encode($res));
		}
		//$this->display ();
		//return;
	}

	/**
	+----------------------------------------------------------
	* 取得操作成功后要返回的URL地址
	* 默认返回当前模块的默认操作
	* 可以在action控制器中重载
	+----------------------------------------------------------
	* @access public
	+----------------------------------------------------------
	* @return string
	+----------------------------------------------------------
	*/
	function getReturnUrl() {
		return __URL__ . '?' . C ( 'VAR_MODULE' ) . '=' . MODULE_NAME . '&' . C ( 'VAR_ACTION' ) . '=' . C ( 'DEFAULT_ACTION' );
	}

	/**
	+----------------------------------------------------------
	* 根据表单生成查询条件和过滤
	+----------------------------------------------------------
	* @access protected
	+----------------------------------------------------------
	* @param string $name 数据对象名称
	+----------------------------------------------------------
	* @return array
	+----------------------------------------------------------
	*/
	protected function _search( $name = '' ) {
		//生成查询条件
		$name = $name ? $name : $this->getActionName();
		$model = D ( $name );
		$map = array ();
		foreach ( $model->getDbFields () as $key => $val ) {
			if ( !empty( $_REQUEST[$val] ) && $_REQUEST[$val] != '' ) {
				$map[$val] = ( in_array($val,array('name','title')) ) ? array( 'like', "%{$_REQUEST[$val]}%" ) : $_REQUEST[$val];
			}
		}
		return $map;
	}

	/**
     +----------------------------------------------------------
	 * 根据表单生成查询条件和过滤
     +----------------------------------------------------------
	 * @access protected
     +----------------------------------------------------------
	 * @param Model $model 数据对象
	 * @param HashMap $map 过滤条件
	 * @param string $sortBy 排序
	 * @param boolean $asc 是否正序
     +----------------------------------------------------------
	 * @return void
     +----------------------------------------------------------
	 */
	protected function _list($model, $map, $sortBy = '', $asc = false) {
		//排序字段 默认为主键名
		$order = !empty( $_REQUEST ['_order'] ) ? $_REQUEST ['_order'] : ( !empty( $sortBy ) ? $sortBy : $model->getPk() );
		//排序方式默认按照倒序排列
		//接受 sost参数 0 表示倒序 非0都 表示正序
		$sort = !empty( $_REQUEST ['_sort'] ) ? ( ( $_REQUEST ['_sort'] == 'asc' ) ? 'asc' : 'desc' ) : ( $asc ? 'asc' : 'desc' );
		//取得满足条件的记录数
		$count = $model->where ( $map )->count ( '1' );
		if ($count > 0) {
			import ( "@.ORG.Page" );
			//创建分页对象
			$listRows = !empty( $_REQUEST ['listRows'] ) ? $_REQUEST ['listRows'] : '';
			$p = new Page ( $count, $listRows );
			//分页查询数据
			$voList = $model->where ( $map )->order ( "`" . $order . "` " . $sort )->limit ( $p->firstRow . ',' . $p->listRows )->findAll ();
			//分页跳转的时候保证查询条件
			foreach ( $map as $key => $val ) {
				if ( !is_array($val) ) $p->parameter .= "$key=" . urlencode ( $val ) . "&";
			}
			//分页显示
			$page = $p->show ();
			//列表排序显示
			$sortImg = $sort; //排序图标
			$sortAlt = $sort == 'desc' ? '升序排列' : '倒序排列'; //排序提示
			$sort = $sort == 'desc' ? 1 : 0; //排序方式
			//模板赋值显示
			$this->assign ( 'list', $voList );
			$this->assign ( 'sort', $sort );
			$this->assign ( 'order', $order );
			$this->assign ( 'sortImg', $sortImg );
			$this->assign ( 'sortType', $sortAlt );
			$this->assign ( "page", $page );
			$this->assign ( "id", $model->getpk () );
		}
		$this->assign ( 'totalCount', $count );
		$this->assign ( 'total', $count );
		$this->assign ( 'numPerPage', C ( 'PAGE_LISTROWS' ) );
		$this->assign ( 'currentPage', ! empty ( $_REQUEST [C ( 'VAR_PAGE' )] ) ? $_REQUEST [C ( 'VAR_PAGE' )] : 1 );
		Cookie::set ( '_currentUrl_', __SELF__ );
		return $this->view->tVar;
	}

	function insert() {
		$model = D( $this->getActionName() );
		if (false === $model->create ()) {
			$this->error ( $model->getError () );
		}
		//保存当前数据对象
		$list = $model->add ();
		if ($list !== false) { //保存成功
			$this->assign ( 'jumpUrl', Cookie::get ( '_currentUrl_' ) );
			$this->_log($name.'|'.__FUNCTION__);
			$this->ajaxReturn('',"新增成功!",1);
		} else {
			//失败提示
			$this->ajaxReturn('',"新增失败!",0);
		}
	}

	public function add() {
		$this->display ();
	}

	function read() {
		$this->edit ();
	}

	function edit() {
		$model = D( $this->getActionName() );
		$id = $_REQUEST [$model->getPk ()];
		$vo = $model->getById ( $id );
		$this->assign ( 'vo', $vo );
		$this->display ();
	}

	function update() {
		$model = D( $this->getActionName() );
		if (false === $model->create ()) {
			$this->error ( $model->getError () );
		}
		// 更新数据
		$list = $model->save ();
		if (false !== $list) {
			//成功提示
			$this->assign ( 'jumpUrl', Cookie::get ( '_currentUrl_' ) );
			$this->_log($name.'|'.__FUNCTION__);
			$this->ajaxReturn('',"编辑成功!",1);
		} else {
			//错误提示
			$this->ajaxReturn('',"编辑失败!",0);
		}
	}

	/**
	+----------------------------------------------------------
	* 默认删除操作
	+----------------------------------------------------------
	* @access public
	+----------------------------------------------------------
	* @return string
	+----------------------------------------------------------
	*/
	public function delete() {
		$model = D( $this->getActionName() );
		if( !empty($model) ) $this->ajaxReturn('',"非法操作!",0);
		$pk = $model->getPk();
		$id = $_REQUEST[$pk];
		if( !empty($id) ) $this->ajaxReturn('',"非法操作!",0);
		$condition = array( $pk => array('in',explode(',',$id) ) );
		if( false !== $model->delete( $condition ) ){
			$this->assign ( "jumpUrl", $this->getReturnUrl () );
			$this->ajaxReturn('',"状态删除成功!",1);
		} else {
			$this->ajaxReturn('',"状态删除失败!",0);
		}
	}

	/**
	+----------------------------------------------------------
	* 默认禁用操作
	+----------------------------------------------------------
	* @access public
	+----------------------------------------------------------
	* @return string
	+----------------------------------------------------------
	*/
	public function forbid() {
		$model = D( $this->getActionName() );
		if( !empty($model) ) $this->ajaxReturn('',"非法操作!",0);
		$pk = $model->getPk();
		$id = $_REQUEST[$pk];
		if( !empty($id) ) $this->ajaxReturn('',"非法操作!",0);
		$condition = array( $pk => array('in',explode(',',$id) ) );
		if( false !== $model->forbid( $condition ) ){
			$this->assign ( "jumpUrl", $this->getReturnUrl () );
			$this->ajaxReturn('',"状态禁用成功!",1);
		} else {
			$this->ajaxReturn('',"状态禁用失败!",0);
		}
	}

	/**
	+----------------------------------------------------------
	* 默认批准操作
	+----------------------------------------------------------
	* @access public
	+----------------------------------------------------------
	* @return string
	+----------------------------------------------------------
	*/
	public function checkpass() {
		$model = D( $this->getActionName() );
		if( !empty($model) ) $this->ajaxReturn('',"非法操作!",0);
		$pk = $model->getPk();
		$id = $_REQUEST[$pk];
		if( !empty($id) ) $this->ajaxReturn('',"非法操作!",0);
		$condition = array( $pk => array('in', explode(',',$id) ) );
		if( false !== $model->checkPass( $condition ) ){
			$this->assign( "jumpUrl", $this->getReturnUrl () );
			$this->ajaxReturn('',"状态批准成功!",1);
		}else{
			$this->ajaxReturn('',"状态批准失败!",0);
		}
	}

	/**
	+----------------------------------------------------------
	* 默认恢复操作
	+----------------------------------------------------------
	* @access public
	+----------------------------------------------------------
	* @return string
	+----------------------------------------------------------
	*/
	public function resume() {
		$model = D( $this->getActionName() );
		if( !empty($model) ) $this->ajaxReturn('',"非法操作!",0);
		$pk = $model->getPk();
		$id = $_REQUEST[$pk];
		if( !empty($id) ) $this->ajaxReturn('',"非法操作!",0);
		$condition = array( $pk => array('in', explode(',',$id) ) );
		if( false !== $model->resume( $condition ) ){
			$this->assign( "jumpUrl", $this->getReturnUrl () );
			$this->ajaxReturn('',"状态恢复成功!",1);
		}else{
			$this->ajaxReturn('',"状态恢复失败!",0);
		}
	}

	function saveSort() {
		$seqNoList = $_POST ['seqNoList'];
		if (! empty ( $seqNoList )) {
			//更新数据对象
			$model = D ( $this->getActionName() );
			$col = explode ( ',', $seqNoList );
			//启动事务
			$model->startTrans ();
			foreach ( $col as $val ) {
				$val = explode ( ':', $val );
				$model->id = $val [0];
				$model->sort = $val [1];
				$result = $model->save ();
				if (! $result) {
					break;
				}
			}
			//提交事务
			$model->commit ();
			if ($result !== false) {
				//采用普通方式跳转刷新页面
				$this->ajaxReturn('',"更新成功!",1);
			} else {
				$this->ajaxReturn('',$model->getError(),0);
			}
		}
	}

	// 检查栏目权限
	protected function checkCateAuthor($cateId) {
		if (empty ( $_SESSION ['administrator'] )) { // 超级管理员无需检查
			$allowCateList = explode ( ',', $_SESSION ['allowCateList'] );
			// 检查当前栏目或者父栏目是否有授权
			if (in_array ( $cateId, $allowCateList )) {
				return true;
			} else { // 检查父栏目
				$pid = M ( 'Cate' )->where ( 'id=' . $cateId )->getField ( 'pid' );
				if (in_array ( $pid, $allowCateList )) {
					return true;
				} else {
					$pid = M ( 'Cate' )->where ( 'id=' . $pid )->getField ( 'pid' );
					if (in_array ( $pid, $allowCateList )) {
						return true;
					}
				}
			}
			return false;
		}
		return true;
	}

}
?>
