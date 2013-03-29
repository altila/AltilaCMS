Ext.define('WinRoot.ContentWin', {
	extend: 'Ext.ux.desktop.Module',
	id:'content',
	init : function(){
		var me = this;
		//if(Sys.module[me.id]){
			this.launcher = {
				text: '邦购商城',
				iconCls:'notepad',
				handler : this.createWindow,
				scope: this
			}
		//}
	},
	createWindow : function(){
		var desktop = this.app.getDesktop();
		this.launcher.text = arguments[0];
		var win = desktop.createWindow({
			title :arguments[0],
			height:window.innerHeight,
			width :window.innerWidth,
			html:'<iframe src="/Index/content" width="100%" height="100%" frameborder="no" ></iframe>'
		});
		win.show();
		//return win;
	}
});
