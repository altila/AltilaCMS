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

class AAlbumPhotoAction extends ABaseAction {

	public $savePath;

	/**
	+----------------------------------------------------------
	* 构造函数
	+----------------------------------------------------------
	*/
	public function __construct() {
		parent::__construct();
		$this->savePath = C('__UPLOAD__') . "/Images/{$this->siteMark}/{$this->getActionName()}/" . date("Ymd") . "/";
	}

	/**
	+----------------------------------------------------------
	* 字段过滤
	+----------------------------------------------------------
	*/
	public function _filter( &$map ) {
		$map['status'] = 1;
	}

	/**
	+----------------------------------------------------------
	* 删除后置
	+----------------------------------------------------------
	*/
	public function _before_delete() {
		$model = D( $this->getActionName() );
		$info = $model->find( "{$_REQUEST[$model->getPk()]}" );
		$thumbnail = str_replace( '__UPLOAD__', C('__UPLOAD__'), $info['thumbnail'] );
		if( ( !IS_BAE && !unlink($thumbnail) ) || ( IS_BAE && !file_delete($thumbnail) ) )
			$this->ajaxReturn( '', "删除失败!", 0 );
	}

	/**
	+----------------------------------------------------------
	* 新增前置
	+----------------------------------------------------------
	*/
	public function _before_insert() {
		$TMPL_PARSE_STRING = C('TMPL_PARSE_STRING');
		$model = D( $this->getActionName() );
		if( !empty($_POST['thumbnail']) )
			$_POST['thumbnail'] = str_replace( $TMPL_PARSE_STRING['__UPLOAD__'], '__UPLOAD__', $_POST['thumbnail'] );
		$_POST[$model->getPk()] = $model->where( array('thumbnail'=>$_POST['thumbnail']) )->getField($model->getPk());
		if( !empty($_POST[$model->getPk()]) ) {
			$this->update();
			exit;
		}
	}

	/**
	+----------------------------------------------------------
	* 图片上传方法 - 文章
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  ajax
	+----------------------------------------------------------
	*/
	public function imgUplode() {
		$model = D( 'Uplode' );
		// 图片存储路径
		$condition['savePath'] = $this->savePath;
		// 图片上传方法实例化
		$uploadImg = $model->imageUp( $condition );
		// 图片上传 上传失败返回异常
		if( !$uploadImg->upload() )
			$this->ajaxReturn( '', "上传失败,{$uploadImg->getErrorMsg()}", 0 );
		// 上传成功 获取上传文件信息
		$info = $uploadImg->getUploadFileInfo();
		$result['state'] = "SUCCESS";
		$result['title'] = strrpos($_POST['pictitle'],'.') !== false ? substr( $_POST['pictitle'], 0, strrpos($_POST['pictitle'],'.') ) : $_POST['pictitle'];
		$result['title'] = $result['title'] ? $result['title'] : $info[0]['name'];
		$thumbnail = "Images/" . strrchr($info[0]['savepath'],$this->siteMark) . "{$info[0]['savename']}";
		$uploadPath = C('TMPL_PARSE_STRING');
		$result['url'] = "{$uploadPath['__UPLOAD__']}/{$thumbnail}";
		// 保存至相片表
		$this->addPhoto( array( 'thumbnail'=>"__UPLOAD__/{$thumbnail}",'name'=>$result['title'],'size'=>$info[0]['size'] ) );
		$result['extra']['idVal'] = D( $this->getActionName() )->getLastInsID();
		// 上传成功
		die( json_encode($result) );
		//$this->ajaxReturn( '', "上传成功", 1, '', $result );
	}

	/**
	+----------------------------------------------------------
	* 增加相片
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $map      字段值
	+----------------------------------------------------------
	* @return  void
	+----------------------------------------------------------
	* @example addPhoto( $map )
	+----------------------------------------------------------
	*/
	protected function addPhoto( $map ) {
		$map['uid'] = !empty($this->userInfo['Uid']) ? $this->userInfo['Uid'] : 0;
		$map['sid'] = !empty($map['sid']) ? $map['sid'] : $this->siteInfo[$_COOKIE['think_language']]['sid'];
		$map['status'] = 1;
		$map['create_time'] = date("Y-m-d H:i:s");
		$map['update_time'] = date("Y-m-d H:i:s");
		D( $this->getActionName() )->add( $map );
		return;
	}

	/**
	+----------------------------------------------------------
	* ueditor编译器在线图片管理页
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  ajax
	+----------------------------------------------------------
	*/
	public function imgManagerIndex() {
		$TMPL_PARSE_STRING = C('TMPL_PARSE_STRING');
		$_REQUEST['listRows'] = $_REQUEST['size'];
		$_REQUEST['p'] = $_REQUEST['start'];
		$map['sid'] = array( 'in',findById( "Admin/SiteWeb", array('domain'=>$this->siteMark), "sid", "arr" ) );
		$model = D( $this->getActionName() );
		if( !empty( $model ) ) $this->_list( $model, $map );
		foreach( $this->list as $key=>$val ) {
			$result['list'][$key]['url'] = str_replace( '__UPLOAD__', $TMPL_PARSE_STRING['__UPLOAD__'], $val['thumbnail'] );
		}
		$result['state'] = "SUCCESS";
		$result['start'] = $_REQUEST['start'];
		$result['total'] = $this->totalCount;
		die( json_encode($result) );
	}


}
?>
