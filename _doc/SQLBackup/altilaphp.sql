/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50136
Source Host           : localhost:3306
Source Database       : altilaphp

Target Server Type    : MYSQL
Target Server Version : 50136
File Encoding         : 65001

Date: 2013-04-02 22:05:06
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ad_function`
-- ----------------------------
DROP TABLE IF EXISTS `ad_function`;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='广告方法表';

-- ----------------------------
-- Records of ad_function
-- ----------------------------
INSERT INTO `ad_function` VALUES ('1', 'adOriginal', '无效果', '1', '1', '2013-03-08 22:35:21', '2013-03-08 22:35:21');
INSERT INTO `ad_function` VALUES ('2', 'adCarousel', '轮播', '2', '1', '2013-03-08 22:35:34', '2013-03-08 22:36:43');

-- ----------------------------
-- Table structure for `ad_info`
-- ----------------------------
DROP TABLE IF EXISTS `ad_info`;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='广告信息表';

-- ----------------------------
-- Records of ad_info
-- ----------------------------
INSERT INTO `ad_info` VALUES ('1', '1', '1', 'Logo', '', '0', '/', 'http://s.mb-go.com/pub7/images/style/logo/logo_bg.jpg', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-09 17:11:48', '2013-03-16 16:42:23');
INSERT INTO `ad_info` VALUES ('2', '1', '4', '广告魔方', 'aaa', '3', '', '&lt;div class=&quot;magic_box&quot; style=&quot;height:392px&quot;&gt;&lt;input class=&quot;_sideLen&quot; name=&quot;_sideLen&quot; value=&quot;98&quot; type=&quot;hidden&quot;&gt;&lt;div class=&quot;magic_item&quot;&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://www.banggo.com/Theme/theme_MB-ZHUTI538.shtml&quot;&gt;&lt;img src=&quot;http://img.mbanggo.com/sources/cms/20121127/mbnew-1123-980-down1.jpg&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;div class=&quot;magic_item&quot; style=&quot;z-index:10;left:196px;top:0px;&quot;&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://search.banggo.com/Search/a_2_a_a_a_a_a_a_a_a_a_a_a_6-y-w35-ly-b6bm-f.shtml&quot;&gt;&lt;img src=&quot;http://img.mbanggo.com/sources/cms/20121127/mbnew-1123-980-down2.jpg&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;div class=&quot;magic_item&quot; style=&quot;z-index:10;left:196px;top:196px;&quot;&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://search.banggo.com/Search/a_2_a_a_a_a_a_a_a_a_a_a_a_5q-s-n54mp5a-sn5oi-y5-y-o15b-c4.shtml&quot;&gt;&lt;img src=&quot;http://img.mbanggo.com/sources/cms/20121127/mbnew-1123-980-down3.jpg&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;div class=&quot;magic_item&quot; style=&quot;z-index: 10; left: 392px; top: 0px;&quot;&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://search.banggo.com/Search/a_2_a_a_a_a_a_a_a_a_a_a_a_5r-w357u15a6d5a6d.shtml&quot;&gt;&lt;img src=&quot;http://img.mbanggo.com/sources/cms/20121127/mbnew-1123-980-down4.jpg&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;div class=&quot;magic_item&quot; style=&quot;z-index:10;left:588px;top:0px;&quot;&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://search.banggo.com/Search/a_2_a_a_a_a_a_a_a_a_a_a_a_576-o5b2x5-y6-c.shtml&quot;&gt;&lt;img src=&quot;http://img.mbanggo.com/sources/cms/20121127/mbnew-1123-980-down5.jpg&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;div class=&quot;magic_item&quot; style=&quot;z-index:10;left:588px;top:196px;&quot;&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://search.banggo.com/Search/a_a.shtml?clickType=1&amp;amp;word=kitty&quot;&gt;&lt;img src=&quot;http://img.mbanggo.com/sources/cms/20121127/mbnew-1123-980-down6.jpg&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;div class=&quot;magic_item&quot; style=&quot;z-index:10;left:784px;top:0px;&quot;&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://search.banggo.com/Search/a_a.shtml?clickType=1&amp;amp;word=CHICALOCA&quot;&gt;&lt;img src=&quot;http://img.mbanggo.com/sources/cms/20121127/mbnew-1123-980-down7.jpg&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;div class=&quot;magic_item&quot; style=&quot;left:784px;top:196px;z-index:10;&quot;&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://search.banggo.com/Search/a_a.shtml?clickType=1&amp;amp;word=阿拉蕾&amp;amp;t=metersbonwe&amp;amp;&quot;&gt;&lt;img src=&quot;http://img.mbanggo.com/sources/cms/20130114/mbnew-0111-980nv-alalei.jpg&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;/div&gt;', '3', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-09 20:22:06', '2013-03-16 16:56:36');
INSERT INTO `ad_info` VALUES ('3', '1', '3', '底部通栏广告', '', '2', '', '&lt;p&gt;&lt;img src=&quot;http://img.mbanggo.com/sources/bgimages/bg/fotter_0217.jpg&quot; alt=&quot;14天退换货保障，139元起免费送货，100%正品保证！&quot; /&gt;&lt;/p&gt;', '0', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-16 13:50:49', '2013-03-16 13:50:49');
INSERT INTO `ad_info` VALUES ('4', '1', '4', 'flash', '', '1', '', 'http://img.mbanggo.com/sources/bgimages/20120517/loaderswf01.swf', '2', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-16 15:09:46', '2013-03-17 20:23:54');
INSERT INTO `ad_info` VALUES ('5', '1', '4', '图片广告', '', '0', '', 'http://img.mbanggo.com/sources/cms/20130315/sylb-0314-300-60.jpg', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 17:45:20', '2013-03-21 17:45:20');

-- ----------------------------
-- Table structure for `ad_position`
-- ----------------------------
DROP TABLE IF EXISTS `ad_position`;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='广告位信息表';

-- ----------------------------
-- Records of ad_position
-- ----------------------------
INSERT INTO `ad_position` VALUES ('1', '1', '1', 'logo', 'Logo', '', '250', '80', '1', '1', '1', '1', '2013-03-09 10:33:43', '2013-03-17 19:22:32');
INSERT INTO `ad_position` VALUES ('2', '1', '1', 'topAd', '头部通栏广告', '', '980', '50', '1', '1', '2', '1', '2013-03-09 15:20:10', '2013-03-09 15:20:10');
INSERT INTO `ad_position` VALUES ('3', '1', '1', 'bottomAd', '底部通栏广告', '', '980', '50', '1', '1', '4', '1', '2013-03-09 15:21:08', '2013-03-09 15:21:08');
INSERT INTO `ad_position` VALUES ('4', '1', '2', 'Home_Index_index', '首页广告', 'aa', '980', '392', '1', '1', '3', '1', '2013-03-09 21:30:13', '2013-03-24 11:07:09');
INSERT INTO `ad_position` VALUES ('5', '1', '1', 'Home_ArticleCategory_index', '文章分类页通栏广告', '', '980', '80', '1', '1', '0', '1', '2013-03-16 13:52:30', '2013-03-24 11:07:26');

-- ----------------------------
-- Table structure for `ad_schedule`
-- ----------------------------
DROP TABLE IF EXISTS `ad_schedule`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='广告排期表';

-- ----------------------------
-- Records of ad_schedule
-- ----------------------------
INSERT INTO `ad_schedule` VALUES ('1', '1', '2', '4', '1', '0', '2013-03-03 00:00:00', '2013-03-29 00:00:00', '2013-03-09 19:32:41', '2013-03-17 20:31:17');

-- ----------------------------
-- Table structure for `article_album`
-- ----------------------------
DROP TABLE IF EXISTS `article_album`;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='文章相册表';

-- ----------------------------
-- Records of article_album
-- ----------------------------
INSERT INTO `article_album` VALUES ('1', '1', '1', '案例展示', '0', '1', '2013-01-27 11:25:02', '2013-01-27 19:03:48');
INSERT INTO `article_album` VALUES ('2', '2', '1', 'About Us', '0', '1', '2013-01-28 21:24:30', '2013-01-28 21:24:30');

-- ----------------------------
-- Table structure for `article_album_photo`
-- ----------------------------
DROP TABLE IF EXISTS `article_album_photo`;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='文章相片表';

-- ----------------------------
-- Records of article_album_photo
-- ----------------------------
INSERT INTO `article_album_photo` VALUES ('1', '1', '1', '0', 'large_clxm_62092h206091', '__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5105e07a69b07.jpg', '108211', '0', '1', '2013-01-28 10:20:42', '2013-01-28 10:20:42');
INSERT INTO `article_album_photo` VALUES ('2', '1', '1', '1', 'large_clxm_62092h206091', '__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5105e0fd2e36c.jpg', '108211', '0', '1', '2013-01-28 10:22:53', '2013-01-28 10:22:53');
INSERT INTO `article_album_photo` VALUES ('3', '2', '1', '2', 'large_jt4L_61682a206091', '__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/51067f9c641d8.jpg', '104652', '0', '1', '2013-01-28 21:39:40', '2013-01-28 21:39:40');
INSERT INTO `article_album_photo` VALUES ('4', '1', '1', '0', '20090914081712350', '__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5142d1731ba56.jpg', '46697', '0', '1', '2013-01-28 22:39:40', '2013-01-28 22:39:40');
INSERT INTO `article_album_photo` VALUES ('5', '1', '1', '0', '中国矿产地图', '__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5142d17660c60.jpg', '180169', '0', '1', '2013-01-28 22:59:40', '2013-01-28 22:59:40');

-- ----------------------------
-- Table structure for `article_info`
-- ----------------------------
DROP TABLE IF EXISTS `article_info`;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='文章信息表';

-- ----------------------------
-- Records of article_info
-- ----------------------------
INSERT INTO `article_info` VALUES ('1', '1', '1', '1', '公司简介', '', '邦购官网CMS内容管理系统', '&lt;p&gt;公司简介&lt;br /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5105e0fd2e36c.jpg&quot; height=&quot;800&quot; width=&quot;600&quot; /&gt;&lt;img src=&quot;__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/51067f9c641d8.jpg&quot; /&gt;&lt;/p&gt;', '__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5105e0fd2e36c.jpg', '__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5105e0fd2e36c.jpg,__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/51067f9c641d8.jpg,', 'http://admin.altilacms.com/Index/indexContent.html', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-01-17 13:48:35', '2013-03-14 19:27:02');
INSERT INTO `article_info` VALUES ('2', '2', '1', '11', 'about us', '', 'about us description', '&lt;p&gt;about us&lt;br /&gt;&lt;/p&gt;', '', '', '', '0', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-01-21 20:37:20', '2013-01-21 21:57:41');
INSERT INTO `article_info` VALUES ('3', '1', '1', '1', '联系我们', '', '联系我们简介', '&lt;p&gt;&lt;img src=&quot;__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5142d1731ba56.jpg&quot; style=&quot;float:none;&quot; title=&quot;20090914081712350&quot; /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5142d17660c60.jpg&quot; style=&quot;float:none;&quot; title=&quot;中国矿产地图&quot; /&gt;&lt;/p&gt;&lt;p&gt;联系我们&lt;br /&gt;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5105e0fd2e36c.jpg&quot; height=&quot;800&quot; width=&quot;600&quot; /&gt;&lt;img src=&quot;__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/51067f9c641d8.jpg&quot; /&gt;&lt;/p&gt;', '__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5105e0fd2e36c.jpg', '__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5142d1731ba56.jpg,__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5142d17660c60.jpg,__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/5105e0fd2e36c.jpg,__UPLOAD__/Images/altilacms/ArticleAlbumPhoto/20130128/51067f9c641d8.jpg,', '', '3', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-10 20:40:54', '2013-03-15 15:50:06');
INSERT INTO `article_info` VALUES ('4', '1', '1', '1', '企业文化', '', '企业文化简介', '&lt;p&gt;企业文化&lt;br /&gt;&lt;/p&gt;', '', '', '', '2', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-10 20:41:48', '2013-03-10 20:41:48');
INSERT INTO `article_info` VALUES ('5', '1', '1', '9', '企业站', '', '企业站简介', '&lt;p&gt;企业站&lt;br /&gt;&lt;/p&gt;', '', '', '', '0', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-11 20:47:16', '2013-03-11 20:47:16');

-- ----------------------------
-- Table structure for `base_lang`
-- ----------------------------
DROP TABLE IF EXISTS `base_lang`;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='基础语言表';

-- ----------------------------
-- Records of base_lang
-- ----------------------------
INSERT INTO `base_lang` VALUES ('1', 'zh-cn', '中文简体', '1', '1', '2013-01-27 13:33:08', '2013-01-27 13:35:32');
INSERT INTO `base_lang` VALUES ('2', 'en-us', '英文', '2', '1', '2013-01-27 13:35:42', '2013-01-27 13:35:42');
INSERT INTO `base_lang` VALUES ('3', 'zh-tw', '中文繁体', '0', '0', '2013-01-27 13:35:57', '2013-01-27 13:35:57');

-- ----------------------------
-- Table structure for `blog_album`
-- ----------------------------
DROP TABLE IF EXISTS `blog_album`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='博文相册表';

-- ----------------------------
-- Records of blog_album
-- ----------------------------
INSERT INTO `blog_album` VALUES ('1', '1', '1', '我的相册', '0', '1', '2013-03-07 09:58:10', '2013-03-07 09:58:10');

-- ----------------------------
-- Table structure for `blog_album_photo`
-- ----------------------------
DROP TABLE IF EXISTS `blog_album_photo`;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='博文相片表';

-- ----------------------------
-- Records of blog_album_photo
-- ----------------------------
INSERT INTO `blog_album_photo` VALUES ('1', '1', '1', '1', '1', '__UPLOAD__/Images/altilacms/BlogAlbumPhoto/20130307/5137f47890de7.jpg', '46695', '0', '1', '2013-03-07 09:58:44', '2013-03-07 09:58:44');
INSERT INTO `blog_album_photo` VALUES ('2', '1', '1', '0', '中国矿产地图', '__UPLOAD__/Images/altilacms/BlogAlbumPhoto/20130307/5137ff0b07ab7.jpg', '180169', '0', '1', '2013-03-07 10:44:27', '2013-03-07 10:44:27');

-- ----------------------------
-- Table structure for `blog_comment`
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='博文评论表';

-- ----------------------------
-- Records of blog_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `blog_comment_operate`
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment_operate`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='博文评论操作明细表';

