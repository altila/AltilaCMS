Ext.define("System.view.Main.MainPlateView", {
	extend:"Ext.panel.Panel",
	alias: "widget.systemplate",
	defaults:{
		split:true,
		bodyStyle:'padding:1px'
	},
	layout:'border',
	items:[{
		title:'操作列表',
		region:'west',
		iconCls:'dept_tree',
		xtype:'panel',
		margins:'5 2 5 5',
		width: 200,
		collapsible:true,//可以被折叠
		id:'west-tree',
		layout:'fit',
		items:[{
			xtype:'userMenuX',
		}]
	},{
		iconCls:'dept_table',
		region:'center',
		xtype:'panel',
		id:'user-center-grid',
		margins:'5 5 5 0',
		layout:'fit',
		items:[{
			id:'memberMainContent',
			closeAction:'hide',
			xtype: "tabpanel",
			items:[]
		}]
	}]
});
