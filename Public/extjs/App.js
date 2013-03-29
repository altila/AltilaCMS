/*!
 * Ext JS Library 4.0
 * Copyright(c) 2006-2011 Sencha Inc.
 * licensing@sencha.com
 * http://www.sencha.com/license
 */

Ext.define('MyDesktop.App', {
	extend: 'Ext.ux.desktop.App',
	requires: [
		//'Ext.window.MessageBox',
		'Ext.ux.desktop.ShortcutModel',
		'ConfRoot.Settings',
		'WinRoot.SystemWin',
		'WinRoot.ContentWin'
	],
	init: function () {
		// custom logic before getXYZ methods get called...
		this.callParent();
		// now ready...
	},
	getModules: function () {
		return [
			new WinRoot.SystemWin(),
			new WinRoot.ContentWin()
		];
	},
	getDesktopConfig: function () {
		var me = this, ret = me.callParent();
		return Ext.apply(ret, {
			//cls: 'ux-desktop-black',
			contextMenuItems: [
				{ text: '设置背景', handler: me.onSettings, scope: me }
			],
			//右键菜单
			shortcuts: Ext.create('Ext.data.Store', {
				model: 'Ext.ux.desktop.ShortcutModel',
				data: [
					//{ name: 'Grid Window', iconCls: 'grid-shortcut', module: 'grid-win' },
					//{ name: 'Accordion Window', iconCls: 'accordion-shortcut', module: 'acc-win' },
					//{ name: 'Notepad', iconCls: 'notepad-shortcut', module: 'notepad' },
					//{ name: 'System Status', iconCls: 'cpu-shortcut', module: 'systemstatus'},
					{ name: '系统管理', iconCls: 'cpu-shortcut', module: 'system'},
					{ name: '内容管理', iconCls: 'cpu-shortcut', module: 'content'}
				]
			}),
			wallpaper: 'wallpapers/Blue-Sencha.jpg',
			wallpaperStretch: false
		});
	},
	// config for the start menu
	getStartConfig : function () {
		var me = this, ret = me.callParent();
		return Ext.apply(ret, {
			title: 'Don Griffin',
			iconCls: 'user',
			height: 300,
			toolConfig: {
				width: 100,
				items: [{
					text:'设置背景',
					iconCls:'settings',
					handler: me.onSettings,
					scope: me
				},
				'-',
				{
					text:'退出登录',
					iconCls:'logout',
					handler: me.onLogout,
					scope: me
				}]
			}
		});
	},
	getTaskbarConfig: function () {
		var ret = this.callParent();
		return Ext.apply(ret, {
			//快捷菜单
			quickStart: [
				{ name: 'Accordion Window', iconCls: 'accordion', module: 'acc-win' },
				{ name: 'Grid Window', iconCls: 'icon-grid', module: 'grid-win' }
			],
			trayItems: [
				{ xtype: 'trayclock', flex: 1 }
			]
		});
	},
	onLogout: function () {
		Ext.Msg.confirm('退出登录', '您确定要退出登录吗?');
	},
	onSettings: function () {
		var dlg = new ConfRoot.Settings({
			desktop: this.desktop
		});
		dlg.show();
	}
});
