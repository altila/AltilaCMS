Ext.define('System.controller.NodeController', {
	extend: 'Ext.app.Controller',
	stores: [
		'Node'
     ],
	models: [
		'Node'
	],
	views: [
		'Node.NodeAddView',
		'Node.NodeListView',
		'Node.NodePlateView'
	],
	init: function () {
		var me = this;
		me.DoAction = Ext.create("CommonRoot.util.CommonDoActionUtil");  //加载通用curd
		me.getTree = function () {
			if(this.Tree == undefined){
				this.tree = Ext.getCmp('nodeList');
			}
			return this.tree;
		};
		me.getForm = function (){
			if(this.Form == undefined){
				this.Form = Ext.getCmp('nodeAddPart').getForm();
			}
			return this.Form;
		};
		me.freshTree = function (o) {
			var tree = Ext.getCmp('nodeList');
			while (delNode = tree.getRootNode().childNodes[0]) {
				tree.getRootNode().removeChild(delNode);  
			}
			tree.store.load();
		};
		this.control({
			//读取节点信息
			'nodeListX':{
				itemclick: function(x,record){
					var addCmp = Ext.getCmp('nodeAddPart').getForm();
					addCmp.loadRecord(record);
				},
				//右键菜单
				itemcontextmenu: function(view, rec, node, index, e) {
					addAction = Ext.create("Ext.Action", {
						iconCls: "icon-add",
						text: "添加子节点",
						handler: function() {
							var pid   = rec.get("id");
							var title = "上级节点--->>"+ rec.get("name");
							var content = Ext.getCmp("nodeAddPart");
							content.getForm().reset();
							content.setTitle(title);
							Ext.getCmp("nodePid").setValue(pid);
						}
					});
					delAction = Ext.create("Ext.Action", {
						iconCls:"icon-delete",
						text: "删除节点",
						handler: function() {
							var ids = rec.get("id");
							Ext.Msg.confirm("提示", "您确定要删除该节点吗?",function(btn){
								if( btn == "yes" ){
									me.DoAction.doDeleteT(me.getTree(),ids,'id');
								}
							});
						}
					});
					contextMenu = Ext.create("Ext.menu.Menu", {
						items: [
							addAction,
							delAction,
						]
					});
					e.stopEvent();
					contextMenu.showAt(e.getXY());
					return false;
				}
			},
			// 展开菜单
			'nodeListX button[id=allOpen]':{
				click: function(o) {
					me.getTree(o).expandAll();
				}
			},
			// 收起菜单
			'nodeListX button[id=allClose]':{
				click: function(o) {
					me.getTree(o).collapseAll();
				}
			},
			// 刷新菜单
			'nodeListX button[id=fleshAll]':{
				click: function(o) {
					me.freshTree();
				}
			},
			// 新增顶级节点
			'nodeListX button[id=newNode]':{
				click: function(o) {
					var form = me.getForm();
					form.reset();
				} 
			},
			'nodeAddX button[id=saveNode]':{
				click: function(o) {
					var form = o.up('form');
					var tree = me.getTree();
					if(form.getForm().isValid()){alert(tree);
						me.DoAction.doInsertT(tree,{
							param: form.getValues(),
							pk: 'id',
						});
					}
				}
			}
		});
	}
});
