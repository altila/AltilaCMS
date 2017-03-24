<?php
return array(

	'SiteWeb'              => "SiteWeb_".substr( $_SERVER['HTTP_HOST'], strpos( $_SERVER['HTTP_HOST'], '.' )+1, strrpos( $_SERVER['HTTP_HOST'], '.' )-strpos( $_SERVER['HTTP_HOST'], '.' )-1 ),// 站点信息
	'SiteNode'             => "SiteNode",                           // 站点信息
	'SiteMenu'             => "SiteMenu_",                          // 站点菜单:SiteMenu_{$vo['sid']}
	'BaseArea'             => "BaseArea",                           // 地区信息
	'AdPosition'           => "AdPosition_",                        // 广告位信息:AdPosition_{$vo['code']}_{$vo['sid']}
	'SitePlateGroup'       => "SitePlateGroup_",                    // 面板信息:SitePlateGroup_{$vo['code']}_{$vo['sid']}
	'ArticleInfo'          => "ArticleInfo_",                       // 文章信息
	'ArticleCategory'      => "ArticleCategory_",                   // 文章分类:ArticleCategory_{$vo['smid']}
	'BlogInfo'             => "BlogInfo_",                          // 博文信息
	'BlogCategory'         => "BlogCategory_",                      // 博文分类:BlogCategory_{$vo['smid']}




);
?>
