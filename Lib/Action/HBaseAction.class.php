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
		$this->info = $model->where( getModelPk($modelName) . "={$_REQUEST[getModelPk($modelName)]} " )->find();
		$this->setHead( $this->info, 2 );
		$this->display();
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
			$_data = D( "Home/Menu" )->breadCrumbs( array( 'onlyName'=>1, 'smid'=>$data['smid'] ) );
			$_data[] = $data['name'];
			$data = $_data;krsort($data);
		}
		$head = $this->head;
		$head['title'] = ( !is_array($data) ? $data : implode('-',$data) ) . "-{$head['title']}";
		$head['keywords'] = ( !is_array($data) ? $data : implode(',',$data) ) . ",{$head['keywords']}";
		$head['description'] = ( !is_array($data) ? $data : implode(',',$data) ) . ",{$head['description']}";
		$this->head = $head;
	}

}
?>
