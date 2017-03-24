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
class CheckServiceModel extends HBaseModel {

	protected $connection = 'DB_USER_CON';
	protected $trueTableName = 'user_base';

	/**
	+----------------------------------------------------------
	* 查询数据，并返回验证结果
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  array
	+----------------------------------------------------------
	*/
	public function check( $condition = array(), $field = '', $order = '', $limit = '' ) {
		//是否启用用户表sid
		$condition["sid"] = ( $this->siteInfo[C('DEFAULT_LANG')]['enable_alone_user'] == 0 ) ? 0 : $condition["sid"];
		$count = $this->where($condition)->count();
		if( $count >= 1 )
			return array( 'data'=>false, 'info'=>"校验失败", 'status'=>0, 'extra'=>array('msg'=>'有重复') );
		return array( 'data'=>true, 'info'=>"校验成功", 'status'=>1, 'extra'=>array('msg'=>'未重复') );
	}

	/**
	+----------------------------------------------------------
	* 用户名查询数据，并返回验证结果
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  array
	+----------------------------------------------------------
	*/
	public function user_id( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$map['sid'] = $condition['sid'];
		$map['user_id'] = $condition['user_id'];
		$result = $this->check( $map, $field, $order, $limit );
		$result['extra']['field'] = 'user_id';
		return $result;
	}

	/**
	+----------------------------------------------------------
	* 手机号查询数据，并返回验证结果
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  array
	+----------------------------------------------------------
	*/
	public function mobile( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$map['sid'] = $condition['sid'];
		$map['mobile'] = $condition['mobile'];
		$map['check_mobile'] = 1;
		$result = $this->check( $map, $field, $order, $limit );
		$result['extra']['field'] = 'mobile';
		return $result;
	}

	/**
	+----------------------------------------------------------
	* 邮箱查询数据，并返回验证结果
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  array
	+----------------------------------------------------------
	*/
	public function email( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$map['sid'] = $condition['sid'];
		$map['email'] = $condition['email'];
		$map['check_email'] = 1;
		$result = $this->check( $map, $field, $order, $limit );
		$result['extra']['field'] = 'email';
		return $result;
	}

