/*广告显示*/

/**
+----------------------------------------------------------
* 逻辑处理方法
+----------------------------------------------------------
*/
var logic = {

	/**
	+----------------------------------------------------------
	* 校验方法
	+----------------------------------------------------------
	*/
	check : {

		/**
		+----------------------------------------------------------
		* 判断是否是指定的类型
		* @obj : 数据（任何类型）
		* @type : 类型（number型）
		* return : bool
		+----------------------------------------------------------
		*/
		isType : function(obj,type){
			var objType = {1:'number',2:'string',3:'boolean',4:'object',5:'function',6:'undefined'};
			return typeof(obj) == objType[type];
		}

	},

	/**
	+----------------------------------------------------------
	* 计算方法
	+----------------------------------------------------------
	*/
	count : {
		
		/**
		+----------------------------------------------------------
		* 计算数组一维值数量
		* @obj : arr、obj
		* return : number
		+----------------------------------------------------------
		*/
		objSize : function(obj) {
			var size = 0, key;
			for (key in obj) {
				if (obj.hasOwnProperty(key)) size++;
			}
			return size;
		}

	},

	/**
	+----------------------------------------------------------
	* 显示数据处理
	+----------------------------------------------------------
	*/
	handle : {
	
		/**
		+----------------------------------------------------------
		* 根据ad_order展示不同顺序  0:按排期;1:按权重
		* @data : arr、obj
		* return : obj
		+----------------------------------------------------------
		*/
		handleData : function(data){
			switch( data['afCode'] ){
				case 'adCarousel':
					return this.accordSchedule(data);
					break;
				default:
					return this.accordPriority(data);
					break;
			}
		},

		/**
		+----------------------------------------------------------
		* 按排期顺序展示数据
		* @data : arr、obj
		* return : obj
		+----------------------------------------------------------
		*/
		accordSchedule : function(data){
			var _data = new Array,list = this.accordPriority(data),nowTime = new Date().getTime() / 1000;
			for( y in data['list'] ){
				_data[data['list'][y]['adid']] = data['list'][y];
			}
			for( x in data['schedule'] ){
				if( nowTime >= data['schedule'][x]['start_time'] && nowTime <= data['schedule'][x]['end_time'] ){
					var i = data['schedule'][x]['sort'] - data['sum'];
					if( typeof(_data[data['schedule'][x]['adid']]) != 'undefined' )
						list[i] = _data[data['schedule'][x]['adid']];
				}
			}
			return list;
		},

		/**
		+----------------------------------------------------------
		* 按权重顺序展示数据
		* @data : arr、obj
		* return : obj
		+----------------------------------------------------------
		*/
		accordPriority : function(data){
			var list = new Array,i = 0;
			for( x in data['list'] ){
				if( i < data['sum'] ){
					list[x] = data['list'][x];
					i++;
				}
			}
			return list;
		}

	}

}


