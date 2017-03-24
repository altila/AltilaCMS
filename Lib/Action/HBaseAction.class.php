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

class HBaseAction extends BaseAction {

	/**
	+----------------------------------------------------------
	* 空操作实现方法调用
	+----------------------------------------------------------
	* @access  public
	* @param   str      $action         方法名
	+----------------------------------------------------------
	* @return  json
	+----------------------------------------------------------
	*/
	public function _empty( $action ) {
		$this->display($action);
	}

	/**
	+----------------------------------------------------------
	* 默认前置首页
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  str
	+----------------------------------------------------------
	*/
	public function _before_index() {
		$sid = getLang();
		$code = GROUP_NAME.'_'.MODULE_NAME.'_'.ACTION_NAME;
		$this->menuList = D( 'Base/Menu' )->getMenu( array('sid'=>$sid) );
		$this->adList = D( 'Base/Ad' )->getAdPosList( array('apCode'=>$code, 'sid'=>$sid) );
		$this->plateList = D( 'Base/Plate' )->getPlate( array('spgCode'=>$code, 'sid'=>$sid) );
		$this->eventAction();
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
		$modelName = $this->getActionName();
		$model = D( $modelName );
		$this->info = $model->where( $model->getPk() . "={$_REQUEST[$model->getPk()]} " )->find();
		$this->setHead( $this->info, 2 );
		if( !empty($_REQUEST['smid']) || !empty($this->info['smid']) ) {
			$condition['smid'] = $_REQUEST['smid'] ? $_REQUEST['smid'] : $this->info['smid'];
			$categoryInfo = D( "Base/ArticleCategory" )->getCategoryInfo( $condition, 'template_list,template_info' );
		}
		$template = $_REQUEST['smid'] ? $categoryInfo['template_list'] : $categoryInfo['template_info'];
		$this->display( $template );
	}

	/**
	+----------------------------------------------------------
	* 设置页面头部信息
	+----------------------------------------------------------
	* @access  protected
	+----------------------------------------------------------
	* @param   str     $data   数据
	* @param   int     $type   类型：1为直接使用,2为从分类表中获取数据
	+----------------------------------------------------------
	* @return void
	+----------------------------------------------------------
	*/
	protected function setHead( $data, $type = 1 ) {
		if( $type == 2 ){
			$result = D( "Base/ArticleCategory" )->getBreadCrumbs( array( 'smid'=>$data['smid'] ) );
			foreach( $result as $key=>$value )
				$_data[] = $value['name'];
			if( strpos(MODULE_NAME,'Category') == false ) $_data[] = $data['name'];
			$data = $_data;krsort($data);
		}
		$head = $this->head;
		$head['title'] = ( !is_array($data) ? $data : implode('-',$data) ) . "-{$head['title']}";
		$head['keywords'] = ( !is_array($data) ? $data : implode(',',$data) ) . ",{$head['keywords']}";
		$head['description'] = ( !is_array($data) ? $data : implode(',',$data) ) . ",{$head['description']}";
		$this->head = $head;
	}

	/**
	+----------------------------------------------------------
	* 调用EventAction方法
	+----------------------------------------------------------
	* @access  protected
	+----------------------------------------------------------
	* @return void
	+----------------------------------------------------------
	*/
	protected function eventAction() {
		$actionName = MODULE_NAME . ucfirst($this->siteMark);
		//print_r(file_exists(dirname(__FILE__) . "../Event/{$actionName}Event.class.php"));
		//if( file_get_contents(dirname(__FILE__) . "../Event/{$actionName}Event.class.php") !== false )
			//A($actionName,'Event')->index();
	}

}
?>