	/**
	+----------------------------------------------------------
	* 用户名数据格式校验，并返回验证结果
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  array
	+----------------------------------------------------------
	*/
	public function user_user_id( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$regInfo = explode(',',$this->siteInfo[C('DEFAULT_LANG')]['reg_info']);
		if( in_array(1,$regInfo) && empty($condition['user_id']) )
			return array( 'data'=>false, 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>'user_id','msg'=>'用户名不能为空') );
		if( in_array(1,$regInfo) && !preg_match('/^[A-Za-z\x{4e00}-\x{9fa5}]+[\w\x{4e00}-\x{9fa5}]*$/u', $condition['user_id']) )
			return array( 'data'=>false, 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>'user_id','msg'=>'以中、英文开头，与数字、下划线组成') );
		if( in_array(1,$regInfo) && ( strlen($condition['user_id']) < 5 || strlen($condition['user_id']) > 20 ) )
			return array( 'data'=>false, 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>'user_id','msg'=>'用户名长度只能为5-20个字节') );
		$checkUserId = $this->user_id( $condition );
		if( in_array(1,$regInfo) && !$checkUserId['data'] )
			return array( 'data'=>false, 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>'user_id','msg'=>'用户名已存在') );
		return array( 'data'=>true, 'info'=>"提交成功", 'status'=>1 );
	}

	/**
	+----------------------------------------------------------
	* 手机号数据格式校验，并返回验证结果
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  array
	+----------------------------------------------------------
	*/
	public function user_mobile( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$regInfo = explode(',',$this->siteInfo[C('DEFAULT_LANG')]['reg_info']);
		if( in_array(2,$regInfo) && empty($condition['mobile']) )
			return array( 'data'=>false, 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>'mobile','msg'=>'手机号不能为空') );
		if( in_array(2,$regInfo) && ( !preg_match('/^1[3458]{1}[0-9]{9}$/', $condition['mobile']) || strlen($condition['mobile']) != 11 ) )
			return array( 'data'=>false, 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>'mobile','msg'=>'请正确填写您的手机号码') );
		$checkMobile = $this->mobile( $condition );
		if( in_array(2,$regInfo) && !$checkMobile['data'] )
			return array( 'data'=>false, 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>'mobile','msg'=>'手机号已存在') );
		return array( 'data'=>true, 'info'=>"提交成功", 'status'=>1 );
	}

	/**
	+----------------------------------------------------------
	* 邮箱数据格式校验，并返回验证结果
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  array
	+----------------------------------------------------------
	*/
	public function user_email( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$regInfo = explode(',',$this->siteInfo[C('DEFAULT_LANG')]['reg_info']);
		if( in_array(3,$regInfo) && empty($condition['email']) )
			return array( 'data'=>false, 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>'email','msg'=>'邮箱不能为空') );
		if( in_array(3,$regInfo) && !preg_match('/^[\w-]+@[\w-]+[\.][a-z]{2,3}([\.][a-z]{2})?$/i', $condition['email']) )
			return array( 'data'=>false, 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>'email','msg'=>'请正确填写您的邮箱地址') );
		$checkEmail = $this->email( $condition );
		if( in_array(3,$regInfo) && !$checkEmail['data'] )
			return array( 'data'=>false, 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>'email','msg'=>'邮箱已存在') );
		return array( 'data'=>true, 'info'=>"提交成功", 'status'=>1 );
	}

	/**
	+----------------------------------------------------------
	* 密码数据格式校验，并返回验证结果
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  array
	+----------------------------------------------------------
	*/
	public function user_password( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$regInfo = explode(',',$this->siteInfo[C('DEFAULT_LANG')]['reg_info']);
		if( empty($condition['password']) )
			return array( 'data'=>false, 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>'password','msg'=>'密码不能为空') );
		if( !preg_match('/^[A-Za-z0-9]+$/', $condition['password']) )
			return array( 'data'=>false, 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>'password','msg'=>'只能用数字、字母组成') );
		if( strlen($condition['password']) < 6 || strlen($condition['password']) > 16 )
			return array( 'data'=>false, 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>'password','msg'=>'密码长度只能为6-16个字节') );
		if( in_array(4,$regInfo) && empty($condition['repassword']) )
			return array( 'data'=>false, 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>'repassword','msg'=>'确认密码不能为空') );
		if( in_array(4,$regInfo) && $condition['repassword'] != $condition['password'] )
			return array( 'data'=>false, 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>'repassword','msg'=>'两次输入密码不一致') );
		return array( 'data'=>true, 'info'=>"提交成功", 'status'=>1 );
	}

	/**
	+----------------------------------------------------------
	* 用户扩展数据格式校验，并返回验证结果
	+----------------------------------------------------------
	* @access  public
	+----------------------------------------------------------
	* @return  array
	+----------------------------------------------------------
	*/
	public function user_extra( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$regInfo = explode(',',$this->siteInfo[C('DEFAULT_LANG')]['reg_info']);
		if( in_array(5,$regInfo) && empty($condition['sex']) )
			return array( 'data'=>false, 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>'sex','msg'=>'性别不能为空') );
		if( in_array(6,$regInfo) && empty($condition['birthday_y']) )
			return array( 'data'=>false, 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>'birthday_y','msg'=>'年份不能为空') );
		if( in_array(7,$regInfo) && empty($condition['birthday_m']) )
			return array( 'data'=>false, 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>'birthday_m','msg'=>'月份不能为空') );
		if( in_array(8,$regInfo) && empty($condition['birthday_d']) )
			return array( 'data'=>false, 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>'birthday_d','msg'=>'日期不能为空') );
		if( in_array(9,$regInfo) && empty($condition['province']) )
			return array( 'data'=>false, 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>'province','msg'=>'省份不能为空') );
		if( in_array(10,$regInfo) && empty($condition['city']) )
			return array( 'data'=>false, 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>'city','msg'=>'城市不能为空') );
		if( in_array(11,$regInfo) && empty($condition['district']) )
			return array( 'data'=>false, 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>'district','msg'=>'区域不能为空') );
		return array( 'data'=>true, 'info'=>"提交成功", 'status'=>1 );
	}

}

?>
