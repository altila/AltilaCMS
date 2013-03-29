Ext.define("System.view.Main.MainMenuView", {
	extend:"Ext.tree.Panel",
	alias: "widget.userMenuX",
	rootVisible : false,
	root: {
		text: "用户管理",
		expanded: true,
		children: [
			//{ text: "用户管理", leaf: true ,id :"User"},
			//{ text: "角色管理", leaf: true ,id :"Role"},
			{ text: "节点管理", leaf: true ,id :"Node"},
			//{ text: "菜单管理", leaf: true ,id :"Group"},
			//{ text: "用户日志", leaf: true ,id :"UserLog"}
		]
	}
});
