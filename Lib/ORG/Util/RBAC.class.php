<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2009 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
// $Id: RBAC.class.php 2947 2012-05-13 15:57:48Z liu21st@gmail.com $

/**
 +------------------------------------------------------------------------------
 * 基于角色的数据库方式验证类
 +------------------------------------------------------------------------------
 * @category   ORG
 * @package  ORG
 * @subpackage  Util
 * @author    liu21st <liu21st@gmail.com>
 * @version   $Id: RBAC.class.php 2947 2012-05-13 15:57:48Z liu21st@gmail.com $
 +------------------------------------------------------------------------------
 */
// 配置文件增加设置
// USER_AUTH_KEY 认证识别号
//'USER_AUTH_ON'              => true,       // 是否需要认证
//'USER_AUTH_TYPE'            => 2,          // 默认认证类型 1 登录认证 2 实时认证
//'USER_AUTH_KEY_ID'          => 'Uid',      // 用户认证SESSION标记
//'ADMIN_AUTH_KEY'            => '1',        // 无需验证的用户UID
//'USER_AUTH_MODEL'           => 'UserBase', // 默认验证数据表模型
//'AUTH_PWD_ENCODER'          => 'md5',      // 用户认证密码加密方式
//'USER_AUTH_GATEWAY'         => '/Login',   // 默认认证网关
//'NOT_AUTH_MODULE'           => 'Login',    // 默认无需认证模块
//'REQUIRE_AUTH_MODULE'       => '',         // 默认需要认证模块
//'NOT_AUTH_ACTION'           => '',    // 默认无需认证操作
//'REQUIRE_AUTH_ACTION'       => '',         // 默认需要认证操作
//'RBAC_ROLE_TABLE'           => 'site_role',//角色表名称
//'RBAC_USER_TABLE'           => 'site_role_user',//用户表名称
//'RBAC_ACCESS_TABLE'         => 'site_access',//权限表名称
//'RBAC_NODE_TABLE'           => 'site_node',//节点表名称

/*
-- --------------------------------------------------------
CREATE TABLE `site_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_website表sid字段',
  `rid` int(11) NOT NULL DEFAULT '0' COMMENT '角色ID，关联site_role表rid字段',
  `nid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID，关联site_node表nid字段',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `create_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设置访问权限表';

CREATE TABLE `site_node` (
  `nid` int(6) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `parent_id` int(6) NOT NULL DEFAULT '0' COMMENT '节点父级ID',
  `code` varchar(100) NOT NULL DEFAULT '' COMMENT '节点编码,可作唯一标示',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '节点名称',
  `type` tinyint(1) DEFAULT '1' COMMENT '节点类型：1为引导栏目(不能发布内容,只作显示)，2为列表制',
  `menu_show` tinyint(1) DEFAULT '1' COMMENT '导航中是否显示: 0为不显示，1为显示',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `create_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`nid`),
  KEY `parent_id` (`parent_id`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设置节点表';

CREATE TABLE `site_role` (
  `rid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_website表sid字段',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色父级ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '角色名称',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `create_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`rid`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设置角色表';

CREATE TABLE `site_role_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_website表sid字段',
  `rid` int(11) NOT NULL DEFAULT '0' COMMENT '角色ID，关联site_role表rid字段',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID，关联user_base表uid字段',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `create_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设置角色关联用户表';

*/
class RBAC {
	// 认证方法
	static public function authenticate($map,$model='') {
		if( empty($model) ) $model = C('USER_AUTH_MODEL');
		//使用给定的Map进行认证
		return M($model)->where($map)->find();
	}

	//用于检测用户权限的方法,并保存到Session中
	static function saveAccessList($authId=null) {
		if( null===$authId ) $authId = $_SESSION[C('USER_AUTH_KEY')][C('USER_AUTH_KEY_ID')];
		// 如果使用普通权限模式，保存当前用户的访问权限列表 对管理员开发所有权限
		if( C('USER_AUTH_TYPE') !=2 && !$_SESSION[C('ADMIN_AUTH_KEY')] )
			$_SESSION['_ACCESS_LIST'] = RBAC::getAccessList($authId);
		return ;
	}

	// 取得模块的所属记录访问权限列表 返回有权限的记录ID数组
	static function getRecordAccessList($authId=null,$module='') {
		if( null===$authId ) $authId = $_SESSION[C('USER_AUTH_KEY')][C('USER_AUTH_KEY_ID')];
		if( empty($module) ) $module = MODULE_NAME;
		//获取权限访问列表
		$accessList = RBAC::getModuleAccessList($authId,$module);
		return $accessList;
	}

	//检查当前操作是否需要认证
	static function checkAccess() {
		//如果项目要求认证，并且当前模块需要认证，则进行权限认证
		if( C('USER_AUTH_ON') ){
			$_module = array();
			$_action = array();
			if("" != C('REQUIRE_AUTH_MODULE')) {
				//需要认证的模块
				$_module['yes'] = explode(',',strtoupper(C('REQUIRE_AUTH_MODULE')));
			}else {
				//无需认证的模块
				$_module['no'] = explode(',',strtoupper(C('NOT_AUTH_MODULE')));
			}
			//检查当前模块是否需要认证
			if((!empty($_module['no']) && !in_array(strtoupper(MODULE_NAME),$_module['no'])) || (!empty($_module['yes']) && in_array(strtoupper(MODULE_NAME),$_module['yes']))) {
				if("" != C('REQUIRE_AUTH_ACTION')) {
					//需要认证的操作
					$_action['yes'] = explode(',',strtoupper(C('REQUIRE_AUTH_ACTION')));
				}else {
					//无需认证的操作
					$_action['no'] = explode(',',strtoupper(C('NOT_AUTH_ACTION')));
				}
				//检查当前操作是否需要认证
				if((!empty($_action['no']) && !in_array(strtoupper(ACTION_NAME),$_action['no'])) || (!empty($_action['yes']) && in_array(strtoupper(ACTION_NAME),$_action['yes']))) {
					return true;
				}else {
					return false;
				}
			}else {
				return false;
			}
		}
		return false;
	}

