/**
 * Author:xiaojiang
 * create_time: 2012-06-01
 * reason: 通用curd 方法
 * */
Ext.define("CommonRoot.util.CommonDoActionUtil",{
	/**
	 * Form添加信息   合并insert 和 update 功能
	 * @parse  form  {}     对应form 
	 * @parse  parse {}
	 *   parse.grid      {}       要刷新的grid
	 *   parse.pk        string   对应form的主键ID 默认为id
	 *   parse.callback  function 执行后的回调函数
	 * */
	doInsert:function(form,parseObj){
		if(!form){
			alert("Invalid arguments");
			return;
		}
		_form = form.getForm();
		if (_form.isValid()) {
			var pk = parseObj.pk || 'id';     //取得对应主键
			console.dir();
			var type = !parseObj.type ? (form.getValues()[pk]  ? 'update' :'insert') : parseObj.type;
			var url  = parseObj.grid.getStore().getProxy().api[type];
			if(url == undefined) {
				console.dir('Invalid url'); return;
			}
            form.submit({
            	url: url,
                submitEmptyText: false,
                waitMsg: '提交...',
                success: function(form, action) {
                	var ret = eval('('+action.response.responseText+')');
                    Ext.Msg.alert('提示', ret.message);
                    form.reset();
                    if(parseObj.grid != undefined) parseObj.grid.store.load();
                    if(typeof (parseObj.callback) == 'function') parseObj.callback(_form); //调用回调函数
                },
	            failure: function(form, action) {
	            	var ret = eval('('+action.response.responseText+')');
	                Ext.Msg.alert('提示', ret.message);
	            }
            });
        }
	},


    // -- grid begin --
	/**
	 * 删除grid 选择信息
	 * @parse {}     对应grid
	 * @parse {
	 *     .pk        string   对应form的主键ID 默认为id
	 *     .Msg       1 是否 不显示弹出信息
	 * }
	 * */
	doDelete:function(grid,ParseObj){
		if(!grid){
			alert("Invalid arguments");
			return;
		}
		var pk  = (ParseObj !=undefined && ParseObj.pk) ? ParseObj.pk : 'id';         //取得对应主键
		var Msg = (ParseObj !=undefined && ParseObj.Msg != undefined) ? ParseObj.Msg : '确定要删除此记录吗';        
		var store = grid.getStore();   //得到数据集合
		var records = grid.getSelectionModel().getSelection();
		var data = [];
		var Parse = {};
		Ext.Array.each(records,function(model){
			data.push(model.get(pk));
		});
		Parse[pk] = data.join(",");     //存入参数
		if(data.length > 0){
			if(Msg){               //判断是否需要弹出确认框
				 Ext.MessageBox.confirm("提示",Msg,function(btn){
						if(btn == 'yes'){
							Ext.Ajax.request({
								url:store.getProxy().api['remove'],
								params:Parse,
								timeout:4000,
								success:function(response,opts){
									var ret = eval("("+response.responseText+")");
									Ext.Msg.alert("提示", ret.message);
									grid.store.load();
								}
							})
						}
				});
			}else{
				Ext.Ajax.request({
					url:store.getProxy().api['remove'],
					params:Parse,
					timeout:4000,
					success:function(response,opts){
						var ret = eval("("+response.responseText+")");
						Ext.Msg.alert("提示", ret.message);
						grid.store.load();
					}
				})    //待优化
			}
		}else{
			Ext.Msg.alert("提示", "请选择一条信息");
		}
		
	},
	
	/**
	 * 树形删除操作
	 * @param {}      Tree   要操作的树
	 * @param string  pkv      唯一标识值
	 * @param string  pk      唯一标识pk
	 */
	doDeleteT: function(Tree,pkv,pk,callback){
		if(!Tree || !pkv) return;
		var me = this, param ={},url = Tree.getStore().getProxy().api['remove'];   //得到数据集合
		param[pk] = pkv;              //设置参数
		Ext.Ajax.request({
			url: url,
			params: param,
			success: function(response , opt){
				var node = me.getNodeByPk(Tree,pkv,pk);
				var parentNode = node.parentNode;
				try{
					if(parentNode){
						parentNode.removeChild(node);
						if(!parentNode.getChildAt(0)){
							parentNode.data['leaf'] = true;
							parentNode.updateInfo({leaf:true});
						}
					}
				}catch(e){
					console.log(e);
				}
				if(typeof(callback) == 'function') callback(response);  //执行回调函数
				var ret = eval("("+response.responseText+")");
				Ext.Msg.alert("提示",ret.message);
			}
	    });
	},
	/**
	 * 树形维护插入/更新操作
	 * @param {} tree
	 * @param {
	 *    pk      : 主键id
	 *    pid     : 父级标识(pid)
	 *    param   : 插入/更细数据
	 *    callback: 回调函数(插入成功后的id)
	 * }
	 */
	 doInsertT: function(tree,paramObj){
		var me = this;
		if( !tree ){
			alert("参数传递不正确");
			return;
		}
		var pk = paramObj.pk || 'id',parseObj = paramObj.param;     //取得对应主键
		var type = parseObj[pk] ? 'update' :'insert';                 //更新/插入数据
		Ext.Ajax.request({
			url: tree.getStore().getProxy().api[type],
			params:parseObj,
			submitEmptyText: false,
			waitMsg: '提交...',
			success: function(res, action) {
				var ret = eval('('+res.responseText+')');
				var ret_arr = ret.message.split('-');
				if('update' == type){
					var Node =  me.getNodeByPk(tree,parseObj[pk],pk);
					var _Node = Node;
					_Node.data = Ext.apply(_Node.data,parseObj);
					Node.parentNode.replaceChild(_Node,Node);     //更新节点
				}else if('insert' == type){
					var pid  = paramObj.pid || 'pid' ,pidVal = parseObj[pid];
					var parentNode = me.getNodeByPk(tree,pidVal,pk);
					var resObj = Ext.applyIf({
						id  : ret_arr[1],
						text:parseObj["text"],
						leaf:true
					},parseObj);
					if(resObj[pk] == '') resObj[pk] = ret_arr[1]; // 当主键为返回型时
					if(parentNode){                               // 判断是否有父级节点              		
						try{
							parentNode.data['leaf'] = false;
							parentNode.updateInfo();
							//设置为parentNode 添加元素
							parentNode.appendChild(resObj);
							parentNode.expand();
						}catch(e){
							console.dir(e);
						}
					}else{                                        //无父节点  ,即为根节点
						var rootNode = tree.getStore().getRootNode();
						rootNode.appendChild(resObj);
					}
				}
				Ext.Msg.alert('提示', ret_arr[0]);
				if(typeof (paramObj.callback) == 'function') paramObj.callback(ret_arr[1]); //调用回调函数
			},
			failure: function(form, action) {
				var ret = eval('('+action.response.responseText+')');
				Ext.Msg.alert( '提示', ret.info );
			}
		});
	},
	 /**
	  * 通过主键获取Node
	  * @param {}       treeObj
	  * @param string   pkv    主键值
 	  * @param string   pk     主键标识
	  */
	 getNodeByPk:function(tree,pkv,pk){
		 if('id' == pk){           //默认pk
     		 var Node = tree.getStore().getNodeById(pkv);  
     	 }else{                    //若不是id则循环查找节点
     		 for(i in tree.getStore().tree.nodeHash){
           		if(pkv ==  tree.getStore().tree.nodeHash[i].data[pk]){
           			Node = tree.getStore().tree.nodeHash[i];
           			break;
           		}
         	 }
     	 }
		 return Node;
	 },
	 /**
	  * 获的控制器下的form
	  * @param fid   str    对应的fid
 	  * @param scope {}     对应的空间  
	  * */
	 getFormById:function (fid, scope){
		 if(!scope[fid]) scope[fid] = Ext.getCmp(fid);
		 return scope[fid] ;
	 },
	 
	 /**
	  * 关联节点选中
	  * @param 
	  * {
	  *    .title           string    窗口标题
	  *    .height .width   int       窗口尺寸
	  *    .store           storeObj  显示Tree的stroe
	  *    .params          {}        默认传入Tree的参数
	  *    .retParams       {}        默认需要从Tree传递到后台的参数
	  *    .url             string    保存后的操作路径
	  * }
	  * */
	 doRelateT:function(option){
			var win  = Ext.create('widget.window',{
						    title: option.title,
						    height: option.height,
						    width: option.width,
						    modal:true,
						    layout: 'fit',
				      });
			var store = option.store;
			store.on('beforeload', function (store, options) {   //传入参数设置反选
		        Ext.apply(store.proxy.extraParams, option.params);
		    });            //tree 的store
			var tree = Ext.create(option.Tview,{obj:{
								 store:store,
								 dockedItems:[{
									 xtype:'toolbar',
									 dock:'bottom',
									 items:["->",{
										xtype:'button',
										iconCls:"icon-save",
										text:'保存',
										handler:function(o){
											var tree = o.ownerCt.ownerCt;
											var records = tree.getView().getChecked();
						                    var rec = [];
						                    Ext.Array.each(records, function(recc){
						                    	 var _ret = {};
						                    	 for(var i in option.retParams){
						                    		 _ret[option.retParams[i]] = recc.get(option.retParams[i]);
						                    	 }
						                    	 rec.push(_ret);
						                    });
						                    option.ret[option.retParam] = Ext.JSON.encode(rec);
						                    Ext.Ajax.request({
												url:option.url,
												params:option.ret,
												method:option.method,
												success:function(response,opts){
													var ret = response.responseText  ?
															eval("("+response.responseText+")") : {};
													Ext.Msg.alert("提示", ret.message);
												}
											});
										}
									 },{
										xtype:'button',
										iconCls:"remove",
										text:'取消',
										handler:function(o){
									        o.ownerCt.ownerCt.ownerCt.close();
										}
									 }]
								 }],
								 id:Math.random()
					     }});
			/*tree.on('checkchange', function(node,checked) {
				if(checked){
				    var _node = node;
				    _node.expand();
				    if(node.parentNode.data.title != ''){
					    do{                    // 选中节点后关联其父节点
					    	if(!_node.parentNode.data.checked){
					    		_node.parentNode.data.checked = checked;
								_node.parentNode.updateInfo({checked:checked});
								_node.expand();
					    	}
							_node = _node.parentNode;
						}while(_node.parentNode.data.title != '');
				    }
				}else {                        // 没有选中的子节点时取消父节点的选中
					if(node.parentNode.data.title != ''){
						var _allNot = true;
						if(node.parentNode.data.title != ''){
							node.parentNode.eachChild(function(n){
								if(n.data.checked) _allNot = false;
							});
						}
						if(_allNot){
							node.parentNode.data.checked = checked;
							node.parentNode.updateInfo({checked:checked});
						}
					}
					node.collapse();
				}
				node.eachChild(function(n){   // 选中父节点后 选中所有子节点
						n.data.checked = checked;
						n.updateInfo({checked:checked});
						tree.fireEvent('checkchange', n, checked); 
				});
			}, tree);*/
			win.add(tree);
			win.show();
	 }
	 
});

