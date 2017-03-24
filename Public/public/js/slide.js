/**
+----------------------------------------------------------
* 轮播图效果
* times: 设置轮播间隔，默认5000毫秒
+----------------------------------------------------------
*/
(function($) {
	$.fn.extend({
		slide:function(options){
			var defaults = {
					times: 5000,
					height: auto,
					resize: true,
					customize: false
			}
			var options = $.extend(defaults, options);
			var auto = null;
			var obj = $(this);
			obj.addClass("ui_slide");
			var count = obj.children("div").length;
			var n = 0;


			var ulcontent = '<ul>';
			for(var i=1; i<=count; i++){
				ulcontent += "<li>"+i+"</li>";
			}
			ulcontent = ulcontent+"</ul>";

			// 如果设置了轮播区域的高度，则设置的高度
			if (options.height) {
				$(".ui_slide").css({
					"height": options.height,
					"overflow": "hidden"
				});
			}

			// 如果没有自定义高度，系统会自动设置高度
			if (!options.customize) {
				window.onload = function() {
					$(".ui_slide").css({
						"height": obj.children("div").eq(0).find("img").height()
					});
				}
			}

			//大于1张广告图片时，显示数字按钮
			if (count > 1) {
				obj.append(ulcontent);
			}
			
			var ul = obj.children("ul");

			ul.css({
				width: ul.width(),
				marginLeft: - Math.ceil(ul.width()/2)
			});

			obj.children("div").eq(0).find("img").each(function(){
				$(this).attr("src",$(this).attr("original"));

				
			});

			// 是否在改变窗口大小的时候调整轮播区域高度
			if (options.resize) {
	            window.onresize = function Oresize() {
		            $(".ui_slide").css({
						"height": obj.children("div").eq(0).find("img").height()
					});
	            }
            }
			
			// 改变透明度和层高
			obj.children("div").css({
				"opacity": 0,
				"z-index": 0
			});
			obj.children("div").eq(0).css({
				"opacity": 1,
				"z-index": 1
			});
			obj.find("li").eq(0).addClass("active");	

			var lock = 0;
			obj.find("li").click(function() {	
				if(lock == 0) {
					var li = this;

					i = $(li).text()-1;
					n = i;
					if (n >= count) return false;

					lock = 1;

					obj.children("div").eq(n).siblings("div").css("z-index", '0');
					obj.children("div").eq(n).css("z-index", '1').animate({ 
						'opacity': 1
					}, 400, function(){
						obj.children("div").eq(n).siblings("div").css({
							'opacity': 0
						});
						lock = 0;
					});

					//解析图片背景
					obj.children("div").eq(n).find("img").each(function(){
						if($(this).attr("src") != $(this).attr("original")){
							$(this).attr("src", $(this).attr("original"));
						}
					});

					//按钮添加当前选中样式
					$(li).addClass("active").siblings().removeClass("active");
				}
			});
			
			//大于1张广告图片时，执行自动轮播
			if (count > 1) {
				obj.mouseover(function() {
					clearInterval(auto);
				}).mouseout(function() {
					auto = setInterval(showAuto, options.times);
				});
			
				auto = setInterval(showAuto, options.times);
			}

			//自动轮播方法
			function showAuto(){
				n = n >= (count - 1) ? 0 : ++n;
				
				if(n != 0 ) {

					obj.children("div").eq(n).css("z-index", '1').animate({ 
						'opacity': 1
					}, 400, function(){		
						obj.children("div").eq(n-1).css({
							'z-index': 0,
							'opacity': 0
						});
					});

				} else {

					obj.children("div").eq(count-1).animate({ 
						'opacity': 0
					}, 400, function(){
						obj.children("div").eq(count-1).css({
							'z-index': 0
						});
					});

					obj.children("div").eq(n).css({
						'z-index': 1,
						'opacity': 1
					});

				}

				obj.children("div").eq(n).find("img").each(function(){					
                    if($(this).attr("src") != $(this).attr("original")){
						$(this).attr("src", $(this).attr("original"));
					}
                });
				
				obj.find("li").eq(n).addClass("active").siblings().removeClass("active");
			}
		}
	});
})(jQuery);