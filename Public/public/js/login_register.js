/**
+----------------------------------------------------------
* 登陆注册公共方法
+----------------------------------------------------------
*/
var loginRegister = new Object();
//参数,json格式
loginRegister.params = '';
//回调方法
loginRegister.response = function () {}

/**
+----------------------------------------------------------
* ajax获取登陆注册页
+----------------------------------------------------------
* @access  public
* @param   string     obj          对象名称
* @param   string     type         类型：Login为登陆，Register为注册
+----------------------------------------------------------
* @example loginRegister.ajaxIndex( obj, type )
+----------------------------------------------------------
*/
loginRegister.ajaxIndex = function ( obj, type ) {
	if( typeof type == 'undefined' ) return false;
	$.ajax({
		type: "get",
		dataType: "json",
		url: consts('User')+'/'+type+'/ajaxIndex?',
		data: loginRegister.params,
		success: function (data) {
			if( data.status !== 1 ) return false;
			$(obj).html(data.data);
			loginRegister.response();
		}
	});
}

/**
+----------------------------------------------------------
* ajax校验是否登录
+----------------------------------------------------------
* @access  public
* @param   str     type         类型：Login为登陆，Register为注册
+----------------------------------------------------------
* @example loginRegister.ajaxIndex( type )
+----------------------------------------------------------
*/
loginRegister.checkLogin = function () {
	var params = '';
	$.getJSON( consts('User')+'/Check/checkLogin?callback=?&time='+Math.random(), params, function(data) {
		if( data.status == 1 )
			$("#loginRegister").html(data.data);
	});
}