	// 登录检查
	static public function checkLogin() {
		//检查当前操作是否需要认证
		if( RBAC::checkAccess() ) {
			//检查认证识别号
			if( !$_SESSION[C('USER_AUTH_KEY')][C('USER_AUTH_KEY_ID')] ) {
				//跳转到认证网关
				redirect( C('USER_AUTH_GATEWAY') );
			}
		}
		return true;
	}

	//权限认证的过滤器方法
	static public function AccessDecision($appName=APP_NAME) {
		//检查是否需要认证
		if( RBAC::checkLogin() && RBAC::checkAccess() ) {
			//存在认证识别号，则进行进一步的访问决策
			$accessGuid = md5($appName.MODULE_NAME.ACTION_NAME);
			//管理员无需认证
			if( C('ADMIN_AUTH_KEY') == $_SESSION[C('USER_AUTH_KEY')][C('USER_AUTH_KEY_ID')] )
				return true;
			if( C('USER_AUTH_TYPE') == 2 ) {
				//加强验证和即时验证模式 更加安全 后台权限修改可以即时生效 通过数据库进行访问检查
				$accessList = RBAC::getAccessList($_SESSION[C('USER_AUTH_KEY')][C('USER_AUTH_KEY_ID')]);
			}else {
				// 如果是管理员或者当前操作已经认证过，无需再次认证
				if( $_SESSION[$accessGuid]) return true;
				//登录验证模式，比较登录后保存的权限访问列表
				$accessList = $_SESSION['_ACCESS_LIST'];
			}
			//判断是否为组件化模式，如果是，验证其全模块名
			$module = defined('P_MODULE_NAME') ?  P_MODULE_NAME   :   MODULE_NAME;
			if( !isset($accessList[strtoupper($appName)][strtoupper($module)][strtoupper(ACTION_NAME)]) ) {
				$_SESSION[$accessGuid]  =   false;
				return false;
			} else {
				$_SESSION[$accessGuid] = true;
			}
		}
		return true;
	}

	/**
	----------------------------------------------------------
	* 取得当前认证号的所有权限列表
	+----------------------------------------------------------
	* @param integer $authId 用户ID
	+----------------------------------------------------------
	* @access public
	+----------------------------------------------------------
	*/
	static public function getAccessList($authId) {
		// Db方式权限数据
		$db = Db::getInstance(C('RBAC_DB_DSN'));
		$table = array('role'=>C('RBAC_ROLE_TABLE'),'user'=>C('RBAC_USER_TABLE'),'access'=>C('RBAC_ACCESS_TABLE'),'node'=>C('RBAC_NODE_TABLE'));
		$actionSql = "SELECT sn.nid,sn.name,sn.code,sn.parent_id
			FROM {$table['user']} AS sru
			INNER JOIN {$table['role']} AS sr ON sr.rid = sru.rid
			INNER JOIN {$table['access']} AS sa ON sa.rid = sr.rid OR ( sa.rid = sr.parent_id AND sr.parent_id != 0 )
			INNER JOIN {$table['node']} AS sn ON sn.nid = sa.nid
			WHERE sru.uid = {$authId} AND sru.status = 1 AND sr.status = 1 AND sn.status = 1 AND sn.menu_show != 1
			";
		$action = $db->query($actionSql);
		$pid = array();$module = array();$access = array();
		foreach( $action as $key=>$value ){
			$pid[$value['parent_id']] = $value['parent_id'];
		}
		$moduleSql = "SELECT nid,name,code FROM {$table['node']} WHERE nid IN ( '".implode("','",$pid)."' )";
		$_module = $db->query($moduleSql);
		foreach( $_module as $k=>$v )
			$module[$v['nid']] = $v;
		foreach( $action as $key=>$value )
			$access[strtoupper(APP_NAME)][strtoupper($module[$value['parent_id']]['code'])][strtoupper($value['code'])] = $value;
		return $access;
	}

	// 读取模块所属的记录访问权限
	static public function getModuleAccessList($authId,$module) {
		// Db方式
		$db     =   Db::getInstance(C('RBAC_DB_DSN'));
		$table = array('role'=>C('RBAC_ROLE_TABLE'),'user'=>C('RBAC_USER_TABLE'),'access'=>C('RBAC_ACCESS_TABLE'));
		$sql    =   "select access.node_id from ".
			$table['role']." as role,".
			$table['user']." as user,".
			$table['access']." as access ".
			"where user.user_id='{$authId}' and user.role_id=role.id and ( access.role_id=role.id  or (access.role_id=role.pid and role.pid!=0 ) ) and role.status=1 and  access.module='{$module}' and access.status=1";
		$rs =   $db->query($sql);
		$access	=	array();
		foreach ($rs as $node){
			$access[]	=	$node['node_id'];
		}
		return $access;
	}
}
