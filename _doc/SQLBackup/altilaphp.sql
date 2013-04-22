/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50136
Source Host           : localhost:3306
Source Database       : altilaphp

Target Server Type    : MYSQL
Target Server Version : 50136
File Encoding         : 65001

Date: 2013-04-22 21:35:13
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
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '地区名称',
  `zip_code` varchar(8) DEFAULT '0' COMMENT '邮政编码',
  `call_code` varchar(8) DEFAULT '0' COMMENT '长途区号',
  `crumb` varchar(100) DEFAULT '' COMMENT '面包屑，用横杠分割',
  `status` tinyint(1) DEFAULT '2' COMMENT '状态: -1为删除，0为禁用，1为正常，2为待批',
  PRIMARY KEY (`baid`)
) ENGINE=InnoDB AUTO_INCREMENT=820001 DEFAULT CHARSET=utf8 COMMENT='基础地区表';

-- ----------------------------
-- Records of base_area
-- ----------------------------
INSERT INTO `base_area` VALUES ('1', '110000', '1', '1', '', '110000-1-', '2');
INSERT INTO `base_area` VALUES ('110000', '0', '北京市', '100000', '010', '110000-', '1');
INSERT INTO `base_area` VALUES ('110100', '110000', '市辖区', '0', '0', '110000-110100-', '1');
INSERT INTO `base_area` VALUES ('110101', '110100', '东城区', '0', '0', '110000-110100-110101-', '1');
INSERT INTO `base_area` VALUES ('110102', '110100', '西城区', '0', '0', '110000-110100-110102-', '1');
INSERT INTO `base_area` VALUES ('110103', '110100', '崇文区', '0', '0', '110000-110100-110103-', '1');
INSERT INTO `base_area` VALUES ('110104', '110100', '宣武区', '0', '0', '110000-110100-110104-', '1');
INSERT INTO `base_area` VALUES ('110105', '110100', '朝阳区', '0', '0', '110000-110100-110105-', '1');
INSERT INTO `base_area` VALUES ('110106', '110100', '丰台区', '0', '0', '110000-110100-110106-', '1');
INSERT INTO `base_area` VALUES ('110107', '110100', '石景山区', '0', '0', '110000-110100-110107-', '1');
INSERT INTO `base_area` VALUES ('110108', '110100', '海淀区', '0', '0', '110000-110100-110108-', '1');
INSERT INTO `base_area` VALUES ('110109', '110100', '门头沟区', '0', '0', '110000-110100-110109-', '1');
INSERT INTO `base_area` VALUES ('110111', '110100', '房山区', '0', '0', '110000-110100-110111-', '1');
INSERT INTO `base_area` VALUES ('110112', '110100', '通州区', '0', '0', '110000-110100-110112-', '1');
INSERT INTO `base_area` VALUES ('110113', '110100', '顺义区', '0', '0', '110000-110100-110113-', '1');
INSERT INTO `base_area` VALUES ('110114', '110100', '昌平区', '0', '0', '110000-110100-110114-', '1');
INSERT INTO `base_area` VALUES ('110115', '110100', '大兴区', '0', '0', '110000-110100-110115-', '1');
INSERT INTO `base_area` VALUES ('110116', '110100', '怀柔区', '0', '0', '110000-110100-110116-', '1');
INSERT INTO `base_area` VALUES ('110117', '110100', '平谷区', '0', '0', '110000-110100-110117-', '1');
INSERT INTO `base_area` VALUES ('110200', '110000', '县', '0', '0', '110000-110200-', '1');
INSERT INTO `base_area` VALUES ('110228', '110200', '密云县', '0', '0', '110000-110200-110228-', '1');
INSERT INTO `base_area` VALUES ('110229', '110200', '延庆县', '0', '0', '110000-110200-110229-', '1');
INSERT INTO `base_area` VALUES ('120000', '0', '天津市', '300000', '022', '120000-', '1');
INSERT INTO `base_area` VALUES ('120100', '120000', '市辖区', '0', '0', '120000-120100-', '1');
INSERT INTO `base_area` VALUES ('120101', '120100', '和平区', '0', '0', '120000-120100-120101-', '1');
INSERT INTO `base_area` VALUES ('120102', '120100', '河东区', '0', '0', '120000-120100-120102-', '1');
INSERT INTO `base_area` VALUES ('120103', '120100', '河西区', '0', '0', '120000-120100-120103-', '1');
INSERT INTO `base_area` VALUES ('120104', '120100', '南开区', '0', '0', '120000-120100-120104-', '1');
INSERT INTO `base_area` VALUES ('120105', '120100', '河北区', '0', '0', '120000-120100-120105-', '1');
INSERT INTO `base_area` VALUES ('120106', '120100', '红桥区', '0', '0', '120000-120100-120106-', '1');
INSERT INTO `base_area` VALUES ('120107', '120100', '塘沽区', '0', '0', '120000-120100-120107-', '1');
INSERT INTO `base_area` VALUES ('120108', '120100', '汉沽区', '0', '0', '120000-120100-120108-', '1');
INSERT INTO `base_area` VALUES ('120109', '120100', '大港区', '0', '0', '120000-120100-120109-', '1');
INSERT INTO `base_area` VALUES ('120110', '120100', '东丽区', '0', '0', '120000-120100-120110-', '1');
INSERT INTO `base_area` VALUES ('120111', '120100', '西青区', '0', '0', '120000-120100-120111-', '1');
INSERT INTO `base_area` VALUES ('120112', '120100', '津南区', '0', '0', '120000-120100-120112-', '1');
INSERT INTO `base_area` VALUES ('120113', '120100', '北辰区', '0', '0', '120000-120100-120113-', '1');
INSERT INTO `base_area` VALUES ('120114', '120100', '武清区', '0', '0', '120000-120100-120114-', '1');
INSERT INTO `base_area` VALUES ('120115', '120100', '宝坻区', '0', '0', '120000-120100-120115-', '1');
INSERT INTO `base_area` VALUES ('120200', '120000', '县', '0', '0', '120000-120200-', '1');
INSERT INTO `base_area` VALUES ('120221', '120200', '宁河县', '0', '0', '120000-120200-120221-', '1');
INSERT INTO `base_area` VALUES ('120223', '120200', '静海县', '0', '0', '120000-120200-120223-', '1');
INSERT INTO `base_area` VALUES ('120225', '120200', '蓟　县', '0', '0', '120000-120200-120225-', '1');
INSERT INTO `base_area` VALUES ('130000', '0', '河北省', '0', '0', '130000-', '1');
INSERT INTO `base_area` VALUES ('130100', '130000', '石家庄市', '050000', '0311', '130000-130100-', '1');
INSERT INTO `base_area` VALUES ('130101', '130100', '市辖区', '0', '0', '130000-130100-130101-', '1');
INSERT INTO `base_area` VALUES ('130102', '130100', '长安区', '0', '0', '130000-130100-130102-', '1');
INSERT INTO `base_area` VALUES ('130103', '130100', '桥东区', '0', '0', '130000-130100-130103-', '1');
INSERT INTO `base_area` VALUES ('130104', '130100', '桥西区', '0', '0', '130000-130100-130104-', '1');
INSERT INTO `base_area` VALUES ('130105', '130100', '新华区', '0', '0', '130000-130100-130105-', '1');
INSERT INTO `base_area` VALUES ('130107', '130100', '井陉矿区', '0', '0', '130000-130100-130107-', '1');
INSERT INTO `base_area` VALUES ('130108', '130100', '裕华区', '0', '0', '130000-130100-130108-', '1');
INSERT INTO `base_area` VALUES ('130121', '130100', '井陉县', '0', '0', '130000-130100-130121-', '1');
INSERT INTO `base_area` VALUES ('130123', '130100', '正定县', '0', '0', '130000-130100-130123-', '1');
INSERT INTO `base_area` VALUES ('130124', '130100', '栾城县', '0', '0', '130000-130100-130124-', '1');
INSERT INTO `base_area` VALUES ('130125', '130100', '行唐县', '0', '0', '130000-130100-130125-', '1');
INSERT INTO `base_area` VALUES ('130126', '130100', '灵寿县', '0', '0', '130000-130100-130126-', '1');
INSERT INTO `base_area` VALUES ('130127', '130100', '高邑县', '0', '0', '130000-130100-130127-', '1');
INSERT INTO `base_area` VALUES ('130128', '130100', '深泽县', '0', '0', '130000-130100-130128-', '1');
INSERT INTO `base_area` VALUES ('130129', '130100', '赞皇县', '0', '0', '130000-130100-130129-', '1');
INSERT INTO `base_area` VALUES ('130130', '130100', '无极县', '0', '0', '130000-130100-130130-', '1');
INSERT INTO `base_area` VALUES ('130131', '130100', '平山县', '0', '0', '130000-130100-130131-', '1');
INSERT INTO `base_area` VALUES ('130132', '130100', '元氏县', '0', '0', '130000-130100-130132-', '1');
INSERT INTO `base_area` VALUES ('130133', '130100', '赵　县', '0', '0', '130000-130100-130133-', '1');
INSERT INTO `base_area` VALUES ('130181', '130100', '辛集市', '0', '0', '130000-130100-130181-', '1');
INSERT INTO `base_area` VALUES ('130182', '130100', '藁城市', '0', '0', '130000-130100-130182-', '1');
INSERT INTO `base_area` VALUES ('130183', '130100', '晋州市', '0', '0', '130000-130100-130183-', '1');
INSERT INTO `base_area` VALUES ('130184', '130100', '新乐市', '0', '0', '130000-130100-130184-', '1');
INSERT INTO `base_area` VALUES ('130185', '130100', '鹿泉市', '0', '0', '130000-130100-130185-', '1');
INSERT INTO `base_area` VALUES ('130200', '130000', '唐山市', '063000', '0315', '130000-130200-', '1');
INSERT INTO `base_area` VALUES ('130201', '130200', '市辖区', '0', '0', '130000-130200-130201-', '1');
INSERT INTO `base_area` VALUES ('130202', '130200', '路南区', '0', '0', '130000-130200-130202-', '1');
INSERT INTO `base_area` VALUES ('130203', '130200', '路北区', '0', '0', '130000-130200-130203-', '1');
INSERT INTO `base_area` VALUES ('130204', '130200', '古冶区', '0', '0', '130000-130200-130204-', '1');
INSERT INTO `base_area` VALUES ('130205', '130200', '开平区', '0', '0', '130000-130200-130205-', '1');
INSERT INTO `base_area` VALUES ('130207', '130200', '丰南区', '0', '0', '130000-130200-130207-', '1');
INSERT INTO `base_area` VALUES ('130208', '130200', '丰润区', '0', '0', '130000-130200-130208-', '1');
INSERT INTO `base_area` VALUES ('130223', '130200', '滦　县', '0', '0', '130000-130200-130223-', '1');
INSERT INTO `base_area` VALUES ('130224', '130200', '滦南县', '0', '0', '130000-130200-130224-', '1');
INSERT INTO `base_area` VALUES ('130225', '130200', '乐亭县', '0', '0', '130000-130200-130225-', '1');
INSERT INTO `base_area` VALUES ('130227', '130200', '迁西县', '0', '0', '130000-130200-130227-', '1');
INSERT INTO `base_area` VALUES ('130229', '130200', '玉田县', '0', '0', '130000-130200-130229-', '1');
INSERT INTO `base_area` VALUES ('130230', '130200', '唐海县', '0', '0', '130000-130200-130230-', '1');
INSERT INTO `base_area` VALUES ('130281', '130200', '遵化市', '0', '0', '130000-130200-130281-', '1');
INSERT INTO `base_area` VALUES ('130283', '130200', '迁安市', '0', '0', '130000-130200-130283-', '1');
INSERT INTO `base_area` VALUES ('130300', '130000', '秦皇岛市', '066000', '0335', '130000-130300-', '1');
INSERT INTO `base_area` VALUES ('130301', '130300', '市辖区', '0', '0', '130000-130300-130301-', '1');
INSERT INTO `base_area` VALUES ('130302', '130300', '海港区', '0', '0', '130000-130300-130302-', '1');
INSERT INTO `base_area` VALUES ('130303', '130300', '山海关区', '0', '0', '130000-130300-130303-', '1');
INSERT INTO `base_area` VALUES ('130304', '130300', '北戴河区', '0', '0', '130000-130300-130304-', '1');
INSERT INTO `base_area` VALUES ('130321', '130300', '青龙满族自治县', '0', '0', '130000-130300-130321-', '1');
INSERT INTO `base_area` VALUES ('130322', '130300', '昌黎县', '0', '0', '130000-130300-130322-', '1');
INSERT INTO `base_area` VALUES ('130323', '130300', '抚宁县', '0', '0', '130000-130300-130323-', '1');
INSERT INTO `base_area` VALUES ('130324', '130300', '卢龙县', '0', '0', '130000-130300-130324-', '1');
INSERT INTO `base_area` VALUES ('130400', '130000', '邯郸市', '056000', '0310', '130000-130400-', '1');
INSERT INTO `base_area` VALUES ('130401', '130400', '市辖区', '0', '0', '130000-130400-130401-', '1');
INSERT INTO `base_area` VALUES ('130402', '130400', '邯山区', '0', '0', '130000-130400-130402-', '1');
INSERT INTO `base_area` VALUES ('130403', '130400', '丛台区', '0', '0', '130000-130400-130403-', '1');
INSERT INTO `base_area` VALUES ('130404', '130400', '复兴区', '0', '0', '130000-130400-130404-', '1');
INSERT INTO `base_area` VALUES ('130406', '130400', '峰峰矿区', '0', '0', '130000-130400-130406-', '1');
INSERT INTO `base_area` VALUES ('130421', '130400', '邯郸县', '0', '0', '130000-130400-130421-', '1');
INSERT INTO `base_area` VALUES ('130423', '130400', '临漳县', '0', '0', '130000-130400-130423-', '1');
INSERT INTO `base_area` VALUES ('130424', '130400', '成安县', '0', '0', '130000-130400-130424-', '1');
INSERT INTO `base_area` VALUES ('130425', '130400', '大名县', '0', '0', '130000-130400-130425-', '1');
INSERT INTO `base_area` VALUES ('130426', '130400', '涉　县', '0', '0', '130000-130400-130426-', '1');
INSERT INTO `base_area` VALUES ('130427', '130400', '磁　县', '0', '0', '130000-130400-130427-', '1');
INSERT INTO `base_area` VALUES ('130428', '130400', '肥乡县', '0', '0', '130000-130400-130428-', '1');
INSERT INTO `base_area` VALUES ('130429', '130400', '永年县', '0', '0', '130000-130400-130429-', '1');
INSERT INTO `base_area` VALUES ('130430', '130400', '邱　县', '0', '0', '130000-130400-130430-', '1');
INSERT INTO `base_area` VALUES ('130431', '130400', '鸡泽县', '0', '0', '130000-130400-130431-', '1');
INSERT INTO `base_area` VALUES ('130432', '130400', '广平县', '0', '0', '130000-130400-130432-', '1');
INSERT INTO `base_area` VALUES ('130433', '130400', '馆陶县', '0', '0', '130000-130400-130433-', '1');
INSERT INTO `base_area` VALUES ('130434', '130400', '魏　县', '0', '0', '130000-130400-130434-', '1');
INSERT INTO `base_area` VALUES ('130435', '130400', '曲周县', '0', '0', '130000-130400-130435-', '1');
INSERT INTO `base_area` VALUES ('130481', '130400', '武安市', '0', '0', '130000-130400-130481-', '1');
INSERT INTO `base_area` VALUES ('130500', '130000', '邢台市', '054000', '0319', '130000-130500-', '1');
INSERT INTO `base_area` VALUES ('130501', '130500', '市辖区', '0', '0', '130000-130500-130501-', '1');
INSERT INTO `base_area` VALUES ('130502', '130500', '桥东区', '0', '0', '130000-130500-130502-', '1');
INSERT INTO `base_area` VALUES ('130503', '130500', '桥西区', '0', '0', '130000-130500-130503-', '1');
INSERT INTO `base_area` VALUES ('130521', '130500', '邢台县', '0', '0', '130000-130500-130521-', '1');
INSERT INTO `base_area` VALUES ('130522', '130500', '临城县', '0', '0', '130000-130500-130522-', '1');
INSERT INTO `base_area` VALUES ('130523', '130500', '内丘县', '0', '0', '130000-130500-130523-', '1');
INSERT INTO `base_area` VALUES ('130524', '130500', '柏乡县', '0', '0', '130000-130500-130524-', '1');
INSERT INTO `base_area` VALUES ('130525', '130500', '隆尧县', '0', '0', '130000-130500-130525-', '1');
INSERT INTO `base_area` VALUES ('130526', '130500', '任　县', '0', '0', '130000-130500-130526-', '1');
INSERT INTO `base_area` VALUES ('130527', '130500', '南和县', '0', '0', '130000-130500-130527-', '1');
INSERT INTO `base_area` VALUES ('130528', '130500', '宁晋县', '0', '0', '130000-130500-130528-', '1');
INSERT INTO `base_area` VALUES ('130529', '130500', '巨鹿县', '0', '0', '130000-130500-130529-', '1');
INSERT INTO `base_area` VALUES ('130530', '130500', '新河县', '0', '0', '130000-130500-130530-', '1');
INSERT INTO `base_area` VALUES ('130531', '130500', '广宗县', '0', '0', '130000-130500-130531-', '1');
INSERT INTO `base_area` VALUES ('130532', '130500', '平乡县', '0', '0', '130000-130500-130532-', '1');
INSERT INTO `base_area` VALUES ('130533', '130500', '威　县', '0', '0', '130000-130500-130533-', '1');
INSERT INTO `base_area` VALUES ('130534', '130500', '清河县', '0', '0', '130000-130500-130534-', '1');
INSERT INTO `base_area` VALUES ('130535', '130500', '临西县', '0', '0', '130000-130500-130535-', '1');
INSERT INTO `base_area` VALUES ('130581', '130500', '南宫市', '0', '0', '130000-130500-130581-', '1');
INSERT INTO `base_area` VALUES ('130582', '130500', '沙河市', '0', '0', '130000-130500-130582-', '1');
INSERT INTO `base_area` VALUES ('130600', '130000', '保定市', '071000', '0312', '130000-130600-', '1');
INSERT INTO `base_area` VALUES ('130601', '130600', '市辖区', '0', '0', '130000-130600-130601-', '1');
INSERT INTO `base_area` VALUES ('130602', '130600', '新市区', '0', '0', '130000-130600-130602-', '1');
INSERT INTO `base_area` VALUES ('130603', '130600', '北市区', '0', '0', '130000-130600-130603-', '1');
INSERT INTO `base_area` VALUES ('130604', '130600', '南市区', '0', '0', '130000-130600-130604-', '1');
INSERT INTO `base_area` VALUES ('130621', '130600', '满城县', '0', '0', '130000-130600-130621-', '1');
INSERT INTO `base_area` VALUES ('130622', '130600', '清苑县', '0', '0', '130000-130600-130622-', '1');
INSERT INTO `base_area` VALUES ('130623', '130600', '涞水县', '0', '0', '130000-130600-130623-', '1');
INSERT INTO `base_area` VALUES ('130624', '130600', '阜平县', '0', '0', '130000-130600-130624-', '1');
INSERT INTO `base_area` VALUES ('130625', '130600', '徐水县', '0', '0', '130000-130600-130625-', '1');
INSERT INTO `base_area` VALUES ('130626', '130600', '定兴县', '0', '0', '130000-130600-130626-', '1');
INSERT INTO `base_area` VALUES ('130627', '130600', '唐　县', '0', '0', '130000-130600-130627-', '1');
INSERT INTO `base_area` VALUES ('130628', '130600', '高阳县', '0', '0', '130000-130600-130628-', '1');
INSERT INTO `base_area` VALUES ('130629', '130600', '容城县', '0', '0', '130000-130600-130629-', '1');
INSERT INTO `base_area` VALUES ('130630', '130600', '涞源县', '0', '0', '130000-130600-130630-', '1');
INSERT INTO `base_area` VALUES ('130631', '130600', '望都县', '0', '0', '130000-130600-130631-', '1');
INSERT INTO `base_area` VALUES ('130632', '130600', '安新县', '0', '0', '130000-130600-130632-', '1');
INSERT INTO `base_area` VALUES ('130633', '130600', '易　县', '0', '0', '130000-130600-130633-', '1');
INSERT INTO `base_area` VALUES ('130634', '130600', '曲阳县', '0', '0', '130000-130600-130634-', '1');
INSERT INTO `base_area` VALUES ('130635', '130600', '蠡　县', '0', '0', '130000-130600-130635-', '1');
INSERT INTO `base_area` VALUES ('130636', '130600', '顺平县', '0', '0', '130000-130600-130636-', '1');
INSERT INTO `base_area` VALUES ('130637', '130600', '博野县', '0', '0', '130000-130600-130637-', '1');
INSERT INTO `base_area` VALUES ('130638', '130600', '雄　县', '0', '0', '130000-130600-130638-', '1');
INSERT INTO `base_area` VALUES ('130681', '130600', '涿州市', '0', '0', '130000-130600-130681-', '1');
INSERT INTO `base_area` VALUES ('130682', '130600', '定州市', '0', '0', '130000-130600-130682-', '1');
INSERT INTO `base_area` VALUES ('130683', '130600', '安国市', '0', '0', '130000-130600-130683-', '1');
INSERT INTO `base_area` VALUES ('130684', '130600', '高碑店市', '0', '0', '130000-130600-130684-', '1');
INSERT INTO `base_area` VALUES ('130700', '130000', '张家口市', '075000', '0313', '130000-130700-', '1');
INSERT INTO `base_area` VALUES ('130701', '130700', '市辖区', '0', '0', '130000-130700-130701-', '1');
INSERT INTO `base_area` VALUES ('130702', '130700', '桥东区', '0', '0', '130000-130700-130702-', '1');
INSERT INTO `base_area` VALUES ('130703', '130700', '桥西区', '0', '0', '130000-130700-130703-', '1');
INSERT INTO `base_area` VALUES ('130705', '130700', '宣化区', '0', '0', '130000-130700-130705-', '1');
INSERT INTO `base_area` VALUES ('130706', '130700', '下花园区', '0', '0', '130000-130700-130706-', '1');
INSERT INTO `base_area` VALUES ('130721', '130700', '宣化县', '0', '0', '130000-130700-130721-', '1');
INSERT INTO `base_area` VALUES ('130722', '130700', '张北县', '0', '0', '130000-130700-130722-', '1');
INSERT INTO `base_area` VALUES ('130723', '130700', '康保县', '0', '0', '130000-130700-130723-', '1');
INSERT INTO `base_area` VALUES ('130724', '130700', '沽源县', '0', '0', '130000-130700-130724-', '1');
INSERT INTO `base_area` VALUES ('130725', '130700', '尚义县', '0', '0', '130000-130700-130725-', '1');
INSERT INTO `base_area` VALUES ('130726', '130700', '蔚　县', '0', '0', '130000-130700-130726-', '1');
INSERT INTO `base_area` VALUES ('130727', '130700', '阳原县', '0', '0', '130000-130700-130727-', '1');
INSERT INTO `base_area` VALUES ('130728', '130700', '怀安县', '0', '0', '130000-130700-130728-', '1');
INSERT INTO `base_area` VALUES ('130729', '130700', '万全县', '0', '0', '130000-130700-130729-', '1');
INSERT INTO `base_area` VALUES ('130730', '130700', '怀来县', '0', '0', '130000-130700-130730-', '1');
INSERT INTO `base_area` VALUES ('130731', '130700', '涿鹿县', '0', '0', '130000-130700-130731-', '1');
INSERT INTO `base_area` VALUES ('130732', '130700', '赤城县', '0', '0', '130000-130700-130732-', '1');
INSERT INTO `base_area` VALUES ('130733', '130700', '崇礼县', '0', '0', '130000-130700-130733-', '1');
INSERT INTO `base_area` VALUES ('130800', '130000', '承德市', '067000', '0314', '130000-130800-', '1');
INSERT INTO `base_area` VALUES ('130801', '130800', '市辖区', '0', '0', '130000-130800-130801-', '1');
INSERT INTO `base_area` VALUES ('130802', '130800', '双桥区', '0', '0', '130000-130800-130802-', '1');
INSERT INTO `base_area` VALUES ('130803', '130800', '双滦区', '0', '0', '130000-130800-130803-', '1');
INSERT INTO `base_area` VALUES ('130804', '130800', '鹰手营子矿区', '0', '0', '130000-130800-130804-', '1');
INSERT INTO `base_area` VALUES ('130821', '130800', '承德县', '0', '0', '130000-130800-130821-', '1');
INSERT INTO `base_area` VALUES ('130822', '130800', '兴隆县', '0', '0', '130000-130800-130822-', '1');
INSERT INTO `base_area` VALUES ('130823', '130800', '平泉县', '0', '0', '130000-130800-130823-', '1');
INSERT INTO `base_area` VALUES ('130824', '130800', '滦平县', '0', '0', '130000-130800-130824-', '1');
INSERT INTO `base_area` VALUES ('130825', '130800', '隆化县', '0', '0', '130000-130800-130825-', '1');
INSERT INTO `base_area` VALUES ('130826', '130800', '丰宁满族自治县', '0', '0', '130000-130800-130826-', '1');
INSERT INTO `base_area` VALUES ('130827', '130800', '宽城满族自治县', '0', '0', '130000-130800-130827-', '1');
INSERT INTO `base_area` VALUES ('130828', '130800', '围场满族蒙古族自治县', '0', '0', '130000-130800-130828-', '1');
INSERT INTO `base_area` VALUES ('130900', '130000', '沧州市', '031000', '0317', '130000-130900-', '1');
INSERT INTO `base_area` VALUES ('130901', '130900', '市辖区', '0', '0', '130000-130900-130901-', '1');
INSERT INTO `base_area` VALUES ('130902', '130900', '新华区', '0', '0', '130000-130900-130902-', '1');
INSERT INTO `base_area` VALUES ('130903', '130900', '运河区', '0', '0', '130000-130900-130903-', '1');
INSERT INTO `base_area` VALUES ('130921', '130900', '沧　县', '0', '0', '130000-130900-130921-', '1');
INSERT INTO `base_area` VALUES ('130922', '130900', '青　县', '0', '0', '130000-130900-130922-', '1');
INSERT INTO `base_area` VALUES ('130923', '130900', '东光县', '0', '0', '130000-130900-130923-', '1');
INSERT INTO `base_area` VALUES ('130924', '130900', '海兴县', '0', '0', '130000-130900-130924-', '1');
INSERT INTO `base_area` VALUES ('130925', '130900', '盐山县', '0', '0', '130000-130900-130925-', '1');
INSERT INTO `base_area` VALUES ('130926', '130900', '肃宁县', '0', '0', '130000-130900-130926-', '1');
INSERT INTO `base_area` VALUES ('130927', '130900', '南皮县', '0', '0', '130000-130900-130927-', '1');
INSERT INTO `base_area` VALUES ('130928', '130900', '吴桥县', '0', '0', '130000-130900-130928-', '1');
INSERT INTO `base_area` VALUES ('130929', '130900', '献　县', '0', '0', '130000-130900-130929-', '1');
INSERT INTO `base_area` VALUES ('130930', '130900', '孟村回族自治县', '0', '0', '130000-130900-130930-', '1');
INSERT INTO `base_area` VALUES ('130981', '130900', '泊头市', '0', '0', '130000-130900-130981-', '1');
INSERT INTO `base_area` VALUES ('130982', '130900', '任丘市', '0', '0', '130000-130900-130982-', '1');
INSERT INTO `base_area` VALUES ('130983', '130900', '黄骅市', '0', '0', '130000-130900-130983-', '1');
INSERT INTO `base_area` VALUES ('130984', '130900', '河间市', '0', '0', '130000-130900-130984-', '1');
INSERT INTO `base_area` VALUES ('131000', '130000', '廊坊市', '065000', '0316', '130000-131000-', '1');
INSERT INTO `base_area` VALUES ('131001', '131000', '市辖区', '0', '0', '130000-131000-131001-', '1');
INSERT INTO `base_area` VALUES ('131002', '131000', '安次区', '0', '0', '130000-131000-131002-', '1');
INSERT INTO `base_area` VALUES ('131003', '131000', '广阳区', '0', '0', '130000-131000-131003-', '1');
INSERT INTO `base_area` VALUES ('131022', '131000', '固安县', '0', '0', '130000-131000-131022-', '1');
INSERT INTO `base_area` VALUES ('131023', '131000', '永清县', '0', '0', '130000-131000-131023-', '1');
INSERT INTO `base_area` VALUES ('131024', '131000', '香河县', '0', '0', '130000-131000-131024-', '1');
INSERT INTO `base_area` VALUES ('131025', '131000', '大城县', '0', '0', '130000-131000-131025-', '1');
INSERT INTO `base_area` VALUES ('131026', '131000', '文安县', '0', '0', '130000-131000-131026-', '1');
INSERT INTO `base_area` VALUES ('131028', '131000', '大厂回族自治县', '0', '0', '130000-131000-131028-', '1');
INSERT INTO `base_area` VALUES ('131081', '131000', '霸州市', '0', '0', '130000-131000-131081-', '1');
INSERT INTO `base_area` VALUES ('131082', '131000', '三河市', '0', '0', '130000-131000-131082-', '1');
INSERT INTO `base_area` VALUES ('131100', '130000', '衡水市', '053000', '0318', '130000-131100-', '1');
INSERT INTO `base_area` VALUES ('131101', '131100', '市辖区', '0', '0', '130000-131100-131101-', '1');
INSERT INTO `base_area` VALUES ('131102', '131100', '桃城区', '0', '0', '130000-131100-131102-', '1');
INSERT INTO `base_area` VALUES ('131121', '131100', '枣强县', '0', '0', '130000-131100-131121-', '1');
INSERT INTO `base_area` VALUES ('131122', '131100', '武邑县', '0', '0', '130000-131100-131122-', '1');
INSERT INTO `base_area` VALUES ('131123', '131100', '武强县', '0', '0', '130000-131100-131123-', '1');
INSERT INTO `base_area` VALUES ('131124', '131100', '饶阳县', '0', '0', '130000-131100-131124-', '1');
INSERT INTO `base_area` VALUES ('131125', '131100', '安平县', '0', '0', '130000-131100-131125-', '1');
INSERT INTO `base_area` VALUES ('131126', '131100', '故城县', '0', '0', '130000-131100-131126-', '1');
INSERT INTO `base_area` VALUES ('131127', '131100', '景　县', '0', '0', '130000-131100-131127-', '1');
INSERT INTO `base_area` VALUES ('131128', '131100', '阜城县', '0', '0', '130000-131100-131128-', '1');
INSERT INTO `base_area` VALUES ('131181', '131100', '冀州市', '0', '0', '130000-131100-131181-', '1');
INSERT INTO `base_area` VALUES ('131182', '131100', '深州市', '0', '0', '130000-131100-131182-', '1');
INSERT INTO `base_area` VALUES ('140000', '0', '山西省', '0', '0', '140000-', '1');
INSERT INTO `base_area` VALUES ('140100', '140000', '太原市', '030000', '0351', '140000-140100-', '1');
INSERT INTO `base_area` VALUES ('140101', '140100', '市辖区', '0', '0', '140000-140100-140101-', '1');
INSERT INTO `base_area` VALUES ('140105', '140100', '小店区', '0', '0', '140000-140100-140105-', '1');
INSERT INTO `base_area` VALUES ('140106', '140100', '迎泽区', '0', '0', '140000-140100-140106-', '1');
INSERT INTO `base_area` VALUES ('140107', '140100', '杏花岭区', '0', '0', '140000-140100-140107-', '1');
INSERT INTO `base_area` VALUES ('140108', '140100', '尖草坪区', '0', '0', '140000-140100-140108-', '1');
INSERT INTO `base_area` VALUES ('140109', '140100', '万柏林区', '0', '0', '140000-140100-140109-', '1');
INSERT INTO `base_area` VALUES ('140110', '140100', '晋源区', '0', '0', '140000-140100-140110-', '1');
INSERT INTO `base_area` VALUES ('140121', '140100', '清徐县', '0', '0', '140000-140100-140121-', '1');
INSERT INTO `base_area` VALUES ('140122', '140100', '阳曲县', '0', '0', '140000-140100-140122-', '1');
INSERT INTO `base_area` VALUES ('140123', '140100', '娄烦县', '0', '0', '140000-140100-140123-', '1');
INSERT INTO `base_area` VALUES ('140181', '140100', '古交市', '0', '0', '140000-140100-140181-', '1');
INSERT INTO `base_area` VALUES ('140200', '140000', '大同市', '037000', '0352', '140000-140200-', '1');
INSERT INTO `base_area` VALUES ('140201', '140200', '市辖区', '0', '0', '140000-140200-140201-', '1');
INSERT INTO `base_area` VALUES ('140202', '140200', '城　区', '0', '0', '140000-140200-140202-', '1');
INSERT INTO `base_area` VALUES ('140203', '140200', '矿　区', '0', '0', '140000-140200-140203-', '1');
INSERT INTO `base_area` VALUES ('140211', '140200', '南郊区', '0', '0', '140000-140200-140211-', '1');
INSERT INTO `base_area` VALUES ('140212', '140200', '新荣区', '0', '0', '140000-140200-140212-', '1');
INSERT INTO `base_area` VALUES ('140221', '140200', '阳高县', '0', '0', '140000-140200-140221-', '1');
INSERT INTO `base_area` VALUES ('140222', '140200', '天镇县', '0', '0', '140000-140200-140222-', '1');
INSERT INTO `base_area` VALUES ('140223', '140200', '广灵县', '0', '0', '140000-140200-140223-', '1');
INSERT INTO `base_area` VALUES ('140224', '140200', '灵丘县', '0', '0', '140000-140200-140224-', '1');
INSERT INTO `base_area` VALUES ('140225', '140200', '浑源县', '0', '0', '140000-140200-140225-', '1');
INSERT INTO `base_area` VALUES ('140226', '140200', '左云县', '0', '0', '140000-140200-140226-', '1');
INSERT INTO `base_area` VALUES ('140227', '140200', '大同县', '0', '0', '140000-140200-140227-', '1');
INSERT INTO `base_area` VALUES ('140300', '140000', '阳泉市', '045000', '0353', '140000-140300-', '1');
INSERT INTO `base_area` VALUES ('140301', '140300', '市辖区', '0', '0', '140000-140300-140301-', '1');
INSERT INTO `base_area` VALUES ('140302', '140300', '城　区', '0', '0', '140000-140300-140302-', '1');
INSERT INTO `base_area` VALUES ('140303', '140300', '矿　区', '0', '0', '140000-140300-140303-', '1');
INSERT INTO `base_area` VALUES ('140311', '140300', '郊　区', '0', '0', '140000-140300-140311-', '1');
INSERT INTO `base_area` VALUES ('140321', '140300', '平定县', '0', '0', '140000-140300-140321-', '1');
INSERT INTO `base_area` VALUES ('140322', '140300', '盂　县', '0', '0', '140000-140300-140322-', '1');
INSERT INTO `base_area` VALUES ('140400', '140000', '长治市', '046000', '0355', '140000-140400-', '1');
INSERT INTO `base_area` VALUES ('140401', '140400', '市辖区', '0', '0', '140000-140400-140401-', '1');
INSERT INTO `base_area` VALUES ('140402', '140400', '城　区', '0', '0', '140000-140400-140402-', '1');
INSERT INTO `base_area` VALUES ('140411', '140400', '郊　区', '0', '0', '140000-140400-140411-', '1');
INSERT INTO `base_area` VALUES ('140421', '140400', '长治县', '0', '0', '140000-140400-140421-', '1');
INSERT INTO `base_area` VALUES ('140423', '140400', '襄垣县', '0', '0', '140000-140400-140423-', '1');
INSERT INTO `base_area` VALUES ('140424', '140400', '屯留县', '0', '0', '140000-140400-140424-', '1');
INSERT INTO `base_area` VALUES ('140425', '140400', '平顺县', '0', '0', '140000-140400-140425-', '1');
INSERT INTO `base_area` VALUES ('140426', '140400', '黎城县', '0', '0', '140000-140400-140426-', '1');
INSERT INTO `base_area` VALUES ('140427', '140400', '壶关县', '0', '0', '140000-140400-140427-', '1');
INSERT INTO `base_area` VALUES ('140428', '140400', '长子县', '0', '0', '140000-140400-140428-', '1');
INSERT INTO `base_area` VALUES ('140429', '140400', '武乡县', '0', '0', '140000-140400-140429-', '1');
INSERT INTO `base_area` VALUES ('140430', '140400', '沁　县', '0', '0', '140000-140400-140430-', '1');
INSERT INTO `base_area` VALUES ('140431', '140400', '沁源县', '0', '0', '140000-140400-140431-', '1');
INSERT INTO `base_area` VALUES ('140481', '140400', '潞城市', '0', '0', '140000-140400-140481-', '1');
INSERT INTO `base_area` VALUES ('140500', '140000', '晋城市', '048000', '0356', '140000-140500-', '1');
INSERT INTO `base_area` VALUES ('140501', '140500', '市辖区', '0', '0', '140000-140500-140501-', '1');
INSERT INTO `base_area` VALUES ('140502', '140500', '城　区', '0', '0', '140000-140500-140502-', '1');
INSERT INTO `base_area` VALUES ('140521', '140500', '沁水县', '0', '0', '140000-140500-140521-', '1');
INSERT INTO `base_area` VALUES ('140522', '140500', '阳城县', '0', '0', '140000-140500-140522-', '1');
INSERT INTO `base_area` VALUES ('140524', '140500', '陵川县', '0', '0', '140000-140500-140524-', '1');
INSERT INTO `base_area` VALUES ('140525', '140500', '泽州县', '0', '0', '140000-140500-140525-', '1');
INSERT INTO `base_area` VALUES ('140581', '140500', '高平市', '0', '0', '140000-140500-140581-', '1');
INSERT INTO `base_area` VALUES ('140600', '140000', '朔州市', '036000', '0349', '140000-140600-', '1');
INSERT INTO `base_area` VALUES ('140601', '140600', '市辖区', '0', '0', '140000-140600-140601-', '1');
INSERT INTO `base_area` VALUES ('140602', '140600', '朔城区', '0', '0', '140000-140600-140602-', '1');
INSERT INTO `base_area` VALUES ('140603', '140600', '平鲁区', '0', '0', '140000-140600-140603-', '1');
INSERT INTO `base_area` VALUES ('140621', '140600', '山阴县', '0', '0', '140000-140600-140621-', '1');
INSERT INTO `base_area` VALUES ('140622', '140600', '应　县', '0', '0', '140000-140600-140622-', '1');
INSERT INTO `base_area` VALUES ('140623', '140600', '右玉县', '0', '0', '140000-140600-140623-', '1');
INSERT INTO `base_area` VALUES ('140624', '140600', '怀仁县', '0', '0', '140000-140600-140624-', '1');
INSERT INTO `base_area` VALUES ('140700', '140000', '晋中市', '030600', '0354', '140000-140700-', '1');
INSERT INTO `base_area` VALUES ('140701', '140700', '市辖区', '0', '0', '140000-140700-140701-', '1');
INSERT INTO `base_area` VALUES ('140702', '140700', '榆次区', '0', '0', '140000-140700-140702-', '1');
INSERT INTO `base_area` VALUES ('140721', '140700', '榆社县', '0', '0', '140000-140700-140721-', '1');
INSERT INTO `base_area` VALUES ('140722', '140700', '左权县', '0', '0', '140000-140700-140722-', '1');
INSERT INTO `base_area` VALUES ('140723', '140700', '和顺县', '0', '0', '140000-140700-140723-', '1');
INSERT INTO `base_area` VALUES ('140724', '140700', '昔阳县', '0', '0', '140000-140700-140724-', '1');
INSERT INTO `base_area` VALUES ('140725', '140700', '寿阳县', '0', '0', '140000-140700-140725-', '1');
INSERT INTO `base_area` VALUES ('140726', '140700', '太谷县', '0', '0', '140000-140700-140726-', '1');
INSERT INTO `base_area` VALUES ('140727', '140700', '祁　县', '0', '0', '140000-140700-140727-', '1');
INSERT INTO `base_area` VALUES ('140728', '140700', '平遥县', '0', '0', '140000-140700-140728-', '1');
INSERT INTO `base_area` VALUES ('140729', '140700', '灵石县', '0', '0', '140000-140700-140729-', '1');
INSERT INTO `base_area` VALUES ('140781', '140700', '介休市', '0', '0', '140000-140700-140781-', '1');
INSERT INTO `base_area` VALUES ('140800', '140000', '运城市', '044000', '0359', '140000-140800-', '1');
INSERT INTO `base_area` VALUES ('140801', '140800', '市辖区', '0', '0', '140000-140800-140801-', '1');
INSERT INTO `base_area` VALUES ('140802', '140800', '盐湖区', '0', '0', '140000-140800-140802-', '1');
INSERT INTO `base_area` VALUES ('140821', '140800', '临猗县', '0', '0', '140000-140800-140821-', '1');
INSERT INTO `base_area` VALUES ('140822', '140800', '万荣县', '0', '0', '140000-140800-140822-', '1');
INSERT INTO `base_area` VALUES ('140823', '140800', '闻喜县', '0', '0', '140000-140800-140823-', '1');
INSERT INTO `base_area` VALUES ('140824', '140800', '稷山县', '0', '0', '140000-140800-140824-', '1');
INSERT INTO `base_area` VALUES ('140825', '140800', '新绛县', '0', '0', '140000-140800-140825-', '1');
INSERT INTO `base_area` VALUES ('140826', '140800', '绛　县', '0', '0', '140000-140800-140826-', '1');
INSERT INTO `base_area` VALUES ('140827', '140800', '垣曲县', '0', '0', '140000-140800-140827-', '1');
INSERT INTO `base_area` VALUES ('140828', '140800', '夏　县', '0', '0', '140000-140800-140828-', '1');
INSERT INTO `base_area` VALUES ('140829', '140800', '平陆县', '0', '0', '140000-140800-140829-', '1');
INSERT INTO `base_area` VALUES ('140830', '140800', '芮城县', '0', '0', '140000-140800-140830-', '1');
INSERT INTO `base_area` VALUES ('140881', '140800', '永济市', '0', '0', '140000-140800-140881-', '1');
INSERT INTO `base_area` VALUES ('140882', '140800', '河津市', '0', '0', '140000-140800-140882-', '1');
INSERT INTO `base_area` VALUES ('140900', '140000', '忻州市', '034000', '0350', '140000-140900-', '1');
INSERT INTO `base_area` VALUES ('140901', '140900', '市辖区', '0', '0', '140000-140900-140901-', '1');
INSERT INTO `base_area` VALUES ('140902', '140900', '忻府区', '0', '0', '140000-140900-140902-', '1');
INSERT INTO `base_area` VALUES ('140921', '140900', '定襄县', '0', '0', '140000-140900-140921-', '1');
INSERT INTO `base_area` VALUES ('140922', '140900', '五台县', '0', '0', '140000-140900-140922-', '1');
INSERT INTO `base_area` VALUES ('140923', '140900', '代　县', '0', '0', '140000-140900-140923-', '1');
INSERT INTO `base_area` VALUES ('140924', '140900', '繁峙县', '0', '0', '140000-140900-140924-', '1');
INSERT INTO `base_area` VALUES ('140925', '140900', '宁武县', '0', '0', '140000-140900-140925-', '1');
INSERT INTO `base_area` VALUES ('140926', '140900', '静乐县', '0', '0', '140000-140900-140926-', '1');
INSERT INTO `base_area` VALUES ('140927', '140900', '神池县', '0', '0', '140000-140900-140927-', '1');
INSERT INTO `base_area` VALUES ('140928', '140900', '五寨县', '0', '0', '140000-140900-140928-', '1');
INSERT INTO `base_area` VALUES ('140929', '140900', '岢岚县', '0', '0', '140000-140900-140929-', '1');
INSERT INTO `base_area` VALUES ('140930', '140900', '河曲县', '0', '0', '140000-140900-140930-', '1');
INSERT INTO `base_area` VALUES ('140931', '140900', '保德县', '0', '0', '140000-140900-140931-', '1');
INSERT INTO `base_area` VALUES ('140932', '140900', '偏关县', '0', '0', '140000-140900-140932-', '1');
INSERT INTO `base_area` VALUES ('140981', '140900', '原平市', '0', '0', '140000-140900-140981-', '1');
INSERT INTO `base_area` VALUES ('141000', '140000', '临汾市', '041000', '0357', '140000-141000-', '1');
INSERT INTO `base_area` VALUES ('141001', '141000', '市辖区', '0', '0', '140000-141000-141001-', '1');
INSERT INTO `base_area` VALUES ('141002', '141000', '尧都区', '0', '0', '140000-141000-141002-', '1');
INSERT INTO `base_area` VALUES ('141021', '141000', '曲沃县', '0', '0', '140000-141000-141021-', '1');
INSERT INTO `base_area` VALUES ('141022', '141000', '翼城县', '0', '0', '140000-141000-141022-', '1');
INSERT INTO `base_area` VALUES ('141023', '141000', '襄汾县', '0', '0', '140000-141000-141023-', '1');
INSERT INTO `base_area` VALUES ('141024', '141000', '洪洞县', '0', '0', '140000-141000-141024-', '1');
INSERT INTO `base_area` VALUES ('141025', '141000', '古　县', '0', '0', '140000-141000-141025-', '1');
INSERT INTO `base_area` VALUES ('141026', '141000', '安泽县', '0', '0', '140000-141000-141026-', '1');
INSERT INTO `base_area` VALUES ('141027', '141000', '浮山县', '0', '0', '140000-141000-141027-', '1');
INSERT INTO `base_area` VALUES ('141028', '141000', '吉　县', '0', '0', '140000-141000-141028-', '1');
INSERT INTO `base_area` VALUES ('141029', '141000', '乡宁县', '0', '0', '140000-141000-141029-', '1');
INSERT INTO `base_area` VALUES ('141030', '141000', '大宁县', '0', '0', '140000-141000-141030-', '1');
INSERT INTO `base_area` VALUES ('141031', '141000', '隰　县', '0', '0', '140000-141000-141031-', '1');
INSERT INTO `base_area` VALUES ('141032', '141000', '永和县', '0', '0', '140000-141000-141032-', '1');
INSERT INTO `base_area` VALUES ('141033', '141000', '蒲　县', '0', '0', '140000-141000-141033-', '1');
INSERT INTO `base_area` VALUES ('141034', '141000', '汾西县', '0', '0', '140000-141000-141034-', '1');
INSERT INTO `base_area` VALUES ('141081', '141000', '侯马市', '0', '0', '140000-141000-141081-', '1');
INSERT INTO `base_area` VALUES ('141082', '141000', '霍州市', '0', '0', '140000-141000-141082-', '1');
INSERT INTO `base_area` VALUES ('141100', '140000', '吕梁市', '033000', '0358', '140000-141100-', '1');
INSERT INTO `base_area` VALUES ('141101', '141100', '市辖区', '0', '0', '140000-141100-141101-', '1');
INSERT INTO `base_area` VALUES ('141102', '141100', '离石区', '0', '0', '140000-141100-141102-', '1');
INSERT INTO `base_area` VALUES ('141121', '141100', '文水县', '0', '0', '140000-141100-141121-', '1');
INSERT INTO `base_area` VALUES ('141122', '141100', '交城县', '0', '0', '140000-141100-141122-', '1');
INSERT INTO `base_area` VALUES ('141123', '141100', '兴　县', '0', '0', '140000-141100-141123-', '1');
INSERT INTO `base_area` VALUES ('141124', '141100', '临　县', '0', '0', '140000-141100-141124-', '1');
INSERT INTO `base_area` VALUES ('141125', '141100', '柳林县', '0', '0', '140000-141100-141125-', '1');
INSERT INTO `base_area` VALUES ('141126', '141100', '石楼县', '0', '0', '140000-141100-141126-', '1');
INSERT INTO `base_area` VALUES ('141127', '141100', '岚　县', '0', '0', '140000-141100-141127-', '1');
INSERT INTO `base_area` VALUES ('141128', '141100', '方山县', '0', '0', '140000-141100-141128-', '1');
INSERT INTO `base_area` VALUES ('141129', '141100', '中阳县', '0', '0', '140000-141100-141129-', '1');
INSERT INTO `base_area` VALUES ('141130', '141100', '交口县', '0', '0', '140000-141100-141130-', '1');
INSERT INTO `base_area` VALUES ('141181', '141100', '孝义市', '0', '0', '140000-141100-141181-', '1');
INSERT INTO `base_area` VALUES ('141182', '141100', '汾阳市', '0', '0', '140000-141100-141182-', '1');
INSERT INTO `base_area` VALUES ('150000', '0', '内蒙古自治区', '0', '0', '150000-', '1');
INSERT INTO `base_area` VALUES ('150100', '150000', '呼和浩特市', '010000', '0471', '150000-150100-', '1');
INSERT INTO `base_area` VALUES ('150101', '150100', '市辖区', '0', '0', '150000-150100-150101-', '1');
INSERT INTO `base_area` VALUES ('150102', '150100', '新城区', '0', '0', '150000-150100-150102-', '1');
INSERT INTO `base_area` VALUES ('150103', '150100', '回民区', '0', '0', '150000-150100-150103-', '1');
INSERT INTO `base_area` VALUES ('150104', '150100', '玉泉区', '0', '0', '150000-150100-150104-', '1');
INSERT INTO `base_area` VALUES ('150105', '150100', '赛罕区', '0', '0', '150000-150100-150105-', '1');
INSERT INTO `base_area` VALUES ('150121', '150100', '土默特左旗', '0', '0', '150000-150100-150121-', '1');
INSERT INTO `base_area` VALUES ('150122', '150100', '托克托县', '0', '0', '150000-150100-150122-', '1');
INSERT INTO `base_area` VALUES ('150123', '150100', '和林格尔县', '0', '0', '150000-150100-150123-', '1');
INSERT INTO `base_area` VALUES ('150124', '150100', '清水河县', '0', '0', '150000-150100-150124-', '1');
INSERT INTO `base_area` VALUES ('150125', '150100', '武川县', '0', '0', '150000-150100-150125-', '1');
INSERT INTO `base_area` VALUES ('150200', '150000', '包头市', '014000', '0472', '150000-150200-', '1');
INSERT INTO `base_area` VALUES ('150201', '150200', '市辖区', '0', '0', '150000-150200-150201-', '1');
INSERT INTO `base_area` VALUES ('150202', '150200', '东河区', '0', '0', '150000-150200-150202-', '1');
INSERT INTO `base_area` VALUES ('150203', '150200', '昆都仑区', '0', '0', '150000-150200-150203-', '1');
INSERT INTO `base_area` VALUES ('150204', '150200', '青山区', '0', '0', '150000-150200-150204-', '1');
INSERT INTO `base_area` VALUES ('150205', '150200', '石拐区', '0', '0', '150000-150200-150205-', '1');
INSERT INTO `base_area` VALUES ('150206', '150200', '白云矿区', '0', '0', '150000-150200-150206-', '1');
INSERT INTO `base_area` VALUES ('150207', '150200', '九原区', '0', '0', '150000-150200-150207-', '1');
INSERT INTO `base_area` VALUES ('150221', '150200', '土默特右旗', '0', '0', '150000-150200-150221-', '1');
INSERT INTO `base_area` VALUES ('150222', '150200', '固阳县', '0', '0', '150000-150200-150222-', '1');
INSERT INTO `base_area` VALUES ('150223', '150200', '达尔罕茂明安联合旗', '0', '0', '150000-150200-150223-', '1');
INSERT INTO `base_area` VALUES ('150300', '150000', '乌海市', '016000', '0473', '150000-150300-', '1');
INSERT INTO `base_area` VALUES ('150301', '150300', '市辖区', '0', '0', '150000-150300-150301-', '1');
INSERT INTO `base_area` VALUES ('150302', '150300', '海勃湾区', '0', '0', '150000-150300-150302-', '1');
INSERT INTO `base_area` VALUES ('150303', '150300', '海南区', '0', '0', '150000-150300-150303-', '1');
INSERT INTO `base_area` VALUES ('150304', '150300', '乌达区', '0', '0', '150000-150300-150304-', '1');
INSERT INTO `base_area` VALUES ('150400', '150000', '赤峰市', '024000', '0476', '150000-150400-', '1');
INSERT INTO `base_area` VALUES ('150401', '150400', '市辖区', '0', '0', '150000-150400-150401-', '1');
INSERT INTO `base_area` VALUES ('150402', '150400', '红山区', '0', '0', '150000-150400-150402-', '1');
INSERT INTO `base_area` VALUES ('150403', '150400', '元宝山区', '0', '0', '150000-150400-150403-', '1');
INSERT INTO `base_area` VALUES ('150404', '150400', '松山区', '0', '0', '150000-150400-150404-', '1');
INSERT INTO `base_area` VALUES ('150421', '150400', '阿鲁科尔沁旗', '0', '0', '150000-150400-150421-', '1');
INSERT INTO `base_area` VALUES ('150422', '150400', '巴林左旗', '0', '0', '150000-150400-150422-', '1');
INSERT INTO `base_area` VALUES ('150423', '150400', '巴林右旗', '0', '0', '150000-150400-150423-', '1');
INSERT INTO `base_area` VALUES ('150424', '150400', '林西县', '0', '0', '150000-150400-150424-', '1');
INSERT INTO `base_area` VALUES ('150425', '150400', '克什克腾旗', '0', '0', '150000-150400-150425-', '1');
INSERT INTO `base_area` VALUES ('150426', '150400', '翁牛特旗', '0', '0', '150000-150400-150426-', '1');
INSERT INTO `base_area` VALUES ('150428', '150400', '喀喇沁旗', '0', '0', '150000-150400-150428-', '1');
INSERT INTO `base_area` VALUES ('150429', '150400', '宁城县', '0', '0', '150000-150400-150429-', '1');
INSERT INTO `base_area` VALUES ('150430', '150400', '敖汉旗', '0', '0', '150000-150400-150430-', '1');
INSERT INTO `base_area` VALUES ('150500', '150000', '通辽市', '028000', '0475', '150000-150500-', '1');
INSERT INTO `base_area` VALUES ('150501', '150500', '市辖区', '0', '0', '150000-150500-150501-', '1');
INSERT INTO `base_area` VALUES ('150502', '150500', '科尔沁区', '0', '0', '150000-150500-150502-', '1');
INSERT INTO `base_area` VALUES ('150521', '150500', '科尔沁左翼中旗', '0', '0', '150000-150500-150521-', '1');
INSERT INTO `base_area` VALUES ('150522', '150500', '科尔沁左翼后旗', '0', '0', '150000-150500-150522-', '1');
INSERT INTO `base_area` VALUES ('150523', '150500', '开鲁县', '0', '0', '150000-150500-150523-', '1');
INSERT INTO `base_area` VALUES ('150524', '150500', '库伦旗', '0', '0', '150000-150500-150524-', '1');
INSERT INTO `base_area` VALUES ('150525', '150500', '奈曼旗', '0', '0', '150000-150500-150525-', '1');
INSERT INTO `base_area` VALUES ('150526', '150500', '扎鲁特旗', '0', '0', '150000-150500-150526-', '1');
INSERT INTO `base_area` VALUES ('150581', '150500', '霍林郭勒市', '0', '0', '150000-150500-150581-', '1');
INSERT INTO `base_area` VALUES ('150600', '150000', '鄂尔多斯市', '017000', '0477', '150000-150600-', '1');
INSERT INTO `base_area` VALUES ('150602', '150600', '东胜区', '0', '0', '150000-150600-150602-', '1');
INSERT INTO `base_area` VALUES ('150621', '150600', '达拉特旗', '0', '0', '150000-150600-150621-', '1');
INSERT INTO `base_area` VALUES ('150622', '150600', '准格尔旗', '0', '0', '150000-150600-150622-', '1');
INSERT INTO `base_area` VALUES ('150623', '150600', '鄂托克前旗', '0', '0', '150000-150600-150623-', '1');
INSERT INTO `base_area` VALUES ('150624', '150600', '鄂托克旗', '0', '0', '150000-150600-150624-', '1');
INSERT INTO `base_area` VALUES ('150625', '150600', '杭锦旗', '0', '0', '150000-150600-150625-', '1');
INSERT INTO `base_area` VALUES ('150626', '150600', '乌审旗', '0', '0', '150000-150600-150626-', '1');
INSERT INTO `base_area` VALUES ('150627', '150600', '伊金霍洛旗', '0', '0', '150000-150600-150627-', '1');
INSERT INTO `base_area` VALUES ('150700', '150000', '呼伦贝尔市', '021000', '0470', '150000-150700-', '1');
INSERT INTO `base_area` VALUES ('150701', '150700', '市辖区', '0', '0', '150000-150700-150701-', '1');
INSERT INTO `base_area` VALUES ('150702', '150700', '海拉尔区', '0', '0', '150000-150700-150702-', '1');
INSERT INTO `base_area` VALUES ('150721', '150700', '阿荣旗', '0', '0', '150000-150700-150721-', '1');
INSERT INTO `base_area` VALUES ('150722', '150700', '莫力达瓦达斡尔族自治旗', '0', '0', '150000-150700-150722-', '1');
INSERT INTO `base_area` VALUES ('150723', '150700', '鄂伦春自治旗', '0', '0', '150000-150700-150723-', '1');
INSERT INTO `base_area` VALUES ('150724', '150700', '鄂温克族自治旗', '0', '0', '150000-150700-150724-', '1');
INSERT INTO `base_area` VALUES ('150725', '150700', '陈巴尔虎旗', '0', '0', '150000-150700-150725-', '1');
INSERT INTO `base_area` VALUES ('150726', '150700', '新巴尔虎左旗', '0', '0', '150000-150700-150726-', '1');
INSERT INTO `base_area` VALUES ('150727', '150700', '新巴尔虎右旗', '0', '0', '150000-150700-150727-', '1');
INSERT INTO `base_area` VALUES ('150781', '150700', '满洲里市', '0', '0', '150000-150700-150781-', '1');
INSERT INTO `base_area` VALUES ('150782', '150700', '牙克石市', '0', '0', '150000-150700-150782-', '1');
INSERT INTO `base_area` VALUES ('150783', '150700', '扎兰屯市', '0', '0', '150000-150700-150783-', '1');
INSERT INTO `base_area` VALUES ('150784', '150700', '额尔古纳市', '0', '0', '150000-150700-150784-', '1');
INSERT INTO `base_area` VALUES ('150785', '150700', '根河市', '0', '0', '150000-150700-150785-', '1');
INSERT INTO `base_area` VALUES ('150800', '150000', '巴彦淖尔市', '015000', '0478', '150000-150800-', '1');
INSERT INTO `base_area` VALUES ('150801', '150800', '市辖区', '0', '0', '150000-150800-150801-', '1');
INSERT INTO `base_area` VALUES ('150802', '150800', '临河区', '0', '0', '150000-150800-150802-', '1');
INSERT INTO `base_area` VALUES ('150821', '150800', '五原县', '0', '0', '150000-150800-150821-', '1');
INSERT INTO `base_area` VALUES ('150822', '150800', '磴口县', '0', '0', '150000-150800-150822-', '1');
INSERT INTO `base_area` VALUES ('150823', '150800', '乌拉特前旗', '0', '0', '150000-150800-150823-', '1');
INSERT INTO `base_area` VALUES ('150824', '150800', '乌拉特中旗', '0', '0', '150000-150800-150824-', '1');
INSERT INTO `base_area` VALUES ('150825', '150800', '乌拉特后旗', '0', '0', '150000-150800-150825-', '1');
INSERT INTO `base_area` VALUES ('150826', '150800', '杭锦后旗', '0', '0', '150000-150800-150826-', '1');
INSERT INTO `base_area` VALUES ('150900', '150000', '乌兰察布市', '012000', '0474', '150000-150900-', '1');
INSERT INTO `base_area` VALUES ('150901', '150900', '市辖区', '0', '0', '150000-150900-150901-', '1');
INSERT INTO `base_area` VALUES ('150902', '150900', '集宁区', '0', '0', '150000-150900-150902-', '1');
INSERT INTO `base_area` VALUES ('150921', '150900', '卓资县', '0', '0', '150000-150900-150921-', '1');
INSERT INTO `base_area` VALUES ('150922', '150900', '化德县', '0', '0', '150000-150900-150922-', '1');
INSERT INTO `base_area` VALUES ('150923', '150900', '商都县', '0', '0', '150000-150900-150923-', '1');
INSERT INTO `base_area` VALUES ('150924', '150900', '兴和县', '0', '0', '150000-150900-150924-', '1');
INSERT INTO `base_area` VALUES ('150925', '150900', '凉城县', '0', '0', '150000-150900-150925-', '1');
INSERT INTO `base_area` VALUES ('150926', '150900', '察哈尔右翼前旗', '0', '0', '150000-150900-150926-', '1');
INSERT INTO `base_area` VALUES ('150927', '150900', '察哈尔右翼中旗', '0', '0', '150000-150900-150927-', '1');
INSERT INTO `base_area` VALUES ('150928', '150900', '察哈尔右翼后旗', '0', '0', '150000-150900-150928-', '1');
INSERT INTO `base_area` VALUES ('150929', '150900', '四子王旗', '0', '0', '150000-150900-150929-', '1');
INSERT INTO `base_area` VALUES ('150981', '150900', '丰镇市', '0', '0', '150000-150900-150981-', '1');
INSERT INTO `base_area` VALUES ('152200', '150000', '兴安盟', '137400', '0482', '150000-152200-', '1');
INSERT INTO `base_area` VALUES ('152201', '152200', '乌兰浩特市', '0', '0', '150000-152200-152201-', '1');
INSERT INTO `base_area` VALUES ('152202', '152200', '阿尔山市', '0', '0', '150000-152200-152202-', '1');
INSERT INTO `base_area` VALUES ('152221', '152200', '科尔沁右翼前旗', '0', '0', '150000-152200-152221-', '1');
INSERT INTO `base_area` VALUES ('152222', '152200', '科尔沁右翼中旗', '0', '0', '150000-152200-152222-', '1');
INSERT INTO `base_area` VALUES ('152223', '152200', '扎赉特旗', '0', '0', '150000-152200-152223-', '1');
INSERT INTO `base_area` VALUES ('152224', '152200', '突泉县', '0', '0', '150000-152200-152224-', '1');
INSERT INTO `base_area` VALUES ('152500', '150000', '锡林郭勒盟', '026000', '0479', '150000-152500-', '1');
INSERT INTO `base_area` VALUES ('152501', '152500', '二连浩特市', '0', '0', '150000-152500-152501-', '1');
INSERT INTO `base_area` VALUES ('152502', '152500', '锡林浩特市', '0', '0', '150000-152500-152502-', '1');
INSERT INTO `base_area` VALUES ('152522', '152500', '阿巴嘎旗', '0', '0', '150000-152500-152522-', '1');
INSERT INTO `base_area` VALUES ('152523', '152500', '苏尼特左旗', '0', '0', '150000-152500-152523-', '1');
INSERT INTO `base_area` VALUES ('152524', '152500', '苏尼特右旗', '0', '0', '150000-152500-152524-', '1');
INSERT INTO `base_area` VALUES ('152525', '152500', '东乌珠穆沁旗', '0', '0', '150000-152500-152525-', '1');
INSERT INTO `base_area` VALUES ('152526', '152500', '西乌珠穆沁旗', '0', '0', '150000-152500-152526-', '1');
INSERT INTO `base_area` VALUES ('152527', '152500', '太仆寺旗', '0', '0', '150000-152500-152527-', '1');
INSERT INTO `base_area` VALUES ('152528', '152500', '镶黄旗', '0', '0', '150000-152500-152528-', '1');
INSERT INTO `base_area` VALUES ('152529', '152500', '正镶白旗', '0', '0', '150000-152500-152529-', '1');
INSERT INTO `base_area` VALUES ('152530', '152500', '正蓝旗', '0', '0', '150000-152500-152530-', '1');
INSERT INTO `base_area` VALUES ('152531', '152500', '多伦县', '0', '0', '150000-152500-152531-', '1');
INSERT INTO `base_area` VALUES ('152900', '150000', '阿拉善盟', '735000', '0483', '150000-152900-', '1');
INSERT INTO `base_area` VALUES ('152921', '152900', '阿拉善左旗', '0', '0', '150000-152900-152921-', '1');
INSERT INTO `base_area` VALUES ('152922', '152900', '阿拉善右旗', '0', '0', '150000-152900-152922-', '1');
INSERT INTO `base_area` VALUES ('152923', '152900', '额济纳旗', '0', '0', '150000-152900-152923-', '1');
INSERT INTO `base_area` VALUES ('210000', '0', '辽宁省', '0', '0', '210000-', '1');
INSERT INTO `base_area` VALUES ('210100', '210000', '沈阳市', '110000', '024', '210000-210100-', '1');
INSERT INTO `base_area` VALUES ('210101', '210100', '市辖区', '0', '0', '210000-210100-210101-', '1');
INSERT INTO `base_area` VALUES ('210102', '210100', '和平区', '0', '0', '210000-210100-210102-', '1');
INSERT INTO `base_area` VALUES ('210103', '210100', '沈河区', '0', '0', '210000-210100-210103-', '1');
INSERT INTO `base_area` VALUES ('210104', '210100', '大东区', '0', '0', '210000-210100-210104-', '1');
INSERT INTO `base_area` VALUES ('210105', '210100', '皇姑区', '0', '0', '210000-210100-210105-', '1');
INSERT INTO `base_area` VALUES ('210106', '210100', '铁西区', '0', '0', '210000-210100-210106-', '1');
INSERT INTO `base_area` VALUES ('210111', '210100', '苏家屯区', '0', '0', '210000-210100-210111-', '1');
INSERT INTO `base_area` VALUES ('210112', '210100', '东陵区', '0', '0', '210000-210100-210112-', '1');
INSERT INTO `base_area` VALUES ('210113', '210100', '新城子区', '0', '0', '210000-210100-210113-', '1');
INSERT INTO `base_area` VALUES ('210114', '210100', '于洪区', '0', '0', '210000-210100-210114-', '1');
INSERT INTO `base_area` VALUES ('210122', '210100', '辽中县', '0', '0', '210000-210100-210122-', '1');
INSERT INTO `base_area` VALUES ('210123', '210100', '康平县', '0', '0', '210000-210100-210123-', '1');
INSERT INTO `base_area` VALUES ('210124', '210100', '法库县', '0', '0', '210000-210100-210124-', '1');
INSERT INTO `base_area` VALUES ('210181', '210100', '新民市', '0', '0', '210000-210100-210181-', '1');
INSERT INTO `base_area` VALUES ('210200', '210000', '大连市', '116000', '0411', '210000-210200-', '1');
INSERT INTO `base_area` VALUES ('210201', '210200', '市辖区', '0', '0', '210000-210200-210201-', '1');
INSERT INTO `base_area` VALUES ('210202', '210200', '中山区', '0', '0', '210000-210200-210202-', '1');
INSERT INTO `base_area` VALUES ('210203', '210200', '西岗区', '0', '0', '210000-210200-210203-', '1');
INSERT INTO `base_area` VALUES ('210204', '210200', '沙河口区', '0', '0', '210000-210200-210204-', '1');
INSERT INTO `base_area` VALUES ('210211', '210200', '甘井子区', '0', '0', '210000-210200-210211-', '1');
INSERT INTO `base_area` VALUES ('210212', '210200', '旅顺口区', '0', '0', '210000-210200-210212-', '1');
INSERT INTO `base_area` VALUES ('210213', '210200', '金州区', '0', '0', '210000-210200-210213-', '1');
INSERT INTO `base_area` VALUES ('210224', '210200', '长海县', '0', '0', '210000-210200-210224-', '1');
INSERT INTO `base_area` VALUES ('210281', '210200', '瓦房店市', '0', '0', '210000-210200-210281-', '1');
INSERT INTO `base_area` VALUES ('210282', '210200', '普兰店市', '0', '0', '210000-210200-210282-', '1');
INSERT INTO `base_area` VALUES ('210283', '210200', '庄河市', '0', '0', '210000-210200-210283-', '1');
INSERT INTO `base_area` VALUES ('210300', '210000', '鞍山市', '114000', '0412', '210000-210300-', '1');
INSERT INTO `base_area` VALUES ('210301', '210300', '市辖区', '0', '0', '210000-210300-210301-', '1');
INSERT INTO `base_area` VALUES ('210302', '210300', '铁东区', '0', '0', '210000-210300-210302-', '1');
INSERT INTO `base_area` VALUES ('210303', '210300', '铁西区', '0', '0', '210000-210300-210303-', '1');
INSERT INTO `base_area` VALUES ('210304', '210300', '立山区', '0', '0', '210000-210300-210304-', '1');
INSERT INTO `base_area` VALUES ('210311', '210300', '千山区', '0', '0', '210000-210300-210311-', '1');
INSERT INTO `base_area` VALUES ('210321', '210300', '台安县', '0', '0', '210000-210300-210321-', '1');
INSERT INTO `base_area` VALUES ('210323', '210300', '岫岩满族自治县', '0', '0', '210000-210300-210323-', '1');
INSERT INTO `base_area` VALUES ('210381', '210300', '海城市', '0', '0', '210000-210300-210381-', '1');
INSERT INTO `base_area` VALUES ('210400', '210000', '抚顺市', '113000', '0413', '210000-210400-', '1');
INSERT INTO `base_area` VALUES ('210401', '210400', '市辖区', '0', '0', '210000-210400-210401-', '1');
INSERT INTO `base_area` VALUES ('210402', '210400', '新抚区', '0', '0', '210000-210400-210402-', '1');
INSERT INTO `base_area` VALUES ('210403', '210400', '东洲区', '0', '0', '210000-210400-210403-', '1');
INSERT INTO `base_area` VALUES ('210404', '210400', '望花区', '0', '0', '210000-210400-210404-', '1');
INSERT INTO `base_area` VALUES ('210411', '210400', '顺城区', '0', '0', '210000-210400-210411-', '1');
INSERT INTO `base_area` VALUES ('210421', '210400', '抚顺县', '0', '0', '210000-210400-210421-', '1');
INSERT INTO `base_area` VALUES ('210422', '210400', '新宾满族自治县', '0', '0', '210000-210400-210422-', '1');
INSERT INTO `base_area` VALUES ('210423', '210400', '清原满族自治县', '0', '0', '210000-210400-210423-', '1');
INSERT INTO `base_area` VALUES ('210500', '210000', '本溪市', '117000', '0414', '210000-210500-', '1');
INSERT INTO `base_area` VALUES ('210501', '210500', '市辖区', '0', '0', '210000-210500-210501-', '1');
INSERT INTO `base_area` VALUES ('210502', '210500', '平山区', '0', '0', '210000-210500-210502-', '1');
INSERT INTO `base_area` VALUES ('210503', '210500', '溪湖区', '0', '0', '210000-210500-210503-', '1');
INSERT INTO `base_area` VALUES ('210504', '210500', '明山区', '0', '0', '210000-210500-210504-', '1');
INSERT INTO `base_area` VALUES ('210505', '210500', '南芬区', '0', '0', '210000-210500-210505-', '1');
INSERT INTO `base_area` VALUES ('210521', '210500', '本溪满族自治县', '0', '0', '210000-210500-210521-', '1');
INSERT INTO `base_area` VALUES ('210522', '210500', '桓仁满族自治县', '0', '0', '210000-210500-210522-', '1');
INSERT INTO `base_area` VALUES ('210600', '210000', '丹东市', '118000', '0415', '210000-210600-', '1');
INSERT INTO `base_area` VALUES ('210601', '210600', '市辖区', '0', '0', '210000-210600-210601-', '1');
INSERT INTO `base_area` VALUES ('210602', '210600', '元宝区', '0', '0', '210000-210600-210602-', '1');
INSERT INTO `base_area` VALUES ('210603', '210600', '振兴区', '0', '0', '210000-210600-210603-', '1');
INSERT INTO `base_area` VALUES ('210604', '210600', '振安区', '0', '0', '210000-210600-210604-', '1');
INSERT INTO `base_area` VALUES ('210624', '210600', '宽甸满族自治县', '0', '0', '210000-210600-210624-', '1');
INSERT INTO `base_area` VALUES ('210681', '210600', '东港市', '0', '0', '210000-210600-210681-', '1');
INSERT INTO `base_area` VALUES ('210682', '210600', '凤城市', '0', '0', '210000-210600-210682-', '1');
INSERT INTO `base_area` VALUES ('210700', '210000', '锦州市', '121000', '0416', '210000-210700-', '1');
INSERT INTO `base_area` VALUES ('210701', '210700', '市辖区', '0', '0', '210000-210700-210701-', '1');
INSERT INTO `base_area` VALUES ('210702', '210700', '古塔区', '0', '0', '210000-210700-210702-', '1');
INSERT INTO `base_area` VALUES ('210703', '210700', '凌河区', '0', '0', '210000-210700-210703-', '1');
INSERT INTO `base_area` VALUES ('210711', '210700', '太和区', '0', '0', '210000-210700-210711-', '1');
INSERT INTO `base_area` VALUES ('210726', '210700', '黑山县', '0', '0', '210000-210700-210726-', '1');
INSERT INTO `base_area` VALUES ('210727', '210700', '义　县', '0', '0', '210000-210700-210727-', '1');
INSERT INTO `base_area` VALUES ('210781', '210700', '凌海市', '0', '0', '210000-210700-210781-', '1');
INSERT INTO `base_area` VALUES ('210782', '210700', '北宁市', '0', '0', '210000-210700-210782-', '1');
INSERT INTO `base_area` VALUES ('210800', '210000', '营口市', '115000', '0417', '210000-210800-', '1');
INSERT INTO `base_area` VALUES ('210801', '210800', '市辖区', '0', '0', '210000-210800-210801-', '1');
INSERT INTO `base_area` VALUES ('210802', '210800', '站前区', '0', '0', '210000-210800-210802-', '1');
INSERT INTO `base_area` VALUES ('210803', '210800', '西市区', '0', '0', '210000-210800-210803-', '1');
INSERT INTO `base_area` VALUES ('210804', '210800', '鲅鱼圈区', '0', '0', '210000-210800-210804-', '1');
INSERT INTO `base_area` VALUES ('210811', '210800', '老边区', '0', '0', '210000-210800-210811-', '1');
INSERT INTO `base_area` VALUES ('210881', '210800', '盖州市', '0', '0', '210000-210800-210881-', '1');
INSERT INTO `base_area` VALUES ('210882', '210800', '大石桥市', '0', '0', '210000-210800-210882-', '1');
INSERT INTO `base_area` VALUES ('210900', '210000', '阜新市', '123000', '0418', '210000-210900-', '1');
INSERT INTO `base_area` VALUES ('210901', '210900', '市辖区', '0', '0', '210000-210900-210901-', '1');
INSERT INTO `base_area` VALUES ('210902', '210900', '海州区', '0', '0', '210000-210900-210902-', '1');
INSERT INTO `base_area` VALUES ('210903', '210900', '新邱区', '0', '0', '210000-210900-210903-', '1');
INSERT INTO `base_area` VALUES ('210904', '210900', '太平区', '0', '0', '210000-210900-210904-', '1');
INSERT INTO `base_area` VALUES ('210905', '210900', '清河门区', '0', '0', '210000-210900-210905-', '1');
INSERT INTO `base_area` VALUES ('210911', '210900', '细河区', '0', '0', '210000-210900-210911-', '1');
INSERT INTO `base_area` VALUES ('210921', '210900', '阜新蒙古族自治县', '0', '0', '210000-210900-210921-', '1');
INSERT INTO `base_area` VALUES ('210922', '210900', '彰武县', '0', '0', '210000-210900-210922-', '1');
INSERT INTO `base_area` VALUES ('211000', '210000', '辽阳市', '111000', '0419', '210000-211000-', '1');
INSERT INTO `base_area` VALUES ('211001', '211000', '市辖区', '0', '0', '210000-211000-211001-', '1');
INSERT INTO `base_area` VALUES ('211002', '211000', '白塔区', '0', '0', '210000-211000-211002-', '1');
INSERT INTO `base_area` VALUES ('211003', '211000', '文圣区', '0', '0', '210000-211000-211003-', '1');
INSERT INTO `base_area` VALUES ('211004', '211000', '宏伟区', '0', '0', '210000-211000-211004-', '1');
INSERT INTO `base_area` VALUES ('211005', '211000', '弓长岭区', '0', '0', '210000-211000-211005-', '1');
INSERT INTO `base_area` VALUES ('211011', '211000', '太子河区', '0', '0', '210000-211000-211011-', '1');
INSERT INTO `base_area` VALUES ('211021', '211000', '辽阳县', '0', '0', '210000-211000-211021-', '1');
INSERT INTO `base_area` VALUES ('211081', '211000', '灯塔市', '0', '0', '210000-211000-211081-', '1');
INSERT INTO `base_area` VALUES ('211100', '210000', '盘锦市', '124000', '0427', '210000-211100-', '1');
INSERT INTO `base_area` VALUES ('211101', '211100', '市辖区', '0', '0', '210000-211100-211101-', '1');
INSERT INTO `base_area` VALUES ('211102', '211100', '双台子区', '0', '0', '210000-211100-211102-', '1');
INSERT INTO `base_area` VALUES ('211103', '211100', '兴隆台区', '0', '0', '210000-211100-211103-', '1');
INSERT INTO `base_area` VALUES ('211121', '211100', '大洼县', '0', '0', '210000-211100-211121-', '1');
INSERT INTO `base_area` VALUES ('211122', '211100', '盘山县', '0', '0', '210000-211100-211122-', '1');
INSERT INTO `base_area` VALUES ('211200', '210000', '铁岭市', '112000', '0410', '210000-211200-', '1');
INSERT INTO `base_area` VALUES ('211201', '211200', '市辖区', '0', '0', '210000-211200-211201-', '1');
INSERT INTO `base_area` VALUES ('211202', '211200', '银州区', '0', '0', '210000-211200-211202-', '1');
INSERT INTO `base_area` VALUES ('211204', '211200', '清河区', '0', '0', '210000-211200-211204-', '1');
INSERT INTO `base_area` VALUES ('211221', '211200', '铁岭县', '0', '0', '210000-211200-211221-', '1');
INSERT INTO `base_area` VALUES ('211223', '211200', '西丰县', '0', '0', '210000-211200-211223-', '1');
INSERT INTO `base_area` VALUES ('211224', '211200', '昌图县', '0', '0', '210000-211200-211224-', '1');
INSERT INTO `base_area` VALUES ('211281', '211200', '调兵山市', '0', '0', '210000-211200-211281-', '1');
INSERT INTO `base_area` VALUES ('211282', '211200', '开原市', '0', '0', '210000-211200-211282-', '1');
INSERT INTO `base_area` VALUES ('211300', '210000', '朝阳市', '122000', '0421', '210000-211300-', '1');
INSERT INTO `base_area` VALUES ('211301', '211300', '市辖区', '0', '0', '210000-211300-211301-', '1');
INSERT INTO `base_area` VALUES ('211302', '211300', '双塔区', '0', '0', '210000-211300-211302-', '1');
INSERT INTO `base_area` VALUES ('211303', '211300', '龙城区', '0', '0', '210000-211300-211303-', '1');
INSERT INTO `base_area` VALUES ('211321', '211300', '朝阳县', '0', '0', '210000-211300-211321-', '1');
INSERT INTO `base_area` VALUES ('211322', '211300', '建平县', '0', '0', '210000-211300-211322-', '1');
INSERT INTO `base_area` VALUES ('211324', '211300', '喀喇沁左翼蒙古族自治县', '0', '0', '210000-211300-211324-', '1');
INSERT INTO `base_area` VALUES ('211381', '211300', '北票市', '0', '0', '210000-211300-211381-', '1');
INSERT INTO `base_area` VALUES ('211382', '211300', '凌源市', '0', '0', '210000-211300-211382-', '1');
INSERT INTO `base_area` VALUES ('211400', '210000', '葫芦岛市', '125000', '0429', '210000-211400-', '1');
INSERT INTO `base_area` VALUES ('211401', '211400', '市辖区', '0', '0', '210000-211400-211401-', '1');
INSERT INTO `base_area` VALUES ('211402', '211400', '连山区', '0', '0', '210000-211400-211402-', '1');
INSERT INTO `base_area` VALUES ('211403', '211400', '龙港区', '0', '0', '210000-211400-211403-', '1');
INSERT INTO `base_area` VALUES ('211404', '211400', '南票区', '0', '0', '210000-211400-211404-', '1');
INSERT INTO `base_area` VALUES ('211421', '211400', '绥中县', '0', '0', '210000-211400-211421-', '1');
INSERT INTO `base_area` VALUES ('211422', '211400', '建昌县', '0', '0', '210000-211400-211422-', '1');
INSERT INTO `base_area` VALUES ('211481', '211400', '兴城市', '0', '0', '210000-211400-211481-', '1');
INSERT INTO `base_area` VALUES ('220000', '0', '吉林省', '0', '0', '220000-', '1');
INSERT INTO `base_area` VALUES ('220100', '220000', '长春市', '130000', '0431', '220000-220100-', '1');
INSERT INTO `base_area` VALUES ('220101', '220100', '市辖区', '0', '0', '220000-220100-220101-', '1');
INSERT INTO `base_area` VALUES ('220102', '220100', '南关区', '0', '0', '220000-220100-220102-', '1');
INSERT INTO `base_area` VALUES ('220103', '220100', '宽城区', '0', '0', '220000-220100-220103-', '1');
INSERT INTO `base_area` VALUES ('220104', '220100', '朝阳区', '0', '0', '220000-220100-220104-', '1');
INSERT INTO `base_area` VALUES ('220105', '220100', '二道区', '0', '0', '220000-220100-220105-', '1');
INSERT INTO `base_area` VALUES ('220106', '220100', '绿园区', '0', '0', '220000-220100-220106-', '1');
INSERT INTO `base_area` VALUES ('220112', '220100', '双阳区', '0', '0', '220000-220100-220112-', '1');
INSERT INTO `base_area` VALUES ('220122', '220100', '农安县', '0', '0', '220000-220100-220122-', '1');
INSERT INTO `base_area` VALUES ('220181', '220100', '九台市', '0', '0', '220000-220100-220181-', '1');
INSERT INTO `base_area` VALUES ('220182', '220100', '榆树市', '0', '0', '220000-220100-220182-', '1');
INSERT INTO `base_area` VALUES ('220183', '220100', '德惠市', '0', '0', '220000-220100-220183-', '1');
INSERT INTO `base_area` VALUES ('220200', '220000', '吉林市', '132000', '0432', '220000-220200-', '1');
INSERT INTO `base_area` VALUES ('220201', '220200', '市辖区', '0', '0', '220000-220200-220201-', '1');
INSERT INTO `base_area` VALUES ('220202', '220200', '昌邑区', '0', '0', '220000-220200-220202-', '1');
INSERT INTO `base_area` VALUES ('220203', '220200', '龙潭区', '0', '0', '220000-220200-220203-', '1');
INSERT INTO `base_area` VALUES ('220204', '220200', '船营区', '0', '0', '220000-220200-220204-', '1');
INSERT INTO `base_area` VALUES ('220211', '220200', '丰满区', '0', '0', '220000-220200-220211-', '1');
INSERT INTO `base_area` VALUES ('220221', '220200', '永吉县', '0', '0', '220000-220200-220221-', '1');
INSERT INTO `base_area` VALUES ('220281', '220200', '蛟河市', '0', '0', '220000-220200-220281-', '1');
INSERT INTO `base_area` VALUES ('220282', '220200', '桦甸市', '0', '0', '220000-220200-220282-', '1');
INSERT INTO `base_area` VALUES ('220283', '220200', '舒兰市', '0', '0', '220000-220200-220283-', '1');
INSERT INTO `base_area` VALUES ('220284', '220200', '磐石市', '0', '0', '220000-220200-220284-', '1');
INSERT INTO `base_area` VALUES ('220300', '220000', '四平市', '136000', '0434', '220000-220300-', '1');
INSERT INTO `base_area` VALUES ('220301', '220300', '市辖区', '0', '0', '220000-220300-220301-', '1');
INSERT INTO `base_area` VALUES ('220302', '220300', '铁西区', '0', '0', '220000-220300-220302-', '1');
INSERT INTO `base_area` VALUES ('220303', '220300', '铁东区', '0', '0', '220000-220300-220303-', '1');
INSERT INTO `base_area` VALUES ('220322', '220300', '梨树县', '0', '0', '220000-220300-220322-', '1');
INSERT INTO `base_area` VALUES ('220323', '220300', '伊通满族自治县', '0', '0', '220000-220300-220323-', '1');
INSERT INTO `base_area` VALUES ('220381', '220300', '公主岭市', '0', '0', '220000-220300-220381-', '1');
INSERT INTO `base_area` VALUES ('220382', '220300', '双辽市', '0', '0', '220000-220300-220382-', '1');
INSERT INTO `base_area` VALUES ('220400', '220000', '辽源市', '136200', '0437', '220000-220400-', '1');
INSERT INTO `base_area` VALUES ('220401', '220400', '市辖区', '0', '0', '220000-220400-220401-', '1');
INSERT INTO `base_area` VALUES ('220402', '220400', '龙山区', '0', '0', '220000-220400-220402-', '1');
INSERT INTO `base_area` VALUES ('220403', '220400', '西安区', '0', '0', '220000-220400-220403-', '1');
INSERT INTO `base_area` VALUES ('220421', '220400', '东丰县', '0', '0', '220000-220400-220421-', '1');
INSERT INTO `base_area` VALUES ('220422', '220400', '东辽县', '0', '0', '220000-220400-220422-', '1');
INSERT INTO `base_area` VALUES ('220500', '220000', '通化市', '134000', '0435', '220000-220500-', '1');
INSERT INTO `base_area` VALUES ('220501', '220500', '市辖区', '0', '0', '220000-220500-220501-', '1');
INSERT INTO `base_area` VALUES ('220502', '220500', '东昌区', '0', '0', '220000-220500-220502-', '1');
INSERT INTO `base_area` VALUES ('220503', '220500', '二道江区', '0', '0', '220000-220500-220503-', '1');
INSERT INTO `base_area` VALUES ('220521', '220500', '通化县', '0', '0', '220000-220500-220521-', '1');
INSERT INTO `base_area` VALUES ('220523', '220500', '辉南县', '0', '0', '220000-220500-220523-', '1');
INSERT INTO `base_area` VALUES ('220524', '220500', '柳河县', '0', '0', '220000-220500-220524-', '1');
INSERT INTO `base_area` VALUES ('220581', '220500', '梅河口市', '0', '0', '220000-220500-220581-', '1');
INSERT INTO `base_area` VALUES ('220582', '220500', '集安市', '0', '0', '220000-220500-220582-', '1');
INSERT INTO `base_area` VALUES ('220600', '220000', '白山市', '134300', '0439', '220000-220600-', '1');
INSERT INTO `base_area` VALUES ('220601', '220600', '市辖区', '0', '0', '220000-220600-220601-', '1');
INSERT INTO `base_area` VALUES ('220602', '220600', '八道江区', '0', '0', '220000-220600-220602-', '1');
INSERT INTO `base_area` VALUES ('220621', '220600', '抚松县', '0', '0', '220000-220600-220621-', '1');
INSERT INTO `base_area` VALUES ('220622', '220600', '靖宇县', '0', '0', '220000-220600-220622-', '1');
INSERT INTO `base_area` VALUES ('220623', '220600', '长白朝鲜族自治县', '0', '0', '220000-220600-220623-', '1');
INSERT INTO `base_area` VALUES ('220625', '220600', '江源县', '0', '0', '220000-220600-220625-', '1');
INSERT INTO `base_area` VALUES ('220681', '220600', '临江市', '0', '0', '220000-220600-220681-', '1');
INSERT INTO `base_area` VALUES ('220700', '220000', '松原市', '138000', '0438', '220000-220700-', '1');
INSERT INTO `base_area` VALUES ('220701', '220700', '市辖区', '0', '0', '220000-220700-220701-', '1');
INSERT INTO `base_area` VALUES ('220702', '220700', '宁江区', '0', '0', '220000-220700-220702-', '1');
INSERT INTO `base_area` VALUES ('220721', '220700', '前郭尔罗斯蒙古族自治县', '0', '0', '220000-220700-220721-', '1');
INSERT INTO `base_area` VALUES ('220722', '220700', '长岭县', '0', '0', '220000-220700-220722-', '1');
INSERT INTO `base_area` VALUES ('220723', '220700', '乾安县', '0', '0', '220000-220700-220723-', '1');
INSERT INTO `base_area` VALUES ('220724', '220700', '扶余县', '0', '0', '220000-220700-220724-', '1');
INSERT INTO `base_area` VALUES ('220800', '220000', '白城市', '137000', '0436', '220000-220800-', '1');
INSERT INTO `base_area` VALUES ('220801', '220800', '市辖区', '0', '0', '220000-220800-220801-', '1');
INSERT INTO `base_area` VALUES ('220802', '220800', '洮北区', '0', '0', '220000-220800-220802-', '1');
INSERT INTO `base_area` VALUES ('220821', '220800', '镇赉县', '0', '0', '220000-220800-220821-', '1');
INSERT INTO `base_area` VALUES ('220822', '220800', '通榆县', '0', '0', '220000-220800-220822-', '1');
INSERT INTO `base_area` VALUES ('220881', '220800', '洮南市', '0', '0', '220000-220800-220881-', '1');
INSERT INTO `base_area` VALUES ('220882', '220800', '大安市', '0', '0', '220000-220800-220882-', '1');
INSERT INTO `base_area` VALUES ('222400', '220000', '延边州', '133000', '0433', '220000-222400-', '1');
INSERT INTO `base_area` VALUES ('222401', '222400', '延吉市', '0', '0', '220000-222400-222401-', '1');
INSERT INTO `base_area` VALUES ('222402', '222400', '图们市', '0', '0', '220000-222400-222402-', '1');
INSERT INTO `base_area` VALUES ('222403', '222400', '敦化市', '0', '0', '220000-222400-222403-', '1');
INSERT INTO `base_area` VALUES ('222404', '222400', '珲春市', '0', '0', '220000-222400-222404-', '1');
INSERT INTO `base_area` VALUES ('222405', '222400', '龙井市', '0', '0', '220000-222400-222405-', '1');
INSERT INTO `base_area` VALUES ('222406', '222400', '和龙市', '0', '0', '220000-222400-222406-', '1');
INSERT INTO `base_area` VALUES ('222424', '222400', '汪清县', '0', '0', '220000-222400-222424-', '1');
INSERT INTO `base_area` VALUES ('222426', '222400', '安图县', '0', '0', '220000-222400-222426-', '1');
INSERT INTO `base_area` VALUES ('230000', '0', '黑龙江省', '0', '0', '230000-', '1');
INSERT INTO `base_area` VALUES ('230100', '230000', '哈尔滨市', '150000', '0451', '230000-230100-', '1');
INSERT INTO `base_area` VALUES ('230101', '230100', '市辖区', '0', '0', '230000-230100-230101-', '1');
INSERT INTO `base_area` VALUES ('230102', '230100', '道里区', '0', '0', '230000-230100-230102-', '1');
INSERT INTO `base_area` VALUES ('230103', '230100', '南岗区', '0', '0', '230000-230100-230103-', '1');
INSERT INTO `base_area` VALUES ('230104', '230100', '道外区', '0', '0', '230000-230100-230104-', '1');
INSERT INTO `base_area` VALUES ('230106', '230100', '香坊区', '0', '0', '230000-230100-230106-', '1');
INSERT INTO `base_area` VALUES ('230107', '230100', '动力区', '0', '0', '230000-230100-230107-', '1');
INSERT INTO `base_area` VALUES ('230108', '230100', '平房区', '0', '0', '230000-230100-230108-', '1');
INSERT INTO `base_area` VALUES ('230109', '230100', '松北区', '0', '0', '230000-230100-230109-', '1');
INSERT INTO `base_area` VALUES ('230111', '230100', '呼兰区', '0', '0', '230000-230100-230111-', '1');
INSERT INTO `base_area` VALUES ('230123', '230100', '依兰县', '0', '0', '230000-230100-230123-', '1');
INSERT INTO `base_area` VALUES ('230124', '230100', '方正县', '0', '0', '230000-230100-230124-', '1');
INSERT INTO `base_area` VALUES ('230125', '230100', '宾　县', '0', '0', '230000-230100-230125-', '1');
INSERT INTO `base_area` VALUES ('230126', '230100', '巴彦县', '0', '0', '230000-230100-230126-', '1');
INSERT INTO `base_area` VALUES ('230127', '230100', '木兰县', '0', '0', '230000-230100-230127-', '1');
INSERT INTO `base_area` VALUES ('230128', '230100', '通河县', '0', '0', '230000-230100-230128-', '1');
INSERT INTO `base_area` VALUES ('230129', '230100', '延寿县', '0', '0', '230000-230100-230129-', '1');
INSERT INTO `base_area` VALUES ('230181', '230100', '阿城市', '0', '0', '230000-230100-230181-', '1');
INSERT INTO `base_area` VALUES ('230182', '230100', '双城市', '0', '0', '230000-230100-230182-', '1');
INSERT INTO `base_area` VALUES ('230183', '230100', '尚志市', '0', '0', '230000-230100-230183-', '1');
INSERT INTO `base_area` VALUES ('230184', '230100', '五常市', '0', '0', '230000-230100-230184-', '1');
INSERT INTO `base_area` VALUES ('230200', '230000', '齐齐哈尔市', '161000', '0452', '230000-230200-', '1');
INSERT INTO `base_area` VALUES ('230201', '230200', '市辖区', '0', '0', '230000-230200-230201-', '1');
INSERT INTO `base_area` VALUES ('230202', '230200', '龙沙区', '0', '0', '230000-230200-230202-', '1');
INSERT INTO `base_area` VALUES ('230203', '230200', '建华区', '0', '0', '230000-230200-230203-', '1');
INSERT INTO `base_area` VALUES ('230204', '230200', '铁锋区', '0', '0', '230000-230200-230204-', '1');
INSERT INTO `base_area` VALUES ('230205', '230200', '昂昂溪区', '0', '0', '230000-230200-230205-', '1');
INSERT INTO `base_area` VALUES ('230206', '230200', '富拉尔基区', '0', '0', '230000-230200-230206-', '1');
INSERT INTO `base_area` VALUES ('230207', '230200', '碾子山区', '0', '0', '230000-230200-230207-', '1');
INSERT INTO `base_area` VALUES ('230208', '230200', '梅里斯达斡尔族区', '0', '0', '230000-230200-230208-', '1');
INSERT INTO `base_area` VALUES ('230221', '230200', '龙江县', '0', '0', '230000-230200-230221-', '1');
INSERT INTO `base_area` VALUES ('230223', '230200', '依安县', '0', '0', '230000-230200-230223-', '1');
INSERT INTO `base_area` VALUES ('230224', '230200', '泰来县', '0', '0', '230000-230200-230224-', '1');
INSERT INTO `base_area` VALUES ('230225', '230200', '甘南县', '0', '0', '230000-230200-230225-', '1');
INSERT INTO `base_area` VALUES ('230227', '230200', '富裕县', '0', '0', '230000-230200-230227-', '1');
INSERT INTO `base_area` VALUES ('230229', '230200', '克山县', '0', '0', '230000-230200-230229-', '1');
INSERT INTO `base_area` VALUES ('230230', '230200', '克东县', '0', '0', '230000-230200-230230-', '1');
INSERT INTO `base_area` VALUES ('230231', '230200', '拜泉县', '0', '0', '230000-230200-230231-', '1');
INSERT INTO `base_area` VALUES ('230281', '230200', '讷河市', '0', '0', '230000-230200-230281-', '1');
INSERT INTO `base_area` VALUES ('230300', '230000', '鸡西市', '158100', '0467', '230000-230300-', '1');
INSERT INTO `base_area` VALUES ('230301', '230300', '市辖区', '0', '0', '230000-230300-230301-', '1');
INSERT INTO `base_area` VALUES ('230302', '230300', '鸡冠区', '0', '0', '230000-230300-230302-', '1');
INSERT INTO `base_area` VALUES ('230303', '230300', '恒山区', '0', '0', '230000-230300-230303-', '1');
INSERT INTO `base_area` VALUES ('230304', '230300', '滴道区', '0', '0', '230000-230300-230304-', '1');
INSERT INTO `base_area` VALUES ('230305', '230300', '梨树区', '0', '0', '230000-230300-230305-', '1');
INSERT INTO `base_area` VALUES ('230306', '230300', '城子河区', '0', '0', '230000-230300-230306-', '1');
INSERT INTO `base_area` VALUES ('230307', '230300', '麻山区', '0', '0', '230000-230300-230307-', '1');
INSERT INTO `base_area` VALUES ('230321', '230300', '鸡东县', '0', '0', '230000-230300-230321-', '1');
INSERT INTO `base_area` VALUES ('230381', '230300', '虎林市', '0', '0', '230000-230300-230381-', '1');
INSERT INTO `base_area` VALUES ('230382', '230300', '密山市', '0', '0', '230000-230300-230382-', '1');
INSERT INTO `base_area` VALUES ('230400', '230000', '鹤岗市', '154100', '0468', '230000-230400-', '1');
INSERT INTO `base_area` VALUES ('230401', '230400', '市辖区', '0', '0', '230000-230400-230401-', '1');
INSERT INTO `base_area` VALUES ('230402', '230400', '向阳区', '0', '0', '230000-230400-230402-', '1');
INSERT INTO `base_area` VALUES ('230403', '230400', '工农区', '0', '0', '230000-230400-230403-', '1');
INSERT INTO `base_area` VALUES ('230404', '230400', '南山区', '0', '0', '230000-230400-230404-', '1');
INSERT INTO `base_area` VALUES ('230405', '230400', '兴安区', '0', '0', '230000-230400-230405-', '1');
INSERT INTO `base_area` VALUES ('230406', '230400', '东山区', '0', '0', '230000-230400-230406-', '1');
INSERT INTO `base_area` VALUES ('230407', '230400', '兴山区', '0', '0', '230000-230400-230407-', '1');
INSERT INTO `base_area` VALUES ('230421', '230400', '萝北县', '0', '0', '230000-230400-230421-', '1');
INSERT INTO `base_area` VALUES ('230422', '230400', '绥滨县', '0', '0', '230000-230400-230422-', '1');
INSERT INTO `base_area` VALUES ('230500', '230000', '双鸭山市', '155100', '0469', '230000-230500-', '1');
INSERT INTO `base_area` VALUES ('230501', '230500', '市辖区', '0', '0', '230000-230500-230501-', '1');
INSERT INTO `base_area` VALUES ('230502', '230500', '尖山区', '0', '0', '230000-230500-230502-', '1');
INSERT INTO `base_area` VALUES ('230503', '230500', '岭东区', '0', '0', '230000-230500-230503-', '1');
INSERT INTO `base_area` VALUES ('230505', '230500', '四方台区', '0', '0', '230000-230500-230505-', '1');
INSERT INTO `base_area` VALUES ('230506', '230500', '宝山区', '0', '0', '230000-230500-230506-', '1');
INSERT INTO `base_area` VALUES ('230521', '230500', '集贤县', '0', '0', '230000-230500-230521-', '1');
INSERT INTO `base_area` VALUES ('230522', '230500', '友谊县', '0', '0', '230000-230500-230522-', '1');
INSERT INTO `base_area` VALUES ('230523', '230500', '宝清县', '0', '0', '230000-230500-230523-', '1');
INSERT INTO `base_area` VALUES ('230524', '230500', '饶河县', '0', '0', '230000-230500-230524-', '1');
INSERT INTO `base_area` VALUES ('230600', '230000', '大庆市', '163000', '0459', '230000-230600-', '1');
INSERT INTO `base_area` VALUES ('230601', '230600', '市辖区', '0', '0', '230000-230600-230601-', '1');
INSERT INTO `base_area` VALUES ('230602', '230600', '萨尔图区', '0', '0', '230000-230600-230602-', '1');
INSERT INTO `base_area` VALUES ('230603', '230600', '龙凤区', '0', '0', '230000-230600-230603-', '1');
INSERT INTO `base_area` VALUES ('230604', '230600', '让胡路区', '0', '0', '230000-230600-230604-', '1');
INSERT INTO `base_area` VALUES ('230605', '230600', '红岗区', '0', '0', '230000-230600-230605-', '1');
INSERT INTO `base_area` VALUES ('230606', '230600', '大同区', '0', '0', '230000-230600-230606-', '1');
INSERT INTO `base_area` VALUES ('230621', '230600', '肇州县', '0', '0', '230000-230600-230621-', '1');
INSERT INTO `base_area` VALUES ('230622', '230600', '肇源县', '0', '0', '230000-230600-230622-', '1');
INSERT INTO `base_area` VALUES ('230623', '230600', '林甸县', '0', '0', '230000-230600-230623-', '1');
INSERT INTO `base_area` VALUES ('230624', '230600', '杜尔伯特蒙古族自治县', '0', '0', '230000-230600-230624-', '1');
INSERT INTO `base_area` VALUES ('230700', '230000', '伊春市', '153000', '0458', '230000-230700-', '1');
INSERT INTO `base_area` VALUES ('230701', '230700', '市辖区', '0', '0', '230000-230700-230701-', '1');
INSERT INTO `base_area` VALUES ('230702', '230700', '伊春区', '0', '0', '230000-230700-230702-', '1');
INSERT INTO `base_area` VALUES ('230703', '230700', '南岔区', '0', '0', '230000-230700-230703-', '1');
INSERT INTO `base_area` VALUES ('230704', '230700', '友好区', '0', '0', '230000-230700-230704-', '1');
INSERT INTO `base_area` VALUES ('230705', '230700', '西林区', '0', '0', '230000-230700-230705-', '1');
INSERT INTO `base_area` VALUES ('230706', '230700', '翠峦区', '0', '0', '230000-230700-230706-', '1');
INSERT INTO `base_area` VALUES ('230707', '230700', '新青区', '0', '0', '230000-230700-230707-', '1');
INSERT INTO `base_area` VALUES ('230708', '230700', '美溪区', '0', '0', '230000-230700-230708-', '1');
INSERT INTO `base_area` VALUES ('230709', '230700', '金山屯区', '0', '0', '230000-230700-230709-', '1');
INSERT INTO `base_area` VALUES ('230710', '230700', '五营区', '0', '0', '230000-230700-230710-', '1');
INSERT INTO `base_area` VALUES ('230711', '230700', '乌马河区', '0', '0', '230000-230700-230711-', '1');
INSERT INTO `base_area` VALUES ('230712', '230700', '汤旺河区', '0', '0', '230000-230700-230712-', '1');
INSERT INTO `base_area` VALUES ('230713', '230700', '带岭区', '0', '0', '230000-230700-230713-', '1');
INSERT INTO `base_area` VALUES ('230714', '230700', '乌伊岭区', '0', '0', '230000-230700-230714-', '1');
INSERT INTO `base_area` VALUES ('230715', '230700', '红星区', '0', '0', '230000-230700-230715-', '1');
INSERT INTO `base_area` VALUES ('230716', '230700', '上甘岭区', '0', '0', '230000-230700-230716-', '1');
INSERT INTO `base_area` VALUES ('230722', '230700', '嘉荫县', '0', '0', '230000-230700-230722-', '1');
INSERT INTO `base_area` VALUES ('230781', '230700', '铁力市', '0', '0', '230000-230700-230781-', '1');
INSERT INTO `base_area` VALUES ('230800', '230000', '佳木斯市', '154000', '0454', '230000-230800-', '1');
INSERT INTO `base_area` VALUES ('230801', '230800', '市辖区', '0', '0', '230000-230800-230801-', '1');
INSERT INTO `base_area` VALUES ('230802', '230800', '永红区', '0', '0', '230000-230800-230802-', '1');
INSERT INTO `base_area` VALUES ('230803', '230800', '向阳区', '0', '0', '230000-230800-230803-', '1');
INSERT INTO `base_area` VALUES ('230804', '230800', '前进区', '0', '0', '230000-230800-230804-', '1');
INSERT INTO `base_area` VALUES ('230805', '230800', '东风区', '0', '0', '230000-230800-230805-', '1');
INSERT INTO `base_area` VALUES ('230811', '230800', '郊　区', '0', '0', '230000-230800-230811-', '1');
INSERT INTO `base_area` VALUES ('230822', '230800', '桦南县', '0', '0', '230000-230800-230822-', '1');
INSERT INTO `base_area` VALUES ('230826', '230800', '桦川县', '0', '0', '230000-230800-230826-', '1');
INSERT INTO `base_area` VALUES ('230828', '230800', '汤原县', '0', '0', '230000-230800-230828-', '1');
INSERT INTO `base_area` VALUES ('230833', '230800', '抚远县', '0', '0', '230000-230800-230833-', '1');
INSERT INTO `base_area` VALUES ('230881', '230800', '同江市', '0', '0', '230000-230800-230881-', '1');
INSERT INTO `base_area` VALUES ('230882', '230800', '富锦市', '0', '0', '230000-230800-230882-', '1');
INSERT INTO `base_area` VALUES ('230900', '230000', '七台河市', '154600', '0464', '230000-230900-', '1');
INSERT INTO `base_area` VALUES ('230901', '230900', '市辖区', '0', '0', '230000-230900-230901-', '1');
INSERT INTO `base_area` VALUES ('230902', '230900', '新兴区', '0', '0', '230000-230900-230902-', '1');
INSERT INTO `base_area` VALUES ('230903', '230900', '桃山区', '0', '0', '230000-230900-230903-', '1');
INSERT INTO `base_area` VALUES ('230904', '230900', '茄子河区', '0', '0', '230000-230900-230904-', '1');
INSERT INTO `base_area` VALUES ('230921', '230900', '勃利县', '0', '0', '230000-230900-230921-', '1');
INSERT INTO `base_area` VALUES ('231000', '230000', '牡丹江市', '157000', '0453', '230000-231000-', '1');
INSERT INTO `base_area` VALUES ('231001', '231000', '市辖区', '0', '0', '230000-231000-231001-', '1');
INSERT INTO `base_area` VALUES ('231002', '231000', '东安区', '0', '0', '230000-231000-231002-', '1');
INSERT INTO `base_area` VALUES ('231003', '231000', '阳明区', '0', '0', '230000-231000-231003-', '1');
INSERT INTO `base_area` VALUES ('231004', '231000', '爱民区', '0', '0', '230000-231000-231004-', '1');
INSERT INTO `base_area` VALUES ('231005', '231000', '西安区', '0', '0', '230000-231000-231005-', '1');
INSERT INTO `base_area` VALUES ('231024', '231000', '东宁县', '0', '0', '230000-231000-231024-', '1');
INSERT INTO `base_area` VALUES ('231025', '231000', '林口县', '0', '0', '230000-231000-231025-', '1');
INSERT INTO `base_area` VALUES ('231081', '231000', '绥芬河市', '0', '0', '230000-231000-231081-', '1');
INSERT INTO `base_area` VALUES ('231083', '231000', '海林市', '0', '0', '230000-231000-231083-', '1');
INSERT INTO `base_area` VALUES ('231084', '231000', '宁安市', '0', '0', '230000-231000-231084-', '1');
INSERT INTO `base_area` VALUES ('231085', '231000', '穆棱市', '0', '0', '230000-231000-231085-', '1');
INSERT INTO `base_area` VALUES ('231100', '230000', '黑河市', '164300', '0456', '230000-231100-', '1');
INSERT INTO `base_area` VALUES ('231101', '231100', '市辖区', '0', '0', '230000-231100-231101-', '1');
INSERT INTO `base_area` VALUES ('231102', '231100', '爱辉区', '0', '0', '230000-231100-231102-', '1');
INSERT INTO `base_area` VALUES ('231121', '231100', '嫩江县', '0', '0', '230000-231100-231121-', '1');
INSERT INTO `base_area` VALUES ('231123', '231100', '逊克县', '0', '0', '230000-231100-231123-', '1');
INSERT INTO `base_area` VALUES ('231124', '231100', '孙吴县', '0', '0', '230000-231100-231124-', '1');
INSERT INTO `base_area` VALUES ('231181', '231100', '北安市', '0', '0', '230000-231100-231181-', '1');
INSERT INTO `base_area` VALUES ('231182', '231100', '五大连池市', '0', '0', '230000-231100-231182-', '1');
INSERT INTO `base_area` VALUES ('231200', '230000', '绥化市', '152000', '0455', '230000-231200-', '1');
INSERT INTO `base_area` VALUES ('231201', '231200', '市辖区', '0', '0', '230000-231200-231201-', '1');
INSERT INTO `base_area` VALUES ('231202', '231200', '北林区', '0', '0', '230000-231200-231202-', '1');
INSERT INTO `base_area` VALUES ('231221', '231200', '望奎县', '0', '0', '230000-231200-231221-', '1');
INSERT INTO `base_area` VALUES ('231222', '231200', '兰西县', '0', '0', '230000-231200-231222-', '1');
INSERT INTO `base_area` VALUES ('231223', '231200', '青冈县', '0', '0', '230000-231200-231223-', '1');
INSERT INTO `base_area` VALUES ('231224', '231200', '庆安县', '0', '0', '230000-231200-231224-', '1');
INSERT INTO `base_area` VALUES ('231225', '231200', '明水县', '0', '0', '230000-231200-231225-', '1');
INSERT INTO `base_area` VALUES ('231226', '231200', '绥棱县', '0', '0', '230000-231200-231226-', '1');
INSERT INTO `base_area` VALUES ('231281', '231200', '安达市', '0', '0', '230000-231200-231281-', '1');
INSERT INTO `base_area` VALUES ('231282', '231200', '肇东市', '0', '0', '230000-231200-231282-', '1');
INSERT INTO `base_area` VALUES ('231283', '231200', '海伦市', '0', '0', '230000-231200-231283-', '1');
INSERT INTO `base_area` VALUES ('232700', '230000', '大兴安岭地区', '165000', '0457', '230000-232700-', '1');
INSERT INTO `base_area` VALUES ('232721', '232700', '呼玛县', '0', '0', '230000-232700-232721-', '1');
INSERT INTO `base_area` VALUES ('232722', '232700', '塔河县', '0', '0', '230000-232700-232722-', '1');
INSERT INTO `base_area` VALUES ('232723', '232700', '漠河县', '0', '0', '230000-232700-232723-', '1');
INSERT INTO `base_area` VALUES ('310000', '0', '上海市', '200000', '021', '310000-', '1');
INSERT INTO `base_area` VALUES ('310100', '310000', '市辖区', '0', '0', '310000-310100-', '1');
INSERT INTO `base_area` VALUES ('310101', '310100', '黄浦区', '0', '0', '310000-310100-310101-', '1');
INSERT INTO `base_area` VALUES ('310103', '310100', '卢湾区', '0', '0', '310000-310100-310103-', '1');
INSERT INTO `base_area` VALUES ('310104', '310100', '徐汇区', '0', '0', '310000-310100-310104-', '1');
INSERT INTO `base_area` VALUES ('310105', '310100', '长宁区', '0', '0', '310000-310100-310105-', '1');
INSERT INTO `base_area` VALUES ('310106', '310100', '静安区', '0', '0', '310000-310100-310106-', '1');
INSERT INTO `base_area` VALUES ('310107', '310100', '普陀区', '0', '0', '310000-310100-310107-', '1');
INSERT INTO `base_area` VALUES ('310108', '310100', '闸北区', '0', '0', '310000-310100-310108-', '1');
INSERT INTO `base_area` VALUES ('310109', '310100', '虹口区', '0', '0', '310000-310100-310109-', '1');
INSERT INTO `base_area` VALUES ('310110', '310100', '杨浦区', '0', '0', '310000-310100-310110-', '1');
INSERT INTO `base_area` VALUES ('310112', '310100', '闵行区', '0', '0', '310000-310100-310112-', '1');
INSERT INTO `base_area` VALUES ('310113', '310100', '宝山区', '0', '0', '310000-310100-310113-', '1');
INSERT INTO `base_area` VALUES ('310114', '310100', '嘉定区', '0', '0', '310000-310100-310114-', '1');
INSERT INTO `base_area` VALUES ('310115', '310100', '浦东新区', '0', '0', '310000-310100-310115-', '1');
INSERT INTO `base_area` VALUES ('310116', '310100', '金山区', '0', '0', '310000-310100-310116-', '1');
INSERT INTO `base_area` VALUES ('310117', '310100', '松江区', '0', '0', '310000-310100-310117-', '1');
INSERT INTO `base_area` VALUES ('310118', '310100', '青浦区', '0', '0', '310000-310100-310118-', '1');
INSERT INTO `base_area` VALUES ('310119', '310100', '南汇区', '0', '0', '310000-310100-310119-', '1');
INSERT INTO `base_area` VALUES ('310120', '310100', '奉贤区', '0', '0', '310000-310100-310120-', '1');
INSERT INTO `base_area` VALUES ('310200', '310000', '县', '0', '0', '310000-310200-', '1');
INSERT INTO `base_area` VALUES ('310230', '310200', '崇明县', '0', '0', '310000-310200-310230-', '1');
INSERT INTO `base_area` VALUES ('320000', '0', '江苏省', '0', '0', '320000-', '1');
INSERT INTO `base_area` VALUES ('320100', '320000', '南京市', '210000', '025', '320000-320100-', '1');
INSERT INTO `base_area` VALUES ('320101', '320100', '市辖区', '0', '0', '320000-320100-320101-', '1');
INSERT INTO `base_area` VALUES ('320102', '320100', '玄武区', '0', '0', '320000-320100-320102-', '1');
INSERT INTO `base_area` VALUES ('320103', '320100', '白下区', '0', '0', '320000-320100-320103-', '1');
INSERT INTO `base_area` VALUES ('320104', '320100', '秦淮区', '0', '0', '320000-320100-320104-', '1');
INSERT INTO `base_area` VALUES ('320105', '320100', '建邺区', '0', '0', '320000-320100-320105-', '1');
INSERT INTO `base_area` VALUES ('320106', '320100', '鼓楼区', '0', '0', '320000-320100-320106-', '1');
INSERT INTO `base_area` VALUES ('320107', '320100', '下关区', '0', '0', '320000-320100-320107-', '1');
INSERT INTO `base_area` VALUES ('320111', '320100', '浦口区', '0', '0', '320000-320100-320111-', '1');
INSERT INTO `base_area` VALUES ('320113', '320100', '栖霞区', '0', '0', '320000-320100-320113-', '1');
INSERT INTO `base_area` VALUES ('320114', '320100', '雨花台区', '0', '0', '320000-320100-320114-', '1');
INSERT INTO `base_area` VALUES ('320115', '320100', '江宁区', '0', '0', '320000-320100-320115-', '1');
INSERT INTO `base_area` VALUES ('320116', '320100', '六合区', '0', '0', '320000-320100-320116-', '1');
INSERT INTO `base_area` VALUES ('320124', '320100', '溧水县', '0', '0', '320000-320100-320124-', '1');
INSERT INTO `base_area` VALUES ('320125', '320100', '高淳县', '0', '0', '320000-320100-320125-', '1');
INSERT INTO `base_area` VALUES ('320200', '320000', '无锡市', '214000', '0510', '320000-320200-', '1');
INSERT INTO `base_area` VALUES ('320201', '320200', '市辖区', '0', '0', '320000-320200-320201-', '1');
INSERT INTO `base_area` VALUES ('320202', '320200', '崇安区', '0', '0', '320000-320200-320202-', '1');
INSERT INTO `base_area` VALUES ('320203', '320200', '南长区', '0', '0', '320000-320200-320203-', '1');
INSERT INTO `base_area` VALUES ('320204', '320200', '北塘区', '0', '0', '320000-320200-320204-', '1');
INSERT INTO `base_area` VALUES ('320205', '320200', '锡山区', '0', '0', '320000-320200-320205-', '1');
INSERT INTO `base_area` VALUES ('320206', '320200', '惠山区', '0', '0', '320000-320200-320206-', '1');
INSERT INTO `base_area` VALUES ('320211', '320200', '滨湖区', '0', '0', '320000-320200-320211-', '1');
INSERT INTO `base_area` VALUES ('320281', '320200', '江阴市', '0', '0', '320000-320200-320281-', '1');
INSERT INTO `base_area` VALUES ('320282', '320200', '宜兴市', '0', '0', '320000-320200-320282-', '1');
INSERT INTO `base_area` VALUES ('320300', '320000', '徐州市', '221000', '0516', '320000-320300-', '1');
INSERT INTO `base_area` VALUES ('320301', '320300', '市辖区', '0', '0', '320000-320300-320301-', '1');
INSERT INTO `base_area` VALUES ('320302', '320300', '鼓楼区', '0', '0', '320000-320300-320302-', '1');
INSERT INTO `base_area` VALUES ('320303', '320300', '云龙区', '0', '0', '320000-320300-320303-', '1');
INSERT INTO `base_area` VALUES ('320304', '320300', '九里区', '0', '0', '320000-320300-320304-', '1');
INSERT INTO `base_area` VALUES ('320305', '320300', '贾汪区', '0', '0', '320000-320300-320305-', '1');
INSERT INTO `base_area` VALUES ('320311', '320300', '泉山区', '0', '0', '320000-320300-320311-', '1');
INSERT INTO `base_area` VALUES ('320321', '320300', '丰　县', '0', '0', '320000-320300-320321-', '1');
INSERT INTO `base_area` VALUES ('320322', '320300', '沛　县', '0', '0', '320000-320300-320322-', '1');
INSERT INTO `base_area` VALUES ('320323', '320300', '铜山县', '0', '0', '320000-320300-320323-', '1');
INSERT INTO `base_area` VALUES ('320324', '320300', '睢宁县', '0', '0', '320000-320300-320324-', '1');
INSERT INTO `base_area` VALUES ('320381', '320300', '新沂市', '0', '0', '320000-320300-320381-', '1');
INSERT INTO `base_area` VALUES ('320382', '320300', '邳州市', '0', '0', '320000-320300-320382-', '1');
INSERT INTO `base_area` VALUES ('320400', '320000', '常州市', '213000', '0519', '320000-320400-', '1');
INSERT INTO `base_area` VALUES ('320401', '320400', '市辖区', '0', '0', '320000-320400-320401-', '1');
INSERT INTO `base_area` VALUES ('320402', '320400', '天宁区', '0', '0', '320000-320400-320402-', '1');
INSERT INTO `base_area` VALUES ('320404', '320400', '钟楼区', '0', '0', '320000-320400-320404-', '1');
INSERT INTO `base_area` VALUES ('320405', '320400', '戚墅堰区', '0', '0', '320000-320400-320405-', '1');
INSERT INTO `base_area` VALUES ('320411', '320400', '新北区', '0', '0', '320000-320400-320411-', '1');
INSERT INTO `base_area` VALUES ('320412', '320400', '武进区', '0', '0', '320000-320400-320412-', '1');
INSERT INTO `base_area` VALUES ('320481', '320400', '溧阳市', '0', '0', '320000-320400-320481-', '1');
INSERT INTO `base_area` VALUES ('320482', '320400', '金坛市', '0', '0', '320000-320400-320482-', '1');
INSERT INTO `base_area` VALUES ('320500', '320000', '苏州市', '215000', '0512', '320000-320500-', '1');
INSERT INTO `base_area` VALUES ('320501', '320500', '市辖区', '0', '0', '320000-320500-320501-', '1');
INSERT INTO `base_area` VALUES ('320502', '320500', '沧浪区', '0', '0', '320000-320500-320502-', '1');
INSERT INTO `base_area` VALUES ('320503', '320500', '平江区', '0', '0', '320000-320500-320503-', '1');
INSERT INTO `base_area` VALUES ('320504', '320500', '金阊区', '0', '0', '320000-320500-320504-', '1');
INSERT INTO `base_area` VALUES ('320505', '320500', '虎丘区', '0', '0', '320000-320500-320505-', '1');
INSERT INTO `base_area` VALUES ('320506', '320500', '吴中区', '0', '0', '320000-320500-320506-', '1');
INSERT INTO `base_area` VALUES ('320507', '320500', '相城区', '0', '0', '320000-320500-320507-', '1');
INSERT INTO `base_area` VALUES ('320581', '320500', '常熟市', '0', '0', '320000-320500-320581-', '1');
INSERT INTO `base_area` VALUES ('320582', '320500', '张家港市', '0', '0', '320000-320500-320582-', '1');
INSERT INTO `base_area` VALUES ('320583', '320500', '昆山市', '0', '0', '320000-320500-320583-', '1');
INSERT INTO `base_area` VALUES ('320584', '320500', '吴江市', '0', '0', '320000-320500-320584-', '1');
INSERT INTO `base_area` VALUES ('320585', '320500', '太仓市', '0', '0', '320000-320500-320585-', '1');
INSERT INTO `base_area` VALUES ('320600', '320000', '南通市', '226000', '0513', '320000-320600-', '1');
INSERT INTO `base_area` VALUES ('320601', '320600', '市辖区', '0', '0', '320000-320600-320601-', '1');
INSERT INTO `base_area` VALUES ('320602', '320600', '崇川区', '0', '0', '320000-320600-320602-', '1');
INSERT INTO `base_area` VALUES ('320611', '320600', '港闸区', '0', '0', '320000-320600-320611-', '1');
INSERT INTO `base_area` VALUES ('320621', '320600', '海安县', '0', '0', '320000-320600-320621-', '1');
INSERT INTO `base_area` VALUES ('320623', '320600', '如东县', '0', '0', '320000-320600-320623-', '1');
INSERT INTO `base_area` VALUES ('320681', '320600', '启东市', '0', '0', '320000-320600-320681-', '1');
INSERT INTO `base_area` VALUES ('320682', '320600', '如皋市', '0', '0', '320000-320600-320682-', '1');
INSERT INTO `base_area` VALUES ('320683', '320600', '通州市', '0', '0', '320000-320600-320683-', '1');
INSERT INTO `base_area` VALUES ('320684', '320600', '海门市', '0', '0', '320000-320600-320684-', '1');
INSERT INTO `base_area` VALUES ('320700', '320000', '连云港市', '222000', '0518', '320000-320700-', '1');
INSERT INTO `base_area` VALUES ('320701', '320700', '市辖区', '0', '0', '320000-320700-320701-', '1');
INSERT INTO `base_area` VALUES ('320703', '320700', '连云区', '0', '0', '320000-320700-320703-', '1');
INSERT INTO `base_area` VALUES ('320705', '320700', '新浦区', '0', '0', '320000-320700-320705-', '1');
INSERT INTO `base_area` VALUES ('320706', '320700', '海州区', '0', '0', '320000-320700-320706-', '1');
INSERT INTO `base_area` VALUES ('320721', '320700', '赣榆县', '0', '0', '320000-320700-320721-', '1');
INSERT INTO `base_area` VALUES ('320722', '320700', '东海县', '0', '0', '320000-320700-320722-', '1');
INSERT INTO `base_area` VALUES ('320723', '320700', '灌云县', '0', '0', '320000-320700-320723-', '1');
INSERT INTO `base_area` VALUES ('320724', '320700', '灌南县', '0', '0', '320000-320700-320724-', '1');
INSERT INTO `base_area` VALUES ('320800', '320000', '淮安市', '223001', '0517', '320000-320800-', '1');
INSERT INTO `base_area` VALUES ('320801', '320800', '市辖区', '0', '0', '320000-320800-320801-', '1');
INSERT INTO `base_area` VALUES ('320802', '320800', '清河区', '0', '0', '320000-320800-320802-', '1');
INSERT INTO `base_area` VALUES ('320803', '320800', '楚州区', '0', '0', '320000-320800-320803-', '1');
INSERT INTO `base_area` VALUES ('320804', '320800', '淮阴区', '0', '0', '320000-320800-320804-', '1');
INSERT INTO `base_area` VALUES ('320811', '320800', '清浦区', '0', '0', '320000-320800-320811-', '1');
INSERT INTO `base_area` VALUES ('320826', '320800', '涟水县', '0', '0', '320000-320800-320826-', '1');
INSERT INTO `base_area` VALUES ('320829', '320800', '洪泽县', '0', '0', '320000-320800-320829-', '1');
INSERT INTO `base_area` VALUES ('320830', '320800', '盱眙县', '0', '0', '320000-320800-320830-', '1');
INSERT INTO `base_area` VALUES ('320831', '320800', '金湖县', '0', '0', '320000-320800-320831-', '1');
INSERT INTO `base_area` VALUES ('320900', '320000', '盐城市', '224000', '0515', '320000-320900-', '1');
INSERT INTO `base_area` VALUES ('320901', '320900', '市辖区', '0', '0', '320000-320900-320901-', '1');
INSERT INTO `base_area` VALUES ('320902', '320900', '亭湖区', '0', '0', '320000-320900-320902-', '1');
INSERT INTO `base_area` VALUES ('320903', '320900', '盐都区', '0', '0', '320000-320900-320903-', '1');
INSERT INTO `base_area` VALUES ('320921', '320900', '响水县', '0', '0', '320000-320900-320921-', '1');
INSERT INTO `base_area` VALUES ('320922', '320900', '滨海县', '0', '0', '320000-320900-320922-', '1');
INSERT INTO `base_area` VALUES ('320923', '320900', '阜宁县', '0', '0', '320000-320900-320923-', '1');
INSERT INTO `base_area` VALUES ('320924', '320900', '射阳县', '0', '0', '320000-320900-320924-', '1');
INSERT INTO `base_area` VALUES ('320925', '320900', '建湖县', '0', '0', '320000-320900-320925-', '1');
INSERT INTO `base_area` VALUES ('320981', '320900', '东台市', '0', '0', '320000-320900-320981-', '1');
INSERT INTO `base_area` VALUES ('320982', '320900', '大丰市', '0', '0', '320000-320900-320982-', '1');
INSERT INTO `base_area` VALUES ('321000', '320000', '扬州市', '225000', '0514', '320000-321000-', '1');
INSERT INTO `base_area` VALUES ('321001', '321000', '市辖区', '0', '0', '320000-321000-321001-', '1');
INSERT INTO `base_area` VALUES ('321002', '321000', '广陵区', '0', '0', '320000-321000-321002-', '1');
INSERT INTO `base_area` VALUES ('321003', '321000', '邗江区', '0', '0', '320000-321000-321003-', '1');
INSERT INTO `base_area` VALUES ('321011', '321000', '郊　区', '0', '0', '320000-321000-321011-', '1');
INSERT INTO `base_area` VALUES ('321023', '321000', '宝应县', '0', '0', '320000-321000-321023-', '1');
INSERT INTO `base_area` VALUES ('321081', '321000', '仪征市', '0', '0', '320000-321000-321081-', '1');
INSERT INTO `base_area` VALUES ('321084', '321000', '高邮市', '0', '0', '320000-321000-321084-', '1');
INSERT INTO `base_area` VALUES ('321088', '321000', '江都市', '0', '0', '320000-321000-321088-', '1');
INSERT INTO `base_area` VALUES ('321100', '320000', '镇江市', '212000', '0511', '320000-321100-', '1');
INSERT INTO `base_area` VALUES ('321101', '321100', '市辖区', '0', '0', '320000-321100-321101-', '1');
INSERT INTO `base_area` VALUES ('321102', '321100', '京口区', '0', '0', '320000-321100-321102-', '1');
INSERT INTO `base_area` VALUES ('321111', '321100', '润州区', '0', '0', '320000-321100-321111-', '1');
INSERT INTO `base_area` VALUES ('321112', '321100', '丹徒区', '0', '0', '320000-321100-321112-', '1');
INSERT INTO `base_area` VALUES ('321181', '321100', '丹阳市', '0', '0', '320000-321100-321181-', '1');
INSERT INTO `base_area` VALUES ('321182', '321100', '扬中市', '0', '0', '320000-321100-321182-', '1');
INSERT INTO `base_area` VALUES ('321183', '321100', '句容市', '0', '0', '320000-321100-321183-', '1');
INSERT INTO `base_area` VALUES ('321200', '320000', '泰州市', '225300', '0523', '320000-321200-', '1');
INSERT INTO `base_area` VALUES ('321201', '321200', '市辖区', '0', '0', '320000-321200-321201-', '1');
INSERT INTO `base_area` VALUES ('321202', '321200', '海陵区', '0', '0', '320000-321200-321202-', '1');
INSERT INTO `base_area` VALUES ('321203', '321200', '高港区', '0', '0', '320000-321200-321203-', '1');
INSERT INTO `base_area` VALUES ('321281', '321200', '兴化市', '0', '0', '320000-321200-321281-', '1');
INSERT INTO `base_area` VALUES ('321282', '321200', '靖江市', '0', '0', '320000-321200-321282-', '1');
INSERT INTO `base_area` VALUES ('321283', '321200', '泰兴市', '0', '0', '320000-321200-321283-', '1');
INSERT INTO `base_area` VALUES ('321284', '321200', '姜堰市', '0', '0', '320000-321200-321284-', '1');
INSERT INTO `base_area` VALUES ('321300', '320000', '宿迁市', '223800', '0527', '320000-321300-', '1');
INSERT INTO `base_area` VALUES ('321301', '321300', '市辖区', '0', '0', '320000-321300-321301-', '1');
INSERT INTO `base_area` VALUES ('321302', '321300', '宿城区', '0', '0', '320000-321300-321302-', '1');
INSERT INTO `base_area` VALUES ('321311', '321300', '宿豫区', '0', '0', '320000-321300-321311-', '1');
INSERT INTO `base_area` VALUES ('321322', '321300', '沭阳县', '0', '0', '320000-321300-321322-', '1');
INSERT INTO `base_area` VALUES ('321323', '321300', '泗阳县', '0', '0', '320000-321300-321323-', '1');
INSERT INTO `base_area` VALUES ('321324', '321300', '泗洪县', '0', '0', '320000-321300-321324-', '1');
INSERT INTO `base_area` VALUES ('330000', '0', '浙江省', '0', '0', '330000-', '1');
INSERT INTO `base_area` VALUES ('330100', '330000', '杭州市', '310000', '0571', '330000-330100-', '1');
INSERT INTO `base_area` VALUES ('330101', '330100', '市辖区', '0', '0', '330000-330100-330101-', '1');
INSERT INTO `base_area` VALUES ('330102', '330100', '上城区', '0', '0', '330000-330100-330102-', '1');
INSERT INTO `base_area` VALUES ('330103', '330100', '下城区', '0', '0', '330000-330100-330103-', '1');
INSERT INTO `base_area` VALUES ('330104', '330100', '江干区', '0', '0', '330000-330100-330104-', '1');
INSERT INTO `base_area` VALUES ('330105', '330100', '拱墅区', '0', '0', '330000-330100-330105-', '1');
INSERT INTO `base_area` VALUES ('330106', '330100', '西湖区', '0', '0', '330000-330100-330106-', '1');
INSERT INTO `base_area` VALUES ('330108', '330100', '滨江区', '0', '0', '330000-330100-330108-', '1');
INSERT INTO `base_area` VALUES ('330109', '330100', '萧山区', '0', '0', '330000-330100-330109-', '1');
INSERT INTO `base_area` VALUES ('330110', '330100', '余杭区', '0', '0', '330000-330100-330110-', '1');
INSERT INTO `base_area` VALUES ('330122', '330100', '桐庐县', '0', '0', '330000-330100-330122-', '1');
INSERT INTO `base_area` VALUES ('330127', '330100', '淳安县', '0', '0', '330000-330100-330127-', '1');
INSERT INTO `base_area` VALUES ('330182', '330100', '建德市', '0', '0', '330000-330100-330182-', '1');
INSERT INTO `base_area` VALUES ('330183', '330100', '富阳市', '0', '0', '330000-330100-330183-', '1');
INSERT INTO `base_area` VALUES ('330185', '330100', '临安市', '0', '0', '330000-330100-330185-', '1');
INSERT INTO `base_area` VALUES ('330200', '330000', '宁波市', '315000', '0574', '330000-330200-', '1');
INSERT INTO `base_area` VALUES ('330201', '330200', '市辖区', '0', '0', '330000-330200-330201-', '1');
INSERT INTO `base_area` VALUES ('330203', '330200', '海曙区', '0', '0', '330000-330200-330203-', '1');
INSERT INTO `base_area` VALUES ('330204', '330200', '江东区', '0', '0', '330000-330200-330204-', '1');
INSERT INTO `base_area` VALUES ('330205', '330200', '江北区', '0', '0', '330000-330200-330205-', '1');
INSERT INTO `base_area` VALUES ('330206', '330200', '北仑区', '0', '0', '330000-330200-330206-', '1');
INSERT INTO `base_area` VALUES ('330211', '330200', '镇海区', '0', '0', '330000-330200-330211-', '1');
INSERT INTO `base_area` VALUES ('330212', '330200', '鄞州区', '0', '0', '330000-330200-330212-', '1');
INSERT INTO `base_area` VALUES ('330225', '330200', '象山县', '0', '0', '330000-330200-330225-', '1');
INSERT INTO `base_area` VALUES ('330226', '330200', '宁海县', '0', '0', '330000-330200-330226-', '1');
INSERT INTO `base_area` VALUES ('330281', '330200', '余姚市', '0', '0', '330000-330200-330281-', '1');
INSERT INTO `base_area` VALUES ('330282', '330200', '慈溪市', '0', '0', '330000-330200-330282-', '1');
INSERT INTO `base_area` VALUES ('330283', '330200', '奉化市', '0', '0', '330000-330200-330283-', '1');
INSERT INTO `base_area` VALUES ('330300', '330000', '温州市', '325000', '0577', '330000-330300-', '1');
INSERT INTO `base_area` VALUES ('330301', '330300', '市辖区', '0', '0', '330000-330300-330301-', '1');
INSERT INTO `base_area` VALUES ('330302', '330300', '鹿城区', '0', '0', '330000-330300-330302-', '1');
INSERT INTO `base_area` VALUES ('330303', '330300', '龙湾区', '0', '0', '330000-330300-330303-', '1');
INSERT INTO `base_area` VALUES ('330304', '330300', '瓯海区', '0', '0', '330000-330300-330304-', '1');
INSERT INTO `base_area` VALUES ('330322', '330300', '洞头县', '0', '0', '330000-330300-330322-', '1');
INSERT INTO `base_area` VALUES ('330324', '330300', '永嘉县', '0', '0', '330000-330300-330324-', '1');
INSERT INTO `base_area` VALUES ('330326', '330300', '平阳县', '0', '0', '330000-330300-330326-', '1');
INSERT INTO `base_area` VALUES ('330327', '330300', '苍南县', '0', '0', '330000-330300-330327-', '1');
INSERT INTO `base_area` VALUES ('330328', '330300', '文成县', '0', '0', '330000-330300-330328-', '1');
INSERT INTO `base_area` VALUES ('330329', '330300', '泰顺县', '0', '0', '330000-330300-330329-', '1');
INSERT INTO `base_area` VALUES ('330381', '330300', '瑞安市', '0', '0', '330000-330300-330381-', '1');
INSERT INTO `base_area` VALUES ('330382', '330300', '乐清市', '0', '0', '330000-330300-330382-', '1');
INSERT INTO `base_area` VALUES ('330400', '330000', '嘉兴市', '314000', '0573', '330000-330400-', '1');
INSERT INTO `base_area` VALUES ('330401', '330400', '市辖区', '0', '0', '330000-330400-330401-', '1');
INSERT INTO `base_area` VALUES ('330402', '330400', '秀城区', '0', '0', '330000-330400-330402-', '1');
INSERT INTO `base_area` VALUES ('330411', '330400', '秀洲区', '0', '0', '330000-330400-330411-', '1');
INSERT INTO `base_area` VALUES ('330421', '330400', '嘉善县', '0', '0', '330000-330400-330421-', '1');
INSERT INTO `base_area` VALUES ('330424', '330400', '海盐县', '0', '0', '330000-330400-330424-', '1');
INSERT INTO `base_area` VALUES ('330481', '330400', '海宁市', '0', '0', '330000-330400-330481-', '1');
INSERT INTO `base_area` VALUES ('330482', '330400', '平湖市', '0', '0', '330000-330400-330482-', '1');
INSERT INTO `base_area` VALUES ('330483', '330400', '桐乡市', '0', '0', '330000-330400-330483-', '1');
INSERT INTO `base_area` VALUES ('330500', '330000', '湖州市', '313000', '0572', '330000-330500-', '1');
INSERT INTO `base_area` VALUES ('330501', '330500', '市辖区', '0', '0', '330000-330500-330501-', '1');
INSERT INTO `base_area` VALUES ('330502', '330500', '吴兴区', '0', '0', '330000-330500-330502-', '1');
INSERT INTO `base_area` VALUES ('330503', '330500', '南浔区', '0', '0', '330000-330500-330503-', '1');
INSERT INTO `base_area` VALUES ('330521', '330500', '德清县', '0', '0', '330000-330500-330521-', '1');
INSERT INTO `base_area` VALUES ('330522', '330500', '长兴县', '0', '0', '330000-330500-330522-', '1');
INSERT INTO `base_area` VALUES ('330523', '330500', '安吉县', '0', '0', '330000-330500-330523-', '1');
INSERT INTO `base_area` VALUES ('330600', '330000', '绍兴市', '312000', '0575', '330000-330600-', '1');
INSERT INTO `base_area` VALUES ('330601', '330600', '市辖区', '0', '0', '330000-330600-330601-', '1');
INSERT INTO `base_area` VALUES ('330602', '330600', '越城区', '0', '0', '330000-330600-330602-', '1');
INSERT INTO `base_area` VALUES ('330621', '330600', '绍兴县', '0', '0', '330000-330600-330621-', '1');
INSERT INTO `base_area` VALUES ('330624', '330600', '新昌县', '0', '0', '330000-330600-330624-', '1');
INSERT INTO `base_area` VALUES ('330681', '330600', '诸暨市', '0', '0', '330000-330600-330681-', '1');
INSERT INTO `base_area` VALUES ('330682', '330600', '上虞市', '0', '0', '330000-330600-330682-', '1');
INSERT INTO `base_area` VALUES ('330683', '330600', '嵊州市', '0', '0', '330000-330600-330683-', '1');
INSERT INTO `base_area` VALUES ('330700', '330000', '金华市', '321000', '0579', '330000-330700-', '1');
INSERT INTO `base_area` VALUES ('330701', '330700', '市辖区', '0', '0', '330000-330700-330701-', '1');
INSERT INTO `base_area` VALUES ('330702', '330700', '婺城区', '0', '0', '330000-330700-330702-', '1');
INSERT INTO `base_area` VALUES ('330703', '330700', '金东区', '0', '0', '330000-330700-330703-', '1');
INSERT INTO `base_area` VALUES ('330723', '330700', '武义县', '0', '0', '330000-330700-330723-', '1');
INSERT INTO `base_area` VALUES ('330726', '330700', '浦江县', '0', '0', '330000-330700-330726-', '1');
INSERT INTO `base_area` VALUES ('330727', '330700', '磐安县', '0', '0', '330000-330700-330727-', '1');
INSERT INTO `base_area` VALUES ('330781', '330700', '兰溪市', '0', '0', '330000-330700-330781-', '1');
INSERT INTO `base_area` VALUES ('330782', '330700', '义乌市', '0', '0', '330000-330700-330782-', '1');
INSERT INTO `base_area` VALUES ('330783', '330700', '东阳市', '0', '0', '330000-330700-330783-', '1');
INSERT INTO `base_area` VALUES ('330784', '330700', '永康市', '0', '0', '330000-330700-330784-', '1');
INSERT INTO `base_area` VALUES ('330800', '330000', '衢州市', '324000', '0570', '330000-330800-', '1');
INSERT INTO `base_area` VALUES ('330801', '330800', '市辖区', '0', '0', '330000-330800-330801-', '1');
INSERT INTO `base_area` VALUES ('330802', '330800', '柯城区', '0', '0', '330000-330800-330802-', '1');
INSERT INTO `base_area` VALUES ('330803', '330800', '衢江区', '0', '0', '330000-330800-330803-', '1');
INSERT INTO `base_area` VALUES ('330822', '330800', '常山县', '0', '0', '330000-330800-330822-', '1');
INSERT INTO `base_area` VALUES ('330824', '330800', '开化县', '0', '0', '330000-330800-330824-', '1');
INSERT INTO `base_area` VALUES ('330825', '330800', '龙游县', '0', '0', '330000-330800-330825-', '1');
INSERT INTO `base_area` VALUES ('330881', '330800', '江山市', '0', '0', '330000-330800-330881-', '1');
INSERT INTO `base_area` VALUES ('330900', '330000', '舟山市', '316000', '0580', '330000-330900-', '1');
INSERT INTO `base_area` VALUES ('330901', '330900', '市辖区', '0', '0', '330000-330900-330901-', '1');
INSERT INTO `base_area` VALUES ('330902', '330900', '定海区', '0', '0', '330000-330900-330902-', '1');
INSERT INTO `base_area` VALUES ('330903', '330900', '普陀区', '0', '0', '330000-330900-330903-', '1');
INSERT INTO `base_area` VALUES ('330921', '330900', '岱山县', '0', '0', '330000-330900-330921-', '1');
INSERT INTO `base_area` VALUES ('330922', '330900', '嵊泗县', '0', '0', '330000-330900-330922-', '1');
INSERT INTO `base_area` VALUES ('331000', '330000', '台州市', '318000', '0576', '330000-331000-', '1');
INSERT INTO `base_area` VALUES ('331001', '331000', '市辖区', '0', '0', '330000-331000-331001-', '1');
INSERT INTO `base_area` VALUES ('331002', '331000', '椒江区', '0', '0', '330000-331000-331002-', '1');
INSERT INTO `base_area` VALUES ('331003', '331000', '黄岩区', '0', '0', '330000-331000-331003-', '1');
INSERT INTO `base_area` VALUES ('331004', '331000', '路桥区', '0', '0', '330000-331000-331004-', '1');
INSERT INTO `base_area` VALUES ('331021', '331000', '玉环县', '0', '0', '330000-331000-331021-', '1');
INSERT INTO `base_area` VALUES ('331022', '331000', '三门县', '0', '0', '330000-331000-331022-', '1');
INSERT INTO `base_area` VALUES ('331023', '331000', '天台县', '0', '0', '330000-331000-331023-', '1');
INSERT INTO `base_area` VALUES ('331024', '331000', '仙居县', '0', '0', '330000-331000-331024-', '1');
INSERT INTO `base_area` VALUES ('331081', '331000', '温岭市', '0', '0', '330000-331000-331081-', '1');
INSERT INTO `base_area` VALUES ('331082', '331000', '临海市', '0', '0', '330000-331000-331082-', '1');
INSERT INTO `base_area` VALUES ('331100', '330000', '丽水市', '323000', '0578', '330000-331100-', '1');
INSERT INTO `base_area` VALUES ('331101', '331100', '市辖区', '0', '0', '330000-331100-331101-', '1');
INSERT INTO `base_area` VALUES ('331102', '331100', '莲都区', '0', '0', '330000-331100-331102-', '1');
INSERT INTO `base_area` VALUES ('331121', '331100', '青田县', '0', '0', '330000-331100-331121-', '1');
INSERT INTO `base_area` VALUES ('331122', '331100', '缙云县', '0', '0', '330000-331100-331122-', '1');
INSERT INTO `base_area` VALUES ('331123', '331100', '遂昌县', '0', '0', '330000-331100-331123-', '1');
INSERT INTO `base_area` VALUES ('331124', '331100', '松阳县', '0', '0', '330000-331100-331124-', '1');
INSERT INTO `base_area` VALUES ('331125', '331100', '云和县', '0', '0', '330000-331100-331125-', '1');
INSERT INTO `base_area` VALUES ('331126', '331100', '庆元县', '0', '0', '330000-331100-331126-', '1');
INSERT INTO `base_area` VALUES ('331127', '331100', '景宁畲族自治县', '0', '0', '330000-331100-331127-', '1');
INSERT INTO `base_area` VALUES ('331181', '331100', '龙泉市', '0', '0', '330000-331100-331181-', '1');
INSERT INTO `base_area` VALUES ('340000', '0', '安徽省', '0', '0', '340000-', '1');
INSERT INTO `base_area` VALUES ('340100', '340000', '合肥市', '230000', '0551', '340000-340100-', '1');
INSERT INTO `base_area` VALUES ('340101', '340100', '市辖区', '0', '0', '340000-340100-340101-', '1');
INSERT INTO `base_area` VALUES ('340102', '340100', '瑶海区', '0', '0', '340000-340100-340102-', '1');
INSERT INTO `base_area` VALUES ('340103', '340100', '庐阳区', '0', '0', '340000-340100-340103-', '1');
INSERT INTO `base_area` VALUES ('340104', '340100', '蜀山区', '0', '0', '340000-340100-340104-', '1');
INSERT INTO `base_area` VALUES ('340111', '340100', '包河区', '0', '0', '340000-340100-340111-', '1');
INSERT INTO `base_area` VALUES ('340121', '340100', '长丰县', '0', '0', '340000-340100-340121-', '1');
INSERT INTO `base_area` VALUES ('340122', '340100', '肥东县', '0', '0', '340000-340100-340122-', '1');
INSERT INTO `base_area` VALUES ('340123', '340100', '肥西县', '0', '0', '340000-340100-340123-', '1');
INSERT INTO `base_area` VALUES ('340200', '340000', '芜湖市', '241000', '0553', '340000-340200-', '1');
INSERT INTO `base_area` VALUES ('340201', '340200', '市辖区', '0', '0', '340000-340200-340201-', '1');
INSERT INTO `base_area` VALUES ('340202', '340200', '镜湖区', '0', '0', '340000-340200-340202-', '1');
INSERT INTO `base_area` VALUES ('340203', '340200', '马塘区', '0', '0', '340000-340200-340203-', '1');
INSERT INTO `base_area` VALUES ('340204', '340200', '新芜区', '0', '0', '340000-340200-340204-', '1');
INSERT INTO `base_area` VALUES ('340207', '340200', '鸠江区', '0', '0', '340000-340200-340207-', '1');
INSERT INTO `base_area` VALUES ('340221', '340200', '芜湖县', '0', '0', '340000-340200-340221-', '1');
INSERT INTO `base_area` VALUES ('340222', '340200', '繁昌县', '0', '0', '340000-340200-340222-', '1');
INSERT INTO `base_area` VALUES ('340223', '340200', '南陵县', '0', '0', '340000-340200-340223-', '1');
INSERT INTO `base_area` VALUES ('340300', '340000', '蚌埠市', '233000', '0552', '340000-340300-', '1');
INSERT INTO `base_area` VALUES ('340301', '340300', '市辖区', '0', '0', '340000-340300-340301-', '1');
INSERT INTO `base_area` VALUES ('340302', '340300', '龙子湖区', '0', '0', '340000-340300-340302-', '1');
INSERT INTO `base_area` VALUES ('340303', '340300', '蚌山区', '0', '0', '340000-340300-340303-', '1');
INSERT INTO `base_area` VALUES ('340304', '340300', '禹会区', '0', '0', '340000-340300-340304-', '1');
INSERT INTO `base_area` VALUES ('340311', '340300', '淮上区', '0', '0', '340000-340300-340311-', '1');
INSERT INTO `base_area` VALUES ('340321', '340300', '怀远县', '0', '0', '340000-340300-340321-', '1');
INSERT INTO `base_area` VALUES ('340322', '340300', '五河县', '0', '0', '340000-340300-340322-', '1');
INSERT INTO `base_area` VALUES ('340323', '340300', '固镇县', '0', '0', '340000-340300-340323-', '1');
INSERT INTO `base_area` VALUES ('340400', '340000', '淮南市', '232000', '0554', '340000-340400-', '1');
INSERT INTO `base_area` VALUES ('340401', '340400', '市辖区', '0', '0', '340000-340400-340401-', '1');
INSERT INTO `base_area` VALUES ('340402', '340400', '大通区', '0', '0', '340000-340400-340402-', '1');
INSERT INTO `base_area` VALUES ('340403', '340400', '田家庵区', '0', '0', '340000-340400-340403-', '1');
INSERT INTO `base_area` VALUES ('340404', '340400', '谢家集区', '0', '0', '340000-340400-340404-', '1');
INSERT INTO `base_area` VALUES ('340405', '340400', '八公山区', '0', '0', '340000-340400-340405-', '1');
INSERT INTO `base_area` VALUES ('340406', '340400', '潘集区', '0', '0', '340000-340400-340406-', '1');
INSERT INTO `base_area` VALUES ('340421', '340400', '凤台县', '0', '0', '340000-340400-340421-', '1');
INSERT INTO `base_area` VALUES ('340500', '340000', '马鞍山市', '243000', '0555', '340000-340500-', '1');
INSERT INTO `base_area` VALUES ('340501', '340500', '市辖区', '0', '0', '340000-340500-340501-', '1');
INSERT INTO `base_area` VALUES ('340502', '340500', '金家庄区', '0', '0', '340000-340500-340502-', '1');
INSERT INTO `base_area` VALUES ('340503', '340500', '花山区', '0', '0', '340000-340500-340503-', '1');
INSERT INTO `base_area` VALUES ('340504', '340500', '雨山区', '0', '0', '340000-340500-340504-', '1');
INSERT INTO `base_area` VALUES ('340521', '340500', '当涂县', '0', '0', '340000-340500-340521-', '1');
INSERT INTO `base_area` VALUES ('340600', '340000', '淮北市', '235000', '0561', '340000-340600-', '1');
INSERT INTO `base_area` VALUES ('340601', '340600', '市辖区', '0', '0', '340000-340600-340601-', '1');
INSERT INTO `base_area` VALUES ('340602', '340600', '杜集区', '0', '0', '340000-340600-340602-', '1');
INSERT INTO `base_area` VALUES ('340603', '340600', '相山区', '0', '0', '340000-340600-340603-', '1');
INSERT INTO `base_area` VALUES ('340604', '340600', '烈山区', '0', '0', '340000-340600-340604-', '1');
INSERT INTO `base_area` VALUES ('340621', '340600', '濉溪县', '0', '0', '340000-340600-340621-', '1');
INSERT INTO `base_area` VALUES ('340700', '340000', '铜陵市', '244000', '0562', '340000-340700-', '1');
INSERT INTO `base_area` VALUES ('340701', '340700', '市辖区', '0', '0', '340000-340700-340701-', '1');
INSERT INTO `base_area` VALUES ('340702', '340700', '铜官山区', '0', '0', '340000-340700-340702-', '1');
INSERT INTO `base_area` VALUES ('340703', '340700', '狮子山区', '0', '0', '340000-340700-340703-', '1');
INSERT INTO `base_area` VALUES ('340711', '340700', '郊　区', '0', '0', '340000-340700-340711-', '1');
INSERT INTO `base_area` VALUES ('340721', '340700', '铜陵县', '0', '0', '340000-340700-340721-', '1');
INSERT INTO `base_area` VALUES ('340800', '340000', '安庆市', '246000', '0556', '340000-340800-', '1');
INSERT INTO `base_area` VALUES ('340801', '340800', '市辖区', '0', '0', '340000-340800-340801-', '1');
INSERT INTO `base_area` VALUES ('340802', '340800', '迎江区', '0', '0', '340000-340800-340802-', '1');
INSERT INTO `base_area` VALUES ('340803', '340800', '大观区', '0', '0', '340000-340800-340803-', '1');
INSERT INTO `base_area` VALUES ('340811', '340800', '郊　区', '0', '0', '340000-340800-340811-', '1');
INSERT INTO `base_area` VALUES ('340822', '340800', '怀宁县', '0', '0', '340000-340800-340822-', '1');
INSERT INTO `base_area` VALUES ('340823', '340800', '枞阳县', '0', '0', '340000-340800-340823-', '1');
INSERT INTO `base_area` VALUES ('340824', '340800', '潜山县', '0', '0', '340000-340800-340824-', '1');
INSERT INTO `base_area` VALUES ('340825', '340800', '太湖县', '0', '0', '340000-340800-340825-', '1');
INSERT INTO `base_area` VALUES ('340826', '340800', '宿松县', '0', '0', '340000-340800-340826-', '1');
INSERT INTO `base_area` VALUES ('340827', '340800', '望江县', '0', '0', '340000-340800-340827-', '1');
INSERT INTO `base_area` VALUES ('340828', '340800', '岳西县', '0', '0', '340000-340800-340828-', '1');
INSERT INTO `base_area` VALUES ('340881', '340800', '桐城市', '0', '0', '340000-340800-340881-', '1');
INSERT INTO `base_area` VALUES ('341000', '340000', '黄山市', '242700', '0559', '340000-341000-', '1');
INSERT INTO `base_area` VALUES ('341001', '341000', '市辖区', '0', '0', '340000-341000-341001-', '1');
INSERT INTO `base_area` VALUES ('341002', '341000', '屯溪区', '0', '0', '340000-341000-341002-', '1');
INSERT INTO `base_area` VALUES ('341003', '341000', '黄山区', '0', '0', '340000-341000-341003-', '1');
INSERT INTO `base_area` VALUES ('341004', '341000', '徽州区', '0', '0', '340000-341000-341004-', '1');
INSERT INTO `base_area` VALUES ('341021', '341000', '歙　县', '0', '0', '340000-341000-341021-', '1');
INSERT INTO `base_area` VALUES ('341022', '341000', '休宁县', '0', '0', '340000-341000-341022-', '1');
INSERT INTO `base_area` VALUES ('341023', '341000', '黟　县', '0', '0', '340000-341000-341023-', '1');
INSERT INTO `base_area` VALUES ('341024', '341000', '祁门县', '0', '0', '340000-341000-341024-', '1');
INSERT INTO `base_area` VALUES ('341100', '340000', '滁州市', '239000', '0550', '340000-341100-', '1');
INSERT INTO `base_area` VALUES ('341101', '341100', '市辖区', '0', '0', '340000-341100-341101-', '1');
INSERT INTO `base_area` VALUES ('341102', '341100', '琅琊区', '0', '0', '340000-341100-341102-', '1');
INSERT INTO `base_area` VALUES ('341103', '341100', '南谯区', '0', '0', '340000-341100-341103-', '1');
INSERT INTO `base_area` VALUES ('341122', '341100', '来安县', '0', '0', '340000-341100-341122-', '1');
INSERT INTO `base_area` VALUES ('341124', '341100', '全椒县', '0', '0', '340000-341100-341124-', '1');
INSERT INTO `base_area` VALUES ('341125', '341100', '定远县', '0', '0', '340000-341100-341125-', '1');
INSERT INTO `base_area` VALUES ('341126', '341100', '凤阳县', '0', '0', '340000-341100-341126-', '1');
INSERT INTO `base_area` VALUES ('341181', '341100', '天长市', '0', '0', '340000-341100-341181-', '1');
INSERT INTO `base_area` VALUES ('341182', '341100', '明光市', '0', '0', '340000-341100-341182-', '1');
INSERT INTO `base_area` VALUES ('341200', '340000', '阜阳市', '236000', '0558', '340000-341200-', '1');
INSERT INTO `base_area` VALUES ('341201', '341200', '市辖区', '0', '0', '340000-341200-341201-', '1');
INSERT INTO `base_area` VALUES ('341202', '341200', '颍州区', '0', '0', '340000-341200-341202-', '1');
INSERT INTO `base_area` VALUES ('341203', '341200', '颍东区', '0', '0', '340000-341200-341203-', '1');
INSERT INTO `base_area` VALUES ('341204', '341200', '颍泉区', '0', '0', '340000-341200-341204-', '1');
INSERT INTO `base_area` VALUES ('341221', '341200', '临泉县', '0', '0', '340000-341200-341221-', '1');
INSERT INTO `base_area` VALUES ('341222', '341200', '太和县', '0', '0', '340000-341200-341222-', '1');
INSERT INTO `base_area` VALUES ('341225', '341200', '阜南县', '0', '0', '340000-341200-341225-', '1');
INSERT INTO `base_area` VALUES ('341226', '341200', '颍上县', '0', '0', '340000-341200-341226-', '1');
INSERT INTO `base_area` VALUES ('341282', '341200', '界首市', '0', '0', '340000-341200-341282-', '1');
INSERT INTO `base_area` VALUES ('341300', '340000', '宿州市', '234000', '0557', '340000-341300-', '1');
INSERT INTO `base_area` VALUES ('341301', '341300', '市辖区', '0', '0', '340000-341300-341301-', '1');
INSERT INTO `base_area` VALUES ('341302', '341300', '墉桥区', '0', '0', '340000-341300-341302-', '1');
INSERT INTO `base_area` VALUES ('341321', '341300', '砀山县', '0', '0', '340000-341300-341321-', '1');
INSERT INTO `base_area` VALUES ('341322', '341300', '萧　县', '0', '0', '340000-341300-341322-', '1');
INSERT INTO `base_area` VALUES ('341323', '341300', '灵璧县', '0', '0', '340000-341300-341323-', '1');
INSERT INTO `base_area` VALUES ('341324', '341300', '泗　县', '0', '0', '340000-341300-341324-', '1');
INSERT INTO `base_area` VALUES ('341400', '340000', '巢湖市', '238000', '0565', '340000-341400-', '1');
INSERT INTO `base_area` VALUES ('341401', '341400', '市辖区', '0', '0', '340000-341400-341401-', '1');
INSERT INTO `base_area` VALUES ('341402', '341400', '居巢区', '0', '0', '340000-341400-341402-', '1');
INSERT INTO `base_area` VALUES ('341421', '341400', '庐江县', '0', '0', '340000-341400-341421-', '1');
INSERT INTO `base_area` VALUES ('341422', '341400', '无为县', '0', '0', '340000-341400-341422-', '1');
INSERT INTO `base_area` VALUES ('341423', '341400', '含山县', '0', '0', '340000-341400-341423-', '1');
INSERT INTO `base_area` VALUES ('341424', '341400', '和　县', '0', '0', '340000-341400-341424-', '1');
INSERT INTO `base_area` VALUES ('341500', '340000', '六安市', '237000', '0564', '340000-341500-', '1');
INSERT INTO `base_area` VALUES ('341501', '341500', '市辖区', '0', '0', '340000-341500-341501-', '1');
INSERT INTO `base_area` VALUES ('341502', '341500', '金安区', '0', '0', '340000-341500-341502-', '1');
INSERT INTO `base_area` VALUES ('341503', '341500', '裕安区', '0', '0', '340000-341500-341503-', '1');
INSERT INTO `base_area` VALUES ('341521', '341500', '寿　县', '0', '0', '340000-341500-341521-', '1');
INSERT INTO `base_area` VALUES ('341522', '341500', '霍邱县', '0', '0', '340000-341500-341522-', '1');
INSERT INTO `base_area` VALUES ('341523', '341500', '舒城县', '0', '0', '340000-341500-341523-', '1');
INSERT INTO `base_area` VALUES ('341524', '341500', '金寨县', '0', '0', '340000-341500-341524-', '1');
INSERT INTO `base_area` VALUES ('341525', '341500', '霍山县', '0', '0', '340000-341500-341525-', '1');
INSERT INTO `base_area` VALUES ('341600', '340000', '亳州市', '236000', '0558', '340000-341600-', '1');
INSERT INTO `base_area` VALUES ('341601', '341600', '市辖区', '0', '0', '340000-341600-341601-', '1');
INSERT INTO `base_area` VALUES ('341602', '341600', '谯城区', '0', '0', '340000-341600-341602-', '1');
INSERT INTO `base_area` VALUES ('341621', '341600', '涡阳县', '0', '0', '340000-341600-341621-', '1');
INSERT INTO `base_area` VALUES ('341622', '341600', '蒙城县', '0', '0', '340000-341600-341622-', '1');
INSERT INTO `base_area` VALUES ('341623', '341600', '利辛县', '0', '0', '340000-341600-341623-', '1');
INSERT INTO `base_area` VALUES ('341700', '340000', '池州市', '247100', '0566', '340000-341700-', '1');
INSERT INTO `base_area` VALUES ('341701', '341700', '市辖区', '0', '0', '340000-341700-341701-', '1');
INSERT INTO `base_area` VALUES ('341702', '341700', '贵池区', '0', '0', '340000-341700-341702-', '1');
INSERT INTO `base_area` VALUES ('341721', '341700', '东至县', '0', '0', '340000-341700-341721-', '1');
INSERT INTO `base_area` VALUES ('341722', '341700', '石台县', '0', '0', '340000-341700-341722-', '1');
INSERT INTO `base_area` VALUES ('341723', '341700', '青阳县', '0', '0', '340000-341700-341723-', '1');
INSERT INTO `base_area` VALUES ('341800', '340000', '宣城市', '242000', '0563', '340000-341800-', '1');
INSERT INTO `base_area` VALUES ('341801', '341800', '市辖区', '0', '0', '340000-341800-341801-', '1');
INSERT INTO `base_area` VALUES ('341802', '341800', '宣州区', '0', '0', '340000-341800-341802-', '1');
INSERT INTO `base_area` VALUES ('341821', '341800', '郎溪县', '0', '0', '340000-341800-341821-', '1');
INSERT INTO `base_area` VALUES ('341822', '341800', '广德县', '0', '0', '340000-341800-341822-', '1');
INSERT INTO `base_area` VALUES ('341823', '341800', '泾　县', '0', '0', '340000-341800-341823-', '1');
INSERT INTO `base_area` VALUES ('341824', '341800', '绩溪县', '0', '0', '340000-341800-341824-', '1');
INSERT INTO `base_area` VALUES ('341825', '341800', '旌德县', '0', '0', '340000-341800-341825-', '1');
INSERT INTO `base_area` VALUES ('341881', '341800', '宁国市', '0', '0', '340000-341800-341881-', '1');
INSERT INTO `base_area` VALUES ('350000', '0', '福建省', '0', '0', '350000-', '1');
INSERT INTO `base_area` VALUES ('350100', '350000', '福州市', '350000', '0591', '350000-350100-', '1');
INSERT INTO `base_area` VALUES ('350101', '350100', '市辖区', '0', '0', '350000-350100-350101-', '1');
INSERT INTO `base_area` VALUES ('350102', '350100', '鼓楼区', '0', '0', '350000-350100-350102-', '1');
INSERT INTO `base_area` VALUES ('350103', '350100', '台江区', '0', '0', '350000-350100-350103-', '1');
INSERT INTO `base_area` VALUES ('350104', '350100', '仓山区', '0', '0', '350000-350100-350104-', '1');
INSERT INTO `base_area` VALUES ('350105', '350100', '马尾区', '0', '0', '350000-350100-350105-', '1');
INSERT INTO `base_area` VALUES ('350111', '350100', '晋安区', '0', '0', '350000-350100-350111-', '1');
INSERT INTO `base_area` VALUES ('350121', '350100', '闽侯县', '0', '0', '350000-350100-350121-', '1');
INSERT INTO `base_area` VALUES ('350122', '350100', '连江县', '0', '0', '350000-350100-350122-', '1');
INSERT INTO `base_area` VALUES ('350123', '350100', '罗源县', '0', '0', '350000-350100-350123-', '1');
INSERT INTO `base_area` VALUES ('350124', '350100', '闽清县', '0', '0', '350000-350100-350124-', '1');
INSERT INTO `base_area` VALUES ('350125', '350100', '永泰县', '0', '0', '350000-350100-350125-', '1');
INSERT INTO `base_area` VALUES ('350128', '350100', '平潭县', '0', '0', '350000-350100-350128-', '1');
INSERT INTO `base_area` VALUES ('350181', '350100', '福清市', '0', '0', '350000-350100-350181-', '1');
INSERT INTO `base_area` VALUES ('350182', '350100', '长乐市', '0', '0', '350000-350100-350182-', '1');
INSERT INTO `base_area` VALUES ('350200', '350000', '厦门市', '361000', '0592', '350000-350200-', '1');
INSERT INTO `base_area` VALUES ('350201', '350200', '市辖区', '0', '0', '350000-350200-350201-', '1');
INSERT INTO `base_area` VALUES ('350203', '350200', '思明区', '0', '0', '350000-350200-350203-', '1');
INSERT INTO `base_area` VALUES ('350205', '350200', '海沧区', '0', '0', '350000-350200-350205-', '1');
INSERT INTO `base_area` VALUES ('350206', '350200', '湖里区', '0', '0', '350000-350200-350206-', '1');
INSERT INTO `base_area` VALUES ('350211', '350200', '集美区', '0', '0', '350000-350200-350211-', '1');
INSERT INTO `base_area` VALUES ('350212', '350200', '同安区', '0', '0', '350000-350200-350212-', '1');
INSERT INTO `base_area` VALUES ('350213', '350200', '翔安区', '0', '0', '350000-350200-350213-', '1');
INSERT INTO `base_area` VALUES ('350300', '350000', '莆田市', '351100', '0594', '350000-350300-', '1');
INSERT INTO `base_area` VALUES ('350301', '350300', '市辖区', '0', '0', '350000-350300-350301-', '1');
INSERT INTO `base_area` VALUES ('350302', '350300', '城厢区', '0', '0', '350000-350300-350302-', '1');
INSERT INTO `base_area` VALUES ('350303', '350300', '涵江区', '0', '0', '350000-350300-350303-', '1');
INSERT INTO `base_area` VALUES ('350304', '350300', '荔城区', '0', '0', '350000-350300-350304-', '1');
INSERT INTO `base_area` VALUES ('350305', '350300', '秀屿区', '0', '0', '350000-350300-350305-', '1');
INSERT INTO `base_area` VALUES ('350322', '350300', '仙游县', '0', '0', '350000-350300-350322-', '1');
INSERT INTO `base_area` VALUES ('350400', '350000', '三明市', '365000', '0598', '350000-350400-', '1');
INSERT INTO `base_area` VALUES ('350401', '350400', '市辖区', '0', '0', '350000-350400-350401-', '1');
INSERT INTO `base_area` VALUES ('350402', '350400', '梅列区', '0', '0', '350000-350400-350402-', '1');
INSERT INTO `base_area` VALUES ('350403', '350400', '三元区', '0', '0', '350000-350400-350403-', '1');
INSERT INTO `base_area` VALUES ('350421', '350400', '明溪县', '0', '0', '350000-350400-350421-', '1');
INSERT INTO `base_area` VALUES ('350423', '350400', '清流县', '0', '0', '350000-350400-350423-', '1');
INSERT INTO `base_area` VALUES ('350424', '350400', '宁化县', '0', '0', '350000-350400-350424-', '1');
INSERT INTO `base_area` VALUES ('350425', '350400', '大田县', '0', '0', '350000-350400-350425-', '1');
INSERT INTO `base_area` VALUES ('350426', '350400', '尤溪县', '0', '0', '350000-350400-350426-', '1');
INSERT INTO `base_area` VALUES ('350427', '350400', '沙　县', '0', '0', '350000-350400-350427-', '1');
INSERT INTO `base_area` VALUES ('350428', '350400', '将乐县', '0', '0', '350000-350400-350428-', '1');
INSERT INTO `base_area` VALUES ('350429', '350400', '泰宁县', '0', '0', '350000-350400-350429-', '1');
INSERT INTO `base_area` VALUES ('350430', '350400', '建宁县', '0', '0', '350000-350400-350430-', '1');
INSERT INTO `base_area` VALUES ('350481', '350400', '永安市', '0', '0', '350000-350400-350481-', '1');
INSERT INTO `base_area` VALUES ('350500', '350000', '泉州市', '362000', '0595', '350000-350500-', '1');
INSERT INTO `base_area` VALUES ('350501', '350500', '市辖区', '0', '0', '350000-350500-350501-', '1');
INSERT INTO `base_area` VALUES ('350502', '350500', '鲤城区', '0', '0', '350000-350500-350502-', '1');
INSERT INTO `base_area` VALUES ('350503', '350500', '丰泽区', '0', '0', '350000-350500-350503-', '1');
INSERT INTO `base_area` VALUES ('350504', '350500', '洛江区', '0', '0', '350000-350500-350504-', '1');
INSERT INTO `base_area` VALUES ('350505', '350500', '泉港区', '0', '0', '350000-350500-350505-', '1');
INSERT INTO `base_area` VALUES ('350521', '350500', '惠安县', '0', '0', '350000-350500-350521-', '1');
INSERT INTO `base_area` VALUES ('350524', '350500', '安溪县', '0', '0', '350000-350500-350524-', '1');
INSERT INTO `base_area` VALUES ('350525', '350500', '永春县', '0', '0', '350000-350500-350525-', '1');
INSERT INTO `base_area` VALUES ('350526', '350500', '德化县', '0', '0', '350000-350500-350526-', '1');
INSERT INTO `base_area` VALUES ('350527', '350500', '金门县', '0', '0', '350000-350500-350527-', '1');
INSERT INTO `base_area` VALUES ('350581', '350500', '石狮市', '0', '0', '350000-350500-350581-', '1');
INSERT INTO `base_area` VALUES ('350582', '350500', '晋江市', '0', '0', '350000-350500-350582-', '1');
INSERT INTO `base_area` VALUES ('350583', '350500', '南安市', '0', '0', '350000-350500-350583-', '1');
INSERT INTO `base_area` VALUES ('350600', '350000', '漳州市', '363000', '0596', '350000-350600-', '1');
INSERT INTO `base_area` VALUES ('350601', '350600', '市辖区', '0', '0', '350000-350600-350601-', '1');
INSERT INTO `base_area` VALUES ('350602', '350600', '芗城区', '0', '0', '350000-350600-350602-', '1');
INSERT INTO `base_area` VALUES ('350603', '350600', '龙文区', '0', '0', '350000-350600-350603-', '1');
INSERT INTO `base_area` VALUES ('350622', '350600', '云霄县', '0', '0', '350000-350600-350622-', '1');
INSERT INTO `base_area` VALUES ('350623', '350600', '漳浦县', '0', '0', '350000-350600-350623-', '1');
INSERT INTO `base_area` VALUES ('350624', '350600', '诏安县', '0', '0', '350000-350600-350624-', '1');
INSERT INTO `base_area` VALUES ('350625', '350600', '长泰县', '0', '0', '350000-350600-350625-', '1');
INSERT INTO `base_area` VALUES ('350626', '350600', '东山县', '0', '0', '350000-350600-350626-', '1');
INSERT INTO `base_area` VALUES ('350627', '350600', '南靖县', '0', '0', '350000-350600-350627-', '1');
INSERT INTO `base_area` VALUES ('350628', '350600', '平和县', '0', '0', '350000-350600-350628-', '1');
INSERT INTO `base_area` VALUES ('350629', '350600', '华安县', '0', '0', '350000-350600-350629-', '1');
INSERT INTO `base_area` VALUES ('350681', '350600', '龙海市', '0', '0', '350000-350600-350681-', '1');
INSERT INTO `base_area` VALUES ('350700', '350000', '南平市', '353000', '0599', '350000-350700-', '1');
INSERT INTO `base_area` VALUES ('350701', '350700', '市辖区', '0', '0', '350000-350700-350701-', '1');
INSERT INTO `base_area` VALUES ('350702', '350700', '延平区', '0', '0', '350000-350700-350702-', '1');
INSERT INTO `base_area` VALUES ('350721', '350700', '顺昌县', '0', '0', '350000-350700-350721-', '1');
INSERT INTO `base_area` VALUES ('350722', '350700', '浦城县', '0', '0', '350000-350700-350722-', '1');
INSERT INTO `base_area` VALUES ('350723', '350700', '光泽县', '0', '0', '350000-350700-350723-', '1');
INSERT INTO `base_area` VALUES ('350724', '350700', '松溪县', '0', '0', '350000-350700-350724-', '1');
INSERT INTO `base_area` VALUES ('350725', '350700', '政和县', '0', '0', '350000-350700-350725-', '1');
INSERT INTO `base_area` VALUES ('350781', '350700', '邵武市', '0', '0', '350000-350700-350781-', '1');
INSERT INTO `base_area` VALUES ('350782', '350700', '武夷山市', '0', '0', '350000-350700-350782-', '1');
INSERT INTO `base_area` VALUES ('350783', '350700', '建瓯市', '0', '0', '350000-350700-350783-', '1');
INSERT INTO `base_area` VALUES ('350784', '350700', '建阳市', '0', '0', '350000-350700-350784-', '1');
INSERT INTO `base_area` VALUES ('350800', '350000', '龙岩市', '364000', '0597', '350000-350800-', '1');
INSERT INTO `base_area` VALUES ('350801', '350800', '市辖区', '0', '0', '350000-350800-350801-', '1');
INSERT INTO `base_area` VALUES ('350802', '350800', '新罗区', '0', '0', '350000-350800-350802-', '1');
INSERT INTO `base_area` VALUES ('350821', '350800', '长汀县', '0', '0', '350000-350800-350821-', '1');
INSERT INTO `base_area` VALUES ('350822', '350800', '永定县', '0', '0', '350000-350800-350822-', '1');
INSERT INTO `base_area` VALUES ('350823', '350800', '上杭县', '0', '0', '350000-350800-350823-', '1');
INSERT INTO `base_area` VALUES ('350824', '350800', '武平县', '0', '0', '350000-350800-350824-', '1');
INSERT INTO `base_area` VALUES ('350825', '350800', '连城县', '0', '0', '350000-350800-350825-', '1');
INSERT INTO `base_area` VALUES ('350881', '350800', '漳平市', '0', '0', '350000-350800-350881-', '1');
INSERT INTO `base_area` VALUES ('350900', '350000', '宁德市', '352000', '0593', '350000-350900-', '1');
INSERT INTO `base_area` VALUES ('350901', '350900', '市辖区', '0', '0', '350000-350900-350901-', '1');
INSERT INTO `base_area` VALUES ('350902', '350900', '蕉城区', '0', '0', '350000-350900-350902-', '1');
INSERT INTO `base_area` VALUES ('350921', '350900', '霞浦县', '0', '0', '350000-350900-350921-', '1');
INSERT INTO `base_area` VALUES ('350922', '350900', '古田县', '0', '0', '350000-350900-350922-', '1');
INSERT INTO `base_area` VALUES ('350923', '350900', '屏南县', '0', '0', '350000-350900-350923-', '1');
INSERT INTO `base_area` VALUES ('350924', '350900', '寿宁县', '0', '0', '350000-350900-350924-', '1');
INSERT INTO `base_area` VALUES ('350925', '350900', '周宁县', '0', '0', '350000-350900-350925-', '1');
INSERT INTO `base_area` VALUES ('350926', '350900', '柘荣县', '0', '0', '350000-350900-350926-', '1');
INSERT INTO `base_area` VALUES ('350981', '350900', '福安市', '0', '0', '350000-350900-350981-', '1');
INSERT INTO `base_area` VALUES ('350982', '350900', '福鼎市', '0', '0', '350000-350900-350982-', '1');
INSERT INTO `base_area` VALUES ('360000', '0', '江西省', '0', '0', '360000-', '1');
INSERT INTO `base_area` VALUES ('360100', '360000', '南昌市', '330000', '0791', '360000-360100-', '1');
INSERT INTO `base_area` VALUES ('360101', '360100', '市辖区', '0', '0', '360000-360100-360101-', '1');
INSERT INTO `base_area` VALUES ('360102', '360100', '东湖区', '0', '0', '360000-360100-360102-', '1');
INSERT INTO `base_area` VALUES ('360103', '360100', '西湖区', '0', '0', '360000-360100-360103-', '1');
INSERT INTO `base_area` VALUES ('360104', '360100', '青云谱区', '0', '0', '360000-360100-360104-', '1');
INSERT INTO `base_area` VALUES ('360105', '360100', '湾里区', '0', '0', '360000-360100-360105-', '1');
INSERT INTO `base_area` VALUES ('360111', '360100', '青山湖区', '0', '0', '360000-360100-360111-', '1');
INSERT INTO `base_area` VALUES ('360121', '360100', '南昌县', '0', '0', '360000-360100-360121-', '1');
INSERT INTO `base_area` VALUES ('360122', '360100', '新建县', '0', '0', '360000-360100-360122-', '1');
INSERT INTO `base_area` VALUES ('360123', '360100', '安义县', '0', '0', '360000-360100-360123-', '1');
INSERT INTO `base_area` VALUES ('360124', '360100', '进贤县', '0', '0', '360000-360100-360124-', '1');
INSERT INTO `base_area` VALUES ('360200', '360000', '景德镇市', '333000', '0798', '360000-360200-', '1');
INSERT INTO `base_area` VALUES ('360201', '360200', '市辖区', '0', '0', '360000-360200-360201-', '1');
INSERT INTO `base_area` VALUES ('360202', '360200', '昌江区', '0', '0', '360000-360200-360202-', '1');
INSERT INTO `base_area` VALUES ('360203', '360200', '珠山区', '0', '0', '360000-360200-360203-', '1');
INSERT INTO `base_area` VALUES ('360222', '360200', '浮梁县', '0', '0', '360000-360200-360222-', '1');
INSERT INTO `base_area` VALUES ('360281', '360200', '乐平市', '0', '0', '360000-360200-360281-', '1');
INSERT INTO `base_area` VALUES ('360300', '360000', '萍乡市', '337000', '0799', '360000-360300-', '1');
INSERT INTO `base_area` VALUES ('360301', '360300', '市辖区', '0', '0', '360000-360300-360301-', '1');
INSERT INTO `base_area` VALUES ('360302', '360300', '安源区', '0', '0', '360000-360300-360302-', '1');
INSERT INTO `base_area` VALUES ('360313', '360300', '湘东区', '0', '0', '360000-360300-360313-', '1');
INSERT INTO `base_area` VALUES ('360321', '360300', '莲花县', '0', '0', '360000-360300-360321-', '1');
INSERT INTO `base_area` VALUES ('360322', '360300', '上栗县', '0', '0', '360000-360300-360322-', '1');
INSERT INTO `base_area` VALUES ('360323', '360300', '芦溪县', '0', '0', '360000-360300-360323-', '1');
INSERT INTO `base_area` VALUES ('360400', '360000', '九江市', '332000', '0792', '360000-360400-', '1');
INSERT INTO `base_area` VALUES ('360401', '360400', '市辖区', '0', '0', '360000-360400-360401-', '1');
INSERT INTO `base_area` VALUES ('360402', '360400', '庐山区', '0', '0', '360000-360400-360402-', '1');
INSERT INTO `base_area` VALUES ('360403', '360400', '浔阳区', '0', '0', '360000-360400-360403-', '1');
INSERT INTO `base_area` VALUES ('360421', '360400', '九江县', '0', '0', '360000-360400-360421-', '1');
INSERT INTO `base_area` VALUES ('360423', '360400', '武宁县', '0', '0', '360000-360400-360423-', '1');
INSERT INTO `base_area` VALUES ('360424', '360400', '修水县', '0', '0', '360000-360400-360424-', '1');
INSERT INTO `base_area` VALUES ('360425', '360400', '永修县', '0', '0', '360000-360400-360425-', '1');
INSERT INTO `base_area` VALUES ('360426', '360400', '德安县', '0', '0', '360000-360400-360426-', '1');
INSERT INTO `base_area` VALUES ('360427', '360400', '星子县', '0', '0', '360000-360400-360427-', '1');
INSERT INTO `base_area` VALUES ('360428', '360400', '都昌县', '0', '0', '360000-360400-360428-', '1');
INSERT INTO `base_area` VALUES ('360429', '360400', '湖口县', '0', '0', '360000-360400-360429-', '1');
INSERT INTO `base_area` VALUES ('360430', '360400', '彭泽县', '0', '0', '360000-360400-360430-', '1');
INSERT INTO `base_area` VALUES ('360481', '360400', '瑞昌市', '0', '0', '360000-360400-360481-', '1');
INSERT INTO `base_area` VALUES ('360500', '360000', '新余市', '336500', '0790', '360000-360500-', '1');
INSERT INTO `base_area` VALUES ('360501', '360500', '市辖区', '0', '0', '360000-360500-360501-', '1');
INSERT INTO `base_area` VALUES ('360502', '360500', '渝水区', '0', '0', '360000-360500-360502-', '1');
INSERT INTO `base_area` VALUES ('360521', '360500', '分宜县', '0', '0', '360000-360500-360521-', '1');
INSERT INTO `base_area` VALUES ('360600', '360000', '鹰潭市', '338000', '0701', '360000-360600-', '1');
INSERT INTO `base_area` VALUES ('360601', '360600', '市辖区', '0', '0', '360000-360600-360601-', '1');
INSERT INTO `base_area` VALUES ('360602', '360600', '月湖区', '0', '0', '360000-360600-360602-', '1');
INSERT INTO `base_area` VALUES ('360622', '360600', '余江县', '0', '0', '360000-360600-360622-', '1');
INSERT INTO `base_area` VALUES ('360681', '360600', '贵溪市', '0', '0', '360000-360600-360681-', '1');
INSERT INTO `base_area` VALUES ('360700', '360000', '赣州市', '341000', '0797', '360000-360700-', '1');
INSERT INTO `base_area` VALUES ('360701', '360700', '市辖区', '0', '0', '360000-360700-360701-', '1');
INSERT INTO `base_area` VALUES ('360702', '360700', '章贡区', '0', '0', '360000-360700-360702-', '1');
INSERT INTO `base_area` VALUES ('360721', '360700', '赣　县', '0', '0', '360000-360700-360721-', '1');
INSERT INTO `base_area` VALUES ('360722', '360700', '信丰县', '0', '0', '360000-360700-360722-', '1');
INSERT INTO `base_area` VALUES ('360723', '360700', '大余县', '0', '0', '360000-360700-360723-', '1');
INSERT INTO `base_area` VALUES ('360724', '360700', '上犹县', '0', '0', '360000-360700-360724-', '1');
INSERT INTO `base_area` VALUES ('360725', '360700', '崇义县', '0', '0', '360000-360700-360725-', '1');
INSERT INTO `base_area` VALUES ('360726', '360700', '安远县', '0', '0', '360000-360700-360726-', '1');
INSERT INTO `base_area` VALUES ('360727', '360700', '龙南县', '0', '0', '360000-360700-360727-', '1');
INSERT INTO `base_area` VALUES ('360728', '360700', '定南县', '0', '0', '360000-360700-360728-', '1');
INSERT INTO `base_area` VALUES ('360729', '360700', '全南县', '0', '0', '360000-360700-360729-', '1');
INSERT INTO `base_area` VALUES ('360730', '360700', '宁都县', '0', '0', '360000-360700-360730-', '1');
INSERT INTO `base_area` VALUES ('360731', '360700', '于都县', '0', '0', '360000-360700-360731-', '1');
INSERT INTO `base_area` VALUES ('360732', '360700', '兴国县', '0', '0', '360000-360700-360732-', '1');
INSERT INTO `base_area` VALUES ('360733', '360700', '会昌县', '0', '0', '360000-360700-360733-', '1');
INSERT INTO `base_area` VALUES ('360734', '360700', '寻乌县', '0', '0', '360000-360700-360734-', '1');
INSERT INTO `base_area` VALUES ('360735', '360700', '石城县', '0', '0', '360000-360700-360735-', '1');
INSERT INTO `base_area` VALUES ('360781', '360700', '瑞金市', '0', '0', '360000-360700-360781-', '1');
INSERT INTO `base_area` VALUES ('360782', '360700', '南康市', '0', '0', '360000-360700-360782-', '1');
INSERT INTO `base_area` VALUES ('360800', '360000', '吉安市', '343000', '0796', '360000-360800-', '1');
INSERT INTO `base_area` VALUES ('360801', '360800', '市辖区', '0', '0', '360000-360800-360801-', '1');
INSERT INTO `base_area` VALUES ('360802', '360800', '吉州区', '0', '0', '360000-360800-360802-', '1');
INSERT INTO `base_area` VALUES ('360803', '360800', '青原区', '0', '0', '360000-360800-360803-', '1');
INSERT INTO `base_area` VALUES ('360821', '360800', '吉安县', '0', '0', '360000-360800-360821-', '1');
INSERT INTO `base_area` VALUES ('360822', '360800', '吉水县', '0', '0', '360000-360800-360822-', '1');
INSERT INTO `base_area` VALUES ('360823', '360800', '峡江县', '0', '0', '360000-360800-360823-', '1');
INSERT INTO `base_area` VALUES ('360824', '360800', '新干县', '0', '0', '360000-360800-360824-', '1');
INSERT INTO `base_area` VALUES ('360825', '360800', '永丰县', '0', '0', '360000-360800-360825-', '1');
INSERT INTO `base_area` VALUES ('360826', '360800', '泰和县', '0', '0', '360000-360800-360826-', '1');
INSERT INTO `base_area` VALUES ('360827', '360800', '遂川县', '0', '0', '360000-360800-360827-', '1');
INSERT INTO `base_area` VALUES ('360828', '360800', '万安县', '0', '0', '360000-360800-360828-', '1');
INSERT INTO `base_area` VALUES ('360829', '360800', '安福县', '0', '0', '360000-360800-360829-', '1');
INSERT INTO `base_area` VALUES ('360830', '360800', '永新县', '0', '0', '360000-360800-360830-', '1');
INSERT INTO `base_area` VALUES ('360881', '360800', '井冈山市', '0', '0', '360000-360800-360881-', '1');
INSERT INTO `base_area` VALUES ('360900', '360000', '宜春市', '336000', '0795', '360000-360900-', '1');
INSERT INTO `base_area` VALUES ('360901', '360900', '市辖区', '0', '0', '360000-360900-360901-', '1');
INSERT INTO `base_area` VALUES ('360902', '360900', '袁州区', '0', '0', '360000-360900-360902-', '1');
INSERT INTO `base_area` VALUES ('360921', '360900', '奉新县', '0', '0', '360000-360900-360921-', '1');
INSERT INTO `base_area` VALUES ('360922', '360900', '万载县', '0', '0', '360000-360900-360922-', '1');
INSERT INTO `base_area` VALUES ('360923', '360900', '上高县', '0', '0', '360000-360900-360923-', '1');
INSERT INTO `base_area` VALUES ('360924', '360900', '宜丰县', '0', '0', '360000-360900-360924-', '1');
INSERT INTO `base_area` VALUES ('360925', '360900', '靖安县', '0', '0', '360000-360900-360925-', '1');
INSERT INTO `base_area` VALUES ('360926', '360900', '铜鼓县', '0', '0', '360000-360900-360926-', '1');
INSERT INTO `base_area` VALUES ('360981', '360900', '丰城市', '0', '0', '360000-360900-360981-', '1');
INSERT INTO `base_area` VALUES ('360982', '360900', '樟树市', '0', '0', '360000-360900-360982-', '1');
INSERT INTO `base_area` VALUES ('360983', '360900', '高安市', '0', '0', '360000-360900-360983-', '1');
INSERT INTO `base_area` VALUES ('361000', '360000', '抚州市', '344000', '0794', '360000-361000-', '1');
INSERT INTO `base_area` VALUES ('361001', '361000', '市辖区', '0', '0', '360000-361000-361001-', '1');
INSERT INTO `base_area` VALUES ('361002', '361000', '临川区', '0', '0', '360000-361000-361002-', '1');
INSERT INTO `base_area` VALUES ('361021', '361000', '南城县', '0', '0', '360000-361000-361021-', '1');
INSERT INTO `base_area` VALUES ('361022', '361000', '黎川县', '0', '0', '360000-361000-361022-', '1');
INSERT INTO `base_area` VALUES ('361023', '361000', '南丰县', '0', '0', '360000-361000-361023-', '1');
INSERT INTO `base_area` VALUES ('361024', '361000', '崇仁县', '0', '0', '360000-361000-361024-', '1');
INSERT INTO `base_area` VALUES ('361025', '361000', '乐安县', '0', '0', '360000-361000-361025-', '1');
INSERT INTO `base_area` VALUES ('361026', '361000', '宜黄县', '0', '0', '360000-361000-361026-', '1');
INSERT INTO `base_area` VALUES ('361027', '361000', '金溪县', '0', '0', '360000-361000-361027-', '1');
INSERT INTO `base_area` VALUES ('361028', '361000', '资溪县', '0', '0', '360000-361000-361028-', '1');
INSERT INTO `base_area` VALUES ('361029', '361000', '东乡县', '0', '0', '360000-361000-361029-', '1');
INSERT INTO `base_area` VALUES ('361030', '361000', '广昌县', '0', '0', '360000-361000-361030-', '1');
INSERT INTO `base_area` VALUES ('361100', '360000', '上饶市', '334000', '0793', '360000-361100-', '1');
INSERT INTO `base_area` VALUES ('361101', '361100', '市辖区', '0', '0', '360000-361100-361101-', '1');
INSERT INTO `base_area` VALUES ('361102', '361100', '信州区', '0', '0', '360000-361100-361102-', '1');
INSERT INTO `base_area` VALUES ('361121', '361100', '上饶县', '0', '0', '360000-361100-361121-', '1');
INSERT INTO `base_area` VALUES ('361122', '361100', '广丰县', '0', '0', '360000-361100-361122-', '1');
INSERT INTO `base_area` VALUES ('361123', '361100', '玉山县', '0', '0', '360000-361100-361123-', '1');
INSERT INTO `base_area` VALUES ('361124', '361100', '铅山县', '0', '0', '360000-361100-361124-', '1');
INSERT INTO `base_area` VALUES ('361125', '361100', '横峰县', '0', '0', '360000-361100-361125-', '1');
INSERT INTO `base_area` VALUES ('361126', '361100', '弋阳县', '0', '0', '360000-361100-361126-', '1');
INSERT INTO `base_area` VALUES ('361127', '361100', '余干县', '0', '0', '360000-361100-361127-', '1');
INSERT INTO `base_area` VALUES ('361128', '361100', '鄱阳县', '0', '0', '360000-361100-361128-', '1');
INSERT INTO `base_area` VALUES ('361129', '361100', '万年县', '0', '0', '360000-361100-361129-', '1');
INSERT INTO `base_area` VALUES ('361130', '361100', '婺源县', '0', '0', '360000-361100-361130-', '1');
INSERT INTO `base_area` VALUES ('361181', '361100', '德兴市', '0', '0', '360000-361100-361181-', '1');
INSERT INTO `base_area` VALUES ('370000', '0', '山东省', '0', '0', '370000-', '1');
INSERT INTO `base_area` VALUES ('370100', '370000', '济南市', '250000', '0531', '370000-370100-', '1');
INSERT INTO `base_area` VALUES ('370101', '370100', '市辖区', '0', '0', '370000-370100-370101-', '1');
INSERT INTO `base_area` VALUES ('370102', '370100', '历下区', '0', '0', '370000-370100-370102-', '1');
INSERT INTO `base_area` VALUES ('370103', '370100', '市中区', '0', '0', '370000-370100-370103-', '1');
INSERT INTO `base_area` VALUES ('370104', '370100', '槐荫区', '0', '0', '370000-370100-370104-', '1');
INSERT INTO `base_area` VALUES ('370105', '370100', '天桥区', '0', '0', '370000-370100-370105-', '1');
INSERT INTO `base_area` VALUES ('370112', '370100', '历城区', '0', '0', '370000-370100-370112-', '1');
INSERT INTO `base_area` VALUES ('370113', '370100', '长清区', '0', '0', '370000-370100-370113-', '1');
INSERT INTO `base_area` VALUES ('370124', '370100', '平阴县', '0', '0', '370000-370100-370124-', '1');
INSERT INTO `base_area` VALUES ('370125', '370100', '济阳县', '0', '0', '370000-370100-370125-', '1');
INSERT INTO `base_area` VALUES ('370126', '370100', '商河县', '0', '0', '370000-370100-370126-', '1');
INSERT INTO `base_area` VALUES ('370181', '370100', '章丘市', '0', '0', '370000-370100-370181-', '1');
INSERT INTO `base_area` VALUES ('370200', '370000', '青岛市', '266000', '0532', '370000-370200-', '1');
INSERT INTO `base_area` VALUES ('370201', '370200', '市辖区', '0', '0', '370000-370200-370201-', '1');
INSERT INTO `base_area` VALUES ('370202', '370200', '市南区', '0', '0', '370000-370200-370202-', '1');
INSERT INTO `base_area` VALUES ('370203', '370200', '市北区', '0', '0', '370000-370200-370203-', '1');
INSERT INTO `base_area` VALUES ('370205', '370200', '四方区', '0', '0', '370000-370200-370205-', '1');
INSERT INTO `base_area` VALUES ('370211', '370200', '黄岛区', '0', '0', '370000-370200-370211-', '1');
INSERT INTO `base_area` VALUES ('370212', '370200', '崂山区', '0', '0', '370000-370200-370212-', '1');
INSERT INTO `base_area` VALUES ('370213', '370200', '李沧区', '0', '0', '370000-370200-370213-', '1');
INSERT INTO `base_area` VALUES ('370214', '370200', '城阳区', '0', '0', '370000-370200-370214-', '1');
INSERT INTO `base_area` VALUES ('370281', '370200', '胶州市', '0', '0', '370000-370200-370281-', '1');
INSERT INTO `base_area` VALUES ('370282', '370200', '即墨市', '0', '0', '370000-370200-370282-', '1');
INSERT INTO `base_area` VALUES ('370283', '370200', '平度市', '0', '0', '370000-370200-370283-', '1');
INSERT INTO `base_area` VALUES ('370284', '370200', '胶南市', '0', '0', '370000-370200-370284-', '1');
INSERT INTO `base_area` VALUES ('370285', '370200', '莱西市', '0', '0', '370000-370200-370285-', '1');
INSERT INTO `base_area` VALUES ('370300', '370000', '淄博市', '255000', '0533', '370000-370300-', '1');
INSERT INTO `base_area` VALUES ('370301', '370300', '市辖区', '0', '0', '370000-370300-370301-', '1');
INSERT INTO `base_area` VALUES ('370302', '370300', '淄川区', '0', '0', '370000-370300-370302-', '1');
INSERT INTO `base_area` VALUES ('370303', '370300', '张店区', '0', '0', '370000-370300-370303-', '1');
INSERT INTO `base_area` VALUES ('370304', '370300', '博山区', '0', '0', '370000-370300-370304-', '1');
INSERT INTO `base_area` VALUES ('370305', '370300', '临淄区', '0', '0', '370000-370300-370305-', '1');
INSERT INTO `base_area` VALUES ('370306', '370300', '周村区', '0', '0', '370000-370300-370306-', '1');
INSERT INTO `base_area` VALUES ('370321', '370300', '桓台县', '0', '0', '370000-370300-370321-', '1');
INSERT INTO `base_area` VALUES ('370322', '370300', '高青县', '0', '0', '370000-370300-370322-', '1');
INSERT INTO `base_area` VALUES ('370323', '370300', '沂源县', '0', '0', '370000-370300-370323-', '1');
INSERT INTO `base_area` VALUES ('370400', '370000', '枣庄市', '277000', '0632', '370000-370400-', '1');
INSERT INTO `base_area` VALUES ('370401', '370400', '市辖区', '0', '0', '370000-370400-370401-', '1');
INSERT INTO `base_area` VALUES ('370402', '370400', '市中区', '0', '0', '370000-370400-370402-', '1');
INSERT INTO `base_area` VALUES ('370403', '370400', '薛城区', '0', '0', '370000-370400-370403-', '1');
INSERT INTO `base_area` VALUES ('370404', '370400', '峄城区', '0', '0', '370000-370400-370404-', '1');
INSERT INTO `base_area` VALUES ('370405', '370400', '台儿庄区', '0', '0', '370000-370400-370405-', '1');
INSERT INTO `base_area` VALUES ('370406', '370400', '山亭区', '0', '0', '370000-370400-370406-', '1');
INSERT INTO `base_area` VALUES ('370481', '370400', '滕州市', '0', '0', '370000-370400-370481-', '1');
INSERT INTO `base_area` VALUES ('370500', '370000', '东营市', '257000', '0546', '370000-370500-', '1');
INSERT INTO `base_area` VALUES ('370501', '370500', '市辖区', '0', '0', '370000-370500-370501-', '1');
INSERT INTO `base_area` VALUES ('370502', '370500', '东营区', '0', '0', '370000-370500-370502-', '1');
INSERT INTO `base_area` VALUES ('370503', '370500', '河口区', '0', '0', '370000-370500-370503-', '1');
INSERT INTO `base_area` VALUES ('370521', '370500', '垦利县', '0', '0', '370000-370500-370521-', '1');
INSERT INTO `base_area` VALUES ('370522', '370500', '利津县', '0', '0', '370000-370500-370522-', '1');
INSERT INTO `base_area` VALUES ('370523', '370500', '广饶县', '0', '0', '370000-370500-370523-', '1');
INSERT INTO `base_area` VALUES ('370600', '370000', '烟台市', '264000', '0535', '370000-370600-', '1');
INSERT INTO `base_area` VALUES ('370601', '370600', '市辖区', '0', '0', '370000-370600-370601-', '1');
INSERT INTO `base_area` VALUES ('370602', '370600', '芝罘区', '0', '0', '370000-370600-370602-', '1');
INSERT INTO `base_area` VALUES ('370611', '370600', '福山区', '0', '0', '370000-370600-370611-', '1');
INSERT INTO `base_area` VALUES ('370612', '370600', '牟平区', '0', '0', '370000-370600-370612-', '1');
INSERT INTO `base_area` VALUES ('370613', '370600', '莱山区', '0', '0', '370000-370600-370613-', '1');
INSERT INTO `base_area` VALUES ('370634', '370600', '长岛县', '0', '0', '370000-370600-370634-', '1');
INSERT INTO `base_area` VALUES ('370681', '370600', '龙口市', '0', '0', '370000-370600-370681-', '1');
INSERT INTO `base_area` VALUES ('370682', '370600', '莱阳市', '0', '0', '370000-370600-370682-', '1');
INSERT INTO `base_area` VALUES ('370683', '370600', '莱州市', '0', '0', '370000-370600-370683-', '1');
INSERT INTO `base_area` VALUES ('370684', '370600', '蓬莱市', '0', '0', '370000-370600-370684-', '1');
INSERT INTO `base_area` VALUES ('370685', '370600', '招远市', '0', '0', '370000-370600-370685-', '1');
INSERT INTO `base_area` VALUES ('370686', '370600', '栖霞市', '0', '0', '370000-370600-370686-', '1');
INSERT INTO `base_area` VALUES ('370687', '370600', '海阳市', '0', '0', '370000-370600-370687-', '1');
INSERT INTO `base_area` VALUES ('370700', '370000', '潍坊市', '261000', '0536', '370000-370700-', '1');
INSERT INTO `base_area` VALUES ('370701', '370700', '市辖区', '0', '0', '370000-370700-370701-', '1');
INSERT INTO `base_area` VALUES ('370702', '370700', '潍城区', '0', '0', '370000-370700-370702-', '1');
INSERT INTO `base_area` VALUES ('370703', '370700', '寒亭区', '0', '0', '370000-370700-370703-', '1');
INSERT INTO `base_area` VALUES ('370704', '370700', '坊子区', '0', '0', '370000-370700-370704-', '1');
INSERT INTO `base_area` VALUES ('370705', '370700', '奎文区', '0', '0', '370000-370700-370705-', '1');
INSERT INTO `base_area` VALUES ('370724', '370700', '临朐县', '0', '0', '370000-370700-370724-', '1');
INSERT INTO `base_area` VALUES ('370725', '370700', '昌乐县', '0', '0', '370000-370700-370725-', '1');
INSERT INTO `base_area` VALUES ('370781', '370700', '青州市', '0', '0', '370000-370700-370781-', '1');
INSERT INTO `base_area` VALUES ('370782', '370700', '诸城市', '0', '0', '370000-370700-370782-', '1');
INSERT INTO `base_area` VALUES ('370783', '370700', '寿光市', '0', '0', '370000-370700-370783-', '1');
INSERT INTO `base_area` VALUES ('370784', '370700', '安丘市', '0', '0', '370000-370700-370784-', '1');
INSERT INTO `base_area` VALUES ('370785', '370700', '高密市', '0', '0', '370000-370700-370785-', '1');
INSERT INTO `base_area` VALUES ('370786', '370700', '昌邑市', '0', '0', '370000-370700-370786-', '1');
INSERT INTO `base_area` VALUES ('370800', '370000', '济宁市', '272000', '0537', '370000-370800-', '1');
INSERT INTO `base_area` VALUES ('370801', '370800', '市辖区', '0', '0', '370000-370800-370801-', '1');
INSERT INTO `base_area` VALUES ('370802', '370800', '市中区', '0', '0', '370000-370800-370802-', '1');
INSERT INTO `base_area` VALUES ('370811', '370800', '任城区', '0', '0', '370000-370800-370811-', '1');
INSERT INTO `base_area` VALUES ('370826', '370800', '微山县', '0', '0', '370000-370800-370826-', '1');
INSERT INTO `base_area` VALUES ('370827', '370800', '鱼台县', '0', '0', '370000-370800-370827-', '1');
INSERT INTO `base_area` VALUES ('370828', '370800', '金乡县', '0', '0', '370000-370800-370828-', '1');
INSERT INTO `base_area` VALUES ('370829', '370800', '嘉祥县', '0', '0', '370000-370800-370829-', '1');
INSERT INTO `base_area` VALUES ('370830', '370800', '汶上县', '0', '0', '370000-370800-370830-', '1');
INSERT INTO `base_area` VALUES ('370831', '370800', '泗水县', '0', '0', '370000-370800-370831-', '1');
INSERT INTO `base_area` VALUES ('370832', '370800', '梁山县', '0', '0', '370000-370800-370832-', '1');
INSERT INTO `base_area` VALUES ('370881', '370800', '曲阜市', '0', '0', '370000-370800-370881-', '1');
INSERT INTO `base_area` VALUES ('370882', '370800', '兖州市', '0', '0', '370000-370800-370882-', '1');
INSERT INTO `base_area` VALUES ('370883', '370800', '邹城市', '0', '0', '370000-370800-370883-', '1');
INSERT INTO `base_area` VALUES ('370900', '370000', '泰安市', '271000', '0538', '370000-370900-', '1');
INSERT INTO `base_area` VALUES ('370901', '370900', '市辖区', '0', '0', '370000-370900-370901-', '1');
INSERT INTO `base_area` VALUES ('370902', '370900', '泰山区', '0', '0', '370000-370900-370902-', '1');
INSERT INTO `base_area` VALUES ('370903', '370900', '岱岳区', '0', '0', '370000-370900-370903-', '1');
INSERT INTO `base_area` VALUES ('370921', '370900', '宁阳县', '0', '0', '370000-370900-370921-', '1');
INSERT INTO `base_area` VALUES ('370923', '370900', '东平县', '0', '0', '370000-370900-370923-', '1');
INSERT INTO `base_area` VALUES ('370982', '370900', '新泰市', '0', '0', '370000-370900-370982-', '1');
INSERT INTO `base_area` VALUES ('370983', '370900', '肥城市', '0', '0', '370000-370900-370983-', '1');
INSERT INTO `base_area` VALUES ('371000', '370000', '威海市', '264200', '0631', '370000-371000-', '1');
INSERT INTO `base_area` VALUES ('371001', '371000', '市辖区', '0', '0', '370000-371000-371001-', '1');
INSERT INTO `base_area` VALUES ('371002', '371000', '环翠区', '0', '0', '370000-371000-371002-', '1');
INSERT INTO `base_area` VALUES ('371081', '371000', '文登市', '0', '0', '370000-371000-371081-', '1');
INSERT INTO `base_area` VALUES ('371082', '371000', '荣成市', '0', '0', '370000-371000-371082-', '1');
INSERT INTO `base_area` VALUES ('371083', '371000', '乳山市', '0', '0', '370000-371000-371083-', '1');
INSERT INTO `base_area` VALUES ('371100', '370000', '日照市', '276800', '0633', '370000-371100-', '1');
INSERT INTO `base_area` VALUES ('371101', '371100', '市辖区', '0', '0', '370000-371100-371101-', '1');
INSERT INTO `base_area` VALUES ('371102', '371100', '东港区', '0', '0', '370000-371100-371102-', '1');
INSERT INTO `base_area` VALUES ('371103', '371100', '岚山区', '0', '0', '370000-371100-371103-', '1');
INSERT INTO `base_area` VALUES ('371121', '371100', '五莲县', '0', '0', '370000-371100-371121-', '1');
INSERT INTO `base_area` VALUES ('371122', '371100', '莒　县', '0', '0', '370000-371100-371122-', '1');
INSERT INTO `base_area` VALUES ('371200', '370000', '莱芜市', '271100', '0634', '370000-371200-', '1');
INSERT INTO `base_area` VALUES ('371201', '371200', '市辖区', '0', '0', '370000-371200-371201-', '1');
INSERT INTO `base_area` VALUES ('371202', '371200', '莱城区', '0', '0', '370000-371200-371202-', '1');
INSERT INTO `base_area` VALUES ('371203', '371200', '钢城区', '0', '0', '370000-371200-371203-', '1');
INSERT INTO `base_area` VALUES ('371300', '370000', '临沂市', '276000', '0539', '370000-371300-', '1');
INSERT INTO `base_area` VALUES ('371301', '371300', '市辖区', '0', '0', '370000-371300-371301-', '1');
INSERT INTO `base_area` VALUES ('371302', '371300', '兰山区', '0', '0', '370000-371300-371302-', '1');
INSERT INTO `base_area` VALUES ('371311', '371300', '罗庄区', '0', '0', '370000-371300-371311-', '1');
INSERT INTO `base_area` VALUES ('371312', '371300', '河东区', '0', '0', '370000-371300-371312-', '1');
INSERT INTO `base_area` VALUES ('371321', '371300', '沂南县', '0', '0', '370000-371300-371321-', '1');
INSERT INTO `base_area` VALUES ('371322', '371300', '郯城县', '0', '0', '370000-371300-371322-', '1');
INSERT INTO `base_area` VALUES ('371323', '371300', '沂水县', '0', '0', '370000-371300-371323-', '1');
INSERT INTO `base_area` VALUES ('371324', '371300', '苍山县', '0', '0', '370000-371300-371324-', '1');
INSERT INTO `base_area` VALUES ('371325', '371300', '费　县', '0', '0', '370000-371300-371325-', '1');
INSERT INTO `base_area` VALUES ('371326', '371300', '平邑县', '0', '0', '370000-371300-371326-', '1');
INSERT INTO `base_area` VALUES ('371327', '371300', '莒南县', '0', '0', '370000-371300-371327-', '1');
INSERT INTO `base_area` VALUES ('371328', '371300', '蒙阴县', '0', '0', '370000-371300-371328-', '1');
INSERT INTO `base_area` VALUES ('371329', '371300', '临沭县', '0', '0', '370000-371300-371329-', '1');
INSERT INTO `base_area` VALUES ('371400', '370000', '德州市', '253000', '0543', '370000-371400-', '1');
INSERT INTO `base_area` VALUES ('371401', '371400', '市辖区', '0', '0', '370000-371400-371401-', '1');
INSERT INTO `base_area` VALUES ('371402', '371400', '德城区', '0', '0', '370000-371400-371402-', '1');
INSERT INTO `base_area` VALUES ('371421', '371400', '陵　县', '0', '0', '370000-371400-371421-', '1');
INSERT INTO `base_area` VALUES ('371422', '371400', '宁津县', '0', '0', '370000-371400-371422-', '1');
INSERT INTO `base_area` VALUES ('371423', '371400', '庆云县', '0', '0', '370000-371400-371423-', '1');
INSERT INTO `base_area` VALUES ('371424', '371400', '临邑县', '0', '0', '370000-371400-371424-', '1');
INSERT INTO `base_area` VALUES ('371425', '371400', '齐河县', '0', '0', '370000-371400-371425-', '1');
INSERT INTO `base_area` VALUES ('371426', '371400', '平原县', '0', '0', '370000-371400-371426-', '1');
INSERT INTO `base_area` VALUES ('371427', '371400', '夏津县', '0', '0', '370000-371400-371427-', '1');
INSERT INTO `base_area` VALUES ('371428', '371400', '武城县', '0', '0', '370000-371400-371428-', '1');
INSERT INTO `base_area` VALUES ('371481', '371400', '乐陵市', '0', '0', '370000-371400-371481-', '1');
INSERT INTO `base_area` VALUES ('371482', '371400', '禹城市', '0', '0', '370000-371400-371482-', '1');
INSERT INTO `base_area` VALUES ('371500', '370000', '聊城市', '252000', '0635', '370000-371500-', '1');
INSERT INTO `base_area` VALUES ('371501', '371500', '市辖区', '0', '0', '370000-371500-371501-', '1');
INSERT INTO `base_area` VALUES ('371502', '371500', '东昌府区', '0', '0', '370000-371500-371502-', '1');
INSERT INTO `base_area` VALUES ('371521', '371500', '阳谷县', '0', '0', '370000-371500-371521-', '1');
INSERT INTO `base_area` VALUES ('371522', '371500', '莘　县', '0', '0', '370000-371500-371522-', '1');
INSERT INTO `base_area` VALUES ('371523', '371500', '茌平县', '0', '0', '370000-371500-371523-', '1');
INSERT INTO `base_area` VALUES ('371524', '371500', '东阿县', '0', '0', '370000-371500-371524-', '1');
INSERT INTO `base_area` VALUES ('371525', '371500', '冠　县', '0', '0', '370000-371500-371525-', '1');
INSERT INTO `base_area` VALUES ('371526', '371500', '高唐县', '0', '0', '370000-371500-371526-', '1');
INSERT INTO `base_area` VALUES ('371581', '371500', '临清市', '0', '0', '370000-371500-371581-', '1');
INSERT INTO `base_area` VALUES ('371600', '370000', '滨州市', '256600', '0543', '370000-371600-', '1');
INSERT INTO `base_area` VALUES ('371601', '371600', '市辖区', '0', '0', '370000-371600-371601-', '1');
INSERT INTO `base_area` VALUES ('371602', '371600', '滨城区', '0', '0', '370000-371600-371602-', '1');
INSERT INTO `base_area` VALUES ('371621', '371600', '惠民县', '0', '0', '370000-371600-371621-', '1');
INSERT INTO `base_area` VALUES ('371622', '371600', '阳信县', '0', '0', '370000-371600-371622-', '1');
INSERT INTO `base_area` VALUES ('371623', '371600', '无棣县', '0', '0', '370000-371600-371623-', '1');
INSERT INTO `base_area` VALUES ('371624', '371600', '沾化县', '0', '0', '370000-371600-371624-', '1');
INSERT INTO `base_area` VALUES ('371625', '371600', '博兴县', '0', '0', '370000-371600-371625-', '1');
INSERT INTO `base_area` VALUES ('371626', '371600', '邹平县', '0', '0', '370000-371600-371626-', '1');
INSERT INTO `base_area` VALUES ('371700', '370000', '荷泽市', '274000', '0530', '370000-371700-', '1');
INSERT INTO `base_area` VALUES ('371701', '371700', '市辖区', '0', '0', '370000-371700-371701-', '1');
INSERT INTO `base_area` VALUES ('371702', '371700', '牡丹区', '0', '0', '370000-371700-371702-', '1');
INSERT INTO `base_area` VALUES ('371721', '371700', '曹　县', '0', '0', '370000-371700-371721-', '1');
INSERT INTO `base_area` VALUES ('371722', '371700', '单　县', '0', '0', '370000-371700-371722-', '1');
INSERT INTO `base_area` VALUES ('371723', '371700', '成武县', '0', '0', '370000-371700-371723-', '1');
INSERT INTO `base_area` VALUES ('371724', '371700', '巨野县', '0', '0', '370000-371700-371724-', '1');
INSERT INTO `base_area` VALUES ('371725', '371700', '郓城县', '0', '0', '370000-371700-371725-', '1');
INSERT INTO `base_area` VALUES ('371726', '371700', '鄄城县', '0', '0', '370000-371700-371726-', '1');
INSERT INTO `base_area` VALUES ('371727', '371700', '定陶县', '0', '0', '370000-371700-371727-', '1');
INSERT INTO `base_area` VALUES ('371728', '371700', '东明县', '0', '0', '370000-371700-371728-', '1');
INSERT INTO `base_area` VALUES ('410000', '0', '河南省', '0', '0', '410000-', '1');
INSERT INTO `base_area` VALUES ('410100', '410000', '郑州市', '450000', '0371', '410000-410100-', '1');
INSERT INTO `base_area` VALUES ('410101', '410100', '市辖区', '0', '0', '410000-410100-410101-', '1');
INSERT INTO `base_area` VALUES ('410102', '410100', '中原区', '0', '0', '410000-410100-410102-', '1');
INSERT INTO `base_area` VALUES ('410103', '410100', '二七区', '0', '0', '410000-410100-410103-', '1');
INSERT INTO `base_area` VALUES ('410104', '410100', '管城回族区', '0', '0', '410000-410100-410104-', '1');
INSERT INTO `base_area` VALUES ('410105', '410100', '金水区', '0', '0', '410000-410100-410105-', '1');
INSERT INTO `base_area` VALUES ('410106', '410100', '上街区', '0', '0', '410000-410100-410106-', '1');
INSERT INTO `base_area` VALUES ('410108', '410100', '邙山区', '0', '0', '410000-410100-410108-', '1');
INSERT INTO `base_area` VALUES ('410122', '410100', '中牟县', '0', '0', '410000-410100-410122-', '1');
INSERT INTO `base_area` VALUES ('410181', '410100', '巩义市', '0', '0', '410000-410100-410181-', '1');
INSERT INTO `base_area` VALUES ('410182', '410100', '荥阳市', '0', '0', '410000-410100-410182-', '1');
INSERT INTO `base_area` VALUES ('410183', '410100', '新密市', '0', '0', '410000-410100-410183-', '1');
INSERT INTO `base_area` VALUES ('410184', '410100', '新郑市', '0', '0', '410000-410100-410184-', '1');
INSERT INTO `base_area` VALUES ('410185', '410100', '登封市', '0', '0', '410000-410100-410185-', '1');
INSERT INTO `base_area` VALUES ('410200', '410000', '开封市', '475000', '0378', '410000-410200-', '1');
INSERT INTO `base_area` VALUES ('410201', '410200', '市辖区', '0', '0', '410000-410200-410201-', '1');
INSERT INTO `base_area` VALUES ('410202', '410200', '龙亭区', '0', '0', '410000-410200-410202-', '1');
INSERT INTO `base_area` VALUES ('410203', '410200', '顺河回族区', '0', '0', '410000-410200-410203-', '1');
INSERT INTO `base_area` VALUES ('410204', '410200', '鼓楼区', '0', '0', '410000-410200-410204-', '1');
INSERT INTO `base_area` VALUES ('410205', '410200', '南关区', '0', '0', '410000-410200-410205-', '1');
INSERT INTO `base_area` VALUES ('410211', '410200', '郊　区', '0', '0', '410000-410200-410211-', '1');
INSERT INTO `base_area` VALUES ('410221', '410200', '杞　县', '0', '0', '410000-410200-410221-', '1');
INSERT INTO `base_area` VALUES ('410222', '410200', '通许县', '0', '0', '410000-410200-410222-', '1');
INSERT INTO `base_area` VALUES ('410223', '410200', '尉氏县', '0', '0', '410000-410200-410223-', '1');
INSERT INTO `base_area` VALUES ('410224', '410200', '开封县', '0', '0', '410000-410200-410224-', '1');
INSERT INTO `base_area` VALUES ('410225', '410200', '兰考县', '0', '0', '410000-410200-410225-', '1');
INSERT INTO `base_area` VALUES ('410300', '410000', '洛阳市', '471000', '0379', '410000-410300-', '1');
INSERT INTO `base_area` VALUES ('410301', '410300', '市辖区', '0', '0', '410000-410300-410301-', '1');
INSERT INTO `base_area` VALUES ('410302', '410300', '老城区', '0', '0', '410000-410300-410302-', '1');
INSERT INTO `base_area` VALUES ('410303', '410300', '西工区', '0', '0', '410000-410300-410303-', '1');
INSERT INTO `base_area` VALUES ('410304', '410300', '廛河回族区', '0', '0', '410000-410300-410304-', '1');
INSERT INTO `base_area` VALUES ('410305', '410300', '涧西区', '0', '0', '410000-410300-410305-', '1');
INSERT INTO `base_area` VALUES ('410306', '410300', '吉利区', '0', '0', '410000-410300-410306-', '1');
INSERT INTO `base_area` VALUES ('410307', '410300', '洛龙区', '0', '0', '410000-410300-410307-', '1');
INSERT INTO `base_area` VALUES ('410322', '410300', '孟津县', '0', '0', '410000-410300-410322-', '1');
INSERT INTO `base_area` VALUES ('410323', '410300', '新安县', '0', '0', '410000-410300-410323-', '1');
INSERT INTO `base_area` VALUES ('410324', '410300', '栾川县', '0', '0', '410000-410300-410324-', '1');
INSERT INTO `base_area` VALUES ('410325', '410300', '嵩　县', '0', '0', '410000-410300-410325-', '1');
INSERT INTO `base_area` VALUES ('410326', '410300', '汝阳县', '0', '0', '410000-410300-410326-', '1');
INSERT INTO `base_area` VALUES ('410327', '410300', '宜阳县', '0', '0', '410000-410300-410327-', '1');
INSERT INTO `base_area` VALUES ('410328', '410300', '洛宁县', '0', '0', '410000-410300-410328-', '1');
INSERT INTO `base_area` VALUES ('410329', '410300', '伊川县', '0', '0', '410000-410300-410329-', '1');
INSERT INTO `base_area` VALUES ('410381', '410300', '偃师市', '0', '0', '410000-410300-410381-', '1');
INSERT INTO `base_area` VALUES ('410400', '410000', '平顶山市', '467000', '0375', '410000-410400-', '1');
INSERT INTO `base_area` VALUES ('410401', '410400', '市辖区', '0', '0', '410000-410400-410401-', '1');
INSERT INTO `base_area` VALUES ('410402', '410400', '新华区', '0', '0', '410000-410400-410402-', '1');
INSERT INTO `base_area` VALUES ('410403', '410400', '卫东区', '0', '0', '410000-410400-410403-', '1');
INSERT INTO `base_area` VALUES ('410404', '410400', '石龙区', '0', '0', '410000-410400-410404-', '1');
INSERT INTO `base_area` VALUES ('410411', '410400', '湛河区', '0', '0', '410000-410400-410411-', '1');
INSERT INTO `base_area` VALUES ('410421', '410400', '宝丰县', '0', '0', '410000-410400-410421-', '1');
INSERT INTO `base_area` VALUES ('410422', '410400', '叶　县', '0', '0', '410000-410400-410422-', '1');
INSERT INTO `base_area` VALUES ('410423', '410400', '鲁山县', '0', '0', '410000-410400-410423-', '1');
INSERT INTO `base_area` VALUES ('410425', '410400', '郏　县', '0', '0', '410000-410400-410425-', '1');
INSERT INTO `base_area` VALUES ('410481', '410400', '舞钢市', '0', '0', '410000-410400-410481-', '1');
INSERT INTO `base_area` VALUES ('410482', '410400', '汝州市', '0', '0', '410000-410400-410482-', '1');
INSERT INTO `base_area` VALUES ('410500', '410000', '安阳市', '455000', '0372', '410000-410500-', '1');
INSERT INTO `base_area` VALUES ('410501', '410500', '市辖区', '0', '0', '410000-410500-410501-', '1');
INSERT INTO `base_area` VALUES ('410502', '410500', '文峰区', '0', '0', '410000-410500-410502-', '1');
INSERT INTO `base_area` VALUES ('410503', '410500', '北关区', '0', '0', '410000-410500-410503-', '1');
INSERT INTO `base_area` VALUES ('410505', '410500', '殷都区', '0', '0', '410000-410500-410505-', '1');
INSERT INTO `base_area` VALUES ('410506', '410500', '龙安区', '0', '0', '410000-410500-410506-', '1');
INSERT INTO `base_area` VALUES ('410522', '410500', '安阳县', '0', '0', '410000-410500-410522-', '1');
INSERT INTO `base_area` VALUES ('410523', '410500', '汤阴县', '0', '0', '410000-410500-410523-', '1');
INSERT INTO `base_area` VALUES ('410526', '410500', '滑　县', '0', '0', '410000-410500-410526-', '1');
INSERT INTO `base_area` VALUES ('410527', '410500', '内黄县', '0', '0', '410000-410500-410527-', '1');
INSERT INTO `base_area` VALUES ('410581', '410500', '林州市', '0', '0', '410000-410500-410581-', '1');
INSERT INTO `base_area` VALUES ('410600', '410000', '鹤壁市', '456600', '0392', '410000-410600-', '1');
INSERT INTO `base_area` VALUES ('410601', '410600', '市辖区', '0', '0', '410000-410600-410601-', '1');
INSERT INTO `base_area` VALUES ('410602', '410600', '鹤山区', '0', '0', '410000-410600-410602-', '1');
INSERT INTO `base_area` VALUES ('410603', '410600', '山城区', '0', '0', '410000-410600-410603-', '1');
INSERT INTO `base_area` VALUES ('410611', '410600', '淇滨区', '0', '0', '410000-410600-410611-', '1');
INSERT INTO `base_area` VALUES ('410621', '410600', '浚　县', '0', '0', '410000-410600-410621-', '1');
INSERT INTO `base_area` VALUES ('410622', '410600', '淇　县', '0', '0', '410000-410600-410622-', '1');
INSERT INTO `base_area` VALUES ('410700', '410000', '新乡市', '453000', '0373', '410000-410700-', '1');
INSERT INTO `base_area` VALUES ('410701', '410700', '市辖区', '0', '0', '410000-410700-410701-', '1');
INSERT INTO `base_area` VALUES ('410702', '410700', '红旗区', '0', '0', '410000-410700-410702-', '1');
INSERT INTO `base_area` VALUES ('410703', '410700', '卫滨区', '0', '0', '410000-410700-410703-', '1');
INSERT INTO `base_area` VALUES ('410704', '410700', '凤泉区', '0', '0', '410000-410700-410704-', '1');
INSERT INTO `base_area` VALUES ('410711', '410700', '牧野区', '0', '0', '410000-410700-410711-', '1');
INSERT INTO `base_area` VALUES ('410721', '410700', '新乡县', '0', '0', '410000-410700-410721-', '1');
INSERT INTO `base_area` VALUES ('410724', '410700', '获嘉县', '0', '0', '410000-410700-410724-', '1');
INSERT INTO `base_area` VALUES ('410725', '410700', '原阳县', '0', '0', '410000-410700-410725-', '1');
INSERT INTO `base_area` VALUES ('410726', '410700', '延津县', '0', '0', '410000-410700-410726-', '1');
INSERT INTO `base_area` VALUES ('410727', '410700', '封丘县', '0', '0', '410000-410700-410727-', '1');
INSERT INTO `base_area` VALUES ('410728', '410700', '长垣县', '0', '0', '410000-410700-410728-', '1');
INSERT INTO `base_area` VALUES ('410781', '410700', '卫辉市', '0', '0', '410000-410700-410781-', '1');
INSERT INTO `base_area` VALUES ('410782', '410700', '辉县市', '0', '0', '410000-410700-410782-', '1');
INSERT INTO `base_area` VALUES ('410800', '410000', '焦作市', '454100', '0391', '410000-410800-', '1');
INSERT INTO `base_area` VALUES ('410801', '410800', '市辖区', '0', '0', '410000-410800-410801-', '1');
INSERT INTO `base_area` VALUES ('410802', '410800', '解放区', '0', '0', '410000-410800-410802-', '1');
INSERT INTO `base_area` VALUES ('410803', '410800', '中站区', '0', '0', '410000-410800-410803-', '1');
INSERT INTO `base_area` VALUES ('410804', '410800', '马村区', '0', '0', '410000-410800-410804-', '1');
INSERT INTO `base_area` VALUES ('410811', '410800', '山阳区', '0', '0', '410000-410800-410811-', '1');
INSERT INTO `base_area` VALUES ('410821', '410800', '修武县', '0', '0', '410000-410800-410821-', '1');
INSERT INTO `base_area` VALUES ('410822', '410800', '博爱县', '0', '0', '410000-410800-410822-', '1');
INSERT INTO `base_area` VALUES ('410823', '410800', '武陟县', '0', '0', '410000-410800-410823-', '1');
INSERT INTO `base_area` VALUES ('410825', '410800', '温　县', '0', '0', '410000-410800-410825-', '1');
INSERT INTO `base_area` VALUES ('410881', '410800', '济源市', '0', '0', '410000-410800-410881-', '1');
INSERT INTO `base_area` VALUES ('410882', '410800', '沁阳市', '0', '0', '410000-410800-410882-', '1');
INSERT INTO `base_area` VALUES ('410883', '410800', '孟州市', '0', '0', '410000-410800-410883-', '1');
INSERT INTO `base_area` VALUES ('410900', '410000', '濮阳市', '457000', '0393', '410000-410900-', '1');
INSERT INTO `base_area` VALUES ('410901', '410900', '市辖区', '0', '0', '410000-410900-410901-', '1');
INSERT INTO `base_area` VALUES ('410902', '410900', '华龙区', '0', '0', '410000-410900-410902-', '1');
INSERT INTO `base_area` VALUES ('410922', '410900', '清丰县', '0', '0', '410000-410900-410922-', '1');
INSERT INTO `base_area` VALUES ('410923', '410900', '南乐县', '0', '0', '410000-410900-410923-', '1');
INSERT INTO `base_area` VALUES ('410926', '410900', '范　县', '0', '0', '410000-410900-410926-', '1');
INSERT INTO `base_area` VALUES ('410927', '410900', '台前县', '0', '0', '410000-410900-410927-', '1');
INSERT INTO `base_area` VALUES ('410928', '410900', '濮阳县', '0', '0', '410000-410900-410928-', '1');
INSERT INTO `base_area` VALUES ('411000', '410000', '许昌市', '461000', '0374', '410000-411000-', '1');
INSERT INTO `base_area` VALUES ('411001', '411000', '市辖区', '0', '0', '410000-411000-411001-', '1');
INSERT INTO `base_area` VALUES ('411002', '411000', '魏都区', '0', '0', '410000-411000-411002-', '1');
INSERT INTO `base_area` VALUES ('411023', '411000', '许昌县', '0', '0', '410000-411000-411023-', '1');
INSERT INTO `base_area` VALUES ('411024', '411000', '鄢陵县', '0', '0', '410000-411000-411024-', '1');
INSERT INTO `base_area` VALUES ('411025', '411000', '襄城县', '0', '0', '410000-411000-411025-', '1');
INSERT INTO `base_area` VALUES ('411081', '411000', '禹州市', '0', '0', '410000-411000-411081-', '1');
INSERT INTO `base_area` VALUES ('411082', '411000', '长葛市', '0', '0', '410000-411000-411082-', '1');
INSERT INTO `base_area` VALUES ('411100', '410000', '漯河市', '462000', '0395', '410000-411100-', '1');
INSERT INTO `base_area` VALUES ('411101', '411100', '市辖区', '0', '0', '410000-411100-411101-', '1');
INSERT INTO `base_area` VALUES ('411102', '411100', '源汇区', '0', '0', '410000-411100-411102-', '1');
INSERT INTO `base_area` VALUES ('411103', '411100', '郾城区', '0', '0', '410000-411100-411103-', '1');
INSERT INTO `base_area` VALUES ('411104', '411100', '召陵区', '0', '0', '410000-411100-411104-', '1');
INSERT INTO `base_area` VALUES ('411121', '411100', '舞阳县', '0', '0', '410000-411100-411121-', '1');
INSERT INTO `base_area` VALUES ('411122', '411100', '临颍县', '0', '0', '410000-411100-411122-', '1');
INSERT INTO `base_area` VALUES ('411200', '410000', '三门峡市', '472000', '0398', '410000-411200-', '1');
INSERT INTO `base_area` VALUES ('411201', '411200', '市辖区', '0', '0', '410000-411200-411201-', '1');
INSERT INTO `base_area` VALUES ('411202', '411200', '湖滨区', '0', '0', '410000-411200-411202-', '1');
INSERT INTO `base_area` VALUES ('411221', '411200', '渑池县', '0', '0', '410000-411200-411221-', '1');
INSERT INTO `base_area` VALUES ('411222', '411200', '陕　县', '0', '0', '410000-411200-411222-', '1');
INSERT INTO `base_area` VALUES ('411224', '411200', '卢氏县', '0', '0', '410000-411200-411224-', '1');
INSERT INTO `base_area` VALUES ('411281', '411200', '义马市', '0', '0', '410000-411200-411281-', '1');
INSERT INTO `base_area` VALUES ('411282', '411200', '灵宝市', '0', '0', '410000-411200-411282-', '1');
INSERT INTO `base_area` VALUES ('411300', '410000', '南阳市', '473000', '0377', '410000-411300-', '1');
INSERT INTO `base_area` VALUES ('411301', '411300', '市辖区', '0', '0', '410000-411300-411301-', '1');
INSERT INTO `base_area` VALUES ('411302', '411300', '宛城区', '0', '0', '410000-411300-411302-', '1');
INSERT INTO `base_area` VALUES ('411303', '411300', '卧龙区', '0', '0', '410000-411300-411303-', '1');
INSERT INTO `base_area` VALUES ('411321', '411300', '南召县', '0', '0', '410000-411300-411321-', '1');
INSERT INTO `base_area` VALUES ('411322', '411300', '方城县', '0', '0', '410000-411300-411322-', '1');
INSERT INTO `base_area` VALUES ('411323', '411300', '西峡县', '0', '0', '410000-411300-411323-', '1');
INSERT INTO `base_area` VALUES ('411324', '411300', '镇平县', '0', '0', '410000-411300-411324-', '1');
INSERT INTO `base_area` VALUES ('411325', '411300', '内乡县', '0', '0', '410000-411300-411325-', '1');
INSERT INTO `base_area` VALUES ('411326', '411300', '淅川县', '0', '0', '410000-411300-411326-', '1');
INSERT INTO `base_area` VALUES ('411327', '411300', '社旗县', '0', '0', '410000-411300-411327-', '1');
INSERT INTO `base_area` VALUES ('411328', '411300', '唐河县', '0', '0', '410000-411300-411328-', '1');
INSERT INTO `base_area` VALUES ('411329', '411300', '新野县', '0', '0', '410000-411300-411329-', '1');
INSERT INTO `base_area` VALUES ('411330', '411300', '桐柏县', '0', '0', '410000-411300-411330-', '1');
INSERT INTO `base_area` VALUES ('411381', '411300', '邓州市', '0', '0', '410000-411300-411381-', '1');
INSERT INTO `base_area` VALUES ('411400', '410000', '商丘市', '476000', '0370', '410000-411400-', '1');
INSERT INTO `base_area` VALUES ('411401', '411400', '市辖区', '0', '0', '410000-411400-411401-', '1');
INSERT INTO `base_area` VALUES ('411402', '411400', '梁园区', '0', '0', '410000-411400-411402-', '1');
INSERT INTO `base_area` VALUES ('411403', '411400', '睢阳区', '0', '0', '410000-411400-411403-', '1');
INSERT INTO `base_area` VALUES ('411421', '411400', '民权县', '0', '0', '410000-411400-411421-', '1');
INSERT INTO `base_area` VALUES ('411422', '411400', '睢　县', '0', '0', '410000-411400-411422-', '1');
INSERT INTO `base_area` VALUES ('411423', '411400', '宁陵县', '0', '0', '410000-411400-411423-', '1');
INSERT INTO `base_area` VALUES ('411424', '411400', '柘城县', '0', '0', '410000-411400-411424-', '1');
INSERT INTO `base_area` VALUES ('411425', '411400', '虞城县', '0', '0', '410000-411400-411425-', '1');
INSERT INTO `base_area` VALUES ('411426', '411400', '夏邑县', '0', '0', '410000-411400-411426-', '1');
INSERT INTO `base_area` VALUES ('411481', '411400', '永城市', '0', '0', '410000-411400-411481-', '1');
INSERT INTO `base_area` VALUES ('411500', '410000', '信阳市', '464000', '0376', '410000-411500-', '1');
INSERT INTO `base_area` VALUES ('411501', '411500', '市辖区', '0', '0', '410000-411500-411501-', '1');
INSERT INTO `base_area` VALUES ('411502', '411500', '师河区', '0', '0', '410000-411500-411502-', '1');
INSERT INTO `base_area` VALUES ('411503', '411500', '平桥区', '0', '0', '410000-411500-411503-', '1');
INSERT INTO `base_area` VALUES ('411521', '411500', '罗山县', '0', '0', '410000-411500-411521-', '1');
INSERT INTO `base_area` VALUES ('411522', '411500', '光山县', '0', '0', '410000-411500-411522-', '1');
INSERT INTO `base_area` VALUES ('411523', '411500', '新　县', '0', '0', '410000-411500-411523-', '1');
INSERT INTO `base_area` VALUES ('411524', '411500', '商城县', '0', '0', '410000-411500-411524-', '1');
INSERT INTO `base_area` VALUES ('411525', '411500', '固始县', '0', '0', '410000-411500-411525-', '1');
INSERT INTO `base_area` VALUES ('411526', '411500', '潢川县', '0', '0', '410000-411500-411526-', '1');
INSERT INTO `base_area` VALUES ('411527', '411500', '淮滨县', '0', '0', '410000-411500-411527-', '1');
INSERT INTO `base_area` VALUES ('411528', '411500', '息　县', '0', '0', '410000-411500-411528-', '1');
INSERT INTO `base_area` VALUES ('411600', '410000', '周口市', '466000', '0394', '410000-411600-', '1');
INSERT INTO `base_area` VALUES ('411601', '411600', '市辖区', '0', '0', '410000-411600-411601-', '1');
INSERT INTO `base_area` VALUES ('411602', '411600', '川汇区', '0', '0', '410000-411600-411602-', '1');
INSERT INTO `base_area` VALUES ('411621', '411600', '扶沟县', '0', '0', '410000-411600-411621-', '1');
INSERT INTO `base_area` VALUES ('411622', '411600', '西华县', '0', '0', '410000-411600-411622-', '1');
INSERT INTO `base_area` VALUES ('411623', '411600', '商水县', '0', '0', '410000-411600-411623-', '1');
INSERT INTO `base_area` VALUES ('411624', '411600', '沈丘县', '0', '0', '410000-411600-411624-', '1');
INSERT INTO `base_area` VALUES ('411625', '411600', '郸城县', '0', '0', '410000-411600-411625-', '1');
INSERT INTO `base_area` VALUES ('411626', '411600', '淮阳县', '0', '0', '410000-411600-411626-', '1');
INSERT INTO `base_area` VALUES ('411627', '411600', '太康县', '0', '0', '410000-411600-411627-', '1');
INSERT INTO `base_area` VALUES ('411628', '411600', '鹿邑县', '0', '0', '410000-411600-411628-', '1');
INSERT INTO `base_area` VALUES ('411681', '411600', '项城市', '0', '0', '410000-411600-411681-', '1');
INSERT INTO `base_area` VALUES ('411700', '410000', '驻马店市', '463000', '0396', '410000-411700-', '1');
INSERT INTO `base_area` VALUES ('411701', '411700', '市辖区', '0', '0', '410000-411700-411701-', '1');
INSERT INTO `base_area` VALUES ('411702', '411700', '驿城区', '0', '0', '410000-411700-411702-', '1');
INSERT INTO `base_area` VALUES ('411721', '411700', '西平县', '0', '0', '410000-411700-411721-', '1');
INSERT INTO `base_area` VALUES ('411722', '411700', '上蔡县', '0', '0', '410000-411700-411722-', '1');
INSERT INTO `base_area` VALUES ('411723', '411700', '平舆县', '0', '0', '410000-411700-411723-', '1');
INSERT INTO `base_area` VALUES ('411724', '411700', '正阳县', '0', '0', '410000-411700-411724-', '1');
INSERT INTO `base_area` VALUES ('411725', '411700', '确山县', '0', '0', '410000-411700-411725-', '1');
INSERT INTO `base_area` VALUES ('411726', '411700', '泌阳县', '0', '0', '410000-411700-411726-', '1');
INSERT INTO `base_area` VALUES ('411727', '411700', '汝南县', '0', '0', '410000-411700-411727-', '1');
INSERT INTO `base_area` VALUES ('411728', '411700', '遂平县', '0', '0', '410000-411700-411728-', '1');
INSERT INTO `base_area` VALUES ('411729', '411700', '新蔡县', '0', '0', '410000-411700-411729-', '1');
INSERT INTO `base_area` VALUES ('419001', '410000', '济源市', '454650', '0391', '410000-419001-', '1');
INSERT INTO `base_area` VALUES ('420000', '0', '湖北省', '0', '0', '420000-', '1');
INSERT INTO `base_area` VALUES ('420100', '420000', '武汉市', '430000', '027', '420000-420100-', '1');
INSERT INTO `base_area` VALUES ('420101', '420100', '市辖区', '0', '0', '420000-420100-420101-', '1');
INSERT INTO `base_area` VALUES ('420102', '420100', '江岸区', '0', '0', '420000-420100-420102-', '1');
INSERT INTO `base_area` VALUES ('420103', '420100', '江汉区', '0', '0', '420000-420100-420103-', '1');
INSERT INTO `base_area` VALUES ('420104', '420100', '乔口区', '0', '0', '420000-420100-420104-', '1');
INSERT INTO `base_area` VALUES ('420105', '420100', '汉阳区', '0', '0', '420000-420100-420105-', '1');
INSERT INTO `base_area` VALUES ('420106', '420100', '武昌区', '0', '0', '420000-420100-420106-', '1');
INSERT INTO `base_area` VALUES ('420107', '420100', '青山区', '0', '0', '420000-420100-420107-', '1');
INSERT INTO `base_area` VALUES ('420111', '420100', '洪山区', '0', '0', '420000-420100-420111-', '1');
INSERT INTO `base_area` VALUES ('420112', '420100', '东西湖区', '0', '0', '420000-420100-420112-', '1');
INSERT INTO `base_area` VALUES ('420113', '420100', '汉南区', '0', '0', '420000-420100-420113-', '1');
INSERT INTO `base_area` VALUES ('420114', '420100', '蔡甸区', '0', '0', '420000-420100-420114-', '1');
INSERT INTO `base_area` VALUES ('420115', '420100', '江夏区', '0', '0', '420000-420100-420115-', '1');
INSERT INTO `base_area` VALUES ('420116', '420100', '黄陂区', '0', '0', '420000-420100-420116-', '1');
INSERT INTO `base_area` VALUES ('420117', '420100', '新洲区', '0', '0', '420000-420100-420117-', '1');
INSERT INTO `base_area` VALUES ('420200', '420000', '黄石市', '435000', '0714', '420000-420200-', '1');
INSERT INTO `base_area` VALUES ('420201', '420200', '市辖区', '0', '0', '420000-420200-420201-', '1');
INSERT INTO `base_area` VALUES ('420202', '420200', '黄石港区', '0', '0', '420000-420200-420202-', '1');
INSERT INTO `base_area` VALUES ('420203', '420200', '西塞山区', '0', '0', '420000-420200-420203-', '1');
INSERT INTO `base_area` VALUES ('420204', '420200', '下陆区', '0', '0', '420000-420200-420204-', '1');
INSERT INTO `base_area` VALUES ('420205', '420200', '铁山区', '0', '0', '420000-420200-420205-', '1');
INSERT INTO `base_area` VALUES ('420222', '420200', '阳新县', '0', '0', '420000-420200-420222-', '1');
INSERT INTO `base_area` VALUES ('420281', '420200', '大冶市', '0', '0', '420000-420200-420281-', '1');
INSERT INTO `base_area` VALUES ('420300', '420000', '十堰市', '442000', '0719', '420000-420300-', '1');
INSERT INTO `base_area` VALUES ('420301', '420300', '市辖区', '0', '0', '420000-420300-420301-', '1');
INSERT INTO `base_area` VALUES ('420302', '420300', '茅箭区', '0', '0', '420000-420300-420302-', '1');
INSERT INTO `base_area` VALUES ('420303', '420300', '张湾区', '0', '0', '420000-420300-420303-', '1');
INSERT INTO `base_area` VALUES ('420321', '420300', '郧　县', '0', '0', '420000-420300-420321-', '1');
INSERT INTO `base_area` VALUES ('420322', '420300', '郧西县', '0', '0', '420000-420300-420322-', '1');
INSERT INTO `base_area` VALUES ('420323', '420300', '竹山县', '0', '0', '420000-420300-420323-', '1');
INSERT INTO `base_area` VALUES ('420324', '420300', '竹溪县', '0', '0', '420000-420300-420324-', '1');
INSERT INTO `base_area` VALUES ('420325', '420300', '房　县', '0', '0', '420000-420300-420325-', '1');
INSERT INTO `base_area` VALUES ('420381', '420300', '丹江口市', '0', '0', '420000-420300-420381-', '1');
INSERT INTO `base_area` VALUES ('420500', '420000', '宜昌市', '443000', '0717', '420000-420500-', '1');
INSERT INTO `base_area` VALUES ('420501', '420500', '市辖区', '0', '0', '420000-420500-420501-', '1');
INSERT INTO `base_area` VALUES ('420502', '420500', '西陵区', '0', '0', '420000-420500-420502-', '1');
INSERT INTO `base_area` VALUES ('420503', '420500', '伍家岗区', '0', '0', '420000-420500-420503-', '1');
INSERT INTO `base_area` VALUES ('420504', '420500', '点军区', '0', '0', '420000-420500-420504-', '1');
INSERT INTO `base_area` VALUES ('420505', '420500', '猇亭区', '0', '0', '420000-420500-420505-', '1');
INSERT INTO `base_area` VALUES ('420506', '420500', '夷陵区', '0', '0', '420000-420500-420506-', '1');
INSERT INTO `base_area` VALUES ('420525', '420500', '远安县', '0', '0', '420000-420500-420525-', '1');
INSERT INTO `base_area` VALUES ('420526', '420500', '兴山县', '0', '0', '420000-420500-420526-', '1');
INSERT INTO `base_area` VALUES ('420527', '420500', '秭归县', '0', '0', '420000-420500-420527-', '1');
INSERT INTO `base_area` VALUES ('420528', '420500', '长阳土家族自治县', '0', '0', '420000-420500-420528-', '1');
INSERT INTO `base_area` VALUES ('420529', '420500', '五峰土家族自治县', '0', '0', '420000-420500-420529-', '1');
INSERT INTO `base_area` VALUES ('420581', '420500', '宜都市', '0', '0', '420000-420500-420581-', '1');
INSERT INTO `base_area` VALUES ('420582', '420500', '当阳市', '0', '0', '420000-420500-420582-', '1');
INSERT INTO `base_area` VALUES ('420583', '420500', '枝江市', '0', '0', '420000-420500-420583-', '1');
INSERT INTO `base_area` VALUES ('420600', '420000', '襄樊市', '441000', '0710', '420000-420600-', '1');
INSERT INTO `base_area` VALUES ('420601', '420600', '市辖区', '0', '0', '420000-420600-420601-', '1');
INSERT INTO `base_area` VALUES ('420602', '420600', '襄城区', '0', '0', '420000-420600-420602-', '1');
INSERT INTO `base_area` VALUES ('420606', '420600', '樊城区', '0', '0', '420000-420600-420606-', '1');
INSERT INTO `base_area` VALUES ('420607', '420600', '襄阳区', '0', '0', '420000-420600-420607-', '1');
INSERT INTO `base_area` VALUES ('420624', '420600', '南漳县', '0', '0', '420000-420600-420624-', '1');
INSERT INTO `base_area` VALUES ('420625', '420600', '谷城县', '0', '0', '420000-420600-420625-', '1');
INSERT INTO `base_area` VALUES ('420626', '420600', '保康县', '0', '0', '420000-420600-420626-', '1');
INSERT INTO `base_area` VALUES ('420682', '420600', '老河口市', '0', '0', '420000-420600-420682-', '1');
INSERT INTO `base_area` VALUES ('420683', '420600', '枣阳市', '0', '0', '420000-420600-420683-', '1');
INSERT INTO `base_area` VALUES ('420684', '420600', '宜城市', '0', '0', '420000-420600-420684-', '1');
INSERT INTO `base_area` VALUES ('420700', '420000', '鄂州市', '436000', '0711', '420000-420700-', '1');
INSERT INTO `base_area` VALUES ('420701', '420700', '市辖区', '0', '0', '420000-420700-420701-', '1');
INSERT INTO `base_area` VALUES ('420702', '420700', '梁子湖区', '0', '0', '420000-420700-420702-', '1');
INSERT INTO `base_area` VALUES ('420703', '420700', '华容区', '0', '0', '420000-420700-420703-', '1');
INSERT INTO `base_area` VALUES ('420704', '420700', '鄂城区', '0', '0', '420000-420700-420704-', '1');
INSERT INTO `base_area` VALUES ('420800', '420000', '荆门市', '448000', '0724', '420000-420800-', '1');
INSERT INTO `base_area` VALUES ('420801', '420800', '市辖区', '0', '0', '420000-420800-420801-', '1');
INSERT INTO `base_area` VALUES ('420802', '420800', '东宝区', '0', '0', '420000-420800-420802-', '1');
INSERT INTO `base_area` VALUES ('420804', '420800', '掇刀区', '0', '0', '420000-420800-420804-', '1');
INSERT INTO `base_area` VALUES ('420821', '420800', '京山县', '0', '0', '420000-420800-420821-', '1');
INSERT INTO `base_area` VALUES ('420822', '420800', '沙洋县', '0', '0', '420000-420800-420822-', '1');
INSERT INTO `base_area` VALUES ('420881', '420800', '钟祥市', '0', '0', '420000-420800-420881-', '1');
INSERT INTO `base_area` VALUES ('420900', '420000', '孝感市', '432000', '0712', '420000-420900-', '1');
INSERT INTO `base_area` VALUES ('420901', '420900', '市辖区', '0', '0', '420000-420900-420901-', '1');
INSERT INTO `base_area` VALUES ('420902', '420900', '孝南区', '0', '0', '420000-420900-420902-', '1');
INSERT INTO `base_area` VALUES ('420921', '420900', '孝昌县', '0', '0', '420000-420900-420921-', '1');
INSERT INTO `base_area` VALUES ('420922', '420900', '大悟县', '0', '0', '420000-420900-420922-', '1');
INSERT INTO `base_area` VALUES ('420923', '420900', '云梦县', '0', '0', '420000-420900-420923-', '1');
INSERT INTO `base_area` VALUES ('420981', '420900', '应城市', '0', '0', '420000-420900-420981-', '1');
INSERT INTO `base_area` VALUES ('420982', '420900', '安陆市', '0', '0', '420000-420900-420982-', '1');
INSERT INTO `base_area` VALUES ('420984', '420900', '汉川市', '0', '0', '420000-420900-420984-', '1');
INSERT INTO `base_area` VALUES ('421000', '420000', '荆州市', '434000', '0716', '420000-421000-', '1');
INSERT INTO `base_area` VALUES ('421001', '421000', '市辖区', '0', '0', '420000-421000-421001-', '1');
INSERT INTO `base_area` VALUES ('421002', '421000', '沙市区', '0', '0', '420000-421000-421002-', '1');
INSERT INTO `base_area` VALUES ('421003', '421000', '荆州区', '0', '0', '420000-421000-421003-', '1');
INSERT INTO `base_area` VALUES ('421022', '421000', '公安县', '0', '0', '420000-421000-421022-', '1');
INSERT INTO `base_area` VALUES ('421023', '421000', '监利县', '0', '0', '420000-421000-421023-', '1');
INSERT INTO `base_area` VALUES ('421024', '421000', '江陵县', '0', '0', '420000-421000-421024-', '1');
INSERT INTO `base_area` VALUES ('421081', '421000', '石首市', '0', '0', '420000-421000-421081-', '1');
INSERT INTO `base_area` VALUES ('421083', '421000', '洪湖市', '0', '0', '420000-421000-421083-', '1');
INSERT INTO `base_area` VALUES ('421087', '421000', '松滋市', '0', '0', '420000-421000-421087-', '1');
INSERT INTO `base_area` VALUES ('421100', '420000', '黄冈市', '438000', '0713', '420000-421100-', '1');
INSERT INTO `base_area` VALUES ('421101', '421100', '市辖区', '0', '0', '420000-421100-421101-', '1');
INSERT INTO `base_area` VALUES ('421102', '421100', '黄州区', '0', '0', '420000-421100-421102-', '1');
INSERT INTO `base_area` VALUES ('421121', '421100', '团风县', '0', '0', '420000-421100-421121-', '1');
INSERT INTO `base_area` VALUES ('421122', '421100', '红安县', '0', '0', '420000-421100-421122-', '1');
INSERT INTO `base_area` VALUES ('421123', '421100', '罗田县', '0', '0', '420000-421100-421123-', '1');
INSERT INTO `base_area` VALUES ('421124', '421100', '英山县', '0', '0', '420000-421100-421124-', '1');
INSERT INTO `base_area` VALUES ('421125', '421100', '浠水县', '0', '0', '420000-421100-421125-', '1');
INSERT INTO `base_area` VALUES ('421126', '421100', '蕲春县', '0', '0', '420000-421100-421126-', '1');
INSERT INTO `base_area` VALUES ('421127', '421100', '黄梅县', '0', '0', '420000-421100-421127-', '1');
INSERT INTO `base_area` VALUES ('421181', '421100', '麻城市', '0', '0', '420000-421100-421181-', '1');
INSERT INTO `base_area` VALUES ('421182', '421100', '武穴市', '0', '0', '420000-421100-421182-', '1');
INSERT INTO `base_area` VALUES ('421200', '420000', '咸宁市', '437000', '0715', '420000-421200-', '1');
INSERT INTO `base_area` VALUES ('421201', '421200', '市辖区', '0', '0', '420000-421200-421201-', '1');
INSERT INTO `base_area` VALUES ('421202', '421200', '咸安区', '0', '0', '420000-421200-421202-', '1');
INSERT INTO `base_area` VALUES ('421221', '421200', '嘉鱼县', '0', '0', '420000-421200-421221-', '1');
INSERT INTO `base_area` VALUES ('421222', '421200', '通城县', '0', '0', '420000-421200-421222-', '1');
INSERT INTO `base_area` VALUES ('421223', '421200', '崇阳县', '0', '0', '420000-421200-421223-', '1');
INSERT INTO `base_area` VALUES ('421224', '421200', '通山县', '0', '0', '420000-421200-421224-', '1');
INSERT INTO `base_area` VALUES ('421281', '421200', '赤壁市', '0', '0', '420000-421200-421281-', '1');
INSERT INTO `base_area` VALUES ('421300', '420000', '随州市', '441300', '0722', '420000-421300-', '1');
INSERT INTO `base_area` VALUES ('421301', '421300', '市辖区', '0', '0', '420000-421300-421301-', '1');
INSERT INTO `base_area` VALUES ('421302', '421300', '曾都区', '0', '0', '420000-421300-421302-', '1');
INSERT INTO `base_area` VALUES ('421381', '421300', '广水市', '0', '0', '420000-421300-421381-', '1');
INSERT INTO `base_area` VALUES ('422800', '420000', '恩施州', '445000', '0718', '420000-422800-', '1');
INSERT INTO `base_area` VALUES ('422801', '422800', '恩施市', '0', '0', '420000-422800-422801-', '1');
INSERT INTO `base_area` VALUES ('422802', '422800', '利川市', '0', '0', '420000-422800-422802-', '1');
INSERT INTO `base_area` VALUES ('422822', '422800', '建始县', '0', '0', '420000-422800-422822-', '1');
INSERT INTO `base_area` VALUES ('422823', '422800', '巴东县', '0', '0', '420000-422800-422823-', '1');
INSERT INTO `base_area` VALUES ('422825', '422800', '宣恩县', '0', '0', '420000-422800-422825-', '1');
INSERT INTO `base_area` VALUES ('422826', '422800', '咸丰县', '0', '0', '420000-422800-422826-', '1');
INSERT INTO `base_area` VALUES ('422827', '422800', '来凤县', '0', '0', '420000-422800-422827-', '1');
INSERT INTO `base_area` VALUES ('422828', '422800', '鹤峰县', '0', '0', '420000-422800-422828-', '1');
INSERT INTO `base_area` VALUES ('429000', '420000', '省直辖行政单位', '0', '0', '420000-429000-', '1');
INSERT INTO `base_area` VALUES ('429004', '429000', '仙桃市', '433000', '0728', '420000-429000-429004-', '1');
INSERT INTO `base_area` VALUES ('429005', '429000', '潜江市', '433100', '0728', '420000-429000-429005-', '1');
INSERT INTO `base_area` VALUES ('429006', '429000', '天门市', '431700', '0728', '420000-429000-429006-', '1');
INSERT INTO `base_area` VALUES ('429021', '429000', '神农架林区', '442400', '0719', '420000-429000-429021-', '1');
INSERT INTO `base_area` VALUES ('430000', '0', '湖南省', '0', '0', '430000-', '1');
INSERT INTO `base_area` VALUES ('430100', '430000', '长沙市', '410000', '0731', '430000-430100-', '1');
INSERT INTO `base_area` VALUES ('430101', '430100', '市辖区', '0', '0', '430000-430100-430101-', '1');
INSERT INTO `base_area` VALUES ('430102', '430100', '芙蓉区', '0', '0', '430000-430100-430102-', '1');
INSERT INTO `base_area` VALUES ('430103', '430100', '天心区', '0', '0', '430000-430100-430103-', '1');
INSERT INTO `base_area` VALUES ('430104', '430100', '岳麓区', '0', '0', '430000-430100-430104-', '1');
INSERT INTO `base_area` VALUES ('430105', '430100', '开福区', '0', '0', '430000-430100-430105-', '1');
INSERT INTO `base_area` VALUES ('430111', '430100', '雨花区', '0', '0', '430000-430100-430111-', '1');
INSERT INTO `base_area` VALUES ('430121', '430100', '长沙县', '0', '0', '430000-430100-430121-', '1');
INSERT INTO `base_area` VALUES ('430122', '430100', '望城县', '0', '0', '430000-430100-430122-', '1');
INSERT INTO `base_area` VALUES ('430124', '430100', '宁乡县', '0', '0', '430000-430100-430124-', '1');
INSERT INTO `base_area` VALUES ('430181', '430100', '浏阳市', '0', '0', '430000-430100-430181-', '1');
INSERT INTO `base_area` VALUES ('430200', '430000', '株洲市', '412000', '0731', '430000-430200-', '1');
INSERT INTO `base_area` VALUES ('430201', '430200', '市辖区', '0', '0', '430000-430200-430201-', '1');
INSERT INTO `base_area` VALUES ('430202', '430200', '荷塘区', '0', '0', '430000-430200-430202-', '1');
INSERT INTO `base_area` VALUES ('430203', '430200', '芦淞区', '0', '0', '430000-430200-430203-', '1');
INSERT INTO `base_area` VALUES ('430204', '430200', '石峰区', '0', '0', '430000-430200-430204-', '1');
INSERT INTO `base_area` VALUES ('430211', '430200', '天元区', '0', '0', '430000-430200-430211-', '1');
INSERT INTO `base_area` VALUES ('430221', '430200', '株洲县', '0', '0', '430000-430200-430221-', '1');
INSERT INTO `base_area` VALUES ('430223', '430200', '攸　县', '0', '0', '430000-430200-430223-', '1');
INSERT INTO `base_area` VALUES ('430224', '430200', '茶陵县', '0', '0', '430000-430200-430224-', '1');
INSERT INTO `base_area` VALUES ('430225', '430200', '炎陵县', '0', '0', '430000-430200-430225-', '1');
INSERT INTO `base_area` VALUES ('430281', '430200', '醴陵市', '0', '0', '430000-430200-430281-', '1');
INSERT INTO `base_area` VALUES ('430300', '430000', '湘潭市', '411100', '0731', '430000-430300-', '1');
INSERT INTO `base_area` VALUES ('430301', '430300', '市辖区', '0', '0', '430000-430300-430301-', '1');
INSERT INTO `base_area` VALUES ('430302', '430300', '雨湖区', '0', '0', '430000-430300-430302-', '1');
INSERT INTO `base_area` VALUES ('430304', '430300', '岳塘区', '0', '0', '430000-430300-430304-', '1');
INSERT INTO `base_area` VALUES ('430321', '430300', '湘潭县', '0', '0', '430000-430300-430321-', '1');
INSERT INTO `base_area` VALUES ('430381', '430300', '湘乡市', '0', '0', '430000-430300-430381-', '1');
INSERT INTO `base_area` VALUES ('430382', '430300', '韶山市', '0', '0', '430000-430300-430382-', '1');
INSERT INTO `base_area` VALUES ('430400', '430000', '衡阳市', '421000', '0734', '430000-430400-', '1');
INSERT INTO `base_area` VALUES ('430401', '430400', '市辖区', '0', '0', '430000-430400-430401-', '1');
INSERT INTO `base_area` VALUES ('430405', '430400', '珠晖区', '0', '0', '430000-430400-430405-', '1');
INSERT INTO `base_area` VALUES ('430406', '430400', '雁峰区', '0', '0', '430000-430400-430406-', '1');
INSERT INTO `base_area` VALUES ('430407', '430400', '石鼓区', '0', '0', '430000-430400-430407-', '1');
INSERT INTO `base_area` VALUES ('430408', '430400', '蒸湘区', '0', '0', '430000-430400-430408-', '1');
INSERT INTO `base_area` VALUES ('430412', '430400', '南岳区', '0', '0', '430000-430400-430412-', '1');
INSERT INTO `base_area` VALUES ('430421', '430400', '衡阳县', '0', '0', '430000-430400-430421-', '1');
INSERT INTO `base_area` VALUES ('430422', '430400', '衡南县', '0', '0', '430000-430400-430422-', '1');
INSERT INTO `base_area` VALUES ('430423', '430400', '衡山县', '0', '0', '430000-430400-430423-', '1');
INSERT INTO `base_area` VALUES ('430424', '430400', '衡东县', '0', '0', '430000-430400-430424-', '1');
INSERT INTO `base_area` VALUES ('430426', '430400', '祁东县', '0', '0', '430000-430400-430426-', '1');
INSERT INTO `base_area` VALUES ('430481', '430400', '耒阳市', '0', '0', '430000-430400-430481-', '1');
INSERT INTO `base_area` VALUES ('430482', '430400', '常宁市', '0', '0', '430000-430400-430482-', '1');
INSERT INTO `base_area` VALUES ('430500', '430000', '邵阳市', '422000', '0739', '430000-430500-', '1');
INSERT INTO `base_area` VALUES ('430501', '430500', '市辖区', '0', '0', '430000-430500-430501-', '1');
INSERT INTO `base_area` VALUES ('430502', '430500', '双清区', '0', '0', '430000-430500-430502-', '1');
INSERT INTO `base_area` VALUES ('430503', '430500', '大祥区', '0', '0', '430000-430500-430503-', '1');
INSERT INTO `base_area` VALUES ('430511', '430500', '北塔区', '0', '0', '430000-430500-430511-', '1');
INSERT INTO `base_area` VALUES ('430521', '430500', '邵东县', '0', '0', '430000-430500-430521-', '1');
INSERT INTO `base_area` VALUES ('430522', '430500', '新邵县', '0', '0', '430000-430500-430522-', '1');
INSERT INTO `base_area` VALUES ('430523', '430500', '邵阳县', '0', '0', '430000-430500-430523-', '1');
INSERT INTO `base_area` VALUES ('430524', '430500', '隆回县', '0', '0', '430000-430500-430524-', '1');
INSERT INTO `base_area` VALUES ('430525', '430500', '洞口县', '0', '0', '430000-430500-430525-', '1');
INSERT INTO `base_area` VALUES ('430527', '430500', '绥宁县', '0', '0', '430000-430500-430527-', '1');
INSERT INTO `base_area` VALUES ('430528', '430500', '新宁县', '0', '0', '430000-430500-430528-', '1');
INSERT INTO `base_area` VALUES ('430529', '430500', '城步苗族自治县', '0', '0', '430000-430500-430529-', '1');
INSERT INTO `base_area` VALUES ('430581', '430500', '武冈市', '0', '0', '430000-430500-430581-', '1');
INSERT INTO `base_area` VALUES ('430600', '430000', '岳阳市', '414000', '0730', '430000-430600-', '1');
INSERT INTO `base_area` VALUES ('430601', '430600', '市辖区', '0', '0', '430000-430600-430601-', '1');
INSERT INTO `base_area` VALUES ('430602', '430600', '岳阳楼区', '0', '0', '430000-430600-430602-', '1');
INSERT INTO `base_area` VALUES ('430603', '430600', '云溪区', '0', '0', '430000-430600-430603-', '1');
INSERT INTO `base_area` VALUES ('430611', '430600', '君山区', '0', '0', '430000-430600-430611-', '1');
INSERT INTO `base_area` VALUES ('430621', '430600', '岳阳县', '0', '0', '430000-430600-430621-', '1');
INSERT INTO `base_area` VALUES ('430623', '430600', '华容县', '0', '0', '430000-430600-430623-', '1');
INSERT INTO `base_area` VALUES ('430624', '430600', '湘阴县', '0', '0', '430000-430600-430624-', '1');
INSERT INTO `base_area` VALUES ('430626', '430600', '平江县', '0', '0', '430000-430600-430626-', '1');
INSERT INTO `base_area` VALUES ('430681', '430600', '汨罗市', '0', '0', '430000-430600-430681-', '1');
INSERT INTO `base_area` VALUES ('430682', '430600', '临湘市', '0', '0', '430000-430600-430682-', '1');
INSERT INTO `base_area` VALUES ('430700', '430000', '常德市', '415000', '0736', '430000-430700-', '1');
INSERT INTO `base_area` VALUES ('430701', '430700', '市辖区', '0', '0', '430000-430700-430701-', '1');
INSERT INTO `base_area` VALUES ('430702', '430700', '武陵区', '0', '0', '430000-430700-430702-', '1');
INSERT INTO `base_area` VALUES ('430703', '430700', '鼎城区', '0', '0', '430000-430700-430703-', '1');
INSERT INTO `base_area` VALUES ('430721', '430700', '安乡县', '0', '0', '430000-430700-430721-', '1');
INSERT INTO `base_area` VALUES ('430722', '430700', '汉寿县', '0', '0', '430000-430700-430722-', '1');
INSERT INTO `base_area` VALUES ('430723', '430700', '澧　县', '0', '0', '430000-430700-430723-', '1');
INSERT INTO `base_area` VALUES ('430724', '430700', '临澧县', '0', '0', '430000-430700-430724-', '1');
INSERT INTO `base_area` VALUES ('430725', '430700', '桃源县', '0', '0', '430000-430700-430725-', '1');
INSERT INTO `base_area` VALUES ('430726', '430700', '石门县', '0', '0', '430000-430700-430726-', '1');
INSERT INTO `base_area` VALUES ('430781', '430700', '津市市', '0', '0', '430000-430700-430781-', '1');
INSERT INTO `base_area` VALUES ('430800', '430000', '张家界市', '427000', '0744', '430000-430800-', '1');
INSERT INTO `base_area` VALUES ('430801', '430800', '市辖区', '0', '0', '430000-430800-430801-', '1');
INSERT INTO `base_area` VALUES ('430802', '430800', '永定区', '0', '0', '430000-430800-430802-', '1');
INSERT INTO `base_area` VALUES ('430811', '430800', '武陵源区', '0', '0', '430000-430800-430811-', '1');
INSERT INTO `base_area` VALUES ('430821', '430800', '慈利县', '0', '0', '430000-430800-430821-', '1');
INSERT INTO `base_area` VALUES ('430822', '430800', '桑植县', '0', '0', '430000-430800-430822-', '1');
INSERT INTO `base_area` VALUES ('430900', '430000', '益阳市', '413000', '0737', '430000-430900-', '1');
INSERT INTO `base_area` VALUES ('430901', '430900', '市辖区', '0', '0', '430000-430900-430901-', '1');
INSERT INTO `base_area` VALUES ('430902', '430900', '资阳区', '0', '0', '430000-430900-430902-', '1');
INSERT INTO `base_area` VALUES ('430903', '430900', '赫山区', '0', '0', '430000-430900-430903-', '1');
INSERT INTO `base_area` VALUES ('430921', '430900', '南　县', '0', '0', '430000-430900-430921-', '1');
INSERT INTO `base_area` VALUES ('430922', '430900', '桃江县', '0', '0', '430000-430900-430922-', '1');
INSERT INTO `base_area` VALUES ('430923', '430900', '安化县', '0', '0', '430000-430900-430923-', '1');
INSERT INTO `base_area` VALUES ('430981', '430900', '沅江市', '0', '0', '430000-430900-430981-', '1');
INSERT INTO `base_area` VALUES ('431000', '430000', '郴州市', '423000', '0735', '430000-431000-', '1');
INSERT INTO `base_area` VALUES ('431001', '431000', '市辖区', '0', '0', '430000-431000-431001-', '1');
INSERT INTO `base_area` VALUES ('431002', '431000', '北湖区', '0', '0', '430000-431000-431002-', '1');
INSERT INTO `base_area` VALUES ('431003', '431000', '苏仙区', '0', '0', '430000-431000-431003-', '1');
INSERT INTO `base_area` VALUES ('431021', '431000', '桂阳县', '0', '0', '430000-431000-431021-', '1');
INSERT INTO `base_area` VALUES ('431022', '431000', '宜章县', '0', '0', '430000-431000-431022-', '1');
INSERT INTO `base_area` VALUES ('431023', '431000', '永兴县', '0', '0', '430000-431000-431023-', '1');
INSERT INTO `base_area` VALUES ('431024', '431000', '嘉禾县', '0', '0', '430000-431000-431024-', '1');
INSERT INTO `base_area` VALUES ('431025', '431000', '临武县', '0', '0', '430000-431000-431025-', '1');
INSERT INTO `base_area` VALUES ('431026', '431000', '汝城县', '0', '0', '430000-431000-431026-', '1');
INSERT INTO `base_area` VALUES ('431027', '431000', '桂东县', '0', '0', '430000-431000-431027-', '1');
INSERT INTO `base_area` VALUES ('431028', '431000', '安仁县', '0', '0', '430000-431000-431028-', '1');
INSERT INTO `base_area` VALUES ('431081', '431000', '资兴市', '0', '0', '430000-431000-431081-', '1');
INSERT INTO `base_area` VALUES ('431100', '430000', '永州市', '425000', '0746', '430000-431100-', '1');
INSERT INTO `base_area` VALUES ('431101', '431100', '市辖区', '0', '0', '430000-431100-431101-', '1');
INSERT INTO `base_area` VALUES ('431102', '431100', '芝山区', '0', '0', '430000-431100-431102-', '1');
INSERT INTO `base_area` VALUES ('431103', '431100', '冷水滩区', '0', '0', '430000-431100-431103-', '1');
INSERT INTO `base_area` VALUES ('431121', '431100', '祁阳县', '0', '0', '430000-431100-431121-', '1');
INSERT INTO `base_area` VALUES ('431122', '431100', '东安县', '0', '0', '430000-431100-431122-', '1');
INSERT INTO `base_area` VALUES ('431123', '431100', '双牌县', '0', '0', '430000-431100-431123-', '1');
INSERT INTO `base_area` VALUES ('431124', '431100', '道　县', '0', '0', '430000-431100-431124-', '1');
INSERT INTO `base_area` VALUES ('431125', '431100', '江永县', '0', '0', '430000-431100-431125-', '1');
INSERT INTO `base_area` VALUES ('431126', '431100', '宁远县', '0', '0', '430000-431100-431126-', '1');
INSERT INTO `base_area` VALUES ('431127', '431100', '蓝山县', '0', '0', '430000-431100-431127-', '1');
INSERT INTO `base_area` VALUES ('431128', '431100', '新田县', '0', '0', '430000-431100-431128-', '1');
INSERT INTO `base_area` VALUES ('431129', '431100', '江华瑶族自治县', '0', '0', '430000-431100-431129-', '1');
INSERT INTO `base_area` VALUES ('431200', '430000', '怀化市', '418000', '0745', '430000-431200-', '1');
INSERT INTO `base_area` VALUES ('431201', '431200', '市辖区', '0', '0', '430000-431200-431201-', '1');
INSERT INTO `base_area` VALUES ('431202', '431200', '鹤城区', '0', '0', '430000-431200-431202-', '1');
INSERT INTO `base_area` VALUES ('431221', '431200', '中方县', '0', '0', '430000-431200-431221-', '1');
INSERT INTO `base_area` VALUES ('431222', '431200', '沅陵县', '0', '0', '430000-431200-431222-', '1');
INSERT INTO `base_area` VALUES ('431223', '431200', '辰溪县', '0', '0', '430000-431200-431223-', '1');
INSERT INTO `base_area` VALUES ('431224', '431200', '溆浦县', '0', '0', '430000-431200-431224-', '1');
INSERT INTO `base_area` VALUES ('431225', '431200', '会同县', '0', '0', '430000-431200-431225-', '1');
INSERT INTO `base_area` VALUES ('431226', '431200', '麻阳苗族自治县', '0', '0', '430000-431200-431226-', '1');
INSERT INTO `base_area` VALUES ('431227', '431200', '新晃侗族自治县', '0', '0', '430000-431200-431227-', '1');
INSERT INTO `base_area` VALUES ('431228', '431200', '芷江侗族自治县', '0', '0', '430000-431200-431228-', '1');
INSERT INTO `base_area` VALUES ('431229', '431200', '靖州苗族侗族自治县', '0', '0', '430000-431200-431229-', '1');
INSERT INTO `base_area` VALUES ('431230', '431200', '通道侗族自治县', '0', '0', '430000-431200-431230-', '1');
INSERT INTO `base_area` VALUES ('431281', '431200', '洪江市', '0', '0', '430000-431200-431281-', '1');
INSERT INTO `base_area` VALUES ('431300', '430000', '娄底市', '417000', '0738', '430000-431300-', '1');
INSERT INTO `base_area` VALUES ('431301', '431300', '市辖区', '0', '0', '430000-431300-431301-', '1');
INSERT INTO `base_area` VALUES ('431302', '431300', '娄星区', '0', '0', '430000-431300-431302-', '1');
INSERT INTO `base_area` VALUES ('431321', '431300', '双峰县', '0', '0', '430000-431300-431321-', '1');
INSERT INTO `base_area` VALUES ('431322', '431300', '新化县', '0', '0', '430000-431300-431322-', '1');
INSERT INTO `base_area` VALUES ('431381', '431300', '冷水江市', '0', '0', '430000-431300-431381-', '1');
INSERT INTO `base_area` VALUES ('431382', '431300', '涟源市', '0', '0', '430000-431300-431382-', '1');
INSERT INTO `base_area` VALUES ('433100', '430000', '湘西州', '416000', '0743', '430000-433100-', '1');
INSERT INTO `base_area` VALUES ('433101', '433100', '吉首市', '0', '0', '430000-433100-433101-', '1');
INSERT INTO `base_area` VALUES ('433122', '433100', '泸溪县', '0', '0', '430000-433100-433122-', '1');
INSERT INTO `base_area` VALUES ('433123', '433100', '凤凰县', '0', '0', '430000-433100-433123-', '1');
INSERT INTO `base_area` VALUES ('433124', '433100', '花垣县', '0', '0', '430000-433100-433124-', '1');
INSERT INTO `base_area` VALUES ('433125', '433100', '保靖县', '0', '0', '430000-433100-433125-', '1');
INSERT INTO `base_area` VALUES ('433126', '433100', '古丈县', '0', '0', '430000-433100-433126-', '1');
INSERT INTO `base_area` VALUES ('433127', '433100', '永顺县', '0', '0', '430000-433100-433127-', '1');
INSERT INTO `base_area` VALUES ('433130', '433100', '龙山县', '0', '0', '430000-433100-433130-', '1');
INSERT INTO `base_area` VALUES ('440000', '0', '广东省', '0', '0', '440000-', '1');
INSERT INTO `base_area` VALUES ('440100', '440000', '广州市', '510000', '020', '440000-440100-', '1');
INSERT INTO `base_area` VALUES ('440101', '440100', '市辖区', '0', '0', '440000-440100-440101-', '1');
INSERT INTO `base_area` VALUES ('440102', '440100', '东山区', '0', '0', '440000-440100-440102-', '1');
INSERT INTO `base_area` VALUES ('440103', '440100', '荔湾区', '0', '0', '440000-440100-440103-', '1');
INSERT INTO `base_area` VALUES ('440104', '440100', '越秀区', '0', '0', '440000-440100-440104-', '1');
INSERT INTO `base_area` VALUES ('440105', '440100', '海珠区', '0', '0', '440000-440100-440105-', '1');
INSERT INTO `base_area` VALUES ('440106', '440100', '天河区', '0', '0', '440000-440100-440106-', '1');
INSERT INTO `base_area` VALUES ('440107', '440100', '芳村区', '0', '0', '440000-440100-440107-', '1');
INSERT INTO `base_area` VALUES ('440111', '440100', '白云区', '0', '0', '440000-440100-440111-', '1');
INSERT INTO `base_area` VALUES ('440112', '440100', '黄埔区', '0', '0', '440000-440100-440112-', '1');
INSERT INTO `base_area` VALUES ('440113', '440100', '番禺区', '0', '0', '440000-440100-440113-', '1');
INSERT INTO `base_area` VALUES ('440114', '440100', '花都区', '0', '0', '440000-440100-440114-', '1');
INSERT INTO `base_area` VALUES ('440183', '440100', '增城市', '0', '0', '440000-440100-440183-', '1');
INSERT INTO `base_area` VALUES ('440184', '440100', '从化市', '0', '0', '440000-440100-440184-', '1');
INSERT INTO `base_area` VALUES ('440200', '440000', '韶关市', '512000', '0751', '440000-440200-', '1');
INSERT INTO `base_area` VALUES ('440201', '440200', '市辖区', '0', '0', '440000-440200-440201-', '1');
INSERT INTO `base_area` VALUES ('440203', '440200', '武江区', '0', '0', '440000-440200-440203-', '1');
INSERT INTO `base_area` VALUES ('440204', '440200', '浈江区', '0', '0', '440000-440200-440204-', '1');
INSERT INTO `base_area` VALUES ('440205', '440200', '曲江区', '0', '0', '440000-440200-440205-', '1');
INSERT INTO `base_area` VALUES ('440222', '440200', '始兴县', '0', '0', '440000-440200-440222-', '1');
INSERT INTO `base_area` VALUES ('440224', '440200', '仁化县', '0', '0', '440000-440200-440224-', '1');
INSERT INTO `base_area` VALUES ('440229', '440200', '翁源县', '0', '0', '440000-440200-440229-', '1');
INSERT INTO `base_area` VALUES ('440232', '440200', '乳源瑶族自治县', '0', '0', '440000-440200-440232-', '1');
INSERT INTO `base_area` VALUES ('440233', '440200', '新丰县', '0', '0', '440000-440200-440233-', '1');
INSERT INTO `base_area` VALUES ('440281', '440200', '乐昌市', '0', '0', '440000-440200-440281-', '1');
INSERT INTO `base_area` VALUES ('440282', '440200', '南雄市', '0', '0', '440000-440200-440282-', '1');
INSERT INTO `base_area` VALUES ('440300', '440000', '深圳市', '518000', '0755', '440000-440300-', '1');
INSERT INTO `base_area` VALUES ('440301', '440300', '市辖区', '0', '0', '440000-440300-440301-', '1');
INSERT INTO `base_area` VALUES ('440303', '440300', '罗湖区', '0', '0', '440000-440300-440303-', '1');
INSERT INTO `base_area` VALUES ('440304', '440300', '福田区', '0', '0', '440000-440300-440304-', '1');
INSERT INTO `base_area` VALUES ('440305', '440300', '南山区', '0', '0', '440000-440300-440305-', '1');
INSERT INTO `base_area` VALUES ('440306', '440300', '宝安区', '0', '0', '440000-440300-440306-', '1');
INSERT INTO `base_area` VALUES ('440307', '440300', '龙岗区', '0', '0', '440000-440300-440307-', '1');
INSERT INTO `base_area` VALUES ('440308', '440300', '盐田区', '0', '0', '440000-440300-440308-', '1');
INSERT INTO `base_area` VALUES ('440400', '440000', '珠海市', '519000', '0756', '440000-440400-', '1');
INSERT INTO `base_area` VALUES ('440401', '440400', '市辖区', '0', '0', '440000-440400-440401-', '1');
INSERT INTO `base_area` VALUES ('440402', '440400', '香洲区', '0', '0', '440000-440400-440402-', '1');
INSERT INTO `base_area` VALUES ('440403', '440400', '斗门区', '0', '0', '440000-440400-440403-', '1');
INSERT INTO `base_area` VALUES ('440404', '440400', '金湾区', '0', '0', '440000-440400-440404-', '1');
INSERT INTO `base_area` VALUES ('440500', '440000', '汕头市', '515000', '0754', '440000-440500-', '1');
INSERT INTO `base_area` VALUES ('440501', '440500', '市辖区', '0', '0', '440000-440500-440501-', '1');
INSERT INTO `base_area` VALUES ('440507', '440500', '龙湖区', '0', '0', '440000-440500-440507-', '1');
INSERT INTO `base_area` VALUES ('440511', '440500', '金平区', '0', '0', '440000-440500-440511-', '1');
INSERT INTO `base_area` VALUES ('440512', '440500', '濠江区', '0', '0', '440000-440500-440512-', '1');
INSERT INTO `base_area` VALUES ('440513', '440500', '潮阳区', '0', '0', '440000-440500-440513-', '1');
INSERT INTO `base_area` VALUES ('440514', '440500', '潮南区', '0', '0', '440000-440500-440514-', '1');
INSERT INTO `base_area` VALUES ('440515', '440500', '澄海区', '0', '0', '440000-440500-440515-', '1');
INSERT INTO `base_area` VALUES ('440523', '440500', '南澳县', '0', '0', '440000-440500-440523-', '1');
INSERT INTO `base_area` VALUES ('440600', '440000', '佛山市', '528000', '0757', '440000-440600-', '1');
INSERT INTO `base_area` VALUES ('440601', '440600', '市辖区', '0', '0', '440000-440600-440601-', '1');
INSERT INTO `base_area` VALUES ('440604', '440600', '禅城区', '0', '0', '440000-440600-440604-', '1');
INSERT INTO `base_area` VALUES ('440605', '440600', '南海区', '528200', '0757', '440000-440600-440605-', '1');
INSERT INTO `base_area` VALUES ('440606', '440600', '顺德区', '528300', '0757', '440000-440600-440606-', '1');
INSERT INTO `base_area` VALUES ('440607', '440600', '三水区', '0', '0', '440000-440600-440607-', '1');
INSERT INTO `base_area` VALUES ('440608', '440600', '高明区', '0', '0', '440000-440600-440608-', '1');
INSERT INTO `base_area` VALUES ('440700', '440000', '江门市', '529000', '0750', '440000-440700-', '1');
INSERT INTO `base_area` VALUES ('440701', '440700', '市辖区', '0', '0', '440000-440700-440701-', '1');
INSERT INTO `base_area` VALUES ('440703', '440700', '蓬江区', '0', '0', '440000-440700-440703-', '1');
INSERT INTO `base_area` VALUES ('440704', '440700', '江海区', '0', '0', '440000-440700-440704-', '1');
INSERT INTO `base_area` VALUES ('440705', '440700', '新会区', '0', '0', '440000-440700-440705-', '1');
INSERT INTO `base_area` VALUES ('440781', '440700', '台山市', '0', '0', '440000-440700-440781-', '1');
INSERT INTO `base_area` VALUES ('440783', '440700', '开平市', '0', '0', '440000-440700-440783-', '1');
INSERT INTO `base_area` VALUES ('440784', '440700', '鹤山市', '0', '0', '440000-440700-440784-', '1');
INSERT INTO `base_area` VALUES ('440785', '440700', '恩平市', '0', '0', '440000-440700-440785-', '1');
INSERT INTO `base_area` VALUES ('440800', '440000', '湛江市', '524000', '0759', '440000-440800-', '1');
INSERT INTO `base_area` VALUES ('440801', '440800', '市辖区', '0', '0', '440000-440800-440801-', '1');
INSERT INTO `base_area` VALUES ('440802', '440800', '赤坎区', '0', '0', '440000-440800-440802-', '1');
INSERT INTO `base_area` VALUES ('440803', '440800', '霞山区', '0', '0', '440000-440800-440803-', '1');
INSERT INTO `base_area` VALUES ('440804', '440800', '坡头区', '0', '0', '440000-440800-440804-', '1');
INSERT INTO `base_area` VALUES ('440811', '440800', '麻章区', '0', '0', '440000-440800-440811-', '1');
INSERT INTO `base_area` VALUES ('440823', '440800', '遂溪县', '0', '0', '440000-440800-440823-', '1');
INSERT INTO `base_area` VALUES ('440825', '440800', '徐闻县', '0', '0', '440000-440800-440825-', '1');
INSERT INTO `base_area` VALUES ('440881', '440800', '廉江市', '0', '0', '440000-440800-440881-', '1');
INSERT INTO `base_area` VALUES ('440882', '440800', '雷州市', '0', '0', '440000-440800-440882-', '1');
INSERT INTO `base_area` VALUES ('440883', '440800', '吴川市', '0', '0', '440000-440800-440883-', '1');
INSERT INTO `base_area` VALUES ('440900', '440000', '茂名市', '525000', '0668', '440000-440900-', '1');
INSERT INTO `base_area` VALUES ('440901', '440900', '市辖区', '0', '0', '440000-440900-440901-', '1');
INSERT INTO `base_area` VALUES ('440902', '440900', '茂南区', '0', '0', '440000-440900-440902-', '1');
INSERT INTO `base_area` VALUES ('440903', '440900', '茂港区', '0', '0', '440000-440900-440903-', '1');
INSERT INTO `base_area` VALUES ('440923', '440900', '电白县', '0', '0', '440000-440900-440923-', '1');
INSERT INTO `base_area` VALUES ('440981', '440900', '高州市', '0', '0', '440000-440900-440981-', '1');
INSERT INTO `base_area` VALUES ('440982', '440900', '化州市', '0', '0', '440000-440900-440982-', '1');
INSERT INTO `base_area` VALUES ('440983', '440900', '信宜市', '0', '0', '440000-440900-440983-', '1');
INSERT INTO `base_area` VALUES ('441200', '440000', '肇庆市', '526000', '0758', '440000-441200-', '1');
INSERT INTO `base_area` VALUES ('441201', '441200', '市辖区', '0', '0', '440000-441200-441201-', '1');
INSERT INTO `base_area` VALUES ('441202', '441200', '端州区', '0', '0', '440000-441200-441202-', '1');
INSERT INTO `base_area` VALUES ('441203', '441200', '鼎湖区', '0', '0', '440000-441200-441203-', '1');
INSERT INTO `base_area` VALUES ('441223', '441200', '广宁县', '0', '0', '440000-441200-441223-', '1');
INSERT INTO `base_area` VALUES ('441224', '441200', '怀集县', '0', '0', '440000-441200-441224-', '1');
INSERT INTO `base_area` VALUES ('441225', '441200', '封开县', '0', '0', '440000-441200-441225-', '1');
INSERT INTO `base_area` VALUES ('441226', '441200', '德庆县', '0', '0', '440000-441200-441226-', '1');
INSERT INTO `base_area` VALUES ('441283', '441200', '高要市', '0', '0', '440000-441200-441283-', '1');
INSERT INTO `base_area` VALUES ('441284', '441200', '四会市', '0', '0', '440000-441200-441284-', '1');
INSERT INTO `base_area` VALUES ('441300', '440000', '惠州市', '516000', '0752', '440000-441300-', '1');
INSERT INTO `base_area` VALUES ('441301', '441300', '市辖区', '0', '0', '440000-441300-441301-', '1');
INSERT INTO `base_area` VALUES ('441302', '441300', '惠城区', '0', '0', '440000-441300-441302-', '1');
INSERT INTO `base_area` VALUES ('441303', '441300', '惠阳区', '0', '0', '440000-441300-441303-', '1');
INSERT INTO `base_area` VALUES ('441322', '441300', '博罗县', '0', '0', '440000-441300-441322-', '1');
INSERT INTO `base_area` VALUES ('441323', '441300', '惠东县', '0', '0', '440000-441300-441323-', '1');
INSERT INTO `base_area` VALUES ('441324', '441300', '龙门县', '0', '0', '440000-441300-441324-', '1');
INSERT INTO `base_area` VALUES ('441400', '440000', '梅州市', '514000', '0753', '440000-441400-', '1');
INSERT INTO `base_area` VALUES ('441401', '441400', '市辖区', '0', '0', '440000-441400-441401-', '1');
INSERT INTO `base_area` VALUES ('441402', '441400', '梅江区', '0', '0', '440000-441400-441402-', '1');
INSERT INTO `base_area` VALUES ('441421', '441400', '梅　县', '0', '0', '440000-441400-441421-', '1');
INSERT INTO `base_area` VALUES ('441422', '441400', '大埔县', '0', '0', '440000-441400-441422-', '1');
INSERT INTO `base_area` VALUES ('441423', '441400', '丰顺县', '0', '0', '440000-441400-441423-', '1');
INSERT INTO `base_area` VALUES ('441424', '441400', '五华县', '0', '0', '440000-441400-441424-', '1');
INSERT INTO `base_area` VALUES ('441426', '441400', '平远县', '0', '0', '440000-441400-441426-', '1');
INSERT INTO `base_area` VALUES ('441427', '441400', '蕉岭县', '0', '0', '440000-441400-441427-', '1');
INSERT INTO `base_area` VALUES ('441481', '441400', '兴宁市', '0', '0', '440000-441400-441481-', '1');
INSERT INTO `base_area` VALUES ('441500', '440000', '汕尾市', '516600', '0660', '440000-441500-', '1');
INSERT INTO `base_area` VALUES ('441501', '441500', '市辖区', '0', '0', '440000-441500-441501-', '1');
INSERT INTO `base_area` VALUES ('441502', '441500', '城　区', '0', '0', '440000-441500-441502-', '1');
INSERT INTO `base_area` VALUES ('441521', '441500', '海丰县', '0', '0', '440000-441500-441521-', '1');
INSERT INTO `base_area` VALUES ('441523', '441500', '陆河县', '0', '0', '440000-441500-441523-', '1');
INSERT INTO `base_area` VALUES ('441581', '441500', '陆丰市', '0', '0', '440000-441500-441581-', '1');
INSERT INTO `base_area` VALUES ('441600', '440000', '河源市', '517000', '0762', '440000-441600-', '1');
INSERT INTO `base_area` VALUES ('441601', '441600', '市辖区', '0', '0', '440000-441600-441601-', '1');
INSERT INTO `base_area` VALUES ('441602', '441600', '源城区', '0', '0', '440000-441600-441602-', '1');
INSERT INTO `base_area` VALUES ('441621', '441600', '紫金县', '0', '0', '440000-441600-441621-', '1');
INSERT INTO `base_area` VALUES ('441622', '441600', '龙川县', '0', '0', '440000-441600-441622-', '1');
INSERT INTO `base_area` VALUES ('441623', '441600', '连平县', '0', '0', '440000-441600-441623-', '1');
INSERT INTO `base_area` VALUES ('441624', '441600', '和平县', '0', '0', '440000-441600-441624-', '1');
INSERT INTO `base_area` VALUES ('441625', '441600', '东源县', '0', '0', '440000-441600-441625-', '1');
INSERT INTO `base_area` VALUES ('441700', '440000', '阳江市', '529500', '0662', '440000-441700-', '1');
INSERT INTO `base_area` VALUES ('441701', '441700', '市辖区', '0', '0', '440000-441700-441701-', '1');
INSERT INTO `base_area` VALUES ('441702', '441700', '江城区', '0', '0', '440000-441700-441702-', '1');
INSERT INTO `base_area` VALUES ('441721', '441700', '阳西县', '0', '0', '440000-441700-441721-', '1');
INSERT INTO `base_area` VALUES ('441723', '441700', '阳东县', '0', '0', '440000-441700-441723-', '1');
INSERT INTO `base_area` VALUES ('441781', '441700', '阳春市', '0', '0', '440000-441700-441781-', '1');
INSERT INTO `base_area` VALUES ('441800', '440000', '清远市', '511500', '0763', '440000-441800-', '1');
INSERT INTO `base_area` VALUES ('441801', '441800', '市辖区', '0', '0', '440000-441800-441801-', '1');
INSERT INTO `base_area` VALUES ('441802', '441800', '清城区', '0', '0', '440000-441800-441802-', '1');
INSERT INTO `base_area` VALUES ('441821', '441800', '佛冈县', '0', '0', '440000-441800-441821-', '1');
INSERT INTO `base_area` VALUES ('441823', '441800', '阳山县', '0', '0', '440000-441800-441823-', '1');
INSERT INTO `base_area` VALUES ('441825', '441800', '连山壮族瑶族自治县', '0', '0', '440000-441800-441825-', '1');
INSERT INTO `base_area` VALUES ('441826', '441800', '连南瑶族自治县', '0', '0', '440000-441800-441826-', '1');
INSERT INTO `base_area` VALUES ('441827', '441800', '清新县', '0', '0', '440000-441800-441827-', '1');
INSERT INTO `base_area` VALUES ('441881', '441800', '英德市', '0', '0', '440000-441800-441881-', '1');
INSERT INTO `base_area` VALUES ('441882', '441800', '连州市', '0', '0', '440000-441800-441882-', '1');
INSERT INTO `base_area` VALUES ('441900', '440000', '东莞市', '511700', '0769', '440000-441900-', '1');
INSERT INTO `base_area` VALUES ('442000', '440000', '中山市', '528400', '0760', '440000-442000-', '1');
INSERT INTO `base_area` VALUES ('445100', '440000', '潮州市', '521000', '0768', '440000-445100-', '1');
INSERT INTO `base_area` VALUES ('445101', '445100', '市辖区', '0', '0', '440000-445100-445101-', '1');
INSERT INTO `base_area` VALUES ('445102', '445100', '湘桥区', '0', '0', '440000-445100-445102-', '1');
INSERT INTO `base_area` VALUES ('445121', '445100', '潮安县', '0', '0', '440000-445100-445121-', '1');
INSERT INTO `base_area` VALUES ('445122', '445100', '饶平县', '0', '0', '440000-445100-445122-', '1');
INSERT INTO `base_area` VALUES ('445200', '440000', '揭阳市', '522000', '0663', '440000-445200-', '1');
INSERT INTO `base_area` VALUES ('445201', '445200', '市辖区', '0', '0', '440000-445200-445201-', '1');
INSERT INTO `base_area` VALUES ('445202', '445200', '榕城区', '0', '0', '440000-445200-445202-', '1');
INSERT INTO `base_area` VALUES ('445221', '445200', '揭东县', '0', '0', '440000-445200-445221-', '1');
INSERT INTO `base_area` VALUES ('445222', '445200', '揭西县', '0', '0', '440000-445200-445222-', '1');
INSERT INTO `base_area` VALUES ('445224', '445200', '惠来县', '0', '0', '440000-445200-445224-', '1');
INSERT INTO `base_area` VALUES ('445281', '445200', '普宁市', '0', '0', '440000-445200-445281-', '1');
INSERT INTO `base_area` VALUES ('445300', '440000', '云浮市', '527300', '0766', '440000-445300-', '1');
INSERT INTO `base_area` VALUES ('445301', '445300', '市辖区', '0', '0', '440000-445300-445301-', '1');
INSERT INTO `base_area` VALUES ('445302', '445300', '云城区', '0', '0', '440000-445300-445302-', '1');
INSERT INTO `base_area` VALUES ('445321', '445300', '新兴县', '0', '0', '440000-445300-445321-', '1');
INSERT INTO `base_area` VALUES ('445322', '445300', '郁南县', '0', '0', '440000-445300-445322-', '1');
INSERT INTO `base_area` VALUES ('445323', '445300', '云安县', '0', '0', '440000-445300-445323-', '1');
INSERT INTO `base_area` VALUES ('445381', '445300', '罗定市', '0', '0', '440000-445300-445381-', '1');
INSERT INTO `base_area` VALUES ('450000', '0', '广西壮族自治区', '0', '0', '450000-', '1');
INSERT INTO `base_area` VALUES ('450100', '450000', '南宁市', '530000', '0771', '450000-450100-', '1');
INSERT INTO `base_area` VALUES ('450101', '450100', '市辖区', '0', '0', '450000-450100-450101-', '1');
INSERT INTO `base_area` VALUES ('450102', '450100', '兴宁区', '0', '0', '450000-450100-450102-', '1');
INSERT INTO `base_area` VALUES ('450103', '450100', '青秀区', '0', '0', '450000-450100-450103-', '1');
INSERT INTO `base_area` VALUES ('450105', '450100', '江南区', '0', '0', '450000-450100-450105-', '1');
INSERT INTO `base_area` VALUES ('450107', '450100', '西乡塘区', '0', '0', '450000-450100-450107-', '1');
INSERT INTO `base_area` VALUES ('450108', '450100', '良庆区', '0', '0', '450000-450100-450108-', '1');
INSERT INTO `base_area` VALUES ('450109', '450100', '邕宁区', '0', '0', '450000-450100-450109-', '1');
INSERT INTO `base_area` VALUES ('450122', '450100', '武鸣县', '0', '0', '450000-450100-450122-', '1');
INSERT INTO `base_area` VALUES ('450123', '450100', '隆安县', '0', '0', '450000-450100-450123-', '1');
INSERT INTO `base_area` VALUES ('450124', '450100', '马山县', '0', '0', '450000-450100-450124-', '1');
INSERT INTO `base_area` VALUES ('450125', '450100', '上林县', '0', '0', '450000-450100-450125-', '1');
INSERT INTO `base_area` VALUES ('450126', '450100', '宾阳县', '0', '0', '450000-450100-450126-', '1');
INSERT INTO `base_area` VALUES ('450127', '450100', '横　县', '0', '0', '450000-450100-450127-', '1');
INSERT INTO `base_area` VALUES ('450200', '450000', '柳州市', '545000', '0772', '450000-450200-', '1');
INSERT INTO `base_area` VALUES ('450201', '450200', '市辖区', '0', '0', '450000-450200-450201-', '1');
INSERT INTO `base_area` VALUES ('450202', '450200', '城中区', '0', '0', '450000-450200-450202-', '1');
INSERT INTO `base_area` VALUES ('450203', '450200', '鱼峰区', '0', '0', '450000-450200-450203-', '1');
INSERT INTO `base_area` VALUES ('450204', '450200', '柳南区', '0', '0', '450000-450200-450204-', '1');
INSERT INTO `base_area` VALUES ('450205', '450200', '柳北区', '0', '0', '450000-450200-450205-', '1');
INSERT INTO `base_area` VALUES ('450221', '450200', '柳江县', '0', '0', '450000-450200-450221-', '1');
INSERT INTO `base_area` VALUES ('450222', '450200', '柳城县', '0', '0', '450000-450200-450222-', '1');
INSERT INTO `base_area` VALUES ('450223', '450200', '鹿寨县', '0', '0', '450000-450200-450223-', '1');
INSERT INTO `base_area` VALUES ('450224', '450200', '融安县', '0', '0', '450000-450200-450224-', '1');
INSERT INTO `base_area` VALUES ('450225', '450200', '融水苗族自治县', '0', '0', '450000-450200-450225-', '1');
INSERT INTO `base_area` VALUES ('450226', '450200', '三江侗族自治县', '0', '0', '450000-450200-450226-', '1');
INSERT INTO `base_area` VALUES ('450300', '450000', '桂林市', '541000', '0773', '450000-450300-', '1');
INSERT INTO `base_area` VALUES ('450301', '450300', '市辖区', '0', '0', '450000-450300-450301-', '1');
INSERT INTO `base_area` VALUES ('450302', '450300', '秀峰区', '0', '0', '450000-450300-450302-', '1');
INSERT INTO `base_area` VALUES ('450303', '450300', '叠彩区', '0', '0', '450000-450300-450303-', '1');
INSERT INTO `base_area` VALUES ('450304', '450300', '象山区', '0', '0', '450000-450300-450304-', '1');
INSERT INTO `base_area` VALUES ('450305', '450300', '七星区', '0', '0', '450000-450300-450305-', '1');
INSERT INTO `base_area` VALUES ('450311', '450300', '雁山区', '0', '0', '450000-450300-450311-', '1');
INSERT INTO `base_area` VALUES ('450321', '450300', '阳朔县', '0', '0', '450000-450300-450321-', '1');
INSERT INTO `base_area` VALUES ('450322', '450300', '临桂县', '0', '0', '450000-450300-450322-', '1');
INSERT INTO `base_area` VALUES ('450323', '450300', '灵川县', '0', '0', '450000-450300-450323-', '1');
INSERT INTO `base_area` VALUES ('450324', '450300', '全州县', '0', '0', '450000-450300-450324-', '1');
INSERT INTO `base_area` VALUES ('450325', '450300', '兴安县', '0', '0', '450000-450300-450325-', '1');
INSERT INTO `base_area` VALUES ('450326', '450300', '永福县', '0', '0', '450000-450300-450326-', '1');
INSERT INTO `base_area` VALUES ('450327', '450300', '灌阳县', '0', '0', '450000-450300-450327-', '1');
INSERT INTO `base_area` VALUES ('450328', '450300', '龙胜各族自治县', '0', '0', '450000-450300-450328-', '1');
INSERT INTO `base_area` VALUES ('450329', '450300', '资源县', '0', '0', '450000-450300-450329-', '1');
INSERT INTO `base_area` VALUES ('450330', '450300', '平乐县', '0', '0', '450000-450300-450330-', '1');
INSERT INTO `base_area` VALUES ('450331', '450300', '荔蒲县', '0', '0', '450000-450300-450331-', '1');
INSERT INTO `base_area` VALUES ('450332', '450300', '恭城瑶族自治县', '0', '0', '450000-450300-450332-', '1');
INSERT INTO `base_area` VALUES ('450400', '450000', '梧州市', '543000', '0774', '450000-450400-', '1');
INSERT INTO `base_area` VALUES ('450401', '450400', '市辖区', '0', '0', '450000-450400-450401-', '1');
INSERT INTO `base_area` VALUES ('450403', '450400', '万秀区', '0', '0', '450000-450400-450403-', '1');
INSERT INTO `base_area` VALUES ('450404', '450400', '蝶山区', '0', '0', '450000-450400-450404-', '1');
INSERT INTO `base_area` VALUES ('450405', '450400', '长洲区', '0', '0', '450000-450400-450405-', '1');
INSERT INTO `base_area` VALUES ('450421', '450400', '苍梧县', '0', '0', '450000-450400-450421-', '1');
INSERT INTO `base_area` VALUES ('450422', '450400', '藤　县', '0', '0', '450000-450400-450422-', '1');
INSERT INTO `base_area` VALUES ('450423', '450400', '蒙山县', '0', '0', '450000-450400-450423-', '1');
INSERT INTO `base_area` VALUES ('450481', '450400', '岑溪市', '0', '0', '450000-450400-450481-', '1');
INSERT INTO `base_area` VALUES ('450500', '450000', '北海市', '536000', '0779', '450000-450500-', '1');
INSERT INTO `base_area` VALUES ('450501', '450500', '市辖区', '0', '0', '450000-450500-450501-', '1');
INSERT INTO `base_area` VALUES ('450502', '450500', '海城区', '0', '0', '450000-450500-450502-', '1');
INSERT INTO `base_area` VALUES ('450503', '450500', '银海区', '0', '0', '450000-450500-450503-', '1');
INSERT INTO `base_area` VALUES ('450512', '450500', '铁山港区', '0', '0', '450000-450500-450512-', '1');
INSERT INTO `base_area` VALUES ('450521', '450500', '合浦县', '0', '0', '450000-450500-450521-', '1');
INSERT INTO `base_area` VALUES ('450600', '450000', '防城港市', '538000', '0770', '450000-450600-', '1');
INSERT INTO `base_area` VALUES ('450601', '450600', '市辖区', '0', '0', '450000-450600-450601-', '1');
INSERT INTO `base_area` VALUES ('450602', '450600', '港口区', '0', '0', '450000-450600-450602-', '1');
INSERT INTO `base_area` VALUES ('450603', '450600', '防城区', '0', '0', '450000-450600-450603-', '1');
INSERT INTO `base_area` VALUES ('450621', '450600', '上思县', '0', '0', '450000-450600-450621-', '1');
INSERT INTO `base_area` VALUES ('450681', '450600', '东兴市', '0', '0', '450000-450600-450681-', '1');
INSERT INTO `base_area` VALUES ('450700', '450000', '钦州市', '535000', '0777', '450000-450700-', '1');
INSERT INTO `base_area` VALUES ('450701', '450700', '市辖区', '0', '0', '450000-450700-450701-', '1');
INSERT INTO `base_area` VALUES ('450702', '450700', '钦南区', '0', '0', '450000-450700-450702-', '1');
INSERT INTO `base_area` VALUES ('450703', '450700', '钦北区', '0', '0', '450000-450700-450703-', '1');
INSERT INTO `base_area` VALUES ('450721', '450700', '灵山县', '0', '0', '450000-450700-450721-', '1');
INSERT INTO `base_area` VALUES ('450722', '450700', '浦北县', '0', '0', '450000-450700-450722-', '1');
INSERT INTO `base_area` VALUES ('450800', '450000', '贵港市', '537000', '0775', '450000-450800-', '1');
INSERT INTO `base_area` VALUES ('450801', '450800', '市辖区', '0', '0', '450000-450800-450801-', '1');
INSERT INTO `base_area` VALUES ('450802', '450800', '港北区', '0', '0', '450000-450800-450802-', '1');
INSERT INTO `base_area` VALUES ('450803', '450800', '港南区', '0', '0', '450000-450800-450803-', '1');
INSERT INTO `base_area` VALUES ('450804', '450800', '覃塘区', '0', '0', '450000-450800-450804-', '1');
INSERT INTO `base_area` VALUES ('450821', '450800', '平南县', '0', '0', '450000-450800-450821-', '1');
INSERT INTO `base_area` VALUES ('450881', '450800', '桂平市', '0', '0', '450000-450800-450881-', '1');
INSERT INTO `base_area` VALUES ('450900', '450000', '玉林市', '537000', '0775', '450000-450900-', '1');
INSERT INTO `base_area` VALUES ('450901', '450900', '市辖区', '0', '0', '450000-450900-450901-', '1');
INSERT INTO `base_area` VALUES ('450902', '450900', '玉州区', '0', '0', '450000-450900-450902-', '1');
INSERT INTO `base_area` VALUES ('450921', '450900', '容　县', '0', '0', '450000-450900-450921-', '1');
INSERT INTO `base_area` VALUES ('450922', '450900', '陆川县', '0', '0', '450000-450900-450922-', '1');
INSERT INTO `base_area` VALUES ('450923', '450900', '博白县', '0', '0', '450000-450900-450923-', '1');
INSERT INTO `base_area` VALUES ('450924', '450900', '兴业县', '0', '0', '450000-450900-450924-', '1');
INSERT INTO `base_area` VALUES ('450981', '450900', '北流市', '0', '0', '450000-450900-450981-', '1');
INSERT INTO `base_area` VALUES ('451000', '450000', '百色市', '533000', '0776', '450000-451000-', '1');
INSERT INTO `base_area` VALUES ('451001', '451000', '市辖区', '0', '0', '450000-451000-451001-', '1');
INSERT INTO `base_area` VALUES ('451002', '451000', '右江区', '0', '0', '450000-451000-451002-', '1');
INSERT INTO `base_area` VALUES ('451021', '451000', '田阳县', '0', '0', '450000-451000-451021-', '1');
INSERT INTO `base_area` VALUES ('451022', '451000', '田东县', '0', '0', '450000-451000-451022-', '1');
INSERT INTO `base_area` VALUES ('451023', '451000', '平果县', '0', '0', '450000-451000-451023-', '1');
INSERT INTO `base_area` VALUES ('451024', '451000', '德保县', '0', '0', '450000-451000-451024-', '1');
INSERT INTO `base_area` VALUES ('451025', '451000', '靖西县', '0', '0', '450000-451000-451025-', '1');
INSERT INTO `base_area` VALUES ('451026', '451000', '那坡县', '0', '0', '450000-451000-451026-', '1');
INSERT INTO `base_area` VALUES ('451027', '451000', '凌云县', '0', '0', '450000-451000-451027-', '1');
INSERT INTO `base_area` VALUES ('451028', '451000', '乐业县', '0', '0', '450000-451000-451028-', '1');
INSERT INTO `base_area` VALUES ('451029', '451000', '田林县', '0', '0', '450000-451000-451029-', '1');
INSERT INTO `base_area` VALUES ('451030', '451000', '西林县', '0', '0', '450000-451000-451030-', '1');
INSERT INTO `base_area` VALUES ('451031', '451000', '隆林各族自治县', '0', '0', '450000-451000-451031-', '1');
INSERT INTO `base_area` VALUES ('451100', '450000', '贺州市', '542800', '0774', '450000-451100-', '1');
INSERT INTO `base_area` VALUES ('451101', '451100', '市辖区', '0', '0', '450000-451100-451101-', '1');
INSERT INTO `base_area` VALUES ('451102', '451100', '八步区', '0', '0', '450000-451100-451102-', '1');
INSERT INTO `base_area` VALUES ('451121', '451100', '昭平县', '0', '0', '450000-451100-451121-', '1');
INSERT INTO `base_area` VALUES ('451122', '451100', '钟山县', '0', '0', '450000-451100-451122-', '1');
INSERT INTO `base_area` VALUES ('451123', '451100', '富川瑶族自治县', '0', '0', '450000-451100-451123-', '1');
INSERT INTO `base_area` VALUES ('451200', '450000', '河池市', '547000', '0778', '450000-451200-', '1');
INSERT INTO `base_area` VALUES ('451201', '451200', '市辖区', '0', '0', '450000-451200-451201-', '1');
INSERT INTO `base_area` VALUES ('451202', '451200', '金城江区', '0', '0', '450000-451200-451202-', '1');
INSERT INTO `base_area` VALUES ('451221', '451200', '南丹县', '0', '0', '450000-451200-451221-', '1');
INSERT INTO `base_area` VALUES ('451222', '451200', '天峨县', '0', '0', '450000-451200-451222-', '1');
INSERT INTO `base_area` VALUES ('451223', '451200', '凤山县', '0', '0', '450000-451200-451223-', '1');
INSERT INTO `base_area` VALUES ('451224', '451200', '东兰县', '0', '0', '450000-451200-451224-', '1');
INSERT INTO `base_area` VALUES ('451225', '451200', '罗城仫佬族自治县', '0', '0', '450000-451200-451225-', '1');
INSERT INTO `base_area` VALUES ('451226', '451200', '环江毛南族自治县', '0', '0', '450000-451200-451226-', '1');
INSERT INTO `base_area` VALUES ('451227', '451200', '巴马瑶族自治县', '0', '0', '450000-451200-451227-', '1');
INSERT INTO `base_area` VALUES ('451228', '451200', '都安瑶族自治县', '0', '0', '450000-451200-451228-', '1');
INSERT INTO `base_area` VALUES ('451229', '451200', '大化瑶族自治县', '0', '0', '450000-451200-451229-', '1');
INSERT INTO `base_area` VALUES ('451281', '451200', '宜州市', '0', '0', '450000-451200-451281-', '1');
INSERT INTO `base_area` VALUES ('451300', '450000', '来宾市', '546100', '0772', '450000-451300-', '1');
INSERT INTO `base_area` VALUES ('451301', '451300', '市辖区', '0', '0', '450000-451300-451301-', '1');
INSERT INTO `base_area` VALUES ('451302', '451300', '兴宾区', '0', '0', '450000-451300-451302-', '1');
INSERT INTO `base_area` VALUES ('451321', '451300', '忻城县', '0', '0', '450000-451300-451321-', '1');
INSERT INTO `base_area` VALUES ('451322', '451300', '象州县', '0', '0', '450000-451300-451322-', '1');
INSERT INTO `base_area` VALUES ('451323', '451300', '武宣县', '0', '0', '450000-451300-451323-', '1');
INSERT INTO `base_area` VALUES ('451324', '451300', '金秀瑶族自治县', '0', '0', '450000-451300-451324-', '1');
INSERT INTO `base_area` VALUES ('451381', '451300', '合山市', '0', '0', '450000-451300-451381-', '1');
INSERT INTO `base_area` VALUES ('451400', '450000', '崇左市', '532200', '0771', '450000-451400-', '1');
INSERT INTO `base_area` VALUES ('451401', '451400', '市辖区', '0', '0', '450000-451400-451401-', '1');
INSERT INTO `base_area` VALUES ('451402', '451400', '江洲区', '0', '0', '450000-451400-451402-', '1');
INSERT INTO `base_area` VALUES ('451421', '451400', '扶绥县', '0', '0', '450000-451400-451421-', '1');
INSERT INTO `base_area` VALUES ('451422', '451400', '宁明县', '0', '0', '450000-451400-451422-', '1');
INSERT INTO `base_area` VALUES ('451423', '451400', '龙州县', '0', '0', '450000-451400-451423-', '1');
INSERT INTO `base_area` VALUES ('451424', '451400', '大新县', '0', '0', '450000-451400-451424-', '1');
INSERT INTO `base_area` VALUES ('451425', '451400', '天等县', '0', '0', '450000-451400-451425-', '1');
INSERT INTO `base_area` VALUES ('451481', '451400', '凭祥市', '0', '0', '450000-451400-451481-', '1');
INSERT INTO `base_area` VALUES ('460000', '0', '海南省', '0', '0', '460000-', '1');
INSERT INTO `base_area` VALUES ('460100', '460000', '海口市', '570100', '0898', '460000-460100-', '1');
INSERT INTO `base_area` VALUES ('460101', '460100', '市辖区', '0', '0', '460000-460100-460101-', '1');
INSERT INTO `base_area` VALUES ('460105', '460100', '秀英区', '0', '0', '460000-460100-460105-', '1');
INSERT INTO `base_area` VALUES ('460106', '460100', '龙华区', '0', '0', '460000-460100-460106-', '1');
INSERT INTO `base_area` VALUES ('460107', '460100', '琼山区', '0', '0', '460000-460100-460107-', '1');
INSERT INTO `base_area` VALUES ('460108', '460100', '美兰区', '0', '0', '460000-460100-460108-', '1');
INSERT INTO `base_area` VALUES ('460200', '460000', '三亚市', '572000', '0898', '460000-460200-', '1');
INSERT INTO `base_area` VALUES ('460201', '460200', '市辖区', '0', '0', '460000-460200-460201-', '1');
INSERT INTO `base_area` VALUES ('469000', '460000', '省直辖县级行政单位', '0', '0', '460000-469000-', '1');
INSERT INTO `base_area` VALUES ('469001', '469000', '五指山市', '572200', '0898', '460000-469000-469001-', '1');
INSERT INTO `base_area` VALUES ('469002', '469000', '琼海市', '571400', '0898', '460000-469000-469002-', '1');
INSERT INTO `base_area` VALUES ('469003', '469000', '儋州市', '571700', '0898', '460000-469000-469003-', '1');
INSERT INTO `base_area` VALUES ('469005', '469000', '文昌市', '571300', '0898', '460000-469000-469005-', '1');
INSERT INTO `base_area` VALUES ('469006', '469000', '万宁市', '571500', '0898', '460000-469000-469006-', '1');
INSERT INTO `base_area` VALUES ('469007', '469000', '东方市', '572600', '0898', '460000-469000-469007-', '1');
INSERT INTO `base_area` VALUES ('469025', '469000', '定安县', '0', '0', '460000-469000-469025-', '1');
INSERT INTO `base_area` VALUES ('469026', '469000', '屯昌县', '0', '0', '460000-469000-469026-', '1');
INSERT INTO `base_area` VALUES ('469027', '469000', '澄迈县', '0', '0', '460000-469000-469027-', '1');
INSERT INTO `base_area` VALUES ('469028', '469000', '临高县', '0', '0', '460000-469000-469028-', '1');
INSERT INTO `base_area` VALUES ('469030', '469000', '白沙黎族自治县', '0', '0', '460000-469000-469030-', '1');
INSERT INTO `base_area` VALUES ('469031', '469000', '昌江黎族自治县', '0', '0', '460000-469000-469031-', '1');
INSERT INTO `base_area` VALUES ('469033', '469000', '乐东黎族自治县', '0', '0', '460000-469000-469033-', '1');
INSERT INTO `base_area` VALUES ('469034', '469000', '陵水黎族自治县', '0', '0', '460000-469000-469034-', '1');
INSERT INTO `base_area` VALUES ('469035', '469000', '保亭黎族苗族自治县', '0', '0', '460000-469000-469035-', '1');
INSERT INTO `base_area` VALUES ('469036', '469000', '琼中黎族苗族自治县', '0', '0', '460000-469000-469036-', '1');
INSERT INTO `base_area` VALUES ('469037', '469000', '西沙群岛', '0', '0', '460000-469000-469037-', '1');
INSERT INTO `base_area` VALUES ('469038', '469000', '南沙群岛', '0', '0', '460000-469000-469038-', '1');
INSERT INTO `base_area` VALUES ('469039', '469000', '中沙群岛的岛礁及其海域', '0', '0', '460000-469000-469039-', '1');
INSERT INTO `base_area` VALUES ('500000', '0', '重庆市', '400000', '023', '500000-', '1');
INSERT INTO `base_area` VALUES ('500100', '500000', '市辖区', '0', '0', '500000-500100-', '1');
INSERT INTO `base_area` VALUES ('500101', '500100', '万州区', '404000', '023', '500000-500100-500101-', '1');
INSERT INTO `base_area` VALUES ('500102', '500100', '涪陵区', '408000', '023', '500000-500100-500102-', '1');
INSERT INTO `base_area` VALUES ('500103', '500100', '渝中区', '0', '0', '500000-500100-500103-', '1');
INSERT INTO `base_area` VALUES ('500104', '500100', '大渡口区', '0', '0', '500000-500100-500104-', '1');
INSERT INTO `base_area` VALUES ('500105', '500100', '江北区', '0', '0', '500000-500100-500105-', '1');
INSERT INTO `base_area` VALUES ('500106', '500100', '沙坪坝区', '0', '0', '500000-500100-500106-', '1');
INSERT INTO `base_area` VALUES ('500107', '500100', '九龙坡区', '0', '0', '500000-500100-500107-', '1');
INSERT INTO `base_area` VALUES ('500108', '500100', '南岸区', '0', '0', '500000-500100-500108-', '1');
INSERT INTO `base_area` VALUES ('500109', '500100', '北碚区', '0', '0', '500000-500100-500109-', '1');
INSERT INTO `base_area` VALUES ('500110', '500100', '万盛区', '0', '0', '500000-500100-500110-', '1');
INSERT INTO `base_area` VALUES ('500111', '500100', '双桥区', '0', '0', '500000-500100-500111-', '1');
INSERT INTO `base_area` VALUES ('500112', '500100', '渝北区', '0', '0', '500000-500100-500112-', '1');
INSERT INTO `base_area` VALUES ('500113', '500100', '巴南区', '0', '0', '500000-500100-500113-', '1');
INSERT INTO `base_area` VALUES ('500114', '500100', '黔江区', '409000', '023', '500000-500100-500114-', '1');
INSERT INTO `base_area` VALUES ('500115', '500100', '长寿区', '0', '0', '500000-500100-500115-', '1');
INSERT INTO `base_area` VALUES ('500200', '500000', '县', '0', '0', '500000-500200-', '1');
INSERT INTO `base_area` VALUES ('500222', '500200', '綦江县', '0', '0', '500000-500200-500222-', '1');
INSERT INTO `base_area` VALUES ('500223', '500200', '潼南县', '0', '0', '500000-500200-500223-', '1');
INSERT INTO `base_area` VALUES ('500224', '500200', '铜梁县', '0', '0', '500000-500200-500224-', '1');
INSERT INTO `base_area` VALUES ('500225', '500200', '大足县', '0', '0', '500000-500200-500225-', '1');
INSERT INTO `base_area` VALUES ('500226', '500200', '荣昌县', '0', '0', '500000-500200-500226-', '1');
INSERT INTO `base_area` VALUES ('500227', '500200', '璧山县', '0', '0', '500000-500200-500227-', '1');
INSERT INTO `base_area` VALUES ('500228', '500200', '梁平县', '0', '0', '500000-500200-500228-', '1');
INSERT INTO `base_area` VALUES ('500229', '500200', '城口县', '0', '0', '500000-500200-500229-', '1');
INSERT INTO `base_area` VALUES ('500230', '500200', '丰都县', '0', '0', '500000-500200-500230-', '1');
INSERT INTO `base_area` VALUES ('500231', '500200', '垫江县', '0', '0', '500000-500200-500231-', '1');
INSERT INTO `base_area` VALUES ('500232', '500200', '武隆县', '0', '0', '500000-500200-500232-', '1');
INSERT INTO `base_area` VALUES ('500233', '500200', '忠　县', '0', '0', '500000-500200-500233-', '1');
INSERT INTO `base_area` VALUES ('500234', '500200', '开　县', '0', '0', '500000-500200-500234-', '1');
INSERT INTO `base_area` VALUES ('500235', '500200', '云阳县', '0', '0', '500000-500200-500235-', '1');
INSERT INTO `base_area` VALUES ('500236', '500200', '奉节县', '0', '0', '500000-500200-500236-', '1');
INSERT INTO `base_area` VALUES ('500237', '500200', '巫山县', '0', '0', '500000-500200-500237-', '1');
INSERT INTO `base_area` VALUES ('500238', '500200', '巫溪县', '0', '0', '500000-500200-500238-', '1');
INSERT INTO `base_area` VALUES ('500240', '500200', '石柱土家族自治县', '0', '0', '500000-500200-500240-', '1');
INSERT INTO `base_area` VALUES ('500241', '500200', '秀山土家族苗族自治县', '0', '0', '500000-500200-500241-', '1');
INSERT INTO `base_area` VALUES ('500242', '500200', '酉阳土家族苗族自治县', '0', '0', '500000-500200-500242-', '1');
INSERT INTO `base_area` VALUES ('500243', '500200', '彭水苗族土家族自治县', '0', '0', '500000-500200-500243-', '1');
INSERT INTO `base_area` VALUES ('500300', '500000', '市', '0', '0', '500000-500300-', '1');
INSERT INTO `base_area` VALUES ('500381', '500300', '江津市', '0', '0', '500000-500300-500381-', '1');
INSERT INTO `base_area` VALUES ('500382', '500300', '合川市', '0', '0', '500000-500300-500382-', '1');
INSERT INTO `base_area` VALUES ('500383', '500300', '永川市', '0', '0', '500000-500300-500383-', '1');
INSERT INTO `base_area` VALUES ('500384', '500300', '南川市', '0', '0', '500000-500300-500384-', '1');
INSERT INTO `base_area` VALUES ('510000', '0', '四川省', '0', '0', '510000-', '1');
INSERT INTO `base_area` VALUES ('510100', '510000', '成都市', '610000', '028', '510000-510100-', '1');
INSERT INTO `base_area` VALUES ('510101', '510100', '市辖区', '0', '0', '510000-510100-510101-', '1');
INSERT INTO `base_area` VALUES ('510104', '510100', '锦江区', '0', '0', '510000-510100-510104-', '1');
INSERT INTO `base_area` VALUES ('510105', '510100', '青羊区', '0', '0', '510000-510100-510105-', '1');
INSERT INTO `base_area` VALUES ('510106', '510100', '金牛区', '0', '0', '510000-510100-510106-', '1');
INSERT INTO `base_area` VALUES ('510107', '510100', '武侯区', '0', '0', '510000-510100-510107-', '1');
INSERT INTO `base_area` VALUES ('510108', '510100', '成华区', '0', '0', '510000-510100-510108-', '1');
INSERT INTO `base_area` VALUES ('510112', '510100', '龙泉驿区', '0', '0', '510000-510100-510112-', '1');
INSERT INTO `base_area` VALUES ('510113', '510100', '青白江区', '0', '0', '510000-510100-510113-', '1');
INSERT INTO `base_area` VALUES ('510114', '510100', '新都区', '0', '0', '510000-510100-510114-', '1');
INSERT INTO `base_area` VALUES ('510115', '510100', '温江区', '0', '0', '510000-510100-510115-', '1');
INSERT INTO `base_area` VALUES ('510121', '510100', '金堂县', '0', '0', '510000-510100-510121-', '1');
INSERT INTO `base_area` VALUES ('510122', '510100', '双流县', '0', '0', '510000-510100-510122-', '1');
INSERT INTO `base_area` VALUES ('510124', '510100', '郫　县', '0', '0', '510000-510100-510124-', '1');
INSERT INTO `base_area` VALUES ('510129', '510100', '大邑县', '0', '0', '510000-510100-510129-', '1');
INSERT INTO `base_area` VALUES ('510131', '510100', '蒲江县', '0', '0', '510000-510100-510131-', '1');
INSERT INTO `base_area` VALUES ('510132', '510100', '新津县', '0', '0', '510000-510100-510132-', '1');
INSERT INTO `base_area` VALUES ('510181', '510100', '都江堰市', '0', '0', '510000-510100-510181-', '1');
INSERT INTO `base_area` VALUES ('510182', '510100', '彭州市', '0', '0', '510000-510100-510182-', '1');
INSERT INTO `base_area` VALUES ('510183', '510100', '邛崃市', '0', '0', '510000-510100-510183-', '1');
INSERT INTO `base_area` VALUES ('510184', '510100', '崇州市', '0', '0', '510000-510100-510184-', '1');
INSERT INTO `base_area` VALUES ('510300', '510000', '自贡市', '643000', '0813', '510000-510300-', '1');
INSERT INTO `base_area` VALUES ('510301', '510300', '市辖区', '0', '0', '510000-510300-510301-', '1');
INSERT INTO `base_area` VALUES ('510302', '510300', '自流井区', '0', '0', '510000-510300-510302-', '1');
INSERT INTO `base_area` VALUES ('510303', '510300', '贡井区', '0', '0', '510000-510300-510303-', '1');
INSERT INTO `base_area` VALUES ('510304', '510300', '大安区', '0', '0', '510000-510300-510304-', '1');
INSERT INTO `base_area` VALUES ('510311', '510300', '沿滩区', '0', '0', '510000-510300-510311-', '1');
INSERT INTO `base_area` VALUES ('510321', '510300', '荣　县', '0', '0', '510000-510300-510321-', '1');
INSERT INTO `base_area` VALUES ('510322', '510300', '富顺县', '0', '0', '510000-510300-510322-', '1');
INSERT INTO `base_area` VALUES ('510400', '510000', '攀枝花市', '617000', '0812', '510000-510400-', '1');
INSERT INTO `base_area` VALUES ('510401', '510400', '市辖区', '0', '0', '510000-510400-510401-', '1');
INSERT INTO `base_area` VALUES ('510402', '510400', '东　区', '0', '0', '510000-510400-510402-', '1');
INSERT INTO `base_area` VALUES ('510403', '510400', '西　区', '0', '0', '510000-510400-510403-', '1');
INSERT INTO `base_area` VALUES ('510411', '510400', '仁和区', '0', '0', '510000-510400-510411-', '1');
INSERT INTO `base_area` VALUES ('510421', '510400', '米易县', '0', '0', '510000-510400-510421-', '1');
INSERT INTO `base_area` VALUES ('510422', '510400', '盐边县', '0', '0', '510000-510400-510422-', '1');
INSERT INTO `base_area` VALUES ('510500', '510000', '泸州市', '646000', '0830', '510000-510500-', '1');
INSERT INTO `base_area` VALUES ('510501', '510500', '市辖区', '0', '0', '510000-510500-510501-', '1');
INSERT INTO `base_area` VALUES ('510502', '510500', '江阳区', '0', '0', '510000-510500-510502-', '1');
INSERT INTO `base_area` VALUES ('510503', '510500', '纳溪区', '0', '0', '510000-510500-510503-', '1');
INSERT INTO `base_area` VALUES ('510504', '510500', '龙马潭区', '0', '0', '510000-510500-510504-', '1');
INSERT INTO `base_area` VALUES ('510521', '510500', '泸　县', '0', '0', '510000-510500-510521-', '1');
INSERT INTO `base_area` VALUES ('510522', '510500', '合江县', '0', '0', '510000-510500-510522-', '1');
INSERT INTO `base_area` VALUES ('510524', '510500', '叙永县', '0', '0', '510000-510500-510524-', '1');
INSERT INTO `base_area` VALUES ('510525', '510500', '古蔺县', '0', '0', '510000-510500-510525-', '1');
INSERT INTO `base_area` VALUES ('510600', '510000', '德阳市', '618000', '0838', '510000-510600-', '1');
INSERT INTO `base_area` VALUES ('510601', '510600', '市辖区', '0', '0', '510000-510600-510601-', '1');
INSERT INTO `base_area` VALUES ('510603', '510600', '旌阳区', '0', '0', '510000-510600-510603-', '1');
INSERT INTO `base_area` VALUES ('510623', '510600', '中江县', '0', '0', '510000-510600-510623-', '1');
INSERT INTO `base_area` VALUES ('510626', '510600', '罗江县', '0', '0', '510000-510600-510626-', '1');
INSERT INTO `base_area` VALUES ('510681', '510600', '广汉市', '0', '0', '510000-510600-510681-', '1');
INSERT INTO `base_area` VALUES ('510682', '510600', '什邡市', '0', '0', '510000-510600-510682-', '1');
INSERT INTO `base_area` VALUES ('510683', '510600', '绵竹市', '0', '0', '510000-510600-510683-', '1');
INSERT INTO `base_area` VALUES ('510700', '510000', '绵阳市', '621000', '0816', '510000-510700-', '1');
INSERT INTO `base_area` VALUES ('510701', '510700', '市辖区', '0', '0', '510000-510700-510701-', '1');
INSERT INTO `base_area` VALUES ('510703', '510700', '涪城区', '0', '0', '510000-510700-510703-', '1');
INSERT INTO `base_area` VALUES ('510704', '510700', '游仙区', '0', '0', '510000-510700-510704-', '1');
INSERT INTO `base_area` VALUES ('510722', '510700', '三台县', '0', '0', '510000-510700-510722-', '1');
INSERT INTO `base_area` VALUES ('510723', '510700', '盐亭县', '0', '0', '510000-510700-510723-', '1');
INSERT INTO `base_area` VALUES ('510724', '510700', '安　县', '0', '0', '510000-510700-510724-', '1');
INSERT INTO `base_area` VALUES ('510725', '510700', '梓潼县', '0', '0', '510000-510700-510725-', '1');
INSERT INTO `base_area` VALUES ('510726', '510700', '北川羌族自治县', '0', '0', '510000-510700-510726-', '1');
INSERT INTO `base_area` VALUES ('510727', '510700', '平武县', '0', '0', '510000-510700-510727-', '1');
INSERT INTO `base_area` VALUES ('510781', '510700', '江油市', '0', '0', '510000-510700-510781-', '1');
INSERT INTO `base_area` VALUES ('510800', '510000', '广元市', '628000', '0839', '510000-510800-', '1');
INSERT INTO `base_area` VALUES ('510801', '510800', '市辖区', '0', '0', '510000-510800-510801-', '1');
INSERT INTO `base_area` VALUES ('510802', '510800', '市中区', '0', '0', '510000-510800-510802-', '1');
INSERT INTO `base_area` VALUES ('510811', '510800', '元坝区', '0', '0', '510000-510800-510811-', '1');
INSERT INTO `base_area` VALUES ('510812', '510800', '朝天区', '0', '0', '510000-510800-510812-', '1');
INSERT INTO `base_area` VALUES ('510821', '510800', '旺苍县', '0', '0', '510000-510800-510821-', '1');
INSERT INTO `base_area` VALUES ('510822', '510800', '青川县', '0', '0', '510000-510800-510822-', '1');
INSERT INTO `base_area` VALUES ('510823', '510800', '剑阁县', '0', '0', '510000-510800-510823-', '1');
INSERT INTO `base_area` VALUES ('510824', '510800', '苍溪县', '0', '0', '510000-510800-510824-', '1');
INSERT INTO `base_area` VALUES ('510900', '510000', '遂宁市', '629000', '0825', '510000-510900-', '1');
INSERT INTO `base_area` VALUES ('510901', '510900', '市辖区', '0', '0', '510000-510900-510901-', '1');
INSERT INTO `base_area` VALUES ('510903', '510900', '船山区', '0', '0', '510000-510900-510903-', '1');
INSERT INTO `base_area` VALUES ('510904', '510900', '安居区', '0', '0', '510000-510900-510904-', '1');
INSERT INTO `base_area` VALUES ('510921', '510900', '蓬溪县', '0', '0', '510000-510900-510921-', '1');
INSERT INTO `base_area` VALUES ('510922', '510900', '射洪县', '0', '0', '510000-510900-510922-', '1');
INSERT INTO `base_area` VALUES ('510923', '510900', '大英县', '0', '0', '510000-510900-510923-', '1');
INSERT INTO `base_area` VALUES ('511000', '510000', '内江市', '641000', '0832', '510000-511000-', '1');
INSERT INTO `base_area` VALUES ('511001', '511000', '市辖区', '0', '0', '510000-511000-511001-', '1');
INSERT INTO `base_area` VALUES ('511002', '511000', '市中区', '0', '0', '510000-511000-511002-', '1');
INSERT INTO `base_area` VALUES ('511011', '511000', '东兴区', '0', '0', '510000-511000-511011-', '1');
INSERT INTO `base_area` VALUES ('511024', '511000', '威远县', '0', '0', '510000-511000-511024-', '1');
INSERT INTO `base_area` VALUES ('511025', '511000', '资中县', '0', '0', '510000-511000-511025-', '1');
INSERT INTO `base_area` VALUES ('511028', '511000', '隆昌县', '0', '0', '510000-511000-511028-', '1');
INSERT INTO `base_area` VALUES ('511100', '510000', '乐山市', '614000', '0833', '510000-511100-', '1');
INSERT INTO `base_area` VALUES ('511101', '511100', '市辖区', '0', '0', '510000-511100-511101-', '1');
INSERT INTO `base_area` VALUES ('511102', '511100', '市中区', '0', '0', '510000-511100-511102-', '1');
INSERT INTO `base_area` VALUES ('511111', '511100', '沙湾区', '0', '0', '510000-511100-511111-', '1');
INSERT INTO `base_area` VALUES ('511112', '511100', '五通桥区', '0', '0', '510000-511100-511112-', '1');
INSERT INTO `base_area` VALUES ('511113', '511100', '金口河区', '0', '0', '510000-511100-511113-', '1');
INSERT INTO `base_area` VALUES ('511123', '511100', '犍为县', '0', '0', '510000-511100-511123-', '1');
INSERT INTO `base_area` VALUES ('511124', '511100', '井研县', '0', '0', '510000-511100-511124-', '1');
INSERT INTO `base_area` VALUES ('511126', '511100', '夹江县', '0', '0', '510000-511100-511126-', '1');
INSERT INTO `base_area` VALUES ('511129', '511100', '沐川县', '0', '0', '510000-511100-511129-', '1');
INSERT INTO `base_area` VALUES ('511132', '511100', '峨边彝族自治县', '0', '0', '510000-511100-511132-', '1');
INSERT INTO `base_area` VALUES ('511133', '511100', '马边彝族自治县', '0', '0', '510000-511100-511133-', '1');
INSERT INTO `base_area` VALUES ('511181', '511100', '峨眉山市', '0', '0', '510000-511100-511181-', '1');
INSERT INTO `base_area` VALUES ('511300', '510000', '南充市', '637000', '0817', '510000-511300-', '1');
INSERT INTO `base_area` VALUES ('511301', '511300', '市辖区', '0', '0', '510000-511300-511301-', '1');
INSERT INTO `base_area` VALUES ('511302', '511300', '顺庆区', '0', '0', '510000-511300-511302-', '1');
INSERT INTO `base_area` VALUES ('511303', '511300', '高坪区', '0', '0', '510000-511300-511303-', '1');
INSERT INTO `base_area` VALUES ('511304', '511300', '嘉陵区', '0', '0', '510000-511300-511304-', '1');
INSERT INTO `base_area` VALUES ('511321', '511300', '南部县', '0', '0', '510000-511300-511321-', '1');
INSERT INTO `base_area` VALUES ('511322', '511300', '营山县', '0', '0', '510000-511300-511322-', '1');
INSERT INTO `base_area` VALUES ('511323', '511300', '蓬安县', '0', '0', '510000-511300-511323-', '1');
INSERT INTO `base_area` VALUES ('511324', '511300', '仪陇县', '0', '0', '510000-511300-511324-', '1');
INSERT INTO `base_area` VALUES ('511325', '511300', '西充县', '0', '0', '510000-511300-511325-', '1');
INSERT INTO `base_area` VALUES ('511381', '511300', '阆中市', '0', '0', '510000-511300-511381-', '1');
INSERT INTO `base_area` VALUES ('511400', '510000', '眉山市', '620000', '028', '510000-511400-', '1');
INSERT INTO `base_area` VALUES ('511401', '511400', '市辖区', '0', '0', '510000-511400-511401-', '1');
INSERT INTO `base_area` VALUES ('511402', '511400', '东坡区', '0', '0', '510000-511400-511402-', '1');
INSERT INTO `base_area` VALUES ('511421', '511400', '仁寿县', '0', '0', '510000-511400-511421-', '1');
INSERT INTO `base_area` VALUES ('511422', '511400', '彭山县', '0', '0', '510000-511400-511422-', '1');
INSERT INTO `base_area` VALUES ('511423', '511400', '洪雅县', '0', '0', '510000-511400-511423-', '1');
INSERT INTO `base_area` VALUES ('511424', '511400', '丹棱县', '0', '0', '510000-511400-511424-', '1');
INSERT INTO `base_area` VALUES ('511425', '511400', '青神县', '0', '0', '510000-511400-511425-', '1');
INSERT INTO `base_area` VALUES ('511500', '510000', '宜宾市', '644000', '0831', '510000-511500-', '1');
INSERT INTO `base_area` VALUES ('511501', '511500', '市辖区', '0', '0', '510000-511500-511501-', '1');
INSERT INTO `base_area` VALUES ('511502', '511500', '翠屏区', '0', '0', '510000-511500-511502-', '1');
INSERT INTO `base_area` VALUES ('511521', '511500', '宜宾县', '0', '0', '510000-511500-511521-', '1');
INSERT INTO `base_area` VALUES ('511522', '511500', '南溪县', '0', '0', '510000-511500-511522-', '1');
INSERT INTO `base_area` VALUES ('511523', '511500', '江安县', '0', '0', '510000-511500-511523-', '1');
INSERT INTO `base_area` VALUES ('511524', '511500', '长宁县', '0', '0', '510000-511500-511524-', '1');
INSERT INTO `base_area` VALUES ('511525', '511500', '高　县', '0', '0', '510000-511500-511525-', '1');
INSERT INTO `base_area` VALUES ('511526', '511500', '珙　县', '0', '0', '510000-511500-511526-', '1');
INSERT INTO `base_area` VALUES ('511527', '511500', '筠连县', '0', '0', '510000-511500-511527-', '1');
INSERT INTO `base_area` VALUES ('511528', '511500', '兴文县', '0', '0', '510000-511500-511528-', '1');
INSERT INTO `base_area` VALUES ('511529', '511500', '屏山县', '0', '0', '510000-511500-511529-', '1');
INSERT INTO `base_area` VALUES ('511600', '510000', '广安市', '638000', '0826', '510000-511600-', '1');
INSERT INTO `base_area` VALUES ('511601', '511600', '市辖区', '0', '0', '510000-511600-511601-', '1');
INSERT INTO `base_area` VALUES ('511602', '511600', '广安区', '0', '0', '510000-511600-511602-', '1');
INSERT INTO `base_area` VALUES ('511621', '511600', '岳池县', '0', '0', '510000-511600-511621-', '1');
INSERT INTO `base_area` VALUES ('511622', '511600', '武胜县', '0', '0', '510000-511600-511622-', '1');
INSERT INTO `base_area` VALUES ('511623', '511600', '邻水县', '0', '0', '510000-511600-511623-', '1');
INSERT INTO `base_area` VALUES ('511681', '511600', '华莹市', '0', '0', '510000-511600-511681-', '1');
INSERT INTO `base_area` VALUES ('511700', '510000', '达州市', '635000', '0818', '510000-511700-', '1');
INSERT INTO `base_area` VALUES ('511701', '511700', '市辖区', '0', '0', '510000-511700-511701-', '1');
INSERT INTO `base_area` VALUES ('511702', '511700', '通川区', '0', '0', '510000-511700-511702-', '1');
INSERT INTO `base_area` VALUES ('511721', '511700', '达　县', '0', '0', '510000-511700-511721-', '1');
INSERT INTO `base_area` VALUES ('511722', '511700', '宣汉县', '0', '0', '510000-511700-511722-', '1');
INSERT INTO `base_area` VALUES ('511723', '511700', '开江县', '0', '0', '510000-511700-511723-', '1');
INSERT INTO `base_area` VALUES ('511724', '511700', '大竹县', '0', '0', '510000-511700-511724-', '1');
INSERT INTO `base_area` VALUES ('511725', '511700', '渠　县', '0', '0', '510000-511700-511725-', '1');
INSERT INTO `base_area` VALUES ('511781', '511700', '万源市', '0', '0', '510000-511700-511781-', '1');
INSERT INTO `base_area` VALUES ('511800', '510000', '雅安市', '625000', '0835', '510000-511800-', '1');
INSERT INTO `base_area` VALUES ('511801', '511800', '市辖区', '0', '0', '510000-511800-511801-', '1');
INSERT INTO `base_area` VALUES ('511802', '511800', '雨城区', '0', '0', '510000-511800-511802-', '1');
INSERT INTO `base_area` VALUES ('511821', '511800', '名山县', '0', '0', '510000-511800-511821-', '1');
INSERT INTO `base_area` VALUES ('511822', '511800', '荥经县', '0', '0', '510000-511800-511822-', '1');
INSERT INTO `base_area` VALUES ('511823', '511800', '汉源县', '0', '0', '510000-511800-511823-', '1');
INSERT INTO `base_area` VALUES ('511824', '511800', '石棉县', '0', '0', '510000-511800-511824-', '1');
INSERT INTO `base_area` VALUES ('511825', '511800', '天全县', '0', '0', '510000-511800-511825-', '1');
INSERT INTO `base_area` VALUES ('511826', '511800', '芦山县', '0', '0', '510000-511800-511826-', '1');
INSERT INTO `base_area` VALUES ('511827', '511800', '宝兴县', '0', '0', '510000-511800-511827-', '1');
INSERT INTO `base_area` VALUES ('511900', '510000', '巴中市', '636600', '0827', '510000-511900-', '1');
INSERT INTO `base_area` VALUES ('511901', '511900', '市辖区', '0', '0', '510000-511900-511901-', '1');
INSERT INTO `base_area` VALUES ('511902', '511900', '巴州区', '0', '0', '510000-511900-511902-', '1');
INSERT INTO `base_area` VALUES ('511921', '511900', '通江县', '0', '0', '510000-511900-511921-', '1');
INSERT INTO `base_area` VALUES ('511922', '511900', '南江县', '0', '0', '510000-511900-511922-', '1');
INSERT INTO `base_area` VALUES ('511923', '511900', '平昌县', '0', '0', '510000-511900-511923-', '1');
INSERT INTO `base_area` VALUES ('512000', '510000', '资阳市', '641300', '028', '510000-512000-', '1');
INSERT INTO `base_area` VALUES ('512001', '512000', '市辖区', '0', '0', '510000-512000-512001-', '1');
INSERT INTO `base_area` VALUES ('512002', '512000', '雁江区', '0', '0', '510000-512000-512002-', '1');
INSERT INTO `base_area` VALUES ('512021', '512000', '安岳县', '0', '0', '510000-512000-512021-', '1');
INSERT INTO `base_area` VALUES ('512022', '512000', '乐至县', '0', '0', '510000-512000-512022-', '1');
INSERT INTO `base_area` VALUES ('512081', '512000', '简阳市', '0', '0', '510000-512000-512081-', '1');
INSERT INTO `base_area` VALUES ('513200', '510000', '阿坝州', '624000', '0837', '510000-513200-', '1');
INSERT INTO `base_area` VALUES ('513221', '513200', '汶川县', '0', '0', '510000-513200-513221-', '1');
INSERT INTO `base_area` VALUES ('513222', '513200', '理　县', '0', '0', '510000-513200-513222-', '1');
INSERT INTO `base_area` VALUES ('513223', '513200', '茂　县', '0', '0', '510000-513200-513223-', '1');
INSERT INTO `base_area` VALUES ('513224', '513200', '松潘县', '0', '0', '510000-513200-513224-', '1');
INSERT INTO `base_area` VALUES ('513225', '513200', '九寨沟县', '0', '0', '510000-513200-513225-', '1');
INSERT INTO `base_area` VALUES ('513226', '513200', '金川县', '0', '0', '510000-513200-513226-', '1');
INSERT INTO `base_area` VALUES ('513227', '513200', '小金县', '0', '0', '510000-513200-513227-', '1');
INSERT INTO `base_area` VALUES ('513228', '513200', '黑水县', '0', '0', '510000-513200-513228-', '1');
INSERT INTO `base_area` VALUES ('513229', '513200', '马尔康县', '0', '0', '510000-513200-513229-', '1');
INSERT INTO `base_area` VALUES ('513230', '513200', '壤塘县', '0', '0', '510000-513200-513230-', '1');
INSERT INTO `base_area` VALUES ('513231', '513200', '阿坝县', '0', '0', '510000-513200-513231-', '1');
INSERT INTO `base_area` VALUES ('513232', '513200', '若尔盖县', '0', '0', '510000-513200-513232-', '1');
INSERT INTO `base_area` VALUES ('513233', '513200', '红原县', '0', '0', '510000-513200-513233-', '1');
INSERT INTO `base_area` VALUES ('513300', '510000', '甘孜州', '626000', '0836', '510000-513300-', '1');
INSERT INTO `base_area` VALUES ('513321', '513300', '康定县', '0', '0', '510000-513300-513321-', '1');
INSERT INTO `base_area` VALUES ('513322', '513300', '泸定县', '0', '0', '510000-513300-513322-', '1');
INSERT INTO `base_area` VALUES ('513323', '513300', '丹巴县', '0', '0', '510000-513300-513323-', '1');
INSERT INTO `base_area` VALUES ('513324', '513300', '九龙县', '0', '0', '510000-513300-513324-', '1');
INSERT INTO `base_area` VALUES ('513325', '513300', '雅江县', '0', '0', '510000-513300-513325-', '1');
INSERT INTO `base_area` VALUES ('513326', '513300', '道孚县', '0', '0', '510000-513300-513326-', '1');
INSERT INTO `base_area` VALUES ('513327', '513300', '炉霍县', '0', '0', '510000-513300-513327-', '1');
INSERT INTO `base_area` VALUES ('513328', '513300', '甘孜县', '0', '0', '510000-513300-513328-', '1');
INSERT INTO `base_area` VALUES ('513329', '513300', '新龙县', '0', '0', '510000-513300-513329-', '1');
INSERT INTO `base_area` VALUES ('513330', '513300', '德格县', '0', '0', '510000-513300-513330-', '1');
INSERT INTO `base_area` VALUES ('513331', '513300', '白玉县', '0', '0', '510000-513300-513331-', '1');
INSERT INTO `base_area` VALUES ('513332', '513300', '石渠县', '0', '0', '510000-513300-513332-', '1');
INSERT INTO `base_area` VALUES ('513333', '513300', '色达县', '0', '0', '510000-513300-513333-', '1');
INSERT INTO `base_area` VALUES ('513334', '513300', '理塘县', '0', '0', '510000-513300-513334-', '1');
INSERT INTO `base_area` VALUES ('513335', '513300', '巴塘县', '0', '0', '510000-513300-513335-', '1');
INSERT INTO `base_area` VALUES ('513336', '513300', '乡城县', '0', '0', '510000-513300-513336-', '1');
INSERT INTO `base_area` VALUES ('513337', '513300', '稻城县', '0', '0', '510000-513300-513337-', '1');
INSERT INTO `base_area` VALUES ('513338', '513300', '得荣县', '0', '0', '510000-513300-513338-', '1');
INSERT INTO `base_area` VALUES ('513400', '510000', '凉山州', '615000', '0834', '510000-513400-', '1');
INSERT INTO `base_area` VALUES ('513401', '513400', '西昌市', '0', '0', '510000-513400-513401-', '1');
INSERT INTO `base_area` VALUES ('513422', '513400', '木里藏族自治县', '0', '0', '510000-513400-513422-', '1');
INSERT INTO `base_area` VALUES ('513423', '513400', '盐源县', '0', '0', '510000-513400-513423-', '1');
INSERT INTO `base_area` VALUES ('513424', '513400', '德昌县', '0', '0', '510000-513400-513424-', '1');
INSERT INTO `base_area` VALUES ('513425', '513400', '会理县', '0', '0', '510000-513400-513425-', '1');
INSERT INTO `base_area` VALUES ('513426', '513400', '会东县', '0', '0', '510000-513400-513426-', '1');
INSERT INTO `base_area` VALUES ('513427', '513400', '宁南县', '0', '0', '510000-513400-513427-', '1');
INSERT INTO `base_area` VALUES ('513428', '513400', '普格县', '0', '0', '510000-513400-513428-', '1');
INSERT INTO `base_area` VALUES ('513429', '513400', '布拖县', '0', '0', '510000-513400-513429-', '1');
INSERT INTO `base_area` VALUES ('513430', '513400', '金阳县', '0', '0', '510000-513400-513430-', '1');
INSERT INTO `base_area` VALUES ('513431', '513400', '昭觉县', '0', '0', '510000-513400-513431-', '1');
INSERT INTO `base_area` VALUES ('513432', '513400', '喜德县', '0', '0', '510000-513400-513432-', '1');
INSERT INTO `base_area` VALUES ('513433', '513400', '冕宁县', '0', '0', '510000-513400-513433-', '1');
INSERT INTO `base_area` VALUES ('513434', '513400', '越西县', '0', '0', '510000-513400-513434-', '1');
INSERT INTO `base_area` VALUES ('513435', '513400', '甘洛县', '0', '0', '510000-513400-513435-', '1');
INSERT INTO `base_area` VALUES ('513436', '513400', '美姑县', '0', '0', '510000-513400-513436-', '1');
INSERT INTO `base_area` VALUES ('513437', '513400', '雷波县', '0', '0', '510000-513400-513437-', '1');
INSERT INTO `base_area` VALUES ('520000', '0', '贵州省', '0', '0', '520000-', '1');
INSERT INTO `base_area` VALUES ('520100', '520000', '贵阳市', '550000', '0851', '520000-520100-', '1');
INSERT INTO `base_area` VALUES ('520101', '520100', '市辖区', '0', '0', '520000-520100-520101-', '1');
INSERT INTO `base_area` VALUES ('520102', '520100', '南明区', '0', '0', '520000-520100-520102-', '1');
INSERT INTO `base_area` VALUES ('520103', '520100', '云岩区', '0', '0', '520000-520100-520103-', '1');
INSERT INTO `base_area` VALUES ('520111', '520100', '花溪区', '0', '0', '520000-520100-520111-', '1');
INSERT INTO `base_area` VALUES ('520112', '520100', '乌当区', '0', '0', '520000-520100-520112-', '1');
INSERT INTO `base_area` VALUES ('520113', '520100', '白云区', '0', '0', '520000-520100-520113-', '1');
INSERT INTO `base_area` VALUES ('520114', '520100', '小河区', '0', '0', '520000-520100-520114-', '1');
INSERT INTO `base_area` VALUES ('520121', '520100', '开阳县', '0', '0', '520000-520100-520121-', '1');
INSERT INTO `base_area` VALUES ('520122', '520100', '息烽县', '0', '0', '520000-520100-520122-', '1');
INSERT INTO `base_area` VALUES ('520123', '520100', '修文县', '0', '0', '520000-520100-520123-', '1');
INSERT INTO `base_area` VALUES ('520181', '520100', '清镇市', '0', '0', '520000-520100-520181-', '1');
INSERT INTO `base_area` VALUES ('520200', '520000', '六盘水市', '553000', '0858', '520000-520200-', '1');
INSERT INTO `base_area` VALUES ('520201', '520200', '钟山区', '0', '0', '520000-520200-520201-', '1');
INSERT INTO `base_area` VALUES ('520203', '520200', '六枝特区', '0', '0', '520000-520200-520203-', '1');
INSERT INTO `base_area` VALUES ('520221', '520200', '水城县', '0', '0', '520000-520200-520221-', '1');
INSERT INTO `base_area` VALUES ('520222', '520200', '盘　县', '0', '0', '520000-520200-520222-', '1');
INSERT INTO `base_area` VALUES ('520300', '520000', '遵义市', '563000', '0852', '520000-520300-', '1');
INSERT INTO `base_area` VALUES ('520301', '520300', '市辖区', '0', '0', '520000-520300-520301-', '1');
INSERT INTO `base_area` VALUES ('520302', '520300', '红花岗区', '0', '0', '520000-520300-520302-', '1');
INSERT INTO `base_area` VALUES ('520303', '520300', '汇川区', '0', '0', '520000-520300-520303-', '1');
INSERT INTO `base_area` VALUES ('520321', '520300', '遵义县', '0', '0', '520000-520300-520321-', '1');
INSERT INTO `base_area` VALUES ('520322', '520300', '桐梓县', '0', '0', '520000-520300-520322-', '1');
INSERT INTO `base_area` VALUES ('520323', '520300', '绥阳县', '0', '0', '520000-520300-520323-', '1');
INSERT INTO `base_area` VALUES ('520324', '520300', '正安县', '0', '0', '520000-520300-520324-', '1');
INSERT INTO `base_area` VALUES ('520325', '520300', '道真仡佬族苗族自治县', '0', '0', '520000-520300-520325-', '1');
INSERT INTO `base_area` VALUES ('520326', '520300', '务川仡佬族苗族自治县', '0', '0', '520000-520300-520326-', '1');
INSERT INTO `base_area` VALUES ('520327', '520300', '凤冈县', '0', '0', '520000-520300-520327-', '1');
INSERT INTO `base_area` VALUES ('520328', '520300', '湄潭县', '0', '0', '520000-520300-520328-', '1');
INSERT INTO `base_area` VALUES ('520329', '520300', '余庆县', '0', '0', '520000-520300-520329-', '1');
INSERT INTO `base_area` VALUES ('520330', '520300', '习水县', '0', '0', '520000-520300-520330-', '1');
INSERT INTO `base_area` VALUES ('520381', '520300', '赤水市', '0', '0', '520000-520300-520381-', '1');
INSERT INTO `base_area` VALUES ('520382', '520300', '仁怀市', '0', '0', '520000-520300-520382-', '1');
INSERT INTO `base_area` VALUES ('520400', '520000', '安顺市', '561000', '0853', '520000-520400-', '1');
INSERT INTO `base_area` VALUES ('520401', '520400', '市辖区', '0', '0', '520000-520400-520401-', '1');
INSERT INTO `base_area` VALUES ('520402', '520400', '西秀区', '0', '0', '520000-520400-520402-', '1');
INSERT INTO `base_area` VALUES ('520421', '520400', '平坝县', '0', '0', '520000-520400-520421-', '1');
INSERT INTO `base_area` VALUES ('520422', '520400', '普定县', '0', '0', '520000-520400-520422-', '1');
INSERT INTO `base_area` VALUES ('520423', '520400', '镇宁布依族苗族自治县', '0', '0', '520000-520400-520423-', '1');
INSERT INTO `base_area` VALUES ('520424', '520400', '关岭布依族苗族自治县', '0', '0', '520000-520400-520424-', '1');
INSERT INTO `base_area` VALUES ('520425', '520400', '紫云苗族布依族自治县', '0', '0', '520000-520400-520425-', '1');
INSERT INTO `base_area` VALUES ('522200', '520000', '铜仁地区', '554300', '0856', '520000-522200-', '1');
INSERT INTO `base_area` VALUES ('522201', '522200', '铜仁市', '0', '0', '520000-522200-522201-', '1');
INSERT INTO `base_area` VALUES ('522222', '522200', '江口县', '0', '0', '520000-522200-522222-', '1');
INSERT INTO `base_area` VALUES ('522223', '522200', '玉屏侗族自治县', '0', '0', '520000-522200-522223-', '1');
INSERT INTO `base_area` VALUES ('522224', '522200', '石阡县', '0', '0', '520000-522200-522224-', '1');
INSERT INTO `base_area` VALUES ('522225', '522200', '思南县', '0', '0', '520000-522200-522225-', '1');
INSERT INTO `base_area` VALUES ('522226', '522200', '印江土家族苗族自治县', '0', '0', '520000-522200-522226-', '1');
INSERT INTO `base_area` VALUES ('522227', '522200', '德江县', '0', '0', '520000-522200-522227-', '1');
INSERT INTO `base_area` VALUES ('522228', '522200', '沿河土家族自治县', '0', '0', '520000-522200-522228-', '1');
INSERT INTO `base_area` VALUES ('522229', '522200', '松桃苗族自治县', '0', '0', '520000-522200-522229-', '1');
INSERT INTO `base_area` VALUES ('522230', '522200', '万山特区', '0', '0', '520000-522200-522230-', '1');
INSERT INTO `base_area` VALUES ('522300', '520000', '黔西南州', '562400', '0859', '520000-522300-', '1');
INSERT INTO `base_area` VALUES ('522301', '522300', '兴义市', '0', '0', '520000-522300-522301-', '1');
INSERT INTO `base_area` VALUES ('522322', '522300', '兴仁县', '0', '0', '520000-522300-522322-', '1');
INSERT INTO `base_area` VALUES ('522323', '522300', '普安县', '0', '0', '520000-522300-522323-', '1');
INSERT INTO `base_area` VALUES ('522324', '522300', '晴隆县', '0', '0', '520000-522300-522324-', '1');
INSERT INTO `base_area` VALUES ('522325', '522300', '贞丰县', '0', '0', '520000-522300-522325-', '1');
INSERT INTO `base_area` VALUES ('522326', '522300', '望谟县', '0', '0', '520000-522300-522326-', '1');
INSERT INTO `base_area` VALUES ('522327', '522300', '册亨县', '0', '0', '520000-522300-522327-', '1');
INSERT INTO `base_area` VALUES ('522328', '522300', '安龙县', '0', '0', '520000-522300-522328-', '1');
INSERT INTO `base_area` VALUES ('522400', '520000', '毕节地区', '551700', '0857', '520000-522400-', '1');
INSERT INTO `base_area` VALUES ('522401', '522400', '毕节市', '0', '0', '520000-522400-522401-', '1');
INSERT INTO `base_area` VALUES ('522422', '522400', '大方县', '0', '0', '520000-522400-522422-', '1');
INSERT INTO `base_area` VALUES ('522423', '522400', '黔西县', '0', '0', '520000-522400-522423-', '1');
INSERT INTO `base_area` VALUES ('522424', '522400', '金沙县', '0', '0', '520000-522400-522424-', '1');
INSERT INTO `base_area` VALUES ('522425', '522400', '织金县', '0', '0', '520000-522400-522425-', '1');
INSERT INTO `base_area` VALUES ('522426', '522400', '纳雍县', '0', '0', '520000-522400-522426-', '1');
INSERT INTO `base_area` VALUES ('522427', '522400', '威宁彝族回族苗族自治县', '0', '0', '520000-522400-522427-', '1');
INSERT INTO `base_area` VALUES ('522428', '522400', '赫章县', '0', '0', '520000-522400-522428-', '1');
INSERT INTO `base_area` VALUES ('522600', '520000', '黔东南州', '556000', '0855', '520000-522600-', '1');
INSERT INTO `base_area` VALUES ('522601', '522600', '凯里市', '0', '0', '520000-522600-522601-', '1');
INSERT INTO `base_area` VALUES ('522622', '522600', '黄平县', '0', '0', '520000-522600-522622-', '1');
INSERT INTO `base_area` VALUES ('522623', '522600', '施秉县', '0', '0', '520000-522600-522623-', '1');
INSERT INTO `base_area` VALUES ('522624', '522600', '三穗县', '0', '0', '520000-522600-522624-', '1');
INSERT INTO `base_area` VALUES ('522625', '522600', '镇远县', '0', '0', '520000-522600-522625-', '1');
INSERT INTO `base_area` VALUES ('522626', '522600', '岑巩县', '0', '0', '520000-522600-522626-', '1');
INSERT INTO `base_area` VALUES ('522627', '522600', '天柱县', '0', '0', '520000-522600-522627-', '1');
INSERT INTO `base_area` VALUES ('522628', '522600', '锦屏县', '0', '0', '520000-522600-522628-', '1');
INSERT INTO `base_area` VALUES ('522629', '522600', '剑河县', '0', '0', '520000-522600-522629-', '1');
INSERT INTO `base_area` VALUES ('522630', '522600', '台江县', '0', '0', '520000-522600-522630-', '1');
INSERT INTO `base_area` VALUES ('522631', '522600', '黎平县', '0', '0', '520000-522600-522631-', '1');
INSERT INTO `base_area` VALUES ('522632', '522600', '榕江县', '0', '0', '520000-522600-522632-', '1');
INSERT INTO `base_area` VALUES ('522633', '522600', '从江县', '0', '0', '520000-522600-522633-', '1');
INSERT INTO `base_area` VALUES ('522634', '522600', '雷山县', '0', '0', '520000-522600-522634-', '1');
INSERT INTO `base_area` VALUES ('522635', '522600', '麻江县', '0', '0', '520000-522600-522635-', '1');
INSERT INTO `base_area` VALUES ('522636', '522600', '丹寨县', '0', '0', '520000-522600-522636-', '1');
INSERT INTO `base_area` VALUES ('522700', '520000', '黔南州', '558000', '0854', '520000-522700-', '1');
INSERT INTO `base_area` VALUES ('522701', '522700', '都匀市', '0', '0', '520000-522700-522701-', '1');
INSERT INTO `base_area` VALUES ('522702', '522700', '福泉市', '0', '0', '520000-522700-522702-', '1');
INSERT INTO `base_area` VALUES ('522722', '522700', '荔波县', '0', '0', '520000-522700-522722-', '1');
INSERT INTO `base_area` VALUES ('522723', '522700', '贵定县', '0', '0', '520000-522700-522723-', '1');
INSERT INTO `base_area` VALUES ('522725', '522700', '瓮安县', '0', '0', '520000-522700-522725-', '1');
INSERT INTO `base_area` VALUES ('522726', '522700', '独山县', '0', '0', '520000-522700-522726-', '1');
INSERT INTO `base_area` VALUES ('522727', '522700', '平塘县', '0', '0', '520000-522700-522727-', '1');
INSERT INTO `base_area` VALUES ('522728', '522700', '罗甸县', '0', '0', '520000-522700-522728-', '1');
INSERT INTO `base_area` VALUES ('522729', '522700', '长顺县', '0', '0', '520000-522700-522729-', '1');
INSERT INTO `base_area` VALUES ('522730', '522700', '龙里县', '0', '0', '520000-522700-522730-', '1');
INSERT INTO `base_area` VALUES ('522731', '522700', '惠水县', '0', '0', '520000-522700-522731-', '1');
INSERT INTO `base_area` VALUES ('522732', '522700', '三都水族自治县', '0', '0', '520000-522700-522732-', '1');
INSERT INTO `base_area` VALUES ('530000', '0', '云南省', '0', '0', '530000-', '1');
INSERT INTO `base_area` VALUES ('530100', '530000', '昆明市', '650000', '0871', '530000-530100-', '1');
INSERT INTO `base_area` VALUES ('530101', '530100', '市辖区', '0', '0', '530000-530100-530101-', '1');
INSERT INTO `base_area` VALUES ('530102', '530100', '五华区', '0', '0', '530000-530100-530102-', '1');
INSERT INTO `base_area` VALUES ('530103', '530100', '盘龙区', '0', '0', '530000-530100-530103-', '1');
INSERT INTO `base_area` VALUES ('530111', '530100', '官渡区', '0', '0', '530000-530100-530111-', '1');
INSERT INTO `base_area` VALUES ('530112', '530100', '西山区', '0', '0', '530000-530100-530112-', '1');
INSERT INTO `base_area` VALUES ('530113', '530100', '东川区', '0', '0', '530000-530100-530113-', '1');
INSERT INTO `base_area` VALUES ('530121', '530100', '呈贡县', '0', '0', '530000-530100-530121-', '1');
INSERT INTO `base_area` VALUES ('530122', '530100', '晋宁县', '0', '0', '530000-530100-530122-', '1');
INSERT INTO `base_area` VALUES ('530124', '530100', '富民县', '0', '0', '530000-530100-530124-', '1');
INSERT INTO `base_area` VALUES ('530125', '530100', '宜良县', '0', '0', '530000-530100-530125-', '1');
INSERT INTO `base_area` VALUES ('530126', '530100', '石林彝族自治县', '0', '0', '530000-530100-530126-', '1');
INSERT INTO `base_area` VALUES ('530127', '530100', '嵩明县', '0', '0', '530000-530100-530127-', '1');
INSERT INTO `base_area` VALUES ('530128', '530100', '禄劝彝族苗族自治县', '0', '0', '530000-530100-530128-', '1');
INSERT INTO `base_area` VALUES ('530129', '530100', '寻甸回族彝族自治县', '0', '0', '530000-530100-530129-', '1');
INSERT INTO `base_area` VALUES ('530181', '530100', '安宁市', '0', '0', '530000-530100-530181-', '1');
INSERT INTO `base_area` VALUES ('530300', '530000', '曲靖市', '655000', '0874', '530000-530300-', '1');
INSERT INTO `base_area` VALUES ('530301', '530300', '市辖区', '0', '0', '530000-530300-530301-', '1');
INSERT INTO `base_area` VALUES ('530302', '530300', '麒麟区', '0', '0', '530000-530300-530302-', '1');
INSERT INTO `base_area` VALUES ('530321', '530300', '马龙县', '0', '0', '530000-530300-530321-', '1');
INSERT INTO `base_area` VALUES ('530322', '530300', '陆良县', '0', '0', '530000-530300-530322-', '1');
INSERT INTO `base_area` VALUES ('530323', '530300', '师宗县', '0', '0', '530000-530300-530323-', '1');
INSERT INTO `base_area` VALUES ('530324', '530300', '罗平县', '0', '0', '530000-530300-530324-', '1');
INSERT INTO `base_area` VALUES ('530325', '530300', '富源县', '0', '0', '530000-530300-530325-', '1');
INSERT INTO `base_area` VALUES ('530326', '530300', '会泽县', '0', '0', '530000-530300-530326-', '1');
INSERT INTO `base_area` VALUES ('530328', '530300', '沾益县', '0', '0', '530000-530300-530328-', '1');
INSERT INTO `base_area` VALUES ('530381', '530300', '宣威市', '0', '0', '530000-530300-530381-', '1');
INSERT INTO `base_area` VALUES ('530400', '530000', '玉溪市', '653100', '0877', '530000-530400-', '1');
INSERT INTO `base_area` VALUES ('530401', '530400', '市辖区', '0', '0', '530000-530400-530401-', '1');
INSERT INTO `base_area` VALUES ('530402', '530400', '红塔区', '0', '0', '530000-530400-530402-', '1');
INSERT INTO `base_area` VALUES ('530421', '530400', '江川县', '0', '0', '530000-530400-530421-', '1');
INSERT INTO `base_area` VALUES ('530422', '530400', '澄江县', '0', '0', '530000-530400-530422-', '1');
INSERT INTO `base_area` VALUES ('530423', '530400', '通海县', '0', '0', '530000-530400-530423-', '1');
INSERT INTO `base_area` VALUES ('530424', '530400', '华宁县', '0', '0', '530000-530400-530424-', '1');
INSERT INTO `base_area` VALUES ('530425', '530400', '易门县', '0', '0', '530000-530400-530425-', '1');
INSERT INTO `base_area` VALUES ('530426', '530400', '峨山彝族自治县', '0', '0', '530000-530400-530426-', '1');
INSERT INTO `base_area` VALUES ('530427', '530400', '新平彝族傣族自治县', '0', '0', '530000-530400-530427-', '1');
INSERT INTO `base_area` VALUES ('530428', '530400', '元江哈尼族彝族傣族自治县', '0', '0', '530000-530400-530428-', '1');
INSERT INTO `base_area` VALUES ('530500', '530000', '保山市', '678000', '0875', '530000-530500-', '1');
INSERT INTO `base_area` VALUES ('530501', '530500', '市辖区', '0', '0', '530000-530500-530501-', '1');
INSERT INTO `base_area` VALUES ('530502', '530500', '隆阳区', '0', '0', '530000-530500-530502-', '1');
INSERT INTO `base_area` VALUES ('530521', '530500', '施甸县', '0', '0', '530000-530500-530521-', '1');
INSERT INTO `base_area` VALUES ('530522', '530500', '腾冲县', '0', '0', '530000-530500-530522-', '1');
INSERT INTO `base_area` VALUES ('530523', '530500', '龙陵县', '0', '0', '530000-530500-530523-', '1');
INSERT INTO `base_area` VALUES ('530524', '530500', '昌宁县', '0', '0', '530000-530500-530524-', '1');
INSERT INTO `base_area` VALUES ('530600', '530000', '昭通市', '657000', '0870', '530000-530600-', '1');
INSERT INTO `base_area` VALUES ('530601', '530600', '市辖区', '0', '0', '530000-530600-530601-', '1');
INSERT INTO `base_area` VALUES ('530602', '530600', '昭阳区', '0', '0', '530000-530600-530602-', '1');
INSERT INTO `base_area` VALUES ('530621', '530600', '鲁甸县', '0', '0', '530000-530600-530621-', '1');
INSERT INTO `base_area` VALUES ('530622', '530600', '巧家县', '0', '0', '530000-530600-530622-', '1');
INSERT INTO `base_area` VALUES ('530623', '530600', '盐津县', '0', '0', '530000-530600-530623-', '1');
INSERT INTO `base_area` VALUES ('530624', '530600', '大关县', '0', '0', '530000-530600-530624-', '1');
INSERT INTO `base_area` VALUES ('530625', '530600', '永善县', '0', '0', '530000-530600-530625-', '1');
INSERT INTO `base_area` VALUES ('530626', '530600', '绥江县', '0', '0', '530000-530600-530626-', '1');
INSERT INTO `base_area` VALUES ('530627', '530600', '镇雄县', '0', '0', '530000-530600-530627-', '1');
INSERT INTO `base_area` VALUES ('530628', '530600', '彝良县', '0', '0', '530000-530600-530628-', '1');
INSERT INTO `base_area` VALUES ('530629', '530600', '威信县', '0', '0', '530000-530600-530629-', '1');
INSERT INTO `base_area` VALUES ('530630', '530600', '水富县', '0', '0', '530000-530600-530630-', '1');
INSERT INTO `base_area` VALUES ('530700', '530000', '丽江市', '674100', '0888', '530000-530700-', '1');
INSERT INTO `base_area` VALUES ('530701', '530700', '市辖区', '0', '0', '530000-530700-530701-', '1');
INSERT INTO `base_area` VALUES ('530702', '530700', '古城区', '0', '0', '530000-530700-530702-', '1');
INSERT INTO `base_area` VALUES ('530721', '530700', '玉龙纳西族自治县', '0', '0', '530000-530700-530721-', '1');
INSERT INTO `base_area` VALUES ('530722', '530700', '永胜县', '0', '0', '530000-530700-530722-', '1');
INSERT INTO `base_area` VALUES ('530723', '530700', '华坪县', '0', '0', '530000-530700-530723-', '1');
INSERT INTO `base_area` VALUES ('530724', '530700', '宁蒗彝族自治县', '0', '0', '530000-530700-530724-', '1');
INSERT INTO `base_area` VALUES ('530800', '530000', '普洱市', '665000', '0879', '530000-530800-', '1');
INSERT INTO `base_area` VALUES ('530801', '530800', '市辖区', '0', '0', '530000-530800-530801-', '1');
INSERT INTO `base_area` VALUES ('530802', '530800', '思茅区', '0', '0', '530000-530800-530802-', '1');
INSERT INTO `base_area` VALUES ('530821', '530800', '普洱哈尼族彝族自治县', '0', '0', '530000-530800-530821-', '1');
INSERT INTO `base_area` VALUES ('530822', '530800', '墨江哈尼族自治县', '0', '0', '530000-530800-530822-', '1');
INSERT INTO `base_area` VALUES ('530823', '530800', '景东彝族自治县', '0', '0', '530000-530800-530823-', '1');
INSERT INTO `base_area` VALUES ('530824', '530800', '景谷傣族彝族自治县', '0', '0', '530000-530800-530824-', '1');
INSERT INTO `base_area` VALUES ('530825', '530800', '镇沅彝族哈尼族拉祜族自治县', '0', '0', '530000-530800-530825-', '1');
INSERT INTO `base_area` VALUES ('530826', '530800', '江城哈尼族彝族自治县', '0', '0', '530000-530800-530826-', '1');
INSERT INTO `base_area` VALUES ('530827', '530800', '孟连傣族拉祜族佤族自治县', '0', '0', '530000-530800-530827-', '1');
INSERT INTO `base_area` VALUES ('530828', '530800', '澜沧拉祜族自治县', '0', '0', '530000-530800-530828-', '1');
INSERT INTO `base_area` VALUES ('530829', '530800', '西盟佤族自治县', '0', '0', '530000-530800-530829-', '1');
INSERT INTO `base_area` VALUES ('530900', '530000', '临沧市', '677000', '0883', '530000-530900-', '1');
INSERT INTO `base_area` VALUES ('530901', '530900', '市辖区', '0', '0', '530000-530900-530901-', '1');
INSERT INTO `base_area` VALUES ('530902', '530900', '临翔区', '0', '0', '530000-530900-530902-', '1');
INSERT INTO `base_area` VALUES ('530921', '530900', '凤庆县', '0', '0', '530000-530900-530921-', '1');
INSERT INTO `base_area` VALUES ('530922', '530900', '云　县', '0', '0', '530000-530900-530922-', '1');
INSERT INTO `base_area` VALUES ('530923', '530900', '永德县', '0', '0', '530000-530900-530923-', '1');
INSERT INTO `base_area` VALUES ('530924', '530900', '镇康县', '0', '0', '530000-530900-530924-', '1');
INSERT INTO `base_area` VALUES ('530925', '530900', '双江拉祜族佤族布朗族傣族自治县', '0', '0', '530000-530900-530925-', '1');
INSERT INTO `base_area` VALUES ('530926', '530900', '耿马傣族佤族自治县', '0', '0', '530000-530900-530926-', '1');
INSERT INTO `base_area` VALUES ('530927', '530900', '沧源佤族自治县', '0', '0', '530000-530900-530927-', '1');
INSERT INTO `base_area` VALUES ('532300', '530000', '楚雄州', '675000', '0878', '530000-532300-', '1');
INSERT INTO `base_area` VALUES ('532301', '532300', '楚雄市', '0', '0', '530000-532300-532301-', '1');
INSERT INTO `base_area` VALUES ('532322', '532300', '双柏县', '0', '0', '530000-532300-532322-', '1');
INSERT INTO `base_area` VALUES ('532323', '532300', '牟定县', '0', '0', '530000-532300-532323-', '1');
INSERT INTO `base_area` VALUES ('532324', '532300', '南华县', '0', '0', '530000-532300-532324-', '1');
INSERT INTO `base_area` VALUES ('532325', '532300', '姚安县', '0', '0', '530000-532300-532325-', '1');
INSERT INTO `base_area` VALUES ('532326', '532300', '大姚县', '0', '0', '530000-532300-532326-', '1');
INSERT INTO `base_area` VALUES ('532327', '532300', '永仁县', '0', '0', '530000-532300-532327-', '1');
INSERT INTO `base_area` VALUES ('532328', '532300', '元谋县', '0', '0', '530000-532300-532328-', '1');
INSERT INTO `base_area` VALUES ('532329', '532300', '武定县', '0', '0', '530000-532300-532329-', '1');
INSERT INTO `base_area` VALUES ('532331', '532300', '禄丰县', '0', '0', '530000-532300-532331-', '1');
INSERT INTO `base_area` VALUES ('532500', '530000', '红河州', '661400', '0873', '530000-532500-', '1');
INSERT INTO `base_area` VALUES ('532501', '532500', '个旧市', '0', '0', '530000-532500-532501-', '1');
INSERT INTO `base_area` VALUES ('532502', '532500', '开远市', '0', '0', '530000-532500-532502-', '1');
INSERT INTO `base_area` VALUES ('532522', '532500', '蒙自县', '0', '0', '530000-532500-532522-', '1');
INSERT INTO `base_area` VALUES ('532523', '532500', '屏边苗族自治县', '0', '0', '530000-532500-532523-', '1');
INSERT INTO `base_area` VALUES ('532524', '532500', '建水县', '0', '0', '530000-532500-532524-', '1');
INSERT INTO `base_area` VALUES ('532525', '532500', '石屏县', '0', '0', '530000-532500-532525-', '1');
INSERT INTO `base_area` VALUES ('532526', '532500', '弥勒县', '0', '0', '530000-532500-532526-', '1');
INSERT INTO `base_area` VALUES ('532527', '532500', '泸西县', '0', '0', '530000-532500-532527-', '1');
INSERT INTO `base_area` VALUES ('532528', '532500', '元阳县', '0', '0', '530000-532500-532528-', '1');
INSERT INTO `base_area` VALUES ('532529', '532500', '红河县', '0', '0', '530000-532500-532529-', '1');
INSERT INTO `base_area` VALUES ('532530', '532500', '金平苗族瑶族傣族自治县', '0', '0', '530000-532500-532530-', '1');
INSERT INTO `base_area` VALUES ('532531', '532500', '绿春县', '0', '0', '530000-532500-532531-', '1');
INSERT INTO `base_area` VALUES ('532532', '532500', '河口瑶族自治县', '0', '0', '530000-532500-532532-', '1');
INSERT INTO `base_area` VALUES ('532600', '530000', '文山州', '663000', '0876', '530000-532600-', '1');
INSERT INTO `base_area` VALUES ('532621', '532600', '文山县', '0', '0', '530000-532600-532621-', '1');
INSERT INTO `base_area` VALUES ('532622', '532600', '砚山县', '0', '0', '530000-532600-532622-', '1');
INSERT INTO `base_area` VALUES ('532623', '532600', '西畴县', '0', '0', '530000-532600-532623-', '1');
INSERT INTO `base_area` VALUES ('532624', '532600', '麻栗坡县', '0', '0', '530000-532600-532624-', '1');
INSERT INTO `base_area` VALUES ('532625', '532600', '马关县', '0', '0', '530000-532600-532625-', '1');
INSERT INTO `base_area` VALUES ('532626', '532600', '丘北县', '0', '0', '530000-532600-532626-', '1');
INSERT INTO `base_area` VALUES ('532627', '532600', '广南县', '0', '0', '530000-532600-532627-', '1');
INSERT INTO `base_area` VALUES ('532628', '532600', '富宁县', '0', '0', '530000-532600-532628-', '1');
INSERT INTO `base_area` VALUES ('532800', '530000', '西双版纳州', '666100', '0691', '530000-532800-', '1');
INSERT INTO `base_area` VALUES ('532801', '532800', '景洪市', '0', '0', '530000-532800-532801-', '1');
INSERT INTO `base_area` VALUES ('532822', '532800', '勐海县', '0', '0', '530000-532800-532822-', '1');
INSERT INTO `base_area` VALUES ('532823', '532800', '勐腊县', '0', '0', '530000-532800-532823-', '1');
INSERT INTO `base_area` VALUES ('532900', '530000', '大理州', '671000', '0872', '530000-532900-', '1');
INSERT INTO `base_area` VALUES ('532901', '532900', '大理市', '0', '0', '530000-532900-532901-', '1');
INSERT INTO `base_area` VALUES ('532922', '532900', '漾濞彝族自治县', '0', '0', '530000-532900-532922-', '1');
INSERT INTO `base_area` VALUES ('532923', '532900', '祥云县', '0', '0', '530000-532900-532923-', '1');
INSERT INTO `base_area` VALUES ('532924', '532900', '宾川县', '0', '0', '530000-532900-532924-', '1');
INSERT INTO `base_area` VALUES ('532925', '532900', '弥渡县', '0', '0', '530000-532900-532925-', '1');
INSERT INTO `base_area` VALUES ('532926', '532900', '南涧彝族自治县', '0', '0', '530000-532900-532926-', '1');
INSERT INTO `base_area` VALUES ('532927', '532900', '巍山彝族回族自治县', '0', '0', '530000-532900-532927-', '1');
INSERT INTO `base_area` VALUES ('532928', '532900', '永平县', '0', '0', '530000-532900-532928-', '1');
INSERT INTO `base_area` VALUES ('532929', '532900', '云龙县', '0', '0', '530000-532900-532929-', '1');
INSERT INTO `base_area` VALUES ('532930', '532900', '洱源县', '0', '0', '530000-532900-532930-', '1');
INSERT INTO `base_area` VALUES ('532931', '532900', '剑川县', '0', '0', '530000-532900-532931-', '1');
INSERT INTO `base_area` VALUES ('532932', '532900', '鹤庆县', '0', '0', '530000-532900-532932-', '1');
INSERT INTO `base_area` VALUES ('533100', '530000', '德宏州', '678400', '0692', '530000-533100-', '1');
INSERT INTO `base_area` VALUES ('533102', '533100', '瑞丽市', '0', '0', '530000-533100-533102-', '1');
INSERT INTO `base_area` VALUES ('533103', '533100', '潞西市', '0', '0', '530000-533100-533103-', '1');
INSERT INTO `base_area` VALUES ('533122', '533100', '梁河县', '0', '0', '530000-533100-533122-', '1');
INSERT INTO `base_area` VALUES ('533123', '533100', '盈江县', '0', '0', '530000-533100-533123-', '1');
INSERT INTO `base_area` VALUES ('533124', '533100', '陇川县', '0', '0', '530000-533100-533124-', '1');
INSERT INTO `base_area` VALUES ('533300', '530000', '怒江州', '673100', '0886', '530000-533300-', '1');
INSERT INTO `base_area` VALUES ('533321', '533300', '泸水县', '0', '0', '530000-533300-533321-', '1');
INSERT INTO `base_area` VALUES ('533323', '533300', '福贡县', '0', '0', '530000-533300-533323-', '1');
INSERT INTO `base_area` VALUES ('533324', '533300', '贡山独龙族怒族自治县', '0', '0', '530000-533300-533324-', '1');
INSERT INTO `base_area` VALUES ('533325', '533300', '兰坪白族普米族自治县', '0', '0', '530000-533300-533325-', '1');
INSERT INTO `base_area` VALUES ('533400', '530000', '迪庆州', '674400', '0887', '530000-533400-', '1');
INSERT INTO `base_area` VALUES ('533421', '533400', '香格里拉县', '0', '0', '530000-533400-533421-', '1');
INSERT INTO `base_area` VALUES ('533422', '533400', '德钦县', '0', '0', '530000-533400-533422-', '1');
INSERT INTO `base_area` VALUES ('533423', '533400', '维西傈僳族自治县', '0', '0', '530000-533400-533423-', '1');
INSERT INTO `base_area` VALUES ('540000', '0', '西藏自治区', '0', '0', '540000-', '1');
INSERT INTO `base_area` VALUES ('540100', '540000', '拉萨市', '850000', '0891', '540000-540100-', '1');
INSERT INTO `base_area` VALUES ('540101', '540100', '市辖区', '0', '0', '540000-540100-540101-', '1');
INSERT INTO `base_area` VALUES ('540102', '540100', '城关区', '0', '0', '540000-540100-540102-', '1');
INSERT INTO `base_area` VALUES ('540121', '540100', '林周县', '0', '0', '540000-540100-540121-', '1');
INSERT INTO `base_area` VALUES ('540122', '540100', '当雄县', '0', '0', '540000-540100-540122-', '1');
INSERT INTO `base_area` VALUES ('540123', '540100', '尼木县', '0', '0', '540000-540100-540123-', '1');
INSERT INTO `base_area` VALUES ('540124', '540100', '曲水县', '0', '0', '540000-540100-540124-', '1');
INSERT INTO `base_area` VALUES ('540125', '540100', '堆龙德庆县', '0', '0', '540000-540100-540125-', '1');
INSERT INTO `base_area` VALUES ('540126', '540100', '达孜县', '0', '0', '540000-540100-540126-', '1');
INSERT INTO `base_area` VALUES ('540127', '540100', '墨竹工卡县', '0', '0', '540000-540100-540127-', '1');
INSERT INTO `base_area` VALUES ('542100', '540000', '昌都地区', '854000', '0895', '540000-542100-', '1');
INSERT INTO `base_area` VALUES ('542121', '542100', '昌都县', '0', '0', '540000-542100-542121-', '1');
INSERT INTO `base_area` VALUES ('542122', '542100', '江达县', '0', '0', '540000-542100-542122-', '1');
INSERT INTO `base_area` VALUES ('542123', '542100', '贡觉县', '0', '0', '540000-542100-542123-', '1');
INSERT INTO `base_area` VALUES ('542124', '542100', '类乌齐县', '0', '0', '540000-542100-542124-', '1');
INSERT INTO `base_area` VALUES ('542125', '542100', '丁青县', '0', '0', '540000-542100-542125-', '1');
INSERT INTO `base_area` VALUES ('542126', '542100', '察雅县', '0', '0', '540000-542100-542126-', '1');
INSERT INTO `base_area` VALUES ('542127', '542100', '八宿县', '0', '0', '540000-542100-542127-', '1');
INSERT INTO `base_area` VALUES ('542128', '542100', '左贡县', '0', '0', '540000-542100-542128-', '1');
INSERT INTO `base_area` VALUES ('542129', '542100', '芒康县', '0', '0', '540000-542100-542129-', '1');
INSERT INTO `base_area` VALUES ('542132', '542100', '洛隆县', '0', '0', '540000-542100-542132-', '1');
INSERT INTO `base_area` VALUES ('542133', '542100', '边坝县', '0', '0', '540000-542100-542133-', '1');
INSERT INTO `base_area` VALUES ('542200', '540000', '山南地区', '856000', '0893', '540000-542200-', '1');
INSERT INTO `base_area` VALUES ('542221', '542200', '乃东县', '0', '0', '540000-542200-542221-', '1');
INSERT INTO `base_area` VALUES ('542222', '542200', '扎囊县', '0', '0', '540000-542200-542222-', '1');
INSERT INTO `base_area` VALUES ('542223', '542200', '贡嘎县', '0', '0', '540000-542200-542223-', '1');
INSERT INTO `base_area` VALUES ('542224', '542200', '桑日县', '0', '0', '540000-542200-542224-', '1');
INSERT INTO `base_area` VALUES ('542225', '542200', '琼结县', '0', '0', '540000-542200-542225-', '1');
INSERT INTO `base_area` VALUES ('542226', '542200', '曲松县', '0', '0', '540000-542200-542226-', '1');
INSERT INTO `base_area` VALUES ('542227', '542200', '措美县', '0', '0', '540000-542200-542227-', '1');
INSERT INTO `base_area` VALUES ('542228', '542200', '洛扎县', '0', '0', '540000-542200-542228-', '1');
INSERT INTO `base_area` VALUES ('542229', '542200', '加查县', '0', '0', '540000-542200-542229-', '1');
INSERT INTO `base_area` VALUES ('542231', '542200', '隆子县', '0', '0', '540000-542200-542231-', '1');
INSERT INTO `base_area` VALUES ('542232', '542200', '错那县', '0', '0', '540000-542200-542232-', '1');
INSERT INTO `base_area` VALUES ('542233', '542200', '浪卡子县', '0', '0', '540000-542200-542233-', '1');
INSERT INTO `base_area` VALUES ('542300', '540000', '日喀则地区', '857000', '0892', '540000-542300-', '1');
INSERT INTO `base_area` VALUES ('542301', '542300', '日喀则市', '0', '0', '540000-542300-542301-', '1');
INSERT INTO `base_area` VALUES ('542322', '542300', '南木林县', '0', '0', '540000-542300-542322-', '1');
INSERT INTO `base_area` VALUES ('542323', '542300', '江孜县', '0', '0', '540000-542300-542323-', '1');
INSERT INTO `base_area` VALUES ('542324', '542300', '定日县', '0', '0', '540000-542300-542324-', '1');
INSERT INTO `base_area` VALUES ('542325', '542300', '萨迦县', '0', '0', '540000-542300-542325-', '1');
INSERT INTO `base_area` VALUES ('542326', '542300', '拉孜县', '0', '0', '540000-542300-542326-', '1');
INSERT INTO `base_area` VALUES ('542327', '542300', '昂仁县', '0', '0', '540000-542300-542327-', '1');
INSERT INTO `base_area` VALUES ('542328', '542300', '谢通门县', '0', '0', '540000-542300-542328-', '1');
INSERT INTO `base_area` VALUES ('542329', '542300', '白朗县', '0', '0', '540000-542300-542329-', '1');
INSERT INTO `base_area` VALUES ('542330', '542300', '仁布县', '0', '0', '540000-542300-542330-', '1');
INSERT INTO `base_area` VALUES ('542331', '542300', '康马县', '0', '0', '540000-542300-542331-', '1');
INSERT INTO `base_area` VALUES ('542332', '542300', '定结县', '0', '0', '540000-542300-542332-', '1');
INSERT INTO `base_area` VALUES ('542333', '542300', '仲巴县', '0', '0', '540000-542300-542333-', '1');
INSERT INTO `base_area` VALUES ('542334', '542300', '亚东县', '0', '0', '540000-542300-542334-', '1');
INSERT INTO `base_area` VALUES ('542335', '542300', '吉隆县', '0', '0', '540000-542300-542335-', '1');
INSERT INTO `base_area` VALUES ('542336', '542300', '聂拉木县', '0', '0', '540000-542300-542336-', '1');
INSERT INTO `base_area` VALUES ('542337', '542300', '萨嘎县', '0', '0', '540000-542300-542337-', '1');
INSERT INTO `base_area` VALUES ('542338', '542300', '岗巴县', '0', '0', '540000-542300-542338-', '1');
INSERT INTO `base_area` VALUES ('542400', '540000', '那曲地区', '852000', '0896', '540000-542400-', '1');
INSERT INTO `base_area` VALUES ('542421', '542400', '那曲县', '0', '0', '540000-542400-542421-', '1');
INSERT INTO `base_area` VALUES ('542422', '542400', '嘉黎县', '0', '0', '540000-542400-542422-', '1');
INSERT INTO `base_area` VALUES ('542423', '542400', '比如县', '0', '0', '540000-542400-542423-', '1');
INSERT INTO `base_area` VALUES ('542424', '542400', '聂荣县', '0', '0', '540000-542400-542424-', '1');
INSERT INTO `base_area` VALUES ('542425', '542400', '安多县', '0', '0', '540000-542400-542425-', '1');
INSERT INTO `base_area` VALUES ('542426', '542400', '申扎县', '0', '0', '540000-542400-542426-', '1');
INSERT INTO `base_area` VALUES ('542427', '542400', '索　县', '0', '0', '540000-542400-542427-', '1');
INSERT INTO `base_area` VALUES ('542428', '542400', '班戈县', '0', '0', '540000-542400-542428-', '1');
INSERT INTO `base_area` VALUES ('542429', '542400', '巴青县', '0', '0', '540000-542400-542429-', '1');
INSERT INTO `base_area` VALUES ('542430', '542400', '尼玛县', '0', '0', '540000-542400-542430-', '1');
INSERT INTO `base_area` VALUES ('542500', '540000', '阿里地区', '859000', '0897', '540000-542500-', '1');
INSERT INTO `base_area` VALUES ('542521', '542500', '普兰县', '0', '0', '540000-542500-542521-', '1');
INSERT INTO `base_area` VALUES ('542522', '542500', '札达县', '0', '0', '540000-542500-542522-', '1');
INSERT INTO `base_area` VALUES ('542523', '542500', '噶尔县', '0', '0', '540000-542500-542523-', '1');
INSERT INTO `base_area` VALUES ('542524', '542500', '日土县', '0', '0', '540000-542500-542524-', '1');
INSERT INTO `base_area` VALUES ('542525', '542500', '革吉县', '0', '0', '540000-542500-542525-', '1');
INSERT INTO `base_area` VALUES ('542526', '542500', '改则县', '0', '0', '540000-542500-542526-', '1');
INSERT INTO `base_area` VALUES ('542527', '542500', '措勤县', '0', '0', '540000-542500-542527-', '1');
INSERT INTO `base_area` VALUES ('542600', '540000', '林芝地区', '860000', '0894', '540000-542600-', '1');
INSERT INTO `base_area` VALUES ('542621', '542600', '林芝县', '0', '0', '540000-542600-542621-', '1');
INSERT INTO `base_area` VALUES ('542622', '542600', '工布江达县', '0', '0', '540000-542600-542622-', '1');
INSERT INTO `base_area` VALUES ('542623', '542600', '米林县', '0', '0', '540000-542600-542623-', '1');
INSERT INTO `base_area` VALUES ('542624', '542600', '墨脱县', '0', '0', '540000-542600-542624-', '1');
INSERT INTO `base_area` VALUES ('542625', '542600', '波密县', '0', '0', '540000-542600-542625-', '1');
INSERT INTO `base_area` VALUES ('542626', '542600', '察隅县', '0', '0', '540000-542600-542626-', '1');
INSERT INTO `base_area` VALUES ('542627', '542600', '朗　县', '0', '0', '540000-542600-542627-', '1');
INSERT INTO `base_area` VALUES ('610000', '0', '陕西省', '0', '0', '610000-', '1');
INSERT INTO `base_area` VALUES ('610100', '610000', '西安市', '710000', '029', '610000-610100-', '1');
INSERT INTO `base_area` VALUES ('610101', '610100', '市辖区', '0', '0', '610000-610100-610101-', '1');
INSERT INTO `base_area` VALUES ('610102', '610100', '新城区', '0', '0', '610000-610100-610102-', '1');
INSERT INTO `base_area` VALUES ('610103', '610100', '碑林区', '0', '0', '610000-610100-610103-', '1');
INSERT INTO `base_area` VALUES ('610104', '610100', '莲湖区', '0', '0', '610000-610100-610104-', '1');
INSERT INTO `base_area` VALUES ('610111', '610100', '灞桥区', '0', '0', '610000-610100-610111-', '1');
INSERT INTO `base_area` VALUES ('610112', '610100', '未央区', '0', '0', '610000-610100-610112-', '1');
INSERT INTO `base_area` VALUES ('610113', '610100', '雁塔区', '0', '0', '610000-610100-610113-', '1');
INSERT INTO `base_area` VALUES ('610114', '610100', '阎良区', '0', '0', '610000-610100-610114-', '1');
INSERT INTO `base_area` VALUES ('610115', '610100', '临潼区', '0', '0', '610000-610100-610115-', '1');
INSERT INTO `base_area` VALUES ('610116', '610100', '长安区', '0', '0', '610000-610100-610116-', '1');
INSERT INTO `base_area` VALUES ('610122', '610100', '蓝田县', '0', '0', '610000-610100-610122-', '1');
INSERT INTO `base_area` VALUES ('610124', '610100', '周至县', '0', '0', '610000-610100-610124-', '1');
INSERT INTO `base_area` VALUES ('610125', '610100', '户　县', '0', '0', '610000-610100-610125-', '1');
INSERT INTO `base_area` VALUES ('610126', '610100', '高陵县', '0', '0', '610000-610100-610126-', '1');
INSERT INTO `base_area` VALUES ('610200', '610000', '铜川市', '727000', '0919', '610000-610200-', '1');
INSERT INTO `base_area` VALUES ('610201', '610200', '市辖区', '0', '0', '610000-610200-610201-', '1');
INSERT INTO `base_area` VALUES ('610202', '610200', '王益区', '0', '0', '610000-610200-610202-', '1');
INSERT INTO `base_area` VALUES ('610203', '610200', '印台区', '0', '0', '610000-610200-610203-', '1');
INSERT INTO `base_area` VALUES ('610204', '610200', '耀州区', '0', '0', '610000-610200-610204-', '1');
INSERT INTO `base_area` VALUES ('610222', '610200', '宜君县', '0', '0', '610000-610200-610222-', '1');
INSERT INTO `base_area` VALUES ('610300', '610000', '宝鸡市', '721000', '0917', '610000-610300-', '1');
INSERT INTO `base_area` VALUES ('610301', '610300', '市辖区', '0', '0', '610000-610300-610301-', '1');
INSERT INTO `base_area` VALUES ('610302', '610300', '渭滨区', '0', '0', '610000-610300-610302-', '1');
INSERT INTO `base_area` VALUES ('610303', '610300', '金台区', '0', '0', '610000-610300-610303-', '1');
INSERT INTO `base_area` VALUES ('610304', '610300', '陈仓区', '0', '0', '610000-610300-610304-', '1');
INSERT INTO `base_area` VALUES ('610322', '610300', '凤翔县', '0', '0', '610000-610300-610322-', '1');
INSERT INTO `base_area` VALUES ('610323', '610300', '岐山县', '0', '0', '610000-610300-610323-', '1');
INSERT INTO `base_area` VALUES ('610324', '610300', '扶风县', '0', '0', '610000-610300-610324-', '1');
INSERT INTO `base_area` VALUES ('610326', '610300', '眉　县', '0', '0', '610000-610300-610326-', '1');
INSERT INTO `base_area` VALUES ('610327', '610300', '陇　县', '0', '0', '610000-610300-610327-', '1');
INSERT INTO `base_area` VALUES ('610328', '610300', '千阳县', '0', '0', '610000-610300-610328-', '1');
INSERT INTO `base_area` VALUES ('610329', '610300', '麟游县', '0', '0', '610000-610300-610329-', '1');
INSERT INTO `base_area` VALUES ('610330', '610300', '凤　县', '0', '0', '610000-610300-610330-', '1');
INSERT INTO `base_area` VALUES ('610331', '610300', '太白县', '0', '0', '610000-610300-610331-', '1');
INSERT INTO `base_area` VALUES ('610400', '610000', '咸阳市', '712000', '029', '610000-610400-', '1');
INSERT INTO `base_area` VALUES ('610401', '610400', '市辖区', '0', '0', '610000-610400-610401-', '1');
INSERT INTO `base_area` VALUES ('610402', '610400', '秦都区', '0', '0', '610000-610400-610402-', '1');
INSERT INTO `base_area` VALUES ('610403', '610400', '杨凌区', '0', '0', '610000-610400-610403-', '1');
INSERT INTO `base_area` VALUES ('610404', '610400', '渭城区', '0', '0', '610000-610400-610404-', '1');
INSERT INTO `base_area` VALUES ('610422', '610400', '三原县', '0', '0', '610000-610400-610422-', '1');
INSERT INTO `base_area` VALUES ('610423', '610400', '泾阳县', '0', '0', '610000-610400-610423-', '1');
INSERT INTO `base_area` VALUES ('610424', '610400', '乾　县', '0', '0', '610000-610400-610424-', '1');
INSERT INTO `base_area` VALUES ('610425', '610400', '礼泉县', '0', '0', '610000-610400-610425-', '1');
INSERT INTO `base_area` VALUES ('610426', '610400', '永寿县', '0', '0', '610000-610400-610426-', '1');
INSERT INTO `base_area` VALUES ('610427', '610400', '彬　县', '0', '0', '610000-610400-610427-', '1');
INSERT INTO `base_area` VALUES ('610428', '610400', '长武县', '0', '0', '610000-610400-610428-', '1');
INSERT INTO `base_area` VALUES ('610429', '610400', '旬邑县', '0', '0', '610000-610400-610429-', '1');
INSERT INTO `base_area` VALUES ('610430', '610400', '淳化县', '0', '0', '610000-610400-610430-', '1');
INSERT INTO `base_area` VALUES ('610431', '610400', '武功县', '0', '0', '610000-610400-610431-', '1');
INSERT INTO `base_area` VALUES ('610481', '610400', '兴平市', '0', '0', '610000-610400-610481-', '1');
INSERT INTO `base_area` VALUES ('610500', '610000', '渭南市', '714000', '0913', '610000-610500-', '1');
INSERT INTO `base_area` VALUES ('610501', '610500', '市辖区', '0', '0', '610000-610500-610501-', '1');
INSERT INTO `base_area` VALUES ('610502', '610500', '临渭区', '0', '0', '610000-610500-610502-', '1');
INSERT INTO `base_area` VALUES ('610521', '610500', '华　县', '0', '0', '610000-610500-610521-', '1');
INSERT INTO `base_area` VALUES ('610522', '610500', '潼关县', '0', '0', '610000-610500-610522-', '1');
INSERT INTO `base_area` VALUES ('610523', '610500', '大荔县', '0', '0', '610000-610500-610523-', '1');
INSERT INTO `base_area` VALUES ('610524', '610500', '合阳县', '0', '0', '610000-610500-610524-', '1');
INSERT INTO `base_area` VALUES ('610525', '610500', '澄城县', '0', '0', '610000-610500-610525-', '1');
INSERT INTO `base_area` VALUES ('610526', '610500', '蒲城县', '0', '0', '610000-610500-610526-', '1');
INSERT INTO `base_area` VALUES ('610527', '610500', '白水县', '0', '0', '610000-610500-610527-', '1');
INSERT INTO `base_area` VALUES ('610528', '610500', '富平县', '0', '0', '610000-610500-610528-', '1');
INSERT INTO `base_area` VALUES ('610581', '610500', '韩城市', '0', '0', '610000-610500-610581-', '1');
INSERT INTO `base_area` VALUES ('610582', '610500', '华阴市', '0', '0', '610000-610500-610582-', '1');
INSERT INTO `base_area` VALUES ('610600', '610000', '延安市', '716000', '0911', '610000-610600-', '1');
INSERT INTO `base_area` VALUES ('610601', '610600', '市辖区', '0', '0', '610000-610600-610601-', '1');
INSERT INTO `base_area` VALUES ('610602', '610600', '宝塔区', '0', '0', '610000-610600-610602-', '1');
INSERT INTO `base_area` VALUES ('610621', '610600', '延长县', '0', '0', '610000-610600-610621-', '1');
INSERT INTO `base_area` VALUES ('610622', '610600', '延川县', '0', '0', '610000-610600-610622-', '1');
INSERT INTO `base_area` VALUES ('610623', '610600', '子长县', '0', '0', '610000-610600-610623-', '1');
INSERT INTO `base_area` VALUES ('610624', '610600', '安塞县', '0', '0', '610000-610600-610624-', '1');
INSERT INTO `base_area` VALUES ('610625', '610600', '志丹县', '0', '0', '610000-610600-610625-', '1');
INSERT INTO `base_area` VALUES ('610626', '610600', '吴旗县', '0', '0', '610000-610600-610626-', '1');
INSERT INTO `base_area` VALUES ('610627', '610600', '甘泉县', '0', '0', '610000-610600-610627-', '1');
INSERT INTO `base_area` VALUES ('610628', '610600', '富　县', '0', '0', '610000-610600-610628-', '1');
INSERT INTO `base_area` VALUES ('610629', '610600', '洛川县', '0', '0', '610000-610600-610629-', '1');
INSERT INTO `base_area` VALUES ('610630', '610600', '宜川县', '0', '0', '610000-610600-610630-', '1');
INSERT INTO `base_area` VALUES ('610631', '610600', '黄龙县', '0', '0', '610000-610600-610631-', '1');
INSERT INTO `base_area` VALUES ('610632', '610600', '黄陵县', '0', '0', '610000-610600-610632-', '1');
INSERT INTO `base_area` VALUES ('610700', '610000', '汉中市', '723000', '0916', '610000-610700-', '1');
INSERT INTO `base_area` VALUES ('610701', '610700', '市辖区', '0', '0', '610000-610700-610701-', '1');
INSERT INTO `base_area` VALUES ('610702', '610700', '汉台区', '0', '0', '610000-610700-610702-', '1');
INSERT INTO `base_area` VALUES ('610721', '610700', '南郑县', '0', '0', '610000-610700-610721-', '1');
INSERT INTO `base_area` VALUES ('610722', '610700', '城固县', '0', '0', '610000-610700-610722-', '1');
INSERT INTO `base_area` VALUES ('610723', '610700', '洋　县', '0', '0', '610000-610700-610723-', '1');
INSERT INTO `base_area` VALUES ('610724', '610700', '西乡县', '0', '0', '610000-610700-610724-', '1');
INSERT INTO `base_area` VALUES ('610725', '610700', '勉　县', '0', '0', '610000-610700-610725-', '1');
INSERT INTO `base_area` VALUES ('610726', '610700', '宁强县', '0', '0', '610000-610700-610726-', '1');
INSERT INTO `base_area` VALUES ('610727', '610700', '略阳县', '0', '0', '610000-610700-610727-', '1');
INSERT INTO `base_area` VALUES ('610728', '610700', '镇巴县', '0', '0', '610000-610700-610728-', '1');
INSERT INTO `base_area` VALUES ('610729', '610700', '留坝县', '0', '0', '610000-610700-610729-', '1');
INSERT INTO `base_area` VALUES ('610730', '610700', '佛坪县', '0', '0', '610000-610700-610730-', '1');
INSERT INTO `base_area` VALUES ('610800', '610000', '榆林市', '719000', '0912', '610000-610800-', '1');
INSERT INTO `base_area` VALUES ('610801', '610800', '市辖区', '0', '0', '610000-610800-610801-', '1');
INSERT INTO `base_area` VALUES ('610802', '610800', '榆阳区', '0', '0', '610000-610800-610802-', '1');
INSERT INTO `base_area` VALUES ('610821', '610800', '神木县', '0', '0', '610000-610800-610821-', '1');
INSERT INTO `base_area` VALUES ('610822', '610800', '府谷县', '0', '0', '610000-610800-610822-', '1');
INSERT INTO `base_area` VALUES ('610823', '610800', '横山县', '0', '0', '610000-610800-610823-', '1');
INSERT INTO `base_area` VALUES ('610824', '610800', '靖边县', '0', '0', '610000-610800-610824-', '1');
INSERT INTO `base_area` VALUES ('610825', '610800', '定边县', '0', '0', '610000-610800-610825-', '1');
INSERT INTO `base_area` VALUES ('610826', '610800', '绥德县', '0', '0', '610000-610800-610826-', '1');
INSERT INTO `base_area` VALUES ('610827', '610800', '米脂县', '0', '0', '610000-610800-610827-', '1');
INSERT INTO `base_area` VALUES ('610828', '610800', '佳　县', '0', '0', '610000-610800-610828-', '1');
INSERT INTO `base_area` VALUES ('610829', '610800', '吴堡县', '0', '0', '610000-610800-610829-', '1');
INSERT INTO `base_area` VALUES ('610830', '610800', '清涧县', '0', '0', '610000-610800-610830-', '1');
INSERT INTO `base_area` VALUES ('610831', '610800', '子洲县', '0', '0', '610000-610800-610831-', '1');
INSERT INTO `base_area` VALUES ('610900', '610000', '安康市', '725000', '0915', '610000-610900-', '1');
INSERT INTO `base_area` VALUES ('610901', '610900', '市辖区', '0', '0', '610000-610900-610901-', '1');
INSERT INTO `base_area` VALUES ('610902', '610900', '汉滨区', '0', '0', '610000-610900-610902-', '1');
INSERT INTO `base_area` VALUES ('610921', '610900', '汉阴县', '0', '0', '610000-610900-610921-', '1');
INSERT INTO `base_area` VALUES ('610922', '610900', '石泉县', '0', '0', '610000-610900-610922-', '1');
INSERT INTO `base_area` VALUES ('610923', '610900', '宁陕县', '0', '0', '610000-610900-610923-', '1');
INSERT INTO `base_area` VALUES ('610924', '610900', '紫阳县', '0', '0', '610000-610900-610924-', '1');
INSERT INTO `base_area` VALUES ('610925', '610900', '岚皋县', '0', '0', '610000-610900-610925-', '1');
INSERT INTO `base_area` VALUES ('610926', '610900', '平利县', '0', '0', '610000-610900-610926-', '1');
INSERT INTO `base_area` VALUES ('610927', '610900', '镇坪县', '0', '0', '610000-610900-610927-', '1');
INSERT INTO `base_area` VALUES ('610928', '610900', '旬阳县', '0', '0', '610000-610900-610928-', '1');
INSERT INTO `base_area` VALUES ('610929', '610900', '白河县', '0', '0', '610000-610900-610929-', '1');
INSERT INTO `base_area` VALUES ('611000', '610000', '商洛市', '726000', '0914', '610000-611000-', '1');
INSERT INTO `base_area` VALUES ('611001', '611000', '市辖区', '0', '0', '610000-611000-611001-', '1');
INSERT INTO `base_area` VALUES ('611002', '611000', '商州区', '0', '0', '610000-611000-611002-', '1');
INSERT INTO `base_area` VALUES ('611021', '611000', '洛南县', '0', '0', '610000-611000-611021-', '1');
INSERT INTO `base_area` VALUES ('611022', '611000', '丹凤县', '0', '0', '610000-611000-611022-', '1');
INSERT INTO `base_area` VALUES ('611023', '611000', '商南县', '0', '0', '610000-611000-611023-', '1');
INSERT INTO `base_area` VALUES ('611024', '611000', '山阳县', '0', '0', '610000-611000-611024-', '1');
INSERT INTO `base_area` VALUES ('611025', '611000', '镇安县', '0', '0', '610000-611000-611025-', '1');
INSERT INTO `base_area` VALUES ('611026', '611000', '柞水县', '0', '0', '610000-611000-611026-', '1');
INSERT INTO `base_area` VALUES ('620000', '0', '甘肃省', '0', '0', '620000-', '1');
INSERT INTO `base_area` VALUES ('620100', '620000', '兰州市', '730000', '0931', '620000-620100-', '1');
INSERT INTO `base_area` VALUES ('620101', '620100', '市辖区', '0', '0', '620000-620100-620101-', '1');
INSERT INTO `base_area` VALUES ('620102', '620100', '城关区', '0', '0', '620000-620100-620102-', '1');
INSERT INTO `base_area` VALUES ('620103', '620100', '七里河区', '0', '0', '620000-620100-620103-', '1');
INSERT INTO `base_area` VALUES ('620104', '620100', '西固区', '0', '0', '620000-620100-620104-', '1');
INSERT INTO `base_area` VALUES ('620105', '620100', '安宁区', '0', '0', '620000-620100-620105-', '1');
INSERT INTO `base_area` VALUES ('620111', '620100', '红古区', '0', '0', '620000-620100-620111-', '1');
INSERT INTO `base_area` VALUES ('620121', '620100', '永登县', '0', '0', '620000-620100-620121-', '1');
INSERT INTO `base_area` VALUES ('620122', '620100', '皋兰县', '0', '0', '620000-620100-620122-', '1');
INSERT INTO `base_area` VALUES ('620123', '620100', '榆中县', '0', '0', '620000-620100-620123-', '1');
INSERT INTO `base_area` VALUES ('620200', '620000', '嘉峪关市', '735100', '0937', '620000-620200-', '1');
INSERT INTO `base_area` VALUES ('620201', '620200', '市辖区', '0', '0', '620000-620200-620201-', '1');
INSERT INTO `base_area` VALUES ('620300', '620000', '金昌市', '737100', '0935', '620000-620300-', '1');
INSERT INTO `base_area` VALUES ('620301', '620300', '市辖区', '0', '0', '620000-620300-620301-', '1');
INSERT INTO `base_area` VALUES ('620302', '620300', '金川区', '0', '0', '620000-620300-620302-', '1');
INSERT INTO `base_area` VALUES ('620321', '620300', '永昌县', '0', '0', '620000-620300-620321-', '1');
INSERT INTO `base_area` VALUES ('620400', '620000', '白银市', '730900', '0943', '620000-620400-', '1');
INSERT INTO `base_area` VALUES ('620401', '620400', '市辖区', '0', '0', '620000-620400-620401-', '1');
INSERT INTO `base_area` VALUES ('620402', '620400', '白银区', '0', '0', '620000-620400-620402-', '1');
INSERT INTO `base_area` VALUES ('620403', '620400', '平川区', '0', '0', '620000-620400-620403-', '1');
INSERT INTO `base_area` VALUES ('620421', '620400', '靖远县', '0', '0', '620000-620400-620421-', '1');
INSERT INTO `base_area` VALUES ('620422', '620400', '会宁县', '0', '0', '620000-620400-620422-', '1');
INSERT INTO `base_area` VALUES ('620423', '620400', '景泰县', '0', '0', '620000-620400-620423-', '1');
INSERT INTO `base_area` VALUES ('620500', '620000', '天水市', '741000', '0938', '620000-620500-', '1');
INSERT INTO `base_area` VALUES ('620501', '620500', '市辖区', '0', '0', '620000-620500-620501-', '1');
INSERT INTO `base_area` VALUES ('620502', '620500', '秦城区', '0', '0', '620000-620500-620502-', '1');
INSERT INTO `base_area` VALUES ('620503', '620500', '北道区', '0', '0', '620000-620500-620503-', '1');
INSERT INTO `base_area` VALUES ('620521', '620500', '清水县', '0', '0', '620000-620500-620521-', '1');
INSERT INTO `base_area` VALUES ('620522', '620500', '秦安县', '0', '0', '620000-620500-620522-', '1');
INSERT INTO `base_area` VALUES ('620523', '620500', '甘谷县', '0', '0', '620000-620500-620523-', '1');
INSERT INTO `base_area` VALUES ('620524', '620500', '武山县', '0', '0', '620000-620500-620524-', '1');
INSERT INTO `base_area` VALUES ('620525', '620500', '张家川回族自治县', '0', '0', '620000-620500-620525-', '1');
INSERT INTO `base_area` VALUES ('620600', '620000', '武威市', '733000', '0935', '620000-620600-', '1');
INSERT INTO `base_area` VALUES ('620601', '620600', '市辖区', '0', '0', '620000-620600-620601-', '1');
INSERT INTO `base_area` VALUES ('620602', '620600', '凉州区', '0', '0', '620000-620600-620602-', '1');
INSERT INTO `base_area` VALUES ('620621', '620600', '民勤县', '0', '0', '620000-620600-620621-', '1');
INSERT INTO `base_area` VALUES ('620622', '620600', '古浪县', '0', '0', '620000-620600-620622-', '1');
INSERT INTO `base_area` VALUES ('620623', '620600', '天祝藏族自治县', '0', '0', '620000-620600-620623-', '1');
INSERT INTO `base_area` VALUES ('620700', '620000', '张掖市', '734000', '0936', '620000-620700-', '1');
INSERT INTO `base_area` VALUES ('620701', '620700', '市辖区', '0', '0', '620000-620700-620701-', '1');
INSERT INTO `base_area` VALUES ('620702', '620700', '甘州区', '0', '0', '620000-620700-620702-', '1');
INSERT INTO `base_area` VALUES ('620721', '620700', '肃南裕固族自治县', '0', '0', '620000-620700-620721-', '1');
INSERT INTO `base_area` VALUES ('620722', '620700', '民乐县', '0', '0', '620000-620700-620722-', '1');
INSERT INTO `base_area` VALUES ('620723', '620700', '临泽县', '0', '0', '620000-620700-620723-', '1');
INSERT INTO `base_area` VALUES ('620724', '620700', '高台县', '0', '0', '620000-620700-620724-', '1');
INSERT INTO `base_area` VALUES ('620725', '620700', '山丹县', '0', '0', '620000-620700-620725-', '1');
INSERT INTO `base_area` VALUES ('620800', '620000', '平凉市', '744000', '0933', '620000-620800-', '1');
INSERT INTO `base_area` VALUES ('620801', '620800', '市辖区', '0', '0', '620000-620800-620801-', '1');
INSERT INTO `base_area` VALUES ('620802', '620800', '崆峒区', '0', '0', '620000-620800-620802-', '1');
INSERT INTO `base_area` VALUES ('620821', '620800', '泾川县', '0', '0', '620000-620800-620821-', '1');
INSERT INTO `base_area` VALUES ('620822', '620800', '灵台县', '0', '0', '620000-620800-620822-', '1');
INSERT INTO `base_area` VALUES ('620823', '620800', '崇信县', '0', '0', '620000-620800-620823-', '1');
INSERT INTO `base_area` VALUES ('620824', '620800', '华亭县', '0', '0', '620000-620800-620824-', '1');
INSERT INTO `base_area` VALUES ('620825', '620800', '庄浪县', '0', '0', '620000-620800-620825-', '1');
INSERT INTO `base_area` VALUES ('620826', '620800', '静宁县', '0', '0', '620000-620800-620826-', '1');
INSERT INTO `base_area` VALUES ('620900', '620000', '酒泉市', '735000', '0937', '620000-620900-', '1');
INSERT INTO `base_area` VALUES ('620901', '620900', '市辖区', '0', '0', '620000-620900-620901-', '1');
INSERT INTO `base_area` VALUES ('620902', '620900', '肃州区', '0', '0', '620000-620900-620902-', '1');
INSERT INTO `base_area` VALUES ('620921', '620900', '金塔县', '0', '0', '620000-620900-620921-', '1');
INSERT INTO `base_area` VALUES ('620922', '620900', '安西县', '0', '0', '620000-620900-620922-', '1');
INSERT INTO `base_area` VALUES ('620923', '620900', '肃北蒙古族自治县', '0', '0', '620000-620900-620923-', '1');
INSERT INTO `base_area` VALUES ('620924', '620900', '阿克塞哈萨克族自治县', '0', '0', '620000-620900-620924-', '1');
INSERT INTO `base_area` VALUES ('620981', '620900', '玉门市', '0', '0', '620000-620900-620981-', '1');
INSERT INTO `base_area` VALUES ('620982', '620900', '敦煌市', '0', '0', '620000-620900-620982-', '1');
INSERT INTO `base_area` VALUES ('621000', '620000', '庆阳市', '745000', '0934', '620000-621000-', '1');
INSERT INTO `base_area` VALUES ('621001', '621000', '市辖区', '0', '0', '620000-621000-621001-', '1');
INSERT INTO `base_area` VALUES ('621002', '621000', '西峰区', '0', '0', '620000-621000-621002-', '1');
INSERT INTO `base_area` VALUES ('621021', '621000', '庆城县', '0', '0', '620000-621000-621021-', '1');
INSERT INTO `base_area` VALUES ('621022', '621000', '环　县', '0', '0', '620000-621000-621022-', '1');
INSERT INTO `base_area` VALUES ('621023', '621000', '华池县', '0', '0', '620000-621000-621023-', '1');
INSERT INTO `base_area` VALUES ('621024', '621000', '合水县', '0', '0', '620000-621000-621024-', '1');
INSERT INTO `base_area` VALUES ('621025', '621000', '正宁县', '0', '0', '620000-621000-621025-', '1');
INSERT INTO `base_area` VALUES ('621026', '621000', '宁　县', '0', '0', '620000-621000-621026-', '1');
INSERT INTO `base_area` VALUES ('621027', '621000', '镇原县', '0', '0', '620000-621000-621027-', '1');
INSERT INTO `base_area` VALUES ('621100', '620000', '定西市', '743000', '0932', '620000-621100-', '1');
INSERT INTO `base_area` VALUES ('621101', '621100', '市辖区', '0', '0', '620000-621100-621101-', '1');
INSERT INTO `base_area` VALUES ('621102', '621100', '安定区', '0', '0', '620000-621100-621102-', '1');
INSERT INTO `base_area` VALUES ('621121', '621100', '通渭县', '0', '0', '620000-621100-621121-', '1');
INSERT INTO `base_area` VALUES ('621122', '621100', '陇西县', '0', '0', '620000-621100-621122-', '1');
INSERT INTO `base_area` VALUES ('621123', '621100', '渭源县', '0', '0', '620000-621100-621123-', '1');
INSERT INTO `base_area` VALUES ('621124', '621100', '临洮县', '0', '0', '620000-621100-621124-', '1');
INSERT INTO `base_area` VALUES ('621125', '621100', '漳　县', '0', '0', '620000-621100-621125-', '1');
INSERT INTO `base_area` VALUES ('621126', '621100', '岷　县', '0', '0', '620000-621100-621126-', '1');
INSERT INTO `base_area` VALUES ('621200', '620000', '陇南市', '742500', '0939', '620000-621200-', '1');
INSERT INTO `base_area` VALUES ('621201', '621200', '市辖区', '0', '0', '620000-621200-621201-', '1');
INSERT INTO `base_area` VALUES ('621202', '621200', '武都区', '0', '0', '620000-621200-621202-', '1');
INSERT INTO `base_area` VALUES ('621221', '621200', '成　县', '0', '0', '620000-621200-621221-', '1');
INSERT INTO `base_area` VALUES ('621222', '621200', '文　县', '0', '0', '620000-621200-621222-', '1');
INSERT INTO `base_area` VALUES ('621223', '621200', '宕昌县', '0', '0', '620000-621200-621223-', '1');
INSERT INTO `base_area` VALUES ('621224', '621200', '康　县', '0', '0', '620000-621200-621224-', '1');
INSERT INTO `base_area` VALUES ('621225', '621200', '西和县', '0', '0', '620000-621200-621225-', '1');
INSERT INTO `base_area` VALUES ('621226', '621200', '礼　县', '0', '0', '620000-621200-621226-', '1');
INSERT INTO `base_area` VALUES ('621227', '621200', '徽　县', '0', '0', '620000-621200-621227-', '1');
INSERT INTO `base_area` VALUES ('621228', '621200', '两当县', '0', '0', '620000-621200-621228-', '1');
INSERT INTO `base_area` VALUES ('622900', '620000', '临夏州', '731100', '0930', '620000-622900-', '1');
INSERT INTO `base_area` VALUES ('622901', '622900', '临夏市', '0', '0', '620000-622900-622901-', '1');
INSERT INTO `base_area` VALUES ('622921', '622900', '临夏县', '0', '0', '620000-622900-622921-', '1');
INSERT INTO `base_area` VALUES ('622922', '622900', '康乐县', '0', '0', '620000-622900-622922-', '1');
INSERT INTO `base_area` VALUES ('622923', '622900', '永靖县', '0', '0', '620000-622900-622923-', '1');
INSERT INTO `base_area` VALUES ('622924', '622900', '广河县', '0', '0', '620000-622900-622924-', '1');
INSERT INTO `base_area` VALUES ('622925', '622900', '和政县', '0', '0', '620000-622900-622925-', '1');
INSERT INTO `base_area` VALUES ('622926', '622900', '东乡族自治县', '0', '0', '620000-622900-622926-', '1');
INSERT INTO `base_area` VALUES ('622927', '622900', '积石山保安族东乡族撒拉族自治县', '0', '0', '620000-622900-622927-', '1');
INSERT INTO `base_area` VALUES ('623000', '620000', '甘南州', '747000', '0941', '620000-623000-', '1');
INSERT INTO `base_area` VALUES ('623001', '623000', '合作市', '0', '0', '620000-623000-623001-', '1');
INSERT INTO `base_area` VALUES ('623021', '623000', '临潭县', '0', '0', '620000-623000-623021-', '1');
INSERT INTO `base_area` VALUES ('623022', '623000', '卓尼县', '0', '0', '620000-623000-623022-', '1');
INSERT INTO `base_area` VALUES ('623023', '623000', '舟曲县', '0', '0', '620000-623000-623023-', '1');
INSERT INTO `base_area` VALUES ('623024', '623000', '迭部县', '0', '0', '620000-623000-623024-', '1');
INSERT INTO `base_area` VALUES ('623025', '623000', '玛曲县', '0', '0', '620000-623000-623025-', '1');
INSERT INTO `base_area` VALUES ('623026', '623000', '碌曲县', '0', '0', '620000-623000-623026-', '1');
INSERT INTO `base_area` VALUES ('623027', '623000', '夏河县', '0', '0', '620000-623000-623027-', '1');
INSERT INTO `base_area` VALUES ('630000', '0', '青海省', '0', '0', '630000-', '1');
INSERT INTO `base_area` VALUES ('630100', '630000', '西宁市', '810000', '0971', '630000-630100-', '1');
INSERT INTO `base_area` VALUES ('630101', '630100', '市辖区', '0', '0', '630000-630100-630101-', '1');
INSERT INTO `base_area` VALUES ('630102', '630100', '城东区', '0', '0', '630000-630100-630102-', '1');
INSERT INTO `base_area` VALUES ('630103', '630100', '城中区', '0', '0', '630000-630100-630103-', '1');
INSERT INTO `base_area` VALUES ('630104', '630100', '城西区', '0', '0', '630000-630100-630104-', '1');
INSERT INTO `base_area` VALUES ('630105', '630100', '城北区', '0', '0', '630000-630100-630105-', '1');
INSERT INTO `base_area` VALUES ('630121', '630100', '大通回族土族自治县', '0', '0', '630000-630100-630121-', '1');
INSERT INTO `base_area` VALUES ('630122', '630100', '湟中县', '0', '0', '630000-630100-630122-', '1');
INSERT INTO `base_area` VALUES ('630123', '630100', '湟源县', '0', '0', '630000-630100-630123-', '1');
INSERT INTO `base_area` VALUES ('632100', '630000', '海东地区', '810600', '0972', '630000-632100-', '1');
INSERT INTO `base_area` VALUES ('632121', '632100', '平安县', '0', '0', '630000-632100-632121-', '1');
INSERT INTO `base_area` VALUES ('632122', '632100', '民和回族土族自治县', '0', '0', '630000-632100-632122-', '1');
INSERT INTO `base_area` VALUES ('632123', '632100', '乐都县', '0', '0', '630000-632100-632123-', '1');
INSERT INTO `base_area` VALUES ('632126', '632100', '互助土族自治县', '0', '0', '630000-632100-632126-', '1');
INSERT INTO `base_area` VALUES ('632127', '632100', '化隆回族自治县', '0', '0', '630000-632100-632127-', '1');
INSERT INTO `base_area` VALUES ('632128', '632100', '循化撒拉族自治县', '0', '0', '630000-632100-632128-', '1');
INSERT INTO `base_area` VALUES ('632200', '630000', '海北州', '812200', '0970', '630000-632200-', '1');
INSERT INTO `base_area` VALUES ('632221', '632200', '门源回族自治县', '0', '0', '630000-632200-632221-', '1');
INSERT INTO `base_area` VALUES ('632222', '632200', '祁连县', '0', '0', '630000-632200-632222-', '1');
INSERT INTO `base_area` VALUES ('632223', '632200', '海晏县', '0', '0', '630000-632200-632223-', '1');
INSERT INTO `base_area` VALUES ('632224', '632200', '刚察县', '0', '0', '630000-632200-632224-', '1');
INSERT INTO `base_area` VALUES ('632300', '630000', '黄南州', '811300', '0973', '630000-632300-', '1');
INSERT INTO `base_area` VALUES ('632321', '632300', '同仁县', '0', '0', '630000-632300-632321-', '1');
INSERT INTO `base_area` VALUES ('632322', '632300', '尖扎县', '0', '0', '630000-632300-632322-', '1');
INSERT INTO `base_area` VALUES ('632323', '632300', '泽库县', '0', '0', '630000-632300-632323-', '1');
INSERT INTO `base_area` VALUES ('632324', '632300', '河南蒙古族自治县', '0', '0', '630000-632300-632324-', '1');
INSERT INTO `base_area` VALUES ('632500', '630000', '海南州', '813000', '0974', '630000-632500-', '1');
INSERT INTO `base_area` VALUES ('632521', '632500', '共和县', '0', '0', '630000-632500-632521-', '1');
INSERT INTO `base_area` VALUES ('632522', '632500', '同德县', '0', '0', '630000-632500-632522-', '1');
INSERT INTO `base_area` VALUES ('632523', '632500', '贵德县', '0', '0', '630000-632500-632523-', '1');
INSERT INTO `base_area` VALUES ('632524', '632500', '兴海县', '0', '0', '630000-632500-632524-', '1');
INSERT INTO `base_area` VALUES ('632525', '632500', '贵南县', '0', '0', '630000-632500-632525-', '1');
INSERT INTO `base_area` VALUES ('632600', '630000', '果洛州', '814000', '0975', '630000-632600-', '1');
INSERT INTO `base_area` VALUES ('632621', '632600', '玛沁县', '0', '0', '630000-632600-632621-', '1');
INSERT INTO `base_area` VALUES ('632622', '632600', '班玛县', '0', '0', '630000-632600-632622-', '1');
INSERT INTO `base_area` VALUES ('632623', '632600', '甘德县', '0', '0', '630000-632600-632623-', '1');
INSERT INTO `base_area` VALUES ('632624', '632600', '达日县', '0', '0', '630000-632600-632624-', '1');
INSERT INTO `base_area` VALUES ('632625', '632600', '久治县', '0', '0', '630000-632600-632625-', '1');
INSERT INTO `base_area` VALUES ('632626', '632600', '玛多县', '0', '0', '630000-632600-632626-', '1');
INSERT INTO `base_area` VALUES ('632700', '630000', '玉树州', '815000', '0976', '630000-632700-', '1');
INSERT INTO `base_area` VALUES ('632721', '632700', '玉树县', '0', '0', '630000-632700-632721-', '1');
INSERT INTO `base_area` VALUES ('632722', '632700', '杂多县', '0', '0', '630000-632700-632722-', '1');
INSERT INTO `base_area` VALUES ('632723', '632700', '称多县', '0', '0', '630000-632700-632723-', '1');
INSERT INTO `base_area` VALUES ('632724', '632700', '治多县', '0', '0', '630000-632700-632724-', '1');
INSERT INTO `base_area` VALUES ('632725', '632700', '囊谦县', '0', '0', '630000-632700-632725-', '1');
INSERT INTO `base_area` VALUES ('632726', '632700', '曲麻莱县', '0', '0', '630000-632700-632726-', '1');
INSERT INTO `base_area` VALUES ('632800', '630000', '海西州', '817000', '0977', '630000-632800-', '1');
INSERT INTO `base_area` VALUES ('632801', '632800', '格尔木市', '816000', '0979', '630000-632800-632801-', '1');
INSERT INTO `base_area` VALUES ('632802', '632800', '德令哈市', '0', '0', '630000-632800-632802-', '1');
INSERT INTO `base_area` VALUES ('632821', '632800', '乌兰县', '0', '0', '630000-632800-632821-', '1');
INSERT INTO `base_area` VALUES ('632822', '632800', '都兰县', '0', '0', '630000-632800-632822-', '1');
INSERT INTO `base_area` VALUES ('632823', '632800', '天峻县', '0', '0', '630000-632800-632823-', '1');
INSERT INTO `base_area` VALUES ('640000', '0', '宁夏回族自治区', '0', '0', '640000-', '1');
INSERT INTO `base_area` VALUES ('640100', '640000', '银川市', '750000', '0951', '640000-640100-', '1');
INSERT INTO `base_area` VALUES ('640101', '640100', '市辖区', '0', '0', '640000-640100-640101-', '1');
INSERT INTO `base_area` VALUES ('640104', '640100', '兴庆区', '0', '0', '640000-640100-640104-', '1');
INSERT INTO `base_area` VALUES ('640105', '640100', '西夏区', '0', '0', '640000-640100-640105-', '1');
INSERT INTO `base_area` VALUES ('640106', '640100', '金凤区', '0', '0', '640000-640100-640106-', '1');
INSERT INTO `base_area` VALUES ('640121', '640100', '永宁县', '0', '0', '640000-640100-640121-', '1');
INSERT INTO `base_area` VALUES ('640122', '640100', '贺兰县', '0', '0', '640000-640100-640122-', '1');
INSERT INTO `base_area` VALUES ('640181', '640100', '灵武市', '0', '0', '640000-640100-640181-', '1');
INSERT INTO `base_area` VALUES ('640200', '640000', '石嘴山市', '753000', '0952', '640000-640200-', '1');
INSERT INTO `base_area` VALUES ('640201', '640200', '市辖区', '0', '0', '640000-640200-640201-', '1');
INSERT INTO `base_area` VALUES ('640202', '640200', '大武口区', '0', '0', '640000-640200-640202-', '1');
INSERT INTO `base_area` VALUES ('640205', '640200', '惠农区', '0', '0', '640000-640200-640205-', '1');
INSERT INTO `base_area` VALUES ('640221', '640200', '平罗县', '0', '0', '640000-640200-640221-', '1');
INSERT INTO `base_area` VALUES ('640300', '640000', '吴忠市', '751100', '0953', '640000-640300-', '1');
INSERT INTO `base_area` VALUES ('640301', '640300', '市辖区', '0', '0', '640000-640300-640301-', '1');
INSERT INTO `base_area` VALUES ('640302', '640300', '利通区', '0', '0', '640000-640300-640302-', '1');
INSERT INTO `base_area` VALUES ('640323', '640300', '盐池县', '0', '0', '640000-640300-640323-', '1');
INSERT INTO `base_area` VALUES ('640324', '640300', '同心县', '0', '0', '640000-640300-640324-', '1');
INSERT INTO `base_area` VALUES ('640381', '640300', '青铜峡市', '0', '0', '640000-640300-640381-', '1');
INSERT INTO `base_area` VALUES ('640400', '640000', '固原市', '756000', '0954', '640000-640400-', '1');
INSERT INTO `base_area` VALUES ('640401', '640400', '市辖区', '0', '0', '640000-640400-640401-', '1');
INSERT INTO `base_area` VALUES ('640402', '640400', '原州区', '0', '0', '640000-640400-640402-', '1');
INSERT INTO `base_area` VALUES ('640422', '640400', '西吉县', '0', '0', '640000-640400-640422-', '1');
INSERT INTO `base_area` VALUES ('640423', '640400', '隆德县', '0', '0', '640000-640400-640423-', '1');
INSERT INTO `base_area` VALUES ('640424', '640400', '泾源县', '0', '0', '640000-640400-640424-', '1');
INSERT INTO `base_area` VALUES ('640425', '640400', '彭阳县', '0', '0', '640000-640400-640425-', '1');
INSERT INTO `base_area` VALUES ('640500', '640000', '中卫市', '755000', '0955', '640000-640500-', '1');
INSERT INTO `base_area` VALUES ('640501', '640500', '市辖区', '0', '0', '640000-640500-640501-', '1');
INSERT INTO `base_area` VALUES ('640502', '640500', '沙坡头区', '0', '0', '640000-640500-640502-', '1');
INSERT INTO `base_area` VALUES ('640521', '640500', '中宁县', '0', '0', '640000-640500-640521-', '1');
INSERT INTO `base_area` VALUES ('640522', '640500', '海原县', '0', '0', '640000-640500-640522-', '1');
INSERT INTO `base_area` VALUES ('650000', '0', '新疆维吾尔自治区', '0', '0', '650000-', '1');
INSERT INTO `base_area` VALUES ('650100', '650000', '乌鲁木齐市', '830000', '0991', '650000-650100-', '1');
INSERT INTO `base_area` VALUES ('650101', '650100', '市辖区', '0', '0', '650000-650100-650101-', '1');
INSERT INTO `base_area` VALUES ('650102', '650100', '天山区', '0', '0', '650000-650100-650102-', '1');
INSERT INTO `base_area` VALUES ('650103', '650100', '沙依巴克区', '0', '0', '650000-650100-650103-', '1');
INSERT INTO `base_area` VALUES ('650104', '650100', '新市区', '0', '0', '650000-650100-650104-', '1');
INSERT INTO `base_area` VALUES ('650105', '650100', '水磨沟区', '0', '0', '650000-650100-650105-', '1');
INSERT INTO `base_area` VALUES ('650106', '650100', '头屯河区', '0', '0', '650000-650100-650106-', '1');
INSERT INTO `base_area` VALUES ('650107', '650100', '达坂城区', '0', '0', '650000-650100-650107-', '1');
INSERT INTO `base_area` VALUES ('650108', '650100', '东山区', '0', '0', '650000-650100-650108-', '1');
INSERT INTO `base_area` VALUES ('650121', '650100', '乌鲁木齐县', '0', '0', '650000-650100-650121-', '1');
INSERT INTO `base_area` VALUES ('650200', '650000', '克拉玛依市', '834000', '0990', '650000-650200-', '1');
INSERT INTO `base_area` VALUES ('650201', '650200', '市辖区', '0', '0', '650000-650200-650201-', '1');
INSERT INTO `base_area` VALUES ('650202', '650200', '独山子区', '0', '0', '650000-650200-650202-', '1');
INSERT INTO `base_area` VALUES ('650203', '650200', '克拉玛依区', '0', '0', '650000-650200-650203-', '1');
INSERT INTO `base_area` VALUES ('650204', '650200', '白碱滩区', '0', '0', '650000-650200-650204-', '1');
INSERT INTO `base_area` VALUES ('650205', '650200', '乌尔禾区', '0', '0', '650000-650200-650205-', '1');
INSERT INTO `base_area` VALUES ('652100', '650000', '吐鲁番地区', '838000', '0995', '650000-652100-', '1');
INSERT INTO `base_area` VALUES ('652101', '652100', '吐鲁番市', '0', '0', '650000-652100-652101-', '1');
INSERT INTO `base_area` VALUES ('652122', '652100', '鄯善县', '0', '0', '650000-652100-652122-', '1');
INSERT INTO `base_area` VALUES ('652123', '652100', '托克逊县', '0', '0', '650000-652100-652123-', '1');
INSERT INTO `base_area` VALUES ('652200', '650000', '哈密地区', '839000', '0902', '650000-652200-', '1');
INSERT INTO `base_area` VALUES ('652201', '652200', '哈密市', '0', '0', '650000-652200-652201-', '1');
INSERT INTO `base_area` VALUES ('652222', '652200', '巴里坤哈萨克自治县', '0', '0', '650000-652200-652222-', '1');
INSERT INTO `base_area` VALUES ('652223', '652200', '伊吾县', '0', '0', '650000-652200-652223-', '1');
INSERT INTO `base_area` VALUES ('652300', '650000', '昌吉治州', '831100', '0994', '650000-652300-', '1');
INSERT INTO `base_area` VALUES ('652301', '652300', '昌吉市', '0', '0', '650000-652300-652301-', '1');
INSERT INTO `base_area` VALUES ('652302', '652300', '阜康市', '0', '0', '650000-652300-652302-', '1');
INSERT INTO `base_area` VALUES ('652303', '652300', '米泉市', '0', '0', '650000-652300-652303-', '1');
INSERT INTO `base_area` VALUES ('652323', '652300', '呼图壁县', '0', '0', '650000-652300-652323-', '1');
INSERT INTO `base_area` VALUES ('652324', '652300', '玛纳斯县', '0', '0', '650000-652300-652324-', '1');
INSERT INTO `base_area` VALUES ('652325', '652300', '奇台县', '0', '0', '650000-652300-652325-', '1');
INSERT INTO `base_area` VALUES ('652327', '652300', '吉木萨尔县', '0', '0', '650000-652300-652327-', '1');
INSERT INTO `base_area` VALUES ('652328', '652300', '木垒哈萨克自治县', '0', '0', '650000-652300-652328-', '1');
INSERT INTO `base_area` VALUES ('652700', '650000', '博尔塔拉州', '833400', '0909', '650000-652700-', '1');
INSERT INTO `base_area` VALUES ('652701', '652700', '博乐市', '0', '0', '650000-652700-652701-', '1');
INSERT INTO `base_area` VALUES ('652722', '652700', '精河县', '0', '0', '650000-652700-652722-', '1');
INSERT INTO `base_area` VALUES ('652723', '652700', '温泉县', '0', '0', '650000-652700-652723-', '1');
INSERT INTO `base_area` VALUES ('652800', '650000', '巴音郭楞州', '841000', '0996', '650000-652800-', '1');
INSERT INTO `base_area` VALUES ('652801', '652800', '库尔勒市', '0', '0', '650000-652800-652801-', '1');
INSERT INTO `base_area` VALUES ('652822', '652800', '轮台县', '0', '0', '650000-652800-652822-', '1');
INSERT INTO `base_area` VALUES ('652823', '652800', '尉犁县', '0', '0', '650000-652800-652823-', '1');
INSERT INTO `base_area` VALUES ('652824', '652800', '若羌县', '0', '0', '650000-652800-652824-', '1');
INSERT INTO `base_area` VALUES ('652825', '652800', '且末县', '0', '0', '650000-652800-652825-', '1');
INSERT INTO `base_area` VALUES ('652826', '652800', '焉耆回族自治县', '0', '0', '650000-652800-652826-', '1');
INSERT INTO `base_area` VALUES ('652827', '652800', '和静县', '0', '0', '650000-652800-652827-', '1');
INSERT INTO `base_area` VALUES ('652828', '652800', '和硕县', '0', '0', '650000-652800-652828-', '1');
INSERT INTO `base_area` VALUES ('652829', '652800', '博湖县', '0', '0', '650000-652800-652829-', '1');
INSERT INTO `base_area` VALUES ('652900', '650000', '阿克苏地区', '843000', '0997', '650000-652900-', '1');
INSERT INTO `base_area` VALUES ('652901', '652900', '阿克苏市', '0', '0', '650000-652900-652901-', '1');
INSERT INTO `base_area` VALUES ('652922', '652900', '温宿县', '0', '0', '650000-652900-652922-', '1');
INSERT INTO `base_area` VALUES ('652923', '652900', '库车县', '0', '0', '650000-652900-652923-', '1');
INSERT INTO `base_area` VALUES ('652924', '652900', '沙雅县', '0', '0', '650000-652900-652924-', '1');
INSERT INTO `base_area` VALUES ('652925', '652900', '新和县', '0', '0', '650000-652900-652925-', '1');
INSERT INTO `base_area` VALUES ('652926', '652900', '拜城县', '0', '0', '650000-652900-652926-', '1');
INSERT INTO `base_area` VALUES ('652927', '652900', '乌什县', '0', '0', '650000-652900-652927-', '1');
INSERT INTO `base_area` VALUES ('652928', '652900', '阿瓦提县', '0', '0', '650000-652900-652928-', '1');
INSERT INTO `base_area` VALUES ('652929', '652900', '柯坪县', '0', '0', '650000-652900-652929-', '1');
INSERT INTO `base_area` VALUES ('653000', '650000', '克孜勒苏州', '831100', '0908', '650000-653000-', '1');
INSERT INTO `base_area` VALUES ('653001', '653000', '阿图什市', '0', '0', '650000-653000-653001-', '1');
INSERT INTO `base_area` VALUES ('653022', '653000', '阿克陶县', '0', '0', '650000-653000-653022-', '1');
INSERT INTO `base_area` VALUES ('653023', '653000', '阿合奇县', '0', '0', '650000-653000-653023-', '1');
INSERT INTO `base_area` VALUES ('653024', '653000', '乌恰县', '0', '0', '650000-653000-653024-', '1');
INSERT INTO `base_area` VALUES ('653100', '650000', '喀什地区', '844000', '0998', '650000-653100-', '1');
INSERT INTO `base_area` VALUES ('653101', '653100', '喀什市', '0', '0', '650000-653100-653101-', '1');
INSERT INTO `base_area` VALUES ('653121', '653100', '疏附县', '0', '0', '650000-653100-653121-', '1');
INSERT INTO `base_area` VALUES ('653122', '653100', '疏勒县', '0', '0', '650000-653100-653122-', '1');
INSERT INTO `base_area` VALUES ('653123', '653100', '英吉沙县', '0', '0', '650000-653100-653123-', '1');
INSERT INTO `base_area` VALUES ('653124', '653100', '泽普县', '0', '0', '650000-653100-653124-', '1');
INSERT INTO `base_area` VALUES ('653125', '653100', '莎车县', '0', '0', '650000-653100-653125-', '1');
INSERT INTO `base_area` VALUES ('653126', '653100', '叶城县', '0', '0', '650000-653100-653126-', '1');
INSERT INTO `base_area` VALUES ('653127', '653100', '麦盖提县', '0', '0', '650000-653100-653127-', '1');
INSERT INTO `base_area` VALUES ('653128', '653100', '岳普湖县', '0', '0', '650000-653100-653128-', '1');
INSERT INTO `base_area` VALUES ('653129', '653100', '伽师县', '0', '0', '650000-653100-653129-', '1');
INSERT INTO `base_area` VALUES ('653130', '653100', '巴楚县', '0', '0', '650000-653100-653130-', '1');
INSERT INTO `base_area` VALUES ('653131', '653100', '塔什库尔干塔吉克自治县', '0', '0', '650000-653100-653131-', '1');
INSERT INTO `base_area` VALUES ('653200', '650000', '和田地区', '848000', '0903', '650000-653200-', '1');
INSERT INTO `base_area` VALUES ('653201', '653200', '和田市', '0', '0', '650000-653200-653201-', '1');
INSERT INTO `base_area` VALUES ('653221', '653200', '和田县', '0', '0', '650000-653200-653221-', '1');
INSERT INTO `base_area` VALUES ('653222', '653200', '墨玉县', '0', '0', '650000-653200-653222-', '1');
INSERT INTO `base_area` VALUES ('653223', '653200', '皮山县', '0', '0', '650000-653200-653223-', '1');
INSERT INTO `base_area` VALUES ('653224', '653200', '洛浦县', '0', '0', '650000-653200-653224-', '1');
INSERT INTO `base_area` VALUES ('653225', '653200', '策勒县', '0', '0', '650000-653200-653225-', '1');
INSERT INTO `base_area` VALUES ('653226', '653200', '于田县', '0', '0', '650000-653200-653226-', '1');
INSERT INTO `base_area` VALUES ('653227', '653200', '民丰县', '0', '0', '650000-653200-653227-', '1');
INSERT INTO `base_area` VALUES ('654000', '650000', '伊犁州', '835000', '0999', '650000-654000-', '1');
INSERT INTO `base_area` VALUES ('654002', '654000', '伊宁市', '0', '0', '650000-654000-654002-', '1');
INSERT INTO `base_area` VALUES ('654003', '654000', '奎屯市', '0', '0', '650000-654000-654003-', '1');
INSERT INTO `base_area` VALUES ('654021', '654000', '伊宁县', '0', '0', '650000-654000-654021-', '1');
INSERT INTO `base_area` VALUES ('654022', '654000', '察布查尔锡伯自治县', '0', '0', '650000-654000-654022-', '1');
INSERT INTO `base_area` VALUES ('654023', '654000', '霍城县', '0', '0', '650000-654000-654023-', '1');
INSERT INTO `base_area` VALUES ('654024', '654000', '巩留县', '0', '0', '650000-654000-654024-', '1');
INSERT INTO `base_area` VALUES ('654025', '654000', '新源县', '0', '0', '650000-654000-654025-', '1');
INSERT INTO `base_area` VALUES ('654026', '654000', '昭苏县', '0', '0', '650000-654000-654026-', '1');
INSERT INTO `base_area` VALUES ('654027', '654000', '特克斯县', '0', '0', '650000-654000-654027-', '1');
INSERT INTO `base_area` VALUES ('654028', '654000', '尼勒克县', '0', '0', '650000-654000-654028-', '1');
INSERT INTO `base_area` VALUES ('654200', '650000', '塔城地区', '834700', '0901', '650000-654200-', '1');
INSERT INTO `base_area` VALUES ('654201', '654200', '塔城市', '0', '0', '650000-654200-654201-', '1');
INSERT INTO `base_area` VALUES ('654202', '654200', '乌苏市', '0', '0', '650000-654200-654202-', '1');
INSERT INTO `base_area` VALUES ('654221', '654200', '额敏县', '0', '0', '650000-654200-654221-', '1');
INSERT INTO `base_area` VALUES ('654223', '654200', '沙湾县', '0', '0', '650000-654200-654223-', '1');
INSERT INTO `base_area` VALUES ('654224', '654200', '托里县', '0', '0', '650000-654200-654224-', '1');
INSERT INTO `base_area` VALUES ('654225', '654200', '裕民县', '0', '0', '650000-654200-654225-', '1');
INSERT INTO `base_area` VALUES ('654226', '654200', '和布克赛尔蒙古自治县', '0', '0', '650000-654200-654226-', '1');
INSERT INTO `base_area` VALUES ('654300', '650000', '阿勒泰地区', '836500', '0906', '650000-654300-', '1');
INSERT INTO `base_area` VALUES ('654301', '654300', '阿勒泰市', '0', '0', '650000-654300-654301-', '1');
INSERT INTO `base_area` VALUES ('654321', '654300', '布尔津县', '0', '0', '650000-654300-654321-', '1');
INSERT INTO `base_area` VALUES ('654322', '654300', '富蕴县', '0', '0', '650000-654300-654322-', '1');
INSERT INTO `base_area` VALUES ('654323', '654300', '福海县', '0', '0', '650000-654300-654323-', '1');
INSERT INTO `base_area` VALUES ('654324', '654300', '哈巴河县', '0', '0', '650000-654300-654324-', '1');
INSERT INTO `base_area` VALUES ('654325', '654300', '青河县', '0', '0', '650000-654300-654325-', '1');
INSERT INTO `base_area` VALUES ('654326', '654300', '吉木乃县', '0', '0', '650000-654300-654326-', '1');
INSERT INTO `base_area` VALUES ('659000', '650000', '省直辖行政单位', '0', '0', '650000-659000-', '1');
INSERT INTO `base_area` VALUES ('659001', '659000', '石河子市', '832000', '0993', '650000-659000-659001-', '1');
INSERT INTO `base_area` VALUES ('659002', '659000', '阿拉尔市', '843300', '0997', '650000-659000-659002-', '1');
INSERT INTO `base_area` VALUES ('659003', '659000', '图木舒克市', '844000', '0998', '650000-659000-659003-', '1');
INSERT INTO `base_area` VALUES ('659004', '659000', '五家渠市', '831300', '0994', '650000-659000-659004-', '1');
INSERT INTO `base_area` VALUES ('710000', '0', '台湾省', '0', '0', '710000-', '1');
INSERT INTO `base_area` VALUES ('810000', '0', '香港特别行政区', '999077', '00852', '810000-', '1');
INSERT INTO `base_area` VALUES ('820000', '0', '澳门特别行政区', '999078', '00853', '820000-', '1');

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
  `smid` int(11) NOT NULL DEFAULT '0' COMMENT '招聘分类ID，关联site_menu表smid字段',
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
  KEY `sid` (`sid`),
  KEY `smid` (`smid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='招聘信息表';

-- ----------------------------
-- Records of job_info
-- ----------------------------
INSERT INTO `job_info` VALUES ('1', '1', '0', 'php招聘', '3', '310000', '310100', '310101', '3', '7', '4', '&lt;p&gt;sdfsf点时间啊发渐叟&lt;br /&gt;&lt;/p&gt;', '0', '1', '2013-04-01 00:00:00', '2016-04-01 00:00:00', '2013-04-22 16:24:04', '2013-04-22 21:32:41');

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='设置菜单表';

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
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COMMENT='设置节点表';

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
