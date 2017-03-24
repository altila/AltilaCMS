<?php
/**
* 基础Excel类
* @package BaseExcel
* @version $Id$
*/

class BaseExcel {

	/**
	+----------------------------------------------------------
	* Excel写入【入口】
	+----------------------------------------------------------
	*/
	static function write( $params, $type ) {
		$type = $type ? $type : 'xls';
		$action = "write" . ucfirst($type);
		self::$action( $params );
	}

	/**
	+----------------------------------------------------------
	* Excel读取【入口】
	+----------------------------------------------------------
	*/
	static function read( $params ) {
		$type = $type ? $type : 'xls';
		$action = "read" . ucfirst($type);
		self::$action( $params );
	}

	/**
	+----------------------------------------------------------
	* xls写入
	+----------------------------------------------------------
	* @access  public
	* @param   array      $params      参数
	*       @param   string     filename       文件名称
	*       @param   array      content        内容【四维数组】
	*             @param   string     sheet          工作表名
	*             @param   array      data           数据【第一行数据为标题】
	*             @param   array      selectBox      下拉框
	+----------------------------------------------------------
	* @return  void
	+----------------------------------------------------------
	*/
	static function writeXls( $params ) {
		//print_r($params);exit;
		import("ORG.Vendor.PHPExcel.PHPExcel",LIB_PATH,'.php');
		$objPHPExcel = new PHPExcel();
		$objPHPExcel->getProperties()->setCreator("Maarten Balliauw")
							 ->setLastModifiedBy("Maarten Balliauw")
							 ->setTitle("Office 2007 XLSX Test Document")
							 ->setSubject("Office 2007 XLSX Test Document")
							 ->setDescription("Test document for Office 2007 XLSX, generated using PHP classes.")
							 ->setKeywords("office 2007 openxml php")
							 ->setCategory("Test result file");
		####################################################################
		$filename = $params['filename'];
		$contents = $params['content'];
		foreach( $contents as $keys=>$vals ) {
			//工作表
			$sheet = str_replace('/','_',$vals['sheet']); //工作表不允许特殊字符
			if( $keys > 0 ) $objPHPExcel->createSheet();
			$objPHPExcel->setActiveSheetIndex($keys);
			$objActSheet = $objPHPExcel->getActiveSheet($keys);
			$objPHPExcel->getActiveSheet($keys)->setTitle($sheet);
			//数据
			foreach( $vals['data'] as $key=>$val ) {
				foreach( $val as $k=>$v ) {
					$i = self::getCellId($k+1) . ( $key + 1 );
					$value = is_array($v) ? $v[0] : $v;
					if( $k != 0 ) {
						$objActSheet->setCellValueExplicit($i , $value , PHPExcel_Cell_DataType::TYPE_STRING);
						$objValidation = $objActSheet->getCell($i)->getDataValidation();
					} else
						$objActSheet->setCellValue($i,$value);//标题
					// 内容标红色
					if( is_array($v) ) $objActSheet->getStyle($A1)->getFont()->getColor()->setARGB(PHPExcel_Style_Color::COLOR_RED);
					//下拉框
					$selectBoxs = $vals['selectBox'];
					if( $k != 0 && !empty($selectBoxs[$k]) ) {
						$selectItems = $selectBoxs[$k];
						if( is_array($selectItems) ) $selectItems = implode( ',', array_diff($selectItems,array(null)) );
						if(  strlen( str_replace(",","",$selectItems) )  <= 255 ) { //这里如用continue 会导致单元格错误
							$objValidation->setType( PHPExcel_Cell_DataValidation::TYPE_LIST  )
								->setErrorStyle( PHPExcel_Cell_DataValidation::STYLE_INFORMATION )
								->setAllowBlank(true)	#这可false
								->setShowInputMessage(true)
								->setShowErrorMessage(true)
								->setShowDropDown(true)
								->setErrorTitle('输入的值有误')
								->setError('您输入的值不在下拉框列表内.')
								->setPromptTitle('请从下拉框中选择您需要的值')
								->setPrompt('下拉复制列表框')
								->setFormula1('"'. $selectItems .'"');
						}
					}
				}
			}
			
		}
		####################################################################
		// Set active sheet index to the first sheet, so Excel opens this as the first sheet
		$objPHPExcel->setActiveSheetIndex(0);
		// IE pop-up box when download resolve file name garbled
		if( preg_match('/MSIE/',$_SERVER['HTTP_USER_AGENT']) ) $filename = rawurlencode($filename);
		// Clear the buffer, to avoid distortion
		ob_end_clean();
		// Redirect output to a client’s web browser (Excel5)
		header('Content-Type: application/vnd.ms-excel');
		//header('Content-Disposition: attachment;filename="'.$filename.'"');
		header('Content-Disposition: attachment;filename="'.$filename.'.xls"');
		header('Cache-Control: max-age=0');
		// If you're serving to IE 9, then the following may be needed
		header('Cache-Control: max-age=1');
		// If you're serving to IE over SSL, then the following may be needed
		header ('Expires: Mon, 26 Jul 1997 05:00:00 GMT'); // Date in the past
		header ('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT'); // always modified
		header ('Cache-Control: cache, must-revalidate'); // HTTP/1.1
		header ('Pragma: public'); // HTTP/1.0
		$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
		$objWriter->save('php://output');
	}


	/**
	+----------------------------------------------------------
	* xls计算列号
	+----------------------------------------------------------
	* @access  public
	* @param   array      $index      索引值
	+----------------------------------------------------------
	* @return  void
	+----------------------------------------------------------
	*/
	public function getCellId( $index ) {
		$index = (int)$index;
		if( $index <= 0 ) return;
		// 算结果一共有几位，实际算的是位数减1，记住是26进制的位数
		$dimension = ceil(log(25 * $index + 26, 26)) - 1;
		// 算结果在所在位数总数中排第几个
		$n = $index - 26 * (pow(26, $dimension- 1) - 1) / 25;
		// 转化为索引
		$n--;
		//翻译加补齐
		$result = str_pad( str_replace( array_merge(range(0, 9), range('a', 'p')), range('A', 'Z'), base_convert($n, 10, 26) ), $dimension, 'A', STR_PAD_LEFT);
		return $result;
	}

}
?>
