/**
+----------------------------------------------------------
* 加载css
+----------------------------------------------------------
* @id          需要加载的css的名称
* @url         需要加载的css的路径
* @callback    加载后的回调函数
+----------------------------------------------------------
*/
function loadcss(id, url, callback) {
    var cssId = id;
    if (!document.getElementById(cssId)) {
        var head = document.getElementsByTagName('head')[0];
        var link = document.createElement('link');
        link.id = cssId;
        link.rel = 'stylesheet';
        link.type = 'text/css';
        link.href = url;
        link.media = 'all';
        head.appendChild(link);
        if (arguments.length === 3) {
            callback();
        }
    }
}

/**
+----------------------------------------------------------
* 加载单个js函数
+----------------------------------------------------------
* @url         需要加载的js的路径
* @callback    加载后的回调函数
+----------------------------------------------------------
*/
 function loadjs(url,callback){
    var head = document.getElementsByTagName("head")[0];
    var script = document.createElement('script');
    script.onload = script.onreadystatechange = script.onerror = function (){
        if (script && script.readyState && /^(?!(?:loaded|complete)$)/.test(script.readyState)) return;
        script.onload = script.onreadystatechange = script.onerror = null;
        script.src = '';
        script.parentNode.removeChild(script);
        script = null;
        if (arguments.length === 2) {
            callback();
        }
    }
    script.charset = "gb2312";
    script.src = url;
    try {
        head.appendChild(script);
    } catch (exp) {}
}

/**
+----------------------------------------------------------
* 加载多个js函数
+----------------------------------------------------------
* @url         需要加载的js的路径
* @callback    加载后的回调函数
+----------------------------------------------------------
*/
 function loadmultijs(url,callback){
    if(Object.prototype.toString.call(url)==='[object Array]'){ //是否数组
        this.suc = 0;           //加载计数
        this.len = url.length;  //数组长度
        var a = this;
        for(var i = 0;i < url.length;i++){
            loadjs(url[i],function(){ a.suc++; if(a.suc == a.len) try{callback();}catch(e){} });
        }
    }else if(typeof(url) == 'string'){
        loadjs(url,callback);
    }
}

