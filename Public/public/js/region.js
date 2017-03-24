var region = new Object();

/**
+----------------------------------------------------------
* 获取地区数据 【国家\省\市\区】
+----------------------------------------------------------
* @access  public
* @param   int     parent_id     父级ID
* @param   str     selName       目标列表框的名称
+----------------------------------------------------------
*/
region.loadRegions = function(parent_id, selName) {
	if( typeof parent_id == 'string' && parent_id == '' ) return false;
	var params={parent_id:parent_id, getType:'JSON_CALLBACK'};
	$.getJSON( consts('Api')+'/Region?time='+Math.random()+'&callback=?', params, function(data){
		var sel = document.getElementById(selName);
		if (data.data) {
			for (i = 0; i < data.data.length; i ++ ) {
				var opt = document.createElement("OPTION");
				opt.value = data.data[i].baid;
				opt.text  = data.data[i].name;
				sel.options.add(opt);
			}
		}
	});
}

/**
+----------------------------------------------------------
* 获取地区数据 【国家\省\市\区】
+----------------------------------------------------------
* @access  public
* @param   obj     obj           下拉列表
* @param   str     selName       目标列表框的名称
+----------------------------------------------------------
*/
region.changed = function(obj, selName) {
	var parent_id = obj.options[obj.selectedIndex].value;
	region.loadRegions(parent_id, selName);
}

/**
+----------------------------------------------------------
* 获取省份数据
+----------------------------------------------------------
* @access  public
* @param   int     parent_id     国家的编号
* @param   str     selName       目标列表框的名称
+----------------------------------------------------------
*/
region.loadProvinces = function(parent_id, selName) {
	var objName = (typeof selName == "undefined") ? "province" : selName;
	region.loadRegions(parent_id, objName);
}

/**
+----------------------------------------------------------
* 获取城市数据
+----------------------------------------------------------
* @access  public
* @param   int     parent_id     省份的编号
* @param   str     selName       目标列表框的名称
+----------------------------------------------------------
*/
region.loadCities = function(parent_id, selName, isCity) {
	var objName = (typeof selName == "undefined") ? "city" : selName;
	region.loadRegions(parent_id, objName);
}

/**
+----------------------------------------------------------
* 获取区域数据
+----------------------------------------------------------
* @access  public
* @param   int     parent_id     城市的编号
* @param   str     selName       目标列表框的名称
+----------------------------------------------------------
*/
region.loadDistricts = function(parent_id, selName,isCity) {
	var objName = (typeof selName == "undefined") ? "district" : selName;
	region.loadRegions(parent_id, objName);
}

