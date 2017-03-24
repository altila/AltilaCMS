$(function() {


});


// 加载外部js
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
