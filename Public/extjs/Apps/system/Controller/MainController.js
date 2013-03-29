Ext.define('System.controller.MainController', {
	extend: 'Ext.app.Controller',
	views: [
		'Main.MainMenuView',
		'Main.MainPlateView',
	],
	init: function () {
		this.Control_content_arr = {}; //记录实例化过的Controller
		this.hasInit = {};
		this.control({
			//菜单点击
			'userMenuX':{
				itemclick:this.myfun
			}
		});
	},
	myfun: function(grid, record) {
		var Controller = record.get('id');
		var Cname      = record.get('text');
		//在显示区创建新tabpanel
		if(!this.MainContent) this.MainContent = Ext.getCmp('memberMainContent');
		var n = this.MainContent.getComponent(Controller);
		if(!n){
			if(!this.Control_content_arr[Controller]){    //判断是否实例化过该controller
				var c = this.application.getController(Controller+'Controller');
				c.init();
				this.Control_content_arr[Controller] = {
					id: Controller,
					title: Cname,
					layout:'border',
					closable: true,
					xtype: Controller+'Plate'
				};
			}
			n = this.MainContent.add(this.Control_content_arr[Controller]);
			this.MainContent.setActiveTab(n);
		}else{
			this.MainContent.setActiveTab(n);
		}
	}
});
