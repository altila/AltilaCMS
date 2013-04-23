/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50136
Source Host           : localhost:3306
Source Database       : altilaphp

Target Server Type    : MYSQL
Target Server Version : 50136
File Encoding         : 65001

Date: 2013-04-23 15:03:18
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
-- Table structure for `base_area`
-- ----------------------------
DROP TABLE IF EXISTS `base_area`;
CREATE TABLE `base_area` (
  `baid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长,地区编码(行政代码)',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '地区父级ID',
  `crumb` varchar(100) NOT NULL DEFAULT '' COMMENT '面包屑，用横杠分割',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '地区名称',
  `zip_code` varchar(8) DEFAULT '0' COMMENT '邮政编码',
  `call_code` varchar(8) DEFAULT '0' COMMENT '长途区号',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  PRIMARY KEY (`baid`)
) ENGINE=InnoDB AUTO_INCREMENT=820001 DEFAULT CHARSET=utf8 COMMENT='基础地区表';

-- ----------------------------
-- Records of base_area
-- ----------------------------
INSERT INTO `base_area` VALUES ('1', '110000', '110000-1-', '1', '1', '', '2');
INSERT INTO `base_area` VALUES ('110000', '0', '110000-', '北京市', '100000', '010', '1');
INSERT INTO `base_area` VALUES ('110100', '110000', '110000-110100-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('110101', '110100', '110000-110100-110101-', '东城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('110102', '110100', '110000-110100-110102-', '西城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('110103', '110100', '110000-110100-110103-', '崇文区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('110104', '110100', '110000-110100-110104-', '宣武区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('110105', '110100', '110000-110100-110105-', '朝阳区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('110106', '110100', '110000-110100-110106-', '丰台区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('110107', '110100', '110000-110100-110107-', '石景山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('110108', '110100', '110000-110100-110108-', '海淀区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('110109', '110100', '110000-110100-110109-', '门头沟区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('110111', '110100', '110000-110100-110111-', '房山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('110112', '110100', '110000-110100-110112-', '通州区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('110113', '110100', '110000-110100-110113-', '顺义区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('110114', '110100', '110000-110100-110114-', '昌平区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('110115', '110100', '110000-110100-110115-', '大兴区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('110116', '110100', '110000-110100-110116-', '怀柔区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('110117', '110100', '110000-110100-110117-', '平谷区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('110200', '110000', '110000-110200-', '县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('110228', '110200', '110000-110200-110228-', '密云县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('110229', '110200', '110000-110200-110229-', '延庆县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('120000', '0', '120000-', '天津市', '300000', '022', '1');
INSERT INTO `base_area` VALUES ('120100', '120000', '120000-120100-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('120101', '120100', '120000-120100-120101-', '和平区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('120102', '120100', '120000-120100-120102-', '河东区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('120103', '120100', '120000-120100-120103-', '河西区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('120104', '120100', '120000-120100-120104-', '南开区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('120105', '120100', '120000-120100-120105-', '河北区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('120106', '120100', '120000-120100-120106-', '红桥区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('120107', '120100', '120000-120100-120107-', '塘沽区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('120108', '120100', '120000-120100-120108-', '汉沽区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('120109', '120100', '120000-120100-120109-', '大港区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('120110', '120100', '120000-120100-120110-', '东丽区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('120111', '120100', '120000-120100-120111-', '西青区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('120112', '120100', '120000-120100-120112-', '津南区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('120113', '120100', '120000-120100-120113-', '北辰区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('120114', '120100', '120000-120100-120114-', '武清区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('120115', '120100', '120000-120100-120115-', '宝坻区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('120200', '120000', '120000-120200-', '县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('120221', '120200', '120000-120200-120221-', '宁河县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('120223', '120200', '120000-120200-120223-', '静海县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('120225', '120200', '120000-120200-120225-', '蓟　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130000', '0', '130000-', '河北省', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130100', '130000', '130000-130100-', '石家庄市', '050000', '0311', '1');
INSERT INTO `base_area` VALUES ('130101', '130100', '130000-130100-130101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130102', '130100', '130000-130100-130102-', '长安区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130103', '130100', '130000-130100-130103-', '桥东区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130104', '130100', '130000-130100-130104-', '桥西区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130105', '130100', '130000-130100-130105-', '新华区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130107', '130100', '130000-130100-130107-', '井陉矿区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130108', '130100', '130000-130100-130108-', '裕华区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130121', '130100', '130000-130100-130121-', '井陉县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130123', '130100', '130000-130100-130123-', '正定县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130124', '130100', '130000-130100-130124-', '栾城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130125', '130100', '130000-130100-130125-', '行唐县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130126', '130100', '130000-130100-130126-', '灵寿县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130127', '130100', '130000-130100-130127-', '高邑县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130128', '130100', '130000-130100-130128-', '深泽县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130129', '130100', '130000-130100-130129-', '赞皇县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130130', '130100', '130000-130100-130130-', '无极县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130131', '130100', '130000-130100-130131-', '平山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130132', '130100', '130000-130100-130132-', '元氏县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130133', '130100', '130000-130100-130133-', '赵　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130181', '130100', '130000-130100-130181-', '辛集市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130182', '130100', '130000-130100-130182-', '藁城市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130183', '130100', '130000-130100-130183-', '晋州市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130184', '130100', '130000-130100-130184-', '新乐市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130185', '130100', '130000-130100-130185-', '鹿泉市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130200', '130000', '130000-130200-', '唐山市', '063000', '0315', '1');
INSERT INTO `base_area` VALUES ('130201', '130200', '130000-130200-130201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130202', '130200', '130000-130200-130202-', '路南区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130203', '130200', '130000-130200-130203-', '路北区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130204', '130200', '130000-130200-130204-', '古冶区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130205', '130200', '130000-130200-130205-', '开平区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130207', '130200', '130000-130200-130207-', '丰南区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130208', '130200', '130000-130200-130208-', '丰润区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130223', '130200', '130000-130200-130223-', '滦　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130224', '130200', '130000-130200-130224-', '滦南县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130225', '130200', '130000-130200-130225-', '乐亭县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130227', '130200', '130000-130200-130227-', '迁西县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130229', '130200', '130000-130200-130229-', '玉田县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130230', '130200', '130000-130200-130230-', '唐海县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130281', '130200', '130000-130200-130281-', '遵化市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130283', '130200', '130000-130200-130283-', '迁安市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130300', '130000', '130000-130300-', '秦皇岛市', '066000', '0335', '1');
INSERT INTO `base_area` VALUES ('130301', '130300', '130000-130300-130301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130302', '130300', '130000-130300-130302-', '海港区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130303', '130300', '130000-130300-130303-', '山海关区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130304', '130300', '130000-130300-130304-', '北戴河区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130321', '130300', '130000-130300-130321-', '青龙满族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130322', '130300', '130000-130300-130322-', '昌黎县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130323', '130300', '130000-130300-130323-', '抚宁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130324', '130300', '130000-130300-130324-', '卢龙县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130400', '130000', '130000-130400-', '邯郸市', '056000', '0310', '1');
INSERT INTO `base_area` VALUES ('130401', '130400', '130000-130400-130401-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130402', '130400', '130000-130400-130402-', '邯山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130403', '130400', '130000-130400-130403-', '丛台区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130404', '130400', '130000-130400-130404-', '复兴区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130406', '130400', '130000-130400-130406-', '峰峰矿区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130421', '130400', '130000-130400-130421-', '邯郸县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130423', '130400', '130000-130400-130423-', '临漳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130424', '130400', '130000-130400-130424-', '成安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130425', '130400', '130000-130400-130425-', '大名县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130426', '130400', '130000-130400-130426-', '涉　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130427', '130400', '130000-130400-130427-', '磁　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130428', '130400', '130000-130400-130428-', '肥乡县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130429', '130400', '130000-130400-130429-', '永年县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130430', '130400', '130000-130400-130430-', '邱　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130431', '130400', '130000-130400-130431-', '鸡泽县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130432', '130400', '130000-130400-130432-', '广平县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130433', '130400', '130000-130400-130433-', '馆陶县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130434', '130400', '130000-130400-130434-', '魏　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130435', '130400', '130000-130400-130435-', '曲周县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130481', '130400', '130000-130400-130481-', '武安市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130500', '130000', '130000-130500-', '邢台市', '054000', '0319', '1');
INSERT INTO `base_area` VALUES ('130501', '130500', '130000-130500-130501-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130502', '130500', '130000-130500-130502-', '桥东区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130503', '130500', '130000-130500-130503-', '桥西区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130521', '130500', '130000-130500-130521-', '邢台县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130522', '130500', '130000-130500-130522-', '临城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130523', '130500', '130000-130500-130523-', '内丘县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130524', '130500', '130000-130500-130524-', '柏乡县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130525', '130500', '130000-130500-130525-', '隆尧县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130526', '130500', '130000-130500-130526-', '任　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130527', '130500', '130000-130500-130527-', '南和县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130528', '130500', '130000-130500-130528-', '宁晋县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130529', '130500', '130000-130500-130529-', '巨鹿县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130530', '130500', '130000-130500-130530-', '新河县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130531', '130500', '130000-130500-130531-', '广宗县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130532', '130500', '130000-130500-130532-', '平乡县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130533', '130500', '130000-130500-130533-', '威　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130534', '130500', '130000-130500-130534-', '清河县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130535', '130500', '130000-130500-130535-', '临西县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130581', '130500', '130000-130500-130581-', '南宫市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130582', '130500', '130000-130500-130582-', '沙河市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130600', '130000', '130000-130600-', '保定市', '071000', '0312', '1');
INSERT INTO `base_area` VALUES ('130601', '130600', '130000-130600-130601-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130602', '130600', '130000-130600-130602-', '新市区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130603', '130600', '130000-130600-130603-', '北市区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130604', '130600', '130000-130600-130604-', '南市区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130621', '130600', '130000-130600-130621-', '满城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130622', '130600', '130000-130600-130622-', '清苑县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130623', '130600', '130000-130600-130623-', '涞水县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130624', '130600', '130000-130600-130624-', '阜平县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130625', '130600', '130000-130600-130625-', '徐水县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130626', '130600', '130000-130600-130626-', '定兴县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130627', '130600', '130000-130600-130627-', '唐　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130628', '130600', '130000-130600-130628-', '高阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130629', '130600', '130000-130600-130629-', '容城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130630', '130600', '130000-130600-130630-', '涞源县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130631', '130600', '130000-130600-130631-', '望都县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130632', '130600', '130000-130600-130632-', '安新县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130633', '130600', '130000-130600-130633-', '易　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130634', '130600', '130000-130600-130634-', '曲阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130635', '130600', '130000-130600-130635-', '蠡　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130636', '130600', '130000-130600-130636-', '顺平县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130637', '130600', '130000-130600-130637-', '博野县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130638', '130600', '130000-130600-130638-', '雄　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130681', '130600', '130000-130600-130681-', '涿州市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130682', '130600', '130000-130600-130682-', '定州市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130683', '130600', '130000-130600-130683-', '安国市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130684', '130600', '130000-130600-130684-', '高碑店市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130700', '130000', '130000-130700-', '张家口市', '075000', '0313', '1');
INSERT INTO `base_area` VALUES ('130701', '130700', '130000-130700-130701-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130702', '130700', '130000-130700-130702-', '桥东区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130703', '130700', '130000-130700-130703-', '桥西区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130705', '130700', '130000-130700-130705-', '宣化区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130706', '130700', '130000-130700-130706-', '下花园区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130721', '130700', '130000-130700-130721-', '宣化县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130722', '130700', '130000-130700-130722-', '张北县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130723', '130700', '130000-130700-130723-', '康保县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130724', '130700', '130000-130700-130724-', '沽源县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130725', '130700', '130000-130700-130725-', '尚义县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130726', '130700', '130000-130700-130726-', '蔚　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130727', '130700', '130000-130700-130727-', '阳原县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130728', '130700', '130000-130700-130728-', '怀安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130729', '130700', '130000-130700-130729-', '万全县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130730', '130700', '130000-130700-130730-', '怀来县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130731', '130700', '130000-130700-130731-', '涿鹿县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130732', '130700', '130000-130700-130732-', '赤城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130733', '130700', '130000-130700-130733-', '崇礼县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130800', '130000', '130000-130800-', '承德市', '067000', '0314', '1');
INSERT INTO `base_area` VALUES ('130801', '130800', '130000-130800-130801-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130802', '130800', '130000-130800-130802-', '双桥区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130803', '130800', '130000-130800-130803-', '双滦区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130804', '130800', '130000-130800-130804-', '鹰手营子矿区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130821', '130800', '130000-130800-130821-', '承德县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130822', '130800', '130000-130800-130822-', '兴隆县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130823', '130800', '130000-130800-130823-', '平泉县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130824', '130800', '130000-130800-130824-', '滦平县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130825', '130800', '130000-130800-130825-', '隆化县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130826', '130800', '130000-130800-130826-', '丰宁满族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130827', '130800', '130000-130800-130827-', '宽城满族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130828', '130800', '130000-130800-130828-', '围场满族蒙古族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130900', '130000', '130000-130900-', '沧州市', '031000', '0317', '1');
INSERT INTO `base_area` VALUES ('130901', '130900', '130000-130900-130901-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130902', '130900', '130000-130900-130902-', '新华区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130903', '130900', '130000-130900-130903-', '运河区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130921', '130900', '130000-130900-130921-', '沧　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130922', '130900', '130000-130900-130922-', '青　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130923', '130900', '130000-130900-130923-', '东光县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130924', '130900', '130000-130900-130924-', '海兴县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130925', '130900', '130000-130900-130925-', '盐山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130926', '130900', '130000-130900-130926-', '肃宁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130927', '130900', '130000-130900-130927-', '南皮县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130928', '130900', '130000-130900-130928-', '吴桥县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130929', '130900', '130000-130900-130929-', '献　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130930', '130900', '130000-130900-130930-', '孟村回族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130981', '130900', '130000-130900-130981-', '泊头市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130982', '130900', '130000-130900-130982-', '任丘市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130983', '130900', '130000-130900-130983-', '黄骅市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('130984', '130900', '130000-130900-130984-', '河间市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('131000', '130000', '130000-131000-', '廊坊市', '065000', '0316', '1');
INSERT INTO `base_area` VALUES ('131001', '131000', '130000-131000-131001-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('131002', '131000', '130000-131000-131002-', '安次区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('131003', '131000', '130000-131000-131003-', '广阳区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('131022', '131000', '130000-131000-131022-', '固安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('131023', '131000', '130000-131000-131023-', '永清县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('131024', '131000', '130000-131000-131024-', '香河县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('131025', '131000', '130000-131000-131025-', '大城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('131026', '131000', '130000-131000-131026-', '文安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('131028', '131000', '130000-131000-131028-', '大厂回族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('131081', '131000', '130000-131000-131081-', '霸州市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('131082', '131000', '130000-131000-131082-', '三河市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('131100', '130000', '130000-131100-', '衡水市', '053000', '0318', '1');
INSERT INTO `base_area` VALUES ('131101', '131100', '130000-131100-131101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('131102', '131100', '130000-131100-131102-', '桃城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('131121', '131100', '130000-131100-131121-', '枣强县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('131122', '131100', '130000-131100-131122-', '武邑县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('131123', '131100', '130000-131100-131123-', '武强县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('131124', '131100', '130000-131100-131124-', '饶阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('131125', '131100', '130000-131100-131125-', '安平县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('131126', '131100', '130000-131100-131126-', '故城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('131127', '131100', '130000-131100-131127-', '景　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('131128', '131100', '130000-131100-131128-', '阜城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('131181', '131100', '130000-131100-131181-', '冀州市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('131182', '131100', '130000-131100-131182-', '深州市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140000', '0', '140000-', '山西省', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140100', '140000', '140000-140100-', '太原市', '030000', '0351', '1');
INSERT INTO `base_area` VALUES ('140101', '140100', '140000-140100-140101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140105', '140100', '140000-140100-140105-', '小店区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140106', '140100', '140000-140100-140106-', '迎泽区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140107', '140100', '140000-140100-140107-', '杏花岭区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140108', '140100', '140000-140100-140108-', '尖草坪区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140109', '140100', '140000-140100-140109-', '万柏林区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140110', '140100', '140000-140100-140110-', '晋源区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140121', '140100', '140000-140100-140121-', '清徐县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140122', '140100', '140000-140100-140122-', '阳曲县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140123', '140100', '140000-140100-140123-', '娄烦县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140181', '140100', '140000-140100-140181-', '古交市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140200', '140000', '140000-140200-', '大同市', '037000', '0352', '1');
INSERT INTO `base_area` VALUES ('140201', '140200', '140000-140200-140201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140202', '140200', '140000-140200-140202-', '城　区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140203', '140200', '140000-140200-140203-', '矿　区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140211', '140200', '140000-140200-140211-', '南郊区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140212', '140200', '140000-140200-140212-', '新荣区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140221', '140200', '140000-140200-140221-', '阳高县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140222', '140200', '140000-140200-140222-', '天镇县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140223', '140200', '140000-140200-140223-', '广灵县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140224', '140200', '140000-140200-140224-', '灵丘县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140225', '140200', '140000-140200-140225-', '浑源县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140226', '140200', '140000-140200-140226-', '左云县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140227', '140200', '140000-140200-140227-', '大同县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140300', '140000', '140000-140300-', '阳泉市', '045000', '0353', '1');
INSERT INTO `base_area` VALUES ('140301', '140300', '140000-140300-140301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140302', '140300', '140000-140300-140302-', '城　区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140303', '140300', '140000-140300-140303-', '矿　区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140311', '140300', '140000-140300-140311-', '郊　区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140321', '140300', '140000-140300-140321-', '平定县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140322', '140300', '140000-140300-140322-', '盂　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140400', '140000', '140000-140400-', '长治市', '046000', '0355', '1');
INSERT INTO `base_area` VALUES ('140401', '140400', '140000-140400-140401-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140402', '140400', '140000-140400-140402-', '城　区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140411', '140400', '140000-140400-140411-', '郊　区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140421', '140400', '140000-140400-140421-', '长治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140423', '140400', '140000-140400-140423-', '襄垣县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140424', '140400', '140000-140400-140424-', '屯留县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140425', '140400', '140000-140400-140425-', '平顺县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140426', '140400', '140000-140400-140426-', '黎城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140427', '140400', '140000-140400-140427-', '壶关县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140428', '140400', '140000-140400-140428-', '长子县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140429', '140400', '140000-140400-140429-', '武乡县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140430', '140400', '140000-140400-140430-', '沁　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140431', '140400', '140000-140400-140431-', '沁源县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140481', '140400', '140000-140400-140481-', '潞城市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140500', '140000', '140000-140500-', '晋城市', '048000', '0356', '1');
INSERT INTO `base_area` VALUES ('140501', '140500', '140000-140500-140501-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140502', '140500', '140000-140500-140502-', '城　区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140521', '140500', '140000-140500-140521-', '沁水县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140522', '140500', '140000-140500-140522-', '阳城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140524', '140500', '140000-140500-140524-', '陵川县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140525', '140500', '140000-140500-140525-', '泽州县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140581', '140500', '140000-140500-140581-', '高平市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140600', '140000', '140000-140600-', '朔州市', '036000', '0349', '1');
INSERT INTO `base_area` VALUES ('140601', '140600', '140000-140600-140601-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140602', '140600', '140000-140600-140602-', '朔城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140603', '140600', '140000-140600-140603-', '平鲁区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140621', '140600', '140000-140600-140621-', '山阴县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140622', '140600', '140000-140600-140622-', '应　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140623', '140600', '140000-140600-140623-', '右玉县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140624', '140600', '140000-140600-140624-', '怀仁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140700', '140000', '140000-140700-', '晋中市', '030600', '0354', '1');
INSERT INTO `base_area` VALUES ('140701', '140700', '140000-140700-140701-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140702', '140700', '140000-140700-140702-', '榆次区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140721', '140700', '140000-140700-140721-', '榆社县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140722', '140700', '140000-140700-140722-', '左权县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140723', '140700', '140000-140700-140723-', '和顺县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140724', '140700', '140000-140700-140724-', '昔阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140725', '140700', '140000-140700-140725-', '寿阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140726', '140700', '140000-140700-140726-', '太谷县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140727', '140700', '140000-140700-140727-', '祁　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140728', '140700', '140000-140700-140728-', '平遥县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140729', '140700', '140000-140700-140729-', '灵石县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140781', '140700', '140000-140700-140781-', '介休市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140800', '140000', '140000-140800-', '运城市', '044000', '0359', '1');
INSERT INTO `base_area` VALUES ('140801', '140800', '140000-140800-140801-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140802', '140800', '140000-140800-140802-', '盐湖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140821', '140800', '140000-140800-140821-', '临猗县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140822', '140800', '140000-140800-140822-', '万荣县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140823', '140800', '140000-140800-140823-', '闻喜县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140824', '140800', '140000-140800-140824-', '稷山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140825', '140800', '140000-140800-140825-', '新绛县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140826', '140800', '140000-140800-140826-', '绛　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140827', '140800', '140000-140800-140827-', '垣曲县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140828', '140800', '140000-140800-140828-', '夏　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140829', '140800', '140000-140800-140829-', '平陆县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140830', '140800', '140000-140800-140830-', '芮城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140881', '140800', '140000-140800-140881-', '永济市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140882', '140800', '140000-140800-140882-', '河津市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140900', '140000', '140000-140900-', '忻州市', '034000', '0350', '1');
INSERT INTO `base_area` VALUES ('140901', '140900', '140000-140900-140901-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140902', '140900', '140000-140900-140902-', '忻府区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140921', '140900', '140000-140900-140921-', '定襄县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140922', '140900', '140000-140900-140922-', '五台县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140923', '140900', '140000-140900-140923-', '代　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140924', '140900', '140000-140900-140924-', '繁峙县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140925', '140900', '140000-140900-140925-', '宁武县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140926', '140900', '140000-140900-140926-', '静乐县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140927', '140900', '140000-140900-140927-', '神池县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140928', '140900', '140000-140900-140928-', '五寨县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140929', '140900', '140000-140900-140929-', '岢岚县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140930', '140900', '140000-140900-140930-', '河曲县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140931', '140900', '140000-140900-140931-', '保德县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140932', '140900', '140000-140900-140932-', '偏关县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('140981', '140900', '140000-140900-140981-', '原平市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('141000', '140000', '140000-141000-', '临汾市', '041000', '0357', '1');
INSERT INTO `base_area` VALUES ('141001', '141000', '140000-141000-141001-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('141002', '141000', '140000-141000-141002-', '尧都区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('141021', '141000', '140000-141000-141021-', '曲沃县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('141022', '141000', '140000-141000-141022-', '翼城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('141023', '141000', '140000-141000-141023-', '襄汾县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('141024', '141000', '140000-141000-141024-', '洪洞县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('141025', '141000', '140000-141000-141025-', '古　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('141026', '141000', '140000-141000-141026-', '安泽县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('141027', '141000', '140000-141000-141027-', '浮山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('141028', '141000', '140000-141000-141028-', '吉　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('141029', '141000', '140000-141000-141029-', '乡宁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('141030', '141000', '140000-141000-141030-', '大宁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('141031', '141000', '140000-141000-141031-', '隰　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('141032', '141000', '140000-141000-141032-', '永和县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('141033', '141000', '140000-141000-141033-', '蒲　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('141034', '141000', '140000-141000-141034-', '汾西县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('141081', '141000', '140000-141000-141081-', '侯马市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('141082', '141000', '140000-141000-141082-', '霍州市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('141100', '140000', '140000-141100-', '吕梁市', '033000', '0358', '1');
INSERT INTO `base_area` VALUES ('141101', '141100', '140000-141100-141101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('141102', '141100', '140000-141100-141102-', '离石区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('141121', '141100', '140000-141100-141121-', '文水县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('141122', '141100', '140000-141100-141122-', '交城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('141123', '141100', '140000-141100-141123-', '兴　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('141124', '141100', '140000-141100-141124-', '临　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('141125', '141100', '140000-141100-141125-', '柳林县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('141126', '141100', '140000-141100-141126-', '石楼县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('141127', '141100', '140000-141100-141127-', '岚　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('141128', '141100', '140000-141100-141128-', '方山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('141129', '141100', '140000-141100-141129-', '中阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('141130', '141100', '140000-141100-141130-', '交口县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('141181', '141100', '140000-141100-141181-', '孝义市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('141182', '141100', '140000-141100-141182-', '汾阳市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150000', '0', '150000-', '内蒙古自治区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150100', '150000', '150000-150100-', '呼和浩特市', '010000', '0471', '1');
INSERT INTO `base_area` VALUES ('150101', '150100', '150000-150100-150101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150102', '150100', '150000-150100-150102-', '新城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150103', '150100', '150000-150100-150103-', '回民区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150104', '150100', '150000-150100-150104-', '玉泉区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150105', '150100', '150000-150100-150105-', '赛罕区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150121', '150100', '150000-150100-150121-', '土默特左旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150122', '150100', '150000-150100-150122-', '托克托县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150123', '150100', '150000-150100-150123-', '和林格尔县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150124', '150100', '150000-150100-150124-', '清水河县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150125', '150100', '150000-150100-150125-', '武川县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150200', '150000', '150000-150200-', '包头市', '014000', '0472', '1');
INSERT INTO `base_area` VALUES ('150201', '150200', '150000-150200-150201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150202', '150200', '150000-150200-150202-', '东河区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150203', '150200', '150000-150200-150203-', '昆都仑区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150204', '150200', '150000-150200-150204-', '青山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150205', '150200', '150000-150200-150205-', '石拐区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150206', '150200', '150000-150200-150206-', '白云矿区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150207', '150200', '150000-150200-150207-', '九原区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150221', '150200', '150000-150200-150221-', '土默特右旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150222', '150200', '150000-150200-150222-', '固阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150223', '150200', '150000-150200-150223-', '达尔罕茂明安联合旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150300', '150000', '150000-150300-', '乌海市', '016000', '0473', '1');
INSERT INTO `base_area` VALUES ('150301', '150300', '150000-150300-150301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150302', '150300', '150000-150300-150302-', '海勃湾区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150303', '150300', '150000-150300-150303-', '海南区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150304', '150300', '150000-150300-150304-', '乌达区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150400', '150000', '150000-150400-', '赤峰市', '024000', '0476', '1');
INSERT INTO `base_area` VALUES ('150401', '150400', '150000-150400-150401-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150402', '150400', '150000-150400-150402-', '红山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150403', '150400', '150000-150400-150403-', '元宝山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150404', '150400', '150000-150400-150404-', '松山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150421', '150400', '150000-150400-150421-', '阿鲁科尔沁旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150422', '150400', '150000-150400-150422-', '巴林左旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150423', '150400', '150000-150400-150423-', '巴林右旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150424', '150400', '150000-150400-150424-', '林西县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150425', '150400', '150000-150400-150425-', '克什克腾旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150426', '150400', '150000-150400-150426-', '翁牛特旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150428', '150400', '150000-150400-150428-', '喀喇沁旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150429', '150400', '150000-150400-150429-', '宁城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150430', '150400', '150000-150400-150430-', '敖汉旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150500', '150000', '150000-150500-', '通辽市', '028000', '0475', '1');
INSERT INTO `base_area` VALUES ('150501', '150500', '150000-150500-150501-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150502', '150500', '150000-150500-150502-', '科尔沁区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150521', '150500', '150000-150500-150521-', '科尔沁左翼中旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150522', '150500', '150000-150500-150522-', '科尔沁左翼后旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150523', '150500', '150000-150500-150523-', '开鲁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150524', '150500', '150000-150500-150524-', '库伦旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150525', '150500', '150000-150500-150525-', '奈曼旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150526', '150500', '150000-150500-150526-', '扎鲁特旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150581', '150500', '150000-150500-150581-', '霍林郭勒市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150600', '150000', '150000-150600-', '鄂尔多斯市', '017000', '0477', '1');
INSERT INTO `base_area` VALUES ('150602', '150600', '150000-150600-150602-', '东胜区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150621', '150600', '150000-150600-150621-', '达拉特旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150622', '150600', '150000-150600-150622-', '准格尔旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150623', '150600', '150000-150600-150623-', '鄂托克前旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150624', '150600', '150000-150600-150624-', '鄂托克旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150625', '150600', '150000-150600-150625-', '杭锦旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150626', '150600', '150000-150600-150626-', '乌审旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150627', '150600', '150000-150600-150627-', '伊金霍洛旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150700', '150000', '150000-150700-', '呼伦贝尔市', '021000', '0470', '1');
INSERT INTO `base_area` VALUES ('150701', '150700', '150000-150700-150701-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150702', '150700', '150000-150700-150702-', '海拉尔区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150721', '150700', '150000-150700-150721-', '阿荣旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150722', '150700', '150000-150700-150722-', '莫力达瓦达斡尔族自治旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150723', '150700', '150000-150700-150723-', '鄂伦春自治旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150724', '150700', '150000-150700-150724-', '鄂温克族自治旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150725', '150700', '150000-150700-150725-', '陈巴尔虎旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150726', '150700', '150000-150700-150726-', '新巴尔虎左旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150727', '150700', '150000-150700-150727-', '新巴尔虎右旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150781', '150700', '150000-150700-150781-', '满洲里市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150782', '150700', '150000-150700-150782-', '牙克石市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150783', '150700', '150000-150700-150783-', '扎兰屯市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150784', '150700', '150000-150700-150784-', '额尔古纳市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150785', '150700', '150000-150700-150785-', '根河市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150800', '150000', '150000-150800-', '巴彦淖尔市', '015000', '0478', '1');
INSERT INTO `base_area` VALUES ('150801', '150800', '150000-150800-150801-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150802', '150800', '150000-150800-150802-', '临河区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150821', '150800', '150000-150800-150821-', '五原县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150822', '150800', '150000-150800-150822-', '磴口县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150823', '150800', '150000-150800-150823-', '乌拉特前旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150824', '150800', '150000-150800-150824-', '乌拉特中旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150825', '150800', '150000-150800-150825-', '乌拉特后旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150826', '150800', '150000-150800-150826-', '杭锦后旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150900', '150000', '150000-150900-', '乌兰察布市', '012000', '0474', '1');
INSERT INTO `base_area` VALUES ('150901', '150900', '150000-150900-150901-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150902', '150900', '150000-150900-150902-', '集宁区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150921', '150900', '150000-150900-150921-', '卓资县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150922', '150900', '150000-150900-150922-', '化德县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150923', '150900', '150000-150900-150923-', '商都县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150924', '150900', '150000-150900-150924-', '兴和县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150925', '150900', '150000-150900-150925-', '凉城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150926', '150900', '150000-150900-150926-', '察哈尔右翼前旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150927', '150900', '150000-150900-150927-', '察哈尔右翼中旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150928', '150900', '150000-150900-150928-', '察哈尔右翼后旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150929', '150900', '150000-150900-150929-', '四子王旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('150981', '150900', '150000-150900-150981-', '丰镇市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('152200', '150000', '150000-152200-', '兴安盟', '137400', '0482', '1');
INSERT INTO `base_area` VALUES ('152201', '152200', '150000-152200-152201-', '乌兰浩特市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('152202', '152200', '150000-152200-152202-', '阿尔山市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('152221', '152200', '150000-152200-152221-', '科尔沁右翼前旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('152222', '152200', '150000-152200-152222-', '科尔沁右翼中旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('152223', '152200', '150000-152200-152223-', '扎赉特旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('152224', '152200', '150000-152200-152224-', '突泉县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('152500', '150000', '150000-152500-', '锡林郭勒盟', '026000', '0479', '1');
INSERT INTO `base_area` VALUES ('152501', '152500', '150000-152500-152501-', '二连浩特市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('152502', '152500', '150000-152500-152502-', '锡林浩特市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('152522', '152500', '150000-152500-152522-', '阿巴嘎旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('152523', '152500', '150000-152500-152523-', '苏尼特左旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('152524', '152500', '150000-152500-152524-', '苏尼特右旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('152525', '152500', '150000-152500-152525-', '东乌珠穆沁旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('152526', '152500', '150000-152500-152526-', '西乌珠穆沁旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('152527', '152500', '150000-152500-152527-', '太仆寺旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('152528', '152500', '150000-152500-152528-', '镶黄旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('152529', '152500', '150000-152500-152529-', '正镶白旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('152530', '152500', '150000-152500-152530-', '正蓝旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('152531', '152500', '150000-152500-152531-', '多伦县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('152900', '150000', '150000-152900-', '阿拉善盟', '735000', '0483', '1');
INSERT INTO `base_area` VALUES ('152921', '152900', '150000-152900-152921-', '阿拉善左旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('152922', '152900', '150000-152900-152922-', '阿拉善右旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('152923', '152900', '150000-152900-152923-', '额济纳旗', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210000', '0', '210000-', '辽宁省', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210100', '210000', '210000-210100-', '沈阳市', '110000', '024', '1');
INSERT INTO `base_area` VALUES ('210101', '210100', '210000-210100-210101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210102', '210100', '210000-210100-210102-', '和平区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210103', '210100', '210000-210100-210103-', '沈河区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210104', '210100', '210000-210100-210104-', '大东区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210105', '210100', '210000-210100-210105-', '皇姑区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210106', '210100', '210000-210100-210106-', '铁西区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210111', '210100', '210000-210100-210111-', '苏家屯区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210112', '210100', '210000-210100-210112-', '东陵区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210113', '210100', '210000-210100-210113-', '新城子区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210114', '210100', '210000-210100-210114-', '于洪区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210122', '210100', '210000-210100-210122-', '辽中县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210123', '210100', '210000-210100-210123-', '康平县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210124', '210100', '210000-210100-210124-', '法库县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210181', '210100', '210000-210100-210181-', '新民市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210200', '210000', '210000-210200-', '大连市', '116000', '0411', '1');
INSERT INTO `base_area` VALUES ('210201', '210200', '210000-210200-210201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210202', '210200', '210000-210200-210202-', '中山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210203', '210200', '210000-210200-210203-', '西岗区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210204', '210200', '210000-210200-210204-', '沙河口区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210211', '210200', '210000-210200-210211-', '甘井子区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210212', '210200', '210000-210200-210212-', '旅顺口区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210213', '210200', '210000-210200-210213-', '金州区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210224', '210200', '210000-210200-210224-', '长海县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210281', '210200', '210000-210200-210281-', '瓦房店市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210282', '210200', '210000-210200-210282-', '普兰店市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210283', '210200', '210000-210200-210283-', '庄河市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210300', '210000', '210000-210300-', '鞍山市', '114000', '0412', '1');
INSERT INTO `base_area` VALUES ('210301', '210300', '210000-210300-210301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210302', '210300', '210000-210300-210302-', '铁东区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210303', '210300', '210000-210300-210303-', '铁西区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210304', '210300', '210000-210300-210304-', '立山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210311', '210300', '210000-210300-210311-', '千山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210321', '210300', '210000-210300-210321-', '台安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210323', '210300', '210000-210300-210323-', '岫岩满族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210381', '210300', '210000-210300-210381-', '海城市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210400', '210000', '210000-210400-', '抚顺市', '113000', '0413', '1');
INSERT INTO `base_area` VALUES ('210401', '210400', '210000-210400-210401-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210402', '210400', '210000-210400-210402-', '新抚区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210403', '210400', '210000-210400-210403-', '东洲区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210404', '210400', '210000-210400-210404-', '望花区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210411', '210400', '210000-210400-210411-', '顺城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210421', '210400', '210000-210400-210421-', '抚顺县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210422', '210400', '210000-210400-210422-', '新宾满族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210423', '210400', '210000-210400-210423-', '清原满族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210500', '210000', '210000-210500-', '本溪市', '117000', '0414', '1');
INSERT INTO `base_area` VALUES ('210501', '210500', '210000-210500-210501-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210502', '210500', '210000-210500-210502-', '平山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210503', '210500', '210000-210500-210503-', '溪湖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210504', '210500', '210000-210500-210504-', '明山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210505', '210500', '210000-210500-210505-', '南芬区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210521', '210500', '210000-210500-210521-', '本溪满族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210522', '210500', '210000-210500-210522-', '桓仁满族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210600', '210000', '210000-210600-', '丹东市', '118000', '0415', '1');
INSERT INTO `base_area` VALUES ('210601', '210600', '210000-210600-210601-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210602', '210600', '210000-210600-210602-', '元宝区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210603', '210600', '210000-210600-210603-', '振兴区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210604', '210600', '210000-210600-210604-', '振安区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210624', '210600', '210000-210600-210624-', '宽甸满族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210681', '210600', '210000-210600-210681-', '东港市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210682', '210600', '210000-210600-210682-', '凤城市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210700', '210000', '210000-210700-', '锦州市', '121000', '0416', '1');
INSERT INTO `base_area` VALUES ('210701', '210700', '210000-210700-210701-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210702', '210700', '210000-210700-210702-', '古塔区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210703', '210700', '210000-210700-210703-', '凌河区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210711', '210700', '210000-210700-210711-', '太和区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210726', '210700', '210000-210700-210726-', '黑山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210727', '210700', '210000-210700-210727-', '义　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210781', '210700', '210000-210700-210781-', '凌海市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210782', '210700', '210000-210700-210782-', '北宁市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210800', '210000', '210000-210800-', '营口市', '115000', '0417', '1');
INSERT INTO `base_area` VALUES ('210801', '210800', '210000-210800-210801-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210802', '210800', '210000-210800-210802-', '站前区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210803', '210800', '210000-210800-210803-', '西市区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210804', '210800', '210000-210800-210804-', '鲅鱼圈区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210811', '210800', '210000-210800-210811-', '老边区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210881', '210800', '210000-210800-210881-', '盖州市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210882', '210800', '210000-210800-210882-', '大石桥市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210900', '210000', '210000-210900-', '阜新市', '123000', '0418', '1');
INSERT INTO `base_area` VALUES ('210901', '210900', '210000-210900-210901-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210902', '210900', '210000-210900-210902-', '海州区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210903', '210900', '210000-210900-210903-', '新邱区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210904', '210900', '210000-210900-210904-', '太平区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210905', '210900', '210000-210900-210905-', '清河门区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210911', '210900', '210000-210900-210911-', '细河区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210921', '210900', '210000-210900-210921-', '阜新蒙古族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('210922', '210900', '210000-210900-210922-', '彰武县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211000', '210000', '210000-211000-', '辽阳市', '111000', '0419', '1');
INSERT INTO `base_area` VALUES ('211001', '211000', '210000-211000-211001-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211002', '211000', '210000-211000-211002-', '白塔区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211003', '211000', '210000-211000-211003-', '文圣区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211004', '211000', '210000-211000-211004-', '宏伟区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211005', '211000', '210000-211000-211005-', '弓长岭区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211011', '211000', '210000-211000-211011-', '太子河区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211021', '211000', '210000-211000-211021-', '辽阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211081', '211000', '210000-211000-211081-', '灯塔市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211100', '210000', '210000-211100-', '盘锦市', '124000', '0427', '1');
INSERT INTO `base_area` VALUES ('211101', '211100', '210000-211100-211101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211102', '211100', '210000-211100-211102-', '双台子区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211103', '211100', '210000-211100-211103-', '兴隆台区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211121', '211100', '210000-211100-211121-', '大洼县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211122', '211100', '210000-211100-211122-', '盘山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211200', '210000', '210000-211200-', '铁岭市', '112000', '0410', '1');
INSERT INTO `base_area` VALUES ('211201', '211200', '210000-211200-211201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211202', '211200', '210000-211200-211202-', '银州区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211204', '211200', '210000-211200-211204-', '清河区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211221', '211200', '210000-211200-211221-', '铁岭县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211223', '211200', '210000-211200-211223-', '西丰县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211224', '211200', '210000-211200-211224-', '昌图县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211281', '211200', '210000-211200-211281-', '调兵山市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211282', '211200', '210000-211200-211282-', '开原市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211300', '210000', '210000-211300-', '朝阳市', '122000', '0421', '1');
INSERT INTO `base_area` VALUES ('211301', '211300', '210000-211300-211301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211302', '211300', '210000-211300-211302-', '双塔区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211303', '211300', '210000-211300-211303-', '龙城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211321', '211300', '210000-211300-211321-', '朝阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211322', '211300', '210000-211300-211322-', '建平县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211324', '211300', '210000-211300-211324-', '喀喇沁左翼蒙古族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211381', '211300', '210000-211300-211381-', '北票市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211382', '211300', '210000-211300-211382-', '凌源市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211400', '210000', '210000-211400-', '葫芦岛市', '125000', '0429', '1');
INSERT INTO `base_area` VALUES ('211401', '211400', '210000-211400-211401-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211402', '211400', '210000-211400-211402-', '连山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211403', '211400', '210000-211400-211403-', '龙港区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211404', '211400', '210000-211400-211404-', '南票区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211421', '211400', '210000-211400-211421-', '绥中县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211422', '211400', '210000-211400-211422-', '建昌县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('211481', '211400', '210000-211400-211481-', '兴城市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220000', '0', '220000-', '吉林省', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220100', '220000', '220000-220100-', '长春市', '130000', '0431', '1');
INSERT INTO `base_area` VALUES ('220101', '220100', '220000-220100-220101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220102', '220100', '220000-220100-220102-', '南关区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220103', '220100', '220000-220100-220103-', '宽城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220104', '220100', '220000-220100-220104-', '朝阳区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220105', '220100', '220000-220100-220105-', '二道区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220106', '220100', '220000-220100-220106-', '绿园区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220112', '220100', '220000-220100-220112-', '双阳区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220122', '220100', '220000-220100-220122-', '农安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220181', '220100', '220000-220100-220181-', '九台市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220182', '220100', '220000-220100-220182-', '榆树市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220183', '220100', '220000-220100-220183-', '德惠市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220200', '220000', '220000-220200-', '吉林市', '132000', '0432', '1');
INSERT INTO `base_area` VALUES ('220201', '220200', '220000-220200-220201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220202', '220200', '220000-220200-220202-', '昌邑区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220203', '220200', '220000-220200-220203-', '龙潭区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220204', '220200', '220000-220200-220204-', '船营区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220211', '220200', '220000-220200-220211-', '丰满区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220221', '220200', '220000-220200-220221-', '永吉县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220281', '220200', '220000-220200-220281-', '蛟河市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220282', '220200', '220000-220200-220282-', '桦甸市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220283', '220200', '220000-220200-220283-', '舒兰市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220284', '220200', '220000-220200-220284-', '磐石市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220300', '220000', '220000-220300-', '四平市', '136000', '0434', '1');
INSERT INTO `base_area` VALUES ('220301', '220300', '220000-220300-220301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220302', '220300', '220000-220300-220302-', '铁西区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220303', '220300', '220000-220300-220303-', '铁东区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220322', '220300', '220000-220300-220322-', '梨树县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220323', '220300', '220000-220300-220323-', '伊通满族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220381', '220300', '220000-220300-220381-', '公主岭市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220382', '220300', '220000-220300-220382-', '双辽市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220400', '220000', '220000-220400-', '辽源市', '136200', '0437', '1');
INSERT INTO `base_area` VALUES ('220401', '220400', '220000-220400-220401-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220402', '220400', '220000-220400-220402-', '龙山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220403', '220400', '220000-220400-220403-', '西安区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220421', '220400', '220000-220400-220421-', '东丰县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220422', '220400', '220000-220400-220422-', '东辽县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220500', '220000', '220000-220500-', '通化市', '134000', '0435', '1');
INSERT INTO `base_area` VALUES ('220501', '220500', '220000-220500-220501-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220502', '220500', '220000-220500-220502-', '东昌区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220503', '220500', '220000-220500-220503-', '二道江区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220521', '220500', '220000-220500-220521-', '通化县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220523', '220500', '220000-220500-220523-', '辉南县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220524', '220500', '220000-220500-220524-', '柳河县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220581', '220500', '220000-220500-220581-', '梅河口市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220582', '220500', '220000-220500-220582-', '集安市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220600', '220000', '220000-220600-', '白山市', '134300', '0439', '1');
INSERT INTO `base_area` VALUES ('220601', '220600', '220000-220600-220601-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220602', '220600', '220000-220600-220602-', '八道江区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220621', '220600', '220000-220600-220621-', '抚松县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220622', '220600', '220000-220600-220622-', '靖宇县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220623', '220600', '220000-220600-220623-', '长白朝鲜族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220625', '220600', '220000-220600-220625-', '江源县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220681', '220600', '220000-220600-220681-', '临江市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220700', '220000', '220000-220700-', '松原市', '138000', '0438', '1');
INSERT INTO `base_area` VALUES ('220701', '220700', '220000-220700-220701-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220702', '220700', '220000-220700-220702-', '宁江区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220721', '220700', '220000-220700-220721-', '前郭尔罗斯蒙古族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220722', '220700', '220000-220700-220722-', '长岭县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220723', '220700', '220000-220700-220723-', '乾安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220724', '220700', '220000-220700-220724-', '扶余县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220800', '220000', '220000-220800-', '白城市', '137000', '0436', '1');
INSERT INTO `base_area` VALUES ('220801', '220800', '220000-220800-220801-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220802', '220800', '220000-220800-220802-', '洮北区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220821', '220800', '220000-220800-220821-', '镇赉县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220822', '220800', '220000-220800-220822-', '通榆县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220881', '220800', '220000-220800-220881-', '洮南市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('220882', '220800', '220000-220800-220882-', '大安市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('222400', '220000', '220000-222400-', '延边州', '133000', '0433', '1');
INSERT INTO `base_area` VALUES ('222401', '222400', '220000-222400-222401-', '延吉市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('222402', '222400', '220000-222400-222402-', '图们市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('222403', '222400', '220000-222400-222403-', '敦化市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('222404', '222400', '220000-222400-222404-', '珲春市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('222405', '222400', '220000-222400-222405-', '龙井市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('222406', '222400', '220000-222400-222406-', '和龙市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('222424', '222400', '220000-222400-222424-', '汪清县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('222426', '222400', '220000-222400-222426-', '安图县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230000', '0', '230000-', '黑龙江省', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230100', '230000', '230000-230100-', '哈尔滨市', '150000', '0451', '1');
INSERT INTO `base_area` VALUES ('230101', '230100', '230000-230100-230101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230102', '230100', '230000-230100-230102-', '道里区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230103', '230100', '230000-230100-230103-', '南岗区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230104', '230100', '230000-230100-230104-', '道外区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230106', '230100', '230000-230100-230106-', '香坊区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230107', '230100', '230000-230100-230107-', '动力区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230108', '230100', '230000-230100-230108-', '平房区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230109', '230100', '230000-230100-230109-', '松北区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230111', '230100', '230000-230100-230111-', '呼兰区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230123', '230100', '230000-230100-230123-', '依兰县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230124', '230100', '230000-230100-230124-', '方正县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230125', '230100', '230000-230100-230125-', '宾　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230126', '230100', '230000-230100-230126-', '巴彦县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230127', '230100', '230000-230100-230127-', '木兰县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230128', '230100', '230000-230100-230128-', '通河县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230129', '230100', '230000-230100-230129-', '延寿县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230181', '230100', '230000-230100-230181-', '阿城市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230182', '230100', '230000-230100-230182-', '双城市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230183', '230100', '230000-230100-230183-', '尚志市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230184', '230100', '230000-230100-230184-', '五常市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230200', '230000', '230000-230200-', '齐齐哈尔市', '161000', '0452', '1');
INSERT INTO `base_area` VALUES ('230201', '230200', '230000-230200-230201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230202', '230200', '230000-230200-230202-', '龙沙区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230203', '230200', '230000-230200-230203-', '建华区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230204', '230200', '230000-230200-230204-', '铁锋区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230205', '230200', '230000-230200-230205-', '昂昂溪区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230206', '230200', '230000-230200-230206-', '富拉尔基区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230207', '230200', '230000-230200-230207-', '碾子山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230208', '230200', '230000-230200-230208-', '梅里斯达斡尔族区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230221', '230200', '230000-230200-230221-', '龙江县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230223', '230200', '230000-230200-230223-', '依安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230224', '230200', '230000-230200-230224-', '泰来县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230225', '230200', '230000-230200-230225-', '甘南县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230227', '230200', '230000-230200-230227-', '富裕县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230229', '230200', '230000-230200-230229-', '克山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230230', '230200', '230000-230200-230230-', '克东县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230231', '230200', '230000-230200-230231-', '拜泉县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230281', '230200', '230000-230200-230281-', '讷河市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230300', '230000', '230000-230300-', '鸡西市', '158100', '0467', '1');
INSERT INTO `base_area` VALUES ('230301', '230300', '230000-230300-230301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230302', '230300', '230000-230300-230302-', '鸡冠区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230303', '230300', '230000-230300-230303-', '恒山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230304', '230300', '230000-230300-230304-', '滴道区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230305', '230300', '230000-230300-230305-', '梨树区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230306', '230300', '230000-230300-230306-', '城子河区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230307', '230300', '230000-230300-230307-', '麻山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230321', '230300', '230000-230300-230321-', '鸡东县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230381', '230300', '230000-230300-230381-', '虎林市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230382', '230300', '230000-230300-230382-', '密山市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230400', '230000', '230000-230400-', '鹤岗市', '154100', '0468', '1');
INSERT INTO `base_area` VALUES ('230401', '230400', '230000-230400-230401-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230402', '230400', '230000-230400-230402-', '向阳区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230403', '230400', '230000-230400-230403-', '工农区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230404', '230400', '230000-230400-230404-', '南山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230405', '230400', '230000-230400-230405-', '兴安区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230406', '230400', '230000-230400-230406-', '东山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230407', '230400', '230000-230400-230407-', '兴山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230421', '230400', '230000-230400-230421-', '萝北县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230422', '230400', '230000-230400-230422-', '绥滨县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230500', '230000', '230000-230500-', '双鸭山市', '155100', '0469', '1');
INSERT INTO `base_area` VALUES ('230501', '230500', '230000-230500-230501-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230502', '230500', '230000-230500-230502-', '尖山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230503', '230500', '230000-230500-230503-', '岭东区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230505', '230500', '230000-230500-230505-', '四方台区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230506', '230500', '230000-230500-230506-', '宝山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230521', '230500', '230000-230500-230521-', '集贤县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230522', '230500', '230000-230500-230522-', '友谊县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230523', '230500', '230000-230500-230523-', '宝清县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230524', '230500', '230000-230500-230524-', '饶河县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230600', '230000', '230000-230600-', '大庆市', '163000', '0459', '1');
INSERT INTO `base_area` VALUES ('230601', '230600', '230000-230600-230601-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230602', '230600', '230000-230600-230602-', '萨尔图区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230603', '230600', '230000-230600-230603-', '龙凤区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230604', '230600', '230000-230600-230604-', '让胡路区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230605', '230600', '230000-230600-230605-', '红岗区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230606', '230600', '230000-230600-230606-', '大同区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230621', '230600', '230000-230600-230621-', '肇州县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230622', '230600', '230000-230600-230622-', '肇源县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230623', '230600', '230000-230600-230623-', '林甸县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230624', '230600', '230000-230600-230624-', '杜尔伯特蒙古族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230700', '230000', '230000-230700-', '伊春市', '153000', '0458', '1');
INSERT INTO `base_area` VALUES ('230701', '230700', '230000-230700-230701-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230702', '230700', '230000-230700-230702-', '伊春区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230703', '230700', '230000-230700-230703-', '南岔区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230704', '230700', '230000-230700-230704-', '友好区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230705', '230700', '230000-230700-230705-', '西林区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230706', '230700', '230000-230700-230706-', '翠峦区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230707', '230700', '230000-230700-230707-', '新青区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230708', '230700', '230000-230700-230708-', '美溪区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230709', '230700', '230000-230700-230709-', '金山屯区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230710', '230700', '230000-230700-230710-', '五营区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230711', '230700', '230000-230700-230711-', '乌马河区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230712', '230700', '230000-230700-230712-', '汤旺河区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230713', '230700', '230000-230700-230713-', '带岭区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230714', '230700', '230000-230700-230714-', '乌伊岭区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230715', '230700', '230000-230700-230715-', '红星区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230716', '230700', '230000-230700-230716-', '上甘岭区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230722', '230700', '230000-230700-230722-', '嘉荫县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230781', '230700', '230000-230700-230781-', '铁力市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230800', '230000', '230000-230800-', '佳木斯市', '154000', '0454', '1');
INSERT INTO `base_area` VALUES ('230801', '230800', '230000-230800-230801-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230802', '230800', '230000-230800-230802-', '永红区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230803', '230800', '230000-230800-230803-', '向阳区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230804', '230800', '230000-230800-230804-', '前进区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230805', '230800', '230000-230800-230805-', '东风区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230811', '230800', '230000-230800-230811-', '郊　区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230822', '230800', '230000-230800-230822-', '桦南县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230826', '230800', '230000-230800-230826-', '桦川县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230828', '230800', '230000-230800-230828-', '汤原县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230833', '230800', '230000-230800-230833-', '抚远县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230881', '230800', '230000-230800-230881-', '同江市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230882', '230800', '230000-230800-230882-', '富锦市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230900', '230000', '230000-230900-', '七台河市', '154600', '0464', '1');
INSERT INTO `base_area` VALUES ('230901', '230900', '230000-230900-230901-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230902', '230900', '230000-230900-230902-', '新兴区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230903', '230900', '230000-230900-230903-', '桃山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230904', '230900', '230000-230900-230904-', '茄子河区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('230921', '230900', '230000-230900-230921-', '勃利县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('231000', '230000', '230000-231000-', '牡丹江市', '157000', '0453', '1');
INSERT INTO `base_area` VALUES ('231001', '231000', '230000-231000-231001-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('231002', '231000', '230000-231000-231002-', '东安区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('231003', '231000', '230000-231000-231003-', '阳明区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('231004', '231000', '230000-231000-231004-', '爱民区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('231005', '231000', '230000-231000-231005-', '西安区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('231024', '231000', '230000-231000-231024-', '东宁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('231025', '231000', '230000-231000-231025-', '林口县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('231081', '231000', '230000-231000-231081-', '绥芬河市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('231083', '231000', '230000-231000-231083-', '海林市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('231084', '231000', '230000-231000-231084-', '宁安市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('231085', '231000', '230000-231000-231085-', '穆棱市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('231100', '230000', '230000-231100-', '黑河市', '164300', '0456', '1');
INSERT INTO `base_area` VALUES ('231101', '231100', '230000-231100-231101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('231102', '231100', '230000-231100-231102-', '爱辉区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('231121', '231100', '230000-231100-231121-', '嫩江县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('231123', '231100', '230000-231100-231123-', '逊克县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('231124', '231100', '230000-231100-231124-', '孙吴县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('231181', '231100', '230000-231100-231181-', '北安市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('231182', '231100', '230000-231100-231182-', '五大连池市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('231200', '230000', '230000-231200-', '绥化市', '152000', '0455', '1');
INSERT INTO `base_area` VALUES ('231201', '231200', '230000-231200-231201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('231202', '231200', '230000-231200-231202-', '北林区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('231221', '231200', '230000-231200-231221-', '望奎县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('231222', '231200', '230000-231200-231222-', '兰西县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('231223', '231200', '230000-231200-231223-', '青冈县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('231224', '231200', '230000-231200-231224-', '庆安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('231225', '231200', '230000-231200-231225-', '明水县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('231226', '231200', '230000-231200-231226-', '绥棱县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('231281', '231200', '230000-231200-231281-', '安达市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('231282', '231200', '230000-231200-231282-', '肇东市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('231283', '231200', '230000-231200-231283-', '海伦市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('232700', '230000', '230000-232700-', '大兴安岭地区', '165000', '0457', '1');
INSERT INTO `base_area` VALUES ('232721', '232700', '230000-232700-232721-', '呼玛县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('232722', '232700', '230000-232700-232722-', '塔河县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('232723', '232700', '230000-232700-232723-', '漠河县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('310000', '0', '310000-', '上海市', '200000', '021', '1');
INSERT INTO `base_area` VALUES ('310100', '310000', '310000-310100-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('310101', '310100', '310000-310100-310101-', '黄浦区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('310103', '310100', '310000-310100-310103-', '卢湾区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('310104', '310100', '310000-310100-310104-', '徐汇区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('310105', '310100', '310000-310100-310105-', '长宁区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('310106', '310100', '310000-310100-310106-', '静安区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('310107', '310100', '310000-310100-310107-', '普陀区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('310108', '310100', '310000-310100-310108-', '闸北区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('310109', '310100', '310000-310100-310109-', '虹口区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('310110', '310100', '310000-310100-310110-', '杨浦区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('310112', '310100', '310000-310100-310112-', '闵行区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('310113', '310100', '310000-310100-310113-', '宝山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('310114', '310100', '310000-310100-310114-', '嘉定区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('310115', '310100', '310000-310100-310115-', '浦东新区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('310116', '310100', '310000-310100-310116-', '金山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('310117', '310100', '310000-310100-310117-', '松江区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('310118', '310100', '310000-310100-310118-', '青浦区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('310119', '310100', '310000-310100-310119-', '南汇区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('310120', '310100', '310000-310100-310120-', '奉贤区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('310200', '310000', '310000-310200-', '县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('310230', '310200', '310000-310200-310230-', '崇明县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320000', '0', '320000-', '江苏省', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320100', '320000', '320000-320100-', '南京市', '210000', '025', '1');
INSERT INTO `base_area` VALUES ('320101', '320100', '320000-320100-320101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320102', '320100', '320000-320100-320102-', '玄武区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320103', '320100', '320000-320100-320103-', '白下区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320104', '320100', '320000-320100-320104-', '秦淮区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320105', '320100', '320000-320100-320105-', '建邺区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320106', '320100', '320000-320100-320106-', '鼓楼区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320107', '320100', '320000-320100-320107-', '下关区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320111', '320100', '320000-320100-320111-', '浦口区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320113', '320100', '320000-320100-320113-', '栖霞区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320114', '320100', '320000-320100-320114-', '雨花台区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320115', '320100', '320000-320100-320115-', '江宁区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320116', '320100', '320000-320100-320116-', '六合区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320124', '320100', '320000-320100-320124-', '溧水县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320125', '320100', '320000-320100-320125-', '高淳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320200', '320000', '320000-320200-', '无锡市', '214000', '0510', '1');
INSERT INTO `base_area` VALUES ('320201', '320200', '320000-320200-320201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320202', '320200', '320000-320200-320202-', '崇安区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320203', '320200', '320000-320200-320203-', '南长区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320204', '320200', '320000-320200-320204-', '北塘区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320205', '320200', '320000-320200-320205-', '锡山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320206', '320200', '320000-320200-320206-', '惠山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320211', '320200', '320000-320200-320211-', '滨湖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320281', '320200', '320000-320200-320281-', '江阴市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320282', '320200', '320000-320200-320282-', '宜兴市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320300', '320000', '320000-320300-', '徐州市', '221000', '0516', '1');
INSERT INTO `base_area` VALUES ('320301', '320300', '320000-320300-320301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320302', '320300', '320000-320300-320302-', '鼓楼区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320303', '320300', '320000-320300-320303-', '云龙区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320304', '320300', '320000-320300-320304-', '九里区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320305', '320300', '320000-320300-320305-', '贾汪区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320311', '320300', '320000-320300-320311-', '泉山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320321', '320300', '320000-320300-320321-', '丰　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320322', '320300', '320000-320300-320322-', '沛　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320323', '320300', '320000-320300-320323-', '铜山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320324', '320300', '320000-320300-320324-', '睢宁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320381', '320300', '320000-320300-320381-', '新沂市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320382', '320300', '320000-320300-320382-', '邳州市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320400', '320000', '320000-320400-', '常州市', '213000', '0519', '1');
INSERT INTO `base_area` VALUES ('320401', '320400', '320000-320400-320401-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320402', '320400', '320000-320400-320402-', '天宁区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320404', '320400', '320000-320400-320404-', '钟楼区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320405', '320400', '320000-320400-320405-', '戚墅堰区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320411', '320400', '320000-320400-320411-', '新北区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320412', '320400', '320000-320400-320412-', '武进区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320481', '320400', '320000-320400-320481-', '溧阳市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320482', '320400', '320000-320400-320482-', '金坛市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320500', '320000', '320000-320500-', '苏州市', '215000', '0512', '1');
INSERT INTO `base_area` VALUES ('320501', '320500', '320000-320500-320501-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320502', '320500', '320000-320500-320502-', '沧浪区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320503', '320500', '320000-320500-320503-', '平江区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320504', '320500', '320000-320500-320504-', '金阊区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320505', '320500', '320000-320500-320505-', '虎丘区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320506', '320500', '320000-320500-320506-', '吴中区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320507', '320500', '320000-320500-320507-', '相城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320581', '320500', '320000-320500-320581-', '常熟市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320582', '320500', '320000-320500-320582-', '张家港市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320583', '320500', '320000-320500-320583-', '昆山市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320584', '320500', '320000-320500-320584-', '吴江市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320585', '320500', '320000-320500-320585-', '太仓市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320600', '320000', '320000-320600-', '南通市', '226000', '0513', '1');
INSERT INTO `base_area` VALUES ('320601', '320600', '320000-320600-320601-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320602', '320600', '320000-320600-320602-', '崇川区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320611', '320600', '320000-320600-320611-', '港闸区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320621', '320600', '320000-320600-320621-', '海安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320623', '320600', '320000-320600-320623-', '如东县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320681', '320600', '320000-320600-320681-', '启东市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320682', '320600', '320000-320600-320682-', '如皋市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320683', '320600', '320000-320600-320683-', '通州市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320684', '320600', '320000-320600-320684-', '海门市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320700', '320000', '320000-320700-', '连云港市', '222000', '0518', '1');
INSERT INTO `base_area` VALUES ('320701', '320700', '320000-320700-320701-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320703', '320700', '320000-320700-320703-', '连云区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320705', '320700', '320000-320700-320705-', '新浦区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320706', '320700', '320000-320700-320706-', '海州区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320721', '320700', '320000-320700-320721-', '赣榆县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320722', '320700', '320000-320700-320722-', '东海县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320723', '320700', '320000-320700-320723-', '灌云县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320724', '320700', '320000-320700-320724-', '灌南县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320800', '320000', '320000-320800-', '淮安市', '223001', '0517', '1');
INSERT INTO `base_area` VALUES ('320801', '320800', '320000-320800-320801-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320802', '320800', '320000-320800-320802-', '清河区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320803', '320800', '320000-320800-320803-', '楚州区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320804', '320800', '320000-320800-320804-', '淮阴区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320811', '320800', '320000-320800-320811-', '清浦区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320826', '320800', '320000-320800-320826-', '涟水县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320829', '320800', '320000-320800-320829-', '洪泽县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320830', '320800', '320000-320800-320830-', '盱眙县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320831', '320800', '320000-320800-320831-', '金湖县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320900', '320000', '320000-320900-', '盐城市', '224000', '0515', '1');
INSERT INTO `base_area` VALUES ('320901', '320900', '320000-320900-320901-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320902', '320900', '320000-320900-320902-', '亭湖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320903', '320900', '320000-320900-320903-', '盐都区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320921', '320900', '320000-320900-320921-', '响水县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320922', '320900', '320000-320900-320922-', '滨海县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320923', '320900', '320000-320900-320923-', '阜宁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320924', '320900', '320000-320900-320924-', '射阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320925', '320900', '320000-320900-320925-', '建湖县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320981', '320900', '320000-320900-320981-', '东台市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('320982', '320900', '320000-320900-320982-', '大丰市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('321000', '320000', '320000-321000-', '扬州市', '225000', '0514', '1');
INSERT INTO `base_area` VALUES ('321001', '321000', '320000-321000-321001-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('321002', '321000', '320000-321000-321002-', '广陵区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('321003', '321000', '320000-321000-321003-', '邗江区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('321011', '321000', '320000-321000-321011-', '郊　区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('321023', '321000', '320000-321000-321023-', '宝应县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('321081', '321000', '320000-321000-321081-', '仪征市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('321084', '321000', '320000-321000-321084-', '高邮市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('321088', '321000', '320000-321000-321088-', '江都市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('321100', '320000', '320000-321100-', '镇江市', '212000', '0511', '1');
INSERT INTO `base_area` VALUES ('321101', '321100', '320000-321100-321101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('321102', '321100', '320000-321100-321102-', '京口区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('321111', '321100', '320000-321100-321111-', '润州区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('321112', '321100', '320000-321100-321112-', '丹徒区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('321181', '321100', '320000-321100-321181-', '丹阳市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('321182', '321100', '320000-321100-321182-', '扬中市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('321183', '321100', '320000-321100-321183-', '句容市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('321200', '320000', '320000-321200-', '泰州市', '225300', '0523', '1');
INSERT INTO `base_area` VALUES ('321201', '321200', '320000-321200-321201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('321202', '321200', '320000-321200-321202-', '海陵区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('321203', '321200', '320000-321200-321203-', '高港区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('321281', '321200', '320000-321200-321281-', '兴化市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('321282', '321200', '320000-321200-321282-', '靖江市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('321283', '321200', '320000-321200-321283-', '泰兴市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('321284', '321200', '320000-321200-321284-', '姜堰市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('321300', '320000', '320000-321300-', '宿迁市', '223800', '0527', '1');
INSERT INTO `base_area` VALUES ('321301', '321300', '320000-321300-321301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('321302', '321300', '320000-321300-321302-', '宿城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('321311', '321300', '320000-321300-321311-', '宿豫区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('321322', '321300', '320000-321300-321322-', '沭阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('321323', '321300', '320000-321300-321323-', '泗阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('321324', '321300', '320000-321300-321324-', '泗洪县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330000', '0', '330000-', '浙江省', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330100', '330000', '330000-330100-', '杭州市', '310000', '0571', '1');
INSERT INTO `base_area` VALUES ('330101', '330100', '330000-330100-330101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330102', '330100', '330000-330100-330102-', '上城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330103', '330100', '330000-330100-330103-', '下城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330104', '330100', '330000-330100-330104-', '江干区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330105', '330100', '330000-330100-330105-', '拱墅区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330106', '330100', '330000-330100-330106-', '西湖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330108', '330100', '330000-330100-330108-', '滨江区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330109', '330100', '330000-330100-330109-', '萧山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330110', '330100', '330000-330100-330110-', '余杭区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330122', '330100', '330000-330100-330122-', '桐庐县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330127', '330100', '330000-330100-330127-', '淳安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330182', '330100', '330000-330100-330182-', '建德市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330183', '330100', '330000-330100-330183-', '富阳市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330185', '330100', '330000-330100-330185-', '临安市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330200', '330000', '330000-330200-', '宁波市', '315000', '0574', '1');
INSERT INTO `base_area` VALUES ('330201', '330200', '330000-330200-330201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330203', '330200', '330000-330200-330203-', '海曙区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330204', '330200', '330000-330200-330204-', '江东区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330205', '330200', '330000-330200-330205-', '江北区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330206', '330200', '330000-330200-330206-', '北仑区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330211', '330200', '330000-330200-330211-', '镇海区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330212', '330200', '330000-330200-330212-', '鄞州区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330225', '330200', '330000-330200-330225-', '象山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330226', '330200', '330000-330200-330226-', '宁海县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330281', '330200', '330000-330200-330281-', '余姚市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330282', '330200', '330000-330200-330282-', '慈溪市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330283', '330200', '330000-330200-330283-', '奉化市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330300', '330000', '330000-330300-', '温州市', '325000', '0577', '1');
INSERT INTO `base_area` VALUES ('330301', '330300', '330000-330300-330301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330302', '330300', '330000-330300-330302-', '鹿城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330303', '330300', '330000-330300-330303-', '龙湾区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330304', '330300', '330000-330300-330304-', '瓯海区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330322', '330300', '330000-330300-330322-', '洞头县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330324', '330300', '330000-330300-330324-', '永嘉县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330326', '330300', '330000-330300-330326-', '平阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330327', '330300', '330000-330300-330327-', '苍南县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330328', '330300', '330000-330300-330328-', '文成县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330329', '330300', '330000-330300-330329-', '泰顺县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330381', '330300', '330000-330300-330381-', '瑞安市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330382', '330300', '330000-330300-330382-', '乐清市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330400', '330000', '330000-330400-', '嘉兴市', '314000', '0573', '1');
INSERT INTO `base_area` VALUES ('330401', '330400', '330000-330400-330401-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330402', '330400', '330000-330400-330402-', '秀城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330411', '330400', '330000-330400-330411-', '秀洲区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330421', '330400', '330000-330400-330421-', '嘉善县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330424', '330400', '330000-330400-330424-', '海盐县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330481', '330400', '330000-330400-330481-', '海宁市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330482', '330400', '330000-330400-330482-', '平湖市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330483', '330400', '330000-330400-330483-', '桐乡市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330500', '330000', '330000-330500-', '湖州市', '313000', '0572', '1');
INSERT INTO `base_area` VALUES ('330501', '330500', '330000-330500-330501-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330502', '330500', '330000-330500-330502-', '吴兴区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330503', '330500', '330000-330500-330503-', '南浔区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330521', '330500', '330000-330500-330521-', '德清县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330522', '330500', '330000-330500-330522-', '长兴县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330523', '330500', '330000-330500-330523-', '安吉县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330600', '330000', '330000-330600-', '绍兴市', '312000', '0575', '1');
INSERT INTO `base_area` VALUES ('330601', '330600', '330000-330600-330601-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330602', '330600', '330000-330600-330602-', '越城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330621', '330600', '330000-330600-330621-', '绍兴县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330624', '330600', '330000-330600-330624-', '新昌县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330681', '330600', '330000-330600-330681-', '诸暨市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330682', '330600', '330000-330600-330682-', '上虞市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330683', '330600', '330000-330600-330683-', '嵊州市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330700', '330000', '330000-330700-', '金华市', '321000', '0579', '1');
INSERT INTO `base_area` VALUES ('330701', '330700', '330000-330700-330701-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330702', '330700', '330000-330700-330702-', '婺城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330703', '330700', '330000-330700-330703-', '金东区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330723', '330700', '330000-330700-330723-', '武义县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330726', '330700', '330000-330700-330726-', '浦江县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330727', '330700', '330000-330700-330727-', '磐安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330781', '330700', '330000-330700-330781-', '兰溪市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330782', '330700', '330000-330700-330782-', '义乌市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330783', '330700', '330000-330700-330783-', '东阳市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330784', '330700', '330000-330700-330784-', '永康市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330800', '330000', '330000-330800-', '衢州市', '324000', '0570', '1');
INSERT INTO `base_area` VALUES ('330801', '330800', '330000-330800-330801-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330802', '330800', '330000-330800-330802-', '柯城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330803', '330800', '330000-330800-330803-', '衢江区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330822', '330800', '330000-330800-330822-', '常山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330824', '330800', '330000-330800-330824-', '开化县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330825', '330800', '330000-330800-330825-', '龙游县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330881', '330800', '330000-330800-330881-', '江山市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330900', '330000', '330000-330900-', '舟山市', '316000', '0580', '1');
INSERT INTO `base_area` VALUES ('330901', '330900', '330000-330900-330901-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330902', '330900', '330000-330900-330902-', '定海区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330903', '330900', '330000-330900-330903-', '普陀区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330921', '330900', '330000-330900-330921-', '岱山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('330922', '330900', '330000-330900-330922-', '嵊泗县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('331000', '330000', '330000-331000-', '台州市', '318000', '0576', '1');
INSERT INTO `base_area` VALUES ('331001', '331000', '330000-331000-331001-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('331002', '331000', '330000-331000-331002-', '椒江区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('331003', '331000', '330000-331000-331003-', '黄岩区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('331004', '331000', '330000-331000-331004-', '路桥区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('331021', '331000', '330000-331000-331021-', '玉环县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('331022', '331000', '330000-331000-331022-', '三门县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('331023', '331000', '330000-331000-331023-', '天台县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('331024', '331000', '330000-331000-331024-', '仙居县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('331081', '331000', '330000-331000-331081-', '温岭市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('331082', '331000', '330000-331000-331082-', '临海市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('331100', '330000', '330000-331100-', '丽水市', '323000', '0578', '1');
INSERT INTO `base_area` VALUES ('331101', '331100', '330000-331100-331101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('331102', '331100', '330000-331100-331102-', '莲都区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('331121', '331100', '330000-331100-331121-', '青田县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('331122', '331100', '330000-331100-331122-', '缙云县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('331123', '331100', '330000-331100-331123-', '遂昌县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('331124', '331100', '330000-331100-331124-', '松阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('331125', '331100', '330000-331100-331125-', '云和县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('331126', '331100', '330000-331100-331126-', '庆元县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('331127', '331100', '330000-331100-331127-', '景宁畲族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('331181', '331100', '330000-331100-331181-', '龙泉市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340000', '0', '340000-', '安徽省', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340100', '340000', '340000-340100-', '合肥市', '230000', '0551', '1');
INSERT INTO `base_area` VALUES ('340101', '340100', '340000-340100-340101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340102', '340100', '340000-340100-340102-', '瑶海区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340103', '340100', '340000-340100-340103-', '庐阳区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340104', '340100', '340000-340100-340104-', '蜀山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340111', '340100', '340000-340100-340111-', '包河区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340121', '340100', '340000-340100-340121-', '长丰县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340122', '340100', '340000-340100-340122-', '肥东县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340123', '340100', '340000-340100-340123-', '肥西县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340200', '340000', '340000-340200-', '芜湖市', '241000', '0553', '1');
INSERT INTO `base_area` VALUES ('340201', '340200', '340000-340200-340201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340202', '340200', '340000-340200-340202-', '镜湖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340203', '340200', '340000-340200-340203-', '马塘区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340204', '340200', '340000-340200-340204-', '新芜区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340207', '340200', '340000-340200-340207-', '鸠江区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340221', '340200', '340000-340200-340221-', '芜湖县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340222', '340200', '340000-340200-340222-', '繁昌县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340223', '340200', '340000-340200-340223-', '南陵县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340300', '340000', '340000-340300-', '蚌埠市', '233000', '0552', '1');
INSERT INTO `base_area` VALUES ('340301', '340300', '340000-340300-340301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340302', '340300', '340000-340300-340302-', '龙子湖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340303', '340300', '340000-340300-340303-', '蚌山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340304', '340300', '340000-340300-340304-', '禹会区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340311', '340300', '340000-340300-340311-', '淮上区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340321', '340300', '340000-340300-340321-', '怀远县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340322', '340300', '340000-340300-340322-', '五河县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340323', '340300', '340000-340300-340323-', '固镇县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340400', '340000', '340000-340400-', '淮南市', '232000', '0554', '1');
INSERT INTO `base_area` VALUES ('340401', '340400', '340000-340400-340401-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340402', '340400', '340000-340400-340402-', '大通区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340403', '340400', '340000-340400-340403-', '田家庵区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340404', '340400', '340000-340400-340404-', '谢家集区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340405', '340400', '340000-340400-340405-', '八公山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340406', '340400', '340000-340400-340406-', '潘集区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340421', '340400', '340000-340400-340421-', '凤台县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340500', '340000', '340000-340500-', '马鞍山市', '243000', '0555', '1');
INSERT INTO `base_area` VALUES ('340501', '340500', '340000-340500-340501-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340502', '340500', '340000-340500-340502-', '金家庄区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340503', '340500', '340000-340500-340503-', '花山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340504', '340500', '340000-340500-340504-', '雨山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340521', '340500', '340000-340500-340521-', '当涂县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340600', '340000', '340000-340600-', '淮北市', '235000', '0561', '1');
INSERT INTO `base_area` VALUES ('340601', '340600', '340000-340600-340601-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340602', '340600', '340000-340600-340602-', '杜集区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340603', '340600', '340000-340600-340603-', '相山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340604', '340600', '340000-340600-340604-', '烈山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340621', '340600', '340000-340600-340621-', '濉溪县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340700', '340000', '340000-340700-', '铜陵市', '244000', '0562', '1');
INSERT INTO `base_area` VALUES ('340701', '340700', '340000-340700-340701-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340702', '340700', '340000-340700-340702-', '铜官山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340703', '340700', '340000-340700-340703-', '狮子山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340711', '340700', '340000-340700-340711-', '郊　区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340721', '340700', '340000-340700-340721-', '铜陵县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340800', '340000', '340000-340800-', '安庆市', '246000', '0556', '1');
INSERT INTO `base_area` VALUES ('340801', '340800', '340000-340800-340801-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340802', '340800', '340000-340800-340802-', '迎江区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340803', '340800', '340000-340800-340803-', '大观区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340811', '340800', '340000-340800-340811-', '郊　区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340822', '340800', '340000-340800-340822-', '怀宁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340823', '340800', '340000-340800-340823-', '枞阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340824', '340800', '340000-340800-340824-', '潜山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340825', '340800', '340000-340800-340825-', '太湖县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340826', '340800', '340000-340800-340826-', '宿松县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340827', '340800', '340000-340800-340827-', '望江县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340828', '340800', '340000-340800-340828-', '岳西县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('340881', '340800', '340000-340800-340881-', '桐城市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341000', '340000', '340000-341000-', '黄山市', '242700', '0559', '1');
INSERT INTO `base_area` VALUES ('341001', '341000', '340000-341000-341001-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341002', '341000', '340000-341000-341002-', '屯溪区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341003', '341000', '340000-341000-341003-', '黄山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341004', '341000', '340000-341000-341004-', '徽州区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341021', '341000', '340000-341000-341021-', '歙　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341022', '341000', '340000-341000-341022-', '休宁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341023', '341000', '340000-341000-341023-', '黟　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341024', '341000', '340000-341000-341024-', '祁门县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341100', '340000', '340000-341100-', '滁州市', '239000', '0550', '1');
INSERT INTO `base_area` VALUES ('341101', '341100', '340000-341100-341101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341102', '341100', '340000-341100-341102-', '琅琊区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341103', '341100', '340000-341100-341103-', '南谯区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341122', '341100', '340000-341100-341122-', '来安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341124', '341100', '340000-341100-341124-', '全椒县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341125', '341100', '340000-341100-341125-', '定远县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341126', '341100', '340000-341100-341126-', '凤阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341181', '341100', '340000-341100-341181-', '天长市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341182', '341100', '340000-341100-341182-', '明光市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341200', '340000', '340000-341200-', '阜阳市', '236000', '0558', '1');
INSERT INTO `base_area` VALUES ('341201', '341200', '340000-341200-341201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341202', '341200', '340000-341200-341202-', '颍州区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341203', '341200', '340000-341200-341203-', '颍东区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341204', '341200', '340000-341200-341204-', '颍泉区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341221', '341200', '340000-341200-341221-', '临泉县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341222', '341200', '340000-341200-341222-', '太和县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341225', '341200', '340000-341200-341225-', '阜南县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341226', '341200', '340000-341200-341226-', '颍上县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341282', '341200', '340000-341200-341282-', '界首市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341300', '340000', '340000-341300-', '宿州市', '234000', '0557', '1');
INSERT INTO `base_area` VALUES ('341301', '341300', '340000-341300-341301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341302', '341300', '340000-341300-341302-', '墉桥区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341321', '341300', '340000-341300-341321-', '砀山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341322', '341300', '340000-341300-341322-', '萧　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341323', '341300', '340000-341300-341323-', '灵璧县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341324', '341300', '340000-341300-341324-', '泗　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341400', '340000', '340000-341400-', '巢湖市', '238000', '0565', '1');
INSERT INTO `base_area` VALUES ('341401', '341400', '340000-341400-341401-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341402', '341400', '340000-341400-341402-', '居巢区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341421', '341400', '340000-341400-341421-', '庐江县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341422', '341400', '340000-341400-341422-', '无为县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341423', '341400', '340000-341400-341423-', '含山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341424', '341400', '340000-341400-341424-', '和　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341500', '340000', '340000-341500-', '六安市', '237000', '0564', '1');
INSERT INTO `base_area` VALUES ('341501', '341500', '340000-341500-341501-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341502', '341500', '340000-341500-341502-', '金安区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341503', '341500', '340000-341500-341503-', '裕安区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341521', '341500', '340000-341500-341521-', '寿　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341522', '341500', '340000-341500-341522-', '霍邱县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341523', '341500', '340000-341500-341523-', '舒城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341524', '341500', '340000-341500-341524-', '金寨县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341525', '341500', '340000-341500-341525-', '霍山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341600', '340000', '340000-341600-', '亳州市', '236000', '0558', '1');
INSERT INTO `base_area` VALUES ('341601', '341600', '340000-341600-341601-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341602', '341600', '340000-341600-341602-', '谯城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341621', '341600', '340000-341600-341621-', '涡阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341622', '341600', '340000-341600-341622-', '蒙城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341623', '341600', '340000-341600-341623-', '利辛县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341700', '340000', '340000-341700-', '池州市', '247100', '0566', '1');
INSERT INTO `base_area` VALUES ('341701', '341700', '340000-341700-341701-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341702', '341700', '340000-341700-341702-', '贵池区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341721', '341700', '340000-341700-341721-', '东至县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341722', '341700', '340000-341700-341722-', '石台县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341723', '341700', '340000-341700-341723-', '青阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341800', '340000', '340000-341800-', '宣城市', '242000', '0563', '1');
INSERT INTO `base_area` VALUES ('341801', '341800', '340000-341800-341801-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341802', '341800', '340000-341800-341802-', '宣州区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341821', '341800', '340000-341800-341821-', '郎溪县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341822', '341800', '340000-341800-341822-', '广德县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341823', '341800', '340000-341800-341823-', '泾　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341824', '341800', '340000-341800-341824-', '绩溪县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341825', '341800', '340000-341800-341825-', '旌德县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('341881', '341800', '340000-341800-341881-', '宁国市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350000', '0', '350000-', '福建省', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350100', '350000', '350000-350100-', '福州市', '350000', '0591', '1');
INSERT INTO `base_area` VALUES ('350101', '350100', '350000-350100-350101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350102', '350100', '350000-350100-350102-', '鼓楼区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350103', '350100', '350000-350100-350103-', '台江区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350104', '350100', '350000-350100-350104-', '仓山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350105', '350100', '350000-350100-350105-', '马尾区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350111', '350100', '350000-350100-350111-', '晋安区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350121', '350100', '350000-350100-350121-', '闽侯县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350122', '350100', '350000-350100-350122-', '连江县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350123', '350100', '350000-350100-350123-', '罗源县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350124', '350100', '350000-350100-350124-', '闽清县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350125', '350100', '350000-350100-350125-', '永泰县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350128', '350100', '350000-350100-350128-', '平潭县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350181', '350100', '350000-350100-350181-', '福清市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350182', '350100', '350000-350100-350182-', '长乐市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350200', '350000', '350000-350200-', '厦门市', '361000', '0592', '1');
INSERT INTO `base_area` VALUES ('350201', '350200', '350000-350200-350201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350203', '350200', '350000-350200-350203-', '思明区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350205', '350200', '350000-350200-350205-', '海沧区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350206', '350200', '350000-350200-350206-', '湖里区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350211', '350200', '350000-350200-350211-', '集美区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350212', '350200', '350000-350200-350212-', '同安区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350213', '350200', '350000-350200-350213-', '翔安区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350300', '350000', '350000-350300-', '莆田市', '351100', '0594', '1');
INSERT INTO `base_area` VALUES ('350301', '350300', '350000-350300-350301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350302', '350300', '350000-350300-350302-', '城厢区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350303', '350300', '350000-350300-350303-', '涵江区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350304', '350300', '350000-350300-350304-', '荔城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350305', '350300', '350000-350300-350305-', '秀屿区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350322', '350300', '350000-350300-350322-', '仙游县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350400', '350000', '350000-350400-', '三明市', '365000', '0598', '1');
INSERT INTO `base_area` VALUES ('350401', '350400', '350000-350400-350401-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350402', '350400', '350000-350400-350402-', '梅列区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350403', '350400', '350000-350400-350403-', '三元区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350421', '350400', '350000-350400-350421-', '明溪县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350423', '350400', '350000-350400-350423-', '清流县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350424', '350400', '350000-350400-350424-', '宁化县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350425', '350400', '350000-350400-350425-', '大田县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350426', '350400', '350000-350400-350426-', '尤溪县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350427', '350400', '350000-350400-350427-', '沙　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350428', '350400', '350000-350400-350428-', '将乐县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350429', '350400', '350000-350400-350429-', '泰宁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350430', '350400', '350000-350400-350430-', '建宁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350481', '350400', '350000-350400-350481-', '永安市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350500', '350000', '350000-350500-', '泉州市', '362000', '0595', '1');
INSERT INTO `base_area` VALUES ('350501', '350500', '350000-350500-350501-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350502', '350500', '350000-350500-350502-', '鲤城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350503', '350500', '350000-350500-350503-', '丰泽区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350504', '350500', '350000-350500-350504-', '洛江区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350505', '350500', '350000-350500-350505-', '泉港区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350521', '350500', '350000-350500-350521-', '惠安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350524', '350500', '350000-350500-350524-', '安溪县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350525', '350500', '350000-350500-350525-', '永春县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350526', '350500', '350000-350500-350526-', '德化县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350527', '350500', '350000-350500-350527-', '金门县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350581', '350500', '350000-350500-350581-', '石狮市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350582', '350500', '350000-350500-350582-', '晋江市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350583', '350500', '350000-350500-350583-', '南安市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350600', '350000', '350000-350600-', '漳州市', '363000', '0596', '1');
INSERT INTO `base_area` VALUES ('350601', '350600', '350000-350600-350601-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350602', '350600', '350000-350600-350602-', '芗城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350603', '350600', '350000-350600-350603-', '龙文区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350622', '350600', '350000-350600-350622-', '云霄县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350623', '350600', '350000-350600-350623-', '漳浦县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350624', '350600', '350000-350600-350624-', '诏安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350625', '350600', '350000-350600-350625-', '长泰县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350626', '350600', '350000-350600-350626-', '东山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350627', '350600', '350000-350600-350627-', '南靖县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350628', '350600', '350000-350600-350628-', '平和县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350629', '350600', '350000-350600-350629-', '华安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350681', '350600', '350000-350600-350681-', '龙海市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350700', '350000', '350000-350700-', '南平市', '353000', '0599', '1');
INSERT INTO `base_area` VALUES ('350701', '350700', '350000-350700-350701-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350702', '350700', '350000-350700-350702-', '延平区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350721', '350700', '350000-350700-350721-', '顺昌县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350722', '350700', '350000-350700-350722-', '浦城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350723', '350700', '350000-350700-350723-', '光泽县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350724', '350700', '350000-350700-350724-', '松溪县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350725', '350700', '350000-350700-350725-', '政和县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350781', '350700', '350000-350700-350781-', '邵武市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350782', '350700', '350000-350700-350782-', '武夷山市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350783', '350700', '350000-350700-350783-', '建瓯市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350784', '350700', '350000-350700-350784-', '建阳市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350800', '350000', '350000-350800-', '龙岩市', '364000', '0597', '1');
INSERT INTO `base_area` VALUES ('350801', '350800', '350000-350800-350801-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350802', '350800', '350000-350800-350802-', '新罗区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350821', '350800', '350000-350800-350821-', '长汀县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350822', '350800', '350000-350800-350822-', '永定县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350823', '350800', '350000-350800-350823-', '上杭县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350824', '350800', '350000-350800-350824-', '武平县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350825', '350800', '350000-350800-350825-', '连城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350881', '350800', '350000-350800-350881-', '漳平市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350900', '350000', '350000-350900-', '宁德市', '352000', '0593', '1');
INSERT INTO `base_area` VALUES ('350901', '350900', '350000-350900-350901-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350902', '350900', '350000-350900-350902-', '蕉城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350921', '350900', '350000-350900-350921-', '霞浦县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350922', '350900', '350000-350900-350922-', '古田县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350923', '350900', '350000-350900-350923-', '屏南县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350924', '350900', '350000-350900-350924-', '寿宁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350925', '350900', '350000-350900-350925-', '周宁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350926', '350900', '350000-350900-350926-', '柘荣县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350981', '350900', '350000-350900-350981-', '福安市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('350982', '350900', '350000-350900-350982-', '福鼎市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360000', '0', '360000-', '江西省', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360100', '360000', '360000-360100-', '南昌市', '330000', '0791', '1');
INSERT INTO `base_area` VALUES ('360101', '360100', '360000-360100-360101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360102', '360100', '360000-360100-360102-', '东湖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360103', '360100', '360000-360100-360103-', '西湖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360104', '360100', '360000-360100-360104-', '青云谱区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360105', '360100', '360000-360100-360105-', '湾里区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360111', '360100', '360000-360100-360111-', '青山湖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360121', '360100', '360000-360100-360121-', '南昌县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360122', '360100', '360000-360100-360122-', '新建县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360123', '360100', '360000-360100-360123-', '安义县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360124', '360100', '360000-360100-360124-', '进贤县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360200', '360000', '360000-360200-', '景德镇市', '333000', '0798', '1');
INSERT INTO `base_area` VALUES ('360201', '360200', '360000-360200-360201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360202', '360200', '360000-360200-360202-', '昌江区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360203', '360200', '360000-360200-360203-', '珠山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360222', '360200', '360000-360200-360222-', '浮梁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360281', '360200', '360000-360200-360281-', '乐平市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360300', '360000', '360000-360300-', '萍乡市', '337000', '0799', '1');
INSERT INTO `base_area` VALUES ('360301', '360300', '360000-360300-360301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360302', '360300', '360000-360300-360302-', '安源区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360313', '360300', '360000-360300-360313-', '湘东区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360321', '360300', '360000-360300-360321-', '莲花县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360322', '360300', '360000-360300-360322-', '上栗县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360323', '360300', '360000-360300-360323-', '芦溪县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360400', '360000', '360000-360400-', '九江市', '332000', '0792', '1');
INSERT INTO `base_area` VALUES ('360401', '360400', '360000-360400-360401-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360402', '360400', '360000-360400-360402-', '庐山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360403', '360400', '360000-360400-360403-', '浔阳区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360421', '360400', '360000-360400-360421-', '九江县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360423', '360400', '360000-360400-360423-', '武宁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360424', '360400', '360000-360400-360424-', '修水县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360425', '360400', '360000-360400-360425-', '永修县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360426', '360400', '360000-360400-360426-', '德安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360427', '360400', '360000-360400-360427-', '星子县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360428', '360400', '360000-360400-360428-', '都昌县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360429', '360400', '360000-360400-360429-', '湖口县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360430', '360400', '360000-360400-360430-', '彭泽县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360481', '360400', '360000-360400-360481-', '瑞昌市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360500', '360000', '360000-360500-', '新余市', '336500', '0790', '1');
INSERT INTO `base_area` VALUES ('360501', '360500', '360000-360500-360501-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360502', '360500', '360000-360500-360502-', '渝水区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360521', '360500', '360000-360500-360521-', '分宜县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360600', '360000', '360000-360600-', '鹰潭市', '338000', '0701', '1');
INSERT INTO `base_area` VALUES ('360601', '360600', '360000-360600-360601-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360602', '360600', '360000-360600-360602-', '月湖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360622', '360600', '360000-360600-360622-', '余江县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360681', '360600', '360000-360600-360681-', '贵溪市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360700', '360000', '360000-360700-', '赣州市', '341000', '0797', '1');
INSERT INTO `base_area` VALUES ('360701', '360700', '360000-360700-360701-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360702', '360700', '360000-360700-360702-', '章贡区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360721', '360700', '360000-360700-360721-', '赣　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360722', '360700', '360000-360700-360722-', '信丰县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360723', '360700', '360000-360700-360723-', '大余县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360724', '360700', '360000-360700-360724-', '上犹县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360725', '360700', '360000-360700-360725-', '崇义县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360726', '360700', '360000-360700-360726-', '安远县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360727', '360700', '360000-360700-360727-', '龙南县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360728', '360700', '360000-360700-360728-', '定南县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360729', '360700', '360000-360700-360729-', '全南县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360730', '360700', '360000-360700-360730-', '宁都县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360731', '360700', '360000-360700-360731-', '于都县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360732', '360700', '360000-360700-360732-', '兴国县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360733', '360700', '360000-360700-360733-', '会昌县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360734', '360700', '360000-360700-360734-', '寻乌县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360735', '360700', '360000-360700-360735-', '石城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360781', '360700', '360000-360700-360781-', '瑞金市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360782', '360700', '360000-360700-360782-', '南康市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360800', '360000', '360000-360800-', '吉安市', '343000', '0796', '1');
INSERT INTO `base_area` VALUES ('360801', '360800', '360000-360800-360801-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360802', '360800', '360000-360800-360802-', '吉州区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360803', '360800', '360000-360800-360803-', '青原区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360821', '360800', '360000-360800-360821-', '吉安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360822', '360800', '360000-360800-360822-', '吉水县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360823', '360800', '360000-360800-360823-', '峡江县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360824', '360800', '360000-360800-360824-', '新干县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360825', '360800', '360000-360800-360825-', '永丰县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360826', '360800', '360000-360800-360826-', '泰和县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360827', '360800', '360000-360800-360827-', '遂川县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360828', '360800', '360000-360800-360828-', '万安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360829', '360800', '360000-360800-360829-', '安福县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360830', '360800', '360000-360800-360830-', '永新县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360881', '360800', '360000-360800-360881-', '井冈山市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360900', '360000', '360000-360900-', '宜春市', '336000', '0795', '1');
INSERT INTO `base_area` VALUES ('360901', '360900', '360000-360900-360901-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360902', '360900', '360000-360900-360902-', '袁州区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360921', '360900', '360000-360900-360921-', '奉新县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360922', '360900', '360000-360900-360922-', '万载县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360923', '360900', '360000-360900-360923-', '上高县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360924', '360900', '360000-360900-360924-', '宜丰县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360925', '360900', '360000-360900-360925-', '靖安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360926', '360900', '360000-360900-360926-', '铜鼓县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360981', '360900', '360000-360900-360981-', '丰城市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360982', '360900', '360000-360900-360982-', '樟树市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('360983', '360900', '360000-360900-360983-', '高安市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('361000', '360000', '360000-361000-', '抚州市', '344000', '0794', '1');
INSERT INTO `base_area` VALUES ('361001', '361000', '360000-361000-361001-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('361002', '361000', '360000-361000-361002-', '临川区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('361021', '361000', '360000-361000-361021-', '南城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('361022', '361000', '360000-361000-361022-', '黎川县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('361023', '361000', '360000-361000-361023-', '南丰县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('361024', '361000', '360000-361000-361024-', '崇仁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('361025', '361000', '360000-361000-361025-', '乐安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('361026', '361000', '360000-361000-361026-', '宜黄县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('361027', '361000', '360000-361000-361027-', '金溪县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('361028', '361000', '360000-361000-361028-', '资溪县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('361029', '361000', '360000-361000-361029-', '东乡县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('361030', '361000', '360000-361000-361030-', '广昌县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('361100', '360000', '360000-361100-', '上饶市', '334000', '0793', '1');
INSERT INTO `base_area` VALUES ('361101', '361100', '360000-361100-361101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('361102', '361100', '360000-361100-361102-', '信州区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('361121', '361100', '360000-361100-361121-', '上饶县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('361122', '361100', '360000-361100-361122-', '广丰县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('361123', '361100', '360000-361100-361123-', '玉山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('361124', '361100', '360000-361100-361124-', '铅山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('361125', '361100', '360000-361100-361125-', '横峰县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('361126', '361100', '360000-361100-361126-', '弋阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('361127', '361100', '360000-361100-361127-', '余干县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('361128', '361100', '360000-361100-361128-', '鄱阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('361129', '361100', '360000-361100-361129-', '万年县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('361130', '361100', '360000-361100-361130-', '婺源县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('361181', '361100', '360000-361100-361181-', '德兴市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370000', '0', '370000-', '山东省', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370100', '370000', '370000-370100-', '济南市', '250000', '0531', '1');
INSERT INTO `base_area` VALUES ('370101', '370100', '370000-370100-370101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370102', '370100', '370000-370100-370102-', '历下区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370103', '370100', '370000-370100-370103-', '市中区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370104', '370100', '370000-370100-370104-', '槐荫区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370105', '370100', '370000-370100-370105-', '天桥区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370112', '370100', '370000-370100-370112-', '历城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370113', '370100', '370000-370100-370113-', '长清区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370124', '370100', '370000-370100-370124-', '平阴县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370125', '370100', '370000-370100-370125-', '济阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370126', '370100', '370000-370100-370126-', '商河县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370181', '370100', '370000-370100-370181-', '章丘市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370200', '370000', '370000-370200-', '青岛市', '266000', '0532', '1');
INSERT INTO `base_area` VALUES ('370201', '370200', '370000-370200-370201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370202', '370200', '370000-370200-370202-', '市南区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370203', '370200', '370000-370200-370203-', '市北区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370205', '370200', '370000-370200-370205-', '四方区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370211', '370200', '370000-370200-370211-', '黄岛区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370212', '370200', '370000-370200-370212-', '崂山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370213', '370200', '370000-370200-370213-', '李沧区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370214', '370200', '370000-370200-370214-', '城阳区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370281', '370200', '370000-370200-370281-', '胶州市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370282', '370200', '370000-370200-370282-', '即墨市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370283', '370200', '370000-370200-370283-', '平度市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370284', '370200', '370000-370200-370284-', '胶南市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370285', '370200', '370000-370200-370285-', '莱西市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370300', '370000', '370000-370300-', '淄博市', '255000', '0533', '1');
INSERT INTO `base_area` VALUES ('370301', '370300', '370000-370300-370301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370302', '370300', '370000-370300-370302-', '淄川区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370303', '370300', '370000-370300-370303-', '张店区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370304', '370300', '370000-370300-370304-', '博山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370305', '370300', '370000-370300-370305-', '临淄区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370306', '370300', '370000-370300-370306-', '周村区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370321', '370300', '370000-370300-370321-', '桓台县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370322', '370300', '370000-370300-370322-', '高青县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370323', '370300', '370000-370300-370323-', '沂源县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370400', '370000', '370000-370400-', '枣庄市', '277000', '0632', '1');
INSERT INTO `base_area` VALUES ('370401', '370400', '370000-370400-370401-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370402', '370400', '370000-370400-370402-', '市中区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370403', '370400', '370000-370400-370403-', '薛城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370404', '370400', '370000-370400-370404-', '峄城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370405', '370400', '370000-370400-370405-', '台儿庄区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370406', '370400', '370000-370400-370406-', '山亭区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370481', '370400', '370000-370400-370481-', '滕州市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370500', '370000', '370000-370500-', '东营市', '257000', '0546', '1');
INSERT INTO `base_area` VALUES ('370501', '370500', '370000-370500-370501-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370502', '370500', '370000-370500-370502-', '东营区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370503', '370500', '370000-370500-370503-', '河口区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370521', '370500', '370000-370500-370521-', '垦利县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370522', '370500', '370000-370500-370522-', '利津县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370523', '370500', '370000-370500-370523-', '广饶县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370600', '370000', '370000-370600-', '烟台市', '264000', '0535', '1');
INSERT INTO `base_area` VALUES ('370601', '370600', '370000-370600-370601-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370602', '370600', '370000-370600-370602-', '芝罘区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370611', '370600', '370000-370600-370611-', '福山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370612', '370600', '370000-370600-370612-', '牟平区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370613', '370600', '370000-370600-370613-', '莱山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370634', '370600', '370000-370600-370634-', '长岛县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370681', '370600', '370000-370600-370681-', '龙口市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370682', '370600', '370000-370600-370682-', '莱阳市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370683', '370600', '370000-370600-370683-', '莱州市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370684', '370600', '370000-370600-370684-', '蓬莱市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370685', '370600', '370000-370600-370685-', '招远市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370686', '370600', '370000-370600-370686-', '栖霞市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370687', '370600', '370000-370600-370687-', '海阳市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370700', '370000', '370000-370700-', '潍坊市', '261000', '0536', '1');
INSERT INTO `base_area` VALUES ('370701', '370700', '370000-370700-370701-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370702', '370700', '370000-370700-370702-', '潍城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370703', '370700', '370000-370700-370703-', '寒亭区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370704', '370700', '370000-370700-370704-', '坊子区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370705', '370700', '370000-370700-370705-', '奎文区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370724', '370700', '370000-370700-370724-', '临朐县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370725', '370700', '370000-370700-370725-', '昌乐县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370781', '370700', '370000-370700-370781-', '青州市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370782', '370700', '370000-370700-370782-', '诸城市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370783', '370700', '370000-370700-370783-', '寿光市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370784', '370700', '370000-370700-370784-', '安丘市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370785', '370700', '370000-370700-370785-', '高密市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370786', '370700', '370000-370700-370786-', '昌邑市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370800', '370000', '370000-370800-', '济宁市', '272000', '0537', '1');
INSERT INTO `base_area` VALUES ('370801', '370800', '370000-370800-370801-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370802', '370800', '370000-370800-370802-', '市中区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370811', '370800', '370000-370800-370811-', '任城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370826', '370800', '370000-370800-370826-', '微山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370827', '370800', '370000-370800-370827-', '鱼台县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370828', '370800', '370000-370800-370828-', '金乡县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370829', '370800', '370000-370800-370829-', '嘉祥县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370830', '370800', '370000-370800-370830-', '汶上县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370831', '370800', '370000-370800-370831-', '泗水县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370832', '370800', '370000-370800-370832-', '梁山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370881', '370800', '370000-370800-370881-', '曲阜市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370882', '370800', '370000-370800-370882-', '兖州市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370883', '370800', '370000-370800-370883-', '邹城市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370900', '370000', '370000-370900-', '泰安市', '271000', '0538', '1');
INSERT INTO `base_area` VALUES ('370901', '370900', '370000-370900-370901-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370902', '370900', '370000-370900-370902-', '泰山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370903', '370900', '370000-370900-370903-', '岱岳区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370921', '370900', '370000-370900-370921-', '宁阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370923', '370900', '370000-370900-370923-', '东平县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370982', '370900', '370000-370900-370982-', '新泰市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('370983', '370900', '370000-370900-370983-', '肥城市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371000', '370000', '370000-371000-', '威海市', '264200', '0631', '1');
INSERT INTO `base_area` VALUES ('371001', '371000', '370000-371000-371001-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371002', '371000', '370000-371000-371002-', '环翠区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371081', '371000', '370000-371000-371081-', '文登市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371082', '371000', '370000-371000-371082-', '荣成市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371083', '371000', '370000-371000-371083-', '乳山市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371100', '370000', '370000-371100-', '日照市', '276800', '0633', '1');
INSERT INTO `base_area` VALUES ('371101', '371100', '370000-371100-371101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371102', '371100', '370000-371100-371102-', '东港区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371103', '371100', '370000-371100-371103-', '岚山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371121', '371100', '370000-371100-371121-', '五莲县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371122', '371100', '370000-371100-371122-', '莒　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371200', '370000', '370000-371200-', '莱芜市', '271100', '0634', '1');
INSERT INTO `base_area` VALUES ('371201', '371200', '370000-371200-371201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371202', '371200', '370000-371200-371202-', '莱城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371203', '371200', '370000-371200-371203-', '钢城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371300', '370000', '370000-371300-', '临沂市', '276000', '0539', '1');
INSERT INTO `base_area` VALUES ('371301', '371300', '370000-371300-371301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371302', '371300', '370000-371300-371302-', '兰山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371311', '371300', '370000-371300-371311-', '罗庄区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371312', '371300', '370000-371300-371312-', '河东区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371321', '371300', '370000-371300-371321-', '沂南县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371322', '371300', '370000-371300-371322-', '郯城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371323', '371300', '370000-371300-371323-', '沂水县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371324', '371300', '370000-371300-371324-', '苍山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371325', '371300', '370000-371300-371325-', '费　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371326', '371300', '370000-371300-371326-', '平邑县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371327', '371300', '370000-371300-371327-', '莒南县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371328', '371300', '370000-371300-371328-', '蒙阴县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371329', '371300', '370000-371300-371329-', '临沭县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371400', '370000', '370000-371400-', '德州市', '253000', '0543', '1');
INSERT INTO `base_area` VALUES ('371401', '371400', '370000-371400-371401-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371402', '371400', '370000-371400-371402-', '德城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371421', '371400', '370000-371400-371421-', '陵　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371422', '371400', '370000-371400-371422-', '宁津县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371423', '371400', '370000-371400-371423-', '庆云县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371424', '371400', '370000-371400-371424-', '临邑县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371425', '371400', '370000-371400-371425-', '齐河县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371426', '371400', '370000-371400-371426-', '平原县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371427', '371400', '370000-371400-371427-', '夏津县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371428', '371400', '370000-371400-371428-', '武城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371481', '371400', '370000-371400-371481-', '乐陵市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371482', '371400', '370000-371400-371482-', '禹城市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371500', '370000', '370000-371500-', '聊城市', '252000', '0635', '1');
INSERT INTO `base_area` VALUES ('371501', '371500', '370000-371500-371501-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371502', '371500', '370000-371500-371502-', '东昌府区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371521', '371500', '370000-371500-371521-', '阳谷县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371522', '371500', '370000-371500-371522-', '莘　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371523', '371500', '370000-371500-371523-', '茌平县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371524', '371500', '370000-371500-371524-', '东阿县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371525', '371500', '370000-371500-371525-', '冠　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371526', '371500', '370000-371500-371526-', '高唐县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371581', '371500', '370000-371500-371581-', '临清市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371600', '370000', '370000-371600-', '滨州市', '256600', '0543', '1');
INSERT INTO `base_area` VALUES ('371601', '371600', '370000-371600-371601-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371602', '371600', '370000-371600-371602-', '滨城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371621', '371600', '370000-371600-371621-', '惠民县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371622', '371600', '370000-371600-371622-', '阳信县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371623', '371600', '370000-371600-371623-', '无棣县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371624', '371600', '370000-371600-371624-', '沾化县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371625', '371600', '370000-371600-371625-', '博兴县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371626', '371600', '370000-371600-371626-', '邹平县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371700', '370000', '370000-371700-', '荷泽市', '274000', '0530', '1');
INSERT INTO `base_area` VALUES ('371701', '371700', '370000-371700-371701-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371702', '371700', '370000-371700-371702-', '牡丹区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371721', '371700', '370000-371700-371721-', '曹　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371722', '371700', '370000-371700-371722-', '单　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371723', '371700', '370000-371700-371723-', '成武县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371724', '371700', '370000-371700-371724-', '巨野县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371725', '371700', '370000-371700-371725-', '郓城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371726', '371700', '370000-371700-371726-', '鄄城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371727', '371700', '370000-371700-371727-', '定陶县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('371728', '371700', '370000-371700-371728-', '东明县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410000', '0', '410000-', '河南省', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410100', '410000', '410000-410100-', '郑州市', '450000', '0371', '1');
INSERT INTO `base_area` VALUES ('410101', '410100', '410000-410100-410101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410102', '410100', '410000-410100-410102-', '中原区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410103', '410100', '410000-410100-410103-', '二七区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410104', '410100', '410000-410100-410104-', '管城回族区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410105', '410100', '410000-410100-410105-', '金水区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410106', '410100', '410000-410100-410106-', '上街区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410108', '410100', '410000-410100-410108-', '邙山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410122', '410100', '410000-410100-410122-', '中牟县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410181', '410100', '410000-410100-410181-', '巩义市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410182', '410100', '410000-410100-410182-', '荥阳市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410183', '410100', '410000-410100-410183-', '新密市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410184', '410100', '410000-410100-410184-', '新郑市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410185', '410100', '410000-410100-410185-', '登封市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410200', '410000', '410000-410200-', '开封市', '475000', '0378', '1');
INSERT INTO `base_area` VALUES ('410201', '410200', '410000-410200-410201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410202', '410200', '410000-410200-410202-', '龙亭区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410203', '410200', '410000-410200-410203-', '顺河回族区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410204', '410200', '410000-410200-410204-', '鼓楼区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410205', '410200', '410000-410200-410205-', '南关区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410211', '410200', '410000-410200-410211-', '郊　区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410221', '410200', '410000-410200-410221-', '杞　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410222', '410200', '410000-410200-410222-', '通许县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410223', '410200', '410000-410200-410223-', '尉氏县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410224', '410200', '410000-410200-410224-', '开封县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410225', '410200', '410000-410200-410225-', '兰考县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410300', '410000', '410000-410300-', '洛阳市', '471000', '0379', '1');
INSERT INTO `base_area` VALUES ('410301', '410300', '410000-410300-410301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410302', '410300', '410000-410300-410302-', '老城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410303', '410300', '410000-410300-410303-', '西工区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410304', '410300', '410000-410300-410304-', '廛河回族区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410305', '410300', '410000-410300-410305-', '涧西区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410306', '410300', '410000-410300-410306-', '吉利区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410307', '410300', '410000-410300-410307-', '洛龙区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410322', '410300', '410000-410300-410322-', '孟津县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410323', '410300', '410000-410300-410323-', '新安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410324', '410300', '410000-410300-410324-', '栾川县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410325', '410300', '410000-410300-410325-', '嵩　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410326', '410300', '410000-410300-410326-', '汝阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410327', '410300', '410000-410300-410327-', '宜阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410328', '410300', '410000-410300-410328-', '洛宁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410329', '410300', '410000-410300-410329-', '伊川县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410381', '410300', '410000-410300-410381-', '偃师市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410400', '410000', '410000-410400-', '平顶山市', '467000', '0375', '1');
INSERT INTO `base_area` VALUES ('410401', '410400', '410000-410400-410401-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410402', '410400', '410000-410400-410402-', '新华区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410403', '410400', '410000-410400-410403-', '卫东区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410404', '410400', '410000-410400-410404-', '石龙区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410411', '410400', '410000-410400-410411-', '湛河区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410421', '410400', '410000-410400-410421-', '宝丰县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410422', '410400', '410000-410400-410422-', '叶　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410423', '410400', '410000-410400-410423-', '鲁山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410425', '410400', '410000-410400-410425-', '郏　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410481', '410400', '410000-410400-410481-', '舞钢市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410482', '410400', '410000-410400-410482-', '汝州市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410500', '410000', '410000-410500-', '安阳市', '455000', '0372', '1');
INSERT INTO `base_area` VALUES ('410501', '410500', '410000-410500-410501-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410502', '410500', '410000-410500-410502-', '文峰区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410503', '410500', '410000-410500-410503-', '北关区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410505', '410500', '410000-410500-410505-', '殷都区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410506', '410500', '410000-410500-410506-', '龙安区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410522', '410500', '410000-410500-410522-', '安阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410523', '410500', '410000-410500-410523-', '汤阴县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410526', '410500', '410000-410500-410526-', '滑　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410527', '410500', '410000-410500-410527-', '内黄县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410581', '410500', '410000-410500-410581-', '林州市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410600', '410000', '410000-410600-', '鹤壁市', '456600', '0392', '1');
INSERT INTO `base_area` VALUES ('410601', '410600', '410000-410600-410601-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410602', '410600', '410000-410600-410602-', '鹤山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410603', '410600', '410000-410600-410603-', '山城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410611', '410600', '410000-410600-410611-', '淇滨区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410621', '410600', '410000-410600-410621-', '浚　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410622', '410600', '410000-410600-410622-', '淇　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410700', '410000', '410000-410700-', '新乡市', '453000', '0373', '1');
INSERT INTO `base_area` VALUES ('410701', '410700', '410000-410700-410701-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410702', '410700', '410000-410700-410702-', '红旗区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410703', '410700', '410000-410700-410703-', '卫滨区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410704', '410700', '410000-410700-410704-', '凤泉区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410711', '410700', '410000-410700-410711-', '牧野区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410721', '410700', '410000-410700-410721-', '新乡县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410724', '410700', '410000-410700-410724-', '获嘉县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410725', '410700', '410000-410700-410725-', '原阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410726', '410700', '410000-410700-410726-', '延津县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410727', '410700', '410000-410700-410727-', '封丘县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410728', '410700', '410000-410700-410728-', '长垣县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410781', '410700', '410000-410700-410781-', '卫辉市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410782', '410700', '410000-410700-410782-', '辉县市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410800', '410000', '410000-410800-', '焦作市', '454100', '0391', '1');
INSERT INTO `base_area` VALUES ('410801', '410800', '410000-410800-410801-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410802', '410800', '410000-410800-410802-', '解放区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410803', '410800', '410000-410800-410803-', '中站区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410804', '410800', '410000-410800-410804-', '马村区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410811', '410800', '410000-410800-410811-', '山阳区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410821', '410800', '410000-410800-410821-', '修武县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410822', '410800', '410000-410800-410822-', '博爱县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410823', '410800', '410000-410800-410823-', '武陟县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410825', '410800', '410000-410800-410825-', '温　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410881', '410800', '410000-410800-410881-', '济源市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410882', '410800', '410000-410800-410882-', '沁阳市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410883', '410800', '410000-410800-410883-', '孟州市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410900', '410000', '410000-410900-', '濮阳市', '457000', '0393', '1');
INSERT INTO `base_area` VALUES ('410901', '410900', '410000-410900-410901-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410902', '410900', '410000-410900-410902-', '华龙区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410922', '410900', '410000-410900-410922-', '清丰县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410923', '410900', '410000-410900-410923-', '南乐县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410926', '410900', '410000-410900-410926-', '范　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410927', '410900', '410000-410900-410927-', '台前县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('410928', '410900', '410000-410900-410928-', '濮阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411000', '410000', '410000-411000-', '许昌市', '461000', '0374', '1');
INSERT INTO `base_area` VALUES ('411001', '411000', '410000-411000-411001-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411002', '411000', '410000-411000-411002-', '魏都区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411023', '411000', '410000-411000-411023-', '许昌县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411024', '411000', '410000-411000-411024-', '鄢陵县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411025', '411000', '410000-411000-411025-', '襄城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411081', '411000', '410000-411000-411081-', '禹州市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411082', '411000', '410000-411000-411082-', '长葛市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411100', '410000', '410000-411100-', '漯河市', '462000', '0395', '1');
INSERT INTO `base_area` VALUES ('411101', '411100', '410000-411100-411101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411102', '411100', '410000-411100-411102-', '源汇区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411103', '411100', '410000-411100-411103-', '郾城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411104', '411100', '410000-411100-411104-', '召陵区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411121', '411100', '410000-411100-411121-', '舞阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411122', '411100', '410000-411100-411122-', '临颍县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411200', '410000', '410000-411200-', '三门峡市', '472000', '0398', '1');
INSERT INTO `base_area` VALUES ('411201', '411200', '410000-411200-411201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411202', '411200', '410000-411200-411202-', '湖滨区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411221', '411200', '410000-411200-411221-', '渑池县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411222', '411200', '410000-411200-411222-', '陕　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411224', '411200', '410000-411200-411224-', '卢氏县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411281', '411200', '410000-411200-411281-', '义马市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411282', '411200', '410000-411200-411282-', '灵宝市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411300', '410000', '410000-411300-', '南阳市', '473000', '0377', '1');
INSERT INTO `base_area` VALUES ('411301', '411300', '410000-411300-411301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411302', '411300', '410000-411300-411302-', '宛城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411303', '411300', '410000-411300-411303-', '卧龙区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411321', '411300', '410000-411300-411321-', '南召县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411322', '411300', '410000-411300-411322-', '方城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411323', '411300', '410000-411300-411323-', '西峡县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411324', '411300', '410000-411300-411324-', '镇平县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411325', '411300', '410000-411300-411325-', '内乡县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411326', '411300', '410000-411300-411326-', '淅川县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411327', '411300', '410000-411300-411327-', '社旗县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411328', '411300', '410000-411300-411328-', '唐河县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411329', '411300', '410000-411300-411329-', '新野县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411330', '411300', '410000-411300-411330-', '桐柏县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411381', '411300', '410000-411300-411381-', '邓州市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411400', '410000', '410000-411400-', '商丘市', '476000', '0370', '1');
INSERT INTO `base_area` VALUES ('411401', '411400', '410000-411400-411401-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411402', '411400', '410000-411400-411402-', '梁园区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411403', '411400', '410000-411400-411403-', '睢阳区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411421', '411400', '410000-411400-411421-', '民权县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411422', '411400', '410000-411400-411422-', '睢　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411423', '411400', '410000-411400-411423-', '宁陵县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411424', '411400', '410000-411400-411424-', '柘城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411425', '411400', '410000-411400-411425-', '虞城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411426', '411400', '410000-411400-411426-', '夏邑县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411481', '411400', '410000-411400-411481-', '永城市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411500', '410000', '410000-411500-', '信阳市', '464000', '0376', '1');
INSERT INTO `base_area` VALUES ('411501', '411500', '410000-411500-411501-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411502', '411500', '410000-411500-411502-', '师河区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411503', '411500', '410000-411500-411503-', '平桥区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411521', '411500', '410000-411500-411521-', '罗山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411522', '411500', '410000-411500-411522-', '光山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411523', '411500', '410000-411500-411523-', '新　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411524', '411500', '410000-411500-411524-', '商城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411525', '411500', '410000-411500-411525-', '固始县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411526', '411500', '410000-411500-411526-', '潢川县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411527', '411500', '410000-411500-411527-', '淮滨县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411528', '411500', '410000-411500-411528-', '息　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411600', '410000', '410000-411600-', '周口市', '466000', '0394', '1');
INSERT INTO `base_area` VALUES ('411601', '411600', '410000-411600-411601-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411602', '411600', '410000-411600-411602-', '川汇区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411621', '411600', '410000-411600-411621-', '扶沟县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411622', '411600', '410000-411600-411622-', '西华县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411623', '411600', '410000-411600-411623-', '商水县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411624', '411600', '410000-411600-411624-', '沈丘县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411625', '411600', '410000-411600-411625-', '郸城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411626', '411600', '410000-411600-411626-', '淮阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411627', '411600', '410000-411600-411627-', '太康县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411628', '411600', '410000-411600-411628-', '鹿邑县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411681', '411600', '410000-411600-411681-', '项城市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411700', '410000', '410000-411700-', '驻马店市', '463000', '0396', '1');
INSERT INTO `base_area` VALUES ('411701', '411700', '410000-411700-411701-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411702', '411700', '410000-411700-411702-', '驿城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411721', '411700', '410000-411700-411721-', '西平县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411722', '411700', '410000-411700-411722-', '上蔡县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411723', '411700', '410000-411700-411723-', '平舆县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411724', '411700', '410000-411700-411724-', '正阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411725', '411700', '410000-411700-411725-', '确山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411726', '411700', '410000-411700-411726-', '泌阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411727', '411700', '410000-411700-411727-', '汝南县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411728', '411700', '410000-411700-411728-', '遂平县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('411729', '411700', '410000-411700-411729-', '新蔡县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('419001', '410000', '410000-419001-', '济源市', '454650', '0391', '1');
INSERT INTO `base_area` VALUES ('420000', '0', '420000-', '湖北省', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420100', '420000', '420000-420100-', '武汉市', '430000', '027', '1');
INSERT INTO `base_area` VALUES ('420101', '420100', '420000-420100-420101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420102', '420100', '420000-420100-420102-', '江岸区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420103', '420100', '420000-420100-420103-', '江汉区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420104', '420100', '420000-420100-420104-', '乔口区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420105', '420100', '420000-420100-420105-', '汉阳区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420106', '420100', '420000-420100-420106-', '武昌区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420107', '420100', '420000-420100-420107-', '青山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420111', '420100', '420000-420100-420111-', '洪山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420112', '420100', '420000-420100-420112-', '东西湖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420113', '420100', '420000-420100-420113-', '汉南区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420114', '420100', '420000-420100-420114-', '蔡甸区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420115', '420100', '420000-420100-420115-', '江夏区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420116', '420100', '420000-420100-420116-', '黄陂区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420117', '420100', '420000-420100-420117-', '新洲区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420200', '420000', '420000-420200-', '黄石市', '435000', '0714', '1');
INSERT INTO `base_area` VALUES ('420201', '420200', '420000-420200-420201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420202', '420200', '420000-420200-420202-', '黄石港区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420203', '420200', '420000-420200-420203-', '西塞山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420204', '420200', '420000-420200-420204-', '下陆区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420205', '420200', '420000-420200-420205-', '铁山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420222', '420200', '420000-420200-420222-', '阳新县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420281', '420200', '420000-420200-420281-', '大冶市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420300', '420000', '420000-420300-', '十堰市', '442000', '0719', '1');
INSERT INTO `base_area` VALUES ('420301', '420300', '420000-420300-420301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420302', '420300', '420000-420300-420302-', '茅箭区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420303', '420300', '420000-420300-420303-', '张湾区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420321', '420300', '420000-420300-420321-', '郧　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420322', '420300', '420000-420300-420322-', '郧西县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420323', '420300', '420000-420300-420323-', '竹山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420324', '420300', '420000-420300-420324-', '竹溪县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420325', '420300', '420000-420300-420325-', '房　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420381', '420300', '420000-420300-420381-', '丹江口市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420500', '420000', '420000-420500-', '宜昌市', '443000', '0717', '1');
INSERT INTO `base_area` VALUES ('420501', '420500', '420000-420500-420501-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420502', '420500', '420000-420500-420502-', '西陵区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420503', '420500', '420000-420500-420503-', '伍家岗区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420504', '420500', '420000-420500-420504-', '点军区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420505', '420500', '420000-420500-420505-', '猇亭区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420506', '420500', '420000-420500-420506-', '夷陵区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420525', '420500', '420000-420500-420525-', '远安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420526', '420500', '420000-420500-420526-', '兴山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420527', '420500', '420000-420500-420527-', '秭归县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420528', '420500', '420000-420500-420528-', '长阳土家族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420529', '420500', '420000-420500-420529-', '五峰土家族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420581', '420500', '420000-420500-420581-', '宜都市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420582', '420500', '420000-420500-420582-', '当阳市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420583', '420500', '420000-420500-420583-', '枝江市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420600', '420000', '420000-420600-', '襄樊市', '441000', '0710', '1');
INSERT INTO `base_area` VALUES ('420601', '420600', '420000-420600-420601-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420602', '420600', '420000-420600-420602-', '襄城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420606', '420600', '420000-420600-420606-', '樊城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420607', '420600', '420000-420600-420607-', '襄阳区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420624', '420600', '420000-420600-420624-', '南漳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420625', '420600', '420000-420600-420625-', '谷城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420626', '420600', '420000-420600-420626-', '保康县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420682', '420600', '420000-420600-420682-', '老河口市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420683', '420600', '420000-420600-420683-', '枣阳市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420684', '420600', '420000-420600-420684-', '宜城市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420700', '420000', '420000-420700-', '鄂州市', '436000', '0711', '1');
INSERT INTO `base_area` VALUES ('420701', '420700', '420000-420700-420701-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420702', '420700', '420000-420700-420702-', '梁子湖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420703', '420700', '420000-420700-420703-', '华容区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420704', '420700', '420000-420700-420704-', '鄂城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420800', '420000', '420000-420800-', '荆门市', '448000', '0724', '1');
INSERT INTO `base_area` VALUES ('420801', '420800', '420000-420800-420801-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420802', '420800', '420000-420800-420802-', '东宝区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420804', '420800', '420000-420800-420804-', '掇刀区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420821', '420800', '420000-420800-420821-', '京山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420822', '420800', '420000-420800-420822-', '沙洋县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420881', '420800', '420000-420800-420881-', '钟祥市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420900', '420000', '420000-420900-', '孝感市', '432000', '0712', '1');
INSERT INTO `base_area` VALUES ('420901', '420900', '420000-420900-420901-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420902', '420900', '420000-420900-420902-', '孝南区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420921', '420900', '420000-420900-420921-', '孝昌县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420922', '420900', '420000-420900-420922-', '大悟县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420923', '420900', '420000-420900-420923-', '云梦县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420981', '420900', '420000-420900-420981-', '应城市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420982', '420900', '420000-420900-420982-', '安陆市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('420984', '420900', '420000-420900-420984-', '汉川市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('421000', '420000', '420000-421000-', '荆州市', '434000', '0716', '1');
INSERT INTO `base_area` VALUES ('421001', '421000', '420000-421000-421001-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('421002', '421000', '420000-421000-421002-', '沙市区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('421003', '421000', '420000-421000-421003-', '荆州区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('421022', '421000', '420000-421000-421022-', '公安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('421023', '421000', '420000-421000-421023-', '监利县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('421024', '421000', '420000-421000-421024-', '江陵县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('421081', '421000', '420000-421000-421081-', '石首市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('421083', '421000', '420000-421000-421083-', '洪湖市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('421087', '421000', '420000-421000-421087-', '松滋市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('421100', '420000', '420000-421100-', '黄冈市', '438000', '0713', '1');
INSERT INTO `base_area` VALUES ('421101', '421100', '420000-421100-421101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('421102', '421100', '420000-421100-421102-', '黄州区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('421121', '421100', '420000-421100-421121-', '团风县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('421122', '421100', '420000-421100-421122-', '红安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('421123', '421100', '420000-421100-421123-', '罗田县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('421124', '421100', '420000-421100-421124-', '英山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('421125', '421100', '420000-421100-421125-', '浠水县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('421126', '421100', '420000-421100-421126-', '蕲春县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('421127', '421100', '420000-421100-421127-', '黄梅县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('421181', '421100', '420000-421100-421181-', '麻城市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('421182', '421100', '420000-421100-421182-', '武穴市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('421200', '420000', '420000-421200-', '咸宁市', '437000', '0715', '1');
INSERT INTO `base_area` VALUES ('421201', '421200', '420000-421200-421201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('421202', '421200', '420000-421200-421202-', '咸安区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('421221', '421200', '420000-421200-421221-', '嘉鱼县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('421222', '421200', '420000-421200-421222-', '通城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('421223', '421200', '420000-421200-421223-', '崇阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('421224', '421200', '420000-421200-421224-', '通山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('421281', '421200', '420000-421200-421281-', '赤壁市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('421300', '420000', '420000-421300-', '随州市', '441300', '0722', '1');
INSERT INTO `base_area` VALUES ('421301', '421300', '420000-421300-421301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('421302', '421300', '420000-421300-421302-', '曾都区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('421381', '421300', '420000-421300-421381-', '广水市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('422800', '420000', '420000-422800-', '恩施州', '445000', '0718', '1');
INSERT INTO `base_area` VALUES ('422801', '422800', '420000-422800-422801-', '恩施市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('422802', '422800', '420000-422800-422802-', '利川市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('422822', '422800', '420000-422800-422822-', '建始县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('422823', '422800', '420000-422800-422823-', '巴东县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('422825', '422800', '420000-422800-422825-', '宣恩县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('422826', '422800', '420000-422800-422826-', '咸丰县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('422827', '422800', '420000-422800-422827-', '来凤县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('422828', '422800', '420000-422800-422828-', '鹤峰县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('429000', '420000', '420000-429000-', '省直辖行政单位', '0', '0', '1');
INSERT INTO `base_area` VALUES ('429004', '429000', '420000-429000-429004-', '仙桃市', '433000', '0728', '1');
INSERT INTO `base_area` VALUES ('429005', '429000', '420000-429000-429005-', '潜江市', '433100', '0728', '1');
INSERT INTO `base_area` VALUES ('429006', '429000', '420000-429000-429006-', '天门市', '431700', '0728', '1');
INSERT INTO `base_area` VALUES ('429021', '429000', '420000-429000-429021-', '神农架林区', '442400', '0719', '1');
INSERT INTO `base_area` VALUES ('430000', '0', '430000-', '湖南省', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430100', '430000', '430000-430100-', '长沙市', '410000', '0731', '1');
INSERT INTO `base_area` VALUES ('430101', '430100', '430000-430100-430101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430102', '430100', '430000-430100-430102-', '芙蓉区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430103', '430100', '430000-430100-430103-', '天心区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430104', '430100', '430000-430100-430104-', '岳麓区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430105', '430100', '430000-430100-430105-', '开福区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430111', '430100', '430000-430100-430111-', '雨花区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430121', '430100', '430000-430100-430121-', '长沙县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430122', '430100', '430000-430100-430122-', '望城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430124', '430100', '430000-430100-430124-', '宁乡县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430181', '430100', '430000-430100-430181-', '浏阳市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430200', '430000', '430000-430200-', '株洲市', '412000', '0731', '1');
INSERT INTO `base_area` VALUES ('430201', '430200', '430000-430200-430201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430202', '430200', '430000-430200-430202-', '荷塘区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430203', '430200', '430000-430200-430203-', '芦淞区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430204', '430200', '430000-430200-430204-', '石峰区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430211', '430200', '430000-430200-430211-', '天元区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430221', '430200', '430000-430200-430221-', '株洲县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430223', '430200', '430000-430200-430223-', '攸　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430224', '430200', '430000-430200-430224-', '茶陵县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430225', '430200', '430000-430200-430225-', '炎陵县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430281', '430200', '430000-430200-430281-', '醴陵市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430300', '430000', '430000-430300-', '湘潭市', '411100', '0731', '1');
INSERT INTO `base_area` VALUES ('430301', '430300', '430000-430300-430301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430302', '430300', '430000-430300-430302-', '雨湖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430304', '430300', '430000-430300-430304-', '岳塘区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430321', '430300', '430000-430300-430321-', '湘潭县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430381', '430300', '430000-430300-430381-', '湘乡市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430382', '430300', '430000-430300-430382-', '韶山市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430400', '430000', '430000-430400-', '衡阳市', '421000', '0734', '1');
INSERT INTO `base_area` VALUES ('430401', '430400', '430000-430400-430401-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430405', '430400', '430000-430400-430405-', '珠晖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430406', '430400', '430000-430400-430406-', '雁峰区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430407', '430400', '430000-430400-430407-', '石鼓区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430408', '430400', '430000-430400-430408-', '蒸湘区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430412', '430400', '430000-430400-430412-', '南岳区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430421', '430400', '430000-430400-430421-', '衡阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430422', '430400', '430000-430400-430422-', '衡南县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430423', '430400', '430000-430400-430423-', '衡山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430424', '430400', '430000-430400-430424-', '衡东县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430426', '430400', '430000-430400-430426-', '祁东县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430481', '430400', '430000-430400-430481-', '耒阳市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430482', '430400', '430000-430400-430482-', '常宁市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430500', '430000', '430000-430500-', '邵阳市', '422000', '0739', '1');
INSERT INTO `base_area` VALUES ('430501', '430500', '430000-430500-430501-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430502', '430500', '430000-430500-430502-', '双清区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430503', '430500', '430000-430500-430503-', '大祥区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430511', '430500', '430000-430500-430511-', '北塔区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430521', '430500', '430000-430500-430521-', '邵东县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430522', '430500', '430000-430500-430522-', '新邵县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430523', '430500', '430000-430500-430523-', '邵阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430524', '430500', '430000-430500-430524-', '隆回县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430525', '430500', '430000-430500-430525-', '洞口县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430527', '430500', '430000-430500-430527-', '绥宁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430528', '430500', '430000-430500-430528-', '新宁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430529', '430500', '430000-430500-430529-', '城步苗族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430581', '430500', '430000-430500-430581-', '武冈市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430600', '430000', '430000-430600-', '岳阳市', '414000', '0730', '1');
INSERT INTO `base_area` VALUES ('430601', '430600', '430000-430600-430601-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430602', '430600', '430000-430600-430602-', '岳阳楼区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430603', '430600', '430000-430600-430603-', '云溪区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430611', '430600', '430000-430600-430611-', '君山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430621', '430600', '430000-430600-430621-', '岳阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430623', '430600', '430000-430600-430623-', '华容县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430624', '430600', '430000-430600-430624-', '湘阴县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430626', '430600', '430000-430600-430626-', '平江县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430681', '430600', '430000-430600-430681-', '汨罗市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430682', '430600', '430000-430600-430682-', '临湘市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430700', '430000', '430000-430700-', '常德市', '415000', '0736', '1');
INSERT INTO `base_area` VALUES ('430701', '430700', '430000-430700-430701-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430702', '430700', '430000-430700-430702-', '武陵区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430703', '430700', '430000-430700-430703-', '鼎城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430721', '430700', '430000-430700-430721-', '安乡县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430722', '430700', '430000-430700-430722-', '汉寿县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430723', '430700', '430000-430700-430723-', '澧　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430724', '430700', '430000-430700-430724-', '临澧县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430725', '430700', '430000-430700-430725-', '桃源县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430726', '430700', '430000-430700-430726-', '石门县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430781', '430700', '430000-430700-430781-', '津市市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430800', '430000', '430000-430800-', '张家界市', '427000', '0744', '1');
INSERT INTO `base_area` VALUES ('430801', '430800', '430000-430800-430801-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430802', '430800', '430000-430800-430802-', '永定区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430811', '430800', '430000-430800-430811-', '武陵源区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430821', '430800', '430000-430800-430821-', '慈利县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430822', '430800', '430000-430800-430822-', '桑植县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430900', '430000', '430000-430900-', '益阳市', '413000', '0737', '1');
INSERT INTO `base_area` VALUES ('430901', '430900', '430000-430900-430901-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430902', '430900', '430000-430900-430902-', '资阳区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430903', '430900', '430000-430900-430903-', '赫山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430921', '430900', '430000-430900-430921-', '南　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430922', '430900', '430000-430900-430922-', '桃江县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430923', '430900', '430000-430900-430923-', '安化县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('430981', '430900', '430000-430900-430981-', '沅江市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431000', '430000', '430000-431000-', '郴州市', '423000', '0735', '1');
INSERT INTO `base_area` VALUES ('431001', '431000', '430000-431000-431001-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431002', '431000', '430000-431000-431002-', '北湖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431003', '431000', '430000-431000-431003-', '苏仙区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431021', '431000', '430000-431000-431021-', '桂阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431022', '431000', '430000-431000-431022-', '宜章县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431023', '431000', '430000-431000-431023-', '永兴县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431024', '431000', '430000-431000-431024-', '嘉禾县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431025', '431000', '430000-431000-431025-', '临武县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431026', '431000', '430000-431000-431026-', '汝城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431027', '431000', '430000-431000-431027-', '桂东县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431028', '431000', '430000-431000-431028-', '安仁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431081', '431000', '430000-431000-431081-', '资兴市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431100', '430000', '430000-431100-', '永州市', '425000', '0746', '1');
INSERT INTO `base_area` VALUES ('431101', '431100', '430000-431100-431101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431102', '431100', '430000-431100-431102-', '芝山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431103', '431100', '430000-431100-431103-', '冷水滩区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431121', '431100', '430000-431100-431121-', '祁阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431122', '431100', '430000-431100-431122-', '东安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431123', '431100', '430000-431100-431123-', '双牌县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431124', '431100', '430000-431100-431124-', '道　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431125', '431100', '430000-431100-431125-', '江永县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431126', '431100', '430000-431100-431126-', '宁远县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431127', '431100', '430000-431100-431127-', '蓝山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431128', '431100', '430000-431100-431128-', '新田县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431129', '431100', '430000-431100-431129-', '江华瑶族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431200', '430000', '430000-431200-', '怀化市', '418000', '0745', '1');
INSERT INTO `base_area` VALUES ('431201', '431200', '430000-431200-431201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431202', '431200', '430000-431200-431202-', '鹤城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431221', '431200', '430000-431200-431221-', '中方县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431222', '431200', '430000-431200-431222-', '沅陵县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431223', '431200', '430000-431200-431223-', '辰溪县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431224', '431200', '430000-431200-431224-', '溆浦县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431225', '431200', '430000-431200-431225-', '会同县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431226', '431200', '430000-431200-431226-', '麻阳苗族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431227', '431200', '430000-431200-431227-', '新晃侗族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431228', '431200', '430000-431200-431228-', '芷江侗族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431229', '431200', '430000-431200-431229-', '靖州苗族侗族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431230', '431200', '430000-431200-431230-', '通道侗族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431281', '431200', '430000-431200-431281-', '洪江市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431300', '430000', '430000-431300-', '娄底市', '417000', '0738', '1');
INSERT INTO `base_area` VALUES ('431301', '431300', '430000-431300-431301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431302', '431300', '430000-431300-431302-', '娄星区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431321', '431300', '430000-431300-431321-', '双峰县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431322', '431300', '430000-431300-431322-', '新化县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431381', '431300', '430000-431300-431381-', '冷水江市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('431382', '431300', '430000-431300-431382-', '涟源市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('433100', '430000', '430000-433100-', '湘西州', '416000', '0743', '1');
INSERT INTO `base_area` VALUES ('433101', '433100', '430000-433100-433101-', '吉首市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('433122', '433100', '430000-433100-433122-', '泸溪县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('433123', '433100', '430000-433100-433123-', '凤凰县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('433124', '433100', '430000-433100-433124-', '花垣县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('433125', '433100', '430000-433100-433125-', '保靖县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('433126', '433100', '430000-433100-433126-', '古丈县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('433127', '433100', '430000-433100-433127-', '永顺县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('433130', '433100', '430000-433100-433130-', '龙山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440000', '0', '440000-', '广东省', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440100', '440000', '440000-440100-', '广州市', '510000', '020', '1');
INSERT INTO `base_area` VALUES ('440101', '440100', '440000-440100-440101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440102', '440100', '440000-440100-440102-', '东山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440103', '440100', '440000-440100-440103-', '荔湾区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440104', '440100', '440000-440100-440104-', '越秀区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440105', '440100', '440000-440100-440105-', '海珠区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440106', '440100', '440000-440100-440106-', '天河区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440107', '440100', '440000-440100-440107-', '芳村区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440111', '440100', '440000-440100-440111-', '白云区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440112', '440100', '440000-440100-440112-', '黄埔区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440113', '440100', '440000-440100-440113-', '番禺区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440114', '440100', '440000-440100-440114-', '花都区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440183', '440100', '440000-440100-440183-', '增城市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440184', '440100', '440000-440100-440184-', '从化市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440200', '440000', '440000-440200-', '韶关市', '512000', '0751', '1');
INSERT INTO `base_area` VALUES ('440201', '440200', '440000-440200-440201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440203', '440200', '440000-440200-440203-', '武江区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440204', '440200', '440000-440200-440204-', '浈江区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440205', '440200', '440000-440200-440205-', '曲江区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440222', '440200', '440000-440200-440222-', '始兴县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440224', '440200', '440000-440200-440224-', '仁化县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440229', '440200', '440000-440200-440229-', '翁源县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440232', '440200', '440000-440200-440232-', '乳源瑶族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440233', '440200', '440000-440200-440233-', '新丰县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440281', '440200', '440000-440200-440281-', '乐昌市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440282', '440200', '440000-440200-440282-', '南雄市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440300', '440000', '440000-440300-', '深圳市', '518000', '0755', '1');
INSERT INTO `base_area` VALUES ('440301', '440300', '440000-440300-440301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440303', '440300', '440000-440300-440303-', '罗湖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440304', '440300', '440000-440300-440304-', '福田区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440305', '440300', '440000-440300-440305-', '南山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440306', '440300', '440000-440300-440306-', '宝安区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440307', '440300', '440000-440300-440307-', '龙岗区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440308', '440300', '440000-440300-440308-', '盐田区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440400', '440000', '440000-440400-', '珠海市', '519000', '0756', '1');
INSERT INTO `base_area` VALUES ('440401', '440400', '440000-440400-440401-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440402', '440400', '440000-440400-440402-', '香洲区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440403', '440400', '440000-440400-440403-', '斗门区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440404', '440400', '440000-440400-440404-', '金湾区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440500', '440000', '440000-440500-', '汕头市', '515000', '0754', '1');
INSERT INTO `base_area` VALUES ('440501', '440500', '440000-440500-440501-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440507', '440500', '440000-440500-440507-', '龙湖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440511', '440500', '440000-440500-440511-', '金平区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440512', '440500', '440000-440500-440512-', '濠江区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440513', '440500', '440000-440500-440513-', '潮阳区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440514', '440500', '440000-440500-440514-', '潮南区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440515', '440500', '440000-440500-440515-', '澄海区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440523', '440500', '440000-440500-440523-', '南澳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440600', '440000', '440000-440600-', '佛山市', '528000', '0757', '1');
INSERT INTO `base_area` VALUES ('440601', '440600', '440000-440600-440601-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440604', '440600', '440000-440600-440604-', '禅城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440605', '440600', '440000-440600-440605-', '南海区', '528200', '0757', '1');
INSERT INTO `base_area` VALUES ('440606', '440600', '440000-440600-440606-', '顺德区', '528300', '0757', '1');
INSERT INTO `base_area` VALUES ('440607', '440600', '440000-440600-440607-', '三水区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440608', '440600', '440000-440600-440608-', '高明区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440700', '440000', '440000-440700-', '江门市', '529000', '0750', '1');
INSERT INTO `base_area` VALUES ('440701', '440700', '440000-440700-440701-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440703', '440700', '440000-440700-440703-', '蓬江区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440704', '440700', '440000-440700-440704-', '江海区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440705', '440700', '440000-440700-440705-', '新会区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440781', '440700', '440000-440700-440781-', '台山市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440783', '440700', '440000-440700-440783-', '开平市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440784', '440700', '440000-440700-440784-', '鹤山市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440785', '440700', '440000-440700-440785-', '恩平市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440800', '440000', '440000-440800-', '湛江市', '524000', '0759', '1');
INSERT INTO `base_area` VALUES ('440801', '440800', '440000-440800-440801-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440802', '440800', '440000-440800-440802-', '赤坎区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440803', '440800', '440000-440800-440803-', '霞山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440804', '440800', '440000-440800-440804-', '坡头区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440811', '440800', '440000-440800-440811-', '麻章区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440823', '440800', '440000-440800-440823-', '遂溪县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440825', '440800', '440000-440800-440825-', '徐闻县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440881', '440800', '440000-440800-440881-', '廉江市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440882', '440800', '440000-440800-440882-', '雷州市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440883', '440800', '440000-440800-440883-', '吴川市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440900', '440000', '440000-440900-', '茂名市', '525000', '0668', '1');
INSERT INTO `base_area` VALUES ('440901', '440900', '440000-440900-440901-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440902', '440900', '440000-440900-440902-', '茂南区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440903', '440900', '440000-440900-440903-', '茂港区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440923', '440900', '440000-440900-440923-', '电白县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440981', '440900', '440000-440900-440981-', '高州市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440982', '440900', '440000-440900-440982-', '化州市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('440983', '440900', '440000-440900-440983-', '信宜市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441200', '440000', '440000-441200-', '肇庆市', '526000', '0758', '1');
INSERT INTO `base_area` VALUES ('441201', '441200', '440000-441200-441201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441202', '441200', '440000-441200-441202-', '端州区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441203', '441200', '440000-441200-441203-', '鼎湖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441223', '441200', '440000-441200-441223-', '广宁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441224', '441200', '440000-441200-441224-', '怀集县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441225', '441200', '440000-441200-441225-', '封开县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441226', '441200', '440000-441200-441226-', '德庆县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441283', '441200', '440000-441200-441283-', '高要市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441284', '441200', '440000-441200-441284-', '四会市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441300', '440000', '440000-441300-', '惠州市', '516000', '0752', '1');
INSERT INTO `base_area` VALUES ('441301', '441300', '440000-441300-441301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441302', '441300', '440000-441300-441302-', '惠城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441303', '441300', '440000-441300-441303-', '惠阳区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441322', '441300', '440000-441300-441322-', '博罗县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441323', '441300', '440000-441300-441323-', '惠东县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441324', '441300', '440000-441300-441324-', '龙门县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441400', '440000', '440000-441400-', '梅州市', '514000', '0753', '1');
INSERT INTO `base_area` VALUES ('441401', '441400', '440000-441400-441401-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441402', '441400', '440000-441400-441402-', '梅江区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441421', '441400', '440000-441400-441421-', '梅　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441422', '441400', '440000-441400-441422-', '大埔县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441423', '441400', '440000-441400-441423-', '丰顺县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441424', '441400', '440000-441400-441424-', '五华县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441426', '441400', '440000-441400-441426-', '平远县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441427', '441400', '440000-441400-441427-', '蕉岭县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441481', '441400', '440000-441400-441481-', '兴宁市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441500', '440000', '440000-441500-', '汕尾市', '516600', '0660', '1');
INSERT INTO `base_area` VALUES ('441501', '441500', '440000-441500-441501-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441502', '441500', '440000-441500-441502-', '城　区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441521', '441500', '440000-441500-441521-', '海丰县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441523', '441500', '440000-441500-441523-', '陆河县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441581', '441500', '440000-441500-441581-', '陆丰市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441600', '440000', '440000-441600-', '河源市', '517000', '0762', '1');
INSERT INTO `base_area` VALUES ('441601', '441600', '440000-441600-441601-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441602', '441600', '440000-441600-441602-', '源城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441621', '441600', '440000-441600-441621-', '紫金县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441622', '441600', '440000-441600-441622-', '龙川县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441623', '441600', '440000-441600-441623-', '连平县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441624', '441600', '440000-441600-441624-', '和平县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441625', '441600', '440000-441600-441625-', '东源县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441700', '440000', '440000-441700-', '阳江市', '529500', '0662', '1');
INSERT INTO `base_area` VALUES ('441701', '441700', '440000-441700-441701-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441702', '441700', '440000-441700-441702-', '江城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441721', '441700', '440000-441700-441721-', '阳西县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441723', '441700', '440000-441700-441723-', '阳东县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441781', '441700', '440000-441700-441781-', '阳春市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441800', '440000', '440000-441800-', '清远市', '511500', '0763', '1');
INSERT INTO `base_area` VALUES ('441801', '441800', '440000-441800-441801-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441802', '441800', '440000-441800-441802-', '清城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441821', '441800', '440000-441800-441821-', '佛冈县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441823', '441800', '440000-441800-441823-', '阳山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441825', '441800', '440000-441800-441825-', '连山壮族瑶族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441826', '441800', '440000-441800-441826-', '连南瑶族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441827', '441800', '440000-441800-441827-', '清新县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441881', '441800', '440000-441800-441881-', '英德市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441882', '441800', '440000-441800-441882-', '连州市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('441900', '440000', '440000-441900-', '东莞市', '511700', '0769', '1');
INSERT INTO `base_area` VALUES ('442000', '440000', '440000-442000-', '中山市', '528400', '0760', '1');
INSERT INTO `base_area` VALUES ('445100', '440000', '440000-445100-', '潮州市', '521000', '0768', '1');
INSERT INTO `base_area` VALUES ('445101', '445100', '440000-445100-445101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('445102', '445100', '440000-445100-445102-', '湘桥区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('445121', '445100', '440000-445100-445121-', '潮安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('445122', '445100', '440000-445100-445122-', '饶平县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('445200', '440000', '440000-445200-', '揭阳市', '522000', '0663', '1');
INSERT INTO `base_area` VALUES ('445201', '445200', '440000-445200-445201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('445202', '445200', '440000-445200-445202-', '榕城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('445221', '445200', '440000-445200-445221-', '揭东县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('445222', '445200', '440000-445200-445222-', '揭西县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('445224', '445200', '440000-445200-445224-', '惠来县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('445281', '445200', '440000-445200-445281-', '普宁市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('445300', '440000', '440000-445300-', '云浮市', '527300', '0766', '1');
INSERT INTO `base_area` VALUES ('445301', '445300', '440000-445300-445301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('445302', '445300', '440000-445300-445302-', '云城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('445321', '445300', '440000-445300-445321-', '新兴县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('445322', '445300', '440000-445300-445322-', '郁南县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('445323', '445300', '440000-445300-445323-', '云安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('445381', '445300', '440000-445300-445381-', '罗定市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450000', '0', '450000-', '广西壮族自治区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450100', '450000', '450000-450100-', '南宁市', '530000', '0771', '1');
INSERT INTO `base_area` VALUES ('450101', '450100', '450000-450100-450101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450102', '450100', '450000-450100-450102-', '兴宁区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450103', '450100', '450000-450100-450103-', '青秀区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450105', '450100', '450000-450100-450105-', '江南区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450107', '450100', '450000-450100-450107-', '西乡塘区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450108', '450100', '450000-450100-450108-', '良庆区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450109', '450100', '450000-450100-450109-', '邕宁区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450122', '450100', '450000-450100-450122-', '武鸣县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450123', '450100', '450000-450100-450123-', '隆安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450124', '450100', '450000-450100-450124-', '马山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450125', '450100', '450000-450100-450125-', '上林县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450126', '450100', '450000-450100-450126-', '宾阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450127', '450100', '450000-450100-450127-', '横　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450200', '450000', '450000-450200-', '柳州市', '545000', '0772', '1');
INSERT INTO `base_area` VALUES ('450201', '450200', '450000-450200-450201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450202', '450200', '450000-450200-450202-', '城中区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450203', '450200', '450000-450200-450203-', '鱼峰区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450204', '450200', '450000-450200-450204-', '柳南区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450205', '450200', '450000-450200-450205-', '柳北区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450221', '450200', '450000-450200-450221-', '柳江县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450222', '450200', '450000-450200-450222-', '柳城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450223', '450200', '450000-450200-450223-', '鹿寨县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450224', '450200', '450000-450200-450224-', '融安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450225', '450200', '450000-450200-450225-', '融水苗族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450226', '450200', '450000-450200-450226-', '三江侗族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450300', '450000', '450000-450300-', '桂林市', '541000', '0773', '1');
INSERT INTO `base_area` VALUES ('450301', '450300', '450000-450300-450301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450302', '450300', '450000-450300-450302-', '秀峰区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450303', '450300', '450000-450300-450303-', '叠彩区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450304', '450300', '450000-450300-450304-', '象山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450305', '450300', '450000-450300-450305-', '七星区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450311', '450300', '450000-450300-450311-', '雁山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450321', '450300', '450000-450300-450321-', '阳朔县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450322', '450300', '450000-450300-450322-', '临桂县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450323', '450300', '450000-450300-450323-', '灵川县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450324', '450300', '450000-450300-450324-', '全州县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450325', '450300', '450000-450300-450325-', '兴安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450326', '450300', '450000-450300-450326-', '永福县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450327', '450300', '450000-450300-450327-', '灌阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450328', '450300', '450000-450300-450328-', '龙胜各族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450329', '450300', '450000-450300-450329-', '资源县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450330', '450300', '450000-450300-450330-', '平乐县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450331', '450300', '450000-450300-450331-', '荔蒲县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450332', '450300', '450000-450300-450332-', '恭城瑶族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450400', '450000', '450000-450400-', '梧州市', '543000', '0774', '1');
INSERT INTO `base_area` VALUES ('450401', '450400', '450000-450400-450401-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450403', '450400', '450000-450400-450403-', '万秀区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450404', '450400', '450000-450400-450404-', '蝶山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450405', '450400', '450000-450400-450405-', '长洲区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450421', '450400', '450000-450400-450421-', '苍梧县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450422', '450400', '450000-450400-450422-', '藤　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450423', '450400', '450000-450400-450423-', '蒙山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450481', '450400', '450000-450400-450481-', '岑溪市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450500', '450000', '450000-450500-', '北海市', '536000', '0779', '1');
INSERT INTO `base_area` VALUES ('450501', '450500', '450000-450500-450501-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450502', '450500', '450000-450500-450502-', '海城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450503', '450500', '450000-450500-450503-', '银海区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450512', '450500', '450000-450500-450512-', '铁山港区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450521', '450500', '450000-450500-450521-', '合浦县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450600', '450000', '450000-450600-', '防城港市', '538000', '0770', '1');
INSERT INTO `base_area` VALUES ('450601', '450600', '450000-450600-450601-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450602', '450600', '450000-450600-450602-', '港口区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450603', '450600', '450000-450600-450603-', '防城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450621', '450600', '450000-450600-450621-', '上思县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450681', '450600', '450000-450600-450681-', '东兴市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450700', '450000', '450000-450700-', '钦州市', '535000', '0777', '1');
INSERT INTO `base_area` VALUES ('450701', '450700', '450000-450700-450701-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450702', '450700', '450000-450700-450702-', '钦南区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450703', '450700', '450000-450700-450703-', '钦北区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450721', '450700', '450000-450700-450721-', '灵山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450722', '450700', '450000-450700-450722-', '浦北县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450800', '450000', '450000-450800-', '贵港市', '537000', '0775', '1');
INSERT INTO `base_area` VALUES ('450801', '450800', '450000-450800-450801-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450802', '450800', '450000-450800-450802-', '港北区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450803', '450800', '450000-450800-450803-', '港南区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450804', '450800', '450000-450800-450804-', '覃塘区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450821', '450800', '450000-450800-450821-', '平南县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450881', '450800', '450000-450800-450881-', '桂平市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450900', '450000', '450000-450900-', '玉林市', '537000', '0775', '1');
INSERT INTO `base_area` VALUES ('450901', '450900', '450000-450900-450901-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450902', '450900', '450000-450900-450902-', '玉州区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450921', '450900', '450000-450900-450921-', '容　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450922', '450900', '450000-450900-450922-', '陆川县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450923', '450900', '450000-450900-450923-', '博白县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450924', '450900', '450000-450900-450924-', '兴业县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('450981', '450900', '450000-450900-450981-', '北流市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451000', '450000', '450000-451000-', '百色市', '533000', '0776', '1');
INSERT INTO `base_area` VALUES ('451001', '451000', '450000-451000-451001-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451002', '451000', '450000-451000-451002-', '右江区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451021', '451000', '450000-451000-451021-', '田阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451022', '451000', '450000-451000-451022-', '田东县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451023', '451000', '450000-451000-451023-', '平果县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451024', '451000', '450000-451000-451024-', '德保县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451025', '451000', '450000-451000-451025-', '靖西县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451026', '451000', '450000-451000-451026-', '那坡县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451027', '451000', '450000-451000-451027-', '凌云县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451028', '451000', '450000-451000-451028-', '乐业县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451029', '451000', '450000-451000-451029-', '田林县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451030', '451000', '450000-451000-451030-', '西林县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451031', '451000', '450000-451000-451031-', '隆林各族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451100', '450000', '450000-451100-', '贺州市', '542800', '0774', '1');
INSERT INTO `base_area` VALUES ('451101', '451100', '450000-451100-451101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451102', '451100', '450000-451100-451102-', '八步区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451121', '451100', '450000-451100-451121-', '昭平县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451122', '451100', '450000-451100-451122-', '钟山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451123', '451100', '450000-451100-451123-', '富川瑶族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451200', '450000', '450000-451200-', '河池市', '547000', '0778', '1');
INSERT INTO `base_area` VALUES ('451201', '451200', '450000-451200-451201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451202', '451200', '450000-451200-451202-', '金城江区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451221', '451200', '450000-451200-451221-', '南丹县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451222', '451200', '450000-451200-451222-', '天峨县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451223', '451200', '450000-451200-451223-', '凤山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451224', '451200', '450000-451200-451224-', '东兰县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451225', '451200', '450000-451200-451225-', '罗城仫佬族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451226', '451200', '450000-451200-451226-', '环江毛南族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451227', '451200', '450000-451200-451227-', '巴马瑶族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451228', '451200', '450000-451200-451228-', '都安瑶族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451229', '451200', '450000-451200-451229-', '大化瑶族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451281', '451200', '450000-451200-451281-', '宜州市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451300', '450000', '450000-451300-', '来宾市', '546100', '0772', '1');
INSERT INTO `base_area` VALUES ('451301', '451300', '450000-451300-451301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451302', '451300', '450000-451300-451302-', '兴宾区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451321', '451300', '450000-451300-451321-', '忻城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451322', '451300', '450000-451300-451322-', '象州县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451323', '451300', '450000-451300-451323-', '武宣县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451324', '451300', '450000-451300-451324-', '金秀瑶族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451381', '451300', '450000-451300-451381-', '合山市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451400', '450000', '450000-451400-', '崇左市', '532200', '0771', '1');
INSERT INTO `base_area` VALUES ('451401', '451400', '450000-451400-451401-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451402', '451400', '450000-451400-451402-', '江洲区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451421', '451400', '450000-451400-451421-', '扶绥县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451422', '451400', '450000-451400-451422-', '宁明县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451423', '451400', '450000-451400-451423-', '龙州县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451424', '451400', '450000-451400-451424-', '大新县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451425', '451400', '450000-451400-451425-', '天等县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('451481', '451400', '450000-451400-451481-', '凭祥市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('460000', '0', '460000-', '海南省', '0', '0', '1');
INSERT INTO `base_area` VALUES ('460100', '460000', '460000-460100-', '海口市', '570100', '0898', '1');
INSERT INTO `base_area` VALUES ('460101', '460100', '460000-460100-460101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('460105', '460100', '460000-460100-460105-', '秀英区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('460106', '460100', '460000-460100-460106-', '龙华区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('460107', '460100', '460000-460100-460107-', '琼山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('460108', '460100', '460000-460100-460108-', '美兰区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('460200', '460000', '460000-460200-', '三亚市', '572000', '0898', '1');
INSERT INTO `base_area` VALUES ('460201', '460200', '460000-460200-460201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('469000', '460000', '460000-469000-', '省直辖县级行政单位', '0', '0', '1');
INSERT INTO `base_area` VALUES ('469001', '469000', '460000-469000-469001-', '五指山市', '572200', '0898', '1');
INSERT INTO `base_area` VALUES ('469002', '469000', '460000-469000-469002-', '琼海市', '571400', '0898', '1');
INSERT INTO `base_area` VALUES ('469003', '469000', '460000-469000-469003-', '儋州市', '571700', '0898', '1');
INSERT INTO `base_area` VALUES ('469005', '469000', '460000-469000-469005-', '文昌市', '571300', '0898', '1');
INSERT INTO `base_area` VALUES ('469006', '469000', '460000-469000-469006-', '万宁市', '571500', '0898', '1');
INSERT INTO `base_area` VALUES ('469007', '469000', '460000-469000-469007-', '东方市', '572600', '0898', '1');
INSERT INTO `base_area` VALUES ('469025', '469000', '460000-469000-469025-', '定安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('469026', '469000', '460000-469000-469026-', '屯昌县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('469027', '469000', '460000-469000-469027-', '澄迈县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('469028', '469000', '460000-469000-469028-', '临高县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('469030', '469000', '460000-469000-469030-', '白沙黎族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('469031', '469000', '460000-469000-469031-', '昌江黎族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('469033', '469000', '460000-469000-469033-', '乐东黎族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('469034', '469000', '460000-469000-469034-', '陵水黎族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('469035', '469000', '460000-469000-469035-', '保亭黎族苗族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('469036', '469000', '460000-469000-469036-', '琼中黎族苗族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('469037', '469000', '460000-469000-469037-', '西沙群岛', '0', '0', '1');
INSERT INTO `base_area` VALUES ('469038', '469000', '460000-469000-469038-', '南沙群岛', '0', '0', '1');
INSERT INTO `base_area` VALUES ('469039', '469000', '460000-469000-469039-', '中沙群岛的岛礁及其海域', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500000', '0', '500000-', '重庆市', '400000', '023', '1');
INSERT INTO `base_area` VALUES ('500100', '500000', '500000-500100-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500101', '500100', '500000-500100-500101-', '万州区', '404000', '023', '1');
INSERT INTO `base_area` VALUES ('500102', '500100', '500000-500100-500102-', '涪陵区', '408000', '023', '1');
INSERT INTO `base_area` VALUES ('500103', '500100', '500000-500100-500103-', '渝中区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500104', '500100', '500000-500100-500104-', '大渡口区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500105', '500100', '500000-500100-500105-', '江北区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500106', '500100', '500000-500100-500106-', '沙坪坝区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500107', '500100', '500000-500100-500107-', '九龙坡区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500108', '500100', '500000-500100-500108-', '南岸区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500109', '500100', '500000-500100-500109-', '北碚区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500110', '500100', '500000-500100-500110-', '万盛区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500111', '500100', '500000-500100-500111-', '双桥区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500112', '500100', '500000-500100-500112-', '渝北区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500113', '500100', '500000-500100-500113-', '巴南区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500114', '500100', '500000-500100-500114-', '黔江区', '409000', '023', '1');
INSERT INTO `base_area` VALUES ('500115', '500100', '500000-500100-500115-', '长寿区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500200', '500000', '500000-500200-', '县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500222', '500200', '500000-500200-500222-', '綦江县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500223', '500200', '500000-500200-500223-', '潼南县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500224', '500200', '500000-500200-500224-', '铜梁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500225', '500200', '500000-500200-500225-', '大足县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500226', '500200', '500000-500200-500226-', '荣昌县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500227', '500200', '500000-500200-500227-', '璧山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500228', '500200', '500000-500200-500228-', '梁平县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500229', '500200', '500000-500200-500229-', '城口县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500230', '500200', '500000-500200-500230-', '丰都县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500231', '500200', '500000-500200-500231-', '垫江县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500232', '500200', '500000-500200-500232-', '武隆县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500233', '500200', '500000-500200-500233-', '忠　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500234', '500200', '500000-500200-500234-', '开　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500235', '500200', '500000-500200-500235-', '云阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500236', '500200', '500000-500200-500236-', '奉节县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500237', '500200', '500000-500200-500237-', '巫山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500238', '500200', '500000-500200-500238-', '巫溪县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500240', '500200', '500000-500200-500240-', '石柱土家族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500241', '500200', '500000-500200-500241-', '秀山土家族苗族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500242', '500200', '500000-500200-500242-', '酉阳土家族苗族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500243', '500200', '500000-500200-500243-', '彭水苗族土家族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500300', '500000', '500000-500300-', '市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500381', '500300', '500000-500300-500381-', '江津市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500382', '500300', '500000-500300-500382-', '合川市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500383', '500300', '500000-500300-500383-', '永川市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('500384', '500300', '500000-500300-500384-', '南川市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510000', '0', '510000-', '四川省', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510100', '510000', '510000-510100-', '成都市', '610000', '028', '1');
INSERT INTO `base_area` VALUES ('510101', '510100', '510000-510100-510101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510104', '510100', '510000-510100-510104-', '锦江区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510105', '510100', '510000-510100-510105-', '青羊区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510106', '510100', '510000-510100-510106-', '金牛区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510107', '510100', '510000-510100-510107-', '武侯区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510108', '510100', '510000-510100-510108-', '成华区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510112', '510100', '510000-510100-510112-', '龙泉驿区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510113', '510100', '510000-510100-510113-', '青白江区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510114', '510100', '510000-510100-510114-', '新都区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510115', '510100', '510000-510100-510115-', '温江区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510121', '510100', '510000-510100-510121-', '金堂县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510122', '510100', '510000-510100-510122-', '双流县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510124', '510100', '510000-510100-510124-', '郫　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510129', '510100', '510000-510100-510129-', '大邑县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510131', '510100', '510000-510100-510131-', '蒲江县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510132', '510100', '510000-510100-510132-', '新津县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510181', '510100', '510000-510100-510181-', '都江堰市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510182', '510100', '510000-510100-510182-', '彭州市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510183', '510100', '510000-510100-510183-', '邛崃市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510184', '510100', '510000-510100-510184-', '崇州市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510300', '510000', '510000-510300-', '自贡市', '643000', '0813', '1');
INSERT INTO `base_area` VALUES ('510301', '510300', '510000-510300-510301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510302', '510300', '510000-510300-510302-', '自流井区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510303', '510300', '510000-510300-510303-', '贡井区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510304', '510300', '510000-510300-510304-', '大安区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510311', '510300', '510000-510300-510311-', '沿滩区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510321', '510300', '510000-510300-510321-', '荣　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510322', '510300', '510000-510300-510322-', '富顺县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510400', '510000', '510000-510400-', '攀枝花市', '617000', '0812', '1');
INSERT INTO `base_area` VALUES ('510401', '510400', '510000-510400-510401-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510402', '510400', '510000-510400-510402-', '东　区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510403', '510400', '510000-510400-510403-', '西　区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510411', '510400', '510000-510400-510411-', '仁和区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510421', '510400', '510000-510400-510421-', '米易县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510422', '510400', '510000-510400-510422-', '盐边县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510500', '510000', '510000-510500-', '泸州市', '646000', '0830', '1');
INSERT INTO `base_area` VALUES ('510501', '510500', '510000-510500-510501-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510502', '510500', '510000-510500-510502-', '江阳区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510503', '510500', '510000-510500-510503-', '纳溪区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510504', '510500', '510000-510500-510504-', '龙马潭区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510521', '510500', '510000-510500-510521-', '泸　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510522', '510500', '510000-510500-510522-', '合江县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510524', '510500', '510000-510500-510524-', '叙永县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510525', '510500', '510000-510500-510525-', '古蔺县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510600', '510000', '510000-510600-', '德阳市', '618000', '0838', '1');
INSERT INTO `base_area` VALUES ('510601', '510600', '510000-510600-510601-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510603', '510600', '510000-510600-510603-', '旌阳区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510623', '510600', '510000-510600-510623-', '中江县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510626', '510600', '510000-510600-510626-', '罗江县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510681', '510600', '510000-510600-510681-', '广汉市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510682', '510600', '510000-510600-510682-', '什邡市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510683', '510600', '510000-510600-510683-', '绵竹市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510700', '510000', '510000-510700-', '绵阳市', '621000', '0816', '1');
INSERT INTO `base_area` VALUES ('510701', '510700', '510000-510700-510701-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510703', '510700', '510000-510700-510703-', '涪城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510704', '510700', '510000-510700-510704-', '游仙区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510722', '510700', '510000-510700-510722-', '三台县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510723', '510700', '510000-510700-510723-', '盐亭县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510724', '510700', '510000-510700-510724-', '安　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510725', '510700', '510000-510700-510725-', '梓潼县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510726', '510700', '510000-510700-510726-', '北川羌族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510727', '510700', '510000-510700-510727-', '平武县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510781', '510700', '510000-510700-510781-', '江油市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510800', '510000', '510000-510800-', '广元市', '628000', '0839', '1');
INSERT INTO `base_area` VALUES ('510801', '510800', '510000-510800-510801-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510802', '510800', '510000-510800-510802-', '市中区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510811', '510800', '510000-510800-510811-', '元坝区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510812', '510800', '510000-510800-510812-', '朝天区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510821', '510800', '510000-510800-510821-', '旺苍县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510822', '510800', '510000-510800-510822-', '青川县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510823', '510800', '510000-510800-510823-', '剑阁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510824', '510800', '510000-510800-510824-', '苍溪县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510900', '510000', '510000-510900-', '遂宁市', '629000', '0825', '1');
INSERT INTO `base_area` VALUES ('510901', '510900', '510000-510900-510901-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510903', '510900', '510000-510900-510903-', '船山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510904', '510900', '510000-510900-510904-', '安居区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510921', '510900', '510000-510900-510921-', '蓬溪县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510922', '510900', '510000-510900-510922-', '射洪县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('510923', '510900', '510000-510900-510923-', '大英县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511000', '510000', '510000-511000-', '内江市', '641000', '0832', '1');
INSERT INTO `base_area` VALUES ('511001', '511000', '510000-511000-511001-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511002', '511000', '510000-511000-511002-', '市中区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511011', '511000', '510000-511000-511011-', '东兴区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511024', '511000', '510000-511000-511024-', '威远县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511025', '511000', '510000-511000-511025-', '资中县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511028', '511000', '510000-511000-511028-', '隆昌县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511100', '510000', '510000-511100-', '乐山市', '614000', '0833', '1');
INSERT INTO `base_area` VALUES ('511101', '511100', '510000-511100-511101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511102', '511100', '510000-511100-511102-', '市中区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511111', '511100', '510000-511100-511111-', '沙湾区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511112', '511100', '510000-511100-511112-', '五通桥区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511113', '511100', '510000-511100-511113-', '金口河区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511123', '511100', '510000-511100-511123-', '犍为县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511124', '511100', '510000-511100-511124-', '井研县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511126', '511100', '510000-511100-511126-', '夹江县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511129', '511100', '510000-511100-511129-', '沐川县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511132', '511100', '510000-511100-511132-', '峨边彝族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511133', '511100', '510000-511100-511133-', '马边彝族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511181', '511100', '510000-511100-511181-', '峨眉山市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511300', '510000', '510000-511300-', '南充市', '637000', '0817', '1');
INSERT INTO `base_area` VALUES ('511301', '511300', '510000-511300-511301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511302', '511300', '510000-511300-511302-', '顺庆区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511303', '511300', '510000-511300-511303-', '高坪区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511304', '511300', '510000-511300-511304-', '嘉陵区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511321', '511300', '510000-511300-511321-', '南部县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511322', '511300', '510000-511300-511322-', '营山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511323', '511300', '510000-511300-511323-', '蓬安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511324', '511300', '510000-511300-511324-', '仪陇县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511325', '511300', '510000-511300-511325-', '西充县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511381', '511300', '510000-511300-511381-', '阆中市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511400', '510000', '510000-511400-', '眉山市', '620000', '028', '1');
INSERT INTO `base_area` VALUES ('511401', '511400', '510000-511400-511401-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511402', '511400', '510000-511400-511402-', '东坡区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511421', '511400', '510000-511400-511421-', '仁寿县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511422', '511400', '510000-511400-511422-', '彭山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511423', '511400', '510000-511400-511423-', '洪雅县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511424', '511400', '510000-511400-511424-', '丹棱县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511425', '511400', '510000-511400-511425-', '青神县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511500', '510000', '510000-511500-', '宜宾市', '644000', '0831', '1');
INSERT INTO `base_area` VALUES ('511501', '511500', '510000-511500-511501-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511502', '511500', '510000-511500-511502-', '翠屏区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511521', '511500', '510000-511500-511521-', '宜宾县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511522', '511500', '510000-511500-511522-', '南溪县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511523', '511500', '510000-511500-511523-', '江安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511524', '511500', '510000-511500-511524-', '长宁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511525', '511500', '510000-511500-511525-', '高　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511526', '511500', '510000-511500-511526-', '珙　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511527', '511500', '510000-511500-511527-', '筠连县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511528', '511500', '510000-511500-511528-', '兴文县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511529', '511500', '510000-511500-511529-', '屏山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511600', '510000', '510000-511600-', '广安市', '638000', '0826', '1');
INSERT INTO `base_area` VALUES ('511601', '511600', '510000-511600-511601-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511602', '511600', '510000-511600-511602-', '广安区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511621', '511600', '510000-511600-511621-', '岳池县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511622', '511600', '510000-511600-511622-', '武胜县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511623', '511600', '510000-511600-511623-', '邻水县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511681', '511600', '510000-511600-511681-', '华莹市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511700', '510000', '510000-511700-', '达州市', '635000', '0818', '1');
INSERT INTO `base_area` VALUES ('511701', '511700', '510000-511700-511701-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511702', '511700', '510000-511700-511702-', '通川区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511721', '511700', '510000-511700-511721-', '达　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511722', '511700', '510000-511700-511722-', '宣汉县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511723', '511700', '510000-511700-511723-', '开江县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511724', '511700', '510000-511700-511724-', '大竹县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511725', '511700', '510000-511700-511725-', '渠　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511781', '511700', '510000-511700-511781-', '万源市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511800', '510000', '510000-511800-', '雅安市', '625000', '0835', '1');
INSERT INTO `base_area` VALUES ('511801', '511800', '510000-511800-511801-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511802', '511800', '510000-511800-511802-', '雨城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511821', '511800', '510000-511800-511821-', '名山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511822', '511800', '510000-511800-511822-', '荥经县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511823', '511800', '510000-511800-511823-', '汉源县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511824', '511800', '510000-511800-511824-', '石棉县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511825', '511800', '510000-511800-511825-', '天全县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511826', '511800', '510000-511800-511826-', '芦山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511827', '511800', '510000-511800-511827-', '宝兴县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511900', '510000', '510000-511900-', '巴中市', '636600', '0827', '1');
INSERT INTO `base_area` VALUES ('511901', '511900', '510000-511900-511901-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511902', '511900', '510000-511900-511902-', '巴州区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511921', '511900', '510000-511900-511921-', '通江县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511922', '511900', '510000-511900-511922-', '南江县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('511923', '511900', '510000-511900-511923-', '平昌县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('512000', '510000', '510000-512000-', '资阳市', '641300', '028', '1');
INSERT INTO `base_area` VALUES ('512001', '512000', '510000-512000-512001-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('512002', '512000', '510000-512000-512002-', '雁江区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('512021', '512000', '510000-512000-512021-', '安岳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('512022', '512000', '510000-512000-512022-', '乐至县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('512081', '512000', '510000-512000-512081-', '简阳市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513200', '510000', '510000-513200-', '阿坝州', '624000', '0837', '1');
INSERT INTO `base_area` VALUES ('513221', '513200', '510000-513200-513221-', '汶川县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513222', '513200', '510000-513200-513222-', '理　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513223', '513200', '510000-513200-513223-', '茂　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513224', '513200', '510000-513200-513224-', '松潘县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513225', '513200', '510000-513200-513225-', '九寨沟县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513226', '513200', '510000-513200-513226-', '金川县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513227', '513200', '510000-513200-513227-', '小金县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513228', '513200', '510000-513200-513228-', '黑水县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513229', '513200', '510000-513200-513229-', '马尔康县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513230', '513200', '510000-513200-513230-', '壤塘县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513231', '513200', '510000-513200-513231-', '阿坝县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513232', '513200', '510000-513200-513232-', '若尔盖县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513233', '513200', '510000-513200-513233-', '红原县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513300', '510000', '510000-513300-', '甘孜州', '626000', '0836', '1');
INSERT INTO `base_area` VALUES ('513321', '513300', '510000-513300-513321-', '康定县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513322', '513300', '510000-513300-513322-', '泸定县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513323', '513300', '510000-513300-513323-', '丹巴县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513324', '513300', '510000-513300-513324-', '九龙县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513325', '513300', '510000-513300-513325-', '雅江县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513326', '513300', '510000-513300-513326-', '道孚县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513327', '513300', '510000-513300-513327-', '炉霍县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513328', '513300', '510000-513300-513328-', '甘孜县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513329', '513300', '510000-513300-513329-', '新龙县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513330', '513300', '510000-513300-513330-', '德格县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513331', '513300', '510000-513300-513331-', '白玉县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513332', '513300', '510000-513300-513332-', '石渠县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513333', '513300', '510000-513300-513333-', '色达县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513334', '513300', '510000-513300-513334-', '理塘县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513335', '513300', '510000-513300-513335-', '巴塘县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513336', '513300', '510000-513300-513336-', '乡城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513337', '513300', '510000-513300-513337-', '稻城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513338', '513300', '510000-513300-513338-', '得荣县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513400', '510000', '510000-513400-', '凉山州', '615000', '0834', '1');
INSERT INTO `base_area` VALUES ('513401', '513400', '510000-513400-513401-', '西昌市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513422', '513400', '510000-513400-513422-', '木里藏族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513423', '513400', '510000-513400-513423-', '盐源县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513424', '513400', '510000-513400-513424-', '德昌县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513425', '513400', '510000-513400-513425-', '会理县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513426', '513400', '510000-513400-513426-', '会东县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513427', '513400', '510000-513400-513427-', '宁南县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513428', '513400', '510000-513400-513428-', '普格县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513429', '513400', '510000-513400-513429-', '布拖县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513430', '513400', '510000-513400-513430-', '金阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513431', '513400', '510000-513400-513431-', '昭觉县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513432', '513400', '510000-513400-513432-', '喜德县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513433', '513400', '510000-513400-513433-', '冕宁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513434', '513400', '510000-513400-513434-', '越西县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513435', '513400', '510000-513400-513435-', '甘洛县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513436', '513400', '510000-513400-513436-', '美姑县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('513437', '513400', '510000-513400-513437-', '雷波县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520000', '0', '520000-', '贵州省', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520100', '520000', '520000-520100-', '贵阳市', '550000', '0851', '1');
INSERT INTO `base_area` VALUES ('520101', '520100', '520000-520100-520101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520102', '520100', '520000-520100-520102-', '南明区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520103', '520100', '520000-520100-520103-', '云岩区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520111', '520100', '520000-520100-520111-', '花溪区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520112', '520100', '520000-520100-520112-', '乌当区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520113', '520100', '520000-520100-520113-', '白云区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520114', '520100', '520000-520100-520114-', '小河区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520121', '520100', '520000-520100-520121-', '开阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520122', '520100', '520000-520100-520122-', '息烽县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520123', '520100', '520000-520100-520123-', '修文县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520181', '520100', '520000-520100-520181-', '清镇市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520200', '520000', '520000-520200-', '六盘水市', '553000', '0858', '1');
INSERT INTO `base_area` VALUES ('520201', '520200', '520000-520200-520201-', '钟山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520203', '520200', '520000-520200-520203-', '六枝特区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520221', '520200', '520000-520200-520221-', '水城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520222', '520200', '520000-520200-520222-', '盘　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520300', '520000', '520000-520300-', '遵义市', '563000', '0852', '1');
INSERT INTO `base_area` VALUES ('520301', '520300', '520000-520300-520301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520302', '520300', '520000-520300-520302-', '红花岗区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520303', '520300', '520000-520300-520303-', '汇川区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520321', '520300', '520000-520300-520321-', '遵义县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520322', '520300', '520000-520300-520322-', '桐梓县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520323', '520300', '520000-520300-520323-', '绥阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520324', '520300', '520000-520300-520324-', '正安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520325', '520300', '520000-520300-520325-', '道真仡佬族苗族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520326', '520300', '520000-520300-520326-', '务川仡佬族苗族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520327', '520300', '520000-520300-520327-', '凤冈县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520328', '520300', '520000-520300-520328-', '湄潭县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520329', '520300', '520000-520300-520329-', '余庆县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520330', '520300', '520000-520300-520330-', '习水县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520381', '520300', '520000-520300-520381-', '赤水市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520382', '520300', '520000-520300-520382-', '仁怀市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520400', '520000', '520000-520400-', '安顺市', '561000', '0853', '1');
INSERT INTO `base_area` VALUES ('520401', '520400', '520000-520400-520401-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520402', '520400', '520000-520400-520402-', '西秀区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520421', '520400', '520000-520400-520421-', '平坝县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520422', '520400', '520000-520400-520422-', '普定县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520423', '520400', '520000-520400-520423-', '镇宁布依族苗族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520424', '520400', '520000-520400-520424-', '关岭布依族苗族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('520425', '520400', '520000-520400-520425-', '紫云苗族布依族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522200', '520000', '520000-522200-', '铜仁地区', '554300', '0856', '1');
INSERT INTO `base_area` VALUES ('522201', '522200', '520000-522200-522201-', '铜仁市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522222', '522200', '520000-522200-522222-', '江口县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522223', '522200', '520000-522200-522223-', '玉屏侗族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522224', '522200', '520000-522200-522224-', '石阡县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522225', '522200', '520000-522200-522225-', '思南县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522226', '522200', '520000-522200-522226-', '印江土家族苗族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522227', '522200', '520000-522200-522227-', '德江县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522228', '522200', '520000-522200-522228-', '沿河土家族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522229', '522200', '520000-522200-522229-', '松桃苗族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522230', '522200', '520000-522200-522230-', '万山特区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522300', '520000', '520000-522300-', '黔西南州', '562400', '0859', '1');
INSERT INTO `base_area` VALUES ('522301', '522300', '520000-522300-522301-', '兴义市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522322', '522300', '520000-522300-522322-', '兴仁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522323', '522300', '520000-522300-522323-', '普安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522324', '522300', '520000-522300-522324-', '晴隆县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522325', '522300', '520000-522300-522325-', '贞丰县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522326', '522300', '520000-522300-522326-', '望谟县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522327', '522300', '520000-522300-522327-', '册亨县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522328', '522300', '520000-522300-522328-', '安龙县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522400', '520000', '520000-522400-', '毕节地区', '551700', '0857', '1');
INSERT INTO `base_area` VALUES ('522401', '522400', '520000-522400-522401-', '毕节市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522422', '522400', '520000-522400-522422-', '大方县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522423', '522400', '520000-522400-522423-', '黔西县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522424', '522400', '520000-522400-522424-', '金沙县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522425', '522400', '520000-522400-522425-', '织金县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522426', '522400', '520000-522400-522426-', '纳雍县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522427', '522400', '520000-522400-522427-', '威宁彝族回族苗族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522428', '522400', '520000-522400-522428-', '赫章县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522600', '520000', '520000-522600-', '黔东南州', '556000', '0855', '1');
INSERT INTO `base_area` VALUES ('522601', '522600', '520000-522600-522601-', '凯里市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522622', '522600', '520000-522600-522622-', '黄平县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522623', '522600', '520000-522600-522623-', '施秉县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522624', '522600', '520000-522600-522624-', '三穗县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522625', '522600', '520000-522600-522625-', '镇远县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522626', '522600', '520000-522600-522626-', '岑巩县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522627', '522600', '520000-522600-522627-', '天柱县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522628', '522600', '520000-522600-522628-', '锦屏县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522629', '522600', '520000-522600-522629-', '剑河县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522630', '522600', '520000-522600-522630-', '台江县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522631', '522600', '520000-522600-522631-', '黎平县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522632', '522600', '520000-522600-522632-', '榕江县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522633', '522600', '520000-522600-522633-', '从江县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522634', '522600', '520000-522600-522634-', '雷山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522635', '522600', '520000-522600-522635-', '麻江县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522636', '522600', '520000-522600-522636-', '丹寨县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522700', '520000', '520000-522700-', '黔南州', '558000', '0854', '1');
INSERT INTO `base_area` VALUES ('522701', '522700', '520000-522700-522701-', '都匀市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522702', '522700', '520000-522700-522702-', '福泉市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522722', '522700', '520000-522700-522722-', '荔波县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522723', '522700', '520000-522700-522723-', '贵定县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522725', '522700', '520000-522700-522725-', '瓮安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522726', '522700', '520000-522700-522726-', '独山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522727', '522700', '520000-522700-522727-', '平塘县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522728', '522700', '520000-522700-522728-', '罗甸县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522729', '522700', '520000-522700-522729-', '长顺县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522730', '522700', '520000-522700-522730-', '龙里县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522731', '522700', '520000-522700-522731-', '惠水县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('522732', '522700', '520000-522700-522732-', '三都水族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530000', '0', '530000-', '云南省', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530100', '530000', '530000-530100-', '昆明市', '650000', '0871', '1');
INSERT INTO `base_area` VALUES ('530101', '530100', '530000-530100-530101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530102', '530100', '530000-530100-530102-', '五华区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530103', '530100', '530000-530100-530103-', '盘龙区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530111', '530100', '530000-530100-530111-', '官渡区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530112', '530100', '530000-530100-530112-', '西山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530113', '530100', '530000-530100-530113-', '东川区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530121', '530100', '530000-530100-530121-', '呈贡县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530122', '530100', '530000-530100-530122-', '晋宁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530124', '530100', '530000-530100-530124-', '富民县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530125', '530100', '530000-530100-530125-', '宜良县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530126', '530100', '530000-530100-530126-', '石林彝族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530127', '530100', '530000-530100-530127-', '嵩明县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530128', '530100', '530000-530100-530128-', '禄劝彝族苗族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530129', '530100', '530000-530100-530129-', '寻甸回族彝族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530181', '530100', '530000-530100-530181-', '安宁市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530300', '530000', '530000-530300-', '曲靖市', '655000', '0874', '1');
INSERT INTO `base_area` VALUES ('530301', '530300', '530000-530300-530301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530302', '530300', '530000-530300-530302-', '麒麟区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530321', '530300', '530000-530300-530321-', '马龙县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530322', '530300', '530000-530300-530322-', '陆良县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530323', '530300', '530000-530300-530323-', '师宗县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530324', '530300', '530000-530300-530324-', '罗平县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530325', '530300', '530000-530300-530325-', '富源县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530326', '530300', '530000-530300-530326-', '会泽县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530328', '530300', '530000-530300-530328-', '沾益县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530381', '530300', '530000-530300-530381-', '宣威市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530400', '530000', '530000-530400-', '玉溪市', '653100', '0877', '1');
INSERT INTO `base_area` VALUES ('530401', '530400', '530000-530400-530401-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530402', '530400', '530000-530400-530402-', '红塔区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530421', '530400', '530000-530400-530421-', '江川县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530422', '530400', '530000-530400-530422-', '澄江县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530423', '530400', '530000-530400-530423-', '通海县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530424', '530400', '530000-530400-530424-', '华宁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530425', '530400', '530000-530400-530425-', '易门县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530426', '530400', '530000-530400-530426-', '峨山彝族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530427', '530400', '530000-530400-530427-', '新平彝族傣族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530428', '530400', '530000-530400-530428-', '元江哈尼族彝族傣族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530500', '530000', '530000-530500-', '保山市', '678000', '0875', '1');
INSERT INTO `base_area` VALUES ('530501', '530500', '530000-530500-530501-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530502', '530500', '530000-530500-530502-', '隆阳区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530521', '530500', '530000-530500-530521-', '施甸县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530522', '530500', '530000-530500-530522-', '腾冲县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530523', '530500', '530000-530500-530523-', '龙陵县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530524', '530500', '530000-530500-530524-', '昌宁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530600', '530000', '530000-530600-', '昭通市', '657000', '0870', '1');
INSERT INTO `base_area` VALUES ('530601', '530600', '530000-530600-530601-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530602', '530600', '530000-530600-530602-', '昭阳区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530621', '530600', '530000-530600-530621-', '鲁甸县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530622', '530600', '530000-530600-530622-', '巧家县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530623', '530600', '530000-530600-530623-', '盐津县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530624', '530600', '530000-530600-530624-', '大关县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530625', '530600', '530000-530600-530625-', '永善县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530626', '530600', '530000-530600-530626-', '绥江县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530627', '530600', '530000-530600-530627-', '镇雄县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530628', '530600', '530000-530600-530628-', '彝良县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530629', '530600', '530000-530600-530629-', '威信县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530630', '530600', '530000-530600-530630-', '水富县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530700', '530000', '530000-530700-', '丽江市', '674100', '0888', '1');
INSERT INTO `base_area` VALUES ('530701', '530700', '530000-530700-530701-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530702', '530700', '530000-530700-530702-', '古城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530721', '530700', '530000-530700-530721-', '玉龙纳西族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530722', '530700', '530000-530700-530722-', '永胜县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530723', '530700', '530000-530700-530723-', '华坪县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530724', '530700', '530000-530700-530724-', '宁蒗彝族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530800', '530000', '530000-530800-', '普洱市', '665000', '0879', '1');
INSERT INTO `base_area` VALUES ('530801', '530800', '530000-530800-530801-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530802', '530800', '530000-530800-530802-', '思茅区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530821', '530800', '530000-530800-530821-', '普洱哈尼族彝族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530822', '530800', '530000-530800-530822-', '墨江哈尼族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530823', '530800', '530000-530800-530823-', '景东彝族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530824', '530800', '530000-530800-530824-', '景谷傣族彝族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530825', '530800', '530000-530800-530825-', '镇沅彝族哈尼族拉祜族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530826', '530800', '530000-530800-530826-', '江城哈尼族彝族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530827', '530800', '530000-530800-530827-', '孟连傣族拉祜族佤族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530828', '530800', '530000-530800-530828-', '澜沧拉祜族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530829', '530800', '530000-530800-530829-', '西盟佤族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530900', '530000', '530000-530900-', '临沧市', '677000', '0883', '1');
INSERT INTO `base_area` VALUES ('530901', '530900', '530000-530900-530901-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530902', '530900', '530000-530900-530902-', '临翔区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530921', '530900', '530000-530900-530921-', '凤庆县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530922', '530900', '530000-530900-530922-', '云　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530923', '530900', '530000-530900-530923-', '永德县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530924', '530900', '530000-530900-530924-', '镇康县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530925', '530900', '530000-530900-530925-', '双江拉祜族佤族布朗族傣族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530926', '530900', '530000-530900-530926-', '耿马傣族佤族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('530927', '530900', '530000-530900-530927-', '沧源佤族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532300', '530000', '530000-532300-', '楚雄州', '675000', '0878', '1');
INSERT INTO `base_area` VALUES ('532301', '532300', '530000-532300-532301-', '楚雄市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532322', '532300', '530000-532300-532322-', '双柏县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532323', '532300', '530000-532300-532323-', '牟定县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532324', '532300', '530000-532300-532324-', '南华县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532325', '532300', '530000-532300-532325-', '姚安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532326', '532300', '530000-532300-532326-', '大姚县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532327', '532300', '530000-532300-532327-', '永仁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532328', '532300', '530000-532300-532328-', '元谋县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532329', '532300', '530000-532300-532329-', '武定县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532331', '532300', '530000-532300-532331-', '禄丰县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532500', '530000', '530000-532500-', '红河州', '661400', '0873', '1');
INSERT INTO `base_area` VALUES ('532501', '532500', '530000-532500-532501-', '个旧市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532502', '532500', '530000-532500-532502-', '开远市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532522', '532500', '530000-532500-532522-', '蒙自县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532523', '532500', '530000-532500-532523-', '屏边苗族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532524', '532500', '530000-532500-532524-', '建水县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532525', '532500', '530000-532500-532525-', '石屏县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532526', '532500', '530000-532500-532526-', '弥勒县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532527', '532500', '530000-532500-532527-', '泸西县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532528', '532500', '530000-532500-532528-', '元阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532529', '532500', '530000-532500-532529-', '红河县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532530', '532500', '530000-532500-532530-', '金平苗族瑶族傣族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532531', '532500', '530000-532500-532531-', '绿春县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532532', '532500', '530000-532500-532532-', '河口瑶族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532600', '530000', '530000-532600-', '文山州', '663000', '0876', '1');
INSERT INTO `base_area` VALUES ('532621', '532600', '530000-532600-532621-', '文山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532622', '532600', '530000-532600-532622-', '砚山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532623', '532600', '530000-532600-532623-', '西畴县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532624', '532600', '530000-532600-532624-', '麻栗坡县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532625', '532600', '530000-532600-532625-', '马关县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532626', '532600', '530000-532600-532626-', '丘北县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532627', '532600', '530000-532600-532627-', '广南县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532628', '532600', '530000-532600-532628-', '富宁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532800', '530000', '530000-532800-', '西双版纳州', '666100', '0691', '1');
INSERT INTO `base_area` VALUES ('532801', '532800', '530000-532800-532801-', '景洪市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532822', '532800', '530000-532800-532822-', '勐海县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532823', '532800', '530000-532800-532823-', '勐腊县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532900', '530000', '530000-532900-', '大理州', '671000', '0872', '1');
INSERT INTO `base_area` VALUES ('532901', '532900', '530000-532900-532901-', '大理市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532922', '532900', '530000-532900-532922-', '漾濞彝族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532923', '532900', '530000-532900-532923-', '祥云县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532924', '532900', '530000-532900-532924-', '宾川县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532925', '532900', '530000-532900-532925-', '弥渡县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532926', '532900', '530000-532900-532926-', '南涧彝族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532927', '532900', '530000-532900-532927-', '巍山彝族回族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532928', '532900', '530000-532900-532928-', '永平县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532929', '532900', '530000-532900-532929-', '云龙县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532930', '532900', '530000-532900-532930-', '洱源县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532931', '532900', '530000-532900-532931-', '剑川县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('532932', '532900', '530000-532900-532932-', '鹤庆县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('533100', '530000', '530000-533100-', '德宏州', '678400', '0692', '1');
INSERT INTO `base_area` VALUES ('533102', '533100', '530000-533100-533102-', '瑞丽市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('533103', '533100', '530000-533100-533103-', '潞西市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('533122', '533100', '530000-533100-533122-', '梁河县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('533123', '533100', '530000-533100-533123-', '盈江县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('533124', '533100', '530000-533100-533124-', '陇川县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('533300', '530000', '530000-533300-', '怒江州', '673100', '0886', '1');
INSERT INTO `base_area` VALUES ('533321', '533300', '530000-533300-533321-', '泸水县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('533323', '533300', '530000-533300-533323-', '福贡县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('533324', '533300', '530000-533300-533324-', '贡山独龙族怒族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('533325', '533300', '530000-533300-533325-', '兰坪白族普米族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('533400', '530000', '530000-533400-', '迪庆州', '674400', '0887', '1');
INSERT INTO `base_area` VALUES ('533421', '533400', '530000-533400-533421-', '香格里拉县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('533422', '533400', '530000-533400-533422-', '德钦县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('533423', '533400', '530000-533400-533423-', '维西傈僳族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('540000', '0', '540000-', '西藏自治区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('540100', '540000', '540000-540100-', '拉萨市', '850000', '0891', '1');
INSERT INTO `base_area` VALUES ('540101', '540100', '540000-540100-540101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('540102', '540100', '540000-540100-540102-', '城关区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('540121', '540100', '540000-540100-540121-', '林周县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('540122', '540100', '540000-540100-540122-', '当雄县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('540123', '540100', '540000-540100-540123-', '尼木县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('540124', '540100', '540000-540100-540124-', '曲水县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('540125', '540100', '540000-540100-540125-', '堆龙德庆县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('540126', '540100', '540000-540100-540126-', '达孜县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('540127', '540100', '540000-540100-540127-', '墨竹工卡县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542100', '540000', '540000-542100-', '昌都地区', '854000', '0895', '1');
INSERT INTO `base_area` VALUES ('542121', '542100', '540000-542100-542121-', '昌都县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542122', '542100', '540000-542100-542122-', '江达县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542123', '542100', '540000-542100-542123-', '贡觉县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542124', '542100', '540000-542100-542124-', '类乌齐县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542125', '542100', '540000-542100-542125-', '丁青县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542126', '542100', '540000-542100-542126-', '察雅县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542127', '542100', '540000-542100-542127-', '八宿县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542128', '542100', '540000-542100-542128-', '左贡县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542129', '542100', '540000-542100-542129-', '芒康县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542132', '542100', '540000-542100-542132-', '洛隆县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542133', '542100', '540000-542100-542133-', '边坝县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542200', '540000', '540000-542200-', '山南地区', '856000', '0893', '1');
INSERT INTO `base_area` VALUES ('542221', '542200', '540000-542200-542221-', '乃东县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542222', '542200', '540000-542200-542222-', '扎囊县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542223', '542200', '540000-542200-542223-', '贡嘎县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542224', '542200', '540000-542200-542224-', '桑日县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542225', '542200', '540000-542200-542225-', '琼结县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542226', '542200', '540000-542200-542226-', '曲松县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542227', '542200', '540000-542200-542227-', '措美县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542228', '542200', '540000-542200-542228-', '洛扎县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542229', '542200', '540000-542200-542229-', '加查县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542231', '542200', '540000-542200-542231-', '隆子县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542232', '542200', '540000-542200-542232-', '错那县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542233', '542200', '540000-542200-542233-', '浪卡子县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542300', '540000', '540000-542300-', '日喀则地区', '857000', '0892', '1');
INSERT INTO `base_area` VALUES ('542301', '542300', '540000-542300-542301-', '日喀则市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542322', '542300', '540000-542300-542322-', '南木林县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542323', '542300', '540000-542300-542323-', '江孜县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542324', '542300', '540000-542300-542324-', '定日县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542325', '542300', '540000-542300-542325-', '萨迦县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542326', '542300', '540000-542300-542326-', '拉孜县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542327', '542300', '540000-542300-542327-', '昂仁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542328', '542300', '540000-542300-542328-', '谢通门县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542329', '542300', '540000-542300-542329-', '白朗县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542330', '542300', '540000-542300-542330-', '仁布县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542331', '542300', '540000-542300-542331-', '康马县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542332', '542300', '540000-542300-542332-', '定结县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542333', '542300', '540000-542300-542333-', '仲巴县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542334', '542300', '540000-542300-542334-', '亚东县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542335', '542300', '540000-542300-542335-', '吉隆县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542336', '542300', '540000-542300-542336-', '聂拉木县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542337', '542300', '540000-542300-542337-', '萨嘎县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542338', '542300', '540000-542300-542338-', '岗巴县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542400', '540000', '540000-542400-', '那曲地区', '852000', '0896', '1');
INSERT INTO `base_area` VALUES ('542421', '542400', '540000-542400-542421-', '那曲县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542422', '542400', '540000-542400-542422-', '嘉黎县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542423', '542400', '540000-542400-542423-', '比如县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542424', '542400', '540000-542400-542424-', '聂荣县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542425', '542400', '540000-542400-542425-', '安多县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542426', '542400', '540000-542400-542426-', '申扎县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542427', '542400', '540000-542400-542427-', '索　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542428', '542400', '540000-542400-542428-', '班戈县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542429', '542400', '540000-542400-542429-', '巴青县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542430', '542400', '540000-542400-542430-', '尼玛县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542500', '540000', '540000-542500-', '阿里地区', '859000', '0897', '1');
INSERT INTO `base_area` VALUES ('542521', '542500', '540000-542500-542521-', '普兰县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542522', '542500', '540000-542500-542522-', '札达县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542523', '542500', '540000-542500-542523-', '噶尔县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542524', '542500', '540000-542500-542524-', '日土县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542525', '542500', '540000-542500-542525-', '革吉县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542526', '542500', '540000-542500-542526-', '改则县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542527', '542500', '540000-542500-542527-', '措勤县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542600', '540000', '540000-542600-', '林芝地区', '860000', '0894', '1');
INSERT INTO `base_area` VALUES ('542621', '542600', '540000-542600-542621-', '林芝县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542622', '542600', '540000-542600-542622-', '工布江达县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542623', '542600', '540000-542600-542623-', '米林县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542624', '542600', '540000-542600-542624-', '墨脱县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542625', '542600', '540000-542600-542625-', '波密县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542626', '542600', '540000-542600-542626-', '察隅县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('542627', '542600', '540000-542600-542627-', '朗　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610000', '0', '610000-', '陕西省', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610100', '610000', '610000-610100-', '西安市', '710000', '029', '1');
INSERT INTO `base_area` VALUES ('610101', '610100', '610000-610100-610101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610102', '610100', '610000-610100-610102-', '新城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610103', '610100', '610000-610100-610103-', '碑林区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610104', '610100', '610000-610100-610104-', '莲湖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610111', '610100', '610000-610100-610111-', '灞桥区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610112', '610100', '610000-610100-610112-', '未央区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610113', '610100', '610000-610100-610113-', '雁塔区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610114', '610100', '610000-610100-610114-', '阎良区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610115', '610100', '610000-610100-610115-', '临潼区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610116', '610100', '610000-610100-610116-', '长安区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610122', '610100', '610000-610100-610122-', '蓝田县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610124', '610100', '610000-610100-610124-', '周至县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610125', '610100', '610000-610100-610125-', '户　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610126', '610100', '610000-610100-610126-', '高陵县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610200', '610000', '610000-610200-', '铜川市', '727000', '0919', '1');
INSERT INTO `base_area` VALUES ('610201', '610200', '610000-610200-610201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610202', '610200', '610000-610200-610202-', '王益区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610203', '610200', '610000-610200-610203-', '印台区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610204', '610200', '610000-610200-610204-', '耀州区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610222', '610200', '610000-610200-610222-', '宜君县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610300', '610000', '610000-610300-', '宝鸡市', '721000', '0917', '1');
INSERT INTO `base_area` VALUES ('610301', '610300', '610000-610300-610301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610302', '610300', '610000-610300-610302-', '渭滨区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610303', '610300', '610000-610300-610303-', '金台区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610304', '610300', '610000-610300-610304-', '陈仓区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610322', '610300', '610000-610300-610322-', '凤翔县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610323', '610300', '610000-610300-610323-', '岐山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610324', '610300', '610000-610300-610324-', '扶风县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610326', '610300', '610000-610300-610326-', '眉　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610327', '610300', '610000-610300-610327-', '陇　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610328', '610300', '610000-610300-610328-', '千阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610329', '610300', '610000-610300-610329-', '麟游县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610330', '610300', '610000-610300-610330-', '凤　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610331', '610300', '610000-610300-610331-', '太白县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610400', '610000', '610000-610400-', '咸阳市', '712000', '029', '1');
INSERT INTO `base_area` VALUES ('610401', '610400', '610000-610400-610401-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610402', '610400', '610000-610400-610402-', '秦都区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610403', '610400', '610000-610400-610403-', '杨凌区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610404', '610400', '610000-610400-610404-', '渭城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610422', '610400', '610000-610400-610422-', '三原县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610423', '610400', '610000-610400-610423-', '泾阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610424', '610400', '610000-610400-610424-', '乾　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610425', '610400', '610000-610400-610425-', '礼泉县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610426', '610400', '610000-610400-610426-', '永寿县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610427', '610400', '610000-610400-610427-', '彬　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610428', '610400', '610000-610400-610428-', '长武县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610429', '610400', '610000-610400-610429-', '旬邑县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610430', '610400', '610000-610400-610430-', '淳化县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610431', '610400', '610000-610400-610431-', '武功县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610481', '610400', '610000-610400-610481-', '兴平市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610500', '610000', '610000-610500-', '渭南市', '714000', '0913', '1');
INSERT INTO `base_area` VALUES ('610501', '610500', '610000-610500-610501-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610502', '610500', '610000-610500-610502-', '临渭区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610521', '610500', '610000-610500-610521-', '华　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610522', '610500', '610000-610500-610522-', '潼关县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610523', '610500', '610000-610500-610523-', '大荔县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610524', '610500', '610000-610500-610524-', '合阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610525', '610500', '610000-610500-610525-', '澄城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610526', '610500', '610000-610500-610526-', '蒲城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610527', '610500', '610000-610500-610527-', '白水县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610528', '610500', '610000-610500-610528-', '富平县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610581', '610500', '610000-610500-610581-', '韩城市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610582', '610500', '610000-610500-610582-', '华阴市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610600', '610000', '610000-610600-', '延安市', '716000', '0911', '1');
INSERT INTO `base_area` VALUES ('610601', '610600', '610000-610600-610601-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610602', '610600', '610000-610600-610602-', '宝塔区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610621', '610600', '610000-610600-610621-', '延长县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610622', '610600', '610000-610600-610622-', '延川县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610623', '610600', '610000-610600-610623-', '子长县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610624', '610600', '610000-610600-610624-', '安塞县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610625', '610600', '610000-610600-610625-', '志丹县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610626', '610600', '610000-610600-610626-', '吴旗县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610627', '610600', '610000-610600-610627-', '甘泉县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610628', '610600', '610000-610600-610628-', '富　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610629', '610600', '610000-610600-610629-', '洛川县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610630', '610600', '610000-610600-610630-', '宜川县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610631', '610600', '610000-610600-610631-', '黄龙县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610632', '610600', '610000-610600-610632-', '黄陵县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610700', '610000', '610000-610700-', '汉中市', '723000', '0916', '1');
INSERT INTO `base_area` VALUES ('610701', '610700', '610000-610700-610701-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610702', '610700', '610000-610700-610702-', '汉台区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610721', '610700', '610000-610700-610721-', '南郑县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610722', '610700', '610000-610700-610722-', '城固县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610723', '610700', '610000-610700-610723-', '洋　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610724', '610700', '610000-610700-610724-', '西乡县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610725', '610700', '610000-610700-610725-', '勉　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610726', '610700', '610000-610700-610726-', '宁强县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610727', '610700', '610000-610700-610727-', '略阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610728', '610700', '610000-610700-610728-', '镇巴县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610729', '610700', '610000-610700-610729-', '留坝县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610730', '610700', '610000-610700-610730-', '佛坪县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610800', '610000', '610000-610800-', '榆林市', '719000', '0912', '1');
INSERT INTO `base_area` VALUES ('610801', '610800', '610000-610800-610801-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610802', '610800', '610000-610800-610802-', '榆阳区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610821', '610800', '610000-610800-610821-', '神木县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610822', '610800', '610000-610800-610822-', '府谷县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610823', '610800', '610000-610800-610823-', '横山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610824', '610800', '610000-610800-610824-', '靖边县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610825', '610800', '610000-610800-610825-', '定边县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610826', '610800', '610000-610800-610826-', '绥德县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610827', '610800', '610000-610800-610827-', '米脂县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610828', '610800', '610000-610800-610828-', '佳　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610829', '610800', '610000-610800-610829-', '吴堡县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610830', '610800', '610000-610800-610830-', '清涧县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610831', '610800', '610000-610800-610831-', '子洲县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610900', '610000', '610000-610900-', '安康市', '725000', '0915', '1');
INSERT INTO `base_area` VALUES ('610901', '610900', '610000-610900-610901-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610902', '610900', '610000-610900-610902-', '汉滨区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610921', '610900', '610000-610900-610921-', '汉阴县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610922', '610900', '610000-610900-610922-', '石泉县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610923', '610900', '610000-610900-610923-', '宁陕县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610924', '610900', '610000-610900-610924-', '紫阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610925', '610900', '610000-610900-610925-', '岚皋县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610926', '610900', '610000-610900-610926-', '平利县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610927', '610900', '610000-610900-610927-', '镇坪县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610928', '610900', '610000-610900-610928-', '旬阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('610929', '610900', '610000-610900-610929-', '白河县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('611000', '610000', '610000-611000-', '商洛市', '726000', '0914', '1');
INSERT INTO `base_area` VALUES ('611001', '611000', '610000-611000-611001-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('611002', '611000', '610000-611000-611002-', '商州区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('611021', '611000', '610000-611000-611021-', '洛南县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('611022', '611000', '610000-611000-611022-', '丹凤县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('611023', '611000', '610000-611000-611023-', '商南县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('611024', '611000', '610000-611000-611024-', '山阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('611025', '611000', '610000-611000-611025-', '镇安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('611026', '611000', '610000-611000-611026-', '柞水县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620000', '0', '620000-', '甘肃省', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620100', '620000', '620000-620100-', '兰州市', '730000', '0931', '1');
INSERT INTO `base_area` VALUES ('620101', '620100', '620000-620100-620101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620102', '620100', '620000-620100-620102-', '城关区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620103', '620100', '620000-620100-620103-', '七里河区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620104', '620100', '620000-620100-620104-', '西固区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620105', '620100', '620000-620100-620105-', '安宁区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620111', '620100', '620000-620100-620111-', '红古区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620121', '620100', '620000-620100-620121-', '永登县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620122', '620100', '620000-620100-620122-', '皋兰县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620123', '620100', '620000-620100-620123-', '榆中县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620200', '620000', '620000-620200-', '嘉峪关市', '735100', '0937', '1');
INSERT INTO `base_area` VALUES ('620201', '620200', '620000-620200-620201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620300', '620000', '620000-620300-', '金昌市', '737100', '0935', '1');
INSERT INTO `base_area` VALUES ('620301', '620300', '620000-620300-620301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620302', '620300', '620000-620300-620302-', '金川区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620321', '620300', '620000-620300-620321-', '永昌县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620400', '620000', '620000-620400-', '白银市', '730900', '0943', '1');
INSERT INTO `base_area` VALUES ('620401', '620400', '620000-620400-620401-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620402', '620400', '620000-620400-620402-', '白银区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620403', '620400', '620000-620400-620403-', '平川区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620421', '620400', '620000-620400-620421-', '靖远县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620422', '620400', '620000-620400-620422-', '会宁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620423', '620400', '620000-620400-620423-', '景泰县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620500', '620000', '620000-620500-', '天水市', '741000', '0938', '1');
INSERT INTO `base_area` VALUES ('620501', '620500', '620000-620500-620501-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620502', '620500', '620000-620500-620502-', '秦城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620503', '620500', '620000-620500-620503-', '北道区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620521', '620500', '620000-620500-620521-', '清水县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620522', '620500', '620000-620500-620522-', '秦安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620523', '620500', '620000-620500-620523-', '甘谷县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620524', '620500', '620000-620500-620524-', '武山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620525', '620500', '620000-620500-620525-', '张家川回族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620600', '620000', '620000-620600-', '武威市', '733000', '0935', '1');
INSERT INTO `base_area` VALUES ('620601', '620600', '620000-620600-620601-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620602', '620600', '620000-620600-620602-', '凉州区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620621', '620600', '620000-620600-620621-', '民勤县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620622', '620600', '620000-620600-620622-', '古浪县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620623', '620600', '620000-620600-620623-', '天祝藏族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620700', '620000', '620000-620700-', '张掖市', '734000', '0936', '1');
INSERT INTO `base_area` VALUES ('620701', '620700', '620000-620700-620701-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620702', '620700', '620000-620700-620702-', '甘州区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620721', '620700', '620000-620700-620721-', '肃南裕固族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620722', '620700', '620000-620700-620722-', '民乐县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620723', '620700', '620000-620700-620723-', '临泽县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620724', '620700', '620000-620700-620724-', '高台县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620725', '620700', '620000-620700-620725-', '山丹县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620800', '620000', '620000-620800-', '平凉市', '744000', '0933', '1');
INSERT INTO `base_area` VALUES ('620801', '620800', '620000-620800-620801-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620802', '620800', '620000-620800-620802-', '崆峒区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620821', '620800', '620000-620800-620821-', '泾川县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620822', '620800', '620000-620800-620822-', '灵台县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620823', '620800', '620000-620800-620823-', '崇信县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620824', '620800', '620000-620800-620824-', '华亭县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620825', '620800', '620000-620800-620825-', '庄浪县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620826', '620800', '620000-620800-620826-', '静宁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620900', '620000', '620000-620900-', '酒泉市', '735000', '0937', '1');
INSERT INTO `base_area` VALUES ('620901', '620900', '620000-620900-620901-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620902', '620900', '620000-620900-620902-', '肃州区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620921', '620900', '620000-620900-620921-', '金塔县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620922', '620900', '620000-620900-620922-', '安西县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620923', '620900', '620000-620900-620923-', '肃北蒙古族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620924', '620900', '620000-620900-620924-', '阿克塞哈萨克族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620981', '620900', '620000-620900-620981-', '玉门市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('620982', '620900', '620000-620900-620982-', '敦煌市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('621000', '620000', '620000-621000-', '庆阳市', '745000', '0934', '1');
INSERT INTO `base_area` VALUES ('621001', '621000', '620000-621000-621001-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('621002', '621000', '620000-621000-621002-', '西峰区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('621021', '621000', '620000-621000-621021-', '庆城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('621022', '621000', '620000-621000-621022-', '环　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('621023', '621000', '620000-621000-621023-', '华池县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('621024', '621000', '620000-621000-621024-', '合水县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('621025', '621000', '620000-621000-621025-', '正宁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('621026', '621000', '620000-621000-621026-', '宁　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('621027', '621000', '620000-621000-621027-', '镇原县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('621100', '620000', '620000-621100-', '定西市', '743000', '0932', '1');
INSERT INTO `base_area` VALUES ('621101', '621100', '620000-621100-621101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('621102', '621100', '620000-621100-621102-', '安定区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('621121', '621100', '620000-621100-621121-', '通渭县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('621122', '621100', '620000-621100-621122-', '陇西县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('621123', '621100', '620000-621100-621123-', '渭源县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('621124', '621100', '620000-621100-621124-', '临洮县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('621125', '621100', '620000-621100-621125-', '漳　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('621126', '621100', '620000-621100-621126-', '岷　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('621200', '620000', '620000-621200-', '陇南市', '742500', '0939', '1');
INSERT INTO `base_area` VALUES ('621201', '621200', '620000-621200-621201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('621202', '621200', '620000-621200-621202-', '武都区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('621221', '621200', '620000-621200-621221-', '成　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('621222', '621200', '620000-621200-621222-', '文　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('621223', '621200', '620000-621200-621223-', '宕昌县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('621224', '621200', '620000-621200-621224-', '康　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('621225', '621200', '620000-621200-621225-', '西和县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('621226', '621200', '620000-621200-621226-', '礼　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('621227', '621200', '620000-621200-621227-', '徽　县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('621228', '621200', '620000-621200-621228-', '两当县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('622900', '620000', '620000-622900-', '临夏州', '731100', '0930', '1');
INSERT INTO `base_area` VALUES ('622901', '622900', '620000-622900-622901-', '临夏市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('622921', '622900', '620000-622900-622921-', '临夏县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('622922', '622900', '620000-622900-622922-', '康乐县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('622923', '622900', '620000-622900-622923-', '永靖县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('622924', '622900', '620000-622900-622924-', '广河县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('622925', '622900', '620000-622900-622925-', '和政县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('622926', '622900', '620000-622900-622926-', '东乡族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('622927', '622900', '620000-622900-622927-', '积石山保安族东乡族撒拉族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('623000', '620000', '620000-623000-', '甘南州', '747000', '0941', '1');
INSERT INTO `base_area` VALUES ('623001', '623000', '620000-623000-623001-', '合作市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('623021', '623000', '620000-623000-623021-', '临潭县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('623022', '623000', '620000-623000-623022-', '卓尼县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('623023', '623000', '620000-623000-623023-', '舟曲县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('623024', '623000', '620000-623000-623024-', '迭部县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('623025', '623000', '620000-623000-623025-', '玛曲县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('623026', '623000', '620000-623000-623026-', '碌曲县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('623027', '623000', '620000-623000-623027-', '夏河县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('630000', '0', '630000-', '青海省', '0', '0', '1');
INSERT INTO `base_area` VALUES ('630100', '630000', '630000-630100-', '西宁市', '810000', '0971', '1');
INSERT INTO `base_area` VALUES ('630101', '630100', '630000-630100-630101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('630102', '630100', '630000-630100-630102-', '城东区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('630103', '630100', '630000-630100-630103-', '城中区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('630104', '630100', '630000-630100-630104-', '城西区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('630105', '630100', '630000-630100-630105-', '城北区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('630121', '630100', '630000-630100-630121-', '大通回族土族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('630122', '630100', '630000-630100-630122-', '湟中县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('630123', '630100', '630000-630100-630123-', '湟源县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632100', '630000', '630000-632100-', '海东地区', '810600', '0972', '1');
INSERT INTO `base_area` VALUES ('632121', '632100', '630000-632100-632121-', '平安县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632122', '632100', '630000-632100-632122-', '民和回族土族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632123', '632100', '630000-632100-632123-', '乐都县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632126', '632100', '630000-632100-632126-', '互助土族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632127', '632100', '630000-632100-632127-', '化隆回族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632128', '632100', '630000-632100-632128-', '循化撒拉族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632200', '630000', '630000-632200-', '海北州', '812200', '0970', '1');
INSERT INTO `base_area` VALUES ('632221', '632200', '630000-632200-632221-', '门源回族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632222', '632200', '630000-632200-632222-', '祁连县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632223', '632200', '630000-632200-632223-', '海晏县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632224', '632200', '630000-632200-632224-', '刚察县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632300', '630000', '630000-632300-', '黄南州', '811300', '0973', '1');
INSERT INTO `base_area` VALUES ('632321', '632300', '630000-632300-632321-', '同仁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632322', '632300', '630000-632300-632322-', '尖扎县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632323', '632300', '630000-632300-632323-', '泽库县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632324', '632300', '630000-632300-632324-', '河南蒙古族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632500', '630000', '630000-632500-', '海南州', '813000', '0974', '1');
INSERT INTO `base_area` VALUES ('632521', '632500', '630000-632500-632521-', '共和县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632522', '632500', '630000-632500-632522-', '同德县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632523', '632500', '630000-632500-632523-', '贵德县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632524', '632500', '630000-632500-632524-', '兴海县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632525', '632500', '630000-632500-632525-', '贵南县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632600', '630000', '630000-632600-', '果洛州', '814000', '0975', '1');
INSERT INTO `base_area` VALUES ('632621', '632600', '630000-632600-632621-', '玛沁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632622', '632600', '630000-632600-632622-', '班玛县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632623', '632600', '630000-632600-632623-', '甘德县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632624', '632600', '630000-632600-632624-', '达日县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632625', '632600', '630000-632600-632625-', '久治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632626', '632600', '630000-632600-632626-', '玛多县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632700', '630000', '630000-632700-', '玉树州', '815000', '0976', '1');
INSERT INTO `base_area` VALUES ('632721', '632700', '630000-632700-632721-', '玉树县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632722', '632700', '630000-632700-632722-', '杂多县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632723', '632700', '630000-632700-632723-', '称多县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632724', '632700', '630000-632700-632724-', '治多县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632725', '632700', '630000-632700-632725-', '囊谦县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632726', '632700', '630000-632700-632726-', '曲麻莱县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632800', '630000', '630000-632800-', '海西州', '817000', '0977', '1');
INSERT INTO `base_area` VALUES ('632801', '632800', '630000-632800-632801-', '格尔木市', '816000', '0979', '1');
INSERT INTO `base_area` VALUES ('632802', '632800', '630000-632800-632802-', '德令哈市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632821', '632800', '630000-632800-632821-', '乌兰县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632822', '632800', '630000-632800-632822-', '都兰县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('632823', '632800', '630000-632800-632823-', '天峻县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('640000', '0', '640000-', '宁夏回族自治区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('640100', '640000', '640000-640100-', '银川市', '750000', '0951', '1');
INSERT INTO `base_area` VALUES ('640101', '640100', '640000-640100-640101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('640104', '640100', '640000-640100-640104-', '兴庆区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('640105', '640100', '640000-640100-640105-', '西夏区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('640106', '640100', '640000-640100-640106-', '金凤区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('640121', '640100', '640000-640100-640121-', '永宁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('640122', '640100', '640000-640100-640122-', '贺兰县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('640181', '640100', '640000-640100-640181-', '灵武市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('640200', '640000', '640000-640200-', '石嘴山市', '753000', '0952', '1');
INSERT INTO `base_area` VALUES ('640201', '640200', '640000-640200-640201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('640202', '640200', '640000-640200-640202-', '大武口区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('640205', '640200', '640000-640200-640205-', '惠农区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('640221', '640200', '640000-640200-640221-', '平罗县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('640300', '640000', '640000-640300-', '吴忠市', '751100', '0953', '1');
INSERT INTO `base_area` VALUES ('640301', '640300', '640000-640300-640301-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('640302', '640300', '640000-640300-640302-', '利通区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('640323', '640300', '640000-640300-640323-', '盐池县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('640324', '640300', '640000-640300-640324-', '同心县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('640381', '640300', '640000-640300-640381-', '青铜峡市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('640400', '640000', '640000-640400-', '固原市', '756000', '0954', '1');
INSERT INTO `base_area` VALUES ('640401', '640400', '640000-640400-640401-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('640402', '640400', '640000-640400-640402-', '原州区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('640422', '640400', '640000-640400-640422-', '西吉县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('640423', '640400', '640000-640400-640423-', '隆德县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('640424', '640400', '640000-640400-640424-', '泾源县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('640425', '640400', '640000-640400-640425-', '彭阳县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('640500', '640000', '640000-640500-', '中卫市', '755000', '0955', '1');
INSERT INTO `base_area` VALUES ('640501', '640500', '640000-640500-640501-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('640502', '640500', '640000-640500-640502-', '沙坡头区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('640521', '640500', '640000-640500-640521-', '中宁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('640522', '640500', '640000-640500-640522-', '海原县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('650000', '0', '650000-', '新疆维吾尔自治区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('650100', '650000', '650000-650100-', '乌鲁木齐市', '830000', '0991', '1');
INSERT INTO `base_area` VALUES ('650101', '650100', '650000-650100-650101-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('650102', '650100', '650000-650100-650102-', '天山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('650103', '650100', '650000-650100-650103-', '沙依巴克区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('650104', '650100', '650000-650100-650104-', '新市区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('650105', '650100', '650000-650100-650105-', '水磨沟区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('650106', '650100', '650000-650100-650106-', '头屯河区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('650107', '650100', '650000-650100-650107-', '达坂城区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('650108', '650100', '650000-650100-650108-', '东山区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('650121', '650100', '650000-650100-650121-', '乌鲁木齐县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('650200', '650000', '650000-650200-', '克拉玛依市', '834000', '0990', '1');
INSERT INTO `base_area` VALUES ('650201', '650200', '650000-650200-650201-', '市辖区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('650202', '650200', '650000-650200-650202-', '独山子区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('650203', '650200', '650000-650200-650203-', '克拉玛依区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('650204', '650200', '650000-650200-650204-', '白碱滩区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('650205', '650200', '650000-650200-650205-', '乌尔禾区', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652100', '650000', '650000-652100-', '吐鲁番地区', '838000', '0995', '1');
INSERT INTO `base_area` VALUES ('652101', '652100', '650000-652100-652101-', '吐鲁番市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652122', '652100', '650000-652100-652122-', '鄯善县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652123', '652100', '650000-652100-652123-', '托克逊县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652200', '650000', '650000-652200-', '哈密地区', '839000', '0902', '1');
INSERT INTO `base_area` VALUES ('652201', '652200', '650000-652200-652201-', '哈密市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652222', '652200', '650000-652200-652222-', '巴里坤哈萨克自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652223', '652200', '650000-652200-652223-', '伊吾县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652300', '650000', '650000-652300-', '昌吉治州', '831100', '0994', '1');
INSERT INTO `base_area` VALUES ('652301', '652300', '650000-652300-652301-', '昌吉市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652302', '652300', '650000-652300-652302-', '阜康市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652303', '652300', '650000-652300-652303-', '米泉市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652323', '652300', '650000-652300-652323-', '呼图壁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652324', '652300', '650000-652300-652324-', '玛纳斯县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652325', '652300', '650000-652300-652325-', '奇台县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652327', '652300', '650000-652300-652327-', '吉木萨尔县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652328', '652300', '650000-652300-652328-', '木垒哈萨克自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652700', '650000', '650000-652700-', '博尔塔拉州', '833400', '0909', '1');
INSERT INTO `base_area` VALUES ('652701', '652700', '650000-652700-652701-', '博乐市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652722', '652700', '650000-652700-652722-', '精河县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652723', '652700', '650000-652700-652723-', '温泉县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652800', '650000', '650000-652800-', '巴音郭楞州', '841000', '0996', '1');
INSERT INTO `base_area` VALUES ('652801', '652800', '650000-652800-652801-', '库尔勒市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652822', '652800', '650000-652800-652822-', '轮台县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652823', '652800', '650000-652800-652823-', '尉犁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652824', '652800', '650000-652800-652824-', '若羌县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652825', '652800', '650000-652800-652825-', '且末县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652826', '652800', '650000-652800-652826-', '焉耆回族自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652827', '652800', '650000-652800-652827-', '和静县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652828', '652800', '650000-652800-652828-', '和硕县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652829', '652800', '650000-652800-652829-', '博湖县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652900', '650000', '650000-652900-', '阿克苏地区', '843000', '0997', '1');
INSERT INTO `base_area` VALUES ('652901', '652900', '650000-652900-652901-', '阿克苏市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652922', '652900', '650000-652900-652922-', '温宿县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652923', '652900', '650000-652900-652923-', '库车县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652924', '652900', '650000-652900-652924-', '沙雅县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652925', '652900', '650000-652900-652925-', '新和县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652926', '652900', '650000-652900-652926-', '拜城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652927', '652900', '650000-652900-652927-', '乌什县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652928', '652900', '650000-652900-652928-', '阿瓦提县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('652929', '652900', '650000-652900-652929-', '柯坪县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('653000', '650000', '650000-653000-', '克孜勒苏州', '831100', '0908', '1');
INSERT INTO `base_area` VALUES ('653001', '653000', '650000-653000-653001-', '阿图什市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('653022', '653000', '650000-653000-653022-', '阿克陶县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('653023', '653000', '650000-653000-653023-', '阿合奇县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('653024', '653000', '650000-653000-653024-', '乌恰县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('653100', '650000', '650000-653100-', '喀什地区', '844000', '0998', '1');
INSERT INTO `base_area` VALUES ('653101', '653100', '650000-653100-653101-', '喀什市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('653121', '653100', '650000-653100-653121-', '疏附县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('653122', '653100', '650000-653100-653122-', '疏勒县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('653123', '653100', '650000-653100-653123-', '英吉沙县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('653124', '653100', '650000-653100-653124-', '泽普县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('653125', '653100', '650000-653100-653125-', '莎车县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('653126', '653100', '650000-653100-653126-', '叶城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('653127', '653100', '650000-653100-653127-', '麦盖提县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('653128', '653100', '650000-653100-653128-', '岳普湖县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('653129', '653100', '650000-653100-653129-', '伽师县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('653130', '653100', '650000-653100-653130-', '巴楚县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('653131', '653100', '650000-653100-653131-', '塔什库尔干塔吉克自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('653200', '650000', '650000-653200-', '和田地区', '848000', '0903', '1');
INSERT INTO `base_area` VALUES ('653201', '653200', '650000-653200-653201-', '和田市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('653221', '653200', '650000-653200-653221-', '和田县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('653222', '653200', '650000-653200-653222-', '墨玉县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('653223', '653200', '650000-653200-653223-', '皮山县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('653224', '653200', '650000-653200-653224-', '洛浦县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('653225', '653200', '650000-653200-653225-', '策勒县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('653226', '653200', '650000-653200-653226-', '于田县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('653227', '653200', '650000-653200-653227-', '民丰县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('654000', '650000', '650000-654000-', '伊犁州', '835000', '0999', '1');
INSERT INTO `base_area` VALUES ('654002', '654000', '650000-654000-654002-', '伊宁市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('654003', '654000', '650000-654000-654003-', '奎屯市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('654021', '654000', '650000-654000-654021-', '伊宁县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('654022', '654000', '650000-654000-654022-', '察布查尔锡伯自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('654023', '654000', '650000-654000-654023-', '霍城县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('654024', '654000', '650000-654000-654024-', '巩留县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('654025', '654000', '650000-654000-654025-', '新源县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('654026', '654000', '650000-654000-654026-', '昭苏县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('654027', '654000', '650000-654000-654027-', '特克斯县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('654028', '654000', '650000-654000-654028-', '尼勒克县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('654200', '650000', '650000-654200-', '塔城地区', '834700', '0901', '1');
INSERT INTO `base_area` VALUES ('654201', '654200', '650000-654200-654201-', '塔城市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('654202', '654200', '650000-654200-654202-', '乌苏市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('654221', '654200', '650000-654200-654221-', '额敏县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('654223', '654200', '650000-654200-654223-', '沙湾县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('654224', '654200', '650000-654200-654224-', '托里县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('654225', '654200', '650000-654200-654225-', '裕民县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('654226', '654200', '650000-654200-654226-', '和布克赛尔蒙古自治县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('654300', '650000', '650000-654300-', '阿勒泰地区', '836500', '0906', '1');
INSERT INTO `base_area` VALUES ('654301', '654300', '650000-654300-654301-', '阿勒泰市', '0', '0', '1');
INSERT INTO `base_area` VALUES ('654321', '654300', '650000-654300-654321-', '布尔津县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('654322', '654300', '650000-654300-654322-', '富蕴县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('654323', '654300', '650000-654300-654323-', '福海县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('654324', '654300', '650000-654300-654324-', '哈巴河县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('654325', '654300', '650000-654300-654325-', '青河县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('654326', '654300', '650000-654300-654326-', '吉木乃县', '0', '0', '1');
INSERT INTO `base_area` VALUES ('659000', '650000', '650000-659000-', '省直辖行政单位', '0', '0', '1');
INSERT INTO `base_area` VALUES ('659001', '659000', '650000-659000-659001-', '石河子市', '832000', '0993', '1');
INSERT INTO `base_area` VALUES ('659002', '659000', '650000-659000-659002-', '阿拉尔市', '843300', '0997', '1');
INSERT INTO `base_area` VALUES ('659003', '659000', '650000-659000-659003-', '图木舒克市', '844000', '0998', '1');
INSERT INTO `base_area` VALUES ('659004', '659000', '650000-659000-659004-', '五家渠市', '831300', '0994', '1');
INSERT INTO `base_area` VALUES ('710000', '0', '710000-', '台湾省', '0', '0', '1');
INSERT INTO `base_area` VALUES ('810000', '0', '810000-', '香港特别行政区', '999077', '00852', '1');
INSERT INTO `base_area` VALUES ('820000', '0', '820000-', '澳门特别行政区', '999078', '00853', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='博文信息表';

-- ----------------------------
-- Records of blog_info
-- ----------------------------
INSERT INTO `blog_info` VALUES ('1', '1', '1', '19', '双堆求中位数', '堆,中位数', '求数组中位数的方法：1、排序2、双堆3、findk效率分别是nlog(n)、nlog(n)、log(n)用堆维护中位数的意思是说，设计两个堆，第一个堆存放小于中位数的元素，第二个堆存放大于中位数的元素', '&lt;p&gt;求数组中位数的方法：&lt;br /&gt;&lt;br /&gt;1、排序&lt;br /&gt;&lt;br /&gt;2、双堆&lt;br /&gt;&lt;br /&gt;3、findk&lt;br /&gt;&lt;br /&gt;效率分别是nlog(n)、nlog(n)、log(n)&lt;br /&gt;&lt;br /&gt;用堆维护中位数的意思是说，设计两个堆，第一个堆存放小于中位数的元素，第二个堆存放大于中位数的元素。&lt;br /&gt;&lt;br /&gt;下面是双堆维护中位数的语言描述：&lt;br /&gt;&lt;br /&gt;1、初始化的时候设置两个变量分别记录两个堆【左堆和右堆】的元素的个数&lt;br /&gt;&lt;br /&gt;2、取第一个元素【d[0]】作为初始中位数m&lt;br /&gt;&lt;br /&gt;3、循环后面的每一个元素，如果比m大，则插入到右堆，如果比m小，则插入到左堆&lt;br /&gt;&lt;br /&gt;4、此时如果左堆和右堆的元素数目之差的绝对值等于2，说明左右两侧的元素不平衡了。需要把m插入到元素少的那个数组中，然后取下一个数组元素作为中位数，重复3和4。&lt;br /&gt;&lt;br /&gt;5、经过上述步骤，数组的所有元素都已经在堆中了。如果两个堆的数据元素个数相等那么有两个中位数，即两个堆的堆顶。如果两个堆的数据数目不相等，则元素多的那个堆的堆顶是数组中位数。 &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;br /&gt;&lt;br /&gt;&lt;/p&gt;', '', '', 'http://blog.csdn.net/maohaiyan/article/details/8059483', '0', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-08 14:48:54', '2013-04-10 15:29:31');
INSERT INTO `blog_info` VALUES ('2', '1', '1', '19', '大数据及海量数据处理算法总结', '大数据,海量数据', '大数据量的问题是很多面试笔试中经常出现的问题，比如baidu google 腾讯 这样的一些涉及到海量数据的公司经常会问到 下面的方法是我对海量数据的处理方法进行了一个一般性的总结，当然这些方法可能并', '&lt;p&gt;大数据量的问题是很多面试笔试中经常出现的问题，比如baidu google 腾讯 这样的一些涉及到海量数据的公司经常会问到&lt;br /&gt;&lt;br /&gt; &lt;br /&gt;下面的方法是我对海量数据的处理方法进行了一个一般性的总结，当然这些方法可能并不能完全覆盖所有的问题，但是这样的一些方法也基本可以处理绝大多数遇到的问题。下面的一些问题基本直接来源于公司的面试笔试题目，方法不一定最优，如果你有更好的处理方法，欢迎与我讨论。 &lt;br /&gt;&lt;br /&gt;1.Bloom filter &lt;br /&gt;&lt;br /&gt;适用范围：可以用来实现数据字典，进行数据的判重，或者集合求交集 &lt;br /&gt;&lt;br /&gt;基本原理及要点： &lt;br /&gt;对于原理来说很简单，位数组 k个独立hash函数。将hash函数对应的值的位数组置1，查找时如果发现所有hash函数对应位都是1说明存在，很明显这个过程并不保证查找的结果是100%正确的。同时也不支持删除一个已经插入的关键字，因为该关键字对应的位会牵动到其他的关键字。所以一个简单的改进就是 ing Bloom filter，用一个er数组代替位数组，就可以支持删除了。 &lt;br /&gt;&lt;br /&gt;还有一个比较重要的问题，如何根据输入元素个数n，确定位数组m的大小及hash函数个数。当hash函数个数k=(ln2)(m/n)时错误率最小。在错误率不大于E的情况下，m至少要等于nlg(1/E)才能表示任意n个元素的集合。但m还应该更大些，因为还要保证bit数组里至少一半为 0，则m 应该&amp;gt;=nlg(1/E)lge 大概就是nlg(1/E)1.44倍(lg表示以2为底的对数)。 &lt;br /&gt;&lt;br /&gt;举个例子我们假设错误率为0.01，则此时m应大概是n的13倍。这样k大概是8个。 &lt;br /&gt;&lt;br /&gt;注意这里m与n的单位不同，m是bit为单位，而n则是以元素个数为单位(准确的说是不同元素的个数)。通常单个元素的长度都是有很多bit的。所以使用bloom filter内存上通常都是节省的。 &lt;br /&gt;&lt;br /&gt;扩展： &lt;br /&gt;Bloom filter将集合中的元素映射到位数组中，用k（k为哈希函数个数）个映射位是否全1表示元素在不在这个集合中。ing bloom filter（CBF）将位数组中的每一位扩展为一个er，从而支持了元素的删除操作。Spectral Bloom Filter（SBF）将其与集合元素的出现次数关联。SBF采用er中的最小值来近似表示元素的出现频率。 &lt;br /&gt;&lt;br /&gt;问题实例：给你A,B两个文件，各存放50亿条URL，每条URL占用64字节，内存限制是4G，让你找出A,B文件共同的URL。如果是三个乃至n个文件呢？ &lt;br /&gt;&lt;br /&gt;根据这个问题我们来计算下内存的占用，4G=2^32大概是40亿8大概是340亿，n=50亿，如果按出错率0.01算需要的大概是650亿个 bit。现在可用的是340亿，相差并不多，这样可能会使出错率上升些。另外如果这些urlip是一一对应的，就可以转换成ip，则大大简单了。 &lt;br /&gt;&lt;br /&gt;2.Hashing &lt;br /&gt;&lt;br /&gt;适用范围：快速查找，删除的基本数据结构，通常需要总数据量可以放入内存 &lt;br /&gt;&lt;br /&gt;基本原理及要点： &lt;br /&gt;hash函数选择，针对字符串，整数，排列，具体相应的hash方法。 &lt;br /&gt;碰撞处理，一种是open hashing，也称为拉链法；另一种就是closed hashing，也称开地址法，opened addressing。 (http://www.my400800.cn) &lt;br /&gt;&lt;br /&gt;扩展： &lt;br /&gt;d-left hashing中的d是多个的意思，我们先简化这个问题，看一看2-left hashing。2-left hashing指的是将一个哈希表分成长度相等的两半，分别叫做T1和T2，给T1和T2分别配备一个哈希函数，h1和h2。在存储一个新的key时，同时用两个哈希函数进行计算，得出两个地址h1[key]和h2[key]。这时需要检查T1中的h1[key]位置和T2中的h2[key]位置，哪一个位置已经存储的（有碰撞的）key比较多，然后将新key存储在负载少的位置。如果两边一样多，比如两个位置都为空或者都存储了一个key，就把新key 存储在左边的T1子表中，2-left也由此而来。在查找一个key时，必须进行两次hash，同时查找两个位置。 &lt;br /&gt;&lt;br /&gt;问题实例： &lt;br /&gt;1).海量日志数据，提取出某日访问百度次数最多的那个IP。 &lt;br /&gt;&lt;br /&gt;IP的数目还是有限的，最多2^32个，所以可以考虑使用hash将ip直接存入内存，然后进行统计。 &lt;br /&gt;&lt;br /&gt;3.bit-map &lt;br /&gt;&lt;br /&gt;适用范围：可进行数据的快速查找，判重，删除，一般来说数据范围是int的10倍以下 &lt;br /&gt;&lt;br /&gt;基本原理及要点：使用bit数组来表示某些元素是否存在，比如8位电话号码 &lt;br /&gt;&lt;br /&gt;扩展：bloom filter可以看做是对bit-map的扩展 &lt;br /&gt;&lt;br /&gt;问题实例： &lt;br /&gt;&lt;br /&gt;1)已知某个文件内包含一些电话号码，每个号码为8位数字，统计不同号码的个数。 &lt;br /&gt;&lt;br /&gt;8位最多99 999 999，大概需要99m个bit，大概10几m字节的内存即可。 &lt;br /&gt;&lt;br /&gt;2)2.5亿个整数中找出不重复的整数的个数，内存空间不足以容纳这2.5亿个整数。 &lt;br /&gt;&lt;br /&gt;将bit-map扩展一下，用2bit表示一个数即可，0表示未出现，1表示出现一次，2表示出现2次及以上。或者我们不用2bit来进行表示，我们用两个bit-map即可模拟实现这个2bit-map。 &lt;br /&gt;&lt;br /&gt;4.堆 &lt;br /&gt;&lt;br /&gt;适用范围：海量数据前n大，并且n比较小，堆可以放入内存 &lt;br /&gt;&lt;br /&gt;基本原理及要点：最大堆求前n小，最小堆求前n大。方法，比如求前n小，我们比较当前元素与最大堆里的最大元素，如果它小于最大元素，则应该替换那个最大元素。这样最后得到的n个元素就是最小的n个。适合大数据量，求前n小，n的大小比较小的情况，这样可以扫描一遍即可得到所有的前n元素，效率很高。 &lt;br /&gt;&lt;br /&gt;扩展：双堆，一个最大堆与一个最小堆结合，可以用来维护中位数。 &lt;br /&gt;&lt;br /&gt;问题实例： &lt;br /&gt;1)100w个数中找最大的前100个数。 &lt;br /&gt;&lt;br /&gt;用一个100个元素大小的最小堆即可。 &lt;br /&gt;&lt;br /&gt;5.双层桶划分 其实本质上就是【分而治之】的思想，重在“分”的技巧上！ &lt;br /&gt;&lt;br /&gt;适用范围：第k大，中位数，不重复或重复的数字 &lt;br /&gt;&lt;br /&gt;基本原理及要点：因为元素范围很大，不能利用直接寻址表，所以通过多次划分，逐步确定范围，然后最后在一个可以接受的范围内进行。可以通过多次缩小，双层只是一个例子。 &lt;br /&gt;&lt;br /&gt;扩展： &lt;br /&gt;&lt;br /&gt;问题实例： &lt;br /&gt;1).2.5亿个整数中找出不重复的整数的个数，内存空间不足以容纳这2.5亿个整数。 &lt;br /&gt;&lt;br /&gt;有点像鸽巢原理，整数个数为2^32,也就是，我们可以将这2^32个数，划分为2^8个区域(比如用单个文件代表一个区域)，然后将数据分离到不同的区域，然后不同的区域在利用bitmap就可以直接解决了。也就是说只要有足够的磁盘空间，就可以很方便的解决。 &lt;br /&gt;&lt;br /&gt;2).5亿个int找它们的中位数。 &lt;br /&gt;&lt;br /&gt;这个例子比上面那个更明显。首先我们将int划分为2^16个区域，然后读取数据统计落到各个区域里的数的个数，之后我们根据统计结果就可以判断中位数落到那个区域，同时知道这个区域中的第几大数刚好是中位数。然后第二次扫描我们只统计落在这个区域中的那些数就可以了。 &lt;br /&gt;&lt;br /&gt;实际上，如果不是int是int64，我们可以经过3次这样的划分即可降低到可以接受的程度。即可以先将int64分成2^24个区域，然后确定区域的第几大数，在将该区域分成2^20个子区域，然后确定是子区域的第几大数，然后子区域里的数的个数只有2^20，就可以直接利用direct addr table进行统计了。 &lt;br /&gt;&lt;br /&gt;6.数据库索引 &lt;br /&gt;&lt;br /&gt;适用范围：大数据量的增删改查 &lt;br /&gt;&lt;br /&gt;基本原理及要点：利用数据的设计实现方法，对海量数据的增删改查进行处理。 &lt;br /&gt;扩展： &lt;br /&gt;问题实例： &lt;br /&gt;&lt;br /&gt;&lt;br /&gt;7.倒排索引(Inverted index) &lt;br /&gt;&lt;br /&gt;适用范围：搜索引擎，关键字查询 &lt;br /&gt;&lt;br /&gt;基本原理及要点：为何叫倒排索引？一种索引方法，被用来存储在全文搜索下某个单词在一个文档或者一组文档中的存储位置的映射。 &lt;br /&gt;&lt;br /&gt;以英文为例，下面是要被索引的文本： &lt;br /&gt;T0 = &amp;quot;it is what it is&amp;quot; &lt;br /&gt;T1 = &amp;quot;what is it&amp;quot; &lt;br /&gt;T2 = &amp;quot;it is a banana&amp;quot; &lt;br /&gt;我们就能得到下面的反向文件索引： &lt;br /&gt;&amp;quot;a&amp;quot;: {2} &lt;br /&gt;&amp;quot;banana&amp;quot;: {2} &lt;br /&gt;&amp;quot;is&amp;quot;: {0, 1, 2} &lt;br /&gt;&amp;quot;it&amp;quot;: {0, 1, 2} &lt;br /&gt;&amp;quot;what&amp;quot;: {0, 1} &lt;br /&gt;检索的条件&amp;quot;what&amp;quot;, &amp;quot;is&amp;quot; 和 &amp;quot;it&amp;quot; 将对应集合的交集。 &lt;br /&gt;&lt;br /&gt;正向索引开发出来用来存储每个文档的单词的列表。正向索引的查询往往满足每个文档有序频繁的全文查询和每个单词在校验文档中的验证这样的查询。在正向索引中，文档占据了中心的位置，每个文档指向了一个它所包含的索引项的序列。也就是说文档指向了它包含的那些单词，而反向索引则是单词指向了包含它的文档，很容易看到这个反向的关系。 &lt;br /&gt;&lt;br /&gt;扩展： &lt;br /&gt;&lt;br /&gt;问题实例：文档检索系统，查询那些文件包含了某单词，比如常见的学术论文的关键字搜索。 &lt;br /&gt;&lt;br /&gt;8.外排序 &lt;br /&gt;&lt;br /&gt;适用范围：大数据的排序，去重 &lt;br /&gt;&lt;br /&gt;基本原理及要点：外排序的归并方法，置换选择 败者树原理，最优归并树 &lt;br /&gt;&lt;br /&gt;扩展： &lt;br /&gt;&lt;br /&gt;问题实例： &lt;br /&gt;1).有一个1G大小的一个文件，里面每一行是一个词，词的大小不超过16个字节，内存限制大小是1M。返回频数最高的100个词。 &lt;br /&gt;&lt;br /&gt;这个数据具有很明显的特点，词的大小为16个字节，但是内存只有1m做hash有些不够，所以可以用来排序。内存可以当输入缓冲区使用。 &lt;br /&gt;&lt;br /&gt;9.trie树 &lt;br /&gt;&lt;br /&gt;适用范围：数据量大，重复多，但是数据种类小可以放入内存 &lt;br /&gt;&lt;br /&gt;基本原理及要点：实现方式，节点孩子的表示方式 &lt;br /&gt;&lt;br /&gt;扩展：压缩实现。 &lt;br /&gt;&lt;br /&gt;问题实例： &lt;br /&gt;1).有10个文件，每个文件1G， 每个文件的每一行都存放的是用户的query，每个文件的query都可能重复。要你按照query的频度排序 。 &lt;br /&gt;&lt;br /&gt;2).1000万字符串，其中有些是相同的(重复),需要把重复的全部去掉，保留没有重复的字符串。请问怎么设计和实现？ &lt;br /&gt;&lt;br /&gt;3).寻找热门查询：查询串的重复度比较高，虽然总数是1千万，但如果除去重复后，不超过3百万个，每个不超过255字节。 &lt;br /&gt;&lt;br /&gt;10.分布式处理 mapreduce &lt;br /&gt;&lt;br /&gt;适用范围：数据量大，但是数据种类小可以放入内存 &lt;br /&gt;&lt;br /&gt;基本原理及要点：将数据交给不同的机器去处理，数据划分，结果归约。 &lt;br /&gt;&lt;br /&gt;扩展： &lt;br /&gt;&lt;br /&gt;问题实例： &lt;br /&gt;&lt;br /&gt;1).The canonical example application of MapReduce is a process to &amp;nbsp;the appearances of &lt;br /&gt;&lt;br /&gt;each different word in a set of documents: &lt;br /&gt;void map(String name, String document): &lt;br /&gt;// name: document name &lt;br /&gt;// document: document contents &lt;br /&gt;for each word w in document: &lt;br /&gt;EmitIntermediate(w, 1); &lt;br /&gt;&lt;br /&gt;void reduce(String word, Iterator partials): &lt;br /&gt;// key: a word &lt;br /&gt;// values: a list of aggregated partial s &lt;br /&gt;int result = 0; &lt;br /&gt;for each v in partials: &lt;br /&gt;result &amp;nbsp;= ParseInt(v); &lt;br /&gt;Emit(result); &lt;br /&gt;Here, each document is split in words, &amp;nbsp;each word is ed initially with a &amp;quot;1&amp;quot; value by &lt;br /&gt;&lt;br /&gt;the Map function, using the word as the result key. The framework puts together all the pairs &lt;br /&gt;&lt;br /&gt;with the same key &amp;nbsp;feeds them to the same call to Reduce, thus this function just needs to &lt;br /&gt;&lt;br /&gt;sum all of its input values to find the total appearances of that word. &lt;br /&gt;&lt;br /&gt;2).海量数据分布在100台电脑中，想个办法高效统计出这批数据的TOP10。 &lt;br /&gt;&lt;br /&gt;3).一共有N个机器，每个机器上有N个数。每个机器最多存O(N)个数并对它们操作。如何找到N^2个数的中数(median)？ &lt;br /&gt;&lt;br /&gt;&lt;br /&gt;经典问题分析 &lt;br /&gt;&lt;br /&gt;上千万or亿数据（有重复），统计其中出现次数最多的前N个数据,分两种情况：可一次读入内存，不可一次读入。 &lt;br /&gt;&lt;br /&gt;可用思路：trie树 堆，数据库索引，划分子集分别统计，hash，分布式计算，近似统计，外排序 &lt;br /&gt;&lt;br /&gt;所谓的是否能一次读入内存，实际上应该指去除重复后的数据量。如果去重后数据可以放入内存，我们可以为数据建立字典，比如通过 map，hashmap，trie，然后直接进行统计即可。当然在更新每条数据的出现次数的时候，我们可以利用一个堆来维护出现次数最多的前N个数据，当然这样导致维护次数增加，不如完全统计后在求前N大效率高。 &lt;br /&gt;&lt;br /&gt;如果数据无法放入内存。一方面我们可以考虑上面的字典方法能否被改进以适应这种情形，可以做的改变就是将字典存放到硬盘上，而不是内存，这可以参考数据库的存储方法。 &lt;br /&gt;&lt;br /&gt;当然还有更好的方法，就是可以采用分布式计算，基本上就是map-reduce过程，首先可以根据数据值或者把数据hash(md5)后的值，将数据按照范围划分到不同的机子，最好可以让数据划分后可以一次读入内存，这样不同的机子负责处理各种的数值范围，实际上就是map。得到结果后，各个机子只需拿出各自的出现次数最多的前N个数据，然后汇总，选出所有的数据中出现次数最多的前N个数据，这实际上就是reduce过程。 &lt;br /&gt;&lt;br /&gt;实际上可能想直接将数据均分到不同的机子上进行处理，这样是无法得到正确的解的。因为一个数据可能被均分到不同的机子上，而另一个则可能完全聚集到一个机子上，同时还可能存在具有相同数目的数据。比如我们要找出现次数最多的前100个，我们将1000万的数据分布到10台机器上，找到每台出现次数最多的前 100个，归并之后这样不能保证找到真正的第100个，因为比如出现次数最多的第100个可能有1万个，但是它被分到了10台机子，这样在每台上只有1千个，假设这些机子排名在1000个之前的那些都是单独分布在一台机子上的，比如有1001个，这样本来具有1万个的这个就会被淘汰，即使我们让每台机子选出出现次数最多的1000个再归并，仍然会出错，因为可能存在大量个数为1001个的发生聚集。因此不能将数据随便均分到不同机子上，而是要根据hash 后的值将它们映射到不同的机子上处理，让不同的机器处理一个数值范围。 &lt;br /&gt;&lt;br /&gt;而外排序的方法会消耗大量的IO，效率不会很高。而上面的分布式方法，也可以用于单机版本，也就是将总的数据根据值的范围，划分成多个不同的子文件，然后逐个处理。处理完毕之后再对这些单词的及其出现频率进行一个归并。实际上就可以利用一个外排序的归并过程。 &lt;br /&gt;&lt;br /&gt;另外还可以考虑近似计算，也就是我们可以通过结合自然语言属性，只将那些真正实际中出现最多的那些词作为一个字典，使得这个规模可以放入内存。&lt;br /&gt;&lt;/p&gt;', '', '', 'http://www.jb51.net/article/27064.htm', '0', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 17:25:13', '2013-04-10 22:06:27');
INSERT INTO `blog_info` VALUES ('3', '1', '1', '19', '从海量数据中找出中位数', '大数据,海量数据,中位数', '题目：在一个文件中有 10G 个整数，乱序排列，要求找出中位数。内存限制为 2G。只写出思路即可（内存限制为 2G的意思就是，可以使用2G的空间来运行程序，而不考虑这台机器上的其他软件的占用内存）', '&lt;p&gt;题目：在一个文件中有 10G 个整数，乱序排列，要求找出中位数。内存限制为 2G。只写出思路即可（内存限制为 2G的意思就是，可以使用2G的空间来运行程序，而不考虑这台机器上的其他软件的占用内存）。&lt;/p&gt;&lt;p&gt;&lt;br /&gt;关于中位数：数据排序后，位置在最中间的数值。即将数据分成两部分，一部分大于该数值，一部分小于该数值。中位数的位置：当样本数为奇数时，中位数=(N 1)/2 ; 当样本数为偶数时，中位数为N/2与1 N/2的均值（那么10G个数的中位数，就第5G大的数与第5G 1大的数的均值了）。&lt;/p&gt;&lt;p&gt;&lt;br /&gt;分析：明显是一道工程性很强的题目，和一般的查找中位数的题目有几点不同。&lt;br /&gt;1. 原数据不能读进内存，不然可以用快速选择，如果数的范围合适的话还可以考虑桶排序或者计数排序，但这里假设是32位整数，仍有4G种取值，需要一个16G大小的数组来计数。&lt;br /&gt;2. 若看成从N个数中找出第K大的数，如果K个数可以读进内存，可以利用最小或最大堆，但这里K=N/2,有5G个数，仍然不能读进内存。&lt;br /&gt;3. 接上，对于N个数和K个数都不能一次读进内存的情况，《编程之美》里给出一个方案：设k&amp;lt;K,且k个数可以完全读进内存，那么先构建k个数的堆，先找出第0到k大的数，再扫描一遍数组找出第k 1到2k的数，再扫描直到找出第K个数。虽然每次时间大约是nlog(k)，但需要扫描ceil(K/k)次，这里要扫描5次。&lt;/p&gt;&lt;p&gt;&lt;br /&gt;解法：首先假设是32位无符号整数。&lt;br /&gt;1. 读一遍10G个整数，把整数映射到256M个区段中，用一个64位无符号整数给每个相应区段记数。&lt;br /&gt;说明：整数范围是0 - 2^32 - 1，一共有4G种取值，映射到256M个区段，则每个区段有16（4G/256M = 16）种值，每16个值算一段， 0～15是第1段，16～31是第2段，……2^32-16 ～2^32-1是第256M段。一个64位无符号整数最大值是0～8G-1，这里先不考虑溢出的情况。总共占用内存256M×8B=2GB。&lt;br /&gt;2. 从前到后对每一段的计数累加，当累加的和超过5G时停止，找出这个区段（即累加停止时达到的区段，也是中位数所在的区段）的数值范围，设为[a，a 15]，同时记录累加到前一个区段的总数，设为m。然后，释放除这个区段占用的内存。&lt;br /&gt;3. 再读一遍10G个整数，把在[a，a 15]内的每个值计数，即有16个计数。&lt;br /&gt;4. 对新的计数依次累加，每次的和设为n，当m n的值超过5G时停止，此时的这个计数所对应的数就是中位数。&lt;/p&gt;&lt;p&gt;&lt;br /&gt;总结：&lt;br /&gt;1.以上方法只要读两遍整数，对每个整数也只是常数时间的操作，总体来说是线性时间。&lt;br /&gt;2. 考虑其他情况。若是有符号的整数，只需改变映射即可。若是64为整数，则增加每个区段的范围，那么在第二次读数时，要考虑更多的计数。若过某个计数溢出，那么可认定所在的区段或代表整数为所求，这里只需做好相应的处理。噢，忘了还要找第5G 1大的数了，相信有了以上的成果，找到这个数也不难了吧。&lt;br /&gt;3. 时空权衡。花费256个区段也许只是恰好配合2GB的内存（其实也不是，呵呵）。可以增大区段范围，减少区段数目，节省一些内存，虽然增加第二部分的对单个数值的计数，但第一部分对每个区段的计数加快了（总体改变？？待测）。&lt;br /&gt;4. 映射时尽量用位操作，由于每个区段的起点都是2的整数幂，映射起来也很方便。&lt;br /&gt;&lt;/p&gt;', '', '', 'http://blog.csdn.net/maohaiyan/article/details/8059931', '0', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 17:49:23', '2013-04-10 22:06:00');
INSERT INTO `blog_info` VALUES ('4', '1', '1', '19', 'B树', 'BTree,B树', 'B 树又叫平衡多路查找树。一棵m阶的B 树 (m叉树)的特性如下：1、树中每个结点最多含有m个孩子（m>=2）；2、除根结点和叶子结点外，其它每个结点至少有[ceil(m / 2)]个孩子（其中', '&lt;p&gt;B 树又叫平衡多路查找树。一棵m阶的B 树 (m叉树)的特性如下：&lt;br /&gt;&lt;br /&gt;1、树中每个结点最多含有m个孩子（m&amp;gt;=2）；&lt;br /&gt;&lt;/p&gt;&lt;p&gt;2、除根结点和叶子结点外，其它每个结点至少有[ceil(m / 2)]个孩子（其中ceil(x)是一个取上限的函数）；&lt;br /&gt;&lt;/p&gt;&lt;p&gt;3、若根结点不是叶子结点，则至少有2个孩子（特殊情况：没有孩子的根结点，即根结点为叶子结点，整棵树只有一个根节点）；&lt;br /&gt;&lt;/p&gt;&lt;p&gt;4、所有叶子结点都出现在同一层，叶子结点不包含任何关键字信息，也可以认为，叶子节点只是没有孩子和指向孩子的指针，这些节点也存在，也有元素。其实，关键是把什么当做叶子结点，因为如红黑树中，每一个NULL指针即当做叶子结点，只是没画出来而已）。&lt;/p&gt;&lt;p&gt;5、每个非终端结点中包含有n个关键字信息： (n，P0，K1，P1，K2，P2，......，Kn，Pn)。其中：&lt;br /&gt; &amp;nbsp; a) &amp;nbsp; Ki (i=1...n)为关键字，且关键字按顺序升序排序K(i-1)&amp;lt; Ki。 &lt;br /&gt; &amp;nbsp; b) &amp;nbsp; Pi为指向子树根的接点，且指针P(i-1)指向子树种所有结点的关键字均小于Ki，但都大于K(i-1)。 &lt;br /&gt; &amp;nbsp; c) &amp;nbsp; 关键字的个数n必须满足： [ceil(m / 2)-1]&amp;lt;= n &amp;lt;= m-1。 &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp;&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/p&gt;', '', '', 'http://blog.csdn.net/maohaiyan/article/details/7407719', '0', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 22:04:40', '2013-04-10 22:06:57');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='博文标签表';

-- ----------------------------
-- Records of blog_tag
-- ----------------------------
INSERT INTO `blog_tag` VALUES ('1', '1', '19', '1', '堆');
INSERT INTO `blog_tag` VALUES ('2', '1', '19', '1', '中位数');
INSERT INTO `blog_tag` VALUES ('3', '1', '19', '3', '大数据');
INSERT INTO `blog_tag` VALUES ('4', '1', '19', '3', '海量数据');
INSERT INTO `blog_tag` VALUES ('5', '1', '19', '3', '中位数');
INSERT INTO `blog_tag` VALUES ('6', '1', '19', '2', '大数据');
INSERT INTO `blog_tag` VALUES ('7', '1', '19', '2', '海量数据');
INSERT INTO `blog_tag` VALUES ('8', '1', '19', '4', 'BTree');
INSERT INTO `blog_tag` VALUES ('9', '1', '19', '4', 'B树');

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
-- Table structure for `job_info`
-- ----------------------------
DROP TABLE IF EXISTS `job_info`;
CREATE TABLE `job_info` (
  `jiid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '招聘名称',
  `num` varchar(10) DEFAULT '' COMMENT '招聘人数',
  `province` int(11) DEFAULT '0' COMMENT '招聘省市，关联base_area表baid字段',
  `city` int(11) DEFAULT '0' COMMENT '招聘城市，关联base_area表baid字段',
  `area` int(11) DEFAULT '0' COMMENT '招聘区县，关联base_area表baid字段',
  `work_year` tinyint(5) DEFAULT '0' COMMENT '工作年限：0为不限，1为在读学生，2为应届毕业生，3为一年以上，4为二年以上，5为三年以上，6为五年以上，7为八年以上，\r8为十年以上',
  `provide_salary` tinyint(5) DEFAULT '0' COMMENT '月薪范围：0为面议，1为1500以下，2为1500-2999，3为3000-4499，4为4500-5999，5为6000-7999，6为8000-9999，7为10000-14999，8为15000-19999，9为20000-29999，10为30000-49999，11为50000及以上',
  `degree_from` tinyint(5) DEFAULT '0' COMMENT '学历要求：0为不限，1为初中，2为高中，3为中专，4为大专，5为本科，6为硕士，7为博士',
  `content` text COMMENT '招聘内容',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `start_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '开始时间',
  `end_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '结束时间',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`jiid`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='招聘信息表';

-- ----------------------------
-- Records of job_info
-- ----------------------------
INSERT INTO `job_info` VALUES ('1', '1', 'php招聘', '3', '310000', '310100', '310101', '3', '7', '4', '&lt;p&gt;sdfsf点时间啊发渐叟&lt;br /&gt;&lt;/p&gt;', '0', '1', '2013-04-01 00:00:00', '2016-04-01 00:00:00', '2013-04-22 16:24:04', '2013-04-22 21:32:41');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='渠道信息表';

-- ----------------------------
-- Records of product_channel
-- ----------------------------
INSERT INTO `product_channel` VALUES ('1', '1', '商城', '1', '1', '1', '2013-03-27 16:44:39', '2013-03-27 16:44:39');

-- ----------------------------
-- Table structure for `product_channel_goods`
-- ----------------------------
DROP TABLE IF EXISTS `product_channel_goods`;
CREATE TABLE `product_channel_goods` (
  `pcgid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '网站ID，关联site_web表sid字段',
  `smid` int(11) NOT NULL DEFAULT '0' COMMENT '商品分类ID，关联site_menu表smid字段',
  `pcid` int(11) NOT NULL DEFAULT '0' COMMENT '渠道ID，关联product_channel表pcid字段',
  `pgid` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID，关联product_goods表pgid字段',
  `name_prefix` varchar(100) DEFAULT '' COMMENT '商品名称前缀',
  `name_suffix` varchar(100) DEFAULT '' COMMENT '商品名称后缀',
  `sale_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品销售价',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `start_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '开始时间',
  `end_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '结束时间',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`pcgid`),
  KEY `sid` (`sid`),
  KEY `smid` (`smid`),
  KEY `pcid` (`pcid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='渠道商品信息表';

-- ----------------------------
-- Records of product_channel_goods
-- ----------------------------
INSERT INTO `product_channel_goods` VALUES ('1', '1', '14', '1', '1', '前缀', '后缀', '0.00', '0', '2', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-12 16:56:07', '2013-04-12 16:56:07');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='商品描述信息表';

-- ----------------------------
-- Records of product_description
-- ----------------------------
INSERT INTO `product_description` VALUES ('1', '1', '1', '1', '商品1', '2013-04-12 10:52:27', '2013-04-12 10:52:27');
INSERT INTO `product_description` VALUES ('2', '1', '1', '2', '商品1', '2013-04-12 10:52:27', '2013-04-12 10:52:27');

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
  `code` varchar(100) NOT NULL DEFAULT '' COMMENT '商品编码,可作唯一标示',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '商品名称',
  `cost_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品成本价',
  `market_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品市场价',
  `protect_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品保护价',
  `thumbnail` varchar(255) DEFAULT '' COMMENT '商品主图',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`pgid`),
  KEY `sid` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='商品信息表';

-- ----------------------------
-- Records of product_goods
-- ----------------------------
INSERT INTO `product_goods` VALUES ('1', '1', '1', '商品1', '0.00', '0.00', '0.00', 'http://img5.ibanggo.com/sources/images/goods/MB/213813/213813_00.jpg', '0', '1', '2013-04-12 10:52:27', '2013-04-12 10:53:47');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='访问权限管理';

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='配置管理';

-- ----------------------------
-- Records of site_config
-- ----------------------------
INSERT INTO `site_config` VALUES ('1', '1', '后台是否记录用户登录', 'adminIsRecordUserLog', '0', '1', '2013-02-02 21:00:26', '2013-02-12 10:45:39');
INSERT INTO `site_config` VALUES ('2', '1', '是否启用博文', 'isEnableBlog', '1', '1', '2013-03-09 21:36:23', '2013-03-19 15:42:02');
INSERT INTO `site_config` VALUES ('3', '1', '是否启用广告js', 'isEnableAdJs', '0', '1', '2013-03-17 19:08:05', '2013-03-18 21:48:17');
INSERT INTO `site_config` VALUES ('4', '1', '是否启用小说', 'isEnableNovel', '0', '1', '2013-03-21 14:09:28', '2013-03-21 14:09:28');

-- ----------------------------
-- Table structure for `site_database`
-- ----------------------------
DROP TABLE IF EXISTS `site_database`;
CREATE TABLE `site_database` (
  `sdid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `parent_id` int(6) NOT NULL DEFAULT '0' COMMENT '字段父级ID',
  `code` varchar(100) NOT NULL DEFAULT '' COMMENT '字段编码,可作唯一标示',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '字段名称',
  `crumb` varchar(100) NOT NULL DEFAULT '' COMMENT '面包屑，用横杠分割',
  `list_opt` varchar(255) DEFAULT '1,2,3,4' COMMENT '字段显示项，关联site_web表sid字段',
  `sort` tinyint(5) DEFAULT '0' COMMENT '显示顺序',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  `add_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '添加时间',
  `update_time` datetime DEFAULT '1970-01-01 08:00:00' COMMENT '修改时间',
  PRIMARY KEY (`sdid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='数据库字段管理';

-- ----------------------------
-- Records of site_database
-- ----------------------------
INSERT INTO `site_database` VALUES ('1', '0', 'site_web', '站点管理', '1-', '1,2,3,4', '0', '1', '2013-04-23 10:19:24', '2013-04-23 15:02:11');
INSERT INTO `site_database` VALUES ('2', '1', 'record_no', '网站备案号', '1-2-', '1,2,3,4', '0', '1', '2013-04-23 10:57:31', '2013-04-23 15:01:57');

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
  `model` tinyint(1) DEFAULT '1' COMMENT '菜单模型：1为文章，2为图片集，3为产品，4为博文，5为小说，6为招聘',
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of site_menu
-- ----------------------------
INSERT INTO `site_menu` VALUES ('1', '1', '0', 'AboutUs', '关于我们', '1-', '1', '0', '', '6', '3', '0', '0', '0', '20', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:20:59', '2013-03-31 13:58:28');
INSERT INTO `site_menu` VALUES ('2', '1', '0', 'Blog', '博文', '2-', '4', '1', '', '3', '203', '0', '0', '1', '20', '3', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:21:56', '2013-03-21 20:36:02');
INSERT INTO `site_menu` VALUES ('3', '1', '2', 'IT', 'IT', '2-3-', '4', '1', '', '2', '203', '0', '0', '0', '20', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:22:37', '2013-03-21 14:43:12');
INSERT INTO `site_menu` VALUES ('4', '1', '2', 'ManageFinances', '理财', '2-4-', '4', '1', '', '2', '203', '0', '0', '0', '20', '2', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:24:22', '2013-03-23 11:03:51');
INSERT INTO `site_menu` VALUES ('5', '1', '3', 'Web', 'Web前端', '2-3-5-', '4', '1', '', '0', '203', '0', '0', '0', '20', '2', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:26:44', '2013-04-09 14:21:47');
INSERT INTO `site_menu` VALUES ('6', '1', '3', 'Language', '编程语言', '2-3-6-', '4', '1', '', '0', '203', '0', '0', '0', '20', '3', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:27:49', '2013-04-09 14:23:47');
INSERT INTO `site_menu` VALUES ('7', '1', '3', 'Database', '数据库', '2-3-7-', '4', '1', '', '2', '203', '0', '0', '0', '20', '4', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:28:14', '2013-04-09 14:23:27');
INSERT INTO `site_menu` VALUES ('8', '1', '0', 'Project', '项目案例', '8-', '1', '1', '', '2', '203', '0', '0', '0', '20', '2', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:30:36', '2013-03-31 13:48:46');
INSERT INTO `site_menu` VALUES ('9', '1', '8', 'EnterpriseSite', '企业网站', '8-9-', '1', '0', '', '2', '203', '0', '0', '0', '20', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:31:14', '2013-03-21 14:43:01');
INSERT INTO `site_menu` VALUES ('10', '1', '8', 'LargeSite', '大型网站', '8-10-', '1', '0', '', '2', '203', '0', '0', '0', '20', '2', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 14:32:27', '2013-03-21 14:42:54');
INSERT INTO `site_menu` VALUES ('11', '2', '0', 'AboutUs', 'About Us', '11-', '1', '0', '', '2', '3', '0', '0', '0', '20', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-03-21 15:39:38', '2013-03-21 15:39:38');
INSERT INTO `site_menu` VALUES ('12', '1', '0', 'Product', '产品', '12-', '3', '1', '', '2', '3', '0', '0', '0', '20', '4', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 16:36:58', '2013-04-03 16:36:58');
INSERT INTO `site_menu` VALUES ('13', '1', '12', 'LightingProduct', '照明产品', '12-13-', '3', '1', '', '2', '3', '0', '0', '0', '20', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 16:43:27', '2013-04-03 16:43:27');
INSERT INTO `site_menu` VALUES ('14', '1', '13', 'Spotlights', '射灯', '12-13-14-', '3', '0', '', '0', '3', '0', '0', '0', '20', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 16:46:41', '2013-04-03 16:46:41');
INSERT INTO `site_menu` VALUES ('15', '1', '13', 'Downlight', '筒灯', '12-13-15-', '3', '0', '', '0', '3', '0', '0', '0', '20', '2', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 16:47:22', '2013-04-03 16:47:22');
INSERT INTO `site_menu` VALUES ('16', '1', '12', 'ChemicalProducts', '化工产品', '12-16-', '3', '1', '', '2', '3', '0', '0', '0', '20', '2', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 16:51:02', '2013-04-03 16:51:02');
INSERT INTO `site_menu` VALUES ('17', '1', '16', 'FadingAgent', '褪色剂', '12-16-17-', '3', '0', '', '0', '3', '0', '0', '0', '20', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-03 16:52:04', '2013-04-03 16:52:04');
INSERT INTO `site_menu` VALUES ('18', '1', '20', 'DataStructure', '数据结构', '2-3-20-18-', '4', '0', '', '2', '203', '0', '0', '0', '20', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 13:54:02', '2013-04-09 14:26:23');
INSERT INTO `site_menu` VALUES ('19', '1', '20', 'Algorithm', '算法', '2-3-20-19-', '4', '0', '', '2', '203', '0', '0', '0', '20', '2', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 14:07:29', '2013-04-09 15:29:40');
INSERT INTO `site_menu` VALUES ('20', '1', '3', 'BasicComputer', '计算机基础', '2-3-20-', '4', '1', '', '2', '203', '0', '0', '0', '20', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 14:19:08', '2013-04-09 14:26:30');
INSERT INTO `site_menu` VALUES ('21', '1', '6', 'PHP', 'PHP', '2-3-6-21-', '4', '0', '', '0', '203', '0', '0', '0', '20', '4', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 14:27:18', '2013-04-09 14:27:18');
INSERT INTO `site_menu` VALUES ('22', '1', '6', 'JAVA', 'JAVA', '2-3-6-22-', '4', '0', '', '0', '203', '0', '0', '0', '20', '3', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 14:34:36', '2013-04-09 14:34:36');
INSERT INTO `site_menu` VALUES ('23', '1', '6', 'C', 'C', '2-3-6-23-', '4', '0', '', '0', '203', '0', '0', '0', '20', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 14:34:52', '2013-04-09 14:34:52');
INSERT INTO `site_menu` VALUES ('24', '1', '6', 'C++', 'C++', '2-3-6-24-', '4', '0', '', '0', '203', '0', '0', '0', '20', '2', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 14:36:41', '2013-04-09 14:36:41');
INSERT INTO `site_menu` VALUES ('25', '1', '7', 'MySql', 'MySql', '2-3-7-25-', '4', '0', '', '0', '203', '0', '0', '0', '20', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 14:42:17', '2013-04-09 14:42:17');
INSERT INTO `site_menu` VALUES ('26', '1', '5', 'HTML', 'HTML', '2-3-5-26-', '4', '0', '', '0', '203', '0', '0', '0', '20', '3', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 14:43:44', '2013-04-09 14:43:44');
INSERT INTO `site_menu` VALUES ('27', '1', '5', 'CSS', 'CSS', '2-3-5-27-', '4', '0', '', '0', '203', '0', '0', '0', '20', '1', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 14:43:57', '2013-04-09 14:43:57');
INSERT INTO `site_menu` VALUES ('28', '1', '5', 'JavaScript', 'JavaScript', '2-3-5-28-', '4', '0', '', '0', '203', '0', '0', '0', '20', '5', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 14:47:48', '2013-04-09 14:47:48');
INSERT INTO `site_menu` VALUES ('29', '1', '5', 'jQuery', 'jQuery', '2-3-5-29-', '4', '0', '', '0', '203', '0', '0', '0', '20', '6', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 14:48:05', '2013-04-09 14:48:05');
INSERT INTO `site_menu` VALUES ('30', '1', '6', 'Ruby', 'Ruby', '2-3-6-30-', '4', '0', '', '0', '203', '0', '0', '0', '20', '8', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 15:08:34', '2013-04-09 15:08:34');
INSERT INTO `site_menu` VALUES ('31', '1', '6', 'Python', 'Python', '2-3-6-31-', '4', '0', '', '0', '203', '0', '0', '0', '20', '9', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 15:08:52', '2013-04-09 15:08:52');
INSERT INTO `site_menu` VALUES ('32', '1', '6', '.net', '.net', '2-3-6-32-', '4', '0', '', '0', '203', '0', '0', '0', '20', '10', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 15:09:07', '2013-04-09 15:09:07');
INSERT INTO `site_menu` VALUES ('33', '1', '6', 'iOS', 'iOS', '2-3-6-33-', '4', '0', '', '0', '203', '0', '0', '0', '20', '5', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 15:13:48', '2013-04-09 15:13:48');
INSERT INTO `site_menu` VALUES ('34', '1', '6', 'Android', 'Android', '2-3-6-34-', '4', '0', '', '0', '203', '0', '0', '0', '20', '6', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 15:14:02', '2013-04-09 15:14:02');
INSERT INTO `site_menu` VALUES ('35', '1', '6', 'WindowsPhone', 'WindowsPhone', '2-3-6-35-', '4', '0', '', '0', '203', '0', '0', '0', '20', '7', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 15:14:49', '2013-04-09 15:14:49');
INSERT INTO `site_menu` VALUES ('36', '1', '5', 'EXT', 'EXT', '2-3-5-36-', '4', '0', '', '0', '203', '0', '0', '0', '20', '7', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 15:16:47', '2013-04-09 15:16:47');
INSERT INTO `site_menu` VALUES ('37', '1', '5', 'HTML5', 'HTML5', '2-3-5-37-', '4', '0', '', '0', '203', '0', '0', '0', '20', '4', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 15:17:02', '2013-04-09 15:17:02');
INSERT INTO `site_menu` VALUES ('38', '1', '5', 'CSS3', 'CSS3', '2-3-5-38-', '4', '0', '', '0', '203', '0', '0', '0', '20', '2', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-09 15:19:51', '2013-04-09 15:19:51');
INSERT INTO `site_menu` VALUES ('39', '1', '7', 'Mongo', 'Mongo', '2-3-7-39-', '4', '0', '', '0', '203', '0', '0', '0', '20', '2', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-10 09:52:17', '2013-04-10 09:52:17');
INSERT INTO `site_menu` VALUES ('40', '1', '0', 'Job', '招聘', '40-', '6', '0', '', '4', '3', '0', '0', '0', '20', '5', '1', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '2013-04-22 15:01:04', '2013-04-22 15:01:04');

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
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='节点管理';

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
INSERT INTO `site_node` VALUES ('21', '16', 'Base', '数据管理', '1-16-21-', '1', '1', '4', '1', '2013-01-27 13:17:31', '2013-03-27 13:58:48');
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
INSERT INTO `site_node` VALUES ('64', '61', 'ProductChannel', '渠道管理', '46-42-61-64-', '2', '1', '2', '1', '2013-03-27 13:39:10', '2013-04-11 11:00:37');
INSERT INTO `site_node` VALUES ('65', '28', 'Users', '基础管理', '28-65-', '1', '1', '1', '1', '2013-03-27 14:01:06', '2013-03-27 14:01:06');
INSERT INTO `site_node` VALUES ('66', '62', 'ProductAlbum', '相册管理', '46-42-62-66-', '2', '1', '1', '1', '2013-03-27 14:24:21', '2013-03-27 14:24:21');
INSERT INTO `site_node` VALUES ('67', '62', 'ProductAlbumPhoto', '相片管理', '46-42-62-67-', '2', '1', '2', '1', '2013-03-27 14:32:41', '2013-03-27 14:32:41');
INSERT INTO `site_node` VALUES ('68', '70', 'ProductDescriptionCategory', '描述分类管理', '46-42-70-68-', '2', '1', '1', '1', '2013-03-27 14:52:52', '2013-03-27 15:03:34');
INSERT INTO `site_node` VALUES ('69', '2', 'WebSite', '站点配置', '34-2-69-', '1', '0', '6', '1', '2013-03-27 14:57:36', '2013-04-22 14:42:32');
INSERT INTO `site_node` VALUES ('70', '42', 'ProductSite', '商品配置', '46-42-70-', '1', '1', '3', '1', '2013-03-27 15:02:58', '2013-03-27 15:02:58');
INSERT INTO `site_node` VALUES ('71', '61', 'ProductChannelGoods', '渠道商品管理', '46-42-61-71-', '2', '1', '3', '1', '2013-04-11 11:02:29', '2013-04-11 11:02:29');
INSERT INTO `site_node` VALUES ('72', '21', 'BaseArea', '地区管理', '1-16-21-72-', '2', '1', '2', '1', '2013-04-17 21:13:15', '2013-04-17 21:13:15');
INSERT INTO `site_node` VALUES ('73', '2', 'Job', '招聘管理', '34-2-73-', '1', '1', '5', '1', '2013-04-22 15:07:33', '2013-04-22 15:07:33');
INSERT INTO `site_node` VALUES ('74', '73', 'JobInfo', '招聘管理', '34-2-73-74-', '2', '1', '1', '1', '2013-04-22 15:10:07', '2013-04-22 15:10:07');
INSERT INTO `site_node` VALUES ('75', '16', 'Database', '字段管理', '1-16-75-', '1', '1', '3', '1', '2013-04-22 22:25:18', '2013-04-22 22:25:18');
INSERT INTO `site_node` VALUES ('76', '75', 'SiteDatabase', '字段管理', '1-16-75-76-', '2', '1', '1', '1', '2013-04-22 22:26:18', '2013-04-22 22:26:18');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='站点管理';

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
