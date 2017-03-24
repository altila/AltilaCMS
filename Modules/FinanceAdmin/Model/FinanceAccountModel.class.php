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
class FinanceAccountModel extends ABaseModel {

	protected $connection = 'DB_FINANCE_CON';
	protected $trueTableName = 'finance_account';

	/**
	+----------------------------------------------------------
	* 信息树 - 多维数组
	+----------------------------------------------------------
	* @access  public
	* @param   arr      $condition      条件:isHtmlModelUser[1,0]
	* @param   str      $field          字段
	* @param   str      $order          排序
	* @param   str      $limit          条数
	+----------------------------------------------------------
	* @return  arr
	+----------------------------------------------------------
	* @example <model model="SiteNode" fun="getTree" condition="menu_show=1" order="" limit="" key="i">
	+----------------------------------------------------------
	*/
	public function getTree( $condition = array(), $field = '', $order = '', $limit = '' ) {
		$isHtmlModelUser = !empty($condition['isHtmlModelUser']) ? $condition['isHtmlModelUser'] : 0;
		$isListTree = !empty($condition['isListTree']) ? $condition['isListTree'] : 0;
		$isShowChild = !empty($condition['isShowChild']) ? $condition['isShowChild'] : 0;
		$isShowList = !empty($condition['isShowList']) ? $condition['isShowList'] : 0;
		unset($condition['isHtmlModelUser'],$condition['isListTree'],$condition['isShowChild'],$condition['isShowList']);
		$order = !empty($order) ? $order : "sort";
		if( $isShowList == 1 ) {
			$_list = $this->where( $condition )->order( $order )->select();
		} else {
			$model = D("FinanceAdmin/FinanceAccountCategory");
			$list = $model->where( $condition )->order( $order )->select();
			foreach( $list as $key=>$val ) {
				if( $val['parent_id'] != 0 ) {
					$list[$key]['type'] = 1;
					$condition['facid'] = $val['facid'];
					$list[$key]['_child'] = $this->where( $condition )->order( $order )->select();
					if( empty($list[$key]['_child']) ) unset($list[$key]);
				}
			}
			$_list = ( $isListTree == 1 ) ? $list : list_to_tree( $list, $model->getPk() );
			foreach( $_list as $key=>$val )
				if( empty($_list[$key]['_child']) ) unset($_list[$key]);
		}
		$result = ( $isHtmlModelUser == 1 ) ? array($_list) : $_list;
		$result = ( $isShowChild == 1 ) ? $result[0]['_child'] : $result;
		return $result;
	}

}

?>
