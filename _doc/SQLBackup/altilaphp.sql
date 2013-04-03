-- phpMyAdmin SQL Dump
-- version 3.0.1.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2013 年 04 月 03 日 10:01
-- 服务器版本: 5.1.30
-- PHP 版本: 5.2.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `altilaphp`
--

-- --------------------------------------------------------

--
-- 表的结构 `ad_function`
--

CREATE TABLE `ad_function` (
  `afid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `code` varchar(100) NOT NULL DEFAULT '' COMMENT '广告方法编码,可作唯一标示',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '广告方法名称',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`afid`),
  KEY `status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='广告方法表' AUTO_INCREMENT=3 ;

--
-- 导出表中的数据 `ad_function`
--

INSERT INTO `ad_function` (`afid`, `code`, `name`, `sort`, `status`, `add_time`, `update_time`) VALUES
(1, 'adOriginal', '无效果', 1, 1, '2013-03-08 22:35:21', '2013-03-08 22:35:21'),
(2, 'adCarousel', '轮播', 2, 1, '2013-03-08 22:35:34', '2013-03-08 22:36:43');

-- --------------------------------------------------------

--
-- 表的结构 `ad_info`
--

CREATE TABLE `ad_info` (
  `adid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `apid` int(11) NOT NULL DEFAULT '0' COMMENT '广告位ID，关联ad_position表apid字段',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '广告名称',
  `style` varchar(100) DEFAULT '' COMMENT '广告样式',
  `type` tinyint(1) DEFAULT '0' COMMENT '广告类型: 0为图片，1为flash，2为html，3为魔方',
  `link` varchar(255) DEFAULT '' COMMENT '链接地址',
  `content` text COMMENT '广告内容: 图片地址，flash地址，html代码',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `start_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '开始时间',
  `end_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '结束时间',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`adid`),
  KEY `sid` (`sid`),
  KEY `apid` (`apid`),
  KEY `type` (`type`),
  KEY `status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='广告信息表' AUTO_INCREMENT=6 ;

--
-- 导出表中的数据 `ad_info`
--

INSERT INTO `ad_info` (`adid`, `sid`, `apid`, `name`, `style`, `type`, `link`, `content`, `sort`, `status`, `start_time`, `end_time`, `add_time`, `update_time`) VALUES
(1, 1, 1, 'Logo', '', 0, '/', 'http://s.mb-go.com/pub7/images/style/logo/logo_bg.jpg', 1, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-09 17:11:48', '2013-03-16 16:42:23'),
(2, 1, 4, '广告魔方', 'aaa', 3, '', '&lt;div class=&quot;magic_box&quot; style=&quot;height:392px&quot;&gt;&lt;input class=&quot;_sideLen&quot; name=&quot;_sideLen&quot; value=&quot;98&quot; type=&quot;hidden&quot;&gt;&lt;div class=&quot;magic_item&quot;&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://www.banggo.com/Theme/theme_MB-ZHUTI538.shtml&quot;&gt;&lt;img src=&quot;http://img.mbanggo.com/sources/cms/20121127/mbnew-1123-980-down1.jpg&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;div class=&quot;magic_item&quot; style=&quot;z-index:10;left:196px;top:0px;&quot;&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://search.banggo.com/Search/a_2_a_a_a_a_a_a_a_a_a_a_a_6-y-w35-ly-b6bm-f.shtml&quot;&gt;&lt;img src=&quot;http://img.mbanggo.com/sources/cms/20121127/mbnew-1123-980-down2.jpg&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;div class=&quot;magic_item&quot; style=&quot;z-index:10;left:196px;top:196px;&quot;&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://search.banggo.com/Search/a_2_a_a_a_a_a_a_a_a_a_a_a_5q-s-n54mp5a-sn5oi-y5-y-o15b-c4.shtml&quot;&gt;&lt;img src=&quot;http://img.mbanggo.com/sources/cms/20121127/mbnew-1123-980-down3.jpg&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;div class=&quot;magic_item&quot; style=&quot;z-index: 10; left: 392px; top: 0px;&quot;&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://search.banggo.com/Search/a_2_a_a_a_a_a_a_a_a_a_a_a_5r-w357u15a6d5a6d.shtml&quot;&gt;&lt;img src=&quot;http://img.mbanggo.com/sources/cms/20121127/mbnew-1123-980-down4.jpg&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;div class=&quot;magic_item&quot; style=&quot;z-index:10;left:588px;top:0px;&quot;&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://search.banggo.com/Search/a_2_a_a_a_a_a_a_a_a_a_a_a_576-o5b2x5-y6-c.shtml&quot;&gt;&lt;img src=&quot;http://img.mbanggo.com/sources/cms/20121127/mbnew-1123-980-down5.jpg&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;div class=&quot;magic_item&quot; style=&quot;z-index:10;left:588px;top:196px;&quot;&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://search.banggo.com/Search/a_a.shtml?clickType=1&amp;amp;word=kitty&quot;&gt;&lt;img src=&quot;http://img.mbanggo.com/sources/cms/20121127/mbnew-1123-980-down6.jpg&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;div class=&quot;magic_item&quot; style=&quot;z-index:10;left:784px;top:0px;&quot;&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://search.banggo.com/Search/a_a.shtml?clickType=1&amp;amp;word=CHICALOCA&quot;&gt;&lt;img src=&quot;http://img.mbanggo.com/sources/cms/20121127/mbnew-1123-980-down7.jpg&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;div class=&quot;magic_item&quot; style=&quot;left:784px;top:196px;z-index:10;&quot;&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://search.banggo.com/Search/a_a.shtml?clickType=1&amp;amp;word=阿拉蕾&amp;amp;t=metersbonwe&amp;amp;&quot;&gt;&lt;img src=&quot;http://img.mbanggo.com/sources/cms/20130114/mbnew-0111-980nv-alalei.jpg&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;/div&gt;', 3, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-09 20:22:06', '2013-03-16 16:56:36'),
(3, 1, 3, '底部通栏广告', '', 2, '', '&lt;p&gt;&lt;img src=&quot;http://img.mbanggo.com/sources/bgimages/bg/fotter_0217.jpg&quot; alt=&quot;14天退换货保障，139元起免费送货，100%正品保证！&quot; /&gt;&lt;/p&gt;', 0, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-16 13:50:49', '2013-03-16 13:50:49'),
(4, 1, 4, 'flash', '', 1, '', 'http://img.mbanggo.com/sources/bgimages/20120517/loaderswf01.swf', 2, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-16 15:09:46', '2013-03-17 20:23:54'),
(5, 1, 4, '图片广告', '', 0, '', 'http://img.mbanggo.com/sources/cms/20130315/sylb-0314-300-60.jpg', 1, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 17:45:20', '2013-03-21 17:45:20');

-- --------------------------------------------------------

--
-- 表的结构 `ad_position`
--

CREATE TABLE `ad_position` (
  `apid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `afid` int(11) NOT NULL DEFAULT '1' COMMENT '广告方法ID，关联ad_function表afid字段',
  `code` varchar(100) NOT NULL DEFAULT '' COMMENT '广告位编码,可作唯一标示',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '广告位名称',
  `style` varchar(100) DEFAULT '' COMMENT '广告样式',
  `width` int(5) DEFAULT '0' COMMENT '广告位宽度，单位为像素',
  `height` int(5) DEFAULT '0' COMMENT '广告位高度，单位为像素',
  `sum` tinyint(5) DEFAULT '1' COMMENT '广告位广告数',
  `row` tinyint(5) DEFAULT '1' COMMENT '广告位列数',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`apid`),
  KEY `sid` (`sid`),
  KEY `status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='广告位信息表' AUTO_INCREMENT=6 ;

--
-- 导出表中的数据 `ad_position`
--

INSERT INTO `ad_position` (`apid`, `sid`, `afid`, `code`, `name`, `style`, `width`, `height`, `sum`, `row`, `sort`, `status`, `add_time`, `update_time`) VALUES
(1, 1, 1, 'logo', 'Logo', '', 250, 80, 1, 1, 1, 1, '2013-03-09 10:33:43', '2013-03-17 19:22:32'),
(2, 1, 1, 'topAd', '头部通栏广告', '', 980, 50, 1, 1, 2, 1, '2013-03-09 15:20:10', '2013-03-09 15:20:10'),
(3, 1, 1, 'bottomAd', '底部通栏广告', '', 980, 50, 1, 1, 4, 1, '2013-03-09 15:21:08', '2013-03-09 15:21:08'),
(4, 1, 2, 'Home_Index_index', '首页广告', 'aa', 980, 392, 1, 1, 3, 1, '2013-03-09 21:30:13', '2013-03-24 11:07:09'),
(5, 1, 1, 'Home_ArticleCategory_index', '文章分类页通栏广告', '', 980, 80, 1, 1, 0, 1, '2013-03-16 13:52:30', '2013-03-24 11:07:26');

-- --------------------------------------------------------

--
-- 表的结构 `ad_schedule`
--

CREATE TABLE `ad_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `adid` int(11) NOT NULL DEFAULT '0' COMMENT '广告ID，关联ad_info表adid字段',
  `apid` int(11) NOT NULL DEFAULT '0' COMMENT '广告位ID，关联ad_position表apid字段',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `start_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '开始时间',
  `end_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '结束时间',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `apid` (`apid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='广告排期表' AUTO_INCREMENT=2 ;

--
-- 导出表中的数据 `ad_schedule`
--

INSERT INTO `ad_schedule` (`id`, `sid`, `adid`, `apid`, `sort`, `status`, `start_time`, `end_time`, `add_time`, `update_time`) VALUES
(1, 1, 2, 4, 1, 0, '2013-03-03 00:00:00', '2013-03-29 00:00:00', '2013-03-09 19:32:41', '2013-03-17 20:31:17');

-- --------------------------------------------------------

--
-- 表的结构 `album`
--

CREATE TABLE `album` (
  `aid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_website表sid字段',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID，关联user_base表uid字段',
  `name` varchar(100) DEFAULT '' COMMENT '相册名称',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`aid`),
  KEY `sid` (`sid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='文章相册表' AUTO_INCREMENT=3 ;

--
-- 导出表中的数据 `album`
--

INSERT INTO `album` (`aid`, `sid`, `uid`, `name`, `sort`, `status`, `add_time`, `update_time`) VALUES
(1, 1, 1, '案例展示', 0, 1, '2013-01-27 11:25:02', '2013-01-27 19:03:48'),
(2, 2, 1, 'About Us', 0, 1, '2013-01-28 21:24:30', '2013-01-28 21:24:30');

-- --------------------------------------------------------

--
-- 表的结构 `album_photo`
--

CREATE TABLE `album_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_website表sid字段',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID，关联user_base表uid字段',
  `aid` int(11) NOT NULL DEFAULT '0' COMMENT '相册ID，关联album表aid字段；0为贴图相册',
  `name` varchar(100) DEFAULT '' COMMENT '相片名称',
  `url` varchar(250) DEFAULT '' COMMENT '相片地址',
  `size` int(11) DEFAULT '0' COMMENT '相片大小',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`),
  KEY `uid` (`uid`),
  KEY `aid` (`aid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='文章相片表' AUTO_INCREMENT=4 ;

--
-- 导出表中的数据 `album_photo`
--

INSERT INTO `album_photo` (`id`, `sid`, `uid`, `aid`, `name`, `url`, `size`, `sort`, `status`, `add_time`, `update_time`) VALUES
(1, 1, 1, 0, 'large_clxm_62092h206091', '/Uploads/Images/altilacms/default/20130128/5105e07a69b07.jpg', 108211, 0, 1, '2013-01-28 10:20:42', '2013-01-28 10:20:42'),
(2, 1, 1, 1, 'large_clxm_62092h206091', '/Uploads/Images/altilacms/default/20130128/5105e0fd2e36c.jpg', 108211, 0, 1, '2013-01-28 10:22:53', '2013-01-28 10:22:53'),
(3, 2, 1, 2, 'large_jt4L_61682a206091', '/Uploads/Images/altilacms/default/20130128/51067f9c641d8.jpg', 104652, 0, 1, '2013-01-28 21:39:40', '2013-01-28 21:39:40');

-- --------------------------------------------------------

--
-- 表的结构 `article_album`
--

CREATE TABLE `article_album` (
  `aaid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID，关联user_base表uid字段',
  `name` varchar(100) DEFAULT '' COMMENT '相册名称',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`aaid`),
  KEY `sid` (`sid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='文章相册表' AUTO_INCREMENT=3 ;

--
-- 导出表中的数据 `article_album`
--

INSERT INTO `article_album` (`aaid`, `sid`, `uid`, `name`, `sort`, `status`, `add_time`, `update_time`) VALUES
(1, 1, 1, '案例展示', 0, 1, '2013-01-27 11:25:02', '2013-01-27 19:03:48'),
(2, 2, 1, 'About Us', 0, 1, '2013-01-28 21:24:30', '2013-01-28 21:24:30');

-- --------------------------------------------------------

--
-- 表的结构 `article_album_photo`
--

CREATE TABLE `article_album_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID，关联user_base表uid字段',
  `aaid` int(11) NOT NULL DEFAULT '0' COMMENT '相册ID，关联article_album表aaid字段；0为贴图相册',
  `name` varchar(100) DEFAULT '' COMMENT '相片名称',
  `url` varchar(250) DEFAULT '' COMMENT '相片地址',
  `size` int(11) DEFAULT '0' COMMENT '相片大小',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`),
  KEY `uid` (`uid`),
  KEY `aaid` (`aaid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='文章相片表' AUTO_INCREMENT=6 ;

--
-- 导出表中的数据 `article_album_photo`
--

INSERT INTO `article_album_photo` (`id`, `sid`, `uid`, `aaid`, `name`, `url`, `size`, `sort`, `status`, `add_time`, `update_time`) VALUES
(1, 1, 1, 0, 'large_clxm_62092h206091', '__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5105e07a69b07.jpg', 108211, 0, 1, '2013-01-28 10:20:42', '2013-01-28 10:20:42'),
(2, 1, 1, 1, 'large_clxm_62092h206091', '__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5105e0fd2e36c.jpg', 108211, 0, 1, '2013-01-28 10:22:53', '2013-01-28 10:22:53'),
(3, 2, 1, 2, 'large_jt4L_61682a206091', '__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/51067f9c641d8.jpg', 104652, 0, 1, '2013-01-28 21:39:40', '2013-01-28 21:39:40'),
(4, 1, 1, 0, '20090914081712350', '__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5142d1731ba56.jpg', 46697, 0, 1, '2013-01-28 22:39:40', '2013-01-28 22:39:40'),
(5, 1, 1, 0, '中国矿产地图', '__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5142d17660c60.jpg', 180169, 0, 1, '2013-01-28 22:59:40', '2013-01-28 22:59:40');

-- --------------------------------------------------------

--
-- 表的结构 `article_category`
--

CREATE TABLE `article_category` (
  `acid` int(6) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_website表sid字段',
  `parent_id` smallint(5) NOT NULL DEFAULT '0' COMMENT '分类父级ID',
  `code` varchar(100) NOT NULL DEFAULT '' COMMENT '分类编码,可作唯一标示',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '分类名称',
  `crumb` varchar(100) NOT NULL DEFAULT '' COMMENT '面包屑，用横杠分割',
  `type` tinyint(1) DEFAULT '2' COMMENT '分类类型：1为引导栏目(不能发布内容,只作显示)，2为列表制',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`acid`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='文章分类表' AUTO_INCREMENT=6 ;

--
-- 导出表中的数据 `article_category`
--

INSERT INTO `article_category` (`acid`, `sid`, `parent_id`, `code`, `name`, `crumb`, `type`, `sort`, `status`, `add_time`, `update_time`) VALUES
(1, 1, 0, 'aboutUs', '关于我们', '1-', 2, 1, 1, '2013-01-03 14:35:53', '2013-03-11 20:33:21'),
(2, 2, 0, 'aboutUs', 'About Us', '2-', 2, 1, 1, '2013-01-03 17:40:32', '2013-01-04 16:35:10'),
(3, 1, 0, 'ProjectCase', '项目案例', '3-', 1, 2, 1, '2013-03-11 17:52:07', '2013-03-11 17:52:07'),
(4, 1, 3, 'EnterpriseSite', '企业网站', '3-4-', 2, 1, 1, '2013-03-11 17:52:19', '2013-03-11 20:46:56'),
(5, 1, 3, 'LargeSite', '大型网站', '3-5-', 2, 2, 1, '2013-03-11 20:37:51', '2013-03-11 20:47:02');

-- --------------------------------------------------------

--
-- 表的结构 `article_comment`
--

CREATE TABLE `article_comment` (
  `actid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_website表sid字段',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID，关联user_base表uid字段',
  `aiid` int(11) NOT NULL DEFAULT '0' COMMENT '文章ID，关联article_info表aiid字段',
  `parent_id` smallint(5) NOT NULL DEFAULT '0' COMMENT '评论回复父级ID，回复的回复记录评论ID，按时间倒序',
  `name` varchar(100) DEFAULT '' COMMENT '评论主题',
  `content` text COMMENT '评论内容',
  `comment_score` decimal(4,2) DEFAULT '0.00' COMMENT '好评分数，满分为10分',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`actid`),
  KEY `aiid` (`aiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章评论表' AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `article_comment`
--


-- --------------------------------------------------------

--
-- 表的结构 `article_comment_operate`
--

CREATE TABLE `article_comment_operate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_website表sid字段',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID，关联user_base表uid字段',
  `actid` int(11) NOT NULL DEFAULT '0' COMMENT '文章评论ID，关联article_comment表actid字段',
  `type` tinyint(1) DEFAULT '0' COMMENT '操作类型：0为支持[Support]，1为反对[Opposition]',
  `add_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `actid` (`actid`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章评论操作明细表' AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `article_comment_operate`
--


-- --------------------------------------------------------

--
-- 表的结构 `article_comment_stat`
--

CREATE TABLE `article_comment_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_website表sid字段',
  `actid` int(11) NOT NULL DEFAULT '0' COMMENT '文章评论ID，关联article_comment表actid字段',
  `support_count` int(6) DEFAULT '0' COMMENT '支持统计',
  `opposition_count` int(6) DEFAULT '0' COMMENT '反对统计',
  `add_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章评论操作统计总表' AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `article_comment_stat`
--


-- --------------------------------------------------------

--
-- 表的结构 `article_group`
--

CREATE TABLE `article_group` (
  `agid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_website表sid字段',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID，关联user_base表uid字段',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '分组名称',
  `article_count` int(6) DEFAULT '0' COMMENT '篇数统计',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`agid`),
  KEY `sid` (`sid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章分组表' AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `article_group`
--


-- --------------------------------------------------------

--
-- 表的结构 `article_info`
--

CREATE TABLE `article_info` (
  `aiid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID，关联user_base表uid字段',
  `smid` int(11) NOT NULL DEFAULT '0' COMMENT '文章分类ID，关联site_menu表smid字段',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '文章名称',
  `tags_name` varchar(255) DEFAULT '' COMMENT '文章标签，用逗号分割',
  `description` varchar(255) DEFAULT '' COMMENT '文章简述',
  `content` text COMMENT '文章内容',
  `thumbnail` varchar(255) DEFAULT '' COMMENT '文章缩略图',
  `img_url` varchar(800) DEFAULT '' COMMENT '文章内图片，用逗号分割',
  `source_url` varchar(800) DEFAULT '' COMMENT '文章来源网址，用逗号分割',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `start_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '开始时间',
  `end_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '结束时间',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`aiid`),
  KEY `sid` (`sid`),
  KEY `uid` (`uid`),
  KEY `smid` (`smid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='文章信息表' AUTO_INCREMENT=25 ;

--
-- 导出表中的数据 `article_info`
--

INSERT INTO `article_info` (`aiid`, `sid`, `uid`, `smid`, `name`, `tags_name`, `description`, `content`, `thumbnail`, `img_url`, `source_url`, `sort`, `status`, `start_time`, `end_time`, `add_time`, `update_time`) VALUES
(1, 1, 1, 1, '公司简介', '', '这里是梦想开始的地方\n\n作为国内快时尚Fast fashion的领先品牌Meters/bonwe始终能感受到消费者的需要，为向全国消费者展示最完善的“美特斯邦威服饰股份有限公司”旗下“Meters/b...', '&lt;p&gt;公司简介&lt;br /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5105e0fd2e36c.jpg&quot; height=&quot;800&quot; width=&quot;600&quot; /&gt;&lt;img src=&quot;__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/51067f9c641d8.jpg&quot; /&gt;&lt;/p&gt;', '__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5105e0fd2e36c.jpg', '__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5105e0fd2e36c.jpg,__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/51067f9c641d8.jpg,', 'http://admin.altilacms.com/Index/indexContent.html', 1, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-01-17 13:48:35', '2013-04-02 16:34:08'),
(2, 2, 1, 11, 'about us', '', 'about us description', '&lt;p&gt;about us&lt;br /&gt;&lt;/p&gt;', '', '', '', 0, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-01-21 20:37:20', '2013-01-21 21:57:41'),
(3, 1, 1, 1, '联系我们', '', '联系我们简介', '&lt;p&gt;&lt;img src=&quot;__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5142d1731ba56.jpg&quot; style=&quot;float:none;&quot; title=&quot;20090914081712350&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5142d17660c60.jpg&quot; style=&quot;float:none;&quot; title=&quot;中国矿产地图&quot; /&gt;&lt;/p&gt;&lt;p&gt;联系我们&lt;br /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5105e0fd2e36c.jpg&quot; height=&quot;800&quot; width=&quot;600&quot; /&gt;&lt;img src=&quot;__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/51067f9c641d8.jpg&quot; /&gt;&lt;/p&gt;', '__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5105e0fd2e36c.jpg', '__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5142d1731ba56.jpg,__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5142d17660c60.jpg,__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5105e0fd2e36c.jpg,__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/51067f9c641d8.jpg,', '', 3, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-10 20:40:54', '2013-03-15 15:50:06'),
(4, 1, 1, 1, '企业文化', '', '企业文化简介', '&lt;p&gt;企业文化&lt;br /&gt;&lt;/p&gt;', '', '', '', 2, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-10 20:41:48', '2013-03-10 20:41:48'),
(5, 1, 1, 9, '上海卓傲国际贸易有限公司', '', '上海卓傲国际贸易有限公司成立于2008年,位于中国的金融中心-上海。公司自成立以来，应公司发展需求,先后成立了照明事业部和化工事业部。 \n\n          照明事业部一直致力于照明生产和贸易领域，', '&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; 上海卓傲国际贸易有限公司成立于2008年,位于中国的金融中心-上海。公司自成立以来，应公司发展需求,先后成立了照明事业部和化工事业部。&lt;/span&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt; &lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;照明事业部一直致力于照明生产和贸易领域，凭着在照明产品出口丰富的经验团队和良好的客户关系，产品远销欧美市场。秉承着与时俱进的专业理念，我们可以为您提供卓越的性能和最有竞争力的价格的（OEM）产品。 &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; 化工事业部可持续发展是人类共同的发展战略，环境保护是保证可持续发展的物质基础。因此保护水源、控制和治理水污染是环境保护的重要环节，而有百业助剂之称的聚丙烯酰胺(PAM)恰是运用在水处理、石油开采和造纸助剂等领域。 公司严把质量关,自营进口各类单体确保产品的稳定性和一致性。我司提供各类型优质聚丙烯酰胺包括阳离子型(CPAM)、阴离子型(APAM)、非离子型(NPAM)及两性离子型等。 &amp;nbsp;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;font-size:14px&quot;&gt;&lt;span style=&quot;font-family:arial,helvetica,sans-serif&quot;&gt; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;我们期待为客户创造价值、为用户提供高品质的照明、为祖国的节能环保贡献一份力量、为世界创造一个低碳绿色地球。 &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &lt;br /&gt;&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;', '', '', '', 0, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-11 20:47:16', '2013-04-03 14:55:56'),
(6, 1, 1, 12, '莫言：诺贝尔文学奖是颁给我个人而非一个国家', '', '中国作家莫言在瑞典文学院举行新闻发布会　　12月6日中午12时，瑞典文学院大厅里挤满100多名中外记者。中国作家莫言在这里举行新闻发布会。记者似乎要在这1个', '&lt;div class=&quot;arc_info&quot;&gt;　　中国作家莫言在瑞典文学院举行新闻发布会　　12月6日中午12时，瑞典文学院大厅里挤满100多名中外记者。中国作家莫言在这里举行新闻发布会。记者似乎要在这1个&lt;/div&gt;&lt;div id=&quot;contentblock&quot;&gt;&lt;p style=&quot;text-align:center;&quot;&gt;&lt;span id=&quot;content&quot;&gt;&lt;img alt=&quot;莫言：诺贝尔文学奖是颁给我个人而非一个国家&quot; id=&quot;{225BDDE5-7D35-4FBC-BF08-043435AD2D10}&quot; src=&quot;http://www.sh-zhuoao.com/upload/img/20121207/2012120723481384.jpg&quot; /&gt;&lt;/span&gt;&lt;/p&gt;&lt;p class=&quot;pictext&quot; style=&quot;text-align:center;&quot;&gt;&lt;span id=&quot;content&quot;&gt;　　中国作家&lt;span name=&quot;HL_TAG&quot; style=&quot;border-bottom:dotted 0px;color:0084d8;text-decoration:underline;cursor:h&quot;&gt;莫言&lt;/span&gt;在瑞典文学院举行新闻发布会&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span id=&quot;content&quot;&gt;　　12月6日中午12时，瑞典文学院大厅里挤满100多名中外记者。中国&lt;span name=&quot;HL_TAG&quot; style=&quot;border-bottom:dotted 0px;color:0084d8;text-decoration:underline;cursor:h&quot;&gt;作家&lt;/span&gt;莫言在这里举行新闻发布会。记者似乎要在这1个小时内“挖”出他的前世今生。他说，我是农民的儿子，以前是，得奖以后也是。他希望可以打破诺奖魔咒，创作出更好作品。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span id=&quot;content&quot;&gt;　　&lt;strong&gt;形容心情如巨石风吹不动&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span id=&quot;content&quot;&gt;　　莫言12时整准时步入会场，一阵相机的咔咔声之后，主持人宣布新闻发布会开始。莫言用“心如巨石，风吹不动”来形容自己此时的心情。莫言微笑着 回答每位记者的问题。“感谢各位记者，我知道大家已等我很久了。我来斯德哥尔摩的最主要的目的就是领奖，还有个目的就是来参加这个记者招待会。很多人把这 次新闻发布会描述得很可怕，我知道也有人把我描述得很可怕，不过来后我发现你们不可怕，我相信你们看到我会感觉我也不可怕。我们大家都是差不多的人。”一 阵开场白之后，他很快拉近了跟媒体的距离。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span id=&quot;content&quot;&gt;　　本报记者问：“10多年前你来过斯德哥尔摩，此次故地重游有何感想？”莫言回答：“11年前我确实来过，当时有几个朋友带我去参观了瑞典的皇宫 和颁发诺贝尔奖的地方，他们开玩笑说，你好好写，将来也有可能站在这里领奖。我就想我一定要好好写作，争取站在这里。现在来到这里，除了高兴外，还有一点 遗憾，我觉得世界上还有很多好的作家可以得诺贝尔奖，希望他们可以继续努力。”&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span id=&quot;content&quot;&gt;　　&lt;strong&gt;“获奖是我个人事情”&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span id=&quot;content&quot;&gt;　　谈到他此次获奖的意义，莫言说，我的获奖是文学的胜利，而不是政治的胜利，因为这是&lt;span name=&quot;HL_TAG&quot; style=&quot;border-bottom:dotted 0px;color:0084d8;text-decoration:underline;cursor:h&quot;&gt;诺贝尔文学奖&lt;/span&gt;， 而不是政治奖。获奖是我个人的事情，诺贝尔文学奖从来就是颁给一个作家的，而不是颁给一个国家的。但我相信我的获奖会引起一些作家的创作热情，我也希望我 的获奖对中国文学起到一个积极的推动作用。对我个人来讲最大的变化是，过去我在北京骑车上街没人理，前两天在街上，几个年轻姑娘要和我合影，我一下子知道 我是个名人了。我在得奖之后就说过，我希望大家把对我的热情转移到对中国广大的作家身上去，也希望能从阅读莫言一个人的作品开始阅读更多人的作品。中国以 及全世界有很多年轻作家，有人对他们提出批评，我一直支持他们。每一代人都有自己的生活。每一代人也应该写自己的文学。任何一个作家不可能让所有人喜欢 他。我们对未来的东西只能寄希望于年轻作家。&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span id=&quot;content&quot;&gt;　　&lt;strong&gt;“版税没有那么多”&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span id=&quot;content&quot;&gt;　　“我父亲有一句话很好，他说我&lt;span name=&quot;HL_TAG&quot; style=&quot;border-bottom:dotted 0px;color:0084d8;text-decoration:underline;cursor:h&quot;&gt;得奖&lt;/span&gt;之前是农民的儿子，得奖以后也是。我看见好多人请我签名我觉得很奇怪。我是一个谦虚的人，我知道自己的水平有多高，我希望今后继续保持谦虚的本色。有富豪榜说我版税收入了2150万元，我去银行查了一下，没有那么多。”&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span id=&quot;content&quot;&gt;　　&lt;strong&gt;冀破获奖后无佳作魔咒&lt;/strong&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;span id=&quot;content&quot;&gt;　　关于自己的笔名，莫言介绍自己的本名叫“管谟业”，改名莫言有三个原因，一是“谟”字拆开就是“莫言”；二是小时候因为乱说话，给父母带来很多 麻烦，所以他们教育我要少说话；三是人如果多说话就没精力写作了，既然选择作家这个职业，就把用嘴说出的话全都写出来。我的创作一直在寻求变化。这是对艺 术创新的追求，也是随着时代的变化我产生了很多想法，一成不变的作家不存在。当前最希望重新回到书桌前写小说，有人说一个作家获得诺贝尔奖后再也写不出好&lt;span name=&quot;HL_TAG&quot; style=&quot;border-bottom:dotted 0px;color:0084d8;text-decoration:underline;cursor:h&quot;&gt;作品&lt;/span&gt;， 但也有很多优秀作家打破了这个魔咒，我也希望自己努力加入这个行列，打破这个魔咒。讲故事是人的天性。每个人都是听着故事长大，长大后又成为讲故事的人。 作家通过故事表达自己对社会的看法，歌颂真善美，揭露假恶丑。讲故事是一个严肃的事情。故事的最大好处是有很宽阔的想象空间。最好的故事就是让每个读者都 能从这里面看出他自己。我会为此而继续努力。谈到向西方读者推荐自己的作品，他说，那我就推荐《生死疲劳》，这个小说里有想象力，有童话色彩，也有中国古 代的历史变迁。&lt;/span&gt;&lt;/p&gt;&lt;/div&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;', '', 'http://www.sh-zhuoao.com/upload/img/20121207/2012120723481384.jpg,', '', 0, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 09:56:59', '2013-04-03 09:56:59'),
(7, 1, 1, 12, '百度美拍：手机上最火爆的真实美女自拍社区', '', '　　近日，百度推出了基于手机照片、声音分享的移动社交应用“百度美拍”。上线后仅安卓版用户量已迅速超过300万。百度美拍创建了一个真实的美女自拍分享社区，让女生可以在这里全方位地秀出最美的自己。百度美拍...', '&lt;p&gt;　　近日，百度推出了基于手机照片、声音分享的移动社交应用“百度美拍”。上线后仅安卓版用户量已迅速超过300万。百度美拍创建了一个真实的美女自拍分享社区，让女生可以在这里全方位地秀出最美的自己。百度美拍同时也吸引了大量发现美、欣赏美的用户。目前，百度美拍已有柳岩、唐嫣、刘美人、徐海星等知名艺人模特入驻，同时也涌现出了如“辣妈宋有才”等独具特色的草根明星。&lt;/p&gt;&lt;p style=&quot;text-align:center;&quot;&gt;&lt;img id=&quot;{64E1B679-BD7C-40DB-90DD-4CBFA2ECC65A}&quot; alt=&quot;&quot; src=&quot;http://news.xinhuanet.com/tech/2013-03/29/124521580_11n.jpg&quot; /&gt;&lt;/p&gt;&lt;p style=&quot;text-align:left;text-align:left;&quot; class=&quot;pictext&quot;&gt;　　&lt;strong&gt;使用简单，全方位地秀出最美的你&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;　　百度美拍支持用百度账号、QQ号和新浪新浪微博登录，用户可以通过3秒自拍延时、前后摄像头切换以及闪光灯功能方便自拍。应用还内置了多达10款美肤滤镜，用户可以根据自己的爱好一键美肤，并将照片一键上传到微博、微信，与自己的好友分享。&lt;/p&gt;&lt;p style=&quot;text-align:center;&quot;&gt;&lt;img id=&quot;{B6473C0D-B2E5-4363-BCD3-642633EA863A}&quot; alt=&quot;&quot; src=&quot;http://news.xinhuanet.com/tech/2013-03/29/124521580_21n.jpg&quot; /&gt;&lt;/p&gt;&lt;p style=&quot;text-align:center;&quot;&gt;使用百度美拍的美肤滤镜功能上传自拍照片、配上录音，可以全方位地秀出你的美丽&lt;/p&gt;&lt;p&gt;　　&lt;strong&gt;美女排行榜，让你脱颖而出&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;　　百度美拍可以让女生在拍照的同时录下自己的声音、配上文字等丰富的表现形式。全方位地展现最美的自己，赢得美拍上众多粉丝的关注、喜欢、评论，在“活力新秀榜”、“最热美图榜”、“人气榜”和“小编推荐”等美女排行榜中脱颖而出，实现自己的明星梦想，走向更大的舞台。&lt;/p&gt;&lt;p style=&quot;text-align:center;&quot;&gt;&lt;img id=&quot;{02B732C8-D8B8-49BD-92DC-6AAF18DF531B}&quot; alt=&quot;&quot; src=&quot;http://news.xinhuanet.com/tech/2013-03/29/124521580_31n.jpg&quot; /&gt;&lt;/p&gt;&lt;p class=&quot;pictext&quot; style=&quot;text-align:center;&quot;&gt;百度美拍的美女排行榜可以让你脱颖而出，实现自己的明星梦想&lt;/p&gt;&lt;p&gt;　　&lt;strong&gt;在这里，也有美丽的欣赏者&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;　　百度美拍不但为女生提供了绝佳的平台全方位地秀出最美的自己，同时也吸引了大量发现美、欣赏美的用户。作为“美丽”的欣赏者，他们不仅可以通过“摇一摇”等丰富而有趣的方法，与心目中的女神不期而遇，而且可以通过关注、喜欢、评论、私信等方式与心目中的女神互动。&lt;/p&gt;&lt;p style=&quot;text-align:center;&quot;&gt;&lt;img id=&quot;{B27710DC-CA1F-4715-B9A1-1C5D286EDD36}&quot; alt=&quot;&quot; src=&quot;http://news.xinhuanet.com/tech/2013-03/29/124521580_41n.jpg&quot; /&gt;&lt;/p&gt;&lt;p style=&quot;text-align:left;text-align:left;&quot; class=&quot;pictext&quot;&gt;　　&lt;strong&gt;在这里，也有美丽的欣赏者&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;　　大家可以到苹果App Store、Google Play、91、安卓市场、安智市场、豌豆荚、UC等各大应用市场搜索“百度美拍”，赶紧体验一下哦。&lt;/p&gt;&lt;p&gt;　　百度美拍下载地址：http://app.image.baidu.com/meipai/手机扫描二维码也可下载!&lt;/p&gt;&lt;p style=&quot;text-align:center;&quot;&gt;&lt;img id=&quot;{31F5FC4F-F6A0-448A-8914-5D6B64DB2B09}&quot; alt=&quot;&quot; src=&quot;http://news.xinhuanet.com/tech/2013-03/29/124521580_51n.jpg&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;', '', 'http://news.xinhuanet.com/tech/2013-03/29/124521580_11n.jpg,http://news.xinhuanet.com/tech/2013-03/29/124521580_21n.jpg,http://news.xinhuanet.com/tech/2013-03/29/124521580_31n.jpg,http://news.xinhuanet.com/tech/2013-03/29/124521580_41n.jpg,http://news.xinhuanet.com/tech/2013-03/29/124521580_51n.jpg,', '百度', 0, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 10:11:19', '2013-04-03 10:11:19'),
(8, 1, 1, 12, '媒体详解北京唯一住房认定标准：外省市有房不算', '', '　“在未来的房地产市场中，确实应该考虑到购房人在各地的房产情况，但如果购房人在一个城市已经工作多年，确实存在购房居住需求，政策也应该满足这种合理性的诉求。”', '&lt;div class=&quot;TRS_Editor&quot;&gt;&lt;p&gt;　　“我在北京交社保刚满5年，但在老家已经有了两套房，最近老说全国房地产信息联网，会不会影响到我在京购房？”昨天，江苏籍邹先生致电本报，询问和“唯一住房”有关的认定标准。记者从多方求证后获悉，虽然全国数据联网势在必行，但按照现行政策，“唯一住房”按照纳税区域计算，邹先生在老家的两套房不会影响其在京购房的优惠政策。&lt;/p&gt;&lt;p&gt;　　邹先生在北京工作数年，如今已经有了购房资格，“京十九条”出台后，想找机会在城内买一套便宜的二手房，又担心数据联网以后自己在老家的房子被计算在内，不能再享受在京购买首套房的利率、税收优惠政策。&lt;/p&gt;&lt;p&gt;　　“如果我想在北京买房，是不是得把老家的卖了，再在北京购买的住房才算成唯一住房？”邹先生问。&lt;/p&gt;&lt;p&gt;　　记者查询到，文号为“国税发[2007]33号”的《国家税务总局关于个人转让房屋有关税收征管问题的通知》中规定，“家庭唯一生活用房”是指在同一省、自治区、直辖市范围内纳税人仅拥有一套住房。而纳税人如果有配偶，配偶名下需在同一区域内没有住房。&lt;/p&gt;&lt;p&gt;　　“这也就是说，如果购房人在京连续缴纳5年社保或个税，名下又没有北京的住宅，之前也没有过在京贷款购买住宅，符合购买一套房的标准，将可以享受首套房的相关优惠。”北京房协秘书长陈志说，在全国范围内，“京十九条”属于较为严密、严格的落地政策，因此可见会对房地产市场价格产生一定的影响，邹先生在京购房属于“刚需”，可以考虑看准机会购房。&lt;/p&gt;&lt;p&gt;　　邹先生所担心的另外一个问题，则是全国住房信息联网后，是否会影响到其在京购房。陈志说，目前全国主要城市已经基本实现了联网，电子信息化方面已经没有什么障碍。但这一套体系主要是为政府决策提供数据服务，也是未来一种主要的查询手段，暂时不会影响到“唯一住房”的认定。&lt;/p&gt;&lt;p&gt;　　“在未来的房地产市场中，确实应该考虑到购房人在各地的房产情况，但如果购房人在一个城市已经工作多年，确实存在购房居住需求，政策也应该满足这种合理性的诉求。”陈志说。(记者 耿诺) &lt;/p&gt;&lt;/div&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;', '', '', '百度', 0, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 10:12:41', '2013-04-03 10:12:41'),
(9, 1, 1, 12, '外交部：中方不希望看到半岛生战生乱', '', '　　原标题：张业遂：坚决维护朝鲜半岛和平与稳定 实现半岛无核化\n\n新华网北京4月2日电（记者张艺）外交部副部长张业遂2日就当前朝鲜半岛局势接受了新华社记者采访。张业遂说，一段时间以来，半岛局势持续紧张...', '&lt;p&gt;　　&lt;strong&gt;原标题：张业遂：坚决维护朝鲜半岛和平与稳定 实现半岛无核化 &lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;text-justify:distribute;text-align:justify;text-indent:30px;margin:0px 3px 15px;text-align:justify;&quot;&gt;新华网北京4月2日电（记者张艺）外交部副部长张业遂2日就当前朝鲜半岛局势接受了新华社记者采访。张业遂说，一段时间以来，半岛局势持续紧张。半岛是我国近邻，半岛局势变化与我国周边稳定密切相关，&lt;span name=&quot;HL_TAG&quot; style=&quot;border-bottom:dotted 0px 000099;&quot;&gt;&lt;a style=&quot;color:000099;font-size:14px;border-bottom:1px dotted 0781c7&quot; href=&quot;http://www.dzwww.com/xinwen/xinwenzhuanti/2008/ggkf30zn/201304/t20130403_8323771.htm&quot;&quot; target=&quot;_blank&quot;&gt;中方&lt;/a&gt;&lt;/span&gt;对此十分关注。我已奉命分别约见有关国家驻华使节，就当前事态表明了严重关切。 &lt;/p&gt;&lt;p style=&quot;text-justify:distribute;text-align:justify;text-indent:30px;margin:0px 3px 15px;text-align:justify;&quot;&gt;张业遂表示，中方始终坚持致力于维护半岛和平稳定、实现半岛无核化，主张通过对话协商解决问题。我们不希望看到半岛生战、生乱，反对任何一方的挑衅言行，反对任何一方做有损半岛和地区和平稳定的事情。 &lt;/p&gt;&lt;p style=&quot;text-justify:distribute;text-align:justify;text-indent:30px;margin:0px 3px 15px;text-align:justify;&quot;&gt;张业遂说，中方强烈呼吁各方保持冷静克制，避免相互刺激，切勿采取恶化局势的危险行动。我们敦促各方着眼大局和长远，坚持半岛无核化目标，积极对话接触，推动形势尽快转圜，共同维护半岛和平稳定。&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;', '', '', '百度', 0, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 10:14:38', '2013-04-03 10:14:38'),
(10, 1, 1, 12, '媒体称四川富商邓鸿遭调查 当地已有3位富豪被查', '', '资料图：成都会展旅游集团董事长邓鸿　　新京报讯 (记者刘溪若)昨日，多家媒体报道称，四川富商，成都会展旅游集团董事长邓鸿被爆正在接受有关部门调查。昨日，记者联系成都会展旅游集团，对于上述消息公司外宣部...', '&lt;p&gt;&lt;span&gt;&lt;p style=&quot;text-align:center;&quot;&gt;&lt;img src=&quot;http://pic.jschina.com.cn/0/16/18/39/16183968_999279.jpg&quot; alt=&quot;媒体称四川富商邓鸿遭调查 当地已有3位富豪被查&quot; /&gt;&lt;/p&gt;&lt;p style=&quot;text-align:center;&quot;&gt;资料图：成都会展旅游集团董事长邓鸿&lt;/p&gt;&lt;p&gt;　　新京报讯 (记者刘溪若)昨日，多家媒体报道称，四川富商，成都会展旅游集团董事长邓鸿被爆正在接受有关部门调查。昨日，记者联系成都会展旅游集团，对于上述消息公司外宣部表示“不予回应”。&lt;/p&gt;&lt;p&gt;　　公开资料显示，邓鸿现任四川成都会展旅游集团董事长，集团旗下拥有世纪城新国际会展中心、九寨天堂国际会议度假中心等多个项目。他曾名列2006年《福布斯》中国富豪排行榜第三百二十八位，是身价逾九亿元人民币的四川会展王兼旅游王。&lt;/p&gt;&lt;p&gt;　　昨日，据《21世纪经济报道》称，邓鸿目前正在接受有关部门的调查。据报道，他数十家经营实体牵涉的巨大利益最终流向何方，可能正是相关部门调查的重心所在。&lt;/p&gt;&lt;p&gt;　　另据财新传媒报道称，邓鸿最近一次公开露面是2013年2月19日，会见前来成都考察的上海官员。之后，他再未在公开场合露面。&lt;/p&gt;&lt;p&gt;　　昨日，本报记者连线成都会展旅游集团，对于邓鸿现在是否在正常上班以及企业是否正常运营等问题，该企业外宣部相关人员均表示“不予回应”。&lt;/p&gt;&lt;p&gt;　　财新传媒还称，目前包括邓鸿在内共有3名四川富豪在接受调查，另外两人分别是郎酒老板汪俊林和四川金路集团董事长刘汉。&lt;/p&gt;&lt;/span&gt;&lt;br /&gt;&lt;/p&gt;', '', 'http://pic.jschina.com.cn/0/16/18/39/16183968_999279.jpg,', '百度', 0, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 10:15:21', '2013-04-03 10:15:21'),
(11, 1, 1, 12, '南京H7N9患者家人欲卖房治病却被公布住址', '', '　　昨日，从事活禽宰杀的许某确认为感染H7N9禽流感确诊病例，其所工作的南京江宁区东新农贸市场仍正常营业。　　南京另一家农贸市场内待售的活鸡。因南京出现H7N9禽流病例，买活鸡的顾客减少。　　近期出现...', '&lt;p style=&quot;text-align:center;&quot;&gt;&lt;img alt=&quot;昨日，从事活禽宰杀的许某确认为感染H7N9禽流感确诊病例，其所工作的南京江宁区东新农贸市场仍正常营业。魏秦/CFP&quot; src=&quot;http://images.china.cn/news/attachement/jpg/site3/20130403/7967469731027727566.jpg&quot; /&gt;&lt;/p&gt;&lt;p&gt;　　昨日，从事活禽宰杀的许某确认为感染H7N9禽流感确诊病例，其所工作的南京江宁区东新农贸市场仍正常营业。&lt;/p&gt;&lt;p style=&quot;text-align:center;&quot;&gt;&lt;img alt=&quot;南京另一家农贸市场内待售的活鸡。因南京出现H7N9禽流病例，买活鸡的顾客减少。&quot; src=&quot;http://images.china.cn/news/attachement/jpg/site3/20130403/8959947345947608250.jpg&quot; /&gt;&lt;/p&gt;&lt;p&gt;　　南京另一家农贸市场内待售的活鸡。因南京出现H7N9禽流病例，买活鸡的顾客减少。&lt;/p&gt;&lt;p&gt;　　近期出现的人感染H7N9禽流感病毒，是全球首次发现的新亚型流感病毒。&lt;/p&gt;&lt;p&gt;　　目前上海已有两人死亡，安徽的1例病人病情危重，仍在救治中。最新通报的4个病例全部来自于江苏。截至昨日，全国已发现7例H7N9禽流感确诊病例，对此，多地加强启动防控部署，以应对病毒来袭。&lt;/p&gt;&lt;p&gt;　　已确诊病例出现过什么症状？患病前都曾接触过什么感染源？对此，本报记者分别前往南京、安徽，对其中两名确诊患者的居住地和工作地进行了探访。&lt;/p&gt;&lt;p&gt;　　新京报讯 昨日，安徽滁州一H7N9确诊患者韩某仍在南京中大医院ICU病房治疗，其丈夫称，目前妻子的病情仍很危重，北京派去的专家已提供治疗方案。据了解，患者发病前5天曾去菜市场买活鸡回家烹煮。&lt;/p&gt;&lt;p&gt;　　&lt;strong&gt;滁州患者抗炎治疗无效&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;　　患者韩某，女，35岁，居住在安徽滁州市南谯区某公寓4层。其丈夫张某称，妻子患有抑郁症，没有上班，平时就带十岁的女儿读书。&lt;/p&gt;&lt;p&gt;　　今年3月14日，韩某高烧39℃，次日在社区诊所就诊，服用阿奇霉素等消炎、抗病毒药物，症状没有缓解。随后她又去另一家诊所就诊，但症状未缓解，并且高烧达40℃。&lt;/p&gt;&lt;p&gt;　　3月19日，韩某在丈夫陪同下前往滁州市中西医结合医院就诊，由于病情较重，次日又转入滁州市第一人民医院，当时诊断为肺炎。20日下午，患者转至南京中大医院。&lt;/p&gt;&lt;p&gt;　　南京中大医院入院诊断为：重症肺炎；感染性休克；多器官功能障碍综合征、病毒性心肌炎、肝功能不全；抑郁症。&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;', '', 'http://images.china.cn/news/attachement/jpg/site3/20130403/7967469731027727566.jpg,http://images.china.cn/news/attachement/jpg/site3/20130403/8959947345947608250.jpg,', '百度', 0, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 10:15:54', '2013-04-03 10:15:54'),
(12, 1, 1, 12, '《你画我猜》创始人从Zynga离职', '', '《你画我猜》开发工作室OMGPOP创始人丹·波特　　新浪科技讯 北京时间4月3日上午消息，美国社交游戏开发商Zynga周一宣布，该公司旗下移动游戏《你画我猜》(Draw Somethings)开发工作...', '&lt;p&gt;&lt;span class=&quot;img_descr&quot;&gt;《你画我猜》开发工作室OMGPOP创始人丹·波特&lt;/span&gt;&lt;/p&gt;&lt;p&gt;　　新浪科技讯 北京时间4月3日上午消息，美国社交游戏开发商Zynga周一宣布，该公司旗下移动游戏《你画我猜》(Draw Somethings)开发工作室OMGPOP创始人丹·波特(Dan Porter)已经离职。&lt;/p&gt;&lt;p&gt;　　在此之前，Zynga刚刚在瑞典推出了《你画我猜》的续作，以测试市场反应。而在随后的简短声明中，Zynga COO大卫·科(David Ko)也对波特的贡献表达了感激。除此之外，2009年加盟Zynga并领导《CityVille》游戏开发的肖恩·凯利(Sean Kelly)将接替波特，担任该公司纽约办事处主管。&lt;/p&gt;&lt;p&gt;　　波特尚未对此置评。&lt;/p&gt;&lt;p&gt;　　在目睹了《你画我猜》的巨大成功后，Zynga 2012年3月斥资1.83亿美元收购了OMGPOP，这也成为该公司有史以来规模最大的一笔并购。《你画我猜》由一个玩家在手机上根据选定的单词绘制图画，然后由它的好友根据图画猜测这个词汇。该交易完成时，这款游戏虽然上线仅6周，但已经吸引了3500万用户。&lt;/p&gt;&lt;p&gt;　　不过，《你画我猜》很快触顶，用户大举流失。Zynga几周后仍在对这款游戏辩护，时任Zynga COO的约翰·沙珀特(John Schappert)强调了这款游戏的超速增长：“我们认为这是一款有生命力的产品，它的活力将延续数年。”但随后，Zynga在同年7月承认，这款游戏的营收的确在下滑。&lt;/p&gt;&lt;p&gt;　　据美国财经网站Quartz报道，波特3月初参加一次专题讨论会时称：“Zynga经常被控抄袭游戏，这基本属实。”由此引发了轩然大波。但Zynga随后发布了一封署名波特的道歉信澄清了此事，并称外界对此理解有误。&lt;/p&gt;&lt;p&gt;　　“我真正的意思是说，所有游戏都源于其他游戏，早在Zynga诞生前很久就存在这种现象，而现在有关游戏独创性的讨论都有些言过其实，没抓住重点。”他说。(书聿)&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;', '', '', '百度', 0, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 10:16:29', '2013-04-03 10:16:29'),
(13, 1, 1, 12, '1.5亿购买腾讯所持股份 雷军成金山最大股东', '', '原标题 [1.5亿购买腾讯所持股份 雷军成金山最大股东]　　每日经济新闻记者 谢晓萍 发自北京　　昨日 （4月2日），金山软件（03888，HK）发布公告称，公司主要股东及董事局主席雷军将斥资1.91...', '&lt;div class=&quot;original-title&quot;&gt;&lt;strong&gt;原标题&lt;/strong&gt; [&lt;strong&gt;1.5亿购买腾讯所持股份 雷军成金山最大股东&lt;/strong&gt;]&lt;/div&gt;　　每日经济新闻记者 谢晓萍 发自北京&lt;br /&gt;&lt;br /&gt;　　昨日 （4月2日），金山软件（03888，HK）发布公告称，公司主要股东及董事局主席雷军将斥资1.91亿港元（约合人民币1.52亿元）购买腾讯控股（00700，HK）所持有的2932.46万股公司股份，占总股本2.5%，预计4月18日前交收。&lt;br /&gt;&lt;br /&gt;　　此次增持完成后，雷军在金山的持股比例达到14.89%，超过腾讯减持后的12.7%，成为真正意义的大股东。受此影响，金山软件股价今日收盘时涨至7.4港元，涨幅4.1%。&lt;br /&gt;&lt;br /&gt;　　资深互联网评论家洪波对此表示：雷军成为形式上的最大单一股东，也意味着他已意识到金山在其棋局中的价值，包括安全、云计算以及游戏等。&lt;br /&gt;&lt;br /&gt;　　雷军曾经两度增持&lt;br /&gt;&lt;br /&gt;　　根据金山公告，完成增持后，雷军连同被视为一致行动人士的非执行董事求伯君及前非执行董事张旋龙的持股量，由交易前的24.59%提升至27.09%。&lt;br /&gt;&lt;br /&gt;　　值得注意的是，2011年7月腾讯斥资8.9亿港元向求伯君及张旋龙购入金山软件1.78亿股时，每股作价5港元，而此次交易，实际每股已涨至约6.5港元，腾讯暂时获利近4400万港元。&lt;br /&gt;&lt;br /&gt;　　2011年的这次交易，腾讯共获得15.68%股权成为金山第一大股东，新任董事长雷军成为金山第一大个人股东，占股10.3%。&lt;br /&gt;&lt;br /&gt;　　当时外界曾认为腾讯可能已成为金山的实际控制人。但在随后的媒体沟通会上，雷军曾对《每日经济新闻》记者透露，其与求伯君等人签署了一个协议 （一致行动人），大家的股权捆绑在一起。&lt;br /&gt;&lt;br /&gt;　　雷军表示，腾讯仅为战略投资，没有进一步控制金山的意图。而且，金山董事会里有八名董事是金山的高层，腾讯只占一席。&lt;br /&gt;&lt;br /&gt;　　根据昨日金山公告的股权比例，《每日经济新闻》记者注意到，此次并非雷军第一次增持金山股份。根据当时腾讯入股金山的股权结构，雷军仅占股10.3%，而后增持到了12.39%，同样作为第一大股东的腾讯也在此期间由15.68%减持为15.19%。&lt;br /&gt;&lt;br /&gt;　　洪波认为，相比较而言，腾讯并不会在乎4000多万的投资收益而要求减持。对此，腾讯方面对此表示，腾讯减持自有其考虑，目前暂无更细节的信息与外界分享。&lt;br /&gt;&lt;br /&gt;　　雷军的棋局&lt;br /&gt;&lt;br /&gt;　　此次增持后，雷军已成为真正意义上的大股东，这似乎也让金山在雷军棋局的价值逐渐浮出水面。&lt;br /&gt;&lt;br /&gt;　　洪波认为，未来金山至少可以在安全、云计算、游戏等方面在雷军系公司中凸显价值，“小米的云服务完全是搭建在金山云之上。”&lt;br /&gt;&lt;br /&gt;　　据《每日经济新闻》记者了解，金山云是金山旗下很看重的一块移动互联网业务，是金山转型移动互联网的具体落实，由金山软件CEO张宏江亲自挂帅。最近一年来，金山云业务不仅单独成立子公司，还获得小米182万美元入股并持有金山云9.87%的股份，最近又宣布旗下核心产品金山快盘用户数突破3500万，用户上传文件数量超150亿。&lt;br /&gt;&lt;br /&gt;　　针对昨日的增持，雷军对记者表示，自己是用行为来表达将金山做好的决心，同时也看好金山的未来。&lt;br /&gt;&lt;br /&gt;　　据了解，目前金山3 1策略已经成形，即三个主要现有业务线加一个战略性新业务线。相关资料显示，金山软件2012年度纯利为4.32亿元人民币，同比增加33%。&lt;p&gt;&lt;br /&gt;&lt;/p&gt;', '', '', '百度', 0, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 10:16:57', '2013-04-03 10:16:57'),
(14, 1, 1, 12, '天猫推出代收货服务：亲,你的宝贝到店喽', '', '　　“喜士多可以代收包裹啦！”昨天，家住密渡桥一弄的小俞，看到小区门外的喜士多便利店贴出了“天猫、淘宝网包裹指定取货点”的告示，喜出望外。小俞平均每个月要在网购上花上千元，衣服、鞋子、甚至生活用品、零...', '&lt;p&gt;　　“喜士多可以代收包裹啦！”昨天，家住密渡桥一弄的小俞，看到小区门外的喜士多便利店贴出了“天猫、淘宝网包裹指定取货点”的告示，喜出望外。小俞平均每个月要在网购上花上千元，衣服、鞋子、甚至生活用品、零食都喜欢上网淘，包裹签收是让她苦恼的大难题。&lt;br /&gt;&lt;br /&gt;　　这项“免费代收包裹”服务的发起方天猫表示，除了喜士多以外，杭州地区还有祐驿站、绿城物业两个合作点，三个加在一块儿，目前杭州地区共有265个包裹取货点。&lt;br /&gt;&lt;br /&gt;　　前不久，一则《北漂女歌手被误认为有钱惨遭杀害 快递员获死刑 》的新闻让网购族特别是单身女青年们捏了把汗，人人自危。&lt;br /&gt;&lt;br /&gt;　　“其实，代收包裹的服务在正式上线之前，我们已经在喜士多几家门店做过测试，通过调研，我们发现选择到便利店来取包裹的有不少是单身女孩，因为怕泄露家庭地址不安全。”喜士多相关负责人许晨说。&lt;br /&gt;&lt;br /&gt;　　据了解，从4月2日开始，杭州地区所有喜士多便利店，都可以为消费者提供24小时代收货服务，此外，支持这项服务的还有祐驿站和绿城物业。&lt;br /&gt;&lt;br /&gt;　　操作流程很简单：在淘宝网/天猫，点击“购买”宝贝后，会出现一个“选择收货地址”页面，选择“代收货服务”，然后会出现一长排代收点，买家觉得哪个点取货方便就选哪个，然后点击“确认订单”就可以了。&lt;br /&gt;&lt;br /&gt;　　包裹到达代收点后，代收点会将订单信息通过扫描录入电脑系统，系统会自动发短信给买家。买家凭着短信和短信内的验证码，或者身份证号码取货。&lt;br /&gt;&lt;br /&gt;　　天猫相关负责人表示，考虑到代收点的情况，目前暂时只支持体积小、非生鲜、金额不超过3000元的货品。如果消费者在淘宝、天猫网购时，类目不符合要求，系统是不会显示“代收货服务”选项的。&lt;br /&gt;&lt;br /&gt;　　从去年10月，天猫就推出了“社区服务站计划”，目前已在北京、上海、杭州等22个城市2600多个便利店、社区物业网点推广。预计到今年6月底，杭州市区将有400家站点支持代收货，而服务网点未来还将逐步添加“寄件”等功能。&lt;br /&gt;&lt;br /&gt;　　“有了服务站，快递员派送效率、妥投率会提高。”圆通快递公司营销管理中心总监宋建洪表示，以往碰到收件人不在家，还需要二次投递，不仅重复劳动，沟通成本也增加，客户满意度也低，“天猫这个服务站模式，像小区物业、便利店总会有人在，而且有系统支持，派件成本固定，妥投率提升，快递服务满意度也会提高，派送效率也快了。”&lt;br /&gt;&lt;/p&gt;', '', '', '百度', 0, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 10:17:24', '2013-04-03 10:17:24'),
(15, 1, 1, 12, '一个小仓库两个合伙人 月销水果8万元', '', '　　玩O2O的“煎饼阿姨”其实有很多杭州版本　　一个小仓库，两个合伙人，月销水果8万元　　社交平台和消费需求对接后，开出一片新天地　　本报记者 徐秀雰　　这几天，一个卖煎饼阿姨的O2O（即online...', '&lt;div class=&quot;text clear&quot; id=&quot;contentText&quot;&gt;　　玩O2O的“煎饼阿姨”其实有很多杭州版本&lt;br /&gt;&lt;br /&gt;　　一个小仓库，两个合伙人，月销水果8万元&lt;br /&gt;&lt;br /&gt;　　社交平台和消费需求对接后，开出一片新天地&lt;br /&gt;&lt;br /&gt;　　本报记者 徐秀雰&lt;br /&gt;&lt;br /&gt;　　这几天，一个卖煎饼阿姨的O2O（即online to offline，将线下商务的机会与互联网结合在一起，让互联网成为线下交易的前台）真实案例，成为网络热传的故事&lt;br /&gt;&lt;br /&gt;　　一位网友说，“前些天回母校，跟校旁小摊贩卖煎饼的阿姨聊天。快到饭口，她的手机QQ响个不停。她建立了一个QQ群， 还在上课的同学们纷纷在群里留言向她下单。然后她记录下Q名，并提前做好，用纸条塞上标记，这样学生们下课后直接交钱取货。她说此方法已经用五六年了，效果很不错。”&lt;br /&gt;&lt;br /&gt;　　有许多业内人士评价，这才是最接地气的O2O模式。也有人表示，这样的模式在生活中已无处不在。&lt;br /&gt;&lt;br /&gt;　　记者发现，时下用QQ订餐、用微信买菜、用微博订蛋糕……已成为都市潮人广为接受的生活方式。&lt;br /&gt;&lt;br /&gt;　　&lt;strong&gt;有人用QQ订餐，有人用微信打车&lt;/strong&gt;&lt;br /&gt;&lt;br /&gt;　　“其实用QQ订餐很早就有了，我们办公室平时都用QQ直接叫外卖的。”在杭州城西西湖国际科技大厦上班的某网站公司员工小黎告诉记者，自己有五六家快餐店的QQ号，每天11点办公室员工会一起下单订餐，12点就可以准时吃上饭了。“用文字的方式发给对方，会比较方便，也比较准确。”小黎说，用QQ点餐只是一方面，她还试过用微信订蛋糕。&lt;br /&gt;&lt;br /&gt;　　“同事生日，通过一家蛋糕店的微信号订的，早上预订，晚餐前准时送到。我的朋友中也有人用微信打车和买菜。”对于像小黎这样的白领，用社交平台来购物已逐渐成为生活一部分。&lt;br /&gt;&lt;br /&gt;　　“一个月买四次菜，只要通过微信告诉对方我需要的菜，并告知配送时间就行，特别适合我们这样的懒人。”甜甜目前是一个两岁孩子的母亲，因为工作很忙没时间买菜，最近看到有朋友在微博上晒信息，说通过某公司的官方微博买菜，于是自己也尝试加入了这个行列。&lt;br /&gt;&lt;br /&gt;　　“一般我会告诉对方配送100元的菜，基本是菌菇类、蔬菜、鸡蛋等配好的套餐。”甜甜说，这样买菜虽然要比去菜场价格更高些，但对于忙碌的白领来说，无疑是有巨大需求的。&lt;br /&gt;&lt;br /&gt;　　除了买菜订餐，通过微信打车也逐渐被一些时尚人士所接受。&lt;br /&gt;&lt;br /&gt;　　在杭州，许多出租车司机开始用起了智能手机，一边做生意，开着微信，或者APP软件“快的打车”。“现在路上开车，路上50%的时间在微信上交流，有时候看下&amp;quot;快的打车&amp;quot;（一款为打车乘客和出租车司机量身定制的智能手机应用）。”记者在打车时，一位姓单的司机告诉记者。&lt;br /&gt;&lt;br /&gt;　　“我就经常用&amp;quot;快的打车&amp;quot;叫出租车啊，很方便，就不用老站在路边等，会告诉我（出租车）多少时间内到我的地方。”小黎说这样的叫车方式已渐成流行。&lt;br /&gt;&lt;br /&gt;　　&lt;strong&gt;“90后”学生 送货人 微信=水果店&lt;/strong&gt;&lt;br /&gt;&lt;br /&gt;　　“果哥果哥，明天给我送一箱苹果。”“果哥，三天后请配送200元的凤梨和车厘子。”……“80后”果哥一边开车送货，一边手机上的微信提醒响个不停。&lt;br /&gt;&lt;br /&gt;　　果哥半年前开了一家水果店，不过这家店没有店铺，也没有店员，在勾庄借用了一个小小的仓库，只有他负责备货送货，合伙人是个“90后”，在校的大四学生周颖。&lt;br /&gt;&lt;br /&gt;　　“她负责美工和文案，在微博上发布我们的信息，而我就负责通过微信收集订单，并且负责采购和送货。”果哥说从去年八月份开始只有4000元的月销售额，到现在已经突破每月8万元，自己也觉得挺惊人。&lt;br /&gt;&lt;br /&gt;　　“我不懂什么叫O2O模式，但我们从微博开店到现在半年，销售额已经翻了十几倍了。”&lt;br /&gt;&lt;br /&gt;　　果哥认为，这样一个零成本的水果销售模式，一方面降低了中间环节的成本，另一方面也缩短了客户和新鲜水果之间的直线距离，“水果更新鲜，而顾客购买的价格也更实惠。”&lt;br /&gt;&lt;br /&gt;　　“其实这种模式，在上海、北京已经有成功的企业了，未来应该是一种趋势，不仅仅是销售模式的改变，是人们生活方式的改变。”&lt;br /&gt;&lt;br /&gt;　　每天晚上，果哥会收集好一天的订单，并且在第二天早上9点前备完一天的货，接下来就是配送过程，“刚开始都是我一个人送，现在客户多起来了，我们增加了一个专门送货员，以及几个临时送货员。”&lt;br /&gt;&lt;br /&gt;　　果哥透露，目前每天接到的订单最多也就十几单，但客户都以家庭为单位，一买就至少100元以上。“以这种方式订水果的基本都是年轻的小家庭，所以我们的水果也都定位比较高。”果哥认为，将社交平台和销售融合，会和客户关系更加紧密，对售后问题处理也更加容易和及时。&lt;br /&gt;&lt;br /&gt;　　&lt;strong&gt;社交平台渗透电子商务已成趋势&lt;/strong&gt;&lt;br /&gt;&lt;br /&gt;　　“其实严格意义上来说，煎饼阿姨和微博打车都不是真正的O2O模式。O2O还有一个支付的过程，必须也是在线上完成的，比如团购网站就是典型的O2O模式。”艾瑞咨询分析师黄元浦分析，目前O2O的模式还广受争议。&lt;br /&gt;&lt;br /&gt;　　“但有一点毋庸置疑，微博、微信等社交平台渗透电子商务，已经成为一种趋势，通过社交平台的传播，促进线下或者线上的交易，效果确实明显。”&lt;br /&gt;&lt;br /&gt;　　黄元浦分析，这样的模式并非新兴的商业模式，但社交平台一旦和客户的消费需求连接起来，就会填补很多消费需求的空白，“比如用微信打车，就可以把客户的需求和司机的需求通过社交平台联系起来。可以节约很多资源。”&lt;br /&gt;&lt;br /&gt;　　不过也有专家提醒，通过社交平台产生的交易，也会导致个人信息的泄露，比如自己的住址、联系方式、家人收入等，都很容易被对方获取，所以在运用时也要适当保护个人信息安全。来源今日早报)&lt;/div&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;', '', '', '百度', 0, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 10:18:03', '2013-04-03 10:18:03');
INSERT INTO `article_info` (`aiid`, `sid`, `uid`, `smid`, `name`, `tags_name`, `description`, `content`, `thumbnail`, `img_url`, `source_url`, `sort`, `status`, `start_time`, `end_time`, `add_time`, `update_time`) VALUES
(16, 1, 1, 12, '“抢食”移动支付银行与第三方支付合作大于竞争', '', '　　稿件来源：　　本报记者 马黎　　刚刚过去的2012年，可以说是“移动支付元年”，银行、支付公司、运营商等企业，都在这一年对移动支付业务进行了市场布局。　　2013年，移动支付领域将会迎来新的井喷。...', '&lt;p&gt;　　稿件来源：&lt;br /&gt;&lt;br /&gt;　　本报记者 马黎&lt;br /&gt;&lt;br /&gt;　　刚刚过去的2012年，可以说是“移动支付元年”，银行、支付公司、运营商等企业，都在这一年对移动支付业务进行了市场布局。&lt;br /&gt;&lt;br /&gt;　　2013年，移动支付领域将会迎来新的井喷。在“抢食”移动支付蛋糕的这场战役中，银行与第三方支付平台如何处理竞合关系？&lt;br /&gt;&lt;br /&gt;　　随着央行支付牌照进一步发放以及产业链各方纷纷将移动支付作为企业未来市场竞争的核心竞争力，2013年，移动支付领域将会迎来新的井喷。&lt;br /&gt;&lt;br /&gt;　　移动支付发展驶入快车道&lt;br /&gt;&lt;br /&gt;　　《中国互联网络发展状况统计报告》显示，截止去年底，我国手机网民规模突破4.2亿。这一数据背后是巨大的商业利益，银行与第三方支付平台开始抢占手指上的商机。“不必刷银行卡，只需在收银终端前刷手机，就能进行支付。”这就是移动金融服务所描绘的支付场景。&lt;br /&gt;&lt;br /&gt;　　日前，光大银行与中国银联共同推出基于NFC通讯协议的移动支付业务成功完成了联调，下一步将正式进入商用推广。记者从光大银行获悉，该行还相继与中国移动、中国联通、中国电信等运营商携手合作，光大与三大运营商合作推出的光大银行移动支付业务也将于4月陆续上线。&lt;br /&gt;&lt;br /&gt;　　与一些银行普遍采取的NFC模块与手机分开发展的模式不同的是，光大的“手机钱包”直接加载在运营商SIM卡上的金融IC卡应用。在使用时，客户在中国银联“闪付”终端上，无需输入密码和签名，即可完成交易。光大电子银行部相关负责人告诉记者，“要想让客户乐于使用移动支付业务，还需要有覆盖面广的移动支付近场受理商户。”“我们平常做1笔移动支付只是柜面成本的15%。我们这几年通过移动支付来形成的访问量，相当于450个1000平米的网点。”招行行长马蔚华日前表示，移动互联网改变了人们办理银行业务的方式，银行必须要适应这一变化。&lt;br /&gt;&lt;br /&gt;　　日前，招行2012年年报也为手机支付业务公布了一份亮丽的成绩单。据年报披露，招商银行手机银行签约客户总数已达966.49万户，同比增长115.03%；手机支付累计交易5779.51万笔，同比增长435.19%；累计交易金额为108.78亿元，同比增长347.29%。&lt;br /&gt;&lt;br /&gt;　　短期内合作大于竞争&lt;br /&gt;&lt;br /&gt;　　争抢移动支付这块“大蛋糕”的绝不止银行一方，第三方支付平台也积极争夺移动支付市场。&lt;br /&gt;&lt;br /&gt;　　掌中付是行业化移动支付解决方案提供商，专注于移动支付领域。记者从掌中付获悉，目前该公司提供的远程支付方式，消费者可无需开通网银，直接输入带有银联标志的银行卡号和密码，即可完成支付。全程仅需10秒左右，且安全、快捷。&lt;br /&gt;&lt;br /&gt;　　那么，银行与第三方支付平台如何处理竞合关系？掌中付常务副总张圣告诉记者，“银行最大的特点是有庞大的用户群，为用户提供金融服务。而第三方公司处于银行与商户之间，它最大的特点是拥有种类繁多的应用及渠道，帮助商户更好的实现支付服务。”张圣认为，银行与第三方支付平台的合作关系要大于竞争关系。对于商户而言，更愿意寻找第三方作为支付枢纽，首先门槛比较低，其次只需要与第三方合作，它全部的支持银行都能为之所用。“今后的第三方一定会将应用作为主要的发展方向，会逐渐从渠道向多应用转变。”&lt;br /&gt;&lt;br /&gt;　　艾瑞咨询《2012-2013年中国移动支付市场研究报告》显示，2012年中国移动支付市场交易规模达1511.4亿元，同比增长89.2%，预计2016年，交易规模将突破万亿交易规模，达到13583.4亿元。&lt;br /&gt;&lt;br /&gt;　　移动支付还处于探索期&lt;br /&gt;&lt;br /&gt;　　是什么因素助推了移动支付的快速发展？易观国际高级分析师张萌告诉记者，随着智能手机用户的不断增多，及移动互联网的快速发展，为移动支付提供了“土壤”。“近年来，商户也有了一定积累，比如电商、团购也开始做移动网购。银行也加大了手机银行的推广力度，借助营销活动来培育用户的习惯。”张萌认为，虽然手机银行在短期内难以超越网上银行，但长远来看，随着移动互联网向互联网迁移，移动支付将成为未来支付的发展趋势。银行应朝着差异化方向发展，即从自身的业务属性和用户体验方面去创新产品。&lt;br /&gt;&lt;br /&gt;　　虽然移动支付市场的发展势头凶猛，但张圣认为，目前国内的移动支付还处在初级阶段，面临着行业监管缺失、支付安全隐患以及普及率较低等问题，大多数移动支付企业还处在摸索阶段，整体市场还属于探索期，未来还有很长的路要走。&lt;br /&gt;&lt;br /&gt;　　业内专家表示，如何有效应用移动信息技术，更好地通过金融创新为客户服务，是商业银行在从固化物理站点转变到无线移动化金融服务过程中所需考虑的关键问题。&lt;br /&gt;&lt;br /&gt;&lt;/p&gt;', '', '', '百度', 0, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 10:18:36', '2013-04-03 10:18:36'),
(17, 1, 1, 12, '黑客攻击程序黑市繁荣：一套可卖50万美元', '', '　　【搜狐IT消息】4月3日消息，全球迈入网络战时代，计算机网络一旦遭黑客攻击后果惨重。但英国《经济学人》杂志报道称，黑客攻击使用的软件其实在黑市就可买卖。这些俗称“攻击程序”（exploits）因需...', '&lt;div class=&quot;text clear&quot; id=&quot;contentText&quot;&gt;&lt;p&gt;　　【搜狐IT消息】4月3日消息，全球迈入网络战时代，计算机网络一旦遭黑客攻击后果惨重。但英国《经济学人》杂志报道称，黑客攻击使用的软件其实在黑市就可买卖。这些俗称“攻击程序”（exploits）因需求带动买气，价格近十年翻了五倍，单套甚至要价五十万美元。&lt;/p&gt;&lt;p&gt;　　美国马里兰大学专家苏布拉马尼安指出，犯罪集团与恐怖组织有的经由非法在线论坛、有的透过违法掮客牵线买到攻击程序，这类交易形同“卖枪给罪犯”。&lt;/p&gt;&lt;p&gt;　　十多年前，交易非法攻击程序很罕见，如今黑市买卖已相当普遍。《经济学人》指出，攻击程序本身合法，也有合法企业开发贩卖。美国Netragard去年卖掉逾五十套攻击程序给政府机关和公司，要价从2万至25万美元以上。&lt;/p&gt;&lt;p&gt;　　欧洲议会荷兰代表沙珂女士一直鼓吹禁止交易攻击程序，不过要禁止知易行难，美国安局前计算机科学家艾特尔说，攻击软件是知识，不可能阻止人们创造并散播知识；法律专家认为，程序代码应受言论自由保障。再者，黑客把攻击程序隐藏妥当，难以追踪并修补。&lt;/p&gt;&lt;p&gt;　　曾任法军计算机情报中校的网络安全专家菲利欧说，几乎所有情报单位都购买攻击程序。他的实验室就获得法国国防部资金，他们则提供对方攻击程序。菲利欧说，攻击程序价码近十年来暴涨超过五倍，但价格落差甚大。一套可让管理者操纵远程微软ＸＰ计算机的软件只需四千美金。如果攻击对象是微软IE浏览器，要耗费五十万美元。&lt;/p&gt;&lt;p&gt;　　软硬件公司也是攻击程序的买家，它们想辨识并修理产品漏洞。但这种小儿科赏金不够塞住开发商的牙缝。去年谷歌提供法国企业Vupen六万美元，想买下入侵Chrome的攻击程序，但遭对方拒绝，因为“有人出更高价”。业界人士称，美国特工最乐意花大钱买攻击软件。由于网络被视为新战场，攻击程序价码居高不下，该公司产品最高可卖到20万美金。&lt;/p&gt;&lt;p&gt;　　美国国防部网络司令部司令亚历山大上月警告，由政府支持的团体纷纷使用从非法在线市场购入的网络工具，窃取摧毁数据；五角大厦官员也称，购买攻击程序的政府，根本就是在建设黑市。基于此考虑，越来越多政府开始自行开发攻击程序，如此可省去不少风险，也不必担心卖家把程序再出售给第三者。&lt;/p&gt;&lt;/div&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;', '', '', '百度', 0, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 10:19:04', '2013-04-03 10:19:04'),
(18, 1, 1, 12, '天猫服务站小长假帮你免费代收货', '', '截至目前，天猫代收货服务已覆盖22个城市2600多个网点。　　小长假家里没人，快递来了怎么办？包裹送到公司再搬回家，不方便？酷爱网购，但不想暴露家庭地址隐私？这样的需求，可以通过天猫社区服务站提供的代...', '&lt;p&gt;截至目前，天猫代收货服务已覆盖22个城市2600多个网点。&lt;/p&gt;&lt;p&gt;　　小长假家里没人，快递来了怎么办？包裹送到公司再&lt;a class=&quot;keyword_link&quot; id=&quot;k531804085&quot; href=&quot;http://www.chinabyte.com/keyword/搬回家/&quot; target=&quot;_blank&quot;&gt;搬回家&lt;/a&gt;，不方便？酷爱网购，但不想暴露家庭地址隐私？这样的需求，可以通过天猫社区服务站提供的代收货服务满足。&lt;/p&gt;&lt;p&gt;　　&lt;a class=&quot;keyword_link&quot; id=&quot;k530831195&quot; href=&quot;http://com.chinabyte.com/alibaba/&quot; target=&quot;_blank&quot;&gt;阿里巴巴&lt;/a&gt;旗下天猫事业群天猫物流事业部去年10月上线的“天猫社区服务站”，已在北京、上海、杭州、嘉兴、宁波、武汉、合肥、深圳等22个城市2600多个便利店、社区物业网点亮相，推出“为你收货，替你保管”的代收货服务，让消费者从“等快递”变为就近到服务站自提“取快递”。代收货服务覆盖&lt;a class=&quot;keyword_link&quot; id=&quot;k530831460&quot; href=&quot;http://com.chinabyte.com/taobao/&quot; target=&quot;_blank&quot;&gt;淘宝&lt;/a&gt;、天猫平台网购绝大多数类目。&lt;/p&gt;&lt;p&gt;　　4月2日，华东地区又新增“喜士多”便利店为天猫社区服务站合作伙伴。仅以杭州为例，就新增70多个天猫社区服务站的喜士多网点，为消费者提供代收货。这两天淘宝、天猫网购的消费者，若打算小长假出门，不妨尝试一下这新颖的代收货服务。&lt;/p&gt;&lt;p&gt;　　&lt;strong&gt;服务站快递免费自提&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;　　家里没人，快递没人签收，包裹拿不了，要是送到我家&lt;a class=&quot;keyword_link&quot; id=&quot;k531797848&quot; href=&quot;http://www.chinabyte.com/keyword/附近/&quot; target=&quot;_blank&quot;&gt;附近&lt;/a&gt;就好了;包裹太多，带不回去，要是送到小区物业就好了。也正因为这些烦恼，天猫服务站诞生，推出便民的自提服务。&lt;/p&gt;&lt;p&gt;　　即日起，在这22个城市的天猫、淘宝消费者在网购下单时，可选择就近的天猫服务站，通过授权指定的服务站为其代收包裹来解决小长假代收货问题。天猫社区服务站将在包裹到站后，检验包裹完整性后扫描签收录入系统，随即系统发短信和密码通知消费者前往取件。在包裹到站5天内，服务站予以免费保管，消费者可在期间凭借证件及密码上门自提。(代收货流程详见&lt;a href=&quot;http://www.tmall.com/go/chn/mall/fuwuzhan.php?spm=3.333778.285292.5.3e493&quot;&gt;http://www.tmall.com/go/chn/mall/fuwuzhan.php?spm=3.333778.285292.5.3e493&lt;/a&gt;)&lt;/p&gt;&lt;p&gt;　　哪些网购产品支持自提？ 考虑到服务站点情况，天猫服务站暂且支持体积小、非生鲜、金额不超过3000元的货品。不过这已经支持淘宝、天猫80%的商品。若消费者淘宝、天猫网购时，类目不符合代收网点需求，系统就不再显示代收货服务选项。&lt;/p&gt;&lt;p style=&quot;text-align:center;&quot;&gt;&lt;img src=&quot;http://image.tianjimedia.com/uploadImages/2013/092/X6S2BKKO28V5.jpg&quot; height=&quot;682&quot; width=&quot;512&quot; /&gt;&lt;/p&gt;&lt;p&gt;　　图为杭州喜士多便利店网点已将“淘宝、天猫包裹指定取货点”做了公示。&lt;/p&gt;&lt;p&gt;　　&lt;strong&gt;提高快递业“妥投率”&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;　　“有了服务站，快递员&lt;a class=&quot;keyword_link&quot; id=&quot;k531800433&quot; href=&quot;http://www.chinabyte.com/keyword/派送/&quot; target=&quot;_blank&quot;&gt;派送&lt;/a&gt;效率、妥投率会提高。”圆通快递公司营销管理中心总监宋建洪表示，以往很多小区快递员白天派送会碰到接件人不在家等情况，无法一次妥善完成投递;再次投递不&lt;a class=&quot;keyword_link&quot; id=&quot;k531799506&quot; href=&quot;http://www.chinabyte.com/keyword/仅重/&quot; target=&quot;_blank&quot;&gt;仅重&lt;/a&gt;复工作，沟通成本也会增加，客户满意度降低。天猫这个服务站模式，像小区物业、便利店总会有人在，而且有系统支持，派件成本固定，妥投率提升，快递服务满意度也会提高，派送效率也快了。&lt;/p&gt;&lt;p&gt;　　截至4月2日，北京、上海、东莞、嘉兴、武汉、杭州等共22个城市2600多家便利店、社区物业合作商站点已上线，并在天猫服务站频道公示(Fuwuzhan.tmall.com)。目前，天猫服务站还在不断扩大覆盖范围，并优先招募北京、广东、深圳以及江浙沪的合作伙伴，让一二线城市的消费者体验更便利的代收货服务。&lt;/p&gt;&lt;p style=&quot;text-align:center;&quot;&gt;&lt;img src=&quot;http://image.tianjimedia.com/uploadImages/2013/092/J4ABSUP44317.jpg&quot; height=&quot;213&quot; width=&quot;168&quot; /&gt;&lt;/p&gt;&lt;p&gt;　　此次与喜士多便利店合作后，杭州地区的所有喜士多便利店网点即日起将为消费者提供24小时的代收货服务，下一阶段，华东区所有喜士多便利店网点也将推出。目前，天猫服务站杭州地区已有绿城物业、佑康电商等合作伙伴，包括喜士多便利店网点在内，杭州地区共有265个代收货自提点。预计到今年6月底，杭州市区将有400家站点支持代收货，方便消费者就近自提快递。随着今后服务升级，服务网点未来还将逐步添加“寄件”等功能。&lt;/p&gt;&lt;p&gt;　　此外，在社区网点方面，绿城物业合作的天猫服务站网点，也已覆盖杭州112个楼盘、全国227家楼盘，涉及写字楼、社区物业等，为小区业主提供方便。&lt;/p&gt;&lt;p&gt;　　易观分析师陈寿送认为，对于天猫而言，天猫服务站的设立，在一、二线城市，为天猫消费者提供可选择、有标准、确定性的物流等服务，提升天猫品质形象;同时，这是一张更大的天猫线下营销网络，并可通过服务有效转化更多客户，成为品牌传播和特别体验的基地，这将织就一张线上 线下的零售版图，成为线上线下结合的“零售&lt;a class=&quot;keyword_link&quot; id=&quot;k530834323&quot; href=&quot;http://www.chinabyte.com/keyword/沃/&quot; target=&quot;_blank&quot;&gt;沃&lt;/a&gt;尔玛”和O2O模式的实践者。&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;', '', 'http://image.tianjimedia.com/uploadImages/2013/092/X6S2BKKO28V5.jpg,http://image.tianjimedia.com/uploadImages/2013/092/J4ABSUP44317.jpg,', '百度', 0, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 10:19:29', '2013-04-03 10:19:29'),
(19, 1, 1, 12, '去哪儿网点击付费上涨超40% 致OTA厂商集体大逃亡', '', 'DoNews 4月2日消息 2日，据记者查询发现，从4月1日晚上开始，包括艺龙旅行网、芒果网、住哪网等在内的主要OTA厂商的全线酒店产品已全部从去哪儿网下线。据多方了解，这一现象系去哪儿网对其酒店CP...', '&lt;div class=&quot;content_body&quot;&gt;&lt;p&gt;DoNews 4月2日消息 2日，据记者查询发现，从4月1日晚上开始，包括艺龙旅行网、芒果网、住哪网等在内的主要OTA厂商的全线酒店产品已全部从去哪儿网下线。据多方了解，这一现象系去哪儿网对其酒店CPC（点击付费）业务收费上涨40%，引发OTA厂商集体不满，因此全线撤退。&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;&lt;p&gt;据了解，此次所有大型OTA集体将产品从去哪儿网下线，主要由于去哪儿网新推的酒店TTS在线交易系统。去哪儿TTS系统推出后，消费者在去哪儿网看到心仪的酒店或机票信息，点击“预订”后，无需再跳转到相应的OTA网站，在去哪儿网上即可完成后续填写个人全部预订信息、付款交易的全过程，并由去哪儿网向相应OTA网站提供交易记录和交易金额。&lt;/p&gt;&lt;p&gt;另外，引起OTA厂商集体不满的，还有去哪儿网对其酒店CPC（点击付费）业务收费的上涨，涨幅甚至高达40%。&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;&lt;p&gt;某OTA厂商高层就在接受采访时透露，去哪儿将点击收费提高到40%之多，由于成本过高，公司并不想亏本做生意，因此已于4月1日晚上下线了自己在去哪儿上的所有产品。对于去哪儿推出的TTS系统，该高层认为，自己花钱向用户返现、支付广告费用，但却无法与用户接触，用户也无法浏览其网站，这一点并不合理。&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;&lt;p&gt;另一家OTA厂商高层也证实，去哪儿的点击费用的确大幅增加，有些频道增加了40%左右，而有些频道增加的幅度还要高于40%。该高层表示，去哪儿对于公司而言，是一个媒体投放的渠道，公司觉得划算就投放，觉得不划算就停止投放。“新的体系出现后，性价比没有了，渠道也更差，因此再继续合作并不划算。”&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;&lt;p&gt;两位高层都表示，截至目前去哪儿还没有任何反应，也并未有任何调整措施出台，不过自己本着开放的心态，会根据去哪儿的调整和做法去确定自己的措施，“到时候合适了再上。”&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;&lt;p&gt;目前，登陆去哪儿搜索酒店可见，除了Agoda和一些小型OTA之外，已看不到来自国内大型OTA的酒店产品，在机票预订平台也很难找到几家网站相应的结果。目前去哪儿酒店平台中，多数高星级酒店的比价页面只显示一些提供预付的商户，接受前台现付预订的商户已经很少，更多的中低端酒店的比价页面只显示有“酒店直销”、预付等形式等少数网站和供应商的价格信息，非常多的低星级酒店的比价页中只有一家供应商。&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;&lt;p&gt;记者致电去哪儿网CEO庄辰超本人，其以正在开会为由拒绝接受采访。&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;&lt;p&gt;有业内人士分析称，此前去哪儿将TTS系统放到机票业务中时，虽然也引起过多家网站的反抗，但最终去哪儿凭借其流量打了一场胜仗。这一次，去哪儿将TTS系统放到酒店业务中，就意味着OTA厂商要通过去哪儿的平台进行交易，同时酒店的直销也可以通过去哪儿的平台直接经营，加上再一次提价，OTA厂商认为无法再在去哪儿平台交易，因此下了一些决心和去哪儿博弈。&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;&lt;p&gt;“这个和机票不一样，机票代理商都很小，没什么实力，比较分散，但酒店OTA还是有很多大佬在里面。这个博弈起来，其实就是广告商和搜索引擎之间的博弈。”&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;&lt;p&gt;另有业内分析人士认为，这与去哪儿的战略有关，去哪儿一方面把自己定位成媒体，另一方面又慢慢把交易做到自己的平台里，但又不按交易去收佣金。在酒店业务里，去哪儿同时和OTA合作，又和酒店搞直连。这样的模式可以轻松绕开OTA厂商，而随着去哪儿的流量越来越大，对其他OTA厂商的威胁也会越来越大。但OTA厂商并不甘心束手就擒，因此才有了这样的博弈。&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;&lt;p&gt;还有业内人士认为，去哪儿目前处于比较艰难的时刻，一方面淘宝在攻击去哪儿的机票业务，另一方面OTA和去哪儿在酒店业务上也有竞争，这样的情况对于去哪儿也会产生不小的压力。“无论博弈最后的结果如何，反正这场仗谁输了谁以后的日子就不好过。”（完）&lt;/p&gt;&lt;/div&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;', '', '', '百度', 0, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 10:20:12', '2013-04-03 10:20:12'),
(20, 1, 1, 12, '工作时间上网购物炒股都不行了', '', '　　“怎么影视网站、小说网站都无法登录了，出问题了吗？”昨天，公务员潘先生在单位上网，发现新闻网页可以照常打开，但一些与工作无关的网站却无法登录。其实，这不是网络问题，而是我市为约束机关干部上网行为，...', '&lt;p&gt;　　“怎么影视网站、小说网站都无法登录了，出问题了吗？”昨天，公务员潘先生在单位上网，发现新闻网页可以照常打开，但一些与工作无关的网站却无法登录。其实，这不是网络问题，而是我市为约束机关干部上网行为，提高机关工作效能的一项措施。&lt;br /&gt;&lt;br /&gt;　　4月1日起，在工作时间内，我市对各级行政事业单位的办公电脑全面实施网络阻断。&lt;br /&gt;&lt;br /&gt;　　此次网络阻断的内容除了影视视频、网络小说之外，还有股票、游戏、购物、交友等与日常工作无关的各类网站和软件。要求已单独安装网络专线前端监测系统的单位，4月1日开始实施网络阻断。尚未安装的单位，也要及时安装，于5月1日前实施网络阻断。教育系统各公办学校和卫生系统各公办医疗机构原则上也同步实施阻断。&lt;br /&gt;&lt;br /&gt;　　市纪委、市监察局、市效能办将对各单位实施网络阻断情况开展全面检查，检查结果纳入年度党风廉政建设责任制考核。对拒不实施、没有正当理由拖延实施、不按规定范围和内容组织实施或实施后擅自停用网络阻断的单位，将严格追究相关领导和责任人的责任。&lt;br /&gt;&lt;/p&gt;', '', '', '百度', 0, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 10:20:59', '2013-04-03 10:20:59'),
(21, 1, 1, 12, 'P2P众贷网开业一月猝死：剩者反思', '', '愚人节次日凌晨，上线仅一个月的P2P网贷企业众贷网发布了破产公告。很快，众贷网的投资者们发现，这并不是愚人节玩笑。昨日，商报记者在采访中了解到，众贷网已进入破产清算善后程序，所有的30余名投资者的利息...', '&lt;p&gt;愚人节次日凌晨，上线仅一个月的P2P网贷企业众贷网发布了破产公告。很快，众贷网的投资者们发现，这并不是愚人节玩笑。&lt;/p&gt;&lt;p&gt;昨日，商报记者在采访中了解到，众贷网已进入破产清算善后程序，所有的30余名投资者的利息收入受损。27岁的众贷网法人代表卢儒化在接受商报记者采访时表示，为了偿还投资人的本金，公司股东垫支了100多万元。对于倒闭原因，卢儒化称，是由于整个管理团队经验缺乏，有的借款人的抵押物重复抵押了两三次，但众贷网并未发现，因此造成了偿还风险。&lt;/p&gt;&lt;p&gt;&lt;strong&gt;上线仅一个月就宣布倒闭&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;“由于整个管理团队经验的缺失，造成了公司运营风险的发生，在开展业务的时候没有把控好风险这一关，如今给各位造成了无法挽回的损失。”昨日凌晨，众贷网在官方网站首页发布《致投资人的一封信》，称由于团队缺乏经营管理经验，导致破产。&lt;/p&gt;&lt;p&gt;来自搜索引擎快照的信息显示，3月初上线的互联网融资平台众贷网，隶属于海南众贷投资咨询有限公司，总部设在海口市。官网资料显示，众贷网定位为“中小微企业融资平台”，同时自称“P2P网络金融服务平台”，提供多种贷款中介服务。&lt;/p&gt;&lt;p&gt;众贷网曾自称“资金实力雄厚，用户最短可以在48小时内拿到资金，效率很高”。就在倒闭前几天，还发布了广告，称新投资人将获得不同金额的奖励。官网上的招聘信息则显示，众贷网办公地址为海口市半山花园。&lt;/p&gt;&lt;p&gt;上线仅仅一个月，注册资金达1000万元的P2P网贷企业，短期内即使有坏账也不至于倒闭吧？昨日上午，商报记者登录众贷网官方网站发现，众贷网仍能访问，但已无法申请贷款和借款。&lt;/p&gt;&lt;p&gt;&lt;strong&gt;30余投资者收益打水漂&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;昨日下午，商报记者根据《致投资人的一封信》中留下的电话号码，联系上了众贷网法人代表卢儒化。&lt;/p&gt;&lt;p&gt;“虽然我们公司缺乏投资经验，从成立到倒闭只有短短一个月的时间，但众贷网是一个讲诚信的公司。尽管公司资金周转困难，但绝不会做跑路者。”卢儒化在电话里称，倒闭前，共有30多个投资者投入了共计100多万元本金，“目前我们已经归还了部分投资人的全部本金，剩下的本金也将尽最大的努力归还给投资者。资金全部由众贷网股东代为垫付”。至于投资收益部分，卢儒化表示，目前公司确实有困难，无法按承诺支付收益。&lt;/p&gt;&lt;p&gt;这些投资人中是否有来自重庆的投资者？卢儒化说，投资者是靠网络登记投资的，现在无法统计出投资者来自哪些城市。商报记者查询工商注册信息发现，众贷网暂未通过正规工商注册登记方式在重庆设立线下分支机构。&lt;/p&gt;&lt;p&gt;谈到众贷网倒闭的原因，卢儒化坦言，因为缺乏风险管控经验，有的借款人抵押物重复抵押了两三次，但众贷网并未发现，因此造成了偿还风险。&lt;/p&gt;&lt;p&gt;&lt;strong&gt;P2P网贷平台&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;个人对个人的信贷平台，又称人人贷，即个人利用网络平台将闲置资金出借给资金短缺者的新型商业运营模式。最早发端于英美国家。在常见的P2P业务模式中，P2P公司仅作为单纯的网络中介，负责制定交易规则和提供交易平台。公司不负责交易的成交以及贷后资金管理，不承担借款人违约带来的损失，且整个业务都在线上完成。但目前国内P2P公司采取的多是线上与线下结合的模式，即线上主攻营销，线下强化风控。&lt;/p&gt;&lt;p&gt;&lt;strong&gt;新闻纵深&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;业内呼吁建立自律机制&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;专家建议制定准入门槛&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;公开资料显示，最近一年来，至少有5家P2P网贷平台发生了风险事件。众贷网的破产再次将P2P网贷平台推向了风口浪尖。&lt;/p&gt;&lt;p&gt;昨日，同样从事P2P网贷业务的北京宜信投资公司相关负责人告诉商报记者：“P2P行业近年来高速发展，新加入者众多、良莠不齐，众贷网倒闭凸显出企业对风险把控不力。”该负责人认为，P2P公司联合起来成立自律组织，建立一整套完善的信用风险管理体系是当务之急。&lt;/p&gt;&lt;p&gt;中央财经大学教授黄震在接受商报记者采访时，对P2P网贷平台以及投资人提出了三方面建议：首先，投资人必须有风险意识；其次，P2P企业应加强信息披露；第三，工商部门要加强P2P企业业务范围的监管，网站备案登记机构要加强企业信息发布管理。&lt;/p&gt;&lt;p&gt;经济观察研究院院长清议则告诉商报记者，P2P平台的存在有其合理性，要进行规范应首先对P2P平台制定进入门槛，并颁发经营牌照，让其成为正规的金融机构。其次，应推动监管部门制定对P2P业务进行事前、事中、事后的风险管控制度。制度健全后，才能够有效防控风险，同时还能建立兜底救助的“防火墙”。&lt;/p&gt;&lt;p&gt;&lt;strong&gt;重庆&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;P2P年交易量达6亿~7亿 正酝酿出台管理办法&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;近年来，P2P网贷平台在全国范围内显示出强劲的增长势头。安信证券在一份报告中提到，目前我国活跃的P2P网贷平台超过300家，去年行业成交量高达200亿元。&lt;/p&gt;&lt;p&gt;尽管众贷网并没有入渝设立分支机构，但类似的P2P网贷平台已经在重庆显露了扩张之势。目前，在重庆市场上已公开亮相的P2P网贷平台共有4个，包括北京宜信投资公司、重庆乾庄投资管理有限公司、亚盟投资管理有限公司和刚入渝不到半个月的浙江泰如业然投资管理有限公司。&lt;/p&gt;&lt;p&gt;“这只是通过工商注册登记的平台，而通过网络平台私下揽客的P2P公司到底多少家，我们根本无法统计。”昨日，市金融办官员透露，根据前期调查摸底发现，我市P2P公司每年促成的交易量至少在6亿~7亿元的规模。&lt;/p&gt;&lt;p&gt;市金融办官员分析，P2P网贷平台不在金融监管部门管辖范围内，也没有相关部门对其借款去向进行监管，民间贷款管理办法也一直没有出台，导致对民间借贷的监管处于缺位状态。对民间借贷中介的发展和约束，缺乏法律上的明确规定和引导，容易滋生风险。&lt;/p&gt;&lt;p&gt;事实上，P2P网贷平台在渝加速扩张的消息此前经本报报道后，已经引起了地方金融监管部门的高度重视。&lt;/p&gt;&lt;p&gt;“我们正在进行调查摸底，包括对这些平台参与投资的人数、交易量等，并将在此基础上研究酝酿出台监管机制，甚至可能是地方版民间借贷融资管理办法。”昨日，市金融办官员在接受商报记者采访时透露，我市一些P2P网贷平台已经开始在利用私募股权投资基金的模式进行代客理财。这些股权投资的金额往往单笔不小于200万元，且回报周期较长，对于公司的风险管控能力很高，风险也比较大。下一步，我市将对P2P网贷平台的规范运营建立排查机制，对于借贷利率、管理费的收取、风险制度的建立等，都将有详细的规定。在形成草案后，后期可能会酝酿出台地方民间借贷管理办法。过渡期间，我市将利用打击非法金融活动领导小组办公室的联动协调效应，联合工商部门、银监部门、人民银行等，严厉打击非法金融活动，维护我市经济金融秩序稳定。&lt;/p&gt;&lt;p&gt;&lt;strong&gt;风险&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;P2P三大陷阱需警惕&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;1.借贷利率超过基准利率的4倍被视为高利贷，不受法律保护。投资者应在投资合同中约定双方的权利和义务，避免纠纷。&lt;/p&gt;&lt;p&gt;2.目前国内一些地方出现了“连环低息高贷”式民间借贷，即借款人将借到的资金以相对更高的利率再度出借，存在极大风险。&lt;/p&gt;&lt;p&gt;3.借款人向P2P平台借款，一旦逾期可能面临隐私被曝光的风险。&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;', '', '', '百度', 0, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 10:21:34', '2013-04-03 10:21:34'),
(22, 1, 1, 12, '从B2B转向M2C外贸企业跳出层层供销链直面消费者', '', '　　本栏目由杭州市对外贸易经济合作局与本报共同主办　　商报讯 （记者 吴佳丽 通讯员 吕斌奎 胡新平） 国外市场需求不振、国内生产成本提高，中国外贸出口企业压力倍增。如何帮助外贸企业创新业务模式，实现...', '&lt;p&gt;　　本栏目由杭州市对外贸易经济合作局与本报共同主办&lt;br /&gt;&lt;br /&gt;　　商报讯 （记者 吴佳丽 通讯员 吕斌奎 胡新平） 国外市场需求不振、国内生产成本提高，中国外贸出口企业压力倍增。如何帮助外贸企业创新业务模式，实现转型升级成为大家关注的重点。昨天，由杭州市外经贸局协助举办的“2013携手创梦谷”大型路演活动在杭州举行，会议为外贸企业带来了全新的电子商务理念,即从B2B向M2C电子商务模式转型。&lt;br /&gt;&lt;br /&gt;　　“B2B模式下是企业与企业间的出口贸易，而M2C模式下则是出口企业直接面对全球终端消费者，进行销售并提供相关服务。”杭州创梦谷电子商务有限公司CEO张寅侃解释说，M2C业务可以帮助外贸企业突破供销链的层层环节，让外贸企业减少利润的流失，把主动权掌握在自己手里。目前，这种跨境电子商务模式下的成功案例已经不少，一家知名的跨境交易网站去年的交易额呈现了68%的增长，全年的跨境交易额达到了140亿美元。&lt;br /&gt;&lt;br /&gt;　　为了帮助外贸企业掌握M2C模式，杭州创梦谷电子商务有限公司推出了“创梦谷外贸转型工厂”项目在这里外贸企业可以享受到知识培训、跨境物流、海外仓储、法律咨询、系统支持、全球分销、外贸金融等一系列服务，该公司将提供全方位的跨境电子商务整体解决方案，对外贸企业派驻的业务员进行集中培训，通过业务员实践操作，掌握M2C模式。&lt;br /&gt;&lt;br /&gt;　　杭州市外经贸局相关负责人认为，跨境贸易电子商务作为一种新型的电子商务模式将为外贸企业进一步发展提供新机遇，是外贸企业转型升级的重点方向之一。&lt;br /&gt;&lt;/p&gt;', '', '', '百度', 0, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 10:22:05', '2013-04-03 10:22:05'),
(23, 1, 1, 9, '上海美特斯邦威股份有限公司', '', '这里是梦想开始的地方\n\n作为国内快时尚Fast fashion的领先品牌Meters/bonwe始终能感受到消费者的需要，为向全国消费者展示最完善的“美特斯邦威服饰股份有限公司”旗下“Meters/b...', '&lt;p style=&quot;margin-top:12px;&quot;&gt;&lt;strong style=&quot;font-size:14px;&quot;&gt;这里是梦想开始的地方&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;line-height:22px;margin-top:9px;&quot;&gt;作为国内快时尚Fast fashion的领先品牌Meters/bonwe始终能感受到消费者的需要，为向全国消费者展示最完善的“美特斯邦威服饰股份有限公司”旗下“Meters/bonwe”、“ME&amp;amp;CITY”、“ME&amp;amp;CITY KIDS”、“AMPM”品牌商品，全力打造了全新的网络购物时尚平台：邦购商城（http://www.banggo.com）以及传达旗下各品牌最完整的产品系列，提供更多购物体验。&lt;/p&gt;&lt;p style=&quot;margin-top:12px;&quot;&gt;&lt;strong style=&quot;font-size:18px;&quot;&gt;时尚、快乐购物从邦购www.banggo.com开始！&lt;/strong&gt;&lt;/p&gt;&lt;p style=&quot;line-height:22px;margin-top:12px;&quot;&gt;“banggo 邦购”通过简洁、精炼的两个字，期待借助专业的咨询与服务，帮助消费者合理的搭配、购买服饰，让消费者通过在网络里感受购物的酣畅。&lt;/p&gt;&lt;p style=&quot;line-height:22px;margin-top:9px;&quot;&gt;在“banggo 邦购”上，各年龄层的消费者都可以购买到时尚、优质、价格合理可信的“Meters/bonwe”、“ME&amp;amp;CITY”、“ME&amp;amp;CITY KIDS”、和线上专供品牌AMPM的潮流服饰，在无限的网络空间，避免了因为店铺面积导致的款式丰富度限制。&lt;/p&gt;&lt;p style=&quot;line-height:22px;margin-top:9px;&quot;&gt;无论您在何地，轻点鼠标，丰富多元、快速变化的时尚品款将会让您第一时间体验到惊喜和购物愉悦。&lt;/p&gt;&lt;p style=&quot;line-height:22px;margin-top:9px;&quot;&gt;想让自己大放异彩吗？时尚、快乐购物就从邦购开始！&lt;/p&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;', '', '', '管理员', 0, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 14:56:42', '2013-04-03 14:56:42'),
(24, 1, 1, 9, '上海圣思卓智品牌策划', '', '中国本土咨询业最早的开创者之一，国内最具影响力的本土咨询公司之一。为近200家国内本土企业、机构提供专业化咨询服务及执行指导，被誉为“企业爆炸式增长最富力量的推手', '&lt;pre id=&quot;line1&quot;&gt;&lt;a class=&quot;attribute-value&quot;&gt;中国本土咨询业最早的开创者之一，国内最具影响力的本土咨询公司之一。为近200家国内本土企业、机构提供专业化咨询服务及执行指导，被誉为“企业爆炸式增长最富力量的推手&lt;/a&gt;&lt;/pre&gt;&lt;p&gt;&lt;br /&gt;&lt;/p&gt;', '', '', '管理员', 0, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 14:58:41', '2013-04-03 14:58:41');

-- --------------------------------------------------------

--
-- 表的结构 `article_info_group`
--

CREATE TABLE `article_info_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_website表sid字段',
  `aiid` int(11) NOT NULL DEFAULT '0' COMMENT '文章ID，关联article_info表aiid字段',
  `agid` int(11) NOT NULL DEFAULT '0' COMMENT '文章分组ID，关联article_group表agid字段',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`),
  KEY `aiid` (`aiid`),
  KEY `agid` (`agid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章信息关联分组表' AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `article_info_group`
--


-- --------------------------------------------------------

--
-- 表的结构 `article_info_operate`
--

CREATE TABLE `article_info_operate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_website表sid字段',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID，关联user_base表uid字段',
  `aiid` int(11) NOT NULL DEFAULT '0' COMMENT '文章ID，关联article_info表aiid字段',
  `type` tinyint(1) DEFAULT '0' COMMENT '操作类型：0为浏览[Browse]，1为收藏[Favorite]，2为分享[Share]，3为喜欢[Like]，4为推荐[Recommend]',
  `add_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`),
  KEY `uid` (`uid`),
  KEY `aiid` (`aiid`),
  KEY `type` (`type`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章操作明细表' AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `article_info_operate`
--


-- --------------------------------------------------------

--
-- 表的结构 `article_info_stat`
--

CREATE TABLE `article_info_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_website表sid字段',
  `aiid` int(11) NOT NULL DEFAULT '0' COMMENT '文章ID，关联article_info表aiid字段',
  `browse_count` int(6) DEFAULT '0' COMMENT '浏览统计',
  `favorite_count` int(6) DEFAULT '0' COMMENT '收藏统计',
  `share_count` int(6) DEFAULT '0' COMMENT '分享统计',
  `like_count` int(6) DEFAULT '0' COMMENT '喜欢统计',
  `recommend_count` int(6) DEFAULT '0' COMMENT '推荐统计',
  `comment_count` int(6) DEFAULT '0' COMMENT '评论统计',
  `comment_score` decimal(4,2) DEFAULT '0.00' COMMENT '好评分数，满分为10分',
  `add_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`),
  KEY `aiid` (`aiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章统计总表' AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `article_info_stat`
--


-- --------------------------------------------------------

--
-- 表的结构 `article_tag`
--

CREATE TABLE `article_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_website表sid字段',
  `acid` int(11) NOT NULL DEFAULT '0' COMMENT '文章分类ID，关联article_category表acid字段',
  `aiid` int(11) NOT NULL DEFAULT '0' COMMENT '文章ID，关联article_info表aiid字段',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '文章标签名称',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`),
  KEY `acid` (`acid`),
  KEY `aiid` (`aiid`),
  KEY `tag_name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='文章标签表' AUTO_INCREMENT=5 ;

--
-- 导出表中的数据 `article_tag`
--

INSERT INTO `article_tag` (`id`, `sid`, `acid`, `aiid`, `name`) VALUES
(1, 1, 1, 1, '公司简介'),
(2, 1, 1, 1, '网站信息'),
(3, 2, 2, 2, 'about'),
(4, 2, 2, 2, 'us');

-- --------------------------------------------------------

--
-- 表的结构 `article_tag_stat`
--

CREATE TABLE `article_tag_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_website表sid字段',
  `acid` int(11) NOT NULL DEFAULT '0' COMMENT '文章分类ID，关联article_category表acid字段',
  `tag_name` varchar(30) NOT NULL DEFAULT '' COMMENT '文章标签名称',
  `browse_count` int(6) DEFAULT '0' COMMENT '浏览统计',
  `article_count` int(6) DEFAULT '0' COMMENT '篇数统计',
  `add_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`),
  KEY `acid` (`acid`),
  KEY `tag_name` (`tag_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章标签统计表' AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `article_tag_stat`
--


-- --------------------------------------------------------

--
-- 表的结构 `base_lang`
--

CREATE TABLE `base_lang` (
  `blid` int(6) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `code` varchar(30) NOT NULL DEFAULT '' COMMENT '语言编码,可作唯一标示',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '语言名称',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`blid`),
  KEY `code` (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='基础语言表' AUTO_INCREMENT=4 ;

--
-- 导出表中的数据 `base_lang`
--

INSERT INTO `base_lang` (`blid`, `code`, `name`, `sort`, `status`, `add_time`, `update_time`) VALUES
(1, 'zh-cn', '中文简体', 1, 1, '2013-01-27 13:33:08', '2013-01-27 13:35:32'),
(2, 'en-us', '英文', 2, 1, '2013-01-27 13:35:42', '2013-01-27 13:35:42'),
(3, 'zh-tw', '中文繁体', 0, 0, '2013-01-27 13:35:57', '2013-01-27 13:35:57');

-- --------------------------------------------------------

--
-- 表的结构 `blog_album`
--

CREATE TABLE `blog_album` (
  `baid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID，关联user_base表uid字段',
  `name` varchar(100) DEFAULT '' COMMENT '相册名称',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`baid`),
  KEY `sid` (`sid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='博文相册表' AUTO_INCREMENT=2 ;

--
-- 导出表中的数据 `blog_album`
--

INSERT INTO `blog_album` (`baid`, `sid`, `uid`, `name`, `sort`, `status`, `add_time`, `update_time`) VALUES
(1, 1, 1, '我的相册', 0, 1, '2013-03-07 09:58:10', '2013-03-07 09:58:10');

-- --------------------------------------------------------

--
-- 表的结构 `blog_album_photo`
--

CREATE TABLE `blog_album_photo` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID，关联user_base表uid字段',
  `baid` int(11) NOT NULL DEFAULT '0' COMMENT '相册ID，关联blog_album表baid字段；0为贴图相册',
  `name` varchar(100) DEFAULT '' COMMENT '相片名称',
  `url` varchar(250) DEFAULT '' COMMENT '相片地址',
  `size` int(11) DEFAULT '0' COMMENT '相片大小',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`),
  KEY `uid` (`uid`),
  KEY `baid` (`baid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='博文相片表' AUTO_INCREMENT=3 ;

--
-- 导出表中的数据 `blog_album_photo`
--

INSERT INTO `blog_album_photo` (`id`, `sid`, `uid`, `baid`, `name`, `url`, `size`, `sort`, `status`, `add_time`, `update_time`) VALUES
(1, 1, 1, 1, '1', '__UPLOAD__/Images/altilacms/BlogAlbumPhoto/20130307/5137f47890de7.jpg', 46695, 0, 1, '2013-03-07 09:58:44', '2013-03-07 09:58:44'),
(2, 1, 1, 0, '中国矿产地图', '__UPLOAD__/Images/altilacms/BlogAlbumPhoto/20130307/5137ff0b07ab7.jpg', 180169, 0, 1, '2013-03-07 10:44:27', '2013-03-07 10:44:27');

-- --------------------------------------------------------

--
-- 表的结构 `blog_category`
--

CREATE TABLE `blog_category` (
  `bcid` int(6) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_website表sid字段',
  `parent_id` smallint(5) NOT NULL DEFAULT '0' COMMENT '分类父级ID',
  `code` varchar(100) NOT NULL DEFAULT '' COMMENT '分类编码,可作唯一标示',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '分类名称',
  `crumb` varchar(100) DEFAULT '' COMMENT '面包屑，用横杠分割',
  `type` tinyint(1) DEFAULT '2' COMMENT '分类类型：1为引导栏目(不能发布内容,只作显示)，2为列表制，3为章节制',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`bcid`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='博文分类表' AUTO_INCREMENT=6 ;

--
-- 导出表中的数据 `blog_category`
--

INSERT INTO `blog_category` (`bcid`, `sid`, `parent_id`, `code`, `name`, `crumb`, `type`, `sort`, `status`, `add_time`, `update_time`) VALUES
(1, 1, 0, 'IT', 'IT', '1-', 1, 1, 1, '2013-03-07 08:25:27', '2013-03-07 08:25:27'),
(2, 1, 0, 'ManageFinances', '理财', '2-', 1, 2, 1, '2013-03-07 08:25:56', '2013-03-07 08:25:56'),
(3, 1, 1, 'Web', 'Web前端', '1-3-', 2, 1, 1, '2013-03-07 08:28:42', '2013-03-07 08:28:42'),
(4, 1, 1, 'Language', '编程语言', '1-3-', 2, 2, 1, '2013-03-07 08:29:05', '2013-03-07 08:29:05'),
(5, 1, 1, 'Database', '数据库', '1-3-', 2, 3, 1, '2013-03-07 08:29:23', '2013-03-07 08:29:23');

-- --------------------------------------------------------

--
-- 表的结构 `blog_comment`
--

CREATE TABLE `blog_comment` (
  `bctid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID，关联user_base表uid字段',
  `biid` int(11) NOT NULL DEFAULT '0' COMMENT '博文ID，关联blog_info表biid字段',
  `parent_id` smallint(5) NOT NULL DEFAULT '0' COMMENT '评论回复父级ID，回复的回复记录评论ID，按时间倒序',
  `name` varchar(100) DEFAULT '' COMMENT '评论主题',
  `content` text COMMENT '评论内容',
  `comment_score` decimal(4,2) DEFAULT '0.00' COMMENT '好评分数，满分为10分',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`bctid`),
  KEY `biid` (`biid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='博文评论表' AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `blog_comment`
--


-- --------------------------------------------------------

--
-- 表的结构 `blog_comment_operate`
--

CREATE TABLE `blog_comment_operate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID，关联user_base表uid字段',
  `bctid` int(11) NOT NULL DEFAULT '0' COMMENT '博文评论ID，关联blog_comment表bctid字段',
  `type` tinyint(1) DEFAULT '0' COMMENT '操作类型：0为支持[Support]，1为反对[Opposition]',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `bctid` (`bctid`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='博文评论操作明细表' AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `blog_comment_operate`
--


-- --------------------------------------------------------

--
-- 表的结构 `blog_comment_stat`
--

CREATE TABLE `blog_comment_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `bctid` int(11) NOT NULL DEFAULT '0' COMMENT '博文评论ID，关联blog_comment表bctid字段',
  `support_count` int(6) DEFAULT '0' COMMENT '支持统计',
  `opposition_count` int(6) DEFAULT '0' COMMENT '反对统计',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='博文评论操作统计总表' AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `blog_comment_stat`
--


-- --------------------------------------------------------

--
-- 表的结构 `blog_group`
--

CREATE TABLE `blog_group` (
  `bgid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID，关联user_base表uid字段',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '分组名称',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`bgid`),
  KEY `sid` (`sid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='博文分组表' AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `blog_group`
--


-- --------------------------------------------------------

--
-- 表的结构 `blog_info`
--

CREATE TABLE `blog_info` (
  `biid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID，关联user_base表uid字段',
  `smid` int(11) NOT NULL DEFAULT '0' COMMENT '博文分类ID，关联site_menu表smid字段',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '博文名称',
  `tags_name` varchar(255) DEFAULT '' COMMENT '博文标签，用逗号分割',
  `description` varchar(255) DEFAULT '' COMMENT '博文简述',
  `content` text COMMENT '博文内容',
  `thumbnail` varchar(255) DEFAULT '' COMMENT '博文缩略图',
  `img_url` varchar(800) DEFAULT '' COMMENT '博文内图片，用逗号分割',
  `source_url` varchar(800) DEFAULT '' COMMENT '博文来源网址，用逗号分割',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `start_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '开始时间',
  `end_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '结束时间',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`biid`),
  KEY `sid` (`sid`),
  KEY `uid` (`uid`),
  KEY `smid` (`smid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='博文信息表' AUTO_INCREMENT=2 ;

--
-- 导出表中的数据 `blog_info`
--

INSERT INTO `blog_info` (`biid`, `sid`, `uid`, `smid`, `name`, `tags_name`, `description`, `content`, `thumbnail`, `img_url`, `source_url`, `sort`, `status`, `start_time`, `end_time`, `add_time`, `update_time`) VALUES
(1, 1, 1, 5, 'Web前端', 'web,前端', '', '&lt;p&gt;web,前端&lt;br /&gt;&lt;/p&gt;', '', '', '', 0, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-08 14:48:54', '2013-03-08 14:48:54');

-- --------------------------------------------------------

--
-- 表的结构 `blog_info_group`
--

CREATE TABLE `blog_info_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `biid` int(11) NOT NULL DEFAULT '0' COMMENT '博文ID，关联blog_info表biid字段',
  `bgid` int(11) NOT NULL DEFAULT '0' COMMENT '博文分组ID，关联blog_group表bgid字段',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`),
  KEY `aiid` (`biid`),
  KEY `agid` (`bgid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='博文信息关联分组表' AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `blog_info_group`
--


-- --------------------------------------------------------

--
-- 表的结构 `blog_info_operate`
--

CREATE TABLE `blog_info_operate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID，关联user_base表uid字段',
  `biid` int(11) NOT NULL DEFAULT '0' COMMENT '博文ID，关联blog_info表biid字段',
  `type` tinyint(1) DEFAULT '0' COMMENT '操作类型：0为浏览[Browse]，1为收藏[Favorite]，2为分享[Share]，3为喜欢[Like]，4为推荐[Recommend]',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`),
  KEY `uid` (`uid`),
  KEY `biid` (`biid`),
  KEY `type` (`type`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='博文操作明细表' AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `blog_info_operate`
--


-- --------------------------------------------------------

--
-- 表的结构 `blog_info_stat`
--

CREATE TABLE `blog_info_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `biid` int(11) NOT NULL DEFAULT '0' COMMENT '博文ID，关联blog_info表biid字段',
  `browse_count` int(6) DEFAULT '0' COMMENT '浏览统计',
  `favorite_count` int(6) DEFAULT '0' COMMENT '收藏统计',
  `share_count` int(6) DEFAULT '0' COMMENT '分享统计',
  `like_count` int(6) DEFAULT '0' COMMENT '喜欢统计',
  `recommend_count` int(6) DEFAULT '0' COMMENT '推荐统计',
  `comment_count` int(6) DEFAULT '0' COMMENT '评论统计',
  `comment_score` decimal(4,2) DEFAULT '0.00' COMMENT '好评分数，满分为10分',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`),
  KEY `biid` (`biid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='博文统计总表' AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `blog_info_stat`
--


-- --------------------------------------------------------

--
-- 表的结构 `blog_tag`
--

CREATE TABLE `blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `smid` int(11) NOT NULL DEFAULT '0' COMMENT '博文分类ID，关联site_menu表smid字段',
  `biid` int(11) NOT NULL DEFAULT '0' COMMENT '博文ID，关联blog_info表biid字段',
  `tag_name` varchar(30) NOT NULL DEFAULT '' COMMENT '博文标签名称',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`),
  KEY `smid` (`smid`),
  KEY `biid` (`biid`),
  KEY `tag_name` (`tag_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='博文标签表' AUTO_INCREMENT=3 ;

--
-- 导出表中的数据 `blog_tag`
--

INSERT INTO `blog_tag` (`id`, `sid`, `smid`, `biid`, `tag_name`) VALUES
(1, 1, 5, 1, 'web'),
(2, 1, 5, 1, '前端');

-- --------------------------------------------------------

--
-- 表的结构 `blog_tag_stat`
--

CREATE TABLE `blog_tag_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `smid` int(11) NOT NULL DEFAULT '0' COMMENT '博文分类ID，关联site_menu表smid字段',
  `tag_name` varchar(30) NOT NULL DEFAULT '' COMMENT '博文标签名称',
  `browse_count` int(6) DEFAULT '0' COMMENT '浏览统计',
  `blog_count` int(6) DEFAULT '0' COMMENT '篇数统计',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`),
  KEY `smid` (`smid`),
  KEY `tag_name` (`tag_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='博文标签统计表' AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `blog_tag_stat`
--


-- --------------------------------------------------------

--
-- 表的结构 `product_channel`
--

CREATE TABLE `product_channel` (
  `pcid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '渠道名称',
  `type` tinyint(1) DEFAULT '1' COMMENT '渠道类型：1为商城，2为手机商城，3为淘宝，4为拍拍，5为QQ团，6为易贝，7为一号店',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`pcid`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='商品渠道信息表' AUTO_INCREMENT=2 ;

--
-- 导出表中的数据 `product_channel`
--

INSERT INTO `product_channel` (`pcid`, `sid`, `name`, `type`, `sort`, `status`, `add_time`, `update_time`) VALUES
(1, 1, '商城', 1, 1, 1, '2013-03-27 16:44:39', '2013-03-27 16:44:39');

-- --------------------------------------------------------

--
-- 表的结构 `product_description`
--

CREATE TABLE `product_description` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `pgid` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID，关联product_goods表pgid字段',
  `pdcid` int(11) NOT NULL DEFAULT '0' COMMENT '商品描述分类ID，关联product_description_category表pdcid字段',
  `content` text COMMENT '商品描述',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品描述信息表' AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `product_description`
--


-- --------------------------------------------------------

--
-- 表的结构 `product_description_category`
--

CREATE TABLE `product_description_category` (
  `pdcid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '描述分类名称',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`pdcid`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='商品描述分类表' AUTO_INCREMENT=3 ;

--
-- 导出表中的数据 `product_description_category`
--

INSERT INTO `product_description_category` (`pdcid`, `sid`, `name`, `sort`, `status`, `add_time`, `update_time`) VALUES
(1, 1, '商品描述', 1, 1, '2013-03-27 15:12:43', '2013-03-27 15:13:25'),
(2, 1, '商品卖点', 2, 1, '2013-03-27 15:13:34', '2013-03-27 15:13:34');

-- --------------------------------------------------------

--
-- 表的结构 `product_goods`
--

CREATE TABLE `product_goods` (
  `pgid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `smid` int(11) NOT NULL DEFAULT '0' COMMENT '商品分类ID，关联site_menu表smid字段',
  `pcid` int(11) NOT NULL DEFAULT '0' COMMENT '渠道ID，关联product_channel表pcid字段',
  `code` varchar(100) NOT NULL DEFAULT '' COMMENT '商品编码,可作唯一标示',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '商品名称',
  `thumbnail` varchar(255) DEFAULT '' COMMENT '商品主图',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `start_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '开始时间',
  `end_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '结束时间',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`pgid`),
  KEY `sid` (`sid`),
  KEY `smid` (`smid`),
  KEY `pcid` (`pcid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品信息表' AUTO_INCREMENT=1 ;

--
-- 导出表中的数据 `product_goods`
--


-- --------------------------------------------------------

--
-- 表的结构 `site_access`
--

CREATE TABLE `site_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `rid` int(11) NOT NULL DEFAULT '0' COMMENT '角色ID，关联site_role表rid字段',
  `nid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID，关联site_node表nid字段',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='设置访问权限表' AUTO_INCREMENT=16 ;

--
-- 导出表中的数据 `site_access`
--

INSERT INTO `site_access` (`id`, `sid`, `rid`, `nid`, `status`, `add_time`, `update_time`) VALUES
(1, 1, 1, 4, 1, '2013-03-08 15:28:45', '2013-03-08 15:28:45'),
(2, 1, 1, 32, 1, '2013-03-08 15:28:45', '2013-03-08 15:28:45'),
(3, 1, 1, 5, 1, '2013-03-08 15:28:45', '2013-03-08 15:28:45'),
(4, 1, 1, 47, 1, '2013-03-08 15:28:45', '2013-03-08 15:28:45'),
(5, 1, 1, 6, 1, '2013-03-08 15:28:45', '2013-03-08 15:28:45'),
(6, 1, 1, 48, 1, '2013-03-08 15:28:45', '2013-03-08 15:28:45'),
(7, 1, 1, 7, 1, '2013-03-08 15:28:45', '2013-03-08 15:28:45'),
(8, 1, 1, 14, 1, '2013-03-08 15:28:45', '2013-03-08 15:28:45'),
(9, 1, 1, 13, 1, '2013-03-08 15:28:45', '2013-03-08 15:28:45'),
(10, 1, 1, 12, 1, '2013-03-08 15:28:45', '2013-03-08 15:28:45'),
(11, 1, 1, 9, 1, '2013-03-08 15:28:45', '2013-03-08 15:28:45'),
(12, 1, 1, 8, 1, '2013-03-08 15:28:45', '2013-03-08 15:28:45'),
(13, 1, 1, 30, 1, '2013-03-08 15:28:45', '2013-03-08 15:28:45'),
(14, 1, 1, 31, 1, '2013-03-08 15:28:45', '2013-03-08 15:28:45'),
(15, 1, 1, 33, 1, '2013-03-08 15:28:45', '2013-03-08 15:28:45');

-- --------------------------------------------------------

--
-- 表的结构 `site_config`
--

CREATE TABLE `site_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '名称',
  `key` varchar(20) NOT NULL DEFAULT '' COMMENT '键名',
  `value` varchar(200) DEFAULT '' COMMENT '键值',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`),
  KEY `key` (`key`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='设置配置信息表' AUTO_INCREMENT=5 ;

--
-- 导出表中的数据 `site_config`
--

INSERT INTO `site_config` (`id`, `sid`, `name`, `key`, `value`, `status`, `add_time`, `update_time`) VALUES
(1, 1, '后台是否记录用户登录', 'adminIsRecordUserLog', '0', 1, '2013-02-02 21:00:26', '2013-02-12 10:45:39'),
(2, 1, '是否启用博文', 'isEnableBlog', '1', 1, '2013-03-09 21:36:23', '2013-03-19 15:42:02'),
(3, 1, '是否启用广告js', 'isEnableAdJs', '0', 1, '2013-03-17 19:08:05', '2013-03-18 21:48:17'),
(4, 1, '是否启用小说', 'isEnableNovel', '0', 1, '2013-03-21 14:09:28', '2013-03-21 14:09:28');

-- --------------------------------------------------------

--
-- 表的结构 `site_menu`
--

CREATE TABLE `site_menu` (
  `smid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '菜单父级ID',
  `code` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单编码,可作唯一标示',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `crumb` varchar(100) NOT NULL DEFAULT '' COMMENT '面包屑，用横杠分割',
  `model` tinyint(1) DEFAULT '1' COMMENT '菜单模型：1为文章，2为图片集，3为产品，4为博文，5为小说',
  `type` tinyint(1) DEFAULT '0' COMMENT '菜单类型：0为列表制，1为引导栏目(不能发布内容,只作显示)，2为外部链接',
  `link` varchar(255) DEFAULT '' COMMENT '外部链接',
  `show_position` tinyint(3) DEFAULT '0' COMMENT '显示位置：1为顶部，2为中部，4为底部',
  `list_opt` int(5) DEFAULT '3' COMMENT '列表显示项：1为名称，2为添加时间，4为用户名，8为分页，16为更多，32为缩略图，64为简介，128为图片，256为标签',
  `is_highlight` tinyint(1) DEFAULT '0' COMMENT '是否高亮：0为否，1为是',
  `is_hide` tinyint(1) DEFAULT '0' COMMENT '是否隐藏：0为否，1为是',
  `is_open` tinyint(1) DEFAULT '0' COMMENT '是否新开页：0为否，1为是',
  `list_num` tinyint(3) DEFAULT '20' COMMENT '每页显示数量',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `start_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '开始时间',
  `end_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '结束时间',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`smid`),
  KEY `sid` (`sid`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='设置菜单表' AUTO_INCREMENT=13 ;

--
-- 导出表中的数据 `site_menu`
--

INSERT INTO `site_menu` (`smid`, `sid`, `parent_id`, `code`, `name`, `crumb`, `model`, `type`, `link`, `show_position`, `list_opt`, `is_highlight`, `is_hide`, `is_open`, `list_num`, `sort`, `status`, `start_time`, `end_time`, `add_time`, `update_time`) VALUES
(1, 1, 0, 'AboutUs', '关于我们', '1-', 1, 0, '', 6, 193, 0, 0, 0, 10, 1, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:20:59', '2013-04-03 17:55:59'),
(2, 1, 0, 'Blog', '博文', '2-', 4, 1, '', 3, 203, 0, 0, 1, 20, 4, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:21:56', '2013-03-21 20:36:02'),
(3, 1, 2, 'IT', 'IT', '2-3-', 4, 1, '', 2, 203, 0, 0, 0, 20, 1, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:22:37', '2013-03-21 14:43:12'),
(4, 1, 2, 'ManageFinances', '理财', '2-4-', 4, 1, '', 2, 203, 0, 0, 0, 20, 2, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:24:22', '2013-03-23 11:03:51'),
(5, 1, 3, 'Web', 'Web前端', '2-3-5-', 4, 0, '', 0, 203, 0, 0, 0, 20, 1, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:26:44', '2013-03-21 14:26:44'),
(6, 1, 3, 'Language', '编程语言', '2-3-6-', 4, 0, '', 0, 203, 0, 0, 0, 20, 2, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:27:49', '2013-03-21 14:27:49'),
(7, 1, 3, 'Database', '数据库', '2-3-7-', 4, 0, '', 2, 203, 0, 0, 0, 20, 3, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:28:14', '2013-03-21 14:28:14'),
(8, 1, 0, 'Project', '项目案例', '8-', 1, 1, '', 2, 203, 0, 0, 0, 20, 3, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:30:36', '2013-03-31 13:48:46'),
(9, 1, 8, 'EnterpriseSite', '企业网站', '8-9-', 1, 0, '', 2, 203, 0, 0, 0, 20, 1, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:31:14', '2013-03-21 14:43:01'),
(10, 1, 8, 'LargeSite', '大型网站', '8-10-', 1, 0, '', 2, 203, 0, 0, 0, 20, 2, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:32:27', '2013-03-21 14:42:54'),
(11, 2, 0, 'AboutUs', 'About Us', '11-', 1, 0, '', 2, 3, 0, 0, 0, 20, 1, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 15:39:38', '2013-03-21 15:39:38'),
(12, 1, 0, 'news', '新闻中心', '12-', 1, 0, '', 6, 67, 0, 0, 0, 10, 2, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 09:55:58', '2013-04-03 17:28:37');

-- --------------------------------------------------------

--
-- 表的结构 `site_node`
--

CREATE TABLE `site_node` (
  `nid` int(6) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `parent_id` int(6) NOT NULL DEFAULT '0' COMMENT '节点父级ID',
  `code` varchar(100) NOT NULL DEFAULT '' COMMENT '节点编码,可作唯一标示',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '节点名称',
  `crumb` varchar(100) NOT NULL DEFAULT '' COMMENT '面包屑，用横杠分割',
  `type` tinyint(1) DEFAULT '1' COMMENT '节点类型：1为引导栏目(不能发布内容,只作显示)，2为列表制',
  `menu_show` tinyint(1) DEFAULT '1' COMMENT '导航中是否显示: 0为不显示，1为显示',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`nid`),
  KEY `parent_id` (`parent_id`),
  KEY `code` (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='设置节点表' AUTO_INCREMENT=71 ;

--
-- 导出表中的数据 `site_node`
--

INSERT INTO `site_node` (`nid`, `parent_id`, `code`, `name`, `crumb`, `type`, `menu_show`, `sort`, `status`, `add_time`, `update_time`) VALUES
(1, 0, 'Admin', '总后台管理', '1-', 1, 1, 5, 1, '2012-12-20 21:02:04', '2013-03-27 13:52:44'),
(2, 34, 'Content', '内容管理', '34-2-', 1, 1, 1, 1, '2012-12-20 21:02:04', '2013-03-27 13:52:59'),
(3, 23, 'SiteNode', '节点管理', '1-16-23-3-', 2, 1, 1, 1, '2012-12-20 21:02:04', '2013-03-27 13:58:58'),
(4, 2, 'Web', '站点管理', '34-2-4-', 1, 1, 1, 1, '2012-12-20 21:02:04', '2013-03-27 13:53:04'),
(5, 32, 'index', '列表', '34-2-4-32-5-', 1, 0, 1, 1, '2012-12-20 21:02:04', '2013-03-27 13:56:44'),
(6, 32, '', '添加', '34-2-4-32-6-', 1, 0, 3, 1, '2012-12-20 21:02:04', '2013-03-27 14:10:07'),
(7, 32, 'update', '更新', '34-2-4-32-7-', 1, 0, 5, 1, '2012-12-20 21:02:04', '2012-12-20 21:02:04'),
(8, 32, 'delete', '删除', '34-2-4-32-8-', 1, 0, 10, 1, '2012-12-20 21:02:04', '2013-03-04 17:29:34'),
(9, 32, 'recycle', '还原', '34-2-4-32-9-', 1, 0, 9, 1, '2012-12-29 17:25:52', '2013-03-04 17:28:15'),
(10, 44, 'SiteWeb', '站点管理', '1-16-44-10-', 2, 1, 2, 1, '2012-12-30 21:02:51', '2013-03-27 13:58:05'),
(11, 10, 'index', '列表', '1-16-44-10-11-', 1, 0, 0, 1, '2013-01-01 21:08:51', '2013-03-27 13:58:13'),
(12, 32, 'forbid', '禁止', '34-2-4-32-12-', 1, 0, 8, 1, '2013-01-02 12:52:20', '2013-03-04 17:29:47'),
(13, 32, 'checkPass', '批准', '34-2-4-32-13-', 1, 0, 7, 1, '2013-01-02 12:52:52', '2013-03-04 17:29:18'),
(14, 32, 'resume', '恢复', '34-2-4-32-14-', 1, 0, 6, 1, '2013-01-02 13:02:19', '2013-03-04 16:55:45'),
(15, 17, 'ArticleInfo', '文章管理', '34-2-17-15-', 2, 1, 1, 1, '2013-01-03 22:02:04', '2013-03-27 14:08:56'),
(16, 1, 'Site', '设置管理', '1-16-', 1, 1, 1, 1, '2013-01-21 16:50:50', '2013-03-27 13:57:12'),
(17, 2, 'Article', '文章管理', '34-2-17-', 1, 1, 3, 1, '2013-01-21 16:53:09', '2013-03-27 14:08:49'),
(18, 2, 'Picture', '图片管理', '34-2-18-', 1, 1, 4, 1, '2013-01-23 21:37:46', '2013-03-27 14:09:03'),
(19, 18, 'ArticleAlbum', '相册管理', '34-2-18-19-', 2, 1, 1, 1, '2013-01-23 21:39:45', '2013-03-27 14:09:10'),
(20, 18, 'ArticleAlbumPhoto', '相片管理', '34-2-18-20-', 2, 1, 2, 1, '2013-01-23 21:40:33', '2013-03-27 14:09:17'),
(21, 16, 'Base', '数据管理', '1-16-21-', 1, 1, 3, 1, '2013-01-27 13:17:31', '2013-03-27 13:58:48'),
(22, 21, 'BaseLang', '语言管理', '1-16-21-22-', 2, 1, 1, 1, '2013-01-27 13:24:12', '2013-03-27 13:58:53'),
(23, 16, 'Competence', '权限管理', '1-16-23-', 1, 1, 2, 1, '2013-01-29 16:46:00', '2013-03-27 13:58:42'),
(24, 23, 'SiteRole', '角色管理', '1-16-23-24-', 2, 1, 2, 1, '2013-01-29 16:47:36', '2013-03-27 13:59:04'),
(25, 23, 'SiteRoleUser', '角色用户管理', '1-16-23-25-', 2, 0, 3, 1, '2013-01-29 16:51:59', '2013-03-27 13:59:10'),
(26, 23, 'SiteAccess', '访问管理', '1-16-23-26-', 2, 0, 4, 1, '2013-01-29 16:55:56', '2013-03-27 13:59:17'),
(27, 44, 'SiteConfig', '配置管理', '1-16-44-27-', 2, 1, 1, 1, '2013-01-30 21:21:28', '2013-03-27 13:57:58'),
(28, 0, 'AdminUser', '用户管理', '28-', 1, 1, 4, 1, '2013-02-04 17:00:51', '2013-03-27 13:52:37'),
(29, 45, 'UserBase', '基础管理', '28-65-45-29-', 2, 1, 1, 1, '2013-02-04 17:05:09', '2013-03-27 14:03:02'),
(30, 69, 'Index', '后台管理', '34-2-69-30-', 1, 1, 1, 1, '2013-02-04 17:05:09', '2013-03-27 15:01:54'),
(31, 30, 'Index', '列表', '34-2-69-30-31-', 1, 0, 1, 1, '2013-02-04 17:05:09', '2013-03-27 15:02:08'),
(32, 4, 'SiteMenu', '菜单管理', '34-2-4-32-', 2, 1, 2, 1, '2013-02-22 15:48:06', '2013-03-27 13:53:58'),
(33, 30, 'leftMenu', '左侧导航', '34-2-69-30-33-', 1, 0, 2, 1, '2013-03-02 19:07:22', '2013-03-27 15:02:17'),
(34, 0, 'AdminBase', '基础管理', '34-', 1, 1, 1, 1, '2013-03-02 19:18:14', '2013-03-27 13:51:59'),
(35, 0, 'AdminBlog', '博文管理', '35-', 1, 1, 3, 1, '2013-03-02 19:21:26', '2013-03-27 14:03:13'),
(36, 35, 'BlogContent', '内容管理', '35-36-', 1, 1, 1, 1, '2013-03-02 19:25:23', '2013-03-27 14:03:18'),
(37, 36, 'BlogPicture', '图片管理', '35-36-37-', 1, 1, 2, 1, '2013-03-02 19:29:59', '2013-03-27 14:03:41'),
(38, 37, 'BlogAlbum', '相册管理', '35-36-37-38-', 2, 1, 1, 1, '2013-03-02 19:33:03', '2013-03-27 14:03:47'),
(39, 37, 'BlogAlbumPhoto', '相片管理', '35-36-37-39-', 2, 1, 2, 1, '2013-03-02 19:35:40', '2013-03-27 14:03:53'),
(40, 36, 'Blog', '博文管理', '35-36-40-', 1, 1, 1, 1, '2013-03-02 19:39:20', '2013-03-27 14:03:23'),
(41, 40, 'BlogInfo', '博文管理', '35-36-40-41-', 2, 1, 1, 1, '2013-03-02 19:40:14', '2013-03-27 14:03:28'),
(42, 46, 'ProductContent', '内容管理', '46-42-', 2, 1, 1, 1, '2013-03-02 19:41:58', '2013-03-27 14:04:22'),
(43, 40, 'BlogTag', '标签管理', '35-36-40-43-', 2, 1, 2, 1, '2013-03-02 19:43:06', '2013-03-27 14:03:35'),
(44, 16, 'SiteBase', '基础管理', '1-16-44-', 1, 1, 1, 1, '2013-03-03 13:31:44', '2013-03-27 13:57:38'),
(45, 65, 'User', '用户管理', '28-65-45-', 1, 1, 1, 1, '2013-03-03 16:12:26', '2013-03-27 14:02:41'),
(46, 0, 'AdminProduct', '产品管理', '46-', 1, 1, 2, 1, '2013-03-03 18:07:12', '2013-03-27 14:04:18'),
(47, 32, 'add', '新增', '34-2-4-32-47-', 1, 0, 2, 1, '2013-03-04 16:49:02', '2013-03-27 14:09:58'),
(48, 32, 'edit', '修改', '34-2-4-32-48-', 1, 0, 4, 1, '2013-03-04 16:49:42', '2013-03-27 14:10:36'),
(49, 34, 'AdminAd', '广告管理', '34-49-', 1, 1, 2, 1, '2013-03-08 21:16:01', '2013-03-27 14:05:08'),
(50, 49, 'Ad', '广告管理', '34-49-50-', 1, 1, 1, 1, '2013-03-08 21:17:14', '2013-03-27 14:56:17'),
(51, 50, 'AdInfo', '广告管理', '34-49-50-51-', 2, 1, 2, 1, '2013-03-08 21:19:02', '2013-03-27 14:05:26'),
(52, 50, 'AdPosition', '广告位管理', '34-49-50-52-', 2, 1, 1, 1, '2013-03-08 21:19:49', '2013-03-27 14:05:18'),
(53, 50, 'AdSchedule', '排期管理', '34-49-50-53-', 2, 1, 3, 1, '2013-03-08 21:20:26', '2013-03-27 14:05:33'),
(54, 55, 'AdFunction', '方法管理', '34-49-55-54-', 2, 1, 1, 1, '2013-03-08 21:21:11', '2013-03-27 14:05:46'),
(55, 49, 'AdSite', '广告配置', '34-49-55-', 1, 1, 2, 1, '2013-03-09 19:11:17', '2013-03-27 14:05:39'),
(56, 4, 'SiteWeb', '站点设置', '34-2-4-56-', 2, 1, 1, 1, '2013-03-12 18:01:26', '2013-03-27 13:53:11'),
(57, 2, 'Plate', '面板管理', '34-2-57-', 1, 1, 2, 1, '2013-03-24 14:30:17', '2013-03-27 14:07:56'),
(58, 57, 'SitePlateGroup', '面板分组管理', '34-2-57-58-', 2, 1, 1, 1, '2013-03-24 14:32:44', '2013-03-27 14:08:13'),
(59, 57, 'SitePlate', '面板管理', '34-2-57-59-', 2, 1, 2, 1, '2013-03-24 14:33:09', '2013-03-27 14:08:20'),
(60, 57, 'SitePlateContent', '面板内容管理', '34-2-57-60-', 2, 0, 3, 1, '2013-03-24 14:33:34', '2013-03-27 14:08:26'),
(61, 42, 'Product', '商品管理', '46-42-61-', 1, 1, 1, 1, '2013-03-27 13:32:47', '2013-03-27 14:04:27'),
(62, 42, 'ProductPicture', '图片管理', '46-42-62-', 1, 1, 2, 1, '2013-03-27 13:36:25', '2013-03-27 14:04:33'),
(63, 61, 'ProductGoods', '商品管理', '46-42-61-63-', 2, 1, 1, 1, '2013-03-27 13:37:20', '2013-03-27 14:04:45'),
(64, 70, 'ProductChannel', '渠道管理', '46-42-70-64-', 2, 1, 1, 1, '2013-03-27 13:39:10', '2013-03-27 15:17:27'),
(65, 28, 'Users', '基础管理', '28-65-', 1, 1, 1, 1, '2013-03-27 14:01:06', '2013-03-27 14:01:06'),
(66, 62, 'ProductAlbum', '相册管理', '46-42-62-66-', 2, 1, 1, 1, '2013-03-27 14:24:21', '2013-03-27 14:24:21'),
(67, 62, 'ProductAlbumPhoto', '相片管理', '46-42-62-67-', 2, 1, 2, 1, '2013-03-27 14:32:41', '2013-03-27 14:32:41'),
(68, 70, 'ProductDescriptionCategory', '描述分类管理', '46-42-70-68-', 2, 1, 2, 1, '2013-03-27 14:52:52', '2013-03-27 15:03:34'),
(69, 2, 'WebSite', '站点配置', '34-2-69-', 1, 1, 5, 1, '2013-03-27 14:57:36', '2013-03-27 14:57:36'),
(70, 42, 'ProductSite', '商品配置', '46-42-70-', 1, 1, 3, 1, '2013-03-27 15:02:58', '2013-03-27 15:02:58');

-- --------------------------------------------------------

--
-- 表的结构 `site_plate`
--

CREATE TABLE `site_plate` (
  `spid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `spgid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_plate_group表spgid字段',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '面板名称',
  `row` tinyint(5) DEFAULT '1' COMMENT '面板列数',
  `class` varchar(100) DEFAULT '' COMMENT '面板样式',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`spid`),
  KEY `sid` (`sid`),
  KEY `status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='面板管理' AUTO_INCREMENT=5 ;

--
-- 导出表中的数据 `site_plate`
--

INSERT INTO `site_plate` (`spid`, `sid`, `spgid`, `name`, `row`, `class`, `sort`, `status`, `add_time`, `update_time`) VALUES
(1, 1, 1, '默认面板', 2, 'span6,span6', 1, 0, '2013-03-24 15:51:46', '2013-04-03 14:21:55'),
(2, 1, 2, '默认面板', 3, '', 0, 1, '2013-03-24 15:56:22', '2013-03-24 15:56:22'),
(3, 1, 1, '广告', 1, '', 2, 0, '2013-03-25 14:45:03', '2013-03-25 14:45:03'),
(4, 1, 1, '服务范围', 3, 'span4,span4,span4', 0, 1, '2013-04-02 17:25:28', '2013-04-03 17:13:45');

-- --------------------------------------------------------

--
-- 表的结构 `site_plate_content`
--

CREATE TABLE `site_plate_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `spid` int(11) NOT NULL DEFAULT '0' COMMENT '面板ID，关联site_plate表spid字段',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '面板内容名称',
  `row_position` tinyint(5) DEFAULT '1' COMMENT '面板内容列位置',
  `type` tinyint(1) DEFAULT '1' COMMENT '面板内容类型：1为列表，2为分类，3为单篇内容',
  `model` tinyint(1) DEFAULT '1' COMMENT '面板内容模型：0为广告，后同site_menu表model字段',
  `model_value` varchar(255) DEFAULT '' COMMENT '面板内容',
  `list_opt` int(5) DEFAULT '3' COMMENT '列表显示项，同site_menu表list_opt字段',
  `class` varchar(100) DEFAULT '' COMMENT '面板内容样式',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `start_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '开始时间',
  `end_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '结束时间',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`),
  KEY `status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='面板内容管理' AUTO_INCREMENT=8 ;

--
-- 导出表中的数据 `site_plate_content`
--

INSERT INTO `site_plate_content` (`id`, `sid`, `spid`, `name`, `row_position`, `type`, `model`, `model_value`, `list_opt`, `class`, `sort`, `status`, `start_time`, `end_time`, `add_time`, `update_time`) VALUES
(1, 1, 1, '公司简介', 1, 3, 1, '1', 3, '', 0, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-24 20:41:15', '2013-03-25 15:05:39'),
(2, 1, 1, '关于我们', 2, 1, 1, '12', 19, '', 2, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-24 20:42:09', '2013-04-03 17:12:24'),
(3, 1, 3, '广告', 1, 3, 0, 'logo', 3, '', 0, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-25 14:45:20', '2013-03-25 14:45:20'),
(4, 1, 1, '项目案例', 2, 1, 1, '8', 3, '', 1, 0, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-25 15:06:14', '2013-04-03 09:41:39'),
(5, 1, 4, '企业文化', 1, 3, 1, '1', NULL, '', 0, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-02 17:58:07', '2013-04-03 17:41:26'),
(6, 1, 4, 'qqq', 2, 1, 1, '8', 17, '', 0, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-02 18:00:04', '2013-04-03 17:21:37'),
(7, 1, 4, '111', 3, 1, 1, '12', 17, '', 0, 1, '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 17:19:44', '2013-04-03 17:21:10');

-- --------------------------------------------------------

--
-- 表的结构 `site_plate_group`
--

CREATE TABLE `site_plate_group` (
  `spgid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `code` varchar(100) NOT NULL DEFAULT '' COMMENT '面板分组编码,可作唯一标示',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '面板分组名称',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`spgid`),
  KEY `sid` (`sid`),
  KEY `status` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='面板分组管理' AUTO_INCREMENT=3 ;

--
-- 导出表中的数据 `site_plate_group`
--

INSERT INTO `site_plate_group` (`spgid`, `sid`, `code`, `name`, `sort`, `status`, `add_time`, `update_time`) VALUES
(1, 1, 'Home_Index_index', '首页面板', 1, 1, '2013-03-24 15:19:22', '2013-03-24 15:19:22'),
(2, 1, 'Blog_Index_index', '博客首页面板', 2, 1, '2013-03-24 15:19:41', '2013-03-24 15:19:41');

-- --------------------------------------------------------

--
-- 表的结构 `site_role`
--

CREATE TABLE `site_role` (
  `rid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色父级ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '角色名称',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`rid`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='设置角色表' AUTO_INCREMENT=3 ;

--
-- 导出表中的数据 `site_role`
--

INSERT INTO `site_role` (`rid`, `sid`, `parent_id`, `name`, `sort`, `status`, `add_time`, `update_time`) VALUES
(1, 1, 0, '超级管理员', 1, 1, '2013-02-03 16:08:22', '2013-02-03 16:08:22'),
(2, 1, 0, '管理员', 2, 1, '2013-02-03 16:25:25', '2013-02-03 16:26:06');

-- --------------------------------------------------------

--
-- 表的结构 `site_role_user`
--

CREATE TABLE `site_role_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `rid` int(11) NOT NULL DEFAULT '0' COMMENT '角色ID，关联site_role表rid字段',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID，关联user_base表uid字段',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='设置角色关联用户表' AUTO_INCREMENT=2 ;

--
-- 导出表中的数据 `site_role_user`
--

INSERT INTO `site_role_user` (`id`, `sid`, `rid`, `uid`, `status`, `add_time`, `update_time`) VALUES
(1, 1, 1, 2, 1, '2013-02-07 14:58:48', '2013-02-07 14:58:48');

-- --------------------------------------------------------

--
-- 表的结构 `site_web`
--

CREATE TABLE `site_web` (
  `sid` int(6) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `blcode` varchar(30) NOT NULL DEFAULT 'cn' COMMENT '语言编码，关联base_lang表code字段',
  `domain` varchar(30) NOT NULL DEFAULT '' COMMENT '网站域名',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '网站名称',
  `keywords` varchar(800) DEFAULT '' COMMENT '网站关键字',
  `description` varchar(800) DEFAULT '' COMMENT '网站描述',
  `template` varchar(30) DEFAULT 'default' COMMENT '网站模板名称',
  `record_no` varchar(30) DEFAULT '' COMMENT '网站备案号',
  `bottom_info` varchar(800) DEFAULT '' COMMENT '网站底部信息（包含统计代码）',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`sid`),
  KEY `domain` (`domain`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='设置网站信息表' AUTO_INCREMENT=6 ;

--
-- 导出表中的数据 `site_web`
--

INSERT INTO `site_web` (`sid`, `blcode`, `domain`, `name`, `keywords`, `description`, `template`, `record_no`, `bottom_info`, `sort`, `status`, `add_time`, `update_time`) VALUES
(1, 'zh-cn', 'altilacms', 'altilaCMS网', 'altila,陈强,个人网站,IT,PHP,Jquery,JS', 'altila(陈强)个人网站,记录关于IT中PHP、JS、Jquer等技术方面咨询', 'default', '沪ICP备05033127号', NULL, 1, 1, '2012-12-11 13:58:09', '2013-03-19 17:05:08'),
(2, 'en-us', 'altilacms', 'altilaCMSWeb', 'altila', 'altila', 'default', '', '', 2, 1, '2012-12-11 13:58:09', '2013-03-19 16:34:16'),
(3, 'en-us', 'altila', 'Altila Web', '', '', 'default', '', NULL, 0, 1, '2013-01-01 11:29:26', '2013-01-04 16:21:12'),
(4, 'zh-cn', 'altila', 'Altila网', '', '', 'default', '', NULL, 0, 1, '2013-01-04 16:20:42', '2013-01-04 16:21:51'),
(5, 'zh-cn', 'zhuoao', 'aaaa', '', '', 'default', '', NULL, 0, 2, '2013-01-04 16:22:27', '2013-01-04 17:27:41');

-- --------------------------------------------------------

--
-- 表的结构 `user_base`
--

CREATE TABLE `user_base` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `user_id` varchar(60) NOT NULL DEFAULT '' COMMENT '用户登陆名称（唯一）',
  `password` varchar(100) DEFAULT '' COMMENT '用户密码',
  `mobile` varchar(20) DEFAULT '' COMMENT '用户手机',
  `email` varchar(100) DEFAULT '' COMMENT '用户邮箱',
  `check_mobile` smallint(1) DEFAULT '0' COMMENT '是否验证手机',
  `check_email` smallint(1) DEFAULT '0' COMMENT '是否验证邮箱',
  `source_code` varchar(100) DEFAULT '' COMMENT '用户来源',
  `user_type` int(4) DEFAULT '1' COMMENT '-- 用户类型',
  `level_id` int(4) DEFAULT '0' COMMENT '-- 用户等级',
  `level_expire` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '-- 等级过期时间',
  `status` smallint(1) DEFAULT '1' COMMENT '用户状态：0为未激活，1为已激活，2为不受欢迎，3为删除',
  `reg_ip` varchar(16) DEFAULT '' COMMENT '注册IP',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`uid`),
  KEY `sid` (`sid`),
  KEY `user_id` (`user_id`),
  KEY `email` (`email`),
  KEY `mobile` (`mobile`),
  KEY `source_code` (`source_code`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户基础信息表' AUTO_INCREMENT=3 ;

--
-- 导出表中的数据 `user_base`
--

INSERT INTO `user_base` (`uid`, `sid`, `user_id`, `password`, `mobile`, `email`, `check_mobile`, `check_email`, `source_code`, `user_type`, `level_id`, `level_expire`, `status`, `reg_ip`, `add_time`, `update_time`) VALUES
(1, 1, 'altila', 'e10adc3949ba59abbe56e057f20f883e', '', '', 0, 0, '', 1, 0, '1970-01-01 08:00:00', 1, '', '2012-12-11 14:00:03', '2012-12-11 14:00:06'),
(2, 1, 'altila1', 'e10adc3949ba59abbe56e057f20f883e', '', '', 0, 0, '', 1, 0, '1970-01-01 08:00:00', 1, '', '2012-12-11 14:00:03', '2012-12-11 14:00:06');

-- --------------------------------------------------------

--
-- 表的结构 `user_info`
--

CREATE TABLE `user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID，关联user_base表uid字段',
  `real_name` varchar(60) DEFAULT '' COMMENT '用户真实姓名',
  `sex` smallint(1) DEFAULT '0' COMMENT '用户性别：0为保密，1为男，2为女',
  `birth_day` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '用户生日',
  `qq` varchar(20) DEFAULT '' COMMENT '用户QQ号',
  `msn` varchar(60) DEFAULT '' COMMENT '用户MSN号',
  `website` varchar(255) DEFAULT '' COMMENT '用户个人网站',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户扩展信息表' AUTO_INCREMENT=3 ;

--
-- 导出表中的数据 `user_info`
--

INSERT INTO `user_info` (`id`, `uid`, `real_name`, `sex`, `birth_day`, `qq`, `msn`, `website`, `add_time`, `update_time`) VALUES
(1, 1, '陈强', 1, '1988-07-25 15:00:00', '281012472', '', 'http://www.altila.com', '2012-12-11 14:01:53', '2012-12-11 14:01:57'),
(2, 2, '陈强', 1, '1988-07-25 15:00:00', '281012472', '', 'http://www.altila.com', '2012-12-11 14:01:53', '2012-12-11 14:01:57');

-- --------------------------------------------------------

--
-- 表的结构 `user_log_stat`
--

CREATE TABLE `user_log_stat` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID，关联user_base表uid字段',
  `log_ip` varchar(16) DEFAULT '' COMMENT '用户登录IP',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`),
  KEY `uid` (`uid`),
  KEY `log_ip` (`log_ip`),
  KEY `add_time` (`add_time`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='用户登陆明细表' AUTO_INCREMENT=2 ;

--
-- 导出表中的数据 `user_log_stat`
--

INSERT INTO `user_log_stat` (`id`, `sid`, `uid`, `log_ip`, `add_time`, `update_time`) VALUES
(1, 1, 1, '127.0.0.1', '2013-02-02 22:39:00', '2013-02-02 22:39:00');