/**
+----------------------------------------------------------
* html拼接方法
+----------------------------------------------------------
*/
var htmlStr = {

	/**
	+----------------------------------------------------------
	* 基础Html
	+----------------------------------------------------------
	*/
	basis : {
		
		/**
		+----------------------------------------------------------
		* html中单一Img标签拼接方法
		* @data : arr、obj
		* return : str
		+----------------------------------------------------------
		*/
		imgOne : function(data){
			if( !logic.check.isType(data,4) ) return;
			return '<img alt="' + data['name'] + '" src="' + data['content'] + '" height="' + data['height'] + '" width="' + data['width'] + '" border="0">';
		},

		/**
		+----------------------------------------------------------
		* html中单一A标签拼接方法
		* @data : arr、obj
		* return : str
		+----------------------------------------------------------
		*/
		AOne : function(data){
			if( !logic.check.isType(data,4) ) return;
			return '<a ad="' + data['adid'] + '" style="' + data['aiStyle'] + '" title="' + data['name'] + '" href="' + data['content'] + '" target="_blank">' + data['name'] + '</a>';
		},

		/**
		+----------------------------------------------------------
		* html中单一A加Img标签拼接方法
		* @data : arr、obj
		* return : str
		+----------------------------------------------------------
		*/
		divAImgOne : function(data){
			if( !logic.check.isType(data,4) ) return;
			return '<div ad="' + data['id'] + '" style="' + data['aiStyle'] + '"><a title="' + data['name'] + '" href="' + data['content'] + '" target="_blank">' + this.imgOne( data ) + '</a></div>';
		},

		/**
		+----------------------------------------------------------
		* html中单一div加Img标签拼接方法
		* @data : arr、obj
		* @isClose : 1有关闭按钮；0无关闭按钮（默认）
		* return : str
		+----------------------------------------------------------
		*/
		divImgOne : function(data,isClose){
			if( !logic.check.isType(data,4) ) return;
			return '<div style="' + data['aiStyle'] + '">' + this.imgOne( data ) + ( (isClose == 0) ? '' : '<em class="icon btn_close_1">关闭</em>' ) + '</div>';
		},

		/**
		+----------------------------------------------------------
		* flash
		* @data : arr、obj
		* return : str
		+----------------------------------------------------------
		*/
		flashOne : function(data){
			if( !logic.check.isType(data,4) ) return;
			return '<div ad="' + data['id'] + '"><object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="' + data['width'] + '" height="' + data['height'] + '" id="' + data['aiStyle'] + '" align="middle"><param name="movie" value="' + data['content'] + '" /><param name="quality" value="high" /><param name="bgcolor" value="#00a0ea" /><param name="play" value="true" /><param name="loop" value="true" /><param name="wmode" value="opaque"><param name="scale" value="showall" /><param name="menu" value="true" /><param name="devicefont" value="false" /><param name="salign" value="" /><param name="allowScriptAccess" value="sameDomain" /><!--[if !IE]>--><object type="application/x-shockwave-flash" data="' + data['content'] + '" width="760" height="418"><param name="movie" value="' + data['content'] + '" /><param name="quality" value="high" /><param name="bgcolor" value="#00a0ea" /><param name="play" value="true" /><param name="loop" value="true" /><param name="wmode" value="opaque"><param name="scale" value="showall" /><param name="menu" value="true" /><param name="devicefont" value="false" /><param name="salign" value="" /><param name="allowScriptAccess" value="sameDomain" /><!--<![endif]--><a href="http://www.adobe.com/go/getflash"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="获得 Adobe Flash Player" /></a><!--[if !IE]>--></object><!--<![endif]--></object></div>'
		},

		/**
		+----------------------------------------------------------
		* html中多个A标签拼接方法
		* @data : arr、obj
		* return : str
		+----------------------------------------------------------
		*/
		AMore : function(data){
			if( !logic.check.isType(data,4) ) return;
			var str = '',x;
			for( x in data){
				str += this.AOne( data[x] );
			}
			return str;
		}

	},

	/**
	+----------------------------------------------------------
	* 广告Html
	+----------------------------------------------------------
	*/
	ad : {

		/**
		+----------------------------------------------------------
		* 无效果图html拼接
		* @html : 组合的html代码
		* @data : arr、obj
		* @sum : int(显示广告个数)
		* @arr : arr(按顺序显示的广告id)
		* return : str
		+----------------------------------------------------------
		*/
		adOriginal : function(html,data){
			return html;
		},

		/**
		+----------------------------------------------------------
		* 轮播图html拼接
		* @html : 组合的html代码
		* @data : arr、obj
		* return : str
		+----------------------------------------------------------
		*/
		adCarousel : function(html,data){
			var shtml= '';
			html = html.replace(/src="/g,'src="' + defaultImg + '" rel="');
			return '<div class="adCarousel_' + data['apCode'] + '">' + html + '</div>' ;
		}


	}

};



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
				times: 5000
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
			//大于1张广告图片时，显示数字按钮
			if (count > 1) {
				obj.append(ulcontent);
			}

			obj.children("div").eq(0).find("img").each(function(){
				$(this).attr("src",$(this).attr("rel"));
			});
			
			obj.children("div:not(:first-child)").hide();
			obj.find("li").eq(0).addClass("active");
			obj.find("li").mouseover(function(){
				i = $(this).text()-1;
				n = i;
				if (n >= count) return;
				obj.children("div").filter(":visible").fadeOut(200,function(){
					$(this).parent().children().eq(n).fadeIn(200);
				});
				
				obj.children("div").eq(n).find("img").each(function(){
					if($(this).attr("src") != $(this).attr("rel")){
						$(this).attr("src", $(this).attr("rel"));
					}
				});
				
				$(this).addClass("active").siblings().removeClass("active");
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
				obj.children("div").filter(":visible").fadeOut(200,function(){
					$(this).parent().children().eq(n).fadeIn(200);
				});
				
				obj.children("div").eq(n).find("img").each(function(){
					if($(this).attr("src") != $(this).attr("rel")){
						$(this).attr("src", $(this).attr("rel"));
					}
				});
				
				obj.find("li").eq(n).addClass("active").siblings().removeClass("active");
			}
		}
	});
})(jQuery);

/**
+----------------------------------------------------------
* 首页轮播图效果
* media_type: 1 图片广告,2 Flash,3 广告代码,4 文字广告,5 广告魔方
+----------------------------------------------------------
*/
function adShow( adposid ){
	if( typeof(adList) == 'undefined' ) return;
	var params = {adposid:adposid},i = 0,adArr,_adArr,id_array = adposid.split(",");
	$(id_array).each(function(){
		if( adList == null || typeof(adList) == 'undefined' || typeof(adList[id_array[i]]) == 'undefined' ) return true;
		_adArr = logic.handle.handleData(adList[id_array[i]]);
		adArr = ( typeof(_adArr) != 'undefined' ) ? _adArr : adList['178']['list'];
		if( typeof(adArr['0']) == 'undefined' ) return true;
		var html = '',_i = 0;
		for( x in adArr ){
			if( _i >= adArr[x]['ad_sum'] ) break;
			switch( adArr[x]['media_type'] ){
				case '1':
					html += htmlStr.basis.divAImgOne( adArr[x] );
					break;
				case '2':
					html += htmlStr.basis.flashOne( adArr[x] );
					break;
				default:
					html += '<div ad="' + adArr[x]['id'] + '" style="' + adArr[x]['class'] + '">' + adArr[x]['code'] + '</div>';
					break;
			}
			_i++;
		}
		$('#ad_'+id_array[i]).html(htmlStr.ad[adList[id_array[i]]['afCode']]( html,adList[id_array[i]] ) );
	});
	if( typeof(adList[id_array[i]]) != 'undefined' && adList[id_array[i]]['afCode'] == 'adCarousel' ) 
		$('.adCarousel_' + adList[id_array[i]]['apCode']).slide();
}


//广告自动运行
$(document).ready(function(){
	$("div[ap^='ad_']").each(function(){
		var adPosId = $(this).attr("ap").substr(3);
		if( adPosId != '' ) {
			adShow(adPosId);
		}
	});
});

