$(function() {

	// select下拉菜单美化
	if ($("select").length != 0) {
		loadjs("js/slide.js", function() {
			$("#banner").slide();
		});
	}

	// 导航下拉菜单
	$("#nav ul").first().children("li").each(function() {
		$(this).hover(function() {
			$(this).children("a").toggleClass("hover");
			$(this).children("ul").toggleClass("sub_nav_show");
		});
	});

	// 登录页和首页的tab效果
	tabs("#login_panel");

	// select下拉菜单美化
	if ($("select").length != 0) {
		loadjs("js/selectCss.js", function() {
			$("select").selectCss(); 
		});
	}

	// 方便在低级浏览器下控制radio元素
	$("input:radio").addClass("radio");

	// placeholder效果
	$("#search input.form-control, #sider_search input.default, #sider_comment textarea").focus(function(){
		$(this).addClass("focus");
		if($(this).val() ==this.defaultValue){  
			$(this).val("");
		}
	}).blur(function(){
		$(this).removeClass("focus");
		if ($(this).val() == '') {
			$(this).val(this.defaultValue);
		}
	});
	
	// 调用（文本域和文本区域获取焦点）
	inputAddFocus();


	// 点击登录显示用户登录弹窗
	$(".user_login").click(function() {
		showLogin('用户登录');
	});

	/*
	 * 针对 ie6 
	 */
	ie6Fix();
});


var pop_window = {}
pop_window = {
	open: function(title) {
		var popWindow  = '<div id="pop_window">';
			popWindow += '<div class="title"><h3>'+title+'</h3><a href="#" class="close">x</a></div>';
			popWindow += '<div class="content"></div>';
			popWindow += '</div>';
			popWindow += '<div id="over_layer"></div>';

		$("body").append(popWindow);
	},
	close: function() {
		var pop 		  = $("#pop_window");
		var pop_overLayer = $("#over_layer");
		pop.remove();
		pop_overLayer.remove();
	}
}

// 文本域和文本区域获取焦点
function inputAddFocus() {
	$("textarea, input:text, input:password").focus(function() {
		$(this).addClass("focus");
	}).blur(function() {
		$(this).removeClass("focus");
	});
}

function loadjs(url,callback) {
	var head = document.getElementsByTagName("head")[0];
	var script = document.createElement('script');
	script.onload = script.onreadystatechange = script.onerror = function (){
		if (script && script.readyState && /^(?!(?:loaded|complete)$)/.test(script.readyState)) return;
		script.onload = script.onreadystatechange = script.onerror = null;
		script.src = '';
		script.parentNode.removeChild(script);
		script = null;
		callback();
	}
	// script.charset = "utf-8";
	script.src = url;
	try {
		head.appendChild(script);
	} catch (exp) {}
}


//用户登录弹窗
function showLogin(title) {
	pop_window.open(title);

	var pop  		  = $("#pop_window");
	var pop_content	  = pop.find(".content");

	var loginPanel  = '';
		loginPanel += '<div class="tab">';
		loginPanel += '	<ul class="tab_menu">';
		loginPanel += '		<li class="actived">学生</li>';
		loginPanel += '		<li>老师</li>';
		loginPanel += '	</ul>';
		loginPanel += '	<div class="tab_con" style="display: block;">';
		loginPanel += '		<form name="student_login">';
		loginPanel += '			<div class="error_info">请输入用户名</div>';
		loginPanel += '			<label for="student_user">';
		loginPanel += '				<span>用户名：</span>';
		loginPanel += '				<input type="text" name="user_name" id="" class="default error"/>';
		loginPanel += '			</label>';
		loginPanel += '			<label for="student_user">';
		loginPanel += '				<span>密码：</span>';
		loginPanel += '				<input type="password" name="user_password" id="" class="default"/>';
		loginPanel += '			</label>';
		loginPanel += '			<input type="button" value="登录" name="submit" class="btn btn_green button_submit"/>';
		loginPanel += '		</form>';
		loginPanel += '	</div>';
		loginPanel += '	<div class="tab_con">';
		loginPanel += '		<form name="teacher_login">';
		loginPanel += '			<div class="error_info">请输入密码</div>';
		loginPanel += '			<label for="student_user">';
		loginPanel += '				<span>用户名：</span>';
		loginPanel += '				<input type="text" name="user_name" id="" class="disabled" value="王老师" disabled/>';
		loginPanel += '			</label>';
		loginPanel += '			<label for="student_user">';
		loginPanel += '				<span>密码：</span>';
		loginPanel += '				<input type="password" name="user_password" id="" class="default error"/>';
		loginPanel += '			</label>';
		loginPanel += '			<input type="button" value="登录" name="submit" class="btn btn_green button_submit"/>';
		loginPanel += '		</form>';
		loginPanel += '	</div>';
		loginPanel += '</div>';

	pop_content.append(loginPanel);

	tabs(pop);

	pop.css({
		marginTop: 	-Math.ceil((pop.find(".content").height() + 40)/2),
		marginLeft: -Math.ceil((pop.find(".content").width() + 10)/2)
	});

	// 点击 ".close" 按钮关闭窗口
	pop.find(".close").click(function(e) {
		pop_window.close();
		e.preventDefault();
	});

	// 点击 窗口外部区域 关闭窗口
	$("#over_layer").click(pop_window.close);

	inputAddFocus();		
}

// tabs选项卡效果
function tabs(tar) {
	var tabs = $(tar);
	 tabs.find(".tab_menu li").each(function(i) {
		$(this).click(function() {
			$(this).addClass("actived").siblings().removeClass("actived");
			tabs.find(".tab_con").eq(i).show().siblings(".tab_con").hide();
		});
	});
}

// 改善ie6下的效果
function ie6Fix() {
	if ($.browser.msie && ($.browser.version == "6.0") && !$.support.style) {
		$(".article_list li, .study_list li").hover(function() {
			$(this).addClass("hover");
		},function() {
			$(this).removeClass("hover");
		});
	}
}