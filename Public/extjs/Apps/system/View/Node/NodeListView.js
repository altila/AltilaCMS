Ext.define("System.view.Node.NodeListView", {
	extend:"Ext.tree.Panel",
	alias: "widget.nodeListX",
	padding : '3 3 3 3',
	rootVisible : false,//控制显隐的属性
	draggable:false,
	useArrows:true,
	columns:[{
		xtype:"treecolumn",
		header:"分类名称",
		flex : 1.5,
		dataIndex:"name",
	},{
		header:"编码",
		dataIndex:"code",
		flex : 1,
	},{
		header : "节点ID",
		dataIndex : "id",
		flex : 1,
	},{
		header : "父节点",
		dataIndex : "parent_id",
		flex : 1,
	},{
		header : "修改时间",
		dataIndex : "update_time",
		width:120,
	},{
		header : "状态",
		dataIndex : "status",
		width:50,
	}],
	initComponent:function(){
		var me = this;
		Ext.apply(me,me.obj,{
			id:'nodeList',
			dockedItems : [{
				xtype:'toolbar',
				dock:'top',
				items:[{
					xtype:'button',
					id:'newNode',
					iconCls:'add',
					text:'新增节点'
				},{
					xtype:'button',
					iconCls:"icon-application-go",
					id:'allOpen',
					text:'展开全部'
				},{
					xtype:'button',
					iconCls:"icon-application-go",
					id:'allClose',
					text:'收起全部'
				},{
					xtype:'button',
					iconCls:"option",
					id:'fleshAll',
					text:'刷新'
				}]
			}],
			store:'Node'
		});
		me.callParent(arguments);
	}
});
