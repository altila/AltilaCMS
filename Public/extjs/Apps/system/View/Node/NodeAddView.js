Ext.define('System.view.Node.NodeAddView', {
	extend:"Ext.form.Panel",
	id:'nodeAdd',
	alias: 'widget.nodeAddX',
	layout: 'anchor',
	bodyPadding: 5,
	frame: true,
	defaults: {
		labelAlign: "top",
		labelWidth:  30
	},
	defaultType: 'textfield',
	items:[{
		xtype: "fieldset",
		title:"详情",
		defaults: {
			width: 190,
			labelWidth: 70
		},
		defaultType: "textfield",
		items: [{
			name: 'id',
			id: 'nodeId',
			xtype : 'hidden'
		},{
			name: 'parent_id',
			id  : 'nodePid',
			xtype : 'hidden'
		},{
			fieldLabel: '节点名称',
			name: 'name',
			allowBlank: false
		},{
			fieldLabel: '节点标示',
			name: 'code',
			allowBlank: false
		}]
	}],
	buttonAlign: "center",
	buttons: [{
		text: '保存',
		iconCls:'add',
		id:'saveNode',
	}],
	initComponent:function(){
		 this.url = "/SiteNode/";
		 this.callParent();
	}
});
