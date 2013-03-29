Ext.define('System.store.Node', {
	extend: 'Ext.data.TreeStore',
	model: 'System.model.Node',
	proxy:{
		api:{
			insert:"/SiteNode/insert",
			update:"/SiteNode/update",
			remove:"/SiteNode/delete"
		},
		defaultRoodId:'nodes',
		type:'ajax',
		url:'/SiteNode',
		reader:'json',
	},
	sorters: [
		{ property: 'parent_id', direction: 'ASC' },
		{ property: 'sort', direction: 'ASC' }
	],
	autoLoad:true
});