-- ----------------------------
-- Records of blog_comment_operate
-- ----------------------------

-- ----------------------------
-- Table structure for `blog_comment_stat`
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment_stat`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='博文评论操作统计总表';

-- ----------------------------
-- Records of blog_comment_stat
-- ----------------------------

-- ----------------------------
-- Table structure for `blog_group`
-- ----------------------------
DROP TABLE IF EXISTS `blog_group`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='博文分组表';

-- ----------------------------
-- Records of blog_group
-- ----------------------------

-- ----------------------------
-- Table structure for `blog_info`
-- ----------------------------
DROP TABLE IF EXISTS `blog_info`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='博文信息表';

-- ----------------------------
-- Records of blog_info
-- ----------------------------
INSERT INTO `blog_info` VALUES ('1', '1', '1', '5', 'Web前端', 'web,前端', '', '&lt;p&gt;web,前端&lt;br /&gt;&lt;/p&gt;', '', '', '', '0', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-08 14:48:54', '2013-03-08 14:48:54');

-- ----------------------------
-- Table structure for `blog_info_group`
-- ----------------------------
DROP TABLE IF EXISTS `blog_info_group`;
CREATE TABLE `blog_info_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `biid` int(11) NOT NULL DEFAULT '0' COMMENT '博文ID，关联blog_info表biid字段',
  `bgid` int(11) NOT NULL DEFAULT '0' COMMENT '博文分组ID，关联blog_group表bgid字段',
  PRIMARY KEY (`id`),
  KEY `sid` (`sid`),
  KEY `aiid` (`biid`),
  KEY `agid` (`bgid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='博文信息关联分组表';

-- ----------------------------
-- Records of blog_info_group
-- ----------------------------

-- ----------------------------
-- Table structure for `blog_info_operate`
-- ----------------------------
DROP TABLE IF EXISTS `blog_info_operate`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='博文操作明细表';

-- ----------------------------
-- Records of blog_info_operate
-- ----------------------------

-- ----------------------------
-- Table structure for `blog_info_stat`
-- ----------------------------
DROP TABLE IF EXISTS `blog_info_stat`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='博文统计总表';

-- ----------------------------
-- Records of blog_info_stat
-- ----------------------------

-- ----------------------------
-- Table structure for `blog_tag`
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='博文标签表';

-- ----------------------------
-- Records of blog_tag
-- ----------------------------
INSERT INTO `blog_tag` VALUES ('1', '1', '5', '1', 'web');
INSERT INTO `blog_tag` VALUES ('2', '1', '5', '1', '前端');

-- ----------------------------
-- Table structure for `blog_tag_stat`
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag_stat`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='博文标签统计表';

-- ----------------------------
-- Records of blog_tag_stat
-- ----------------------------

-- ----------------------------
-- Table structure for `product_channel`
-- ----------------------------
DROP TABLE IF EXISTS `product_channel`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商品渠道信息表';

-- ----------------------------
-- Records of product_channel
-- ----------------------------
INSERT INTO `product_channel` VALUES ('1', '1', '商城', '1', '1', '1', '2013-03-27 16:44:39', '2013-03-27 16:44:39');

-- ----------------------------
-- Table structure for `product_description`
-- ----------------------------
DROP TABLE IF EXISTS `product_description`;
CREATE TABLE `product_description` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `pgid` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID，关联product_goods表pgid字段',
  `pdcid` int(11) NOT NULL DEFAULT '0' COMMENT '商品描述分类ID，关联product_description_category表pdcid字段',
  `content` text COMMENT '商品描述',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品描述信息表';

-- ----------------------------
-- Records of product_description
-- ----------------------------

-- ----------------------------
-- Table structure for `product_description_category`
-- ----------------------------
DROP TABLE IF EXISTS `product_description_category`;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='商品描述分类表';

-- ----------------------------
-- Records of product_description_category
-- ----------------------------
INSERT INTO `product_description_category` VALUES ('1', '1', '商品描述', '1', '1', '2013-03-27 15:12:43', '2013-03-27 15:13:25');
INSERT INTO `product_description_category` VALUES ('2', '1', '商品卖点', '2', '1', '2013-03-27 15:13:34', '2013-03-27 15:13:34');

-- ----------------------------
-- Table structure for `product_goods`
-- ----------------------------
DROP TABLE IF EXISTS `product_goods`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品信息表';

-- ----------------------------
-- Records of product_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `site_access`
-- ----------------------------
DROP TABLE IF EXISTS `site_access`;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='设置访问权限表';

-- ----------------------------
-- Records of site_access
-- ----------------------------
INSERT INTO `site_access` VALUES ('1', '1', '1', '4', '1', '2013-03-08 15:28:45', '2013-03-08 15:28:45');
INSERT INTO `site_access` VALUES ('2', '1', '1', '32', '1', '2013-03-08 15:28:45', '2013-03-08 15:28:45');
INSERT INTO `site_access` VALUES ('3', '1', '1', '5', '1', '2013-03-08 15:28:45', '2013-03-08 15:28:45');
INSERT INTO `site_access` VALUES ('4', '1', '1', '47', '1', '2013-03-08 15:28:45', '2013-03-08 15:28:45');
INSERT INTO `site_access` VALUES ('5', '1', '1', '6', '1', '2013-03-08 15:28:45', '2013-03-08 15:28:45');
INSERT INTO `site_access` VALUES ('6', '1', '1', '48', '1', '2013-03-08 15:28:45', '2013-03-08 15:28:45');
INSERT INTO `site_access` VALUES ('7', '1', '1', '7', '1', '2013-03-08 15:28:45', '2013-03-08 15:28:45');
INSERT INTO `site_access` VALUES ('8', '1', '1', '14', '1', '2013-03-08 15:28:45', '2013-03-08 15:28:45');
INSERT INTO `site_access` VALUES ('9', '1', '1', '13', '1', '2013-03-08 15:28:45', '2013-03-08 15:28:45');
INSERT INTO `site_access` VALUES ('10', '1', '1', '12', '1', '2013-03-08 15:28:45', '2013-03-08 15:28:45');
INSERT INTO `site_access` VALUES ('11', '1', '1', '9', '1', '2013-03-08 15:28:45', '2013-03-08 15:28:45');
INSERT INTO `site_access` VALUES ('12', '1', '1', '8', '1', '2013-03-08 15:28:45', '2013-03-08 15:28:45');
INSERT INTO `site_access` VALUES ('13', '1', '1', '30', '1', '2013-03-08 15:28:45', '2013-03-08 15:28:45');
INSERT INTO `site_access` VALUES ('14', '1', '1', '31', '1', '2013-03-08 15:28:45', '2013-03-08 15:28:45');
INSERT INTO `site_access` VALUES ('15', '1', '1', '33', '1', '2013-03-08 15:28:45', '2013-03-08 15:28:45');

-- ----------------------------
-- Table structure for `site_config`
-- ----------------------------
DROP TABLE IF EXISTS `site_config`;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='设置配置信息表';

-- ----------------------------
-- Records of site_config
-- ----------------------------
INSERT INTO `site_config` VALUES ('1', '1', '后台是否记录用户登录', 'adminIsRecordUserLog', '0', '1', '2013-02-02 21:00:26', '2013-02-12 10:45:39');
INSERT INTO `site_config` VALUES ('2', '1', '是否启用博文', 'isEnableBlog', '1', '1', '2013-03-09 21:36:23', '2013-03-19 15:42:02');
INSERT INTO `site_config` VALUES ('3', '1', '是否启用广告js', 'isEnableAdJs', '0', '1', '2013-03-17 19:08:05', '2013-03-18 21:48:17');
INSERT INTO `site_config` VALUES ('4', '1', '是否启用小说', 'isEnableNovel', '0', '1', '2013-03-21 14:09:28', '2013-03-21 14:09:28');

-- ----------------------------
-- Table structure for `site_menu`
-- ----------------------------
DROP TABLE IF EXISTS `site_menu`;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='设置菜单表';

-- ----------------------------
-- Records of site_menu
-- ----------------------------
INSERT INTO `site_menu` VALUES ('1', '1', '0', 'AboutUs', '关于我们', '1-', '1', '0', '', '6', '3', '0', '0', '0', '20', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:20:59', '2013-03-31 13:58:28');
INSERT INTO `site_menu` VALUES ('2', '1', '0', 'Blog', '博文', '2-', '4', '1', '', '3', '203', '0', '0', '1', '20', '3', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:21:56', '2013-03-21 20:36:02');
INSERT INTO `site_menu` VALUES ('3', '1', '2', 'IT', 'IT', '2-3-', '4', '1', '', '2', '203', '0', '0', '0', '20', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:22:37', '2013-03-21 14:43:12');
INSERT INTO `site_menu` VALUES ('4', '1', '2', 'ManageFinances', '理财', '2-4-', '4', '1', '', '2', '203', '0', '0', '0', '20', '2', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:24:22', '2013-03-23 11:03:51');
INSERT INTO `site_menu` VALUES ('5', '1', '3', 'Web', 'Web前端', '2-3-5-', '4', '0', '', '0', '203', '0', '0', '0', '20', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:26:44', '2013-03-21 14:26:44');
INSERT INTO `site_menu` VALUES ('6', '1', '3', 'Language', '编程语言', '2-3-6-', '4', '0', '', '0', '203', '0', '0', '0', '20', '2', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:27:49', '2013-03-21 14:27:49');
INSERT INTO `site_menu` VALUES ('7', '1', '3', 'Database', '数据库', '2-3-7-', '4', '0', '', '2', '203', '0', '0', '0', '20', '3', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:28:14', '2013-03-21 14:28:14');
INSERT INTO `site_menu` VALUES ('8', '1', '0', 'Project', '项目案例', '8-', '1', '1', '', '2', '203', '0', '0', '0', '20', '2', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:30:36', '2013-03-31 13:48:46');
INSERT INTO `site_menu` VALUES ('9', '1', '8', 'EnterpriseSite', '企业网站', '8-9-', '1', '0', '', '2', '203', '0', '0', '0', '20', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:31:14', '2013-03-21 14:43:01');
INSERT INTO `site_menu` VALUES ('10', '1', '8', 'LargeSite', '大型网站', '8-10-', '1', '0', '', '2', '203', '0', '0', '0', '20', '2', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:32:27', '2013-03-21 14:42:54');
INSERT INTO `site_menu` VALUES ('11', '2', '0', 'AboutUs', 'About Us', '11-', '1', '0', '', '2', '3', '0', '0', '0', '20', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 15:39:38', '2013-03-21 15:39:38');

-- ----------------------------
-- Table structure for `site_node`
-- ----------------------------
DROP TABLE IF EXISTS `site_node`;
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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='设置节点表';

-- ----------------------------
-- Records of site_node
-- ----------------------------
INSERT INTO `site_node` VALUES ('1', '0', 'Admin', '总后台管理', '1-', '1', '1', '5', '1', '2012-12-20 21:02:04', '2013-03-27 13:52:44');
INSERT INTO `site_node` VALUES ('2', '34', 'Content', '内容管理', '34-2-', '1', '1', '1', '1', '2012-12-20 21:02:04', '2013-03-27 13:52:59');
INSERT INTO `site_node` VALUES ('3', '23', 'SiteNode', '节点管理', '1-16-23-3-', '2', '1', '1', '1', '2012-12-20 21:02:04', '2013-03-27 13:58:58');
INSERT INTO `site_node` VALUES ('4', '2', 'Web', '站点管理', '34-2-4-', '1', '1', '1', '1', '2012-12-20 21:02:04', '2013-03-27 13:53:04');
INSERT INTO `site_node` VALUES ('5', '32', 'index', '列表', '34-2-4-32-5-', '1', '0', '1', '1', '2012-12-20 21:02:04', '2013-03-27 13:56:44');
INSERT INTO `site_node` VALUES ('6', '32', '', '添加', '34-2-4-32-6-', '1', '0', '3', '1', '2012-12-20 21:02:04', '2013-03-27 14:10:07');
INSERT INTO `site_node` VALUES ('7', '32', 'update', '更新', '34-2-4-32-7-', '1', '0', '5', '1', '2012-12-20 21:02:04', '2012-12-20 21:02:04');
INSERT INTO `site_node` VALUES ('8', '32', 'delete', '删除', '34-2-4-32-8-', '1', '0', '10', '1', '2012-12-20 21:02:04', '2013-03-04 17:29:34');
INSERT INTO `site_node` VALUES ('9', '32', 'recycle', '还原', '34-2-4-32-9-', '1', '0', '9', '1', '2012-12-29 17:25:52', '2013-03-04 17:28:15');
INSERT INTO `site_node` VALUES ('10', '44', 'SiteWeb', '站点管理', '1-16-44-10-', '2', '1', '2', '1', '2012-12-30 21:02:51', '2013-03-27 13:58:05');
INSERT INTO `site_node` VALUES ('11', '10', 'index', '列表', '1-16-44-10-11-', '1', '0', '0', '1', '2013-01-01 21:08:51', '2013-03-27 13:58:13');
INSERT INTO `site_node` VALUES ('12', '32', 'forbid', '禁止', '34-2-4-32-12-', '1', '0', '8', '1', '2013-01-02 12:52:20', '2013-03-04 17:29:47');
INSERT INTO `site_node` VALUES ('13', '32', 'checkPass', '批准', '34-2-4-32-13-', '1', '0', '7', '1', '2013-01-02 12:52:52', '2013-03-04 17:29:18');
INSERT INTO `site_node` VALUES ('14', '32', 'resume', '恢复', '34-2-4-32-14-', '1', '0', '6', '1', '2013-01-02 13:02:19', '2013-03-04 16:55:45');
INSERT INTO `site_node` VALUES ('15', '17', 'ArticleInfo', '文章管理', '34-2-17-15-', '2', '1', '1', '1', '2013-01-03 22:02:04', '2013-03-27 14:08:56');
INSERT INTO `site_node` VALUES ('16', '1', 'Site', '设置管理', '1-16-', '1', '1', '1', '1', '2013-01-21 16:50:50', '2013-03-27 13:57:12');
INSERT INTO `site_node` VALUES ('17', '2', 'Article', '文章管理', '34-2-17-', '1', '1', '3', '1', '2013-01-21 16:53:09', '2013-03-27 14:08:49');
INSERT INTO `site_node` VALUES ('18', '2', 'Picture', '图片管理', '34-2-18-', '1', '1', '4', '1', '2013-01-23 21:37:46', '2013-03-27 14:09:03');
INSERT INTO `site_node` VALUES ('19', '18', 'ArticleAlbum', '相册管理', '34-2-18-19-', '2', '1', '1', '1', '2013-01-23 21:39:45', '2013-03-27 14:09:10');
INSERT INTO `site_node` VALUES ('20', '18', 'ArticleAlbumPhoto', '相片管理', '34-2-18-20-', '2', '1', '2', '1', '2013-01-23 21:40:33', '2013-03-27 14:09:17');
INSERT INTO `site_node` VALUES ('21', '16', 'Base', '数据管理', '1-16-21-', '1', '1', '3', '1', '2013-01-27 13:17:31', '2013-03-27 13:58:48');
INSERT INTO `site_node` VALUES ('22', '21', 'BaseLang', '语言管理', '1-16-21-22-', '2', '1', '1', '1', '2013-01-27 13:24:12', '2013-03-27 13:58:53');
INSERT INTO `site_node` VALUES ('23', '16', 'Competence', '权限管理', '1-16-23-', '1', '1', '2', '1', '2013-01-29 16:46:00', '2013-03-27 13:58:42');
INSERT INTO `site_node` VALUES ('24', '23', 'SiteRole', '角色管理', '1-16-23-24-', '2', '1', '2', '1', '2013-01-29 16:47:36', '2013-03-27 13:59:04');
INSERT INTO `site_node` VALUES ('25', '23', 'SiteRoleUser', '角色用户管理', '1-16-23-25-', '2', '0', '3', '1', '2013-01-29 16:51:59', '2013-03-27 13:59:10');
INSERT INTO `site_node` VALUES ('26', '23', 'SiteAccess', '访问管理', '1-16-23-26-', '2', '0', '4', '1', '2013-01-29 16:55:56', '2013-03-27 13:59:17');
INSERT INTO `site_node` VALUES ('27', '44', 'SiteConfig', '配置管理', '1-16-44-27-', '2', '1', '1', '1', '2013-01-30 21:21:28', '2013-03-27 13:57:58');
INSERT INTO `site_node` VALUES ('28', '0', 'AdminUser', '用户管理', '28-', '1', '1', '4', '1', '2013-02-04 17:00:51', '2013-03-27 13:52:37');
INSERT INTO `site_node` VALUES ('29', '45', 'UserBase', '基础管理', '28-65-45-29-', '2', '1', '1', '1', '2013-02-04 17:05:09', '2013-03-27 14:03:02');
INSERT INTO `site_node` VALUES ('30', '69', 'Index', '后台管理', '34-2-69-30-', '1', '1', '1', '1', '2013-02-04 17:05:09', '2013-03-27 15:01:54');
INSERT INTO `site_node` VALUES ('31', '30', 'Index', '列表', '34-2-69-30-31-', '1', '0', '1', '1', '2013-02-04 17:05:09', '2013-03-27 15:02:08');
INSERT INTO `site_node` VALUES ('32', '4', 'SiteMenu', '菜单管理', '34-2-4-32-', '2', '1', '2', '1', '2013-02-22 15:48:06', '2013-03-27 13:53:58');
INSERT INTO `site_node` VALUES ('33', '30', 'leftMenu', '左侧导航', '34-2-69-30-33-', '1', '0', '2', '1', '2013-03-02 19:07:22', '2013-03-27 15:02:17');
INSERT INTO `site_node` VALUES ('34', '0', 'AdminBase', '基础管理', '34-', '1', '1', '1', '1', '2013-03-02 19:18:14', '2013-03-27 13:51:59');
INSERT INTO `site_node` VALUES ('35', '0', 'AdminBlog', '博文管理', '35-', '1', '1', '3', '1', '2013-03-02 19:21:26', '2013-03-27 14:03:13');
INSERT INTO `site_node` VALUES ('36', '35', 'BlogContent', '内容管理', '35-36-', '1', '1', '1', '1', '2013-03-02 19:25:23', '2013-03-27 14:03:18');
INSERT INTO `site_node` VALUES ('37', '36', 'BlogPicture', '图片管理', '35-36-37-', '1', '1', '2', '1', '2013-03-02 19:29:59', '2013-03-27 14:03:41');
INSERT INTO `site_node` VALUES ('38', '37', 'BlogAlbum', '相册管理', '35-36-37-38-', '2', '1', '1', '1', '2013-03-02 19:33:03', '2013-03-27 14:03:47');
INSERT INTO `site_node` VALUES ('39', '37', 'BlogAlbumPhoto', '相片管理', '35-36-37-39-', '2', '1', '2', '1', '2013-03-02 19:35:40', '2013-03-27 14:03:53');
INSERT INTO `site_node` VALUES ('40', '36', 'Blog', '博文管理', '35-36-40-', '1', '1', '1', '1', '2013-03-02 19:39:20', '2013-03-27 14:03:23');
INSERT INTO `site_node` VALUES ('41', '40', 'BlogInfo', '博文管理', '35-36-40-41-', '2', '1', '1', '1', '2013-03-02 19:40:14', '2013-03-27 14:03:28');
INSERT INTO `site_node` VALUES ('42', '46', 'ProductContent', '内容管理', '46-42-', '2', '1', '1', '1', '2013-03-02 19:41:58', '2013-03-27 14:04:22');
INSERT INTO `site_node` VALUES ('43', '40', 'BlogTag', '标签管理', '35-36-40-43-', '2', '1', '2', '1', '2013-03-02 19:43:06', '2013-03-27 14:03:35');
INSERT INTO `site_node` VALUES ('44', '16', 'SiteBase', '基础管理', '1-16-44-', '1', '1', '1', '1', '2013-03-03 13:31:44', '2013-03-27 13:57:38');
INSERT INTO `site_node` VALUES ('45', '65', 'User', '用户管理', '28-65-45-', '1', '1', '1', '1', '2013-03-03 16:12:26', '2013-03-27 14:02:41');
INSERT INTO `site_node` VALUES ('46', '0', 'AdminProduct', '产品管理', '46-', '1', '1', '2', '1', '2013-03-03 18:07:12', '2013-03-27 14:04:18');
INSERT INTO `site_node` VALUES ('47', '32', 'add', '新增', '34-2-4-32-47-', '1', '0', '2', '1', '2013-03-04 16:49:02', '2013-03-27 14:09:58');
INSERT INTO `site_node` VALUES ('48', '32', 'edit', '修改', '34-2-4-32-48-', '1', '0', '4', '1', '2013-03-04 16:49:42', '2013-03-27 14:10:36');
INSERT INTO `site_node` VALUES ('49', '34', 'AdminAd', '广告管理', '34-49-', '1', '1', '2', '1', '2013-03-08 21:16:01', '2013-03-27 14:05:08');
INSERT INTO `site_node` VALUES ('50', '49', 'Ad', '广告管理', '34-49-50-', '1', '1', '1', '1', '2013-03-08 21:17:14', '2013-03-27 14:56:17');
INSERT INTO `site_node` VALUES ('51', '50', 'AdInfo', '广告管理', '34-49-50-51-', '2', '1', '2', '1', '2013-03-08 21:19:02', '2013-03-27 14:05:26');
INSERT INTO `site_node` VALUES ('52', '50', 'AdPosition', '广告位管理', '34-49-50-52-', '2', '1', '1', '1', '2013-03-08 21:19:49', '2013-03-27 14:05:18');
INSERT INTO `site_node` VALUES ('53', '50', 'AdSchedule', '排期管理', '34-49-50-53-', '2', '1', '3', '1', '2013-03-08 21:20:26', '2013-03-27 14:05:33');
INSERT INTO `site_node` VALUES ('54', '55', 'AdFunction', '方法管理', '34-49-55-54-', '2', '1', '1', '1', '2013-03-08 21:21:11', '2013-03-27 14:05:46');
INSERT INTO `site_node` VALUES ('55', '49', 'AdSite', '广告配置', '34-49-55-', '1', '1', '2', '1', '2013-03-09 19:11:17', '2013-03-27 14:05:39');
INSERT INTO `site_node` VALUES ('56', '4', 'SiteWeb', '站点设置', '34-2-4-56-', '2', '1', '1', '1', '2013-03-12 18:01:26', '2013-03-27 13:53:11');
INSERT INTO `site_node` VALUES ('57', '2', 'Plate', '面板管理', '34-2-57-', '1', '1', '2', '1', '2013-03-24 14:30:17', '2013-03-27 14:07:56');
INSERT INTO `site_node` VALUES ('58', '57', 'SitePlateGroup', '面板分组管理', '34-2-57-58-', '2', '1', '1', '1', '2013-03-24 14:32:44', '2013-03-27 14:08:13');
INSERT INTO `site_node` VALUES ('59', '57', 'SitePlate', '面板管理', '34-2-57-59-', '2', '1', '2', '1', '2013-03-24 14:33:09', '2013-03-27 14:08:20');
INSERT INTO `site_node` VALUES ('60', '57', 'SitePlateContent', '面板内容管理', '34-2-57-60-', '2', '0', '3', '1', '2013-03-24 14:33:34', '2013-03-27 14:08:26');
INSERT INTO `site_node` VALUES ('61', '42', 'Product', '商品管理', '46-42-61-', '1', '1', '1', '1', '2013-03-27 13:32:47', '2013-03-27 14:04:27');
INSERT INTO `site_node` VALUES ('62', '42', 'ProductPicture', '图片管理', '46-42-62-', '1', '1', '2', '1', '2013-03-27 13:36:25', '2013-03-27 14:04:33');
INSERT INTO `site_node` VALUES ('63', '61', 'ProductGoods', '商品管理', '46-42-61-63-', '2', '1', '1', '1', '2013-03-27 13:37:20', '2013-03-27 14:04:45');
INSERT INTO `site_node` VALUES ('64', '70', 'ProductChannel', '渠道管理', '46-42-70-64-', '2', '1', '1', '1', '2013-03-27 13:39:10', '2013-03-27 15:17:27');
INSERT INTO `site_node` VALUES ('65', '28', 'Users', '基础管理', '28-65-', '1', '1', '1', '1', '2013-03-27 14:01:06', '2013-03-27 14:01:06');
INSERT INTO `site_node` VALUES ('66', '62', 'ProductAlbum', '相册管理', '46-42-62-66-', '2', '1', '1', '1', '2013-03-27 14:24:21', '2013-03-27 14:24:21');
INSERT INTO `site_node` VALUES ('67', '62', 'ProductAlbumPhoto', '相片管理', '46-42-62-67-', '2', '1', '2', '1', '2013-03-27 14:32:41', '2013-03-27 14:32:41');
INSERT INTO `site_node` VALUES ('68', '70', 'ProductDescriptionCategory', '描述分类管理', '46-42-70-68-', '2', '1', '2', '1', '2013-03-27 14:52:52', '2013-03-27 15:03:34');
INSERT INTO `site_node` VALUES ('69', '2', 'WebSite', '站点配置', '34-2-69-', '1', '1', '5', '1', '2013-03-27 14:57:36', '2013-03-27 14:57:36');
INSERT INTO `site_node` VALUES ('70', '42', 'ProductSite', '商品配置', '46-42-70-', '1', '1', '3', '1', '2013-03-27 15:02:58', '2013-03-27 15:02:58');

-- ----------------------------
-- Table structure for `site_plate`
-- ----------------------------
DROP TABLE IF EXISTS `site_plate`;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='面板管理';

-- ----------------------------
-- Records of site_plate
-- ----------------------------
INSERT INTO `site_plate` VALUES ('1', '1', '1', '默认面板', '2', 'panel-1，panel-2', '1', '1', '2013-03-24 15:51:46', '2013-04-02 22:01:10');
INSERT INTO `site_plate` VALUES ('2', '1', '2', '默认面板', '3', '', '0', '1', '2013-03-24 15:56:22', '2013-03-24 15:56:22');
INSERT INTO `site_plate` VALUES ('3', '1', '1', '广告', '1', '', '2', '1', '2013-03-25 14:45:03', '2013-03-25 14:45:03');

-- ----------------------------
-- Table structure for `site_plate_content`
-- ----------------------------
DROP TABLE IF EXISTS `site_plate_content`;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='面板内容管理';

-- ----------------------------
-- Records of site_plate_content
-- ----------------------------
INSERT INTO `site_plate_content` VALUES ('1', '1', '1', '公司简介', '1', '3', '1', '1', '3', '', '0', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-24 20:41:15', '2013-03-25 15:05:39');
INSERT INTO `site_plate_content` VALUES ('2', '1', '1', '关于我们', '2', '1', '1', '1', '19', '', '2', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-24 20:42:09', '2013-03-31 14:49:20');
INSERT INTO `site_plate_content` VALUES ('3', '1', '3', '广告', '1', '3', '0', 'logo', '3', '', '0', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-25 14:45:20', '2013-03-25 14:45:20');
INSERT INTO `site_plate_content` VALUES ('4', '1', '1', '项目案例', '2', '2', '1', '8', '3', '', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-25 15:06:14', '2013-03-25 15:06:14');

-- ----------------------------
-- Table structure for `site_plate_group`
-- ----------------------------
DROP TABLE IF EXISTS `site_plate_group`;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='面板分组管理';

-- ----------------------------
-- Records of site_plate_group
-- ----------------------------
INSERT INTO `site_plate_group` VALUES ('1', '1', 'Home_Index_index', '首页面板', '1', '1', '2013-03-24 15:19:22', '2013-03-24 15:19:22');
INSERT INTO `site_plate_group` VALUES ('2', '1', 'Blog_Index_index', '博客首页面板', '2', '1', '2013-03-24 15:19:41', '2013-03-24 15:19:41');

-- ----------------------------
-- Table structure for `site_role`
-- ----------------------------
DROP TABLE IF EXISTS `site_role`;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='设置角色表';

-- ----------------------------
-- Records of site_role
-- ----------------------------
INSERT INTO `site_role` VALUES ('1', '1', '0', '超级管理员', '1', '1', '2013-02-03 16:08:22', '2013-02-03 16:08:22');
INSERT INTO `site_role` VALUES ('2', '1', '0', '管理员', '2', '1', '2013-02-03 16:25:25', '2013-02-03 16:26:06');

-- ----------------------------
-- Table structure for `site_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `site_role_user`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='设置角色关联用户表';

-- ----------------------------
-- Records of site_role_user
-- ----------------------------
INSERT INTO `site_role_user` VALUES ('1', '1', '1', '2', '1', '2013-02-07 14:58:48', '2013-02-07 14:58:48');

-- ----------------------------
-- Table structure for `site_web`
-- ----------------------------
DROP TABLE IF EXISTS `site_web`;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='设置网站信息表';

-- ----------------------------
-- Records of site_web
-- ----------------------------
INSERT INTO `site_web` VALUES ('1', 'zh-cn', 'altilacms', 'altilaCMS网', 'altila,陈强,个人网站,IT,PHP,Jquery,JS', 'altila(陈强)个人网站,记录关于IT中PHP、JS、Jquer等技术方面咨询', 'default', '沪ICP备05033127号', null, '1', '1', '2012-12-11 13:58:09', '2013-03-19 17:05:08');
INSERT INTO `site_web` VALUES ('2', 'en-us', 'altilacms', 'altilaCMSWeb', 'altila', 'altila', 'default', '', '', '2', '1', '2012-12-11 13:58:09', '2013-03-19 16:34:16');
INSERT INTO `site_web` VALUES ('3', 'en-us', 'altila', 'Altila Web', '', '', 'default', '', null, '0', '1', '2013-01-01 11:29:26', '2013-01-04 16:21:12');
INSERT INTO `site_web` VALUES ('4', 'zh-cn', 'altila', 'Altila网', '', '', 'default', '', null, '0', '1', '2013-01-04 16:20:42', '2013-01-04 16:21:51');
INSERT INTO `site_web` VALUES ('5', 'zh-cn', 'zhuoao', 'aaaa', '', '', 'default', '', null, '0', '2', '2013-01-04 16:22:27', '2013-01-04 17:27:41');

-- ----------------------------
-- Table structure for `user_base`
-- ----------------------------
DROP TABLE IF EXISTS `user_base`;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户基础信息表';

-- ----------------------------
-- Records of user_base
-- ----------------------------
INSERT INTO `user_base` VALUES ('1', '1', 'altila', 'e10adc3949ba59abbe56e057f20f883e', '', '', '0', '0', '', '1', '0', '1970-01-01 08:00:00', '1', '', '2012-12-11 14:00:03', '2012-12-11 14:00:06');
INSERT INTO `user_base` VALUES ('2', '1', 'altila1', 'e10adc3949ba59abbe56e057f20f883e', '', '', '0', '0', '', '1', '0', '1970-01-01 08:00:00', '1', '', '2012-12-11 14:00:03', '2012-12-11 14:00:06');

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户扩展信息表';

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', '1', '陈强', '1', '1988-07-25 15:00:00', '281012472', '', 'http://www.altila.com', '2012-12-11 14:01:53', '2012-12-11 14:01:57');
INSERT INTO `user_info` VALUES ('2', '2', '陈强', '1', '1988-07-25 15:00:00', '281012472', '', 'http://www.altila.com', '2012-12-11 14:01:53', '2012-12-11 14:01:57');

-- ----------------------------
-- Table structure for `user_log_stat`
-- ----------------------------
DROP TABLE IF EXISTS `user_log_stat`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户登陆明细表';

-- ----------------------------
-- Records of user_log_stat
-- ----------------------------
INSERT INTO `user_log_stat` VALUES ('1', '1', '1', '127.0.0.1', '2013-02-02 22:39:00', '2013-02-02 22:39:00');
