<?php
return array(

	/* 数据库配置 */
	//'DB_LIKE_FIELDS'            => 'name|title|remark',   // 默认自动模糊查询的字段 2.1以上版本有用

	/* RBAC配置 */
	'USER_AUTH_ON'              => true,       // 是否需要认证
	'USER_AUTH_TYPE'            => 2,          // 默认认证类型 1 登录认证 2 实时认证
	'USER_AUTH_KEY_ID'          => 'Uid',      // 用户认证SESSION标记
	'ADMIN_AUTH_KEY'            => '1',        // 无需验证的用户UID
	'USER_AUTH_MODEL'           => 'UserBase', // 默认验证数据表模型
	'AUTH_PWD_ENCODER'          => 'md5',      // 用户认证密码加密方式
	'USER_AUTH_GATEWAY'         => '/Passport/AdminLogin',   // 默认认证网关
	'NOT_AUTH_MODULE'           => 'AdminLogin',    // 默认无需认证模块
	'REQUIRE_AUTH_MODULE'       => '',         // 默认需要认证模块
	'NOT_AUTH_ACTION'           => '',    // 默认无需认证操作
	'REQUIRE_AUTH_ACTION'       => '',         // 默认需要认证操作
	'RBAC_ROLE_TABLE'           => 'site_role',//角色表名称
	'RBAC_USER_TABLE'           => 'site_role_user',//用户表名称
	'RBAC_ACCESS_TABLE'         => 'site_access',//权限表名称
	'RBAC_NODE_TABLE'           => 'site_node',//节点表名称



);
?>

