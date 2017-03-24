//默认规则
var expand = {rules:{},messages:{}};
//默认的提示
(function ($) {
	$.extend($.validator.messages, {
		required: "必选字段",
		remote: "请修正该字段",
		email: "请输入正确格式的电子邮件",
		url: "请输入合法的网址",
		date: "请输入合法的日期",
		dateISO: "请输入合法的日期 (ISO).",
		number: "请输入合法的数字",
		digits: "只能输入整数",
		creditcard: "请输入合法的信用卡号",
		equalTo: "请再次输入相同的值",
		accept: "请输入拥有合法后缀名的字符串",
		maxlength: $.validator.format("请输入一个长度最多是 {0} 的字符串"),
		minlength: $.validator.format("请输入一个长度最少是 {0} 的字符串"),
		rangelength: $.validator.format("请输入一个长度介于 {0} 和 {1} 之间的字符串"),
		range: $.validator.format("请输入一个介于 {0} 和 {1} 之间的值"),
		max: $.validator.format("请输入一个最大为 {0} 的值"),
		min: $.validator.format("请输入一个最小为 {0} 的值")
	});
}(jQuery));

// 用户名验证/^[A-Za-z\u4e00-\u9fa5]+\d+[\w\u4e00-\u9fa5]*$|[\w\u4e00-\u9fa5]+$/
jQuery.validator.addMethod("useridCheck", function(value, element) {
	if(/^[A-Za-z\u4e00-\u9fa5]+[\w\u4e00-\u9fa5]*$/.test(value))return true;
	return false;
}, "以中、英文开头，与数字、下划线组成");
// 字符验证
jQuery.validator.addMethod("stringCheck", function(value, element) {
	return this.otional(element) || /^[\u0391-\uFFE5\w]+$/.test(value);
}, "只能包括中文字、英文字母、数字和下划线");
// 密码安全
jQuery.validator.addMethod("isPassword", function(value, element) {
	if(/^[A-Za-z0-9]+$/.test(value))return true;
	return false;
}, "只能用数字、字母组成");
// 身份证号码验证
jQuery.validator.addMethod("isIdentityCard", function(value, element) {
	var isIdentityCard = /^\d{15}$|^\d{17}([0-9]|X)$/;
	return this.optional(element) || isIdCardNo(value);
}, "请正确填写您的身份证号码");
// 手机号码验证
jQuery.validator.addMethod("isMobile", function(value, element) {
	var length = value.length;
	var mobile = /^1[3458]{1}[0-9]{9}$/;
	return this.optional(element) || (length == 11 && mobile.test(value));
}, "请正确填写您的手机号码");
// 邮政编码验证
jQuery.validator.addMethod("isZipCode", function(value, element) {
	var tel = /^[0-9]{6}$/;
	return this.optional(element) || (tel.test(value));
}, "请正确填写您的邮政编码");

/**
 * +---------------------------------------------------------- 
 * 报错信息和提示信息 http://www.cnblogs.com/hejunrex/archive/2011/11/17/2252193.html
 * +----------------------------------------------------------
 * @access public
 * +----------------------------------------------------------
 * @param string  obj
 * @param string  action
 * @param string  Request
 * @param string  Response
 * @param string  errorsite
 * @param object  expand
 * +----------------------------------------------------------
 */
function fromvalidate(obj, action, Request, Response, errorsite, expand) {
	//提示信息
	$(obj).find(":input").each(function(){
		$(this).blur(function(){
			$(this).parent().find(errorsite).html('&nbsp;');
		}).focus(function(){
			if( $(this).parent().find(errorsite).html() == '&nbsp;' && $(this).attr('tips') != undefined )
				$(this).parent().find(errorsite).html($(this).attr('tips'));
		});
	});
	//表单验证、AJAX提交等
	$(obj).validate({
		errorPlacement : function(error, element) {
			// 显示错误提示信息
			element.parent().find(errorsite).html("&nbsp;");
			error.prependTo(element.parent().find(errorsite));
		},
		submitHandler : function() {
			// 验证后提交动作（AJAX表单提交）
			var options = {
				beforeSubmit : Request,
				success : Response,
				url : action + "?time="+Math.random()+"&callback=?",
				type : 'get',
				dataType : 'json'
			};
			$(obj).ajaxSubmit(options);
		},
		ignore: ".ignore",
		errorClass : "red",
		//errorElement : "span",
		focusInvalid : false,
		onkeyup : false,
		rules : expand.rules,
		messages : expand.messages
	});
}

/**
 * +---------------------------------------------------------- 
 * AJAX表单提交(执行前触发函数)
 * +----------------------------------------------------------
 * @access public
 * +----------------------------------------------------------
 * @param array   formData
 * @param string  jqForm
 * @param string  options
 * +----------------------------------------------------------
 */
function Request(formData, jqForm, options) {
	return true;
}

/**
 * +---------------------------------------------------------- 
 * AJAX表单提交(执行后触发函数)
 * +----------------------------------------------------------
 * @access public
 * +----------------------------------------------------------
 * @param array   responseText
 * @param string  statusText
 * +----------------------------------------------------------
 */
function Response(responseText, statusText) {
	return true;
}

