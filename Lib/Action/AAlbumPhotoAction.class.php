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
		if( !unlink( str_replace( '__UPLOAD__', C('__UPLOAD__'), $info['url'] ) ) )
			$this->ajaxReturn( '', "删除失败!", 0 );
	}

	/**
	+----------------------------------------------------------
	* 新增前置
	+----------------------------------------------------------
	*/
	public function _before_insert() {
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
		$_POST['url'] = "__UPLOAD__" . ltrim( strrchr($info[0]['savepath'],'Uploads'), 'Uploads' ) . "{$info[0]['savename']}";
		$_POST['size'] = $info[0]['size'];
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
		$condition['allowTypes'] = array('application/octet-stream');
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
		$url = ltrim( strrchr($info[0]['savepath'],'Uploads'), 'Uploads' ) . "{$info[0]['savename']}";
		$uploadPath = C('TMPL_PARSE_STRING');
		$result['url'] = "{$uploadPath['__UPLOAD__']}{$url}";
		// 保存至相片表
		$this->addPhoto( array( 'url'=>"__UPLOAD__{$url}",'name'=>$result['title'],'size'=>$info[0]['size'] ) );
		$result['idVal'] = D( $this->getActionName() )->getLastInsID();
		// 上传成功
		$this->ajaxReturn( '', "上传成功", 1, '', $result );
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
		$map['sid'] = !empty($map['sid']) ? $map['sid'] : $this->siteInfo[C('DEFAULT_LANG')]['sid'];
		$map['status'] = 1;
		$map['add_time'] = date("Y-m-d H:i:s");
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
		$sid = array( 'in',findById( "Admin/SiteWeb", array('domain'=>$this->siteMark), "sid", "arr" ) );
		$result = findById( $this->getActionName(), array('sid'=>$sid), "url", "str", "ue_separate_ue" );
		$TMPL_PARSE_STRING = C('TMPL_PARSE_STRING');
		die( str_replace( '__UPLOAD__', $TMPL_PARSE_STRING['__UPLOAD__'], $result ) );
	}


}
?>
