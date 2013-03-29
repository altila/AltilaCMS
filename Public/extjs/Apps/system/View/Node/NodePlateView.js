Ext.define('System.view.Node.NodePlateView', {
	extend: 'Ext.panel.Panel',
	layout:'border',
	alias: 'widget.NodePlate',
	items:[{
		region: 'center',
		split: true,
		collapseMode: 'mini',
		xtype:'nodeListX'
	 },{
		region: 'east',
		split: true,
		layout:'fit',
		iconCls:'option',
		collapsible: true,
		id:'nodeAddPart',
		width:248,
		xtype:'nodeAddX'
	}],
	region: 'center'
});
