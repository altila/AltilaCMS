<?php
// +----------------------------------------------------------------------
// | ThinkPHP
// +----------------------------------------------------------------------
// | Copyright (c) 2011 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: dizzthxl <dizzt@topthink.com>
// +----------------------------------------------------------------------
// $Id$
class UplodeModel extends ABaseModel {

	protected $trueTableName = 'user_base';

	public $UploadPath;

	/**
	+----------------------------------------------------------
	* 构造函数
	+----------------------------------------------------------
	*/
	public function __construct() {
		parent::__construct();
		$this->UploadPath = C('__UPLOAD__');
	}

	/**
	+----------------------------------------------------------
	* 图片上传方法
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件
	+----------------------------------------------------------
	* @return  obj
	+----------------------------------------------------------
	* @example imageUp( $condition )
	+----------------------------------------------------------
	*/
	public function imageUp( $condition ) {
		// 图片上传方法实例化
		import("ORG.Net.UploadFile");
		$uploadImg = new UploadFile();
		// 设置附件上传大小
		$uploadImg->maxSize = !empty($condition['maxSize']) ? $condition['maxSize'] : 512000;
		// 设置附件上传后缀
		$uploadImg->allowExts = !empty($condition['allowExts']) ? $condition['allowExts'] : array( 'jpg', 'gif', 'png', 'jpeg' );
		// 设置附件上传类型
		$uploadImg->allowTypes = !empty($condition['allowTypes']) ? $condition['allowTypes'] : array( 'image/pjpeg', 'image/jpeg', 'image/jpg', 'image/gif', 'image/png', 'image/x-png', 'image/bmp' );
		// 设置附件上传目录
		$uploadImg->savePath = $condition['savePath'];
		// 删除原图
		$uploadImg->thumbRemoveOrigin = true;
		return $uploadImg;
	}

}

?>
