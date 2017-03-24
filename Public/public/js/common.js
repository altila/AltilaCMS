/*公共方法*/
var common = new Object();

/************************************************应用效果   开始 ****************************************************/

/**
+----------------------------------------------------------
* UEditor 提交时,内容同步 - 【废弃】
+----------------------------------------------------------
* @access  public
+----------------------------------------------------------
* @return  void
+----------------------------------------------------------
* @example common.editorSync( MODULE_NAME )
+----------------------------------------------------------
*/
common.editorSync = function () {
	$("textarea").each(function(){
		var str = $(this).attr('id');
		if( str.indexOf('editor') != '-1' ) UE.getEditor(str).sync();
	});
}

/**
+----------------------------------------------------------
* 验证码图片
+----------------------------------------------------------
* @access  public
* @param   obj     obj      img对象
+----------------------------------------------------------
* @return  string
+----------------------------------------------------------
* @example common.validPic( $('#verifyImg') )
+----------------------------------------------------------
*/
common.validPic = function ( obj ) {
	$(obj).attr('src', consts('www') + "/Public/verify/" + Math.random());
}

/**
+----------------------------------------------------------
* 播放视频
+----------------------------------------------------------
* @access  public
* @param   condition['swfUrl']     string      视频地址
* @param   condition['id']         string      HTML的ID
* @param   condition['width']      string      视频宽度
* @param   condition['height']     string      视频高度
* @param   condition['version']    string      Flash Player版本
* @param   condition['expressInstallSwfurl']     string      Flash Player下载地址
* @param   condition['picUrl']     string      视频首图
+----------------------------------------------------------
* @return  string
+----------------------------------------------------------
* @example common.showVideo( condition )
+----------------------------------------------------------
*/
common.showVideo = function ( condition ) {
	if( condition['swfUrl'] == '' ) return;
	var swfUrl = condition['swfUrl'],
		id = condition['id'] ? condition['id'] : 'showVideo',
		width = condition['width'] ? condition['width'] : '900',
		height = condition['height'] ? condition['height'] : '540',
		version = condition['version'] ? condition['version'] : '9.0.0',
		expressInstallSwfurl = condition['expressInstallSwfurl'] ? condition['expressInstallSwfurl'] : consts('public') + '/public/flash/expressInstall.swf',
		flashvars = {
			FileID: "H800" + id + ",H300" + id,
			StatSwitch: "1",
			sessID: "",
			AutoPlay: "1",
			picUrl: condition['picUrl'] ? condition['picUrl'] : ''
		}
		params = {
			allowfullscreen: 'true',
			allowScriptAccess: "always",
			wmode: "transparent"
		}
		attributes = {}
	swfobject.embedSWF(swfUrl, id, width, height, version, expressInstallSwfurl, flashvars, params, attributes );
}

/**
+----------------------------------------------------------
* 弹层容器
+----------------------------------------------------------
* @access  public
* @param   string     title       标题
* @param   string     popHtml     html
+----------------------------------------------------------
* @return  string
+----------------------------------------------------------
* @example common.openPopWindow( title, popHtml )
+----------------------------------------------------------
*/
common.openPopWindow = function ( title, popHtml ) {
	$("body","html").css({height: "100%", width: "100%"});
	var _html = "";
	_html += '<div id="pop_window"><table border="0" cellpadding="0" cellspacing="0">';
	_html += '<tr><td class="pop_tl"></td><td class="pop_tc"></td><td class="pop_tr"></td></tr>';
	_html += '<tr>';
	_html += '<td class="pop_cl"></td>';
	_html += '<td class="pop_cc">';
	_html += '<div id="pop_header"><span>'+title+'</span><em class="btn btn_close">关闭</em></div>';
	_html += '<div id="pop_content"><div class="pop_content_inner"></div></div>';
	_html += '</td>';
	_html += '<td class="pop_cr"></td>';
	_html += '</tr>';
	_html += '<tr><td class="pop_bl"></td><td class="pop_bc"></td><td class="pop_br"></td></tr>';
	_html += '</table></div>';
	_html += '<div id="pop_overlay" class="pop_overlay"></div>';
	_html += '<div id="pop_load"></div>';
	$("body").append(_html);
	if( popHtml != '' ) $("#pop_content .pop_content_inner").html(popHtml);
	//判断是否为ie6，是则添加iframe，解决select框的bug
	if ( $.browser.msie && ($.browser.version == "6.0") && !$.support.style )
		$("#pop_overlay").html('<iframe src="" frameborder="0" style="width:100%; height:100%; opacity:0; filter:alpha(opacity=0)"></iframe>');
	$("#pop_header .btn_close, #pop_overlay").click(common.closePopWindow);
}

/**
+----------------------------------------------------------
* 删除弹窗
+----------------------------------------------------------
* @access  public
+----------------------------------------------------------
* @return  string
+----------------------------------------------------------
* @example common.closePopWindow()
+----------------------------------------------------------
*/
common.closePopWindow = function () {
	$("#pop_window").remove();
}


/************************************************应用效果   结束 ****************************************************/

/************************************************逻辑判断   开始 ****************************************************/

/**
+----------------------------------------------------------
* 分页 - 判断直接填写跳转页码是否为空、是否为数字
+----------------------------------------------------------
* @access  public
* @param   obj     form       表单对象
+----------------------------------------------------------
* @return  void
+----------------------------------------------------------
* @example common.isValid(this)
+----------------------------------------------------------
*/
common.isValid = function ( form ) {
	if( form.cp.value == '' || isNaN(form.cp.value) || parseInt(form.cp.value) > parseInt($(".pageNum").last().attr("page")) || form.cp.value <= 0 ){
		alert("请正确填写数字!");
		return false;
	}
	return true;
}

/************************************************逻辑判断   结束 ****************************************************/

