Ext.define('WinRoot.SystemWin', {
	extend: 'Ext.ux.desktop.Module',
	id:'system',
	init : function () {
		var me = this;
		//if(Sys.module[me.id]){
			me.launcher = {
				text: '系统管理1',
				iconCls:'accordion-shortcut',
				handler : me.createWindow,
				scope: me
			}
		//}
	},
	createWindow : function () {
		var me = this;
		Ext.application({
			name: 'System',
			appFolder: EXTAPPS + '/system',
			controllers: [
				"MainController"
			],
			launch: function () {
				var desktop = me.app.getDesktop();
				var win = desktop.createWindow({
					title: "系统管理2",
					maximized:true,
					layout:'border',
					items: [{
						region:"center",
						xtype: "systemplate",
						height:565
					}]
				});
				win.show();
			}
		});
		//return win;
	}
});
