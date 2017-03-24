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
class FormContentServiceModel extends SInfoBaseModel {

	protected $trueTableName = 'base_form_content';

	/**
	+----------------------------------------------------------
	* 保存数据
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	*/
	public function setValue( $condition = array(), $field = '', $order = '', $limit = '' ) {
		if( empty($condition['smid']) || empty($condition['sid']) )
			return array( 'data'=>array( 'info'=>"非法获取", 'status'=>0 ), 'info'=>"获取失败", 'status'=>0 );
		//获取表单信息
		$infoModel = D( "BaseService/FormInfoService" );
		$pk = $infoModel->getPk();
		$formInfo = $infoModel->getListBySmid( array( 'smid'=>$condition['smid'], 'sid'=>$condition['sid'], 'appdcode'=>$condition['appdcode'] ) );
		foreach( $formInfo as $key=>$val ) {
			$content = $condition['content'][$val[$pk]];
			$content = !is_array($content) ? $content : implode(',',$content);
			//非空验证
			if( $val['is_required'] == 1 && empty($content) )
				return array( 'data'=>array( 'data'=>'', 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>$val[$pk],'msg'=>'不能为空') ), 'info'=>"获取失败", 'status'=>0 );
			//长度验证
			if( strlen($content) > $val['input_length'] )
				return array( 'data'=>array( 'data'=>'', 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>$val[$pk],'msg'=>"超过{$val['input_length']}个字符") ), 'info'=>"获取失败", 'status'=>0 );
			//手机验证
			if( ( strpos($val['key'],'phone') !== false || strpos($val['key'],'mobile') !== false ) && ( !preg_match('/^1[3458]{1}[0-9]{9}$/', $content) || strlen($content) != 11 ) )
				return array( 'data'=>array( 'data'=>'', 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>$val[$pk],'msg'=>"请正确填写手机") ), 'info'=>"获取失败", 'status'=>0 );
			//邮箱验证
			if( strpos($val['key'],'email') !== false && !preg_match('/^[\w-]+@[\w-]+[\.][a-z]{2,3}([\.][a-z]{2})?$/i', $content) )
				return array( 'data'=>array( 'data'=>'', 'info'=>"提交失败", 'status'=>0, 'extra'=>array('field'=>$val[$pk],'msg'=>"请正确填写邮箱") ), 'info'=>"获取失败", 'status'=>0 );
		}
		$condition['content'] = json_encode($condition['content']);
		return parent::setValue( $condition, $field, $order, $limit );
	}

}

?>
