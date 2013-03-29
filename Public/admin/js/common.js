
/**
+----------------------------------------------------------
* 鼠标移至列表中小图,显示大图
+----------------------------------------------------------
* @access  public
* @param   obj     obj
+----------------------------------------------------------
* @return  void
+----------------------------------------------------------
* @example bigImgShow( $(this) )
+----------------------------------------------------------
*/
function bigImgShow( obj ){
	var viewTools = '<div id="viewTools"></div>';
	if( obj.find("#viewTools div").html() == null ) obj.find("div").after(viewTools);
	if( obj.parent("tr").attr('key') < 6 ) $("#viewTools").addClass('topFive');
	$("#viewTools").html("<img src="+ obj.find("img").attr('src') +" width='200'/>");
}

/**
+----------------------------------------------------------
* 鼠标移走,取消大图
+----------------------------------------------------------
* @access  public
* @param   obj     obj
+----------------------------------------------------------
* @return  void
+----------------------------------------------------------
* @example bigImgHide( $(this) )
+----------------------------------------------------------
*/
function bigImgHide( obj ){
	obj.parent().find("#viewTools").remove();
}


